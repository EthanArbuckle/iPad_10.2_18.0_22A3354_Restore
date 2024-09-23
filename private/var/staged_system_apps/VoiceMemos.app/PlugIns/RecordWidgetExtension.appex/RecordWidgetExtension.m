unint64_t sub_100004E24()
{
  unint64_t result;

  result = qword_10000C118;
  if (!qword_10000C118)
  {
    result = swift_getWitnessTable(&unk_1000074D0, &type metadata for RCControlCenterToggleRecording);
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100004E6C()
{
  unint64_t result;

  result = qword_10000C120;
  if (!qword_10000C120)
  {
    result = swift_getWitnessTable(&unk_1000074F8, &type metadata for RCControlCenterToggleRecording);
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100004EB4()
{
  unint64_t result;

  result = qword_10000C128;
  if (!qword_10000C128)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

uint64_t sub_100004EF8()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100005B78(v0, qword_10000C2E8);
  sub_100005B60(v0, (uint64_t)qword_10000C2E8);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000002CLL, 0x8000000100007A80);
}

uint64_t sub_100004F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[13] = a2;
  v3[14] = a3;
  v3[12] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[15] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[16] = v5;
  v3[17] = v6;
  return swift_task_switch(sub_100004FC8, v5, v6);
}

uint64_t sub_100004FC8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  int *v7;
  int *v9;

  v1 = IntentParameter.wrappedValue.getter(v0 + 22);
  if (*((_BYTE *)v0 + 176) == 1)
  {
    AppDependency.wrappedValue.getter(v1);
    v2 = v0[10];
    v3 = v0[11];
    sub_100005B1C(v0 + 7, v2);
    v4 = *(int **)(v3 + 8);
    v9 = (int *)((char *)v4 + *v4);
    v5 = (_QWORD *)swift_task_alloc(v4[1]);
    v0[18] = v5;
    v6 = sub_1000050BC;
  }
  else
  {
    AppDependency.wrappedValue.getter(v1);
    v2 = v0[5];
    v3 = v0[6];
    sub_100005B1C(v0 + 2, v2);
    v7 = *(int **)(v3 + 16);
    v9 = (int *)((char *)v7 + *v7);
    v5 = (_QWORD *)swift_task_alloc(v7[1]);
    v0[20] = v5;
    v6 = sub_100005164;
  }
  *v5 = v0;
  v5[1] = v6;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))v9)(v0[13], v0[14], v2, v3);
}

uint64_t sub_1000050BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 144);
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000520C;
  else
    v4 = sub_10000511C;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136));
}

uint64_t sub_10000511C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release(*(_QWORD *)(v0 + 120));
  v1 = sub_100005B40((_QWORD *)(v0 + 56));
  static IntentResult.result<>()(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005164()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 160);
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000524C;
  else
    v4 = sub_1000051C4;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136));
}

uint64_t sub_1000051C4()
{
  uint64_t v0;
  uint64_t v1;

  swift_release(*(_QWORD *)(v0 + 120));
  v1 = sub_100005B40((_QWORD *)(v0 + 16));
  static IntentResult.result<>()(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000520C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 120));
  sub_100005B40((_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000524C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 120));
  sub_100005B40((_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_10000528C@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000052C4(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_1000052F8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100005340;
}

void sub_100005340(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100005374()
{
  unint64_t result;

  result = qword_10000C130;
  if (!qword_10000C130)
  {
    result = swift_getWitnessTable(&unk_100007588, &type metadata for RCControlCenterToggleRecording);
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_1000053BC()
{
  unint64_t result;

  result = qword_10000C138;
  if (!qword_10000C138)
  {
    result = swift_getWitnessTable(&unk_1000075B0, &type metadata for RCControlCenterToggleRecording);
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_100005400(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000792C, 1);
}

uint64_t sub_100005410(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100004E6C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100005450@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C110 != -1)
    swift_once(&qword_10000C110, sub_100004EF8);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100005B60(v2, (uint64_t)qword_10000C2E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000054C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = enum case for IntentAuthenticationPolicy.alwaysAllowed(_:);
  v3 = type metadata accessor for IntentAuthenticationPolicy(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_100005508()
{
  return 0;
}

uint64_t sub_100005518(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10000C184);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000557C;
  return sub_100004F58(a1, v5, v4);
}

uint64_t sub_10000557C()
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

uint64_t sub_1000055C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000583C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000055E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004E6C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for RCControlCenterToggleRecording(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

_QWORD *_s21RecordWidgetExtension30RCControlCenterToggleRecordingVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for RCControlCenterToggleRecording(uint64_t *a1, uint64_t *a2)
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

__n128 initializeWithTake for RCControlCenterToggleRecording(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for RCControlCenterToggleRecording(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RCControlCenterToggleRecording(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RCControlCenterToggleRecording(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RCControlCenterToggleRecording()
{
  return &type metadata for RCControlCenterToggleRecording;
}

unint64_t sub_1000057AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C148;
  if (!qword_10000C148)
  {
    v1 = sub_1000057F8(&qword_10000C150);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

uint64_t sub_1000057F8(uint64_t *a1)
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

uint64_t sub_10000583C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  uint64_t v17;
  _QWORD v20[2];
  _QWORD v21[5];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v20[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005ADC(&qword_10000C158);
  __chkstk_darwin();
  v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005ADC(&qword_10000C160);
  __chkstk_darwin();
  v7 = (char *)&v20[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005ADC(&qword_10000C168);
  __chkstk_darwin();
  v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v20[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005ADC(&qword_10000C170);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000002FLL, 0x8000000100007A20);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  LOBYTE(v21[0]) = 2;
  v14 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
  v15 = type metadata accessor for IntentDialog(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v5, 1, 1, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v16 = IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v13, v9, v21, v7, v5, v3);
  sub_100005ADC(&qword_10000C178);
  v20[0] = 0xD00000000000002FLL;
  v20[1] = 0x8000000100007A50;
  AnyHashable.init<A>(_:)(v21, v20, &type metadata for String, &protocol witness table for String);
  type metadata accessor for AppDependencyManager(0);
  v17 = static AppDependencyManager.shared.getter();
  AppDependency.__allocating_init(key:manager:)(v21, v17);
  return v16;
}

uint64_t sub_100005ADC(uint64_t *a1)
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

_QWORD *sub_100005B1C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005B40(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005B60(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005B78(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100005ADC(&qword_10000C190);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005CF8();
  _ControlWidgetAdaptor.init(_:)(v4, &type metadata for ToggleRecordingControl, v4);
  v5 = sub_100005D3C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100005C94();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100005C94()
{
  unint64_t result;

  result = qword_10000C188;
  if (!qword_10000C188)
  {
    result = swift_getWitnessTable(&unk_100007664, &type metadata for RecordWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10000C188);
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordWidgetBundle()
{
  return &type metadata for RecordWidgetBundle;
}

uint64_t sub_100005CE8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007970, 1);
}

unint64_t sub_100005CF8()
{
  unint64_t result;

  result = qword_10000C198;
  if (!qword_10000C198)
  {
    result = swift_getWitnessTable(&unk_1000076C8, &type metadata for ToggleRecordingControl);
    atomic_store(result, (unint64_t *)&qword_10000C198);
  }
  return result;
}

unint64_t sub_100005D3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C1A0;
  if (!qword_10000C1A0)
  {
    v1 = sub_1000057F8(&qword_10000C190);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C1A0);
  }
  return result;
}

uint64_t sub_100005D88()
{
  _QWORD v1[2];

  v1[0] = sub_1000057F8(&qword_10000C190);
  v1[1] = sub_100005D3C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

ValueMetadata *type metadata accessor for ToggleRecordingControl()
{
  return &type metadata for ToggleRecordingControl;
}

uint64_t sub_100005EBC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000079D0, 1);
}

uint64_t sub_100005ECC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t OpaqueTypeConformance2;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
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

  v41 = a1;
  v35 = type metadata accessor for LocalizedStringResource(0);
  v33 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v2 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100005ADC(&qword_10000C1B8);
  v32 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100005ADC(&qword_10000C1C0);
  v36 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005ADC(&qword_10000C1C8);
  v9 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  v38 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100005ADC(&qword_10000C1D0);
  v13 = *(_QWORD *)(v12 - 8);
  v39 = v12;
  v40 = v13;
  __chkstk_darwin(v12);
  v31 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = qword_10000C1A8;
  v16 = off_10000C1B0;
  swift_bridgeObjectRetain(off_10000C1B0);
  sub_100005ADC(&qword_10000C1D8);
  v17 = sub_1000057F8(&qword_10000C1E0);
  v18 = sub_10000695C(&qword_10000C1E8, &qword_10000C1E0, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  v42 = v17;
  v43 = v18;
  swift_getOpaqueTypeConformance2(&v42, &opaque type descriptor for <<opaque return type of ControlWidgetTemplate.tint(_:)>>, 1);
  sub_1000067B8();
  StaticControlConfiguration.init<A>(kind:provider:content:)(v15, v16);
  LocalizedStringResource.init(stringLiteral:)(0x454D5F4543494F56, 0xEA00000000004F4DLL);
  v19 = sub_10000695C(&qword_10000C1F8, &qword_10000C1B8, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  ControlWidgetConfiguration.displayName(_:)(v2, v3, v19);
  v20 = *(void (**)(char *, uint64_t))(v33 + 8);
  v21 = v35;
  v20(v2, v35);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v3);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100007B50);
  v42 = v3;
  v43 = v19;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v42, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v23 = v34;
  ControlWidgetConfiguration.description(_:)(v2, v34, OpaqueTypeConformance2);
  v20(v2, v21);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v23);
  v42 = v23;
  v43 = OpaqueTypeConformance2;
  v24 = swift_getOpaqueTypeConformance2(&v42, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v25 = v31;
  v26 = v37;
  ControlWidgetConfiguration.showsInControlCenter()(v37, v24);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v26);
  v42 = v26;
  v43 = v24;
  v27 = swift_getOpaqueTypeConformance2(&v42, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInControlCenter()>>, 1);
  v28 = v39;
  ControlWidgetConfiguration.showsContextualMenu(_:)(1, v39, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v25, v28);
}

uint64_t sub_100006278(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t OpaqueTypeConformance2;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v2 = sub_100005ADC(&qword_10000C1E0);
  v24 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *a1;
  v6 = LocalizedStringKey.init(stringLiteral:)(0x454D5F4543494F56, 0xEA00000000004F4DLL);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v26[0] = sub_10000583C();
  v26[1] = v13;
  v14 = sub_100005ADC(&qword_10000C200);
  v15 = sub_1000057F8(&qword_10000C208);
  v16 = sub_1000068C0();
  v25[0] = v15;
  v25[1] = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v25, &opaque type descriptor for <<opaque return type of View.controlWidgetActionHint(_:)>>, 1);
  v18 = sub_10000699C();
  v19 = ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)(v6, v8, v10 & 1, v12, v5, v26, sub_100006418, 0, v14, &type metadata for RCControlCenterToggleRecording, OpaqueTypeConformance2, v18);
  v20 = static Color.red.getter(v19);
  v21 = sub_10000695C(&qword_10000C1E8, &qword_10000C1E0, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  ControlWidgetTemplate.tint(_:)(v20, v2, v21);
  swift_release(v20);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v4, v2);
}

uint64_t sub_100006418@<X0>(int a1@<W0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;

  v60 = a2;
  v56 = type metadata accessor for SymbolEffectOptions(0);
  v3 = *(_QWORD *)(v56 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for BreatheSymbolEffect(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v52 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v52 - v14;
  v16 = sub_100005ADC(&qword_10000C220);
  v53 = *(_QWORD *)(v16 - 8);
  v54 = v16;
  __chkstk_darwin(v16);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_100005ADC(&qword_10000C208);
  __chkstk_darwin(v61);
  v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100005ADC(&qword_10000C200);
  v57 = *(_QWORD *)(v21 - 8);
  v58 = v21;
  __chkstk_darwin(v21);
  v55 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = a1;
  if ((a1 & 1) != 0)
  {
    v23 = 0x8000000100007BD0;
    v24 = 0xD00000000000001BLL;
  }
  else
  {
    v24 = 0;
    v23 = 0xE000000000000000;
  }
  v25 = LocalizedStringKey.init(stringLiteral:)(v24, v23);
  v26 = Label<>.init(_:systemImage:)(v25);
  v27 = BreatheSymbolEffect.init()(v26);
  BreatheSymbolEffect.plain.getter(v27);
  v28 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v29 = v28(v15, v6);
  BreatheSymbolEffect.wholeSymbol.getter(v29);
  v30 = v28(v13, v6);
  static SymbolEffectOptions.default.getter(v30);
  v31 = &v20[*(int *)(v61 + 36)];
  v32 = sub_1000069E0((unint64_t *)&unk_10000C238, (uint64_t (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect, (uint64_t)&protocol conformance descriptor for BreatheSymbolEffect);
  dispatch thunk of SymbolEffect.configuration.getter(v6, v32);
  v33 = type metadata accessor for _IndefiniteSymbolEffectModifier(0);
  v34 = v3;
  v35 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v36 = v56;
  v35(&v31[*(int *)(v33 + 20)], v5, v56);
  v31[*(int *)(v33 + 24)] = 1;
  v38 = v53;
  v37 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v20, v18, v54);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v36);
  v28(v10, v6);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v37);
  if ((v59 & 1) != 0)
  {
    v39 = 0xD000000000000021;
    v40 = "RECORDING_IN_PROGRESS_ACTION_HINT";
  }
  else
  {
    v39 = 0xD000000000000024;
    v40 = "NO_RECORDING_IN_PROGRESS_ACTION_HINT";
  }
  v41 = LocalizedStringKey.init(stringLiteral:)(v39, (unint64_t)(v40 - 32) | 0x8000000000000000);
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = sub_1000068C0();
  v49 = v45 & 1;
  v50 = v55;
  View.controlWidgetActionHint(_:)(v41, v43, v49, v47, v61, v48);
  swift_bridgeObjectRelease(v47);
  swift_bridgeObjectRelease(v43);
  sub_100006A20((uint64_t)v20);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v57 + 32))(v60, v50, v58);
}

unint64_t sub_1000067B8()
{
  unint64_t result;

  result = qword_10000C1F0;
  if (!qword_10000C1F0)
  {
    result = swift_getWitnessTable(&unk_100007730, &type metadata for ToggleRecordingStateProvider);
    atomic_store(result, (unint64_t *)&qword_10000C1F0);
  }
  return result;
}

void sub_1000067FC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100006804(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C248 + dword_10000C248);
  v2 = (_QWORD *)swift_task_alloc(unk_10000C24C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100006860;
  return v4();
}

uint64_t sub_100006860(char a1)
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
    **(_BYTE **)(v4 + 16) = a1 & 1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_1000068C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C210;
  if (!qword_10000C210)
  {
    v1 = sub_1000057F8(&qword_10000C208);
    sub_10000695C(&qword_10000C218, &qword_10000C220, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    sub_1000069E0(&qword_10000C228, (uint64_t (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier, (uint64_t)&protocol conformance descriptor for _IndefiniteSymbolEffectModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C210);
  }
  return result;
}

uint64_t sub_10000695C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000057F8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000699C()
{
  unint64_t result;

  result = qword_10000C230;
  if (!qword_10000C230)
  {
    result = swift_getWitnessTable(&unk_100007480, &type metadata for RCControlCenterToggleRecording);
    atomic_store(result, (unint64_t *)&qword_10000C230);
  }
  return result;
}

uint64_t sub_1000069E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006A20(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005ADC(&qword_10000C208);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for ToggleRecordingStateProvider()
{
  return &type metadata for ToggleRecordingStateProvider;
}

uint64_t sub_100006A70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_1000057F8(&qword_10000C1D0);
  v1 = sub_1000057F8(&qword_10000C1C8);
  v2 = sub_1000057F8(&qword_10000C1C0);
  v7 = sub_1000057F8(&qword_10000C1B8);
  v8 = sub_10000695C(&qword_10000C1F8, &qword_10000C1B8, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInControlCenter()>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsContextualMenu(_:)>>, 1);
}

uint64_t sub_100006B5C()
{
  return swift_task_switch(sub_100006B70, 0, 0);
}

uint64_t sub_100006B70()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  id v4;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, "isRecording");

  }
  else
  {
    v4 = 0;
  }
  return (*(uint64_t (**)(id))(v0 + 8))(v4);
}

uint64_t sub_100006C10()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21RecordWidgetExtensionP33_8D581240BFB76C2730BE00F39BFC93F819ResourceBundleClass);
}
