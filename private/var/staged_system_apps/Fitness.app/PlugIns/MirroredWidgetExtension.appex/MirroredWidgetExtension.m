ValueMetadata *type metadata accessor for MirroredWidgetLiveActivity()
{
  return &type metadata for MirroredWidgetLiveActivity;
}

uint64_t sub_10000326C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000D8CC, 1);
}

uint64_t sub_10000327C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_1000032C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = type metadata accessor for MirroredWidgetAttributes(0);
  v1 = type metadata accessor for MirroredLockScreenView(0);
  v2 = sub_100003388(&qword_1000140E8, (uint64_t (*)(uint64_t))&type metadata accessor for MirroredWidgetAttributes, (uint64_t)&protocol conformance descriptor for MirroredWidgetAttributes);
  v3 = sub_100003388(&qword_1000140F0, type metadata accessor for MirroredLockScreenView, (uint64_t)"a7");
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)(v0, sub_10000327C, 0, sub_1000032BC, 0, v0, v1, v2, v3);
}

uint64_t sub_100003388(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000033C8(uint64_t *a1)
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

unint64_t sub_10000340C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014100;
  if (!qword_100014100)
  {
    v1 = sub_100003458(&qword_100014108);
    result = swift_getWitnessTable(&protocol conformance descriptor for ActivityConfiguration<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100014100);
  }
  return result;
}

uint64_t sub_100003458(uint64_t *a1)
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

__n128 initializeWithTake for WidgetButtonStyle(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000034AC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000034CC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100014110)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100010A40);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100014110);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutTypeGlyph(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for WorkoutTypeGlyph(uint64_t a1)
{

}

uint64_t initializeWithCopy for WorkoutTypeGlyph(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = v3;
  return a1;
}

_QWORD *assignWithCopy for WorkoutTypeGlyph(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 initializeWithTake for WorkoutTypeGlyph(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for WorkoutTypeGlyph(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutTypeGlyph(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutTypeGlyph(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutTypeGlyph()
{
  return &type metadata for WorkoutTypeGlyph;
}

uint64_t sub_1000036F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000D93C, 1);
}

uint64_t sub_100003704@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v9;
  uint64_t v10;
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  Swift::String v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  char v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  __int128 v77;

  v61 = a2;
  v9 = type metadata accessor for Image.ResizingMode(0);
  v10 = *(_QWORD *)(v9 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000033C8(&qword_100014120);
  v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  v60 = (uint64_t)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v57 = (char *)&v57 - v16;
  __chkstk_darwin(v15);
  v59 = (uint64_t)&v57 - v17;
  v18 = sub_1000033C8(&qword_100014128);
  v19 = __chkstk_darwin(v18);
  v58 = (uint64_t)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v57 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v57 - v24;
  if (!(id)FIUICircularWorkoutGradientImageWithGoal(0, a3))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v26 = ((uint64_t (*)(void))Image.init(uiImage:))();
  v73 = v26;
  v27 = objc_msgSend(a1, "localizedName");
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v30 = v29;

  v62 = v28;
  v63 = v30;
  v31 = sub_100003D40();
  View.accessibilityLabel<A>(_:)(&v62, &type metadata for Image, &type metadata for String, &protocol witness table for Image, v31);
  swift_release(v26);
  swift_bridgeObjectRelease(v30);
  sub_100003F90((uint64_t)v23, (uint64_t)v25, &qword_100014128);
  v32 = (id)FIUIStaticScalableWorkoutIconImage(a1);
  if (v32)
  {
    v33 = v32;
    v34 = objc_msgSend(v32, "imageWithRenderingMode:", 2);

    v35 = Image.init(uiImage:)(v34);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v9);
    a1 = (void *)Image.resizable(capInsets:resizingMode:)(v12, v35, 0.0, 0.0, 0.0, 0.0);
    swift_release(v35);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v36 = objc_msgSend((id)objc_opt_self(ARUIMetricColors), "metricColorsForGoalTypeIdentifier:", 0);
    v37 = objc_msgSend(v36, "nonGradientTextColor");

    if (v37)
    {
      v38 = Color.init(_:)(v37);
      KeyPath = swift_getKeyPath(&unk_10000D018);
      v40 = static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)(&v73, *(_QWORD *)&a4, 0, *(_QWORD *)&a5, 0, v40, v41);
      v62 = (unint64_t)a1;
      v63 = 0;
      v64 = 1;
      v65 = KeyPath;
      v66 = v38;
      v67 = v73;
      v68 = v74;
      v69 = v75;
      v70 = v76;
      v71 = v77;
      v72 = 1;
      v42 = sub_1000033C8(&qword_100014138);
      v43 = sub_100003D8C();
      v44 = (uint64_t)v57;
      View.accessibilityHidden(_:)(1, v42, v43);
      swift_release(v38);
      swift_release(KeyPath);
      swift_release(a1);
      v45 = v59;
      sub_100003F90(v44, v59, &qword_100014120);
      v46 = v58;
      sub_100003FD4((uint64_t)v25, v58, &qword_100014128);
      v47 = v60;
      sub_100003FD4(v45, v60, &qword_100014120);
      v48 = v61;
      sub_100003FD4(v46, v61, &qword_100014128);
      v49 = sub_1000033C8(&qword_100014190);
      sub_100003FD4(v47, v48 + *(int *)(v49 + 48), &qword_100014120);
      sub_100004018(v45, &qword_100014120);
      sub_100004018((uint64_t)v25, &qword_100014128);
      sub_100004018(v47, &qword_100014120);
      return sub_100004018(v46, &qword_100014128);
    }
    goto LABEL_6;
  }
LABEL_7:
  v62 = 0;
  v63 = 0xE000000000000000;
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease(v63);
  v62 = 0xD000000000000027;
  v63 = 0x800000010000F660;
  v51 = a1;
  v52 = objc_msgSend(v51, "description");
  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v55 = v54;

  v56._countAndFlagsBits = v53;
  v56._object = v55;
  String.append(_:)(v56);

  swift_bridgeObjectRelease(v55);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v62, v63, "MirroredWidgetExtension/WorkoutTypeGlyph.swift", 46, 2, 20, 0);
  __break(1u);
  return result;
}

uint64_t sub_100003CB8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100003CD0@<X0>(_QWORD *a1@<X8>)
{
  double *v1;
  double v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = (void *)*((_QWORD *)v1 + 1);
  v5 = v1[2];
  v6 = v1[3];
  *a1 = static Alignment.center.getter();
  a1[1] = v7;
  v8 = sub_1000033C8(&qword_100014118);
  return sub_100003704(v4, (uint64_t)a1 + *(int *)(v8 + 44), v3, v5, v6);
}

unint64_t sub_100003D40()
{
  unint64_t result;

  result = qword_100014130;
  if (!qword_100014130)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100014130);
  }
  return result;
}

unint64_t sub_100003D8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014140;
  if (!qword_100014140)
  {
    v1 = sub_100003458(&qword_100014138);
    sub_100003DF8();
    sub_100003F4C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014140);
  }
  return result;
}

unint64_t sub_100003DF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014148;
  if (!qword_100014148)
  {
    v1 = sub_100003458(&qword_100014150);
    sub_100003E64();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014148);
  }
  return result;
}

unint64_t sub_100003E64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014158;
  if (!qword_100014158)
  {
    v1 = sub_100003458(&qword_100014160);
    sub_100003EE8();
    sub_100004080(&qword_100014178, &qword_100014180, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014158);
  }
  return result;
}

unint64_t sub_100003EE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014168;
  if (!qword_100014168)
  {
    v1 = sub_100003458(&qword_100014170);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014168);
  }
  return result;
}

unint64_t sub_100003F4C()
{
  unint64_t result;

  result = qword_100014188;
  if (!qword_100014188)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _FlipForRTLEffect, &type metadata for _FlipForRTLEffect);
    atomic_store(result, (unint64_t *)&qword_100014188);
  }
  return result;
}

uint64_t sub_100003F90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003FD4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033C8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100004018(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000033C8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004054()
{
  return sub_100004080(&qword_100014198, &qword_1000141A0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t sub_100004080(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003458(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000040C4()
{
  unint64_t result;

  result = qword_1000141A8;
  if (!qword_1000141A8)
  {
    result = swift_getWitnessTable(&unk_10000D078, &type metadata for ResumeMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141A8);
  }
  return result;
}

unint64_t sub_10000410C()
{
  unint64_t result;

  result = qword_1000141B0;
  if (!qword_1000141B0)
  {
    result = swift_getWitnessTable(&unk_10000D0A0, &type metadata for ResumeMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141B0);
  }
  return result;
}

unint64_t sub_100004154()
{
  unint64_t result;

  result = qword_1000141B8;
  if (!qword_1000141B8)
  {
    result = swift_getWitnessTable(&unk_10000D130, &type metadata for ResumeMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141B8);
  }
  return result;
}

unint64_t sub_10000419C()
{
  unint64_t result;

  result = qword_1000141C0;
  if (!qword_1000141C0)
  {
    result = swift_getWitnessTable(&unk_10000D158, &type metadata for ResumeMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141C0);
  }
  return result;
}

uint64_t sub_1000041E0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000DA08, 1);
}

uint64_t sub_1000041F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004AC4(a1, a2, a3, (uint64_t (*)(void))sub_10000410C);
}

uint64_t sub_1000041FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = type metadata accessor for DataLinkCommand(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v27 - v9;
  v11 = type metadata accessor for Logger(0);
  v32 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static WOLog.dataLink.getter(v12);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16 = v15(v10, a1, v4);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(12, -1);
    v31 = a2;
    v20 = (uint8_t *)v19;
    v29 = swift_slowAlloc(32, -1);
    v34 = v29;
    v30 = v11;
    *(_DWORD *)v20 = 136315138;
    v28 = v20 + 4;
    v15(v8, (uint64_t)v10, v4);
    v21 = String.init<A>(describing:)(v8, v4);
    v23 = v22;
    v33 = sub_100004D94(v21, v22, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v28, v20 + 12);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "We should never have been requested to run command %s, it should have routed to the app.", v20, 0xCu);
    v24 = v29;
    swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v25 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v30);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);

    v25 = (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v14, v11);
  }
  return static IntentResult.result<>()(v25);
}

uint64_t sub_100004460(uint64_t a1)
{
  return sub_100004B28(a1, qword_100014788, 0xD000000000000017, 0x800000010000F920);
}

uint64_t sub_100004484@<X0>(uint64_t a1@<X8>)
{
  return sub_1000047A8(&qword_1000140D0, (uint64_t)qword_100014788, (uint64_t)sub_100004460, a1);
}

uint64_t sub_1000044A8()
{
  return 0;
}

uint64_t sub_1000044B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = type metadata accessor for DataLinkCommand(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100004518, 0, 0);
}

uint64_t sub_100004518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100004580, v2, v3);
}

uint64_t sub_100004580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 48));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.resume(_:), v2);
  sub_1000041FC(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004604(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000410C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100004630()
{
  unint64_t result;

  result = qword_1000141D0;
  if (!qword_1000141D0)
  {
    result = swift_getWitnessTable(&unk_10000D19C, &type metadata for PauseMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141D0);
  }
  return result;
}

unint64_t sub_100004678()
{
  unint64_t result;

  result = qword_1000141D8;
  if (!qword_1000141D8)
  {
    result = swift_getWitnessTable(&unk_10000D1C4, &type metadata for PauseMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141D8);
  }
  return result;
}

unint64_t sub_1000046C0()
{
  unint64_t result;

  result = qword_1000141E0;
  if (!qword_1000141E0)
  {
    result = swift_getWitnessTable(&unk_10000D254, &type metadata for PauseMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141E0);
  }
  return result;
}

unint64_t sub_100004708()
{
  unint64_t result;

  result = qword_1000141E8;
  if (!qword_1000141E8)
  {
    result = swift_getWitnessTable(&unk_10000D27C, &type metadata for PauseMirroredWorkout);
    atomic_store(result, (unint64_t *)&qword_1000141E8);
  }
  return result;
}

uint64_t sub_10000474C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000D9E0, 1);
}

uint64_t sub_10000475C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004AC4(a1, a2, a3, (uint64_t (*)(void))sub_100004678);
}

uint64_t sub_100004768(uint64_t a1)
{
  return sub_100004B28(a1, qword_1000147A0, 0xD000000000000016, 0x800000010000F900);
}

uint64_t sub_10000478C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000047A8(&qword_1000140D8, (uint64_t)qword_1000147A0, (uint64_t)sub_100004768, a1);
}

uint64_t sub_1000047A8@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = sub_100005434(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_100004814(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = type metadata accessor for DataLinkCommand(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100004874, 0, 0);
}

uint64_t sub_100004874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000048DC, v2, v3);
}

uint64_t sub_1000048DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 48));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.pause(_:), v2);
  sub_1000041FC(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004960(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004678();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000498C()
{
  unint64_t result;

  result = qword_1000141F8;
  if (!qword_1000141F8)
  {
    result = swift_getWitnessTable(&unk_10000D2C0, &type metadata for MarkMirroredSegment);
    atomic_store(result, (unint64_t *)&qword_1000141F8);
  }
  return result;
}

unint64_t sub_1000049D4()
{
  unint64_t result;

  result = qword_100014200;
  if (!qword_100014200)
  {
    result = swift_getWitnessTable(&unk_10000D2E8, &type metadata for MarkMirroredSegment);
    atomic_store(result, (unint64_t *)&qword_100014200);
  }
  return result;
}

unint64_t sub_100004A1C()
{
  unint64_t result;

  result = qword_100014208;
  if (!qword_100014208)
  {
    result = swift_getWitnessTable(&unk_10000D378, &type metadata for MarkMirroredSegment);
    atomic_store(result, (unint64_t *)&qword_100014208);
  }
  return result;
}

unint64_t sub_100004A64()
{
  unint64_t result;

  result = qword_100014210;
  if (!qword_100014210)
  {
    result = swift_getWitnessTable(&unk_10000D3A0, &type metadata for MarkMirroredSegment);
    atomic_store(result, (unint64_t *)&qword_100014210);
  }
  return result;
}

uint64_t sub_100004AA8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000D9B8, 1);
}

uint64_t sub_100004AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004AC4(a1, a2, a3, (uint64_t (*)(void))sub_1000049D4);
}

uint64_t sub_100004AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a4();
  return swift_getOpaqueTypeConformance2(v5, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100004B04(uint64_t a1)
{
  return sub_100004B28(a1, qword_1000147B8, 0xD000000000000015, 0x800000010000F8E0);
}

uint64_t sub_100004B28(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for LocalizedStringResource(0);
  sub_10000544C(v7, a2);
  sub_100005434(v7, (uint64_t)a2);
  return LocalizedStringResource.init(stringLiteral:)(a3, a4);
}

uint64_t sub_100004B84@<X0>(uint64_t a1@<X8>)
{
  return sub_1000047A8(&qword_1000140E0, (uint64_t)qword_1000147B8, (uint64_t)sub_100004B04, a1);
}

uint64_t sub_100004BA0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = type metadata accessor for DataLinkCommand(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100004C00, 0, 0);
}

uint64_t sub_100004C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100004C68, v2, v3);
}

uint64_t sub_100004C68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 48));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, enum case for DataLinkCommand.markSegment(_:), v2);
  sub_1000041FC(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004CEC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000049D4();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MarkMirroredSegment()
{
  return &type metadata for MarkMirroredSegment;
}

ValueMetadata *type metadata accessor for PauseMirroredWorkout()
{
  return &type metadata for PauseMirroredWorkout;
}

ValueMetadata *type metadata accessor for ResumeMirroredWorkout()
{
  return &type metadata for ResumeMirroredWorkout;
}

unint64_t sub_100004D48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014220;
  if (!qword_100014220)
  {
    v1 = sub_100003458(&qword_100014228);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100014220);
  }
  return result;
}

uint64_t sub_100004D94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100004E64(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000053F4((uint64_t)v12, *a3);
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
      sub_1000053F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000053D4(v12);
  return v7;
}

uint64_t sub_100004E64(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000501C(a5, a6);
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

uint64_t sub_10000501C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000050B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005288(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005288(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000050B0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005224(v4, 0);
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

_QWORD *sub_100005224(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000033C8(&qword_100014230);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005288(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000033C8(&qword_100014230);
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

uint64_t sub_1000053D4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000053F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005434(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10000544C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000548C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;

  v2 = sub_1000033C8(&qword_100014238);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v21 - v6;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v21 - v14;
  v16 = Date.init()(v13);
  WorkoutStatePublisher.workoutStartDate.getter(v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100005B10((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v15, v8);
  }
  else
  {
    v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    v19 = WorkoutStatePublisher.pauseTimes.getter(v18);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
    Date.offset(until:pauseTimes:lastUnbalancedPauseStart:)(v15, v19, v5);
    swift_bridgeObjectRelease(v19);
    sub_100005B10((uint64_t)v5);
    v20 = *(void (**)(char *, uint64_t))(v9 + 8);
    v20(v12, v8);
    return ((uint64_t (*)(char *, uint64_t))v20)(v15, v8);
  }
}

uint64_t sub_100005634@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  char *v34;
  int *v35;
  id v36;
  id v37;
  void *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t result;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  Swift::String v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  __int128 v62;
  ValueMetadata *v63;
  unint64_t v64;

  v56 = a2;
  v3 = sub_1000033C8(&qword_100014238);
  __chkstk_darwin(v3);
  v58 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MirroredWidgetAttributes.ContentState(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v57 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v55 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v55 - v12;
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v55 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)&v55 - v18;
  v20 = sub_1000033C8(&qword_1000140F8);
  v21 = ((uint64_t (*)(void))ActivityViewContext.state.getter)();
  v22 = MirroredWidgetAttributes.ContentState.workoutState.getter(v21);
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24 = v13;
  v25 = v56;
  v23(v24, v5);
  sub_10000548C((uint64_t)v19);
  swift_release(v22);
  v59 = v15;
  v60 = v19;
  v26 = v19;
  v27 = v5;
  v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v28(v25, v26, v14);
  v61 = a1;
  v29 = ActivityViewContext.state.getter(v20);
  v30 = MirroredWidgetAttributes.ContentState.workoutState.getter(v29);
  v31 = ((uint64_t (*)(char *, uint64_t))v23)(v11, v27);
  v32 = WorkoutStatePublisher.activityType.getter(v31);
  if (v32)
  {
    v33 = (id)v32;
    v34 = v25;
  }
  else
  {
    v34 = v25;
    v33 = objc_msgSend(objc_allocWithZone((Class)FIUIWorkoutActivityType), "initWithActivityTypeIdentifier:isIndoor:", 13, 0);
  }
  swift_release(v30);
  v35 = (int *)type metadata accessor for DecodedContext(0);
  *(_QWORD *)&v34[v35[5]] = v33;
  v36 = v33;
  v37 = (id)FIUIStaticScalableWorkoutIconImage(v36);
  if (v37)
  {
    v38 = v37;

    *(_QWORD *)&v34[v35[6]] = v38;
    v56 = v38;
    v39 = v57;
    v40 = v61;
    v41 = ActivityViewContext.state.getter(v20);
    v42 = MirroredWidgetAttributes.ContentState.workoutState.getter(v41);
    v43 = ((uint64_t (*)(char *, uint64_t))v23)(v39, v27);
    v44 = (uint64_t)v58;
    WorkoutStatePublisher.lastUnbalancedPauseStart.getter(v43);
    swift_release(v42);
    v45 = v59;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v44, 1, v14) == 1)
    {
      sub_100005B10(v44);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(&v34[v35[7]], 1, 1, v14);
      v63 = &type metadata for PauseMirroredWorkout;
      v64 = sub_100004678();

      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v40, v20);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v60, v14);
    }
    else
    {
      v46 = v55;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v55, v44, v14);
      v47 = &v34[v35[7]];
      v28(v47, v46, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v47, 0, 1, v14);
      v63 = &type metadata for ResumeMirroredWorkout;
      v64 = sub_10000410C();

      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v40, v20);
      v48 = *(void (**)(char *, uint64_t))(v45 + 8);
      v48(v46, v14);
      v48(v60, v14);
    }
    return sub_100005B50(&v62, (uint64_t)&v34[v35[8]]);
  }
  else
  {
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(41);
    swift_bridgeObjectRelease(*((_QWORD *)&v62 + 1));
    *(_QWORD *)&v62 = 0xD000000000000027;
    *((_QWORD *)&v62 + 1) = 0x800000010000F970;
    v50 = objc_msgSend(v36, "description");
    v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v53 = v52;

    v54._countAndFlagsBits = v51;
    v54._object = v53;
    String.append(_:)(v54);

    swift_bridgeObjectRelease(v53);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v62, *((_QWORD *)&v62 + 1), "MirroredWidgetExtension/DecodedContext.swift", 44, 2, 59, 0);
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DecodedContext(uint64_t a1)
{
  uint64_t result;

  result = qword_100014298;
  if (!qword_100014298)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DecodedContext);
  return result;
}

uint64_t sub_100005B10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033C8(&qword_100014238);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005B50(__int128 *a1, uint64_t a2)
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

uint64_t *sub_100005B68(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v21);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = a3[6];
    v12 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v12;
    v13 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v13;
    v14 = a3[7];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v18 = v12;
    v19 = v13;
    if (v17(v16, 1, v7))
    {
      v20 = sub_1000033C8(&qword_100014238);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v15, (uint64_t *)v16, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
    }
    v22 = a3[8];
    v23 = *(_OWORD *)((char *)a2 + v22 + 24);
    *(_OWORD *)((char *)a1 + v22 + 24) = v23;
    (**(void (***)(void))(v23 - 8))();
  }
  return a1;
}

uint64_t sub_100005CB0(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);

  v7 = a1 + a2[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  return sub_1000053D4((_QWORD *)(a1 + a2[8]));
}

char *sub_100005D4C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  unsigned int (*v16)(const void *, uint64_t, uint64_t);
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = a3[6];
  v11 = *(void **)&a2[v9];
  *(_QWORD *)&a1[v9] = v11;
  v12 = *(void **)&a2[v10];
  *(_QWORD *)&a1[v10] = v12;
  v13 = a3[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v17 = v11;
  v18 = v12;
  if (v16(v15, 1, v6))
  {
    v19 = sub_1000033C8(&qword_100014238);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v8(v14, v15, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
  }
  v20 = a3[8];
  v21 = *(_OWORD *)&a2[v20 + 24];
  *(_OWORD *)&a1[v20 + 24] = v21;
  (**(void (***)(void))(v21 - 8))();
  return a1;
}

char *sub_100005E68(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t (*v20)(const void *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = *(void **)&a2[v9];
  v11 = *(void **)&a1[v9];
  *(_QWORD *)&a1[v9] = v10;
  v12 = v10;

  v13 = a3[6];
  v14 = *(void **)&a2[v13];
  v15 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = v14;
  v16 = v14;

  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v21 = v20(&a1[v17], 1, v6);
  v22 = v20(v19, 1, v6);
  if (!v21)
  {
    if (!v22)
    {
      v8(v18, v19, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = sub_1000033C8(&qword_100014238);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v18, v19, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
LABEL_7:
  sub_100005FC8(&a1[a3[8]], &a2[a3[8]]);
  return a1;
}

_QWORD *sub_100005FC8(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

char *sub_100006130(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v10 = a3[7];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    v13 = sub_1000033C8(&qword_100014238);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *((_QWORD *)v15 + 4) = *((_QWORD *)v16 + 4);
  return a1;
}

char *sub_100006234(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t (*v16)(const void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = *(void **)&a1[v9];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];

  v11 = a3[6];
  v12 = *(void **)&a1[v11];
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];

  v13 = a3[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v17 = v16(&a1[v13], 1, v6);
  v18 = v16(v15, 1, v6);
  if (!v17)
  {
    if (!v18)
    {
      v8(v14, v15, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v19 = sub_1000033C8(&qword_100014238);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v15, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
LABEL_7:
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  sub_1000053D4(&a1[v20]);
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  return a1;
}

uint64_t sub_1000063A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000063AC);
}

uint64_t sub_1000063AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_1000033C8(&qword_100014238);
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_100006458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006464);
}

uint64_t sub_100006464(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_1000033C8(&qword_100014238);
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_10000650C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[5];

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    sub_1000065A8(319);
    if (v5 <= 0x3F)
    {
      v6[3] = *(_QWORD *)(v4 - 8) + 64;
      v6[4] = "(";
      swift_initStructMetadata(a1, 256, 5, v6, a1 + 16);
    }
  }
}

void sub_1000065A8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000142A8)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000142A8);
  }
}

uint64_t sub_1000065FC()
{
  unint64_t v0;

  v0 = sub_1000066C4();
  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for MirroredWidgetLiveActivity, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100006660();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100006660()
{
  unint64_t result;

  result = qword_1000142E8;
  if (!qword_1000142E8)
  {
    result = swift_getWitnessTable(&unk_10000D4C8, &type metadata for MirroredWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_1000142E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MirroredWidgetBundle()
{
  return &type metadata for MirroredWidgetBundle;
}

uint64_t sub_1000066B4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000DA74, 1);
}

unint64_t sub_1000066C4()
{
  unint64_t result;

  result = qword_1000142F0;
  if (!qword_1000142F0)
  {
    result = swift_getWitnessTable(&unk_10000CF3C, &type metadata for MirroredWidgetLiveActivity);
    atomic_store(result, (unint64_t *)&qword_1000142F0);
  }
  return result;
}

uint64_t sub_100006708()
{
  _QWORD v1[2];

  v1[0] = &type metadata for MirroredWidgetLiveActivity;
  v1[1] = sub_1000066C4();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t sub_100006744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  void (*v17)(char *, uint64_t, uint64_t);
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
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = a2;
  v3 = sub_1000033C8(&qword_1000140F8);
  v4 = *(_QWORD *)(v3 - 8);
  v37 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DecodedContext(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v35 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v35 - v15;
  v36 = (uint64_t)&v35 - v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v17(v6, a1, v3);
  sub_100005634((uint64_t)v6, v16);
  sub_100006CC8((uint64_t)v16, (uint64_t)v14);
  v17(v6, a1, v3);
  v18 = *(unsigned __int8 *)(v8 + 80);
  v19 = (v18 + 16) & ~v18;
  v20 = v19 + v9;
  v21 = v18 | 7;
  v22 = *(unsigned __int8 *)(v4 + 80);
  v23 = (v20 + v22) & ~v22;
  v24 = swift_allocObject(&unk_100010CC8, v23 + v37, v21 | v22);
  sub_100006E40((uint64_t)v14, v24 + v19);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v24 + v23, v6, v3);
  v25 = v36;
  sub_100006CC8(v36, (uint64_t)v11);
  v26 = swift_allocObject(&unk_100010CF0, v20, v21);
  sub_100006E40((uint64_t)v11, v26 + v19);
  sub_100006CC8(v25, (uint64_t)v11);
  v27 = swift_allocObject(&unk_100010D18, v20, v21);
  sub_100006E40((uint64_t)v11, v27 + v19);
  sub_100006CC8(v25, (uint64_t)v11);
  v28 = swift_allocObject(&unk_100010D40, v20, v21);
  sub_100006E40((uint64_t)v11, v28 + v19);
  v29 = sub_1000033C8(&qword_1000142F8);
  v30 = sub_1000033C8(&qword_100014300);
  v31 = sub_100004080(&qword_100014308, &qword_1000142F8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v32 = sub_1000094A4();
  v33 = sub_1000094E8();
  DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)(sub_100006E84, v24, sub_1000088FC, v26, sub_100009334, v27, sub_1000088FC, v28, v29, &type metadata for MinimalIconView, v30, &type metadata for MinimalIconView, v31, v32, v33, v32);
  return sub_100009734(v25);
}

uint64_t sub_100006A14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32[16];
  char *v33;
  char *v34;
  char v35[16];
  char *v36;
  char v37[16];
  uint64_t v38;
  char v39[16];
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];

  v30 = a3;
  v31 = sub_1000033C8(&qword_1000143D0);
  v29 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000033C8(&qword_1000143D8);
  v7 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DynamicIslandExpandedRegionPosition(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033C8(&qword_1000143E0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DynamicIslandExpandedRegionPosition.leading.getter(v15);
  v40 = a1;
  v41 = a2;
  v18 = sub_1000033C8(&qword_1000143E8);
  v19 = sub_100004080(&qword_1000143F0, &qword_1000143E8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v20 = DynamicIslandExpandedRegion.init(_:priority:content:)(v12, sub_10000A320, v39, v18, v19, 0.0);
  static DynamicIslandExpandedRegionPosition.trailing.getter(v20);
  v38 = a1;
  v21 = sub_1000033C8(&qword_1000143F8);
  v22 = sub_10000A330();
  DynamicIslandExpandedRegion.init(_:priority:content:)(v12, sub_10000A328, v37, v21, v22, 0.0);
  v36 = v17;
  v23 = sub_1000033C8(&qword_100014458);
  v42[0] = v18;
  v42[1] = v19;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v42, &opaque type descriptor for <<opaque return type of DynamicIslandExpandedRegion._viewRepresentation>>, 1);
  DynamicIslandExpandedContent.init(content:)(sub_10000A670, v35, v23, OpaqueTypeConformance2);
  v33 = v6;
  v34 = v9;
  v25 = sub_1000033C8(&qword_1000142F8);
  v26 = sub_100004080(&qword_100014308, &qword_1000142F8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  DynamicIslandExpandedContent.init(content:)(sub_10000A6A4, v32, v25, v26);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v31);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
}

uint64_t sub_100006CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DecodedContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006D0C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = (int *)type metadata accessor for DecodedContext(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v14 = *(_QWORD *)(v2 + 64);
  v15 = sub_1000033C8(&qword_1000140F8);
  v4 = *(_QWORD *)(v15 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v13 = *(_QWORD *)(v4 + 64);
  v6 = v0 + ((v3 + 16) & ~v3);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);

  v10 = v6 + v1[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v10, 1, v7))
    v9(v10, v7);
  v11 = (((v3 + 16) & ~v3) + v14 + v5) & ~v5;
  sub_1000053D4((_QWORD *)(v6 + v1[8]));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v11, v15);
  return swift_deallocObject(v0, v11 + v13, v3 | v5 | 7);
}

uint64_t sub_100006E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DecodedContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(type metadata accessor for DecodedContext(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000033C8(&qword_1000140F8) - 8) + 80);
  return sub_100006A14(v1 + v4, v1 + ((v5 + v6) & ~v6), a1);
}

uint64_t sub_100006EF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = sub_1000033C8(&qword_100014478);
  return sub_100006F54(a1, a2, a3 + *(int *)(v6 + 44), 50.0);
}

uint64_t sub_100006F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
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
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t OpaqueTypeConformance2;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  id v68;
  Swift::String v69;
  Swift::String v70;
  Swift::String v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  ValueMetadata *v79;
  ValueMetadata *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char v120[16];
  uint64_t v121;
  double v122;
  uint64_t v123;
  ValueMetadata *v124;
  uint64_t v125;
  unint64_t v126;
  Swift::String v127;

  v110 = a2;
  v118 = a3;
  v111 = type metadata accessor for MirroredWidgetAttributes.ContentState(0);
  v109 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v108 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = sub_1000033C8(&qword_100014480);
  v106 = *(_QWORD *)(v112 - 8);
  __chkstk_darwin(v112);
  v105 = (char *)&v98 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033C8(&qword_100014488);
  v114 = *(_QWORD *)(v8 - 8);
  v115 = v8;
  __chkstk_darwin(v8);
  v113 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000033C8(&qword_100014490);
  v11 = __chkstk_darwin(v10);
  v117 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v116 = (uint64_t)&v98 - v13;
  v14 = sub_1000033C8(&qword_100014238);
  __chkstk_darwin(v14);
  v16 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000033C8(&qword_100014498);
  v100 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v19 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_1000033C8(&qword_1000144A0);
  v103 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104);
  v21 = (char *)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1000033C8(&qword_1000144A8);
  v23 = __chkstk_darwin(v22);
  v107 = (uint64_t)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v101 = (char *)&v98 - v26;
  __chkstk_darwin(v25);
  v119 = (uint64_t)&v98 - v27;
  v28 = type metadata accessor for DecodedContext(0);
  v29 = *(int *)(v28 + 32);
  v99 = a1;
  v31 = *(_QWORD *)(a1 + v29 + 24);
  v30 = *(_QWORD *)(a1 + v29 + 32);
  v32 = sub_10000A6AC((_QWORD *)(a1 + v29), v31);
  __chkstk_darwin(v32);
  v34 = (char *)&v98 - v33;
  (*(void (**)(char *))(v35 + 16))((char *)&v98 - v33);
  v121 = a1;
  v122 = a4;
  v36 = sub_1000033C8(&qword_1000144B0);
  v37 = sub_10000A834(&qword_1000144B8, &qword_1000144B0, (void (*)(void))sub_10000A6DC);
  Button.init<A>(intent:label:)(v34, sub_10000A6D0, v120, v36, v31, v37, v30);
  v38 = Color.init(rgbHex:)(16706560);
  v39 = Color.init(rgbHex:)(5196291);
  v123 = v38;
  v124 = (ValueMetadata *)v39;
  v40 = sub_100004080(&qword_100014500, &qword_100014498, (uint64_t)&protocol conformance descriptor for Button<A>);
  v41 = sub_10000A7E4();
  v102 = v21;
  View.buttonStyle<A>(_:)(&v123, v17);
  swift_release(v39);
  swift_release(v38);
  (*(void (**)(char *, uint64_t))(v100 + 8))(v19, v17);
  sub_100003FD4(v99 + *(int *)(v28 + 28), (uint64_t)v16, &qword_100014238);
  v42 = type metadata accessor for Date(0);
  LODWORD(v38) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 48))(v16, 1, v42);
  sub_100004018((uint64_t)v16, &qword_100014238);
  if ((_DWORD)v38 == 1)
  {
    v43 = 0x800000010000F9A0;
    v44 = 0xD000000000000019;
  }
  else
  {
    v44 = 0xD00000000000001ALL;
    v43 = 0x800000010000F9E0;
  }
  v45 = LocalizedStringKey.init(stringLiteral:)(v44, v43);
  v46 = Text.init(_:tableName:bundle:comment:)(v45);
  v48 = v47;
  v50 = v49;
  v52 = v51 & 1;
  v123 = v17;
  v124 = &type metadata for WidgetButtonStyle;
  v125 = v40;
  v126 = v41;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v123, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
  v54 = (uint64_t)v101;
  v55 = v104;
  v56 = v102;
  View.accessibilityLabel(_:)(v46, v48, v52, v50, v104, OpaqueTypeConformance2);
  sub_100009770(v46, v48, v52);
  swift_bridgeObjectRelease(v50);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v56, v55);
  v57 = sub_100003F90(v54, v119, &qword_1000144A8);
  __chkstk_darwin(v57);
  v58 = sub_1000033C8(&qword_100014510);
  v59 = sub_10000A834((unint64_t *)&qword_100014518, &qword_100014510, (void (*)(void))sub_10000A760);
  v60 = sub_1000049D4();
  v61 = v105;
  v62 = Button.init<A>(intent:label:)(v60, sub_10000A828, &v98 - 4, v58, &type metadata for MarkMirroredSegment, v59, v60);
  v63 = static Color.white.getter(v62);
  v64 = Color.init(rgbHex:)(3750199);
  v123 = v63;
  v124 = (ValueMetadata *)v64;
  v65 = sub_100004080(&qword_100014520, &qword_100014480, (uint64_t)&protocol conformance descriptor for Button<A>);
  v66 = v113;
  v67 = v112;
  View.buttonStyle<A>(_:)(&v123, v112);
  swift_release(v64);
  swift_release(v63);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v61, v67);
  v68 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v69._countAndFlagsBits = 0xD00000000000001BLL;
  v127._object = (void *)0xE000000000000000;
  v69._object = (void *)0x800000010000F9C0;
  v70._countAndFlagsBits = 0;
  v70._object = (void *)0xE000000000000000;
  v127._countAndFlagsBits = 0;
  v71 = NSLocalizedString(_:tableName:bundle:value:comment:)(v69, (Swift::String_optional)0, (NSBundle)v68, v70, v127);

  v72 = sub_1000033C8(&qword_100014528);
  v73 = swift_allocObject(v72, 72, 7);
  *(_OWORD *)(v73 + 16) = xmmword_10000D510;
  v74 = sub_1000033C8(&qword_1000140F8);
  v75 = v108;
  v76 = ActivityViewContext.state.getter(v74);
  v77 = MirroredWidgetAttributes.ContentState.segmentIndex.getter(v76);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v75, v111);
  *(_QWORD *)(v73 + 56) = &type metadata for Int;
  *(_QWORD *)(v73 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v73 + 32) = v77;
  v78 = String.init(format:_:)(v71._countAndFlagsBits, v71._object, v73);
  v80 = v79;
  swift_bridgeObjectRelease(v71._object);
  v123 = v78;
  v124 = v80;
  v81 = sub_100003D40();
  v82 = Text.init<A>(_:)(&v123, &type metadata for String, v81);
  v84 = v83;
  v86 = v85;
  v123 = v67;
  v124 = &type metadata for WidgetButtonStyle;
  v125 = v65;
  v88 = v87 & 1;
  v126 = v41;
  v89 = swift_getOpaqueTypeConformance2(&v123, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
  v90 = (uint64_t)v117;
  v91 = v115;
  View.accessibilityLabel(_:)(v82, v84, v88, v86, v115, v89);
  sub_100009770(v82, v84, v88);
  swift_bridgeObjectRelease(v86);
  (*(void (**)(char *, uint64_t))(v114 + 8))(v66, v91);
  v92 = v116;
  sub_100003F90(v90, v116, &qword_100014490);
  v93 = v119;
  v94 = v107;
  sub_100003FD4(v119, v107, &qword_1000144A8);
  sub_100003FD4(v92, v90, &qword_100014490);
  v95 = v118;
  sub_100003FD4(v94, v118, &qword_1000144A8);
  v96 = sub_1000033C8(&qword_100014530);
  sub_100003FD4(v90, v95 + *(int *)(v96 + 48), &qword_100014490);
  sub_100004018(v92, &qword_100014490);
  sub_100004018(v93, &qword_1000144A8);
  sub_100004018(v90, &qword_100014490);
  return sub_100004018(v94, &qword_1000144A8);
}

uint64_t sub_1000078A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[3];

  v36 = a2;
  v34 = sub_1000033C8(&qword_1000144F8);
  __chkstk_darwin(v34);
  v6 = (uint64_t *)((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for Image.Scale(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033C8(&qword_100014238);
  __chkstk_darwin(v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_1000033C8(&qword_1000144C8);
  __chkstk_darwin(v33);
  v15 = (uint64_t *)((char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v35 = sub_1000033C8(&qword_1000144B0);
  __chkstk_darwin(v35);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DecodedContext(0);
  sub_100003FD4(a1 + *(int *)(v18 + 28), (uint64_t)v13, &qword_100014238);
  v19 = type metadata accessor for Date(0);
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v13, 1, v19);
  sub_100004018((uint64_t)v13, &qword_100014238);
  if (v20 == 1)
    v21 = 0x69662E6573756170;
  else
    v21 = 0x6C632E776F727261;
  if (v20 == 1)
    v22 = 0xEA00000000006C6CLL;
  else
    v22 = 0xEF657369776B636FLL;
  v23 = Image.init(systemName:)(v21, v22);
  v24 = static Font.largeTitle.getter();
  KeyPath = swift_getKeyPath(&unk_10000D5D0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Image.Scale.small(_:), v7);
  v26 = swift_getKeyPath(&unk_10000D600);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v34 + 28), v10, v7);
  *v6 = v26;
  sub_100003FD4((uint64_t)v6, (uint64_t)v15 + *(int *)(v33 + 36), &qword_1000144F8);
  *v15 = v23;
  v15[1] = KeyPath;
  v15[2] = v24;
  swift_retain(v23);
  swift_retain(KeyPath);
  swift_retain(v24);
  sub_100004018((uint64_t)v6, &qword_1000144F8);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release(v24);
  swift_release(KeyPath);
  v27 = swift_release(v23);
  v28 = static Alignment.center.getter(v27);
  _FrameLayout.init(width:height:alignment:)(v37, *(_QWORD *)&a3, 0, *(_QWORD *)&a3, 0, v28, v29);
  sub_100003FD4((uint64_t)v15, (uint64_t)v17, &qword_1000144C8);
  v30 = &v17[*(int *)(v35 + 36)];
  v31 = v37[1];
  *(_OWORD *)v30 = v37[0];
  *((_OWORD *)v30 + 1) = v31;
  *((_OWORD *)v30 + 2) = v37[2];
  sub_100004018((uint64_t)v15, &qword_1000144C8);
  return sub_100003F90((uint64_t)v17, v36, &qword_1000144B0);
}

double sub_100007C10@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  Swift::String v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  double result;
  _QWORD v30[2];
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;

  v4 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v4);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MirroredWidgetAttributes.ContentState(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = 0;
  v32 = 0xE000000000000000;
  v11 = sub_1000033C8(&qword_1000140F8);
  v12 = ActivityViewContext.state.getter(v11);
  v13 = MirroredWidgetAttributes.ContentState.segmentIndex.getter(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v30[1] = v13;
  v14 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v16 = v15;
  swift_bridgeObjectRelease(v32);
  v31 = v14;
  v32 = v16;
  v17._countAndFlagsBits = 0x656C637269632ELL;
  v17._object = (void *)0xE700000000000000;
  String.append(_:)(v17);
  v18 = Image.init(systemName:)(v31, v32);
  v19 = static Font.Weight.regular.getter();
  v20 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v6, 1, 1, v20);
  v21 = static Font.system(size:weight:design:)(*(_QWORD *)&v19, 0, v6, 30.0);
  sub_100004018((uint64_t)v6, &qword_1000143A8);
  KeyPath = swift_getKeyPath(&unk_10000D5D0);
  v23 = static Alignment.center.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v31, *(_QWORD *)&a2, 0, *(_QWORD *)&a2, 0, v23, v24);
  v25 = v31;
  v26 = v32;
  v27 = v33;
  v28 = v34;
  *(_QWORD *)a1 = v18;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_QWORD *)(a1 + 16) = v21;
  *(_QWORD *)(a1 + 24) = v25;
  *(_BYTE *)(a1 + 32) = v26;
  *(_QWORD *)(a1 + 40) = v27;
  *(_BYTE *)(a1 + 48) = v28;
  result = *(double *)&v35;
  *(_OWORD *)(a1 + 56) = v35;
  return result;
}

uint64_t sub_100007E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_BYTE *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  _BYTE *v36;
  void (*v37)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  uint64_t v43;
  void (*v44)(_BYTE *, uint64_t);
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  _BYTE *v52;
  _BYTE *v53;
  char v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t KeyPath;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  _BYTE v126[4];
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _BYTE *v131;
  uint64_t v132;
  _BYTE *v133;
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  _BYTE *v138;
  _BYTE *v139;
  _BYTE *v140;
  _BYTE *v141;
  _BYTE *v142;
  _BYTE *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _BYTE *v147;
  _BYTE *v148;
  _BYTE *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t (*v153)(_BYTE *, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  uint64_t v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  uint64_t v167;
  char v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  uint64_t v172;

  v151 = a2;
  v150 = type metadata accessor for ContentTransition(0);
  v136 = *(_QWORD *)(v150 - 8);
  __chkstk_darwin(v150);
  v135 = &v126[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v4);
  v142 = &v126[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1000033C8(&qword_100014238);
  v7 = __chkstk_darwin(v6);
  v148 = &v126[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v141 = &v126[-v9];
  v10 = sub_1000033C8(&qword_1000143B0);
  v11 = __chkstk_darwin(v10);
  v139 = &v126[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v14 = &v126[-v13];
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = &v126[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  v21 = &v126[-v20];
  v137 = sub_1000033C8(&qword_1000143B8);
  v22 = __chkstk_darwin(v137);
  v138 = &v126[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  v140 = &v126[-v24];
  v132 = sub_1000033C8(&qword_100014470);
  v146 = *(_QWORD *)(v132 - 8);
  __chkstk_darwin(v132);
  v143 = &v126[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v144 = sub_1000033C8(&qword_100014430);
  __chkstk_darwin(v144);
  v147 = &v126[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v145 = sub_1000033C8(&qword_100014420);
  __chkstk_darwin(v145);
  v133 = &v126[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v134 = sub_1000033C8(&qword_100014410);
  __chkstk_darwin(v134);
  v149 = &v126[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = sub_1000033C8(&qword_1000143F8);
  __chkstk_darwin(v29);
  v131 = &v126[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v31 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16);
  v154 = a1;
  v32 = v31(v21, a1, v15);
  static Date.distantFuture.getter(v32);
  v33 = sub_100003388(&qword_1000143C8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v34 = v15;
  result = dispatch thunk of static Comparable.<= infix(_:_:)(v21, v19, v15, v33);
  if ((result & 1) != 0)
  {
    v36 = &v14[*(int *)(v10 + 48)];
    v37 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 32);
    v38 = v10;
    v39 = v16;
    v130 = v16;
    v37(v14, v21, v34);
    v37(v36, v19, v34);
    v40 = v21;
    v41 = v139;
    v42 = &v139[*(int *)(v38 + 48)];
    v31(v139, (uint64_t)v14, v34);
    v31(v42, (uint64_t)v36, v34);
    v43 = (uint64_t)v138;
    v37(v138, v41, v34);
    v44 = *(void (**)(_BYTE *, uint64_t))(v39 + 8);
    v44(v42, v34);
    v45 = &v41[*(int *)(v38 + 48)];
    v37(v41, v14, v34);
    v37(v45, v36, v34);
    v37((_BYTE *)(v43 + *(int *)(v137 + 36)), v45, v34);
    v46 = v41;
    v47 = v34;
    v44(v46, v34);
    v153 = (uint64_t (*)(_BYTE *, uint64_t))v44;
    v48 = v140;
    sub_100003F90(v43, (uint64_t)v140, &qword_1000143B8);
    v49 = type metadata accessor for DecodedContext(0);
    v50 = v154;
    v139 = (_BYTE *)(v154 + *(int *)(v49 + 28));
    v51 = v141;
    sub_100003FD4((uint64_t)v139, (uint64_t)v141, &qword_100014238);
    v140 = (_BYTE *)Text.init(timerInterval:pauseTime:countsDown:showsHours:)(v48, v51, 0, 1);
    v138 = v52;
    v141 = v53;
    v55 = v54 & 1;
    Date.init()(v140);
    v56 = Date.timeIntervalSince(_:)(v50);
    v152 = v34;
    v57 = ((uint64_t (*)(_BYTE *, uint64_t))v44)(v40, v34);
    if (v56 < 3600.0)
      v58 = 40.0;
    else
      v58 = 33.0;
    v59 = static Font.Weight.medium.getter(v57);
    v60 = enum case for Font.Design.rounded(_:);
    v61 = type metadata accessor for Font.Design(0);
    v62 = *(_QWORD *)(v61 - 8);
    v63 = (uint64_t)v142;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v62 + 104))(v142, v60, v61);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v61);
    v64 = static Font.system(size:weight:design:)(*(_QWORD *)&v59, 0, v63, v58);
    sub_100004018(v63, &qword_1000143A8);
    v65 = v140;
    v66 = (uint64_t)v138;
    v67 = v141;
    v129 = Text.font(_:)(v64, v140, v138, v55, v141);
    v128 = v68;
    LOBYTE(v63) = v69;
    v137 = v70;
    swift_release(v64);
    v71 = v63 & 1;
    v127 = v63 & 1;
    sub_100009770((uint64_t)v65, v66, v55);
    v72 = swift_bridgeObjectRelease(v67);
    Date.init()(v72);
    v73 = Date.timeIntervalSince(_:)(v50);
    v142 = v40;
    v74 = v153(v40, v47);
    if (v73 < 3600.0)
      v75 = 0x405C400000000000;
    else
      v75 = 0x405F000000000000;
    v76 = static Alignment.center.getter(v74);
    _FrameLayout.init(width:height:alignment:)(&v167, v75, 0, 0x4049000000000000, 0, v76, v77);
    v78 = v167;
    v79 = v168;
    v80 = v169;
    v81 = v170;
    v82 = v171;
    v83 = v172;
    KeyPath = swift_getKeyPath(&unk_10000D540);
    v85 = v129;
    v86 = v128;
    v155 = v129;
    v156 = v128;
    v157 = v71;
    v87 = v137;
    v158 = v137;
    v159 = v78;
    v160 = v79;
    v161 = v80;
    v162 = v81;
    v163 = v82;
    v164 = v83;
    v165 = KeyPath;
    v166 = 2;
    v88 = sub_1000033C8(&qword_100014438);
    v89 = sub_10000A588();
    v90 = v143;
    View.monospacedDigit()(v88, v89);
    sub_100009770(v85, v86, v127);
    swift_release(KeyPath);
    swift_bridgeObjectRelease(v87);
    v91 = v148;
    sub_100003FD4((uint64_t)v139, (uint64_t)v148, &qword_100014238);
    LODWORD(KeyPath) = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v130 + 48))(v91, 1, v152);
    v92 = sub_100004018((uint64_t)v91, &qword_100014238);
    v93 = v90;
    if ((_DWORD)KeyPath == 1)
    {
      v94 = Color.init(rgbHex:)(16706560);
    }
    else
    {
      v95 = static Color.gray.getter(v92);
      v94 = Color.opacity(_:)(0.78);
      swift_release(v95);
    }
    v96 = v136;
    v97 = v135;
    v98 = v134;
    v99 = (uint64_t)v133;
    v100 = v132;
    v101 = swift_getKeyPath(&unk_10000D570);
    v102 = v146;
    v103 = (uint64_t)v147;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v146 + 16))(v147, v93, v100);
    v104 = (uint64_t *)(v103 + *(int *)(v144 + 36));
    *v104 = v101;
    v104[1] = v94;
    v105 = (*(uint64_t (**)(_BYTE *, uint64_t))(v102 + 8))(v93, v100);
    v106 = static Color.black.getter(v105);
    LOBYTE(v101) = static Edge.Set.all.getter();
    sub_100003FD4(v103, v99, &qword_100014430);
    v107 = v99 + *(int *)(v145 + 36);
    *(_QWORD *)v107 = v106;
    *(_BYTE *)(v107 + 8) = v101;
    v108 = sub_100004018(v103, &qword_100014430);
    static ContentTransition.identity.getter(v108);
    v109 = swift_getKeyPath(&unk_10000D5A0);
    v110 = (uint64_t)v149;
    v111 = (uint64_t *)&v149[*(int *)(v98 + 36)];
    v112 = sub_1000033C8(&qword_100014398);
    v113 = v150;
    (*(void (**)(char *, _BYTE *, uint64_t))(v96 + 16))((char *)v111 + *(int *)(v112 + 28), v97, v150);
    *v111 = v109;
    sub_100003FD4(v99, v110, &qword_100014420);
    (*(void (**)(_BYTE *, uint64_t))(v96 + 8))(v97, v113);
    v114 = sub_100004018(v99, &qword_100014420);
    v115 = v142;
    Date.init()(v114);
    v116 = Date.timeIntervalSince(_:)(v154);
    v117 = v153(v115, v152);
    result = (uint64_t)(id)AXDurationStringForDuration(v117, v116);
    v118 = v151;
    if (result)
    {
      v119 = (void *)result;
      v120 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v122 = v121;

      v155 = v120;
      v156 = v122;
      v123 = sub_10000A3B4();
      v124 = sub_100003D40();
      v125 = (uint64_t)v131;
      View.accessibilityLabel<A>(_:)(&v155, v98, &type metadata for String, v123, v124);
      swift_bridgeObjectRelease(v122);
      sub_100004018(v110, &qword_100014410);
      return sub_100003F90(v125, v118, &qword_1000143F8);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100008900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t result;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t KeyPath;
  char *v71;
  double v72;
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
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t (*v134)(char *, uint64_t);
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  char v147;
  __int128 v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  char v152;
  __int128 v153;

  v133 = type metadata accessor for ContentTransition(0);
  v121 = *(_QWORD *)(v133 - 8);
  __chkstk_darwin(v133);
  v120 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v5);
  v126 = (char *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000033C8(&qword_100014238);
  v8 = __chkstk_darwin(v7);
  v131 = (uint64_t)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v125 = (uint64_t)&v114 - v10;
  v11 = sub_1000033C8(&qword_1000143B0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v114 - v15;
  v17 = type metadata accessor for Date(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v114 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v114 - v22;
  v122 = sub_1000033C8(&qword_1000143B8);
  v24 = __chkstk_darwin(v122);
  v123 = (char *)&v114 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v124 = (uint64_t)&v114 - v26;
  v118 = sub_1000033C8(&qword_1000143C0);
  v117 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118);
  v136 = (char *)&v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = sub_1000033C8(&qword_100014348);
  __chkstk_darwin(v127);
  v129 = (char *)&v114 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = sub_1000033C8(&qword_100014338);
  __chkstk_darwin(v128);
  v130 = (uint64_t)&v114 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_1000033C8(&qword_100014328);
  __chkstk_darwin(v132);
  v119 = (char *)&v114 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_1000033C8(&qword_100014300);
  __chkstk_darwin(v31);
  v116 = (char *)&v114 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v18;
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v137 = a1;
  v35 = v34(v23, a1, v17);
  static Date.distantFuture.getter(v35);
  v36 = sub_100003388(&qword_1000143C8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v37 = v23;
  result = dispatch thunk of static Comparable.<= infix(_:_:)(v23, v21, v17, v36);
  if ((result & 1) != 0)
  {
    v115 = a2;
    v39 = &v16[*(int *)(v11 + 48)];
    v40 = v33;
    v41 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
    v42 = v11;
    v43 = v40;
    v114 = v40;
    v135 = v37;
    v41(v16, v37, v17);
    v41(v39, v21, v17);
    v44 = &v14[*(int *)(v42 + 48)];
    v34(v14, (uint64_t)v16, v17);
    v34(v44, (uint64_t)v39, v17);
    v45 = (uint64_t)v123;
    v41(v123, v14, v17);
    v46 = *(void (**)(char *, uint64_t))(v43 + 8);
    v46(v44, v17);
    v134 = (uint64_t (*)(char *, uint64_t))v46;
    v47 = &v14[*(int *)(v42 + 48)];
    v41(v14, v16, v17);
    v41(v47, v39, v17);
    v41((char *)(v45 + *(int *)(v122 + 36)), v47, v17);
    v46(v14, v17);
    v48 = v124;
    sub_100003F90(v45, v124, &qword_1000143B8);
    v123 = (char *)(v137 + *(int *)(type metadata accessor for DecodedContext(0) + 28));
    v49 = v125;
    sub_100003FD4((uint64_t)v123, v125, &qword_100014238);
    v50 = Text.init(timerInterval:pauseTime:countsDown:showsHours:)(v48, v49, 0, 1);
    v52 = v51;
    v54 = v53;
    v56 = v55 & 1;
    v57 = static Font.Weight.semibold.getter();
    v58 = enum case for Font.Design.rounded(_:);
    v59 = type metadata accessor for Font.Design(0);
    v60 = *(_QWORD *)(v59 - 8);
    v61 = (uint64_t)v126;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 104))(v126, v58, v59);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v60 + 56))(v61, 0, 1, v59);
    v62 = static Font.system(size:weight:design:)(*(_QWORD *)&v57, 0, v61, 16.0);
    sub_100004018(v61, &qword_1000143A8);
    v63 = Text.font(_:)(v62, v50, v52, v56, v54);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    swift_release(v62);
    sub_100009770(v50, v52, v56);
    swift_bridgeObjectRelease(v54);
    KeyPath = swift_getKeyPath(&unk_10000D540);
    v71 = v135;
    Date.init()(KeyPath);
    v72 = Date.timeIntervalSince(_:)(v137);
    v73 = v134(v71, v17);
    if (v72 < 3600.0)
      v74 = 0x4048000000000000;
    else
      v74 = 0x404F800000000000;
    v75 = static Alignment.center.getter(v73);
    _FrameLayout.init(width:height:alignment:)(&v149, v74, 0, 0, 1, v75, v76);
    v138 = v63;
    v139 = v65;
    v140 = v67 & 1;
    v141 = v69;
    v142 = KeyPath;
    v143 = 2;
    v144 = v149;
    v145 = v150;
    v146 = v151;
    v147 = v152;
    v148 = v153;
    v77 = sub_1000033C8(&qword_100014350);
    v78 = sub_100009694();
    View.monospacedDigit()(v77, v78);
    sub_100009770(v63, v65, v67 & 1);
    swift_release(KeyPath);
    swift_bridgeObjectRelease(v69);
    v79 = v131;
    sub_100003FD4((uint64_t)v123, v131, &qword_100014238);
    LODWORD(v77) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v114 + 48))(v79, 1, v17);
    v80 = sub_100004018(v79, &qword_100014238);
    if ((_DWORD)v77 == 1)
    {
      v81 = Color.init(rgbHex:)(16706560);
    }
    else
    {
      v82 = static Color.gray.getter(v80);
      v81 = Color.opacity(_:)(0.78);
      swift_release(v82);
    }
    v83 = v121;
    v84 = v120;
    v85 = (uint64_t)v119;
    v86 = v118;
    v87 = v117;
    v88 = swift_getKeyPath(&unk_10000D570);
    v89 = (uint64_t)v129;
    v90 = v136;
    (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v129, v136, v86);
    v91 = (uint64_t *)(v89 + *(int *)(v127 + 36));
    *v91 = v88;
    v91[1] = v81;
    v92 = (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v90, v86);
    v93 = static Color.black.getter(v92);
    LOBYTE(v88) = static Edge.Set.all.getter();
    v94 = v130;
    sub_100003FD4(v89, v130, &qword_100014348);
    v95 = v94 + *(int *)(v128 + 36);
    *(_QWORD *)v95 = v93;
    *(_BYTE *)(v95 + 8) = v88;
    v96 = sub_100004018(v89, &qword_100014348);
    static ContentTransition.identity.getter(v96);
    v97 = swift_getKeyPath(&unk_10000D5A0);
    v98 = v132;
    v99 = (uint64_t *)(v85 + *(int *)(v132 + 36));
    v100 = sub_1000033C8(&qword_100014398);
    v101 = v133;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))((char *)v99 + *(int *)(v100 + 28), v84, v133);
    *v99 = v97;
    sub_100003FD4(v94, v85, &qword_100014338);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v101);
    v102 = sub_100004018(v94, &qword_100014338);
    v103 = v135;
    Date.init()(v102);
    v104 = Date.timeIntervalSince(_:)(v137);
    v105 = v134(v103, v17);
    result = (uint64_t)(id)AXDurationStringForDuration(v105, v104);
    v106 = v115;
    if (result)
    {
      v107 = (void *)result;
      v108 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v110 = v109;

      v138 = v108;
      v139 = v110;
      v111 = sub_10000956C();
      v112 = sub_100003D40();
      v113 = (uint64_t)v116;
      View.accessibilityLabel<A>(_:)(&v138, v98, &type metadata for String, v111, v112);
      swift_bridgeObjectRelease(v110);
      sub_100004018(v85, &qword_100014328);
      return sub_100003F90(v113, v106, &qword_100014300);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DecodedContext(0) - 8) + 80);
  return sub_100008900(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_100009374()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;

  v1 = (int *)type metadata accessor for DecodedContext(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v0 + v4, v6);

  v9 = v0 + v4 + v1[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6))
    v8(v9, v6);
  sub_1000053D4((_QWORD *)(v0 + v4 + v1[8]));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

id sub_100009454@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id result;

  v3 = type metadata accessor for DecodedContext(0);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  result = objc_msgSend(*(id *)(v1 + ((v4 + 16) & ~v4) + *(int *)(v3 + 20)), "isIndoor");
  *a1 = (_BYTE)result;
  return result;
}

unint64_t sub_1000094A4()
{
  unint64_t result;

  result = qword_100014310;
  if (!qword_100014310)
  {
    result = swift_getWitnessTable(&unk_10000D658, &type metadata for MinimalIconView);
    atomic_store(result, (unint64_t *)&qword_100014310);
  }
  return result;
}

unint64_t sub_1000094E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014318;
  if (!qword_100014318)
  {
    v1 = sub_100003458(&qword_100014300);
    sub_10000956C();
    sub_100003388(&qword_1000143A0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014318);
  }
  return result;
}

unint64_t sub_10000956C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014320;
  if (!qword_100014320)
  {
    v1 = sub_100003458(&qword_100014328);
    sub_1000095F0();
    sub_100004080(&qword_100014390, &qword_100014398, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014320);
  }
  return result;
}

unint64_t sub_1000095F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014330;
  if (!qword_100014330)
  {
    v1 = sub_100003458(&qword_100014338);
    sub_10000A4DC(&qword_100014340, &qword_100014348, &qword_100014350, sub_100009694);
    sub_100004080(&qword_100014380, &qword_100014388, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014330);
  }
  return result;
}

uint64_t sub_100009694()
{
  return sub_10000A834(&qword_100014358, &qword_100014350, (void (*)(void))sub_1000096B0);
}

unint64_t sub_1000096B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014360;
  if (!qword_100014360)
  {
    v1 = sub_100003458(&qword_100014368);
    sub_100004080(&qword_100014370, &qword_100014378, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014360);
  }
  return result;
}

uint64_t sub_100009734(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DecodedContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009770(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100009780@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t OpaqueTypeConformance2;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];

  v39 = a2;
  v3 = type metadata accessor for AccessibilityChildBehavior(0);
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033C8(&qword_100014538);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_1000033C8(&qword_100014540);
  __chkstk_darwin(v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000033C8(&qword_100014548);
  v38 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000033C8(&qword_100014550);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
    v19 = 0xD000000000000013;
  else
    v19 = 0xD000000000000014;
  if ((a1 & 1) != 0)
    v20 = 0x800000010000FA50;
  else
    v20 = 0x800000010000FA00;
  *v8 = static Alignment.center.getter(v16);
  v8[1] = v21;
  v22 = sub_1000033C8(&qword_100014558);
  sub_100009AA4(v19, v20, (_QWORD *)((char *)v8 + *(int *)(v22 + 44)), 21.0);
  swift_bridgeObjectRelease(v20);
  sub_100003FD4((uint64_t)v8, (uint64_t)v11, &qword_100014538);
  v11[*(int *)(v9 + 36)] = 1;
  v23 = sub_100004018((uint64_t)v8, &qword_100014538);
  static AccessibilityChildBehavior.combine.getter(v23);
  v24 = sub_10000AABC();
  View.accessibilityElement(children:)(v5, v9, v24);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v37);
  sub_100004018((uint64_t)v11, &qword_100014540);
  v25 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000020, 0x800000010000FA20);
  v26 = Text.init(_:tableName:bundle:comment:)(v25);
  v28 = v27;
  v30 = v29;
  v32 = v31 & 1;
  v40[0] = v9;
  v40[1] = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v40, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  View.accessibilityLabel(_:)(v26, v28, v32, v30, v12, OpaqueTypeConformance2);
  sub_100009770(v26, v28, v32);
  swift_bridgeObjectRelease(v30);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v12);
  return sub_100003F90((uint64_t)v18, v39, &qword_100014550);
}

void sub_100009AA4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t KeyPath;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v44 = a3;
  v46 = sub_1000033C8(&qword_1000144F8);
  __chkstk_darwin(v46);
  v8 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for Image.Scale(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v13);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_1000033C8(&qword_1000144C8);
  __chkstk_darwin(v45);
  v17 = (uint64_t *)((char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = sub_1000033C8(&qword_100014570);
  v18 = __chkstk_darwin(v41);
  v43 = (uint64_t)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v39 - v21;
  __chkstk_darwin(v20);
  v42 = (uint64_t)&v39 - v23;
  v24 = (id)FIUICircularWorkoutGradientImageWithGoal(0, a4);
  if (v24)
  {
    v40 = Image.init(uiImage:)(v24);
    swift_bridgeObjectRetain(a2);
    v25 = Image.init(systemName:)(a1, a2);
    v26 = static Font.Weight.regular.getter();
    v27 = type metadata accessor for Font.Design(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v15, 1, 1, v27);
    v28 = static Font.system(size:weight:design:)(*(_QWORD *)&v26, 0, v15, 10.0);
    sub_100004018((uint64_t)v15, &qword_1000143A8);
    KeyPath = swift_getKeyPath(&unk_10000D5D0);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Image.Scale.medium(_:), v9);
    v30 = swift_getKeyPath(&unk_10000D600);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v46 + 28), v12, v9);
    *v8 = v30;
    sub_100003FD4((uint64_t)v8, (uint64_t)v17 + *(int *)(v45 + 36), &qword_1000144F8);
    *v17 = v25;
    v17[1] = KeyPath;
    v17[2] = v28;
    swift_retain(v25);
    swift_retain(KeyPath);
    swift_retain(v28);
    sub_100004018((uint64_t)v8, &qword_1000144F8);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release(v28);
    swift_release(KeyPath);
    swift_release(v25);
    v31 = objc_msgSend((id)objc_opt_self(ARUIMetricColors), "metricColorsForGoalTypeIdentifier:", 0);
    v32 = objc_msgSend(v31, "nonGradientTextColor");

    if (v32)
    {
      v33 = Color.init(_:)(v32);
      sub_100003FD4((uint64_t)v17, (uint64_t)v22, &qword_1000144C8);
      *(_QWORD *)&v22[*(int *)(v41 + 36)] = v33;
      sub_100004018((uint64_t)v17, &qword_1000144C8);
      v34 = v42;
      sub_100003F90((uint64_t)v22, v42, &qword_100014570);
      v35 = v43;
      sub_100003FD4(v34, v43, &qword_100014570);
      v36 = v44;
      v37 = v40;
      *v44 = v40;
      v38 = sub_1000033C8(&qword_100014578);
      sub_100003FD4(v35, (uint64_t)v36 + *(int *)(v38 + 48), &qword_100014570);
      swift_retain(v37);
      sub_100004018(v34, &qword_100014570);
      sub_100004018(v35, &qword_100014570);
      swift_release(v37);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100009ECC@<X0>(uint64_t a1@<X8>)
{
  char *v1;

  return sub_100009780(*v1, a1);
}

uint64_t sub_100009ED4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  char *v26;

  v26 = a1;
  v1 = sub_1000033C8(&qword_100014460);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v25 - v6;
  v8 = sub_1000033C8(&qword_100014458);
  v25 = *(_QWORD *)(v8 - 8);
  v9 = v25;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v25 - v13;
  v15 = sub_1000033C8(&qword_1000143D0);
  DynamicIslandExpandedContent.content.getter(v15);
  v16 = sub_1000033C8(&qword_1000143D8);
  DynamicIslandExpandedRegion._viewRepresentation.getter(v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v17(v12, v14, v8);
  v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v19 = v2;
  v18(v5, v7, v1);
  v20 = v26;
  v17(v26, v12, v8);
  v21 = sub_1000033C8(&qword_100014468);
  v18(&v20[*(int *)(v21 + 48)], v5, v1);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v7, v1);
  v23 = *(void (**)(char *, uint64_t))(v25 + 8);
  v23(v14, v8);
  v22(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v8);
}

uint64_t sub_10000A0A4()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_10000A0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A178(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ContentTransition, (uint64_t (*)(char *))&EnvironmentValues.contentTransition.setter);
}

uint64_t sub_10000A0D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A100(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10000A128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A150(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000A178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
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

uint64_t sub_10000A1F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A21C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A244(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000A268(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000A28C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A2B4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10000A2DC()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_10000A2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A178(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for ContentTransition, (uint64_t (*)(char *))&EnvironmentValues.contentTransition.setter);
}

uint64_t sub_10000A320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100006EF0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_10000A328@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100007E14(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_10000A330()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014400;
  if (!qword_100014400)
  {
    v1 = sub_100003458(&qword_1000143F8);
    sub_10000A3B4();
    sub_100003388(&qword_1000143A0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014400);
  }
  return result;
}

unint64_t sub_10000A3B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014408;
  if (!qword_100014408)
  {
    v1 = sub_100003458(&qword_100014410);
    sub_10000A438();
    sub_100004080(&qword_100014390, &qword_100014398, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014408);
  }
  return result;
}

unint64_t sub_10000A438()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014418;
  if (!qword_100014418)
  {
    v1 = sub_100003458(&qword_100014420);
    sub_10000A4DC(&qword_100014428, &qword_100014430, &qword_100014438, (uint64_t (*)(void))sub_10000A588);
    sub_100004080(&qword_100014380, &qword_100014388, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014418);
  }
  return result;
}

uint64_t sub_10000A4DC(unint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = sub_100003458(a2);
    v9[0] = sub_100003458(a3);
    v9[1] = a4();
    swift_getOpaqueTypeConformance2(v9, &opaque type descriptor for <<opaque return type of View.monospacedDigit()>>, 1);
    sub_100004080(&qword_100014178, &qword_100014180, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A588()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014440;
  if (!qword_100014440)
  {
    v1 = sub_100003458(&qword_100014438);
    sub_10000A60C();
    sub_100004080(&qword_100014370, &qword_100014378, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014440);
  }
  return result;
}

unint64_t sub_10000A60C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014448;
  if (!qword_100014448)
  {
    v1 = sub_100003458(&qword_100014450);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014448);
  }
  return result;
}

uint64_t sub_10000A670()
{
  uint64_t v0;

  v0 = sub_1000033C8(&qword_1000143E0);
  return DynamicIslandExpandedRegion._viewRepresentation.getter(v0);
}

uint64_t sub_10000A6A4@<X0>(char *a1@<X8>)
{
  return sub_100009ED4(a1);
}

_QWORD *sub_10000A6AC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000A6D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000078A8(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24));
}

unint64_t sub_10000A6DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000144C0;
  if (!qword_1000144C0)
  {
    v1 = sub_100003458(&qword_1000144C8);
    sub_10000A760();
    sub_100004080(&qword_1000144F0, &qword_1000144F8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000144C0);
  }
  return result;
}

unint64_t sub_10000A760()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000144D0;
  if (!qword_1000144D0)
  {
    v1 = sub_100003458(&qword_1000144D8);
    sub_100004080(&qword_1000144E0, &qword_1000144E8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000144D0);
  }
  return result;
}

unint64_t sub_10000A7E4()
{
  unint64_t result;

  result = qword_100014508;
  if (!qword_100014508)
  {
    result = swift_getWitnessTable(&unk_10000D6E4, &type metadata for WidgetButtonStyle);
    atomic_store(result, (unint64_t *)&qword_100014508);
  }
  return result;
}

double sub_10000A828@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100007C10(a1, *(double *)(v1 + 24));
}

uint64_t sub_10000A834(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003458(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A8A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000A8C8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000A8F0()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_10000A910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A178(a1, a2, a3, a4, (void (*)(_QWORD))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

_BYTE *initializeBufferWithCopyOfBuffer for MinimalIconView(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MinimalIconView(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MinimalIconView(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000AA2C + 4 * byte_10000D535[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000AA60 + 4 * byte_10000D530[v4]))();
}

uint64_t sub_10000AA60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AA68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000AA70);
  return result;
}

uint64_t sub_10000AA7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000AA84);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000AA88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AA90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MinimalIconView()
{
  return &type metadata for MinimalIconView;
}

uint64_t sub_10000AAAC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000DAB8, 1);
}

unint64_t sub_10000AABC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014560;
  if (!qword_100014560)
  {
    v1 = sub_100003458(&qword_100014540);
    sub_100004080(&qword_100014568, &qword_100014538, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    sub_100003F4C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014560);
  }
  return result;
}

unint64_t sub_10000AB44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100014580;
  if (!qword_100014580)
  {
    v1 = sub_100003458(&qword_100014550);
    v2[0] = sub_100003458(&qword_100014540);
    v2[1] = sub_10000AABC();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100003388(&qword_1000143A0, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014580);
  }
  return result;
}

uint64_t destroy for WidgetButtonStyle(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s23MirroredWidgetExtension17WidgetButtonStyleVwCP_0(uint64_t *a1, uint64_t *a2)
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

uint64_t *assignWithCopy for WidgetButtonStyle(uint64_t *a1, uint64_t *a2)
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

_QWORD *assignWithTake for WidgetButtonStyle(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetButtonStyle(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WidgetButtonStyle(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WidgetButtonStyle()
{
  return &type metadata for WidgetButtonStyle;
}

uint64_t sub_10000AD7C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000DAFC, 1);
}

uint64_t sub_10000AD8C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  double v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  double v22;
  uint64_t v23;
  char v24;
  char *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a1;
  v30 = a2;
  v2 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033C8(&qword_100014588);
  __chkstk_darwin(v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000033C8(&qword_100014590);
  __chkstk_darwin(v28);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1000033C8(&qword_100014598);
  v11 = __chkstk_darwin(v27);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = ButtonStyleConfiguration.label.getter(v11);
  v15 = ButtonStyleConfiguration.isPressed.getter(v14);
  v16 = 0.15;
  if ((v15 & 1) == 0)
    v16 = 1.0;
  v17 = Color.opacity(_:)(v16);
  KeyPath = swift_getKeyPath(&unk_10000D720);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  v19 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  *v19 = KeyPath;
  v19[1] = v17;
  v20 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v21 = ButtonStyleConfiguration.isPressed.getter(v20);
  v22 = 0.6;
  if ((v21 & 1) == 0)
    v22 = 1.0;
  v23 = Color.opacity(_:)(v22);
  v24 = static Edge.Set.all.getter();
  sub_100003FD4((uint64_t)v8, (uint64_t)v10, &qword_100014588);
  v25 = &v10[*(int *)(v28 + 36)];
  *(_QWORD *)v25 = v23;
  v25[8] = v24;
  sub_100004018((uint64_t)v8, &qword_100014588);
  sub_100003FD4((uint64_t)v10, (uint64_t)v13, &qword_100014590);
  *(_WORD *)&v13[*(int *)(v27 + 36)] = 256;
  sub_100004018((uint64_t)v10, &qword_100014590);
  return sub_10000AFF0((uint64_t)v13, v30);
}

uint64_t sub_10000AFE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000AD8C(*(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_10000AFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_100014598);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B03C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000145A0;
  if (!qword_1000145A0)
  {
    v1 = sub_100003458(&qword_100014598);
    sub_10000B0C0();
    sub_100004080(&qword_1000145C0, &qword_1000145C8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000145A0);
  }
  return result;
}

unint64_t sub_10000B0C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000145A8;
  if (!qword_1000145A8)
  {
    v1 = sub_100003458(&qword_100014590);
    sub_10000B144();
    sub_100004080(&qword_100014380, &qword_100014388, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000145A8);
  }
  return result;
}

unint64_t sub_10000B144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000145B0;
  if (!qword_1000145B0)
  {
    v1 = sub_100003458(&qword_100014588);
    sub_10000B1C8();
    sub_100004080(&qword_100014178, &qword_100014180, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000145B0);
  }
  return result;
}

unint64_t sub_10000B1C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000145B8;
  if (!qword_1000145B8)
  {
    v1 = type metadata accessor for ButtonStyleConfiguration.Label(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ButtonStyleConfiguration.Label, v1);
    atomic_store(result, (unint64_t *)&qword_1000145B8);
  }
  return result;
}

uint64_t sub_10000B210(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_10000B250(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033C8(&qword_1000140F8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_10000B288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000B2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000B318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000B360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000B3A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B3B4);
}

uint64_t sub_10000B3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_10000B3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B400);
}

uint64_t sub_10000B400(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033C8(&qword_1000140F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MirroredLockScreenView(uint64_t a1)
{
  uint64_t result;

  result = qword_100014628;
  if (!qword_100014628)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MirroredLockScreenView);
  return result;
}

void sub_10000B480(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_10000B4E8(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_10000B4E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_100014638)
  {
    v2 = type metadata accessor for MirroredWidgetAttributes(255);
    v3 = sub_100003388(&qword_1000140E8, (uint64_t (*)(uint64_t))&type metadata accessor for MirroredWidgetAttributes, (uint64_t)&protocol conformance descriptor for MirroredWidgetAttributes);
    v4 = type metadata accessor for ActivityViewContext(a1, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_100014638);
  }
}

uint64_t sub_10000B560(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000DB4C, 1);
}

uint64_t sub_10000B570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t KeyPath;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = a1;
  v1 = type metadata accessor for ContentTransition(0);
  v52 = *(_QWORD *)(v1 - 8);
  v53 = v1;
  __chkstk_darwin(v1);
  v51 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000033C8(&qword_100014668);
  __chkstk_darwin(v3);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1000033C8(&qword_100014670);
  __chkstk_darwin(v46);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1000033C8(&qword_100014678);
  __chkstk_darwin(v47);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000033C8(&qword_100014680);
  v49 = *(_QWORD *)(v10 - 8);
  v50 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_1000033C8(&qword_100014688);
  __chkstk_darwin(v48);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000033C8(&qword_1000140F8);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for DecodedContext(0);
  __chkstk_darwin(v19);
  v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v45, v15);
  sub_100005634((uint64_t)v18, v21);
  v22 = FIUIIconSize(*(_QWORD *)&v21[*(int *)(v19 + 20)], 3);
  v24 = v23;
  *(_QWORD *)v5 = static VerticalAlignment.center.getter();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v25 = sub_1000033C8(&qword_100014690);
  v26 = sub_10000B984((uint64_t)v21, (double *)&v5[*(int *)(v25 + 44)], 48.0, v22, v24, 30.0);
  LOBYTE(v18) = static Edge.Set.all.getter(v26);
  sub_100003FD4((uint64_t)v5, (uint64_t)v7, &qword_100014668);
  v27 = &v7[*(int *)(v46 + 36)];
  *v27 = (char)v18;
  *(_OWORD *)(v27 + 8) = 0u;
  *(_OWORD *)(v27 + 24) = 0u;
  v27[40] = 1;
  v28 = sub_100004018((uint64_t)v5, &qword_100014668);
  v29 = static Color.black.getter(v28);
  LOBYTE(v18) = static Edge.Set.all.getter(v29);
  sub_100003FD4((uint64_t)v7, (uint64_t)v9, &qword_100014670);
  v30 = v47;
  v31 = &v9[*(int *)(v47 + 36)];
  *(_QWORD *)v31 = v29;
  v31[8] = (char)v18;
  v32 = sub_100004018((uint64_t)v7, &qword_100014670);
  v33 = static Color.black.getter(v32);
  v34 = sub_10000C45C();
  View.activityBackgroundTint(_:)(v33, v30, v34);
  swift_release(v33);
  v35 = sub_100004018((uint64_t)v9, &qword_100014678);
  v36 = v51;
  static ContentTransition.identity.getter(v35);
  KeyPath = swift_getKeyPath(&unk_10000D7D8);
  v38 = (uint64_t *)&v14[*(int *)(v48 + 36)];
  v39 = sub_1000033C8(&qword_100014398);
  v41 = v52;
  v40 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))((char *)v38 + *(int *)(v39 + 28), v36, v53);
  *v38 = KeyPath;
  v43 = v49;
  v42 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v14, v12, v50);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v40);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v42);
  sub_100003F90((uint64_t)v14, v54, &qword_100014688);
  return sub_100009734((uint64_t)v21);
}

uint64_t sub_10000B984@<X0>(uint64_t a1@<X0>, double *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t result;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  double v62;
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
  char v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  char v86;
  char v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  void (*v107)(char *, char *, uint64_t);
  double *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  uint64_t v118;
  char *v119;
  id v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double *v130;
  char *v131;
  uint64_t v132;
  uint64_t KeyPath;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  _QWORD v137[5];

  v130 = a2;
  v11 = sub_1000033C8(&qword_100014480);
  v127 = *(_QWORD *)(v11 - 8);
  v128 = v11;
  __chkstk_darwin(v11);
  v126 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_1000033C8(&qword_100014488);
  v129 = *(_QWORD *)(v132 - 8);
  v13 = __chkstk_darwin(v132);
  v131 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v136 = (char *)&v118 - v15;
  v16 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v16);
  v124 = (char *)&v118 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1000033C8(&qword_100014238);
  v19 = __chkstk_darwin(v18);
  v125 = (uint64_t)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v123 = (uint64_t)&v118 - v21;
  v22 = sub_1000033C8(&qword_1000143B0);
  v23 = __chkstk_darwin(v22);
  v25 = (char *)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v27 = (char *)&v118 - v26;
  v28 = type metadata accessor for Date(0);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = __chkstk_darwin(v28);
  v32 = (char *)&v118 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v34 = (char *)&v118 - v33;
  v121 = sub_1000033C8(&qword_1000143B8);
  v35 = __chkstk_darwin(v121);
  v122 = (char *)&v118 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  v38 = (char *)&v118 - v37;
  v39 = type metadata accessor for DecodedContext(0);
  KeyPath = v29;
  v134 = v39;
  v40 = *(void **)(a1 + *(int *)(v39 + 20));
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v135 = a1;
  v41(v34, a1, v28);
  v42 = v40;
  static Date.distantFuture.getter(v42);
  v43 = sub_100003388(&qword_1000143C8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  result = dispatch thunk of static Comparable.<= infix(_:_:)(v34, v32, v28, v43);
  if ((result & 1) != 0)
  {
    v120 = v42;
    v45 = &v27[*(int *)(v22 + 48)];
    v46 = *(void (**)(char *, char *, uint64_t))(KeyPath + 32);
    v119 = v38;
    v47 = v22;
    v48 = KeyPath;
    v46(v27, v34, v28);
    v46(v45, v32, v28);
    v49 = &v25[*(int *)(v47 + 48)];
    v41(v25, (uint64_t)v27, v28);
    v41(v49, (uint64_t)v45, v28);
    v50 = (uint64_t)v122;
    v46(v122, v25, v28);
    v51 = *(void (**)(char *, uint64_t))(v48 + 8);
    v51(v49, v28);
    v52 = &v25[*(int *)(v47 + 48)];
    v46(v25, v27, v28);
    v46(v52, v45, v28);
    v46((char *)(v50 + *(int *)(v121 + 36)), v52, v28);
    v51(v25, v28);
    v53 = (uint64_t)v119;
    sub_100003F90(v50, (uint64_t)v119, &qword_1000143B8);
    v122 = (char *)(v135 + *(int *)(v134 + 28));
    v54 = v123;
    sub_100003FD4((uint64_t)v122, v123, &qword_100014238);
    v55 = Text.init(timerInterval:pauseTime:countsDown:showsHours:)(v53, v54, 0, 1);
    v57 = v56;
    v59 = v58;
    v61 = v60 & 1;
    v62 = static Font.Weight.medium.getter(v55);
    v63 = enum case for Font.Design.rounded(_:);
    v64 = type metadata accessor for Font.Design(0);
    v65 = *(_QWORD *)(v64 - 8);
    v66 = (uint64_t)v124;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 104))(v124, v63, v64);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v64);
    v67 = static Font.system(size:weight:design:)(*(_QWORD *)&v62, 0, v66, 38.0);
    sub_100004018(v66, &qword_1000143A8);
    v68 = Font.monospacedDigit()(v67);
    swift_release(v67);
    v69 = Font.lowercaseSmallCaps()(v68);
    swift_release(v68);
    v70 = Text.font(_:)(v69, v55, v57, v61, v59);
    v72 = v71;
    v74 = v73;
    v76 = v75;
    swift_release(v69);
    sub_100009770(v55, v57, v61);
    swift_bridgeObjectRelease(v59);
    v77 = v125;
    sub_100003FD4((uint64_t)v122, v125, &qword_100014238);
    v78 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(KeyPath + 48))(v77, 1, v28);
    v79 = sub_100004018(v77, &qword_100014238);
    v80 = v135;
    if (v78 == 1)
    {
      v81 = Color.init(rgbHex:)(16706560);
    }
    else
    {
      v82 = static Color.gray.getter(v79);
      v81 = Color.opacity(_:)(0.78);
      swift_release(v82);
    }
    v83 = v74 & 1;
    v123 = Text.foregroundColor(_:)(v81, v70, v72, v74 & 1, v76);
    v124 = v84;
    v125 = v85;
    v87 = v86;
    swift_release(v81);
    LODWORD(v122) = v87 & 1;
    sub_100009770(v70, v72, v83);
    swift_bridgeObjectRelease(v76);
    KeyPath = swift_getKeyPath(&unk_10000D808);
    v88 = (_QWORD *)(v80 + *(int *)(v134 + 32));
    v89 = v88[3];
    v90 = v88[4];
    v91 = sub_10000A6AC(v88, v89);
    __chkstk_darwin(v91);
    v93 = (char *)&v118 - v92;
    v95 = (*(uint64_t (**)(char *))(v94 + 16))((char *)&v118 - v92);
    __chkstk_darwin(v95);
    *(&v118 - 4) = v80;
    *((double *)&v118 - 3) = a6;
    *((double *)&v118 - 2) = a3;
    v96 = sub_1000033C8(&qword_100014510);
    v97 = sub_10000C580();
    v98 = v126;
    v99 = Button.init<A>(intent:label:)(v93, sub_10000C574, &v118 - 6, v96, v89, v97, v90);
    v100 = static Color.white.getter(v99);
    v101 = Color.init(rgbHex:)(3750199);
    v137[0] = v100;
    v137[1] = v101;
    sub_100004080(&qword_100014520, &qword_100014480, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_10000A7E4();
    v102 = v131;
    v103 = v128;
    View.buttonStyle<A>(_:)(v137, v128);
    swift_release(v101);
    swift_release(v100);
    (*(void (**)(char *, uint64_t))(v127 + 8))(v98, v103);
    v104 = v129;
    v105 = v136;
    v106 = v132;
    (*(void (**)(char *, char *, uint64_t))(v129 + 32))(v136, v102, v132);
    v107 = *(void (**)(char *, char *, uint64_t))(v104 + 16);
    v107(v102, v105, v106);
    v108 = v130;
    *v130 = a3;
    v109 = v120;
    *((_QWORD *)v108 + 1) = v120;
    v108[2] = a4;
    v108[3] = a5;
    v108[4] = 0.0;
    *((_BYTE *)v108 + 40) = 1;
    v110 = v123;
    v111 = (uint64_t)v124;
    v112 = v125;
    *((_QWORD *)v108 + 6) = v123;
    *((_QWORD *)v108 + 7) = v111;
    LOBYTE(v105) = (_BYTE)v122;
    *((_BYTE *)v108 + 64) = (_BYTE)v122;
    v113 = KeyPath;
    *((_QWORD *)v108 + 9) = v112;
    *((_QWORD *)v108 + 10) = v113;
    *((_BYTE *)v108 + 88) = 1;
    v108[12] = 0.0;
    *((_BYTE *)v108 + 104) = 1;
    v114 = sub_1000033C8(&qword_1000146B0);
    v107((char *)v108 + *(int *)(v114 + 96), v102, v106);
    v115 = v109;
    sub_10000C5EC(v110, v111, (char)v105);
    v116 = *(void (**)(char *, uint64_t))(v104 + 8);
    swift_bridgeObjectRetain(v112);
    v117 = KeyPath;
    swift_retain(KeyPath);
    v116(v136, v106);
    v116(v102, v106);
    sub_100009770(v110, v111, (char)v105);

    swift_release(v117);
    return swift_bridgeObjectRelease(v112);
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_10000C254@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  double result;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  __int128 v35;

  v8 = sub_1000033C8(&qword_1000143A8);
  __chkstk_darwin(v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033C8(&qword_100014238);
  __chkstk_darwin(v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DecodedContext(0);
  sub_100003FD4(a1 + *(int *)(v14 + 28), (uint64_t)v13, &qword_100014238);
  v15 = type metadata accessor for Date(0);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v13, 1, v15);
  sub_100004018((uint64_t)v13, &qword_100014238);
  if (v16 == 1)
    v17 = 0x69662E6573756170;
  else
    v17 = 0x6C69662E79616C70;
  if (v16 == 1)
    v18 = 0xEA00000000006C6CLL;
  else
    v18 = 0xE90000000000006CLL;
  v19 = Image.init(systemName:)(v17, v18);
  v20 = static Font.Weight.thin.getter();
  v21 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v10, 1, 1, v21);
  v22 = static Font.system(size:weight:design:)(*(_QWORD *)&v20, 0, v10, a3);
  sub_100004018((uint64_t)v10, &qword_1000143A8);
  KeyPath = swift_getKeyPath(&unk_10000D838);
  v24 = static Alignment.center.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v31, *(_QWORD *)&a4, 0, *(_QWORD *)&a4, 0, v24, v25);
  v26 = v31;
  v27 = v32;
  v28 = v33;
  v29 = v34;
  *(_QWORD *)a2 = v19;
  *(_QWORD *)(a2 + 8) = KeyPath;
  *(_QWORD *)(a2 + 16) = v22;
  *(_QWORD *)(a2 + 24) = v26;
  *(_BYTE *)(a2 + 32) = v27;
  *(_QWORD *)(a2 + 40) = v28;
  *(_BYTE *)(a2 + 48) = v29;
  result = *(double *)&v35;
  *(_OWORD *)(a2 + 56) = v35;
  return result;
}

unint64_t sub_10000C45C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014698;
  if (!qword_100014698)
  {
    v1 = sub_100003458(&qword_100014678);
    sub_10000C4E0();
    sub_100004080(&qword_100014380, &qword_100014388, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014698);
  }
  return result;
}

unint64_t sub_10000C4E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000146A0;
  if (!qword_1000146A0)
  {
    v1 = sub_100003458(&qword_100014670);
    sub_100004080(&qword_1000146A8, &qword_100014668, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000146A0);
  }
  return result;
}

double sub_10000C574@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000C254(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_10000C580()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014518;
  if (!qword_100014518)
  {
    v1 = sub_100003458(&qword_100014510);
    sub_10000A760();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100014518);
  }
  return result;
}

uint64_t sub_10000C5EC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_10000C608()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000146B8;
  if (!qword_1000146B8)
  {
    v1 = sub_100003458(&qword_100014688);
    v2[0] = sub_100003458(&qword_100014678);
    v2[1] = sub_10000C45C();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.activityBackgroundTint(_:)>>, 1);
    sub_100004080(&qword_100014390, &qword_100014398, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000146B8);
  }
  return result;
}

uint64_t sub_10000C6B4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC23MirroredWidgetExtensionP33_0F86F2DB1BBC3808023611EE46ACC7E919ResourceBundleClass);
}
