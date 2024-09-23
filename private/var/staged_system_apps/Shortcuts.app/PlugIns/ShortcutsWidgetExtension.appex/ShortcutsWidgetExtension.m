uint64_t sub_1000020DC@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v29 = sub_1000024DC(&qword_10002CA80);
  sub_10000264C();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000266C();
  v28 = sub_1000024DC(&qword_10002CA88);
  v26 = *(_QWORD *)(v28 - 8);
  v2 = v26;
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v25 - v6;
  v8 = sub_1000024DC(&qword_10002CA90);
  v27 = *(_QWORD *)(v8 - 8);
  v9 = v27;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v25 - v13;
  v15 = sub_100002548();
  _ControlWidgetAdaptor.init(_:)(v15, &type metadata for ShortcutsControl, v15);
  v16 = sub_100002584();
  v25 = v7;
  _ControlWidgetAdaptor.init(_:)(v16, &unk_1000295C8, v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v17(v12, v14, v8);
  v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v19 = v7;
  v20 = v28;
  v18(v5, v19, v28);
  *(_QWORD *)v1 = 0xD000000000000011;
  *((_QWORD *)v1 + 1) = 0x80000001000200D0;
  v21 = v29;
  v17(&v1[*(int *)(v29 + 48)], v12, v8);
  v18(&v1[*(int *)(v21 + 64)], v5, v20);
  swift_bridgeObjectRetain(0x80000001000200D0);
  TupleWidget.init(_:)(v1, v21);
  v22 = *(void (**)(char *, uint64_t))(v26 + 8);
  v22(v25, v20);
  v23 = *(void (**)(char *, uint64_t))(v27 + 8);
  v23(v14, v8);
  v22(v5, v20);
  v23(v12, v8);
  return swift_bridgeObjectRelease(0x80000001000200D0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100002344();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100002344()
{
  unint64_t result;

  result = qword_10002CA68;
  if (!qword_10002CA68)
  {
    result = swift_getWitnessTable("Qo", &type metadata for ShortcutsWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10002CA68);
  }
  return result;
}

uint64_t variable initialization expression of OpenAppIntent._app()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = type metadata accessor for InputConnectionBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000265C();
  v5 = v4 - v3;
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  __chkstk_darwin(v6);
  sub_10000265C();
  v9 = v8 - v7;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v10);
  sub_10000266C();
  v11 = type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v12);
  sub_10000265C();
  v15 = v14 - v13;
  sub_1000024DC(&qword_10002CA78);
  LocalizedStringResource.init(stringLiteral:)(7368769, 0xE300000000000000);
  sub_10000251C(v0, 1, 1, v11);
  v16 = type metadata accessor for IntentDialog(0);
  sub_10000251C(v9, 1, 1, v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v5, enum case for InputConnectionBehavior.default(_:), v1);
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v15, v0, v9, v5);
}

uint64_t sub_1000024DC(uint64_t *a1)
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

uint64_t sub_10000251C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

ValueMetadata *type metadata accessor for ShortcutsWidgetBundle()
{
  return &type metadata for ShortcutsWidgetBundle;
}

uint64_t sub_100002538(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002441C, 1);
}

unint64_t sub_100002548()
{
  unint64_t result;

  result = qword_10002CA98;
  if (!qword_10002CA98)
  {
    result = swift_getWitnessTable(&unk_10002341C, &type metadata for ShortcutsControl);
    atomic_store(result, (unint64_t *)&qword_10002CA98);
  }
  return result;
}

unint64_t sub_100002584()
{
  unint64_t result;

  result = qword_10002CAA0;
  if (!qword_10002CAA0)
  {
    result = swift_getWitnessTable(&unk_100022804, &unk_1000295C8);
    atomic_store(result, (unint64_t *)&qword_10002CAA0);
  }
  return result;
}

unint64_t sub_1000025C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CAA8;
  if (!qword_10002CAA8)
  {
    v1 = sub_100002608(&qword_10002CAB0);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CAA8);
  }
  return result;
}

uint64_t sub_100002608(uint64_t *a1)
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

uint64_t *sub_100002684(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_1000024DC(&qword_10002CAB8);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v11);
  }
  else
  {
    v6 = v4;
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v12 = *a2;
      *a1 = *a2;
      swift_retain(v12);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_10000274C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a1, v2) != 1)
    return swift_release(*a1);
  v3 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t *sub_1000027B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = a1;
    v7 = v4;
    v8 = 1;
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    swift_retain(v9);
    v6 = a1;
    v7 = v4;
    v8 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v7, v8);
  return a1;
}

uint64_t *sub_10000284C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_1000030F0((uint64_t)a1, &qword_10002CAB8);
    v4 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = a1;
      v7 = v4;
      v8 = 1;
    }
    else
    {
      v9 = *a2;
      *a1 = *a2;
      swift_retain(v9);
      v6 = a1;
      v7 = v4;
      v8 = 0;
    }
    swift_storeEnumTagMultiPayload(v6, v7, v8);
  }
  return a1;
}

void *sub_100002900(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload(a1, v4, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_100002998(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_1000030F0((uint64_t)a1, &qword_10002CAB8);
    v4 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload(a1, v4, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100002A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100002A54);
}

uint64_t sub_100002A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002CAC0);
  return sub_100002A8C(a1, a2, v4);
}

uint64_t sub_100002A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100002A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100002AA4);
}

uint64_t sub_100002AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002CAC0);
  return sub_10000251C(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ComplicationPaddingModifier(uint64_t a1)
{
  uint64_t result;

  result = qword_10002CB20;
  if (!qword_10002CB20)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ComplicationPaddingModifier);
  return result;
}

void sub_100002B18(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100002B80(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_100002B80(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10002CB30)
  {
    v2 = type metadata accessor for WidgetFamily(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10002CB30);
  }
}

uint64_t sub_100002BD4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002446C, 1);
}

uint64_t sub_100002BE4(uint64_t a1)
{
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
  int v30;
  char v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;

  v58 = sub_1000024DC(&qword_10002CB60);
  sub_10000264C();
  __chkstk_darwin(v5);
  sub_10000265C();
  v55 = v7 - v6;
  v57 = sub_1000024DC(&qword_10002CB68);
  sub_10000264C();
  __chkstk_darwin(v8);
  sub_10000265C();
  v11 = v10 - v9;
  v54 = sub_1000024DC(&qword_10002CB70);
  sub_10000264C();
  __chkstk_darwin(v12);
  sub_10000265C();
  v15 = v14 - v13;
  sub_1000024DC(&qword_10002CB78);
  sub_10000264C();
  __chkstk_darwin(v16);
  sub_10000265C();
  v19 = v18 - v17;
  v20 = sub_1000024DC(&qword_10002CB80);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  sub_10000265C();
  v24 = v23 - v22;
  v25 = type metadata accessor for WidgetFamily(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  sub_10000265C();
  v29 = v28 - v27;
  sub_10001954C();
  v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 88))(v29, v25);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v30 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    v31 = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)(6.0);
    sub_1000031D4();
    v32(v55, a1, v20);
    v33 = v55 + *(int *)(v58 + 36);
    *(_BYTE *)v33 = v31;
    *(_QWORD *)(v33 + 8) = v1;
    *(_QWORD *)(v33 + 16) = v2;
    *(_QWORD *)(v33 + 24) = v3;
    *(_QWORD *)(v33 + 32) = v4;
    *(_BYTE *)(v33 + 40) = 0;
    sub_1000030AC(v55, v15, &qword_10002CB60);
    swift_storeEnumTagMultiPayload(v15, v54, 1);
    v34 = sub_100002FFC();
    v35 = sub_100003040();
    _ConditionalContent<>.init(storage:)(v15, v20, v58, v34, v35);
    sub_1000031C4();
    sub_1000031FC();
    sub_100002FE0();
    v36 = sub_1000031EC();
    _ConditionalContent<>.init(storage:)(v36, v37, v58, v38, v35);
    sub_10000320C();
    return sub_1000030F0(v55, &qword_10002CB60);
  }
  else if (v30 == enum case for WidgetFamily.accessoryRectangular(_:)
         || v30 == enum case for WidgetFamily.accessoryInline(_:))
  {
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
    v41(v24, a1, v20);
    v41(v15, v24, v20);
    swift_storeEnumTagMultiPayload(v15, v54, 0);
    v42 = sub_100002FFC();
    v43 = sub_100003040();
    _ConditionalContent<>.init(storage:)(v15, v20, v58, v42, v43);
    sub_1000030AC(v19, v11, &qword_10002CB78);
    sub_1000031FC();
    sub_100002FE0();
    v44 = sub_1000031EC();
    _ConditionalContent<>.init(storage:)(v44, v45, v58, v46, v43);
    sub_1000030F0(v19, &qword_10002CB78);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v24, v20);
  }
  else
  {
    v47 = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)(10.0);
    sub_1000031D4();
    v48(v55, a1, v20);
    v49 = v55 + *(int *)(v58 + 36);
    *(_BYTE *)v49 = v47;
    *(_QWORD *)(v49 + 8) = v1;
    *(_QWORD *)(v49 + 16) = v2;
    *(_QWORD *)(v49 + 24) = v3;
    *(_QWORD *)(v49 + 32) = v4;
    *(_BYTE *)(v49 + 40) = 0;
    sub_1000031C4();
    swift_storeEnumTagMultiPayload(v11, v57, 1);
    v50 = sub_100002FE0();
    sub_100003040();
    v51 = sub_1000031EC();
    _ConditionalContent<>.init(storage:)(v51, v52, v58, v50, v53);
    sub_10000320C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v29, v25);
  }
}

uint64_t sub_100002FC4()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100002FE0()
{
  return sub_100003158(&qword_10002CB88, &qword_10002CB78, (void (*)(void))sub_100002FFC);
}

unint64_t sub_100002FFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CB90;
  if (!qword_10002CB90)
  {
    v1 = sub_100002608(&qword_10002CB80);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ViewModifier_Content<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CB90);
  }
  return result;
}

unint64_t sub_100003040()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CB98;
  if (!qword_10002CB98)
  {
    v1 = sub_100002608(&qword_10002CB60);
    sub_100002FFC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CB98);
  }
  return result;
}

uint64_t sub_1000030AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000024DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000030F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000024DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000312C()
{
  return sub_100003158(&qword_10002CBA0, &qword_10002CBA8, (void (*)(void))sub_100002FE0);
}

uint64_t sub_100003158(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100002608(a2);
    a3();
    sub_100003040();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000031C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1000030AC(v2, v1, v0);
}

uint64_t sub_1000031EC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000031FC()
{
  uint64_t v0;
  uint64_t v1;

  return swift_storeEnumTagMultiPayload(v0, *(_QWORD *)(v1 - 136), 0);
}

uint64_t sub_10000320C()
{
  uint64_t *v0;
  uint64_t v1;

  return sub_1000030F0(v1, v0);
}

void sub_100003218()
{
  strcpy((char *)&qword_100030E80, "OpenAppControl");
  algn_100030E88[7] = -18;
}

uint64_t sub_100003248@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
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
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v69 = a1;
  type metadata accessor for String.LocalizationValue(0);
  sub_10000264C();
  __chkstk_darwin(v2);
  sub_100004FA8();
  v68 = v3;
  __chkstk_darwin(v4);
  v54 = (char *)&v50 - v5;
  v58 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v6 = *(_QWORD *)(v58 - 8);
  __chkstk_darwin(v58);
  sub_100004E70();
  v8 = v7;
  type metadata accessor for Locale(0);
  sub_10000264C();
  __chkstk_darwin(v9);
  sub_100004E70();
  v67 = type metadata accessor for LocalizedStringResource(0);
  v55 = *(_QWORD *)(v67 - 8);
  sub_100004EB4();
  __chkstk_darwin(v10);
  sub_100004FA8();
  v66 = v11;
  __chkstk_darwin(v12);
  v53 = (char *)&v50 - v13;
  v56 = sub_1000024DC(&qword_10002CC08);
  v52 = *(_QWORD *)(v56 - 8);
  sub_100004EB4();
  __chkstk_darwin(v14);
  sub_100004ED4();
  v63 = sub_1000024DC(&qword_10002CC10);
  v59 = *(_QWORD *)(v63 - 8);
  sub_100004EB4();
  __chkstk_darwin(v15);
  sub_100004E70();
  v17 = v16;
  v64 = sub_1000024DC(&qword_10002CC18);
  v61 = *(_QWORD *)(v64 - 8);
  sub_100004EB4();
  __chkstk_darwin(v18);
  sub_100004E70();
  v57 = v19;
  v65 = sub_1000024DC(&qword_10002CC20);
  v62 = *(_QWORD *)(v65 - 8);
  sub_100004EB4();
  __chkstk_darwin(v20);
  sub_100004E70();
  v60 = v21;
  if (qword_10002C9D0 != -1)
    swift_once(&qword_10002C9D0, sub_100003218);
  v23 = qword_100030E80;
  v22 = *(_QWORD *)algn_100030E88;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100030E88);
  v24 = sub_1000024DC(&qword_10002CC28);
  v25 = sub_100004C3C();
  v26 = sub_100004CFC(&qword_10002CC38, &qword_10002CC28, (uint64_t)&protocol conformance descriptor for ControlWidgetButton<A, B, C>);
  AppIntentControlConfiguration.init(kind:intent:content:)(v23, v22, &type metadata for OpenAppIntent, sub_1000036D4, 0, &type metadata for OpenAppIntent, v24, v25, v26);
  v27 = (uint64_t)v54;
  v28 = sub_100004F34();
  static Locale.current.getter(v28);
  v29 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  v30 = v58;
  v51(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v58);
  v31 = v53;
  sub_100004E84(v27);
  v32 = sub_100004CFC(&qword_10002CC40, &qword_10002CC08, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  v33 = v17;
  v34 = v56;
  ControlWidgetConfiguration.displayName(_:)(v31, v56, v32);
  v35 = *(void (**)(char *, uint64_t))(v55 + 8);
  v36 = v31;
  v37 = v67;
  v35(v36, v67);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v1, v34);
  v38 = v68;
  v39 = String.LocalizationValue.init(stringLiteral:)(0x206E61206E65704FLL, 0xEC0000002E707061);
  static Locale.current.getter(v39);
  v51(v8, v29, v30);
  v40 = v66;
  sub_100004E84(v38);
  v70 = v34;
  v71 = v32;
  v41 = sub_100004F1C((uint64_t)&v70, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>);
  v42 = v57;
  v43 = v63;
  ControlWidgetConfiguration.description(_:)(v40, v63, v41);
  v35(v40, v37);
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v33, v43);
  v70 = v43;
  v71 = v41;
  v44 = sub_100004F1C((uint64_t)&v70, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>);
  v45 = v60;
  v46 = v64;
  ControlWidgetConfiguration.promptsForUserConfiguration()(v64, v44);
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v42, v46);
  v70 = v46;
  v71 = v44;
  v47 = sub_100004F1C((uint64_t)&v70, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.promptsForUserConfiguration()>>);
  v48 = v65;
  ControlWidgetConfiguration.showsInSystemSpaces()(v65, v47);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v45, v48);
}

uint64_t sub_1000036D4(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;

  v5 = *a1;
  swift_retain_n(v5, 2);
  v1 = sub_1000024DC(&qword_10002CC48);
  v2 = sub_100004C80();
  v3 = sub_1000049A0();
  return ControlWidgetButton.init<>(action:label:)(&v5, sub_100004C78, v5, v1, &type metadata for OpenAppIntent, v2, v3);
}

uint64_t sub_10000375C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSString v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a1;
  v39 = sub_1000024DC(&qword_10002CC68);
  __chkstk_darwin(v39);
  v2 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000024DC(&qword_10002CC60);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v38 - v8;
  v10 = type metadata accessor for IntentApplication(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000024DC(&qword_10002CBC0);
  __chkstk_darwin(v14);
  v16 = (uint64_t *)((char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  IntentParameter.wrappedValue.getter(v16);
  if (sub_100002A8C((uint64_t)v16, 1, v10))
  {
    sub_100004550((uint64_t)v16);
    v22 = String._bridgeToObjectiveC()();
    v23 = String._bridgeToObjectiveC()();
    v24 = sub_10001EC78(v22);

    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    v41 = v25;
    v42 = v27;
    v28 = sub_100004D3C();
    Label<>.init<A>(_:systemImage:)(&v41, 0x642E657261757173, 0xED00006465687361, &type metadata for String, v28);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v7, v3);
    swift_storeEnumTagMultiPayload(v2, v39, 1);
    v29 = sub_100004CFC(&qword_10002CC58, &qword_10002CC60, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    _ConditionalContent<>.init(storage:)(v2, v3, v3, v29, v29);
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v11 + 16))(v13, v16, v10);
    v17 = sub_100004550((uint64_t)v16);
    v18 = IntentApplication.bundleIdentifier.getter(v17);
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v21 = objc_allocWithZone((Class)LSApplicationRecord);
    v31 = sub_1000047C0(v18, v20, 1);
    v32 = objc_msgSend(v31, "localizedName");

    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    v35 = v34;

    v41 = v33;
    v42 = v35;
    v36 = sub_100004D3C();
    Label<>.init<A>(_:systemImage:)(&v41, 0x642E657261757173, 0xED00006465687361, &type metadata for String, v36);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v9, v3);
    swift_storeEnumTagMultiPayload(v2, v39, 0);
    v37 = sub_100004CFC(&qword_10002CC58, &qword_10002CC60, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    _ConditionalContent<>.init(storage:)(v2, v3, v3, v37, v37);
    v7 = v9;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_100003B34()
{
  NSString v0;
  NSString v1;
  id v2;
  uint64_t v3;

  v0 = String._bridgeToObjectiveC()();
  v1 = String._bridgeToObjectiveC()();
  v2 = sub_10001EC78(v0);

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  return v3;
}

void sub_100003BD4()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100003BF8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100003C38()
{
  return 1;
}

Swift::Int sub_100003C48(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

char *OpenAppIntent.isDiscoverable.unsafeMutableAddressor()
{
  return &static OpenAppIntent.isDiscoverable;
}

uint64_t static OpenAppIntent.isDiscoverable.getter()
{
  _BYTE v1[24];

  sub_100004FA0((uint64_t)&static OpenAppIntent.isDiscoverable, (uint64_t)v1, 0);
  return static OpenAppIntent.isDiscoverable;
}

uint64_t static OpenAppIntent.isDiscoverable.setter(char a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = sub_100004FA0((uint64_t)&static OpenAppIntent.isDiscoverable, (uint64_t)v3, 1);
  static OpenAppIntent.isDiscoverable = a1;
  return result;
}

uint64_t (*static OpenAppIntent.isDiscoverable.modify(uint64_t a1))(_QWORD)
{
  sub_100004FA0((uint64_t)&static OpenAppIntent.isDiscoverable, a1, 33);
  return j__swift_endAccess;
}

uint64_t static OpenAppIntent.title.getter()
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

  type metadata accessor for String.LocalizationValue(0);
  sub_10000264C();
  __chkstk_darwin(v2);
  sub_100004ED4();
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = sub_100004F4C();
  type metadata accessor for Locale(v5);
  sub_10000264C();
  __chkstk_darwin(v6);
  sub_10000265C();
  v9 = v8 - v7;
  v10 = sub_100004F34();
  static Locale.current.getter(v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v0, 0x6E65746E49707041, 0xEA00000000007374, v9, v1, 0, 0, 256);
}

void OpenAppIntent.init()()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_100004ED4();
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  __chkstk_darwin(v4);
  sub_10000265C();
  v7 = v6 - v5;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v8);
  v9 = sub_100004F4C();
  v10 = type metadata accessor for LocalizedStringResource(v9);
  sub_10000264C();
  __chkstk_darwin(v11);
  sub_10000265C();
  v14 = v13 - v12;
  sub_1000024DC(&qword_10002CA78);
  LocalizedStringResource.init(stringLiteral:)(7368769, 0xE300000000000000);
  sub_10000251C(v1, 1, 1, v10);
  v15 = type metadata accessor for IntentDialog(0);
  sub_100004FC4(v7, v16, v17, v15);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v0, enum case for InputConnectionBehavior.default(_:), v2);
  IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v14, v1, v7, v0);
  sub_100004F68();
}

uint64_t OpenAppIntent.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[41] = a1;
  v2[42] = a2;
  v3 = sub_1000024DC(&qword_10002CBB8);
  v2[43] = sub_100004EEC(*(_QWORD *)(v3 - 8));
  v4 = type metadata accessor for IntentApplication(0);
  v2[44] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[45] = v5;
  v2[46] = sub_100004EEC(v5);
  v6 = sub_1000024DC(&qword_10002CBC0);
  v2[47] = sub_100004EEC(*(_QWORD *)(v6 - 8));
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_100004018()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
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
  id v18;
  void *v19;
  void *v20;

  v1 = *(_QWORD **)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 352);
  IntentParameter.wrappedValue.getter(v1);
  if (sub_100002A8C((uint64_t)v1, 1, v2))
  {
    sub_100004550(*(_QWORD *)(v0 + 376));
    v3 = sub_100004590();
    swift_allocError(&unk_1000295A8, v3, 0, 0);
    swift_willThrow();
    sub_100004F7C();
    sub_100004F2C();
    sub_100004F24();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 368);
    v5 = *(_QWORD *)(v0 + 376);
    v7 = *(_QWORD *)(v0 + 352);
    v8 = *(_QWORD *)(v0 + 360);
    v9 = *(_QWORD *)(v0 + 344);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v10 = sub_100004550(v5);
    v11 = IntentApplication.bundleIdentifier.getter(v10);
    v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    v14 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v15 = type metadata accessor for URL(0);
    sub_100004FC4(v9, v16, v17, v15);
    v18 = objc_allocWithZone((Class)WFAppLaunchRequest);
    sub_100004898(v11, v13, v14, v9, 0, 0);
    v20 = v19;
    *(_QWORD *)(v0 + 384) = v19;
    objc_msgSend(v19, "setRequiresUserFacingApp:", 1);
    *(_QWORD *)(v0 + 120) = v0 + 418;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_100004224;
    *(_QWORD *)(v0 + 320) = swift_continuation_init(v0 + 80, 1);
    *(_QWORD *)(v0 + 288) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 296) = 0x40000000;
    *(_QWORD *)(v0 + 304) = sub_1000045CC;
    *(_QWORD *)(v0 + 312) = &unk_1000294B8;
    objc_msgSend(v20, "performWithCompletionHandler:", v0 + 288);
    return swift_continuation_await(v0 + 80);
  }
}

uint64_t sub_100004224()
{
  uint64_t v0;

  sub_100004F88();
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v0 + 112);
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_100004268()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  if ((*(_BYTE *)(v0 + 418) & 1) != 0 || !VCIsDeviceLocked())
  {
    sub_100004EC0();

    sub_100004FBC();
    sub_100004F2C();
    sub_100004F24();
    return sub_100004E60(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    *(_QWORD *)(v0 + 400) = objc_msgSend(objc_allocWithZone((Class)WFCompactUnlockService), "init");
    *(_QWORD *)(v0 + 56) = v0 + 416;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_100004340;
    v2 = swift_continuation_init(v0 + 16, 0);
    *(_QWORD *)(v0 + 248) = _NSConcreteStackBlock;
    v3 = (_QWORD *)(v0 + 248);
    v3[1] = 0x40000000;
    v3[2] = sub_100004668;
    v3[3] = &unk_1000294D0;
    v3[4] = v2;
    sub_100004FE4(v2, "requestUnlockIfNeeded:");
    return sub_100004EFC();
  }
}

uint64_t sub_100004340()
{
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_100004380()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  if (*(_BYTE *)(v0 + 416) == 1)
  {
    *(_QWORD *)(v0 + 184) = v0 + 417;
    *(_QWORD *)(v0 + 144) = v0;
    *(_QWORD *)(v0 + 152) = sub_100004440;
    v2 = swift_continuation_init(v0 + 144, 1);
    *(_QWORD *)(v0 + 208) = _NSConcreteStackBlock;
    v3 = (_QWORD *)(v0 + 208);
    v3[1] = 0x40000000;
    v3[2] = sub_1000045CC;
    v3[3] = &unk_1000294E8;
    v3[4] = v2;
    sub_100004FE4(v2, "performWithCompletionHandler:");
    return sub_100004EFC();
  }
  else
  {

    sub_100004EC0();
    sub_100004FBC();
    sub_100004F2C();
    sub_100004F24();
    return sub_100004E60(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_100004440()
{
  uint64_t v0;

  sub_100004F88();
  *(_QWORD *)(v0 + 408) = *(_QWORD *)(v0 + 176);
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_100004484()
{
  uint64_t v0;
  void *v1;

  sub_100004EC0();
  sub_100004FBC();
  sub_100004F2C();
  sub_100004F24();
  return sub_100004E60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000044C8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 384);
  swift_willThrow();

  sub_100004F7C();
  sub_100004F2C();
  sub_100004F24();
  return sub_100004F0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100004508()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 400);
  v2 = *(void **)(v0 + 384);
  swift_willThrow();

  sub_100004F7C();
  sub_100004F2C();
  sub_100004F24();
  return sub_100004F0C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100004550(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000024DC(&qword_10002CBC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100004590()
{
  unint64_t result;

  result = qword_10002CBC8;
  if (!qword_10002CBC8)
  {
    result = swift_getWitnessTable(&unk_1000227B4, &unk_1000295A8);
    atomic_store(result, (unint64_t *)&qword_10002CBC8);
  }
  return result;
}

uint64_t sub_1000045CC(uint64_t a1, char a2, void *a3)
{
  if (a3)
    return sub_100004608(*(_QWORD *)(a1 + 32), (uint64_t)a3);
  else
    return sub_100004658(*(_QWORD *)(a1 + 32), a2);
}

uint64_t sub_100004608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = sub_1000024DC(&qword_10002CC00);
  v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0, 0);
  *v6 = a2;
  return swift_continuation_throwingResumeWithError(a1, v5);
}

uint64_t sub_100004658(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_100004668(uint64_t a1, char a2)
{
  return sub_100004670(*(_QWORD *)(a1 + 32), a2);
}

uint64_t sub_100004670(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_10000468C()
{
  _BYTE v1[24];

  swift_beginAccess(&static OpenAppIntent.isDiscoverable, v1, 0, 0);
  return static OpenAppIntent.isDiscoverable;
}

uint64_t sub_1000046D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_10002CBB4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000472C;
  return OpenAppIntent.perform()(a1, v4);
}

uint64_t sub_10000472C()
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

void sub_100004774(_QWORD *a1@<X8>)
{
  uint64_t v2;

  OpenAppIntent.init()();
  *a1 = v2;
}

uint64_t sub_100004798(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000049A0();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

id sub_1000047C0(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

void sub_100004898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  void *v6;
  void *v7;
  NSString v13;
  NSDictionary v14;
  uint64_t v15;
  NSURL *v16;
  void *v17;
  void *v18;

  v7 = v6;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (a3)
  {
    v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v14.super.isa = 0;
  }
  v15 = type metadata accessor for URL(0);
  v17 = 0;
  if (sub_100002A8C(a4, 1, v15) != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a4, v15);
  }
  objc_msgSend(v7, "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v13, v14.super.isa, v17, a5, a6 & 1);

  sub_100004F68();
}

unint64_t sub_1000049A0()
{
  unint64_t result;

  result = qword_10002CBD0;
  if (!qword_10002CBD0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenAppIntent, &type metadata for OpenAppIntent);
    atomic_store(result, (unint64_t *)&qword_10002CBD0);
  }
  return result;
}

unint64_t sub_1000049E0()
{
  unint64_t result;

  result = qword_10002CBD8;
  if (!qword_10002CBD8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenAppIntent, &type metadata for OpenAppIntent);
    atomic_store(result, (unint64_t *)&qword_10002CBD8);
  }
  return result;
}

unint64_t sub_100004A20()
{
  unint64_t result;

  result = qword_10002CBE0;
  if (!qword_10002CBE0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenAppIntent, &type metadata for OpenAppIntent);
    atomic_store(result, (unint64_t *)&qword_10002CBE0);
  }
  return result;
}

uint64_t sub_100004A5C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of OpenAppIntent.perform()>>, 1);
}

uint64_t sub_100004A6C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000049A0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

void type metadata accessor for OpenAppIntent()
{
  sub_100004FDC();
}

uint64_t sub_100004AB8()
{
  return sub_100004CFC((unint64_t *)&qword_10002DC50, &qword_10002CBF0, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100004AEC(unsigned int *a1, int a2)
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

uint64_t sub_100004B3C(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100004B7C + 4 * byte_1000225C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100004B9C + 4 * byte_1000225C5[v4]))();
}

_BYTE *sub_100004B7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100004B9C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004BA4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004BAC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004BB4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004BBC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_100004BC8()
{
  return 0;
}

void type metadata accessor for OpenAppIntent.OpenAppIntentError()
{
  sub_100004FDC();
}

unint64_t sub_100004BE4()
{
  unint64_t result;

  result = qword_10002CBF8;
  if (!qword_10002CBF8)
  {
    result = swift_getWitnessTable(&unk_10002278C, &unk_1000295A8);
    atomic_store(result, (unint64_t *)&qword_10002CBF8);
  }
  return result;
}

void type metadata accessor for OpenAppControl()
{
  sub_100004FDC();
}

uint64_t sub_100004C2C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024510, 1);
}

unint64_t sub_100004C3C()
{
  unint64_t result;

  result = qword_10002CC30;
  if (!qword_10002CC30)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenAppIntent, &type metadata for OpenAppIntent);
    atomic_store(result, (unint64_t *)&qword_10002CC30);
  }
  return result;
}

uint64_t sub_100004C78@<X0>(uint64_t a1@<X8>)
{
  return sub_10000375C(a1);
}

unint64_t sub_100004C80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CC50;
  if (!qword_10002CC50)
  {
    v1 = sub_100002608(&qword_10002CC48);
    sub_100004CFC(&qword_10002CC58, &qword_10002CC60, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CC50);
  }
  return result;
}

uint64_t sub_100004CFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100002608(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100004D3C()
{
  unint64_t result;

  result = qword_10002CC70;
  if (!qword_10002CC70)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002CC70);
  }
  return result;
}

uint64_t sub_100004D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_100002608(&qword_10002CC20);
  v1 = sub_100002608(&qword_10002CC18);
  v2 = sub_100002608(&qword_10002CC10);
  v7 = sub_100002608(&qword_10002CC08);
  v8 = sub_100004CFC(&qword_10002CC40, &qword_10002CC08, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  v3 = sub_100004F1C((uint64_t)&v7, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>);
  v7 = v2;
  v8 = v3;
  v4 = sub_100004F1C((uint64_t)&v7, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>);
  v7 = v1;
  v8 = v4;
  v5 = sub_100004F1C((uint64_t)&v7, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.promptsForUserConfiguration()>>);
  v7 = v0;
  v8 = v5;
  return sub_100004F1C((uint64_t)&v7, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>);
}

uint64_t sub_100004E54()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100004E60(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100004E84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(a1, 0x6E65746E49707041, 0xEA00000000007374, v1, v2, 0, 0, 256);
}

uint64_t sub_100004EC0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100004EEC@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100004EFC()
{
  return ((uint64_t (*)(void))swift_continuation_await)();
}

uint64_t sub_100004F0C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100004F1C(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1);
}

uint64_t sub_100004F24()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_100004F2C()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_100004F34()
{
  return String.LocalizationValue.init(stringLiteral:)(0x707041206E65704FLL, 0xE800000000000000);
}

uint64_t sub_100004F4C()
{
  return 0;
}

uint64_t sub_100004F7C()
{
  uint64_t v0;

  return swift_task_dealloc(*(_QWORD *)(v0 + 376));
}

void sub_100004F88()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 - 8);
  *v2 = *v0;
  *v2 = *v0;
}

uint64_t sub_100004FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0);
}

uint64_t sub_100004FBC()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_100004FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000251C(a1, 1, 1, a4);
}

id sub_100004FE4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_100004FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v0 = type metadata accessor for RunningShortcutTracker();
  v1 = swift_allocObject(v0, 120, 15);
  swift_defaultActor_initialize();
  v2 = sub_10000635C();
  result = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, &type metadata for String, v2, &protocol witness table for String);
  *(_QWORD *)(v1 + 112) = result;
  qword_100030E98 = v1;
  return result;
}

uint64_t sub_100005050()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_10000265C();
  v6 = v5 - v4;
  v7 = sub_10000635C();
  sub_10000264C();
  __chkstk_darwin(v8);
  sub_10000265C();
  v11 = v10 - v9;
  sub_1000062E4(v1, v10 - v9);
  if (swift_getEnumCaseMultiPayload(v11, v7) == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v11, v2);
    v12 = sub_1000024DC(&qword_10002CDE0);
    v13 = *(unsigned __int8 *)(v3 + 80);
    v14 = (v13 + 32) & ~v13;
    v15 = swift_allocObject(v12, v14 + 4 * *(_QWORD *)(v3 + 72), v13 | 7);
    *(_OWORD *)(v15 + 16) = xmmword_100022860;
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v15 + v14, v6, v2);
    v17 = Date.addingTimeInterval(_:)(v16, 0.5);
    v18 = Date.addingTimeInterval(_:)(v17, 1.2);
    Date.addingTimeInterval(_:)(v18, 2.1);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v19 = sub_1000024DC(&qword_10002CD20);

    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
    v20(v6, v11, v2);
    v21 = sub_1000024DC(&qword_10002CDE0);
    v22 = *(unsigned __int8 *)(v3 + 80);
    v23 = (v22 + 32) & ~v22;
    v15 = swift_allocObject(v21, v23 + *(_QWORD *)(v3 + 72), v22 | 7);
    *(_OWORD *)(v15 + 16) = xmmword_100022850;
    v20(v15 + v23, v6, v2);
  }
  return v15;
}

void sub_100005224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[24];

  sub_1000024DC(&qword_10002CDD0);
  sub_10000264C();
  __chkstk_darwin(v1);
  sub_10000266C();
  v2 = sub_1000024DC(&qword_10002CD20);
  v3 = *(int *)(v2 + 48);
  v4 = *(int *)(v2 + 64);
  v5 = sub_100006374();
  Date.init()(v5);
  *(_QWORD *)(v0 + v3) = 0;
  *(_QWORD *)(v0 + v4) = 0;
  v6 = sub_10000635C();
  swift_storeEnumTagMultiPayload(v0, v6, 0);
  sub_100006328();
  sub_10000637C();
  swift_endAccess(v8);
  type metadata accessor for WidgetCenter(0);
  v7 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  swift_release(v7);
  sub_100006364();
}

uint64_t sub_1000052E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_1000024DC(&qword_10002CDD0);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RunningShortcutTracker.State(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100002A8C(a1, 1, v12) == 1)
  {
    sub_100005D38(a1);
    sub_100005EBC(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease(a3);
    return sub_100005D38((uint64_t)v8);
  }
  else
  {
    sub_100005FFC(a1, (uint64_t)v11);
    sub_100006040((uint64_t)v11, a2, a3);
    return swift_bridgeObjectRelease(a3);
  }
}

uint64_t sub_1000053EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  uint64_t KeyPath;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  _QWORD v40[3];

  sub_1000024DC(&qword_10002CDD0);
  sub_10000264C();
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v37 - v11;
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10000265C();
  v17 = v16 - v15;
  v18 = v3 + 112;
  swift_beginAccess(v3 + 112, v40, 32, 0);
  v19 = *(_QWORD *)(v3 + 112);
  if (!*(_QWORD *)(v19 + 16))
  {
    v27 = sub_10000635C();
    sub_10000251C((uint64_t)v12, 1, 1, v27);
LABEL_7:
    sub_100005D38((uint64_t)v12);
    return sub_10000638C();
  }
  v39 = a1;
  sub_100006374();
  v38 = a2;
  v20 = sub_100005D78(a2, a3);
  if ((v21 & 1) != 0)
  {
    v22 = v20;
    v23 = *(_QWORD *)(v19 + 56);
    v24 = sub_10000635C();
    sub_1000062E4(v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v22, (uint64_t)v12);
    v25 = (uint64_t)v12;
    v26 = 0;
  }
  else
  {
    v24 = sub_10000635C();
    v25 = (uint64_t)v12;
    v26 = 1;
  }
  sub_100006394(v25, v26);
  swift_bridgeObjectRelease(a3);
  sub_10000635C();
  if (sub_100002A8C((uint64_t)v12, 1, v24) == 1)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload(v12, v24) == 1)
  {
    sub_100005AA4((uint64_t)v12);
    return sub_10000638C();
  }
  v29 = sub_1000024DC(&qword_10002CD20);
  v30 = *(void **)&v12[*(int *)(v29 + 48)];
  v37 = *(id *)&v12[*(int *)(v29 + 64)];
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v17, v12, v13);
  sub_10000638C();

  v40[0] = v39;
  KeyPath = swift_getKeyPath(&unk_100022908);
  v32 = (void *)_KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)(KeyPath, 5, sub_1000056CC, 0, &protocol witness table for NSObject);
  swift_release(KeyPath);
  v33 = *(int *)(v29 + 48);
  v34 = *(int *)(v29 + 64);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, v17, v13);
  *(_QWORD *)&v10[v33] = v39;
  *(_QWORD *)&v10[v34] = v32;
  swift_storeEnumTagMultiPayload(v10, v24, 0);
  sub_100006394((uint64_t)v10, 0);
  swift_beginAccess(v18, v40, 33, 0);
  sub_100006374();
  v35 = v39;
  v36 = v32;
  sub_1000052E0((uint64_t)v10, v38, a3);
  sub_10000638C();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
}

uint64_t sub_1000056CC()
{
  uint64_t v0;

  type metadata accessor for WidgetCenter(0);
  v0 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  return swift_release(v0);
}

void sub_100005700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];

  sub_1000024DC(&qword_10002CDD0);
  sub_10000264C();
  __chkstk_darwin(v1);
  sub_10000266C();
  v2 = sub_100006374();
  Date.init()(v2);
  v3 = sub_10000635C();
  swift_storeEnumTagMultiPayload(v0, v3, 1);
  sub_100006328();
  sub_10000637C();
  swift_endAccess(v5);
  type metadata accessor for WidgetCenter(0);
  v4 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();
  swift_release(v4);
  sub_100006364();
}

uint64_t sub_1000057A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for RunningShortcutTracker()
{
  return objc_opt_self(_TtC24ShortcutsWidgetExtension22RunningShortcutTracker);
}

uint64_t *sub_1000057E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    v8 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    if (EnumCaseMultiPayload == 1)
    {
      v9 = a1;
      v10 = a3;
      v11 = 1;
    }
    else
    {
      v13 = sub_1000024DC(&qword_10002CD20);
      v14 = *(int *)(v13 + 48);
      v15 = *(void **)((char *)a2 + v14);
      *(uint64_t *)((char *)a1 + v14) = (uint64_t)v15;
      v16 = *(int *)(v13 + 64);
      v17 = *(void **)((char *)a2 + v16);
      *(uint64_t *)((char *)a1 + v16) = (uint64_t)v17;
      v18 = v15;
      v19 = v17;
      v9 = a1;
      v10 = a3;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
  }
  return a1;
}

void sub_1000058C4(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a1, a2);
  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  if (EnumCaseMultiPayload != 1)
  {
    v5 = sub_1000024DC(&qword_10002CD20);

  }
}

uint64_t sub_10000593C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = 1;
  }
  else
  {
    v9 = sub_1000024DC(&qword_10002CD20);
    v10 = *(int *)(v9 + 48);
    v11 = *(void **)(a2 + v10);
    *(_QWORD *)(a1 + v10) = v11;
    v12 = *(int *)(v9 + 64);
    v13 = *(void **)(a2 + v12);
    *(_QWORD *)(a1 + v12) = v13;
    v14 = v11;
    v15 = v13;
    v8 = 0;
  }
  swift_storeEnumTagMultiPayload(a1, a3, v8);
  return a1;
}

uint64_t sub_1000059E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  if (a1 != a2)
  {
    sub_100005AA4(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = 1;
    }
    else
    {
      v9 = sub_1000024DC(&qword_10002CD20);
      v10 = *(int *)(v9 + 48);
      v11 = *(void **)(a2 + v10);
      *(_QWORD *)(a1 + v10) = v11;
      v12 = *(int *)(v9 + 64);
      v13 = *(void **)(a2 + v12);
      *(_QWORD *)(a1 + v12) = v13;
      v14 = v11;
      v15 = v13;
      v8 = 0;
    }
    swift_storeEnumTagMultiPayload(a1, a3, v8);
  }
  return a1;
}

uint64_t sub_100005AA4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RunningShortcutTracker.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RunningShortcutTracker.State(uint64_t a1)
{
  uint64_t result;

  result = qword_10002CD98;
  if (!qword_10002CD98)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RunningShortcutTracker.State);
  return result;
}

uint64_t sub_100005B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = 1;
  }
  else
  {
    v9 = sub_1000024DC(&qword_10002CD20);
    v8 = 0;
    *(_QWORD *)(a1 + *(int *)(v9 + 48)) = *(_QWORD *)(a2 + *(int *)(v9 + 48));
    *(_QWORD *)(a1 + *(int *)(v9 + 64)) = *(_QWORD *)(a2 + *(int *)(v9 + 64));
  }
  swift_storeEnumTagMultiPayload(a1, a3, v8);
  return a1;
}

uint64_t sub_100005BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_100005AA4(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = 1;
    }
    else
    {
      v9 = sub_1000024DC(&qword_10002CD20);
      v8 = 0;
      *(_QWORD *)(a1 + *(int *)(v9 + 48)) = *(_QWORD *)(a2 + *(int *)(v9 + 48));
      *(_QWORD *)(a1 + *(int *)(v9 + 64)) = *(_QWORD *)(a2 + *(int *)(v9 + 64));
    }
    swift_storeEnumTagMultiPayload(a1, a3, v8);
  }
  return a1;
}

uint64_t sub_100005C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100005C8C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  _BYTE v5[32];
  _QWORD v6[2];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout3(v5, v4, "\b", "\b");
    v6[0] = v5;
    v6[1] = v4;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v6);
    return 0;
  }
  return result;
}

uint64_t sub_100005D14()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100005D20()
{
  return sub_100005D14();
}

uint64_t sub_100005D38(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000024DC(&qword_10002CDD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100005D78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100005DDC(a1, a2, v5);
}

unint64_t sub_100005DDC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100005EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_100005D78(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v19 = *v4;
    v12 = *v4;
    *v4 = 0x8000000000000000;
    v13 = *(_QWORD *)(v12 + 24);
    sub_1000024DC(&qword_10002CDD8);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v19 + 48) + 16 * v9 + 8));
    v14 = *(_QWORD *)(v19 + 56);
    v15 = type metadata accessor for RunningShortcutTracker.State(0);
    sub_100005FFC(v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * v9, a3);
    _NativeDictionary._delete(at:)(v9, v19, &type metadata for String, v15, &protocol witness table for String);
    v16 = *v4;
    *v4 = v19;
    swift_bridgeObjectRelease(v16);
    return sub_10000251C(a3, 0, 1, v15);
  }
  else
  {
    v18 = type metadata accessor for RunningShortcutTracker.State(0);
    return sub_10000251C(a3, 1, 1, v18);
  }
}

uint64_t sub_100005FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunningShortcutTracker.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_1000060BC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1000060BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_100005D78(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_1000024DC(&qword_10002CDD8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_100005D78(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = v20[7];
    v22 = v21 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RunningShortcutTracker.State(0) - 8) + 72) * v16;
    return sub_100006264(a1, v22);
  }
  else
  {
    sub_1000061DC(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain(a3);
  }
}

uint64_t sub_1000061DC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for RunningShortcutTracker.State(0);
  result = sub_100005FFC(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_100006264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunningShortcutTracker.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

const char *sub_1000062A8()
{
  return "fractionCompleted";
}

id sub_1000062B4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, "fractionCompleted");
  *a2 = v4;
  return result;
}

uint64_t sub_1000062E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunningShortcutTracker.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_10000251C(v1, 0, 1, v2);
  return swift_beginAccess(v0 + 112, v3 - 72, 33, 0);
}

uint64_t sub_10000635C()
{
  return type metadata accessor for RunningShortcutTracker.State(0);
}

uint64_t sub_100006374()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000637C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1000052E0(v2, v1, v0);
}

uint64_t sub_10000638C()
{
  uint64_t v0;

  return swift_endAccess(v0 - 104);
}

uint64_t sub_100006394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000251C(a1, a2, 1, v2);
}

unint64_t sub_1000063A0()
{
  return 0xD000000000000011;
}

_QWORD *initializeBufferWithCopyOfBuffer for RunShortcutWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for RunShortcutWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for RunShortcutWidget(_QWORD *a1, _QWORD *a2)
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

__n128 initializeWithTake for RunShortcutWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for RunShortcutWidget(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for RunShortcutWidget(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RunShortcutWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RunShortcutWidget()
{
  return &type metadata for RunShortcutWidget;
}

uint64_t sub_1000064F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024624, 1);
}

void sub_100006508(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (int *)sub_100009BCC();
  v3 = a1 + v2[6];
  v4 = sub_10000635C();
  v7 = sub_100004FC4(v3, v5, v6, v4);
  Date.init()(v7);
  *(_QWORD *)(a1 + v2[5]) = 0;
  *(_BYTE *)(a1 + v2[7]) = 0;
  sub_100009BDC();
}

uint64_t sub_10000655C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_100006578, 0, 0);
}

uint64_t sub_100006578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = sub_10000D6A4();
  v3 = (int *)sub_100009BCC();
  v4 = v1 + v3[6];
  v5 = sub_10000635C();
  v8 = sub_100004FC4(v4, v6, v7, v5);
  v9 = TimelineProviderContext.isPreview.getter(v8);
  Date.init()(v9);
  *(_QWORD *)(v1 + v3[5]) = v2;
  *(_BYTE *)(v1 + v3[7]) = (v9 & 1) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  v5 = sub_100009BCC();
  v4[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[8] = v6;
  v4[9] = sub_100004EEC(v6);
  v7 = type metadata accessor for TimelineReloadPolicy(0);
  v4[10] = sub_100004EEC(*(_QWORD *)(v7 - 8));
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_1000024DC(&qword_10002CDD0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[11] = swift_task_alloc(v8);
  v4[12] = swift_task_alloc(v8);
  return swift_task_switch(sub_1000066A4, 0, 0);
}

uint64_t sub_1000066A4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
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
  _QWORD *v30;
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v1 = sub_10000D6A4();
  if (v1)
  {
    v2 = (void *)v1;
    v4 = *(_QWORD *)(v0 + 88);
    v3 = *(_QWORD *)(v0 + 96);
    v5 = sub_10000635C();
    sub_10000251C(v3, 1, 1, v5);
    sub_100009A70(v3, v4, &qword_10002CDD0);
    v6 = sub_100002A8C(v4, 1, v5);
    v7 = *(_QWORD *)(v0 + 88);
    if (v6 == 1)
    {
      sub_100009AB0(*(_QWORD *)(v0 + 88), &qword_10002CDD0);
      sub_1000024DC(&qword_10002CDE0);
      v8 = sub_100009BE8();
      v9 = swift_allocObject(v7, ((*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80) | 7);
      *(_OWORD *)(v9 + 16) = xmmword_100022850;
      Date.init()(v9);
    }
    else
    {
      v9 = sub_100005050();
      sub_100009A48(v7, type metadata accessor for RunningShortcutTracker.State);
    }
    v26 = *(_QWORD *)(v0 + 96);
    v27 = *(_QWORD *)(v0 + 80);
    v28 = *(_QWORD *)(v0 + 48);
    v29 = *(_QWORD *)(v0 + 56);
    v30 = (_QWORD *)swift_task_alloc(48);
    v30[2] = v2;
    v30[3] = v26;
    v30[4] = v28;
    v31 = sub_100006A0C((void (*)(uint64_t))sub_100009AD8, (uint64_t)v30, v9);
    swift_bridgeObjectRelease(v9);
    v32 = swift_task_dealloc(v30);
    static TimelineReloadPolicy.never.getter(v32);
    sub_100009554(&qword_10002CF58, type metadata accessor for RunShortcutWidgetEntry);
    Timeline.init(entries:policy:)(v31, v27, v29, v33);

    sub_100009AB0(v26, &qword_10002CDD0);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 80);
    v12 = *(int **)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 64);
    v14 = v11 + v12[6];
    v15 = type metadata accessor for RunningShortcutTracker.State(0);
    v18 = sub_100004FC4(v14, v16, v17, v15);
    Date.init()(v18);
    *(_QWORD *)(v11 + v12[5]) = 0;
    *(_BYTE *)(v11 + v12[7]) = 1;
    v19 = sub_1000024DC(&qword_10002D020);
    v20 = *(_QWORD *)(v13 + 72);
    v21 = *(unsigned __int8 *)(v13 + 80);
    v22 = (v21 + 32) & ~v21;
    v23 = swift_allocObject(v19, v22 + v20, v21 | 7);
    *(_OWORD *)(v23 + 16) = xmmword_100022850;
    v24 = sub_100007E30(v11, v23 + v22);
    static TimelineReloadPolicy.never.getter(v24);
    sub_100009554(&qword_10002CF58, type metadata accessor for RunShortcutWidgetEntry);
    Timeline.init(entries:policy:)(v23, v10, v12, v25);
    sub_100009A48(v11, type metadata accessor for RunShortcutWidgetEntry);
  }
  v34 = *(_QWORD *)(v0 + 88);
  v36 = *(_QWORD *)(v0 + 72);
  v35 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 96));
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100006964@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char v11;

  v8 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a4, a1, v8);
  v9 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  sub_100009A70(a3, a4 + v9[6], &qword_10002CDD0);
  v11 = TimelineProviderContext.isPreview.getter(v10);
  *(_QWORD *)(a4 + v9[5]) = a2;
  *(_BYTE *)(a4 + v9[7]) = (v11 & 1) == 0;
  return a2;
}

unint64_t *sub_100006A0C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  unint64_t *v21;

  v4 = v3;
  v19 = a1;
  v20 = a2;
  v6 = type metadata accessor for RunShortcutWidgetEntry(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 + 16);
  v11 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v10)
  {
    v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000106C4(0, v10, 0);
    v11 = v21;
    v12 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
    v13 = a3 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v18 = *(_QWORD *)(v12 + 72);
    while (1)
    {
      v19(v13);
      if (v4)
        break;
      v4 = 0;
      v21 = v11;
      v15 = v11[2];
      v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_1000106C4(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      v11[2] = v15 + 1;
      sub_100009AF8((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v15);
      v13 += v18;
      if (!--v10)
        return v11;
    }
    swift_release(v11);
  }
  return v11;
}

uint64_t sub_100006B80(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *a2;
  v7 = a2[1];
  v8 = (_QWORD *)swift_task_alloc(dword_10002D02C);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_100009BA0;
  return sub_10000655C(a1, v6, v7, a3);
}

uint64_t sub_100006BEC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *a2;
  v7 = a2[1];
  v8 = (_QWORD *)swift_task_alloc(dword_10002D01C);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_100009BA0;
  return sub_100006608(a1, v6, v7, a3);
}

uint64_t sub_100006C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000472C;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100006CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100009BA0;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

void sub_100006D38(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(v1 + *(int *)(sub_100009BCC() + 20));
  if (v3)
  {
    v4 = objc_msgSend(v3, "name");
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v7);
    String.hash(into:)(a1, v5, v7);
    swift_bridgeObjectRelease_n(v7, 2);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  sub_100009BDC();
}

uint64_t sub_100006DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v4 = sub_100009BCC();
  v5 = *(int *)(v4 + 20);
  v6 = *(void **)(a1 + v5);
  if (v6)
  {
    v7 = objc_msgSend(v6, "name");
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

    v11 = *(void **)(a2 + *(int *)(v4 + 20));
    if (!v11)
    {
      if (!v10)
        goto LABEL_17;
LABEL_14:
      v17 = 0;
      v15 = v10;
LABEL_19:
      swift_bridgeObjectRelease(v15);
      return v17 & 1;
    }
  }
  else
  {
    v11 = *(void **)(a2 + v5);
    if (!v11)
      goto LABEL_17;
    v10 = 0;
    v8 = 0;
  }
  v12 = objc_msgSend(v11, "name");
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  if (v10)
  {
    if (v15)
    {
      if (v8 == v13 && v10 == v15)
      {
        sub_100009C40();
        v17 = 1;
      }
      else
      {
        v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, v13, v15, 0);
        sub_100009C40();
      }
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (v15)
  {
    v17 = 0;
    goto LABEL_19;
  }
LABEL_17:
  v17 = 1;
  return v17 & 1;
}

Swift::Int sub_100006EE8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  sub_100006D38((uint64_t)v1);
  return Hasher._finalize()();
}

uint64_t sub_100006F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

Swift::Int sub_100006F68(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_100006D38((uint64_t)v2);
  return Hasher._finalize()();
}

void sub_100006FA4()
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
  char v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  sub_1000024DC(&qword_10002CF88);
  sub_100004EB4();
  __chkstk_darwin(v2);
  sub_10000265C();
  v5 = v4 - v3;
  v6 = sub_1000024DC(&qword_10002CF90);
  sub_100004EB4();
  __chkstk_darwin(v7);
  sub_10000265C();
  v10 = v9 - v8;
  v11 = sub_1000024DC(&qword_10002CF98);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100009C08();
  sub_100007150(v0, v5);
  v13 = *(_BYTE *)(v0 + *(int *)(sub_100009BCC() + 28));
  KeyPath = swift_getKeyPath(&unk_100022BA8);
  v15 = swift_allocObject(&unk_100029808, 17, 7);
  *(_BYTE *)(v15 + 16) = (v13 & 1) == 0;
  sub_100009A70(v5, v10, &qword_10002CF88);
  v16 = (uint64_t *)(v10 + *(int *)(v6 + 36));
  *v16 = KeyPath;
  v16[1] = (uint64_t)sub_100009780;
  v16[2] = v15;
  sub_100009AB0(v5, &qword_10002CF88);
  v17 = sub_100009798();
  View.privacySensitive(_:)(0, v6, v17);
  sub_100009AB0(v10, &qword_10002CF90);
  v19[0] = v6;
  v19[1] = v17;
  v18 = sub_100004F1C((uint64_t)v19, (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>);
  View.unredacted()(v11, v18);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v11);
  sub_100009BA8();
}

uint64_t sub_100007150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t OpaqueTypeConformance2;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  char *v51;
  NSString v52;
  NSString v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;

  v80 = a2;
  v3 = sub_1000024DC(&qword_10002CBB8);
  __chkstk_darwin(v3);
  v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = type metadata accessor for RunShortcutComplicationView(0);
  __chkstk_darwin(v74);
  v7 = (uint64_t *)((char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v77 = sub_1000024DC(&qword_10002CFC0);
  v71 = *(_QWORD *)(v77 - 8);
  __chkstk_darwin(v77);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1000024DC(&qword_10002CFE8);
  v10 = *(_QWORD *)(v79 - 8);
  v11 = __chkstk_darwin(v79);
  v70 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v72 = (char *)&v67 - v13;
  v73 = sub_1000024DC(&qword_10002CFF0);
  __chkstk_darwin(v73);
  v78 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for EmptyShortcutComplicationView(0);
  __chkstk_darwin(v75);
  v16 = (uint64_t *)((char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = sub_1000024DC(&qword_10002CFF8);
  v17 = *(_QWORD *)(v76 - 8);
  v18 = __chkstk_darwin(v76);
  v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v67 - v21;
  v23 = *(void **)(a1 + *(int *)(type metadata accessor for RunShortcutWidgetEntry(0) + 20));
  if (v23)
  {
    KeyPath = swift_getKeyPath(&unk_100022BD8);
    v69 = v10;
    v25 = v74;
    v26 = (_QWORD *)((char *)v7 + *(int *)(v74 + 20));
    *v26 = KeyPath;
    v27 = sub_1000024DC(&qword_10002CAB8);
    swift_storeEnumTagMultiPayload(v26, v27, 0);
    *v7 = v23;
    v68 = v23;
    v28 = objc_msgSend(v68, "name");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

    v81 = v29;
    v82 = v31;
    sub_100009554(&qword_10002CFC8, type metadata accessor for RunShortcutComplicationView);
    v33 = v32;
    v34 = sub_100004D3C();
    View.widgetLabel<A>(_:)(&v81, v25, &type metadata for String, v33, v34);
    swift_bridgeObjectRelease(v31);
    sub_100009A48((uint64_t)v7, type metadata accessor for RunShortcutComplicationView);
    sub_100007808();
    v81 = v25;
    v82 = &type metadata for String;
    v83 = v33;
    v84 = v34;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    v36 = v70;
    v37 = v77;
    View.widgetURL(_:)(v5, v77, OpaqueTypeConformance2);
    sub_100009AB0((uint64_t)v5, &qword_10002CBB8);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v9, v37);
    v38 = v69;
    v39 = v72;
    v40 = v79;
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v72, v36, v79);
    v41 = v38;
    v42 = v78;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v78, v39, v40);
    swift_storeEnumTagMultiPayload(v42, v73, 0);
    v81 = v37;
    v82 = (void *)OpaqueTypeConformance2;
    v43 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    sub_100009554(&qword_10002CFD0, type metadata accessor for EmptyShortcutComplicationView);
    v81 = v75;
    v82 = &type metadata for String;
    v83 = v44;
    v84 = v34;
    v45 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v42, v40, v76, v43, v45);

    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v39, v40);
  }
  else
  {
    *v16 = swift_getKeyPath(&unk_100022BD8);
    v47 = sub_1000024DC(&qword_10002CAB8);
    swift_storeEnumTagMultiPayload(v16, v47, 0);
    v48 = v75;
    v49 = (_QWORD *)((char *)v16 + *(int *)(v75 + 20));
    *v49 = swift_getKeyPath(&unk_100022C08);
    v50 = sub_1000024DC(&qword_10002D000);
    swift_storeEnumTagMultiPayload(v49, v50, 0);
    v51 = (char *)v16 + *(int *)(v48 + 24);
    *(_QWORD *)v51 = swift_getKeyPath(&unk_100022C38);
    v51[8] = 0;
    v52 = String._bridgeToObjectiveC()();
    v53 = String._bridgeToObjectiveC()();
    v54 = sub_10001EC78(v52);

    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v57 = v56;

    v81 = v55;
    v82 = v57;
    sub_100009554(&qword_10002CFD0, type metadata accessor for EmptyShortcutComplicationView);
    v59 = v58;
    v60 = sub_100004D3C();
    View.widgetLabel<A>(_:)(&v81, v48, &type metadata for String, v59, v60);
    swift_bridgeObjectRelease(v57);
    sub_100009A48((uint64_t)v16, type metadata accessor for EmptyShortcutComplicationView);
    v61 = v76;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v20, v76);
    v62 = v78;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v78, v22, v61);
    swift_storeEnumTagMultiPayload(v62, v73, 1);
    sub_100009554(&qword_10002CFC8, type metadata accessor for RunShortcutComplicationView);
    v81 = v74;
    v82 = &type metadata for String;
    v83 = v63;
    v84 = v60;
    v64 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    v81 = v77;
    v82 = (void *)v64;
    v65 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v81 = v48;
    v82 = &type metadata for String;
    v83 = v59;
    v84 = v60;
    v66 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v62, v79, v61, v65, v66);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v61);
  }
}

void sub_100007808()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for URLComponents(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_100004ED4();
  URLComponents.init()();
  URLComponents.scheme.setter(0x74756374726F6873, 0xE900000000000073);
  URLComponents.path.setter(0x726F68732D6E7572, 0xEC00000074756374);
  v3 = sub_1000024DC(&qword_10002D008);
  v4 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v5 = swift_allocObject(v3, ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ 3 * *(_QWORD *)(v4 + 72), *(unsigned __int8 *)(v4 + 80) | 7);
  *(_OWORD *)(v5 + 16) = xmmword_100022930;
  v6 = objc_msgSend(v0, "identifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

  sub_100009C48(25705, 0xE200000000000000);
  sub_100009C20();
  v7 = objc_msgSend(v0, "name");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  sub_100009C48(1701667182, 0xE400000000000000);
  sub_100009C20();
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(WFWorkflowRunSourceWidget);
  v10 = v9;
  URLQueryItem.init(name:value:)(0x656372756F73, 0xE600000000000000, v8, v9);
  swift_bridgeObjectRelease(v10);
  v11 = URLComponents.queryItems.setter(v5);
  URLComponents.url.getter(v11);
  (*(void (**)(void *, uint64_t))(v2 + 8))(v0, v1);
  sub_100009BA8();
}

uint64_t sub_1000079EC()
{
  return static View._viewListCount(inputs:)();
}

void sub_100007A08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  NSString v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSString v23;
  NSString v24;
  id v25;
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
  void *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD v45[2];

  v6 = sub_1000024DC(&qword_10002CDE8);
  v37 = *(_QWORD *)(v6 - 8);
  sub_100004EB4();
  __chkstk_darwin(v7);
  sub_100004ED4();
  v8 = sub_1000024DC(&qword_10002CDF0);
  v38 = *(_QWORD *)(v8 - 8);
  sub_100004EB4();
  __chkstk_darwin(v9);
  sub_100009C08();
  v39 = sub_1000024DC(&qword_10002CDF8);
  v40 = *(_QWORD *)(v39 - 8);
  sub_100004EB4();
  __chkstk_darwin(v10);
  sub_10000265C();
  v13 = v12 - v11;
  type metadata accessor for RunShortcutWidgetEntryView(0);
  sub_100009554(&qword_10002CE00, type metadata accessor for RunShortcutWidgetEntryView);
  sub_100007DF4();
  swift_bridgeObjectRetain(a2);
  AppIntentConfiguration.init<A>(kind:intent:provider:content:)(a1, a2);
  v14 = String._bridgeToObjectiveC()();
  v15 = sub_100009C54();
  v16 = sub_10001EC78(v14);

  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v19 = v18;

  v41 = v17;
  v42 = v19;
  sub_1000099B8(&qword_10002CE10, &qword_10002CDE8);
  v21 = v20;
  v22 = sub_100004D3C();
  WidgetConfiguration.configurationDisplayName<A>(_:)(&v41, v6, &type metadata for String, v21, v22);
  swift_bridgeObjectRelease(v19);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v2, v6);
  v23 = sub_100009C54();
  v24 = String._bridgeToObjectiveC()();
  v25 = sub_10001EC78(v23);

  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
  v28 = v27;

  v45[0] = v26;
  v45[1] = v28;
  v41 = v6;
  v42 = &type metadata for String;
  v43 = v21;
  v44 = v22;
  v29 = sub_100004F1C((uint64_t)&v41, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>);
  WidgetConfiguration.description<A>(_:)(v45, v8, &type metadata for String, v29, v22);
  sub_100009C20();
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v3, v8);
  v30 = sub_1000024DC(&qword_10002CE18);
  v31 = type metadata accessor for WidgetFamily(0);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned __int8 *)(v32 + 80);
  v34 = (v33 + 32) & ~v33;
  v35 = swift_allocObject(v30, v34 + *(_QWORD *)(v32 + 72), v33 | 7);
  *(_OWORD *)(v35 + 16) = xmmword_100022850;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v32 + 104))(v35 + v34, enum case for WidgetFamily.accessoryCircular(_:), v31);
  v41 = v8;
  v42 = &type metadata for String;
  v43 = v29;
  v44 = v22;
  v36 = sub_100004F1C((uint64_t)&v41, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>);
  WidgetConfiguration.supportedFamilies(_:)(v35, v39, v36);
  sub_100009C40();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v13, v39);
  sub_100009BA8();
}

uint64_t sub_100007DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007E30(a1, a2);
}

unint64_t sub_100007DAC@<X0>(_QWORD *a1@<X8>)
{
  unint64_t result;
  uint64_t v3;

  result = sub_1000063A0();
  *a1 = 0xD000000000000011;
  a1[1] = v3;
  return result;
}

void sub_100007DD8()
{
  uint64_t *v0;

  sub_100007A08(*v0, v0[1]);
}

uint64_t type metadata accessor for RunShortcutWidgetEntryView(uint64_t a1)
{
  return sub_100007E88(a1, qword_10002CF18, (uint64_t)&nominal type descriptor for RunShortcutWidgetEntryView);
}

unint64_t sub_100007DF4()
{
  unint64_t result;

  result = qword_10002CE08;
  if (!qword_10002CE08)
  {
    result = swift_getWitnessTable(&unk_100022AD4, &type metadata for RunShortcutWidgetProvider);
    atomic_store(result, (unint64_t *)&qword_10002CE08);
  }
  return result;
}

uint64_t sub_100007E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RunShortcutWidgetEntry(uint64_t a1)
{
  return sub_100007E88(a1, (uint64_t *)&unk_10002CE78, (uint64_t)&nominal type descriptor for RunShortcutWidgetEntry);
}

uint64_t sub_100007E88(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

char *sub_100007EB8(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v17);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = *(void **)&a2[v9];
    *(_QWORD *)&a1[v9] = v11;
    v12 = &a1[v10];
    v13 = &a2[v10];
    v14 = type metadata accessor for RunningShortcutTracker.State(0);
    v15 = v11;
    if (sub_100002A8C((uint64_t)v13, 1, v14))
    {
      v16 = sub_1000024DC(&qword_10002CDD0);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v13, v14);
      v8(v12, v13, v7);
      if (EnumCaseMultiPayload == 1)
      {
        v19 = 1;
      }
      else
      {
        v20 = sub_1000024DC(&qword_10002CD20);
        v21 = *(int *)(v20 + 48);
        v22 = *(void **)&v13[v21];
        *(_QWORD *)&v12[v21] = v22;
        v23 = *(int *)(v20 + 64);
        v24 = *(void **)&v13[v23];
        *(_QWORD *)&v12[v23] = v24;
        v25 = v22;
        v26 = v24;
        v19 = 0;
      }
      swift_storeEnumTagMultiPayload(v12, v14, v19);
      sub_10000251C((uint64_t)v12, 0, 1, v14);
    }
    a1[a3[7]] = a2[a3[7]];
  }
  return a1;
}

void sub_100008038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;

  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);

  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for RunningShortcutTracker.State(0);
  if (!sub_100002A8C(v6, 1, v7))
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v6, v7);
    v5(v6, v4);
    if (EnumCaseMultiPayload != 1)
    {
      v9 = sub_1000024DC(&qword_10002CD20);

    }
  }
}

uint64_t sub_10000810C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;

  v6 = type metadata accessor for Date(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v10;
  v11 = (char *)(a1 + v9);
  v12 = (char *)(a2 + v9);
  v13 = type metadata accessor for RunningShortcutTracker.State(0);
  v14 = v10;
  if (sub_100002A8C((uint64_t)v12, 1, v13))
  {
    v15 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v12, v13);
    v7((uint64_t)v11, (uint64_t)v12, v6);
    if (EnumCaseMultiPayload == 1)
    {
      v17 = 1;
    }
    else
    {
      v18 = sub_1000024DC(&qword_10002CD20);
      v19 = *(int *)(v18 + 48);
      v20 = *(void **)&v12[v19];
      *(_QWORD *)&v11[v19] = v20;
      v21 = *(int *)(v18 + 64);
      v22 = *(void **)&v12[v21];
      *(_QWORD *)&v11[v21] = v22;
      v23 = v20;
      v24 = v22;
      v17 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v13, v17);
    sub_10000251C((uint64_t)v11, 0, 1, v13);
  }
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100008260(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = a3[5];
  v9 = *(void **)(a1 + v8);
  v10 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v10;
  v11 = v10;

  v12 = a3[6];
  v13 = (char *)(a1 + v12);
  v14 = (char *)(a2 + v12);
  v15 = type metadata accessor for RunningShortcutTracker.State(0);
  v16 = sub_100002A8C((uint64_t)v13, 1, v15);
  v17 = sub_100002A8C((uint64_t)v14, 1, v15);
  if (v16)
  {
    if (!v17)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v14, v15);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
      if (EnumCaseMultiPayload == 1)
      {
        v19 = 1;
      }
      else
      {
        v25 = sub_1000024DC(&qword_10002CD20);
        v26 = *(int *)(v25 + 48);
        v27 = *(void **)&v14[v26];
        *(_QWORD *)&v13[v26] = v27;
        v28 = *(int *)(v25 + 64);
        v29 = *(void **)&v14[v28];
        *(_QWORD *)&v13[v28] = v29;
        v30 = v27;
        v31 = v29;
        v19 = 0;
      }
      swift_storeEnumTagMultiPayload(v13, v15, v19);
      sub_10000251C((uint64_t)v13, 0, 1, v15);
      goto LABEL_15;
    }
LABEL_7:
    v20 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_15;
  }
  if (v17)
  {
    sub_100009A48((uint64_t)v13, type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100009A48((uint64_t)v13, type metadata accessor for RunningShortcutTracker.State);
    v21 = swift_getEnumCaseMultiPayload(v14, v15);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
    if (v21 == 1)
    {
      v22 = v13;
      v23 = v15;
      v24 = 1;
    }
    else
    {
      v32 = sub_1000024DC(&qword_10002CD20);
      v33 = *(int *)(v32 + 48);
      v34 = *(void **)&v14[v33];
      *(_QWORD *)&v13[v33] = v34;
      v35 = *(int *)(v32 + 64);
      v36 = *(void **)&v14[v35];
      *(_QWORD *)&v13[v35] = v36;
      v37 = v34;
      v38 = v36;
      v22 = v13;
      v23 = v15;
      v24 = 0;
    }
    swift_storeEnumTagMultiPayload(v22, v23, v24);
  }
LABEL_15:
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100008484(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for Date(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for RunningShortcutTracker.State(0);
  if (sub_100002A8C((uint64_t)v10, 1, v11))
  {
    v12 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v10, v11);
    v7((uint64_t)v9, (uint64_t)v10, v6);
    if (EnumCaseMultiPayload == 1)
    {
      v14 = 1;
    }
    else
    {
      v15 = sub_1000024DC(&qword_10002CD20);
      v14 = 0;
      *(_QWORD *)&v9[*(int *)(v15 + 48)] = *(_QWORD *)&v10[*(int *)(v15 + 48)];
      *(_QWORD *)&v9[*(int *)(v15 + 64)] = *(_QWORD *)&v10[*(int *)(v15 + 64)];
    }
    swift_storeEnumTagMultiPayload(v9, v11, v14);
    sub_10000251C((uint64_t)v9, 0, 1, v11);
  }
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000085CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  int v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = a3[5];
  v9 = *(void **)(a1 + v8);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);

  v10 = a3[6];
  v11 = (char *)(a1 + v10);
  v12 = (char *)(a2 + v10);
  v13 = type metadata accessor for RunningShortcutTracker.State(0);
  v14 = sub_100002A8C((uint64_t)v11, 1, v13);
  v15 = sub_100002A8C((uint64_t)v12, 1, v13);
  if (v14)
  {
    if (!v15)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
      if (EnumCaseMultiPayload == 1)
      {
        v17 = 1;
      }
      else
      {
        v23 = sub_1000024DC(&qword_10002CD20);
        v17 = 0;
        *(_QWORD *)&v11[*(int *)(v23 + 48)] = *(_QWORD *)&v12[*(int *)(v23 + 48)];
        *(_QWORD *)&v11[*(int *)(v23 + 64)] = *(_QWORD *)&v12[*(int *)(v23 + 64)];
      }
      swift_storeEnumTagMultiPayload(v11, v13, v17);
      sub_10000251C((uint64_t)v11, 0, 1, v13);
      goto LABEL_15;
    }
LABEL_7:
    v18 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_15;
  }
  if (v15)
  {
    sub_100009A48((uint64_t)v11, type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100009A48((uint64_t)v11, type metadata accessor for RunningShortcutTracker.State);
    v19 = swift_getEnumCaseMultiPayload(v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    if (v19 == 1)
    {
      v20 = v11;
      v21 = v13;
      v22 = 1;
    }
    else
    {
      v24 = sub_1000024DC(&qword_10002CD20);
      *(_QWORD *)&v11[*(int *)(v24 + 48)] = *(_QWORD *)&v12[*(int *)(v24 + 48)];
      *(_QWORD *)&v11[*(int *)(v24 + 64)] = *(_QWORD *)&v12[*(int *)(v24 + 64)];
      v20 = v11;
      v21 = v13;
      v22 = 0;
    }
    swift_storeEnumTagMultiPayload(v20, v21, v22);
  }
LABEL_15:
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000087DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000087E8);
}

uint64_t sub_1000087E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = sub_100009BE8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = v3;
    return sub_100002A8C(v8, a2, v7);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v7 = sub_1000024DC(&qword_10002CDD0);
    v8 = v3 + *(int *)(a3 + 24);
    return sub_100002A8C(v8, a2, v7);
  }
  v9 = *(_QWORD *)(v3 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_10000888C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008898);
}

void sub_100008898(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_100009BE8();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v4;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(v4 + *(int *)(a4 + 20)) = a2;
      sub_100009BDC();
      return;
    }
    v9 = sub_1000024DC(&qword_10002CDD0);
    v10 = v4 + *(int *)(a4 + 24);
  }
  sub_10000251C(v10, a2, a2, v9);
}

void sub_100008924(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = "\b";
    sub_1000089B8(319);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      v6[3] = &unk_1000229E0;
      swift_initStructMetadata(a1, 256, 4, v6, a1 + 16);
    }
  }
}

void sub_1000089B8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10002CE88)
  {
    v2 = type metadata accessor for RunningShortcutTracker.State(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10002CE88);
  }
}

ValueMetadata *type metadata accessor for RunShortcutWidgetProvider()
{
  return &type metadata for RunShortcutWidgetProvider;
}

char *sub_100008A1C(char *a1, char *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;

  v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v17);
  }
  else
  {
    v6 = (int *)v4;
    v7 = type metadata accessor for Date(0);
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = v6[5];
    v10 = *(void **)&a2[v9];
    *(_QWORD *)&a1[v9] = v10;
    v11 = v6[6];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = type metadata accessor for RunningShortcutTracker.State(0);
    v15 = v10;
    if (sub_100002A8C((uint64_t)v13, 1, v14))
    {
      v16 = sub_1000024DC(&qword_10002CDD0);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v13, v14);
      v8(v12, v13, v7);
      if (EnumCaseMultiPayload == 1)
      {
        v19 = 1;
      }
      else
      {
        v20 = sub_1000024DC(&qword_10002CD20);
        v21 = *(int *)(v20 + 48);
        v22 = *(void **)&v13[v21];
        *(_QWORD *)&v12[v21] = v22;
        v23 = *(int *)(v20 + 64);
        v24 = *(void **)&v13[v23];
        *(_QWORD *)&v12[v23] = v24;
        v25 = v22;
        v26 = v24;
        v19 = 0;
      }
      swift_storeEnumTagMultiPayload(v12, v14, v19);
      sub_10000251C((uint64_t)v12, 0, 1, v14);
    }
    a1[v6[7]] = a2[v6[7]];
  }
  return a1;
}

void sub_100008BA8(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;

  v2 = type metadata accessor for Date(0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(a1, v2);
  v4 = type metadata accessor for RunShortcutWidgetEntry(0);

  v5 = a1 + *(int *)(v4 + 24);
  v6 = type metadata accessor for RunningShortcutTracker.State(0);
  if (!sub_100002A8C(v5, 1, v6))
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v5, v6);
    v3(v5, v2);
    if (EnumCaseMultiPayload != 1)
    {
      v8 = sub_1000024DC(&qword_10002CD20);

    }
  }
}

uint64_t sub_100008C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;

  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  v7 = v6[5];
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v6[6];
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for RunningShortcutTracker.State(0);
  v13 = v8;
  if (sub_100002A8C((uint64_t)v11, 1, v12))
  {
    v14 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v11, v12);
    v5((uint64_t)v10, (uint64_t)v11, v4);
    if (EnumCaseMultiPayload == 1)
    {
      v16 = 1;
    }
    else
    {
      v17 = sub_1000024DC(&qword_10002CD20);
      v18 = *(int *)(v17 + 48);
      v19 = *(void **)&v11[v18];
      *(_QWORD *)&v10[v18] = v19;
      v20 = *(int *)(v17 + 64);
      v21 = *(void **)&v11[v20];
      *(_QWORD *)&v10[v20] = v21;
      v22 = v19;
      v23 = v21;
      v16 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v16);
    sub_10000251C((uint64_t)v10, 0, 1, v12);
  }
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  return a1;
}

uint64_t sub_100008DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, v4);
  v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  v7 = v6[5];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  v11 = v6[6];
  v12 = (char *)(a1 + v11);
  v13 = (char *)(a2 + v11);
  v14 = type metadata accessor for RunningShortcutTracker.State(0);
  v15 = sub_100002A8C((uint64_t)v12, 1, v14);
  v16 = sub_100002A8C((uint64_t)v13, 1, v14);
  if (v15)
  {
    if (!v16)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v13, v14);
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v13, v4);
      if (EnumCaseMultiPayload == 1)
      {
        v18 = 1;
      }
      else
      {
        v24 = sub_1000024DC(&qword_10002CD20);
        v25 = *(int *)(v24 + 48);
        v26 = *(void **)&v13[v25];
        *(_QWORD *)&v12[v25] = v26;
        v27 = *(int *)(v24 + 64);
        v28 = *(void **)&v13[v27];
        *(_QWORD *)&v12[v27] = v28;
        v29 = v26;
        v30 = v28;
        v18 = 0;
      }
      swift_storeEnumTagMultiPayload(v12, v14, v18);
      sub_10000251C((uint64_t)v12, 0, 1, v14);
      goto LABEL_15;
    }
LABEL_7:
    v19 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_15;
  }
  if (v16)
  {
    sub_100009A48((uint64_t)v12, type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100009A48((uint64_t)v12, type metadata accessor for RunningShortcutTracker.State);
    v20 = swift_getEnumCaseMultiPayload(v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v13, v4);
    if (v20 == 1)
    {
      v21 = v12;
      v22 = v14;
      v23 = 1;
    }
    else
    {
      v31 = sub_1000024DC(&qword_10002CD20);
      v32 = *(int *)(v31 + 48);
      v33 = *(void **)&v13[v32];
      *(_QWORD *)&v12[v32] = v33;
      v34 = *(int *)(v31 + 64);
      v35 = *(void **)&v13[v34];
      *(_QWORD *)&v12[v34] = v35;
      v36 = v33;
      v37 = v35;
      v21 = v12;
      v22 = v14;
      v23 = 0;
    }
    swift_storeEnumTagMultiPayload(v21, v22, v23);
  }
LABEL_15:
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  return a1;
}

uint64_t sub_100009010(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;

  v4 = type metadata accessor for Date(0);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  *(_QWORD *)(a1 + v6[5]) = *(_QWORD *)(a2 + v6[5]);
  v7 = v6[6];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for RunningShortcutTracker.State(0);
  if (sub_100002A8C((uint64_t)v9, 1, v10))
  {
    v11 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v9, v10);
    v5((uint64_t)v8, (uint64_t)v9, v4);
    if (EnumCaseMultiPayload == 1)
    {
      v13 = 1;
    }
    else
    {
      v14 = sub_1000024DC(&qword_10002CD20);
      v13 = 0;
      *(_QWORD *)&v8[*(int *)(v14 + 48)] = *(_QWORD *)&v9[*(int *)(v14 + 48)];
      *(_QWORD *)&v8[*(int *)(v14 + 64)] = *(_QWORD *)&v9[*(int *)(v14 + 64)];
    }
    swift_storeEnumTagMultiPayload(v8, v10, v13);
    sub_10000251C((uint64_t)v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  return a1;
}

uint64_t sub_100009164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  int v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, v4);
  v6 = (int *)type metadata accessor for RunShortcutWidgetEntry(0);
  v7 = v6[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = v6[6];
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for RunningShortcutTracker.State(0);
  v13 = sub_100002A8C((uint64_t)v10, 1, v12);
  v14 = sub_100002A8C((uint64_t)v11, 1, v12);
  if (v13)
  {
    if (!v14)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v11, v12);
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v11, v4);
      if (EnumCaseMultiPayload == 1)
      {
        v16 = 1;
      }
      else
      {
        v22 = sub_1000024DC(&qword_10002CD20);
        v16 = 0;
        *(_QWORD *)&v10[*(int *)(v22 + 48)] = *(_QWORD *)&v11[*(int *)(v22 + 48)];
        *(_QWORD *)&v10[*(int *)(v22 + 64)] = *(_QWORD *)&v11[*(int *)(v22 + 64)];
      }
      swift_storeEnumTagMultiPayload(v10, v12, v16);
      sub_10000251C((uint64_t)v10, 0, 1, v12);
      goto LABEL_15;
    }
LABEL_7:
    v17 = sub_1000024DC(&qword_10002CDD0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_15;
  }
  if (v14)
  {
    sub_100009A48((uint64_t)v10, type metadata accessor for RunningShortcutTracker.State);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100009A48((uint64_t)v10, type metadata accessor for RunningShortcutTracker.State);
    v18 = swift_getEnumCaseMultiPayload(v11, v12);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v11, v4);
    if (v18 == 1)
    {
      v19 = v10;
      v20 = v12;
      v21 = 1;
    }
    else
    {
      v23 = sub_1000024DC(&qword_10002CD20);
      *(_QWORD *)&v10[*(int *)(v23 + 48)] = *(_QWORD *)&v11[*(int *)(v23 + 48)];
      *(_QWORD *)&v10[*(int *)(v23 + 64)] = *(_QWORD *)&v11[*(int *)(v23 + 64)];
      v19 = v10;
      v20 = v12;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
  }
LABEL_15:
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  return a1;
}

uint64_t sub_10000937C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009388);
}

uint64_t sub_100009388(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009BCC();
  return sub_100002A8C(a1, a2, v4);
}

uint64_t sub_1000093B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000093C4);
}

uint64_t sub_1000093C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009BCC();
  return sub_10000251C(a1, a2, a2, v4);
}

uint64_t sub_1000093F8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for RunShortcutWidgetEntry(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100009460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
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
  uint64_t v23;
  uint64_t v24;

  v0 = sub_100002608(&qword_10002CDF8);
  v1 = sub_100002608(&qword_10002CDF0);
  v2 = sub_100002608(&qword_10002CDE8);
  sub_1000099B8(&qword_10002CE10, &qword_10002CDE8);
  v3 = sub_100004D3C();
  v24 = sub_100009BC0(v3, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, v4, v5, v6, v7, v8, v9, v2);
  v23 = sub_100009BC0(v24, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, v10, v11, v12, v13, v14, v15, v1);
  return sub_100009BC0(v23, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, v16, v17, v18, v19, v20, v21, v0);
}

void sub_100009528()
{
  sub_100009554(&qword_10002CF50, type metadata accessor for RunShortcutWidgetEntry);
}

void sub_100009554(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_100009C34(v3), a1);
  }
  sub_100009BD4();
}

void sub_100009588()
{
  sub_100009554(&qword_10002CF58, type metadata accessor for RunShortcutWidgetEntry);
}

unint64_t sub_1000095B8()
{
  unint64_t result;

  result = qword_10002CF60[0];
  if (!qword_10002CF60[0])
  {
    result = swift_getWitnessTable(&unk_100022E90, &type metadata for RunShortcutConfigurationIntent);
    atomic_store(result, qword_10002CF60);
  }
  return result;
}

uint64_t sub_1000095F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002464C, 1);
}

uint64_t sub_100009604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  sub_100009554(&qword_10002D010, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  EnvironmentValues.subscript.getter(&v3, v0, v0, v1);
  return v3;
}

void sub_100009664()
{
  _BYTE *v0;

  *v0 = sub_100009C28() & 1;
  sub_100009BD4();
}

void sub_100009684()
{
  EnvironmentValues.widgetFamily.getter();
  sub_100009BD4();
}

void sub_1000096A0()
{
  EnvironmentValues.widgetRenderingMode.getter();
  sub_100009BD4();
}

void sub_1000096BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for WidgetRenderingMode(0);
  __chkstk_darwin(v2);
  sub_10000265C();
  v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v4 - v3, a1);
  EnvironmentValues.widgetRenderingMode.setter(v5);
  sub_100009BDC();
}

void sub_100009728(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.isEnabled.getter() & 1;
  sub_100009BD4();
}

void sub_100009750(unsigned __int8 *a1)
{
  EnvironmentValues.isEnabled.setter(*a1);
  sub_100009BD4();
}

uint64_t sub_100009770()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100009780(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_100009798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CFA0;
  if (!qword_10002CFA0)
  {
    v1 = sub_100002608(&qword_10002CF90);
    sub_10000981C();
    sub_1000099B8(&qword_10002CFD8, &qword_10002CFE0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CFA0);
  }
  return result;
}

unint64_t sub_10000981C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002CFA8;
  if (!qword_10002CFA8)
  {
    v1 = sub_100002608(&qword_10002CF88);
    sub_100009880();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CFA8);
  }
  return result;
}

unint64_t sub_100009880()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t OpaqueTypeConformance2;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  result = qword_10002CFB0;
  if (!qword_10002CFB0)
  {
    v1 = sub_100002608(&qword_10002CFB8);
    v2 = sub_100002608(&qword_10002CFC0);
    v3 = type metadata accessor for RunShortcutComplicationView(255);
    sub_100009554(&qword_10002CFC8, type metadata accessor for RunShortcutComplicationView);
    v5 = v4;
    v6 = sub_100004D3C();
    v10 = v3;
    v11 = &type metadata for String;
    v12 = v5;
    v13 = v6;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v10, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    v10 = v2;
    v11 = (void *)OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v10, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v8 = type metadata accessor for EmptyShortcutComplicationView(255);
    sub_100009554(&qword_10002CFD0, type metadata accessor for EmptyShortcutComplicationView);
    v10 = v8;
    v11 = &type metadata for String;
    v12 = v9;
    v13 = v6;
    swift_getOpaqueTypeConformance2(&v10, &opaque type descriptor for <<opaque return type of View.widgetLabel<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002CFB0);
  }
  return result;
}

void sub_1000099B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_100002608(a2);
    atomic_store(sub_100009C34(v3), a1);
  }
  sub_100009BD4();
}

void sub_1000099EC()
{
  EnvironmentValues.widgetFamily.getter();
  sub_100009BD4();
}

void sub_100009A08()
{
  EnvironmentValues.widgetRenderingMode.getter();
  sub_100009BD4();
}

void sub_100009A28()
{
  _BYTE *v0;

  *v0 = sub_100009C28() & 1;
  sub_100009BD4();
}

void sub_100009A48(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_100009BF4(v2);
  sub_100009BD4();
}

void sub_100009A70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000024DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_100009BD4();
}

void sub_100009AB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_1000024DC(a2);
  sub_100009BF4(v2);
  sub_100009BD4();
}

id sub_100009AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100006964(a1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_100009AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunShortcutWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009B3C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
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
  uint64_t v14;
  uint64_t v16;

  v0 = sub_100002608(&qword_10002CF98);
  v1 = sub_100002608(&qword_10002CF90);
  v2 = sub_100009798();
  v16 = sub_100009BC0(v2, (uint64_t)&opaque type descriptor for <<opaque return type of View.privacySensitive(_:)>>, v3, v4, v5, v6, v7, v8, v1);
  return sub_100009BC0(v16, (uint64_t)&opaque type descriptor for <<opaque return type of View.unredacted()>>, v9, v10, v11, v12, v13, v14, v0);
}

uint64_t sub_100009BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return swift_getOpaqueTypeConformance2(&a9, a2, 1);
}

uint64_t sub_100009BCC()
{
  return type metadata accessor for RunShortcutWidgetEntry(0);
}

uint64_t sub_100009BE8()
{
  return type metadata accessor for Date(0);
}

uint64_t sub_100009BF4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_100009C20()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009C28()
{
  return sub_100009604();
}

uint64_t sub_100009C34(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_100009C40()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009C48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return URLQueryItem.init(name:value:)(a1, a2, v2, v3);
}

NSString sub_100009C54()
{
  return String._bridgeToObjectiveC()();
}

char *sub_100009C60(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = a2[3];
    *((_QWORD *)a1 + 3) = v9;
    v10 = *(int *)(a3 + 28);
    v11 = &a1[v10];
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = v5;
    swift_bridgeObjectRetain(v8);
    swift_retain(v9);
    v14 = sub_1000024DC(&qword_10002D030);
    if (swift_getEnumCaseMultiPayload(v12, v14) == 1)
    {
      v15 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v11, v12, v15);
      v16 = 1;
    }
    else
    {
      v17 = *v12;
      *(_QWORD *)v11 = *v12;
      swift_retain(v17);
      v16 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v14, v16);
    v18 = *(int *)(a3 + 32);
    v19 = &a1[v18];
    v20 = (uint64_t)a2 + v18;
    v21 = *(_QWORD *)v20;
    v22 = *(_BYTE *)(v20 + 8);
    sub_100009D8C(*(_QWORD *)v20, v22);
    *(_QWORD *)v19 = v21;
    v19[8] = v22;
  }
  return a1;
}

uint64_t sub_100009D8C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_100009D98(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 28));
  v5 = sub_1000024DC(&qword_10002D030);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  return sub_100009E38(*(_QWORD *)(a1 + *(int *)(a2 + 32)), *(_BYTE *)(a1 + *(int *)(a2 + 32) + 8));
}

uint64_t sub_100009E38(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

_QWORD *sub_100009E44(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  a1[2] = v8;
  a1[3] = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = v6;
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  v14 = sub_1000024DC(&qword_10002D030);
  if (swift_getEnumCaseMultiPayload(v12, v14) == 1)
  {
    v15 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v11, v12, v15);
    v16 = 1;
  }
  else
  {
    v17 = *v12;
    *v11 = *v12;
    swift_retain(v17);
    v16 = 0;
  }
  swift_storeEnumTagMultiPayload(v11, v14, v16);
  v18 = *(int *)(a3 + 32);
  v19 = (char *)a1 + v18;
  v20 = a2 + v18;
  v21 = *(_QWORD *)v20;
  v22 = *(_BYTE *)(v20 + 8);
  sub_100009D8C(*(_QWORD *)v20, v22);
  *(_QWORD *)v19 = v21;
  v19[8] = v22;
  return a1;
}

uint64_t sub_100009F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v12;
  swift_retain(v12);
  swift_release(v11);
  if (a1 != a2)
  {
    v13 = *(int *)(a3 + 28);
    v14 = (uint64_t *)(a1 + v13);
    v15 = (uint64_t *)(a2 + v13);
    sub_1000030F0(a1 + v13, &qword_10002D030);
    v16 = sub_1000024DC(&qword_10002D030);
    if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
    {
      v17 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v14, v15, v17);
      v18 = 1;
    }
    else
    {
      v19 = *v15;
      *v14 = *v15;
      swift_retain(v19);
      v18 = 0;
    }
    swift_storeEnumTagMultiPayload(v14, v16, v18);
  }
  v20 = *(int *)(a3 + 32);
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = *(_BYTE *)(v22 + 8);
  sub_100009D8C(*(_QWORD *)v22, v24);
  v25 = *(_QWORD *)v21;
  v26 = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  sub_100009E38(v25, v26);
  return a1;
}

uint64_t sub_10000A088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 28);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_1000024DC(&qword_10002D030);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for ColorScheme(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 32);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  return a1;
}

void **sub_10000A16C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v6 = *a1;
  *a1 = *a2;

  v7 = a2[2];
  v8 = a1[2];
  a1[1] = a2[1];
  a1[2] = v7;
  swift_bridgeObjectRelease(v8);
  v9 = a1[3];
  a1[3] = a2[3];
  swift_release(v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    sub_1000030F0((uint64_t)a1 + v10, &qword_10002D030);
    v13 = sub_1000024DC(&qword_10002D030);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload(v11, v13, 1);
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = *(int *)(a3 + 32);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)v17;
  LOBYTE(v17) = v17[8];
  v19 = *(_QWORD *)v16;
  v20 = v16[8];
  *(_QWORD *)v16 = v18;
  v16[8] = (char)v17;
  sub_100009E38(v19, v20);
  return a1;
}

uint64_t sub_10000A28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A298);
}

uint64_t sub_10000A298(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000024DC(&qword_10002D038);
    return sub_100002A8C((uint64_t)a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_10000A310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A31C);
}

_QWORD *sub_10000A31C(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = sub_1000024DC(&qword_10002D038);
    return (_QWORD *)sub_10000251C((uint64_t)v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for RunShortcutRectangularWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_10002D098;
  if (!qword_10002D098)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RunShortcutRectangularWidgetView);
  return result;
}

void sub_10000A3C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_100022C88;
  v4[2] = &unk_100022CA0;
  sub_10000A458(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_100022CB8;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
  }
}

void sub_10000A458(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10002D0A8)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10002D0A8);
  }
}

uint64_t sub_10000A4AC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002469C, 1);
}

uint64_t sub_10000A4BC()
{
  id *v0;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  _OWORD v26[3];

  v1 = type metadata accessor for ContainerBackgroundPlacement(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000265C();
  v5 = v4 - v3;
  v6 = sub_1000024DC(&qword_10002D0E8);
  __chkstk_darwin(v6);
  sub_10000265C();
  v9 = v8 - v7;
  v10 = sub_1000024DC(&qword_10002D0F0);
  __chkstk_darwin(v10);
  sub_10000265C();
  v13 = v12 - v11;
  *(_QWORD *)v9 = static VerticalAlignment.center.getter();
  *(_QWORD *)(v9 + 8) = 0x4024000000000000;
  *(_BYTE *)(v9 + 16) = 0;
  v14 = sub_1000024DC(&qword_10002D0F8);
  v15 = sub_10000A6FC((uint64_t)v0, (char *)(v9 + *(int *)(v14 + 44)));
  v16 = static Alignment.leading.getter(v15);
  _FrameLayout.init(width:height:alignment:)(v26, 0, 1, 0, 1, v16, v17);
  sub_10000AF88(v9, v13);
  v18 = (_OWORD *)(v13 + *(int *)(v10 + 36));
  v19 = v26[1];
  *v18 = v26[0];
  v18[1] = v19;
  v18[2] = v26[2];
  sub_1000030F0(v9, &qword_10002D0E8);
  v20 = objc_msgSend(*v0, "backgroundColor");
  v21 = objc_msgSend(v20, "paletteGradient");

  v22 = objc_msgSend(v21, "darkBaseColor");
  v25 = Color.init(_:)(v22);
  static ContainerBackgroundPlacement.widget.getter();
  v23 = sub_10000B1CC(&qword_10002D100, &qword_10002D0F0, (void (*)(void))sub_10000AFD0);
  View.containerBackground<A>(_:for:)(&v25, v5, v10, &type metadata for Color, v23, &protocol witness table for Color);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  swift_release(v25);
  return sub_1000030F0(v13, &qword_10002D0F0);
}

uint64_t sub_10000A6FC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t OpaqueTypeConformance2;
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
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t KeyPath;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  _QWORD v78[2];

  v76 = a2;
  v3 = type metadata accessor for ColorScheme(0);
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  __chkstk_darwin(v3);
  v69 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000024DC(&qword_10002D110);
  __chkstk_darwin(v5);
  v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = type metadata accessor for Font.TextStyle(0);
  v8 = *(_QWORD *)(v72 - 8);
  __chkstk_darwin(v72);
  v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  v11 = *(_QWORD *)(v68 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v68);
  v75 = sub_1000024DC(&qword_10002D118);
  v73 = *(_QWORD *)(v75 - 8);
  v13 = __chkstk_darwin(v75);
  v74 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v68 - v15;
  v17 = objc_msgSend(*(id *)a1, "backgroundColor");
  v18 = objc_msgSend(v17, "paletteGradient");

  sub_10000B014(a1, (uint64_t)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = *(unsigned __int8 *)(v11 + 80);
  v20 = (v19 + 16) & ~v19;
  v21 = swift_allocObject(&unk_100029968, v20 + v12, v19 | 7);
  sub_10000B13C((uint64_t)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  v22 = sub_1000024DC(&qword_10002D120);
  v23 = sub_100002608(&qword_10002D128);
  v24 = sub_10000B1CC(&qword_10002D130, &qword_10002D128, (void (*)(void))sub_10000B234);
  v78[0] = v23;
  v78[1] = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v78, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
  v77 = v16;
  GradientColorResolverView.init(gradient:_:)(v18, sub_10000B180, v21, v22, OpaqueTypeConformance2);
  v27 = *(_QWORD *)(a1 + 8);
  v26 = *(_QWORD *)(a1 + 16);
  v28 = v72;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Font.TextStyle.body(_:), v72);
  v29 = type metadata accessor for Font.Design(0);
  sub_10000251C((uint64_t)v7, 1, 1, v29);
  swift_bridgeObjectRetain(v26);
  v30 = static Font.system(_:design:weight:)(v10, v7, 0, 1);
  sub_1000030F0((uint64_t)v7, &qword_10002D110);
  v31 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  static Font.Weight.medium.getter(v31);
  v32 = Font.weight(_:)(v30);
  swift_release(v30);
  v33 = Text.font(_:)(v32, v27, v26, 0, &_swiftEmptyArrayStorage);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  swift_bridgeObjectRelease(v26);
  v40 = swift_release(v32);
  v41 = *(_QWORD *)(a1 + 24);
  if (v41)
  {
    v42 = v69;
    sub_1000196FC();
    v43 = Color.wfColor(with:)(v42, v41);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v42, v71);
    v44 = Color.init(_:)(v43);
  }
  else
  {
    v44 = static Color.white.getter(v40);
  }
  v45 = v44;
  v46 = v37 & 1;
  v78[0] = v44;
  v47 = Text.foregroundStyle<A>(_:)(v78, v33, v35, v37 & 1, v39, &type metadata for Color, &protocol witness table for Color);
  v49 = v48;
  v51 = v50;
  v53 = v52 & 1;
  sub_10000B274(v33, v35, v46);
  swift_release(v45);
  swift_bridgeObjectRelease(v39);
  KeyPath = swift_getKeyPath(&unk_100022D20);
  v56 = v73;
  v55 = v74;
  v57 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  v58 = v75;
  v57(v74, v77, v75);
  v59 = v76;
  v57(v76, v55, v58);
  v60 = sub_1000024DC(&qword_10002D140);
  v61 = &v59[*(int *)(v60 + 48)];
  v62 = v47;
  *(_QWORD *)v61 = v47;
  *((_QWORD *)v61 + 1) = v49;
  v63 = v49;
  v61[16] = v53;
  *((_QWORD *)v61 + 3) = v51;
  *((_QWORD *)v61 + 4) = KeyPath;
  *((_QWORD *)v61 + 5) = 2;
  v61[48] = 0;
  v64 = &v59[*(int *)(v60 + 64)];
  *(_QWORD *)v64 = 0;
  v64[8] = 1;
  v65 = v62;
  sub_10000B2E8(v62, v63, v53);
  v66 = *(void (**)(char *, uint64_t))(v56 + 8);
  swift_bridgeObjectRetain(v51);
  swift_retain(KeyPath);
  v66(v77, v58);
  sub_10000B274(v65, v63, v53);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v51);
  return ((uint64_t (*)(char *, uint64_t))v66)(v55, v58);
}

uint64_t sub_10000ABE8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v37 = a1;
  v46 = type metadata accessor for IconView.DisplayMode(0);
  v39 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IconSize(0);
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  __chkstk_darwin(v7);
  v43 = (uint64_t *)((char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = type metadata accessor for IconView(0);
  v45 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v44 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_1000024DC(&qword_10002D128);
  __chkstk_darwin(v38);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ColorScheme(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a2 + 24);
  v47 = a3;
  if (v19)
  {
    sub_1000196FC();
    v20 = (id)Color.wfColor(with:)(v18, v19);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  else
  {
    v20 = 0;
  }
  v21 = v38;
  v22 = v39;
  v23 = v40;
  sub_10000B014(a2, (uint64_t)v14);
  if (!v20)
  {
    v24 = &v14[*(int *)(v12 + 32)];
    v25 = *(_QWORD *)v24;
    v26 = v24[8];
    sub_100009D8C(*(_QWORD *)v24, v24[8]);
    v27 = sub_1000195A0(v25, v26);
    sub_100009E38(v25, v26);
    if ((v27 & 1) == 0)
    {
      sub_10000B2F8((uint64_t)v14);
      v20 = v37;
      goto LABEL_9;
    }
    v20 = objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
  }
  sub_10000B2F8((uint64_t)v14);
LABEL_9:
  v28 = objc_msgSend(*(id *)a2, "icon");
  v29 = v42;
  v30 = v43;
  *v43 = 0x403E000000000000;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v41 + 104))(v30, enum case for IconSize.customHeight(_:), v29);
  *(_QWORD *)v6 = v20;
  v6[8] = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v6, enum case for IconView.DisplayMode.customColor(_:), v46);
  v31 = v20;
  v32 = v44;
  IconView.init(_:size:displayMode:animated:)(v28, v30, v6, 1);
  v33 = v45;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v11, v32, v23);
  *(_WORD *)&v11[*(int *)(v21 + 36)] = 257;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v23);
  v34 = sub_10000B1CC(&qword_10002D130, &qword_10002D128, (void (*)(void))sub_10000B234);
  View.widgetAccentable(_:)(1, v21, v34);

  return sub_1000030F0((uint64_t)v11, &qword_10002D128);
}

uint64_t sub_10000AF88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002D0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000AFD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D108;
  if (!qword_10002D108)
  {
    v1 = sub_100002608(&qword_10002D0E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D108);
  }
  return result;
}

uint64_t sub_10000B014(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B058()
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

  v1 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 16));
  swift_release(*(_QWORD *)(v0 + v4 + 24));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 28));
  v7 = sub_1000024DC(&qword_10002D030);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  sub_100009E38(*(_QWORD *)(v0 + v4 + *(int *)(v1 + 32)), *(_BYTE *)(v0 + v4 + *(int *)(v1 + 32) + 8));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000B13C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B180@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RunShortcutRectangularWidgetView(0) - 8) + 80);
  return sub_10000ABE8(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_10000B1CC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100002608(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000B234()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D138;
  if (!qword_10002D138)
  {
    v1 = type metadata accessor for IconView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for IconView, v1);
    atomic_store(result, (unint64_t *)&qword_10002D138);
  }
  return result;
}

uint64_t sub_10000B274(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000B284@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000B2B8(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10000B2E8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000B2F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B334()
{
  _QWORD v1[4];

  v1[0] = sub_100002608(&qword_10002D0F0);
  v1[1] = &type metadata for Color;
  v1[2] = sub_10000B1CC(&qword_10002D100, &qword_10002D0F0, (void (*)(void))sub_10000AFD0);
  v1[3] = &protocol witness table for Color;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(_:for:)>>, 1);
}

uint64_t *sub_10000B3B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = *(int *)(a3 + 24);
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = *(_QWORD *)v25;
    v27 = v25[8];
    sub_100009D8C(*(_QWORD *)v25, v27);
    *(_QWORD *)v24 = v26;
    v24[8] = v27;
  }
  return a1;
}

uint64_t sub_10000B52C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return sub_100009E38(*(_QWORD *)((char *)a1 + *(int *)(a2 + 24)), *((_BYTE *)a1 + *(int *)(a2 + 24) + 8));
}

uint64_t *sub_10000B5FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;

  v6 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_100009D8C(*(_QWORD *)v23, v25);
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  return a1;
}

uint64_t *sub_10000B748(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;

  if (a1 != a2)
  {
    sub_100009AB0((uint64_t)a1, &qword_10002CAB8);
    v6 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = *(int *)(a3 + 20);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100009AB0((uint64_t)a1 + v12, &qword_10002D000);
    v15 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_100009D8C(*(_QWORD *)v23, v25);
  v26 = *(_QWORD *)v22;
  v27 = v22[8];
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  sub_100009E38(v26, v27);
  return a1;
}

char *sub_10000B8C8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  return a1;
}

char *sub_10000BA00(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  if (a1 != a2)
  {
    sub_100009AB0((uint64_t)a1, &qword_10002CAB8);
    v6 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100009AB0((uint64_t)&a1[v8], &qword_10002D000);
    v11 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(_QWORD *)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_100009E38(v17, v18);
  return a1;
}

uint64_t sub_10000BB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BB78);
}

uint64_t sub_10000BB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v11;

  v6 = sub_1000024DC(&qword_10002CAC0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return sub_100002A8C(v8, a2, v7);
  }
  v9 = sub_1000024DC(&qword_10002D148);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    return sub_100002A8C(v8, a2, v7);
  }
  v11 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
  if (v11 > 1)
    return (v11 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_10000BC20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BC2C);
}

void sub_10000BC2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_1000024DC(&qword_10002CAC0);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
LABEL_5:
    sub_10000251C(v10, a2, a2, v9);
    return;
  }
  v11 = sub_1000024DC(&qword_10002D148);
  if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
  {
    v9 = v11;
    v10 = a1 + *(int *)(a4 + 20);
    goto LABEL_5;
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24) + 8) = -(char)a2;
  sub_100009BDC();
}

uint64_t type metadata accessor for EmptyShortcutComplicationView(uint64_t a1)
{
  uint64_t result;

  result = qword_10002D1A8;
  if (!qword_10002D1A8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EmptyShortcutComplicationView);
  return result;
}

void sub_10000BD04(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_10000BDB0(319, (unint64_t *)&qword_10002CB30, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000BDB0(319, (unint64_t *)&unk_10002D1B8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = "\t";
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_10000BDB0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000BDFC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000246EC, 1);
}

void sub_10000BE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  NSString v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  sub_1000024DC(&qword_10002D1F0);
  sub_10000264C();
  __chkstk_darwin(v2);
  sub_10000265C();
  v5 = (char *)(v4 - v3);
  v62 = sub_1000024DC(&qword_10002D1F8);
  sub_10000264C();
  __chkstk_darwin(v6);
  sub_10000265C();
  v9 = v8 - v7;
  v64 = sub_1000024DC(&qword_10002D200);
  sub_10000264C();
  __chkstk_darwin(v10);
  sub_10000266C();
  v61 = sub_1000024DC(&qword_10002D208);
  sub_10000264C();
  __chkstk_darwin(v11);
  sub_10000265C();
  v14 = v13 - v12;
  sub_1000024DC(&qword_10002D210);
  sub_10000264C();
  __chkstk_darwin(v15);
  sub_10000265C();
  v63 = v17 - v16;
  v18 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  sub_10000264C();
  __chkstk_darwin(v19);
  sub_10000265C();
  v22 = (_QWORD *)(v21 - v20);
  v23 = type metadata accessor for WidgetFamily(0);
  v24 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  sub_10000D33C();
  sub_10001954C();
  v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 88))(v0, v23);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v25 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    sub_10000C30C(v9);
    sub_10000D168(v9, v14, &qword_10002D1F8);
    swift_storeEnumTagMultiPayload(v14, v61, 1);
    sub_10000D230(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView, (uint64_t)&unk_100022CD0);
    v27 = v26;
    v28 = sub_10000CF74();
    _ConditionalContent<>.init(storage:)(v14, v18, v62, v27, v28);
    sub_10000D168(v63, v1, &qword_10002D210);
    sub_10000D334(v1, v64);
    v29 = sub_10000CEF0();
    sub_10000D124();
    v30 = sub_10000D320();
    _ConditionalContent<>.init(storage:)(v30, v31, v32, v29, v33);
    sub_100009AB0(v63, &qword_10002D210);
    sub_100009AB0(v9, &qword_10002D1F8);
  }
  else if (v25 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    sub_10000C298();
    v35 = v34;
    v36 = String._bridgeToObjectiveC()();
    v37 = String._bridgeToObjectiveC()();
    v38 = sub_10001EC78(v36);

    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v41 = v40;

    v42 = static Color.secondary.getter();
    v43 = (_QWORD *)((char *)v22 + *(int *)(v18 + 28));
    *v43 = swift_getKeyPath(&unk_100022DE8);
    v44 = sub_1000024DC(&qword_10002D030);
    sub_10000D334((uint64_t)v43, v44);
    v45 = (char *)v22 + *(int *)(v18 + 32);
    *(_QWORD *)v45 = swift_getKeyPath(&unk_100022E18);
    v45[8] = 0;
    *v22 = v35;
    v22[1] = v39;
    v22[2] = v41;
    v22[3] = v42;
    sub_10000D26C((uint64_t)v22, v14, type metadata accessor for RunShortcutRectangularWidgetView);
    sub_10000D334(v14, v61);
    sub_10000D230(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView, (uint64_t)&unk_100022CD0);
    v47 = v46;
    v48 = sub_10000CF74();
    _ConditionalContent<>.init(storage:)(v14, v18, v62, v47, v48);
    sub_10000D168(v63, v1, &qword_10002D210);
    sub_10000D334(v1, v64);
    v49 = sub_10000CEF0();
    sub_10000D124();
    v50 = sub_10000D320();
    _ConditionalContent<>.init(storage:)(v50, v51, v52, v49, v53);
    sub_100009AB0(v63, &qword_10002D210);
    sub_100009A48((uint64_t)v22, type metadata accessor for RunShortcutRectangularWidgetView);
  }
  else
  {
    *(_QWORD *)v5 = static Alignment.center.getter();
    *((_QWORD *)v5 + 1) = v54;
    v55 = sub_1000024DC(&qword_10002D218);
    sub_10000C3C4(&v5[*(int *)(v55 + 44)]);
    sub_10000D168((uint64_t)v5, v1, &qword_10002D1F0);
    swift_storeEnumTagMultiPayload(v1, v64, 1);
    v56 = sub_10000CEF0();
    sub_10000D124();
    v57 = sub_10000D320();
    _ConditionalContent<>.init(storage:)(v57, v58, v59, v56, v60);
    sub_100009AB0((uint64_t)v5, &qword_10002D1F0);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v0, v23);
  }
}

void sub_10000C298()
{
  id v0;
  unsigned int v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
  v1 = objc_msgSend(v0, "RGBAValue");

  v2 = objc_allocWithZone((Class)WFWorkflowIcon);
  sub_100010178(v1, 0xF000u, 0, 0xF000000000000000);
  sub_100009BD4();
}

void sub_10000C30C(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for ComplicationPaddingModifier(0);
  sub_10000264C();
  __chkstk_darwin(v5);
  sub_10000D33C();
  sub_1000024DC(&qword_10002D240);
  sub_10000264C();
  __chkstk_darwin(v6);
  sub_10000266C();
  sub_10000C54C(v1, v3);
  *v2 = swift_getKeyPath(&unk_100022E40);
  v7 = sub_1000024DC(&qword_10002CAB8);
  sub_10000D334((uint64_t)v2, v7);
  v8 = sub_1000024DC(&qword_10002D1F8);
  sub_10000D1A4((uint64_t)v2, a1 + *(int *)(v8 + 36));
  sub_10000D1E8(v3, a1);
  sub_100009BDC();
}

uint64_t sub_10000C3C4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v2 = sub_1000024DC(&qword_10002D1F8);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v20 - v6;
  v8 = type metadata accessor for AccessoryWidgetBackground(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v20 - v14;
  AccessoryWidgetBackground.init()(v13);
  sub_10000C30C((uint64_t)v7);
  v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v16(v12, v15, v8);
  sub_10000D168((uint64_t)v7, (uint64_t)v5, &qword_10002D1F8);
  v16(a1, v12, v8);
  v17 = sub_1000024DC(&qword_10002D288);
  sub_10000D168((uint64_t)v5, (uint64_t)&a1[*(int *)(v17 + 48)], &qword_10002D1F8);
  sub_100009AB0((uint64_t)v7, &qword_10002D1F8);
  v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v15, v8);
  sub_100009AB0((uint64_t)v5, &qword_10002D1F8);
  return ((uint64_t (*)(char *, uint64_t))v18)(v12, v8);
}

uint64_t sub_10000C54C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t OpaqueTypeConformance2;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void (*v59)(uint64_t *, uint64_t, uint64_t);
  char *v60;
  char *v61;
  char v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;

  v122 = a2;
  v105 = type metadata accessor for BlendMode(0);
  v104 = *(_QWORD *)(v105 - 8);
  __chkstk_darwin(v105);
  v103 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for Color.RGBColorSpace(0);
  v89 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v91 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = type metadata accessor for WidgetRenderingMode(0);
  v93 = *(_QWORD *)(v100 - 8);
  v5 = __chkstk_darwin(v100);
  v99 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v97 = (char *)&v89 - v7;
  v8 = type metadata accessor for SStackFill(0);
  v107 = *(_QWORD *)(v8 - 8);
  v108 = v8;
  v9 = __chkstk_darwin(v8);
  v95 = (uint64_t *)((char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v106 = (uint64_t *)((char *)&v89 - v11);
  v120 = type metadata accessor for WidgetSStackView(0);
  __chkstk_darwin(v120);
  v98 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_1000024DC(&qword_10002D270);
  v102 = *(_QWORD *)(v121 - 8);
  v13 = __chkstk_darwin(v121);
  v96 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v101 = (char *)&v89 - v15;
  v117 = sub_1000024DC(&qword_10002D278);
  __chkstk_darwin(v117);
  v119 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = type metadata accessor for IconView.DisplayMode(0);
  v112 = *(_QWORD *)(v114 - 8);
  __chkstk_darwin(v114);
  v113 = (uint64_t *)((char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = type metadata accessor for IconSize(0);
  v109 = *(_QWORD *)(v18 - 8);
  v110 = v18;
  __chkstk_darwin(v18);
  v111 = (uint64_t *)((char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v118 = type metadata accessor for IconView(0);
  v116 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118);
  v115 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = type metadata accessor for EmptyShortcutComplicationView(0);
  __chkstk_darwin(v92);
  v22 = (char *)&v89 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for WidgetFamily(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = __chkstk_darwin(v23);
  v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v29 = (char *)&v89 - v28;
  sub_10001954C();
  v30 = *(void (**)(char *, _QWORD, uint64_t))(v24 + 104);
  v30(v27, enum case for WidgetFamily.accessoryInline(_:), v23);
  sub_10000D230(&qword_10002D280, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  v32 = v31;
  dispatch thunk of RawRepresentable.rawValue.getter(&v123, v23, v31);
  dispatch thunk of RawRepresentable.rawValue.getter(&v125, v23, v32);
  v33 = v123;
  v34 = v125;
  v35 = *(void (**)(char *, uint64_t))(v24 + 8);
  v35(v27, v23);
  v35(v29, v23);
  v94 = a1;
  sub_10000D26C(a1, (uint64_t)v22, type metadata accessor for EmptyShortcutComplicationView);
  if (v33 == v34)
  {
    sub_100009A48((uint64_t)v22, type metadata accessor for EmptyShortcutComplicationView);
LABEL_4:
    sub_10000C298();
    v40 = v39;
    v41 = objc_msgSend(v39, "icon");

    v42 = v110;
    v43 = v111;
    *v111 = 0x403E000000000000;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v109 + 104))(v43, enum case for IconSize.customHeight(_:), v42);
    v44 = objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
    v46 = v113;
    v45 = v114;
    *v113 = v44;
    *((_BYTE *)v46 + 8) = 0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v112 + 104))(v46, enum case for IconView.DisplayMode.customColor(_:), v45);
    v47 = v115;
    IconView.init(_:size:displayMode:animated:)(v41, v43, v46, 1);
    v48 = v116;
    v50 = v118;
    v49 = v119;
    (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v119, v47, v118);
    swift_storeEnumTagMultiPayload(v49, v117, 0);
    sub_10000D230((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView, (uint64_t)&protocol conformance descriptor for IconView);
    v52 = v51;
    sub_10000D230(&qword_10002D258, type metadata accessor for WidgetSStackView, (uint64_t)&unk_100023494);
    v123 = v120;
    v124 = v53;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v123, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v49, v50, v121, v52, OpaqueTypeConformance2);
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v50);
  }
  sub_10001954C();
  v30(v27, enum case for WidgetFamily.accessoryRectangular(_:), v23);
  dispatch thunk of RawRepresentable.rawValue.getter(&v123, v23, v32);
  dispatch thunk of RawRepresentable.rawValue.getter(&v125, v23, v32);
  v36 = v123;
  v37 = v125;
  v35(v27, v23);
  v35(v29, v23);
  sub_100009A48((uint64_t)v22, type metadata accessor for EmptyShortcutComplicationView);
  if (v36 == v37)
    goto LABEL_4;
  v56 = static Color.white.getter(v38);
  v57 = v106;
  *v106 = v56;
  v58 = enum case for SStackFill.color(_:);
  v59 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v107 + 104);
  v59(v57, enum case for SStackFill.color(_:), v108);
  v60 = v97;
  sub_1000198D4();
  v61 = v99;
  static WidgetRenderingMode.vibrant.getter();
  v62 = static WidgetRenderingMode.== infix(_:_:)(v60, v61);
  v63 = *(void (**)(char *, uint64_t))(v93 + 8);
  v64 = v100;
  v63(v61, v100);
  v65 = ((uint64_t (*)(char *, uint64_t))v63)(v60, v64);
  if ((v62 & 1) != 0)
  {
    v66 = v91;
    (*(void (**)(char *, _QWORD, uint64_t))(v89 + 104))(v91, enum case for Color.RGBColorSpace.sRGB(_:), v90);
    v67 = Color.init(_:white:opacity:)(v66, 0.6, 1.0);
  }
  else
  {
    v68 = static Color.white.getter(v65);
    v67 = Color.opacity(_:)(0.6);
    swift_release(v68);
  }
  v69 = v95;
  *v95 = v67;
  v70 = v108;
  v59(v69, v58, v108);
  v71 = *(void (**)(char *, uint64_t *, uint64_t))(v107 + 32);
  v72 = (uint64_t)v98;
  v71(v98, v106, v70);
  v73 = type metadata accessor for WidgetSStackView.Content(0);
  swift_storeEnumTagMultiPayload(v72, v73, 1);
  v74 = v120;
  v71((char *)(v72 + *(int *)(v120 + 20)), v69, v70);
  sub_1000198D4();
  static WidgetRenderingMode.accented.getter();
  LOBYTE(v71) = static WidgetRenderingMode.== infix(_:_:)(v60, v61);
  v63(v61, v64);
  v63(v60, v64);
  v75 = (unsigned int *)&enum case for BlendMode.destinationOut(_:);
  v76 = v104;
  if ((v71 & 1) == 0)
    v75 = (unsigned int *)&enum case for BlendMode.normal(_:);
  v77 = v103;
  v78 = v105;
  (*(void (**)(char *, _QWORD, uint64_t))(v104 + 104))(v103, *v75, v105);
  sub_10000D230(&qword_10002D258, type metadata accessor for WidgetSStackView, (uint64_t)&unk_100023494);
  v80 = v79;
  v81 = v96;
  View.iconBlendMode(_:)(v77, v74, v79);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v78);
  sub_100009A48(v72, type metadata accessor for WidgetSStackView);
  v82 = v102;
  v83 = v101;
  v84 = v121;
  (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v101, v81, v121);
  v85 = v119;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v119, v83, v84);
  swift_storeEnumTagMultiPayload(v85, v117, 1);
  sub_10000D230((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView, (uint64_t)&protocol conformance descriptor for IconView);
  v87 = v86;
  v123 = v74;
  v124 = v80;
  v88 = swift_getOpaqueTypeConformance2(&v123, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
  _ConditionalContent<>.init(storage:)(v85, v118, v84, v87, v88);
  return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v83, v84);
}

unint64_t sub_10000CEF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D220;
  if (!qword_10002D220)
  {
    v1 = sub_100002608(&qword_10002D210);
    sub_10000D230(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView, (uint64_t)&unk_100022CD0);
    sub_10000CF74();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D220);
  }
  return result;
}

unint64_t sub_10000CF74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D230;
  if (!qword_10002D230)
  {
    v1 = sub_100002608(&qword_10002D1F8);
    sub_10000CFF8();
    sub_10000D230(&qword_10002D260, type metadata accessor for ComplicationPaddingModifier, (uint64_t)&unk_10002255C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D230);
  }
  return result;
}

unint64_t sub_10000CFF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D238;
  if (!qword_10002D238)
  {
    v1 = sub_100002608(&qword_10002D240);
    sub_10000D05C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D238);
  }
  return result;
}

unint64_t sub_10000D05C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_10002D248;
  if (!qword_10002D248)
  {
    v1 = sub_100002608(&qword_10002D250);
    sub_10000D230((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView, (uint64_t)&protocol conformance descriptor for IconView);
    v2 = type metadata accessor for WidgetSStackView(255);
    sub_10000D230(&qword_10002D258, type metadata accessor for WidgetSStackView, (uint64_t)&unk_100023494);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D248);
  }
  return result;
}

unint64_t sub_10000D124()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D268;
  if (!qword_10002D268)
  {
    v1 = sub_100002608(&qword_10002D1F0);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D268);
  }
  return result;
}

void sub_10000D168(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_1000024DC(a3);
  sub_10000D308(v3);
  sub_100009BD4();
}

uint64_t sub_10000D1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComplicationPaddingModifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D1E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002D240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000D230(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_100009BD4();
}

void sub_10000D26C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_10000D308(v3);
  sub_100009BD4();
}

unint64_t sub_10000D29C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D290;
  if (!qword_10002D290)
  {
    v1 = sub_100002608(&qword_10002D298);
    sub_10000CEF0();
    sub_10000D124();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D290);
  }
  return result;
}

uint64_t sub_10000D308(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_10000D320()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000D334(uint64_t a1, uint64_t a2)
{
  return swift_storeEnumTagMultiPayload(a1, a2, 0);
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  unint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if ((a3 & 1) == 0)
  {
    if (result)
      return static String._fromUTF8Repairing(_:)(result);
    __break(1u);
  }
  v3 = HIDWORD(result);
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result >> 11 == 27)
    goto LABEL_21;
  LODWORD(v3) = WORD1(result);
  if (WORD1(result) > 0x10u)
    goto LABEL_13;
  if ((result & 0xFFFFFF80) != 0)
  {
LABEL_14:
    v5 = (result & 0x3F) << 8;
    v6 = (v5 | (result >> 6)) + 33217;
    v7 = (v5 | (result >> 6) & 0x3F) << 8;
    v8 = (((v7 | (result >> 12) & 0x3F) << 8) | (result >> 18)) - 2122219023;
    v9 = (v7 | (result >> 12)) + 8487393;
    if ((_DWORD)v3)
      v4 = v8;
    else
      v4 = v9;
    if (result < 0x800)
      v4 = v6;
    goto LABEL_10;
  }
  if (result <= 0xFF)
  {
    v4 = (result + 1);
LABEL_10:
    v10 = (v4 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v4) >> 3)) & 7)));
    result = (unint64_t)&v10;
    return static String._fromUTF8Repairing(_:)(result);
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t *NSBundle._current.unsafeMutableAddressor()
{
  if (qword_10002C9E0 != -1)
    swift_once(&qword_10002C9E0, sub_10000D4A0);
  return &static NSBundle._current;
}

id sub_10000D4A0()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  static NSBundle._current = (uint64_t)result;
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_10002C9E0 != -1)
    swift_once(&qword_10002C9E0, sub_10000D4A0);
  return (id)static NSBundle._current;
}

uint64_t sub_10000D534()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return objc_opt_self(_TtCFIZvE24ShortcutsWidgetExtensionCSo8NSBundle8_currentS0_iU_FT_S0_L_2__);
}

unint64_t sub_10000D568()
{
  unint64_t result;

  result = qword_10002D338;
  if (!qword_10002D338)
  {
    result = swift_getWitnessTable(&unk_100022EC0, &type metadata for RunShortcutConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_10002D338);
  }
  return result;
}

unint64_t sub_10000D5A8()
{
  unint64_t result;

  result = qword_10002D340;
  if (!qword_10002D340)
  {
    result = swift_getWitnessTable(&unk_100022F50, &type metadata for RunShortcutConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_10002D340);
  }
  return result;
}

unint64_t sub_10000D5E8()
{
  unint64_t result;

  result = qword_10002D348;
  if (!qword_10002D348)
  {
    result = swift_getWitnessTable(&unk_100022F78, &type metadata for RunShortcutConfigurationIntent);
    atomic_store(result, (unint64_t *)&qword_10002D348);
  }
  return result;
}

unint64_t sub_10000D628()
{
  unint64_t result;

  result = qword_10002D350;
  if (!qword_10002D350)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10002D350);
  }
  return result;
}

uint64_t sub_10000D664(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000D568();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000D6A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5[6];

  IntentParameter.wrappedValue.getter(v4);
  v0 = sub_10000E0B4((uint64_t)v4, (uint64_t)v5);
  AppDependency.wrappedValue.getter(v4, v0);
  v1 = v4[0];
  swift_retain(v4[0]);
  v2 = sub_10000D8F0((uint64_t)v5, v1);
  sub_10000E0FC(v5);
  swift_release(v1);
  return v2;
}

uint64_t sub_10000D72C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = &v13[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_10000E074(v10, qword_100030EA8);
  sub_10000E05C(v10, (uint64_t)qword_100030EA8);
  v11 = String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE800000000000000);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v9, v6, 0, 0, 256);
}

uint64_t sub_10000D8A8()
{
  uint64_t v0;

  if (qword_10002C9E8 != -1)
    swift_once(&qword_10002C9E8, sub_10000D72C);
  v0 = type metadata accessor for LocalizedStringResource(0);
  return sub_10000E05C(v0, (uint64_t)qword_100030EA8);
}

uint64_t sub_10000D8F0(uint64_t a1, uint64_t a2)
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
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22[6];

  sub_10000E0B4(a1, (uint64_t)v20);
  v4 = v20[0];
  v5 = v20[1];
  v6 = v20[2];
  v7 = v20[3];
  v8 = v20[4];
  v9 = v20[5];
  sub_10000E0B4(a1, (uint64_t)v21);
  if (v21[0])
  {
    v22[0] = v4;
    v22[1] = v5;
    v22[2] = v6;
    v22[3] = v7;
    v22[4] = v8;
    v22[5] = v9;
    swift_retain(v4);
    swift_retain(v5);
    swift_retain(v6);
    swift_retain(v7);
    swift_retain(v8);
    swift_retain(v9);
    sub_10000E440(v22, v10, v11, v12, v13, v14, v15, v16);
    v18 = v17;
    swift_release(a2);
    swift_release(v9);
    swift_release(v8);
    swift_release(v7);
    swift_release(v6);
    swift_release(v5);
    a2 = v4;
  }
  else
  {
    v18 = 0;
  }
  swift_release(a2);
  return v18;
}

uint64_t sub_10000D9F8()
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
  char *v10;
  uint64_t v11;
  char *v12;
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
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  type metadata accessor for String.LocalizationValue(0);
  sub_10000264C();
  __chkstk_darwin(v0);
  sub_10000265C();
  v3 = v2 - v1;
  v4 = type metadata accessor for InputConnectionBehavior(0);
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  __chkstk_darwin(v4);
  sub_10000265C();
  v36 = v6 - v5;
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v35 - v11;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v13);
  sub_10000265C();
  v16 = v15 - v14;
  v17 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_10000265C();
  v21 = v20 - v19;
  type metadata accessor for Locale(0);
  sub_10000264C();
  __chkstk_darwin(v22);
  sub_10000265C();
  v25 = v24 - v23;
  type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v26);
  sub_10000265C();
  v29 = v28 - v27;
  String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE800000000000000);
  v35 = sub_1000024DC(&qword_10002D360);
  static Locale.current.getter(v35);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v21, enum case for LocalizedStringResource.BundleDescription.main(_:), v17);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v3, 0x6E65746E49707041, 0xEA00000000007374, v25, v21, 0, 0, 256);
  sub_10000E19C(v16);
  type metadata accessor for IntentDialog(0);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  sub_10000E19C((uint64_t)v12);
  sub_10000E19C((uint64_t)v10);
  v30 = v36;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v36, enum case for InputConnectionBehavior.default(_:), v38);
  v31 = sub_10000DFA0();
  v32 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v29, v16, &v39, v12, v10, v30, v31);
  sub_1000024DC(&qword_10002D368);
  type metadata accessor for AppDependencyManager(0);
  v39 = 0u;
  v40 = 0u;
  *(_QWORD *)&v41 = 0;
  v33 = static AppDependencyManager.shared.getter();
  AppDependency.__allocating_init(key:manager:default:)(&v39, v33, &unk_10002D370, 0);
  return v32;
}

uint64_t sub_10000DCD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000D8A8();
  v3 = type metadata accessor for LocalizedStringResource(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_10000DD18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to WidgetConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_1000095B8();
  *v4 = v2;
  v4[1] = sub_10000DD7C;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10000DD7C()
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
    return sub_10000E1AC(*(uint64_t (**)(void))(v3 + 8));
  return result;
}

uint64_t sub_10000DDD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000D9F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000DDF4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000D568();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for RunShortcutConfigurationIntent(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

_QWORD *_s24ShortcutsWidgetExtension30RunShortcutConfigurationIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for RunShortcutConfigurationIntent(uint64_t *a1, uint64_t *a2)
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

_QWORD *assignWithTake for RunShortcutConfigurationIntent(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RunShortcutConfigurationIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RunShortcutConfigurationIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RunShortcutConfigurationIntent()
{
  return &type metadata for RunShortcutConfigurationIntent;
}

unint64_t sub_10000DFA0()
{
  unint64_t result;

  result = qword_10002DB50[0];
  if (!qword_10002DB50[0])
  {
    result = swift_getWitnessTable(&unk_10002317C, &type metadata for ConfiguredShortcut);
    atomic_store(result, qword_10002DB50);
  }
  return result;
}

uint64_t sub_10000DFDC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000DFF4, 0, 0);
}

uint64_t sub_10000DFF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  v1 = qword_100030F80;
  **(_QWORD **)(v0 + 16) = qword_100030F80;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return sub_10000E1AC(v3);
}

uint64_t sub_10000E05C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10000E074(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000E0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002D378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000E0FC(uint64_t *a1)
{
  sub_10000E130(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  return a1;
}

uint64_t sub_10000E130(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result)
  {
    swift_release(result);
    swift_release(a2);
    swift_release(a3);
    swift_release(a4);
    swift_release(a5);
    return swift_release(a6);
  }
  return result;
}

uint64_t sub_10000E19C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000251C(a1, 1, 1, v1);
}

uint64_t sub_10000E1AC(uint64_t (*a1)(void))
{
  return a1();
}

ValueMetadata *type metadata accessor for WidgetChicletButonStyle()
{
  return &type metadata for WidgetChicletButonStyle;
}

uint64_t sub_10000E1C8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000247AC, 1);
}

uint64_t sub_10000E1D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v2 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000024DC(&qword_10002D380);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = ButtonStyleConfiguration.label.getter(v7);
  if ((ButtonStyleConfiguration.isPressed.getter(v10) & 1) != 0)
    v11 = 0.97;
  else
    v11 = 1.0;
  v12 = static UnitPoint.center.getter();
  v14 = v13;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  v15 = &v9[*(int *)(v6 + 36)];
  *(double *)v15 = v11;
  *((double *)v15 + 1) = v11;
  *((double *)v15 + 2) = v12;
  *((_QWORD *)v15 + 3) = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_10000E308((uint64_t)v9, a1);
}

uint64_t sub_10000E308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002D380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000E354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D388;
  if (!qword_10002D388)
  {
    v1 = sub_100002608(&qword_10002D380);
    sub_10000E3C0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D388);
  }
  return result;
}

unint64_t sub_10000E3C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D390;
  if (!qword_10002D390)
  {
    v1 = type metadata accessor for ButtonStyleConfiguration.Label(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ButtonStyleConfiguration.Label, v1);
    atomic_store(result, (unint64_t *)&qword_10002D390);
  }
  return result;
}

unint64_t sub_10000E404()
{
  unint64_t result;

  result = qword_10002D398;
  if (!qword_10002D398)
  {
    result = swift_getWitnessTable(&unk_100023050, &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002D398);
  }
  return result;
}

void sub_10000E440(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  NSString v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v10 = *(void **)(v8 + 16);
  v11 = *a1;
  sub_100010DA8((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, v25);
  v12 = sub_100010D9C();
  swift_bridgeObjectRelease(v11);
  v13 = objc_msgSend(v10, "referenceForWorkflowID:", v12);

  if (!v13)
  {
    v22 = a1[1];
    sub_100010DA8(v14, v15, v16, v17, v18, v19, v20, v21, v26);
    v23 = sub_100010D9C();
    swift_bridgeObjectRelease(v22);
    v24 = objc_msgSend(v10, "uniqueVisibleReferenceForWorkflowName:", v23);

  }
  sub_100010D3C();
}

uint64_t sub_10000E4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;

  sub_100010DA8(a1, a2, a3, a4, a5, a6, a7, a8, v9);
  return v10;
}

void sub_10000E510()
{
  uint64_t v0;
  unsigned __int16 v1;
  id v2;
  unint64_t v3;

  EntityProperty.wrappedValue.getter(&v3);
  v0 = v3;
  EntityProperty.wrappedValue.getter(&v3);
  v1 = v3;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(v3 >> 16))
  {
    v2 = objc_allocWithZone((Class)WFWorkflowIcon);
    sub_100010178(v0, v1, 0, 0xF000000000000000);
    sub_100010D3C();
    return;
  }
  __break(1u);
}

uint64_t sub_10000E58C()
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;

  v0 = type metadata accessor for String.LocalizationValue.Placeholder(0);
  v40 = *(_QWORD *)(v0 - 8);
  v41 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v3);
  v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000024DC((uint64_t *)&unk_10002DCC0);
  __chkstk_darwin(v6);
  v42 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v9 = *(_QWORD *)(v8 - 8);
  v37[0] = v8;
  __chkstk_darwin(v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for String.LocalizationValue(0);
  v16 = __chkstk_darwin(v15);
  v38 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)v37 - v18;
  v39 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v39);
  v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000E074(v22, qword_100030EC0);
  v37[1] = sub_10000E05C(v22, (uint64_t)qword_100030EC0);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE800000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v25(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v19, 0x6E65746E49707041, 0xEA00000000007374, v14, v11, 0, 0, 256);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(10, 1);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v26);
  v28 = v40;
  v27 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v2, enum case for String.LocalizationValue.Placeholder.int(_:), v41);
  v29 = sub_100017754((uint64_t)v2);
  v31 = v30;
  String.LocalizationValue.StringInterpolation.appendInterpolation(placeholder:specifier:)(v2, v29, v30);
  swift_bridgeObjectRelease(v31);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v27);
  v32._countAndFlagsBits = 0x756374726F687320;
  v32._object = (void *)0xEA00000000007374;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v32);
  v33 = v38;
  v34 = String.LocalizationValue.init(stringInterpolation:)(v5);
  static Locale.current.getter(v34);
  v25(v11, v24, v37[0]);
  v35 = (uint64_t)v42;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v33, 0x6E65746E49707041, 0xEA00000000007374, v14, v11, 0, 0, 256);
  sub_10000251C(v35, 0, 1, v39);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v21, v35);
}

uint64_t sub_10000E930()
{
  uint64_t v0;

  if (qword_10002C9F0 != -1)
    swift_once(&qword_10002C9F0, sub_10000E58C);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000E05C(v0, (uint64_t)qword_100030EC0);
}

void sub_10000E978()
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  Swift::String v24;
  void *object;
  Swift::String v26;
  uint64_t v27;
  Swift::String v28;

  sub_1000024DC(&qword_10002D468);
  sub_10000264C();
  __chkstk_darwin(v1);
  sub_10000D33C();
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v2);
  sub_10000265C();
  v5 = v4 - v3;
  v6 = type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v7);
  sub_10000265C();
  v10 = v9 - v8;
  type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  sub_10000264C();
  __chkstk_darwin(v11);
  sub_10000265C();
  v14 = v13 - v12;
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)objc_opt_self(WFWorkflowIconDrawer);
  sub_10000E510();
  v18 = v17;
  v19 = objc_msgSend(v16, "imageWithIcon:size:", v17, 31.0, 31.0);

  if (v19)
  {
    v20 = sub_100010A28(v19);
    v22 = v21;
  }
  else
  {
    v20 = 0;
    v22 = 0xF000000000000000;
  }
  objc_autoreleasePoolPop(v15);
  v23 = 1;
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
  EntityProperty.wrappedValue.getter(&v28);
  object = v28._object;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v28);
  swift_bridgeObjectRelease(object);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v26);
  LocalizedStringResource.init(stringInterpolation:)(v14);
  sub_10000251C(v5, 1, 1, v6);
  if (v22 >> 60 != 15)
  {
    sub_100010BBC(v20, v22);
    DisplayRepresentation.Image.init(data:isTemplate:)(v20, v22, 0);
    v23 = 0;
  }
  v27 = type metadata accessor for DisplayRepresentation.Image(0);
  sub_10000251C(v0, v23, 1, v27);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v0);
  sub_100010B64(v20, v22);
  sub_100009BA8();
}

uint64_t sub_10000EB94()
{
  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  qword_100030ED8 = qword_100030F80;
  return swift_retain(qword_100030F80);
}

uint64_t sub_10000EBDC()
{
  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  return swift_retain(qword_100030F80);
}

uint64_t *sub_10000EC1C()
{
  if (qword_10002C9F8 != -1)
    swift_once(&qword_10002C9F8, sub_10000EB94);
  return &qword_100030ED8;
}

double sub_10000EC5C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned __int16 a8@<W7>, _OWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double result;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  sub_10000EDCC((uint64_t *)&v27);
  v15 = v27;
  v16 = v28;
  v17 = v29;
  v25 = a1;
  v26 = a2;
  swift_retain(v27);
  swift_retain(*((_QWORD *)&v15 + 1));
  swift_retain(v16);
  swift_retain(*((_QWORD *)&v16 + 1));
  swift_retain(v17);
  swift_retain(*((_QWORD *)&v17 + 1));
  EntityProperty.wrappedValue.setter(&v25);
  v25 = a3;
  v26 = a4;
  EntityProperty.wrappedValue.setter(&v25);
  v25 = a5;
  v26 = a6;
  EntityProperty.wrappedValue.setter(&v25);
  v25 = a7;
  EntityProperty.wrappedValue.setter(&v25);
  v25 = a8;
  EntityProperty.wrappedValue.setter(&v25);
  v25 = a10;
  v26 = a11;
  EntityProperty.wrappedValue.setter(&v25);
  swift_release(*((_QWORD *)&v17 + 1));
  swift_release(v17);
  swift_release(*((_QWORD *)&v16 + 1));
  swift_release(v16);
  swift_release(*((_QWORD *)&v15 + 1));
  swift_release(v15);
  v18 = v28;
  *a9 = v27;
  a9[1] = v18;
  result = *(double *)&v29;
  a9[2] = v29;
  return result;
}

void sub_10000EDCC(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v3);
  sub_10000D33C();
  sub_1000024DC(&qword_10002D430);
  LocalizedStringResource.init(stringLiteral:)(0x696669746E656449, 0xEA00000000007265);
  v4 = EntityProperty<>.init(title:)(v1);
  LocalizedStringResource.init(stringLiteral:)(0x74756374726F6853, 0xED0000656D614E20);
  v5 = EntityProperty<>.init(title:)(v1);
  sub_1000024DC(&qword_10002D438);
  LocalizedStringResource.init(stringLiteral:)(0x656C746974627553, 0xE800000000000000);
  v6 = sub_100010D88();
  sub_1000024DC(&qword_10002D440);
  LocalizedStringResource.init(stringLiteral:)(0x6C6F43206E6F6349, 0xEA0000000000726FLL);
  v7 = EntityProperty<>.init(title:)(v1);
  LocalizedStringResource.init(stringLiteral:)(0x6D614E206E6F6349, 0xE900000000000065);
  v8 = EntityProperty<>.init(title:)(v1);
  LocalizedStringResource.init(stringLiteral:)(0x746169636F737341, 0xEE00707041206465);
  v9 = sub_100010D88();
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  sub_100009BA8();
}

double sub_10000EF60@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unsigned __int16 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  double result;
  _OWORD v22[2];
  __int128 v23;

  v4 = objc_msgSend(a1, "identifier");
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  v8 = objc_msgSend(a1, "name");
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  v12 = sub_100010A94(a1);
  v14 = v13;
  v15 = objc_msgSend(a1, "color");
  v16 = (unsigned __int16)objc_msgSend(a1, "glyphCharacter");
  v17 = a1;
  v18 = sub_100010AF4(v17);
  sub_10000EC5C(v5, v7, v9, v11, v12, v14, (uint64_t)v15, v16, v22, v18, v19);

  v20 = v22[1];
  *a2 = v22[0];
  a2[1] = v20;
  result = *(double *)&v23;
  a2[2] = v23;
  return result;
}

uint64_t sub_10000F080(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return sub_100010C08((uint64_t)sub_10000F090);
}

uint64_t sub_10000F090()
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD *v5;

  sub_10001E384();
  if (v1)
  {
    sub_10000EF60(v1, (_OWORD *)(v0 + 16));
    v2 = *(_OWORD *)(v0 + 16);
    v3 = *(_OWORD *)(v0 + 32);
    v4 = *(_OWORD *)(v0 + 48);
  }
  else
  {
    v2 = 0uLL;
    v3 = 0uLL;
    v4 = 0uLL;
  }
  v5 = *(_OWORD **)(v0 + 64);
  *v5 = v2;
  v5[1] = v3;
  v5[2] = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000F0F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10002D454);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100010C00;
  return sub_10000F140(a1);
}

uint64_t sub_10000F140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return sub_100010C08((uint64_t)sub_10000F150);
}

char *sub_10000F150()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = *(void **)(v0 + 72);
  sub_10001E528();
  v5 = v4;
  if (!(v4 >> 62))
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_14:
    sub_100009C40();
    v3 = &_swiftEmptyArrayStorage;
    return (char *)sub_100010C3C((uint64_t)v3, *(uint64_t (**)(void))(v0 + 8));
  }
  v6 = sub_100010CB8();
  if (!v6)
    goto LABEL_14;
LABEL_3:
  result = sub_100010D08();
  if ((v6 & 0x8000000000000000) == 0)
  {
    sub_100010D20();
    do
    {
      if (v29)
        v8 = (void *)sub_100010D68();
      else
        v8 = sub_100010D94(v5 + 8 * v1);
      v9 = v8;
      v10 = sub_100010D4C((uint64_t)objc_msgSend(v8, "identifier"));
      v32 = v11;
      v33 = v10;

      v13 = sub_100010D54(v12, "name");
      sub_100010D4C((uint64_t)v13);
      sub_100010D5C();
      v2 = (void *)sub_100010A94(v9);
      sub_100010D54((uint64_t)v2, "color");
      objc_msgSend(v9, "glyphCharacter");
      v14 = v9;
      v15 = sub_100010AF4(v14);
      sub_100010C14(v15, v16, v17, v18, v19, v20, v21, v22, v26, v27, v28, v29, v30, v31, v32, v33);

      sub_100010D74();
      if (v24)
      {
        sub_100010CF0(v23);
        v3 = v34;
      }
      sub_100010C6C();
    }
    while (!v25);
    sub_100009C40();
    v0 = v28;
    return (char *)sub_100010C3C((uint64_t)v3, *(uint64_t (**)(void))(v0 + 8));
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc(dword_10002D45C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100010C00;
  return sub_10000F304(a1, a2);
}

uint64_t sub_10000F304(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return sub_100010C08((uint64_t)sub_10000F318);
}

char *sub_10000F318()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = *(void **)(v0 + 80);
  sub_10001E5C0();
  v5 = v4;
  if (!(v4 >> 62))
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_14:
    sub_100009C40();
    v3 = &_swiftEmptyArrayStorage;
    return (char *)sub_100010C3C((uint64_t)v3, *(uint64_t (**)(void))(v0 + 8));
  }
  v6 = sub_100010CB8();
  if (!v6)
    goto LABEL_14;
LABEL_3:
  result = sub_100010D08();
  if ((v6 & 0x8000000000000000) == 0)
  {
    sub_100010D20();
    do
    {
      if (v29)
        v8 = (void *)sub_100010D68();
      else
        v8 = sub_100010D94(v5 + 8 * v1);
      v9 = v8;
      v10 = sub_100010D4C((uint64_t)objc_msgSend(v8, "identifier"));
      v32 = v11;
      v33 = v10;

      v13 = sub_100010D54(v12, "name");
      sub_100010D4C((uint64_t)v13);
      sub_100010D5C();
      v2 = (void *)sub_100010A94(v9);
      sub_100010D54((uint64_t)v2, "color");
      objc_msgSend(v9, "glyphCharacter");
      v14 = v9;
      v15 = sub_100010AF4(v14);
      sub_100010C14(v15, v16, v17, v18, v19, v20, v21, v22, v26, v27, v28, v29, v30, v31, v32, v33);

      sub_100010D74();
      if (v24)
      {
        sub_100010CF0(v23);
        v3 = v34;
      }
      sub_100010C6C();
    }
    while (!v25);
    sub_100009C40();
    v0 = v28;
    return (char *)sub_100010C3C((uint64_t)v3, *(uint64_t (**)(void))(v0 + 8));
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F470(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_100010C08((uint64_t)sub_10000F480);
}

uint64_t sub_10000F480()
{
  uint64_t v0;
  char *v1;

  v1 = sub_10000F4B4();
  return (*(uint64_t (**)(char *))(v0 + 8))(v1);
}

char *sub_10000F4B4()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char *result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unsigned __int16 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _OWORD v31[3];

  sub_10001E4B0();
  v1 = v0;
  if (!(v0 >> 62))
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
LABEL_13:
    sub_100009C40();
    return (char *)_swiftEmptyArrayStorage;
  }
  v2 = sub_100010CB8();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  result = sub_1000106E0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v27 = v1 & 0xC000000000000001;
    v28 = v2;
    v29 = v1;
    do
    {
      if (v27)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      else
        v5 = sub_100010D94(v1 + 8 * v4);
      v6 = v5;
      v7 = objc_msgSend(v5, "identifier");
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      v9 = v8;

      v10 = objc_msgSend(v6, "name");
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v13 = v12;

      v14 = sub_100010A94(v6);
      v16 = v15;
      v17 = objc_msgSend(v6, "color");
      v18 = (unsigned __int16)objc_msgSend(v6, "glyphCharacter");
      v19 = v6;
      v20 = sub_100010AF4(v19);
      sub_10000EC5C(v30, v9, v11, v13, v14, v16, (uint64_t)v17, v18, v31, v20, v21);

      v23 = _swiftEmptyArrayStorage[2];
      v22 = _swiftEmptyArrayStorage[3];
      if (v23 >= v22 >> 1)
        sub_1000106E0((char *)(v22 > 1), v23 + 1, 1);
      ++v4;
      _swiftEmptyArrayStorage[2] = v23 + 1;
      v24 = &_swiftEmptyArrayStorage[6 * v23];
      v25 = v31[0];
      v26 = v31[2];
      v24[3] = v31[1];
      v24[4] = v26;
      v24[2] = v25;
      v1 = v29;
    }
    while (v28 != v4);
    sub_100009C40();
    return (char *)_swiftEmptyArrayStorage;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F6C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc(dword_10002D48C);
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_10000F728;
  return sub_10000F2A4(a2, a3);
}

uint64_t sub_10000F728(uint64_t a1)
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

unint64_t sub_10000F788()
{
  unint64_t result;

  result = qword_10002D3A8;
  if (!qword_10002D3A8)
  {
    result = swift_getWitnessTable(&unk_1000230A8, &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002D3A8);
  }
  return result;
}

unint64_t sub_10000F7C8()
{
  unint64_t result;

  result = qword_10002D3B0[0];
  if (!qword_10002D3B0[0])
  {
    result = swift_getWitnessTable(&unk_100023108, &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery);
    atomic_store(result, qword_10002D3B0);
  }
  return result;
}

uint64_t sub_10000F808@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10000EBDC();
  *a1 = result;
  return result;
}

uint64_t sub_10000F82C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10002D484);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000F880;
  return sub_10000F0F0(a1);
}

uint64_t sub_10000F880(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_100010C98();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_10000F8B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc(dword_10002D47C);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_100010C04;
  return sub_10000F470(v3);
}

unint64_t sub_10000F90C()
{
  unint64_t result;

  result = qword_10002D3C8;
  if (!qword_10002D3C8)
  {
    result = swift_getWitnessTable(&unk_100023130, &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002D3C8);
  }
  return result;
}

unint64_t sub_10000F94C()
{
  unint64_t result;

  result = qword_10002DB70;
  if (!qword_10002DB70)
  {
    result = swift_getWitnessTable(&unk_1000232C4, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002DB70);
  }
  return result;
}

unint64_t sub_10000F98C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D3D0[0];
  if (!qword_10002D3D0[0])
  {
    v1 = sub_100002608(qword_10002DB80);
    sub_10000F94C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, qword_10002D3D0);
  }
  return result;
}

uint64_t sub_10000F9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000E404();
  *v5 = v2;
  v5[1] = sub_10000FA5C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000FA5C()
{
  uint64_t v0;

  sub_100010C98();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FA88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 64) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc(dword_10002D474);
  *(_QWORD *)(v2 + 72) = v4;
  *v4 = v2;
  v4[1] = sub_10000FAE4;
  return sub_10000F080(v2 + 16, v3);
}

uint64_t sub_10000FAE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *v0 + 16;
  v2 = *(_QWORD *)(*v0 + 64);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 72));
  sub_10000E0B4(v1, v2);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

double sub_10000FB44@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;
  _OWORD v4[2];
  __int128 v5;

  sub_10000EDCC((uint64_t *)v4);
  v2 = v4[1];
  *a1 = v4[0];
  a1[1] = v2;
  result = *(double *)&v5;
  a1[2] = v5;
  return result;
}

unint64_t sub_10000FB84()
{
  unint64_t result;

  result = qword_10002D3E8;
  if (!qword_10002D3E8)
  {
    result = swift_getWitnessTable(&unk_1000231D4, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D3E8);
  }
  return result;
}

unint64_t sub_10000FBC4()
{
  unint64_t result;

  result = qword_10002D3F0;
  if (!qword_10002D3F0)
  {
    result = swift_getWitnessTable(&unk_10002320C, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D3F0);
  }
  return result;
}

unint64_t sub_10000FC04()
{
  unint64_t result;

  result = qword_10002D3F8;
  if (!qword_10002D3F8)
  {
    result = swift_getWitnessTable(&unk_10002323C, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D3F8);
  }
  return result;
}

void *sub_10000FC40()
{
  return &protocol witness table for String;
}

uint64_t sub_10000FC4C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_10000EC1C();
  v2 = qword_100030ED8;
  *a1 = qword_100030ED8;
  return swift_retain(v2);
}

unint64_t sub_10000FC7C()
{
  unint64_t result;

  result = qword_10002D400;
  if (!qword_10002D400)
  {
    result = swift_getWitnessTable(&unk_100023274, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D400);
  }
  return result;
}

unint64_t sub_10000FCBC()
{
  unint64_t result;

  result = qword_10002D408;
  if (!qword_10002D408)
  {
    result = swift_getWitnessTable(&unk_10002329C, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D408);
  }
  return result;
}

unint64_t sub_10000FCFC()
{
  unint64_t result;

  result = qword_10002D410;
  if (!qword_10002D410)
  {
    result = swift_getWitnessTable(&unk_10002331C, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D410);
  }
  return result;
}

void *sub_10000FD38()
{
  return &protocol witness table for String;
}

uint64_t sub_10000FD44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t result;
  uint64_t v11;

  result = sub_10000E4E4(a1, a2, a3, a4, a5, a6, a7, a8);
  *a9 = result;
  a9[1] = v11;
  return result;
}

uint64_t sub_10000FD68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000E930();
  v3 = type metadata accessor for TypeDisplayRepresentation(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

unint64_t sub_10000FDAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D418;
  if (!qword_10002D418)
  {
    v1 = sub_100002608(&qword_10002D420);
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyResolverSpecification<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D418);
  }
  return result;
}

uint64_t sub_10000FDF0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DFA0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000FE2C()
{
  unint64_t result;

  result = qword_10002D428;
  if (!qword_10002D428)
  {
    result = swift_getWitnessTable(&unk_10002334C, &type metadata for ConfiguredShortcut);
    atomic_store(result, (unint64_t *)&qword_10002D428);
  }
  return result;
}

uint64_t sub_10000FE6C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000FCFC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for ConfiguredShortcut(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ConfiguredShortcut(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  swift_release(a1[2]);
  swift_release(a1[3]);
  swift_release(a1[4]);
  return swift_release(a1[5]);
}

uint64_t *initializeWithCopy for ConfiguredShortcut(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  v7 = a2[4];
  v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  return a1;
}

uint64_t *assignWithCopy for ConfiguredShortcut(uint64_t *a1, uint64_t *a2)
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
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = a2[3];
  v11 = a1[3];
  a1[3] = v10;
  swift_retain(v10);
  swift_release(v11);
  v12 = a2[4];
  v13 = a1[4];
  a1[4] = v12;
  swift_retain(v12);
  swift_release(v13);
  v14 = a2[5];
  v15 = a1[5];
  a1[5] = v14;
  swift_retain(v14);
  swift_release(v15);
  return a1;
}

__n128 initializeWithTake for ConfiguredShortcut(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for ConfiguredShortcut(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  swift_release(a1[2]);
  v5 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  swift_release(v5);
  swift_release(a1[4]);
  v6 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfiguredShortcut(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfiguredShortcut(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfiguredShortcut()
{
  return &type metadata for ConfiguredShortcut;
}

ValueMetadata *type metadata accessor for ConfiguredShortcut.SortedVisibleShortcutsQuery()
{
  return &type metadata for ConfiguredShortcut.SortedVisibleShortcutsQuery;
}

id sub_100010178(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  Class isa;
  id v10;

  if (a4 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100010B64(a3, a4);
  }
  v10 = objc_msgSend(v4, "initWithBackgroundColorValue:glyphCharacter:customImageData:", a1, a2, isa);

  return v10;
}

uint64_t sub_100010208(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  if (a2 < 0)
  {
    v8 = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v8, 1046, 0);
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for RunShortcutWidgetEntry(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    v7 = type metadata accessor for RunShortcutWidgetEntry(0);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

char *sub_100010304(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_100010390(char *result, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (a2 < 0)
  {
    sub_100010C58();
    result = (char *)sub_100010CD8((uint64_t)"Fatal error", v4, v5, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", v6, v7, (uint64_t)"Swift/UnsafePointer.swift", v8, v9, v10, v11);
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)sub_100010CC8(a3, result);
  }
  return result;
}

char *sub_1000103F0(char *result, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  if (a2 < 0)
  {
    sub_100010C58();
    result = (char *)sub_100010CD8((uint64_t)"Fatal error", v4, v5, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", v6, v7, (uint64_t)"Swift/UnsafePointer.swift", v8, v9, v10, v11);
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_100010CC8(a3, result);
  }
  return result;
}

uint64_t sub_100010448(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001053C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 48 * a2 <= a1 || a1 + 48 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001060C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  const char *v5;
  uint64_t v6;

  if (a2 < 0)
  {
    sub_100010C58();
    v5 = "UnsafeMutablePointer.initialize with negative count";
    v6 = 51;
  }
  else
  {
    if (a3 + 24 * a2 <= a1 || a1 + 24 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    sub_100010C58();
    v5 = "UnsafeMutablePointer.initialize overlapping range";
    v6 = 49;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, v5, v6, 2, "Swift/UnsafePointer.swift", 25);
  __break(1u);
  return result;
}

size_t sub_1000106C4(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_100010718(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1000106E0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_100010858(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1000106FC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_100010940(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_100010718(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000024DC(&qword_10002D020);
  v11 = *(_QWORD *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_24;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RunShortcutWidgetEntry(0) - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = (unint64_t)v15 + v18;
  v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_100010208(v20, v8, v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100010448(v20, v8, v19);
  }
  swift_release(a4);
  return (size_t)v15;
}

char *sub_100010858(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000024DC(&qword_10002D448);
    v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100010304(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001053C((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

char *sub_100010940(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000024DC(&qword_10002D460);
    v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100010390(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001060C((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_100010A28(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "PNGRepresentation");

  if (!v2)
    return 0;
  v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_100010A94(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "subtitle");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100010AF4(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "associatedAppBundleIdentifier");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_100010B64(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100010B78(result, a2);
  return result;
}

uint64_t sub_100010B78(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010BBC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010C08(uint64_t a1)
{
  return swift_task_switch(a1, 0, 0);
}

double sub_100010C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;
  _OWORD *v21;
  uint64_t v22;

  return sub_10000EC5C(a16, a15, v16, v18, v22, v17, v19, v20, v21, a1, a2);
}

uint64_t sub_100010C3C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

__n128 sub_100010C6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;

  *(_QWORD *)(v0 + 16) = v2;
  v4 = v0 + 48 * v1;
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v4 + 64) = v6;
  *(__n128 *)(v4 + 32) = result;
  return result;
}

uint64_t sub_100010C98()
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

uint64_t sub_100010CB8()
{
  uint64_t v0;

  if (v0 < 0)
    return _CocoaArrayWrapper.endIndex.getter(v0);
  else
    return _CocoaArrayWrapper.endIndex.getter(v0 & 0xFFFFFFFFFFFFFF8);
}

void *sub_100010CC8@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t sub_100010CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, 11, 2, a4, 55, 2, a7, 25, a9, a10, a11);
}

char *sub_100010CF0@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_1000106E0((char *)(a1 > 1), v1, 1);
}

char *sub_100010D08()
{
  uint64_t v0;

  return sub_1000106E0(0, v0 & ~(v0 >> 63), 0);
}

uint64_t sub_100010D4C(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

id sub_100010D54(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void sub_100010D5C()
{
  void *v0;

}

uint64_t sub_100010D68()
{
  uint64_t v0;
  uint64_t v1;

  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

uint64_t sub_100010D88()
{
  uint64_t v0;

  return EntityProperty<>.init(title:)(v0);
}

id sub_100010D94@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

NSString sub_100010D9C()
{
  return String._bridgeToObjectiveC()();
}

_QWORD *sub_100010DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return EntityProperty.wrappedValue.getter(&a9);
}

unint64_t sub_100010DB4()
{
  unint64_t result;

  result = qword_10002DB20;
  if (!qword_10002DB20)
  {
    result = swift_getWitnessTable(&unk_100024100, &type metadata for RunShortcutIntent);
    atomic_store(result, (unint64_t *)&qword_10002DB20);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsControl()
{
  return &type metadata for ShortcutsControl;
}

uint64_t sub_100010E00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024828, 1);
}

uint64_t sub_100010E10@<X0>(uint64_t a1@<X8>)
{
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
  char *v14;
  uint64_t v15;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v69)(uint64_t, uint64_t, uint64_t);
  char *v70;
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
  uint64_t v81;
  uint64_t v82;
  char *v83;
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

  v94 = a1;
  v1 = type metadata accessor for ControlWidgetSize(0);
  v92 = *(_QWORD *)(v1 - 8);
  v93 = v1;
  sub_100004EB4();
  __chkstk_darwin(v2);
  sub_100004E70();
  v91 = v3;
  v80 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  sub_100004E70();
  v78 = v5;
  type metadata accessor for Locale(0);
  sub_100004EB4();
  __chkstk_darwin(v6);
  sub_100004E70();
  v72 = v7;
  type metadata accessor for String.LocalizationValue(0);
  sub_100004EB4();
  __chkstk_darwin(v8);
  sub_100004FA8();
  v81 = v9;
  __chkstk_darwin(v10);
  v12 = (char *)&v69 - v11;
  v76 = type metadata accessor for LocalizedStringResource(0);
  v75 = *(_QWORD *)(v76 - 8);
  sub_100004EB4();
  __chkstk_darwin(v13);
  sub_100004FA8();
  v83 = v14;
  __chkstk_darwin(v15);
  v17 = (char *)&v69 - v16;
  v71 = sub_1000024DC(&qword_10002D4A0);
  v73 = *(_QWORD *)(v71 - 8);
  sub_100004EB4();
  __chkstk_darwin(v18);
  v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1000024DC(&qword_10002D4A8);
  v84 = *(_QWORD *)(v79 - 8);
  sub_100004EB4();
  __chkstk_darwin(v21);
  v70 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1000024DC(&qword_10002D4B0);
  v24 = *(_QWORD *)(v23 - 8);
  v85 = v23;
  v86 = v24;
  sub_100004EB4();
  __chkstk_darwin(v25);
  sub_100004E70();
  v74 = v26;
  v27 = sub_1000024DC(&qword_10002D4B8);
  v28 = *(_QWORD *)(v27 - 8);
  v87 = v27;
  v88 = v28;
  sub_100004EB4();
  __chkstk_darwin(v29);
  sub_100004E70();
  v77 = v30;
  v31 = sub_1000024DC(&qword_10002D4C0);
  v32 = *(_QWORD *)(v31 - 8);
  v89 = v31;
  v90 = v32;
  sub_100004EB4();
  __chkstk_darwin(v33);
  sub_100004E70();
  v82 = v34;
  v35 = qword_10002D490;
  v36 = off_10002D498;
  swift_bridgeObjectRetain(off_10002D498);
  v37 = sub_1000024DC(&qword_10002D4C8);
  v38 = sub_10001178C();
  v39 = sub_100004CFC(&qword_10002D4D8, &qword_10002D4C8, (uint64_t)&protocol conformance descriptor for ControlWidgetButton<A, B, C>);
  AppIntentControlConfiguration.init(kind:intent:content:)(v35, v36, &type metadata for RunShortcutIntent, sub_10001139C, 0, &type metadata for RunShortcutIntent, v37, v38, v39);
  v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x80000001000203E0);
  static Locale.current.getter(v40);
  v41 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v69 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 104);
  v42 = v78;
  v43 = v80;
  v69(v78, enum case for LocalizedStringResource.BundleDescription.main(_:), v80);
  sub_1000118F8((uint64_t)v12);
  v44 = sub_100004CFC(&qword_10002D4E0, &qword_10002D4A0, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  v45 = v71;
  ControlWidgetConfiguration.displayName(_:)(v17, v71, v44);
  v46 = *(void (**)(char *, uint64_t))(v75 + 8);
  v47 = v17;
  v48 = v76;
  v46(v47, v76);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v20, v45);
  v49 = v81;
  v50 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x8000000100020200);
  static Locale.current.getter(v50);
  v69(v42, v41, v43);
  v51 = v83;
  sub_1000118F8(v49);
  v95 = v45;
  v96 = v44;
  v52 = sub_100004F1C((uint64_t)&v95, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>);
  v53 = v74;
  v54 = v51;
  v55 = v51;
  v56 = v79;
  v57 = v70;
  ControlWidgetConfiguration.description(_:)(v54, v79, v52);
  v46(v55, v48);
  v58 = (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v57, v56);
  v59 = v91;
  static ControlWidgetSize.medium.getter(v58);
  v95 = v56;
  v96 = v52;
  v60 = sub_100004F1C((uint64_t)&v95, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>);
  v61 = v77;
  v62 = v85;
  ControlWidgetConfiguration.preferredControlSize(_:)(v59, v85, v60);
  (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v59, v93);
  (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v53, v62);
  v95 = v62;
  v96 = v60;
  v63 = sub_100004F1C((uint64_t)&v95, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.preferredControlSize(_:)>>);
  v64 = v82;
  v65 = v87;
  ControlWidgetConfiguration.promptsForUserConfiguration()(v87, v63);
  (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v61, v65);
  v95 = v65;
  v96 = v63;
  v66 = sub_100004F1C((uint64_t)&v95, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.promptsForUserConfiguration()>>);
  v67 = v89;
  ControlWidgetConfiguration.showsInSystemSpaces()(v89, v66);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v90 + 8))(v64, v67);
}

uint64_t sub_10001139C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v8[2];

  v2 = a1[1];
  v8[0] = *a1;
  v1 = v8[0];
  v8[1] = v2;
  v3 = swift_allocObject(&unk_100029E40, 32, 7);
  *(_QWORD *)(v3 + 16) = v8[0];
  *(_QWORD *)(v3 + 24) = v2;
  swift_retain_n(v1, 2);
  swift_retain_n(v2, 2);
  v4 = sub_1000024DC(&qword_10002CC60);
  v5 = sub_100004CFC(&qword_10002CC58, &qword_10002CC60, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v6 = sub_100010DB4();
  return ControlWidgetButton.init<>(action:label:)(v8, sub_1000117F4, v3, v4, &type metadata for RunShortcutIntent, v5, v6);
}

uint64_t sub_100011464(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  _BYTE v4[16];
  uint64_t v5;
  uint64_t v6;

  v5 = a1;
  v6 = a2;
  v3[2] = a1;
  v3[3] = a2;
  return Label.init(title:icon:)(sub_1000117FC, v4, sub_100011804, v3, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_1000114C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  IntentParameter.wrappedValue.getter(&v20);
  v2 = v20;
  if (v20)
  {
    v3 = v21;
    v4 = v22;
    v5 = v23;
    v6 = v24;
    v7 = v25;
    EntityProperty.wrappedValue.getter(&v20);
    swift_release(v4);
    swift_release(v3);
    swift_release(v2);
    v8 = v20;
    v9 = v21;
    swift_release(v7);
    swift_release(v6);
    swift_release(v5);
  }
  else
  {
    v10 = String._bridgeToObjectiveC()();
    v11 = String._bridgeToObjectiveC()();
    v12 = String._bridgeToObjectiveC()();
    v13 = sub_10001EE30(v10, v11);

    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v9 = v14;

  }
  v20 = v8;
  v21 = v9;
  v15 = sub_100004D3C();
  result = Text.init<A>(_:)(&v20, &type metadata for String, v15);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 16) = v18 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_100011624@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t result;
  uint64_t *v18;
  _QWORD v19[6];

  v2 = 0xD000000000000013;
  IntentParameter.wrappedValue.getter(v19);
  v3 = v19[0];
  v4 = 0x8000000100020400;
  if (v19[0])
  {
    v18 = a1;
    v5 = v19[1];
    v6 = v19[2];
    v7 = v19[3];
    v8 = v19[4];
    v9 = v19[5];
    sub_10000E510();
    v11 = v10;
    swift_release(v9);
    swift_release(v8);
    swift_release(v7);
    swift_release(v6);
    swift_release(v5);
    swift_release(v3);
    v12 = objc_msgSend(v11, "icon");

    if (v12)
    {
      v13 = objc_opt_self(WFSymbolIcon);
      v14 = (void *)swift_dynamicCastObjCClass(v12, v13);
      if (v14)
      {
        v15 = objc_msgSend(v14, "symbolName");

        v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        v4 = v16;

        a1 = v18;
        goto LABEL_7;
      }

      v4 = 0x8000000100020400;
    }
    a1 = v18;
    v2 = 0xD000000000000013;
  }
LABEL_7:
  result = Image.init(_internalSystemName:)(v2, v4);
  *a1 = result;
  return result;
}

unint64_t sub_10001178C()
{
  unint64_t result;

  result = qword_10002D4D0;
  if (!qword_10002D4D0)
  {
    result = swift_getWitnessTable(&unk_1000233D4, &type metadata for RunShortcutIntent);
    atomic_store(result, (unint64_t *)&qword_10002D4D0);
  }
  return result;
}

uint64_t sub_1000117C8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000117F4()
{
  uint64_t v0;

  return sub_100011464(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000117FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000114C0(a1);
}

uint64_t sub_100011804@<X0>(uint64_t *a1@<X8>)
{
  return sub_100011624(a1);
}

uint64_t sub_10001180C()
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;

  v0 = sub_100002608(&qword_10002D4C0);
  v1 = sub_100002608(&qword_10002D4B8);
  v2 = sub_100002608(&qword_10002D4B0);
  v3 = sub_100002608(&qword_10002D4A8);
  v4 = sub_100002608(&qword_10002D4A0);
  v5 = sub_100004CFC(&qword_10002D4E0, &qword_10002D4A0, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  v12 = sub_100009BC0(v5, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, v6, v7, v8, v9, v10, v11, v4);
  v19 = sub_100009BC0(v12, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, v13, v14, v15, v16, v17, v18, v3);
  v26 = sub_100009BC0(v19, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.preferredControlSize(_:)>>, v20, v21, v22, v23, v24, v25, v2);
  v40 = sub_100009BC0(v26, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.promptsForUserConfiguration()>>, v27, v28, v29, v30, v31, v32, v1);
  return sub_100009BC0(v40, (uint64_t)&opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>, v33, v34, v35, v36, v37, v38, v0);
}

uint64_t sub_1000118F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(a1, 0x6E65746E49707041, 0xEA00000000007374, v1, v2, 0, 0, 256);
}

char *sub_100011928(char *a1, char **a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v11[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v11);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v7 = type metadata accessor for SStackFill(0);
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = a3;
      v10 = 1;
    }
    else
    {
      v12 = *a2;
      v13 = a2[1];
      *(_QWORD *)a1 = v12;
      *((_QWORD *)a1 + 1) = v13;
      v14 = v12;
      v15 = v13;
      v8 = a1;
      v9 = a3;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  return a1;
}

void sub_1000119E8(id *a1, uint64_t a2)
{
  uint64_t v3;

  if (swift_getEnumCaseMultiPayload(a1, a2) == 1)
  {
    v3 = type metadata accessor for SStackFill(0);
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else
  {

  }
}

_QWORD *sub_100011A40(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for SStackFill(0);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = a1;
    v8 = a3;
    v9 = 1;
  }
  else
  {
    v10 = *(void **)a2;
    v11 = *(void **)(a2 + 8);
    *a1 = v10;
    a1[1] = v11;
    v12 = v10;
    v13 = v11;
    v7 = a1;
    v8 = a3;
    v9 = 0;
  }
  swift_storeEnumTagMultiPayload(v7, v8, v9);
  return a1;
}

void **sub_100011AD4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (a1 != a2)
  {
    sub_100011B80((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for SStackFill(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = a1;
      v8 = a3;
      v9 = 1;
    }
    else
    {
      v10 = *a2;
      *a1 = *a2;
      v11 = a2[1];
      a1[1] = v11;
      v12 = v10;
      v13 = v11;
      v7 = a1;
      v8 = a3;
      v9 = 0;
    }
    swift_storeEnumTagMultiPayload(v7, v8, v9);
  }
  return a1;
}

uint64_t sub_100011B80(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WidgetSStackView.Content(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for WidgetSStackView.Content(uint64_t a1)
{
  return sub_100007E88(a1, qword_10002D558, (uint64_t)&nominal type descriptor for WidgetSStackView.Content);
}

void *sub_100011BD0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for SStackFill(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100011C5C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_100011B80((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for SStackFill(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100011CF8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_100023468;
  result = type metadata accessor for SStackFill(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

char *sub_100011D68(char *a1, char **a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v12[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v12);
  }
  else
  {
    v7 = type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for SStackFill(0);
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      v14 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v14;
      v15 = v13;
      v16 = v14;
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v17 = *(int *)(a3 + 20);
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for SStackFill(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_100011E68(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4 = type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for SStackFill(0);
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {

  }
  v6 = (char *)a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for SStackFill(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_100011EF4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for SStackFill(0);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *(void **)a2;
    v12 = *(void **)(a2 + 8);
    *a1 = *(_QWORD *)a2;
    a1[1] = v12;
    v13 = v11;
    v14 = v12;
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v15 = *(int *)(a3 + 20);
  v16 = (char *)a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for SStackFill(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

void **sub_100011FC8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  if (a1 != a2)
  {
    sub_100011B80((uint64_t)a1);
    v6 = type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for SStackFill(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      v12 = a2[1];
      a1[1] = v12;
      v13 = v11;
      v14 = v12;
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v15 = *(int *)(a3 + 20);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = type metadata accessor for SStackFill(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

char *sub_1000120B4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for SStackFill(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for SStackFill(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_100012178(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_100011B80((uint64_t)a1);
    v6 = type metadata accessor for WidgetSStackView.Content(0);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for SStackFill(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for SStackFill(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10001224C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012258);
}

uint64_t sub_100012258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_100012D78();
  if (v7 == (_DWORD)v3)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    v8 = sub_100012D70();
    v9 = v4 + *(int *)(a3 + 20);
  }
  return sub_100002A8C(v9, v3, v8);
}

uint64_t sub_1000122A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000122B4);
}

uint64_t sub_1000122B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_100012D78();
  if (v9 == a3)
  {
    v10 = v8;
    v11 = v5;
  }
  else
  {
    v10 = sub_100012D70();
    v11 = v5 + *(int *)(a4 + 20);
  }
  return sub_10000251C(v11, v4, v4, v10);
}

uint64_t type metadata accessor for WidgetSStackView(uint64_t a1)
{
  return sub_100007E88(a1, qword_10002D5E8, (uint64_t)&nominal type descriptor for WidgetSStackView);
}

uint64_t sub_100012320(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for WidgetSStackView.Content(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for SStackFill(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000123A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000248A8, 1);
}

uint64_t sub_1000123B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t OpaqueTypeConformance2;
  _QWORD v8[2];

  v0 = sub_100012D9C();
  __chkstk_darwin(v0);
  sub_100012D60();
  v1 = sub_100012DB4((uint64_t)&unk_100029EB0);
  sub_100012DA8(v1);
  sub_100012D60();
  v2 = sub_100012DB4((uint64_t)&unk_100029ED8);
  sub_100012DA8(v2);
  v3 = sub_1000024DC(&qword_10002D620);
  v4 = sub_1000024DC(&qword_10002D628);
  v5 = sub_100012BCC();
  v8[0] = type metadata accessor for IconShape(255);
  v8[1] = sub_100012C7C();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v8, &opaque type descriptor for <<opaque return type of Shape.fill(_:)>>, 1);
  return SStackView.init(top:bottom:)(sub_100012AA4, v1, sub_100012B7C, v2, v3, v4, v5, OpaqueTypeConformance2);
}

uint64_t sub_1000124EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  uint64_t (**v15)@<X0>(uint64_t@<X8>);
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t (*v19)(_QWORD);
  uint64_t (*v20)(char *, _OWORD *, uint64_t);
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
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

  v43 = a2;
  v41 = type metadata accessor for IconShape(0);
  v38 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_1000024DC(&qword_10002D628);
  v39 = *(_QWORD *)(v42 - 8);
  v5 = __chkstk_darwin(v42);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v36 - v8;
  v10 = type metadata accessor for SStackFill(0);
  v40 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000024DC(&qword_10002D650);
  __chkstk_darwin(v13);
  v15 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = type metadata accessor for WidgetSStackView.Content(0);
  __chkstk_darwin(v16);
  v18 = (_OWORD *)((char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100012CBC(a1, (uint64_t)v18, v19);
  if (swift_getEnumCaseMultiPayload(v18, v16) == 1)
  {
    v20 = *(uint64_t (**)(char *, _OWORD *, uint64_t))(v40 + 32);
    v37 = v12;
    v21 = v20(v12, v18, v10);
    IconShape.init(insetFraction:)(v21, 0.0);
    v22 = sub_100012C7C();
    v23 = v12;
    v24 = v41;
    Shape.fill(_:)(v23, v41, v22);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v4, v24);
    v38 = v10;
    v25 = v39;
    v26 = v42;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v9, v7, v42);
    (*(void (**)(uint64_t (**)@<X0>(uint64_t@<X8>), char *, uint64_t))(v25 + 16))(v15, v9, v26);
    swift_storeEnumTagMultiPayload(v15, v13, 1);
    v27 = sub_1000024DC(&qword_10002D640);
    v28 = sub_100004CFC(&qword_10002D638, &qword_10002D640, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v44 = v24;
    v45 = v22;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of Shape.fill(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v15, v27, v26, v28, OpaqueTypeConformance2);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v37, v38);
  }
  else
  {
    v31 = swift_allocObject(&unk_100029F00, 32, 7);
    *(_OWORD *)(v31 + 16) = *v18;
    *v15 = sub_100012D2C;
    v15[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v31;
    swift_storeEnumTagMultiPayload(v15, v13, 0);
    v32 = sub_1000024DC(&qword_10002D640);
    v33 = sub_100004CFC(&qword_10002D638, &qword_10002D640, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v34 = sub_100012C7C();
    v44 = v41;
    v45 = v34;
    v35 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of Shape.fill(_:)>>, 1);
    return _ConditionalContent<>.init(storage:)(v15, v32, v42, v33, v35);
  }
}

uint64_t sub_100012870@<X0>(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  id v13;
  id v14;
  _QWORD v16[2];

  v16[1] = a3;
  v5 = type metadata accessor for IconView.DisplayMode(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IconSize(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (double *)((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = a1;
  *v12 = GeometryProxy.size.getter();
  (*(void (**)(double *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for IconSize.sstack(_:), v9);
  *(_QWORD *)v8 = a2;
  v8[8] = 1;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for IconView.DisplayMode.customColor(_:), v5);
  v14 = a2;
  return IconView.init(_:size:displayMode:animated:)(v13, v12, v8, 1);
}

uint64_t sub_1000129A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for IconShape(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  IconShape.init(insetFraction:)(v4, 0.0);
  v7 = a1 + *(int *)(type metadata accessor for WidgetSStackView(0) + 20);
  v8 = sub_100012C7C();
  Shape.fill(_:)(v7, v2, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100012A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WidgetSStackView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012AA4()
{
  return sub_100012B88((uint64_t (*)(uint64_t))sub_1000124EC);
}

uint64_t sub_100012AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v1 = type metadata accessor for WidgetSStackView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (id *)(v0 + v4);
  v7 = type metadata accessor for WidgetSStackView.Content(0);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = sub_100012D70();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {

  }
  v9 = (char *)v6 + *(int *)(v1 + 20);
  v10 = sub_100012D70();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100012B7C()
{
  return sub_100012B88(sub_1000129A4);
}

uint64_t sub_100012B88(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_100012D9C() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

unint64_t sub_100012BCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10002D630;
  if (!qword_10002D630)
  {
    v1 = sub_100002608(&qword_10002D620);
    sub_100004CFC(&qword_10002D638, &qword_10002D640, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v2[0] = type metadata accessor for IconShape(255);
    v2[1] = sub_100012C7C();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of Shape.fill(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D630);
  }
  return result;
}

unint64_t sub_100012C7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D648;
  if (!qword_10002D648)
  {
    v1 = type metadata accessor for IconShape(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for IconShape, v1);
    atomic_store(result, (unint64_t *)&qword_10002D648);
  }
  return result;
}

uint64_t sub_100012CBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012D00()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012D2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100012870(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_100012D34()
{
  return sub_100004CFC(&qword_10002D658, &qword_10002D660, (uint64_t)&protocol conformance descriptor for SStackView<A, B>);
}

uint64_t sub_100012D60()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  return sub_100012CBC(v0, v2, v1);
}

uint64_t sub_100012D70()
{
  return type metadata accessor for SStackFill(0);
}

uint64_t sub_100012D78()
{
  return type metadata accessor for WidgetSStackView.Content(0);
}

uint64_t sub_100012D9C()
{
  return type metadata accessor for WidgetSStackView(0);
}

uint64_t sub_100012DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_100012A60(v1, a1 + v2);
}

uint64_t sub_100012DB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return swift_allocObject(a1, v1, v2);
}

uint64_t sub_100012DC0()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[16];

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = &v19[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_1000024DC((uint64_t *)&unk_10002DCC0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v13);
  v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000E074(v16, qword_100030EE0);
  sub_10000E05C(v16, (uint64_t)qword_100030EE0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE900000000000073);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v12, v9, 0, 0, 256);
  sub_10000251C((uint64_t)v5, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v5);
}

uint64_t sub_100012FDC()
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
  uint64_t v13;
  char *v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t result;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v0 = sub_1000024DC(&qword_10002D468);
  __chkstk_darwin(v0);
  v84 = (uint64_t)&v69 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for String.LocalizationValue(0);
  v3 = __chkstk_darwin(v2);
  v80 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v81 = (char *)&v69 - v6;
  v7 = __chkstk_darwin(v5);
  v74 = (char *)&v69 - v8;
  v9 = __chkstk_darwin(v7);
  v77 = (char *)&v69 - v10;
  v11 = __chkstk_darwin(v9);
  v82 = (uint64_t)&v69 - v12;
  __chkstk_darwin(v11);
  v14 = (char *)&v69 - v13;
  v15 = sub_1000024DC((uint64_t *)&unk_10002DCC0);
  v16 = __chkstk_darwin(v15);
  v79 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v76 = (char *)&v69 - v19;
  __chkstk_darwin(v18);
  v72 = (char *)&v69 - v20;
  v21 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = v21;
  __chkstk_darwin(v21);
  v25 = (char *)&v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for Locale(0);
  __chkstk_darwin(v26);
  v28 = (char *)&v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = type metadata accessor for LocalizedStringResource(0);
  v29 = __chkstk_darwin(v85);
  v75 = (char *)&v69 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __chkstk_darwin(v29);
  v73 = (char *)&v69 - v32;
  __chkstk_darwin(v31);
  v34 = (char *)&v69 - v33;
  v35 = sub_1000024DC(&qword_10002D730);
  v36 = sub_1000024DC(&qword_10002D738);
  v37 = *(_QWORD *)(v36 - 8);
  v83 = v36;
  v71 = *(_QWORD *)(v37 + 72);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = (v38 + 32) & ~v38;
  v40 = swift_allocObject(v35, v39 + 3 * v71, v38 | 7);
  v78 = v40;
  *(_OWORD *)(v40 + 16) = xmmword_100022930;
  v41 = v40 + v39;
  *(_BYTE *)(v40 + v39) = 0;
  v42 = String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE900000000000073);
  static Locale.current.getter(v42);
  v43 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v44 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 104);
  v69 = v23;
  v44(v25, enum case for LocalizedStringResource.BundleDescription.main(_:), v23);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  v45 = v82;
  v46 = String.LocalizationValue.init(stringLiteral:)(0x74756374726F6853, 0xE900000000000073);
  v70 = v41;
  static Locale.current.getter(v46);
  v44(v25, v43, v23);
  v47 = (uint64_t)v72;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v45, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  v48 = v47;
  sub_10000251C(v47, 0, 1, v85);
  v82 = type metadata accessor for DisplayRepresentation.Image(0);
  v49 = v84;
  sub_10000251C(v84, 1, 1, v82);
  DisplayRepresentation.init(title:subtitle:image:)(v34, v48, v49);
  v50 = v71;
  *(_BYTE *)(v41 + v71) = 1;
  v51 = v74;
  v52 = String.LocalizationValue.init(stringLiteral:)(0x6465636E61766441, 0xE800000000000000);
  static Locale.current.getter(v52);
  v53 = v69;
  v44(v25, v43, v69);
  v54 = v73;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v51, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  v55 = v77;
  v56 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000016, 0x80000001000204B0);
  static Locale.current.getter(v56);
  v44(v25, v43, v53);
  v57 = (uint64_t)v76;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v55, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  v58 = v57;
  sub_10000251C(v57, 0, 1, v85);
  v59 = v84;
  sub_10000251C(v84, 1, 1, v82);
  DisplayRepresentation.init(title:subtitle:image:)(v54, v58, v59);
  *(_BYTE *)(v70 + 2 * v50) = 2;
  v60 = v80;
  v61 = String.LocalizationValue.init(stringLiteral:)(0x6F4E206C6167654CLL, 0xED00007365636974);
  static Locale.current.getter(v61);
  v44(v25, v43, v53);
  v62 = v75;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v60, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  v63 = v81;
  v64 = String.LocalizationValue.init(stringLiteral:)(0x100000000000001BLL, 0x80000001000204D0);
  static Locale.current.getter(v64);
  v44(v25, v43, v53);
  v65 = (uint64_t)v79;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v63, 0x6E65746E49707041, 0xEA00000000007374, v28, v25, 0, 0, 256);
  sub_10000251C(v65, 0, 1, v85);
  sub_10000251C(v59, 1, 1, v82);
  DisplayRepresentation.init(title:subtitle:image:)(v62, v65, v59);
  v66 = type metadata accessor for DisplayRepresentation(0);
  v67 = sub_100013F7C();
  result = Dictionary.init(dictionaryLiteral:)(v78, &type metadata for ShortcutsStaticDeepLinks, v66, v67);
  qword_100030EF8 = result;
  return result;
}

uint64_t *sub_100013720()
{
  if (qword_10002CA08 != -1)
    swift_once(&qword_10002CA08, sub_100012FDC);
  return &qword_100030EF8;
}

uint64_t sub_100013760()
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

  v0 = sub_1000024DC(&qword_10002D740);
  sub_10000E074(v0, qword_100030F00);
  sub_10000E05C(v0, (uint64_t)qword_100030F00);
  v1 = sub_1000024DC(&qword_10002D748);
  v2 = *(_QWORD *)(sub_1000024DC(&qword_10002D750) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v1, v5 + 3 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100022930;
  v7 = v6 + v5;
  *(_BYTE *)(v6 + v5) = 0;
  v8 = sub_100013BB4();
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000041, 0x80000001000204F0, &type metadata for ShortcutsStaticDeepLinks, v8);
  *(_BYTE *)(v7 + v3) = 1;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000005BLL, 0x8000000100020540, &type metadata for ShortcutsStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 2 * v3) = 2;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000051, 0x80000001000205A0, &type metadata for ShortcutsStaticDeepLinks, v8);
  v9 = sub_1000024DC(&qword_10002D758);
  v10 = sub_100013F7C();
  v11 = Dictionary.init(dictionaryLiteral:)(v6, &type metadata for ShortcutsStaticDeepLinks, v9, v10);
  return _EnumURLRepresentation.init(_:)(v11, &type metadata for ShortcutsStaticDeepLinks, v8);
}

uint64_t sub_100013914()
{
  uint64_t v0;

  if (qword_10002CA10 != -1)
    swift_once(&qword_10002CA10, sub_100013760);
  v0 = sub_1000024DC(&qword_10002D740);
  return sub_10000E05C(v0, (uint64_t)qword_100030F00);
}

unint64_t sub_100013960(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100029248, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t sub_1000139A8(char a1)
{
  return *(_QWORD *)&aRoot_1[8 * a1];
}

uint64_t sub_1000139C8(char *a1, char *a2)
{
  return sub_10001E304(*a1, *a2);
}

unint64_t sub_1000139D8()
{
  unint64_t result;

  result = qword_10002D668;
  if (!qword_10002D668)
  {
    result = swift_getWitnessTable(&unk_1000234FC, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D668);
  }
  return result;
}

Swift::Int sub_100013A14()
{
  char *v0;

  return sub_100013A1C(*v0);
}

Swift::Int sub_100013A1C(char a1)
{
  return sub_100013ACC(0, a1);
}

void sub_100013A28()
{
  _QWORD *v0;
  _QWORD v1[9];

  v0 = Hasher.init(_seed:)(v1, 0);
  sub_100014B80((uint64_t)v0);
  Hasher._finalize()();
  sub_100014BB8();
}

uint64_t sub_100013A58(uint64_t a1)
{
  char *v1;

  return sub_100013A84(a1, *v1);
}

uint64_t sub_100013A60(uint64_t a1)
{
  return String.hash(into:)(a1, 0x726F68732D6C6C61, 0xED00007374756374);
}

uint64_t sub_100013A84(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)&aAdvancedlegaln[8 * a2 + 16];
  String.hash(into:)(a1, *(_QWORD *)&aRoot_1[8 * a2], v2);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_100013AC4(uint64_t a1)
{
  char *v1;

  return sub_100013ACC(a1, *v1);
}

Swift::Int sub_100013ACC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = *(_QWORD *)&aRoot_1[8 * a2];
  v4 = *(_QWORD *)&aAdvancedlegaln[8 * a2 + 16];
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_100013B30(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v2[9];

  v1 = Hasher.init(_seed:)(v2, a1);
  sub_100014B80((uint64_t)v1);
  Hasher._finalize()();
  sub_100014BB8();
}

unint64_t sub_100013B5C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100013960(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100013B88@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000139A8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100013BB4()
{
  unint64_t result;

  result = qword_10002D670;
  if (!qword_10002D670)
  {
    result = swift_getWitnessTable(&unk_1000235D4, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D670);
  }
  return result;
}

unint64_t sub_100013BF4()
{
  unint64_t result;

  result = qword_10002D678;
  if (!qword_10002D678)
  {
    result = swift_getWitnessTable(&unk_100023614, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D678);
  }
  return result;
}

uint64_t sub_100013C30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100013914();
  v3 = sub_1000024DC(&qword_10002D740);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

unint64_t sub_100013C78()
{
  unint64_t result;

  result = qword_10002D680;
  if (!qword_10002D680)
  {
    result = swift_getWitnessTable(&unk_10002363C, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D680);
  }
  return result;
}

unint64_t sub_100013CB8()
{
  unint64_t result;

  result = qword_10002D688;
  if (!qword_10002D688)
  {
    result = swift_getWitnessTable(&unk_100023674, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D688);
  }
  return result;
}

unint64_t sub_100013CF8()
{
  unint64_t result;

  result = qword_10002D690;
  if (!qword_10002D690)
  {
    result = swift_getWitnessTable(&unk_100023564, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D690);
  }
  return result;
}

void *sub_100013D34()
{
  return &protocol witness table for String;
}

uint64_t sub_100013D40(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100014B30();
  v4 = _URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100014B6C(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100013D8C()
{
  unint64_t result;

  result = qword_10002D6A0;
  if (!qword_10002D6A0)
  {
    result = swift_getWitnessTable(&unk_1000236A4, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6A0);
  }
  return result;
}

unint64_t sub_100013DCC()
{
  unint64_t result;

  result = qword_10002D6A8;
  if (!qword_10002D6A8)
  {
    result = swift_getWitnessTable(&unk_1000236CC, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6A8);
  }
  return result;
}

unint64_t sub_100013E0C()
{
  unint64_t result;

  result = qword_10002D6B0;
  if (!qword_10002D6B0)
  {
    result = swift_getWitnessTable(&unk_1000236F4, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6B0);
  }
  return result;
}

unint64_t sub_100013E4C()
{
  unint64_t result;

  result = qword_10002D6B8;
  if (!qword_10002D6B8)
  {
    result = swift_getWitnessTable(&unk_10002374C, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6B8);
  }
  return result;
}

uint64_t sub_100013E88@<X0>(uint64_t a1@<X8>)
{
  return sub_1000147A8(&qword_10002CA00, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100030EE0, (uint64_t)sub_100012DC0, a1);
}

uint64_t sub_100013EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014744(a1, a2, a3, (uint64_t (*)(void))sub_100013BB4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_100013EC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100013BB4();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100013EFC()
{
  unint64_t result;

  result = qword_10002D6C0;
  if (!qword_10002D6C0)
  {
    result = swift_getWitnessTable(&unk_10002378C, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6C0);
  }
  return result;
}

unint64_t sub_100013F3C()
{
  unint64_t result;

  result = qword_10002D6C8;
  if (!qword_10002D6C8)
  {
    result = swift_getWitnessTable(&unk_1000237B4, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6C8);
  }
  return result;
}

unint64_t sub_100013F7C()
{
  unint64_t result;

  result = qword_10002D6D0;
  if (!qword_10002D6D0)
  {
    result = swift_getWitnessTable(&unk_100023524, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6D0);
  }
  return result;
}

uint64_t sub_100013FB8()
{
  sub_100013720();
  return swift_bridgeObjectRetain(qword_100030EF8);
}

uint64_t sub_100013FD4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100013E4C();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100014010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D6D8;
  if (!qword_10002D6D8)
  {
    v1 = sub_100002608(&qword_10002D6E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002D6D8);
  }
  return result;
}

void sub_100014054(_QWORD *a1@<X8>)
{
  *a1 = &off_1000292B0;
}

unint64_t sub_100014068()
{
  unint64_t result;

  result = qword_10002D6E8;
  if (!qword_10002D6E8)
  {
    result = swift_getWitnessTable(&unk_1000238BC, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6E8);
  }
  return result;
}

uint64_t sub_1000140A4()
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
  sub_10000E074(v10, qword_100030F18);
  sub_10000E05C(v10, (uint64_t)qword_100030F18);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x8000000100020490);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0x6E65746E49707041, 0xEA00000000007374, v6, v3, 0, 0, 256);
}

uint64_t sub_100014224(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  if (*a1 != -1)
    swift_once(a1, a4);
  v6 = a2(0);
  return sub_10000E05C(v6, a3);
}

uint64_t sub_100014268()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100014298(char a1)
{
  char v2;

  v2 = a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_1000142C8()
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
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v37 = *(_QWORD *)(v0 - 8);
  v38 = v0;
  __chkstk_darwin(v0);
  sub_10000265C();
  v36 = v2 - v1;
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v34 - v7;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v9);
  sub_10000265C();
  v12 = v11 - v10;
  v13 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10000265C();
  v17 = v16 - v15;
  type metadata accessor for Locale(0);
  sub_10000264C();
  __chkstk_darwin(v18);
  sub_10000265C();
  v21 = v20 - v19;
  type metadata accessor for String.LocalizationValue(0);
  sub_10000264C();
  __chkstk_darwin(v22);
  sub_10000265C();
  v25 = v24 - v23;
  v26 = type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v27);
  sub_10000265C();
  v30 = v29 - v28;
  String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100020470);
  v35 = sub_1000024DC(&qword_10002D710);
  static Locale.current.getter(v35);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v17, enum case for LocalizedStringResource.BundleDescription.main(_:), v13);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v25, 0x6E65746E49707041, 0xEA00000000007374, v21, v17, 0, 0, 256);
  sub_10000251C(v12, 1, 1, v26);
  v39[0] = 3;
  type metadata accessor for IntentDialog(0);
  sub_100014BA8((uint64_t)v8);
  sub_100014BA8((uint64_t)v6);
  v31 = v36;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v36, enum case for InputConnectionBehavior.default(_:), v38);
  v32 = sub_100013BB4();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v30, v12, v39, v8, v6, v31, &off_1000292B0, v32);
}

uint64_t sub_100014564@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_100014268();
  *a1 = result;
  return result;
}

uint64_t sub_10001458C(char *a1)
{
  return sub_100014298(*a1);
}

void (*sub_100014598(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_1000145E0;
}

void sub_1000145E0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100014614()
{
  unint64_t result;

  result = qword_10002D6F0;
  if (!qword_10002D6F0)
  {
    result = swift_getWitnessTable(&unk_1000238E4, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6F0);
  }
  return result;
}

uint64_t sub_100014650(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100014AB8();
  v5 = sub_100014B30();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000146B4()
{
  unint64_t result;

  result = qword_10002D6F8;
  if (!qword_10002D6F8)
  {
    result = swift_getWitnessTable(&unk_100023974, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D6F8);
  }
  return result;
}

unint64_t sub_1000146F4()
{
  unint64_t result;

  result = qword_10002D700;
  if (!qword_10002D700)
  {
    result = swift_getWitnessTable(&unk_10002399C, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D700);
  }
  return result;
}

uint64_t sub_100014730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014744(a1, a2, a3, (uint64_t (*)(void))sub_100014614, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_100014744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t sub_100014784@<X0>(uint64_t a1@<X8>)
{
  return sub_1000147A8(&qword_10002CA18, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100030F18, (uint64_t)sub_1000140A4, a1);
}

uint64_t sub_1000147A8@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_100014224(a1, a2, a3, a4);
  v8 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v7, v8);
}

uint64_t sub_100014804(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100014AB8();
  v7 = sub_100014AF4();
  v8 = sub_100014B30();
  *v5 = v2;
  v5[1] = sub_100014890;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100014890()
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

uint64_t sub_1000148EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000142C8();
  *a1 = result;
  return result;
}

uint64_t sub_100014910(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014614();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenShortcutsStaticDeepLinks()
{
  return &type metadata for OpenShortcutsStaticDeepLinks;
}

_BYTE *initializeBufferWithCopyOfBuffer for ShortcutsStaticDeepLinks(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShortcutsStaticDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ShortcutsStaticDeepLinks(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100014A28 + 4 * byte_1000234F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100014A5C + 4 * byte_1000234F0[v4]))();
}

uint64_t sub_100014A5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100014A64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100014A6CLL);
  return result;
}

uint64_t sub_100014A78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100014A80);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100014A84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100014A8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100014A98(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100014AA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsStaticDeepLinks()
{
  return &type metadata for ShortcutsStaticDeepLinks;
}

unint64_t sub_100014AB8()
{
  unint64_t result;

  result = qword_10002D718;
  if (!qword_10002D718)
  {
    result = swift_getWitnessTable(&unk_1000237EC, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D718);
  }
  return result;
}

unint64_t sub_100014AF4()
{
  unint64_t result;

  result = qword_10002D720;
  if (!qword_10002D720)
  {
    result = swift_getWitnessTable(&unk_10002383C, &type metadata for OpenShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D720);
  }
  return result;
}

unint64_t sub_100014B30()
{
  unint64_t result;

  result = qword_10002D728;
  if (!qword_10002D728)
  {
    result = swift_getWitnessTable(&unk_10002359C, &type metadata for ShortcutsStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10002D728);
  }
  return result;
}

uint64_t sub_100014B6C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100014B80(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return String.hash(into:)(va, 0x726F68732D6C6C61, 0xED00007374756374);
}

uint64_t sub_100014BA8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000251C(a1, 1, 1, v1);
}

unint64_t sub_100014BC8()
{
  unint64_t result;

  result = qword_10002D7A0;
  if (!qword_10002D7A0)
  {
    result = swift_getWitnessTable(&unk_100023A7C, &unk_10002A358);
    atomic_store(result, (unint64_t *)&qword_10002D7A0);
  }
  return result;
}

uint64_t sub_100014C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_100018078();
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (uint64_t *)((char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = EntityProperty.wrappedValue.getter(v3);
  v5 = URL.absoluteString.getter(v4);
  sub_100018168((uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return v5;
}

uint64_t sub_100014C94()
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
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  Swift::String v38;

  sub_1000180D4();
  v3 = v2;
  sub_1000024DC(&qword_10002D890);
  sub_10000264C();
  __chkstk_darwin(v4);
  sub_100004ED4();
  v5 = type metadata accessor for URLComponents(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_10000266C();
  ((void (*)(uint64_t, _QWORD))URLComponents.init(url:resolvingAgainstBaseURL:))(v3, 0);
  if (sub_100002A8C(v0, 1, v5) == 1)
  {
    v7 = sub_100018078();
    sub_100018064(v7);
    sub_100017DC8(v0, &qword_10002D890);
    return 0;
  }
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v0, v5);
  v9 = ((uint64_t (*)(uint64_t))URLComponents.scheme.getter)(v8);
  v11 = v9;
  v12 = v10;
  if (qword_10002CA38 == -1)
  {
    if (!v10)
      goto LABEL_27;
  }
  else
  {
    v9 = swift_once(&qword_10002CA38, sub_100015E54);
    if (!v12)
      goto LABEL_27;
  }
  if (v11 == qword_10002D760 && v12 == *(_QWORD *)algn_10002D768)
  {
    v15 = sub_100018034();
  }
  else
  {
    v14 = sub_100018180(v9, v10, qword_10002D760, *(uint64_t *)algn_10002D768);
    v15 = sub_100018034();
    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  v16 = ((uint64_t (*)(uint64_t))URLComponents.host.getter)(v15);
  v18 = v16;
  v19 = v17;
  if (qword_10002CA40 == -1)
  {
    if (v17)
      goto LABEL_14;
LABEL_27:
    v34 = sub_100018078();
    sub_100018064(v34);
    sub_100018168(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    return 0;
  }
  v16 = swift_once(&qword_10002CA40, sub_100015E7C);
  if (!v19)
    goto LABEL_27;
LABEL_14:
  if (v18 == qword_10002D770 && v19 == *(_QWORD *)algn_10002D778)
  {
    v22 = sub_100018034();
  }
  else
  {
    v21 = sub_100018180(v16, v17, qword_10002D770, *(uint64_t *)algn_10002D778);
    v22 = sub_100018034();
    if ((v21 & 1) == 0)
      goto LABEL_27;
  }
  ((void (*)(uint64_t))URLComponents.path.getter)(v22);
  v24 = v23;
  v25 = sub_100004D3C();
  v26 = (_QWORD *)((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void *, unint64_t))StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:))(47, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, &type metadata for String, v25);
  swift_bridgeObjectRelease(v24);
  if (v26[2] < 2uLL)
  {
    sub_100018034();
    goto LABEL_27;
  }
  v27 = v26[8];
  v28 = v26[9];
  v29 = v26[10];
  v30 = v26[11];
  sub_1000181B8();
  v31 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))static String._fromSubstring(_:))(v27, v28, v29, v30);
  v33 = v32;
  swift_bridgeObjectRelease(v30);
  if (v26[2])
  {
    v30 = v26[4];
    v29 = v26[7];
    swift_bridgeObjectRetain(v29);
    sub_100018034();
    if (qword_10002CA48 == -1)
      goto LABEL_25;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_10002CA48, sub_100015E9C);
LABEL_25:
  if ((sub_100018158(qword_10002D780, *(unint64_t *)algn_10002D788, v30) & 1) != 0)
  {
    swift_bridgeObjectRelease(v29);
    v38._countAndFlagsBits = v31;
    v38._object = v33;
    sub_100015D88(v38);
    goto LABEL_27;
  }
  if (qword_10002CA50 != -1)
    swift_once(&qword_10002CA50, sub_100015EBC);
  v36 = sub_100018158(qword_10002D790, *(unint64_t *)algn_10002D798, v30);
  swift_bridgeObjectRelease(v29);
  v37 = sub_100018078();
  sub_100018064(v37);
  sub_100018168(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  if ((v36 & 1) == 0)
  {
    swift_bridgeObjectRelease(v33);
    return 0;
  }
  return v31;
}

uint64_t sub_100014FF0()
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;

  v0 = type metadata accessor for String.LocalizationValue.Placeholder(0);
  v40 = *(_QWORD *)(v0 - 8);
  v41 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v3);
  v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000024DC((uint64_t *)&unk_10002DCC0);
  __chkstk_darwin(v6);
  v42 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v9 = *(_QWORD *)(v8 - 8);
  v37[0] = v8;
  __chkstk_darwin(v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for String.LocalizationValue(0);
  v16 = __chkstk_darwin(v15);
  v38 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)v37 - v18;
  v39 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v39);
  v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000E074(v22, qword_100030F30);
  v37[1] = sub_10000E05C(v22, (uint64_t)qword_100030F30);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x7265646C6F46, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v25(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v8);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v19, 0x6E65746E49707041, 0xEA00000000007374, v14, v11, 0, 0, 256);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(8, 1);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v26);
  v28 = v40;
  v27 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v2, enum case for String.LocalizationValue.Placeholder.int(_:), v41);
  v29 = sub_100017754((uint64_t)v2);
  v31 = v30;
  String.LocalizationValue.StringInterpolation.appendInterpolation(placeholder:specifier:)(v2, v29, v30);
  swift_bridgeObjectRelease(v31);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v27);
  v32._countAndFlagsBits = 0x737265646C6F6620;
  v32._object = (void *)0xE800000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v32);
  v33 = v38;
  v34 = String.LocalizationValue.init(stringInterpolation:)(v5);
  static Locale.current.getter(v34);
  v25(v11, v24, v37[0]);
  v35 = (uint64_t)v42;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v33, 0x6E65746E49707041, 0xEA00000000007374, v14, v11, 0, 0, 256);
  sub_10000251C(v35, 0, 1, v39);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v21, v35);
}

uint64_t sub_10001538C()
{
  uint64_t v0;

  if (qword_10002CA20 != -1)
    swift_once(&qword_10002CA20, sub_100014FF0);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000E05C(v0, (uint64_t)qword_100030F30);
}

void sub_1000153D4()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;

  sub_1000180D4();
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v3);
  v4 = sub_100018134();
  v5 = type metadata accessor for LocalizedStringResource(v4);
  sub_10000264C();
  __chkstk_darwin(v6);
  sub_10000266C();
  type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  sub_10000264C();
  __chkstk_darwin(v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000024DC(&qword_10002D468);
  sub_10000264C();
  __chkstk_darwin(v10);
  sub_100018118();
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - v12;
  EntityProperty.wrappedValue.getter(&v25);
  if (v25._countAndFlagsBits < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((unint64_t)v25._countAndFlagsBits >> 16)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v24 = v5;
  v14 = (id)WFSystemImageNameForOutlineGlyphCharacter(LOWORD(v25._countAndFlagsBits));
  if (v14
    && (v15 = v14, v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14), v18 = v17, v15, v18))
  {
    swift_bridgeObjectRetain(v18);
    DisplayRepresentation.Image.init(systemName:isTemplate:)(v16, v18, 2);
    v19 = type metadata accessor for DisplayRepresentation.Image(0);
    sub_10000251C((uint64_t)v13, 0, 1, v19);
    sub_100018034();
  }
  else
  {
    v20 = type metadata accessor for DisplayRepresentation.Image(0);
    sub_10000251C((uint64_t)v13, 1, 1, v20);
  }
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v21);
  EntityProperty.wrappedValue.getter(&v25);
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v25);
  sub_100009C40();
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v22);
  LocalizedStringResource.init(stringInterpolation:)(v9);
  sub_10000251C(v0, 1, 1, v24);
  sub_100009A70((uint64_t)v13, v2, &qword_10002D468);
  DisplayRepresentation.init(title:subtitle:image:)(v1, v0, v2);
  sub_100017DC8((uint64_t)v13, &qword_10002D468);
  sub_100009BA8();
}

uint64_t sub_1000155F4()
{
  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  qword_100030F48 = qword_100030F80;
  return swift_retain(qword_100030F80);
}

uint64_t *sub_10001563C()
{
  if (qword_10002CA28 != -1)
    swift_once(&qword_10002CA28, sub_1000155F4);
  return &qword_100030F48;
}

void sub_10001567C(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (id)WFLocalizedAllShortcutsString(a1);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  sub_1000156E4();
  qword_100030F50 = v2;
  *(_QWORD *)algn_100030F58 = v3;
  qword_100030F60 = v4;
}

void sub_1000156E4()
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  sub_1000180D4();
  v16 = v0;
  v17 = v1;
  v3 = v2;
  v4 = sub_100018078();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v16 - v9;
  v11 = sub_100015818();
  v13 = v12;
  v15 = v14;
  swift_retain(v11);
  swift_retain(v13);
  swift_retain(v15);
  sub_100015A00();
  sub_100018034();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  sub_1000181F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  v18[0] = v3;
  v18[1] = v16;
  EntityProperty.wrappedValue.setter(v18);
  v18[0] = (unsigned __int16)v17;
  EntityProperty.wrappedValue.setter(v18);
  swift_release(v15);
  swift_release(v13);
  sub_100018178();
  sub_100009BA8();
}

void *sub_100015818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v1 = sub_100018078();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)v18 - v6;
  type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v8);
  sub_100018190();
  sub_1000024DC(&qword_10002D850);
  sub_100018008();
  v9 = (void *)EntityProperty<>.init(title:)(v0);
  sub_1000024DC(&qword_10002D430);
  sub_100018150();
  sub_10001803C();
  v10 = EntityProperty<>.init(title:)(v0);
  sub_1000024DC(&qword_10002D440);
  sub_100018000();
  sub_100018080();
  v11 = EntityProperty<>.init(title:)(v0);
  sub_100018150();
  sub_100018000();
  sub_1000180C4();
  sub_100015A00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  EntityProperty.wrappedValue.setter(v5);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  sub_100018170();
  swift_release(v9);
  sub_100018150();
  sub_100018000();
  v12 = sub_1000180C4();
  v13 = (id)WFLocalizedAllShortcutsString(v12);
  v14 = sub_1000181E8((uint64_t)v13);
  v16 = v15;

  v18[0] = v14;
  v18[1] = v16;
  EntityProperty.wrappedValue.setter(v18);
  sub_100018178();
  sub_100018170();
  swift_release(v9);
  v18[0] = 61456;
  sub_100018150();
  sub_100018000();
  sub_1000180C4();
  sub_1000181F0();
  sub_1000180CC(v11);
  sub_1000180CC(v10);
  sub_1000180CC((uint64_t)v9);
  return v9;
}

void sub_100015A00()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
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

  sub_1000180D4();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  sub_1000024DC(&qword_10002CBB8);
  sub_10000264C();
  __chkstk_darwin(v8);
  v9 = sub_100018134();
  v10 = type metadata accessor for URLComponents(v9);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100004ED4();
  URLComponents.init()();
  if (qword_10002CA38 != -1)
    swift_once(&qword_10002CA38, sub_100015E54);
  v12 = qword_10002D760;
  v13 = *(_QWORD *)algn_10002D768;
  sub_1000181B8();
  URLComponents.scheme.setter(v12, v13);
  if (qword_10002CA40 != -1)
    swift_once(&qword_10002CA40, sub_100015E7C);
  v14 = qword_10002D770;
  v15 = *(_QWORD *)algn_10002D778;
  sub_1000181B8();
  URLComponents.host.setter(v14, v15);
  v16 = sub_100015EDC(v5, v3);
  v18 = URLComponents.path.setter(v16, v17);
  URLComponents.url.getter(v18);
  v19 = sub_100018078();
  if (sub_100002A8C(v1, 1, v19) == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v7, v1, v19);
    sub_100009BA8();
  }
}

void sub_100015B64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[2];

  sub_1000180D4();
  v3 = v2;
  v21 = v2;
  v4 = sub_100018078();
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_100018118();
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - v7;
  type metadata accessor for LocalizedStringResource(0);
  sub_10000264C();
  __chkstk_darwin(v9);
  sub_100018190();
  sub_1000024DC(&qword_10002D850);
  sub_100018008();
  v10 = (void *)EntityProperty<>.init(title:)(v0);
  sub_1000024DC(&qword_10002D430);
  sub_100018000();
  sub_10001803C();
  v11 = EntityProperty<>.init(title:)(v0);
  v12 = (void *)sub_1000024DC(&qword_10002D440);
  sub_1000181A8();
  sub_100018080();
  v13 = EntityProperty<>.init(title:)(v0);
  swift_retain(v13);
  sub_1000181E8((uint64_t)objc_msgSend(v3, "identifier"));
  v15 = v14;

  sub_100018000();
  sub_1000181A8();
  sub_1000180C4();
  sub_100015A00();
  swift_bridgeObjectRelease(v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v1, v8, v4);
  EntityProperty.wrappedValue.setter(v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_100018178();
  swift_release(v11);
  sub_100018170();
  sub_100018000();
  sub_1000181A8();
  sub_1000180C4();
  v16 = v21;
  v17 = sub_1000181E8((uint64_t)objc_msgSend(v21, "name"));
  v19 = v18;

  v22[0] = v17;
  v22[1] = v19;
  EntityProperty.wrappedValue.setter(v22);
  sub_100018178();
  swift_release(v11);
  sub_100018170();
  sub_100018000();
  sub_1000181A8();
  sub_1000180C4();
  v22[0] = objc_msgSend(v16, "glyphCharacter");
  sub_1000181F0();
  sub_1000180CC(v13);
  sub_1000180CC(v11);
  sub_1000180CC((uint64_t)v10);

  sub_100009BA8();
}

BOOL sub_100015D88(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000292D8, v2);
  sub_100009C40();
  return v3 != 0;
}

uint64_t sub_100015DC8()
{
  return 0x726F68732D6C6C61;
}

BOOL sub_100015DFC@<W0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = sub_100015D88(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100015E30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100015DC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_100015E54()
{
  qword_10002D760 = 0x74756374726F6873;
  *(_QWORD *)algn_10002D768 = 0xE900000000000073;
}

void sub_100015E7C()
{
  qword_10002D770 = 0x746567646977;
  *(_QWORD *)algn_10002D778 = 0xE600000000000000;
}

void sub_100015E9C()
{
  qword_10002D780 = 0x6D6574737973;
  *(_QWORD *)algn_10002D788 = 0xE600000000000000;
}

void sub_100015EBC()
{
  qword_10002D790 = 0x7265646C6F66;
  *(_QWORD *)algn_10002D798 = 0xE600000000000000;
}

uint64_t sub_100015EDC(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;

  if (a2)
  {
    v2 = a2;
    v4 = sub_1000024DC(&qword_10002D858);
    v5 = sub_1000181B0(v4, 64);
    *(_OWORD *)(v5 + 16) = xmmword_100023A30;
    v6 = qword_10002CA50;
    sub_100006374();
    if (v6 != -1)
      swift_once(&qword_10002CA50, sub_100015EBC);
    v7 = &qword_10002D790;
  }
  else
  {
    v2 = 0xED00007374756374;
    a1 = 0x726F68732D6C6C61;
    v8 = sub_1000024DC(&qword_10002D858);
    v5 = sub_1000181B0(v8, 64);
    *(_OWORD *)(v5 + 16) = xmmword_100023A30;
    if (qword_10002CA48 != -1)
      swift_once(&qword_10002CA48, sub_100015E9C);
    v7 = &qword_10002D780;
  }
  v9 = v7[1];
  *(_QWORD *)(v5 + 32) = *v7;
  *(_QWORD *)(v5 + 40) = v9;
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 56) = v2;
  swift_bridgeObjectRetain(v9);
  v10 = sub_1000024DC(&qword_10002D860);
  sub_10001787C(&qword_10002D868, &qword_10002D860, (uint64_t)&protocol conformance descriptor for [A]);
  v12 = BidirectionalCollection<>.joined(separator:)(47, 0xE100000000000000, v10, v11);
  v14 = v13;
  sub_1000181E0();
  v15._countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  return 47;
}

uint64_t sub_100016074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    Hasher._combine(_:)(1uLL);
    v6 = a1;
    v7 = a2;
    v8 = a3;
  }
  else
  {
    Hasher._combine(_:)(0);
    sub_1000180A0();
  }
  return String.hash(into:)(v6, v7, v8);
}

uint64_t sub_1000160CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
    return a4 == 0;
  if (!a4)
    return 0;
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

Swift::Int sub_100016104()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  sub_1000181C0();
  Hasher.init(_seed:)(v6, 0);
  if (v0)
  {
    Hasher._combine(_:)(1uLL);
    v2 = v6;
    v3 = v1;
    v4 = v0;
  }
  else
  {
    Hasher._combine(_:)(0);
    sub_1000180A0();
  }
  String.hash(into:)(v2, v3, v4);
  return Hasher._finalize()();
}

Swift::Int sub_100016178()
{
  return sub_100016104();
}

uint64_t sub_100016180(uint64_t a1)
{
  uint64_t *v1;

  return sub_100016074(a1, *v1, v1[1]);
}

Swift::Int sub_100016188(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v7, a1);
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    v4 = v2;
    v5 = v3;
  }
  else
  {
    Hasher._combine(_:)(0);
    v4 = 0x726F68732D6C6C61;
    v5 = 0xED00007374756374;
  }
  String.hash(into:)(v7, v4, v5);
  return Hasher._finalize()();
}

uint64_t sub_100016214(uint64_t *a1, uint64_t *a2)
{
  return sub_1000160CC(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_100016228()
{
  return sub_100010C08((uint64_t)sub_100016234);
}

uint64_t sub_100016234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  if (qword_10002CA30 != -1)
    swift_once(&qword_10002CA30, sub_10001567C);
  v2 = qword_100030F50;
  v1 = *(_QWORD *)algn_100030F58;
  v3 = qword_100030F60;
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  swift_retain(qword_100030F50);
  sub_100018150();
  sub_100018000();
  return v5(v2, v1, v3);
}

uint64_t sub_1000162C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[2] = a1;
  v3[3] = a2;
  v4 = sub_100018078();
  v3[4] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[5] = v5;
  v3[6] = sub_100018104(v5);
  v3[7] = swift_task_alloc(v2);
  v6 = sub_1000024DC(&qword_10002CBB8);
  v3[8] = sub_100018104(*(_QWORD *)(v6 - 8));
  v3[9] = swift_task_alloc(v2);
  return swift_task_switch(sub_100016340, 0, 0);
}

uint64_t sub_100016340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v28 = *(_QWORD *)(v0 + 40);
    v3 = (_QWORD *)(swift_bridgeObjectRetain(v1) + 40);
    v4 = (char *)_swiftEmptyArrayStorage;
    v5 = &qword_10002CBB8;
    do
    {
      v7 = *(_QWORD *)(v0 + 64);
      v6 = *(_QWORD *)(v0 + 72);
      v8 = *(_QWORD *)(v0 + 32);
      v10 = *(v3 - 1);
      v9 = *v3;
      swift_bridgeObjectRetain(*v3);
      URL.init(string:)(v10, v9);
      sub_100009A70(v6, v7, v5);
      if (sub_100002A8C(v7, 1, v8) == 1)
      {
        sub_1000181F8();
        sub_1000181E0();
      }
      else
      {
        v11 = *(_QWORD *)(v0 + 56);
        v12 = *(_QWORD *)(v0 + 48);
        v30 = v4;
        v13 = v5;
        v14 = *(_QWORD *)(v0 + 32);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 32))(v11, *(_QWORD *)(v0 + 64), v14);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v12, v11, v14);
        v15 = sub_100014C94();
        v29 = v16;
        v17 = v14;
        v5 = v13;
        v4 = v30;
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v11, v17);
        sub_1000181F8();
        sub_1000181E0();
        if ((swift_isUniquelyReferenced_nonNull_native(v30) & 1) == 0)
          v4 = sub_100018204(0, *((_QWORD *)v30 + 2) + 1);
        v19 = *((_QWORD *)v4 + 2);
        v18 = *((_QWORD *)v4 + 3);
        if (v19 >= v18 >> 1)
          v4 = sub_100018204((char *)(v18 > 1), v19 + 1);
        *((_QWORD *)v4 + 2) = v19 + 1;
        v20 = &v4[16 * v19];
        *((_QWORD *)v20 + 4) = v15;
        *((_QWORD *)v20 + 5) = v29;
      }
      v3 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  }
  else
  {
    v4 = (char *)_swiftEmptyArrayStorage;
  }
  v22 = *(_QWORD *)(v0 + 64);
  v21 = *(_QWORD *)(v0 + 72);
  v24 = *(_QWORD *)(v0 + 48);
  v23 = *(_QWORD *)(v0 + 56);
  v25 = *(_QWORD *)(v0 + 24);
  sub_100018000();
  v26 = sub_10001654C((uint64_t)v4, v25);
  sub_100018034();
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(char *))(v0 + 8))(v26);
}

char *sub_10001654C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_release(a2);
    return (char *)_swiftEmptyArrayStorage;
  }
  v17 = swift_bridgeObjectRetain(a1);
  v4 = (_QWORD *)(v17 + 40);
  v5 = (char *)_swiftEmptyArrayStorage;
  do
  {
    v6 = *v4;
    if (*v4)
    {
      swift_bridgeObjectRetain(*v4);
      sub_1000166F0();
      v8 = v7;
      v10 = v9;
      v12 = v11;
      swift_bridgeObjectRelease(v6);
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      if (qword_10002CA30 != -1)
        swift_once(&qword_10002CA30, sub_10001567C);
      v8 = qword_100030F50;
      v10 = *(_QWORD *)algn_100030F58;
      v12 = qword_100030F60;
      swift_retain(qword_100030F50);
      swift_retain(v10);
      swift_retain(v12);
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0)
      v5 = sub_10001791C(0, *((_QWORD *)v5 + 2) + 1, 1, (uint64_t)v5);
    v14 = *((_QWORD *)v5 + 2);
    v13 = *((_QWORD *)v5 + 3);
    if (v14 >= v13 >> 1)
      v5 = sub_10001791C((char *)(v13 > 1), v14 + 1, 1, (uint64_t)v5);
    *((_QWORD *)v5 + 2) = v14 + 1;
    v15 = &v5[24 * v14];
    *((_QWORD *)v15 + 4) = v8;
    *((_QWORD *)v15 + 5) = v10;
    *((_QWORD *)v15 + 6) = v12;
LABEL_14:
    v4 += 2;
    --v3;
  }
  while (v3);
  swift_release(a2);
  swift_bridgeObjectRelease(v17);
  return v5;
}

void sub_1000166F0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  sub_1000181C0();
  sub_10001E654();
  sub_100006374();
  v0 = sub_1000181CC();
  v3 = sub_1000173E0(v0, v1, v2);
  sub_100018034();
  if (v3)
    sub_100015B64();
}

uint64_t sub_100016754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  sub_1000181C0();
  v3 = (_QWORD *)swift_task_alloc(dword_10002D8A4);
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_100010C00;
  return sub_1000167B0(v1, v0);
}

uint64_t sub_1000167B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_100010C08((uint64_t)sub_1000167C4);
}

char *sub_1000167C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;

  sub_10001E654();
  sub_100006374();
  v1 = sub_1000181CC();
  v4 = (unint64_t)sub_100017594(v1, v2, v3);
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_13:
    sub_100009C40();
    v8 = _swiftEmptyArrayStorage;
    return (char *)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v8);
  }
  v5 = sub_100010CB8();
  if (!v5)
    goto LABEL_13;
LABEL_3:
  result = sub_1000180EC();
  if ((v5 & 0x8000000000000000) == 0)
  {
    v19 = v0;
    v7 = 0;
    v8 = v20;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v4);
      else
        v9 = *(id *)(v4 + 8 * v7 + 32);
      sub_100015B64();
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v20[2];
      v16 = v20[3];
      if (v17 >= v16 >> 1)
        sub_1000106FC((char *)(v16 > 1), v17 + 1, 1);
      ++v7;
      v20[2] = v17 + 1;
      v18 = &v20[3 * v17];
      v18[4] = v11;
      v18[5] = v13;
      v18[6] = v15;
    }
    while (v5 != v7);
    sub_100009C40();
    v0 = v19;
    return (char *)(*(uint64_t (**)(_QWORD *))(v0 + 8))(v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_100016918(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_100010C08((uint64_t)sub_100016928);
}

uint64_t sub_100016928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v1 = sub_1000024DC(&qword_10002D460);
  v2 = sub_1000181B0(v1, 56);
  *(_OWORD *)(v2 + 16) = xmmword_100022850;
  if (qword_10002CA30 != -1)
    swift_once(&qword_10002CA30, sub_10001567C);
  v3 = qword_100030F50;
  v4 = *(_QWORD *)algn_100030F58;
  v5 = qword_100030F60;
  *(_QWORD *)(v2 + 32) = qword_100030F50;
  *(_QWORD *)(v2 + 40) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  swift_retain(v3);
  sub_100018000();
  sub_1000180C4();
  v6 = sub_1000169E8();
  sub_100017CEC((uint64_t)v6);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

char *sub_1000169E8()
{
  unint64_t v0;
  uint64_t v1;
  char *result;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v0 = (unint64_t)sub_10001E654();
  if (!(v0 >> 62))
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v1)
      goto LABEL_3;
LABEL_13:
    sub_100009C40();
    return (char *)_swiftEmptyArrayStorage;
  }
  v1 = sub_100010CB8();
  if (!v1)
    goto LABEL_13;
LABEL_3:
  result = sub_1000180EC();
  if ((v1 & 0x8000000000000000) == 0)
  {
    v3 = 0;
    v4 = v15;
    do
    {
      if ((v0 & 0xC000000000000001) != 0)
        specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v0);
      else
        v5 = *(id *)(v0 + 8 * v3 + 32);
      sub_100015B64();
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        sub_1000106FC((char *)(v12 > 1), v13 + 1, 1);
      ++v3;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      v14 = (_QWORD *)(v15 + 24 * v13);
      v14[4] = v7;
      v14[5] = v9;
      v14[6] = v11;
    }
    while (v1 != v3);
    sub_100009C40();
    return (char *)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016B10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc(dword_10002D89C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000F728;
  return sub_100016754();
}

unint64_t sub_100016B7C()
{
  unint64_t result;

  result = qword_10002D7B0;
  if (!qword_10002D7B0)
  {
    result = swift_getWitnessTable(&unk_100023AD4, &unk_10002A358);
    atomic_store(result, (unint64_t *)&qword_10002D7B0);
  }
  return result;
}

unint64_t sub_100016BBC()
{
  unint64_t result;

  result = qword_10002D7B8;
  if (!qword_10002D7B8)
  {
    result = swift_getWitnessTable(&unk_100023B34, &unk_10002A358);
    atomic_store(result, (unint64_t *)&qword_10002D7B8);
  }
  return result;
}

unint64_t sub_100016BFC()
{
  unint64_t result;

  result = qword_10002D7C0[0];
  if (!qword_10002D7C0[0])
  {
    result = swift_getWitnessTable(&unk_100023BA8, &unk_10002A328);
    atomic_store(result, qword_10002D7C0);
  }
  return result;
}

uint64_t sub_100016C38(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_10002D884);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000F880;
  return sub_1000162C0(a1, v4);
}

uint64_t sub_100016C8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc(dword_10002D87C);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_100010C04;
  return sub_100016918(v3);
}

unint64_t sub_100016CE0()
{
  unint64_t result;

  result = qword_10002D7D8;
  if (!qword_10002D7D8)
  {
    result = swift_getWitnessTable(&unk_100023B5C, &unk_10002A358);
    atomic_store(result, (unint64_t *)&qword_10002D7D8);
  }
  return result;
}

unint64_t sub_100016D20()
{
  unint64_t result;

  result = qword_10002D7E0;
  if (!qword_10002D7E0)
  {
    result = swift_getWitnessTable(&unk_100023CF0, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D7E0);
  }
  return result;
}

unint64_t sub_100016D60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D7E8;
  if (!qword_10002D7E8)
  {
    v1 = sub_100002608(qword_10002D7F0);
    sub_100016D20();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002D7E8);
  }
  return result;
}

uint64_t sub_100016DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100014BC8();
  *v5 = v2;
  v5[1] = sub_10000FA5C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100016E30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc(dword_10002D874);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100016E78;
  return sub_100016228();
}

uint64_t sub_100016E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v7;
  uint64_t v9;

  sub_1000181C0();
  v7 = *(_QWORD **)(*v5 + 16);
  v9 = *v5;
  swift_task_dealloc(*(_QWORD *)(*v5 + 24));
  *v7 = v4;
  v7[1] = v3;
  v7[2] = a3;
  return (*(uint64_t (**)(void))(v9 + 8))();
}

void *sub_100016ED8@<X0>(_QWORD *a1@<X8>)
{
  void *result;
  uint64_t v3;
  uint64_t v4;

  result = sub_100015818();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

unint64_t sub_100016F04()
{
  unint64_t result;

  result = qword_10002D808;
  if (!qword_10002D808)
  {
    result = swift_getWitnessTable(&unk_100023C00, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D808);
  }
  return result;
}

unint64_t sub_100016F44()
{
  unint64_t result;

  result = qword_10002D810;
  if (!qword_10002D810)
  {
    result = swift_getWitnessTable(&unk_100023C38, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D810);
  }
  return result;
}

unint64_t sub_100016F84()
{
  unint64_t result;

  result = qword_10002D818;
  if (!qword_10002D818)
  {
    result = swift_getWitnessTable(&unk_100023C68, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D818);
  }
  return result;
}

uint64_t sub_100016FC0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_10001563C();
  v2 = qword_100030F48;
  *a1 = qword_100030F48;
  return swift_retain(v2);
}

unint64_t sub_100016FF0()
{
  unint64_t result;

  result = qword_10002D820;
  if (!qword_10002D820)
  {
    result = swift_getWitnessTable(&unk_100023CA0, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D820);
  }
  return result;
}

unint64_t sub_100017030()
{
  unint64_t result;

  result = qword_10002D828;
  if (!qword_10002D828)
  {
    result = swift_getWitnessTable(&unk_100023CC8, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D828);
  }
  return result;
}

unint64_t sub_100017070()
{
  unint64_t result;

  result = qword_10002D830;
  if (!qword_10002D830)
  {
    result = swift_getWitnessTable(&unk_100023D48, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D830);
  }
  return result;
}

uint64_t sub_1000170AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100014C04();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000170D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10001538C();
  v3 = type metadata accessor for TypeDisplayRepresentation(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

void sub_100017114()
{
  sub_10001787C(&qword_10002D838, &qword_10002D840, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100017140(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016BFC();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001717C()
{
  unint64_t result;

  result = qword_10002D848;
  if (!qword_10002D848)
  {
    result = swift_getWitnessTable(&unk_100023D78, &unk_10002A328);
    atomic_store(result, (unint64_t *)&qword_10002D848);
  }
  return result;
}

void sub_1000171B8()
{
  sub_1000153D4();
}

uint64_t sub_1000171C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017070();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000171FC(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  return swift_release(a1[2]);
}

uint64_t *sub_10001722C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  swift_retain(v3);
  swift_retain(v4);
  sub_100018000();
  return a1;
}

uint64_t *sub_100017274(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 sub_1000172E8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *sub_1000172FC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t sub_100017348(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100017388(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ConfiguredCollection()
{
  sub_100004FDC();
}

void type metadata accessor for ConfiguredCollection.SortedVisibleCollectionsQuery()
{
  sub_100004FDC();
}

void *sub_1000173E0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  unint64_t v23;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_20;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v20))
  {
    v22 = v5;
    v23 = v5 & 0xC000000000000001;
    v7 = 4;
    while (1)
    {
      v8 = v23 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v5) : *(id *)(v5 + 8 * v7);
      v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v10 = v6;
      v11 = v8;
      v12 = a3;
      v13 = objc_msgSend(v8, "identifier");
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v16 = v15;

      a3 = v12;
      v17 = v14 == a2 && v16 == v12;
      if (v17)
      {
        swift_bridgeObjectRelease(v22);
        v19 = v12;
LABEL_18:
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v19);
        return v11;
      }
      v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, a2, v12, 0);
      swift_bridgeObjectRelease(v16);
      if ((v18 & 1) != 0)
      {
        v19 = v22;
        goto LABEL_18;
      }

      ++v7;
      v6 = v10;
      v17 = v9 == v10;
      v5 = v22;
      if (v17)
      {
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v22);
        return 0;
      }
    }
    __break(1u);
LABEL_20:
    if (v5 < 0)
      v20 = v5;
    else
      v20 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(v5);
  return 0;
}

_QWORD *sub_100017594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v22[4];
  _QWORD *v23;

  v23 = _swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
LABEL_7:
        v7 = v6;
        v8 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_15;
        v9 = objc_msgSend(v6, "name");
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
        v12 = v11;

        v22[2] = v10;
        v22[3] = v12;
        v22[0] = a2;
        v22[1] = a3;
        v13 = sub_100004D3C();
        LOBYTE(v10) = StringProtocol.localizedStandardContains<A>(_:)(v22, &type metadata for String, &type metadata for String, v13, v13);
        v14 = swift_bridgeObjectRelease(v12);
        if ((v10 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
          v15 = v23[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
          v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v7);
          specialized ContiguousArray._endMutation()(v16);
        }
        else
        {

        }
        ++v5;
        if (v8 == v4)
        {
          v17 = v23;
          goto LABEL_21;
        }
      }
      if (v5 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      if (a1 < 0)
        v18 = a1;
      else
        v18 = a1 & 0xFFFFFFFFFFFFFF8;
      v4 = _CocoaArrayWrapper.endIndex.getter(v18);
      if (!v4)
        goto LABEL_20;
    }
    v6 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_7;
  }
LABEL_20:
  v17 = _swiftEmptyArrayStorage;
LABEL_21:
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a1);
  return v17;
}

uint64_t sub_100017754(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v3 = type metadata accessor for String.LocalizationValue.Placeholder(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100004ED4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, a1, v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v1, v3);
  if (v5 == enum case for String.LocalizationValue.Placeholder.int(_:))
    return 1684827173;
  if (v5 == enum case for String.LocalizationValue.Placeholder.uint(_:))
    return 1970039845;
  if (v5 == enum case for String.LocalizationValue.Placeholder.float(_:))
    return 26149;
  if (v5 == enum case for String.LocalizationValue.Placeholder.double(_:))
    return 6712357;
  if (v5 != enum case for String.LocalizationValue.Placeholder.object(_:))
    sub_100018168(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return 16421;
}

void sub_10001787C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = sub_100002608(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_100009BD4();
}

uint64_t sub_1000178B8(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  BOOL v8;

  if ((a2 & 0x2000000000000000) != 0)
    v7 = HIBYTE(a2) & 0xF;
  else
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  v8 = a1 == a5 && a2 == a6;
  if (v8 && !(a3 >> 16) && v7 == a4 >> 16)
    return 1;
  else
    return _stringCompareInternal(_:_:_:_:expecting:)(a1) & 1;
}

char *sub_10001791C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000024DC(&qword_10002D460);
    v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_100010390((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_100017AFC(0, v8, (unint64_t)v13, a4);
  }
  return v11;
}

char *sub_100017A10(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000024DC(&qword_10002D888);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1000103F0((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_100017BF8(0, v8, (unint64_t)v13, a4);
  }
  return v11;
}

uint64_t sub_100017AFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
  v6 = a4 + 24 * a1 + 32;
  v7 = a3 + 24 * v4;
  if (v6 >= v7 || v6 + 24 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100017BF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
  v6 = a4 + 16 * a1 + 32;
  v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3, v6);
    swift_bridgeObjectRelease(a4);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100017CEC(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)sub_10001791C((char *)result, v7, 1, v3);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = sub_10001060C(v6 + 32, v2, v3 + 24 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_100017DC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000024DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_100009BD4();
}

uint64_t sub_100017E00(uint64_t a1, unsigned int a2)
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

uint64_t sub_100017E50(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_100017EA4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_100017EBC(_QWORD *result, int a2)
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

void type metadata accessor for ConfiguredCollection.Identifier()
{
  sub_100004FDC();
}

unint64_t sub_100017EEC()
{
  unint64_t result;

  result = qword_10002D8A8;
  if (!qword_10002D8A8)
  {
    result = swift_getWitnessTable(&unk_100023DEC, &unk_10002A3F0);
    atomic_store(result, (unint64_t *)&qword_10002D8A8);
  }
  return result;
}

uint64_t sub_100017F28(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100017F68 + 4 * byte_100023A40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100017F88 + 4 * byte_100023A45[v4]))();
}

_BYTE *sub_100017F68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100017F88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100017F90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100017F98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100017FA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100017FA8(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for ConfiguredCollection.Identifier.SystemCollectionIdentifier()
{
  sub_100004FDC();
}

unint64_t sub_100017FC4()
{
  unint64_t result;

  result = qword_10002D8B0;
  if (!qword_10002D8B0)
  {
    result = swift_getWitnessTable(&unk_100023EF4, &unk_10002A480);
    atomic_store(result, (unint64_t *)&qword_10002D8B0);
  }
  return result;
}

uint64_t sub_100018000()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_100018008()
{
  return LocalizedStringResource.init(stringLiteral:)(0x696669746E656449, 0xEE004C5255207265);
}

uint64_t sub_100018034()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10001803C()
{
  return LocalizedStringResource.init(stringLiteral:)(0x74756374726F6853, 0xED0000656D614E20);
}

uint64_t sub_100018064(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_100018078()
{
  return type metadata accessor for URL(0);
}

uint64_t sub_100018080()
{
  return LocalizedStringResource.init(stringLiteral:)(0x6D614E206E6F6349, 0xE900000000000065);
}

uint64_t sub_1000180C4()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_1000180CC(uint64_t a1)
{
  return swift_release_n(a1, 2);
}

char *sub_1000180EC()
{
  uint64_t v0;

  return sub_1000106FC(0, v0 & ~(v0 >> 63), 0);
}

uint64_t sub_100018104@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100018134()
{
  return 0;
}

uint64_t sub_100018150()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_100018158(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  return sub_1000178B8(a1, a2, a3, v4, v5, v3);
}

uint64_t sub_100018168@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100018170()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100018178()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100018180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return _stringCompareWithSmolCheck(_:_:expecting:)(v5, v4, a3, a4, 0);
}

uint64_t sub_1000181A8()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_1000181B0(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

uint64_t sub_1000181B8()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000181CC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000181E0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000181E8(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_1000181F0()
{
  return EntityProperty.wrappedValue.setter();
}

void sub_1000181F8()
{
  uint64_t v0;
  uint64_t *v1;

  sub_100017DC8(v0, v1);
}

char *sub_100018204(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_100017A10(a1, a2, 1, v2);
}

void **sub_100018210(void **a1, void **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    v9 = v5;
    v10 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v8, v10) == 1)
    {
      v11 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, v8, v11);
      v12 = v7;
      v13 = v10;
      v14 = 1;
    }
    else
    {
      v15 = *v8;
      *v7 = *v8;
      swift_retain(v15);
      v12 = v7;
      v13 = v10;
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_1000182E4(id *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  v5 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

void **sub_10001835C(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (uint64_t *)((char *)a1 + v5);
  v7 = (uint64_t *)((char *)a2 + v5);
  v8 = v4;
  v9 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v7, v9) == 1)
  {
    v10 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v6, v7, v10);
    v11 = 1;
  }
  else
  {
    v12 = *v7;
    *v6 = *v7;
    swift_retain(v12);
    v11 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v9, v11);
  return a1;
}

void **sub_100018404(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_100017DC8((uint64_t)a1 + v9, &qword_10002CAB8);
    v12 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v15 = *v11;
      *v10 = *v11;
      swift_retain(v15);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
  }
  return a1;
}

_QWORD *sub_1000184D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v7 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

void **sub_10001857C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_100017DC8((uint64_t)a1 + v7, &qword_10002CAB8);
    v10 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for WidgetFamily(0);
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

uint64_t sub_10001864C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018658);
}

uint64_t sub_100018658(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000024DC(&qword_10002CAC0);
    return sub_100002A8C((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1000186D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000186DC);
}

void sub_1000186DC(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    sub_100009BDC();
  }
  else
  {
    v7 = sub_1000024DC(&qword_10002CAC0);
    sub_10000251C((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t type metadata accessor for RunShortcutComplicationView(uint64_t a1)
{
  uint64_t result;

  result = qword_10002D910;
  if (!qword_10002D910)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RunShortcutComplicationView);
  return result;
}

void sub_10001877C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_100002B80(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

uint64_t sub_1000187F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000249A0, 1);
}

void sub_100018804()
{
  EnvironmentValues.colorScheme.getter();
  sub_100009BD4();
}

void sub_100018820(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for ColorScheme(0);
  __chkstk_darwin(v3);
  sub_10000D33C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  EnvironmentValues.colorScheme.setter(v1);
  sub_100009BDC();
}

void sub_100018884()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[2];

  v2 = sub_1000024DC(&qword_10002D948);
  sub_10000264C();
  __chkstk_darwin(v3);
  sub_10000D33C();
  sub_10001896C(v0, v1);
  v4 = objc_msgSend(*v0, "name");
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  v10[0] = v5;
  v10[1] = v7;
  v8 = sub_100019344();
  v9 = sub_100004D3C();
  View.accessibilityLabel<A>(_:)(v10, v2, &type metadata for String, v8, v9);
  swift_bridgeObjectRelease(v7);
  sub_100017DC8(v1, &qword_10002D948);
}

void sub_10001896C(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v55 = a2;
  v56 = sub_1000024DC(&qword_10002D998);
  __chkstk_darwin(v56);
  v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1000024DC(&qword_10002D980);
  __chkstk_darwin(v50);
  v48 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1000024DC(&qword_10002D9A0);
  __chkstk_darwin(v52);
  v54 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_1000024DC(&qword_10002D9A8);
  __chkstk_darwin(v49);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_1000024DC(&qword_10002D970);
  __chkstk_darwin(v53);
  v51 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for RunShortcutRectangularWidgetView(0);
  __chkstk_darwin(v10);
  v12 = (uint64_t *)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for WidgetFamily(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RunShortcutComplicationView(0);
  sub_10001972C(&qword_10002CAB8, (void (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (&enum case for WidgetFamily.accessoryCorner(_:) && v17 == enum case for WidgetFamily.accessoryCorner(_:))
  {
    v18 = v48;
    sub_100018F00(v48);
    sub_100009A70(v18, (uint64_t)v8, &qword_10002D980);
    swift_storeEnumTagMultiPayload(v8, v49, 1);
    sub_100009554(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView);
    v20 = v19;
    v21 = sub_1000194B0();
    v22 = (uint64_t)v51;
    _ConditionalContent<>.init(storage:)(v8, v10, v50, v20, v21);
    v23 = v54;
    sub_100009A70(v22, v54, &qword_10002D970);
    swift_storeEnumTagMultiPayload(v23, v52, 0);
    v24 = sub_10001942C();
    sub_1000099B8(&qword_10002D990, &qword_10002D998);
    _ConditionalContent<>.init(storage:)(v23, v53, v56, v24, v25);
    sub_100017DC8(v22, &qword_10002D970);
    sub_100017DC8(v18, &qword_10002D980);
  }
  else if (v17 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    v26 = *a1;
    v27 = objc_msgSend(*a1, "icon");
    v28 = objc_msgSend(v26, "name");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

    v32 = (_QWORD *)((char *)v12 + *(int *)(v10 + 28));
    *v32 = swift_getKeyPath(&unk_100023FA0);
    v33 = sub_1000024DC(&qword_10002D030);
    swift_storeEnumTagMultiPayload(v32, v33, 0);
    v34 = (char *)v12 + *(int *)(v10 + 32);
    *(_QWORD *)v34 = swift_getKeyPath(&unk_100023FD0);
    v34[8] = 0;
    *v12 = v27;
    v12[1] = v29;
    v12[2] = v31;
    v12[3] = 0;
    sub_10000B014((uint64_t)v12, (uint64_t)v8);
    swift_storeEnumTagMultiPayload(v8, v49, 0);
    sub_100009554(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView);
    v36 = v35;
    v37 = sub_1000194B0();
    v38 = (uint64_t)v51;
    _ConditionalContent<>.init(storage:)(v8, v10, v50, v36, v37);
    v39 = v54;
    sub_100009A70(v38, v54, &qword_10002D970);
    swift_storeEnumTagMultiPayload(v39, v52, 0);
    v40 = sub_10001942C();
    sub_1000099B8(&qword_10002D990, &qword_10002D998);
    _ConditionalContent<>.init(storage:)(v39, v53, v56, v40, v41);
    sub_100017DC8(v38, &qword_10002D970);
    sub_10000B2F8((uint64_t)v12);
  }
  else
  {
    *(_QWORD *)v4 = static Alignment.center.getter();
    *((_QWORD *)v4 + 1) = v42;
    v43 = sub_1000024DC(&qword_10002D9B0);
    sub_10001907C(a1, &v4[*(int *)(v43 + 44)]);
    v44 = v54;
    sub_100009A70((uint64_t)v4, v54, &qword_10002D998);
    swift_storeEnumTagMultiPayload(v44, v52, 1);
    v45 = sub_10001942C();
    sub_1000099B8(&qword_10002D990, &qword_10002D998);
    _ConditionalContent<>.init(storage:)(v44, v53, v56, v45, v46);
    sub_100017DC8((uint64_t)v4, &qword_10002D998);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

void sub_100018F00(uint64_t a1@<X8>)
{
  id *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  type metadata accessor for ComplicationPaddingModifier(0);
  sub_10000264C();
  __chkstk_darwin(v4);
  sub_10000D33C();
  sub_1000024DC(&qword_10002CAC0);
  sub_10000264C();
  __chkstk_darwin(v5);
  sub_10000265C();
  v8 = (_QWORD *)(v7 - v6);
  v9 = type metadata accessor for ComplicationWorkflowIcon(0);
  sub_10000264C();
  __chkstk_darwin(v10);
  sub_10000265C();
  v13 = (_QWORD *)(v12 - v11);
  v14 = objc_msgSend(*v1, "icon");
  *v8 = swift_getKeyPath(&unk_100023FF8);
  v15 = sub_1000024DC(&qword_10002CAB8);
  sub_10000D334((uint64_t)v8, v15);
  KeyPath = swift_getKeyPath(&unk_100024028);
  v17 = (_QWORD *)((char *)v13 + *(int *)(v9 + 24));
  *v17 = KeyPath;
  v18 = sub_1000024DC(&qword_10002D000);
  sub_10000D334((uint64_t)v17, v18);
  *v13 = v14;
  sub_10001990C((uint64_t)v8, (uint64_t)v13 + *(int *)(v9 + 20));
  *v2 = swift_getKeyPath(&unk_100023FF8);
  sub_10000D334((uint64_t)v2, v15);
  v19 = sub_1000024DC(&qword_10002D980);
  sub_100019954((uint64_t)v2, a1 + *(int *)(v19 + 36), (void (*)(_QWORD))type metadata accessor for ComplicationPaddingModifier);
  sub_100019954((uint64_t)v13, a1, (void (*)(_QWORD))type metadata accessor for ComplicationWorkflowIcon);
  sub_100009BA8();
}

uint64_t sub_10001907C@<X0>(id *a1@<X0>, char *a2@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47[16];
  id *v48;
  _QWORD v49[2];
  __int128 v50[3];

  v46 = a2;
  v3 = sub_1000024DC(&qword_10002D9B8);
  v45 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000024DC(&qword_10002D9C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v41 - v11;
  v13 = type metadata accessor for AccessoryWidgetBackground(0);
  v43 = *(_QWORD *)(v13 - 8);
  v44 = v13;
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v42 = (char *)&v41 - v18;
  AccessoryWidgetBackground.init()(v17);
  sub_10000EF60(*a1, v50);
  sub_10001BDCC(v50);
  v49[0] = v19;
  v49[1] = v20;
  v48 = a1;
  v21 = sub_1000024DC(&qword_10002D980);
  v22 = sub_1000194B0();
  v23 = sub_100010DB4();
  Button.init<A>(intent:label:)(v49, sub_100019988, v47, v21, &type metadata for RunShortcutIntent, v22, v23);
  sub_1000099B8(&qword_10002D9C8, &qword_10002D9B8);
  v25 = v24;
  v26 = sub_1000199A4();
  View.buttonStyle<A>(_:)(v26, v3, &type metadata for WidgetChicletButonStyle, v25, v26);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v5, v3);
  v27 = v7;
  v41 = v7;
  v28 = v10;
  v29 = v10;
  v30 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v28, v6);
  v31 = v42;
  v32 = v43;
  v33 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v34 = v44;
  v33(v16, v42, v44);
  v35 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v35(v29, v12, v30);
  v36 = v46;
  v33(v46, v16, v34);
  v37 = sub_1000024DC(&qword_10002D9D8);
  v35(&v36[*(int *)(v37 + 48)], v29, v30);
  v38 = *(void (**)(char *, uint64_t))(v41 + 8);
  v38(v12, v30);
  v39 = *(void (**)(char *, uint64_t))(v32 + 8);
  v39(v31, v34);
  v38(v29, v30);
  return ((uint64_t (*)(char *, uint64_t))v39)(v16, v34);
}

unint64_t sub_100019344()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D950;
  if (!qword_10002D950)
  {
    v1 = sub_100002608(&qword_10002D948);
    sub_1000193A8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D950);
  }
  return result;
}

unint64_t sub_1000193A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D958;
  if (!qword_10002D958)
  {
    v1 = sub_100002608(&qword_10002D960);
    sub_10001942C();
    sub_1000099B8(&qword_10002D990, &qword_10002D998);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D958);
  }
  return result;
}

unint64_t sub_10001942C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D968;
  if (!qword_10002D968)
  {
    v1 = sub_100002608(&qword_10002D970);
    sub_100009554(&qword_10002D228, type metadata accessor for RunShortcutRectangularWidgetView);
    sub_1000194B0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D968);
  }
  return result;
}

unint64_t sub_1000194B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D978;
  if (!qword_10002D978)
  {
    v1 = sub_100002608(&qword_10002D980);
    sub_100009554(&qword_10002D988, type metadata accessor for ComplicationWorkflowIcon);
    sub_100009554(&qword_10002D260, type metadata accessor for ComplicationPaddingModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D978);
  }
  return result;
}

void sub_10001954C()
{
  sub_10001972C(&qword_10002CAB8, (void (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL);
}

void sub_10001957C()
{
  EnvironmentValues.colorScheme.getter();
  sub_100009BD4();
}

uint64_t sub_1000195A0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v5 = type metadata accessor for EnvironmentValues(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_10000D33C();
  if ((a2 & 1) != 0)
    return a1 & 1;
  v7 = swift_retain(a1);
  v8 = static os_log_type_t.fault.getter(v7);
  v9 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = sub_100019F14(12);
    v11 = sub_100019F14(32);
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_1000199E0((char *)0x6C6F6F42, (char *)0xE400000000000000, &v13);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    sub_100019F08(v11);
    sub_100019F08(v10);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v2, a1);
  sub_100009E38(a1, 0);
  sub_100019F30(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return v14;
}

void sub_1000196FC()
{
  sub_10001972C(&qword_10002D030, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (char *)0x686353726F6C6F43, (char *)0xEB00000000656D65);
}

void sub_10001972C(uint64_t *a1, void (*a2)(_QWORD), char *a3, char *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t *);
  uint64_t v18;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v9 = type metadata accessor for EnvironmentValues(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10000D33C();
  v11 = sub_1000024DC(a1);
  sub_10000264C();
  __chkstk_darwin(v12);
  sub_10000265C();
  v15 = (uint64_t *)(v14 - v13);
  sub_100009A70(v4, v14 - v13, a1);
  if (swift_getEnumCaseMultiPayload(v15, v11) == 1)
  {
    a2(0);
    v16 = sub_100019F1C();
    v17(v16, v15);
  }
  else
  {
    v18 = *v15;
    v19 = static os_log_type_t.fault.getter();
    v20 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v20, v19))
    {
      v21 = sub_100019F14(12);
      v22 = sub_100019F14(32);
      v24 = v22;
      *(_DWORD *)v21 = 136315138;
      *(_QWORD *)(v21 + 4) = sub_1000199E0(a3, a4, &v24);
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      sub_100019F08(v22);
      sub_100019F08(v21);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v5, v18);
    swift_release(v18);
    sub_100019F30(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  }
  sub_100009BA8();
}

void sub_1000198D4()
{
  sub_10001972C(&qword_10002D000, (void (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (char *)0xD000000000000013, (char *)0x8000000100020600);
}

uint64_t sub_10001990C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000024DC(&qword_10002CAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100019954(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  a3(0);
  v4 = sub_100019F1C();
  v5(v4, a1);
  sub_100009BD4();
}

void sub_100019988(uint64_t a1@<X8>)
{
  sub_100018F00(a1);
  sub_100009BD4();
}

unint64_t sub_1000199A4()
{
  unint64_t result;

  result = qword_10002D9D0;
  if (!qword_10002D9D0)
  {
    result = swift_getWitnessTable("ik", &type metadata for WidgetChicletButonStyle);
    atomic_store(result, (unint64_t *)&qword_10002D9D0);
  }
  return result;
}

char *sub_1000199E0(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_100019AB0(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100019BCC((uint64_t)v12, *a3);
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
      sub_100019BCC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100019BAC(v12);
  return v7;
}

char *sub_100019AB0(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  char *result;
  uint64_t v10;
  char *v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (char *)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100019C08(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100019BAC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100019BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100019C08(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_100019C9C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100019D98(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_100019D98((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_100019C9C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  char v7;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100019D34(v4, 0);
      result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0)
        break;
      if (result == (_QWORD *)v4)
        return v5;
      __break(1u);
LABEL_9:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100019D34(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000024DC(&qword_10002D9E0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100019D98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

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
    v10 = sub_1000024DC(&qword_10002D9E0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[v8] <= v13)
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

unint64_t sub_100019E84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D9E8;
  if (!qword_10002D9E8)
  {
    v1 = sub_100002608(&qword_10002D9F0);
    sub_100019344();
    sub_100009554(&qword_10002D9F8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D9E8);
  }
  return result;
}

uint64_t sub_100019F08(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_100019F14(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

uint64_t sub_100019F1C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100019F30@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void **sub_100019F3C(void **a1, void **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v5;
    v12 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v10, v12) == 1)
    {
      v13 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
      v14 = 1;
    }
    else
    {
      v15 = *v10;
      *v9 = *v10;
      swift_retain(v15);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v12, v14);
    v16 = *(int *)(a3 + 24);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = v17;
      v22 = v19;
      v23 = 1;
    }
    else
    {
      v24 = *v18;
      *v17 = *v18;
      swift_retain(v24);
      v21 = v17;
      v22 = v19;
      v23 = 0;
    }
    swift_storeEnumTagMultiPayload(v21, v22, v23);
  }
  return a1;
}

uint64_t sub_10001A094(id *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  v5 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  v7 = (id *)((char *)a1 + *(int *)(a2 + 24));
  v8 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v7, v8) != 1)
    return swift_release(*v7);
  v9 = type metadata accessor for WidgetRenderingMode(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
}

void **sub_10001A168(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)((char *)a1 + v7);
  v9 = (uint64_t *)((char *)a2 + v7);
  v10 = v6;
  v11 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v9, v11) == 1)
  {
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    v13 = 1;
  }
  else
  {
    v14 = *v9;
    *v8 = *v9;
    swift_retain(v14);
    v13 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v11, v13);
  v15 = *(int *)(a3 + 24);
  v16 = (uint64_t *)((char *)a1 + v15);
  v17 = (uint64_t *)((char *)a2 + v15);
  v18 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v17, v18) == 1)
  {
    v19 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v16, v17, v19);
    v20 = 1;
  }
  else
  {
    v21 = *v17;
    *v16 = *v17;
    swift_retain(v21);
    v20 = 0;
  }
  swift_storeEnumTagMultiPayload(v16, v18, v20);
  return a1;
}

void **sub_10001A294(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_100009AB0((uint64_t)a1 + v9, &qword_10002CAB8);
    v12 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v15 = *v11;
      *v10 = *v11;
      swift_retain(v15);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
    v16 = *(int *)(a3 + 24);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    sub_100009AB0((uint64_t)a1 + v16, &qword_10002D000);
    v19 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = 1;
    }
    else
    {
      v22 = *v18;
      *v17 = *v18;
      swift_retain(v22);
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v19, v21);
  }
  return a1;
}

_QWORD *sub_10001A3F0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
  {
    v15 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload(v12, v14, 1);
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  return a1;
}

void **sub_10001A520(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_100009AB0((uint64_t)a1 + v7, &qword_10002CAB8);
    v10 = sub_1000024DC(&qword_10002CAB8);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    v12 = *(int *)(a3 + 24);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    sub_100009AB0((uint64_t)a1 + v12, &qword_10002D000);
    v15 = sub_1000024DC(&qword_10002D000);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload(v13, v15, 1);
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10001A680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001A68C);
}

uint64_t sub_10001A68C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000024DC(&qword_10002CAC0);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v9 = sub_1000024DC(&qword_10002D148);
      v10 = *(int *)(a3 + 24);
    }
    return sub_100002A8C((uint64_t)a1 + v10, a2, v9);
  }
}

uint64_t sub_10001A72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001A738);
}

_QWORD *sub_10001A738(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v8 = sub_1000024DC(&qword_10002CAC0);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = sub_1000024DC(&qword_10002D148);
      v10 = *(int *)(a4 + 24);
    }
    return (_QWORD *)sub_10000251C((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ComplicationWorkflowIcon(uint64_t a1)
{
  uint64_t result;

  result = qword_10002DA58;
  if (!qword_10002DA58)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ComplicationWorkflowIcon);
  return result;
}

void sub_10001A80C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v6[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_10000BDB0(319, (unint64_t *)&qword_10002CB30, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000BDB0(319, (unint64_t *)&unk_10002D1B8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

uint64_t sub_10001A8C0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000249F0, 1);
}

uint64_t sub_10001A8D0()
{
  id *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = v0;
  v2 = sub_10001BCF4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = sub_1000024DC(&qword_10002DA98);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(*v1, "backgroundColor");
  v10 = objc_msgSend(v9, "paletteGradient");

  sub_10000D26C((uint64_t)v1, (uint64_t)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ComplicationWorkflowIcon);
  v11 = *(unsigned __int8 *)(v3 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = swift_allocObject(&unk_10002A728, v12 + v4, v11 | 7);
  sub_10001B910((uint64_t)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  v14 = sub_1000024DC(&qword_10002DAA0);
  v15 = sub_10001B99C();
  GradientColorResolverView.init(gradient:_:)(v10, sub_10001B954, v13, v14, v15);
  sub_1000099B8(&qword_10002DAF0, &qword_10002DA98);
  View.widgetAccentable(_:)(1, v5, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10001AA70(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t *v11;
  uint64_t v12;

  v6 = sub_1000024DC(&qword_10002DAB8);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001AB44(a2, (uint64_t)a1, (uint64_t)v8);
  v9 = Color.init(_:)(a1);
  KeyPath = swift_getKeyPath(&unk_1000240D0);
  sub_10000D168((uint64_t)v8, a3, &qword_10002DAB8);
  v11 = (uint64_t *)(a3 + *(int *)(sub_1000024DC(&qword_10002DAA0) + 36));
  *v11 = KeyPath;
  v11[1] = v9;
  sub_100009AB0((uint64_t)v8, &qword_10002DAB8);
}

void sub_10001AB44(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, _QWORD, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  char *v46;
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
  unint64_t v58;
  uint64_t OpaqueTypeConformance2;
  char *v60;
  char *v61;
  char v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  _QWORD *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  void *v85;
  id *v86;
  id **v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  unsigned int *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  id **v112;
  char *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  char *v137;
  id *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;

  v135 = (void *)a2;
  v143 = a3;
  v117 = type metadata accessor for BlendMode(0);
  v116 = *(_QWORD *)(v117 - 8);
  __chkstk_darwin(v117);
  v115 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_1000024DC(&qword_10002D270);
  v119 = *(_QWORD *)(v142 - 8);
  v5 = __chkstk_darwin(v142);
  v114 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v118 = (char *)&v109 - v7;
  v111 = type metadata accessor for Color.RGBColorSpace(0);
  v109 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v110 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = type metadata accessor for WidgetSStackView(0);
  v9 = __chkstk_darwin(v144);
  v112 = (id **)((char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v113 = (char *)&v109 - v11;
  v123 = type metadata accessor for WidgetRenderingMode(0);
  v120 = *(_QWORD *)(v123 - 8);
  v12 = __chkstk_darwin(v123);
  v122 = (char *)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v121 = (char *)&v109 - v14;
  v139 = sub_1000024DC(&qword_10002DAF8);
  __chkstk_darwin(v139);
  v141 = (uint64_t)&v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = sub_1000024DC((uint64_t *)&unk_10002DB00);
  __chkstk_darwin(v133);
  v136 = (uint64_t)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_1000024DC(&qword_10002DAD8);
  __chkstk_darwin(v140);
  v137 = (char *)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for IconView.DisplayMode(0);
  v128 = *(_QWORD *)(v18 - 8);
  v129 = v18;
  __chkstk_darwin(v18);
  v130 = (uint64_t *)((char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v126 = type metadata accessor for IconSize(0);
  v125 = *(_QWORD *)(v126 - 8);
  __chkstk_darwin(v126);
  v127 = (uint64_t *)((char *)&v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  v134 = type metadata accessor for IconView(0);
  v132 = *(_QWORD *)(v134 - 8);
  __chkstk_darwin(v134);
  v131 = (char *)&v109 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for ComplicationWorkflowIcon(0);
  __chkstk_darwin(v22);
  v24 = (char *)&v109 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for WidgetFamily(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = __chkstk_darwin(v25);
  v29 = (char *)&v109 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v31 = (char *)&v109 - v30;
  v124 = v22;
  sub_10001954C();
  v32 = *(void (**)(char *, _QWORD, uint64_t))(v26 + 104);
  v32(v29, enum case for WidgetFamily.accessoryInline(_:), v25);
  sub_100009554(&qword_10002D280, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  v34 = v33;
  dispatch thunk of RawRepresentable.rawValue.getter(&v145, v25, v33);
  dispatch thunk of RawRepresentable.rawValue.getter(&v147, v25, v34);
  v35 = v145;
  v36 = v147;
  v37 = *(void (**)(char *, uint64_t))(v26 + 8);
  v37(v29, v25);
  v37(v31, v25);
  v138 = (id *)a1;
  sub_10000D26C(a1, (uint64_t)v24, type metadata accessor for ComplicationWorkflowIcon);
  if (v35 == v36)
  {
    sub_100009A48((uint64_t)v24, type metadata accessor for ComplicationWorkflowIcon);
LABEL_4:
    v40 = objc_msgSend(*v138, "icon");
    v41 = v127;
    *v127 = 0x403E000000000000;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v125 + 104))(v41, enum case for IconSize.customHeight(_:), v126);
    v42 = v135;
    v43 = v129;
    v44 = v130;
    *v130 = v135;
    *((_BYTE *)v44 + 8) = 0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v128 + 104))(v44, enum case for IconView.DisplayMode.customColor(_:), v43);
    v45 = v42;
    v46 = v131;
    IconView.init(_:size:displayMode:animated:)(v40, v41, v44, 1);
    v47 = v132;
    v48 = v136;
    v49 = v134;
    (*(void (**)(uint64_t, char *, uint64_t))(v132 + 16))(v136, v46, v134);
    swift_storeEnumTagMultiPayload(v48, v133, 0);
    sub_100009554((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView);
    v51 = v50;
    sub_100009554(&qword_10002D258, type metadata accessor for WidgetSStackView);
    v53 = v52;
    v54 = (uint64_t)v137;
    v55 = v48;
    v56 = v144;
    _ConditionalContent<>.init(storage:)(v55, v49, v144, v51, v53);
    v57 = v141;
    sub_10000D168(v54, v141, &qword_10002DAD8);
    swift_storeEnumTagMultiPayload(v57, v139, 0);
    v58 = sub_10001BB34();
    v145 = v56;
    v146 = v53;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v145, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v57, v140, v142, v58, OpaqueTypeConformance2);
    sub_100009AB0(v54, &qword_10002DAD8);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v49);
    return;
  }
  sub_10001954C();
  v32(v29, enum case for WidgetFamily.accessoryRectangular(_:), v25);
  dispatch thunk of RawRepresentable.rawValue.getter(&v145, v25, v34);
  dispatch thunk of RawRepresentable.rawValue.getter(&v147, v25, v34);
  v38 = v145;
  v39 = v147;
  v37(v29, v25);
  v37(v31, v25);
  sub_100009A48((uint64_t)v24, type metadata accessor for ComplicationWorkflowIcon);
  if (v38 == v39)
    goto LABEL_4;
  v60 = v121;
  sub_1000198D4();
  v61 = v122;
  static WidgetRenderingMode.vibrant.getter();
  v62 = static WidgetRenderingMode.== infix(_:_:)(v60, v61);
  v63 = *(void (**)(char *, uint64_t))(v120 + 8);
  v64 = v123;
  v63(v61, v123);
  v63(v60, v64);
  if ((v62 & 1) != 0)
  {
    v65 = objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
    v66 = sub_10001B74C((uint64_t)v65);

    v67 = objc_msgSend(objc_allocWithZone((Class)WFColor), "initWithWhite:alpha:", 0.2, 1.0);
    v68 = v144;
    v69 = v113;
    v70 = &v113[*(int *)(v144 + 20)];
    v71 = v110;
    (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v110, enum case for Color.RGBColorSpace.sRGB(_:), v111);
    *(_QWORD *)v70 = Color.init(_:white:opacity:)(v71, 0.6, 1.0);
    v72 = enum case for SStackFill.color(_:);
    v73 = type metadata accessor for SStackFill(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v70, v72, v73);
    *v69 = v66;
    v69[1] = v67;
    v74 = type metadata accessor for WidgetSStackView.Content(0);
    swift_storeEnumTagMultiPayload(v69, v74, 0);
    v75 = v136;
    sub_10000D26C((uint64_t)v69, v136, type metadata accessor for WidgetSStackView);
    swift_storeEnumTagMultiPayload(v75, v133, 1);
    sub_100009554((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView);
    v77 = v76;
    sub_100009554(&qword_10002D258, type metadata accessor for WidgetSStackView);
    v79 = v78;
    v80 = (uint64_t)v137;
    _ConditionalContent<>.init(storage:)(v75, v134, v68, v77, v78);
    v81 = v141;
    sub_10000D168(v80, v141, &qword_10002DAD8);
    swift_storeEnumTagMultiPayload(v81, v139, 0);
    v82 = sub_10001BB34();
    v145 = v68;
    v146 = v79;
    v83 = swift_getOpaqueTypeConformance2(&v145, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v81, v140, v142, v82, v83);
    sub_100009AB0(v80, &qword_10002DAD8);
    sub_100009A48((uint64_t)v69, type metadata accessor for WidgetSStackView);
  }
  else
  {
    v84 = v60;
    v85 = v135;
    v138 = (id *)sub_10001B74C((uint64_t)v135);
    v86 = (id *)objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
    v87 = v112;
    v88 = (uint64_t *)((char *)v112 + *(int *)(v144 + 20));
    v89 = Color.init(_:)(v85);
    v90 = Color.opacity(_:)(0.6);
    swift_release(v89);
    *v88 = v90;
    v91 = enum case for SStackFill.color(_:);
    v92 = type metadata accessor for SStackFill(0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v92 - 8) + 104))(v88, v91, v92);
    *v87 = v138;
    v87[1] = v86;
    v93 = type metadata accessor for WidgetSStackView.Content(0);
    swift_storeEnumTagMultiPayload(v87, v93, 0);
    sub_1000198D4();
    static WidgetRenderingMode.accented.getter();
    v94 = static WidgetRenderingMode.== infix(_:_:)(v84, v61);
    v63(v61, v64);
    v63(v84, v64);
    v95 = (unsigned int *)&enum case for BlendMode.destinationOut(_:);
    v96 = v116;
    if ((v94 & 1) == 0)
      v95 = (unsigned int *)&enum case for BlendMode.normal(_:);
    v97 = v115;
    v98 = v117;
    (*(void (**)(char *, _QWORD, uint64_t))(v116 + 104))(v115, *v95, v117);
    sub_100009554(&qword_10002D258, type metadata accessor for WidgetSStackView);
    v100 = v99;
    v101 = v114;
    v102 = v144;
    View.iconBlendMode(_:)(v97, v144, v99);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v97, v98);
    sub_100009A48((uint64_t)v87, type metadata accessor for WidgetSStackView);
    v103 = v119;
    v104 = v118;
    v105 = v142;
    (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v118, v101, v142);
    v106 = v141;
    (*(void (**)(uint64_t, char *, uint64_t))(v103 + 16))(v141, v104, v105);
    swift_storeEnumTagMultiPayload(v106, v139, 1);
    v107 = sub_10001BB34();
    v145 = v102;
    v146 = v100;
    v108 = swift_getOpaqueTypeConformance2(&v145, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v106, v140, v105, v107, v108);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v104, v105);
  }
}

id sub_10001B74C(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v10;

  v1 = objc_msgSend(objc_allocWithZone((Class)WFIconColorBackground), "initWithColor:", a1);
  v2 = sub_10001BCE8();
  v3 = (id)WFSystemImageNameForGlyphCharacter(v2);
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

    v8 = objc_allocWithZone((Class)WFSymbolIcon);
    return sub_10001BBD0(v5, v7, v1);
  }
  else
  {
    v10 = objc_msgSend(objc_allocWithZone((Class)WFWorkflowGlyphIcon), "initWithGlyph:background:", sub_10001BCE8(), v1);

    return v10;
  }
}

uint64_t sub_10001B81C()
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
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = sub_10001BCF4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);

  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = sub_1000024DC(&qword_10002CAB8);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v10 = sub_1000024DC(&qword_10002D000);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetRenderingMode(0);
    sub_100009BF4(v11);
  }
  else
  {
    swift_release(*v9);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10001B910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComplicationWorkflowIcon(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10001B954(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_10001BCF4() - 8) + 80);
  sub_10001AA70(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_10001B99C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DAA8;
  if (!qword_10002DAA8)
  {
    v1 = sub_100002608(&qword_10002DAA0);
    sub_10001BA20();
    sub_1000099B8(&qword_10002DAE0, &qword_10002DAE8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DAA8);
  }
  return result;
}

unint64_t sub_10001BA20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DAB0;
  if (!qword_10002DAB0)
  {
    v1 = sub_100002608(&qword_10002DAB8);
    sub_10001BA84();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DAB0);
  }
  return result;
}

unint64_t sub_10001BA84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_10002DAC0;
  if (!qword_10002DAC0)
  {
    v1 = sub_100002608(&qword_10002DAC8);
    sub_10001BB34();
    v2 = type metadata accessor for WidgetSStackView(255);
    sub_100009554(&qword_10002D258, type metadata accessor for WidgetSStackView);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.iconBlendMode(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DAC0);
  }
  return result;
}

unint64_t sub_10001BB34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DAD0;
  if (!qword_10002DAD0)
  {
    v1 = sub_100002608(&qword_10002DAD8);
    sub_100009554((unint64_t *)&qword_10002D138, (uint64_t (*)(uint64_t))&type metadata accessor for IconView);
    sub_100009554(&qword_10002D258, type metadata accessor for WidgetSStackView);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DAD0);
  }
  return result;
}

id sub_10001BBD0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v7 = objc_msgSend(v3, "initWithSymbolName:background:", v6, a3);

  return v7;
}

uint64_t sub_10001BC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10001BC58(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10001BC84()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[2];

  v0 = sub_100002608(&qword_10002DA98);
  sub_1000099B8(&qword_10002DAF0, &qword_10002DA98);
  v3[0] = v0;
  v3[1] = v1;
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
}

id sub_10001BCE8()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 1976));
}

uint64_t sub_10001BCF4()
{
  return type metadata accessor for ComplicationWorkflowIcon(0);
}

unint64_t sub_10001BD00()
{
  unint64_t result;

  result = qword_10002DB10;
  if (!qword_10002DB10)
  {
    result = swift_getWitnessTable(&unk_100024190, &type metadata for RunShortcutIntent);
    atomic_store(result, (unint64_t *)&qword_10002DB10);
  }
  return result;
}

unint64_t sub_10001BD40()
{
  unint64_t result;

  result = qword_10002DB18;
  if (!qword_10002DB18)
  {
    result = swift_getWitnessTable(&unk_1000241B8, &type metadata for RunShortcutIntent);
    atomic_store(result, (unint64_t *)&qword_10002DB18);
  }
  return result;
}

uint64_t sub_10001BD7C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100024AE0, 1);
}

uint64_t sub_10001BD8C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100010DB4();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

void sub_10001BDCC(__int128 *a1)
{
  uint64_t v1;
  __int128 v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v3 = *a1;
  v33 = a1[1];
  v34 = v3;
  v32 = a1[2];
  v4 = type metadata accessor for InputConnectionBehavior(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_10000265C();
  v8 = v7 - v6;
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v32 - v13;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v15);
  sub_100009C08();
  sub_10001E2D8();
  sub_10000264C();
  __chkstk_darwin(v16);
  sub_10000265C();
  v19 = v18 - v17;
  sub_1000024DC(&qword_10002D360);
  sub_10001E264();
  sub_10001E254(v1);
  type metadata accessor for IntentDialog(0);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  sub_10001E254((uint64_t)v14);
  sub_10001E254((uint64_t)v12);
  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  v20 = qword_100030F80;
  v35 = qword_100030F80;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v8, enum case for InputConnectionBehavior.default(_:), v4);
  v21 = sub_10001D848();
  swift_retain(v20);
  v22 = IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)(v19, v1, &v36, v14, v12, v8, &v35, &type metadata for ControlSortedVisibleShortcutsQuery, v21);
  sub_1000024DC(&qword_10002DCD0);
  type metadata accessor for AppDependencyManager(0);
  v36 = 0u;
  v37 = 0u;
  *(_QWORD *)&v38 = 0;
  v23 = swift_retain(v22);
  v24 = static AppDependencyManager.shared.getter(v23);
  v25 = AppDependency.__allocating_init(key:manager:default:)(&v36, v24, &unk_10002DCD8, 0);
  v26 = *(_QWORD *)a1;
  v27 = *((_QWORD *)a1 + 1);
  v28 = *((_QWORD *)a1 + 2);
  v29 = *((_QWORD *)a1 + 3);
  v31 = *((_QWORD *)a1 + 4);
  v30 = *((_QWORD *)a1 + 5);
  v36 = v34;
  v37 = v33;
  v38 = v32;
  swift_retain(v22);
  swift_retain(v25);
  swift_retain(v26);
  swift_retain(v27);
  swift_retain(v28);
  swift_retain(v29);
  swift_retain(v31);
  swift_retain(v30);
  IntentParameter.wrappedValue.setter(&v36);
  sub_100018170();
  swift_release(v30);
  swift_release(v31);
  swift_release(v29);
  sub_10001E2D0();
  sub_10001E2FC();
  sub_100018178();
  swift_release(v25);
  sub_100018170();
  sub_100009BA8();
}

uint64_t sub_10001C0AC()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = &v13[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_10000E074(v10, qword_100030F68);
  sub_10000E05C(v10, (uint64_t)qword_100030F68);
  v11 = String.LocalizationValue.init(stringLiteral:)(0x726F6853206E7552, 0xEC00000074756374);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v9, v6, 0, 0, 256);
}

uint64_t sub_10001C230()
{
  uint64_t v0;

  if (qword_10002CA58 != -1)
    swift_once(&qword_10002CA58, sub_10001C0AC);
  v0 = sub_10001E2D8();
  return sub_10000E05C(v0, (uint64_t)qword_100030F68);
}

void sub_10001C274()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v1 = type metadata accessor for InputConnectionBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000265C();
  v5 = v4 - v3;
  sub_1000024DC(&qword_10002CA70);
  sub_10000264C();
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v21 - v10;
  sub_1000024DC((uint64_t *)&unk_10002DCC0);
  sub_10000264C();
  __chkstk_darwin(v12);
  sub_10000265C();
  v15 = v14 - v13;
  sub_10001E2D8();
  sub_10000264C();
  __chkstk_darwin(v16);
  sub_100009C08();
  sub_1000024DC(&qword_10002D360);
  sub_10001E264();
  sub_10001E244(v15);
  type metadata accessor for IntentDialog(0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  sub_10001E244((uint64_t)v11);
  sub_10001E244((uint64_t)v9);
  if (qword_10002CA60 != -1)
    swift_once(&qword_10002CA60, sub_10001E6C0);
  v17 = qword_100030F80;
  v22 = qword_100030F80;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v5, enum case for InputConnectionBehavior.default(_:), v1);
  v18 = sub_10001D848();
  swift_retain(v17);
  IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)(v0, v15, &v23, v11, v9, v5, &v22, &type metadata for ControlSortedVisibleShortcutsQuery, v18);
  sub_1000024DC(&qword_10002DCD0);
  v19 = type metadata accessor for AppDependencyManager(0);
  v23 = 0u;
  v24 = 0u;
  *(_QWORD *)&v25 = 0;
  v20 = static AppDependencyManager.shared.getter(v19);
  AppDependency.__allocating_init(key:manager:default:)(&v23, v20, &unk_10002DCD8, 0);
  sub_100009BA8();
}

uint64_t sub_10001C490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[51] = a2;
  v3[52] = a3;
  v3[50] = a1;
  v4 = sub_1000024DC(&qword_10002CBB8);
  v3[53] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_10001C4E4()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 208));
  v1 = *(_OWORD *)(v0 + 208);
  v2 = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v0 + 432) = v1;
  *(_OWORD *)(v0 + 448) = v2;
  *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 240);
  if ((_QWORD)v1)
  {
    v18 = *(_OWORD *)(v0 + 408);
    EntityProperty.wrappedValue.getter((_QWORD *)(v0 + 376));
    v3 = *(_QWORD *)(v0 + 376);
    v4 = *(_QWORD *)(v0 + 384);
    *(_QWORD *)(v0 + 480) = v4;
    sub_10001E0E4();
    swift_bridgeObjectRetain(v4);
    v5 = sub_10001CBD8(v3, v4, 1);
    *(_QWORD *)(v0 + 488) = v5;
    *(_QWORD *)(v0 + 392) = 0;
    v6 = swift_task_alloc(64);
    *(_QWORD *)(v0 + 496) = v6;
    *(_QWORD *)(v6 + 16) = v0 + 392;
    *(_OWORD *)(v6 + 24) = v18;
    *(_QWORD *)(v6 + 40) = v5;
    *(_QWORD *)(v6 + 48) = v3;
    *(_QWORD *)(v6 + 56) = v4;
    v7 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 504) = v7;
    *v7 = v0;
    v7[1] = sub_10001C738;
    sub_100004FD0();
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 424);
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(VCCurrentPlatformShortcutsAppBundleIdentifier);
    v12 = v11;
    v13 = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v14 = type metadata accessor for URL(0);
    sub_10000251C(v9, 1, 1, v14);
    v15 = objc_allocWithZone((Class)WFAppLaunchRequest);
    sub_100004898(v10, v12, v13, v9, 0, 0);
    v17 = v16;
    *(_QWORD *)(v0 + 520) = v16;
    *(_QWORD *)(v0 + 120) = v0 + 554;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_10001C814;
    *(_QWORD *)(v0 + 328) = swift_continuation_init(v0 + 80, 1);
    *(_QWORD *)(v0 + 296) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 304) = 0x40000000;
    *(_QWORD *)(v0 + 312) = sub_1000045CC;
    *(_QWORD *)(v0 + 320) = &unk_10002A8A0;
    objc_msgSend(v17, "performWithCompletionHandler:", v0 + 296);
    return swift_continuation_await(v0 + 80);
  }
}

uint64_t sub_10001C738()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 504);
  *(_QWORD *)(*v1 + 512) = v0;
  swift_task_dealloc(v3);
  if (!v0)
  {
    v4 = *(_QWORD *)(v2 + 496);
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 480));
    swift_task_dealloc(v4);
  }
  sub_100004FD0();
  return sub_10001E1E4(v5, v6, v7);
}

uint64_t sub_10001C7A4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = *(void **)(v0 + 488);
  v2 = *(_QWORD *)(v0 + 464);

  static IntentResult.result<>()();
  sub_10001E2D0();
  sub_10001E2FC();
  sub_100018178();
  sub_100018170();
  swift_release(v2);
  sub_10001E2C0();
  sub_10001E22C();
  v3 = (uint64_t (*)(void))sub_10001E2B4();
  return sub_10001E1F0(v3);
}

uint64_t sub_10001C814()
{
  uint64_t v0;

  sub_100004F88();
  *(_QWORD *)(v0 + 528) = *(_QWORD *)(v0 + 112);
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_10001C858()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t (*v4)(void);

  if ((*(_BYTE *)(v1 + 554) & 1) != 0 || !VCIsDeviceLocked())
  {
    sub_10001E2A8();

    sub_10001E22C();
    v4 = (uint64_t (*)(void))sub_10001E2B4();
    return v4();
  }
  else
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)WFCompactUnlockService), "init");
    *(_QWORD *)(v1 + 536) = v2;
    *(_QWORD *)(v1 + 184) = v1 + 553;
    *(_QWORD *)(v1 + 144) = v1;
    *(_QWORD *)(v1 + 152) = sub_10001C948;
    *(_QWORD *)(v1 + 288) = swift_continuation_init(v1 + 144, 0);
    *(_QWORD *)(v1 + 256) = _NSConcreteStackBlock;
    *(_QWORD *)(v1 + 264) = 0x40000000;
    *(_QWORD *)(v1 + 272) = sub_100004668;
    *(_QWORD *)(v1 + 280) = &unk_10002A8B8;
    objc_msgSend(v2, "requestUnlockIfNeeded:", v1 + 256);
    return swift_continuation_await(v1 + 144);
  }
}

uint64_t sub_10001C948()
{
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_10001C988()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v4)(void);

  if (*(_BYTE *)(v1 + 553) == 1)
  {
    v2 = *(void **)(v1 + 520);
    *(_QWORD *)(v1 + 56) = v1 + 552;
    *(_QWORD *)(v1 + 16) = v1;
    *(_QWORD *)(v1 + 24) = sub_10001CA58;
    *(_QWORD *)(v1 + 368) = swift_continuation_init(v1 + 16, 1);
    *(_QWORD *)(v1 + 336) = _NSConcreteStackBlock;
    *(_QWORD *)(v1 + 344) = 0x40000000;
    *(_QWORD *)(v1 + 352) = sub_1000045CC;
    *(_QWORD *)(v1 + 360) = &unk_10002A8D0;
    objc_msgSend(v2, "performWithCompletionHandler:", v1 + 336);
    return swift_continuation_await(v1 + 16);
  }
  else
  {

    sub_10001E2A8();
    sub_10001E22C();
    v4 = (uint64_t (*)(void))sub_10001E2B4();
    return sub_10001E1D8(v4);
  }
}

uint64_t sub_10001CA58()
{
  uint64_t v0;

  sub_100004F88();
  *(_QWORD *)(v0 + 544) = *(_QWORD *)(v0 + 48);
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_10001CA9C()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_10001E2A8();
  sub_10001E22C();
  v2 = (uint64_t (*)(void))sub_10001E2B4();
  return sub_10000E1AC(v2);
}

uint64_t sub_10001CAD0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 520);
  swift_willThrow();

  sub_10001E22C();
  return sub_10001E1D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10001CB10()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 536);
  v2 = *(void **)(v0 + 520);
  swift_willThrow();

  sub_10001E22C();
  return sub_10001E1D8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10001CB58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 496);
  v2 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 432);

  sub_100009C40();
  sub_100018170();
  sub_100018178();
  sub_10001E2FC();
  sub_10001E2D0();
  swift_release(v2);
  swift_release(v3);
  swift_task_dealloc(v1);

  sub_10001E22C();
  return sub_10001E1F0(*(uint64_t (**)(void))(v0 + 8));
}

id sub_10001CBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v6;
  NSString v7;
  id v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = objc_msgSend(v6, "initWithWorkflowIdentifier:location:", v7, a3);

  return v8;
}

uint64_t sub_10001CC50(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;

  v14 = sub_1000024DC(&qword_10002DC60);
  __chkstk_darwin(v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000024DC(&qword_10002DC88);
  __chkstk_darwin(v17);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (*(uint64_t (**)(char *, uint64_t))(v20 + 16))(v19, a1);
  AppDependency.wrappedValue.getter(&v32, v21);
  v22 = v32;
  v23 = objc_allocWithZone((Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate(0));
  v24 = sub_10001CFF4((uint64_t)v19, v22);
  v25 = (void *)*a2;
  *a2 = v24;

  objc_msgSend(a5, "setDelegate:", *a2);
  v26 = type metadata accessor for TaskPriority(0);
  sub_10000251C((uint64_t)v16, 1, 1, v26);
  v27 = (_QWORD *)swift_allocObject(&unk_10002A8F8, 72, 7);
  v27[2] = 0;
  v27[3] = 0;
  v27[4] = a3;
  v27[5] = a4;
  v27[6] = a6;
  v27[7] = a7;
  v27[8] = a5;
  swift_retain(a3);
  swift_retain(a4);
  swift_bridgeObjectRetain(a7);
  v28 = a5;
  v29 = sub_10001CEB8((uint64_t)v16, (uint64_t)&unk_10002DD00, (uint64_t)v27);
  return swift_release(v29);
}

uint64_t sub_10001CDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  return swift_task_switch(sub_10001CE14, 0, 0);
}

uint64_t sub_10001CE14(uint64_t a1)
{
  uint64_t v1;

  AppDependency.wrappedValue.getter((_QWORD *)(v1 + 16), a1);
  *(_QWORD *)(v1 + 56) = *(_QWORD *)(v1 + 16);
  return sub_100004E54();
}

uint64_t sub_10001CE50()
{
  sub_100005224();
  sub_10001E2C0();
  sub_100004FD0();
  return sub_100004E54();
}

uint64_t sub_10001CE88()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 48), "start");
  return sub_10000E1AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10001CEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  if (sub_100002A8C(a1, 1, v6) == 1)
  {
    sub_10001DE0C(a1);
    v7 = 7168;
  }
  else
  {
    v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    v7 = v8 | 0x1C00;
  }
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(a3 + 24);
    ObjectType = swift_getObjectType(*(_QWORD *)(a3 + 16));
    swift_unknownObjectRetain(v9, v12);
    v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    v15 = v14;
    swift_unknownObjectRelease(v9);
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = swift_allocObject(&unk_10002A860, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v15 | v13)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v13;
    v19[3] = v15;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v7, v17, (char *)&type metadata for () + 8, &unk_10002DC80, v16);
}

id sub_10001CFF4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = &v2[OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_continuation];
  v6 = sub_1000024DC(&qword_10002DC88);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  *(_QWORD *)&v2[OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker] = a2;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate(0);
  v8 = objc_msgSendSuper2(&v10, "init");
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v8;
}

uint64_t sub_10001D0A0(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  v5 = sub_1000024DC(&qword_10002DC60);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  sub_10000251C((uint64_t)v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_10002A888, 56, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = v2;
  v10 = a2;
  v11 = v2;
  v12 = a1;
  v13 = sub_10001CEB8((uint64_t)v7, (uint64_t)&unk_10002DC98, (uint64_t)v9);
  return swift_release(v13);
}

uint64_t sub_10001D170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch(sub_10001D18C, 0, 0);
}

uint64_t sub_10001D18C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = objc_opt_self(WFWidgetWorkflowRunnerClient);
  v3 = sub_10001E27C(v2);
  if (v1)
  {
    v4 = (void *)v3;
    v5 = *(void **)(v0 + 24);
    v6 = *(id *)(v0 + 16);
    v7 = v5;
    v8 = sub_10001DFE8(objc_msgSend(v4, "context"));
    *(_QWORD *)(v0 + 40) = v9;
    if (v9)
    {
      v10 = *(_QWORD *)(v0 + 32);
      *(_QWORD *)(v0 + 48) = v8;
      v11 = *(_QWORD *)(v10
                      + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
      *(_QWORD *)(v0 + 56) = v11;
      sub_10001E2F4();
      return sub_10001E234((uint64_t)sub_10001D24C, v11, 0);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001D24C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1000053EC(*(void **)(v0 + 24), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 40));
  sub_100009C40();
  sub_10001E2C0();
  sub_100004FD0();
  return sub_10001E1E4(v1, v2, v3);
}

uint64_t sub_10001D290()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);

  return sub_10000E1AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10001D324(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_1000024DC(&qword_10002DC60);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority(0);
  sub_10000251C((uint64_t)v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject(&unk_10002A838, 56, 7);
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a3;
  v10[6] = v3;
  v11 = a1;
  swift_errorRetain(a3);
  v12 = v3;
  v13 = sub_10001CEB8((uint64_t)v8, (uint64_t)&unk_10002DC70, (uint64_t)v10);
  return swift_release(v13);
}

uint64_t sub_10001D3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v7 = sub_1000024DC(&qword_10002DC88);
  v6[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[7] = v8;
  v6[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001D460, 0, 0);
}

uint64_t sub_10001D460()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 24);
  v2 = objc_opt_self(WFWidgetWorkflowRunnerClient);
  v3 = (void *)sub_10001E27C(v2);
  v4 = v1;
  *(_QWORD *)(v0 + 72) = sub_10001DFE8(objc_msgSend(v3, "context"));
  *(_QWORD *)(v0 + 80) = v5;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 40);
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    if (v10)
    {
      sub_10001E294(v8);
      *(_QWORD *)(v0 + 16) = v10;
      swift_errorRetain(v10);
      CheckedContinuation.resume(throwing:)(v0 + 16, v9);
    }
    else
    {
      v12 = sub_10001E294(v8);
      CheckedContinuation.resume(returning:)(v12, v9);
    }
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v9);
    v13 = *(_QWORD *)(*(_QWORD *)(v0 + 40)
                    + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker);
    *(_QWORD *)(v0 + 88) = v13;
    sub_10001E2F4();
    return swift_task_switch(sub_10001D588, v13, 0);
  }
  else
  {

    swift_task_dealloc(*(_QWORD *)(v0 + 64));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10001D588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100005700();
  sub_100009C40();
  sub_10001E2C0();
  sub_100004FD0();
  return sub_10001E1E4(v0, v1, v2);
}

uint64_t sub_10001D5C8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return sub_10000E1AC(*(uint64_t (**)(void))(v0 + 8));
}

void sub_10001D680()
{
  _swift_stdlib_reportUnimplementedInitializer("ShortcutsWidgetExtension.RunnerClientDelegate", 45, "init()", 6, 0);
  __break(1u);
}

id sub_10001D6CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RunShortcutIntent.RunnerClientDelegate(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001D754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10001C230();
  v3 = type metadata accessor for LocalizedStringResource(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_10001D794(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10002DCE4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10001E1D0;
  return sub_10001C490(a1, v5, v4);
}

void sub_10001D7F8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_10001C274();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10001D81C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100010DB4();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001D848()
{
  unint64_t result;

  result = qword_10002DB30;
  if (!qword_10002DB30)
  {
    result = swift_getWitnessTable(&unk_100024204, &type metadata for ControlSortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002DB30);
  }
  return result;
}

uint64_t sub_10001D884(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = a1;
  sub_100004FD0();
  return swift_task_switch(v2, v3, v4);
}

uint64_t sub_10001D8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc(dword_10002DCB4);
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_10001D908;
  return sub_10000F2A4(a2, a3);
}

uint64_t sub_10001D908(uint64_t a1)
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
  return sub_10001E1D8(*(uint64_t (**)(void))(v6 + 8));
}

unint64_t sub_10001D960()
{
  unint64_t result;

  result = qword_10002DB40;
  if (!qword_10002DB40)
  {
    result = swift_getWitnessTable(&unk_10002425C, &type metadata for ControlSortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002DB40);
  }
  return result;
}

unint64_t sub_10001D9A0()
{
  unint64_t result;

  result = qword_10002DB48;
  if (!qword_10002DB48)
  {
    result = swift_getWitnessTable(&unk_1000242BC, &type metadata for ControlSortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002DB48);
  }
  return result;
}

uint64_t sub_10001D9DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10002DCAC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000F880;
  return sub_10000F0F0(a1);
}

uint64_t sub_10001DA30(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc(dword_10002DCA4);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_10001E1D4;
  return sub_10001D884(v3);
}

unint64_t sub_10001DA84()
{
  unint64_t result;

  result = qword_10002DB68;
  if (!qword_10002DB68)
  {
    result = swift_getWitnessTable(&unk_1000242E4, &type metadata for ControlSortedVisibleShortcutsQuery);
    atomic_store(result, (unint64_t *)&qword_10002DB68);
  }
  return result;
}

uint64_t sub_10001DAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001D848();
  *v5 = v2;
  v5[1] = sub_10001DB2C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10001DB2C()
{
  uint64_t v0;

  sub_100010C98();
  return sub_10000E1AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10001DB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10001DB2C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_10001DBBC()
{
  return type metadata accessor for RunShortcutIntent.RunnerClientDelegate(0);
}

uint64_t type metadata accessor for RunShortcutIntent.RunnerClientDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_10002DC30;
  if (!qword_10002DC30)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RunShortcutIntent.RunnerClientDelegate);
  return result;
}

void sub_10001DBFC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_10001DC74(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
  }
}

void sub_10001DC74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10002DC40)
  {
    v2 = sub_100002608(&qword_10002CC00);
    v3 = type metadata accessor for CheckedContinuation(a1, (char *)&type metadata for () + 8, v2, &protocol self-conformance witness table for Error);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10002DC40);
  }
}

ValueMetadata *type metadata accessor for ControlSortedVisibleShortcutsQuery()
{
  return &type metadata for ControlSortedVisibleShortcutsQuery;
}

uint64_t *sub_10001DCF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  sub_10001E2F4();
  return a1;
}

ValueMetadata *type metadata accessor for RunShortcutIntent()
{
  return &type metadata for RunShortcutIntent;
}

unint64_t sub_10001DD38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DC50;
  if (!qword_10002DC50)
  {
    v1 = sub_100002608(&qword_10002CBF0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DC50);
  }
  return result;
}

uint64_t sub_10001DD7C()
{
  uint64_t v0;

  sub_10001E2C8();

  swift_errorRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001DDB4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10001E2E0();
  v1 = (_QWORD *)swift_task_alloc(dword_10002DC6C);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_10001E208(v1);
  return sub_10001D3F8(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_10001DE0C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000024DC(&qword_10002DC60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001DE4C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10001DE64, 0, 0);
}

uint64_t sub_10001DE64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10002C9D8 != -1)
    swift_once(&qword_10002C9D8, sub_100004FF0);
  v1 = qword_100030E98;
  **(_QWORD **)(v0 + 16) = qword_100030E98;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return sub_10000E1AC(v3);
}

uint64_t sub_10001DECC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001DF30;
  return v6(a1);
}

uint64_t sub_10001DF30()
{
  uint64_t (*v0)(void);

  sub_100010C98();
  v0 = (uint64_t (*)(void))sub_10001E2B4();
  return sub_10000E1AC(v0);
}

uint64_t sub_10001DF54()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001DF78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10002DC7C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001DB2C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002DC78 + dword_10002DC78))(a1, v4);
}

uint64_t sub_10001DFE8(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "workflowIdentifier");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_10001E054()
{
  id *v0;

  sub_10001E2C8();

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001E08C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10001E2E0();
  v1 = (_QWORD *)swift_task_alloc(dword_10002DC94);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_10001E208(v1);
  return sub_10001D170(v2, v3, v4, v5, v6, v7);
}

unint64_t sub_10001E0E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DCF0;
  if (!qword_10002DCF0)
  {
    v1 = objc_opt_self(WFWidgetWorkflowRunnerClient);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_10002DCF0);
  }
  return result;
}

uint64_t sub_10001E120(uint64_t a1)
{
  uint64_t v1;

  return sub_10001CC50(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_10001E130()
{
  uint64_t v0;

  sub_10001E2C8();
  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));

  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001E170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = swift_task_alloc(dword_10002DCFC);
  v5 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_10001E1D0;
  *(_OWORD *)(v4 + 40) = v5;
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  sub_100004FD0();
  return sub_10001E234(v6, v7, v8);
}

uint64_t sub_10001E1D8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001E1E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_10001E1F0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001E208(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_10001E22C()
{
  uint64_t v0;

  return swift_task_dealloc(*(_QWORD *)(v0 + 424));
}

uint64_t sub_10001E234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_10001E244(uint64_t a1)
{
  uint64_t v1;

  return sub_10000251C(a1, 1, 1, v1);
}

uint64_t sub_10001E254(uint64_t a1)
{
  uint64_t v1;

  return sub_10000251C(a1, 1, 1, v1);
}

uint64_t sub_10001E264()
{
  return LocalizedStringResource.init(stringLiteral:)(0x74756374726F6853, 0xE800000000000000);
}

uint64_t sub_10001E27C(uint64_t a1)
{
  uint64_t v1;

  return swift_dynamicCastObjCClassUnconditional(v1, a1, 0, 0, 0);
}

uint64_t sub_10001E294@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, a1 + v1, v2);
}

uint64_t sub_10001E2A8()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10001E2B4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_10001E2C0()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10001E2C8()
{
  uint64_t v0;

  return swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10001E2D0()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10001E2D8()
{
  return type metadata accessor for LocalizedStringResource(0);
}

uint64_t sub_10001E2F4()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_10001E2FC()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10001E304(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = a1;
  v3 = *(_QWORD *)&aRoot_2[8 * a1];
  v4 = *(_QWORD *)&aAdvancedlegaln_0[8 * v2 + 16];
  v5 = *(_QWORD *)&aRoot_2[8 * a2];
  v6 = *(_QWORD *)&aAdvancedlegaln_0[8 * a2 + 16];
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0);
  swift_bridgeObjectRelease(v4);
  sub_100018034();
  return v8 & 1;
}

void sub_10001E384()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(objc_allocWithZone((Class)WFWorkflowQuery), "initWithLocation:", 0);
  objc_msgSend(v1, "setResultsLimit:", 1);
  v2 = objc_msgSend(*(id *)(v0 + 16), "sortedWorkflowsWithQuery:", v1);
  v3 = objc_msgSend(v2, "descriptors");

  v5 = sub_10001EC08(v4, &qword_10002DE18, WFWorkflowReference_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v5);

  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v9 = _CocoaArrayWrapper.endIndex.getter(v8);
    sub_100018034();
    if (!v9)
      goto LABEL_6;
  }
  else if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    sub_100018034();

    sub_100009BDC();
    return;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)(0, v6);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

void sub_10001E4B0()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + 16), "sortedVisibleWorkflowsByNameWithLimit:", 300);
  v2 = objc_msgSend(v1, "descriptors");
  v3 = sub_10001EC08((uint64_t)v2, &qword_10002DE18, WFWorkflowReference_ptr);
  sub_10001EBFC(v3);

  sub_100009BDC();
}

void sub_10001E528()
{
  uint64_t v0;
  void *v1;
  NSArray v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 16);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  LOWORD(v7) = 0;
  v3 = sub_10001EC28(v1, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", (uint64_t)v2.super.isa, 0, 0);
  sub_10001EC10();
  v4 = objc_msgSend(v1, "descriptors", v7, 0);
  sub_10001EC44();
  v6 = sub_10001EC08(v5, &qword_10002DE18, WFWorkflowReference_ptr);
  sub_10001EBFC(v6);
  sub_10001EC10();
  sub_10001EC4C();
}

void sub_10001E5C0()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 16);
  v2 = String._bridgeToObjectiveC()();
  LOWORD(v7) = 0;
  v3 = sub_10001EC28(v1, "visibleReferencesForWorkflowIDs:sortBy:nameContaining:nameEqualing:associatedAppBundleIdentifier:hasTombstonedConflicts:isRecentlyModified:isRecentlyRun:limitTo:", 0, 0, (uint64_t)v2);
  sub_10001EC10();
  v4 = objc_msgSend(v1, "descriptors", v7, 300);
  sub_10001EC44();
  v6 = sub_10001EC08(v5, &qword_10002DE18, WFWorkflowReference_ptr);
  sub_10001EBFC(v6);
  sub_10001EC10();
  sub_10001EC4C();
}

id sub_10001E654()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(*(id *)(v0 + 16), "sortedVisibleFolders");
  v2 = objc_msgSend(v1, "descriptors");
  sub_10001EC44();
  v4 = sub_10001EC08(v3, &qword_10002DE38, WFWorkflowCollection_ptr);
  sub_10001EBFC(v4);
  sub_10001EC10();
  return v1;
}

uint64_t sub_10001E6C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for ShortcutsWidgetDataSource();
  v1 = swift_allocObject(v0, 32, 7);
  result = sub_10001E6F8();
  qword_100030F80 = v1;
  return result;
}

uint64_t sub_10001E6F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _BYTE v28[16];
  id v29;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v28[-v7];
  *(_QWORD *)(v0 + 24) = 300;
  v9 = objc_msgSend((id)objc_opt_self(RBSTarget), "currentProcess");
  v10 = sub_1000024DC(&qword_10002DE20);
  v11 = swift_allocObject(v10, 40, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100024370;
  sub_10001EC08(v11, &qword_10002DE28, RBSDomainAttribute_ptr);
  *(_QWORD *)(v11 + 32) = sub_10001EA4C(0xD000000000000013, 0x80000001000207A0, 0xD000000000000011, 0x80000001000207C0);
  v29 = (id)v11;
  specialized Array._endMutation()();
  v12 = (uint64_t)v29;
  v13 = objc_allocWithZone((Class)RBSAssertion);
  v14 = sub_10001EB20(0xD000000000000013, 0x8000000100020780, v9, v12);
  v29 = 0;
  v15 = objc_msgSend(v14, "acquireWithError:", &v29);
  v16 = v29;
  if (v15)
  {
    v17 = v29;
  }
  else
  {
    v9 = v29;
    v18 = _convertNSErrorToError(_:)(v16);

    LOBYTE(v9) = v18;
    swift_willThrow();
    v19 = static WFLog.subscript.getter(WFLogCategoryWidget);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.debug.getter();
    if (sub_10001EC18(v21))
    {
      v22 = (uint8_t *)sub_10001EC38();
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v18, "Failed to acquire database initialization assertion", v22, 2u);
      sub_100019F08((uint64_t)v22);
    }
    swift_errorRelease(v18);

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
  }
  if (objc_msgSend((id)objc_opt_self(WFInitialization), "initializeProcessWithDatabase:", 1))
  {
    v23 = static WFLog.subscript.getter(WFLogCategoryWidget);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (sub_10001EC18(v25))
    {
      v26 = (uint8_t *)sub_10001EC38();
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v9, "Failed to initialize database", v26, 2u);
      sub_100019F08((uint64_t)v26);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
  }
  *(_QWORD *)(v1 + 16) = objc_msgSend((id)objc_opt_self(WFDatabase), "defaultDatabase");
  WFWorkflowIconDrawerGloballyCacheDrawerContext();
  objc_msgSend(v14, "invalidate");

  return v1;
}

id sub_10001EA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  NSString v7;
  NSString v8;
  id v9;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), "attributeWithDomain:name:", v7, v8);

  return v9;
}

uint64_t sub_10001EADC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ShortcutsWidgetDataSource()
{
  return objc_opt_self(_TtC24ShortcutsWidgetExtension25ShortcutsWidgetDataSource);
}

id sub_10001EB20(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v4;
  NSString v8;
  Class isa;
  id v10;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  sub_10001EBC4(0, &qword_10002DE30, RBSAttribute_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a4);
  v10 = objc_msgSend(v4, "initWithExplanation:target:attributes:", v8, a3, isa);

  return v10;
}

uint64_t sub_10001EBC4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10001EBFC(uint64_t a1)
{
  uint64_t v1;

  return static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, a1);
}

uint64_t sub_10001EC08(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_10001EBC4(0, a2, a3);
}

void sub_10001EC10()
{
  void *v0;

}

BOOL sub_10001EC18(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id sub_10001EC28(id a1, SEL a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, a2, a3, a4, a5, 0, 0, 0);
}

uint64_t sub_10001EC38()
{
  return swift_slowAlloc(2, -1);
}

void sub_10001EC44()
{
  void *v0;

}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24ShortcutsWidgetExtensionP33_E0A3DE2C7987C041B0EB4377DF4F689319ResourceBundleClass);
}

id sub_10001EC78(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = sub_10001ECD0();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v1, v1, 0));

  return v4;
}

id sub_10001ECD0()
{
  if (qword_100030E78 != -1)
    dispatch_once(&qword_100030E78, &stru_10002AA68);
  return (id)qword_100030E70;
}

void sub_10001ED10(id a1)
{
  BOOL v1;
  uint64_t WFGeneralLogObject;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Dl_info v7;
  uint8_t buf[4];
  const char *v9;

  memset(&v7, 0, sizeof(v7));
  if (dladdr(sub_10001ECD0, &v7))
    v1 = v7.dli_fname == 0;
  else
    v1 = 1;
  if (v1)
  {
    WFGeneralLogObject = getWFGeneralLogObject();
    v3 = objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "WFCurrentBundle_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
  else
  {
    v3 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v7.dli_fname, 0, 0);
    v4 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    v5 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v4));
    v6 = (void *)qword_100030E70;
    qword_100030E70 = v5;

  }
}

id sub_10001EE30(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  v5 = sub_10001ECD0();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v4, v3, 0));

  return v7;
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}
