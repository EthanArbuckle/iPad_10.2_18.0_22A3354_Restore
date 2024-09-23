uint64_t sub_100002854@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  _OWORD v23[3];

  v4 = (int *)type metadata accessor for HorizontalTipViewWithBody(0);
  __chkstk_darwin();
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = enum case for WidgetFamily.systemMedium(_:);
  v8 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v6, v7, v8);
  v9 = GeometryProxy.size.getter(a1);
  GeometryProxy.size.getter(v10);
  *(_QWORD *)&v6[v4[5]] = a1;
  *(double *)&v6[v4[6]] = v9;
  *(_QWORD *)&v6[v4[7]] = v11;
  v13 = GeometryProxy.size.getter(v12);
  v15 = GeometryProxy.size.getter(v14);
  v17 = v16;
  v18 = static Alignment.bottom.getter(v15);
  _FrameLayout.init(width:height:alignment:)(v23, *(_QWORD *)&v13, 0, v17, 0, v18, v19);
  sub_100002F10((uint64_t)v6, a2);
  v20 = (_OWORD *)(a2 + *(int *)(sub_100002A38(&qword_100024600) + 36));
  v21 = v23[1];
  *v20 = v23[0];
  v20[1] = v21;
  v20[2] = v23[2];
  return sub_100002F54((uint64_t)v6);
}

uint64_t sub_100002998()
{
  return static View._viewListCount(inputs:)();
}

id sub_1000029B0@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  void **v1;
  uint64_t v3;
  void *v5;

  v5 = *v1;
  v3 = swift_allocObject(&unk_100021028, 24, 7);
  *(_QWORD *)(v3 + 16) = v5;
  *a1 = sub_100002F08;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;
  return v5;
}

uint64_t variable initialization expression of TipsWidgetWrapperView._family@<X0>(_QWORD *a1@<X8>)
{
  return sub_100002B8C((uint64_t)&unk_10001ACF0, &qword_1000245E0, a1);
}

uint64_t sub_100002A18()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100002A38(uint64_t *a1)
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

uint64_t variable initialization expression of LargeTipView._colorScheme@<X0>(_QWORD *a1@<X8>)
{
  return sub_100002B8C((uint64_t)&unk_10001AD20, &qword_1000245E8, a1);
}

uint64_t sub_100002A8C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100002AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t variable initialization expression of LargeTipView._renderingMode@<X0>(_QWORD *a1@<X8>)
{
  return sub_100002B8C((uint64_t)&unk_10001AD50, &qword_1000245F0, a1);
}

uint64_t sub_100002AD4()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100002AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_100002B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t variable initialization expression of HorizontalTipViewWithBody.widgetContent()
{
  return 0;
}

uint64_t sub_100002B8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;

  *a3 = swift_getKeyPath(a1);
  v5 = sub_100002A38(a2);
  return swift_storeEnumTagMultiPayload(a3, v5, 0);
}

uint64_t variable initialization expression of DocumentEntry.relevance@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for TimelineEntryRelevance(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SquareTitleView._showsWidgetBackground()
{
  return swift_getKeyPath(&unk_10001AD80);
}

uint64_t sub_100002C24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v1 = sub_1000031D0(&qword_100024608, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  EnvironmentValues.subscript.getter(&v3, v0, v0, v1);
  return v3;
}

_QWORD *sub_100002C84@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  v2 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v3 = sub_1000031D0(&qword_100024608, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  result = EnvironmentValues.subscript.getter(&v5, v2, v2, v3);
  *a1 = v5;
  return result;
}

uint64_t variable initialization expression of BackgroundGradient.endPoint()
{
  return 0;
}

__n128 sub_100002D08(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002D18(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100002D38(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100002FA4(a1, &qword_1000245F8, (uint64_t)&unk_100020F80);
}

void **initializeBufferWithCopyOfBuffer for MediumTipView(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for MediumTipView(id *a1)
{

}

void **assignWithCopy for MediumTipView(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *initializeWithTake for MediumTipView(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for MediumTipView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MediumTipView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumTipView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for MediumTipView()
{
  return &type metadata for MediumTipView;
}

uint64_t sub_100002ED4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DCF0, 1);
}

uint64_t sub_100002EE4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100002F08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100002854(*(void **)(v1 + 16), a1);
}

uint64_t sub_100002F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HorizontalTipViewWithBody(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100002F54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HorizontalTipViewWithBody(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100002FA4(a1, &qword_100024610, (uint64_t)&unk_100021050);
}

void sub_100002FA4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

unint64_t sub_100002FEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024618;
  if (!qword_100024618)
  {
    v1 = sub_100003038(&qword_100024620);
    result = swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024618);
  }
  return result;
}

uint64_t sub_100003038(uint64_t *a1)
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

uint64_t sub_10000307C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10001AE78, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_1000030B8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10001AE78, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100003100(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  WitnessTable = swift_getWitnessTable(&unk_10001AE78, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_100003158(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_10001AE78, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_1000031A4()
{
  return sub_1000031D0(&qword_100024BB0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AEA4);
}

uint64_t sub_1000031D0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100003210()
{
  return sub_1000031D0(&qword_100024628, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)"ub");
}

uint64_t sub_100003240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000572C(v2, qword_100026488);
  v5 = sub_1000056D0(v0, (uint64_t)qword_100026488);
  v6 = (void *)objc_opt_self(TPSDocument);
  v7 = TPSAnalyticsLaunchTypeWidget;
  v8 = objc_msgSend(v6, "URLWithTipIdentifier:collectionIdentifier:referrer:", 0, 0, v7);

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v4, v0);
}

uint64_t sub_100003338@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_100002A38(&qword_100024630);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002A38(&qword_100024B90);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v28 - v9;
  v11 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for WidgetFamily.accessoryCircular(_:), v11);
  v15 = sub_1000031D0(&qword_100024720, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v29, v11, v15);
  dispatch thunk of RawRepresentable.rawValue.getter(&v28, v11, v15);
  v17 = v28;
  v16 = v29;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v16 != v17)
  {
    sub_1000057B0(a1, (uint64_t)v5, &qword_100024630);
    v18 = type metadata accessor for DocumentEntry(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v5, 1, v18) == 1)
    {
      sub_100004A5C((uint64_t)v5, &qword_100024630);
    }
    else
    {
      v19 = *(void **)&v5[*(int *)(v18 + 24)];
      v20 = v19;
      sub_100004190((uint64_t)v5, type metadata accessor for DocumentEntry);
      if (v19)
      {
        v21 = objc_msgSend(v20, "URLWithReferrer:", TPSAnalyticsLaunchTypeWidget);

        if (v21)
        {
          static URL._unconditionallyBridgeFromObjectiveC(_:)(v21);

          v22 = type metadata accessor for URL(0);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 0, 1, v22);
        }
        else
        {
          v22 = type metadata accessor for URL(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 1, 1, v22);
        }
        sub_1000056E8((uint64_t)v8, (uint64_t)v10, &qword_100024B90);
        type metadata accessor for URL(0);
        v27 = *(_QWORD *)(v22 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v10, 1, v22) != 1)
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(a2, v10, v22);
        goto LABEL_8;
      }
    }
    v23 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v10, 1, 1, v23);
LABEL_8:
    sub_100004A5C((uint64_t)v10, &qword_100024B90);
  }
  if (qword_1000245C0 != -1)
    swift_once(&qword_1000245C0, sub_100003240);
  v24 = type metadata accessor for URL(0);
  v25 = sub_1000056D0(v24, (uint64_t)qword_100026488);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a2, v25, v24);
}

uint64_t TipsWidgetWrapperView.family.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100003740(&qword_1000245E0, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, a1);
}

uint64_t sub_1000036E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100003740(&qword_1000245E0, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, a1);
}

uint64_t sub_100003710@<X0>(uint64_t a1@<X8>)
{
  return sub_100003740(&qword_1000245E8, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, (char *)0x686353726F6C6F43, (char *)0xEB00000000656D65, a1);
}

uint64_t sub_100003740@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v25 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100002A38(a1);
  __chkstk_darwin();
  v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000057B0(v9, (uint64_t)v17, a1);
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
      v23 = swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v26 = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)(v23 + 4) = sub_10000522C(a3, v25, &v26);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100003948@<X0>(uint64_t a1@<X8>)
{
  return sub_100003740(&qword_1000245F0, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (char *)0xD000000000000013, (char *)0x800000010001EE50, a1);
}

uint64_t sub_100003974(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unsigned __int8 v15;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v10, v9))
  {
    v11 = swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v14 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = sub_10000522C((char *)0x6C6F6F42, (char *)0xE400000000000000, &v14);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_100005220(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t TipsWidgetWrapperView.init(entry:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *a2 = swift_getKeyPath(&unk_10001AF00);
  v4 = sub_100002A38(&qword_1000245E0);
  swift_storeEnumTagMultiPayload(a2, v4, 0);
  v5 = type metadata accessor for TipsWidgetWrapperView(0);
  return sub_1000056E8(a1, (uint64_t)a2 + *(int *)(v5 + 20), &qword_100024630);
}

uint64_t type metadata accessor for TipsWidgetWrapperView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000246D0;
  if (!qword_1000246D0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TipsWidgetWrapperView);
  return result;
}

uint64_t TipsWidgetWrapperView.body.getter@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a1;
  v2 = type metadata accessor for WidgetFamily(0);
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100002A38(&qword_100024B90);
  __chkstk_darwin(v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100002A38(&qword_100024630);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v32 - v12;
  v14 = type metadata accessor for TipsWidgetView(0);
  __chkstk_darwin(v14);
  v16 = (uint64_t *)((char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = sub_100002A38(&qword_100024638);
  __chkstk_darwin(v34);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_100002A38(&qword_100024640);
  v33 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(int *)(type metadata accessor for TipsWidgetWrapperView(0) + 20);
  v36 = v1;
  v22 = v1 + v21;
  sub_1000057B0(v1 + v21, (uint64_t)v13, &qword_100024630);
  *v16 = swift_getKeyPath(&unk_10001AF00);
  v23 = sub_100002A38(&qword_1000245E0);
  swift_storeEnumTagMultiPayload(v16, v23, 0);
  sub_1000056E8((uint64_t)v13, (uint64_t)v16 + *(int *)(v14 + 20), &qword_100024630);
  KeyPath = swift_getKeyPath(&unk_10001AF30);
  sub_1000057B0(v22, (uint64_t)v11, &qword_100024630);
  v25 = type metadata accessor for DocumentEntry(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48))(v11, 1, v25) == 1)
  {
    sub_100004A5C((uint64_t)v11, &qword_100024630);
    v26 = 1;
  }
  else
  {
    v26 = DocumentEntry.isPlaceholder.getter();
    sub_100004190((uint64_t)v11, type metadata accessor for DocumentEntry);
  }
  sub_10000407C((uint64_t)v16, (uint64_t)v18);
  v27 = v34;
  v28 = &v18[*(int *)(v34 + 36)];
  *(_QWORD *)v28 = KeyPath;
  v28[8] = v26 & 1;
  sub_100004190((uint64_t)v16, type metadata accessor for TipsWidgetView);
  sub_100003740(&qword_1000245E0, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, (uint64_t)v4);
  sub_100003338(v22, (uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
  v29 = type metadata accessor for URL(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 0, 1, v29);
  v30 = sub_1000040C0();
  View.widgetURL(_:)(v7, v27, v30);
  sub_100004A5C((uint64_t)v7, &qword_100024B90);
  sub_100004A5C((uint64_t)v18, &qword_100024638);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v39, v20, v35);
}

_QWORD *sub_100003F54@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_10000576C();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v2);
  *a1 = v4;
  return result;
}

_QWORD *sub_100003FA0@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_10000576C();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_100003FEC(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_10000576C();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v1);
}

uint64_t sub_100004034(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_10000576C();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v1);
}

uint64_t sub_10000407C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipsWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000040C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024648;
  if (!qword_100024648)
  {
    v1 = sub_100003038(&qword_100024638);
    sub_1000031D0(&qword_100024650, type metadata accessor for TipsWidgetView, (uint64_t)&unk_10001B1FC);
    sub_100004144();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024648);
  }
  return result;
}

unint64_t sub_100004144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024658;
  if (!qword_100024658)
  {
    v1 = sub_100003038(&qword_100024660);
    result = swift_getWitnessTable(&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024658);
  }
  return result;
}

uint64_t sub_100004190(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000041CC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of TipsWidgetWrapperView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for TipsWidgetWrapperView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
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
  void *v30;
  void (*v31)(char *, _QWORD, uint64_t, int *);
  id v32;
  id v33;

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
    v7 = sub_100002A38(&qword_1000245E0);
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
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = (int *)type metadata accessor for DocumentEntry(0);
    v18 = *((_QWORD *)v17 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_100002A38(&qword_100024630);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v20 = type metadata accessor for Date(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v15, v16, v20);
      v21 = v17[5];
      v22 = &v15[v21];
      v23 = &v16[v21];
      v24 = type metadata accessor for TimelineEntryRelevance(0);
      v25 = *(_QWORD *)(v24 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
      {
        v26 = sub_100002A38(&qword_100024668);
        memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      v27 = v17[6];
      v28 = *(void **)&v16[v27];
      *(_QWORD *)&v15[v27] = v28;
      v29 = v17[7];
      v30 = *(void **)&v16[v29];
      *(_QWORD *)&v15[v29] = v30;
      v31 = *(void (**)(char *, _QWORD, uint64_t, int *))(v18 + 56);
      v32 = v28;
      v33 = v30;
      v31(v15, 0, 1, v17);
    }
  }
  return a1;
}

void destroy for TipsWidgetWrapperView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_100002A38(&qword_1000245E0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (char *)a1 + *(int *)(a2 + 20);
  v7 = (int *)type metadata accessor for DocumentEntry(0);
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v7 - 1) + 48))(v6, 1, v7))
  {
    v8 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
    v9 = &v6[v7[5]];
    v10 = type metadata accessor for TimelineEntryRelevance(0);
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);

  }
}

uint64_t *initializeWithCopy for TipsWidgetWrapperView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void (*v29)(char *, _QWORD, uint64_t, int *);
  id v30;
  id v31;

  v6 = sub_100002A38(&qword_1000245E0);
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
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = (int *)type metadata accessor for DocumentEntry(0);
  v16 = *((_QWORD *)v15 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v16 + 48))(v14, 1, v15))
  {
    v17 = sub_100002A38(&qword_100024630);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v18 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v13, v14, v18);
    v19 = v15[5];
    v20 = &v13[v19];
    v21 = &v14[v19];
    v22 = type metadata accessor for TimelineEntryRelevance(0);
    v23 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      v24 = sub_100002A38(&qword_100024668);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
    v25 = v15[6];
    v26 = *(void **)&v14[v25];
    *(_QWORD *)&v13[v25] = v26;
    v27 = v15[7];
    v28 = *(void **)&v14[v27];
    *(_QWORD *)&v13[v27] = v28;
    v29 = *(void (**)(char *, _QWORD, uint64_t, int *))(v16 + 56);
    v30 = v26;
    v31 = v28;
    v29(v13, 0, 1, v15);
  }
  return a1;
}

uint64_t *assignWithCopy for TipsWidgetWrapperView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, int *);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void (*v41)(char *, _QWORD, uint64_t, int *);
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E0);
    v6 = sub_100002A38(&qword_1000245E0);
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
  }
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = (int *)type metadata accessor for DocumentEntry(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(uint64_t (**)(char *, uint64_t, int *))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (v19)
    {
      sub_100004190((uint64_t)v13, type metadata accessor for DocumentEntry);
      goto LABEL_12;
    }
    v28 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v13, v14, v28);
    v29 = v15[5];
    v30 = &v13[v29];
    v31 = &v14[v29];
    v32 = type metadata accessor for TimelineEntryRelevance(0);
    v33 = *(_QWORD *)(v32 - 8);
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    v35 = v34(v30, 1, v32);
    v36 = v34(v31, 1, v32);
    if (v35)
    {
      if (!v36)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_21:
        v45 = v15[6];
        v46 = *(void **)&v13[v45];
        v47 = *(void **)&v14[v45];
        *(_QWORD *)&v13[v45] = v47;
        v48 = v47;

        v49 = v15[7];
        v50 = *(void **)&v13[v49];
        v51 = *(void **)&v14[v49];
        *(_QWORD *)&v13[v49] = v51;
        v52 = v51;

        return a1;
      }
    }
    else
    {
      if (!v36)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    }
    v44 = sub_100002A38(&qword_100024668);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_21;
  }
  if (v19)
  {
LABEL_12:
    v27 = sub_100002A38(&qword_100024630);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  v20 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v13, v14, v20);
  v21 = v15[5];
  v22 = &v13[v21];
  v23 = &v14[v21];
  v24 = type metadata accessor for TimelineEntryRelevance(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = sub_100002A38(&qword_100024668);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  v37 = v15[6];
  v38 = *(void **)&v14[v37];
  *(_QWORD *)&v13[v37] = v38;
  v39 = v15[7];
  v40 = *(void **)&v14[v39];
  *(_QWORD *)&v13[v39] = v40;
  v41 = *(void (**)(char *, _QWORD, uint64_t, int *))(v16 + 56);
  v42 = v38;
  v43 = v40;
  v41(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_100004A5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100002A38(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for TipsWidgetWrapperView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_100002A38(&qword_1000245E0);
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
  v11 = (int *)type metadata accessor for DocumentEntry(0);
  v12 = *((_QWORD *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_100002A38(&qword_100024630);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v14 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v9, v10, v14);
    v15 = v11[5];
    v16 = &v9[v15];
    v17 = &v10[v15];
    v18 = type metadata accessor for TimelineEntryRelevance(0);
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = sub_100002A38(&qword_100024668);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    *(_QWORD *)&v9[v11[6]] = *(_QWORD *)&v10[v11[6]];
    *(_QWORD *)&v9[v11[7]] = *(_QWORD *)&v10[v11[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithTake for TipsWidgetWrapperView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, int *);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E0);
    v6 = sub_100002A38(&qword_1000245E0);
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
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = (int *)type metadata accessor for DocumentEntry(0);
  v12 = *((_QWORD *)v11 - 1);
  v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_100004190((uint64_t)v9, type metadata accessor for DocumentEntry);
      goto LABEL_11;
    }
    v24 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v9, v10, v24);
    v25 = v11[5];
    v26 = &v9[v25];
    v27 = &v10[v25];
    v28 = type metadata accessor for TimelineEntryRelevance(0);
    v29 = *(_QWORD *)(v28 - 8);
    v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    v31 = v30(v26, 1, v28);
    v32 = v30(v27, 1, v28);
    if (v31)
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_20:
        v34 = v11[6];
        v35 = *(void **)&v9[v34];
        *(_QWORD *)&v9[v34] = *(_QWORD *)&v10[v34];

        v36 = v11[7];
        v37 = *(void **)&v9[v36];
        *(_QWORD *)&v9[v36] = *(_QWORD *)&v10[v36];

        return a1;
      }
    }
    else
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v26, v27, v28);
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
    }
    v33 = sub_100002A38(&qword_100024668);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_20;
  }
  if (v15)
  {
LABEL_11:
    v23 = sub_100002A38(&qword_100024630);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v9, v10, v16);
  v17 = v11[5];
  v18 = &v9[v17];
  v19 = &v10[v17];
  v20 = type metadata accessor for TimelineEntryRelevance(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = sub_100002A38(&qword_100024668);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(_QWORD *)&v9[v11[6]] = *(_QWORD *)&v10[v11[6]];
  *(_QWORD *)&v9[v11[7]] = *(_QWORD *)&v10[v11[7]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for TipsWidgetWrapperView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004FBC);
}

uint64_t sub_100004FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_100002A38(&qword_100024670);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_100002A38(&qword_100024630);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TipsWidgetWrapperView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005044);
}

uint64_t sub_100005044(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_100002A38(&qword_100024670);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_100002A38(&qword_100024630);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1000050C8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  sub_10000517C(319, &qword_1000246E0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000517C(319, (unint64_t *)&unk_1000246E8, type metadata accessor for DocumentEntry, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v6, a1 + 16);
    }
  }
}

void sub_10000517C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1000051D4()
{
  _QWORD v1[2];

  v1[0] = sub_100003038(&qword_100024638);
  v1[1] = sub_1000040C0();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
}

uint64_t sub_100005220(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

char *sub_10000522C(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_1000052FC(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005418((uint64_t)v12, *a3);
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
      sub_100005418((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000053F8(v12);
  return v7;
}

char *sub_1000052FC(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005454(a5, a6);
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

uint64_t sub_1000053F8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005418(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100005454(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_1000054E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000055E4(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_1000055E4((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_1000054E8(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005580(v4, 0);
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

_QWORD *sub_100005580(uint64_t a1, uint64_t a2)
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
  v4 = sub_100002A38(&qword_100024718);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000055E4(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002A38(&qword_100024718);
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
    if (v11 != a4 || v13 >= &v14[v8])
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

uint64_t sub_1000056D0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000056E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100002A38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_10000572C(uint64_t a1, uint64_t *a2)
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

unint64_t sub_10000576C()
{
  unint64_t result;

  result = qword_100024728;
  if (!qword_100024728)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for IsPlaceholderKey, &type metadata for IsPlaceholderKey);
    atomic_store(result, (unint64_t *)&qword_100024728);
  }
  return result;
}

uint64_t sub_1000057B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100002A38(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_1000057F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double result;
  _BYTE v44[8];
  char v45;
  char v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  __int128 v60;

  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = &v44[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = *(double *)(a2 + 8);
  GeometryProxy.size.getter(v12);
  v16 = v15;
  sub_10000817C(a2, (uint64_t)v13, type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(&v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v6);
  v17 = *(unsigned __int8 *)(v10 + 80);
  v18 = (v17 + 16) & ~v17;
  v19 = *(unsigned __int8 *)(v7 + 80);
  v20 = (v11 + v19 + v18) & ~v19;
  v21 = swift_allocObject(&unk_100021180, v20 + v8, v17 | v19 | 7);
  sub_100007740((uint64_t)v13, v21 + v18);
  v22 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(v21 + v20, &v44[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
  v23 = GeometryProxy.size.getter(v22);
  v25 = GeometryProxy.size.getter(v24);
  v27 = GeometryProxy.size.getter(v26);
  v29 = v28;
  v30 = static Alignment.bottom.getter(v27);
  v32 = v31;
  if (v23 > v25)
  {
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(&v48, *(_QWORD *)&v23, 0, 0, 1, *(_QWORD *)&v25, 0, v29, 0, 0, 1, 0, 1, v30, v32);
  v35 = v48;
  v36 = v49;
  v37 = v50;
  v38 = v51;
  v39 = v52;
  v40 = v54;
  v41 = v56;
  v42 = v58;
  v47 = v53;
  v46 = v55;
  v45 = v57;
  v44[0] = v59;
  *(_QWORD *)a3 = 0x3FF0000000000000;
  *(double *)(a3 + 8) = 1.0 - v14 / v16;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = sub_10000789C;
  *(_QWORD *)(a3 + 32) = v21;
  *(_QWORD *)(a3 + 40) = v35;
  *(_BYTE *)(a3 + 48) = v36;
  *(_QWORD *)(a3 + 56) = v37;
  *(_BYTE *)(a3 + 64) = v38;
  *(_QWORD *)(a3 + 72) = v39;
  *(_BYTE *)(a3 + 80) = v47;
  *(_QWORD *)(a3 + 88) = v40;
  *(_BYTE *)(a3 + 96) = v46;
  *(_QWORD *)(a3 + 104) = v41;
  *(_BYTE *)(a3 + 112) = v45;
  *(_QWORD *)(a3 + 120) = v42;
  *(_BYTE *)(a3 + 128) = v44[0];
  result = *(double *)&v60;
  *(_OWORD *)(a3 + 136) = v60;
  return result;
}

uint64_t sub_100005AF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = sub_100002A38(&qword_1000248C8);
  return sub_100005B50(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_100005B50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = a2;
  v38 = type metadata accessor for HorizontalTipViewWithBody(0);
  __chkstk_darwin(v38);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100002A38(&qword_1000248D0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v39 = (uint64_t)&v37 - v9;
  v10 = type metadata accessor for ColorScheme(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ImageView(0);
  v15 = __chkstk_darwin(v14);
  v37 = (uint64_t)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v37 - v17;
  v19 = *(void **)(a1 + 16);
  v20 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1 + *(int *)(v20 + 24), v10);
  *(_QWORD *)v18 = swift_getKeyPath(&unk_10001B140);
  v18[8] = 0;
  *((_QWORD *)v18 + 2) = v19;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v18[*(int *)(v14 + 24)], v13, v10);
  v21 = enum case for WidgetFamily.systemLarge(_:);
  v22 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v4, v21, v22);
  v23 = *(void **)(a1 + 16);
  v24 = v23;
  v25 = GeometryProxy.size.getter(v19);
  v26 = *(double *)(a1 + 8);
  v27 = v38;
  *(_QWORD *)&v4[*(int *)(v38 + 20)] = v23;
  *(double *)&v4[*(int *)(v27 + 24)] = v25;
  *(double *)&v4[*(int *)(v27 + 28)] = v26;
  v29 = GeometryProxy.size.getter(v28);
  v30 = static Alignment.center.getter();
  sub_100005E90(0.0, 1, 0.0, 1, v29, 0, v26, 0, (uint64_t)v8, 0.0, 1, v26, 0, v30, v31);
  sub_100004190((uint64_t)v4, type metadata accessor for HorizontalTipViewWithBody);
  v32 = v39;
  sub_1000056E8((uint64_t)v8, v39, &qword_1000248D0);
  v33 = v37;
  sub_10000817C((uint64_t)v18, v37, type metadata accessor for ImageView);
  sub_1000057B0(v32, (uint64_t)v8, &qword_1000248D0);
  v34 = v40;
  sub_10000817C(v33, v40, type metadata accessor for ImageView);
  v35 = sub_100002A38(&qword_1000248D8);
  sub_1000057B0((uint64_t)v8, v34 + *(int *)(v35 + 48), &qword_1000248D0);
  sub_100004A5C(v32, &qword_1000248D0);
  sub_100004190((uint64_t)v18, type metadata accessor for ImageView);
  sub_100004A5C((uint64_t)v8, &qword_1000248D0);
  return sub_100004190(v33, type metadata accessor for ImageView);
}

__n128 sub_100005E90@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_10000817C(v16, a9, type metadata accessor for HorizontalTipViewWithBody);
  v35 = a9 + *(int *)(sub_100002A38(&qword_1000248D0) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

double sub_10000604C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_1000060A4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1000248E0, &qword_1000248E8).n128_u64[0];
  return result;
}

__n128 sub_1000060A4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __n128 result;
  unsigned int v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _OWORD v51[7];

  v18 = v17;
  v19 = a9;
  v20 = a17;
  v22 = a14;
  v21 = a15;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((_DWORD)v27)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v49 = a5;
    v50 = a7;
    v47 = a3;
    v48 = a1;
    v46 = v25;
    v45 = v27;
    v38 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v39 = (void *)static Log.runtimeIssuesLog.getter();
    v40 = v38;
    v19 = a9;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v39, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v27 = v45;
    v22 = a14;
    v21 = a15;
    v25 = v46;
    v24 = a10;
    v23 = a12;
    a3 = v47;
    a1 = v48;
    a5 = v49;
    a7 = v50;
    v20 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v51, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  sub_1000057B0(v18, v19, a16);
  v41 = v19 + *(int *)(sub_100002A38(v20) + 36);
  v42 = v51[5];
  *(_OWORD *)(v41 + 64) = v51[4];
  *(_OWORD *)(v41 + 80) = v42;
  *(_OWORD *)(v41 + 96) = v51[6];
  v43 = v51[1];
  *(_OWORD *)v41 = v51[0];
  *(_OWORD *)(v41 + 16) = v43;
  result = (__n128)v51[3];
  *(_OWORD *)(v41 + 32) = v51[2];
  *(__n128 *)(v41 + 48) = result;
  return result;
}

uint64_t sub_100006270@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  _OWORD *v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  _OWORD v54[7];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v53 = a7;
    v51 = a1;
    v52 = a5;
    v50 = a3;
    v49 = v20;
    v32 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v19 = a10;
    v20 = v49;
    a3 = v50;
    a1 = v51;
    a5 = v52;
    v18 = a12;
    a7 = v53;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v54, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[13];
  a9[12] = v15[12];
  a9[13] = v34;
  v35 = v15[14];
  v36 = v15[9];
  a9[8] = v15[8];
  a9[9] = v36;
  v37 = v15[11];
  a9[10] = v15[10];
  a9[11] = v37;
  v38 = v15[5];
  a9[4] = v15[4];
  a9[5] = v38;
  v39 = v15[7];
  a9[6] = v15[6];
  a9[7] = v39;
  v40 = v15[1];
  *a9 = *v15;
  a9[1] = v40;
  v41 = v15[3];
  a9[2] = v15[2];
  a9[3] = v41;
  v42 = v54[4];
  v43 = v54[5];
  v44 = v54[2];
  a9[18] = v54[3];
  a9[19] = v42;
  v45 = v54[6];
  a9[20] = v43;
  a9[21] = v45;
  v46 = v54[0];
  v47 = v54[1];
  a9[14] = v35;
  a9[15] = v46;
  a9[16] = v47;
  a9[17] = v44;
  return sub_100008718((uint64_t)v15);
}

double sub_100006440@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_1000060A4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1000248F0, &qword_1000248F8).n128_u64[0];
  return result;
}

uint64_t sub_100006498@<X0>(uint64_t a1@<X0>, double (**a2)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_10000817C(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_100021158, v7 + v5, v6 | 7);
  result = sub_100007740((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_100007784;
  a2[1] = (double (*)@<D0>(uint64_t@<X0>, uint64_t@<X8>))v8;
  return result;
}

uint64_t LargeTipView.init(widgetContent:unitSize:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  int *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t result;
  double *v13;

  *a2 = swift_getKeyPath(&unk_10001AFD0);
  v8 = sub_100002A38(&qword_1000245E8);
  swift_storeEnumTagMultiPayload(a2, v8, 0);
  v9 = (int *)type metadata accessor for LargeTipView(0);
  v10 = (_QWORD *)((char *)a2 + v9[5]);
  *v10 = swift_getKeyPath(&unk_10001B000);
  v11 = sub_100002A38(&qword_1000245F0);
  result = swift_storeEnumTagMultiPayload(v10, v11, 0);
  *(_QWORD *)((char *)a2 + v9[6]) = a1;
  v13 = (double *)((char *)a2 + v9[7]);
  *v13 = a3;
  v13[1] = a4;
  return result;
}

uint64_t type metadata accessor for LargeTipView(uint64_t a1)
{
  return sub_100007918(a1, (uint64_t *)&unk_1000247B8, (uint64_t)&nominal type descriptor for LargeTipView);
}

uint64_t LargeTipView.body.getter@<X0>(uint64_t a1@<X8>)
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
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;

  v33 = a1;
  v2 = type metadata accessor for WidgetRenderingMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v32 - v7;
  v9 = sub_100002A38(&qword_100024730);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = sub_100002A38(&qword_100024738);
  __chkstk_darwin(v32);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LargeTipView(0);
  v15 = (uint64_t *)(v1 + *(int *)(v14 + 28));
  v16 = *v15;
  v17 = v15[1];
  v18 = *(void **)(v1 + *(int *)(v14 + 24));
  v19 = (uint64_t)v11 + *(int *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) + 24);
  v20 = v18;
  sub_100003710(v19);
  *v11 = v16;
  v11[1] = v17;
  v11[2] = v18;
  v21 = sub_100003948((uint64_t)v8);
  static WidgetRenderingMode.accented.getter(v21);
  v22 = sub_1000031D0(&qword_100024740, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t)&protocol conformance descriptor for WidgetRenderingMode);
  LOBYTE(v19) = dispatch thunk of static Equatable.== infix(_:_:)(v8, v6, v2, v22);
  v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  v23(v6, v2);
  v24 = ((uint64_t (*)(char *, uint64_t))v23)(v8, v2);
  v25 = 0;
  if ((v19 & 1) == 0)
  {
    sub_10000686C();
    v26 = static UIColor.widgetBackgroundColor.getter();
    v24 = Color.init(_:)(v26);
    v25 = v24;
  }
  v27 = static Alignment.center.getter(v24);
  v29 = v28;
  sub_1000057B0((uint64_t)v11, (uint64_t)v13, &qword_100024730);
  v30 = &v13[*(int *)(v32 + 36)];
  *(_QWORD *)v30 = v25;
  *((_QWORD *)v30 + 1) = v27;
  *((_QWORD *)v30 + 2) = v29;
  sub_100004A5C((uint64_t)v11, &qword_100024730);
  return sub_1000056E8((uint64_t)v13, v33, &qword_100024738);
}

uint64_t type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(uint64_t a1)
{
  return sub_100007918(a1, qword_100024888, (uint64_t)&nominal type descriptor for LargeTipView.LargeTipWidgetConfiguration);
}

unint64_t sub_10000686C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024748;
  if (!qword_100024748)
  {
    v1 = objc_opt_self(UIColor);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100024748);
  }
  return result;
}

uint64_t sub_1000068A8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of LargeTipView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for LargeTipView(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v24;
  void *v25;
  id v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100002A38(&qword_1000245E8);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
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
    v14 = a3[5];
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100002A38(&qword_1000245F0);
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
    v23 = a3[6];
    v24 = a3[7];
    v25 = *(void **)((char *)a2 + v23);
    *(uint64_t *)((char *)a1 + v23) = (uint64_t)v25;
    *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
    v26 = v25;
  }
  return a1;
}

void destroy for LargeTipView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_100002A38(&qword_1000245E8);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_100002A38(&qword_1000245F0);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }

}

uint64_t *initializeWithCopy for LargeTipView(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v22;
  void *v23;
  id v24;

  v6 = sub_100002A38(&qword_1000245E8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
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
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100002A38(&qword_1000245F0);
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
  v21 = a3[6];
  v22 = a3[7];
  v23 = *(void **)((char *)a2 + v21);
  *(uint64_t *)((char *)a1 + v21) = (uint64_t)v23;
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  v24 = v23;
  return a1;
}

uint64_t *assignWithCopy for LargeTipView(uint64_t *a1, uint64_t *a2, int *a3)
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
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E8);
    v6 = sub_100002A38(&qword_1000245E8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
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
    v12 = a3[5];
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100004A5C((uint64_t)a1 + v12, &qword_1000245F0);
    v15 = sub_100002A38(&qword_1000245F0);
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
  v21 = a3[6];
  v22 = *(void **)((char *)a1 + v21);
  v23 = *(void **)((char *)a2 + v21);
  *(uint64_t *)((char *)a1 + v21) = (uint64_t)v23;
  v24 = v23;

  v25 = a3[7];
  v26 = (uint64_t *)((char *)a1 + v25);
  v27 = (uint64_t *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  return a1;
}

char *initializeWithTake for LargeTipView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_100002A38(&qword_1000245E8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100002A38(&qword_1000245F0);
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
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  return a1;
}

char *assignWithTake for LargeTipView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E8);
    v6 = sub_100002A38(&qword_1000245E8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100004A5C((uint64_t)&a1[v8], &qword_1000245F0);
    v11 = sub_100002A38(&qword_1000245F0);
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
  v13 = a3[6];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for LargeTipView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007048);
}

uint64_t sub_100007048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = sub_100002A38(&qword_100024750);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100002A38(&qword_100024758);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for LargeTipView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007110);
}

uint64_t sub_100007110(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_100002A38(&qword_100024750);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100002A38(&qword_100024758);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

void sub_1000071BC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  sub_100007274(319, &qword_1000247C8, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100007274(319, (unint64_t *)&unk_1000247D0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = "\b";
      v6[3] = &unk_10001B0B8;
      swift_initStructMetadata(a1, 256, 4, v6, a1 + 16);
    }
  }
}

void sub_100007274(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
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

unint64_t sub_1000072C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024808;
  if (!qword_100024808)
  {
    v1 = sub_100003038(&qword_100024738);
    sub_100007348();
    sub_1000086C8(&qword_100024820, &qword_100024828, (uint64_t)&protocol conformance descriptor for _BackgroundModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024808);
  }
  return result;
}

unint64_t sub_100007348()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024810;
  if (!qword_100024810)
  {
    v1 = sub_100003038(&qword_100024730);
    sub_1000031D0(&qword_100024818, type metadata accessor for LargeTipView.LargeTipWidgetConfiguration, (uint64_t)&unk_10001B0EC);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024810);
  }
  return result;
}

uint64_t *sub_1000073C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  id v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v5 = (void *)a2[2];
    a1[2] = (uint64_t)v5;
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for ColorScheme(0);
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v5;
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_100007464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for ColorScheme(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000074AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for ColorScheme(0);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_100007520(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = (void *)a1[2];
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = v7;

  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ColorScheme(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000075A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_100007604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100007678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007684);
}

uint64_t sub_100007688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007694);
}

uint64_t sub_100007698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008628(a1, a2, a3, (uint64_t)&unk_10001B0B8);
}

uint64_t sub_1000076A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DE14, 1);
}

uint64_t sub_1000076B4()
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

  v1 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;

  v8 = v7 + *(int *)(v1 + 24);
  v9 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100007740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_100007784@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8)
                          + 80);
  return sub_1000057F4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_1000077D0()
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

  v1 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  v12 = v0 + v4;

  v13 = v12 + *(int *)(v1 + 24);
  v14 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10000789C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8)
                          + 80);
  v4 = (v3 + 16) & ~v3;
  type metadata accessor for GeometryProxy(0);
  return sub_100005AF8(v1 + v4, a1);
}

uint64_t type metadata accessor for ImageView(uint64_t a1)
{
  return sub_100007918(a1, qword_100024958, (uint64_t)&nominal type descriptor for ImageView);
}

uint64_t sub_100007918(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_10000794C()
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
  char *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(char *, _QWORD, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  char v19;
  id v20;
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for ColorScheme(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TipsLog(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static TipsLog.widget.getter(v8);
  logDebug(_:_:)(v10, 0xD000000000000021, 0x800000010001EEA0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Assets()), "init");
  v12 = sub_100009A08();
  v14 = v13;

  v15 = v1 + *(int *)(type metadata accessor for ImageView(0) + 24);
  v16 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v16(v5, enum case for ColorScheme.light(_:), v2);
  LOBYTE(v11) = static ColorScheme.== infix(_:_:)(v15, v5);
  v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v5, v2);
  if ((v11 & 1) == 0 || !v12)
  {
    v16(v5, enum case for ColorScheme.dark(_:), v2);
    v19 = static ColorScheme.== infix(_:_:)(v15, v5);
    v17(v5, v2);
    if ((v19 & 1) != 0)
    {
      if (v14)
      {
        v20 = v14;
        v18 = ((uint64_t (*)(void))Image.init(tpsImage:))();

        return v18;
      }

    }
    else
    {

    }
    return 0;
  }
  v18 = Image.init(tpsImage:)(v12);

  return v18;
}

uint64_t sub_100007B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
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
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[3];

  v82 = a2;
  v3 = type metadata accessor for AccessibilityTraits(0);
  v80 = *(_QWORD *)(v3 - 8);
  v81 = v3;
  __chkstk_darwin(v3);
  v72 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100002A38(&qword_1000249A8);
  __chkstk_darwin(v5);
  v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = type metadata accessor for Image.ResizingMode(0);
  v8 = *(_QWORD *)(v73 - 8);
  __chkstk_darwin(v73);
  v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100002A38(&qword_1000249B0);
  v75 = *(_QWORD *)(v11 - 8);
  v76 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_100002A38(&qword_1000249B8);
  __chkstk_darwin(v74);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_100002A38(&qword_1000249C0);
  __chkstk_darwin(v83);
  v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100002A38(&qword_1000249C8);
  v19 = __chkstk_darwin(v18);
  v79 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v78 = (char *)&v68 - v22;
  __chkstk_darwin(v21);
  v71 = (char *)&v68 - v23;
  v24 = sub_100002A38(&qword_1000249D0);
  __chkstk_darwin(v24);
  v26 = (uint64_t *)((char *)&v68 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v77 = a1;
  v27 = sub_10000794C();
  if (v27)
  {
    v28 = v27;
    v69 = v24;
    v29 = v73;
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v73);
    v70 = v28;
    v30 = Image.resizable(capInsets:resizingMode:)(v10, v28, 0.0, 0.0, 0.0, 0.0);
    v31 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    static WidgetAccentedRenderingMode.accentedDesaturated.getter(v31);
    v32 = type metadata accessor for WidgetAccentedRenderingMode(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 0, 1, v32);
    Image.widgetAccentedRenderingMode(_:)(v7, v30);
    swift_release(v30);
    sub_100004A5C((uint64_t)v7, &qword_1000249A8);
    v34 = v75;
    v33 = v76;
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v15, v13, v76);
    v35 = &v15[*(int *)(v74 + 36)];
    *(_QWORD *)v35 = 0;
    *((_WORD *)v35 + 4) = 257;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v33);
    sub_1000057B0((uint64_t)v15, (uint64_t)v17, &qword_1000249B8);
    v36 = &v17[*(int *)(v83 + 36)];
    *(_QWORD *)v36 = 0;
    *((_WORD *)v36 + 4) = 257;
    sub_100004A5C((uint64_t)v15, &qword_1000249B8);
    v37 = *(void **)(v77 + 16);
    v68 = v17;
    if (v37)
    {
      v38 = objc_msgSend(v37, "assets");
      v39 = v38;
      v40 = v18;
      v41 = (uint64_t)v26;
      if (v38)
      {
        v42 = v18;
        v43 = objc_msgSend(v38, "alt");

        if (v43)
        {
          v39 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
          v45 = v44;

        }
        else
        {
          v39 = 0;
          v45 = 0xE000000000000000;
        }
        v53 = (uint64_t)v71;
        v52 = v72;
        v51 = v42;
      }
      else
      {
        v45 = 0xE000000000000000;
        v53 = (uint64_t)v71;
        v52 = v72;
        v51 = v40;
      }
    }
    else
    {
      v39 = 0;
      v45 = 0xE000000000000000;
      v51 = v18;
      v53 = (uint64_t)v71;
      v52 = v72;
      v41 = (uint64_t)v26;
    }
    v84[0] = v39;
    v84[1] = v45;
    v54 = sub_1000089BC();
    v55 = Text.init<A>(_:)(v84, &type metadata for String, v54);
    v57 = v56;
    v59 = v58;
    v61 = v60 & 1;
    v62 = sub_1000088D8();
    v63 = (uint64_t)v79;
    v64 = (uint64_t)v68;
    View.accessibilityLabel(_:)(v55, v57, v61, v59, v83, v62);
    sub_100008A00(v55, v57, v61);
    swift_bridgeObjectRelease(v59);
    v65 = sub_100004A5C(v64, &qword_1000249C0);
    static AccessibilityTraits.isImage.getter(v65);
    v66 = (uint64_t)v78;
    ModifiedContent<>.accessibility(removeTraits:)(v52, v51);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v52, v81);
    sub_100004A5C(v63, &qword_1000249C8);
    sub_1000056E8(v66, v53, &qword_1000249C8);
    sub_1000057B0(v53, v41, &qword_1000249C8);
    swift_storeEnumTagMultiPayload(v41, v69, 0);
    v67 = sub_100008854();
    _ConditionalContent<>.init(storage:)(v41, v51, &type metadata for Color, v67, &protocol witness table for Color);
    swift_release(v70);
    return sub_100004A5C(v53, &qword_1000249C8);
  }
  else
  {
    v46 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
    v47 = Color.init(_:)(v46);
    v48 = Color.opacity(_:)(0.16);
    swift_release(v47);
    *v26 = v48;
    swift_storeEnumTagMultiPayload(v26, v24, 1);
    v49 = sub_100008854();
    return _ConditionalContent<>.init(storage:)(v26, v18, &type metadata for Color, v49, &protocol witness table for Color);
  }
}

uint64_t sub_100008128@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100007B34(v1, a1);
}

void sub_100008130(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

uint64_t sub_100008158(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_10000817C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000081C0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v16);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_10000827C(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = *(void **)(a2 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    v10 = *(int *)(a3 + 24);
    v11 = a1 + v10;
    v12 = a2 + v10;
    v13 = type metadata accessor for ColorScheme(0);
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v15 = v9;
    v14(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_10000827C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_100008288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100005220(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));

  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for ColorScheme(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000082DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = type metadata accessor for ColorScheme(0);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v14 = v8;
  v13(v10, v11, v12);
  return a1;
}

uint64_t sub_10000836C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_10000840C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_100008478(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = (uint64_t)a2 + v11;
  v14 = type metadata accessor for ColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100008500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000850C);
}

uint64_t sub_100008510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_100008598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000085A4);
}

uint64_t sub_1000085A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 16) = a2;
  }
  else
  {
    v7 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_10000861C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008628(a1, a2, a3, (uint64_t)"\t");
}

uint64_t sub_100008628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v6;
  _QWORD v7[3];

  v7[0] = a4;
  v7[1] = "\b";
  result = type metadata accessor for ColorScheme(319);
  if (v6 <= 0x3F)
  {
    v7[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v7, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000869C()
{
  return sub_1000086C8(&qword_100024998, &qword_1000249A0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_1000086C8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003038(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008708(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DE3C, 1);
}

uint64_t sub_100008718(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 128);
  v14 = *(_QWORD *)(a1 + 144);
  v15 = *(_QWORD *)(a1 + 136);
  v13 = *(_BYTE *)(a1 + 152);
  v18 = *(_QWORD *)(a1 + 160);
  v19 = *(_QWORD *)(a1 + 168);
  v20 = *(_QWORD *)(a1 + 176);
  v21 = *(_QWORD *)(a1 + 184);
  v12 = *(_QWORD *)(a1 + 192);
  v16 = *(_QWORD *)(a1 + 200);
  v17 = *(_QWORD *)(a1 + 224);
  sub_100008844(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  sub_100008844(v3, v4, v5);
  swift_bridgeObjectRetain(v6);
  sub_100008844(v8, v7, v9);
  swift_bridgeObjectRetain(v10);
  sub_100008844(v15, v14, v13);
  swift_retain(v12);
  swift_retain(v16);
  swift_retain(v17);
  swift_bridgeObjectRetain(v18);
  swift_retain(v19);
  swift_retain(v20);
  swift_retain(v21);
  return a1;
}

uint64_t sub_100008844(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_100008854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000249D8;
  if (!qword_1000249D8)
  {
    v1 = sub_100003038(&qword_1000249C8);
    sub_1000088D8();
    sub_1000031D0(&qword_1000249F0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000249D8);
  }
  return result;
}

unint64_t sub_1000088D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000249E0;
  if (!qword_1000249E0)
  {
    v1 = sub_100003038(&qword_1000249C0);
    sub_100008944();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000249E0);
  }
  return result;
}

unint64_t sub_100008944()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000249E8;
  if (!qword_1000249E8)
  {
    v1 = sub_100003038(&qword_1000249B8);
    swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of Image.widgetAccentedRenderingMode(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000249E8);
  }
  return result;
}

unint64_t sub_1000089BC()
{
  unint64_t result;

  result = qword_1000249F8;
  if (!qword_1000249F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000249F8);
  }
  return result;
}

uint64_t sub_100008A00(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100008A14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A00;
  if (!qword_100024A00)
  {
    v1 = sub_100003038(&qword_100024A08);
    sub_100008A78();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A00);
  }
  return result;
}

unint64_t sub_100008A78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A10;
  if (!qword_100024A10)
  {
    v1 = sub_100003038(&qword_100024A18);
    sub_100008854();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A10);
  }
  return result;
}

uint64_t *sub_100008AE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, int *);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void (*v41)(char *, _QWORD, uint64_t, int *);
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;

  if (a1 != a2)
  {
    sub_100008E2C((uint64_t)a1);
    v6 = sub_100002A38(&qword_1000245E0);
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
  }
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = (int *)type metadata accessor for DocumentEntry(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(uint64_t (**)(char *, uint64_t, int *))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (v19)
    {
      sub_100004190((uint64_t)v13, type metadata accessor for DocumentEntry);
      goto LABEL_12;
    }
    v28 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v13, v14, v28);
    v29 = v15[5];
    v30 = &v13[v29];
    v31 = &v14[v29];
    v32 = type metadata accessor for TimelineEntryRelevance(0);
    v33 = *(_QWORD *)(v32 - 8);
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    v35 = v34(v30, 1, v32);
    v36 = v34(v31, 1, v32);
    if (v35)
    {
      if (!v36)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_21:
        v45 = v15[6];
        v46 = *(void **)&v13[v45];
        v47 = *(void **)&v14[v45];
        *(_QWORD *)&v13[v45] = v47;
        v48 = v47;

        v49 = v15[7];
        v50 = *(void **)&v13[v49];
        v51 = *(void **)&v14[v49];
        *(_QWORD *)&v13[v49] = v51;
        v52 = v51;

        return a1;
      }
    }
    else
    {
      if (!v36)
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
        goto LABEL_21;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    }
    v44 = sub_100002A38(&qword_100024668);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_21;
  }
  if (v19)
  {
LABEL_12:
    v27 = sub_100002A38(&qword_100024630);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  v20 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v13, v14, v20);
  v21 = v15[5];
  v22 = &v13[v21];
  v23 = &v14[v21];
  v24 = type metadata accessor for TimelineEntryRelevance(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = sub_100002A38(&qword_100024668);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  v37 = v15[6];
  v38 = *(void **)&v14[v37];
  *(_QWORD *)&v13[v37] = v38;
  v39 = v15[7];
  v40 = *(void **)&v14[v39];
  *(_QWORD *)&v13[v39] = v40;
  v41 = *(void (**)(char *, _QWORD, uint64_t, int *))(v16 + 56);
  v42 = v38;
  v43 = v40;
  v41(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_100008E2C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002A38(&qword_1000245E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_100008E6C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, int *);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;

  if (a1 != a2)
  {
    sub_100008E2C((uint64_t)a1);
    v6 = sub_100002A38(&qword_1000245E0);
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
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = (int *)type metadata accessor for DocumentEntry(0);
  v12 = *((_QWORD *)v11 - 1);
  v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_100004190((uint64_t)v9, type metadata accessor for DocumentEntry);
      goto LABEL_11;
    }
    v24 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v9, v10, v24);
    v25 = v11[5];
    v26 = &v9[v25];
    v27 = &v10[v25];
    v28 = type metadata accessor for TimelineEntryRelevance(0);
    v29 = *(_QWORD *)(v28 - 8);
    v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    v31 = v30(v26, 1, v28);
    v32 = v30(v27, 1, v28);
    if (v31)
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
LABEL_20:
        v34 = v11[6];
        v35 = *(void **)&v9[v34];
        *(_QWORD *)&v9[v34] = *(_QWORD *)&v10[v34];

        v36 = v11[7];
        v37 = *(void **)&v9[v36];
        *(_QWORD *)&v9[v36] = *(_QWORD *)&v10[v36];

        return a1;
      }
    }
    else
    {
      if (!v32)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v26, v27, v28);
        goto LABEL_20;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
    }
    v33 = sub_100002A38(&qword_100024668);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_20;
  }
  if (v15)
  {
LABEL_11:
    v23 = sub_100002A38(&qword_100024630);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v9, v10, v16);
  v17 = v11[5];
  v18 = &v9[v17];
  v19 = &v10[v17];
  v20 = type metadata accessor for TimelineEntryRelevance(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = sub_100002A38(&qword_100024668);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(_QWORD *)&v9[v11[6]] = *(_QWORD *)&v10[v11[6]];
  *(_QWORD *)&v9[v11[7]] = *(_QWORD *)&v10[v11[7]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_10000919C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000091A8);
}

uint64_t sub_1000091A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_100002A38(&qword_100024670);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_100002A38(&qword_100024630);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_100009224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009230);
}

uint64_t sub_100009230(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_100002A38(&qword_100024670);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_100002A38(&qword_100024630);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for TipsWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_100024A78;
  if (!qword_100024A78)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TipsWidgetView);
  return result;
}

uint64_t sub_1000092F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DE8C, 1);
}

uint64_t sub_100009300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  v43 = a2;
  v44 = type metadata accessor for SystemWidgetView(0);
  v3 = __chkstk_darwin(v44);
  v5 = (uint64_t *)((char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  v39 = (uint64_t)&v39 - v6;
  v40 = sub_100002A38(&qword_100024AB0);
  __chkstk_darwin(v40);
  v42 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100002A38(&qword_100024630);
  __chkstk_darwin(v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for RectangularWidgetView(0);
  v11 = __chkstk_darwin(v41);
  v13 = (uint64_t *)((char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  v15 = (char *)&v39 - v14;
  v16 = type metadata accessor for WidgetFamily(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036E0((uint64_t)v19);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  v21 = enum case for WidgetFamily.accessoryRectangular(_:);
  v22 = type metadata accessor for TipsWidgetView(0);
  sub_100009704(a1 + *(int *)(v22 + 20), (uint64_t)v10);
  KeyPath = swift_getKeyPath(&unk_10001B250);
  if (v20 == v21)
  {
    *v13 = KeyPath;
    v24 = sub_100002A38(&qword_1000245E0);
    swift_storeEnumTagMultiPayload(v13, v24, 0);
    v25 = v41;
    v26 = (uint64_t *)((char *)v13 + *(int *)(v41 + 20));
    *v26 = swift_getKeyPath(&unk_10001B280);
    v27 = sub_100002A38(&qword_1000245F0);
    swift_storeEnumTagMultiPayload(v26, v27, 0);
    v28 = (char *)v13 + *(int *)(v25 + 24);
    *(_QWORD *)v28 = swift_getKeyPath(&unk_10001B2B0);
    v28[8] = 0;
    sub_100009750((uint64_t)v10, (uint64_t)v13 + *(int *)(v25 + 28));
    sub_1000097A4((uint64_t)v13, (uint64_t)v15, type metadata accessor for RectangularWidgetView);
    v29 = v42;
    sub_10000817C((uint64_t)v15, v42, type metadata accessor for RectangularWidgetView);
    swift_storeEnumTagMultiPayload(v29, v40, 0);
    v30 = sub_1000031D0(&qword_100024AB8, type metadata accessor for RectangularWidgetView, (uint64_t)&unk_10001BD00);
    v31 = sub_1000031D0(&qword_100024AC0, type metadata accessor for SystemWidgetView, (uint64_t)&protocol conformance descriptor for SystemWidgetView);
    _ConditionalContent<>.init(storage:)(v29, v25, v44, v30, v31);
    return sub_100004190((uint64_t)v15, type metadata accessor for RectangularWidgetView);
  }
  else
  {
    *v5 = KeyPath;
    v33 = sub_100002A38(&qword_1000245E0);
    swift_storeEnumTagMultiPayload(v5, v33, 0);
    v34 = v44;
    sub_100009750((uint64_t)v10, (uint64_t)v5 + *(int *)(v44 + 20));
    v35 = v39;
    sub_1000097A4((uint64_t)v5, v39, type metadata accessor for SystemWidgetView);
    v36 = v42;
    sub_10000817C(v35, v42, type metadata accessor for SystemWidgetView);
    swift_storeEnumTagMultiPayload(v36, v40, 1);
    v37 = sub_1000031D0(&qword_100024AB8, type metadata accessor for RectangularWidgetView, (uint64_t)&unk_10001BD00);
    v38 = sub_1000031D0(&qword_100024AC0, type metadata accessor for SystemWidgetView, (uint64_t)&protocol conformance descriptor for SystemWidgetView);
    _ConditionalContent<>.init(storage:)(v36, v41, v34, v37, v38);
    sub_100004190(v35, type metadata accessor for SystemWidgetView);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t sub_1000096FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100009300(v1, a1);
}

uint64_t sub_100009704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002A38(&qword_100024630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009750(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002A38(&qword_100024630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000097A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000097EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024AC8;
  if (!qword_100024AC8)
  {
    v1 = sub_100003038(&qword_100024AD0);
    sub_100009850();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024AC8);
  }
  return result;
}

unint64_t sub_100009850()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024AD8;
  if (!qword_100024AD8)
  {
    v1 = sub_100003038((uint64_t *)&unk_100024AE0);
    sub_1000031D0(&qword_100024AB8, type metadata accessor for RectangularWidgetView, (uint64_t)&unk_10001BD00);
    sub_1000031D0(&qword_100024AC0, type metadata accessor for SystemWidgetView, (uint64_t)&protocol conformance descriptor for SystemWidgetView);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024AD8);
  }
  return result;
}

id Assets.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

unint64_t sub_10000990C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id *v6;
  char v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002A38((uint64_t *)&unk_100024BC0);
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
  v6 = (id *)(a1 + 40);
  while (1)
  {
    v7 = *(_BYTE *)v6;
    v8 = *(v6 - 1);
    result = sub_100016068((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    *(_BYTE *)(v4[7] + result) = v7;
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
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

id sub_100009A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  dispatch_semaphore_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void **v36;
  uint64_t v37;
  char v38[24];
  void **aBlock;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, void *);
  void *v42;
  Swift::Int (*v43)(uint64_t, uint64_t);
  uint64_t v44;

  v1 = type metadata accessor for TipsLog(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = swift_allocObject(&unk_100021240, 24, 7);
  v37 = v5;
  *(_QWORD *)(v5 + 16) = 0;
  v36 = (void **)(v5 + 16);
  v6 = swift_allocObject(&unk_100021240, 24, 7);
  *(_QWORD *)(v6 + 16) = 0;
  v35 = v6 + 16;
  result = objc_msgSend((id)objc_opt_self(TPSURLSessionHandler), "sharedInstance");
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setDelegate:", v0);
    v9 = (void *)objc_opt_self(TPSURLSessionManager);
    v10 = objc_msgSend(v9, "defaultManager");
    objc_msgSend(v10, "setDelegate:", v8);

    v11 = objc_msgSend(v9, "defaultManager");
    objc_msgSend(v11, "setDefaultSessionDelegate:", v8);

    if (objc_msgSend((id)objc_opt_self(TPSCommonDefines), "isInternalDevice"))
    {
      v12 = objc_msgSend(v9, "defaultManager");
      v13 = objc_msgSend((id)objc_opt_self(TPSURLSessionACAuthContext), "defaultContext");
      v14 = objc_msgSend(objc_allocWithZone((Class)TPSURLSessionACAuthHandler), "initWithAuthenticationContext:", v13);

      objc_msgSend(v12, "setAuthenticationHandler:", v14);
    }
    v15 = objc_msgSend(objc_allocWithZone((Class)TPSWidgetController), "init");
    v16 = objc_msgSend(v15, "preferredDocument");
    static TipsLog.widget.getter(v16);
    if (v16)
    {
      v17 = sub_100002A38(&qword_100024B78);
      v18 = swift_allocObject(v17, 72, 7);
      *(_OWORD *)(v18 + 16) = xmmword_10001B2E0;
      *(_QWORD *)(v18 + 56) = sub_10000A390();
      *(_QWORD *)(v18 + 64) = sub_1000031D0(&qword_100024B88, (uint64_t (*)(uint64_t))sub_10000A390, (uint64_t)&protocol conformance descriptor for NSObject);
      *(_QWORD *)(v18 + 32) = v16;
      v19 = v16;
      logDebug(_:_:_:)(v4, "getAssets: asset tip is %@", 26, 2, v18);
      swift_bridgeObjectRelease(v18);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v20 = dispatch_semaphore_create(0);
      v21 = swift_allocObject(&unk_100021268, 32, 7);
      v22 = v37;
      *(_QWORD *)(v21 + 16) = v37;
      *(_QWORD *)(v21 + 24) = v20;
      v43 = sub_10000A3D0;
      v44 = v21;
      aBlock = _NSConcreteStackBlock;
      v40 = 1107296256;
      v41 = sub_100009EE0;
      v42 = &unk_100021280;
      v23 = _Block_copy(&aBlock);
      v24 = v44;
      swift_retain(v22);
      v25 = v20;
      swift_release(v24);
      objc_msgSend(v15, "widgetAssetsForDocument:preferCacheIfAvailable:userInterfaceStyle:completionHandler:", v19, 1, 0, v23);
      _Block_release(v23);
      OS_dispatch_semaphore.wait()();
      v26 = dispatch_semaphore_create(0);
      v27 = swift_allocObject(&unk_1000212B8, 32, 7);
      *(_QWORD *)(v27 + 16) = v6;
      *(_QWORD *)(v27 + 24) = v26;
      v43 = sub_10000A448;
      v44 = v27;
      aBlock = _NSConcreteStackBlock;
      v40 = 1107296256;
      v41 = sub_100009EE0;
      v42 = &unk_1000212D0;
      v28 = _Block_copy(&aBlock);
      v29 = v44;
      swift_retain(v6);
      v30 = v26;
      swift_release(v29);
      objc_msgSend(v15, "widgetAssetsForDocument:preferCacheIfAvailable:userInterfaceStyle:completionHandler:", v19, 1, 1, v28);
      v31 = v22;
      _Block_release(v28);
      OS_dispatch_semaphore.wait()();

      swift_beginAccess(v36, &aBlock, 0, 0);
      v32 = *(void **)(v22 + 16);
      swift_beginAccess(v35, v38, 0, 0);
    }
    else
    {
      logDebug(_:_:)(v4, 0xD000000000000015, 0x800000010001EEF0);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v31 = v37;
      v32 = *v36;
    }
    v33 = *(id *)(v6 + 16);
    v34 = v32;
    swift_release(v31);
    swift_release(v6);
    return v32;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100009EE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, void *);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = sub_100002A38(&qword_100024B90);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, void *))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a2);
    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  }
  swift_retain(v9);
  v13 = a3;
  v10(v8, a3);
  swift_release(v9);

  return sub_10000A4C0((uint64_t)v8);
}

Swift::Int sub_100009FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, const char *a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  _BYTE v54[24];
  _BYTE v55[32];

  v51 = a8;
  v52 = a7;
  v50 = a5;
  v12 = type metadata accessor for TipsLog(0);
  v49 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100002A38(&qword_100024B90);
  __chkstk_darwin(v15);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A478(a1, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_10000A4C0((uint64_t)v17);
  }
  else
  {
    v43 = a6;
    v22 = a3;
    v45 = a3 + 16;
    v23 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    static TipsLog.widget.getter(v23);
    v24 = sub_100002A38(&qword_100024B78);
    v46 = v12;
    v25 = v24;
    v26 = swift_allocObject(v24, 72, 7);
    v48 = a4;
    v27 = (_QWORD *)v26;
    v44 = xmmword_10001B2E0;
    *(_OWORD *)(v26 + 16) = xmmword_10001B2E0;
    v28 = URL.path.getter();
    v30 = v29;
    v27[7] = &type metadata for String;
    v47 = sub_10000A500();
    v27[8] = v47;
    v27[4] = v28;
    v27[5] = v30;
    logDebug(_:_:_:)(v14, v50, v43, 2, v27);
    swift_bridgeObjectRelease(v27);
    v31 = *(void (**)(char *, uint64_t))(v49 + 8);
    v31(v14, v12);
    v32 = sub_10000A544();
    v33 = v45;
    swift_beginAccess(v45, v55, 1, 0);
    v34 = *(void **)(v22 + 16);
    *(_QWORD *)(v22 + 16) = v32;

    static TipsLog.widget.getter(v35);
    v36 = swift_allocObject(v25, 72, 7);
    *(_OWORD *)(v36 + 16) = v44;
    swift_beginAccess(v33, v54, 0, 0);
    v53 = *(_QWORD *)(v22 + 16);
    v37 = sub_100002A38(&qword_100024BA0);
    v38 = Optional.debugDescription.getter(v37);
    v39 = v47;
    *(_QWORD *)(v36 + 56) = &type metadata for String;
    *(_QWORD *)(v36 + 64) = v39;
    *(_QWORD *)(v36 + 32) = v38;
    *(_QWORD *)(v36 + 40) = v40;
    logDebug(_:_:_:)(v14, v52, v51, 2, v36);
    swift_bridgeObjectRelease(v36);
    v31(v14, v46);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  return OS_dispatch_semaphore.signal()();
}

id Assets.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Assets();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for Assets()
{
  return objc_opt_self(_TtC10TipsWidget6Assets);
}

id Assets.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Assets();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000A36C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10000A390()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024B80;
  if (!qword_100024B80)
  {
    v1 = objc_opt_self(TPSDocument);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100024B80);
  }
  return result;
}

Swift::Int sub_10000A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100009FD8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), "getAssets: light asset url is %@", 32, "getAssets: light asset is %@", 28);
}

uint64_t sub_10000A400(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A410(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A41C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_10000A448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100009FD8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), "getAssets: dark asset url is %@", 31, "getAssets: dark asset is %@", 27);
}

uint64_t sub_10000A478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002A38(&qword_100024B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A4C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002A38(&qword_100024B90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000A500()
{
  unint64_t result;

  result = qword_100024B98;
  if (!qword_100024B98)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100024B98);
  }
  return result;
}

id sub_10000A544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t inited;
  const __CFString *v6;
  unint64_t v7;
  NSURL *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  const __CFDictionary *isa;
  CGImageSource *v12;
  const __CFDictionary *v13;
  CGImageRef ImageAtIndex;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  void *object;
  unint64_t v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  void *v27;
  unint64_t v28;
  unint64_t v30;
  unint64_t v31;
  _BYTE v32[48];

  v0 = type metadata accessor for TipsLog(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002A38(&qword_100024BA8);
  inited = swift_initStackObject(v4, v32);
  *(_OWORD *)(inited + 16) = xmmword_10001B2E0;
  *(_QWORD *)(inited + 32) = kCGImageSourceShouldCache;
  *(_BYTE *)(inited + 40) = 0;
  v6 = (id)kCGImageSourceShouldCache;
  v7 = sub_10000990C(inited);
  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  type metadata accessor for CFString(0);
  sub_1000031D0(&qword_100024BB0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AEA4);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v12 = CGImageSourceCreateWithURL(v10, isa);

  if (!v12)
  {
    v17 = swift_bridgeObjectRelease(v7);
    static TipsLog.widget.getter(v17);
    v30 = 0;
    v31 = 0xE000000000000000;
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease(v31);
    v30 = 0xD00000000000002DLL;
    v31 = 0x800000010001EF90;
    v18 = type metadata accessor for URL(0);
    v19 = sub_1000031D0(&qword_100024BB8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v18, v19);
    object = v20._object;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(object);
    v22 = v31;
    logDebug(_:_:)(v3, v30, v31);
    swift_bridgeObjectRelease(v22);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  v13 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, v13);

  static TipsLog.widget.getter(v15);
  if (!ImageAtIndex)
  {
    v30 = 0;
    v31 = 0xE000000000000000;
    _StringGuts.grow(_:)(57);
    v23._countAndFlagsBits = 0xD000000000000037;
    v23._object = (void *)0x800000010001EFC0;
    String.append(_:)(v23);
    v24 = type metadata accessor for URL(0);
    v25 = sub_1000031D0(&qword_100024BB8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v24, v25);
    v27 = v26._object;
    String.append(_:)(v26);
    swift_bridgeObjectRelease(v27);
    v28 = v31;
    logDebug(_:_:)(v3, v30, v31);
    swift_bridgeObjectRelease(v28);

    goto LABEL_6;
  }
  logDebug(_:_:)(v3, 0xD000000000000022, 0x800000010001F000);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v16 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:", ImageAtIndex);

  return v16;
}

uint64_t SystemWidgetView.init(entry:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *a2 = swift_getKeyPath(&unk_10001B310);
  v4 = sub_100002A38(&qword_1000245E0);
  swift_storeEnumTagMultiPayload(a2, v4, 0);
  v5 = (uint64_t)a2 + *(int *)(type metadata accessor for SystemWidgetView(0) + 20);
  return sub_100009750(a1, v5);
}

uint64_t type metadata accessor for SystemWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_100024C88;
  if (!qword_100024C88)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SystemWidgetView);
  return result;
}

id sub_10000A934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v12;

  v1 = sub_100002A38(&qword_100024630);
  __chkstk_darwin(v1);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SystemWidgetView(0);
  sub_1000057B0(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_100024630);
  v5 = type metadata accessor for DocumentEntry(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v3, 1, v5) == 1)
  {
    sub_100004A5C((uint64_t)v3, &qword_100024630);
  }
  else
  {
    v6 = *(id *)&v3[*(int *)(v5 + 28)];
    v7 = v6;
    sub_100004190((uint64_t)v3, type metadata accessor for DocumentEntry);
    if (v6)
      return v6;
  }
  v8 = objc_msgSend(objc_allocWithZone((Class)TPSWidgetController), "init");
  v9 = objc_msgSend(v8, "preferredDocument");
  v10 = objc_msgSend(v9, "widgetContent");

  if (v10)
  {
    v6 = objc_msgSend(v9, "widgetContent");

  }
  else
  {

    return objc_msgSend(objc_allocWithZone((Class)TPSPlaceholderWidgetContent), "init");
  }
  return v6;
}

uint64_t SystemWidgetView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v3 = type metadata accessor for SystemWidgetView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  sub_10000817C(v1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SystemWidgetView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_100021308, v7 + v5, v6 | 7);
  result = sub_1000097A4((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for SystemWidgetView);
  *a1 = sub_10000AB74;
  a1[1] = v8;
  return result;
}

uint64_t sub_10000AB78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of SystemWidgetView.body>>, 1);
}

uint64_t sub_10000AB88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
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
  char v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)();
  uint64_t v73;
  char v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  char v78;

  v61 = a2;
  v68 = a3;
  v63 = sub_100002A38(&qword_100024CD0);
  __chkstk_darwin(v63);
  v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_100002A38(&qword_100024CD8);
  __chkstk_darwin(v67);
  v65 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for LargeTipView(0);
  v7 = __chkstk_darwin(v64);
  v9 = (uint64_t *)((char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  v62 = (uint64_t)&v61 - v10;
  v66 = sub_100002A38(&qword_100024CE0);
  __chkstk_darwin(v66);
  v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SystemWidgetView(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  __chkstk_darwin(v13);
  v16 = type metadata accessor for WidgetFamily(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036E0((uint64_t)v19);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (v20 == enum case for WidgetFamily.systemSmall(_:))
  {
    sub_10000817C(a1, (uint64_t)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SystemWidgetView);
    v21 = *(unsigned __int8 *)(v14 + 80);
    v22 = (v21 + 16) & ~v21;
    v23 = swift_allocObject(&unk_100021380, v22 + v15, v21 | 7);
    sub_1000097A4((uint64_t)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22, type metadata accessor for SystemWidgetView);
    v69 = 0;
    v70 = 0;
    v71 = 1;
    v72 = sub_10000B76C;
    v73 = v23;
    v74 = 0;
LABEL_5:
    swift_retain(v23);
    v26 = sub_100002A38(&qword_100024D18);
    v27 = sub_100002A38(&qword_100024D28);
    v28 = sub_1000086C8(&qword_100024D10, &qword_100024D18, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    v29 = sub_1000086C8(&qword_100024D20, &qword_100024D28, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    _ConditionalContent<>.init(storage:)(&v69, v26, v27, v28, v29);
    v30 = v77;
    v31 = v78;
    v32 = v76;
    *(_OWORD *)v12 = v75;
    *((_OWORD *)v12 + 1) = v32;
    *((_QWORD *)v12 + 4) = v30;
    v12[40] = v31;
    swift_storeEnumTagMultiPayload(v12, v66, 0);
    v33 = sub_100002A38(&qword_100024D00);
    v34 = sub_10000B630();
    v35 = sub_10000B6D4();
    _ConditionalContent<>.init(storage:)(v12, v33, v67, v34, v35);
    return swift_release(v23);
  }
  if (v20 == enum case for WidgetFamily.systemMedium(_:))
  {
    sub_10000817C(a1, (uint64_t)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SystemWidgetView);
    v24 = *(unsigned __int8 *)(v14 + 80);
    v25 = (v24 + 16) & ~v24;
    v23 = swift_allocObject(&unk_100021358, v25 + v15, v24 | 7);
    sub_1000097A4((uint64_t)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v25, type metadata accessor for SystemWidgetView);
    v69 = 0;
    v70 = 0;
    v71 = 1;
    v72 = sub_10000B76C;
    v73 = v23;
    v74 = 1;
    goto LABEL_5;
  }
  if (v20 == enum case for WidgetFamily.systemLarge(_:))
  {
    v37 = sub_10000A934();
    v38 = ceil(GeometryProxy.size.getter(v37) * 0.47);
    v40 = ceil(GeometryProxy.size.getter(v39) * 0.47);
    *v9 = swift_getKeyPath(&unk_10001B3A8);
    v41 = sub_100002A38(&qword_1000245E8);
    swift_storeEnumTagMultiPayload(v9, v41, 0);
    v42 = v64;
    v43 = (_QWORD *)((char *)v9 + *(int *)(v64 + 20));
    *v43 = swift_getKeyPath(&unk_10001B3D8);
    v44 = sub_100002A38(&qword_1000245F0);
    swift_storeEnumTagMultiPayload(v43, v44, 0);
    *(_QWORD *)((char *)v9 + *(int *)(v42 + 24)) = v37;
    v45 = (double *)((char *)v9 + *(int *)(v42 + 28));
    *v45 = v38;
    v45[1] = v40;
    v46 = v62;
    sub_1000097A4((uint64_t)v9, v62, type metadata accessor for LargeTipView);
    sub_10000817C(v46, (uint64_t)v5, type metadata accessor for LargeTipView);
    swift_storeEnumTagMultiPayload(v5, v63, 0);
    v47 = sub_100002A38(&qword_100024CE8);
    v48 = sub_10000B5E8();
    v49 = sub_1000086C8(&qword_100024CF8, &qword_100024CE8, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    v50 = (uint64_t)v65;
    _ConditionalContent<>.init(storage:)(v5, v42, v47, v48, v49);
    sub_1000057B0(v50, (uint64_t)v12, &qword_100024CD8);
    swift_storeEnumTagMultiPayload(v12, v66, 1);
    v51 = sub_100002A38(&qword_100024D00);
    v52 = sub_10000B630();
    v53 = sub_10000B6D4();
    _ConditionalContent<>.init(storage:)(v12, v51, v67, v52, v53);
    sub_100004A5C(v50, &qword_100024CD8);
    return sub_100004190(v46, type metadata accessor for LargeTipView);
  }
  else
  {
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    v5[16] = 1;
    *((_QWORD *)v5 + 3) = nullsub_2;
    *((_QWORD *)v5 + 4) = 0;
    swift_storeEnumTagMultiPayload(v5, v63, 1);
    v54 = sub_100002A38(&qword_100024CE8);
    v55 = sub_10000B5E8();
    v56 = sub_1000086C8(&qword_100024CF8, &qword_100024CE8, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    v57 = (uint64_t)v65;
    _ConditionalContent<>.init(storage:)(v5, v64, v54, v55, v56);
    sub_1000057B0(v57, (uint64_t)v12, &qword_100024CD8);
    swift_storeEnumTagMultiPayload(v12, v66, 1);
    v58 = sub_100002A38(&qword_100024D00);
    v59 = sub_10000B630();
    v60 = sub_10000B6D4();
    _ConditionalContent<>.init(storage:)(v12, v58, v67, v59, v60);
    sub_100004A5C(v57, &qword_100024CD8);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

void sub_10000B214(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v4 = sub_100002A38(&qword_100024630);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SystemWidgetView(0);
  sub_1000057B0(a1 + *(int *)(v7 + 20), (uint64_t)v6, &qword_100024630);
  v8 = type metadata accessor for DocumentEntry(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v6, 1, v8) == 1)
  {
    sub_100004A5C((uint64_t)v6, &qword_100024630);
  }
  else
  {
    v9 = *(id *)&v6[*(int *)(v8 + 28)];
    v10 = v9;
    sub_100004190((uint64_t)v6, type metadata accessor for DocumentEntry);
    if (v9)
      goto LABEL_7;
  }
  v11 = objc_msgSend(objc_allocWithZone((Class)TPSWidgetController), "init");
  v12 = objc_msgSend(v11, "preferredDocument");
  v13 = objc_msgSend(v12, "widgetContent");

  if (v13)
  {
    v9 = objc_msgSend(v12, "widgetContent");

  }
  else
  {

    v9 = objc_msgSend(objc_allocWithZone((Class)TPSPlaceholderWidgetContent), "init");
  }
LABEL_7:
  *a2 = v9;
}

uint64_t sub_10000B3A0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_10000817C(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SystemWidgetView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_100021330, v7 + v5, v6 | 7);
  result = sub_1000097A4((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for SystemWidgetView);
  *a2 = sub_10000AB74;
  a2[1] = v8;
  return result;
}

uint64_t getEnumTagSinglePayload for SystemWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B460);
}

uint64_t sub_10000B460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_100002A38(&qword_100024670);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_100002A38(&qword_100024630);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for SystemWidgetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B4E8);
}

uint64_t sub_10000B4E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_100002A38(&qword_100024670);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_100002A38(&qword_100024630);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_10000B56C()
{
  return sub_1000086C8(&qword_100024CC0, &qword_100024CC8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10000B59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SystemWidgetView(0) - 8) + 80);
  return sub_10000AB88(v2 + ((v5 + 16) & ~v5), a1, a2);
}

unint64_t sub_10000B5E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024CF0;
  if (!qword_100024CF0)
  {
    v1 = type metadata accessor for LargeTipView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for LargeTipView, v1);
    atomic_store(result, (unint64_t *)&qword_100024CF0);
  }
  return result;
}

unint64_t sub_10000B630()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024D08;
  if (!qword_100024D08)
  {
    v1 = sub_100003038(&qword_100024D00);
    sub_1000086C8(&qword_100024D10, &qword_100024D18, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    sub_1000086C8(&qword_100024D20, &qword_100024D28, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024D08);
  }
  return result;
}

unint64_t sub_10000B6D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024D30;
  if (!qword_100024D30)
  {
    v1 = sub_100003038(&qword_100024CD8);
    sub_10000B5E8();
    sub_1000086C8(&qword_100024CF8, &qword_100024CE8, (uint64_t)&protocol conformance descriptor for BackgroundGradient<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024D30);
  }
  return result;
}

uint64_t sub_10000B76C()
{
  return sub_10000B8D0((uint64_t (*)(uint64_t))sub_10000B214);
}

uint64_t sub_10000B77C()
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
  char *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = type metadata accessor for SystemWidgetView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100002A38(&qword_1000245E0);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)v6 + *(int *)(v1 + 20);
  v10 = (int *)type metadata accessor for DocumentEntry(0);
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v10 - 1) + 48))(v9, 1, v10))
  {
    v11 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
    v12 = &v9[v10[5]];
    v13 = type metadata accessor for TimelineEntryRelevance(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);

  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000B8D0(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SystemWidgetView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_10000B91C@<X0>(uint64_t a1@<X8>)
{
  int *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  float v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a1;
  v1 = (int *)type metadata accessor for DocumentEntry(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002A38(&qword_100024668);
  __chkstk_darwin(v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  __chkstk_darwin(v7);
  v31 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(objc_allocWithZone((Class)TPSWidgetController), "init");
  v14 = objc_msgSend(v13, "preferredDocument");
  v15 = 0.0;
  if (v14)
  {
    v16 = v14;
    v17 = objc_msgSend(v14, "widgetContent");

    if (v17)
    {
      v18 = objc_msgSend(v17, "priority");

      v15 = (float)(uint64_t)v18;
    }
  }
  v19 = TimelineEntryRelevance.init(score:duration:)(v15, 0.0);
  v20 = v31;
  Date.init()(v19);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v12, v9);
  v30 = v12;
  v21 = v10;
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v22(v6, 0, 1, v9);
  v29 = objc_msgSend(v13, "preferredDocument");
  v23 = objc_msgSend(v13, "preferredDocument");
  v24 = objc_msgSend(v23, "widgetContent");

  v25 = (uint64_t)&v3[v1[5]];
  v22((char *)v25, 1, 1, v9);
  v26 = v1[6];
  *(_QWORD *)&v3[v26] = 0;
  v27 = v1[7];
  *(_QWORD *)&v3[v27] = 0;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v3, v20, v33);
  sub_10000D354((uint64_t)v6, v25);

  *(_QWORD *)&v3[v26] = v29;
  *(_QWORD *)&v3[v27] = v24;
  sub_1000097A4((uint64_t)v3, v34, type metadata accessor for DocumentEntry);

  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v30, v9);
}

uint64_t sub_10000BBFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
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
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a1;
  v1 = type metadata accessor for TipsLog(0);
  v34 = *(_QWORD *)(v1 - 8);
  v35 = v1;
  __chkstk_darwin(v1);
  v32 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (int *)type metadata accessor for DocumentEntry(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002A38(&qword_100024668);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TimelineEntryRelevance(0);
  v31 = *(_QWORD *)(v12 - 8);
  v13 = v31;
  __chkstk_darwin(v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = TimelineEntryRelevance.init(score:duration:)(0.0, 0.0);
  Date.init()(v16);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v15, v12);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v17(v8, 0, 1, v12);
  v18 = objc_msgSend(objc_allocWithZone((Class)TPSPlaceholderWidgetContent), "init");
  v19 = (uint64_t)&v5[v3[5]];
  v17((char *)v19, 1, 1, v12);
  v20 = v3[6];
  *(_QWORD *)&v5[v20] = 0;
  v21 = v3[7];
  *(_QWORD *)&v5[v21] = 0;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v5, v11, v30);
  sub_10000D354((uint64_t)v8, v19);

  *(_QWORD *)&v5[v20] = 0;
  *(_QWORD *)&v5[v21] = v18;
  v22 = sub_1000097A4((uint64_t)v5, v33, type metadata accessor for DocumentEntry);
  v23 = v32;
  static TipsLog.widget.getter(v22);
  v24 = sub_100002A38(&qword_100024B78);
  v25 = swift_allocObject(v24, 72, 7);
  *(_OWORD *)(v25 + 16) = xmmword_10001B2E0;
  v26 = DocumentEntry.description.getter();
  v28 = v27;
  *(_QWORD *)(v25 + 56) = &type metadata for String;
  *(_QWORD *)(v25 + 64) = sub_10000A500();
  *(_QWORD *)(v25 + 32) = v26;
  *(_QWORD *)(v25 + 40) = v28;
  logInfo(_:_:_:)(v23, "TimelineProvider - Placeholder provided with entry: %@", 54, 2, v25);
  swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v23, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v15, v12);
}

uint64_t sub_10000BEE0(uint64_t a1, void (*a2)(char *))
{
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
  uint64_t v15;
  uint64_t v17;

  v3 = type metadata accessor for TipsLog(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DocumentEntry(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000B91C((uint64_t)v9);
  static TipsLog.widget.getter(v10);
  v11 = sub_100002A38(&qword_100024B78);
  v12 = swift_allocObject(v11, 72, 7);
  *(_OWORD *)(v12 + 16) = xmmword_10001B2E0;
  v13 = DocumentEntry.description.getter();
  v15 = v14;
  *(_QWORD *)(v12 + 56) = &type metadata for String;
  *(_QWORD *)(v12 + 64) = sub_10000A500();
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v15;
  logInfo(_:_:_:)(v6, "TimelineProvider - Snapshot provided with entry: %@", 51, 2, v12);
  swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  a2(v9);
  return sub_100004190((uint64_t)v9, type metadata accessor for DocumentEntry);
}

uint64_t sub_10000C044(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v3;
  __n128 v4;
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
  char *v17;
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
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *);

  v33 = a3;
  v34 = a2;
  v32 = type metadata accessor for TipsLog(0);
  v3 = *(_QWORD *)(v32 - 8);
  v4 = __chkstk_darwin(v32);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TimelineReloadPolicy(0, v4);
  __chkstk_darwin(v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100002A38(&qword_100024DB8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DocumentEntry(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B91C((uint64_t)v17);
  v18 = sub_100002A38(&qword_100024DC0);
  v19 = *(unsigned __int8 *)(v15 + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = swift_allocObject(v18, v20 + *(_QWORD *)(v15 + 72), v19 | 7);
  v31 = xmmword_10001B2E0;
  *(_OWORD *)(v21 + 16) = xmmword_10001B2E0;
  v22 = sub_10000D104((uint64_t)v17, v21 + v20);
  static TimelineReloadPolicy.never.getter(v22);
  v23 = sub_1000031D0(qword_100024DA0, type metadata accessor for DocumentEntry, (uint64_t)&protocol conformance descriptor for DocumentEntry);
  v24 = Timeline.init(entries:policy:)(v21, v9, v14, v23);
  static TipsLog.widget.getter(v24);
  v25 = sub_100002A38(&qword_100024B78);
  v26 = swift_allocObject(v25, 72, 7);
  *(_OWORD *)(v26 + 16) = v31;
  v27 = DocumentEntry.description.getter();
  v29 = v28;
  *(_QWORD *)(v26 + 56) = &type metadata for String;
  *(_QWORD *)(v26 + 64) = sub_10000A500();
  *(_QWORD *)(v26 + 32) = v27;
  *(_QWORD *)(v26 + 40) = v29;
  logInfo(_:_:_:)(v6, "TimelineProvider - Timeline provided with entry: %@", 51, 2, v26);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v32);
  v34(v13);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return sub_100004190((uint64_t)v17, type metadata accessor for DocumentEntry);
}

uint64_t sub_10000C2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000C320;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000C320()
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

uint64_t sub_10000C368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000D39C;
  return TimelineProvider.relevance()(a1, a2, a3);
}

id sub_10000C3D4@<X0>(uint64_t a1@<X8>)
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
  __n128 v18;
  uint64_t v19;
  _BYTE *v20;
  void (*v21)(_BYTE *, _QWORD, uint64_t, __n128);
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(char *, _BYTE *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  id result;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  unint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t OpaqueTypeConformance2;
  _BYTE *v66;
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
  _BYTE *v78;
  _BYTE v79[12];
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  _BYTE *v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  uint64_t v103;
  unint64_t v104;

  v95 = a1;
  v87 = sub_100002A38(&qword_100024D40);
  v85 = *(_QWORD *)(v87 - 8);
  __chkstk_darwin(v87);
  v84 = &v79[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = sub_100002A38(&qword_100024D48);
  v88 = *(_QWORD *)(v2 - 8);
  v89 = v2;
  __chkstk_darwin(v2);
  v86 = &v79[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100002A38(&qword_100024D50);
  v91 = *(_QWORD *)(v4 - 8);
  v92 = v4;
  __chkstk_darwin(v4);
  v90 = &v79[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_100002A38(&qword_100024D58);
  v93 = *(_QWORD *)(v6 - 8);
  v94 = v6;
  __chkstk_darwin(v6);
  v101 = &v79[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for TipsLog(0);
  v99 = *(_QWORD *)(v8 - 8);
  v100 = v8;
  __chkstk_darwin(v8);
  v98 = &v79[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for WidgetFamily(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v97 = &v79[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v96 = &v79[-v14];
  __chkstk_darwin(v15);
  v102 = &v79[-v16];
  v18 = __chkstk_darwin(v17);
  v20 = &v79[-v19];
  v21 = *(void (**)(_BYTE *, _QWORD, uint64_t, __n128))(v11 + 104);
  v21(&v79[-v19], enum case for WidgetFamily.accessoryRectangular(_:), v10, v18);
  v22 = (char *)sub_10000CF00(0, 1, 1, &_swiftEmptyArrayStorage);
  v24 = *((_QWORD *)v22 + 2);
  v23 = *((_QWORD *)v22 + 3);
  if (v24 >= v23 >> 1)
    v22 = (char *)sub_10000CF00(v23 > 1, v24 + 1, 1, v22);
  *((_QWORD *)v22 + 2) = v24 + 1;
  v25 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v26 = *(_QWORD *)(v11 + 72);
  v27 = *(void (**)(char *, _BYTE *, uint64_t))(v11 + 32);
  v27(&v22[v25 + v26 * v24], v20, v10);
  v28 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x800000010001F080);
  v29 = Text.init(_:tableName:bundle:comment:)(v28);
  v31 = v30;
  v33 = v32;
  v80 = v34;
  v35 = v34 & 1;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v21)(v102, enum case for WidgetFamily.systemSmall(_:), v10);
  v83 = v33;
  swift_bridgeObjectRetain(v33);
  v82 = v29;
  v81 = v31;
  sub_100008844(v29, v31, v35);
  v37 = *((_QWORD *)v22 + 2);
  v36 = *((_QWORD *)v22 + 3);
  if (v37 >= v36 >> 1)
    v22 = (char *)sub_10000CF00(v36 > 1, v37 + 1, 1, v22);
  v38 = v97;
  *((_QWORD *)v22 + 2) = v37 + 1;
  v27(&v22[v25 + v37 * v26], v102, v10);
  v39 = v96;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v21)(v96, enum case for WidgetFamily.systemMedium(_:), v10);
  v41 = *((_QWORD *)v22 + 2);
  v40 = *((_QWORD *)v22 + 3);
  if (v41 >= v40 >> 1)
    v22 = (char *)sub_10000CF00(v40 > 1, v41 + 1, 1, v22);
  *((_QWORD *)v22 + 2) = v41 + 1;
  v27(&v22[v25 + v41 * v26], v39, v10);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v21)(v38, enum case for WidgetFamily.systemLarge(_:), v10);
  v43 = *((_QWORD *)v22 + 2);
  v42 = *((_QWORD *)v22 + 3);
  if (v43 >= v42 >> 1)
    v22 = (char *)sub_10000CF00(v42 > 1, v43 + 1, 1, v22);
  *((_QWORD *)v22 + 2) = v43 + 1;
  v44 = ((uint64_t (*)(char *, _BYTE *, uint64_t))v27)(&v22[v25 + v43 * v26], v38, v10);
  v45 = v98;
  static TipsLog.widget.getter(v44);
  logDebug(_:_:)(v45, 0xD000000000000030, 0x800000010001F0E0);
  (*(void (**)(_BYTE *, uint64_t))(v99 + 8))(v45, v100);
  result = objc_msgSend((id)objc_opt_self(TPSCommonDefines), "clientBundleIdentifier");
  if (result)
  {
    v47 = result;
    v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v50 = v49;

    sub_100002A38(&qword_100024D60);
    v51 = type metadata accessor for TipsWidgetWrapperView(255);
    v52 = sub_1000031D0(&qword_100024D68, type metadata accessor for TipsWidgetWrapperView, (uint64_t)&protocol conformance descriptor for TipsWidgetWrapperView);
    v103 = v51;
    v104 = v52;
    swift_getOpaqueTypeConformance2(&v103, &opaque type descriptor for <<opaque return type of View.redacted(reason:)>>, 1);
    sub_10000D074();
    v53 = v84;
    StaticConfiguration.init<A>(kind:provider:content:)(v48, v50);
    v54 = LocalizedStringKey.init(stringLiteral:)(0x4E5F544547444957, 0xEB00000000454D41);
    v55 = Text.init(_:tableName:bundle:comment:)(v54);
    v57 = v56;
    v59 = v58;
    v61 = v60 & 1;
    v62 = sub_10000D0B8();
    v63 = v86;
    v64 = v87;
    WidgetConfiguration.configurationDisplayName(_:)(v55, v57, v61, v59, v87, v62);
    sub_100008A00(v55, v57, v61);
    swift_bridgeObjectRelease(v59);
    (*(void (**)(_BYTE *, uint64_t))(v85 + 8))(v53, v64);
    swift_bridgeObjectRetain(v22);
    v103 = v64;
    v104 = v62;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v103, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
    v67 = v89;
    v66 = v90;
    WidgetConfiguration.supportedFamilies(_:)(v22, v89, OpaqueTypeConformance2);
    swift_bridgeObjectRelease(v22);
    (*(void (**)(_BYTE *, uint64_t))(v88 + 8))(v63, v67);
    v103 = v67;
    v104 = OpaqueTypeConformance2;
    v68 = swift_getOpaqueTypeConformance2(&v103, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
    LOBYTE(OpaqueTypeConformance2) = v80 & 1;
    v69 = v82;
    v70 = v81;
    v71 = v83;
    v72 = v92;
    WidgetConfiguration.description(_:)(v82, v81, v80 & 1, v83, v92, v68);
    sub_100008A00(v69, v70, OpaqueTypeConformance2);
    swift_bridgeObjectRelease(v71);
    (*(void (**)(_BYTE *, uint64_t))(v91 + 8))(v66, v72);
    v73 = sub_100002A38(&qword_100024D80);
    v74 = type metadata accessor for WidgetLocation(0);
    v75 = swift_allocObject(v73, ((*(unsigned __int8 *)(*(_QWORD *)(v74 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v74 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v74 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v74 - 8) + 80) | 7);
    *(_OWORD *)(v75 + 16) = xmmword_10001B2E0;
    static WidgetLocation.iPhoneWidgetsOnMac.getter();
    v103 = v72;
    v104 = v68;
    v76 = swift_getOpaqueTypeConformance2(&v103, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
    v77 = v94;
    v78 = v101;
    WidgetConfiguration.disfavoredLocations(_:for:)(v75, v22, v94, v76);
    sub_100008A00(v69, v70, OpaqueTypeConformance2);
    swift_bridgeObjectRelease(v75);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v71);
    return (id)(*(uint64_t (**)(_BYTE *, uint64_t))(v93 + 8))(v78, v77);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000CBE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = a2;
  v3 = type metadata accessor for RedactionReasons(0);
  v25 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002A38(&qword_100024630);
  __chkstk_darwin(v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TipsWidgetWrapperView(0);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  v14 = (char *)&v24 - v13;
  v15 = sub_100002A38(&qword_100024D60);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D104(a1, (uint64_t)v8);
  v19 = type metadata accessor for DocumentEntry(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 0, 1, v19);
  *v11 = swift_getKeyPath(&unk_10001B458);
  v20 = sub_100002A38(&qword_1000245E0);
  swift_storeEnumTagMultiPayload(v11, v20, 0);
  sub_100009750((uint64_t)v8, (uint64_t)v11 + *(int *)(v9 + 20));
  sub_1000097A4((uint64_t)v11, (uint64_t)v14, type metadata accessor for TipsWidgetWrapperView);
  if ((DocumentEntry.isPlaceholder.getter() & 1) != 0)
  {
    static RedactionReasons.placeholder.getter();
  }
  else
  {
    v27 = 0;
    v21 = sub_1000031D0(&qword_100024D88, (uint64_t (*)(uint64_t))&type metadata accessor for RedactionReasons, (uint64_t)&protocol conformance descriptor for RedactionReasons);
    dispatch thunk of OptionSet.init(rawValue:)(&v27, v3, v21);
  }
  v22 = sub_1000031D0(&qword_100024D68, type metadata accessor for TipsWidgetWrapperView, (uint64_t)&protocol conformance descriptor for TipsWidgetWrapperView);
  View.redacted(reason:)(v5, v9, v22);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v3);
  sub_100004190((uint64_t)v14, type metadata accessor for TipsWidgetWrapperView);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v26, v18, v15);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000CE9C();
  static Widget.main()();
  return 0;
}

unint64_t sub_10000CE9C()
{
  unint64_t result;

  result = qword_100024D38;
  if (!qword_100024D38)
  {
    result = swift_getWitnessTable(&unk_10001B414, &type metadata for TipsWidget);
    atomic_store(result, (unint64_t *)&qword_100024D38);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipsWidget()
{
  return &type metadata for TipsWidget;
}

uint64_t sub_10000CEF0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DF78, 1);
}

size_t sub_10000CF00(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v10 = sub_100002A38(&qword_100024D90);
  v11 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_29;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = type metadata accessor for WidgetFamily(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((v5 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v20, v21, v8, v17);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v15;
}

unint64_t sub_10000D074()
{
  unint64_t result;

  result = qword_100024D70;
  if (!qword_100024D70)
  {
    result = swift_getWitnessTable(&unk_10001B490, &type metadata for Provider);
    atomic_store(result, (unint64_t *)&qword_100024D70);
  }
  return result;
}

unint64_t sub_10000D0B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024D78;
  if (!qword_100024D78)
  {
    v1 = sub_100003038(&qword_100024D40);
    result = swift_getWitnessTable(&protocol conformance descriptor for StaticConfiguration<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024D78);
  }
  return result;
}

uint64_t sub_10000D104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DocumentEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_10000D14C(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002A38(&qword_100024D98);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

uint64_t sub_10000D25C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100003038(&qword_100024D58);
  v1 = sub_100003038(&qword_100024D50);
  v2 = sub_100003038(&qword_100024D48);
  v7 = sub_100003038(&qword_100024D40);
  v8 = sub_10000D0B8();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disfavoredLocations(_:for:)>>, 1);
}

uint64_t sub_10000D328()
{
  return sub_1000031D0(qword_100024DA0, type metadata accessor for DocumentEntry, (uint64_t)&protocol conformance descriptor for DocumentEntry);
}

uint64_t sub_10000D354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002A38(&qword_100024668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t DocumentEntry.isPlaceholder.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = type metadata accessor for DocumentEntry(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TipsLog(0);
  v32 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(NSLocale), "tps_userLanguageCode");
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  v29 = v1;
  v10 = *(int *)(v1 + 24);
  v34 = v0;
  v31 = v10;
  v11 = *(void **)(v0 + v10);
  if (v11)
  {
    v12 = objc_msgSend(v11, "userLanguageCode");
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0xE000000000000000;
  }
  ((void (*)(void))static TipsLog.widget.getter)();
  v16 = sub_100002A38(&qword_100024B78);
  v17 = swift_allocObject(v16, 72, 7);
  v30 = xmmword_10001B2E0;
  *(_OWORD *)(v17 + 16) = xmmword_10001B2E0;
  *(_QWORD *)(v17 + 56) = &type metadata for String;
  v18 = sub_10000A500();
  *(_QWORD *)(v17 + 64) = v18;
  v28 = v13;
  *(_QWORD *)(v17 + 32) = v13;
  *(_QWORD *)(v17 + 40) = v15;
  swift_bridgeObjectRetain(v15);
  logDebug(_:_:_:)(v6, "cachedTipUserLanguageCode: %@", 29, 2, v17);
  swift_bridgeObjectRelease(v17);
  v19 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
  v20 = v19(v6, v4);
  static TipsLog.widget.getter(v20);
  v21 = swift_allocObject(v16, 72, 7);
  *(_OWORD *)(v21 + 16) = v30;
  *(_QWORD *)(v21 + 56) = &type metadata for String;
  *(_QWORD *)(v21 + 64) = v18;
  v22 = v33;
  *(_QWORD *)(v21 + 32) = v33;
  *(_QWORD *)(v21 + 40) = v9;
  swift_bridgeObjectRetain(v9);
  logDebug(_:_:_:)(v6, "currentUserLanguageCode: %@", 27, 2, v21);
  swift_bridgeObjectRelease(v21);
  v19(v6, v4);
  v23 = *(_QWORD *)(v34 + v31);
  sub_10000D104(v34, (uint64_t)v3);
  if (!v23)
  {
    sub_10000D6B8((uint64_t)v3);
    goto LABEL_10;
  }
  v24 = *(_QWORD *)&v3[*(int *)(v29 + 28)];
  sub_10000D6B8((uint64_t)v3);
  if (!v24)
  {
LABEL_10:
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v9);
    v25 = 1;
    return v25 & 1;
  }
  if (v28 == v22 && v15 == v9)
  {
    swift_bridgeObjectRelease_n(v9, 2);
    v25 = 0;
  }
  else
  {
    v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v9);
    v25 = v26 ^ 1;
  }
  return v25 & 1;
}

uint64_t type metadata accessor for DocumentEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_100024E38;
  if (!qword_100024E38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DocumentEntry);
  return result;
}

uint64_t sub_10000D6B8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DocumentEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void DocumentEntry.init(date:relevance:document:widgetContent:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = (int *)type metadata accessor for DocumentEntry(0);
  v11 = a5 + v10[5];
  v12 = type metadata accessor for TimelineEntryRelevance(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = v10[6];
  *(_QWORD *)(a5 + v13) = 0;
  v14 = v10[7];
  *(_QWORD *)(a5 + v14) = 0;
  v15 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a5, a1, v15);
  sub_10000D354(a2, v11);

  *(_QWORD *)(a5 + v13) = a3;
  *(_QWORD *)(a5 + v14) = a4;
}

uint64_t DocumentEntry.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t DocumentEntry.date.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*DocumentEntry.date.modify())()
{
  return nullsub_2;
}

uint64_t DocumentEntry.relevance.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for DocumentEntry(0) + 20);
  return sub_10000D874(v3, a1);
}

uint64_t sub_10000D874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002A38(&qword_100024668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DocumentEntry.relevance.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for DocumentEntry(0) + 20);
  return sub_10000D354(a1, v3);
}

uint64_t (*DocumentEntry.relevance.modify())()
{
  type metadata accessor for DocumentEntry(0);
  return nullsub_2;
}

void *DocumentEntry.document.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for DocumentEntry(0) + 24));
  v2 = v1;
  return v1;
}

void DocumentEntry.document.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for DocumentEntry(0) + 24);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*DocumentEntry.document.modify())()
{
  type metadata accessor for DocumentEntry(0);
  return nullsub_2;
}

void *DocumentEntry.widgetContent.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for DocumentEntry(0) + 28));
  v2 = v1;
  return v1;
}

void DocumentEntry.widgetContent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for DocumentEntry(0) + 28);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*DocumentEntry.widgetContent.modify())()
{
  type metadata accessor for DocumentEntry(0);
  return nullsub_2;
}

uint64_t DocumentEntry.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  Swift::String v7;
  uint64_t v8;
  unint64_t v9;
  Swift::String v10;
  void *object;
  Swift::String v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  float v18;
  Swift::String v19;
  double v20;
  Swift::String v21;
  id v22;
  uint64_t v23;
  Swift::String v24;
  void *v25;
  Swift::String v26;
  id v27;
  uint64_t v28;
  Swift::String v29;
  void *v30;
  Swift::String v31;
  char v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v38;
  id v39;
  _QWORD v40[2];

  v1 = sub_100002A38(&qword_100024668);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v38 - v5;
  v40[0] = 0;
  v40[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(105);
  v7._countAndFlagsBits = 0xD000000000000016;
  v7._object = (void *)0x800000010001F240;
  String.append(_:)(v7);
  v8 = type metadata accessor for Date(0);
  v9 = sub_10000DDA0();
  v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v8, v9);
  object = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(object);
  v12._countAndFlagsBits = 0x3A65726F6353202CLL;
  v12._object = (void *)0xE900000000000020;
  String.append(_:)(v12);
  v13 = (int *)type metadata accessor for DocumentEntry(0);
  v14 = v0 + v13[5];
  sub_10000D874(v14, (uint64_t)v6);
  v15 = type metadata accessor for TimelineEntryRelevance(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v6, 1, v15) == 1)
  {
    sub_10000DDE8((uint64_t)v6);
    v18 = 0.0;
  }
  else
  {
    v18 = TimelineEntryRelevance.score.getter();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
  }
  Float.write<A>(to:)(v40, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v18);
  v19._countAndFlagsBits = 0x697461727544202CLL;
  v19._object = (void *)0xEC000000203A6E6FLL;
  String.append(_:)(v19);
  sub_10000D874(v14, (uint64_t)v4);
  if (v17(v4, 1, v15) == 1)
  {
    sub_10000DDE8((uint64_t)v4);
    v20 = 0.0;
  }
  else
  {
    v20 = TimelineEntryRelevance.duration.getter();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v15);
  }
  Double.write<A>(to:)(v40, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v20);
  v21._countAndFlagsBits = 0x73646E6F63657320;
  v21._object = (void *)0xEF203A706954202CLL;
  String.append(_:)(v21);
  v39 = *(id *)(v0 + v13[6]);
  v22 = v39;
  v23 = sub_100002A38(&qword_100024DD0);
  v24._countAndFlagsBits = String.init<A>(describing:)(&v39, v23);
  v25 = v24._object;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v25);
  v26._countAndFlagsBits = 0xD000000000000012;
  v26._object = (void *)0x800000010001F260;
  String.append(_:)(v26);
  v39 = *(id *)(v0 + v13[7]);
  v27 = v39;
  v28 = sub_100002A38(&qword_100024DD8);
  v29._countAndFlagsBits = String.init<A>(describing:)(&v39, v28);
  v30 = v29._object;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v30);
  v31._object = (void *)0x800000010001F280;
  v31._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v31);
  v32 = DocumentEntry.isPlaceholder.getter();
  v33 = (v32 & 1) == 0;
  if ((v32 & 1) != 0)
    v34 = 1702195828;
  else
    v34 = 0x65736C6166;
  if (v33)
    v35 = 0xE500000000000000;
  else
    v35 = 0xE400000000000000;
  v36 = v35;
  String.append(_:)(*(Swift::String *)&v34);
  swift_bridgeObjectRelease(v35);
  return v40[0];
}

unint64_t sub_10000DDA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024DC8;
  if (!qword_100024DC8)
  {
    v1 = type metadata accessor for Date(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Date, v1);
    atomic_store(result, (unint64_t *)&qword_100024DC8);
  }
  return result;
}

uint64_t sub_10000DDE8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002A38(&qword_100024668);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_10000D874(v2 + *(int *)(a1 + 20), a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for DocumentEntry(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for TimelineEntryRelevance(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = sub_100002A38(&qword_100024668);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[6];
    v16 = a3[7];
    v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = (uint64_t)v17;
    v18 = *(void **)((char *)a2 + v16);
    *(uint64_t *)((char *)a1 + v16) = (uint64_t)v18;
    v19 = v17;
    v20 = v18;
  }
  return a1;
}

void destroy for DocumentEntry(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = type metadata accessor for TimelineEntryRelevance(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);

}

uint64_t initializeWithCopy for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
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
  void *v15;
  void *v16;
  id v17;
  id v18;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100002A38(&qword_100024668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = *(void **)(a2 + v13);
  *(_QWORD *)(a1 + v13) = v15;
  v16 = *(void **)(a2 + v14);
  *(_QWORD *)(a1 + v14) = v16;
  v17 = v15;
  v18 = v16;
  return a1;
}

uint64_t assignWithCopy for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_100002A38(&qword_100024668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = *(void **)(a1 + v16);
  v18 = *(void **)(a2 + v16);
  *(_QWORD *)(a1 + v16) = v18;
  v19 = v18;

  v20 = a3[7];
  v21 = *(void **)(a1 + v20);
  v22 = *(void **)(a2 + v20);
  *(_QWORD *)(a1 + v20) = v22;
  v23 = v22;

  return a1;
}

uint64_t initializeWithTake for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100002A38(&qword_100024668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_100002A38(&qword_100024668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);

  v18 = a3[7];
  v19 = *(void **)(a1 + v18);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);

  return a1;
}

uint64_t getEnumTagSinglePayload for DocumentEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E4C4);
}

uint64_t sub_10000E4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100002A38(&qword_100024668);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for DocumentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E588);
}

uint64_t sub_10000E588(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100002A38(&qword_100024668);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

void sub_10000E630(uint64_t a1)
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
    sub_10000E6C0(319);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = "\b";
      v6[3] = "\b";
      swift_initStructMetadata(a1, 256, 4, v6, a1 + 16);
    }
  }
}

void sub_10000E6C0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100024E48)
  {
    v2 = type metadata accessor for TimelineEntryRelevance(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100024E48);
  }
}

ValueMetadata *type metadata accessor for SmallTipView()
{
  return &type metadata for SmallTipView;
}

uint64_t sub_10000E724(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001DFE4, 1);
}

uint64_t sub_10000E734@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  _OWORD v25[3];

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SquareTitleView(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v7, enum case for WidgetFamily.systemSmall(_:), v4, v9);
  GeometryProxy.size.getter(a1);
  v13 = v12;
  *(_QWORD *)v11 = swift_getKeyPath(&unk_10001B5D0);
  v11[8] = 0;
  v14 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))(&v11[v8[5]], v7, v4);
  *(_QWORD *)&v11[v8[6]] = a1;
  *(_QWORD *)&v11[v8[7]] = v13;
  v15 = GeometryProxy.size.getter(v14);
  GeometryProxy.size.getter(v16);
  v18 = v17;
  v20 = static Alignment.center.getter(v19);
  _FrameLayout.init(width:height:alignment:)(v25, *(_QWORD *)&v15, 0, v18, 0, v20, v21);
  sub_10000E944((uint64_t)v11, a2);
  v22 = (_OWORD *)(a2 + *(int *)(sub_100002A38(&qword_100024E80) + 36));
  v23 = v25[1];
  *v22 = v25[0];
  v22[1] = v23;
  v22[2] = v25[2];
  return sub_10000E988((uint64_t)v11);
}

id sub_10000E8C0@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  void **v1;
  uint64_t v3;
  void *v5;

  v5 = *v1;
  v3 = swift_allocObject(&unk_100021558, 24, 7);
  *(_QWORD *)(v3 + 16) = v5;
  *a1 = sub_10000E938;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;
  return v5;
}

uint64_t sub_10000E914()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000E938@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000E734(*(void **)(v1 + 16), a1);
}

uint64_t sub_10000E944(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SquareTitleView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E988(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SquareTitleView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E9C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024E88;
  if (!qword_100024E88)
  {
    v1 = sub_100003038(&qword_100024E90);
    result = swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100024E88);
  }
  return result;
}

void *UIFont.defaultHyphenationFactor.unsafeMutableAddressor()
{
  return &static UIFont.defaultHyphenationFactor;
}

double static UIFont.defaultHyphenationFactor.getter()
{
  return 0.2;
}

void *UIFont.widgetTitleScaleFactor.unsafeMutableAddressor()
{
  return &static UIFont.widgetTitleScaleFactor;
}

double static UIFont.widgetTitleScaleFactor.getter()
{
  return 0.65;
}

void *UIFont.widgetBodyScaleFactor.unsafeMutableAddressor()
{
  return &static UIFont.widgetBodyScaleFactor;
}

double static UIFont.widgetBodyScaleFactor.getter()
{
  return 0.7;
}

uint64_t HorizontalTipViewWithBody.init(family:widgetContent:width:height:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v10 = (int *)type metadata accessor for HorizontalTipViewWithBody(0);
  v11 = v10[5];
  v12 = type metadata accessor for WidgetFamily(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a3, a1, v12);
  *(_QWORD *)(a3 + v11) = a2;
  *(double *)(a3 + v10[6]) = a4;
  *(double *)(a3 + v10[7]) = a5;
  return result;
}

uint64_t type metadata accessor for HorizontalTipViewWithBody(uint64_t a1)
{
  return sub_100007918(a1, qword_100024F30, (uint64_t)&nominal type descriptor for HorizontalTipViewWithBody);
}

uint64_t EnvironmentValues.isPlaceholder.getter()
{
  unint64_t v0;
  uint64_t var1;

  v0 = sub_10000576C();
  EnvironmentValues.subscript.getter(&var1, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v0);
  return var1;
}

uint64_t EnvironmentValues.isPlaceholder.setter(char a1)
{
  unint64_t v1;
  char v3;

  v3 = a1;
  v1 = sub_10000576C();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v1);
}

uint64_t BackgroundGradient.init(endPoint:content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3 & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_10000EB80()
{
  uint64_t result;

  result = static Color.white.getter();
  qword_1000264A0 = result;
  return result;
}

uint64_t sub_10000EB9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v0 = type metadata accessor for Color.RGBColorSpace(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002A38(&qword_100025378);
  v5 = swift_allocObject(v4, 80, 7);
  *(_OWORD *)(v5 + 16) = xmmword_10001B620;
  v6 = enum case for Color.RGBColorSpace.sRGB(_:);
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v7(v3, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  v8 = Color.init(_:red:green:blue:opacity:)(v3, 1.0, 0.8, 0.0, 1.0);
  *(_QWORD *)(v5 + 32) = Gradient.Stop.init(color:location:)(v8, 0.0);
  *(_QWORD *)(v5 + 40) = v9;
  v7(v3, v6, v0);
  v10 = Color.init(_:red:green:blue:opacity:)(v3, 1.0, 0.8, 0.0, 1.0);
  *(_QWORD *)(v5 + 48) = Gradient.Stop.init(color:location:)(v10, 0.3);
  *(_QWORD *)(v5 + 56) = v11;
  v7(v3, v6, v0);
  v12 = Color.init(_:red:green:blue:opacity:)(v3, 1.0, 0.658823529, 0.0, 1.0);
  result = Gradient.Stop.init(color:location:)(v12, 1.0);
  *(_QWORD *)(v5 + 64) = result;
  *(_QWORD *)(v5 + 72) = v14;
  qword_1000264A8 = v5;
  return result;
}

uint64_t sub_10000ED04()
{
  uint64_t v0;

  v0 = static VerticalAlignment.lastTextBaseline.getter();
  return ViewDimensions.subscript.getter(v0);
}

uint64_t sub_10000ED2C()
{
  unint64_t v0;
  uint64_t result;

  v0 = sub_10001718C();
  result = VerticalAlignment.init(_:)(&_s27WidgetTextBaselineAlignmentON, v0);
  qword_1000264B0 = result;
  return result;
}

uint64_t sub_10000ED58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SquareTitleView(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v21 - v13;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))(v7, a1, v4, v12);
  v15 = type metadata accessor for HorizontalTipViewWithBody(0);
  v16 = *(void **)(a1 + *(int *)(v15 + 20));
  v17 = *(_QWORD *)(a1 + *(int *)(v15 + 28));
  *(_QWORD *)v14 = swift_getKeyPath(&unk_10001BB60);
  v14[8] = 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v14[v8[5]], v7, v4);
  *(_QWORD *)&v14[v8[6]] = v16;
  *(_QWORD *)&v14[v8[7]] = v17;
  sub_10000817C((uint64_t)v14, (uint64_t)v10, type metadata accessor for SquareTitleView);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v18 = sub_100002A38(&qword_100025398);
  sub_10000817C((uint64_t)v10, a2 + *(int *)(v18 + 48), type metadata accessor for SquareTitleView);
  v19 = v16;
  sub_100004190((uint64_t)v14, type metadata accessor for SquareTitleView);
  return sub_100004190((uint64_t)v10, type metadata accessor for SquareTitleView);
}

uint64_t HorizontalTipViewWithBody.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD v17[3];

  v2 = v1;
  v4 = sub_100002A38(&qword_100024E98);
  __chkstk_darwin(v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000245D8 != -1)
    swift_once(&qword_1000245D8, sub_10000ED2C);
  *(_QWORD *)v6 = qword_1000264B0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 0;
  v7 = sub_100002A38(&qword_100024EA0);
  sub_10000F034(v2, (uint64_t)&v6[*(int *)(v7 + 44)]);
  v8 = type metadata accessor for HorizontalTipViewWithBody(0);
  v9 = *(_QWORD *)(v2 + *(int *)(v8 + 24));
  v10 = *(_QWORD *)(v2 + *(int *)(v8 + 28));
  v12 = static Alignment.bottom.getter(v11);
  _FrameLayout.init(width:height:alignment:)(v17, v9, 0, v10, 0, v12, v13);
  sub_1000057B0((uint64_t)v6, a1, &qword_100024E98);
  v14 = (_OWORD *)(a1 + *(int *)(sub_100002A38(&qword_100024EA8) + 36));
  v15 = v17[1];
  *v14 = v17[0];
  v14[1] = v15;
  v14[2] = v17[2];
  return sub_100004A5C((uint64_t)v6, &qword_100024E98);
}

uint64_t sub_10000F034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  id v23;
  uint64_t v25;

  v4 = sub_100002A38(&qword_100025380);
  __chkstk_darwin(v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v25 - v9;
  *(_QWORD *)v10 = static HorizontalAlignment.center.getter(v8);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v11 = sub_100002A38(&qword_100025388);
  sub_10000ED58(a1, (uint64_t)&v10[*(int *)(v11 + 44)]);
  v13 = static HorizontalAlignment.center.getter(v12);
  v14 = *(void **)(a1 + *(int *)(type metadata accessor for HorizontalTipViewWithBody(0) + 20));
  v15 = v14;
  v16 = static Edge.Set.all.getter();
  sub_1000057B0((uint64_t)v10, (uint64_t)v6, &qword_100025380);
  sub_1000057B0((uint64_t)v6, a2, &qword_100025380);
  v17 = a2 + *(int *)(sub_100002A38(&qword_100025390) + 48);
  *(_QWORD *)v17 = v13;
  *(_QWORD *)(v17 + 8) = 0;
  *(_BYTE *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  *(_BYTE *)(v17 + 32) = 1;
  *(_QWORD *)(v17 + 40) = v14;
  *(_BYTE *)(v17 + 48) = v16;
  *(_OWORD *)(v17 + 56) = xmmword_10001B630;
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)(v17 + 72) = _Q0;
  *(_BYTE *)(v17 + 88) = 0;
  v23 = v15;
  sub_100004A5C((uint64_t)v10, &qword_100025380);

  return sub_100004A5C((uint64_t)v6, &qword_100025380);
}

uint64_t sub_10000F1A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  _OWORD v19[3];

  v4 = v2;
  v6 = sub_100002A38(&qword_100024E98);
  __chkstk_darwin(v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000245D8 != -1)
    swift_once(&qword_1000245D8, sub_10000ED2C);
  *(_QWORD *)v8 = qword_1000264B0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  v9 = sub_100002A38(&qword_100024EA0);
  sub_10000F034(v4, (uint64_t)&v8[*(int *)(v9 + 44)]);
  v10 = *(int *)(a1 + 28);
  v11 = *(_QWORD *)(v4 + *(int *)(a1 + 24));
  v12 = *(_QWORD *)(v4 + v10);
  v14 = static Alignment.bottom.getter(v13);
  _FrameLayout.init(width:height:alignment:)(v19, v11, 0, v12, 0, v14, v15);
  sub_1000057B0((uint64_t)v8, a2, &qword_100024E98);
  v16 = (_OWORD *)(a2 + *(int *)(sub_100002A38(&qword_100024EA8) + 36));
  v17 = v19[1];
  *v16 = v19[0];
  v16[1] = v17;
  v16[2] = v19[2];
  return sub_100004A5C((uint64_t)v8, &qword_100024E98);
}

uint64_t SquareTitleView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  _OWORD v35[3];

  v2 = v1;
  v4 = sub_100002A38(&qword_100024EB0);
  __chkstk_darwin(v4);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100002A38(&qword_100024EB8);
  __chkstk_darwin(v7);
  v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100002A38(&qword_100024EC0);
  __chkstk_darwin(v10);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)v2;
  v14 = *(_BYTE *)(v2 + 8);
  sub_10000827C(*(_QWORD *)v2, v14);
  v15 = sub_100003974(v13, v14);
  v16 = sub_100005220(v13, v14);
  if ((v15 & 1) != 0)
    v17 = static VerticalAlignment.bottom.getter(v16);
  else
    v17 = static VerticalAlignment.top.getter(v16);
  *(_QWORD *)v6 = v17;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 0;
  v18 = sub_100002A38(&qword_100024EC8);
  sub_10000F570(v2, (uint64_t)&v6[*(int *)(v18 + 44)]);
  sub_10000827C(v13, v14);
  v19 = sub_100003974(v13, v14);
  v20 = sub_100005220(v13, v14);
  if ((v19 & 1) != 0)
    v21 = 0x4030000000000000;
  else
    v21 = 0;
  v22 = static Edge.Set.all.getter(v20);
  sub_1000057B0((uint64_t)v6, (uint64_t)v9, &qword_100024EB0);
  v23 = &v9[*(int *)(v7 + 36)];
  *v23 = v22;
  *((_QWORD *)v23 + 1) = v21;
  *((_QWORD *)v23 + 2) = v21;
  *((_QWORD *)v23 + 3) = v21;
  *((_QWORD *)v23 + 4) = v21;
  v23[40] = 0;
  sub_100004A5C((uint64_t)v6, &qword_100024EB0);
  v24 = *(_QWORD *)(v2 + *(int *)(type metadata accessor for SquareTitleView(0) + 28));
  v25 = *(_QWORD *)v2;
  v26 = *(_BYTE *)(v2 + 8);
  sub_10000827C(v25, v26);
  v27 = sub_100003974(v25, v26);
  v28 = sub_100005220(v25, v26);
  if ((v27 & 1) != 0)
    v30 = static Alignment.bottom.getter(v29);
  else
    v30 = static Alignment.top.getter(v28);
  _FrameLayout.init(width:height:alignment:)(v35, v24, 0, v24, 0, v30, v31);
  sub_1000057B0((uint64_t)v9, (uint64_t)v12, &qword_100024EB8);
  v32 = &v12[*(int *)(v10 + 36)];
  v33 = v35[1];
  *(_OWORD *)v32 = v35[0];
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v35[2];
  sub_100004A5C((uint64_t)v9, &qword_100024EB8);
  return sub_1000056E8((uint64_t)v12, a1, &qword_100024EC0);
}

uint64_t sub_10000F570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  int *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;

  v40 = a2;
  v3 = sub_100002A38(&qword_1000250B8);
  __chkstk_darwin(v3);
  v5 = (uint64_t *)((char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for SquareTitleView(0);
  v14 = *(void **)(a1 + v13[6]);
  v15 = *(double *)(a1 + v13[7]);
  v16 = a1 + v13[5];
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v39 = v6;
  v17(v9, v16, v6);
  v18 = *(_QWORD *)a1;
  LOBYTE(a1) = *(_BYTE *)(a1 + 8);
  v19 = v14;
  sub_10000827C(v18, a1);
  v20 = sub_100003974(v18, a1);
  v21 = sub_100005220(v18, a1);
  if ((v20 & 1) != 0)
    v22 = static Alignment.bottomLeading.getter(v21);
  else
    v22 = static Alignment.topLeading.getter(v21);
  v24 = v22;
  v25 = v23;
  KeyPath = swift_getKeyPath(&unk_10001BB08);
  *v5 = swift_getKeyPath(&unk_10001BB30);
  v27 = sub_100002A38(&qword_1000250B0);
  swift_storeEnumTagMultiPayload(v5, v27, 0);
  v28 = swift_getKeyPath(&unk_10001BB60);
  *(_QWORD *)v12 = KeyPath;
  v12[8] = 0;
  sub_1000056E8((uint64_t)v5, (uint64_t)&v12[v10[5]], &qword_1000250B8);
  v29 = &v12[v10[6]];
  *(_QWORD *)v29 = v28;
  v29[8] = 0;
  *(_QWORD *)&v12[v10[7]] = v14;
  *(double *)&v12[v10[8]] = v15 + -32.0;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v12[v10[9]], v9, v39);
  v12[v10[10]] = 0;
  v30 = &v12[v10[11]];
  *(_QWORD *)v30 = v24;
  *((_QWORD *)v30 + 1) = v25;
  v31 = &v12[v10[12]];
  *(_QWORD *)v31 = 0x3E6E69616C703CLL;
  *((_QWORD *)v31 + 1) = 0xE700000000000000;
  v32 = &v12[v10[13]];
  *(_QWORD *)v32 = 0x3E6E69616C702F3CLL;
  *((_QWORD *)v32 + 1) = 0xE800000000000000;
  v33 = &v12[v10[14]];
  *(_QWORD *)v33 = 1701869940;
  *((_QWORD *)v33 + 1) = 0xE400000000000000;
  v34 = &v12[v10[15]];
  *(_QWORD *)v34 = 1954047348;
  *((_QWORD *)v34 + 1) = 0xE400000000000000;
  v35 = &v12[v10[16]];
  *(_QWORD *)v35 = 1954047348;
  *((_QWORD *)v35 + 1) = 0xE400000000000000;
  v36 = &v12[v10[17]];
  *(_QWORD *)v36 = 0x736B72616DLL;
  *((_QWORD *)v36 + 1) = 0xE500000000000000;
  v37 = &v12[v10[18]];
  *(_QWORD *)v37 = 0x6F43746E65636361;
  *((_QWORD *)v37 + 1) = 0xEB00000000726F6CLL;
  return sub_1000097A4((uint64_t)v12, v40, type metadata accessor for TitleView);
}

uint64_t type metadata accessor for SquareTitleView(uint64_t a1)
{
  return sub_100007918(a1, qword_100024FC8, (uint64_t)&nominal type descriptor for SquareTitleView);
}

void *IsPlaceholderKey.defaultValue.unsafeMutableAddressor()
{
  return &static IsPlaceholderKey.defaultValue;
}

uint64_t static IsPlaceholderKey.defaultValue.getter()
{
  return 1;
}

void sub_10000F8A4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000F8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

uint64_t (*EnvironmentValues.isPlaceholder.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t v4;

  v3 = (_QWORD *)(a1 + 17);
  *(_QWORD *)a1 = v1;
  v4 = sub_10000576C();
  *(_QWORD *)(a1 + 8) = v4;
  EnvironmentValues.subscript.getter(v3, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_10000F91C;
}

uint64_t sub_10000F91C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return EnvironmentValues.subscript.setter(a1 + 17, &type metadata for IsPlaceholderKey, &type metadata for IsPlaceholderKey, v1);
}

uint64_t BackgroundGradient.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t OpaqueTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _BYTE v33[16];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];

  v32 = a2;
  v4 = type metadata accessor for ContainerBackgroundPlacement(0);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  v29 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 24);
  v28 = sub_10000FB54();
  v37[0] = v7;
  v37[1] = &type metadata for LinearGradient;
  v37[2] = v11;
  v37[3] = v28;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(0, v37, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 0);
  v13 = *(_QWORD *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v27 - v18;
  v20 = (*(uint64_t (**)(__n128))(v2 + 24))(v17);
  v21 = static ContainerBackgroundPlacement.widget.getter(v20);
  v34 = v7;
  v35 = v11;
  v36 = v2;
  v22 = static Alignment.center.getter(v21);
  View.containerBackground<A>(for:alignment:content:)(v6, v22, v23, sub_10000FC5C, v33, v7, &type metadata for LinearGradient, v11, v28);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v7);
  v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v24(v19, v15, OpaqueTypeMetadata2);
  v25 = *(void (**)(char *, uint64_t))(v13 + 8);
  v25(v15, OpaqueTypeMetadata2);
  v24(v32, v19, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v25)(v19, OpaqueTypeMetadata2);
}

unint64_t sub_10000FB54()
{
  unint64_t result;

  result = qword_100024ED0;
  if (!qword_100024ED0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LinearGradient, &type metadata for LinearGradient);
    atomic_store(result, (unint64_t *)&qword_100024ED0);
  }
  return result;
}

double sub_10000FB98@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  __n128 v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double result;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;

  if (qword_1000245D0 != -1)
    swift_once(&qword_1000245D0, sub_10000EB9C);
  v4 = swift_bridgeObjectRetain(qword_1000264A8);
  v5 = Gradient.init(stops:)(v4);
  v8 = static UnitPoint.bottomLeading.getter();
  v10 = v9;
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v6.n128_u64[0] = static UnitPoint.topTrailing.getter();
    v7.n128_u64[0] = v11;
  }
  else
  {
    v6.n128_u64[0] = *(_QWORD *)a1;
    v7.n128_u64[0] = *(_QWORD *)(a1 + 8);
  }
  LinearGradient.init(gradient:startPoint:endPoint:)(v14, v5, v8, v10, v6, v7);
  result = *(double *)v14;
  v13 = v14[1];
  *(_OWORD *)a2 = v14[0];
  *(_OWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 32) = v15;
  return result;
}

double sub_10000FC5C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000FB98(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_10000FC68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of HorizontalTipViewWithBody.body>>, 1);
}

uint64_t sub_10000FC78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of SquareTitleView.body>>, 1);
}

uint64_t sub_10000FC88(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of BackgroundGradient.body>>, 1);
}

uint64_t sub_10000FCBC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return BackgroundGradient.body.getter(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for HorizontalTipViewWithBody(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v11 = v10;
  }
  return a1;
}

void destroy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = v9;
  return a1;
}

uint64_t assignWithCopy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000FFC0);
}

uint64_t sub_10000FFC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010054);
}

uint64_t sub_100010054(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_1000100CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100017A48(a1, a2, a3, (uint64_t)"\b", (uint64_t)&value witness table for Builtin.Int64 + 64);
}

unint64_t initializeBufferWithCopyOfBuffer for SquareTitleView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v17);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_10000827C(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a3[5];
    v10 = a1 + v9;
    v11 = a2 + v9;
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[6];
    v14 = a3[7];
    v15 = *(void **)(a2 + v13);
    *(_QWORD *)(a1 + v13) = v15;
    *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
    v16 = v15;
  }
  return a1;
}

void destroy for SquareTitleView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100005220(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

uint64_t initializeWithCopy for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[6];
  v13 = a3[7];
  v14 = *(void **)(a2 + v12);
  *(_QWORD *)(a1 + v12) = v14;
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v15 = v14;
  return a1;
}

uint64_t assignWithCopy for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[6];
  v15 = *(void **)(a1 + v14);
  v16 = *(void **)(a2 + v14);
  *(_QWORD *)(a1 + v14) = v16;
  v17 = v16;

  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for SquareTitleView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  v10 = a3[5];
  v11 = a1 + v10;
  v12 = (uint64_t)a2 + v10;
  v13 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[6];
  v15 = *(void **)(a1 + v14);
  *(_QWORD *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);

  *(_QWORD *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for SquareTitleView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010484);
}

uint64_t sub_100010484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for SquareTitleView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001051C);
}

uint64_t sub_10001051C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

uint64_t sub_100010598(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = "\t";
  result = type metadata accessor for WidgetFamily(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = "\b";
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IsPlaceholderKey()
{
  return &type metadata for IsPlaceholderKey;
}

uint64_t sub_100010634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_10001063C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_10001066C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100010674(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_retain(v3);
  return a1;
}

uint64_t sub_1000106B0(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v3;
  v4 = *((_QWORD *)a2 + 4);
  v5 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain(v4);
  swift_release(v5);
  return a1;
}

__n128 sub_1000106F8(uint64_t a1, uint64_t a2)
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

uint64_t sub_10001070C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v3);
  return a1;
}

uint64_t sub_10001074C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_100010794(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for BackgroundGradient(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000171D0(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BackgroundGradient);
}

unint64_t sub_1000107EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025088;
  if (!qword_100025088)
  {
    v1 = sub_100003038(&qword_100024EA8);
    sub_1000086C8(&qword_100025090, &qword_100024E98, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025088);
  }
  return result;
}

uint64_t sub_100010870()
{
  return sub_100017BF0(&qword_100025098, &qword_100024EC0, (void (*)(void))sub_1000108A4);
}

unint64_t sub_1000108A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000250A0;
  if (!qword_1000250A0)
  {
    v1 = sub_100003038(&qword_100024EB8);
    sub_1000086C8(&qword_1000250A8, &qword_100024EB0, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000250A0);
  }
  return result;
}

uint64_t sub_100010928(_QWORD *a1)
{
  uint64_t v1;
  _QWORD v3[4];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = &type metadata for LinearGradient;
  v3[2] = v1;
  v3[3] = sub_10000FB54();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
}

unint64_t sub_100010974(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v15);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_10000827C(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = a3[5];
    v10 = (uint64_t *)(a1 + v9);
    v11 = (uint64_t *)(a2 + v9);
    v12 = sub_100002A38(&qword_1000250B0);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
      v14 = 1;
    }
    else
    {
      v16 = *v11;
      *v10 = *v11;
      swift_retain(v16);
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v14);
    v17 = a3[6];
    v18 = a1 + v17;
    v19 = a2 + v17;
    v20 = *(_QWORD *)v19;
    v21 = *(_BYTE *)(v19 + 8);
    sub_10000827C(*(_QWORD *)v19, v21);
    *(_QWORD *)v18 = v20;
    *(_BYTE *)(v18 + 8) = v21;
    v22 = a3[7];
    v23 = a3[8];
    v24 = *(void **)(a2 + v22);
    *(_QWORD *)(a1 + v22) = v24;
    *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
    v25 = a3[9];
    v26 = a1 + v25;
    v27 = a2 + v25;
    v28 = type metadata accessor for WidgetFamily(0);
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
    v30 = v24;
    v29(v26, v27, v28);
    v31 = a3[11];
    *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
    *(_OWORD *)(a1 + v31) = *(_OWORD *)(a2 + v31);
    v32 = a3[12];
    v33 = a3[13];
    v34 = (_QWORD *)(a1 + v32);
    v35 = (_QWORD *)(a2 + v32);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    v37 = (_QWORD *)(a1 + v33);
    v38 = (_QWORD *)(a2 + v33);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    v40 = a3[14];
    v41 = a3[15];
    v42 = (_QWORD *)(a1 + v40);
    v43 = (_QWORD *)(a2 + v40);
    v44 = v43[1];
    *v42 = *v43;
    v42[1] = v44;
    v45 = (_QWORD *)(a1 + v41);
    v46 = (_QWORD *)(a2 + v41);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[16];
    v49 = a3[17];
    v50 = (_QWORD *)(a1 + v48);
    v51 = (_QWORD *)(a2 + v48);
    v52 = v51[1];
    *v50 = *v51;
    v50[1] = v52;
    v53 = (_QWORD *)(a1 + v49);
    v54 = (_QWORD *)(a2 + v49);
    v55 = v54[1];
    *v53 = *v54;
    v53[1] = v55;
    v56 = a3[18];
    v57 = (_QWORD *)(a1 + v56);
    v58 = (_QWORD *)(a2 + v56);
    v59 = v58[1];
    *v57 = *v58;
    v57[1] = v59;
    swift_bridgeObjectRetain(v36);
    swift_bridgeObjectRetain(v39);
    swift_bridgeObjectRetain(v44);
    swift_bridgeObjectRetain(v47);
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRetain(v55);
    swift_bridgeObjectRetain(v59);
  }
  return a1;
}

uint64_t sub_100010BA8(uint64_t a1, int *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100005220(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  v4 = (_QWORD *)(a1 + a2[5]);
  v5 = sub_100002A38(&qword_1000250B0);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  sub_100005220(*(_QWORD *)(a1 + a2[6]), *(_BYTE *)(a1 + a2[6] + 8));

  v7 = a1 + a2[9];
  v8 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[12] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[13] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[14] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[15] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[17] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[18] + 8));
}

uint64_t sub_100010CDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = (uint64_t *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = sub_100002A38(&qword_1000250B0);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for RedactionReasons(0);
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
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  sub_10000827C(*(_QWORD *)v17, v19);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v19;
  v20 = a3[7];
  v21 = a3[8];
  v22 = *(void **)(a2 + v20);
  *(_QWORD *)(a1 + v20) = v22;
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = type metadata accessor for WidgetFamily(0);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
  v28 = v22;
  v27(v24, v25, v26);
  v29 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v29) = *(_OWORD *)(a2 + v29);
  v30 = a3[12];
  v31 = a3[13];
  v32 = (_QWORD *)(a1 + v30);
  v33 = (_QWORD *)(a2 + v30);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  v35 = (_QWORD *)(a1 + v31);
  v36 = (_QWORD *)(a2 + v31);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  v38 = a3[14];
  v39 = a3[15];
  v40 = (_QWORD *)(a1 + v38);
  v41 = (_QWORD *)(a2 + v38);
  v42 = v41[1];
  *v40 = *v41;
  v40[1] = v42;
  v43 = (_QWORD *)(a1 + v39);
  v44 = (_QWORD *)(a2 + v39);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = a3[16];
  v47 = a3[17];
  v48 = (_QWORD *)(a1 + v46);
  v49 = (_QWORD *)(a2 + v46);
  v50 = v49[1];
  *v48 = *v49;
  v48[1] = v50;
  v51 = (_QWORD *)(a1 + v47);
  v52 = (_QWORD *)(a2 + v47);
  v53 = v52[1];
  *v51 = *v52;
  v51[1] = v53;
  v54 = a3[18];
  v55 = (_QWORD *)(a1 + v54);
  v56 = (_QWORD *)(a2 + v54);
  v57 = v56[1];
  *v55 = *v56;
  v55[1] = v57;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRetain(v53);
  swift_bridgeObjectRetain(v57);
  return a1;
}

uint64_t sub_100010EE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000827C(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  if (a1 != a2)
  {
    v10 = a3[5];
    v11 = (uint64_t *)(a1 + v10);
    v12 = (uint64_t *)(a2 + v10);
    sub_100004A5C(a1 + v10, &qword_1000250B0);
    v13 = sub_100002A38(&qword_1000250B0);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
      v15 = 1;
    }
    else
    {
      v16 = *v12;
      *v11 = *v12;
      swift_retain(v16);
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v13, v15);
  }
  v17 = a3[6];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = *(_QWORD *)v19;
  v21 = *(_BYTE *)(v19 + 8);
  sub_10000827C(*(_QWORD *)v19, v21);
  v22 = *(_QWORD *)v18;
  v23 = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v18 = v20;
  *(_BYTE *)(v18 + 8) = v21;
  sub_100005220(v22, v23);
  v24 = a3[7];
  v25 = *(void **)(a1 + v24);
  v26 = *(void **)(a2 + v24);
  *(_QWORD *)(a1 + v24) = v26;
  v27 = v26;

  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v28 = a3[9];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 24))(v29, v30, v31);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v32 = a3[11];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  *v33 = *v34;
  v33[1] = v34[1];
  v35 = a3[12];
  v36 = (_QWORD *)(a1 + v35);
  v37 = (_QWORD *)(a2 + v35);
  *v36 = *v37;
  v38 = v37[1];
  v39 = v36[1];
  v36[1] = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  v40 = a3[13];
  v41 = (_QWORD *)(a1 + v40);
  v42 = (_QWORD *)(a2 + v40);
  *v41 = *v42;
  v43 = v42[1];
  v44 = v41[1];
  v41[1] = v43;
  swift_bridgeObjectRetain(v43);
  swift_bridgeObjectRelease(v44);
  v45 = a3[14];
  v46 = (_QWORD *)(a1 + v45);
  v47 = (_QWORD *)(a2 + v45);
  *v46 = *v47;
  v48 = v47[1];
  v49 = v46[1];
  v46[1] = v48;
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRelease(v49);
  v50 = a3[15];
  v51 = (_QWORD *)(a1 + v50);
  v52 = (_QWORD *)(a2 + v50);
  *v51 = *v52;
  v53 = v52[1];
  v54 = v51[1];
  v51[1] = v53;
  swift_bridgeObjectRetain(v53);
  swift_bridgeObjectRelease(v54);
  v55 = a3[16];
  v56 = (_QWORD *)(a1 + v55);
  v57 = (_QWORD *)(a2 + v55);
  *v56 = *v57;
  v58 = v57[1];
  v59 = v56[1];
  v56[1] = v58;
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRelease(v59);
  v60 = a3[17];
  v61 = (_QWORD *)(a1 + v60);
  v62 = (_QWORD *)(a2 + v60);
  *v61 = *v62;
  v63 = v62[1];
  v64 = v61[1];
  v61[1] = v63;
  swift_bridgeObjectRetain(v63);
  swift_bridgeObjectRelease(v64);
  v65 = a3[18];
  v66 = (_QWORD *)(a1 + v65);
  v67 = (_QWORD *)(a2 + v65);
  *v66 = *v67;
  v68 = v67[1];
  v69 = v66[1];
  v66[1] = v68;
  swift_bridgeObjectRetain(v68);
  swift_bridgeObjectRelease(v69);
  return a1;
}

uint64_t sub_1000111B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_100002A38(&qword_1000250B0);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v15 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  v20 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  v21 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  v22 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_100011324(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100005220(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    v10 = a3[5];
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    sub_100004A5C(a1 + v10, &qword_1000250B0);
    v13 = sub_100002A38(&qword_1000250B0);
    if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
    {
      v14 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload(v11, v13, 1);
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = (uint64_t *)((char *)a2 + v15);
  v18 = *v17;
  LOBYTE(v17) = *((_BYTE *)v17 + 8);
  v19 = *(_QWORD *)v16;
  v20 = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = (_BYTE)v17;
  sub_100005220(v19, v20);
  v21 = a3[7];
  v22 = *(void **)(a1 + v21);
  *(_QWORD *)(a1 + v21) = *(uint64_t *)((char *)a2 + v21);

  v23 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  v24 = a1 + v23;
  v25 = (uint64_t)a2 + v23;
  v26 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v24, v25, v26);
  v27 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)((char *)a2 + v27);
  v28 = a3[12];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (uint64_t *)((char *)a2 + v28);
  v32 = *v30;
  v31 = v30[1];
  v33 = v29[1];
  *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease(v33);
  v34 = a3[13];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)((char *)a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  v39 = v35[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease(v39);
  v40 = a3[14];
  v41 = (_QWORD *)(a1 + v40);
  v42 = (uint64_t *)((char *)a2 + v40);
  v44 = *v42;
  v43 = v42[1];
  v45 = v41[1];
  *v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease(v45);
  v46 = a3[15];
  v47 = (_QWORD *)(a1 + v46);
  v48 = (uint64_t *)((char *)a2 + v46);
  v50 = *v48;
  v49 = v48[1];
  v51 = v47[1];
  *v47 = v50;
  v47[1] = v49;
  swift_bridgeObjectRelease(v51);
  v52 = a3[16];
  v53 = (_QWORD *)(a1 + v52);
  v54 = (uint64_t *)((char *)a2 + v52);
  v56 = *v54;
  v55 = v54[1];
  v57 = v53[1];
  *v53 = v56;
  v53[1] = v55;
  swift_bridgeObjectRelease(v57);
  v58 = a3[17];
  v59 = (_QWORD *)(a1 + v58);
  v60 = (uint64_t *)((char *)a2 + v58);
  v62 = *v60;
  v61 = v60[1];
  v63 = v59[1];
  *v59 = v62;
  v59[1] = v61;
  swift_bridgeObjectRelease(v63);
  v64 = a3[18];
  v65 = (_QWORD *)(a1 + v64);
  v66 = (uint64_t *)((char *)a2 + v64);
  v68 = *v66;
  v67 = v66[1];
  v69 = v65[1];
  *v65 = v68;
  v65[1] = v67;
  swift_bridgeObjectRelease(v69);
  return a1;
}

uint64_t sub_100011550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001155C);
}

uint64_t sub_10001155C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v6 = sub_100002A38(&qword_1000250B8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[12] + 8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t sub_100011608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011614);
}

uint64_t sub_100011614(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_100002A38(&qword_1000250B8);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[12] + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for TitleView(uint64_t a1)
{
  return sub_100007918(a1, (uint64_t *)&unk_100025118, (uint64_t)&nominal type descriptor for TitleView);
}

void sub_1000116D0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[15];

  v6[0] = "\t";
  sub_1000117A0(319);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    v6[2] = "\t";
    v6[3] = "\b";
    v6[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4 = type metadata accessor for WidgetFamily(319);
    if (v5 <= 0x3F)
    {
      v6[5] = *(_QWORD *)(v4 - 8) + 64;
      v6[6] = &unk_10001B890;
      v6[7] = &unk_10001B8A8;
      v6[8] = &unk_10001B8C0;
      v6[9] = &unk_10001B8C0;
      v6[10] = &unk_10001B8C0;
      v6[11] = &unk_10001B8C0;
      v6[12] = &unk_10001B8C0;
      v6[13] = &unk_10001B8C0;
      v6[14] = &unk_10001B8C0;
      swift_initStructMetadata(a1, 256, 15, v6, a1 + 16);
    }
  }
}

void sub_1000117A0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100025128)
  {
    v2 = type metadata accessor for RedactionReasons(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100025128);
  }
}

ValueMetadata *type metadata accessor for BodyView()
{
  return &type metadata for BodyView;
}

uint64_t sub_100011804(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001E238, 1);
}

void sub_100011814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  unint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  char v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  Swift::String v61;
  void *v62;
  uint64_t v63;
  Swift::String v64;
  void *v65;
  uint64_t v66;
  Swift::String v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  int *v84;
  _QWORD *v85;
  _QWORD v86[2];
  _OWORD v87[2];
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;

  v1 = v0;
  v2 = type metadata accessor for NSFastEnumerationIterator(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = (int *)type metadata accessor for TitleView(0);
  v6 = *(void **)(v0 + v84[7]);
  if (v6)
  {
    v7 = objc_msgSend(v6, "titleContent");
    if (v7)
    {
      v8 = v7;
      v9 = sub_100002A38(&qword_100025318);
      v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

      v83 = *(_QWORD *)(v10 + 16);
      if (v83)
      {
        v70 = v3;
        v71 = v2;
        v74 = 0;
        v11 = 0;
        v85 = (_QWORD *)(v1 + v84[14]);
        v82 = v10 + 32;
        v12 = &protocol witness table for String;
        v73 = 0xE000000000000000;
        v81 = (char *)&type metadata for Any + 8;
        v13 = (unint64_t *)&unk_100025330;
        v14 = NSDictionary_ptr;
        v75 = v1;
        v15 = v10;
        v76 = v10;
        while (1)
        {
          if (v11 >= *(_QWORD *)(v15 + 16))
          {
            __break(1u);
            return;
          }
          v17 = *(_QWORD **)(v82 + 8 * v11);
          v18 = v85[1];
          *(_QWORD *)&v87[0] = *v85;
          *((_QWORD *)&v87[0] + 1) = v18;
          swift_bridgeObjectRetain(v17);
          swift_bridgeObjectRetain(v18);
          AnyHashable.init<A>(_:)(&v88, v87, &type metadata for String, v12);
          if (v17[2] && (v19 = sub_1000160F0((uint64_t)&v88), (v20 & 1) != 0))
          {
            sub_100005418(v17[7] + 32 * v19, (uint64_t)&v90);
          }
          else
          {
            v90 = 0u;
            v91 = 0u;
          }
          sub_100016F60((uint64_t)&v88);
          if (*((_QWORD *)&v91 + 1))
          {
            if ((swift_dynamicCast(v87, &v90, v81, &type metadata for String, 6) & 1) == 0)
            {
              v25 = v17;
LABEL_22:
              swift_bridgeObjectRelease(v25);
              goto LABEL_7;
            }
            v21 = *((_QWORD *)&v87[0] + 1);
            v22 = (_QWORD *)(v1 + v84[15]);
            if (*(_QWORD *)&v87[0] == *v22 && *((_QWORD *)&v87[0] + 1) == v22[1])
            {
              swift_bridgeObjectRelease(*((_QWORD *)&v87[0] + 1));
            }
            else
            {
              v24 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
              swift_bridgeObjectRelease(v21);
              if ((v24 & 1) == 0)
              {
                swift_bridgeObjectRelease(v17);
                v15 = v76;
                goto LABEL_7;
              }
            }
            v26 = v84[13];
            v27 = (uint64_t *)(v1 + v84[12]);
            v28 = (void *)v27[1];
            v77 = *v27;
            v29 = *(void **)(v1 + v26 + 8);
            v78 = *(_QWORD *)(v1 + v26);
            v30 = (_QWORD *)(v1 + v84[17]);
            v31 = v30[1];
            *(_QWORD *)&v87[0] = *v30;
            *((_QWORD *)&v87[0] + 1) = v31;
            v79 = v28;
            swift_bridgeObjectRetain(v28);
            v80 = v29;
            swift_bridgeObjectRetain(v29);
            swift_bridgeObjectRetain(v31);
            AnyHashable.init<A>(_:)(&v88, v87, &type metadata for String, v12);
            if (v17[2] && (v32 = sub_1000160F0((uint64_t)&v88), (v33 & 1) != 0))
            {
              sub_100005418(v17[7] + 32 * v32, (uint64_t)&v90);
            }
            else
            {
              v90 = 0u;
              v91 = 0u;
            }
            sub_100016F60((uint64_t)&v88);
            if (*((_QWORD *)&v91 + 1))
            {
              v34 = sub_100017104(0, &qword_100025328, NSArray_ptr);
              if ((swift_dynamicCast(v87, &v90, (char *)&type metadata for Any + 8, v34, 6) & 1) != 0)
              {
                v72 = *(id *)&v87[0];
                v35 = NSArray.makeIterator()();
LABEL_33:
                NSFastEnumerationIterator.next()(&v88, v35);
                if (v89)
                {
                  while (1)
                  {
                    sub_100016F94(&v88, &v90);
                    v36 = sub_100017104(0, v13, v14);
                    v35 = swift_dynamicCast(v87, &v90, (char *)&type metadata for Any + 8, v36, 6);
                    if ((v35 & 1) == 0)
                      goto LABEL_33;
                    v37 = v5;
                    v38 = v14;
                    v39 = v13;
                    v40 = v12;
                    v41 = *(void **)&v87[0];
                    v42 = v85[1];
                    *(_QWORD *)&v87[0] = *v85;
                    *((_QWORD *)&v87[0] + 1) = v42;
                    swift_bridgeObjectRetain_n(v42, 2);
                    v43 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v87, &type metadata for String);
                    v44 = objc_msgSend(v41, "__swift_objectForKeyedSubscript:", v43);
                    swift_unknownObjectRelease(v43);
                    if (v44)
                    {
                      _bridgeAnyObjectToAny(_:)(v87, v44);
                      swift_unknownObjectRelease(v44);
                    }
                    else
                    {
                      memset(v87, 0, sizeof(v87));
                    }
                    sub_1000056E8((uint64_t)v87, (uint64_t)&v90, &qword_100025320);
                    if (!*((_QWORD *)&v91 + 1))
                      break;
                    if ((swift_dynamicCast(v86, &v90, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
                    {
                      swift_bridgeObjectRelease(v42);
LABEL_48:

LABEL_32:
                      v12 = v40;
                      v13 = v39;
                      v14 = v38;
                      v5 = v37;
                      goto LABEL_33;
                    }
                    v46 = v86[0];
                    v45 = (void *)v86[1];
                    swift_bridgeObjectRelease(v42);
                    v47 = (_QWORD *)(v75 + v84[18]);
                    if (v46 == *v47 && v45 == (void *)v47[1])
                    {
                      swift_bridgeObjectRelease(v79);
                      v49 = v80;
                      v12 = v40;
                      v13 = v39;
                      v14 = v38;
                      v5 = v37;
                    }
                    else
                    {
                      v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v45);
                      swift_bridgeObjectRelease(v45);
                      if ((v48 & 1) == 0)
                        goto LABEL_48;
                      v45 = v80;
                      v12 = v40;
                      v13 = v39;
                      v14 = v38;
                      v5 = v37;
                      v49 = v79;
                    }
                    swift_bridgeObjectRelease(v49);
                    swift_bridgeObjectRelease(v45);

                    NSFastEnumerationIterator.next()(&v88, v50);
                    v77 = 0;
                    v78 = 0;
                    v51 = 0;
                    v52 = 0;
                    v79 = (void *)0xE000000000000000;
                    v80 = (void *)0xE000000000000000;
                    v53 = 0xE000000000000000;
                    if (!v89)
                      goto LABEL_51;
                  }
                  swift_bridgeObjectRelease(v42);

                  v35 = sub_100004A5C((uint64_t)&v90, &qword_100025320);
                  goto LABEL_32;
                }
                v51 = v78;
                v53 = (unint64_t)v80;
                v52 = v77;
LABEL_51:
                (*(void (**)(char *, uint64_t))(v70 + 8))(v5, v71);

                v78 = v51;
                v80 = (void *)v53;
                v77 = v52;
                v1 = v75;
              }
            }
            else
            {
              sub_100004A5C((uint64_t)&v90, &qword_100025320);
            }
            v15 = v76;
            v54 = (_QWORD *)(v1 + v84[16]);
            v55 = v54[1];
            *(_QWORD *)&v87[0] = *v54;
            *((_QWORD *)&v87[0] + 1) = v55;
            swift_bridgeObjectRetain(v55);
            AnyHashable.init<A>(_:)(&v88, v87, &type metadata for String, v12);
            if (v17[2] && (v56 = sub_1000160F0((uint64_t)&v88), (v57 & 1) != 0))
            {
              sub_100005418(v17[7] + 32 * v56, (uint64_t)&v90);
            }
            else
            {
              v90 = 0u;
              v91 = 0u;
            }
            swift_bridgeObjectRelease(v17);
            sub_100016F60((uint64_t)&v88);
            if (*((_QWORD *)&v91 + 1))
            {
              if ((swift_dynamicCast(v87, &v90, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
              {
                v59 = (void *)*((_QWORD *)&v87[0] + 1);
                v58 = *(_QWORD *)&v87[0];
                v60 = v73;
                *(_QWORD *)&v88 = v74;
                *((_QWORD *)&v88 + 1) = v73;
                swift_bridgeObjectRetain(v73);
                v61._countAndFlagsBits = v77;
                v62 = v79;
                v61._object = v79;
                String.append(_:)(v61);
                swift_bridgeObjectRelease(v60);
                swift_bridgeObjectRelease(v62);
                v63 = *((_QWORD *)&v88 + 1);
                swift_bridgeObjectRetain(*((_QWORD *)&v88 + 1));
                v64._countAndFlagsBits = v58;
                v64._object = v59;
                String.append(_:)(v64);
                swift_bridgeObjectRelease(v63);
                v65 = v59;
                v1 = v75;
                swift_bridgeObjectRelease(v65);
                v66 = *((_QWORD *)&v88 + 1);
                swift_bridgeObjectRetain(*((_QWORD *)&v88 + 1));
                v67._countAndFlagsBits = v78;
                v68 = v80;
                v67._object = v80;
                String.append(_:)(v67);
                v69 = v66;
                v15 = v76;
                swift_bridgeObjectRelease(v69);
                swift_bridgeObjectRelease(v68);
                v73 = *((_QWORD *)&v88 + 1);
                v74 = v88;
                goto LABEL_7;
              }
              swift_bridgeObjectRelease(v79);
              v25 = v80;
              goto LABEL_22;
            }
            swift_bridgeObjectRelease(v79);
            v16 = v80;
          }
          else
          {
            v16 = v17;
          }
          swift_bridgeObjectRelease(v16);
          sub_100004A5C((uint64_t)&v90, &qword_100025320);
LABEL_7:
          if (++v11 == v83)
          {
            swift_bridgeObjectRelease(v15);
            return;
          }
        }
      }
      swift_bridgeObjectRelease(v10);
    }
  }
}

char *sub_10001206C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
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

  v3 = v2;
  v6 = type metadata accessor for CharacterSet(0);
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a1;
  v43 = a2;
  v9 = type metadata accessor for TitleView(0);
  v10 = (uint64_t *)(v3 + *(int *)(v9 + 48));
  v12 = *v10;
  v11 = v10[1];
  v40 = v12;
  v41 = v11;
  v13 = sub_1000089BC();
  v14 = StringProtocol.components<A>(separatedBy:)(&v40, &type metadata for String, &type metadata for String, v13, v13);
  v15 = *(_QWORD *)(v14 + 16);
  v35 = v14;
  if (v15)
  {
    v16 = (uint64_t *)(v3 + *(int *)(v9 + 52));
    v17 = *v16;
    v18 = v16[1];
    v19 = (uint64_t *)(v14 + 40);
    v20 = (char *)&_swiftEmptyArrayStorage;
    v36 = v18;
    v37 = v17;
    do
    {
      v21 = *v19;
      v42 = *(v19 - 1);
      v43 = v21;
      v40 = v17;
      v41 = v18;
      v22 = (_QWORD *)StringProtocol.components<A>(separatedBy:)(&v40, &type metadata for String, &type metadata for String, v13, v13);
      v23 = v22;
      if (v22[2] <= 1uLL)
      {
        swift_bridgeObjectRelease(v22);
      }
      else
      {
        v24 = v22[4];
        v25 = v22[5];
        swift_bridgeObjectRetain(v25);
        v26 = swift_bridgeObjectRelease(v23);
        v42 = v24;
        v43 = v25;
        static CharacterSet.whitespacesAndNewlines.getter(v26);
        v27 = StringProtocol.trimmingCharacters(in:)(v8, &type metadata for String, v13);
        v29 = v28;
        (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v39);
        swift_bridgeObjectRelease(v43);
        if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) == 0)
          v20 = sub_10000D14C(0, *((_QWORD *)v20 + 2) + 1, 1, v20);
        v31 = *((_QWORD *)v20 + 2);
        v30 = *((_QWORD *)v20 + 3);
        if (v31 >= v30 >> 1)
          v20 = sub_10000D14C((char *)(v30 > 1), v31 + 1, 1, v20);
        *((_QWORD *)v20 + 2) = v31 + 1;
        v32 = &v20[16 * v31];
        *((_QWORD *)v32 + 4) = v27;
        *((_QWORD *)v32 + 5) = v29;
        v18 = v36;
        v17 = v37;
      }
      v19 += 2;
      --v15;
    }
    while (v15);
  }
  else
  {
    v20 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v35);
  return v20;
}

uint64_t sub_100012290@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void (*v100)(char *, char *, uint64_t);
  char *v101;
  uint64_t v102;
  char *v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t KeyPath;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  unint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  unint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t result;
  uint64_t v156;
  void (*v157)(char *, uint64_t);
  unint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  char *v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  char *v187;
  uint64_t v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  __int128 v203;
  __int128 v204;
  _QWORD v205[2];
  uint64_t v206;
  uint64_t v207;

  LODWORD(v201) = a1;
  v184 = a2;
  v183 = type metadata accessor for Image.Scale(0);
  v182 = *(_QWORD *)(v183 - 8);
  __chkstk_darwin(v183);
  v181 = (char *)&v156 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = sub_100002A38(&qword_100025220);
  __chkstk_darwin(v179);
  v194 = (char *)&v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v191 = type metadata accessor for WidgetFamily(0);
  v190 = *(_QWORD *)(v191 - 8);
  __chkstk_darwin(v191);
  v189 = (char *)&v156 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = sub_100002A38(&qword_1000252D0);
  v186 = *(_QWORD *)(v188 - 8);
  __chkstk_darwin(v188);
  v187 = (char *)&v156 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v185 = (char *)&v156 - v8;
  v9 = sub_100002A38(&qword_100025238);
  __chkstk_darwin(v9);
  v200 = (uint64_t *)((char *)&v156 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v192 = sub_100002A38(&qword_100025218);
  __chkstk_darwin(v192);
  v193 = (uint64_t)&v156 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = sub_100002A38(&qword_1000252D8);
  v165 = *(_QWORD *)(v166 - 8);
  __chkstk_darwin(v166);
  v162 = (char *)&v156 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = sub_100002A38(&qword_100025208);
  __chkstk_darwin(v164);
  v163 = (char *)&v156 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = sub_100002A38(&qword_1000252E0);
  v170 = *(_QWORD *)(v173 - 8);
  __chkstk_darwin(v173);
  v167 = (char *)&v156 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v161 = sub_100002A38(&qword_100025200);
  __chkstk_darwin(v161);
  v169 = (char *)&v156 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = sub_100002A38(&qword_1000251E8);
  __chkstk_darwin(v174);
  v172 = (uint64_t)&v156 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v177 = sub_100002A38(&qword_1000252E8);
  v176 = *(_QWORD *)(v177 - 8);
  __chkstk_darwin(v177);
  v175 = (char *)&v156 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = sub_100002A38(&qword_1000251E0);
  __chkstk_darwin(v168);
  v178 = (char *)&v156 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = sub_100002A38(&qword_1000248E0);
  __chkstk_darwin(v171);
  v180 = (char *)&v156 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for CharacterSet(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v156 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011814();
  v25 = v24;
  v27 = sub_10001206C(v26, v24);
  swift_bridgeObjectRelease(v25);
  sub_100011814();
  v29 = v28;
  *(_QWORD *)&v203 = v30;
  *((_QWORD *)&v203 + 1) = v28;
  v31 = type metadata accessor for TitleView(0);
  v33 = *(int *)(v31 + 48);
  v32 = *(int *)(v31 + 52);
  v199 = v31;
  v34 = (uint64_t *)(v2 + v32);
  v36 = *v34;
  v35 = v34[1];
  v206 = v36;
  v207 = v35;
  v202 = v2;
  v37 = (uint64_t *)(v2 + v33);
  v38 = *(_QWORD *)(v2 + v33);
  v39 = *(_QWORD *)(v2 + v33 + 8);
  v205[0] = v38;
  v205[1] = v39;
  v40 = sub_1000089BC();
  v41 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&v206, v205, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v40, v40, v40);
  v43 = v42;
  v44 = swift_bridgeObjectRelease(v29);
  *(_QWORD *)&v203 = v41;
  *((_QWORD *)&v203 + 1) = v43;
  static CharacterSet.whitespacesAndNewlines.getter(v44);
  v45 = StringProtocol.trimmingCharacters(in:)(v23, &type metadata for String, v40);
  v47 = v46;
  v48 = *(void (**)(_QWORD, _QWORD))(v21 + 8);
  v159 = v23;
  v160 = v20;
  v157 = (void (*)(char *, uint64_t))v48;
  v48(v23, v20);
  swift_bridgeObjectRelease(*((_QWORD *)&v203 + 1));
  *(_QWORD *)&v203 = v45;
  *((_QWORD *)&v203 + 1) = v47;
  v49 = v37[1];
  v206 = *v37;
  v207 = v49;
  v158 = v40;
  v50 = StringProtocol.components<A>(separatedBy:)(&v206, &type metadata for String, &type metadata for String, v40, v40);
  swift_bridgeObjectRelease(v47);
  v51 = *(_QWORD *)(v50 + 16);
  v198 = v50;
  if (v51)
  {
    v52 = (_QWORD *)(v50 + 40);
    v53 = &_swiftEmptyArrayStorage;
    do
    {
      v58 = *(v52 - 1);
      v57 = *v52;
      if (v58)
        v59 = 0;
      else
        v59 = v57 == 0xE000000000000000;
      if (!v59 && (_stringCompareWithSmolCheck(_:_:expecting:)(*(v52 - 1), *v52) & 1) == 0)
      {
        swift_bridgeObjectRetain(v57);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v53);
        *(_QWORD *)&v203 = v53;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100016324(0, v53[2] + 1, 1);
          v53 = (_QWORD *)v203;
        }
        v55 = v53[2];
        v54 = v53[3];
        if (v55 >= v54 >> 1)
        {
          sub_100016324((char *)(v54 > 1), v55 + 1, 1);
          v53 = (_QWORD *)v203;
        }
        v53[2] = v55 + 1;
        v56 = &v53[2 * v55];
        v56[4] = v58;
        v56[5] = v57;
      }
      v52 += 2;
      --v51;
    }
    while (v51);
  }
  else
  {
    v53 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v198);
  v61 = v53[2];
  if (v61)
  {
    v62 = v53[5];
    *(_QWORD *)&v203 = v53[4];
    *((_QWORD *)&v203 + 1) = v62;
    v63 = swift_bridgeObjectRetain(v62);
    v64 = v159;
    static CharacterSet.whitespacesAndNewlines.getter(v63);
    v65 = v158;
    v66 = StringProtocol.trimmingCharacters(in:)(v64, &type metadata for String, v158);
    v68 = v67;
    v69 = v160;
    v70 = v157;
    v157(v64, v160);
    swift_bridgeObjectRelease(*((_QWORD *)&v203 + 1));
    v71 = sub_100016570(v66, v68, v202, v201 & 1, v27);
    v197 = v72;
    v198 = v71;
    v195 = v74;
    v196 = v73;
    if (v61 > v53[2])
      goto LABEL_28;
    v75 = (uint64_t)&v53[2 * v61 + 4];
    v76 = *(_QWORD *)(v75 - 8);
    *(_QWORD *)&v203 = *(_QWORD *)(v75 - 16);
    *((_QWORD *)&v203 + 1) = v76;
    v77 = swift_bridgeObjectRetain(v76);
    static CharacterSet.whitespacesAndNewlines.getter(v77);
    v78 = v70;
    v79 = StringProtocol.trimmingCharacters(in:)(v64, &type metadata for String, v65);
    v81 = v80;
    v78(v64, v69);
    swift_bridgeObjectRelease(*((_QWORD *)&v203 + 1));
  }
  else
  {
    v82 = sub_100016570(0, 0, v202, v201 & 1, v27);
    v197 = v83;
    v198 = v82;
    v195 = v85;
    v196 = v84;
    v68 = 0;
    v66 = 0;
    v79 = 0;
    v81 = 0;
  }
  v203 = 0u;
  v204 = 0u;
  v86 = v53[2];
  if (v86)
  {
    swift_bridgeObjectRetain(v53);
    v87 = v53 + 5;
    do
    {
      v88 = *v87;
      v206 = *(v87 - 1);
      v207 = v88;
      swift_bridgeObjectRetain(v88);
      sub_100016914((uint64_t)&v203, &v206, v66, v68, v79, v81, v201 & 1, v27, v202);
      v87 += 2;
      swift_bridgeObjectRelease(v88);
      --v86;
    }
    while (v86);
    swift_release(v53);
  }
  swift_bridgeObjectRelease(v68);
  swift_bridgeObjectRelease(v81);
  swift_release(v53);
  v89 = swift_bridgeObjectRelease(v27);
  v90 = v203;
  v91 = *((_QWORD *)&v204 + 1);
  v53 = (_QWORD *)v204;
  v92 = static Font.title2.getter(v89);
  static Font.Weight.semibold.getter();
  v201 = Font.weight(_:)(v92);
  v93 = swift_release(v92);
  v94 = static HorizontalAlignment.leading.getter(v93);
  v95 = v200;
  *v200 = v94;
  v95[1] = 0;
  *((_BYTE *)v95 + 16) = 0;
  v96 = (char *)v95 + *(int *)(sub_100002A38(&qword_1000252F0) + 44);
  *(_QWORD *)&v203 = v198;
  *((_QWORD *)&v203 + 1) = v197;
  *(_QWORD *)&v204 = v196;
  *((_QWORD *)&v204 + 1) = v195;
  v97 = sub_100002A38(&qword_1000252F8);
  v98 = sub_100016D00();
  v64 = v185;
  View.widgetAccentable(_:)(1, v97, v98);
  v99 = v186;
  v100 = *(void (**)(char *, char *, uint64_t))(v186 + 16);
  v101 = v187;
  v102 = v188;
  v100(v187, v64, v188);
  v100(v96, v101, v102);
  v103 = &v96[*(int *)(sub_100002A38(&qword_100025308) + 48)];
  *(_OWORD *)v103 = v90;
  *((_QWORD *)v103 + 2) = v53;
  *((_QWORD *)v103 + 3) = v91;
  sub_100016D5C(v90, *((uint64_t *)&v90 + 1), (char)v53, v91);
  sub_100016D5C(v90, *((uint64_t *)&v90 + 1), (char)v53, v91);
  v104 = *(void (**)(char *, uint64_t))(v99 + 8);
  v104(v64, v102);
  v186 = v90;
  sub_100016CD0(v90, *((uint64_t *)&v90 + 1), (char)v53, v91);
  v104(v101, v102);
  v105 = v190;
  v106 = v189;
  v107 = v191;
  (*(void (**)(char *, _QWORD, uint64_t))(v190 + 104))(v189, enum case for WidgetFamily.accessoryRectangular(_:), v191);
  v108 = sub_1000031D0(&qword_100024720, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v203, v107, v108);
  dispatch thunk of RawRepresentable.rawValue.getter(&v206, v107, v108);
  v109 = v203;
  v110 = v206;
  (*(void (**)(char *, uint64_t))(v105 + 8))(v106, v107);
  v111 = 0;
  if (v109 != v110)
    v111 = swift_retain(v201);
  KeyPath = swift_getKeyPath(&unk_10001B9B8);
  v113 = v200;
  v114 = v193;
  sub_1000057B0((uint64_t)v200, v193, &qword_100025238);
  v115 = v192;
  v116 = (uint64_t *)(v114 + *(int *)(v192 + 36));
  *v116 = KeyPath;
  v116[1] = v111;
  sub_100004A5C((uint64_t)v113, &qword_100025238);
  v117 = enum case for DynamicTypeSize.xxLarge(_:);
  v118 = type metadata accessor for DynamicTypeSize(0);
  v119 = (uint64_t)v194;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v118 - 8) + 104))(v194, v117, v118);
  v120 = sub_1000031D0(&qword_100025310, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  if ((dispatch thunk of static Equatable.== infix(_:_:)(v119, v119, v118, v120) & 1) != 0)
  {
    v121 = sub_100015EF4();
    v122 = sub_1000086C8(&qword_100025250, &qword_100025220, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    v123 = v162;
    View.dynamicTypeSize<A>(_:)(v119, v115, v179, v121, v122);
    sub_100004A5C(v119, &qword_100025220);
    sub_100004A5C(v114, &qword_100025218);
    v124 = swift_getKeyPath(&unk_10001B9E8);
    v125 = v165;
    v126 = (uint64_t)v163;
    v127 = v166;
    (*(void (**)(char *, char *, uint64_t))(v165 + 16))(v163, v123, v166);
    v128 = v164;
    v129 = (uint64_t *)(v126 + *(int *)(v164 + 36));
    *v129 = v124;
    v129[1] = 0x3FE4CCCCCCCCCCCDLL;
    (*(void (**)(char *, uint64_t))(v125 + 8))(v123, v127);
    v130 = sub_100015E04();
    v131 = v167;
    View.avoidsOrphans(_:)(0, v128, v130);
    sub_100004A5C(v126, &qword_100025208);
    v132 = swift_getKeyPath(&unk_10001BA18);
    v133 = v170;
    v134 = (uint64_t)v169;
    v135 = v173;
    (*(void (**)(char *, char *, uint64_t))(v170 + 16))(v169, v131, v173);
    v136 = v134 + *(int *)(v161 + 36);
    *(_QWORD *)v136 = v132;
    *(_QWORD *)(v136 + 8) = 0;
    *(_BYTE *)(v136 + 16) = 1;
    (*(void (**)(char *, uint64_t))(v133 + 8))(v131, v135);
    v137 = swift_getKeyPath(&unk_10001BA48);
    v138 = v172;
    sub_1000057B0(v134, v172, &qword_100025200);
    v139 = v174;
    v140 = (uint64_t *)(v138 + *(int *)(v174 + 36));
    *v140 = v137;
    v140[1] = 0xC000000000000000;
    sub_100004A5C(v134, &qword_100025200);
    v141 = sub_100015CD4();
    v142 = v175;
    View.hyphenationFactor(_:)(v139, v141, 0.2);
    sub_100004A5C(v138, &qword_1000251E8);
    v143 = swift_getKeyPath(&unk_10001BA78);
    v144 = v176;
    v145 = (uint64_t)v178;
    v146 = v177;
    (*(void (**)(char *, char *, uint64_t))(v176 + 16))(v178, v142, v177);
    v147 = v145 + *(int *)(v168 + 36);
    *(_QWORD *)v147 = v143;
    *(_BYTE *)(v147 + 8) = 0;
    (*(void (**)(char *, uint64_t))(v144 + 8))(v142, v146);
    v148 = v182;
    v149 = v181;
    v150 = v183;
    (*(void (**)(char *, _QWORD, uint64_t))(v182 + 104))(v181, enum case for Image.Scale.small(_:), v183);
    v151 = swift_getKeyPath(&unk_10001BAA8);
    v152 = (uint64_t)v180;
    v153 = (uint64_t *)&v180[*(int *)(v171 + 36)];
    v154 = sub_100002A38(&qword_100025290);
    (*(void (**)(char *, char *, uint64_t))(v148 + 16))((char *)v153 + *(int *)(v154 + 28), v149, v150);
    *v153 = v151;
    sub_1000057B0(v145, v152, &qword_1000251E0);
    (*(void (**)(char *, uint64_t))(v148 + 8))(v149, v150);
    sub_100004A5C(v145, &qword_1000251E0);
    sub_10000604C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v184, 0.0, 1, *(double *)(v202 + *(int *)(v199 + 32)), 0, *(_QWORD *)(v202 + *(int *)(v199 + 44)), *(_QWORD *)(v202 + *(int *)(v199 + 44) + 8));
    sub_100016CD0(v198, v197, v196, v195);
    swift_release(v201);
    sub_100004A5C(v152, &qword_1000248E0);
    return sub_100016CD0(v186, *((uint64_t *)&v90 + 1), (char)v53, v91);
  }
  __break(1u);
LABEL_28:
  __break(1u);
  sub_100016CD0(v203, *((uint64_t *)&v203 + 1), v204, *((uint64_t *)&v204 + 1));
  swift_release(v53);
  result = swift_bridgeObjectRelease(v64);
  __break(1u);
  return result;
}

uint64_t sub_1000131D0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100013294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v22;
  char v23;
  int *v24;
  char **v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  _OWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int *v84;

  v83 = a2;
  v78 = (char *)sub_100002A38(&qword_1000251A8);
  __chkstk_darwin(v78);
  v71 = (_OWORD *)((char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v74 = sub_100002A38(&qword_1000251B0);
  __chkstk_darwin(v74);
  v77 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100002A38(&qword_1000248E8);
  __chkstk_darwin(v73);
  v72 = (uint64_t)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_100002A38(&qword_1000251B8);
  __chkstk_darwin(v82);
  v75 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100002A38(&qword_1000251C0);
  __chkstk_darwin(v81);
  v79 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v84);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v76 = (uint64_t)&v71 - v11;
  v12 = type metadata accessor for WidgetFamily(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = type metadata accessor for PlaceholderTitleView(0);
  __chkstk_darwin(v80);
  v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v20 = (char *)&v71 - v19;
  v21 = *(_QWORD *)a1;
  v22 = *(_BYTE *)(a1 + 8);
  sub_10000827C(*(_QWORD *)a1, v22);
  v23 = sub_100003974(v21, v22);
  sub_100005220(v21, v22);
  if ((v23 & 1) == 0)
  {
    v37 = v77;
    v36 = (uint64_t)v78;
    v38 = v75;
    v39 = a1 + v84[6];
    v40 = *(_QWORD *)v39;
    v41 = *(_BYTE *)(v39 + 8);
    sub_10000827C(*(_QWORD *)v39, v41);
    v42 = sub_100003974(v40, v41);
    sub_100005220(v40, v41);
    sub_10000817C(a1, (uint64_t)v9, type metadata accessor for TitleView);
    v43 = a1;
    if ((v42 & 1) != 0)
    {
      v44 = v9[v84[10]];
      sub_100004190((uint64_t)v9, type metadata accessor for TitleView);
      v45 = (uint64_t)v79;
      v46 = v80;
      v47 = v36;
      v48 = (uint64_t)v38;
      v49 = (uint64_t)v37;
      v51 = v73;
      v50 = v74;
      if ((v44 & 1) == 0)
      {
        v52 = (uint64_t)v71;
        *v71 = *(_OWORD *)(v43 + v84[11]);
        v53 = sub_100002A38(&qword_1000252B0);
        sub_100013928(v43, v52 + *(int *)(v53 + 44));
        v54 = &qword_1000251A8;
        sub_1000057B0(v52, v49, &qword_1000251A8);
        swift_storeEnumTagMultiPayload(v49, v50, 1);
        v55 = sub_100017BF0(&qword_1000251C8, &qword_1000248E8, (void (*)(void))sub_100015BA4);
LABEL_11:
        v68 = sub_1000086C8(&qword_100025298, &qword_1000251A8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
        _ConditionalContent<>.init(storage:)(v49, v51, v47, v55, v68);
        sub_100004A5C(v52, v54);
        sub_1000057B0(v48, v45, &qword_1000251B8);
        swift_storeEnumTagMultiPayload(v45, v81, 1);
        v69 = sub_1000031D0(&qword_1000252A0, type metadata accessor for PlaceholderTitleView, (uint64_t)&unk_10001BC78);
        v70 = sub_100015F90();
        _ConditionalContent<>.init(storage:)(v45, v46, v82, v69, v70);
        return sub_100004A5C(v48, &qword_1000251B8);
      }
    }
    else
    {
      sub_100004190((uint64_t)v9, type metadata accessor for TitleView);
      v45 = (uint64_t)v79;
      v46 = v80;
      v47 = v36;
      v48 = (uint64_t)v38;
      v49 = (uint64_t)v37;
      v51 = v73;
      v50 = v74;
    }
    v52 = v72;
    sub_100012290(0, v72);
    v54 = &qword_1000248E8;
    sub_1000057B0(v52, v49, &qword_1000248E8);
    swift_storeEnumTagMultiPayload(v49, v50, 0);
    v55 = sub_100017BF0(&qword_1000251C8, &qword_1000248E8, (void (*)(void))sub_100015BA4);
    goto LABEL_11;
  }
  v78 = v20;
  v24 = v84;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1 + v84[9], v12);
  v25 = (char **)(a1 + v24[11]);
  v27 = *v25;
  v26 = v25[1];
  v75 = v27;
  v77 = v26;
  v28 = a1 + v24[6];
  v29 = *(_QWORD *)v28;
  v30 = *(_BYTE *)(v28 + 8);
  sub_10000827C(*(_QWORD *)v28, v30);
  v31 = sub_100003974(v29, v30);
  sub_100005220(v29, v30);
  v32 = v76;
  sub_10000817C(a1, v76, type metadata accessor for TitleView);
  v33 = v12;
  v34 = v32;
  if ((v31 & 1) != 0)
    v35 = *(_BYTE *)(v32 + v84[10]);
  else
    v35 = 1;
  v56 = v82;
  v57 = (uint64_t)v79;
  v58 = v81;
  v59 = v75;
  sub_100004190(v34, type metadata accessor for TitleView);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v15, v33);
  v60 = v80;
  v61 = &v17[*(int *)(v80 + 20)];
  v62 = v77;
  *(_QWORD *)v61 = v59;
  *((_QWORD *)v61 + 1) = v62;
  v17[*(int *)(v60 + 24)] = v35;
  *(_QWORD *)&v17[*(int *)(v60 + 28)] = 0x3FD3333333333333;
  v63 = (uint64_t)v17;
  v64 = (uint64_t)v78;
  sub_1000097A4(v63, (uint64_t)v78, type metadata accessor for PlaceholderTitleView);
  sub_10000817C(v64, v57, type metadata accessor for PlaceholderTitleView);
  swift_storeEnumTagMultiPayload(v57, v58, 0);
  v65 = sub_1000031D0(&qword_1000252A0, type metadata accessor for PlaceholderTitleView, (uint64_t)&unk_10001BC78);
  v66 = sub_100015F90();
  _ConditionalContent<>.init(storage:)(v57, v60, v56, v65, v66);
  return sub_100004190(v64, type metadata accessor for PlaceholderTitleView);
}

uint64_t sub_100013928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v46 = a2;
  v44 = sub_100002A38(&qword_1000252B8);
  __chkstk_darwin(v44);
  v47 = (uint64_t)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v43 = (uint64_t)&v42 - v5;
  __chkstk_darwin(v6);
  v45 = (uint64_t)&v42 - v7;
  v8 = type metadata accessor for TitleView(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v42 - v12;
  v14 = sub_100002A38(&qword_1000248E8);
  __chkstk_darwin(v14);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v19 = (char *)&v42 - v18;
  v20 = sub_100002A38(&qword_1000252C0);
  __chkstk_darwin(v20);
  v42 = (uint64_t)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v24 = (char *)&v42 - v23;
  __chkstk_darwin(v25);
  v27 = (char *)&v42 - v26;
  v28 = a1 + *(int *)(v8 + 24);
  v29 = *(_QWORD *)v28;
  v30 = *(_BYTE *)(v28 + 8);
  sub_10000827C(*(_QWORD *)v28, v30);
  sub_100003974(v29, v30);
  sub_100005220(v29, v30);
  sub_10000817C(a1, (uint64_t)v13, type metadata accessor for TitleView);
  sub_100004190((uint64_t)v13, type metadata accessor for TitleView);
  sub_100012290(1, (uint64_t)v19);
  sub_1000056E8((uint64_t)v19, (uint64_t)v24, &qword_1000248E8);
  sub_1000056E8((uint64_t)v24, (uint64_t)v27, &qword_1000252C0);
  v31 = *(_QWORD *)v28;
  LOBYTE(v24) = *(_BYTE *)(v28 + 8);
  sub_10000827C(*(_QWORD *)v28, (char)v24);
  sub_100003974(v31, (char)v24);
  sub_100005220(v31, (char)v24);
  sub_10000817C(a1, (uint64_t)v10, type metadata accessor for TitleView);
  sub_100004190((uint64_t)v10, type metadata accessor for TitleView);
  sub_100012290(0, (uint64_t)v16);
  if (qword_1000245C8 != -1)
    swift_once(&qword_1000245C8, sub_10000EB80);
  v32 = qword_1000264A0;
  KeyPath = swift_getKeyPath(&unk_10001B988);
  v34 = v43;
  sub_1000057B0((uint64_t)v16, v43, &qword_1000248E8);
  v35 = (uint64_t *)(v34 + *(int *)(v44 + 36));
  *v35 = KeyPath;
  v35[1] = v32;
  swift_retain(v32);
  sub_100004A5C((uint64_t)v16, &qword_1000248E8);
  v36 = v45;
  sub_1000056E8(v34, v45, &qword_1000252B8);
  v37 = v42;
  sub_1000057B0((uint64_t)v27, v42, &qword_1000252C0);
  v38 = v47;
  sub_1000057B0(v36, v47, &qword_1000252B8);
  v39 = v46;
  sub_1000057B0(v37, v46, &qword_1000252C0);
  v40 = sub_100002A38(&qword_1000252C8);
  sub_1000057B0(v38, v39 + *(int *)(v40 + 48), &qword_1000252B8);
  sub_100004A5C(v36, &qword_1000252B8);
  sub_100004A5C((uint64_t)v27, &qword_1000252C0);
  sub_100004A5C(v38, &qword_1000252B8);
  return sub_100004A5C(v37, &qword_1000252C0);
}

uint64_t sub_100013D24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_100002A38(&qword_100025190);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002A38(&qword_100025198);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = static HorizontalAlignment.leading.getter(v9);
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v10 = sub_100002A38(&qword_1000251A0);
  sub_100013294(v1, (uint64_t)&v5[*(int *)(v10 + 44)]);
  sub_1000057B0((uint64_t)v5, (uint64_t)v8, &qword_100025190);
  *(_WORD *)&v8[*(int *)(v6 + 36)] = 256;
  sub_100004A5C((uint64_t)v5, &qword_100025190);
  return sub_1000056E8((uint64_t)v8, a1, &qword_100025198);
}

uint64_t sub_100013E3C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
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
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  __n128 v32;
  unint64_t v33;
  __n128 v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t WitnessTable;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  _OWORD v63[2];
  uint64_t v64;

  v55 = a2;
  v49 = type metadata accessor for BlendMode(0);
  v53 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin(v49);
  v52 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v46 = *(_QWORD *)(a1 + 24);
  v47 = type metadata accessor for _MaskEffect(255, v9, v6);
  v10 = type metadata accessor for ModifiedContent(0, &type metadata for LinearGradient, v47);
  v51 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v46 - v12;
  v14 = type metadata accessor for _BlendModeEffect(255, v11);
  v15 = type metadata accessor for ModifiedContent(0, v10, v14);
  v50 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v48 = (char *)&v46 - v19;
  v20 = sub_100002A38(&qword_100025378);
  v21 = swift_allocObject(v20, 64, 7);
  *(_OWORD *)(v21 + 16) = xmmword_10001B640;
  v22 = enum case for Color.RGBColorSpace.sRGB(_:);
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v23(v8, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  v24 = Color.init(_:white:opacity:)(v8, 0.2, 1.0);
  *(_QWORD *)(v21 + 32) = Gradient.Stop.init(color:location:)(v24, 0.0);
  *(_QWORD *)(v21 + 40) = v25;
  v23(v8, v22, v4);
  v26 = Color.init(_:white:opacity:)(v8, 0.9, 1.0);
  *(_QWORD *)(v21 + 48) = Gradient.Stop.init(color:location:)(v26, 1.0);
  *(_QWORD *)(v21 + 56) = v27;
  v28 = Gradient.init(stops:)(v21);
  v29 = static UnitPoint.topLeading.getter();
  v31 = v30;
  v32.n128_u64[0] = static UnitPoint.bottomTrailing.getter();
  v34.n128_u64[0] = v33;
  LinearGradient.init(gradient:startPoint:endPoint:)(v63, v28, v29, v31, v32, v34);
  v60 = v63[0];
  v61 = v63[1];
  v62 = v64;
  v35 = sub_10000FB54();
  View.mask<A>(_:)(v54, &type metadata for LinearGradient, v9, v35, v46);
  sub_100017EF8(v63);
  v37 = v52;
  v36 = v53;
  v38 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v53 + 104))(v52, enum case for BlendMode.plusLighter(_:), v49);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for _MaskEffect<A>, v47);
  v58 = v35;
  v59 = WitnessTable;
  v40 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v10);
  View.blendMode(_:)(v37, v10, v40);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v10);
  v56 = v40;
  v57 = &protocol witness table for _BlendModeEffect;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v15);
  v41 = v50;
  v42 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v43 = v48;
  v42(v48, v17, v15);
  v44 = *(void (**)(char *, uint64_t))(v41 + 8);
  v44(v17, v15);
  v42(v55, v43, v15);
  return ((uint64_t (*)(char *, uint64_t))v44)(v43, v15);
}

void *sub_100014210@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
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
  double v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _OWORD v40[9];
  _BYTE v41[151];
  char v42;
  char v43;
  _QWORD v44[2];
  _OWORD v45[10];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[22];
  _OWORD v51[16];

  v38 = a1;
  v2 = sub_100002A38(&qword_100025500);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for Font.TextStyle(0, v3);
  v6 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v10 + 104))(v13, enum case for WidgetFamily.accessoryRectangular(_:), v9, v11);
  v14 = sub_1000031D0(&qword_100024720, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  v37 = v1;
  dispatch thunk of RawRepresentable.rawValue.getter(v50, v9, v14);
  dispatch thunk of RawRepresentable.rawValue.getter(v51, v9, v14);
  v15 = *(_QWORD *)&v50[0];
  v16 = *(_QWORD *)&v51[0];
  v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  if (v15 == v16)
  {
    v18 = static Font.body.getter(v17);
    v36 = v18;
  }
  else
  {
    v19 = v39;
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for Font.TextStyle.title2(_:), v39);
    v20 = type metadata accessor for Font.Design(0);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v5, 1, 1, v20);
    v22 = static Font.Weight.semibold.getter(v21);
    v36 = static Font.system(_:design:weight:)(v8, v5, *(_QWORD *)&v22, 0);
    sub_100004A5C((uint64_t)v5, &qword_100025500);
    v18 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  }
  v39 = static HorizontalAlignment.leading.getter(v18);
  sub_100014684(0x1000000000000010, 0x800000010001F2C0, 0, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v40);
  *(_OWORD *)&v41[87] = v40[5];
  *(_OWORD *)&v41[103] = v40[6];
  *(_OWORD *)&v41[119] = v40[7];
  *(_OWORD *)&v41[135] = v40[8];
  *(_OWORD *)&v41[23] = v40[1];
  *(_OWORD *)&v41[39] = v40[2];
  *(_OWORD *)&v41[55] = v40[3];
  *(_OWORD *)&v41[71] = v40[4];
  v42 = 0;
  *(_OWORD *)&v41[7] = v40[0];
  if (qword_1000245C8 != -1)
    swift_once(&qword_1000245C8, sub_10000EB80);
  v23 = qword_1000264A0;
  KeyPath = swift_getKeyPath(&unk_10001B988);
  v25 = swift_getKeyPath(&unk_10001B9B8);
  v26 = swift_getKeyPath(&unk_10001BA18);
  v43 = 0;
  v27 = type metadata accessor for PlaceholderTitleView(0);
  v28 = v37;
  v29 = *(_QWORD *)(v37 + *(int *)(v27 + 28));
  v30 = swift_getKeyPath(&unk_10001B9E8);
  *(_OWORD *)((char *)&v45[7] + 1) = *(_OWORD *)&v41[112];
  *(_OWORD *)((char *)&v45[6] + 1) = *(_OWORD *)&v41[96];
  *(_OWORD *)((char *)&v45[8] + 1) = *(_OWORD *)&v41[128];
  *(_OWORD *)((char *)&v45[2] + 1) = *(_OWORD *)&v41[32];
  *(_OWORD *)((char *)&v45[3] + 1) = *(_OWORD *)&v41[48];
  *(_OWORD *)((char *)&v45[4] + 1) = *(_OWORD *)&v41[64];
  *(_OWORD *)((char *)&v45[5] + 1) = *(_OWORD *)&v41[80];
  *(_OWORD *)((char *)v45 + 1) = *(_OWORD *)v41;
  v44[0] = v39;
  v44[1] = 0;
  LOBYTE(v45[0]) = 0;
  *(_OWORD *)((char *)&v45[1] + 1) = *(_OWORD *)&v41[16];
  *(_QWORD *)&v45[9] = *(_QWORD *)&v41[143];
  *((_QWORD *)&v45[9] + 1) = KeyPath;
  *(_QWORD *)&v46 = v23;
  *((_QWORD *)&v46 + 1) = v25;
  v31 = v36;
  *(_QWORD *)&v47 = v36;
  *((_QWORD *)&v47 + 1) = v26;
  *(_QWORD *)&v48 = 1;
  BYTE8(v48) = v43;
  *(_QWORD *)&v49 = v30;
  *((_QWORD *)&v49 + 1) = v29;
  v51[4] = v45[3];
  v51[5] = v45[4];
  v51[2] = v45[1];
  v51[3] = v45[2];
  v51[9] = v45[8];
  v51[8] = v45[7];
  v51[6] = v45[5];
  v51[7] = v45[6];
  v51[14] = v49;
  v51[10] = v45[9];
  v51[11] = v46;
  v51[12] = v47;
  v51[13] = v48;
  v51[0] = (unint64_t)v39;
  v51[1] = v45[0];
  v32 = (uint64_t *)(v28 + *(int *)(v27 + 20));
  v33 = *v32;
  v34 = v32[1];
  swift_retain(v23);
  swift_retain(v31);
  sub_100006270(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v50, 0.0, 1, 0.0, 1, v33, v34);
  swift_release(v31);
  sub_100017DCC((uint64_t)v44);
  return memcpy(v38, v50, 0x160uLL);
}

uint64_t sub_100014684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = a3 & 1;
  sub_100008844(a1, a2, a3 & 1);
  v10 = swift_bridgeObjectRetain(a4);
  v11 = static Alignment.center.getter(v10);
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = v9;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = a1;
  *(_QWORD *)(a5 + 40) = a2;
  *(_BYTE *)(a5 + 48) = v9;
  *(_QWORD *)(a5 + 56) = a4;
  *(_QWORD *)(a5 + 64) = v11;
  *(_QWORD *)(a5 + 72) = v12;
  *(_OWORD *)(a5 + 80) = xmmword_10001B650;
  *(_BYTE *)(a5 + 96) = 0;
  *(_QWORD *)(a5 + 104) = &_swiftEmptyArrayStorage;
  *(_OWORD *)(a5 + 112) = xmmword_10001B660;
  *(_BYTE *)(a5 + 128) = 0;
  *(_QWORD *)(a5 + 136) = &_swiftEmptyArrayStorage;
  sub_100008844(a1, a2, v9);
  swift_bridgeObjectRetain(a4);
  sub_100008844(a1, a2, v9);
  swift_bridgeObjectRetain(a4);
  sub_100008844(a1, a2, v9);
  swift_bridgeObjectRetain(a4);
  sub_100008844(0x202D202D202D202DLL, 0xED00002D202D202DLL, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100008844(0x202D202D202D202DLL, 0xEA0000000000202DLL, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_100008A00(0x202D202D202D202DLL, 0xEA0000000000202DLL, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100008A00(0x202D202D202D202DLL, 0xED00002D202D202DLL, 0);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  sub_100008A00(a1, a2, v9);
  swift_bridgeObjectRelease(a4);
  sub_100008A00(a1, a2, v9);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_100014860(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  Swift::String v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  _QWORD *v77;
  char v78;
  char v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  _QWORD *v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  char v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  char v106;
  id v107;
  id v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  const char *v134;
  uint64_t v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  unint64_t v148;
  Class v149;
  void *v150;
  void *v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;

  v2 = type metadata accessor for TipsLog(0);
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)&v4 = __chkstk_darwin(v2).n128_u64[0];
  v6 = (char *)&v134 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 && (v7 = objc_msgSend(a1, "bodyContent", v4)) != 0)
  {
    v8 = v7;
    v9 = sub_100002A38(&qword_100025318);
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

    v145 = *(_QWORD *)(v10 + 16);
    if (v145)
    {
      v139 = v6;
      v137 = v3;
      v138 = v2;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = &_swiftEmptyArrayStorage;
      v148 = 0xE000000000000000;
      v147 = (char *)&type metadata for Any + 8;
      v136 = xmmword_10001B2E0;
      v15 = v145;
      v140 = v10;
      while (1)
      {
        v16 = *(_QWORD *)(v10 + 8 * v11 + 32);
        swift_bridgeObjectRetain(v16);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v16);
        *(_QWORD *)&v152 = 1701869940;
        *((_QWORD *)&v152 + 1) = 0xE400000000000000;
        v18 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v152, &type metadata for String);
        v149 = isa;
        v19 = -[objc_class __swift_objectForKeyedSubscript:](isa, "__swift_objectForKeyedSubscript:", v18);
        swift_unknownObjectRelease(v18);
        if (v19)
        {
          _bridgeAnyObjectToAny(_:)(&v152, v19);
          swift_unknownObjectRelease(v19);
        }
        else
        {
          v152 = 0u;
          v153 = 0u;
        }
        sub_1000056E8((uint64_t)&v152, (uint64_t)&v154, &qword_100025320);
        if (!v156)
        {

          sub_100004A5C((uint64_t)&v154, &qword_100025320);
LABEL_62:
          v122 = v10;
          goto LABEL_63;
        }
        if ((swift_dynamicCast(&v150, &v154, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
        {
          swift_bridgeObjectRelease(v10);

          return v12;
        }
        v21 = v150;
        v20 = (unint64_t)v151;
        if (v150 == (void *)1954047348 && v151 == (void *)0xE400000000000000)
          break;
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(v150, v151) & 1) != 0)
        {
          v22 = v20;
          goto LABEL_17;
        }
        if (v21 == (void *)0x6C6F626D7973 && v20 == 0xE600000000000000)
        {
          swift_bridgeObjectRelease(0xE600000000000000);
        }
        else
        {
          v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v20);
          swift_bridgeObjectRelease(v20);
          if ((v53 & 1) == 0)
          {

            goto LABEL_6;
          }
        }
        *(_QWORD *)&v152 = 0x7372747461;
        *((_QWORD *)&v152 + 1) = 0xE500000000000000;
        v54 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v152, &type metadata for String);
        v55 = -[objc_class __swift_objectForKeyedSubscript:](v149, "__swift_objectForKeyedSubscript:", v54);
        swift_unknownObjectRelease(v54);
        if (v55)
        {
          _bridgeAnyObjectToAny(_:)(&v152, v55);
          swift_unknownObjectRelease(v55);
        }
        else
        {
          v152 = 0u;
          v153 = 0u;
        }
        sub_1000056E8((uint64_t)&v152, (uint64_t)&v154, &qword_100025320);
        if (!v156)
        {
LABEL_5:

          sub_100004A5C((uint64_t)&v154, &qword_100025320);
          goto LABEL_6;
        }
        v56 = sub_100017104(0, &qword_100025330, NSDictionary_ptr);
        if ((swift_dynamicCast(&v150, &v154, (char *)&type metadata for Any + 8, v56, 6) & 1) == 0)
        {
LABEL_34:

          goto LABEL_6;
        }
        v57 = v150;
        *(_QWORD *)&v152 = 0x6449676E69727473;
        *((_QWORD *)&v152 + 1) = 0xE800000000000000;
        v58 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v152, &type metadata for String);
        v59 = objc_msgSend(v57, "__swift_objectForKeyedSubscript:", v58);
        swift_unknownObjectRelease(v58);
        if (v59)
        {
          _bridgeAnyObjectToAny(_:)(&v152, v59);
          swift_unknownObjectRelease(v59);
        }
        else
        {
          v152 = 0u;
          v153 = 0u;
        }
        sub_1000056E8((uint64_t)&v152, (uint64_t)&v154, &qword_100025320);
        v146 = v11;
        v143 = v57;
        if (!v156)
        {
          v60 = sub_100004A5C((uint64_t)&v154, &qword_100025320);
          goto LABEL_44;
        }
        v60 = swift_dynamicCast(&v150, &v154, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        if ((v60 & 1) == 0)
          goto LABEL_44;
        v62 = (uint64_t)v150;
        v61 = v151;
        sub_100017104(0, &qword_100025368, UIImage_ptr);
        swift_bridgeObjectRetain(v61);
        v63._countAndFlagsBits = v62;
        v64 = v61;
        v63._object = v61;
        v65 = (void *)UIImage.init(systemImageName:)(v63);

        if (!v65)
        {
          v60 = swift_bridgeObjectRelease(v64);
          v57 = v143;
LABEL_44:
          static TipsLog.widget.getter(v60);
          v91 = sub_100002A38(&qword_100024B78);
          v92 = swift_allocObject(v91, 72, 7);
          *(_OWORD *)(v92 + 16) = v136;
          v154 = 0x6449676E69727473;
          v155 = 0xE800000000000000;
          v93 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v154, &type metadata for String);
          v94 = objc_msgSend(v57, "__swift_objectForKeyedSubscript:", v93);
          swift_unknownObjectRelease(v93);
          if (v94)
          {
            _bridgeAnyObjectToAny(_:)(&v152, v94);
            swift_unknownObjectRelease(v94);
          }
          else
          {
            v152 = 0u;
            v153 = 0u;
          }
          sub_1000056E8((uint64_t)&v152, (uint64_t)&v154, &qword_100025320);
          if (v156)
          {
            if ((swift_dynamicCast(&v150, &v154, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
            {
              v95 = (uint64_t)v150;
              v96 = (unint64_t)v151;
LABEL_52:
              *(_QWORD *)(v92 + 56) = &type metadata for String;
              *(_QWORD *)(v92 + 64) = sub_10000A500();
              v97 = 0x65707320656E6F6ELL;
              if (v96)
                v97 = v95;
              v98 = 0xEE00646569666963;
              if (v96)
                v98 = v96;
              *(_QWORD *)(v92 + 32) = v97;
              *(_QWORD *)(v92 + 40) = v98;
              v99 = v139;
              logDebug(_:_:_:)(v139, "Missing or invalid symbol: %s", v134);
              swift_bridgeObjectRelease(v92);
              (*(void (**)(char *, uint64_t))(v137 + 8))(v99, v138);
              LOBYTE(v99) = v13 & 1;
              v100 = v148;
              v101 = static Text.+ infix(_:_:)(v12, v148, v13 & 1, v14, 32, 0xE100000000000000, 0, &_swiftEmptyArrayStorage);
              v103 = v102;
              v105 = v104;
              v13 = v106 & 1;
              sub_100008A00(v12, v100, (char)v99);

              swift_bridgeObjectRelease(v14);
              v12 = v101;
              v148 = v103;
              v14 = v105;
              v15 = v145;
              v11 = v146;
              goto LABEL_6;
            }
          }
          else
          {
            sub_100004A5C((uint64_t)&v154, &qword_100025320);
          }
          v95 = 0;
          v96 = 0;
          goto LABEL_52;
        }
        swift_bridgeObjectRetain(v64);
        v66 = Image.init(_internalSystemName:)(v62, v64);
        v67 = swift_retain(v66);
        v68 = Text.init(_:)(v67);
        v70 = v69;
        v72 = v71;
        LODWORD(v144) = v13;
        v74 = v73 & 1;
        v75 = static Color.white.getter();
        v135 = Text.foregroundColor(_:)(v75, v68, v70, v74, v72);
        v134 = v76;
        v77 = v14;
        v79 = v78;
        v141 = v80;
        swift_release(v75);
        v81 = v79 & 1;
        sub_100008A00(v68, v70, v74);
        swift_bridgeObjectRelease(v64);
        swift_release(v66);
        swift_bridgeObjectRelease(v72);
        LOBYTE(v66) = v144 & 1;
        v82 = v148;
        v83 = v135;
        v84 = v134;
        v85 = v141;
        v144 = static Text.+ infix(_:_:)(v12, v148, v144 & 1, v77, v135, v134, v81, v141);
        v142 = v86;
        v88 = v87;
        v13 = v89 & 1;
        sub_100008A00(v12, v82, v66);
        swift_bridgeObjectRelease(v77);
        v90 = v81;
        v10 = v140;
        sub_100008A00(v83, (uint64_t)v84, v90);

        swift_bridgeObjectRelease(v85);
        v12 = v144;
        v15 = v145;
        v148 = v142;
        v11 = v146;
        v14 = v88;
LABEL_6:
        if (v15 == ++v11)
          goto LABEL_62;
      }
      v22 = 0xE400000000000000;
LABEL_17:
      swift_bridgeObjectRelease(v22);
      *(_QWORD *)&v152 = 1954047348;
      *((_QWORD *)&v152 + 1) = 0xE400000000000000;
      v23 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v152, &type metadata for String);
      v24 = -[objc_class __swift_objectForKeyedSubscript:](v149, "__swift_objectForKeyedSubscript:", v23);
      swift_unknownObjectRelease(v23);
      if (v24)
      {
        _bridgeAnyObjectToAny(_:)(&v152, v24);
        swift_unknownObjectRelease(v24);
      }
      else
      {
        v152 = 0u;
        v153 = 0u;
      }
      sub_1000056E8((uint64_t)&v152, (uint64_t)&v154, &qword_100025320);
      if (!v156)
        goto LABEL_5;
      if ((swift_dynamicCast(&v150, &v154, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
        goto LABEL_34;
      v25 = v151;
      v154 = (uint64_t)v150;
      v155 = (unint64_t)v151;
      v26 = sub_1000089BC();
      swift_bridgeObjectRetain(v25);
      v27 = Text.init<A>(_:)(&v154, &type metadata for String, v26);
      v142 = v12;
      v29 = v28;
      v143 = v14;
      v31 = v30;
      LODWORD(v144) = v13;
      v33 = v32 & 1;
      v34 = static Color.white.getter();
      v35 = Text.foregroundColor(_:)(v34, v27, v29, v33, v31);
      v146 = v11;
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      swift_release(v34);
      LOBYTE(v34) = v40 & 1;
      sub_100008A00(v27, v29, v33);
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v31);
      LOBYTE(v25) = v144 & 1;
      v43 = v142;
      v44 = v148;
      v45 = v143;
      v144 = static Text.+ infix(_:_:)(v142, v148, v144 & 1, v143, v36, v38, v40 & 1, v42);
      v47 = v46;
      v141 = v48;
      v13 = v49 & 1;
      v50 = v36;
      v11 = v146;
      v51 = v38;
      v10 = v140;
      sub_100008A00(v50, v51, v34);
      v52 = v42;
      v15 = v145;
      swift_bridgeObjectRelease(v52);
      sub_100008A00(v43, v44, (char)v25);

      swift_bridgeObjectRelease(v45);
      v12 = v144;
      v148 = v47;
      v14 = v141;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease(v10);
    v12 = 0;
    v148 = 0xE000000000000000;
  }
  else
  {
    v107 = objc_msgSend(objc_allocWithZone((Class)TPSPlaceholderWidgetContent), "init");
    v108 = objc_msgSend(v107, "bodyText");

    if (v108)
    {
      v109 = static String._unconditionallyBridgeFromObjectiveC(_:)(v108);
      v111 = v110;

      v154 = v109;
      v155 = v111;
      v112 = sub_1000089BC();
      swift_bridgeObjectRetain(v111);
      v113 = Text.init<A>(_:)(&v154, &type metadata for String, v112);
      v115 = v114;
      v117 = v116;
      v119 = v118 & 1;
      v120 = static Color.white.getter();
      v12 = Text.foregroundColor(_:)(v120, v113, v115, v119, v117);
      v148 = v121;
      swift_release(v120);
      sub_100008A00(v113, v115, v119);
      swift_bridgeObjectRelease(v111);
      v122 = v117;
    }
    else
    {
      v154 = 0;
      v155 = 0xE000000000000000;
      v123 = sub_1000089BC();
      v124 = Text.init<A>(_:)(&v154, &type metadata for String, v123);
      v126 = v125;
      v128 = v127;
      v130 = v129 & 1;
      v131 = static Color.white.getter();
      v12 = Text.foregroundColor(_:)(v131, v124, v126, v130, v128);
      v148 = v132;
      swift_release(v131);
      sub_100008A00(v124, v126, v130);
      v122 = v128;
    }
LABEL_63:
    swift_bridgeObjectRelease(v122);
  }
  return v12;
}

uint64_t sub_1000155A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  char *v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;

  v84 = a2;
  v3 = type metadata accessor for Image.Scale(0);
  v82 = *(_QWORD *)(v3 - 8);
  v83 = v3;
  v4 = __chkstk_darwin(v3);
  v81 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Text.TruncationMode(0, v4);
  v79 = *(_QWORD *)(v6 - 8);
  v80 = v6;
  __chkstk_darwin(v6);
  v78 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_100002A38(&qword_100025220);
  __chkstk_darwin(v65);
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100002A38(&qword_100025338);
  v70 = *(_QWORD *)(v10 - 8);
  v71 = v10;
  __chkstk_darwin(v10);
  v67 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_100002A38(&qword_100025340);
  __chkstk_darwin(v69);
  v68 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100002A38(&qword_100025348);
  v74 = *(_QWORD *)(v13 - 8);
  v75 = v13;
  __chkstk_darwin(v13);
  v73 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_100002A38(&qword_100025350);
  __chkstk_darwin(v66);
  v76 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100002A38(&qword_1000248F0);
  __chkstk_darwin(v72);
  v77 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100014860(a1);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v24 = static Font.subheadline.getter();
  v25 = Text.font(_:)(v24, v17, v19, v23, v21);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  swift_release(v24);
  sub_100008A00(v17, v19, v23);
  swift_bridgeObjectRelease(v21);
  v85 = v25;
  v86 = v27;
  v87 = v29 & 1;
  v88 = v31;
  v32 = enum case for DynamicTypeSize.xxLarge(_:);
  v33 = type metadata accessor for DynamicTypeSize(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v9, v32, v33);
  v34 = sub_1000031D0(&qword_100025310, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  result = dispatch thunk of static Equatable.== infix(_:_:)(v9, v9, v33, v34);
  if ((result & 1) != 0)
  {
    v36 = sub_1000086C8(&qword_100025250, &qword_100025220, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    v37 = v67;
    View.dynamicTypeSize<A>(_:)(v9, &type metadata for Text, v65, &protocol witness table for Text, v36);
    sub_100004A5C((uint64_t)v9, &qword_100025220);
    sub_100008A00(v85, v86, v87);
    swift_bridgeObjectRelease(v88);
    KeyPath = swift_getKeyPath(&unk_10001B9E8);
    v40 = v70;
    v39 = v71;
    v41 = (uint64_t)v68;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v37, v71);
    v42 = v69;
    v43 = (uint64_t *)(v41 + *(int *)(v69 + 36));
    *v43 = KeyPath;
    v43[1] = 0x3FE6666666666666;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    v44 = sub_100016FE0();
    v45 = v73;
    View.hyphenationFactor(_:)(v42, v44, 0.2);
    sub_100004A5C(v41, &qword_100025340);
    v47 = v78;
    v46 = v79;
    v48 = v80;
    (*(void (**)(char *, _QWORD, uint64_t))(v79 + 104))(v78, enum case for Text.TruncationMode.tail(_:), v80);
    v49 = swift_getKeyPath(&unk_10001BAD8);
    v50 = (uint64_t)v76;
    v51 = (uint64_t *)&v76[*(int *)(v66 + 36)];
    v52 = sub_100002A38(&qword_100025360);
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)v51 + *(int *)(v52 + 28), v47, v48);
    *v51 = v49;
    v54 = v74;
    v53 = v75;
    (*(void (**)(uint64_t, char *, uint64_t))(v74 + 16))(v50, v45, v75);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v45, v53);
    v56 = v81;
    v55 = v82;
    v57 = v83;
    (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v81, enum case for Image.Scale.small(_:), v83);
    v58 = swift_getKeyPath(&unk_10001BAA8);
    v59 = (uint64_t)v77;
    v60 = (uint64_t *)&v77[*(int *)(v72 + 36)];
    v61 = sub_100002A38(&qword_100025290);
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))((char *)v60 + *(int *)(v61 + 28), v56, v57);
    *v60 = v58;
    sub_1000057B0(v50, v59, &qword_100025350);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
    v62 = sub_100004A5C(v50, &qword_100025350);
    v63 = static Alignment.bottomLeading.getter(v62);
    sub_100006440(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v84, 0.0, 1, 0.0, 1, v63, v64);
    return sub_100004A5C(v59, &qword_1000248F0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100015B78@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_1000155A4(*v1, a1);
}

uint64_t sub_100015B80(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001E210, 1);
}

uint64_t type metadata accessor for PlaceholderTitleView(uint64_t a1)
{
  return sub_100007918(a1, qword_100025480, (uint64_t)&nominal type descriptor for PlaceholderTitleView);
}

unint64_t sub_100015BA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000251D0;
  if (!qword_1000251D0)
  {
    v1 = sub_100003038(&qword_1000248E0);
    sub_100015C28();
    sub_1000086C8(&qword_100025288, &qword_100025290, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000251D0);
  }
  return result;
}

unint64_t sub_100015C28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000251D8;
  if (!qword_1000251D8)
  {
    v1 = sub_100003038(&qword_1000251E0);
    v2[0] = sub_100003038(&qword_1000251E8);
    v2[1] = sub_100015CD4();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.hyphenationFactor(_:)>>, 1);
    sub_1000086C8(&qword_100025278, &qword_100025280, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000251D8);
  }
  return result;
}

unint64_t sub_100015CD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000251F0;
  if (!qword_1000251F0)
  {
    v1 = sub_100003038(&qword_1000251E8);
    sub_100015D58();
    sub_1000086C8(&qword_100025258, &qword_100025260, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000251F0);
  }
  return result;
}

unint64_t sub_100015D58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000251F8;
  if (!qword_1000251F8)
  {
    v1 = sub_100003038(&qword_100025200);
    v2[0] = sub_100003038(&qword_100025208);
    v2[1] = sub_100015E04();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.avoidsOrphans(_:)>>, 1);
    sub_1000086C8(&qword_100025268, &qword_100025270, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000251F8);
  }
  return result;
}

unint64_t sub_100015E04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100025210;
  if (!qword_100025210)
  {
    v1 = sub_100003038(&qword_100025208);
    v2[0] = sub_100003038(&qword_100025218);
    v2[1] = sub_100003038(&qword_100025220);
    v2[2] = sub_100015EF4();
    v2[3] = sub_1000086C8(&qword_100025250, &qword_100025220, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    sub_1000086C8(&qword_100025258, &qword_100025260, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025210);
  }
  return result;
}

unint64_t sub_100015EF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025228;
  if (!qword_100025228)
  {
    v1 = sub_100003038(&qword_100025218);
    sub_1000086C8(&qword_100025230, &qword_100025238, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_1000086C8(&qword_100025240, &qword_100025248, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025228);
  }
  return result;
}

unint64_t sub_100015F90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000252A8;
  if (!qword_1000252A8)
  {
    v1 = sub_100003038(&qword_1000251B8);
    sub_100017BF0(&qword_1000251C8, &qword_1000248E8, (void (*)(void))sub_100015BA4);
    sub_1000086C8(&qword_100025298, &qword_1000251A8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000252A8);
  }
  return result;
}

uint64_t sub_100016034()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_100016054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

unint64_t sub_100016068(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7);
  type metadata accessor for CFString(0);
  v3 = v2;
  v4 = sub_1000031D0(&qword_100025370, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AE78);
  _CFObject.hash(into:)(v7, v3, v4);
  v5 = Hasher._finalize()();
  return sub_100016120(a1, v5);
}

unint64_t sub_1000160F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100016260(a1, v4);
}

unint64_t sub_100016120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v6 = v2;
    type metadata accessor for CFString(0);
    v9 = v8;
    v10 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * i);
    v11 = sub_1000031D0(&qword_100025370, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_10001AE78);
    v12 = v10;
    v13 = static _CFObject.== infix(_:_:)(v12, a1, v9, v11);

    if ((v13 & 1) == 0)
    {
      v14 = ~v4;
      for (i = (i + 1) & v14; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v14)
      {
        v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * i);
        v16 = static _CFObject.== infix(_:_:)(v15, a1, v9, v11);

        if ((v16 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_100016260(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_100016FA4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100016F60((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_100016324(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100016340(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100016340(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002A38(&qword_100024D98);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_100016440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016468(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100016490(char a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = a5;
  if ((a1 & 1) != 0)
  {
    if ((a2 & 1) == 0)
      goto LABEL_8;
LABEL_5:
    if ((a4 & 1) != 0)
    {
      v12 = static Color.primary.getter();
LABEL_12:
      v13 = v12;
      v14 = swift_retain_n(v12, 2);
      v11 = Text.foregroundColor(_:)(v14, v11, a6, a7 & 1, a8);
      swift_release_n(v13, 3);
      return v11;
    }
    goto LABEL_8;
  }
  if ((a2 & 1) != 0)
    goto LABEL_5;
  if ((a3 & 1) == 0)
  {
    if ((a4 & 1) != 0)
      v12 = static Color.secondary.getter();
    else
      v12 = static Color.clear.getter();
    goto LABEL_12;
  }
LABEL_8:
  sub_100008844(a5, a6, a7 & 1);
  swift_bridgeObjectRetain(a8);
  return v11;
}

uint64_t sub_100016570(uint64_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
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
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  _QWORD *v42;
  char v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;

  v66 = a4;
  v9 = type metadata accessor for TitleView(0);
  __chkstk_darwin(v9);
  v65 = (uint64_t)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
    v16 = a1;
  else
    v16 = 0;
  v64 = v16;
  if (a2)
    v17 = a2;
  else
    v17 = 0xE000000000000000;
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v12 + 104))(v15, enum case for WidgetFamily.accessoryRectangular(_:), v11, v13);
  v18 = sub_1000031D0(&qword_100024720, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  swift_bridgeObjectRetain_n(v17, 2);
  swift_bridgeObjectRetain(a2);
  dispatch thunk of RawRepresentable.rawValue.getter(&v68, v11, v18);
  dispatch thunk of RawRepresentable.rawValue.getter(&v67, v11, v18);
  v20 = v67;
  v19 = v68;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  if (v19 == v20)
  {
    v21 = Image.init(_internalSystemName:)(0x6C69662E73706974, 0xE90000000000006CLL);
    v22 = Text.init(_:)(v21);
    v24 = v23;
    v26 = v25;
    v28 = v27 & 1;
    v29 = ((uint64_t (*)(void))static Text.+ infix(_:_:))();
    v61 = a5;
    v62 = v9;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35 & 1;
    sub_100008A00(v22, v24, v28);
    swift_bridgeObjectRelease(v26);
    v37 = v64;
    v38 = static Text.+ infix(_:_:)(v30, v32, v36, v34, v64, v17, 0, &_swiftEmptyArrayStorage);
    v40 = v39;
    LOBYTE(v22) = v41;
    v63 = v42;
    swift_bridgeObjectRelease_n(v17, 2);
    v43 = v22 & 1;
    v44 = v30;
    v45 = v36;
    a5 = v61;
    v9 = v62;
    sub_100008A00(v44, v32, v45);
  }
  else
  {
    v43 = 0;
    v63 = &_swiftEmptyArrayStorage;
    v34 = v17;
    v37 = v64;
    v38 = v64;
    v40 = v17;
  }
  swift_bridgeObjectRelease(v34);
  v46 = sub_1000131D0(v37, v17, a5);
  swift_bridgeObjectRelease(v17);
  v47 = *(_QWORD *)a3;
  v48 = *(_BYTE *)(a3 + 8);
  sub_10000827C(*(_QWORD *)a3, v48);
  v49 = sub_100003974(v47, v48);
  sub_100005220(v47, v48);
  v50 = a3 + *(int *)(v9 + 24);
  v51 = *(_QWORD *)v50;
  v52 = *(_BYTE *)(v50 + 8);
  sub_10000827C(*(_QWORD *)v50, v52);
  v53 = v9;
  v54 = sub_100003974(v51, v52);
  sub_100005220(v51, v52);
  v55 = v65;
  sub_10000817C(a3, v65, type metadata accessor for TitleView);
  if ((v54 & 1) != 0)
    v56 = *(_BYTE *)(v55 + *(int *)(v53 + 40));
  else
    v56 = 1;
  sub_100004190(v55, type metadata accessor for TitleView);
  v57 = v63;
  v58 = sub_100016490(v66 & 1, v46 & 1, v49 & 1, v56, v38, v40, v43, (uint64_t)v63);
  sub_100008A00(v38, v40, v43);
  swift_bridgeObjectRelease(v57);
  return v58;
}

uint64_t sub_100016914(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, _QWORD *a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t result;
  BOOL v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
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
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v64 = a5;
  v65 = a8;
  LODWORD(v67) = a7;
  v68 = a1;
  v69 = type metadata accessor for TitleView(0);
  __chkstk_darwin(v69);
  v66 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for CharacterSet(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a2[1];
  v70 = *a2;
  v71 = v18;
  static CharacterSet.whitespacesAndNewlines.getter(v19);
  v20 = sub_1000089BC();
  v21 = StringProtocol.trimmingCharacters(in:)(v17, &type metadata for String, v20);
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if (a4)
  {
    v24 = v21 == a3 && v23 == a4;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(v21, v23) & 1) != 0)
      return swift_bridgeObjectRelease(v23);
  }
  if (a6
    && (v21 == v64 ? (v26 = v23 == a6) : (v26 = 0),
        v26 || (_stringCompareWithSmolCheck(_:_:expecting:)(v21, v23) & 1) != 0))
  {
    swift_bridgeObjectRetain(v23);
    v27 = v23;
    v64 = v21;
  }
  else
  {
    v70 = v21;
    v71 = v23;
    swift_bridgeObjectRetain(v23);
    v28._countAndFlagsBits = 10;
    v28._object = (void *)0xE100000000000000;
    String.append(_:)(v28);
    v27 = v71;
    v64 = v70;
  }
  v29 = (uint64_t)v66;
  v30 = sub_1000131D0(v21, v23, v65);
  swift_bridgeObjectRelease(v23);
  v31 = *(_QWORD *)a9;
  v32 = *(_BYTE *)(a9 + 8);
  sub_10000827C(*(_QWORD *)a9, v32);
  v33 = sub_100003974(v31, v32);
  sub_100005220(v31, v32);
  v34 = v69;
  v35 = a9 + *(int *)(v69 + 24);
  v36 = *(_QWORD *)v35;
  v37 = *(_BYTE *)(v35 + 8);
  sub_10000827C(*(_QWORD *)v35, v37);
  v38 = sub_100003974(v36, v37);
  sub_100005220(v36, v37);
  sub_10000817C(a9, v29, type metadata accessor for TitleView);
  if ((v38 & 1) != 0)
    v39 = *(_BYTE *)(v29 + *(int *)(v34 + 40));
  else
    v39 = 1;
  v40 = v68;
  v41 = v67;
  v42 = v64;
  sub_100004190(v29, type metadata accessor for TitleView);
  v43 = sub_100016490(v41 & 1, v30 & 1, v33 & 1, v39, v42, v27, 0, (uint64_t)&_swiftEmptyArrayStorage);
  v45 = v44;
  v47 = v46;
  v49 = v48 & 1;
  sub_100008A00(v42, v27, 0);
  result = swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v50 = *(_QWORD *)(v40 + 24);
  if (v50)
  {
    LODWORD(v68) = v49 != 0;
    v51 = *(_QWORD *)v40;
    v52 = *(_QWORD *)(v40 + 8);
    v53 = (uint64_t *)v40;
    v54 = *(_DWORD *)(v40 + 16) & 1;
    v69 = v54;
    sub_100008844(v43, v45, v49);
    swift_bridgeObjectRetain(v47);
    LOBYTE(v70) = v54;
    v55 = v54;
    v56 = v51;
    v57 = static Text.+ infix(_:_:)(v51, v52, v55, v50, v43, v45, v68, v47);
    v67 = v58;
    v68 = v57;
    v66 = v59;
    v61 = v60 & 1;
    sub_100008A00(v43, v45, v49);
    swift_bridgeObjectRelease(v47);
    sub_100008A00(v43, v45, v49);
    swift_bridgeObjectRelease(v47);
    sub_100008A00(v56, v52, v69);
    result = swift_bridgeObjectRelease(v50);
    v62 = v67;
    *v53 = v68;
    v53[1] = v62;
    v63 = v66;
    v53[2] = v61;
    v53[3] = (uint64_t)v63;
  }
  else
  {
    *(_QWORD *)v40 = v43;
    *(_QWORD *)(v40 + 8) = v45;
    *(_QWORD *)(v40 + 16) = v49;
    *(_QWORD *)(v40 + 24) = v47;
  }
  return result;
}

uint64_t sub_100016CD0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100008A00(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

unint64_t sub_100016D00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025300;
  if (!qword_100025300)
  {
    v1 = sub_100003038(&qword_1000252F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100025300);
  }
  return result;
}

uint64_t sub_100016D5C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100008844(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_100016D8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016DB4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

void sub_100016DDC(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100016E04(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_100016E28@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100016E58(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_100016E84(double *a1@<X8>)
{
  *a1 = EnvironmentValues.lineSpacing.getter();
}

uint64_t sub_100016EAC(double *a1)
{
  return EnvironmentValues.lineSpacing.setter(*a1);
}

uint64_t sub_100016ED0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016EF8(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100016F1C()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100016F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_100016F60(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

_OWORD *sub_100016F94(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100016FA4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

unint64_t sub_100016FE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100025358;
  if (!qword_100025358)
  {
    v1 = sub_100003038(&qword_100025340);
    v2[0] = &type metadata for Text;
    v2[1] = sub_100003038(&qword_100025220);
    v2[2] = &protocol witness table for Text;
    v2[3] = sub_1000086C8(&qword_100025250, &qword_100025220, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    sub_1000086C8(&qword_100025258, &qword_100025260, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025358);
  }
  return result;
}

uint64_t sub_1000170C0()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000170E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for Text.TruncationMode, (uint64_t (*)(char *))&EnvironmentValues.truncationMode.setter);
}

uint64_t sub_100017104(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100017144()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_100017164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002B08(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

unint64_t sub_10001718C()
{
  unint64_t result;

  result = qword_1000253A0[0];
  if (!qword_1000253A0[0])
  {
    result = swift_getWitnessTable(&unk_10001BC48, &_s27WidgetTextBaselineAlignmentON);
    atomic_store(result, qword_1000253A0);
  }
  return result;
}

uint64_t sub_1000171D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

ValueMetadata *_s27WidgetTextBaselineAlignmentOMa()
{
  return &_s27WidgetTextBaselineAlignmentON;
}

uint64_t sub_10001720C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 0, 1, &v4, a1 + 32);
    return 0;
  }
  return result;
}

uint64_t *sub_100017278(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain(v8);
  }
  return v3;
}

uint64_t sub_1000172E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1000172F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_100017328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_100017358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_100017388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_1000173B8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_100017468 + 4 * byte_10001B690[(v7 - 1)]))();
}

void sub_1000174B8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = &dword_100000004;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = &_mh_execute_header.magic + 1;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for LinearGradientText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000171D0(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LinearGradientText);
}

_QWORD *sub_100017674(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v9);
  }
  else
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_100017710(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_100017744(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000177B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100017838(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000178A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100017918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017924);
}

uint64_t sub_100017924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for WidgetFamily(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_1000179B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000179BC);
}

uint64_t sub_1000179BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_100017A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100017A48(a1, a2, a3, (uint64_t)&unk_10001B8A8, (uint64_t)&unk_10001B890);
}

uint64_t sub_100017A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  unint64_t v9;
  _QWORD v10[4];

  result = type metadata accessor for WidgetFamily(319);
  if (v9 <= 0x3F)
  {
    v10[0] = *(_QWORD *)(result - 8) + 64;
    v10[1] = a4;
    v10[2] = a5;
    v10[3] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 4, v10, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_100017AD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000254C0;
  if (!qword_1000254C0)
  {
    v1 = sub_100003038(&qword_1000254C8);
    sub_100017B38();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000254C0);
  }
  return result;
}

unint64_t sub_100017B38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000254D0;
  if (!qword_1000254D0)
  {
    v1 = sub_100003038(&qword_100025198);
    sub_1000086C8(&qword_1000254D8, &qword_100025190, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000254D0);
  }
  return result;
}

uint64_t sub_100017BBC()
{
  return sub_100017BF0(&qword_1000254E0, &qword_1000248F8, (void (*)(void))sub_100017C58);
}

uint64_t sub_100017BF0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003038(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100017C58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000254E8;
  if (!qword_1000254E8)
  {
    v1 = sub_100003038(&qword_1000248F0);
    sub_100017CDC();
    sub_1000086C8(&qword_100025288, &qword_100025290, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000254E8);
  }
  return result;
}

unint64_t sub_100017CDC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000254F0;
  if (!qword_1000254F0)
  {
    v1 = sub_100003038(&qword_100025350);
    v2[0] = sub_100003038(&qword_100025340);
    v2[1] = sub_100016FE0();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.hyphenationFactor(_:)>>, 1);
    sub_1000086C8(&qword_1000254F8, &qword_100025360, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000254F0);
  }
  return result;
}

uint64_t sub_100017D88(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_10001E288, 1);
}

uint64_t sub_100017DBC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001E260, 1);
}

uint64_t sub_100017DCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 128);
  v14 = *(_QWORD *)(a1 + 144);
  v15 = *(_QWORD *)(a1 + 136);
  v13 = *(_BYTE *)(a1 + 152);
  v18 = *(_QWORD *)(a1 + 168);
  v19 = *(_QWORD *)(a1 + 160);
  v20 = *(_QWORD *)(a1 + 176);
  v21 = *(_QWORD *)(a1 + 192);
  v16 = *(_QWORD *)(a1 + 200);
  v17 = *(_QWORD *)(a1 + 184);
  v12 = *(_QWORD *)(a1 + 224);
  sub_100008A00(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRelease(v2);
  sub_100008A00(v3, v4, v5);
  swift_bridgeObjectRelease(v6);
  sub_100008A00(v8, v7, v9);
  swift_bridgeObjectRelease(v10);
  sub_100008A00(v15, v14, v13);
  swift_release(v12);
  swift_release(v16);
  swift_release(v17);
  swift_release(v18);
  swift_bridgeObjectRelease(v19);
  swift_release(v20);
  swift_release(v21);
  return a1;
}

_QWORD *sub_100017EF8(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_100017F20()
{
  return sub_100017BF0(&qword_100025508, &qword_100025510, (void (*)(void))sub_100017F54);
}

unint64_t sub_100017F54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025518;
  if (!qword_100025518)
  {
    v1 = sub_100003038(&qword_100025520);
    sub_100017FD8();
    sub_1000086C8(&qword_100025258, &qword_100025260, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025518);
  }
  return result;
}

unint64_t sub_100017FD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025528;
  if (!qword_100025528)
  {
    v1 = sub_100003038(&qword_100025530);
    sub_10001805C();
    sub_1000086C8(&qword_100025268, &qword_100025270, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025528);
  }
  return result;
}

unint64_t sub_10001805C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025538;
  if (!qword_100025538)
  {
    v1 = sub_100003038(&qword_100025540);
    sub_1000180E0();
    sub_1000086C8(&qword_100025240, &qword_100025248, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025538);
  }
  return result;
}

unint64_t sub_1000180E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025548;
  if (!qword_100025548)
  {
    v1 = sub_100003038(&qword_100025550);
    sub_100018164();
    sub_1000086C8(&qword_100025578, &qword_100025580, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025548);
  }
  return result;
}

unint64_t sub_100018164()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025558;
  if (!qword_100025558)
  {
    v1 = sub_100003038(&qword_100025560);
    sub_1000086C8(&qword_100025568, &qword_100025570, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100025558);
  }
  return result;
}

uint64_t sub_1000181E0(_QWORD *a1, __n128 a2)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for _MaskEffect(255, *a1, a2);
  v3 = type metadata accessor for ModifiedContent(255, &type metadata for LinearGradient, v2);
  v5 = type metadata accessor for _BlendModeEffect(255, v4);
  v6 = type metadata accessor for ModifiedContent(255, v3, v5);
  sub_10000FB54();
  swift_getWitnessTable(&protocol conformance descriptor for _MaskEffect<A>, v2);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v3);
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
}

uint64_t *sub_10001829C(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v28;
  char *v29;
  char *v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void (*v45)(char *, _QWORD, uint64_t, int *);
  id v46;
  id v47;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_100002A38(&qword_1000245E0);
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
    v14 = a3[5];
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100002A38(&qword_1000245F0);
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
    v23 = a3[6];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = *(_QWORD *)v25;
    v27 = v25[8];
    sub_10000827C(*(_QWORD *)v25, v27);
    *(_QWORD *)v24 = v26;
    v24[8] = v27;
    v28 = a3[7];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = (int *)type metadata accessor for DocumentEntry(0);
    v32 = *((_QWORD *)v31 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v32 + 48))(v30, 1, v31))
    {
      v33 = sub_100002A38(&qword_100024630);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      v34 = type metadata accessor for Date(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v29, v30, v34);
      v35 = v31[5];
      v36 = &v29[v35];
      v37 = &v30[v35];
      v38 = type metadata accessor for TimelineEntryRelevance(0);
      v39 = *(_QWORD *)(v38 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
      {
        v40 = sub_100002A38(&qword_100024668);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      v41 = v31[6];
      v42 = *(void **)&v30[v41];
      *(_QWORD *)&v29[v41] = v42;
      v43 = v31[7];
      v44 = *(void **)&v30[v43];
      *(_QWORD *)&v29[v43] = v44;
      v45 = *(void (**)(char *, _QWORD, uint64_t, int *))(v32 + 56);
      v46 = v42;
      v47 = v44;
      v45(v29, 0, 1, v31);
    }
  }
  return a1;
}

void sub_100018558(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_100002A38(&qword_1000245E0);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_100002A38(&qword_1000245F0);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  sub_100005220(*(_QWORD *)((char *)a1 + a2[6]), *((_BYTE *)a1 + a2[6] + 8));
  v9 = (char *)a1 + a2[7];
  v10 = (int *)type metadata accessor for DocumentEntry(0);
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v10 - 1) + 48))(v9, 1, v10))
  {
    v11 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
    v12 = &v9[v10[5]];
    v13 = type metadata accessor for TimelineEntryRelevance(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);

  }
}

uint64_t *sub_1000186E8(uint64_t *a1, uint64_t *a2, int *a3)
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
  char *v27;
  char *v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void (*v43)(char *, _QWORD, uint64_t, int *);
  id v44;
  id v45;

  v6 = sub_100002A38(&qword_1000245E0);
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
  v12 = a3[5];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100002A38(&qword_1000245F0);
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
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_10000827C(*(_QWORD *)v23, v25);
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  v26 = a3[7];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = (int *)type metadata accessor for DocumentEntry(0);
  v30 = *((_QWORD *)v29 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v30 + 48))(v28, 1, v29))
  {
    v31 = sub_100002A38(&qword_100024630);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    v32 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v27, v28, v32);
    v33 = v29[5];
    v34 = &v27[v33];
    v35 = &v28[v33];
    v36 = type metadata accessor for TimelineEntryRelevance(0);
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = sub_100002A38(&qword_100024668);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
    }
    v39 = v29[6];
    v40 = *(void **)&v28[v39];
    *(_QWORD *)&v27[v39] = v40;
    v41 = v29[7];
    v42 = *(void **)&v28[v41];
    *(_QWORD *)&v27[v41] = v42;
    v43 = *(void (**)(char *, _QWORD, uint64_t, int *))(v30 + 56);
    v44 = v40;
    v45 = v42;
    v43(v27, 0, 1, v29);
  }
  return a1;
}

uint64_t *sub_100018978(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v28;
  char *v29;
  char *v30;
  int *v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, int *);
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void (*v57)(char *, _QWORD, uint64_t, int *);
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E0);
    v6 = sub_100002A38(&qword_1000245E0);
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
    v12 = a3[5];
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_100004A5C((uint64_t)a1 + v12, &qword_1000245F0);
    v15 = sub_100002A38(&qword_1000245F0);
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
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_10000827C(*(_QWORD *)v23, v25);
  v26 = *(_QWORD *)v22;
  v27 = v22[8];
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  sub_100005220(v26, v27);
  v28 = a3[7];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = (int *)type metadata accessor for DocumentEntry(0);
  v32 = *((_QWORD *)v31 - 1);
  v33 = *(uint64_t (**)(char *, uint64_t, int *))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (v35)
    {
      sub_100004190((uint64_t)v29, type metadata accessor for DocumentEntry);
      goto LABEL_15;
    }
    v44 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 24))(v29, v30, v44);
    v45 = v31[5];
    v46 = &v29[v45];
    v47 = &v30[v45];
    v48 = type metadata accessor for TimelineEntryRelevance(0);
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
LABEL_24:
        v61 = v31[6];
        v62 = *(void **)&v29[v61];
        v63 = *(void **)&v30[v61];
        *(_QWORD *)&v29[v61] = v63;
        v64 = v63;

        v65 = v31[7];
        v66 = *(void **)&v29[v65];
        v67 = *(void **)&v30[v65];
        *(_QWORD *)&v29[v65] = v67;
        v68 = v67;

        return a1;
      }
    }
    else
    {
      if (!v52)
      {
        (*(void (**)(char *, char *, uint64_t))(v49 + 24))(v46, v47, v48);
        goto LABEL_24;
      }
      (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
    }
    v60 = sub_100002A38(&qword_100024668);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
    goto LABEL_24;
  }
  if (v35)
  {
LABEL_15:
    v43 = sub_100002A38(&qword_100024630);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    return a1;
  }
  v36 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v29, v30, v36);
  v37 = v31[5];
  v38 = &v29[v37];
  v39 = &v30[v37];
  v40 = type metadata accessor for TimelineEntryRelevance(0);
  v41 = *(_QWORD *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
  {
    v42 = sub_100002A38(&qword_100024668);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
  }
  v53 = v31[6];
  v54 = *(void **)&v30[v53];
  *(_QWORD *)&v29[v53] = v54;
  v55 = v31[7];
  v56 = *(void **)&v30[v55];
  *(_QWORD *)&v29[v55] = v56;
  v57 = *(void (**)(char *, _QWORD, uint64_t, int *))(v32 + 56);
  v58 = v54;
  v59 = v56;
  v57(v29, 0, 1, v31);
  return a1;
}

char *sub_100018D84(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = sub_100002A38(&qword_1000245E0);
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
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100002A38(&qword_1000245F0);
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
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = &a1[v14];
  v18 = &a2[v14];
  v19 = (int *)type metadata accessor for DocumentEntry(0);
  v20 = *((_QWORD *)v19 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
  {
    v21 = sub_100002A38(&qword_100024630);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v22 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v17, v18, v22);
    v23 = v19[5];
    v24 = &v17[v23];
    v25 = &v18[v23];
    v26 = type metadata accessor for TimelineEntryRelevance(0);
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = sub_100002A38(&qword_100024668);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    *(_QWORD *)&v17[v19[6]] = *(_QWORD *)&v18[v19[6]];
    *(_QWORD *)&v17[v19[7]] = *(_QWORD *)&v18[v19[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
  }
  return a1;
}

char *sub_100018FF4(char *a1, char *a2, int *a3)
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
  uint64_t v19;
  char *v20;
  char *v21;
  int *v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, int *);
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t, uint64_t);
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;

  if (a1 != a2)
  {
    sub_100004A5C((uint64_t)a1, &qword_1000245E0);
    v6 = sub_100002A38(&qword_1000245E0);
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
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_100004A5C((uint64_t)&a1[v8], &qword_1000245F0);
    v11 = sub_100002A38(&qword_1000245F0);
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
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(_QWORD *)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_100005220(v17, v18);
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = (int *)type metadata accessor for DocumentEntry(0);
  v23 = *((_QWORD *)v22 - 1);
  v24 = *(uint64_t (**)(char *, uint64_t, int *))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (v26)
    {
      sub_100004190((uint64_t)v20, type metadata accessor for DocumentEntry);
      goto LABEL_14;
    }
    v35 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v20, v21, v35);
    v36 = v22[5];
    v37 = &v20[v36];
    v38 = &v21[v36];
    v39 = type metadata accessor for TimelineEntryRelevance(0);
    v40 = *(_QWORD *)(v39 - 8);
    v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
    v42 = v41(v37, 1, v39);
    v43 = v41(v38, 1, v39);
    if (v42)
    {
      if (!v43)
      {
        (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v37, v38, v39);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
LABEL_23:
        v45 = v22[6];
        v46 = *(void **)&v20[v45];
        *(_QWORD *)&v20[v45] = *(_QWORD *)&v21[v45];

        v47 = v22[7];
        v48 = *(void **)&v20[v47];
        *(_QWORD *)&v20[v47] = *(_QWORD *)&v21[v47];

        return a1;
      }
    }
    else
    {
      if (!v43)
      {
        (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v37, v38, v39);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
    }
    v44 = sub_100002A38(&qword_100024668);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_23;
  }
  if (v26)
  {
LABEL_14:
    v34 = sub_100002A38(&qword_100024630);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  v27 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v20, v21, v27);
  v28 = v22[5];
  v29 = &v20[v28];
  v30 = &v21[v28];
  v31 = type metadata accessor for TimelineEntryRelevance(0);
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    v33 = sub_100002A38(&qword_100024668);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  *(_QWORD *)&v20[v22[6]] = *(_QWORD *)&v21[v22[6]];
  *(_QWORD *)&v20[v22[7]] = *(_QWORD *)&v21[v22[7]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_1000193DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000193E8);
}

uint64_t sub_1000193E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  v6 = sub_100002A38(&qword_100024670);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_100002A38(&qword_100024758);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 254)
  {
    v11 = sub_100002A38(&qword_100024630);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(unsigned __int8 *)(a1 + a3[6] + 8);
  if (v13 > 1)
    return (v13 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_1000194BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000194C8);
}

uint64_t sub_1000194C8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_100002A38(&qword_100024670);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_100002A38(&qword_100024758);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 254)
      {
        *(_BYTE *)(a1 + a4[6] + 8) = -(char)a2;
        return result;
      }
      v10 = sub_100002A38(&qword_100024630);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for RectangularWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000255E0;
  if (!qword_1000255E0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RectangularWidgetView);
  return result;
}

void sub_1000195D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[4];

  sub_10000517C(319, &qword_1000246E0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000517C(319, (unint64_t *)&unk_1000247D0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v8[2] = "\t";
      sub_10000517C(319, (unint64_t *)&unk_1000246E8, type metadata accessor for DocumentEntry, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 4, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_1000196C8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001E2E4, 1);
}

uint64_t sub_1000196D8@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  __int128 v51;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD v63[3];

  v60 = a3;
  v61 = a4;
  v57 = a2;
  v62 = a5;
  v6 = sub_100002A38(&qword_1000250B8);
  __chkstk_darwin(v6);
  v8 = (char **)((char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for WidgetFamily(0);
  v54 = *(_QWORD *)(v9 - 8);
  v55 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100002A38(&qword_100024630);
  __chkstk_darwin(v12);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100002A38(&qword_100025620);
  v58 = *(_QWORD *)(v18 - 8);
  v59 = v18;
  __chkstk_darwin(v18);
  v53 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_100002A38(&qword_100025628);
  __chkstk_darwin(v56);
  v21 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for RectangularWidgetView(0);
  sub_100009704(a1 + *(int *)(v22 + 28), (uint64_t)v14);
  v23 = type metadata accessor for DocumentEntry(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v14, 1, v23) == 1)
  {
    v24 = sub_100004A5C((uint64_t)v14, &qword_100024630);
    v25 = 0;
  }
  else
  {
    v25 = *(void **)&v14[*(int *)(v23 + 28)];
    v26 = v25;
    v24 = sub_100004190((uint64_t)v14, type metadata accessor for DocumentEntry);
  }
  GeometryProxy.size.getter(v24);
  v28 = v27;
  v29 = sub_1000036E0((uint64_t)v11);
  v30 = static Alignment.topLeading.getter(v29);
  v32 = v31;
  KeyPath = swift_getKeyPath(&unk_10001BD50);
  *v8 = swift_getKeyPath(&unk_10001BD78);
  v34 = sub_100002A38(&qword_1000250B0);
  swift_storeEnumTagMultiPayload(v8, v34, 0);
  v35 = v11;
  v36 = swift_getKeyPath(&unk_10001BDA8);
  *(_QWORD *)v17 = KeyPath;
  v17[8] = 0;
  sub_1000056E8((uint64_t)v8, (uint64_t)&v17[v15[5]], &qword_1000250B8);
  v37 = &v17[v15[6]];
  *(_QWORD *)v37 = v36;
  v37[8] = 0;
  *(_QWORD *)&v17[v15[7]] = v25;
  *(_QWORD *)&v17[v15[8]] = v28;
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(&v17[v15[9]], v35, v55);
  v17[v15[10]] = v57 & 1;
  v38 = (uint64_t *)&v17[v15[11]];
  *v38 = v30;
  v38[1] = v32;
  v39 = &v17[v15[12]];
  *(_QWORD *)v39 = 0x3E6E69616C703CLL;
  *((_QWORD *)v39 + 1) = 0xE700000000000000;
  v40 = &v17[v15[13]];
  *(_QWORD *)v40 = 0x3E6E69616C702F3CLL;
  *((_QWORD *)v40 + 1) = 0xE800000000000000;
  v41 = &v17[v15[14]];
  *(_QWORD *)v41 = 1701869940;
  *((_QWORD *)v41 + 1) = 0xE400000000000000;
  v42 = &v17[v15[15]];
  *(_QWORD *)v42 = 1954047348;
  *((_QWORD *)v42 + 1) = 0xE400000000000000;
  v43 = &v17[v15[16]];
  *(_QWORD *)v43 = 1954047348;
  *((_QWORD *)v43 + 1) = 0xE400000000000000;
  v44 = &v17[v15[17]];
  *(_QWORD *)v44 = 0x736B72616DLL;
  *((_QWORD *)v44 + 1) = 0xE500000000000000;
  v45 = &v17[v15[18]];
  *(_QWORD *)v45 = 0x6F43746E65636361;
  *((_QWORD *)v45 + 1) = 0xEB00000000726F6CLL;
  v46 = sub_100019EE0();
  v47 = v53;
  View.widgetAccentable(_:)(1, v15, v46);
  sub_100004190((uint64_t)v17, type metadata accessor for TitleView);
  _FrameLayout.init(width:height:alignment:)(v63, 0, 1, 0, 1, v60, v61);
  v49 = v58;
  v48 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v21, v47, v59);
  v50 = &v21[*(int *)(v56 + 36)];
  v51 = v63[1];
  *(_OWORD *)v50 = v63[0];
  *((_OWORD *)v50 + 1) = v51;
  *((_OWORD *)v50 + 2) = v63[2];
  (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v48);
  return sub_1000056E8((uint64_t)v21, v62, &qword_100025628);
}

uint64_t sub_100019B50@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Alignment.top.getter(v7);
  v10 = v9;
  sub_100019C20(v2, (uint64_t)v6);
  v11 = *(unsigned __int8 *)(v4 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = v12 + v5;
  v14 = swift_allocObject(&unk_1000217E0, (v13 & 0xFFFFFFFFFFFFFFF8) + 24, v11 | 7);
  v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + v14;
  result = sub_100019E24((uint64_t)v6, v14 + v12);
  *(_BYTE *)(v14 + v13) = 1;
  *(_QWORD *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v10;
  *a2 = sub_100019E68;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v14;
  return result;
}

uint64_t sub_100019C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RectangularWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019C64()
{
  uint64_t v0;
  int *v1;
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
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = (int *)type metadata accessor for RectangularWidgetView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100002A38(&qword_1000245E0);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)v6 + v1[5]);
  v10 = sub_100002A38(&qword_1000245F0);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }
  sub_100005220(*(_QWORD *)((char *)v6 + v1[6]), *((_BYTE *)v6 + v1[6] + 8));
  v12 = (char *)v6 + v1[7];
  v13 = (int *)type metadata accessor for DocumentEntry(0);
  if (!(*(unsigned int (**)(char *, uint64_t, int *))(*((_QWORD *)v13 - 1) + 48))(v12, 1, v13))
  {
    v14 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v12, v14);
    v15 = &v12[v13[5]];
    v16 = type metadata accessor for TimelineEntryRelevance(0);
    v17 = *(_QWORD *)(v16 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);

  }
  return swift_deallocObject(v0, ((v4 + v5) & 0xFFFFFFFFFFFFFFF8) + 24, v3 | 7);
}

uint64_t sub_100019E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RectangularWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019E68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for RectangularWidgetView(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1000196D8(v1 + v4, *(unsigned __int8 *)(v1 + v4 + *(_QWORD *)(v3 + 64)), *(_QWORD *)(((v4 + *(_QWORD *)(v3 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(_QWORD *)(((v4 + *(_QWORD *)(v3 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 16), a1);
}

unint64_t sub_100019EE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025630;
  if (!qword_100025630)
  {
    v1 = type metadata accessor for TitleView(255);
    result = swift_getWitnessTable(&unk_10001B934, v1);
    atomic_store(result, (unint64_t *)&qword_100025630);
  }
  return result;
}

unint64_t sub_100019F2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025638;
  if (!qword_100025638)
  {
    v1 = sub_100003038(&qword_100025640);
    result = swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100025638);
  }
  return result;
}

uint64_t sub_100019F78()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC10TipsWidgetP33_44F0B6B1E07788A552A37FEAC2B7ED1519ResourceBundleClass);
}
