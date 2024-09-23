unint64_t sub_1B024D838()
{
  unint64_t result;

  result = qword_1EEE96410;
  if (!qword_1EEE96410)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F114, &type metadata for RemoveSavedLocationIntent.SavedLocationsOptionsProvider);
    atomic_store(result, (unint64_t *)&qword_1EEE96410);
  }
  return result;
}

uint64_t RemoveSavedLocationIntent.perform()(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 120) = a1;
  v3 = sub_1B0267EC4();
  *(_QWORD *)(v2 + 128) = v3;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  *(_OWORD *)(v2 + 152) = *v1;
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_1_21();
}

uint64_t sub_1B024D8D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD *, uint64_t, uint64_t);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[17] + 104))(v0[18], *MEMORY[0x1E0DB2E80], v0[16]);
  sub_1B0267EDC();
  swift_allocObject();
  v0[21] = sub_1B0267ED0();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266184();
  swift_release();
  OUTLINED_FUNCTION_12_1();
  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  sub_1B0266358();
  sub_1B0266358();
  sub_1B02662E0();
  swift_release();
  OUTLINED_FUNCTION_12_1();
  v3 = v0[7];
  v4 = v0[8];
  v5 = v0[9];
  v6 = v0[10];
  v0[22] = v4;
  v0[23] = v5;
  v0[24] = v6;
  v0[11] = v3;
  v0[12] = v4;
  v0[13] = v5;
  v0[14] = v6;
  v7 = (_QWORD *)OUTLINED_FUNCTION_63_0();
  v0[25] = v7;
  *v7 = v0;
  v7[1] = sub_1B024DA48;
  return v9(v0 + 11, v1, v2);
}

uint64_t sub_1B024DA48()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_41();
  swift_release();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_15_1();
  return swift_task_switch();
}

uint64_t sub_1B024DAD0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1B0266238();
  OUTLINED_FUNCTION_44();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_17(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1B024DB20()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_44();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_1(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1B024DB60()
{
  unint64_t result;

  result = qword_1EEE96420[0];
  if (!qword_1EEE96420[0])
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F174, &type metadata for RemoveSavedLocationIntent.SavedLocationsOptionsProvider);
    atomic_store(result, qword_1EEE96420);
  }
  return result;
}

uint64_t sub_1B024DB9C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_1B024DBB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  sub_1B0266184();
  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v3 = (_QWORD *)OUTLINED_FUNCTION_63_0();
  v0[8] = v3;
  *v3 = v0;
  v3[1] = sub_1B017C634;
  return v5(v1, v2);
}

uint64_t sub_1B024DC30(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_1B024DC80;
  return sub_1B024DB9C(v3);
}

uint64_t sub_1B024DC80(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return OUTLINED_FUNCTION_0_17(*(uint64_t (**)(void))(v5 + 8));
}

unint64_t sub_1B024DCD8()
{
  unint64_t result;

  result = qword_1EEE96438;
  if (!qword_1EEE96438)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for RemoveSavedLocationIntent, &type metadata for RemoveSavedLocationIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96438);
  }
  return result;
}

unint64_t sub_1B024DD18()
{
  unint64_t result;

  result = qword_1EEE96440;
  if (!qword_1EEE96440)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for RemoveSavedLocationIntent, &type metadata for RemoveSavedLocationIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96440);
  }
  return result;
}

uint64_t sub_1B024DD54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B024DD64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B024DD7C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B0131A4C;
  return RemoveSavedLocationIntent.perform()(a1);
}

uint64_t sub_1B024DDD8()
{
  sub_1B024D2FC();
  return sub_1B02661FC();
}

void sub_1B024DE00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  sub_1B0266424();
  OUTLINED_FUNCTION_41_1();
  MEMORY[0x1E0C80A78](v1);
  RemoveSavedLocationIntent.init()((uint64_t *)&v3);
  sub_1B024D2FC();
  sub_1B0266430();
  sub_1B0266418();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C90);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B026640C();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B024DECC(uint64_t a1)
{
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
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  void (*v20)(char *, uint64_t);
  unsigned int v21;
  void (*v22)(char *);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v27 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96460);
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B0266364();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96468);
  MEMORY[0x1E0C80A78](v8);
  sub_1B024D2FC();
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  v26 = sub_1B01679A0();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  v21 = *MEMORY[0x1E0C90F68];
  v22 = *(void (**)(char *))(v5 + 104);
  v22(v7);
  sub_1B02663D0();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  sub_1B02663E8();
  sub_1B0266400();
  v25 = sub_1B026637C();
  v9 = v24;
  v19 = *(void (**)(char *, uint64_t))(v23 + 8);
  v19(v3, v24);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  ((void (*)(char *, _QWORD, uint64_t))v22)(v7, v21, v4);
  sub_1B02663D0();
  v20(v7, v4);
  sub_1B02663E8();
  sub_1B0266400();
  v23 = sub_1B026637C();
  v10 = v9;
  v11 = v9;
  v12 = v19;
  v19(v3, v11);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v13 = sub_1B026637C();
  v12(v3, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96470);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1B026AC90;
  v15 = v23;
  *(_QWORD *)(v14 + 32) = v25;
  *(_QWORD *)(v14 + 40) = v15;
  *(_QWORD *)(v14 + 48) = v13;
  v16 = sub_1B0266370();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1B024E334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B02663C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1B01679A0();
  sub_1B0266358();
  swift_release();
  sub_1B024D2FC();
  sub_1B02663B8();
  v4 = sub_1B02663AC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93CA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_1B02663A0();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1B024E444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B026634C();
  OUTLINED_FUNCTION_41_1();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_4_60();
  sub_1B0266340();
  sub_1B0266334();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C80);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B0266328();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B024E4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1B0266394();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C88);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v1 + 32) = v0;
  v2 = sub_1B0266388();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t destroy for RemoveSavedLocationIntent()
{
  swift_release();
  return swift_release();
}

void _s11WeatherCore25RemoveSavedLocationIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  sub_1B0266358();
  sub_1B0266358();
  OUTLINED_FUNCTION_0_0();
}

_QWORD *assignWithCopy for RemoveSavedLocationIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1B0266358();
  swift_release();
  a1[1] = a2[1];
  sub_1B0266358();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for RemoveSavedLocationIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoveSavedLocationIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoveSavedLocationIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RemoveSavedLocationIntent()
{
  return &type metadata for RemoveSavedLocationIntent;
}

void sub_1B024E6E8()
{
  sub_1B01796D4(&qword_1EEE96450, &qword_1EEE96458, MEMORY[0x1E0C916B0]);
}

void sub_1B024E714()
{
  sub_1B01796D4(&qword_1EEE949C0, &qword_1EEE949C8, MEMORY[0x1E0C91590]);
}

ValueMetadata *type metadata accessor for RemoveSavedLocationIntents()
{
  return &type metadata for RemoveSavedLocationIntents;
}

ValueMetadata *type metadata accessor for RemoveSavedLocationIntent.SavedLocationsOptionsProvider()
{
  return &type metadata for RemoveSavedLocationIntent.SavedLocationsOptionsProvider;
}

Swift::Bool __swiftcall CLLocationCoordinate2D.isEqual(to:precision:)(__C::CLLocationCoordinate2D to, Swift::Double precision)
{
  double v2;
  double v3;
  Swift::Bool v4;

  v4 = vabdd_f64(v3, to.longitude) <= precision;
  return vabdd_f64(v2, to.latitude) <= precision && v4;
}

id CLLocationCoordinate2D.clLocation.getter()
{
  double v0;
  double v1;

  OUTLINED_FUNCTION_2_76();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9E3B8]), sel_initWithLatitude_longitude_, v1, v0);
}

Swift::Bool __swiftcall CLLocationCoordinate2D.isSignificantlyDifferent(from:precision:)(CLLocation from, Swift::Double precision)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  Swift::Bool v8;
  double v9;

  v4 = v3;
  v5 = v2;
  -[objc_class coordinate](from.super.isa, sel_coordinate);
  v8 = vabdd_f64(v4, v7) > precision;
  return vabdd_f64(v5, v9) > precision || v8;
}

__C::CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.rounded(with:)(Swift::Int with)
{
  double v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __C::CLLocationCoordinate2D result;

  OUTLINED_FUNCTION_2_76();
  sub_1B0268980();
  sub_1B0266AD8();
  v3 = (void *)sub_1B026898C();
  objc_msgSend(v3, sel_doubleValue);
  v5 = v4;

  v6 = round(v5 * v2) / v5;
  v7 = round(v5 * v1) / v5;
  result.longitude = v7;
  result.latitude = v6;
  return result;
}

BOOL sub_1B024E878(double *a1, double *a2)
{
  return static CLLocationCoordinate2D.== infix(_:_:)(*a1, a1[1], *a2, a2[1]);
}

void CLLocationCoordinate2D.hashValue.getter()
{
  OUTLINED_FUNCTION_2_76();
  sub_1B0268DDC();
  CLLocationCoordinate2D.hash(into:)();
  sub_1B0268E0C();
  OUTLINED_FUNCTION_3_62();
}

void sub_1B024E8C8()
{
  CLLocationCoordinate2D.hashValue.getter();
}

uint64_t sub_1B024E8D0()
{
  return CLLocationCoordinate2D.hash(into:)();
}

void sub_1B024E8D8()
{
  sub_1B0268DDC();
  CLLocationCoordinate2D.hash(into:)();
  sub_1B0268E0C();
  OUTLINED_FUNCTION_3_62();
}

double CLLocationCoordinate2D.init(from:)()
{
  uint64_t v0;
  double v1;
  double *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_1B0266358();
  v2 = (double *)sub_1B0268638();
  if (!v0)
  {
    if (*((_QWORD *)v2 + 2) != 2)
    {
      swift_bridgeObjectRelease();
      v4 = OUTLINED_FUNCTION_6_56();
      sub_1B01010E8(&qword_1EEE96480, (uint64_t (*)(uint64_t))MEMORY[0x1E0D11F08], MEMORY[0x1E0D11F10]);
      v11 = OUTLINED_FUNCTION_0_87();
      v7 = OUTLINED_FUNCTION_1_82(v11, v12);
      v9 = v13 + 6;
      v10 = "CLLocationCoordinate2D no latitude/longitude";
      goto LABEL_10;
    }
    v1 = v2[4];
    v3 = *((_QWORD *)v2 + 5);
    swift_bridgeObjectRelease();
    if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0 && (*(_QWORD *)&v1 & 0xFFFFFFFFFFFFFLL) != 0)
    {
      v4 = OUTLINED_FUNCTION_6_56();
      sub_1B01010E8(&qword_1EEE96480, (uint64_t (*)(uint64_t))MEMORY[0x1E0D11F08], MEMORY[0x1E0D11F10]);
      v5 = OUTLINED_FUNCTION_0_87();
      v7 = OUTLINED_FUNCTION_1_82(v5, v6);
      v10 = "CLLocationCoordinate2D latitude is NaN";
LABEL_10:
      *v8 = v9;
      v8[1] = (unint64_t)(v10 - 32) | 0x8000000000000000;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v7, *MEMORY[0x1E0D11EF8], v4);
      swift_willThrow();
      goto LABEL_11;
    }
    if ((~v3 & 0x7FF0000000000000) == 0 && (v3 & 0xFFFFFFFFFFFFFLL) != 0)
    {
      v4 = OUTLINED_FUNCTION_6_56();
      sub_1B01010E8(&qword_1EEE96480, (uint64_t (*)(uint64_t))MEMORY[0x1E0D11F08], MEMORY[0x1E0D11F10]);
      v14 = OUTLINED_FUNCTION_0_87();
      v7 = OUTLINED_FUNCTION_1_82(v14, v15);
      v9 = v16 | 1;
      v10 = "CLLocationCoordinate2D longitude is NaN";
      goto LABEL_10;
    }
  }
LABEL_11:
  swift_release();
  return v1;
}

uint64_t CLLocationCoordinate2D.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_76();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED201188);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B026EC50;
  *(_QWORD *)(v2 + 32) = v1;
  *(_QWORD *)(v2 + 40) = v0;
  sub_1B0268644();
  return swift_bridgeObjectRelease();
}

void sub_1B024EB34(uint64_t a1@<X8>)
{
  uint64_t v1;
  double v3;
  uint64_t v4;

  v3 = CLLocationCoordinate2D.init(from:)();
  if (!v1)
  {
    *(double *)a1 = v3;
    *(_QWORD *)(a1 + 8) = v4;
  }
}

uint64_t sub_1B024EB5C()
{
  return CLLocationCoordinate2D.encode(to:)();
}

uint64_t sub_1B024EB78()
{
  return sub_1B01010E8(&qword_1EEE96488, (uint64_t (*)(uint64_t))type metadata accessor for CLLocationCoordinate2D, (uint64_t)&protocol conformance descriptor for CLLocationCoordinate2D);
}

void sub_1B024EBA4(uint64_t a1)
{
  sub_1B00D4F08(a1, MEMORY[0x1E0DB57E0], 0xD000000000000026, 0x80000001B028F3F0, &qword_1EEE96490);
}

uint64_t static Settings.Geocoding.bypassGeocodingCache.getter()
{
  return sub_1B011ABF8(&qword_1EEE92980);
}

void sub_1B024EBEC(uint64_t a1)
{
  sub_1B00D4F08(a1, MEMORY[0x1E0DB57E0], 0xD000000000000031, 0x80000001B028F3B0, &qword_1EEE96498);
}

uint64_t static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter()
{
  return sub_1B011ABF8(&qword_1EEE92988);
}

uint64_t static Settings.Geocoding.bypassReverseGeocodingCache.getter()
{
  return sub_1B011ABF8(&qword_1ED203530);
}

uint64_t static Settings.Geocoding.clearReverseGeocodingCacheOnNextLaunch.getter()
{
  return sub_1B011ABF8(&qword_1ED203518);
}

uint64_t static Settings.Geocoding.useBackgroundReverseGeocodingPriority.getter()
{
  return sub_1B011ABF8(&qword_1ED2039C0);
}

uint64_t static Settings.Geocoding.clearCurrentLocationCacheOnNextLaunch.getter()
{
  return sub_1B011ABF8(&qword_1ED2039D8);
}

uint64_t static Settings.Geocoding.bypassGreenTea.getter()
{
  return sub_1B011ABF8(&qword_1ED203850);
}

uint64_t Settings.Geocoding.ClientServerSideRevGeocode.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1B0268BC0();
  result = swift_bridgeObjectRelease();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t Settings.Geocoding.ClientServerSideRevGeocode.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746E65696C63;
  if (*v0 != 1)
    v1 = 0x726576726573;
  if (*v0)
    return v1;
  else
    return 0x746C7561666564;
}

void sub_1B024ED6C()
{
  sub_1B0141CB8();
}

void sub_1B024ED78()
{
  sub_1B025FD38();
}

uint64_t sub_1B024ED80(uint64_t a1)
{
  char *v1;

  return sub_1B0259090(a1, *v1);
}

void sub_1B024ED88()
{
  sub_1B025FEC8();
}

uint64_t sub_1B024ED90@<X0>(char *a1@<X8>)
{
  return Settings.Geocoding.ClientServerSideRevGeocode.init(rawValue:)(a1);
}

uint64_t sub_1B024ED9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Settings.Geocoding.ClientServerSideRevGeocode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B024EDC0()
{
  sub_1B024F1A4();
  return sub_1B0268578();
}

uint64_t sub_1B024EE00()
{
  sub_1B024F1A4();
  return sub_1B026856C();
}

uint64_t sub_1B024EE48()
{
  sub_1B024F1A4();
  return sub_1B0268560();
}

void sub_1B024EE88()
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

  v0 = sub_1B0267030();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_10();
  v4 = v3 - v2;
  v5 = sub_1B0267024();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_10();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2012F8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E0DB57E8], v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED201328);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2012F0);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B026AC90;
  OUTLINED_FUNCTION_1_83();
  OUTLINED_FUNCTION_1_83();
  OUTLINED_FUNCTION_1_83();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E0DB5800], v0);
  sub_1B024F1E0();
  qword_1ED2012D8 = sub_1B0267048();
  OUTLINED_FUNCTION_7();
}

uint64_t static Settings.Geocoding.clientServerSideRevGeo.getter()
{
  return sub_1B011ABF8(&qword_1ED2000A8);
}

unint64_t sub_1B024F08C()
{
  unint64_t result;

  result = qword_1ED2000B0;
  if (!qword_1ED2000B0)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for Settings.Geocoding.ClientServerSideRevGeocode, &type metadata for Settings.Geocoding.ClientServerSideRevGeocode);
    atomic_store(result, (unint64_t *)&qword_1ED2000B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Settings.Geocoding()
{
  return &type metadata for Settings.Geocoding;
}

uint64_t _s9GeocodingV26ClientServerSideRevGeocodeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B024F124 + 4 * byte_1B027F455[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B024F158 + 4 * byte_1B027F450[v4]))();
}

uint64_t sub_1B024F158(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B024F160(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B024F168);
  return result;
}

uint64_t sub_1B024F174(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B024F17CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B024F180(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B024F188(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Settings.Geocoding.ClientServerSideRevGeocode()
{
  return &type metadata for Settings.Geocoding.ClientServerSideRevGeocode;
}

unint64_t sub_1B024F1A4()
{
  unint64_t result;

  result = qword_1ED2012E0;
  if (!qword_1ED2012E0)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for Settings.Geocoding.ClientServerSideRevGeocode, &type metadata for Settings.Geocoding.ClientServerSideRevGeocode);
    atomic_store(result, (unint64_t *)&qword_1ED2012E0);
  }
  return result;
}

unint64_t sub_1B024F1E0()
{
  unint64_t result;

  result = qword_1ED2012E8;
  if (!qword_1ED2012E8)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for Settings.Geocoding.ClientServerSideRevGeocode, &type metadata for Settings.Geocoding.ClientServerSideRevGeocode);
    atomic_store(result, (unint64_t *)&qword_1ED2012E8);
  }
  return result;
}

uint64_t dispatch thunk of LocationMetadataManagerObserver.countryCodeConfigurationDidChange(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

void sub_1B024F224(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = a1 + 32;
  v9 = MEMORY[0x1E0DEE9D8];
LABEL_2:
  v10 = (uint64_t *)(v8 + 16 * v6);
  while (1)
  {
    if (v7 == v6)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    if (v6 >= *(_QWORD *)(a1 + 16))
      break;
    ++v6;
    v11 = v10 + 2;
    v12 = *v10;
    v10 += 2;
    if (v12 != a2)
    {
      v16 = v3;
      v13 = *(v11 - 1);
      swift_unknownObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_1B01507C0();
      v14 = *(_QWORD *)(v9 + 16);
      if (v14 >= *(_QWORD *)(v9 + 24) >> 1)
        sub_1B01507C0();
      *(_QWORD *)(v9 + 16) = v14 + 1;
      v15 = v9 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v12;
      *(_QWORD *)(v15 + 40) = v13;
      v3 = v16;
      goto LABEL_2;
    }
  }
  __break(1u);
}

uint64_t sub_1B024F354()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  if (qword_1ED2034C8 != -1)
    swift_once();
  v2 = sub_1B0267C54();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED204390);
  v3 = sub_1B0267C3C();
  v4 = sub_1B026883C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_36();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B00C3000, v3, v4, "Ubiquity identity changed", v5, 2u);
    OUTLINED_FUNCTION_4();
  }

  v6 = v1[6];
  v7 = v1[7];
  __swift_project_boxed_opaque_existential_1(v1 + 3, v6);
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  v8 = sub_1B0267C3C();
  v9 = sub_1B026883C();
  v10 = os_log_type_enabled(v8, v9);
  if ((v6 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)OUTLINED_FUNCTION_1_36() = 0;
      OUTLINED_FUNCTION_3_63(&dword_1B00C3000, v11, v9, "User signed into iCloud");
      OUTLINED_FUNCTION_4();
    }

    result = OUTLINED_FUNCTION_0_89();
    v13 = v1[2];
    v14 = *(_QWORD *)(v13 + 16);
    if (v14)
    {
      sub_1B0267384();
      v15 = v13 + 40;
      do
      {
        OUTLINED_FUNCTION_5_61();
        swift_unknownObjectRetain();
        OUTLINED_FUNCTION_4_62();
        swift_unknownObjectRelease();
        v15 += 16;
        --v14;
      }
      while (v14);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)OUTLINED_FUNCTION_1_36() = 0;
      OUTLINED_FUNCTION_3_63(&dword_1B00C3000, v16, v9, "User signed out of iCloud");
      OUTLINED_FUNCTION_4();
    }

    result = OUTLINED_FUNCTION_0_89();
    v17 = v1[2];
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      sub_1B0267384();
      v19 = v17 + 40;
      do
      {
        OUTLINED_FUNCTION_5_61();
        swift_unknownObjectRetain();
        OUTLINED_FUNCTION_4_62();
        swift_unknownObjectRelease();
        v19 += 16;
        --v18;
      }
      while (v18);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t AccountMonitor.removeObserver(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  swift_unknownObjectRetain();
  v3 = sub_1B0267384();
  sub_1B024F224(v3, a1);
  *(_QWORD *)(v1 + 16) = v4;
  return swift_bridgeObjectRelease();
}

uint64_t AccountMonitor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return v0;
}

uint64_t AccountMonitor.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_1B024F670(uint64_t a1)
{
  return AccountMonitor.removeObserver(_:)(a1);
}

uint64_t dispatch thunk of AccountMonitorObserver.accountSignedIn()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AccountMonitorObserver.accountSignedOut()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AccountMonitorType.addObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AccountMonitorType.removeObserver(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for AccountMonitor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B024F6BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B026697C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1B026844C();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1B0266994();
  __swift_allocate_value_buffer(v6, qword_1EEE964A0);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EEE964A0);
  sub_1B0268404();
  sub_1B0266DCC();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_1B02669A0();
}

void static SetPrecipitationUnitIntent.title.getter(uint64_t a1@<X8>)
{
  sub_1B01DF9A8(&qword_1EEE92990, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)qword_1EEE964A0, a1);
}

void static SetPrecipitationUnitIntent.title.setter(uint64_t a1)
{
  sub_1B01DFA4C(a1, &qword_1EEE92990, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)qword_1EEE964A0);
}

uint64_t (*static SetPrecipitationUnitIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1EEE92990 != -1)
    swift_once();
  v0 = sub_1B0266994();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE964A0);
  OUTLINED_FUNCTION_32_0();
  return j_j__swift_endAccess;
}

uint64_t sub_1B024F8E8()
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
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v0);
  v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_1B026697C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1B026844C();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1B0266994();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1B026643C();
  __swift_allocate_value_buffer(v10, qword_1EEE964B8);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EEE964B8);
  sub_1B0268404();
  sub_1B0266DCC();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF9B8], v3);
  sub_1B02669A0();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v9);
  return sub_1B0266454();
}

void static SetPrecipitationUnitIntent.description.getter(uint64_t a1@<X8>)
{
  sub_1B01DF9A8(&qword_1EEE92998, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)qword_1EEE964B8, a1);
}

void static SetPrecipitationUnitIntent.description.setter(uint64_t a1)
{
  sub_1B01DFA4C(a1, &qword_1EEE92998, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)qword_1EEE964B8);
}

uint64_t (*static SetPrecipitationUnitIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1EEE92998 != -1)
    swift_once();
  v0 = sub_1B026643C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE964B8);
  OUTLINED_FUNCTION_32_0();
  return j__swift_endAccess;
}

uint64_t static SetPrecipitationUnitIntent.isDiscoverable.getter()
{
  return 1;
}

uint64_t static SetPrecipitationUnitIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE964D0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE964D8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_2_77();
  sub_1B0266538();
  sub_1B026652C();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE964E8);
  sub_1B0266520();
  swift_release();
  sub_1B026652C();
  sub_1B0266544();
  return sub_1B0266514();
}

unint64_t sub_1B024FCFC()
{
  unint64_t result;

  result = qword_1EEE964E0;
  if (!qword_1EEE964E0)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetPrecipitationUnitIntent, &type metadata for SetPrecipitationUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE964E0);
  }
  return result;
}

uint64_t sub_1B024FD38()
{
  return sub_1B02662EC();
}

uint64_t SetPrecipitationUnitIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char v26;

  v25 = a1;
  v1 = sub_1B0266550();
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_10();
  v22 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C08);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v4);
  v21 = (uint64_t)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10();
  v12 = v11 - v10;
  sub_1B026697C();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10();
  sub_1B0266DFC();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_10();
  sub_1B026844C();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_10();
  v16 = sub_1B0266994();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_10();
  v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE964F0);
  sub_1B0268404();
  sub_1B0266DCC();
  OUTLINED_FUNCTION_10_34();
  OUTLINED_FUNCTION_7_4();
  sub_1B02669A0();
  sub_1B0268404();
  sub_1B0266DCC();
  OUTLINED_FUNCTION_10_34();
  OUTLINED_FUNCTION_7_4();
  sub_1B02669A0();
  __swift_storeEnumTagSinglePayload(v12, 0, 1, v16);
  v26 = 2;
  sub_1B0266220();
  OUTLINED_FUNCTION_4_0((uint64_t)v8);
  OUTLINED_FUNCTION_4_0(v21);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v22, *MEMORY[0x1E0C91738], v24);
  sub_1B0251974();
  v18 = sub_1B0266304();
  result = sub_1B0166578();
  *v25 = v18;
  return result;
}

uint64_t SetPrecipitationUnitIntent.perform()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1B0250058()
{
  uint64_t v0;
  char v1;
  char v3;

  sub_1B0266358();
  sub_1B02662E0();
  swift_release();
  v1 = *(_BYTE *)(v0 + 32);
  if (qword_1ED2074D0 != -1)
    swift_once();
  v3 = v1;
  UnitManager.setPreferredPrecipitationUnit(_:)((WeatherCore::UnitConfiguration::Precipitation_optional)&v3);
  sub_1B0101508();
  static NSUserDefaults.postSettingsUpdatedNotification()();
  static WidgetUtilities.reloadWidget(reason:)();
  sub_1B0266238();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B0250130(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B011DF64;
  return SetPrecipitationUnitIntent.perform()(a1);
}

uint64_t sub_1B0250184()
{
  sub_1B024FCFC();
  return sub_1B02661FC();
}

void sub_1B02501AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1B0266424();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v1);
  SetPrecipitationUnitIntent.init()(&v3);
  sub_1B024FCFC();
  sub_1B0266430();
  sub_1B0266418();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C90);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B026640C();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B0250274(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
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
  void (*v43)(char *, uint64_t);
  unint64_t v44;
  uint64_t v45;

  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE965A8);
  v2 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE965B0);
  MEMORY[0x1E0C80A78](v5);
  sub_1B024FCFC();
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  v44 = sub_1B0251BD4();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v41 = sub_1B026637C();
  v43 = *(void (**)(char *, uint64_t))(v2 + 8);
  v6 = v45;
  v43(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  v42 = a1;
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v40 = sub_1B026637C();
  v43(v4, v6);
  sub_1B02663F4();
  v38 = 0xD00000000000001DLL;
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v39 = sub_1B026637C();
  v7 = v45;
  v8 = v43;
  v43(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v38 = sub_1B026637C();
  v8(v4, v7);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v37 = sub_1B026637C();
  v9 = v7;
  v10 = v43;
  v43(v4, v9);
  sub_1B02663F4();
  v31 = 0xD000000000000016;
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v36 = sub_1B026637C();
  v10(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v35 = sub_1B026637C();
  v11 = v45;
  v10(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v34 = sub_1B026637C();
  v10(v4, v11);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v33 = sub_1B026637C();
  v43(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v32 = sub_1B026637C();
  v12 = v43;
  v43(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v30 = sub_1B026637C();
  v12(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v31 = sub_1B026637C();
  v13 = v45;
  v43(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v29 = sub_1B026637C();
  v14 = v13;
  v15 = v43;
  v43(v4, v14);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v28 = sub_1B026637C();
  v16 = v45;
  v15(v4, v45);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v17 = sub_1B026637C();
  v15(v4, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE965B8);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1B027D420;
  v19 = v40;
  *(_QWORD *)(v18 + 32) = v41;
  *(_QWORD *)(v18 + 40) = v19;
  v20 = v38;
  *(_QWORD *)(v18 + 48) = v39;
  *(_QWORD *)(v18 + 56) = v20;
  v21 = v36;
  *(_QWORD *)(v18 + 64) = v37;
  *(_QWORD *)(v18 + 72) = v21;
  v22 = v34;
  *(_QWORD *)(v18 + 80) = v35;
  *(_QWORD *)(v18 + 88) = v22;
  v23 = v32;
  *(_QWORD *)(v18 + 96) = v33;
  *(_QWORD *)(v18 + 104) = v23;
  v24 = v31;
  *(_QWORD *)(v18 + 112) = v30;
  *(_QWORD *)(v18 + 120) = v24;
  v25 = v28;
  *(_QWORD *)(v18 + 128) = v29;
  *(_QWORD *)(v18 + 136) = v25;
  *(_QWORD *)(v18 + 144) = v17;
  v26 = sub_1B0266370();
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_1B0250FE4()
{
  return sub_1B024FD38();
}

uint64_t sub_1B0251018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B02663C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1B0251BD4();
  sub_1B0266358();
  swift_release();
  sub_1B024FCFC();
  sub_1B02663B8();
  v4 = sub_1B02663AC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93CA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_1B02663A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1B0251128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1B0266394();
  v1 = sub_1B0266394();
  v2 = sub_1B0266394();
  v3 = sub_1B0266394();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C88);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B026B5B0;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1B0266388();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_1B0251204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B026634C();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_2_77();
  sub_1B0266340();
  sub_1B0266334();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C80);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B0266328();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B02512A8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1B0266994();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1B02665A4();
  __swift_allocate_value_buffer(v4, qword_1EEEB0ED8);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEEB0ED8);
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  return sub_1B0266598();
}

uint64_t sub_1B02513B4()
{
  uint64_t v0;

  if (qword_1EEE929A0 != -1)
    swift_once();
  v0 = sub_1B02665A4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEEB0ED8);
}

uint64_t sub_1B02513FC()
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
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  __int128 v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93470);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v5;
  v6 = sub_1B0266994();
  v22 = v6;
  MEMORY[0x1E0C80A78](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96598);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE965A0);
  v8 = *(_QWORD *)(v7 - 8);
  v23 = *(_QWORD *)(v8 + 72);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = swift_allocObject();
  v18 = xmmword_1B026EC50;
  v24 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_1B026EC50;
  v11 = v10 + v9;
  v20 = v10 + v9 + *(int *)(v7 + 48);
  *(_BYTE *)(v10 + v9) = 0;
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v21 = sub_1B026649C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93A80);
  *(_OWORD *)(swift_allocObject() + 16) = v18;
  sub_1B0266970();
  sub_1B0266970();
  v12 = (uint64_t)v19;
  v13 = (uint64_t)v17;
  sub_1B02664B4();
  v14 = (_BYTE *)(v11 + v23);
  v23 += v11 + *(int *)(v7 + 48);
  *v14 = 1;
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v22);
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v21);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B026B5B0;
  sub_1B0266970();
  sub_1B0266970();
  sub_1B0266970();
  sub_1B0266970();
  sub_1B02664B4();
  sub_1B02664CC();
  sub_1B0251D14();
  result = sub_1B0268398();
  qword_1EEEB0EF0 = result;
  return result;
}

uint64_t *sub_1B025177C()
{
  if (qword_1EEE929A8 != -1)
    swift_once();
  return &qword_1EEEB0EF0;
}

uint64_t sub_1B02517BC()
{
  uint64_t v0;
  unsigned int v1;

  sub_1B0268BC0();
  OUTLINED_FUNCTION_42_1();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1B0251804(char a1)
{
  if ((a1 & 1) != 0)
    return 28013;
  else
    return 28265;
}

void sub_1B025181C(char *a1, char *a2)
{
  sub_1B0140CC0(*a1, *a2);
}

void sub_1B0251828()
{
  sub_1B025FD44();
}

uint64_t sub_1B0251830()
{
  return sub_1B0258718();
}

void sub_1B0251838()
{
  sub_1B0260338();
}

uint64_t sub_1B0251840@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B02517BC();
  *a1 = result;
  return result;
}

uint64_t sub_1B025186C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1B0251804(*v1);
  *a1 = result;
  a1[1] = 0xE200000000000000;
  return result;
}

uint64_t sub_1B0251898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1B02513B4();
  v3 = sub_1B02665A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_1B02518D8()
{
  sub_1B0251974();
  return sub_1B02661C0();
}

uint64_t sub_1B0251910()
{
  sub_1B025177C();
  return sub_1B0267384();
}

uint64_t sub_1B025192C()
{
  sub_1B0251C14();
  return sub_1B0266574();
}

void sub_1B0251964(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A96B0;
}

unint64_t sub_1B0251974()
{
  unint64_t result;

  result = qword_1EEE964F8;
  if (!qword_1EEE964F8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F830, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE964F8);
  }
  return result;
}

unint64_t sub_1B02519B4()
{
  unint64_t result;

  result = qword_1EEE96508;
  if (!qword_1EEE96508)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetPrecipitationUnitIntent, &type metadata for SetPrecipitationUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96508);
  }
  return result;
}

unint64_t sub_1B02519F4()
{
  unint64_t result;

  result = qword_1EEE96510;
  if (!qword_1EEE96510)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetPrecipitationUnitIntent, &type metadata for SetPrecipitationUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96510);
  }
  return result;
}

uint64_t sub_1B0251A30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B0251A40()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B0251A54()
{
  unint64_t result;

  result = qword_1EEE96520;
  if (!qword_1EEE96520)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F790, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96520);
  }
  return result;
}

unint64_t sub_1B0251A94()
{
  unint64_t result;

  result = qword_1EEE96528;
  if (!qword_1EEE96528)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F870, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96528);
  }
  return result;
}

unint64_t sub_1B0251AD4()
{
  unint64_t result;

  result = qword_1EEE96530;
  if (!qword_1EEE96530)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F8A8, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96530);
  }
  return result;
}

unint64_t sub_1B0251B14()
{
  unint64_t result;

  result = qword_1EEE96538;
  if (!qword_1EEE96538)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F7F8, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96538);
  }
  return result;
}

unint64_t sub_1B0251B54()
{
  unint64_t result;

  result = qword_1EEE96540;
  if (!qword_1EEE96540)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F8D8, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96540);
  }
  return result;
}

unint64_t sub_1B0251B94()
{
  unint64_t result;

  result = qword_1EEE96548;
  if (!qword_1EEE96548)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F900, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96548);
  }
  return result;
}

unint64_t sub_1B0251BD4()
{
  unint64_t result;

  result = qword_1EEE96550;
  if (!qword_1EEE96550)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F928, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96550);
  }
  return result;
}

unint64_t sub_1B0251C14()
{
  unint64_t result;

  result = qword_1EEE96558;
  if (!qword_1EEE96558)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F980, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96558);
  }
  return result;
}

uint64_t sub_1B0251C50()
{
  sub_1B0251974();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B0251C94()
{
  unint64_t result;

  result = qword_1EEE96560;
  if (!qword_1EEE96560)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F9C0, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96560);
  }
  return result;
}

unint64_t sub_1B0251CD4()
{
  unint64_t result;

  result = qword_1EEE96568;
  if (!qword_1EEE96568)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F9E8, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96568);
  }
  return result;
}

unint64_t sub_1B0251D14()
{
  unint64_t result;

  result = qword_1EEE96570;
  if (!qword_1EEE96570)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027F7B8, &unk_1E60BC910);
    atomic_store(result, (unint64_t *)&qword_1EEE96570);
  }
  return result;
}

uint64_t sub_1B0251D50()
{
  return sub_1B012C8B8(&qword_1EEE96578, &qword_1EEE96580, MEMORY[0x1E0DEAF50]);
}

void type metadata accessor for SetPrecipitationUnitIntent()
{
  OUTLINED_FUNCTION_27_1();
}

uint64_t sub_1B0251D88()
{
  return sub_1B012C8B8(&qword_1EEE96588, &qword_1EEE96590, MEMORY[0x1E0C916B0]);
}

void type metadata accessor for SetPrecipitationUnitIntents()
{
  OUTLINED_FUNCTION_27_1();
}

uint64_t sub_1B0251DC0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0251E0C + 4 * byte_1B027F655[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B0251E40 + 4 * byte_1B027F650[v4]))();
}

uint64_t sub_1B0251E40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0251E48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0251E50);
  return result;
}

uint64_t sub_1B0251E5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0251E64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B0251E68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0251E70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PrecipitationUnit()
{
  OUTLINED_FUNCTION_27_1();
}

uint64_t AppLaunchCountManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AppLaunchCountManager.init()();
  return v0;
}

void (*AppLaunchCountManager.appLaunchCount.modify(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = AppLaunchCountManager.appLaunchCount.getter();
  return sub_1B0251EF8;
}

void sub_1B0251EF8(uint64_t *a1)
{
  AppLaunchCountManager.appLaunchCount.setter(*a1);
  OUTLINED_FUNCTION_0_0();
}

uint64_t AppLaunchCountManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AppLaunchCountManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

void (*sub_1B0251F54(id *a1))(uint64_t *a1)
{
  id *v1;

  a1[1] = *v1;
  *a1 = AppLaunchCountManager.appLaunchCount.getter();
  return sub_1B0251EF8;
}

void sub_1B0251F8C(id *a1@<X8>)
{
  *a1 = AppLaunchCountManager.appLaunchCount.getter();
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0251FB0(uint64_t *a1)
{
  AppLaunchCountManager.appLaunchCount.setter(*a1);
  OUTLINED_FUNCTION_0_0();
}

uint64_t dispatch thunk of AppLaunchCountManagerType.appLaunchCount.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for AppLaunchCountManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppLaunchCountManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t sub_1B0251FF0()
{
  unint64_t result;

  result = qword_1EEE965C0;
  if (!qword_1EEE965C0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FC54, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965C0);
  }
  return result;
}

unint64_t sub_1B0252030()
{
  unint64_t result;

  result = qword_1EEE965C8;
  if (!qword_1EEE965C8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FC8C, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965C8);
  }
  return result;
}

unint64_t sub_1B0252070()
{
  unint64_t result;

  result = qword_1EEE965D0;
  if (!qword_1EEE965D0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FCBC, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965D0);
  }
  return result;
}

void sub_1B02520B0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2005A8);
  OUTLINED_FUNCTION_9_47();
  OUTLINED_FUNCTION_8_53();
}

void sub_1B0252168()
{
  sub_1B0266358();
  sub_1B0266970();
  OUTLINED_FUNCTION_8_53();
}

void sub_1B0252198()
{
  sub_1B0266358();
  OUTLINED_FUNCTION_9_47();
  OUTLINED_FUNCTION_8_53();
}

void sub_1B02521BC()
{
  sub_1B0266358();
  sub_1B0266970();
  OUTLINED_FUNCTION_8_53();
}

void sub_1B02521E8()
{
  sub_1B0266358();
  sub_1B0266970();
  OUTLINED_FUNCTION_8_53();
}

uint64_t sub_1B0252214()
{
  unsigned int v0;
  uint64_t v1;
  int8x16_t v2;
  int32x2_t v3;
  int64x2_t v4;
  int8x16_t v5;
  int32x2_t v6;
  uint64_t v7;

  *(double *)v2.i64 = OUTLINED_FUNCTION_11_44();
  v3 = vdup_n_s32(v0);
  v4.i64[0] = v3.u32[0];
  v4.i64[1] = v3.u32[1];
  OUTLINED_FUNCTION_21_35(vbslq_s8(v2, (int8x16_t)xmmword_1B027FB20, (int8x16_t)xmmword_1B027FB10), v4);
  swift_retain_n();
  OUTLINED_FUNCTION_0_91();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_2();
  sub_1B0266274();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_87_0();
  OUTLINED_FUNCTION_1_84();
  *(double *)v5.i64 = OUTLINED_FUNCTION_11_44();
  v6 = vdup_n_s32(*(_DWORD *)(v1 - 124));
  v4.i64[0] = v6.u32[0];
  v4.i64[1] = v6.u32[1];
  OUTLINED_FUNCTION_21_35(vbslq_s8(v5, (int8x16_t)xmmword_1B027FB40, (int8x16_t)xmmword_1B027FB30), v4);
  OUTLINED_FUNCTION_0_91();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_18_4();
  sub_1B0266274();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_87_0();
  v7 = OUTLINED_FUNCTION_1_84();
  return ((uint64_t (*)(uint64_t, __n128, __n128))((char *)sub_1B0252310
                                                          + 4 * byte_1B027FBF0[*(_QWORD *)(v1 - 120)]))(v7, (__n128)xmmword_1B027FB50, (__n128)0);
}

uint64_t sub_1B0252310()
{
  uint64_t v0;
  int v1;
  int32x2_t v2;
  uint64_t v3;
  int64x2_t v4;
  int8x16_t v5;
  uint64_t v6;

  *(_OWORD *)(v0 - 96) = xmmword_1B027FB90;
  OUTLINED_FUNCTION_0_91();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_18_4();
  sub_1B0266274();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_87_0();
  OUTLINED_FUNCTION_1_84();
  v1 = *(_DWORD *)(v0 - 108);
  v2 = vdup_n_s32(v1 == 2);
  if ((v1 & 1) != 0)
    v3 = 99;
  else
    v3 = 102;
  v4.i64[0] = v2.u32[0];
  v4.i64[1] = v2.u32[1];
  v5 = (int8x16_t)vdupq_n_s64(0xE100000000000000);
  v5.i64[0] = v3;
  *(int8x16_t *)(v0 - 96) = vandq_s8(v5, (int8x16_t)vcgezq_s64(vshlq_n_s64(v4, 0x3FuLL)));
  OUTLINED_FUNCTION_0_91();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_18_4();
  sub_1B0266274();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_87_0();
  v6 = OUTLINED_FUNCTION_1_84();
  return ((uint64_t (*)(uint64_t, __n128, __n128))((char *)sub_1B0252424
                                                          + 4 * byte_1B027FBF6[*(_QWORD *)(v0 - 104)]))(v6, (__n128)xmmword_1B027FBA0, (__n128)0);
}

uint64_t sub_1B0252424()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  *(_OWORD *)(v6 - 96) = xmmword_1B027FBE0;
  OUTLINED_FUNCTION_0_91();
  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_18_4();
  sub_1B0266274();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_35_2();
  swift_bridgeObjectRelease_n();
  result = OUTLINED_FUNCTION_0_91();
  *v0 = 0x6572726566657270;
  v0[1] = 0xEF7374696E752E64;
  v0[2] = v1;
  v0[3] = v2;
  v0[4] = v3;
  v0[5] = v4;
  v0[6] = v5;
  return result;
}

uint64_t sub_1B0252510()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93470);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_8_9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_10();
  v5 = v4 - v3;
  v6 = OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_19_42();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  v8 = sub_1B026649C();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v8);
  return sub_1B02664C0();
}

uint64_t sub_1B0252608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_8_9();
  v2 = OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_19_42();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v2);
  return sub_1B0266598();
}

unint64_t sub_1B02526B4()
{
  unint64_t result;

  result = qword_1EEE965D8;
  if (!qword_1EEE965D8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FCF4, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965D8);
  }
  return result;
}

unint64_t sub_1B02526F4()
{
  unint64_t result;

  result = qword_1EEE965E0;
  if (!qword_1EEE965E0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FD1C, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965E0);
  }
  return result;
}

unint64_t sub_1B0252734()
{
  unint64_t result;

  result = qword_1EEE965E8;
  if (!qword_1EEE965E8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FD9C, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE965E8);
  }
  return result;
}

uint64_t sub_1B0252770@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return sub_1B0267384();
}

unint64_t sub_1B0252784()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE965F0;
  if (!qword_1EEE965F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE965F8);
    result = MEMORY[0x1B5E0724C](MEMORY[0x1E0C91998], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE965F0);
  }
  return result;
}

uint64_t sub_1B02527C8()
{
  sub_1B01C49E0();
  return sub_1B02661CC();
}

unint64_t sub_1B0252804()
{
  unint64_t result;

  result = qword_1EEE96600;
  if (!qword_1EEE96600)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B027FDCC, &type metadata for PreferredUnitsEntity);
    atomic_store(result, (unint64_t *)&qword_1EEE96600);
  }
  return result;
}

uint64_t sub_1B0252840()
{
  return sub_1B0252510();
}

uint64_t sub_1B0252854()
{
  sub_1B0252734();
  return sub_1B02665E0();
}

uint64_t destroy for PreferredUnitsEntity()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for PreferredUnitsEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  sub_1B0267384();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  return a1;
}

_QWORD *assignWithCopy for PreferredUnitsEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  sub_1B0266358();
  swift_release();
  a1[3] = a2[3];
  sub_1B0266358();
  swift_release();
  a1[4] = a2[4];
  sub_1B0266358();
  swift_release();
  a1[5] = a2[5];
  sub_1B0266358();
  swift_release();
  a1[6] = a2[6];
  sub_1B0266358();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PreferredUnitsEntity(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PreferredUnitsEntity()
{
  return &type metadata for PreferredUnitsEntity;
}

BOOL static LocationOfInterestType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void LocationOfInterest.init(type:location:isFromMeCard:fullAddress:shortAddress:searchDisplayAddress:)(_BYTE *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, uint64_t a10)
{
  int *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;

  *a9 = *a1;
  v18 = (int *)OUTLINED_FUNCTION_44_0();
  sub_1B00E1E58(a2, (uint64_t)&a9[v18[5]]);
  a9[v18[6]] = a3;
  v19 = &a9[v18[7]];
  *v19 = a4;
  v19[1] = a5;
  v20 = &a9[v18[8]];
  *v20 = a6;
  v20[1] = a7;
  v21 = &a9[v18[9]];
  *v21 = a8;
  v21[1] = a10;
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for LocationOfInterest()
{
  uint64_t result;

  result = qword_1ED1FFF60;
  if (!qword_1ED1FFF60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LocationOfInterestType.title.getter()
{
  _BYTE *v0;
  id v1;
  uint64_t v2;

  if ((*v0 & 1) != 0)
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
  }
  else if (qword_1ED2032E8 != -1)
  {
    swift_once();
  }
  v1 = (id)qword_1ED2189D0;
  OUTLINED_FUNCTION_6_57();
  v2 = sub_1B0266934();

  return v2;
}

uint64_t LocationOfInterestType.hash(into:)()
{
  return sub_1B0268DE8();
}

uint64_t sub_1B0252CB8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1701670760 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1802661751 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1B0268D34();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B0252D8C(char a1)
{
  if ((a1 & 1) != 0)
    return 1802661751;
  else
    return 1701670760;
}

uint64_t sub_1B0252DB0()
{
  char *v0;

  return sub_1B0252D8C(*v0);
}

uint64_t sub_1B0252DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0252CB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0252DDC()
{
  sub_1B0253040();
  return sub_1B0268E54();
}

uint64_t sub_1B0252E04()
{
  sub_1B0253040();
  return sub_1B0268E60();
}

uint64_t sub_1B0252E2C()
{
  sub_1B02530B8();
  return sub_1B0268E54();
}

uint64_t sub_1B0252E54()
{
  sub_1B02530B8();
  return sub_1B0268E60();
}

uint64_t sub_1B0252E7C()
{
  sub_1B025307C();
  return sub_1B0268E54();
}

uint64_t sub_1B0252EA4()
{
  sub_1B025307C();
  return sub_1B0268E60();
}

void LocationOfInterestType.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2028C8);
  v19 = *(_QWORD *)(v4 - 8);
  v20 = v4;
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_10();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2028C0);
  v17 = *(_QWORD *)(v9 - 8);
  v18 = v9;
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_29_3();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2028B8);
  v21 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_10();
  v15 = v14 - v13;
  v16 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0253040();
  sub_1B0268E30();
  if ((v16 & 1) != 0)
  {
    OUTLINED_FUNCTION_25_26();
    OUTLINED_FUNCTION_40_2();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v8, v20);
  }
  else
  {
    sub_1B02530B8();
    OUTLINED_FUNCTION_40_2();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v18);
  }
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v15, v11);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1B0253040()
{
  unint64_t result;

  result = qword_1ED2026D0;
  if (!qword_1ED2026D0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02803E4, &type metadata for LocationOfInterestType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026D0);
  }
  return result;
}

unint64_t sub_1B025307C()
{
  unint64_t result;

  result = qword_1EEE96608;
  if (!qword_1EEE96608)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280394, &type metadata for LocationOfInterestType.WorkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96608);
  }
  return result;
}

unint64_t sub_1B02530B8()
{
  unint64_t result;

  result = qword_1ED2026E8;
  if (!qword_1ED2026E8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280344, &type metadata for LocationOfInterestType.HomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026E8);
  }
  return result;
}

void LocationOfInterestType.hashValue.getter()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_28_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void LocationOfInterestType.init(from:)(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
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
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2028A0);
  v34 = *(_QWORD *)(v30 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_37();
  v33 = v5;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED202898);
  v6 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_10();
  v9 = v8 - v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED202890);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_5_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0253040();
  sub_1B0268E24();
  if (v35)
    goto LABEL_9;
  v28 = v9;
  v29 = a1;
  v12 = sub_1B0268C68();
  v13 = *(_QWORD *)(v12 + 16);
  v14 = v10;
  if (!v13)
  {
    v21 = v2;
LABEL_8:
    v22 = sub_1B0268AF4();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93B80);
    *v24 = &type metadata for LocationOfInterestType;
    sub_1B0268BE4();
    sub_1B0268AE8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC450], v22);
    swift_willThrow();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v14);
    a1 = v29;
LABEL_9:
    v25 = (uint64_t)a1;
    goto LABEL_10;
  }
  v15 = *(_BYTE *)(v12 + 32);
  sub_1B018230C(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  v17 = v16;
  v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    v21 = v2;
    v14 = v10;
    goto LABEL_8;
  }
  if ((v15 & 1) != 0)
  {
    OUTLINED_FUNCTION_25_26();
    sub_1B0268BD8();
    v20 = a2;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v30);
    OUTLINED_FUNCTION_3_1();
    v26 = OUTLINED_FUNCTION_22_30();
    v27(v26);
  }
  else
  {
    sub_1B02530B8();
    sub_1B0268BD8();
    v20 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v28, v31);
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v10);
  }
  *v20 = v15;
  v25 = (uint64_t)v29;
LABEL_10:
  __swift_destroy_boxed_opaque_existential_1(v25);
  OUTLINED_FUNCTION_0_2();
}

void sub_1B0253490()
{
  sub_1B0268DDC();
  OUTLINED_FUNCTION_28_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02534BC(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  LocationOfInterestType.init(from:)(a1, a2);
}

void sub_1B02534D0(_QWORD *a1)
{
  LocationOfInterestType.encode(to:)(a1);
}

void LocationOfInterest.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void LocationOfInterest.location.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_44_0();
  sub_1B0102D24(v1 + *(int *)(v3 + 20), a1, (void (*)(_QWORD))type metadata accessor for Location);
}

uint64_t LocationOfInterest.isFromMeCard.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_44_0() + 24));
}

void LocationOfInterest.fullAddress.getter()
{
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_0_0();
}

void LocationOfInterest.shortAddress.getter()
{
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_0_0();
}

void LocationOfInterest.searchDisplayAddress.getter()
{
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_0_0();
}

void LocationOfInterest.init(type:location:isFromMeCard:fullAddress:shortAddress:)(_BYTE *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _BYTE *a8@<X8>)
{
  int *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;

  *a8 = *a1;
  v15 = (int *)OUTLINED_FUNCTION_44_0();
  sub_1B0102D24(a2, (uint64_t)&a8[v15[5]], (void (*)(_QWORD))type metadata accessor for Location);
  a8[v15[6]] = a3;
  v16 = &a8[v15[7]];
  *v16 = a4;
  v16[1] = a5;
  v17 = &a8[v15[8]];
  *v17 = a6;
  v17[1] = a7;
  sub_1B00F01E8(a2, (uint64_t (*)(_QWORD))type metadata accessor for Location);
  v18 = &a8[v15[9]];
  *v18 = 0;
  v18[1] = 0xE000000000000000;
  OUTLINED_FUNCTION_7();
}

uint64_t LocationOfInterest.imageName.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7361636665697262;
  else
    return 0x69662E6573756F68;
}

void static LocationOfInterest.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;

  if (*a1 != *a2)
    goto LABEL_4;
  v4 = (int *)OUTLINED_FUNCTION_44_0();
  if ((static Location.== infix(_:_:)((uint64_t)&a1[v4[5]], (uint64_t)&a2[v4[5]]) & 1) == 0 || a1[v4[6]] != a2[v4[6]])
    goto LABEL_4;
  OUTLINED_FUNCTION_18_43();
  if (v5)
  {
    if (!v6)
      goto LABEL_4;
    v9 = *v7 == *v8 && v5 == v6;
    if (!v9 && (sub_1B0268D34() & 1) == 0)
      goto LABEL_4;
  }
  else if (v6)
  {
    goto LABEL_4;
  }
  OUTLINED_FUNCTION_18_43();
  if (!v10)
  {
    if (!v11)
      goto LABEL_23;
LABEL_4:
    OUTLINED_FUNCTION_67();
    return;
  }
  if (!v11)
    goto LABEL_4;
  v14 = *v12 == *v13 && v10 == v11;
  if (!v14 && (sub_1B0268D34() & 1) == 0)
    goto LABEL_4;
LABEL_23:
  v15 = v4[9];
  v16 = *(_QWORD *)&a1[v15];
  v17 = *(_QWORD *)&a1[v15 + 8];
  v18 = &a2[v15];
  if (v16 == *(_QWORD *)v18 && v17 == *((_QWORD *)v18 + 1))
    goto LABEL_4;
  sub_1B0268D34();
}

uint64_t LocationOfInterest.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_1B0268DE8();
  v1 = OUTLINED_FUNCTION_44_0();
  swift_bridgeObjectRetain_n();
  sub_1B0267384();
  OUTLINED_FUNCTION_22_30();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  sub_1B0267384();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  CLLocationCoordinate2D.hash(into:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B0268DF4();
  if (*(_QWORD *)(v0 + *(int *)(v1 + 28) + 8))
  {
    OUTLINED_FUNCTION_23_37();
    sub_1B0267384();
    OUTLINED_FUNCTION_11_45();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B0268DF4();
  }
  if (*(_QWORD *)(v0 + *(int *)(v1 + 32) + 8))
  {
    OUTLINED_FUNCTION_23_37();
    sub_1B0267384();
    OUTLINED_FUNCTION_11_45();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B0268DF4();
  }
  sub_1B0267384();
  sub_1B0268518();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0253930(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v10;

  v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E6F697461636F6CLL && a2 == 0xE800000000000000;
    if (v6 || (sub_1B0268D34() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x654D6D6F72467369 && a2 == 0xEC00000064726143;
      if (v7 || (sub_1B0268D34() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x726464416C6C7566 && a2 == 0xEB00000000737365;
        if (v8 || (sub_1B0268D34() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x64644174726F6873 && a2 == 0xEC00000073736572;
          if (v9 || (sub_1B0268D34() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000014 && a2 == 0x80000001B028F8B0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = sub_1B0268D34();
            swift_bridgeObjectRelease();
            if ((v10 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_1B0253BD4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B0253C00
                                                            + 4 * asc_1B027FE20[a1]))(1701869940, 0xE400000000000000);
}

uint64_t sub_1B0253C00()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_1B0253C18()
{
  return 0x654D6D6F72467369;
}

uint64_t sub_1B0253C38()
{
  return 0x726464416C6C7566;
}

uint64_t sub_1B0253C58()
{
  return 0x64644174726F6873;
}

unint64_t sub_1B0253C78()
{
  return 0xD000000000000014;
}

uint64_t sub_1B0253C94()
{
  unsigned __int8 *v0;

  return sub_1B0253BD4(*v0);
}

uint64_t sub_1B0253C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0253930(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0253CC0()
{
  sub_1B0254574();
  return sub_1B0268E54();
}

uint64_t sub_1B0253CE8()
{
  sub_1B0254574();
  return sub_1B0268E60();
}

uint64_t LocationOfInterest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2028B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_5_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0254574();
  sub_1B0268E30();
  sub_1B02545B0();
  OUTLINED_FUNCTION_5_1();
  if (!v1)
  {
    type metadata accessor for LocationOfInterest();
    type metadata accessor for Location();
    sub_1B00E8C14((unint64_t *)&qword_1ED2030C8, (uint64_t (*)(uint64_t))type metadata accessor for Location, (uint64_t)&protocol conformance descriptor for Location);
    OUTLINED_FUNCTION_5_1();
    sub_1B0268CBC();
    OUTLINED_FUNCTION_13_47();
    OUTLINED_FUNCTION_13_47();
    sub_1B0268CB0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

void LocationOfInterest.hashValue.getter()
{
  OUTLINED_FUNCTION_30_1();
  LocationOfInterest.hash(into:)();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void LocationOfInterest.init(from:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22;
  int *v23;
  char v24;

  type metadata accessor for Location();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_10();
  v5 = v4 - v3;
  v22 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED202268);
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_29_3();
  v23 = (int *)type metadata accessor for LocationOfInterest();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_37();
  v8 = v7;
  v9 = (_QWORD *)OUTLINED_FUNCTION_22_30();
  __swift_project_boxed_opaque_existential_1(v9, v10);
  sub_1B0254574();
  sub_1B0268E24();
  if (v1)
  {
    OUTLINED_FUNCTION_44_1();
  }
  else
  {
    sub_1B02545EC();
    OUTLINED_FUNCTION_32_25();
    *v8 = v24;
    sub_1B00E8C14((unint64_t *)&qword_1ED2030D0, (uint64_t (*)(uint64_t))type metadata accessor for Location, (uint64_t)&protocol conformance descriptor for Location);
    OUTLINED_FUNCTION_32_25();
    sub_1B00E1E58(v5, (uint64_t)&v8[v23[5]]);
    v8[v23[6]] = sub_1B0268C44() & 1;
    v11 = OUTLINED_FUNCTION_17_38();
    v12 = (uint64_t *)&v8[v23[7]];
    *v12 = v11;
    v12[1] = v13;
    v14 = OUTLINED_FUNCTION_17_38();
    v15 = (uint64_t *)&v8[v23[8]];
    *v15 = v14;
    v15[1] = v16;
    v17 = sub_1B0268C38();
    v19 = v18;
    OUTLINED_FUNCTION_0_92();
    v20 = (uint64_t *)&v8[v23[9]];
    *v20 = v17;
    v20[1] = v19;
    sub_1B0102D24((uint64_t)v8, a1, (void (*)(_QWORD))type metadata accessor for LocationOfInterest);
    OUTLINED_FUNCTION_44_1();
    sub_1B00F01E8((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for LocationOfInterest);
  }
  OUTLINED_FUNCTION_0_2();
}

void sub_1B0254244(uint64_t a1@<X8>)
{
  LocationOfInterest.init(from:)(a1);
}

uint64_t sub_1B0254258(_QWORD *a1)
{
  return LocationOfInterest.encode(to:)(a1);
}

void sub_1B0254278()
{
  sub_1B0268DDC();
  LocationOfInterest.hash(into:)();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

uint64_t LocationOfInterest.shortDescription.getter@<X0>(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  if (*v1)
    v2 = 1802661751;
  else
    v2 = 1701670760;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B0270710;
  v4 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 32) = 1701869940;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = v4;
  *(_QWORD *)(inited + 80) = 1701667182;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  v5 = (int *)OUTLINED_FUNCTION_44_0();
  v6 = (uint64_t)&v1[v5[5]];
  v7 = *(_QWORD *)(v6 + 24);
  *(_QWORD *)(inited + 96) = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(inited + 104) = v7;
  *(_QWORD *)(inited + 120) = v4;
  strcpy((char *)(inited + 128), "isFromMeCard");
  *(_BYTE *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  v8 = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 144) = v1[v5[6]];
  *(_QWORD *)(inited + 168) = v8;
  *(_QWORD *)(inited + 176) = 0x726464416C6C7566;
  *(_QWORD *)(inited + 184) = 0xEB00000000737365;
  v9 = (uint64_t *)&v1[v5[7]];
  v10 = v9[1];
  if (v10)
    v11 = *v9;
  else
    v11 = 0;
  v12 = 0xE000000000000000;
  if (v10)
    v13 = v10;
  else
    v13 = 0xE000000000000000;
  *(_QWORD *)(inited + 192) = v11;
  *(_QWORD *)(inited + 200) = v13;
  *(_QWORD *)(inited + 216) = v4;
  strcpy((char *)(inited + 224), "shortAddress");
  *(_BYTE *)(inited + 237) = 0;
  *(_WORD *)(inited + 238) = -5120;
  v14 = (uint64_t *)&v1[v5[8]];
  v15 = v14[1];
  if (v15)
    v16 = *v14;
  else
    v16 = 0;
  if (v15)
    v12 = v15;
  *(_QWORD *)(inited + 240) = v16;
  *(_QWORD *)(inited + 248) = v12;
  *(_QWORD *)(inited + 264) = v4;
  *(_QWORD *)(inited + 272) = 0xD000000000000014;
  *(_QWORD *)(inited + 280) = 0x80000001B028F8B0;
  v17 = &v1[v5[9]];
  v18 = v17[1];
  *(_QWORD *)(inited + 288) = *v17;
  *(_QWORD *)(inited + 296) = v18;
  *(_QWORD *)(inited + 312) = v4;
  *(_QWORD *)(inited + 320) = 0x6E6F697461636F6CLL;
  *(_QWORD *)(inited + 328) = 0xE800000000000000;
  *(_QWORD *)(inited + 360) = OUTLINED_FUNCTION_40();
  __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)(inited + 336));
  sub_1B0102D24(v6, v19, (void (*)(_QWORD))type metadata accessor for Location);
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0268398();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED202808);
  a1[4] = sub_1B0254628();
  __swift_allocate_boxed_opaque_existential_0Tm(a1);
  return sub_1B0267378();
}

uint64_t sub_1B0254534()
{
  sub_1B00E8C14(&qword_1ED2026A0, (uint64_t (*)(uint64_t))type metadata accessor for LocationOfInterest, (uint64_t)&protocol conformance descriptor for LocationOfInterest);
  return sub_1B026736C();
}

unint64_t sub_1B0254574()
{
  unint64_t result;

  result = qword_1ED202678;
  if (!qword_1ED202678)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02802F4, &type metadata for LocationOfInterest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED202678);
  }
  return result;
}

unint64_t sub_1B02545B0()
{
  unint64_t result;

  result = qword_1ED202720;
  if (!qword_1ED202720)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for LocationOfInterestType, &type metadata for LocationOfInterestType);
    atomic_store(result, (unint64_t *)&qword_1ED202720);
  }
  return result;
}

unint64_t sub_1B02545EC()
{
  unint64_t result;

  result = qword_1ED202728;
  if (!qword_1ED202728)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for LocationOfInterestType, &type metadata for LocationOfInterestType);
    atomic_store(result, (unint64_t *)&qword_1ED202728);
  }
  return result;
}

unint64_t sub_1B0254628()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED202800;
  if (!qword_1ED202800)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED202808);
    result = MEMORY[0x1B5E0724C](MEMORY[0x1E0DB3C80], v1);
    atomic_store(result, (unint64_t *)&qword_1ED202800);
  }
  return result;
}

unint64_t sub_1B0254670()
{
  unint64_t result;

  result = qword_1ED2007B8;
  if (!qword_1ED2007B8)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for LocationOfInterestType, &type metadata for LocationOfInterestType);
    atomic_store(result, (unint64_t *)&qword_1ED2007B8);
  }
  return result;
}

void sub_1B02546AC()
{
  sub_1B00E8C14(&qword_1ED2026B0, (uint64_t (*)(uint64_t))type metadata accessor for LocationOfInterest, (uint64_t)&protocol conformance descriptor for LocationOfInterest);
}

void sub_1B02546D8()
{
  sub_1B00E8C14(&qword_1ED202250, (uint64_t (*)(uint64_t))type metadata accessor for LocationOfInterest, (uint64_t)&protocol conformance descriptor for LocationOfInterest);
}

ValueMetadata *type metadata accessor for LocationOfInterestType()
{
  return &type metadata for LocationOfInterestType;
}

_QWORD *initializeBufferWithCopyOfBuffer for LocationOfInterest(_BYTE *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_BYTE *, char *, uint64_t);
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  char *v51;
  _BYTE *v52;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    sub_1B0266358();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = *(_QWORD *)((char *)a2 + v7 + 8);
    *(_QWORD *)v8 = *(_QWORD *)((char *)a2 + v7);
    *((_QWORD *)v8 + 1) = v10;
    v11 = *(_QWORD *)((char *)a2 + v7 + 24);
    *((_QWORD *)v8 + 2) = *(_QWORD *)((char *)a2 + v7 + 16);
    *((_QWORD *)v8 + 3) = v11;
    *((_OWORD *)v8 + 2) = *(_OWORD *)((char *)a2 + v7 + 32);
    v12 = (int *)type metadata accessor for Location();
    v13 = v12[5];
    v51 = &v9[v13];
    v52 = &v8[v13];
    v14 = sub_1B0266F4C();
    v15 = *(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    sub_1B0267384();
    sub_1B0267384();
    v15(v52, v51, v14);
    v16 = v12[6];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_1B0266CD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
    }
    v22 = v12[7];
    v23 = &v8[v22];
    v24 = &v9[v22];
    v25 = *((_QWORD *)v24 + 1);
    *v23 = *(_QWORD *)v24;
    v23[1] = v25;
    v26 = v12[8];
    v27 = &v8[v26];
    v28 = &v9[v26];
    v29 = *((_QWORD *)v28 + 1);
    *v27 = *(_QWORD *)v28;
    v27[1] = v29;
    v30 = v12[9];
    v31 = &v8[v30];
    v32 = &v9[v30];
    v33 = *((_QWORD *)v32 + 1);
    *v31 = *(_QWORD *)v32;
    v31[1] = v33;
    v34 = v12[10];
    v35 = &v8[v34];
    v36 = &v9[v34];
    v37 = *((_QWORD *)v36 + 1);
    *v35 = *(_QWORD *)v36;
    v35[1] = v37;
    v38 = a3[7];
    *((_BYTE *)v4 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v39 = (_QWORD *)((char *)v4 + v38);
    v40 = (_QWORD *)((char *)a2 + v38);
    v41 = v40[1];
    *v39 = *v40;
    v39[1] = v41;
    v42 = a3[8];
    v43 = a3[9];
    v44 = (_QWORD *)((char *)v4 + v42);
    v45 = (_QWORD *)((char *)a2 + v42);
    v46 = v45[1];
    *v44 = *v45;
    v44[1] = v46;
    v47 = (_QWORD *)((char *)v4 + v43);
    v48 = (_QWORD *)((char *)a2 + v43);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
  }
  return v4;
}

uint64_t destroy for LocationOfInterest(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = type metadata accessor for Location();
  v4 = v2 + *(int *)(v3 + 20);
  v5 = sub_1B0266F4C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v2 + *(int *)(v3 + 24);
  v7 = sub_1B0266CD0();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for LocationOfInterest(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
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

  *a1 = *a2;
  v4 = a3[5];
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = *(_QWORD *)&a2[v4 + 8];
  *(_QWORD *)v5 = *(_QWORD *)&a2[v4];
  *((_QWORD *)v5 + 1) = v7;
  v8 = *(_QWORD *)&a2[v4 + 24];
  *((_QWORD *)v5 + 2) = *(_QWORD *)&a2[v4 + 16];
  *((_QWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = *(_OWORD *)&a2[v4 + 32];
  v9 = (int *)type metadata accessor for Location();
  v10 = v9[5];
  v11 = &v5[v10];
  v12 = &v6[v10];
  v13 = sub_1B0266F4C();
  v14 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  sub_1B0267384();
  sub_1B0267384();
  v14(v11, v12, v13);
  v15 = v9[6];
  v16 = &v5[v15];
  v17 = &v6[v15];
  v18 = sub_1B0266CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  }
  v20 = v9[7];
  v21 = &v5[v20];
  v22 = &v6[v20];
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = v9[8];
  v25 = &v5[v24];
  v26 = &v6[v24];
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = v9[9];
  v29 = &v5[v28];
  v30 = &v6[v28];
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = v9[10];
  v33 = &v5[v32];
  v34 = &v6[v32];
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  v36 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v37 = &a1[v36];
  v38 = &a2[v36];
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v40 = a3[8];
  v41 = a3[9];
  v42 = &a1[v40];
  v43 = &a2[v40];
  v44 = v43[1];
  *v42 = *v43;
  v42[1] = v44;
  v45 = &a1[v41];
  v46 = &a2[v41];
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  sub_1B0267384();
  return a1;
}

_BYTE *assignWithCopy for LocationOfInterest(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int EnumTagSinglePayload;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  *v7 = *(_QWORD *)&a2[v6];
  v7[1] = *(_QWORD *)&a2[v6 + 8];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v7[2] = v8[2];
  v7[3] = v8[3];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v7[4] = v8[4];
  v7[5] = v8[5];
  v9 = (int *)type metadata accessor for Location();
  v10 = v9[5];
  v11 = (char *)v7 + v10;
  v12 = (char *)v8 + v10;
  v13 = sub_1B0266F4C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = v9[6];
  v15 = (char *)v7 + v14;
  v16 = (char *)v8 + v14;
  v17 = sub_1B0266CD0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!EnumTagSinglePayload)
  {
    v20 = *(_QWORD *)(v17 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
LABEL_7:
  v22 = v9[7];
  v23 = (_QWORD *)((char *)v7 + v22);
  v24 = (_QWORD *)((char *)v8 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v25 = v9[8];
  v26 = (_QWORD *)((char *)v7 + v25);
  v27 = (_QWORD *)((char *)v8 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v28 = v9[9];
  v29 = (_QWORD *)((char *)v7 + v28);
  v30 = (_QWORD *)((char *)v8 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v31 = v9[10];
  v32 = (_QWORD *)((char *)v7 + v31);
  v33 = (_QWORD *)((char *)v8 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  a1[a3[6]] = a2[a3[6]];
  v34 = a3[7];
  v35 = &a1[v34];
  v36 = &a2[v34];
  *v35 = *v36;
  v35[1] = v36[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v37 = a3[8];
  v38 = &a1[v37];
  v39 = &a2[v37];
  *v38 = *v39;
  v38[1] = v39[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  v40 = a3[9];
  v41 = &a1[v40];
  v42 = &a2[v40];
  *v41 = *v42;
  v41[1] = v42[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *initializeWithTake for LocationOfInterest(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _OWORD *v7;
  _BYTE *v8;
  __int128 v9;
  __int128 v10;
  int *v11;
  uint64_t v12;
  char *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = *(_OWORD *)&a2[v6 + 32];
  v10 = *(_OWORD *)&a2[v6];
  v7[1] = *(_OWORD *)&a2[v6 + 16];
  v7[2] = v9;
  *v7 = v10;
  v11 = (int *)type metadata accessor for Location();
  v12 = v11[5];
  v13 = (char *)v7 + v12;
  v14 = &v8[v12];
  v15 = sub_1B0266F4C();
  (*(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v11[6];
  v17 = (char *)v7 + v16;
  v18 = &v8[v16];
  v19 = sub_1B0266CD0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, _BYTE *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *(_OWORD *)((char *)v7 + v11[7]) = *(_OWORD *)&v8[v11[7]];
  *(_OWORD *)((char *)v7 + v11[8]) = *(_OWORD *)&v8[v11[8]];
  *(_OWORD *)((char *)v7 + v11[9]) = *(_OWORD *)&v8[v11[9]];
  *(_OWORD *)((char *)v7 + v11[10]) = *(_OWORD *)&v8[v11[10]];
  v21 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v22 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v22] = *(_OWORD *)&a2[v22];
  return a1;
}

_BYTE *assignWithTake for LocationOfInterest(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  int EnumTagSinglePayload;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = *(_QWORD *)&a2[v6 + 8];
  *(_QWORD *)v7 = *(_QWORD *)&a2[v6];
  *((_QWORD *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  v10 = *((_QWORD *)v8 + 3);
  *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
  *((_QWORD *)v7 + 3) = v10;
  swift_bridgeObjectRelease();
  *((_OWORD *)v7 + 2) = *((_OWORD *)v8 + 2);
  v11 = (int *)type metadata accessor for Location();
  v12 = v11[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_1B0266F4C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v11[6];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = sub_1B0266CD0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    v22 = *(_QWORD *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(_BYTE *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
LABEL_7:
  v24 = v11[7];
  v25 = &v7[v24];
  v26 = (uint64_t *)&v8[v24];
  v28 = *v26;
  v27 = v26[1];
  *v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  v29 = v11[8];
  v30 = &v7[v29];
  v31 = (uint64_t *)&v8[v29];
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  v34 = v11[9];
  v35 = &v7[v34];
  v36 = (uint64_t *)&v8[v34];
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  v39 = v11[10];
  v40 = &v7[v39];
  v41 = (uint64_t *)&v8[v39];
  v43 = *v41;
  v42 = v41[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  v44 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v45 = &a1[v44];
  v46 = (uint64_t *)&a2[v44];
  v48 = *v46;
  v47 = v46[1];
  *v45 = v48;
  v45[1] = v47;
  swift_bridgeObjectRelease();
  v49 = a3[8];
  v50 = &a1[v49];
  v51 = (uint64_t *)&a2[v49];
  v53 = *v51;
  v52 = v51[1];
  *v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease();
  v54 = a3[9];
  v55 = &a1[v54];
  v56 = (uint64_t *)&a2[v54];
  v58 = *v56;
  v57 = v56[1];
  *v55 = v58;
  v55[1] = v57;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationOfInterest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B025532C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_40();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v6);
  else
    OUTLINED_FUNCTION_67();
}

uint64_t storeEnumTagSinglePayload for LocationOfInterest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B02553AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_40();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1B0255424()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Location();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationOfInterest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1B02554FC + 4 * byte_1B027FE2B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1B0255530 + 4 * byte_1B027FE26[v4]))();
}

uint64_t sub_1B0255530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0255538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0255540);
  return result;
}

uint64_t sub_1B025554C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0255554);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1B0255558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0255560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationOfInterest.CodingKeys()
{
  return &type metadata for LocationOfInterest.CodingKeys;
}

uint64_t _s11WeatherCore22LocationOfInterestTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B02555C8 + 4 * byte_1B027FE35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B02555FC + 4 * byte_1B027FE30[v4]))();
}

uint64_t sub_1B02555FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0255604(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B025560CLL);
  return result;
}

uint64_t sub_1B0255618(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0255620);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B0255624(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B025562C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationOfInterestType.CodingKeys()
{
  return &type metadata for LocationOfInterestType.CodingKeys;
}

ValueMetadata *type metadata accessor for LocationOfInterestType.HomeCodingKeys()
{
  return &type metadata for LocationOfInterestType.HomeCodingKeys;
}

ValueMetadata *type metadata accessor for LocationOfInterestType.WorkCodingKeys()
{
  return &type metadata for LocationOfInterestType.WorkCodingKeys;
}

unint64_t sub_1B025566C()
{
  unint64_t result;

  result = qword_1EEE96610;
  if (!qword_1EEE96610)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280214, &type metadata for LocationOfInterestType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96610);
  }
  return result;
}

unint64_t sub_1B02556AC()
{
  unint64_t result;

  result = qword_1EEE96618;
  if (!qword_1EEE96618)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02802CC, &type metadata for LocationOfInterest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96618);
  }
  return result;
}

unint64_t sub_1B02556EC()
{
  unint64_t result;

  result = qword_1ED202688;
  if (!qword_1ED202688)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028023C, &type metadata for LocationOfInterest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED202688);
  }
  return result;
}

unint64_t sub_1B025572C()
{
  unint64_t result;

  result = qword_1ED202680;
  if (!qword_1ED202680)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280264, &type metadata for LocationOfInterest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED202680);
  }
  return result;
}

unint64_t sub_1B025576C()
{
  unint64_t result;

  result = qword_1ED2026F8;
  if (!qword_1ED2026F8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280134, &type metadata for LocationOfInterestType.HomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026F8);
  }
  return result;
}

unint64_t sub_1B02557AC()
{
  unint64_t result;

  result = qword_1ED2026F0;
  if (!qword_1ED2026F0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028015C, &type metadata for LocationOfInterestType.HomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026F0);
  }
  return result;
}

unint64_t sub_1B02557EC()
{
  unint64_t result;

  result = qword_1ED202708;
  if (!qword_1ED202708)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02800E4, &type metadata for LocationOfInterestType.WorkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED202708);
  }
  return result;
}

unint64_t sub_1B025582C()
{
  unint64_t result;

  result = qword_1ED202700;
  if (!qword_1ED202700)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028010C, &type metadata for LocationOfInterestType.WorkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED202700);
  }
  return result;
}

unint64_t sub_1B025586C()
{
  unint64_t result;

  result = qword_1ED2026E0;
  if (!qword_1ED2026E0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280184, &type metadata for LocationOfInterestType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026E0);
  }
  return result;
}

unint64_t sub_1B02558AC()
{
  unint64_t result;

  result = qword_1ED2026D8;
  if (!qword_1ED2026D8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02801AC, &type metadata for LocationOfInterestType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED2026D8);
  }
  return result;
}

uint64_t sub_1B02558EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B026697C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1B026844C();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1B0266994();
  __swift_allocate_value_buffer(v6, qword_1EEE96620);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EEE96620);
  sub_1B0268404();
  sub_1B0266DCC();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAF9B8], v0);
  return sub_1B02669A0();
}

void static SetDistanceUnitIntent.title.getter(uint64_t a1@<X8>)
{
  sub_1B01DF9A8(&qword_1EEE929B0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)qword_1EEE96620, a1);
}

void static SetDistanceUnitIntent.title.setter(uint64_t a1)
{
  sub_1B01DFA4C(a1, &qword_1EEE929B0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAF9F8], (uint64_t)qword_1EEE96620);
}

uint64_t (*static SetDistanceUnitIntent.title.modify())()
{
  uint64_t v0;

  if (qword_1EEE929B0 != -1)
    swift_once();
  v0 = sub_1B0266994();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE96620);
  OUTLINED_FUNCTION_32_0();
  return j_j__swift_endAccess;
}

uint64_t sub_1B0255B18()
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
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v0);
  v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_1B026697C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1B026844C();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1B0266994();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1B026643C();
  __swift_allocate_value_buffer(v10, qword_1EEE96638);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EEE96638);
  sub_1B0268404();
  sub_1B0266DCC();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CAF9B8], v3);
  sub_1B02669A0();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v9);
  return sub_1B0266454();
}

void static SetDistanceUnitIntent.description.getter(uint64_t a1@<X8>)
{
  sub_1B01DF9A8(&qword_1EEE929B8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)qword_1EEE96638, a1);
}

void static SetDistanceUnitIntent.description.setter(uint64_t a1)
{
  sub_1B01DFA4C(a1, &qword_1EEE929B8, (uint64_t (*)(_QWORD))MEMORY[0x1E0C91128], (uint64_t)qword_1EEE96638);
}

uint64_t (*static SetDistanceUnitIntent.description.modify())()
{
  uint64_t v0;

  if (qword_1EEE929B8 != -1)
    swift_once();
  v0 = sub_1B026643C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE96638);
  OUTLINED_FUNCTION_32_0();
  return j__swift_endAccess;
}

uint64_t static SetDistanceUnitIntent.isDiscoverable.getter()
{
  return 1;
}

uint64_t static SetDistanceUnitIntent.parameterSummary.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96650);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96658);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_2_78();
  sub_1B0266538();
  sub_1B026652C();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96668);
  sub_1B0266520();
  swift_release();
  sub_1B026652C();
  sub_1B0266544();
  return sub_1B0266514();
}

unint64_t sub_1B0255F2C()
{
  unint64_t result;

  result = qword_1EEE96660;
  if (!qword_1EEE96660)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetDistanceUnitIntent, &type metadata for SetDistanceUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96660);
  }
  return result;
}

uint64_t SetDistanceUnitIntent.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char v26;

  v25 = a1;
  v1 = sub_1B0266550();
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_10();
  v22 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C08);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v4);
  v21 = (uint64_t)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10();
  v12 = v11 - v10;
  sub_1B026697C();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10();
  sub_1B0266DFC();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_10();
  sub_1B026844C();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_10();
  v16 = sub_1B0266994();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_10();
  v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96670);
  sub_1B0268404();
  sub_1B0266DCC();
  OUTLINED_FUNCTION_10_34();
  OUTLINED_FUNCTION_7_4();
  sub_1B02669A0();
  sub_1B0268404();
  sub_1B0266DCC();
  OUTLINED_FUNCTION_10_34();
  OUTLINED_FUNCTION_7_4();
  sub_1B02669A0();
  __swift_storeEnumTagSinglePayload(v12, 0, 1, v16);
  v26 = 2;
  sub_1B0266220();
  OUTLINED_FUNCTION_4_0((uint64_t)v8);
  OUTLINED_FUNCTION_4_0(v21);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v22, *MEMORY[0x1E0C91738], v24);
  sub_1B0257580();
  v18 = sub_1B0266304();
  result = sub_1B0166578();
  *v25 = v18;
  return result;
}

uint64_t SetDistanceUnitIntent.perform()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1B0256254()
{
  uint64_t v0;
  char v1;
  char v3;

  sub_1B0266358();
  sub_1B02662E0();
  swift_release();
  v1 = *(_BYTE *)(v0 + 32);
  if (qword_1ED2074D0 != -1)
    swift_once();
  v3 = v1;
  UnitManager.setPreferredDistanceUnit(_:)((WeatherCore::UnitConfiguration::Distance_optional)&v3);
  sub_1B0101508();
  static NSUserDefaults.postSettingsUpdatedNotification()();
  static WidgetUtilities.reloadWidget(reason:)();
  sub_1B0266238();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B025632C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1B011DF64;
  return SetDistanceUnitIntent.perform()(a1);
}

uint64_t sub_1B0256380()
{
  sub_1B0255F2C();
  return sub_1B02661FC();
}

void sub_1B02563A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1B0266424();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v1);
  SetDistanceUnitIntent.init()(&v3);
  sub_1B0255F2C();
  sub_1B0266430();
  sub_1B0266418();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C90);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B026640C();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B0256470(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  unint64_t v28;
  uint64_t v29;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96728);
  v2 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96730);
  MEMORY[0x1E0C80A78](v5);
  sub_1B0255F2C();
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  v28 = sub_1B02577E0();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v26 = sub_1B026637C();
  v6 = *(void (**)(char *, uint64_t))(v2 + 8);
  v6(v4, v29);
  v27 = v6;
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v25 = sub_1B026637C();
  v7 = v29;
  v6(v4, v29);
  sub_1B02663F4();
  v23 = 0xD000000000000018;
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v24 = sub_1B026637C();
  v27(v4, v7);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  v19[1] = a1;
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v23 = sub_1B026637C();
  v8 = v29;
  v9 = v27;
  v27(v4, v29);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v22 = sub_1B026637C();
  v9(v4, v8);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v21 = sub_1B026637C();
  v27(v4, v29);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v20 = sub_1B026637C();
  v10 = v29;
  v11 = v27;
  v27(v4, v29);
  sub_1B02663F4();
  sub_1B02663E8();
  swift_getKeyPath();
  sub_1B0266358();
  swift_release();
  sub_1B02663DC();
  swift_release();
  sub_1B02663E8();
  sub_1B0266400();
  v12 = sub_1B026637C();
  v11(v4, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96738);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1B026FF70;
  v14 = v25;
  *(_QWORD *)(v13 + 32) = v26;
  *(_QWORD *)(v13 + 40) = v14;
  v15 = v23;
  *(_QWORD *)(v13 + 48) = v24;
  *(_QWORD *)(v13 + 56) = v15;
  v16 = v21;
  *(_QWORD *)(v13 + 64) = v22;
  *(_QWORD *)(v13 + 72) = v16;
  *(_QWORD *)(v13 + 80) = v20;
  *(_QWORD *)(v13 + 88) = v12;
  v17 = sub_1B0266370();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1B0256C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1B02663C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1B02577E0();
  sub_1B0266358();
  swift_release();
  sub_1B0255F2C();
  sub_1B02663B8();
  v4 = sub_1B02663AC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93CA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_1B02663A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1B0256D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_1B0266394();
  v1 = sub_1B0266394();
  v2 = sub_1B0266394();
  v3 = sub_1B0266394();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C88);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B026B5B0;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  *(_QWORD *)(v4 + 56) = v3;
  v5 = sub_1B0266388();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_1B0256E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1B026634C();
  OUTLINED_FUNCTION_20_4();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_2_78();
  sub_1B0266340();
  sub_1B0266334();
  OUTLINED_FUNCTION_18_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93C80);
  v2 = OUTLINED_FUNCTION_43();
  *(_OWORD *)(v2 + 16) = xmmword_1B0269D50;
  *(_QWORD *)(v2 + 32) = v0;
  sub_1B0266328();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_67();
}

uint64_t sub_1B0256EE0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1B0266994();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1B02665A4();
  __swift_allocate_value_buffer(v4, qword_1EEEB0EF8);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEEB0EF8);
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  return sub_1B0266598();
}

uint64_t sub_1B0256FF4()
{
  uint64_t v0;

  if (qword_1EEE929C0 != -1)
    swift_once();
  v0 = sub_1B02665A4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEEB0EF8);
}

uint64_t sub_1B025703C()
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
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t result;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93470);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93478);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v5;
  v6 = sub_1B0266994();
  v21 = v6;
  MEMORY[0x1E0C80A78](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96718);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96720);
  v8 = *(_QWORD *)(v7 - 8);
  v22 = *(_QWORD *)(v8 + 72);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = swift_allocObject();
  v24 = xmmword_1B026EC50;
  v23 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_1B026EC50;
  v11 = v10 + v9;
  v19 = v10 + v9 + *(int *)(v7 + 48);
  *(_BYTE *)(v10 + v9) = 0;
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v20 = sub_1B026649C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v20);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93A80);
  *(_OWORD *)(swift_allocObject() + 16) = v24;
  sub_1B0266970();
  sub_1B0266970();
  v12 = (uint64_t)v16;
  v13 = (uint64_t)v17;
  sub_1B02664B4();
  v14 = (_BYTE *)(v11 + v22);
  v22 += v11 + *(int *)(v7 + 48);
  *v14 = 1;
  sub_1B0266970();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v21);
  __swift_storeEnumTagSinglePayload(v12, 1, 1, v20);
  *(_OWORD *)(swift_allocObject() + 16) = v24;
  sub_1B0266970();
  sub_1B0266970();
  sub_1B02664B4();
  sub_1B02664CC();
  sub_1B0257920();
  result = sub_1B0268398();
  qword_1EEEB0F10 = result;
  return result;
}

uint64_t *sub_1B025737C()
{
  if (qword_1EEE929C8 != -1)
    swift_once();
  return &qword_1EEEB0F10;
}

uint64_t sub_1B02573BC()
{
  uint64_t v0;
  unsigned int v1;

  sub_1B0268BC0();
  OUTLINED_FUNCTION_42_1();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_1B0257404(char a1)
{
  if ((a1 & 1) != 0)
    return 28011;
  else
    return 0x73656C696DLL;
}

uint64_t sub_1B025742C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B01400A8(*a1, *a2);
}

void sub_1B0257438()
{
  sub_1B025FD50();
}

uint64_t sub_1B0257440(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1B0258DC0(a1, *v1);
}

uint64_t sub_1B0257448(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1B026004C(a1, *v1);
}

uint64_t sub_1B0257450@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B02573BC();
  *a1 = result;
  return result;
}

uint64_t sub_1B025747C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B0257404(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B02574A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1B0256FF4();
  v3 = sub_1B02665A4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_1B02574E4()
{
  sub_1B0257580();
  return sub_1B02661C0();
}

uint64_t sub_1B025751C()
{
  sub_1B025737C();
  return sub_1B0267384();
}

uint64_t sub_1B0257538()
{
  sub_1B0257820();
  return sub_1B0266574();
}

void sub_1B0257570(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A9750;
}

unint64_t sub_1B0257580()
{
  unint64_t result;

  result = qword_1EEE96678;
  if (!qword_1EEE96678)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280620, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE96678);
  }
  return result;
}

unint64_t sub_1B02575C0()
{
  unint64_t result;

  result = qword_1EEE96688;
  if (!qword_1EEE96688)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetDistanceUnitIntent, &type metadata for SetDistanceUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96688);
  }
  return result;
}

unint64_t sub_1B0257600()
{
  unint64_t result;

  result = qword_1EEE96690;
  if (!qword_1EEE96690)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for SetDistanceUnitIntent, &type metadata for SetDistanceUnitIntent);
    atomic_store(result, (unint64_t *)&qword_1EEE96690);
  }
  return result;
}

uint64_t sub_1B025763C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B025764C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B0257660()
{
  unint64_t result;

  result = qword_1EEE966A0;
  if (!qword_1EEE966A0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280580, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966A0);
  }
  return result;
}

unint64_t sub_1B02576A0()
{
  unint64_t result;

  result = qword_1EEE966A8;
  if (!qword_1EEE966A8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280660, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966A8);
  }
  return result;
}

unint64_t sub_1B02576E0()
{
  unint64_t result;

  result = qword_1EEE966B0;
  if (!qword_1EEE966B0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280698, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966B0);
  }
  return result;
}

unint64_t sub_1B0257720()
{
  unint64_t result;

  result = qword_1EEE966B8;
  if (!qword_1EEE966B8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02805E8, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966B8);
  }
  return result;
}

unint64_t sub_1B0257760()
{
  unint64_t result;

  result = qword_1EEE966C0;
  if (!qword_1EEE966C0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02806C8, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966C0);
  }
  return result;
}

unint64_t sub_1B02577A0()
{
  unint64_t result;

  result = qword_1EEE966C8;
  if (!qword_1EEE966C8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02806F0, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966C8);
  }
  return result;
}

unint64_t sub_1B02577E0()
{
  unint64_t result;

  result = qword_1EEE966D0;
  if (!qword_1EEE966D0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280718, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966D0);
  }
  return result;
}

unint64_t sub_1B0257820()
{
  unint64_t result;

  result = qword_1EEE966D8;
  if (!qword_1EEE966D8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0280770, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966D8);
  }
  return result;
}

uint64_t sub_1B025785C()
{
  sub_1B0257580();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B02578A0()
{
  unint64_t result;

  result = qword_1EEE966E0;
  if (!qword_1EEE966E0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02807B0, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966E0);
  }
  return result;
}

unint64_t sub_1B02578E0()
{
  unint64_t result;

  result = qword_1EEE966E8;
  if (!qword_1EEE966E8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02807D8, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966E8);
  }
  return result;
}

unint64_t sub_1B0257920()
{
  unint64_t result;

  result = qword_1EEE966F0;
  if (!qword_1EEE966F0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02805A8, &unk_1E60BD0A0);
    atomic_store(result, (unint64_t *)&qword_1EEE966F0);
  }
  return result;
}

uint64_t sub_1B025795C()
{
  return sub_1B012C8B8(&qword_1EEE966F8, &qword_1EEE96700, MEMORY[0x1E0DEAF50]);
}

void type metadata accessor for SetDistanceUnitIntent()
{
  OUTLINED_FUNCTION_27_1();
}

uint64_t sub_1B0257994()
{
  return sub_1B012C8B8(&qword_1EEE96708, &qword_1EEE96710, MEMORY[0x1E0C916B0]);
}

void type metadata accessor for SetDistanceUnitIntents()
{
  OUTLINED_FUNCTION_27_1();
}

uint64_t sub_1B02579CC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0257A18 + 4 * byte_1B0280445[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B0257A4C + 4 * byte_1B0280440[v4]))();
}

uint64_t sub_1B0257A4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0257A54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0257A5CLL);
  return result;
}

uint64_t sub_1B0257A68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0257A70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B0257A74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0257A7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DistanceUnit()
{
  OUTLINED_FUNCTION_27_1();
}

void sub_1B0257A9C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0257AD8()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0257B14()
{
  OUTLINED_FUNCTION_13_49();
  __asm { BR              X10 }
}

uint64_t sub_1B0257B44()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0257B90()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0257BDC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0257C10()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0257D10()
{
  OUTLINED_FUNCTION_26_30();
  __asm { BR              X10 }
}

uint64_t sub_1B0257D4C()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0257D9C(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_100_4();
  else
    OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0257E08()
{
  return sub_1B0268518();
}

uint64_t sub_1B0257E20()
{
  return OUTLINED_FUNCTION_22_31();
}

void sub_1B0257E38()
{
  OUTLINED_FUNCTION_26_30();
  __asm { BR              X10 }
}

uint64_t sub_1B0257E74()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0257EB4(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B016B90C);
}

uint64_t sub_1B0257EC0(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B01866D4);
}

uint64_t sub_1B0257ECC(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B0134BB8);
}

void sub_1B0257ED8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0257F18()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0257F54()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0257FA0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0257FDC()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258018()
{
  sub_1B0268518();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0258048()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258088()
{
  sub_1B0268DE8();
  OUTLINED_FUNCTION_0_0();
}

void sub_1B02580A8()
{
  OUTLINED_FUNCTION_26_30();
  __asm { BR              X10 }
}

uint64_t sub_1B02580E4()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258134()
{
  OUTLINED_FUNCTION_70_4();
  __asm { BR              X10 }
}

uint64_t sub_1B025815C()
{
  OUTLINED_FUNCTION_74_5();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02581C4(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B01E37FC);
}

void sub_1B02581D0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258210()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258278()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02582DC()
{
  return OUTLINED_FUNCTION_22_31();
}

void sub_1B02582F4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B025833C()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02583AC()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258418(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B02189B8);
}

uint64_t sub_1B0258424(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B016A8D4);
}

uint64_t sub_1B0258430(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_100_4();
  else
    OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02584A0(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_100_4();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B025851C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258564()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B025865C()
{
  OUTLINED_FUNCTION_89_5();
  __asm { BR              X10 }
}

uint64_t sub_1B0258694()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B02586EC()
{
  sub_1B0268DE8();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1B0258718()
{
  sub_1B0268518();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B0258744(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_100_4();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02587C0()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258814()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258894()
{
  OUTLINED_FUNCTION_3_65();
  __asm { BR              X10 }
}

uint64_t sub_1B02588C4()
{
  OUTLINED_FUNCTION_48_13();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02588E8(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B01AA57C);
}

uint64_t sub_1B02588F4()
{
  return sub_1B0268518();
}

void sub_1B0258914(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258950()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B02589AC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B02589F8()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258A94(uint64_t a1, uint64_t a2)
{
  return sub_1B0258AA0(a1, a2, (void (*)(uint64_t))sub_1B00FE354);
}

uint64_t sub_1B0258AA0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  sub_1B0268518();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258ADC()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258B58()
{
  OUTLINED_FUNCTION_48_13();
  __asm { BR              X10 }
}

uint64_t sub_1B0258B88()
{
  OUTLINED_FUNCTION_3_65();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258BAC()
{
  sub_1B0268DE8();
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0258BD0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258C14()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258C60(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258C98()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258CE4()
{
  OUTLINED_FUNCTION_70_4();
  __asm { BR              X10 }
}

uint64_t sub_1B0258D0C()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258DC4()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258E04()
{
  OUTLINED_FUNCTION_26_30();
  __asm { BR              X10 }
}

uint64_t sub_1B0258E40()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258EBC()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258F10(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0258F54()
{
  OUTLINED_FUNCTION_83_5();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0258FA4(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0258FFC()
{
  OUTLINED_FUNCTION_26_30();
  __asm { BR              X10 }
}

uint64_t sub_1B0259038()
{
  OUTLINED_FUNCTION_10_47();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B0259078()
{
  return OUTLINED_FUNCTION_22_31();
}

uint64_t sub_1B0259090(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1B02590E8()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B025914C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0259184()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B0259244(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0259288()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

void sub_1B025931C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0259358()
{
  OUTLINED_FUNCTION_1_86();
  return OUTLINED_FUNCTION_1_1();
}

id UnitConfiguration.Precipitation.asUnit.getter()
{
  return sub_1B010DD38();
}

id UnitConfiguration.Pressure.asUnit.getter()
{
  void *v0;

  v0 = (void *)objc_opt_self();
  return OUTLINED_FUNCTION_85_5(v0);
}

id UnitConfiguration.Distance.asUnit.getter()
{
  return sub_1B010DD38();
}

void UnitConfiguration.WindSpeed.asUnit.getter()
{
  __asm { BR              X10 }
}

id sub_1B025943C()
{
  return objc_msgSend((id)objc_opt_self(), sel_milesPerHour);
}

void sub_1B025950C(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27_2();
  v2 = OUTLINED_FUNCTION_57_14();
  v3 = OUTLINED_FUNCTION_57_14();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_6_1();
}

WeatherCore::UnitConfiguration::Temperature_optional __swiftcall UnitConfiguration.Temperature.init(_:)(NSUnitTemperature a1)
{
  char *v1;
  WeatherCore::UnitConfiguration::Temperature_optional result;

  sub_1B025B494(a1.super.super.super.isa, (SEL *)&selRef_celsius, (unint64_t *)&qword_1ED207468, (SEL *)&selRef_fahrenheit, v1);
  return result;
}

uint64_t UnitConfiguration.Distance.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 28011;
  else
    return 0x73656C696DLL;
}

uint64_t UnitConfiguration.Precipitation.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6D63202C6D6DLL;
  else
    return 28265;
}

uint64_t UnitConfiguration.Pressure.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B0259618 + 4 * byte_1B0280927[*v0]))(1918984813, 0xE400000000000000);
}

uint64_t sub_1B0259618()
{
  return 1732800105;
}

uint64_t sub_1B0259628()
{
  return 1732799853;
}

uint64_t sub_1B0259634()
{
  return 6377576;
}

uint64_t sub_1B0259644()
{
  return 6377579;
}

uint64_t UnitConfiguration.Temperature.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 99;
  else
    return 102;
}

uint64_t sub_1B0259674(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x65636E6174736964 && a2 == 0xE800000000000000;
  if (v2 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7469706963657270 && a2 == 0xED00006E6F697461;
    if (v6 || (sub_1B0268D34() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6572757373657270 && a2 == 0xE800000000000000;
      if (v7 || (sub_1B0268D34() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275;
        if (v8 || (sub_1B0268D34() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x65657053646E6977 && a2 == 0xE900000000000064)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_1B0268D34();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_1B02598C8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B02598FC + 4 * byte_1B0280931[a1]))(0x65636E6174736964, 0xE800000000000000);
}

uint64_t sub_1B02598FC()
{
  return 0x7469706963657270;
}

uint64_t sub_1B0259920()
{
  return 0x6572757373657270;
}

uint64_t sub_1B0259934()
{
  return 0x74617265706D6574;
}

uint64_t sub_1B0259954()
{
  return 0x65657053646E6977;
}

uint64_t sub_1B0259970(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1B0268D34();
    OUTLINED_FUNCTION_27_2();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_1B02599D8()
{
  OUTLINED_FUNCTION_94_1();
  OUTLINED_FUNCTION_28_18();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B0259A00()
{
  unsigned __int8 *v0;

  return sub_1B02598C8(*v0);
}

uint64_t sub_1B0259A08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0259674(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0259A2C()
{
  sub_1B025A404();
  return sub_1B0268E54();
}

uint64_t sub_1B0259A54()
{
  sub_1B025A404();
  return sub_1B0268E60();
}

void sub_1B0259A7C()
{
  sub_1B02599D8();
}

uint64_t sub_1B0259A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0259970(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1B0259ABC()
{
  sub_1B025A530();
  return sub_1B0268E54();
}

uint64_t sub_1B0259AE4()
{
  sub_1B025A530();
  return sub_1B0268E60();
}

uint64_t sub_1B0259B0C()
{
  sub_1B025A4F4();
  return sub_1B0268E54();
}

uint64_t sub_1B0259B34()
{
  sub_1B025A4F4();
  return sub_1B0268E60();
}

uint64_t sub_1B0259B5C()
{
  sub_1B025A4B8();
  return sub_1B0268E54();
}

uint64_t sub_1B0259B84()
{
  sub_1B025A4B8();
  return sub_1B0268E60();
}

uint64_t sub_1B0259BAC()
{
  sub_1B025A47C();
  return sub_1B0268E54();
}

uint64_t sub_1B0259BD4()
{
  sub_1B025A47C();
  return sub_1B0268E60();
}

void sub_1B0259BFC()
{
  sub_1B0268DDC();
  OUTLINED_FUNCTION_28_18();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B0259C24()
{
  sub_1B025A440();
  return sub_1B0268E54();
}

uint64_t sub_1B0259C4C()
{
  sub_1B025A440();
  return sub_1B0268E60();
}

WeatherCore::UnitConfiguration::Distance_optional __swiftcall UnitConfiguration.Distance.init(rawValue:)(Swift::String rawValue)
{
  WeatherCore::UnitConfiguration::Distance_optional result;

  sub_1B0259D7C();
  return result;
}

void *static UnitConfiguration.Distance.allCases.getter()
{
  return &unk_1E60A97C8;
}

WeatherCore::UnitConfiguration::Distance_optional sub_1B0259C8C(Swift::String *a1)
{
  return UnitConfiguration.Distance.init(rawValue:)(*a1);
}

void sub_1B0259C98(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = UnitConfiguration.Distance.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0259CB8(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A97C8;
}

WeatherCore::UnitConfiguration::Precipitation_optional __swiftcall UnitConfiguration.Precipitation.init(rawValue:)(Swift::String rawValue)
{
  WeatherCore::UnitConfiguration::Precipitation_optional result;

  sub_1B0259D7C();
  return result;
}

void *static UnitConfiguration.Precipitation.allCases.getter()
{
  return &unk_1E60A9840;
}

WeatherCore::UnitConfiguration::Precipitation_optional sub_1B0259CE0(Swift::String *a1)
{
  return UnitConfiguration.Precipitation.init(rawValue:)(*a1);
}

void sub_1B0259CEC(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = UnitConfiguration.Precipitation.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0259D0C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A9840;
}

WeatherCore::UnitConfiguration::Pressure_optional __swiftcall UnitConfiguration.Pressure.init(rawValue:)(Swift::String rawValue)
{
  WeatherCore::UnitConfiguration::Pressure_optional result;

  sub_1B00E36BC();
  return result;
}

void *static UnitConfiguration.Pressure.allCases.getter()
{
  return &unk_1E60A9900;
}

WeatherCore::UnitConfiguration::Pressure_optional sub_1B0259D34(Swift::String *a1)
{
  return UnitConfiguration.Pressure.init(rawValue:)(*a1);
}

void sub_1B0259D40(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = UnitConfiguration.Pressure.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0259D60(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A9900;
}

WeatherCore::UnitConfiguration::Temperature_optional __swiftcall UnitConfiguration.Temperature.init(rawValue:)(Swift::String rawValue)
{
  WeatherCore::UnitConfiguration::Temperature_optional result;

  sub_1B0259D7C();
  return result;
}

void sub_1B0259D7C()
{
  char *v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_40_22();
  OUTLINED_FUNCTION_27_2();
  if (v1 == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!v1)
    v2 = 0;
  *v0 = v2;
  OUTLINED_FUNCTION_67();
}

void *static UnitConfiguration.Temperature.allCases.getter()
{
  return &unk_1E60A9978;
}

WeatherCore::UnitConfiguration::Temperature_optional sub_1B0259DC4(Swift::String *a1)
{
  return UnitConfiguration.Temperature.init(rawValue:)(*a1);
}

void sub_1B0259DD0(uint64_t *a1@<X8>)
{
  *a1 = UnitConfiguration.Temperature.rawValue.getter();
  a1[1] = 0xE100000000000000;
  OUTLINED_FUNCTION_0_0();
}

void sub_1B0259DF4(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A9978;
}

void *static UnitConfiguration.WindSpeed.allCases.getter()
{
  return &unk_1E60A9A38;
}

void sub_1B0259E10(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E60A9A38;
}

uint64_t UnitConfiguration.defaultWindSpeedUnits.getter()
{
  return sub_1B0267384();
}

uint64_t UnitConfiguration.defaultWindGustsUnits.getter()
{
  return sub_1B0267384();
}

uint64_t sub_1B0259E30(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x80000001B0290300 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001B0290320)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_1B0268D34();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B0259F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0259E30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0259F3C()
{
  sub_1B010DE9C();
  return sub_1B0268E54();
}

uint64_t sub_1B0259F64()
{
  sub_1B010DE9C();
  return sub_1B0268E60();
}

void sub_1B0259F8C()
{
  static ConfiguredUnit.read(from:)();
}

void sub_1B0259FA0()
{
  ConfiguredUnit.write(to:)();
}

void sub_1B0259FB4(uint64_t *a1@<X8>)
{
  static UnitConfiguration.read(from:)(a1);
}

void sub_1B0259FC8()
{
  UnitConfiguration.write(to:)();
}

void sub_1B0259FDC(char *a1@<X8>)
{
  static UnitConfiguration.Distance.read(from:)(a1);
}

void sub_1B0259FF0()
{
  UnitConfiguration.Distance.write(to:)();
}

void sub_1B025A004(char *a1@<X8>)
{
  static UnitConfiguration.Precipitation.read(from:)(a1);
}

void sub_1B025A018()
{
  UnitConfiguration.Precipitation.write(to:)();
}

void sub_1B025A02C(_BYTE *a1@<X8>)
{
  static UnitConfiguration.Pressure.read(from:)(a1);
}

void sub_1B025A040()
{
  UnitConfiguration.Pressure.write(to:)();
}

void sub_1B025A054(char *a1@<X8>)
{
  static UnitConfiguration.Temperature.read(from:)(a1);
}

void sub_1B025A068()
{
  UnitConfiguration.Temperature.write(to:)();
}

void sub_1B025A07C(_BYTE *a1@<X8>)
{
  static UnitConfiguration.WindSpeed.read(from:)(a1);
}

void sub_1B025A090()
{
  UnitConfiguration.WindSpeed.write(to:)();
}

void ConfiguredUnit.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
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
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_97();
  v1 = v0;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96750);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_45_18(v5, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96758);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96760);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_46_15(v8, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96768);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96770);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_22_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96778);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_23();
  v12 = *(unsigned __int8 *)(v1 + 1);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1B025A404();
  sub_1B0268E30();
  __asm { BR              X9 }
}

void sub_1B025A228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  *(_BYTE *)(v4 - 81) = 0;
  sub_1B025A530();
  OUTLINED_FUNCTION_6_59();
  *(_BYTE *)(v4 - 82) = *(_DWORD *)(v4 - 116);
  sub_1B010DA18();
  sub_1B0268CA4();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  v5 = OUTLINED_FUNCTION_93_2();
  v6(v5, v0);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1B025A404()
{
  unint64_t result;

  result = qword_1EEE96780;
  if (!qword_1EEE96780)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281C9C, &type metadata for ConfiguredUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96780);
  }
  return result;
}

unint64_t sub_1B025A440()
{
  unint64_t result;

  result = qword_1EEE96788;
  if (!qword_1EEE96788)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281C4C, &type metadata for ConfiguredUnit.WindSpeedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96788);
  }
  return result;
}

unint64_t sub_1B025A47C()
{
  unint64_t result;

  result = qword_1EEE96790;
  if (!qword_1EEE96790)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281BFC, &type metadata for ConfiguredUnit.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96790);
  }
  return result;
}

unint64_t sub_1B025A4B8()
{
  unint64_t result;

  result = qword_1EEE96798;
  if (!qword_1EEE96798)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281BAC, &type metadata for ConfiguredUnit.PressureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96798);
  }
  return result;
}

unint64_t sub_1B025A4F4()
{
  unint64_t result;

  result = qword_1EEE967A0;
  if (!qword_1EEE967A0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281B5C, &type metadata for ConfiguredUnit.PrecipitationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE967A0);
  }
  return result;
}

unint64_t sub_1B025A530()
{
  unint64_t result;

  result = qword_1EEE967A8;
  if (!qword_1EEE967A8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281B0C, &type metadata for ConfiguredUnit.DistanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE967A8);
  }
  return result;
}

void ConfiguredUnit.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;

  OUTLINED_FUNCTION_97();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967B0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_45_18(v4, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967B8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967C0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967C8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_37();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967D0);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_22_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE967D8);
  OUTLINED_FUNCTION_37_26();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10();
  v12 = v11 - v10;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_1B025A404();
  sub_1B0268E24();
  if (!v0)
  {
    v13 = sub_1B0268C68();
    v14 = *(_QWORD *)(v13 + 16);
    if (v14)
    {
      v15 = *(unsigned __int8 *)(v13 + 32);
      sub_1B018230C(1, v14, v13, v13 + 32, 0, (2 * v14) | 1);
      v17 = v16;
      v19 = v18;
      swift_bridgeObjectRelease();
      if (v17 == v19 >> 1)
        __asm { BR              X9 }
    }
    v20 = sub_1B0268AF4();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE93B80);
    *v22 = &type metadata for ConfiguredUnit;
    sub_1B0268BE4();
    sub_1B0268AE8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x1E0DEC450], v20);
    swift_willThrow();
    OUTLINED_FUNCTION_19_43();
    OUTLINED_FUNCTION_82_4();
    OUTLINED_FUNCTION_38_22(v12, v23);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_0_2();
}

void sub_1B025AB34()
{
  ConfiguredUnit.init(from:)();
}

void sub_1B025AB48()
{
  ConfiguredUnit.encode(to:)();
}

uint64_t sub_1B025AB5C()
{
  sub_1B025DD70();
  return sub_1B026859C();
}

uint64_t sub_1B025ABB8()
{
  sub_1B025DD70();
  return sub_1B0268584();
}

uint64_t sub_1B025AC04()
{
  sub_1B025DD34();
  return sub_1B026859C();
}

uint64_t sub_1B025AC60()
{
  sub_1B025DD34();
  return sub_1B0268584();
}

uint64_t sub_1B025ACAC()
{
  sub_1B025DCF8();
  return sub_1B026859C();
}

uint64_t sub_1B025AD08()
{
  sub_1B025DCF8();
  return sub_1B0268584();
}

uint64_t sub_1B025AD54()
{
  sub_1B025DCBC();
  return sub_1B026859C();
}

uint64_t sub_1B025ADB0()
{
  sub_1B025DCBC();
  return sub_1B0268584();
}

void static ConfiguredUnit.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X11 }
}

BOOL sub_1B025AE34@<W0>(int a1@<W0>, int a2@<W1>, int a3@<W8>)
{
  if (a3)
    return 0;
  if (a1 != 2)
    return a2 != 2 && (sub_1B01400A8(a1 & 1, a2 & 1) & 1) != 0;
  return a2 == 2;
}

void sub_1B025AF28(char *a1, char *a2)
{
  sub_1B01400AC(*a1, *a2);
}

void sub_1B025AF34(char *a1, char *a2)
{
  sub_1B0140120(*a1, *a2);
}

void sub_1B025AF40(char *a1)
{
  sub_1B014017C(*a1);
}

void ConfiguredUnit.hash(into:)()
{
  __asm { BR              X10 }
}

void sub_1B025AF80()
{
  int v0;

  sub_1B0268DE8();
  if (v0 == 2)
  {
    OUTLINED_FUNCTION_3_48();
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    OUTLINED_FUNCTION_2_66();
    OUTLINED_FUNCTION_1_86();
    OUTLINED_FUNCTION_1_1();
  }
}

void ConfiguredUnit.hashValue.getter()
{
  OUTLINED_FUNCTION_94_1();
  ConfiguredUnit.hash(into:)();
  sub_1B0268E0C();
  OUTLINED_FUNCTION_60();
}

uint64_t sub_1B025B0D8()
{
  sub_1B0268DDC();
  ConfiguredUnit.hash(into:)();
  return sub_1B0268E0C();
}

void UnitConfiguration.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v4 = *v1;
  v3 = v1[1];
  if (*v1)
  {
    OUTLINED_FUNCTION_6_29();
    OUTLINED_FUNCTION_33_0();
    sub_1B00E17BC(a1, v4);
    OUTLINED_FUNCTION_34();
    if (v3)
    {
LABEL_3:
      OUTLINED_FUNCTION_6_29();
      OUTLINED_FUNCTION_76_0();
      sub_1B00E17BC(a1, v3);
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    OUTLINED_FUNCTION_6_29();
    if (v3)
      goto LABEL_3;
  }
  OUTLINED_FUNCTION_6_29();
  OUTLINED_FUNCTION_67();
}

uint64_t UnitConfiguration.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v2 = *v0;
  v1 = v0[1];
  OUTLINED_FUNCTION_94_1();
  if (v2)
  {
    OUTLINED_FUNCTION_2_66();
    OUTLINED_FUNCTION_33_0();
    sub_1B00E17BC((uint64_t)v4, v2);
    OUTLINED_FUNCTION_34();
  }
  else
  {
    OUTLINED_FUNCTION_3_48();
  }
  if (v1)
  {
    OUTLINED_FUNCTION_2_66();
    OUTLINED_FUNCTION_76_0();
    sub_1B00E17BC((uint64_t)v4, v1);
    OUTLINED_FUNCTION_27_2();
  }
  else
  {
    OUTLINED_FUNCTION_3_48();
  }
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_1B025B230()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v2 = *v0;
  v1 = v0[1];
  sub_1B0268DDC();
  sub_1B0268DF4();
  if (v2)
  {
    sub_1B0267384();
    sub_1B00E17BC((uint64_t)v4, v2);
    swift_bridgeObjectRelease();
  }
  sub_1B0268DF4();
  if (v1)
  {
    sub_1B0267384();
    sub_1B00E17BC((uint64_t)v4, v1);
    swift_bridgeObjectRelease();
  }
  return sub_1B0268E0C();
}

uint64_t sub_1B025B2DC()
{
  unsigned __int8 *v0;

  return sub_1B0260E50(*v0);
}

uint64_t sub_1B025B2E4()
{
  return sub_1B0258DC4();
}

void sub_1B025B2FC()
{
  sub_1B025FD6C();
}

uint64_t sub_1B025B304()
{
  return sub_1B0258048();
}

void sub_1B025B30C()
{
  sub_1B02603C0();
}

void sub_1B025B314()
{
  sub_1B025FD78();
}

void sub_1B025B31C(uint64_t a1)
{
  char *v1;

  sub_1B0258C60(a1, *v1);
}

void sub_1B025B334()
{
  sub_1B0260458();
}

void sub_1B025B33C()
{
  sub_1B025FD84();
}

uint64_t sub_1B025B344()
{
  return sub_1B0258018();
}

void sub_1B025B34C()
{
  sub_1B026037C();
}

void sub_1B025B354()
{
  sub_1B025FD90();
}

void sub_1B025B35C(uint64_t a1)
{
  char *v1;

  sub_1B0257FA0(a1, *v1);
}

void sub_1B025B364()
{
  sub_1B0260464();
}

id sub_1B025B36C()
{
  id result;

  result = sub_1B025B3AC(1);
  qword_1EEE96740 = (uint64_t)result;
  return result;
}

id sub_1B025B38C()
{
  id result;

  result = sub_1B025B3AC(2);
  qword_1EEE96748 = (uint64_t)result;
  return result;
}

id sub_1B025B3AC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t);

  v2 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_10();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3760]), sel_init);
  objc_msgSend(v3, sel_setUnitStyle_, a1);
  sub_1B0266D90();
  v4 = (void *)sub_1B0266D84();
  v5 = OUTLINED_FUNCTION_50_16();
  v6(v5);
  objc_msgSend(v3, sel_setLocale_, v4);

  return v3;
}

WeatherCore::UnitConfiguration::Distance_optional __swiftcall UnitConfiguration.Distance.init(_:)(NSUnitLength a1)
{
  char *v1;
  WeatherCore::UnitConfiguration::Distance_optional result;

  sub_1B025B494(a1.super.super.super.isa, (SEL *)&selRef_kilometers, &qword_1ED2010E8, (SEL *)&selRef_miles, v1);
  return result;
}

void sub_1B025B494(void *a1@<X0>, SEL *a2@<X2>, unint64_t *a3@<X3>, SEL *a4@<X4>, char *a5@<X8>)
{
  void *v10;
  id v11;
  id v12;
  char v13;
  char v14;
  char v15;
  id v16;
  id v17;

  v10 = (void *)objc_opt_self();
  v11 = a1;
  v12 = objc_msgSend(v10, *a2);
  v13 = sub_1B00F07C0(0, a3);
  v14 = sub_1B0268974();

  if ((v14 & 1) != 0)
  {

    v15 = 1;
  }
  else
  {
    v16 = v11;
    v17 = objc_msgSend(v10, *a4);
    sub_1B0268974();
    OUTLINED_FUNCTION_67_5();

    if ((v13 & 1) != 0)
      v15 = 0;
    else
      v15 = 2;
  }
  *a5 = v15;
}

WeatherCore::UnitConfiguration::Precipitation_optional __swiftcall UnitConfiguration.Precipitation.init(_:)(NSUnitLength a1)
{
  char *v1;
  Class isa;
  char *v3;
  objc_class *v4;
  uint64_t v5;
  char v6;
  char v7;
  objc_class *v8;
  id v9;
  objc_class *v10;
  id v11;
  WeatherCore::UnitConfiguration::Precipitation_optional result;

  isa = a1.super.super.super.isa;
  v3 = v1;
  objc_opt_self();
  v4 = isa;
  v5 = (uint64_t)OUTLINED_FUNCTION_7_5((uint64_t)v4, sel_centimeters);
  v6 = OUTLINED_FUNCTION_95_2(v5, &qword_1ED2010E8);
  OUTLINED_FUNCTION_11_46();
  OUTLINED_FUNCTION_1_85();

  if ((0xE0CB3AD8 & 1) != 0)
  {

    v7 = 1;
  }
  else
  {
    v8 = v4;
    v9 = OUTLINED_FUNCTION_7_5((uint64_t)v8, sel_inches);
    OUTLINED_FUNCTION_11_46();
    OUTLINED_FUNCTION_42_16();

    if ((v5 & 1) != 0)
    {

      v7 = 0;
    }
    else
    {
      v10 = v8;
      v11 = OUTLINED_FUNCTION_7_5((uint64_t)v10, sel_millimeters);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_67_5();

      if ((v6 & 1) != 0)
        v7 = 1;
      else
        v7 = 2;
    }
  }
  *v3 = v7;
  OUTLINED_FUNCTION_6_1();
  return result;
}

WeatherCore::UnitConfiguration::Pressure_optional __swiftcall UnitConfiguration.Pressure.init(_:)(NSUnitPressure a1)
{
  char *v1;
  Class isa;
  char *v3;
  objc_class *v4;
  uint64_t v5;
  char v6;
  char v7;
  objc_class *v8;
  id v9;
  objc_class *v10;
  id v11;
  objc_class *v12;
  id v13;
  WeatherCore::UnitConfiguration::Pressure_optional result;

  isa = a1.super.super.super.isa;
  v3 = v1;
  objc_opt_self();
  v4 = isa;
  v5 = (uint64_t)OUTLINED_FUNCTION_7_5((uint64_t)v4, sel_hectopascals);
  v6 = OUTLINED_FUNCTION_95_2(v5, &qword_1ED2010F8);
  OUTLINED_FUNCTION_11_46();
  OUTLINED_FUNCTION_1_85();

  if ((0xE0CB3AF0 & 1) != 0)
  {

    v7 = 3;
  }
  else
  {
    v8 = v4;
    v9 = OUTLINED_FUNCTION_7_5((uint64_t)v8, sel_inchesOfMercury);
    OUTLINED_FUNCTION_11_46();
    OUTLINED_FUNCTION_42_16();

    if ((v5 & 1) != 0)
    {

      v7 = 1;
    }
    else
    {
      v10 = v8;
      v11 = OUTLINED_FUNCTION_7_5((uint64_t)v10, sel_millibars);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_42_16();

      v12 = v10;
      v13 = OUTLINED_FUNCTION_7_5((uint64_t)v12, sel_millimetersOfMercury);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_67_5();

      if ((v6 & 1) != 0)
        v7 = 2;
      else
        v7 = 5;
    }
  }
  *v3 = v7;
  OUTLINED_FUNCTION_6_1();
  return result;
}

WeatherCore::UnitConfiguration::WindSpeed_optional __swiftcall UnitConfiguration.WindSpeed.init(_:)(NSUnitSpeed a1)
{
  char *v1;
  char v2;
  char v3;
  char *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  char v8;
  id v9;
  char v10;
  objc_class *v11;
  id v12;
  objc_class *v13;
  id v14;
  objc_class *v15;
  id v16;
  objc_class *v17;
  id v18;
  WeatherCore::UnitConfiguration::WindSpeed_optional result;

  v4 = v1;
  v5 = qword_1ED202190;
  v6 = a1.super.super.super.isa;
  if (v5 != -1)
    swift_once();
  v7 = (void *)qword_1ED202188;
  v8 = sub_1B00F07C0(0, (unint64_t *)&qword_1ED207110);
  v9 = v7;
  OUTLINED_FUNCTION_11_46();
  OUTLINED_FUNCTION_1_85();

  if ((v2 & 1) != 0)
  {

    v10 = 3;
  }
  else
  {
    objc_opt_self();
    v11 = v6;
    v12 = OUTLINED_FUNCTION_7_5((uint64_t)v11, sel_kilometersPerHour);
    OUTLINED_FUNCTION_11_46();
    OUTLINED_FUNCTION_42_16();

    if ((v3 & 1) != 0)
    {

      v10 = 1;
    }
    else
    {
      v13 = v11;
      v14 = OUTLINED_FUNCTION_7_5((uint64_t)v13, sel_knots);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_42_16();

      v15 = v13;
      v16 = OUTLINED_FUNCTION_7_5((uint64_t)v15, sel_metersPerSecond);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_42_16();

      v17 = v15;
      v18 = OUTLINED_FUNCTION_7_5((uint64_t)v17, sel_milesPerHour);
      OUTLINED_FUNCTION_11_46();
      OUTLINED_FUNCTION_67_5();

      if ((v8 & 1) != 0)
        v10 = 0;
      else
        v10 = 5;
    }
  }
  *v4 = v10;
  OUTLINED_FUNCTION_6_1();
  return result;
}

void ConfiguredUnit.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1B025B99C()
{
  int v0;

  if (v0 != 2)
  {
    OUTLINED_FUNCTION_68_6();
    UnitConfiguration.Distance.symbol.getter();
  }
  sub_1B0268530();
  OUTLINED_FUNCTION_27_2();
  return 0x65636E6174736964;
}

uint64_t UnitConfiguration.Distance.symbol.getter()
{
  return sub_1B025BD50(0x1E0CB3AD8, (const char **)&selRef_kilometers, (const char **)&selRef_miles);
}

void UnitConfiguration.Precipitation.symbol.getter()
{
  _BYTE *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  if ((*v0 & 1) != 0)
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    v1 = (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_43_22();
    sub_1B0266934();
    goto LABEL_7;
  }
  v2 = objc_msgSend((id)objc_opt_self(), sel_inches);
  OUTLINED_FUNCTION_64_9();
  v4 = v3;

  if (!v4)
  {
    v6 = OUTLINED_FUNCTION_7_5(v5, sel_inches);
    v7 = objc_msgSend(v6, sel_symbol);

    OUTLINED_FUNCTION_55_13();
LABEL_7:
    OUTLINED_FUNCTION_25_27();
  }
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_44_23();
}

uint64_t UnitConfiguration.Pressure.symbol.getter()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  SEL *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v1 = *v0;
  v2 = (void *)objc_opt_self();
  v3 = OUTLINED_FUNCTION_85_5(v2);
  OUTLINED_FUNCTION_64_9();
  OUTLINED_FUNCTION_25_27();
  if (!v0)
  {
    if (qword_1EEE929D8 != -1)
      swift_once();
    v4 = (void *)qword_1EEE96748;
    v5 = (SEL *)off_1E60BDAC0[v1];
    v6 = (void *)objc_opt_self();
    v7 = v4;
    v8 = objc_msgSend(v6, *v5);
    v9 = objc_msgSend(v7, sel_stringFromUnit_, v8);

    OUTLINED_FUNCTION_55_13();
    OUTLINED_FUNCTION_25_27();
  }
  return OUTLINED_FUNCTION_24_1();
}

uint64_t UnitConfiguration.Temperature.symbol.getter()
{
  return sub_1B025BD50(0x1E0CB3B00, (const char **)&selRef_celsius, (const char **)&selRef_fahrenheit);
}

uint64_t sub_1B025BD50(uint64_t a1, const char **a2, const char **a3)
{
  unsigned __int8 *v3;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  const char **v15;
  id v16;
  id v17;

  v6 = *v3;
  v7 = (void *)objc_opt_self();
  v8 = OUTLINED_FUNCTION_79_5(v7);
  v9 = OUTLINED_FUNCTION_64_9();
  v11 = v10;

  if (!v11)
  {
    if (qword_1EEE929D0 != -1)
      swift_once();
    v12 = (void *)qword_1EEE96740;
    objc_opt_self();
    v13 = v12;
    v14 = v13;
    if (v6)
      v15 = a2;
    else
      v15 = a3;
    v16 = OUTLINED_FUNCTION_11_21((uint64_t)v13, *v15);
    v17 = objc_msgSend(v14, sel_stringFromUnit_, v16);

    v9 = OUTLINED_FUNCTION_55_13();
  }
  return v9;
}

void UnitConfiguration.WindSpeed.symbol.getter()
{
  __asm { BR              X9 }
}

void sub_1B025BE9C()
{
  uint64_t v0;
  unsigned int v1;
  void *v2;

  v2 = (void *)OUTLINED_FUNCTION_52_16();
  OUTLINED_FUNCTION_85_5(v2);
  OUTLINED_FUNCTION_64_9();
  OUTLINED_FUNCTION_25_27();
  if (v0)
  {
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_44_23();
  }
  else
  {
    if (qword_1EEE929D0 != -1)
      swift_once();
    ((void (*)(void))((char *)&loc_1B025BF78 + *((int *)qword_1B025C0B8 + v1)))();
  }
}

uint64_t sub_1B025C0D0()
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t KeyPath;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE939F8);
  v66 = *(_QWORD *)(v3 - 8);
  v67 = v3;
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_37();
  v63 = v5;
  v6 = sub_1B0266904();
  v64 = *(_QWORD *)(v6 - 8);
  v65 = v6;
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_46_15(v8, v47);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96918);
  v61 = *(_QWORD *)(v59 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_37();
  v57 = v10;
  v11 = sub_1B0266DFC();
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_4_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96920);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_5_4();
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96928);
  v52 = *(_QWORD *)(v53 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_23();
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96930);
  v49 = *(_QWORD *)(v50 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_10();
  v18 = v17 - v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96938);
  v51 = *(_QWORD *)(v19 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v20);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v47 - v22;
  v62 = sub_1B0266928();
  v60 = *(_QWORD *)(v62 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_22_7();
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96940);
  v58 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_10();
  v28 = v27 - v26;
  sub_1B00F07C0(0, &qword_1EEE96948);
  v29 = v54;
  sub_1B0266724();
  sub_1B0266754();
  sub_1B02669B8();
  sub_1B0266D90();
  sub_1B025DDAC();
  sub_1B02669AC();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96950);
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v30);
  sub_1B026667C();
  sub_1B00C97D0(v0, &qword_1EEE96920);
  v31 = OUTLINED_FUNCTION_93_2();
  v32(v31, v53);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v18, v50);
  sub_1B0266DCC();
  sub_1B0266748();
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v1, v56);
  v33 = *(void (**)(uint64_t))(v51 + 8);
  v34 = OUTLINED_FUNCTION_50_16();
  v33(v34);
  sub_1B026673C();
  v35 = v23;
  v36 = v28;
  v37 = v48;
  ((void (*)(char *, uint64_t))v33)(v35, v19);
  sub_1B0101E24(&qword_1EEE96958, &qword_1EEE96918);
  v38 = v59;
  sub_1B026676C();
  v39 = OUTLINED_FUNCTION_93_2();
  v40(v39, v38);
  sub_1B026691C();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_1B00E69A8(&qword_1EEE96960, MEMORY[0x1E0CAECD8]);
  v41 = v63;
  sub_1B0266910();
  swift_release();
  v42 = OUTLINED_FUNCTION_93_2();
  v43(v42);
  v68 = v2;
  v44 = sub_1B0176E70((void (*)(uint64_t *__return_ptr, uint64_t))sub_1B025DE68);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v41, v67);
  if (*(_QWORD *)(v44 + 16))
  {
    v45 = *(_QWORD *)(v44 + 32);
    sub_1B0267384();
  }
  else
  {
    v45 = 0;
  }
  OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v36, v37);
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v2, v62);
  return v45;
}

void UnitConfiguration.Distance.description.getter()
{
  _BYTE *v0;

  if (*v0 == 1)
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
  }
  else
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_15_0();
  }
  sub_1B0266934();
  OUTLINED_FUNCTION_14_44();
  OUTLINED_FUNCTION_50_16();
  OUTLINED_FUNCTION_42_0();
}

void UnitConfiguration.Precipitation.description.getter()
{
  _BYTE *v0;
  id v1;
  id v2;

  if ((*v0 & 1) != 0)
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    v1 = (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_5_63();
  }
  else
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    v2 = (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_5_63();
  }
  sub_1B0266934();
  OUTLINED_FUNCTION_14_44();
  OUTLINED_FUNCTION_50_16();
  OUTLINED_FUNCTION_42_0();
}

void UnitConfiguration.Pressure.description.getter()
{
  __asm { BR              X10 }
}

void sub_1B025C834()
{
  id v0;

  if (qword_1ED2032E8 != -1)
    swift_once();
  v0 = (id)qword_1ED2189D0;
  OUTLINED_FUNCTION_31_27();
  OUTLINED_FUNCTION_0_30();
  sub_1B0266934();
  OUTLINED_FUNCTION_14_44();
  OUTLINED_FUNCTION_50_16();
  OUTLINED_FUNCTION_42_0();
}

void UnitConfiguration.Temperature.description.getter()
{
  _BYTE *v0;
  id v1;
  id v2;

  if (*v0 == 1)
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    v1 = (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_5_63();
  }
  else
  {
    if (qword_1ED2032E8 != -1)
      swift_once();
    v2 = (id)qword_1ED2189D0;
    OUTLINED_FUNCTION_0_30();
    OUTLINED_FUNCTION_5_63();
  }
  sub_1B0266934();
  OUTLINED_FUNCTION_14_44();
  OUTLINED_FUNCTION_50_16();
  OUTLINED_FUNCTION_42_0();
}

void UnitConfiguration.WindSpeed.accessibilityDescription.getter()
{
  __asm { BR              X10 }
}

void sub_1B025CC00()
{
  UnitConfiguration.WindSpeed.description.getter();
  OUTLINED_FUNCTION_42_0();
}

uint64_t sub_1B025CD6C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96990);
  return sub_1B02683F8() & 1;
}

uint64_t sub_1B025CDC4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96990);
  return sub_1B02683BC();
}

uint64_t sub_1B025CE08()
{
  sub_1B00E69A8(&qword_1EEE96960, MEMORY[0x1E0CAECD8]);
  return sub_1B026694C();
}

void sub_1B025CE50(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;

  v41 = a2;
  v45 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96968);
  MEMORY[0x1E0C80A78](v4);
  v44 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE939E8);
  MEMORY[0x1E0C80A78](v38);
  v43 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B02668EC();
  v39 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  MEMORY[0x1E0C80A78](v7);
  v37 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B02668BC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96970);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96978);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v36 - v21;
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v10 + 104))((char *)&v36 - v21, *MEMORY[0x1E0CAECA8], v9, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v9);
  v23 = (uint64_t)&v15[*(int *)(v13 + 48)];
  v42 = a1;
  sub_1B00FB620(a1, (uint64_t)v15, &qword_1EEE96978);
  sub_1B00FB620((uint64_t)v22, v23, &qword_1EEE96978);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9) == 1)
  {
    sub_1B00C97D0((uint64_t)v22, &qword_1EEE96978);
    if (__swift_getEnumTagSinglePayload(v23, 1, v9) == 1)
    {
      sub_1B00C97D0((uint64_t)v15, &qword_1EEE96978);
LABEL_8:
      v26 = v37;
      sub_1B02668E0();
      v27 = *(int *)(v38 + 48);
      v28 = v43;
      v29 = v43 + v27;
      v30 = v42 + v27;
      sub_1B00FB620(v42, v43, &qword_1EEE96978);
      sub_1B00FB620(v30, v29, &qword_1EEE96980);
      sub_1B02668F8();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v40);
      v31 = sub_1B02684C4();
      v33 = v32;
      sub_1B00C97D0(v29, &qword_1EEE96980);
      sub_1B00C97D0(v28, &qword_1EEE96978);
      v34 = v45;
      *v45 = v31;
      v34[1] = v33;
      return;
    }
    goto LABEL_6;
  }
  sub_1B00FB620((uint64_t)v15, (uint64_t)v18, &qword_1EEE96978);
  if (__swift_getEnumTagSinglePayload(v23, 1, v9) == 1)
  {
    sub_1B00C97D0((uint64_t)v22, &qword_1EEE96978);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
LABEL_6:
    sub_1B00C97D0((uint64_t)v15, &qword_1EEE96970);
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, v23, v9);
  sub_1B00E69A8(&qword_1EEE96988, (void (*)(uint64_t))MEMORY[0x1E0CAECB8]);
  v24 = sub_1B02683F8();
  v25 = *(void (**)(char *, uint64_t))(v10 + 8);
  v25(v12, v9);
  sub_1B00C97D0((uint64_t)v22, &qword_1EEE96978);
  v25(v18, v9);
  sub_1B00C97D0((uint64_t)v15, &qword_1EEE96978);
  if ((v24 & 1) != 0)
    goto LABEL_8;
LABEL_9:
  v35 = v45;
  *v45 = 0;
  v35[1] = 0;
}

void sub_1B025D270()
{
  sub_1B0101E24(&qword_1EEE967E0, &qword_1EEE967E8);
}

void sub_1B025D29C()
{
  sub_1B0101E24(&qword_1EEE967F0, &qword_1EEE967F8);
}

void sub_1B025D2C8()
{
  sub_1B0101E24(&qword_1EEE96800, &qword_1EEE96808);
}

void sub_1B025D2F4()
{
  sub_1B0101E24(&qword_1EEE96810, &qword_1EEE96818);
}

void sub_1B025D320()
{
  sub_1B0101E24(&qword_1EEE96820, &qword_1EEE96828);
}

unint64_t sub_1B025D350()
{
  unint64_t result;

  result = qword_1EEE96830;
  if (!qword_1EEE96830)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for ConfiguredUnit, &type metadata for ConfiguredUnit);
    atomic_store(result, (unint64_t *)&qword_1EEE96830);
  }
  return result;
}

unint64_t sub_1B025D390()
{
  unint64_t result;

  result = qword_1EEE96838;
  if (!qword_1EEE96838)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration, &type metadata for UnitConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EEE96838);
  }
  return result;
}

unint64_t sub_1B025D3D0()
{
  unint64_t result;

  result = qword_1EEE96840;
  if (!qword_1EEE96840)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Distance, &type metadata for UnitConfiguration.Distance);
    atomic_store(result, (unint64_t *)&qword_1EEE96840);
  }
  return result;
}

unint64_t sub_1B025D410()
{
  unint64_t result;

  result = qword_1EEE96848;
  if (!qword_1EEE96848)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Precipitation, &type metadata for UnitConfiguration.Precipitation);
    atomic_store(result, (unint64_t *)&qword_1EEE96848);
  }
  return result;
}

unint64_t sub_1B025D450()
{
  unint64_t result;

  result = qword_1EEE96850;
  if (!qword_1EEE96850)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Pressure, &type metadata for UnitConfiguration.Pressure);
    atomic_store(result, (unint64_t *)&qword_1EEE96850);
  }
  return result;
}

unint64_t sub_1B025D490()
{
  unint64_t result;

  result = qword_1EEE96858;
  if (!qword_1EEE96858)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Temperature, &type metadata for UnitConfiguration.Temperature);
    atomic_store(result, (unint64_t *)&qword_1EEE96858);
  }
  return result;
}

unint64_t sub_1B025D4D0()
{
  unint64_t result;

  result = qword_1ED201E80;
  if (!qword_1ED201E80)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.WindSpeed, &type metadata for UnitConfiguration.WindSpeed);
    atomic_store(result, (unint64_t *)&qword_1ED201E80);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConfiguredUnit(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 65284 <= 0xFFFEFFFF)
      v2 = 2;
    else
      v2 = 4;
    if (a2 + 65284 < 0xFF0000)
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
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    else
    {
      v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((_BYTE *)a1 + 2))
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 16)) - 65285;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  if (v6 <= 4)
    v5 = -1;
  else
    v5 = v6 ^ 0xFF;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfiguredUnit(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65284 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65284 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1B025D5F4 + 4 * byte_1B0280963[v4]))();
  *a1 = a2 - 252;
  return ((uint64_t (*)(void))((char *)sub_1B025D628 + 4 * byte_1B028095E[v4]))();
}

uint64_t sub_1B025D628(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1B025D630(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1B025D638);
  return result;
}

uint64_t sub_1B025D644(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1B025D64CLL);
  *(_BYTE *)(result + 1) = -(char)a2;
  return result;
}

uint64_t sub_1B025D650(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1B025D658(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1B025D664(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1);
}

uint64_t sub_1B025D66C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 1) = a2;
  return result;
}

_QWORD *assignWithCopy for UnitConfiguration(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1B0267384();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  sub_1B0267384();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for UnitConfiguration(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.CodingKeys()
{
  return &type metadata for ConfiguredUnit.CodingKeys;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.DistanceCodingKeys()
{
  return &type metadata for ConfiguredUnit.DistanceCodingKeys;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.PrecipitationCodingKeys()
{
  return &type metadata for ConfiguredUnit.PrecipitationCodingKeys;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.PressureCodingKeys()
{
  return &type metadata for ConfiguredUnit.PressureCodingKeys;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.TemperatureCodingKeys()
{
  return &type metadata for ConfiguredUnit.TemperatureCodingKeys;
}

uint64_t _s11WeatherCore14ConfiguredUnitO18DistanceCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B025D7A0 + 4 * byte_1B028097C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B025D7C0 + 4 * byte_1B0280981[v4]))();
}

_BYTE *sub_1B025D7A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B025D7C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B025D7C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B025D7D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B025D7D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B025D7E0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ConfiguredUnit.WindSpeedCodingKeys()
{
  return &type metadata for ConfiguredUnit.WindSpeedCodingKeys;
}

unint64_t sub_1B025D800()
{
  unint64_t result;

  result = qword_1EEE96860;
  if (!qword_1EEE96860)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281644, &type metadata for ConfiguredUnit.WindSpeedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96860);
  }
  return result;
}

unint64_t sub_1B025D840()
{
  unint64_t result;

  result = qword_1EEE96868;
  if (!qword_1EEE96868)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02816FC, &type metadata for ConfiguredUnit.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96868);
  }
  return result;
}

unint64_t sub_1B025D880()
{
  unint64_t result;

  result = qword_1EEE96870;
  if (!qword_1EEE96870)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02817B4, &type metadata for ConfiguredUnit.PressureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96870);
  }
  return result;
}

unint64_t sub_1B025D8C0()
{
  unint64_t result;

  result = qword_1EEE96878;
  if (!qword_1EEE96878)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028186C, &type metadata for ConfiguredUnit.PrecipitationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96878);
  }
  return result;
}

unint64_t sub_1B025D900()
{
  unint64_t result;

  result = qword_1EEE96880;
  if (!qword_1EEE96880)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281924, &type metadata for ConfiguredUnit.DistanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96880);
  }
  return result;
}

unint64_t sub_1B025D940()
{
  unint64_t result;

  result = qword_1EEE96888;
  if (!qword_1EEE96888)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02819DC, &type metadata for ConfiguredUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96888);
  }
  return result;
}

unint64_t sub_1B025D980()
{
  unint64_t result;

  result = qword_1EEE96890;
  if (!qword_1EEE96890)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281A94, &type metadata for UnitConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96890);
  }
  return result;
}

unint64_t sub_1B025D9C0()
{
  unint64_t result;

  result = qword_1EEE96898;
  if (!qword_1EEE96898)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281894, &type metadata for ConfiguredUnit.DistanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96898);
  }
  return result;
}

unint64_t sub_1B025DA00()
{
  unint64_t result;

  result = qword_1EEE968A0;
  if (!qword_1EEE968A0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02818BC, &type metadata for ConfiguredUnit.DistanceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968A0);
  }
  return result;
}

unint64_t sub_1B025DA40()
{
  unint64_t result;

  result = qword_1EEE968A8;
  if (!qword_1EEE968A8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02817DC, &type metadata for ConfiguredUnit.PrecipitationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968A8);
  }
  return result;
}

unint64_t sub_1B025DA80()
{
  unint64_t result;

  result = qword_1EEE968B0;
  if (!qword_1EEE968B0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281804, &type metadata for ConfiguredUnit.PrecipitationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968B0);
  }
  return result;
}

unint64_t sub_1B025DAC0()
{
  unint64_t result;

  result = qword_1EEE968B8;
  if (!qword_1EEE968B8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281724, &type metadata for ConfiguredUnit.PressureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968B8);
  }
  return result;
}

unint64_t sub_1B025DB00()
{
  unint64_t result;

  result = qword_1EEE968C0;
  if (!qword_1EEE968C0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028174C, &type metadata for ConfiguredUnit.PressureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968C0);
  }
  return result;
}

unint64_t sub_1B025DB40()
{
  unint64_t result;

  result = qword_1EEE968C8;
  if (!qword_1EEE968C8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028166C, &type metadata for ConfiguredUnit.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968C8);
  }
  return result;
}

unint64_t sub_1B025DB80()
{
  unint64_t result;

  result = qword_1EEE968D0;
  if (!qword_1EEE968D0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281694, &type metadata for ConfiguredUnit.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968D0);
  }
  return result;
}

unint64_t sub_1B025DBC0()
{
  unint64_t result;

  result = qword_1EEE968D8;
  if (!qword_1EEE968D8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02815B4, &type metadata for ConfiguredUnit.WindSpeedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968D8);
  }
  return result;
}

unint64_t sub_1B025DC00()
{
  unint64_t result;

  result = qword_1EEE968E0;
  if (!qword_1EEE968E0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02815DC, &type metadata for ConfiguredUnit.WindSpeedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968E0);
  }
  return result;
}

unint64_t sub_1B025DC40()
{
  unint64_t result;

  result = qword_1EEE968E8;
  if (!qword_1EEE968E8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028194C, &type metadata for ConfiguredUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968E8);
  }
  return result;
}

unint64_t sub_1B025DC80()
{
  unint64_t result;

  result = qword_1EEE968F0;
  if (!qword_1EEE968F0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281974, &type metadata for ConfiguredUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE968F0);
  }
  return result;
}

unint64_t sub_1B025DCBC()
{
  unint64_t result;

  result = qword_1EEE968F8;
  if (!qword_1EEE968F8)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Temperature, &type metadata for UnitConfiguration.Temperature);
    atomic_store(result, (unint64_t *)&qword_1EEE968F8);
  }
  return result;
}

unint64_t sub_1B025DCF8()
{
  unint64_t result;

  result = qword_1EEE96900;
  if (!qword_1EEE96900)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Pressure, &type metadata for UnitConfiguration.Pressure);
    atomic_store(result, (unint64_t *)&qword_1EEE96900);
  }
  return result;
}

unint64_t sub_1B025DD34()
{
  unint64_t result;

  result = qword_1EEE96908;
  if (!qword_1EEE96908)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Precipitation, &type metadata for UnitConfiguration.Precipitation);
    atomic_store(result, (unint64_t *)&qword_1EEE96908);
  }
  return result;
}

unint64_t sub_1B025DD70()
{
  unint64_t result;

  result = qword_1EEE96910;
  if (!qword_1EEE96910)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for UnitConfiguration.Distance, &type metadata for UnitConfiguration.Distance);
    atomic_store(result, (unint64_t *)&qword_1EEE96910);
  }
  return result;
}

unint64_t sub_1B025DDAC()
{
  unint64_t result;

  result = qword_1ED1FFDD0;
  if (!qword_1ED1FFDD0)
  {
    result = MEMORY[0x1B5E0724C](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&qword_1ED1FFDD0);
  }
  return result;
}

void sub_1B025DDE8()
{
  sub_1B02668C8();
  OUTLINED_FUNCTION_0_0();
}

void sub_1B025DE04()
{
  sub_1B00E69A8(&qword_1EEE96960, MEMORY[0x1E0CAECD8]);
}

uint64_t sub_1B025DE34()
{
  return 8;
}

uint64_t sub_1B025DE40()
{
  return swift_release();
}

uint64_t sub_1B025DE48(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return sub_1B0266358();
}

_QWORD *sub_1B025DE5C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_1B025DE68(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_1B025CE50(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t OUTLINED_FUNCTION_55_13()
{
  return sub_1B0268470();
}

uint64_t OUTLINED_FUNCTION_57_14()
{
  return sub_1B0268398();
}

uint64_t OUTLINED_FUNCTION_64_9()
{
  return sub_1B025C0D0();
}

id OUTLINED_FUNCTION_65_5()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_67_5()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_72_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_78_4()
{
  return sub_1B02684D0();
}

id OUTLINED_FUNCTION_79_5(void *a1)
{
  char v1;
  SEL *v2;
  SEL *v3;
  SEL *v4;

  if (v1)
    v4 = v2;
  else
    v4 = v3;
  return objc_msgSend(a1, *v4);
}

unint64_t OUTLINED_FUNCTION_81_5()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return sub_1B025A440();
}

id OUTLINED_FUNCTION_85_5(void *a1)
{
  SEL *v1;

  return objc_msgSend(a1, *v1);
}

unint64_t OUTLINED_FUNCTION_86_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 1;
  return sub_1B025A4F4();
}

unint64_t OUTLINED_FUNCTION_87_6()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 3;
  return sub_1B025A47C();
}

unint64_t OUTLINED_FUNCTION_90_5()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 2;
  return sub_1B025A4B8();
}

uint64_t OUTLINED_FUNCTION_93_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_94_1()
{
  return sub_1B0268DDC();
}

uint64_t OUTLINED_FUNCTION_95_2(uint64_t a1, unint64_t *a2)
{
  return sub_1B00F07C0(0, a2);
}

void NotificationStore.deliverySchedules.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

void NotificationStore.incomingMessages.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

void NotificationStore.weatherAlerts.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

void NotificationStore.severeNotifications.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

void NotificationStore.fetchSchedules.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

uint64_t static NotificationStore.preferredCacheSize.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 32;
  v2 = *MEMORY[0x1E0DB2E20];
  v3 = sub_1B0267EAC();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t NotificationStore.__allocating_init(database:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  NotificationStore.init(database:)(a1, a2);
  return v4;
}

void NotificationStore.fetchResults.getter()
{
  char v0;

  OUTLINED_FUNCTION_6_60();
  OUTLINED_FUNCTION_8_54();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_5_64();
  OUTLINED_FUNCTION_7_56();
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_1B025E1F0()
{
  swift_release();
  return swift_deallocObject();
}

double sub_1B025E214@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B01B2B2C();
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  return result;
}

double sub_1B025E2BC@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B0266358();
  sub_1B01B2EEC();
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  result = *(double *)&v5;
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  return result;
}

void sub_1B025E35C(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B0152B68, "Failed to create fetch schedule table: %{public}s", a1);
}

void sub_1B025E38C(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B0139838, "Failed to create fetch result table: %{public}s", a1);
}

void sub_1B025E3BC(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B018E928, "Failed to create delivery schedule table: %{public}s", a1);
}

void sub_1B025E3EC(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B025E750, "Failed to create incoming message table: %{public}s", a1);
}

void sub_1B025E41C(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B012D090, "Failed to create notifications table: %{public}s", a1);
}

void sub_1B025E44C(void (*a1)(uint64_t)@<X1>, const char *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  char v16;

  v6 = sub_1B0267498();
  if ((v16 & 1) != 0)
  {
    swift_willThrow();
    v7 = v15;
    if (qword_1ED202B48 != -1)
      swift_once();
    v8 = sub_1B0267C54();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED202B80);
    OUTLINED_FUNCTION_0_86();
    OUTLINED_FUNCTION_0_86();
    v9 = sub_1B0267C3C();
    v10 = sub_1B0268824();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      *(_DWORD *)v11 = 136446210;
      OUTLINED_FUNCTION_0_86();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2033D0);
      v12 = sub_1B02684D0();
      sub_1B00DDB6C(v12, v13, &v15);
      sub_1B02689D4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_81();
      OUTLINED_FUNCTION_1_81();
      _os_log_impl(&dword_1B00C3000, v9, v10, a2, v11, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_4();
    }
    OUTLINED_FUNCTION_1_81();
    OUTLINED_FUNCTION_1_81();

    v14 = 1;
  }
  else
  {
    a1(v6);
    v7 = sub_1B0267E88();
    sub_1B0267DB0();
    sub_1B0267DEC();
    OUTLINED_FUNCTION_10_48();
    OUTLINED_FUNCTION_44();
    v14 = 0;
  }
  *(_QWORD *)a3 = v7;
  *(_BYTE *)(a3 + 8) = v14;
}

void sub_1B025E68C(uint64_t a1@<X8>)
{
  sub_1B025E44C((void (*)(uint64_t))sub_1B01CF484, "Failed to create notifications table: %{public}s", a1);
}

uint64_t static NotificationStore.location.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED202CE0 != -1)
    swift_once();
  v2 = sub_1B0267EA0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED203480);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t method lookup function for NotificationStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NotificationStore.__allocating_init(database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

unint64_t sub_1B025E750()
{
  unint64_t result;

  result = qword_1ED204740;
  if (!qword_1ED204740)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for IncomingMessageEntity, &type metadata for IncomingMessageEntity);
    atomic_store(result, (unint64_t *)&qword_1ED204740);
  }
  return result;
}

void sub_1B025E78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  uint64_t v30;
  uint64_t v31;

  v29 = a5;
  v26 = a3;
  v27 = a4;
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_37();
  v28 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_57();
  v24 = v10;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v24 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203250);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_56();
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v24 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_57_1();
  MEMORY[0x1E0C80A78](v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  OUTLINED_FUNCTION_7_57();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_7_57();
  swift_allocObject();
  sub_1B0266358();
  OUTLINED_FUNCTION_58_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203248);
  OUTLINED_FUNCTION_4_0((uint64_t)v17);
  OUTLINED_FUNCTION_4_0(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203270);
  OUTLINED_FUNCTION_6();
  sub_1B0266358();
  sub_1B0267DC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  OUTLINED_FUNCTION_4_0((uint64_t)v13);
  OUTLINED_FUNCTION_4_0(v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  OUTLINED_FUNCTION_6();
  sub_1B0266358();
  sub_1B0267DC8();
  v30 = v25;
  v31 = a2;
  sub_1B0267384();
  sub_1B0266358();
  sub_1B0267DE0();
  swift_release();
  if (a2)
    swift_bridgeObjectRelease();
  LOBYTE(v30) = a2 != 0;
  sub_1B0267DE0();
  swift_release();
  v30 = v26;
  v31 = v27;
  sub_1B0267DE0();
  swift_release();
  v20 = sub_1B0266CD0();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = v28;
  v23 = v29;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v28, v29, v20);
  __swift_storeEnumTagSinglePayload(v22, 0, 1, v20);
  sub_1B0267DE0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v20);
  OUTLINED_FUNCTION_7();
}

void sub_1B025EAB0()
{
  uint64_t v0;
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203250);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_57_1();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v13 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_29();
  MEMORY[0x1E0C80A78](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  OUTLINED_FUNCTION_9_49();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  sub_1B0267DC8();
  OUTLINED_FUNCTION_9_49();
  swift_allocObject();
  OUTLINED_FUNCTION_18_44();
  sub_1B0267DC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203248);
  OUTLINED_FUNCTION_1((uint64_t)v10);
  OUTLINED_FUNCTION_1(v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203270);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_58_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  OUTLINED_FUNCTION_1((uint64_t)v6);
  OUTLINED_FUNCTION_1((uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_35_0();
  sub_1B0267DC8();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1B025EC84(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x73736572646461 && a2 == 0xE700000000000000;
    if (v6 || (sub_1B0268D34() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x616C696176417369 && a2 == 0xEB00000000656C62;
      if (v7 || (sub_1B0268D34() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x73657269707865 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_1B0268D34();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_1B025EE30(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B025EE58 + 4 * byte_1B0281E10[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_1B025EE58()
{
  return 0x73736572646461;
}

uint64_t sub_1B025EE70()
{
  return 0x616C696176417369;
}

uint64_t sub_1B025EE90()
{
  return 0x73657269707865;
}

uint64_t sub_1B025EEA8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE969B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B025F7D8();
  sub_1B0268E30();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_75((unint64_t *)&qword_1EEE92B10, v5, MEMORY[0x1E0DB2CB8]);
  OUTLINED_FUNCTION_1_64();
  if (!v1)
  {
    OUTLINED_FUNCTION_1_64();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_75(&qword_1EEE930F8, v6, MEMORY[0x1E0DB2CB8]);
    OUTLINED_FUNCTION_8_55();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_75(&qword_1EEE92C28, v7, MEMORY[0x1E0DB2CB8]);
    OUTLINED_FUNCTION_8_55();
  }
  return OUTLINED_FUNCTION_6_61(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

uint64_t sub_1B025F04C(_QWORD *a1)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE969A8);
  v29 = *(_QWORD *)(v4 - 8);
  v30 = v4;
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_37();
  v35 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_57();
  v34 = (_QWORD *)v7;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v28 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203250);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_56();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v28 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_29();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v28 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v19);
  OUTLINED_FUNCTION_4_0(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  v33 = OUTLINED_FUNCTION_22_32();
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, v19);
  OUTLINED_FUNCTION_4_0(v2);
  swift_allocObject();
  OUTLINED_FUNCTION_35_0();
  v32 = OUTLINED_FUNCTION_22_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203248);
  OUTLINED_FUNCTION_4_0((uint64_t)v14);
  OUTLINED_FUNCTION_4_0(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203270);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_18_44();
  sub_1B0267DC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  OUTLINED_FUNCTION_4_0((uint64_t)v10);
  OUTLINED_FUNCTION_4_0((uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_35_0();
  v31 = sub_1B0267DC8();
  v20 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_1B025F7D8();
  v21 = v36;
  sub_1B0268E24();
  if (v21)
  {
    v24 = v33;
    v22 = (uint64_t)v34;
  }
  else
  {
    v37 = 0;
    sub_1B012C8B8((unint64_t *)&qword_1EEE92B28, &qword_1ED206218, MEMORY[0x1E0DB2CC0]);
    sub_1B0268C5C();
    swift_release();
    v24 = v38;
    v37 = 1;
    sub_1B0266358();
    sub_1B0268C5C();
    swift_release();
    v37 = 2;
    v25 = sub_1B012C8B8(&qword_1EEE93110, &qword_1ED203270, MEMORY[0x1E0DB2CC0]);
    sub_1B0266358();
    OUTLINED_FUNCTION_19_44();
    if (v25)
    {
      OUTLINED_FUNCTION_6_61(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
      OUTLINED_FUNCTION_42_2();
    }
    else
    {
      OUTLINED_FUNCTION_11_3();
      v37 = 3;
      v26 = sub_1B012C8B8(&qword_1EEE92C48, &qword_1ED206210, MEMORY[0x1E0DB2CC0]);
      sub_1B0266358();
      OUTLINED_FUNCTION_19_44();
      v27 = v29;
      if (!v26)
      {
        swift_release();
        OUTLINED_FUNCTION_6_61(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
        sub_1B0266358();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        swift_release();
        OUTLINED_FUNCTION_11_3();
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_42_2();
        return v24;
      }
      OUTLINED_FUNCTION_6_61(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
      OUTLINED_FUNCTION_42_2();
      OUTLINED_FUNCTION_24_0();
    }
    swift_release();
    v22 = (uint64_t)v34;
  }
  __swift_destroy_boxed_opaque_existential_1(v22);
  swift_release();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_42_2();
  return v24;
}

uint64_t sub_1B025F50C()
{
  unsigned __int8 *v0;

  return sub_1B025EE30(*v0);
}

uint64_t sub_1B025F514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B025EC84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B025F538()
{
  sub_1B025F7D8();
  return sub_1B0268E54();
}

uint64_t sub_1B025F560()
{
  sub_1B025F7D8();
  return sub_1B0268E60();
}

uint64_t sub_1B025F588()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_1B025F5AC()
{
  uint64_t v0;

  v0 = *(_QWORD *)a001_2;
  sub_1B0267384();
  return v0;
}

uint64_t sub_1B025F5E0()
{
  sub_1B0207A60();
  return sub_1B0267C60();
}

uint64_t sub_1B025F618()
{
  sub_1B0207A60();
  return sub_1B0267C78();
}

uint64_t sub_1B025F650()
{
  sub_1B0207A60();
  return sub_1B0267C6C();
}

void sub_1B025F6A0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1B025EAB0();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

uint64_t sub_1B025F6C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_1B025F04C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_1B025F6F4(_QWORD *a1)
{
  return sub_1B025EEA8(a1);
}

uint64_t sub_1B025F710()
{
  sub_1B0207A60();
  return sub_1B0267C9C();
}

uint64_t sub_1B025F748()
{
  sub_1B0207A60();
  return sub_1B0267C90();
}

uint64_t sub_1B025F788()
{
  sub_1B0207A60();
  return sub_1B0267C84();
}

unint64_t sub_1B025F7D8()
{
  unint64_t result;

  result = qword_1EEE969B0;
  if (!qword_1EEE969B0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028207C, &type metadata for LocationAddressEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969B0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationAddressEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1B025F860 + 4 * byte_1B0281E19[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B025F894 + 4 * byte_1B0281E14[v4]))();
}

uint64_t sub_1B025F894(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B025F89C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B025F8A4);
  return result;
}

uint64_t sub_1B025F8B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B025F8B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B025F8BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B025F8C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationAddressEntity.CodingKeys()
{
  return &type metadata for LocationAddressEntity.CodingKeys;
}

unint64_t sub_1B025F8E4()
{
  unint64_t result;

  result = qword_1EEE969C0;
  if (!qword_1EEE969C0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0282054, &type metadata for LocationAddressEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969C0);
  }
  return result;
}

unint64_t sub_1B025F924()
{
  unint64_t result;

  result = qword_1EEE969C8;
  if (!qword_1EEE969C8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281FC4, &type metadata for LocationAddressEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969C8);
  }
  return result;
}

unint64_t sub_1B025F964()
{
  unint64_t result;

  result = qword_1EEE969D0;
  if (!qword_1EEE969D0)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0281FEC, &type metadata for LocationAddressEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969D0);
  }
  return result;
}

void sub_1B025F9A0()
{
  sub_1B0260760();
}

void sub_1B025F9AC()
{
  sub_1B025FD9C();
}

void sub_1B025F9B8()
{
  sub_1B025FD9C();
}

void sub_1B025F9C4(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B0134BB8);
}

void sub_1B025F9D0()
{
  sub_1B026054C();
}

void sub_1B025F9DC()
{
  OUTLINED_FUNCTION_9_50();
}

void sub_1B025F9F4()
{
  OUTLINED_FUNCTION_9_50();
}

void sub_1B025FA0C()
{
  sub_1B025FD9C();
}

void sub_1B025FA18()
{
  sub_1B025FD9C();
}

void sub_1B025FA24(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B016A8D4);
}

void sub_1B025FA30(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B016B90C);
}

void sub_1B025FA3C()
{
  sub_1B02604C0();
}

void sub_1B025FA48(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01866D4);
}

void sub_1B025FA54()
{
  sub_1B025FD9C();
}

void sub_1B025FA60()
{
  sub_1B025FD9C();
}

void sub_1B025FA6C()
{
  sub_1B025FD9C();
}

void sub_1B025FA78()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_10_49();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FAAC()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_13_50();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FAD4()
{
  sub_1B02602AC();
}

void sub_1B025FAE0()
{
  sub_1B026024C();
}

void sub_1B025FAEC()
{
  sub_1B02601C0();
}

void sub_1B025FAF8()
{
  OUTLINED_FUNCTION_9_50();
}

void sub_1B025FB10()
{
  sub_1B025FB84();
}

void sub_1B025FB30()
{
  sub_1B025FD9C();
}

void sub_1B025FB3C(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01AA57C);
}

void sub_1B025FB48(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01AA9D4);
}

void sub_1B025FB54()
{
  sub_1B025FD9C();
}

void sub_1B025FB60()
{
  sub_1B02605F8();
}

void sub_1B025FB6C()
{
  sub_1B025FB84();
}

void sub_1B025FB84()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_1_86();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FBB8(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B00FE354);
}

void sub_1B025FBC4()
{
  sub_1B025FD9C();
}

void sub_1B025FBD0()
{
  sub_1B026047C();
}

void sub_1B025FBDC(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01E1420);
}

void sub_1B025FBE8(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01E37FC);
}

void sub_1B025FBF4(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B01F4DB8);
}

void sub_1B025FC00()
{
  sub_1B025FD9C();
}

void sub_1B025FC0C()
{
  sub_1B025FD9C();
}

void sub_1B025FC18()
{
  sub_1B025FE58();
}

void sub_1B025FC24()
{
  sub_1B025FD9C();
}

void sub_1B025FC30()
{
  sub_1B0260698();
}

void sub_1B025FC3C()
{
  sub_1B025FD9C();
}

void sub_1B025FC48()
{
  sub_1B02600DC();
}

void sub_1B025FC54()
{
  sub_1B025FD9C();
}

void sub_1B025FC60()
{
  sub_1B025FD9C();
}

void sub_1B025FC6C(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B0217834);
}

void sub_1B025FC78(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B02189B8);
}

void sub_1B025FC84()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FCE0(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))sub_1B023A480);
}

void sub_1B025FCEC()
{
  sub_1B025FD9C();
}

void sub_1B025FCF8()
{
  sub_1B0260858();
}

void sub_1B025FD04()
{
  sub_1B025FD9C();
}

void sub_1B025FD10()
{
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_28_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FD38()
{
  sub_1B025FEC8();
}

void sub_1B025FD44()
{
  sub_1B0260338();
}

void sub_1B025FD50()
{
  sub_1B026040C();
}

void sub_1B025FD6C()
{
  sub_1B02603C0();
}

void sub_1B025FD78()
{
  sub_1B025FD9C();
}

void sub_1B025FD84()
{
  sub_1B026037C();
}

void sub_1B025FD90()
{
  sub_1B025FD9C();
}

void sub_1B025FD9C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_15_39(v0);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FDC8()
{
  sub_1B025FF50();
}

uint64_t sub_1B025FDD4()
{
  return sub_1B025FFC0();
}

void sub_1B025FDE0(uint64_t a1)
{
  sub_1B025FDEC(a1, (void (*)(uint64_t))ContentEnvironment.rawValue.getter);
}

void sub_1B025FDEC(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_30_1();
  a2(a1);
  OUTLINED_FUNCTION_1_86();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FE34()
{
  sub_1B0260958();
}

void sub_1B025FE40()
{
  sub_1B0260958();
}

void sub_1B025FE4C()
{
  sub_1B0260958();
}

void sub_1B025FE58()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FEC8()
{
  char v0;

  OUTLINED_FUNCTION_3_66();
  if (!v0)
    OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FF2C()
{
  OUTLINED_FUNCTION_8_56();
}

void sub_1B025FF44()
{
  sub_1B0260958();
}

void sub_1B025FF50()
{
  char v0;

  OUTLINED_FUNCTION_3_66();
  if (!v0)
    OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B025FFB4()
{
  sub_1B0260958();
}

uint64_t sub_1B025FFC0()
{
  sub_1B0268DDC();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  return sub_1B0268E0C();
}

void sub_1B0260040()
{
  sub_1B0260958();
}

void sub_1B0260050()
{
  sub_1B0260958();
}

void sub_1B026005C(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B023A480);
}

void sub_1B0260068()
{
  sub_1B0260958();
}

void sub_1B0260074()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_13_50();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026009C()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_10_49();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02600D0()
{
  sub_1B0260958();
}

void sub_1B02600DC()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260164(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B00FE354);
}

void sub_1B0260170()
{
  sub_1B0260958();
}

void sub_1B026017C(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01AA9D4);
}

void sub_1B0260188()
{
  sub_1B0260824();
}

void sub_1B02601A8(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01AA57C);
}

void sub_1B02601B4()
{
  sub_1B0260958();
}

void sub_1B02601C0()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026024C()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02602AC()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260338()
{
  OUTLINED_FUNCTION_3_66();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026037C()
{
  OUTLINED_FUNCTION_3_66();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02603C0()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026040C()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260458()
{
  sub_1B0260958();
}

void sub_1B0260464()
{
  sub_1B0260958();
}

void sub_1B0260470(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))ContentEnvironment.rawValue.getter);
}

void sub_1B026047C()
{
  OUTLINED_FUNCTION_3_66();
  LocationDetailsKind.rawValue.getter();
  OUTLINED_FUNCTION_1_86();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02604C0()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026054C()
{
  OUTLINED_FUNCTION_4_65();
  sub_1B0268518();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02605E0(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B016A8D4);
}

void sub_1B02605EC(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B02189B8);
}

void sub_1B02605F8()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260674(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B0217834);
}

void sub_1B0260680()
{
  OUTLINED_FUNCTION_8_56();
}

void sub_1B0260698()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260708()
{
  sub_1B0260958();
}

void sub_1B0260714(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01E37FC);
}

void sub_1B0260720()
{
  sub_1B0260958();
}

void sub_1B026072C()
{
  sub_1B0260958();
}

void sub_1B0260738()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_28_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260760()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02607B8()
{
  sub_1B0260958();
}

void sub_1B02607C4(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B0134BB8);
}

void sub_1B02607D0(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01866D4);
}

void sub_1B02607DC(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B016B90C);
}

void sub_1B02607E8()
{
  sub_1B0260958();
}

void sub_1B02607F4()
{
  OUTLINED_FUNCTION_8_56();
}

void sub_1B026080C()
{
  sub_1B0260824();
}

void sub_1B0260824()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_1_86();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260858()
{
  OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B02608DC()
{
  sub_1B0260958();
}

void sub_1B02608E8(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01F4DB8);
}

void sub_1B02608F4()
{
  OUTLINED_FUNCTION_3_66();
  OUTLINED_FUNCTION_2_81();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B026094C()
{
  sub_1B0260958();
}

void sub_1B0260958()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_4_65();
  OUTLINED_FUNCTION_15_39(v0);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

void sub_1B0260984(uint64_t a1, uint64_t a2)
{
  sub_1B0260990(a1, a2, (void (*)(uint64_t))sub_1B01E1420);
}

void sub_1B0260990(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_4_65();
  a3(a2);
  OUTLINED_FUNCTION_1_86();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_60();
}

WeatherCore::WeatherDataServiceConfiguration __swiftcall WeatherDataServiceConfiguration.init(wdsBucketIdentifier:needsTwilightData:)(Swift::String_optional wdsBucketIdentifier, Swift::Bool_optional needsTwilightData)
{
  uint64_t v2;
  uint64_t countAndFlagsBits;
  void *object;
  WeatherCore::WeatherDataServiceConfiguration result;

  if (wdsBucketIdentifier.value._object)
    countAndFlagsBits = wdsBucketIdentifier.value._countAndFlagsBits;
  else
    countAndFlagsBits = 0;
  object = (void *)0xE000000000000000;
  if (wdsBucketIdentifier.value._object)
    object = wdsBucketIdentifier.value._object;
  *(_QWORD *)v2 = countAndFlagsBits;
  *(_QWORD *)(v2 + 8) = object;
  *(_BYTE *)(v2 + 16) = needsTwilightData.value;
  result.wdsBucketIdentifier = wdsBucketIdentifier.value;
  result.needsTwilightData = needsTwilightData.value;
  return result;
}

uint64_t static WeatherDataServiceConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_1B0268D34();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

uint64_t WeatherDataServiceConfiguration.wdsBucketIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1B0267384();
  return v1;
}

void WeatherDataServiceConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED203370);
  v8 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0118C3C();
  sub_1B0268E30();
  v11 = 0;
  sub_1B0268CB0();
  if (!v2)
  {
    v10 = 1;
    sub_1B0268CBC();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v4);
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1B0260B9C()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1B0268BC0();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

void sub_1B0260BF0(char *a1)
{
  sub_1B0141A94(*a1);
}

uint64_t sub_1B0260BFC()
{
  return sub_1B025FDD4();
}

uint64_t sub_1B0260C04()
{
  return sub_1B0258EBC();
}

uint64_t sub_1B0260C0C()
{
  return sub_1B025FFC0();
}

uint64_t sub_1B0260C14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B0260B9C();
  *a1 = result;
  return result;
}

unint64_t sub_1B0260C40@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = sub_1B0118C78(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B0260C68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B0260BEC();
  *a1 = result;
  return result;
}

uint64_t sub_1B0260C8C()
{
  sub_1B0118C3C();
  return sub_1B0268E54();
}

uint64_t sub_1B0260CB4()
{
  sub_1B0118C3C();
  return sub_1B0268E60();
}

void sub_1B0260CDC(_QWORD *a1)
{
  WeatherDataServiceConfiguration.encode(to:)(a1);
}

uint64_t sub_1B0260CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  sub_1B0267384();
  return a1;
}

uint64_t assignWithCopy for WeatherDataServiceConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  sub_1B0267384();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WeatherDataServiceConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataServiceConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 17))
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

unint64_t sub_1B0260E14()
{
  unint64_t result;

  result = qword_1EEE969D8;
  if (!qword_1EEE969D8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0282254, &type metadata for WeatherDataServiceConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969D8);
  }
  return result;
}

unint64_t static IncomingMessageEntity.tableName.getter()
{
  return 0xD000000000000010;
}

uint64_t static IncomingMessageEntity.version.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_19();
  v0 = *(_QWORD *)a003_0;
  sub_1B0267384();
  return v0;
}

uint64_t static IncomingMessageEntity.version.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_19();
  *(_QWORD *)a003_0 = a1;
  qword_1EEE969E8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static IncomingMessageEntity.version.modify())()
{
  OUTLINED_FUNCTION_19();
  return j__swift_endAccess;
}

uint64_t IncomingMessageEntity.id.getter()
{
  return sub_1B0266358();
}

uint64_t IncomingMessageEntity.date.getter()
{
  return sub_1B0266358();
}

uint64_t IncomingMessageEntity.messageID.getter()
{
  return sub_1B0266358();
}

uint64_t IncomingMessageEntity.channel.getter()
{
  return sub_1B0266358();
}

uint64_t IncomingMessageEntity.userInfo.getter()
{
  return sub_1B0266358();
}

void IncomingMessageEntity.init()(uint64_t *a1@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;

  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204758);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_28_4();
  MEMORY[0x1E0C80A78](v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_11_0();
  v8 = v6 - v7;
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_76();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  OUTLINED_FUNCTION_7_58(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  v22 = OUTLINED_FUNCTION_25_28();
  _s11WeatherCore11SystemClockV4time10Foundation4DateVvg_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  v15 = OUTLINED_FUNCTION_28_33();
  v16(v15);
  OUTLINED_FUNCTION_18(v2, 0);
  OUTLINED_FUNCTION_18(v8, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_67();
  v17 = sub_1B0267DC8();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  OUTLINED_FUNCTION_7_58(v1);
  swift_allocObject();
  OUTLINED_FUNCTION_35_0();
  v18 = OUTLINED_FUNCTION_25_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204750);
  OUTLINED_FUNCTION_9_51();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204760);
  OUTLINED_FUNCTION_6();
  v19 = OUTLINED_FUNCTION_2_82();
  OUTLINED_FUNCTION_9_51();
  swift_allocObject();
  v20 = OUTLINED_FUNCTION_2_82();
  v21 = v23;
  *v23 = v22;
  v21[1] = v17;
  v21[2] = v18;
  v21[3] = v19;
  v21[4] = v20;
  OUTLINED_FUNCTION_7();
}

void IncomingMessageEntity.init(id:messageID:channel:userInfo:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a7;
  v39 = a8;
  v36 = a5;
  v37 = a6;
  v34 = a3;
  v35 = a4;
  v32 = a1;
  v33 = a2;
  v40 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204758);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_28_4();
  MEMORY[0x1E0C80A78](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_76();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_11_0();
  v18 = v16 - v17;
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v31 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v22);
  OUTLINED_FUNCTION_7_58(v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  v31 = OUTLINED_FUNCTION_32_26();
  sub_1B0266358();
  _s11WeatherCore11SystemClockV4time10Foundation4DateVvg_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  v23 = OUTLINED_FUNCTION_28_33();
  v24(v23);
  OUTLINED_FUNCTION_7_7(v10, 0);
  OUTLINED_FUNCTION_7_7(v9, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_67();
  v25 = OUTLINED_FUNCTION_25_28();
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v22);
  OUTLINED_FUNCTION_7_58(v18);
  swift_allocObject();
  OUTLINED_FUNCTION_35_0();
  v26 = OUTLINED_FUNCTION_32_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204750);
  OUTLINED_FUNCTION_10_50();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204760);
  OUTLINED_FUNCTION_6();
  sub_1B0266358();
  v27 = OUTLINED_FUNCTION_2_82();
  OUTLINED_FUNCTION_10_50();
  swift_allocObject();
  sub_1B0266358();
  v28 = OUTLINED_FUNCTION_2_82();
  v41 = v32;
  v42 = v33;
  sub_1B0266358();
  v29 = v31;
  sub_1B0267DE0();
  swift_release();
  v41 = v34;
  v42 = v35;
  sub_1B0267DE0();
  swift_release();
  v41 = v36;
  v42 = v37;
  sub_1B0267DE0();
  swift_release();
  v41 = v38;
  v42 = v39;
  sub_1B0267DE0();
  swift_release();
  v30 = v40;
  *v40 = v29;
  v30[1] = v25;
  v30[2] = v26;
  v30[3] = v27;
  v30[4] = v28;
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1B0261478(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1702125924 && a2 == 0xE400000000000000;
    if (v6 || (sub_1B0268D34() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x496567617373656DLL && a2 == 0xE900000000000044;
      if (v7 || (sub_1B0268D34() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000;
        if (v8 || (sub_1B0268D34() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6F666E4972657375 && a2 == 0xE800000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_1B0268D34();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_1B0261668(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B0261690 + 4 * byte_1B02822F0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_1B0261690()
{
  return 1702125924;
}

uint64_t sub_1B02616A0()
{
  return 0x496567617373656DLL;
}

uint64_t sub_1B02616BC()
{
  return 0x6C656E6E616863;
}

uint64_t sub_1B02616D4()
{
  return 0x6F666E4972657375;
}

uint64_t sub_1B02616EC()
{
  unsigned __int8 *v0;

  return sub_1B0261668(*v0);
}

uint64_t sub_1B02616F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B0261478(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B0261718()
{
  sub_1B0261948();
  return sub_1B0268E54();
}

uint64_t sub_1B0261740()
{
  sub_1B0261948();
  return sub_1B0268E60();
}

void IncomingMessageEntity.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE969F0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v18 = v1[2];
  v19 = v8;
  v10 = v1[3];
  v16 = v1[4];
  v17 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B0261948();
  sub_1B0268E30();
  v21 = v9;
  v20 = 0;
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_75((unint64_t *)&qword_1EEE92B10, v11, MEMORY[0x1E0DB2CB8]);
  OUTLINED_FUNCTION_5();
  if (!v2)
  {
    v12 = v18;
    v21 = v19;
    v20 = 1;
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_75(&qword_1EEE92C28, v13, MEMORY[0x1E0DB2CB8]);
    sub_1B0268CEC();
    v21 = v12;
    v20 = 2;
    OUTLINED_FUNCTION_5();
    v21 = v17;
    v20 = 3;
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_75(&qword_1EEE92C38, v14, MEMORY[0x1E0DB2CB8]);
    OUTLINED_FUNCTION_5();
    v21 = v16;
    v20 = 4;
    OUTLINED_FUNCTION_5();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1B0261948()
{
  unint64_t result;

  result = qword_1EEE969F8;
  if (!qword_1EEE969F8)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B028257C, &type metadata for IncomingMessageEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE969F8);
  }
  return result;
}

void IncomingMessageEntity.init(from:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  char v45;
  uint64_t v46;

  v43 = (_QWORD *)a1;
  v33 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96A00);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x1E0C80A78](v4);
  v44 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204758);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_11_0();
  v41 = v7 - v8;
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_76();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v32 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204E40);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206208);
  OUTLINED_FUNCTION_11_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206218);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_4();
  v40 = OUTLINED_FUNCTION_27_27();
  _s11WeatherCore11SystemClockV4time10Foundation4DateVvg_0();
  v16 = *MEMORY[0x1E0DB2C80];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2061F0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v13, v16, v17);
  OUTLINED_FUNCTION_20_5((uint64_t)v13, 0);
  OUTLINED_FUNCTION_20_5(v2, 1);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED206210);
  swift_allocObject();
  OUTLINED_FUNCTION_35_0();
  v18 = v43;
  v39 = sub_1B0267DC8();
  OUTLINED_FUNCTION_11_47();
  swift_allocObject();
  OUTLINED_FUNCTION_35_0();
  v37 = OUTLINED_FUNCTION_27_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204750);
  OUTLINED_FUNCTION_4_0(v3);
  v19 = v41;
  OUTLINED_FUNCTION_4_0(v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204760);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_67();
  v38 = sub_1B0267DC8();
  OUTLINED_FUNCTION_4_0(v3);
  OUTLINED_FUNCTION_4_0(v19);
  swift_allocObject();
  OUTLINED_FUNCTION_3_67();
  v20 = sub_1B0267DC8();
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  sub_1B0261948();
  v21 = v42;
  sub_1B0268E24();
  if (v21)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    v42 = v20;
    v22 = v35;
    v45 = 0;
    sub_1B012C8B8((unint64_t *)&qword_1EEE92B28, &qword_1ED206218, MEMORY[0x1E0DB2CC0]);
    v23 = v36;
    sub_1B0268C5C();
    v24 = v46;
    sub_1B0266358();
    swift_release();
    v45 = 1;
    sub_1B012C8B8(&qword_1EEE92C48, &qword_1ED206210, MEMORY[0x1E0DB2CC0]);
    sub_1B0268C5C();
    v25 = v23;
    v26 = v46;
    sub_1B0266358();
    swift_release();
    v45 = 2;
    OUTLINED_FUNCTION_18_45();
    v27 = v46;
    sub_1B0266358();
    swift_release();
    v45 = 3;
    sub_1B012C8B8(&qword_1EEE92C58, &qword_1ED204760, MEMORY[0x1E0DB2CC0]);
    OUTLINED_FUNCTION_18_45();
    v41 = v46;
    sub_1B0266358();
    swift_release();
    v45 = 4;
    v28 = v36;
    OUTLINED_FUNCTION_18_45();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v28);
    v29 = v46;
    sub_1B0266358();
    swift_release();
    v30 = v33;
    *v33 = v24;
    v30[1] = v26;
    v31 = v41;
    v30[2] = v27;
    v30[3] = v31;
    v30[4] = v29;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  }
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_0_2();
}

unint64_t sub_1B0261F08()
{
  static IncomingMessageEntity.tableName.getter();
  return 0xD000000000000010;
}

uint64_t sub_1B0261F28()
{
  sub_1B025E750();
  return sub_1B0267C60();
}

uint64_t sub_1B0261F60()
{
  sub_1B025E750();
  return sub_1B0267C78();
}

uint64_t sub_1B0261F98()
{
  sub_1B025E750();
  return sub_1B0267C6C();
}

void sub_1B0261FEC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  IncomingMessageEntity.init(from:)(a1, a2);
}

void sub_1B0262000(_QWORD *a1)
{
  IncomingMessageEntity.encode(to:)(a1);
}

uint64_t sub_1B0262014()
{
  sub_1B025E750();
  return sub_1B0267C9C();
}

uint64_t sub_1B026204C()
{
  sub_1B025E750();
  return sub_1B0267C90();
}

uint64_t sub_1B026208C()
{
  sub_1B025E750();
  return sub_1B0267C84();
}

uint64_t storeEnumTagSinglePayload for IncomingMessageEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0262128 + 4 * byte_1B02822FA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B026215C + 4 * byte_1B02822F5[v4]))();
}

uint64_t sub_1B026215C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0262164(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B026216CLL);
  return result;
}

uint64_t sub_1B0262178(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0262180);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B0262184(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B026218C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingMessageEntity.CodingKeys()
{
  return &type metadata for IncomingMessageEntity.CodingKeys;
}

unint64_t sub_1B02621AC()
{
  unint64_t result;

  result = qword_1EEE96A08;
  if (!qword_1EEE96A08)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0282554, &type metadata for IncomingMessageEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96A08);
  }
  return result;
}

unint64_t sub_1B02621EC()
{
  unint64_t result;

  result = qword_1EEE96A10;
  if (!qword_1EEE96A10)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02824C4, &type metadata for IncomingMessageEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96A10);
  }
  return result;
}

unint64_t sub_1B026222C()
{
  unint64_t result;

  result = qword_1EEE96A18;
  if (!qword_1EEE96A18)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02824EC, &type metadata for IncomingMessageEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE96A18);
  }
  return result;
}

void sub_1B0262268(char *a1)
{
  sub_1B0140B24(*a1);
}

void sub_1B0262274()
{
  unsigned __int8 *v0;

  sub_1B025FDE0(*v0);
}

void sub_1B026227C()
{
  sub_1B025865C();
}

void sub_1B0262284(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_1B0260470(a1, *v1);
}

uint64_t sub_1B026228C()
{
  sub_1B010D0C0();
  return sub_1B0268584();
}

uint64_t sub_1B02622D8()
{
  unsigned __int8 *v0;

  return ContentEnvironment.description.getter(*v0);
}

uint64_t dispatch thunk of PrecipitationNotificationAccuracyTrackerType.trackFetchResult(for:with:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of UniqueMergeable.uniqueMerge(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of UniqueMergeable.uniqueMerging(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1B02622F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = sub_1B0266A3C();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1B0266F4C();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_1B0266EBC();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1B0266DFC();
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96A38);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96A40);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B0266BA4();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v10);
  v11 = sub_1B0266B98();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v11);
  sub_1B0266D90();
  sub_1B0266E50();
  sub_1B0266F1C();
  sub_1B0266A30();
  return sub_1B0266BB0();
}

uint64_t PrecipitationNotificationContentFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t PrecipitationNotificationContentFactory.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t PrecipitationNotificationContentFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PrecipitationNotificationContentFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void PrecipitationNotificationContentFactory.createPrecipitationNotificationContent(from:for:with:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD v48[9];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v48[3] = a3;
  v68 = a1;
  v48[4] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96A20);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_37();
  v48[2] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_37();
  v53 = v8;
  OUTLINED_FUNCTION_68_0();
  v55 = sub_1B0266CD0();
  v52 = *(_QWORD *)(v55 - 8);
  MEMORY[0x1E0C80A78](v55);
  OUTLINED_FUNCTION_37();
  v51 = v9;
  OUTLINED_FUNCTION_68_0();
  v62 = type metadata accessor for PrecipitationNotification();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_57();
  v48[6] = v11;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_35_1();
  v48[1] = v13;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v14);
  v57 = (char *)v48 - v15;
  OUTLINED_FUNCTION_68_0();
  v49 = sub_1B0266C04();
  v48[8] = *(_QWORD *)(v49 - 8);
  MEMORY[0x1E0C80A78](v49);
  OUTLINED_FUNCTION_37();
  v48[7] = v16;
  OUTLINED_FUNCTION_68_0();
  v58 = type metadata accessor for PrecipitationNotificationLocalizationToken();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_57();
  v54 = v18;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_35_1();
  v50 = v20;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_35_1();
  v56 = v22;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_35_1();
  v60 = v24;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v25);
  v66 = (char *)v48 - v26;
  OUTLINED_FUNCTION_68_0();
  v67 = sub_1B0267A68();
  MEMORY[0x1E0C80A78](v67);
  v28 = (char *)v48 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NotificationSubscription.Location(0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for NotificationSubscription(0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_57();
  v59 = v34;
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x1E0C80A78](v35);
  v37 = (_QWORD *)((char *)v48 - v36);
  if (qword_1ED202B48 != -1)
    swift_once();
  v38 = sub_1B0267C54();
  v39 = __swift_project_value_buffer(v38, (uint64_t)qword_1ED202B80);
  v64 = a2;
  sub_1B00ED830(a2, (uint64_t)v37, type metadata accessor for NotificationSubscription);
  v63 = v39;
  v40 = sub_1B0267C3C();
  v41 = sub_1B026883C();
  v42 = os_log_type_enabled(v40, v41);
  v65 = v31;
  v61 = v28;
  if (v42)
  {
    v43 = OUTLINED_FUNCTION_5_0();
    v48[0] = v32;
    v44 = v43;
    v69 = OUTLINED_FUNCTION_5_0();
    *(_DWORD *)v44 = 141558275;
    v70 = 1752392040;
    sub_1B02689D4();
    *(_WORD *)(v44 + 12) = 2081;
    v45 = *v37;
    v46 = v37[1];
    sub_1B0267384();
    v70 = sub_1B00DDB6C(v45, v46, &v69);
    sub_1B02689D4();
    v47 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_45(v47, type metadata accessor for NotificationSubscription);
    _os_log_impl(&dword_1B00C3000, v40, v41, "Creating notification content for subscription: %{private,mask.hash}s", (uint8_t *)v44, 0x16u);
    OUTLINED_FUNCTION_53();
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_19_45(v42, type metadata accessor for NotificationSubscription);

  sub_1B00ED830(v64 + *(int *)(v32 + 20), (uint64_t)v31, type metadata accessor for NotificationSubscription.Location);
  __asm { BR              X9 }
}

uint64_t sub_1B0263880(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  BOOL v22;
  uint64_t v23;
  char v25;
  id v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = sub_1B0266DFC();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x1E0C80A78](v2);
  v42 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for NotificationSubscription.Location(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (uint64_t *)((char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1B0266F4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v41 - v12;
  v14 = type metadata accessor for Location();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, a1 + *(int *)(v14 + 20), v7);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  v16 = (void *)sub_1B0266F10();
  objc_msgSend(v15, sel_setTimeZone_, v16);

  objc_msgSend(v15, sel_setDateStyle_, 0);
  objc_msgSend(v15, sel_setTimeStyle_, 1);
  type metadata accessor for PrecipitationNotification();
  v17 = sub_1B0266C34();
  v18 = objc_msgSend(v15, sel_stringFromDate_, v17);

  v19 = sub_1B0268470();
  v45 = v20;
  v46 = v19;

  sub_1B0266F40();
  sub_1B02640D8();
  LOBYTE(v17) = sub_1B02683F8();
  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v10, v7);
  sub_1B00ED830(a1, (uint64_t)v6, type metadata accessor for NotificationSubscription.Location);
  if ((v17 & 1) != 0)
  {

    sub_1B00F1668((uint64_t)v6, type metadata accessor for NotificationSubscription.Location);
LABEL_10:
    v23 = v46;
    goto LABEL_11;
  }
  v22 = *v6 == 0x746E6572727563 && v6[1] == 0xE700000000000000;
  if (v22 || (sub_1B0268D34() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_1B00F1668((uint64_t)v6, type metadata accessor for NotificationSubscription.Location);
LABEL_9:

    goto LABEL_10;
  }
  v25 = sub_1B0268D34();
  swift_bridgeObjectRelease();
  sub_1B00F1668((uint64_t)v6, type metadata accessor for NotificationSubscription.Location);
  if ((v25 & 1) != 0)
    goto LABEL_9;
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  v27 = (void *)sub_1B0266F10();
  objc_msgSend(v26, sel_setTimeZone_, v27);

  v28 = v42;
  sub_1B0266DCC();
  v29 = (void *)sub_1B0266D84();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v44);
  objc_msgSend(v26, sel_setLocale_, v29);

  v30 = (void *)sub_1B0268458();
  objc_msgSend(v26, sel_setLocalizedDateFormatFromTemplate_, v30);

  v31 = (void *)sub_1B0266C34();
  v32 = objc_msgSend(v26, sel_stringFromDate_, v31);

  v44 = sub_1B0268470();
  v34 = v33;

  if (qword_1ED2032E8 != -1)
    swift_once();
  v35 = (id)qword_1ED2189D0;
  sub_1B0266934();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2077F0);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_1B026EC50;
  v37 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v36 + 56) = MEMORY[0x1E0DEA968];
  v38 = sub_1B0102728();
  v39 = v45;
  *(_QWORD *)(v36 + 32) = v46;
  *(_QWORD *)(v36 + 40) = v39;
  *(_QWORD *)(v36 + 96) = v37;
  *(_QWORD *)(v36 + 104) = v38;
  v40 = v44;
  *(_QWORD *)(v36 + 64) = v38;
  *(_QWORD *)(v36 + 72) = v40;
  *(_QWORD *)(v36 + 80) = v34;
  v23 = sub_1B0268464();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_11:
  v21(v13, v7);
  return v23;
}

uint64_t sub_1B0263DAC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (!a1)
    a1 = sub_1B0268398();
  v19 = a1;
  v5 = *a2;
  v6 = a2[1];
  v7 = MEMORY[0x1E0DEA968];
  v18 = MEMORY[0x1E0DEA968];
  v16 = v5;
  v17 = v6;
  sub_1B0267384();
  sub_1B0267384();
  sub_1B014B274((uint64_t)&v16, 0x6E6F697461636F4CLL, 0xE800000000000000);
  type metadata accessor for Location();
  v8 = sub_1B0266EEC();
  v18 = v7;
  v16 = v8;
  v17 = v9;
  sub_1B014B274((uint64_t)&v16, 0x656E6F5A656D6954, 0xE800000000000000);
  v10 = a3 + *(int *)(type metadata accessor for PrecipitationNotification() + 40);
  v11 = sub_1B0266CD0();
  v18 = v11;
  v12 = __swift_allocate_boxed_opaque_existential_1(&v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v12, v10, v11);
  sub_1B014B274((uint64_t)&v16, 1702125892, 0xE400000000000000);
  _s11WeatherCore42PrecipitationNotificationLocalizationTokenV11descriptionSSvg_0();
  v18 = v7;
  v16 = v13;
  v17 = v14;
  sub_1B014B274((uint64_t)&v16, 0xD000000000000011, 0x80000001B0284D30);
  return v19;
}

void sub_1B0263F30(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  PrecipitationNotificationContentFactory.createPrecipitationNotificationContent(from:for:with:)(a1, a2, a3, a4);
}

unint64_t sub_1B0263F44()
{
  unint64_t result;

  result = qword_1EEE96A28;
  if (!qword_1EEE96A28)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02828C8, &type metadata for PrecipitationNotificationContentFactory.Errors);
    atomic_store(result, (unint64_t *)&qword_1EEE96A28);
  }
  return result;
}

uint64_t dispatch thunk of PrecipitationNotificationContentFactoryType.createPrecipitationNotificationContent(from:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t type metadata accessor for PrecipitationNotificationContentFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for PrecipitationNotificationContentFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PrecipitationNotificationContentFactory.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t storeEnumTagSinglePayload for PrecipitationNotificationContentFactory.Errors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0264018 + 4 * byte_1B02827D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B026404C + 4 * byte_1B02827D0[v4]))();
}

uint64_t sub_1B026404C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0264054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B026405CLL);
  return result;
}

uint64_t sub_1B0264068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0264070);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B0264074(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B026407C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrecipitationNotificationContentFactory.Errors()
{
  return &type metadata for PrecipitationNotificationContentFactory.Errors;
}

unint64_t sub_1B026409C()
{
  unint64_t result;

  result = qword_1EEE96A30;
  if (!qword_1EEE96A30)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B02828A0, &type metadata for PrecipitationNotificationContentFactory.Errors);
    atomic_store(result, (unint64_t *)&qword_1EEE96A30);
  }
  return result;
}

unint64_t sub_1B02640D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE95E80;
  if (!qword_1EEE95E80)
  {
    v1 = sub_1B0266F4C();
    result = MEMORY[0x1B5E0724C](MEMORY[0x1E0CB1498], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE95E80);
  }
  return result;
}

double static CLLocationCoordinate2D.current.getter()
{
  return 37.323;
}

double static CLLocationCoordinate2D.cupertino.getter()
{
  return 37.323;
}

double static CLLocationCoordinate2D.losAngeles.getter()
{
  return 34.0522;
}

double static CLLocationCoordinate2D.sanFrancisco.getter()
{
  return 37.7749;
}

double static CLLocationCoordinate2D.oulu.getter()
{
  return 65.0121;
}

double static CLLocationCoordinate2D.tacoma.getter()
{
  return 47.258728;
}

double static CLLocationCoordinate2D.newYork.getter()
{
  return 40.712982;
}

double static CLLocationCoordinate2D.london.getter()
{
  return 51.5073219;
}

double static CLLocationCoordinate2D.amsterdam.getter()
{
  return 52.3727598;
}

double static CLLocationCoordinate2D.taiwan.getter()
{
  return 25.011997;
}

double static CLLocationCoordinate2D.seoul.getter()
{
  return 35.9078;
}

double static CLLocationCoordinate2D.tokyo.getter()
{
  return 35.6804;
}

double static CLLocationCoordinate2D.auckland.getter()
{
  return -36.8509;
}

double static CLLocationCoordinate2D.santiago.getter()
{
  return -33.4489;
}

double static CLLocationCoordinate2D.lagos.getter()
{
  return 6.5244;
}

double static CLLocationCoordinate2D.moscow.getter()
{
  return 55.7558;
}

double static CLLocationCoordinate2D.saoPaulo.getter()
{
  return -23.5505;
}

double static CLLocationCoordinate2D.mumbai.getter()
{
  return 19.075983;
}

double static CLLocationCoordinate2D.cairo.getter()
{
  return 30.04442;
}

double static CLLocationCoordinate2D.bangkok.getter()
{
  return 13.75;
}

double static CLLocationCoordinate2D.istanbul.getter()
{
  return 41.01;
}

double static CLLocationCoordinate2D.osaka.getter()
{
  return 34.6936;
}

double static CLLocationCoordinate2D.karachi.getter()
{
  return 24.86;
}

double static CLLocationCoordinate2D.paris.getter()
{
  return -48.8566;
}

double static CLLocationCoordinate2D.lima.getter()
{
  return -12.05;
}

double static CLLocationCoordinate2D.dakar.getter()
{
  return 14.7166;
}

double static CLLocationCoordinate2D.sydney.getter()
{
  return -33.865143;
}

double static CLLocationCoordinate2D.jerusalem.getter()
{
  return 31.7683;
}

double static CLLocationCoordinate2D.utqiagvik.getter()
{
  return 71.290558;
}

BOOL static LocationManagerUpdateType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocationManagerUpdateType.hash(into:)()
{
  return sub_1B0268DE8();
}

uint64_t LocationManagerUpdateType.hashValue.getter()
{
  sub_1B0268DDC();
  sub_1B0268DE8();
  return sub_1B0268E0C();
}

unint64_t sub_1B02643F8()
{
  unint64_t result;

  result = qword_1EEE96A48;
  if (!qword_1EEE96A48)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for LocationManagerUpdateType, &type metadata for LocationManagerUpdateType);
    atomic_store(result, (unint64_t *)&qword_1EEE96A48);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationManagerUpdateType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0264480 + 4 * byte_1B0282915[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B02644B4 + 4 * byte_1B0282910[v4]))();
}

uint64_t sub_1B02644B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B02644BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B02644C4);
  return result;
}

uint64_t sub_1B02644D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B02644D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B02644DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B02644E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t dispatch thunk of LocationManagerObserver.updateTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LocationManagerObserver.reducedLocationUpdates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of LocationManagerObserver.authorizationDidChange(_:authorizationStatus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of LocationManagerObserver.currentCLLocationDidUpdate(_:location:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of LocationManagerObserver.currentLocationDidUpdate(_:location:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of LocationManagerObserver.currentLocationUpdateDidFail(_:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

void sub_1B0264520()
{
  OUTLINED_FUNCTION_3_68();
}

void sub_1B026453C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v4 = OUTLINED_FUNCTION_4_67();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 24))(v2, v1, v4, v3);
    OUTLINED_FUNCTION_0_96();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
  }
}

void sub_1B0264574()
{
  OUTLINED_FUNCTION_3_68();
}

void sub_1B0264590(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v2 = OUTLINED_FUNCTION_4_67();
    OUTLINED_FUNCTION_2_84(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 48));
    OUTLINED_FUNCTION_0_96();
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
  }
}

uint64_t RandomAccessCollection.binarySearch(_:)@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(char *);
  uint64_t v41;
  uint64_t v42;
  char v43[32];

  v40 = a1;
  v41 = a2;
  v42 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a4 + 8) + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v39 = AssociatedTypeWitness;
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v37 = (char *)&v31 - v10;
  v11 = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v32 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v31 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v31 - v18;
  sub_1B02687B8();
  sub_1B02687D0();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_1_88();
  v36 = v20;
  if ((sub_1B02683F8() & 1) == 0)
  {
    v34 = v11;
    v35 = v8;
    v33 = v5;
    do
    {
      v21 = v12;
      sub_1B02687AC();
      sub_1B02687A0();
      v22 = sub_1B02687DC();
      v23 = v37;
      v24 = v38;
      v25 = a3;
      v26 = v39;
      (*(void (**)(char *))(v38 + 16))(v37);
      ((void (*)(char *, _QWORD))v22)(v43, 0);
      LOBYTE(v22) = v40(v23);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v26);
      if ((v22 & 1) != 0)
      {
        v27 = v32;
        sub_1B02687C4();
        v12 = v21;
        v28 = v34;
        OUTLINED_FUNCTION_6_0((uint64_t)v16);
        OUTLINED_FUNCTION_6_0(a5);
        (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a5, v27, v28);
      }
      else
      {
        v12 = v21;
        v29 = v34;
        OUTLINED_FUNCTION_6_0((uint64_t)v19);
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v16, v29);
      }
      a3 = v25;
      OUTLINED_FUNCTION_1_88();
    }
    while ((sub_1B02683F8() & 1) == 0);
  }
  return OUTLINED_FUNCTION_6_0((uint64_t)v19);
}

uint64_t LocationDataModelFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t LocationDataModelFactory.init()()
{
  uint64_t v0;

  return v0;
}

void LocationDataModelFactory.makeLocationFromRemoteDictionary(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204DC0);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_8_57();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2065F0);
  if (OUTLINED_FUNCTION_0_97())
  {
    OUTLINED_FUNCTION_3_69(0x656D614E79746943, 0xE800000000000000);
    if (v28)
    {
      if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
      {
        OUTLINED_FUNCTION_3_69(0x656475746974614CLL, 0xE800000000000000);
        if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
        {
          OUTLINED_FUNCTION_3_69(0x64757469676E6F4CLL, 0xE900000000000065);
          if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
          {
            v2 = OUTLINED_FUNCTION_34_33();
            OUTLINED_FUNCTION_3_69(v2 & 0xFFFFFFFFFFFFLL | 0x6954000000000000, 0xEB00000000656C74);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            v6 = OUTLINED_FUNCTION_34_33();
            OUTLINED_FUNCTION_3_69(v6 & 0xFFFFFFFFFFFFLL | 0x7553000000000000, 0xEE00656C74697462);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            v7 = OUTLINED_FUNCTION_27_28();
            OUTLINED_FUNCTION_3_69(v7, v8);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            OUTLINED_FUNCTION_3_69(0x7261646E6F636573, 0xED0000656D614E79);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            OUTLINED_FUNCTION_3_69(0x656E6F5A656D6954, 0xE800000000000000);
            OUTLINED_FUNCTION_34_0();
            if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
            {
              v25 = v26;
              if (v27)
              {
                sub_1B0266EE0();
                v9 = OUTLINED_FUNCTION_5_5();
                if (__swift_getEnumTagSinglePayload(v0, 1, v9) != 1)
                {
LABEL_34:
                  OUTLINED_FUNCTION_40_6();
                  v23 = OUTLINED_FUNCTION_24_37();
                  OUTLINED_FUNCTION_16_40(v23);
                  v24 = OUTLINED_FUNCTION_22_33();
                  OUTLINED_FUNCTION_1_89(v24);
                  sub_1B00C9794(v0, &qword_1ED204DC0);
                  goto LABEL_12;
                }
                v10 = 0;
LABEL_19:
                if (qword_1ED202108 != -1)
                  swift_once();
                v14 = sub_1B0267C54();
                __swift_project_value_buffer(v14, (uint64_t)qword_1ED2020F0);
                OUTLINED_FUNCTION_14_7();
                OUTLINED_FUNCTION_14_7();
                v15 = (void *)sub_1B0267C3C();
                v16 = sub_1B0268824();
                if (OUTLINED_FUNCTION_41_3((os_log_type_t)v16))
                {
                  OUTLINED_FUNCTION_31_29();
                  OUTLINED_FUNCTION_21_38();
                  OUTLINED_FUNCTION_6_63(7.2227e-34);
                  *(_WORD *)(v16 + 12) = 2081;
                  OUTLINED_FUNCTION_33_25();
                  v17 = OUTLINED_FUNCTION_23_41();
                  OUTLINED_FUNCTION_13_51(v17);
                  OUTLINED_FUNCTION_20_9();
                  OUTLINED_FUNCTION_7_59();
                  *(_WORD *)(v16 + 32) = 1025;
                  if ((v10 & 1) != 0)
                  {
                    v18 = 0;
                    goto LABEL_33;
                  }
                  OUTLINED_FUNCTION_28_34();
                  v20 = v20 && v25 == v19;
                  if (v20)
                  {
                    OUTLINED_FUNCTION_57_2();
                  }
                  else
                  {
                    v21 = OUTLINED_FUNCTION_15_40();
                    OUTLINED_FUNCTION_57_2();
                    v18 = 0;
                    if ((v21 & 1) == 0)
                    {
LABEL_33:
                      OUTLINED_FUNCTION_11_48(v18);
                      OUTLINED_FUNCTION_57_2();
                      OUTLINED_FUNCTION_19_46(&dword_1B00C3000, v22, (os_log_type_t)v16, "failed to obtain a timeZone from remote location. name=%{private,mask.hash}s, timeZoneIdentifier=%{BOOL,private,mask.hash}d");
                      OUTLINED_FUNCTION_17_40();
                      OUTLINED_FUNCTION_4();
                    }
                  }
                  v18 = 1;
                  goto LABEL_33;
                }

                OUTLINED_FUNCTION_6_3();
                OUTLINED_FUNCTION_6_3();
                goto LABEL_34;
              }
            }
            else
            {
              v25 = 0;
            }
            v11 = OUTLINED_FUNCTION_5_5();
            v10 = 1;
            OUTLINED_FUNCTION_18_46(v11, v12, v13, v11);
            goto LABEL_19;
          }
        }
        OUTLINED_FUNCTION_31_0();
        OUTLINED_FUNCTION_34_0();
      }
      else
      {
        OUTLINED_FUNCTION_34_0();
      }
    }
    else
    {
      v3 = OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_2_85(v3, &qword_1ED2077B0);
    }
  }
  sub_1B0265970();
  v4 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_29_33(v4, v5);
LABEL_12:
  OUTLINED_FUNCTION_0_7();
}

void LocationDataModelFactory.makeLocationFromLocalDictionary(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204DC0);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_8_57();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2065F0);
  if (OUTLINED_FUNCTION_0_97())
  {
    OUTLINED_FUNCTION_3_69(1701667150, 0xE400000000000000);
    if (v26)
    {
      if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
      {
        OUTLINED_FUNCTION_3_69(7627084, 0xE300000000000000);
        if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
        {
          OUTLINED_FUNCTION_3_69(7237452, 0xE300000000000000);
          if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
          {
            OUTLINED_FUNCTION_3_69(0x7261655379746943, 0xEF656C7469546863);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            OUTLINED_FUNCTION_3_69(0xD000000000000012, 0x80000001B028BC00);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            v5 = OUTLINED_FUNCTION_27_28();
            OUTLINED_FUNCTION_3_69(v5, 0xEB00000000656D61);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            OUTLINED_FUNCTION_3_69(0x7261646E6F636573, 0xED0000656D614E79);
            OUTLINED_FUNCTION_0_97();
            OUTLINED_FUNCTION_4_68();
            OUTLINED_FUNCTION_3_69(0x656E6F5A656D6954, 0xE800000000000000);
            OUTLINED_FUNCTION_34_0();
            if ((OUTLINED_FUNCTION_0_97() & 1) != 0)
            {
              v23 = v24;
              if (v25)
              {
                sub_1B0266EE0();
                v6 = OUTLINED_FUNCTION_5_5();
                if (__swift_getEnumTagSinglePayload(v0, 1, v6) != 1)
                {
LABEL_34:
                  OUTLINED_FUNCTION_40_6();
                  v20 = OUTLINED_FUNCTION_24_37();
                  OUTLINED_FUNCTION_16_40(v20);
                  v21 = OUTLINED_FUNCTION_22_33();
                  OUTLINED_FUNCTION_1_89(v21);
                  sub_1B00C9794(v0, &qword_1ED204DC0);
                  goto LABEL_12;
                }
                v7 = 0;
LABEL_19:
                if (qword_1ED202108 != -1)
                  swift_once();
                v11 = sub_1B0267C54();
                __swift_project_value_buffer(v11, (uint64_t)qword_1ED2020F0);
                OUTLINED_FUNCTION_14_7();
                OUTLINED_FUNCTION_14_7();
                v12 = (void *)sub_1B0267C3C();
                v13 = sub_1B0268824();
                if (OUTLINED_FUNCTION_41_3(v13))
                {
                  v22 = v13;
                  OUTLINED_FUNCTION_31_29();
                  OUTLINED_FUNCTION_21_38();
                  OUTLINED_FUNCTION_6_63(7.2227e-34);
                  *(_WORD *)(v7 + 12) = 2081;
                  OUTLINED_FUNCTION_33_25();
                  v14 = OUTLINED_FUNCTION_23_41();
                  OUTLINED_FUNCTION_13_51(v14);
                  OUTLINED_FUNCTION_20_9();
                  OUTLINED_FUNCTION_7_59();
                  *(_WORD *)(v7 + 32) = 1025;
                  if ((v7 & 1) != 0)
                  {
                    v15 = 0;
                    goto LABEL_33;
                  }
                  OUTLINED_FUNCTION_28_34();
                  v17 = v17 && v23 == v16;
                  if (v17)
                  {
                    OUTLINED_FUNCTION_57_2();
                  }
                  else
                  {
                    v18 = OUTLINED_FUNCTION_15_40();
                    OUTLINED_FUNCTION_57_2();
                    v15 = 0;
                    if ((v18 & 1) == 0)
                    {
LABEL_33:
                      OUTLINED_FUNCTION_11_48(v15);
                      OUTLINED_FUNCTION_57_2();
                      OUTLINED_FUNCTION_19_46(&dword_1B00C3000, v19, v22, "failed to obtain a timeZone from local location. name=%{private,mask.hash}s, timeZoneIdentifier=%{BOOL,private,mask.hash}d");
                      OUTLINED_FUNCTION_17_40();
                      OUTLINED_FUNCTION_4();
                    }
                  }
                  v15 = 1;
                  goto LABEL_33;
                }

                OUTLINED_FUNCTION_6_3();
                OUTLINED_FUNCTION_6_3();
                goto LABEL_34;
              }
            }
            else
            {
              v23 = 0;
            }
            v8 = OUTLINED_FUNCTION_5_5();
            v7 = 1;
            OUTLINED_FUNCTION_18_46(v8, v9, v10, v8);
            goto LABEL_19;
          }
        }
        OUTLINED_FUNCTION_31_0();
        OUTLINED_FUNCTION_34_0();
      }
      else
      {
        OUTLINED_FUNCTION_34_0();
      }
    }
    else
    {
      v2 = OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_2_85(v2, &qword_1ED2077B0);
    }
  }
  sub_1B0265970();
  v3 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_29_33(v3, v4);
LABEL_12:
  OUTLINED_FUNCTION_0_7();
}

uint64_t LocationDataModelFactory.makeLocationsFromSyncedLocations(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2035B8);
  type metadata accessor for LocationDataModel();
  return sub_1B02681F4();
}

uint64_t sub_1B0265348@<X0>(const void *a1@<X1>, _QWORD *a2@<X8>)
{
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
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int EnumTagSinglePayload;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
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
  int *v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD __dst[19];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207380);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v45 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED204DC0);
  MEMORY[0x1E0C80A78](v10);
  v55 = (uint64_t)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v45 - v13;
  memcpy(__dst, a1, sizeof(__dst));
  v16 = __dst[6];
  v15 = __dst[7];
  sub_1B0267384();
  v52 = v16;
  sub_1B0266EE0();
  v17 = sub_1B0266F4C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v17);
  v51 = v15;
  v54 = v14;
  v53 = v9;
  if (EnumTagSinglePayload == 1)
  {
    if (qword_1ED202108 != -1)
      swift_once();
    v19 = sub_1B0267C54();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED2020F0);
    swift_bridgeObjectRetain_n();
    sub_1B019C964((uint64_t)__dst);
    v20 = sub_1B0267C3C();
    v21 = sub_1B0268824();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v57 = v23;
      *(_DWORD *)v22 = 141558787;
      v56 = 1752392040;
      sub_1B02689D4();
      *(_WORD *)(v22 + 12) = 2081;
      v24 = __dst[2];
      v25 = __dst[3];
      sub_1B0267384();
      v56 = sub_1B00DDB6C(v24, v25, &v57);
      sub_1B02689D4();
      v26 = v51;
      swift_bridgeObjectRelease();
      sub_1B019C9F8((uint64_t)__dst);
      *(_WORD *)(v22 + 22) = 2160;
      v56 = 1752392040;
      sub_1B02689D4();
      *(_WORD *)(v22 + 32) = 2081;
      sub_1B0267384();
      v56 = sub_1B00DDB6C(v52, v26, &v57);
      v14 = v54;
      sub_1B02689D4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B00C3000, v20, v21, "failed to obtain a timeZone from synced location. name=%{private,mask.hash}s, timeZoneIdentifier=%{private,mask.hash}s", (uint8_t *)v22, 0x2Au);
      swift_arrayDestroy();
      v27 = v23;
      v9 = v53;
      MEMORY[0x1B5E0733C](v27, -1, -1);
      MEMORY[0x1B5E0733C](v22, -1, -1);

    }
    else
    {
      sub_1B019C9F8((uint64_t)__dst);

      swift_bridgeObjectRelease_n();
    }
  }
  v28 = __dst[1];
  v46 = __dst[0];
  v29 = __dst[3];
  v45 = __dst[2];
  v30 = __dst[4];
  v31 = __dst[5];
  sub_1B01D6E64((uint64_t)v14, v55);
  v32 = sub_1B0266CD0();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v32);
  v33 = __dst[9];
  v47 = __dst[8];
  v34 = __dst[11];
  v48 = __dst[10];
  v35 = __dst[13];
  v49 = __dst[12];
  v36 = __dst[15];
  v50 = __dst[14];
  if ((__dst[17] & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v32);
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
  }
  else
  {
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0267384();
    sub_1B0266C70();
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v32);
  }
  *a2 = v46;
  a2[1] = v28;
  a2[2] = v45;
  a2[3] = v29;
  a2[4] = v30;
  a2[5] = v31;
  v37 = (int *)type metadata accessor for LocationDataModel();
  sub_1B0265B24(v55, (uint64_t)a2 + v37[5], &qword_1ED204DC0);
  v38 = (_QWORD *)((char *)a2 + v37[6]);
  v39 = v51;
  *v38 = v52;
  v38[1] = v39;
  sub_1B0265B24((uint64_t)v53, (uint64_t)a2 + v37[7], &qword_1ED207380);
  v40 = (_QWORD *)((char *)a2 + v37[8]);
  *v40 = v47;
  v40[1] = v33;
  v41 = (_QWORD *)((char *)a2 + v37[9]);
  *v41 = v48;
  v41[1] = v34;
  v42 = (_QWORD *)((char *)a2 + v37[10]);
  *v42 = v49;
  v42[1] = v35;
  v43 = (_QWORD *)((char *)a2 + v37[11]);
  *v43 = v50;
  v43[1] = v36;
  sub_1B0265B24((uint64_t)v6, (uint64_t)a2 + v37[12], &qword_1ED207380);
  return sub_1B00C9794((uint64_t)v54, &qword_1ED204DC0);
}

uint64_t LocationDataModelFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LocationDataModelFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_1B0265934()
{
  LocationDataModelFactory.makeLocationFromLocalDictionary(_:)();
}

void sub_1B0265948()
{
  LocationDataModelFactory.makeLocationFromRemoteDictionary(_:)();
}

uint64_t sub_1B026595C()
{
  return LocationDataModelFactory.makeLocationsFromSyncedLocations(_:)();
}

unint64_t sub_1B0265970()
{
  unint64_t result;

  result = qword_1EEE96A50;
  if (!qword_1EEE96A50)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0282B04, &type metadata for SyncedLocationsDataError);
    atomic_store(result, (unint64_t *)&qword_1EEE96A50);
  }
  return result;
}

uint64_t dispatch thunk of LocationDataModelFactoryType.makeLocationFromLocalDictionary(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of LocationDataModelFactoryType.makeLocationFromRemoteDictionary(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of LocationDataModelFactoryType.makeLocationsFromSyncedLocations(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for LocationDataModelFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocationDataModelFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocationDataModelFactory.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t storeEnumTagSinglePayload for SyncedLocationsDataError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1B0265A64 + 4 * byte_1B0282A15[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1B0265A98 + 4 * byte_1B0282A10[v4]))();
}

uint64_t sub_1B0265A98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0265AA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B0265AA8);
  return result;
}

uint64_t sub_1B0265AB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0265ABCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1B0265AC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0265AC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SyncedLocationsDataError()
{
  return &type metadata for SyncedLocationsDataError;
}

unint64_t sub_1B0265AE8()
{
  unint64_t result;

  result = qword_1EEE96A58;
  if (!qword_1EEE96A58)
  {
    result = MEMORY[0x1B5E0724C](&unk_1B0282ADC, &type metadata for SyncedLocationsDataError);
    atomic_store(result, (unint64_t *)&qword_1EEE96A58);
  }
  return result;
}

uint64_t sub_1B0265B24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t WeatherMapOverlayServiceCDN.hostOverride.getter()
{
  unsigned __int8 *v0;
  unint64_t v1;

  v1 = 0xD000000000000017;
  if (*v0 != 1)
    v1 = 0xD00000000000001ALL;
  if (*v0)
    return v1;
  else
    return *v0;
}

WeatherCore::WeatherMapOverlayServiceCDN_optional __swiftcall WeatherMapOverlayServiceCDN.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherCore::WeatherMapOverlayServiceCDN_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1B0268BC0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t WeatherMapOverlayServiceCDN.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656C707061;
  if (*v0 != 1)
    v1 = 0x796C74736166;
  if (*v0)
    return v1;
  else
    return 0x746C7561666564;
}

void sub_1B0265C60()
{
  sub_1B0141B0C();
}

void sub_1B0265C6C()
{
  sub_1B025FDC8();
}

uint64_t sub_1B0265C74(uint64_t a1)
{
  char *v1;

  return sub_1B0258FA4(a1, *v1);
}

void sub_1B0265C7C()
{
  sub_1B025FF50();
}

WeatherCore::WeatherMapOverlayServiceCDN_optional sub_1B0265C84(Swift::String *a1)
{
  return WeatherMapOverlayServiceCDN.init(rawValue:)(*a1);
}

uint64_t sub_1B0265C90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = WeatherMapOverlayServiceCDN.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t WeatherMapOverlayServiceCDN.shortDescription.getter@<X0>(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t inited;

  if (*v1)
  {
    if (*v1 == 1)
    {
      v3 = 0xE500000000000000;
      v4 = 0x656C707041;
    }
    else
    {
      v3 = 0xE600000000000000;
      v4 = 0x796C74736146;
    }
  }
  else
  {
    v3 = 0xE700000000000000;
    v4 = 0x746C7561666544;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED207388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B0269D50;
  *(_QWORD *)(inited + 32) = 1701869940;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v3;
  sub_1B0268398();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE96A60);
  a1[4] = sub_1B0265DD4();
  __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_1B0267378();
}

unint64_t sub_1B0265DD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE96A68;
  if (!qword_1EEE96A68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE96A60);
    result = MEMORY[0x1B5E0724C](MEMORY[0x1E0DB3C80], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE96A68);
  }
  return result;
}

unint64_t sub_1B0265E1C()
{
  unint64_t result;

  result = qword_1ED200640;
  if (!qword_1ED200640)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for WeatherMapOverlayServiceCDN, &type metadata for WeatherMapOverlayServiceCDN);
    atomic_store(result, (unint64_t *)&qword_1ED200640);
  }
  return result;
}

unint64_t sub_1B0265E5C()
{
  unint64_t result;

  result = qword_1EEE96A70;
  if (!qword_1EEE96A70)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for WeatherMapOverlayServiceCDN, &type metadata for WeatherMapOverlayServiceCDN);
    atomic_store(result, (unint64_t *)&qword_1EEE96A70);
  }
  return result;
}

uint64_t sub_1B0265E9C()
{
  sub_1B0266094();
  return sub_1B026736C();
}

uint64_t sub_1B0265EC4()
{
  sub_1B0266058();
  return sub_1B0268578();
}

uint64_t sub_1B0265F04()
{
  sub_1B0266058();
  return sub_1B026856C();
}

uint64_t sub_1B0265F4C()
{
  sub_1B0266058();
  return sub_1B0268560();
}

uint64_t storeEnumTagSinglePayload for WeatherMapOverlayServiceCDN(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B0265FD8 + 4 * byte_1B0282B55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B026600C + 4 * byte_1B0282B50[v4]))();
}

uint64_t sub_1B026600C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B0266014(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B026601CLL);
  return result;
}

uint64_t sub_1B0266028(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B0266030);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B0266034(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B026603C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WeatherMapOverlayServiceCDN()
{
  return &type metadata for WeatherMapOverlayServiceCDN;
}

unint64_t sub_1B0266058()
{
  unint64_t result;

  result = qword_1ED200648;
  if (!qword_1ED200648)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for WeatherMapOverlayServiceCDN, &type metadata for WeatherMapOverlayServiceCDN);
    atomic_store(result, (unint64_t *)&qword_1ED200648);
  }
  return result;
}

unint64_t sub_1B0266094()
{
  unint64_t result;

  result = qword_1EEE96A78;
  if (!qword_1EEE96A78)
  {
    result = MEMORY[0x1B5E0724C](&protocol conformance descriptor for WeatherMapOverlayServiceCDN, &type metadata for WeatherMapOverlayServiceCDN);
    atomic_store(result, (unint64_t *)&qword_1EEE96A78);
  }
  return result;
}

void WCLogForCategory_cold_1()
{
  __assert_rtn("WCLogForCategory", "WCLogging.m", 15, "category < WCLoggingCategoryCount");
}

uint64_t sub_1B0266160()
{
  return MEMORY[0x1E0C902C8]();
}

uint64_t sub_1B026616C()
{
  return MEMORY[0x1E0C90328]();
}

uint64_t sub_1B0266178()
{
  return MEMORY[0x1E0C90340]();
}

uint64_t sub_1B0266184()
{
  return MEMORY[0x1E0C90360]();
}

uint64_t sub_1B0266190()
{
  return MEMORY[0x1E0C90380]();
}

uint64_t sub_1B026619C()
{
  return MEMORY[0x1E0C90420]();
}

uint64_t sub_1B02661A8()
{
  return MEMORY[0x1E0C90428]();
}

uint64_t sub_1B02661B4()
{
  return MEMORY[0x1E0C90438]();
}

uint64_t sub_1B02661C0()
{
  return MEMORY[0x1E0C904D8]();
}

uint64_t sub_1B02661CC()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_1B02661D8()
{
  return MEMORY[0x1E0C905A0]();
}

uint64_t sub_1B02661E4()
{
  return MEMORY[0x1E0C905C0]();
}

uint64_t sub_1B02661F0()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_1B02661FC()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_1B0266208()
{
  return MEMORY[0x1E0C906D8]();
}

uint64_t sub_1B0266214()
{
  return MEMORY[0x1E0C90778]();
}

uint64_t sub_1B0266220()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_1B026622C()
{
  return MEMORY[0x1E0C909C8]();
}

uint64_t sub_1B0266238()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_1B0266244()
{
  return MEMORY[0x1E0C90A50]();
}

uint64_t sub_1B0266250()
{
  return MEMORY[0x1E0C90A70]();
}

uint64_t sub_1B026625C()
{
  return MEMORY[0x1E0C90AC8]();
}

uint64_t sub_1B0266268()
{
  return MEMORY[0x1E0C90AD8]();
}

uint64_t sub_1B0266274()
{
  return MEMORY[0x1E0C90AE8]();
}

uint64_t sub_1B0266280()
{
  return MEMORY[0x1E0C90AF8]();
}

uint64_t sub_1B026628C()
{
  return MEMORY[0x1E0C90B08]();
}

uint64_t sub_1B0266298()
{
  return MEMORY[0x1E0C90B20]();
}

uint64_t sub_1B02662A4()
{
  return MEMORY[0x1E0C90B50]();
}

uint64_t sub_1B02662B0()
{
  return MEMORY[0x1E0C90B78]();
}

uint64_t sub_1B02662BC()
{
  return MEMORY[0x1E0C90B80]();
}

uint64_t sub_1B02662C8()
{
  return MEMORY[0x1E0C90BB8]();
}

uint64_t sub_1B02662D4()
{
  return MEMORY[0x1E0C90CF0]();
}

uint64_t sub_1B02662E0()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_1B02662EC()
{
  return MEMORY[0x1E0C90D10]();
}

uint64_t sub_1B02662F8()
{
  return MEMORY[0x1E0C90D20]();
}

uint64_t sub_1B0266304()
{
  return MEMORY[0x1E0C90D98]();
}

uint64_t sub_1B0266310()
{
  return MEMORY[0x1E0C90DB0]();
}

uint64_t sub_1B026631C()
{
  return MEMORY[0x1E0C90E88]();
}

uint64_t sub_1B0266328()
{
  return MEMORY[0x1E0C90F08]();
}

uint64_t sub_1B0266334()
{
  return MEMORY[0x1E0C90F20]();
}

uint64_t sub_1B0266340()
{
  return MEMORY[0x1E0C90F28]();
}

uint64_t sub_1B026634C()
{
  return MEMORY[0x1E0C90F38]();
}

uint64_t sub_1B0266358()
{
  return MEMORY[0x1E0C90F60]();
}

uint64_t sub_1B0266364()
{
  return MEMORY[0x1E0C90F78]();
}

uint64_t sub_1B0266370()
{
  return MEMORY[0x1E0C90F90]();
}

uint64_t sub_1B026637C()
{
  return MEMORY[0x1E0C90FA0]();
}

uint64_t sub_1B0266388()
{
  return MEMORY[0x1E0C90FB0]();
}

uint64_t sub_1B0266394()
{
  return MEMORY[0x1E0C90FC0]();
}

uint64_t sub_1B02663A0()
{
  return MEMORY[0x1E0C90FD8]();
}

uint64_t sub_1B02663AC()
{
  return MEMORY[0x1E0C90FF0]();
}

uint64_t sub_1B02663B8()
{
  return MEMORY[0x1E0C91000]();
}

uint64_t sub_1B02663C4()
{
  return MEMORY[0x1E0C91008]();
}

uint64_t sub_1B02663D0()
{
  return MEMORY[0x1E0C91040]();
}

uint64_t sub_1B02663DC()
{
  return MEMORY[0x1E0C91048]();
}

uint64_t sub_1B02663E8()
{
  return MEMORY[0x1E0C91058]();
}

uint64_t sub_1B02663F4()
{
  return MEMORY[0x1E0C91068]();
}

uint64_t sub_1B0266400()
{
  return MEMORY[0x1E0C91090]();
}

uint64_t sub_1B026640C()
{
  return MEMORY[0x1E0C910B8]();
}

uint64_t sub_1B0266418()
{
  return MEMORY[0x1E0C910D0]();
}

uint64_t sub_1B0266424()
{
  return MEMORY[0x1E0C910D8]();
}

uint64_t sub_1B0266430()
{
  return MEMORY[0x1E0C91100]();
}

uint64_t sub_1B026643C()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_1B0266448()
{
  return MEMORY[0x1E0C91140]();
}

uint64_t sub_1B0266454()
{
  return MEMORY[0x1E0C91148]();
}

uint64_t sub_1B0266460()
{
  return MEMORY[0x1E0C91208]();
}

uint64_t sub_1B026646C()
{
  return MEMORY[0x1E0C91210]();
}

uint64_t sub_1B0266478()
{
  return MEMORY[0x1E0C912F0]();
}

uint64_t sub_1B0266484()
{
  return MEMORY[0x1E0C91310]();
}

uint64_t sub_1B0266490()
{
  return MEMORY[0x1E0C91450]();
}

uint64_t sub_1B026649C()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_1B02664A8()
{
  return MEMORY[0x1E0C914A0]();
}

uint64_t sub_1B02664B4()
{
  return MEMORY[0x1E0C914A8]();
}

uint64_t sub_1B02664C0()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_1B02664CC()
{
  return MEMORY[0x1E0C914D0]();
}

uint64_t sub_1B02664D8()
{
  return MEMORY[0x1E0C914E8]();
}

uint64_t sub_1B02664E4()
{
  return MEMORY[0x1E0C91520]();
}

uint64_t sub_1B02664F0()
{
  return MEMORY[0x1E0C91530]();
}

uint64_t sub_1B02664FC()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1B0266508()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1B0266514()
{
  return MEMORY[0x1E0C91690]();
}

uint64_t sub_1B0266520()
{
  return MEMORY[0x1E0C916C0]();
}

uint64_t sub_1B026652C()
{
  return MEMORY[0x1E0C916C8]();
}

uint64_t sub_1B0266538()
{
  return MEMORY[0x1E0C916D0]();
}

uint64_t sub_1B0266544()
{
  return MEMORY[0x1E0C916F8]();
}

uint64_t sub_1B0266550()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_1B026655C()
{
  return MEMORY[0x1E0C91768]();
}

uint64_t sub_1B0266568()
{
  return MEMORY[0x1E0C91780]();
}

uint64_t sub_1B0266574()
{
  return MEMORY[0x1E0C917F8]();
}

uint64_t sub_1B0266580()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1B026658C()
{
  return MEMORY[0x1E0C918B8]();
}

uint64_t sub_1B0266598()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1B02665A4()
{
  return MEMORY[0x1E0C91930]();
}

uint64_t sub_1B02665B0()
{
  return MEMORY[0x1E0C919F0]();
}

uint64_t sub_1B02665BC()
{
  return MEMORY[0x1E0C91A10]();
}

uint64_t sub_1B02665C8()
{
  return MEMORY[0x1E0C91A20]();
}

uint64_t sub_1B02665D4()
{
  return MEMORY[0x1E0C91A30]();
}

uint64_t sub_1B02665E0()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_1B02665EC()
{
  return MEMORY[0x1E0C91A60]();
}

uint64_t sub_1B02665F8()
{
  return MEMORY[0x1E0C91A70]();
}

uint64_t sub_1B0266604()
{
  return MEMORY[0x1E0C91AA8]();
}

uint64_t sub_1B0266610()
{
  return MEMORY[0x1E0C91AB8]();
}

uint64_t sub_1B026661C()
{
  return MEMORY[0x1E0C91AD0]();
}

uint64_t sub_1B0266628()
{
  return MEMORY[0x1E0C91B20]();
}

uint64_t sub_1B0266634()
{
  return MEMORY[0x1E0C91BA0]();
}

uint64_t sub_1B0266640()
{
  return MEMORY[0x1E0C91BC8]();
}

uint64_t sub_1B026664C()
{
  return MEMORY[0x1E0C91BD0]();
}

uint64_t sub_1B0266658()
{
  return MEMORY[0x1E0C91C08]();
}

uint64_t sub_1B0266664()
{
  return MEMORY[0x1E0DC9380]();
}

uint64_t sub_1B0266670()
{
  return MEMORY[0x1E0DC9388]();
}

uint64_t sub_1B026667C()
{
  return MEMORY[0x1E0CADFB0]();
}

uint64_t sub_1B0266688()
{
  return MEMORY[0x1E0CADFC8]();
}

uint64_t sub_1B0266694()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1B02666A0()
{
  return MEMORY[0x1E0CAE080]();
}

uint64_t sub_1B02666AC()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1B02666B8()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1B02666C4()
{
  return MEMORY[0x1E0CAE0C8]();
}

uint64_t sub_1B02666D0()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_1B02666DC()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_1B02666E8()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_1B02666F4()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_1B0266700()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B026670C()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B0266718()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B0266724()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1B0266730()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_1B026673C()
{
  return MEMORY[0x1E0CAE268]();
}

uint64_t sub_1B0266748()
{
  return MEMORY[0x1E0CAE288]();
}

uint64_t sub_1B0266754()
{
  return MEMORY[0x1E0CAE290]();
}

uint64_t sub_1B0266760()
{
  return MEMORY[0x1E0CAE310]();
}

uint64_t sub_1B026676C()
{
  return MEMORY[0x1E0CAE320]();
}

uint64_t sub_1B0266778()
{
  return MEMORY[0x1E0CAE328]();
}

uint64_t sub_1B0266784()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1B0266790()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1B026679C()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1B02667A8()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1B02667B4()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1B02667C0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1B02667CC()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1B02667D8()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1B02667E4()
{
  return MEMORY[0x1E0CAE760]();
}

uint64_t sub_1B02667F0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1B02667FC()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1B0266808()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1B0266814()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1B0266820()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1B026682C()
{
  return MEMORY[0x1E0CAE818]();
}

uint64_t sub_1B0266838()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1B0266844()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_1B0266850()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1B026685C()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1B0266868()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1B0266874()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1B0266880()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1B026688C()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t sub_1B0266898()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1B02668A4()
{
  return MEMORY[0x1E0CAEA28]();
}

uint64_t sub_1B02668B0()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1B02668BC()
{
  return MEMORY[0x1E0CAECB8]();
}

uint64_t sub_1B02668C8()
{
  return MEMORY[0x1E0CAEDF0]();
}

uint64_t sub_1B02668D4()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1B02668E0()
{
  return MEMORY[0x1E0CAEEE0]();
}

uint64_t sub_1B02668EC()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1B02668F8()
{
  return MEMORY[0x1E0CAEF40]();
}

uint64_t sub_1B0266904()
{
  return MEMORY[0x1E0CAF160]();
}

uint64_t sub_1B0266910()
{
  return MEMORY[0x1E0CAF188]();
}

uint64_t sub_1B026691C()
{
  return MEMORY[0x1E0CAF1A0]();
}

uint64_t sub_1B0266928()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1B0266934()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1B0266940()
{
  return MEMORY[0x1E0CAF488]();
}

uint64_t sub_1B026694C()
{
  return MEMORY[0x1E0CAF960]();
}

uint64_t sub_1B0266958()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B0266964()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B0266970()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_1B026697C()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1B0266988()
{
  return MEMORY[0x1E0CAF9D8]();
}

uint64_t sub_1B0266994()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1B02669A0()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1B02669AC()
{
  return MEMORY[0x1E0CAFA88]();
}

uint64_t sub_1B02669B8()
{
  return MEMORY[0x1E0CAFB98]();
}

uint64_t sub_1B02669C4()
{
  return MEMORY[0x1E0CAFBA0]();
}

uint64_t sub_1B02669D0()
{
  return MEMORY[0x1E0CAFBB0]();
}

uint64_t sub_1B02669DC()
{
  return MEMORY[0x1E0CAFBB8]();
}

uint64_t sub_1B02669E8()
{
  return MEMORY[0x1E0CAFBC8]();
}

uint64_t sub_1B02669F4()
{
  return MEMORY[0x1E0CAFBD0]();
}

uint64_t sub_1B0266A00()
{
  return MEMORY[0x1E0CAFBD8]();
}

uint64_t sub_1B0266A0C()
{
  return MEMORY[0x1E0CAFBE0]();
}

uint64_t sub_1B0266A18()
{
  return MEMORY[0x1E0CAFBE8]();
}

uint64_t sub_1B0266A24()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1B0266A30()
{
  return MEMORY[0x1E0CAFCE8]();
}

uint64_t sub_1B0266A3C()
{
  return MEMORY[0x1E0CAFCF0]();
}

uint64_t sub_1B0266A48()
{
  return MEMORY[0x1E0DB2F28]();
}

uint64_t sub_1B0266A54()
{
  return MEMORY[0x1E0DB2F30]();
}

uint64_t sub_1B0266A60()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1B0266A6C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B0266A78()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1B0266A84()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1B0266A90()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1B0266A9C()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1B0266AA8()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B0266AB4()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1B0266AC0()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B0266ACC()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B0266AD8()
{
  return MEMORY[0x1E0CB0060]();
}

uint64_t sub_1B0266AE4()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t sub_1B0266AF0()
{
  return MEMORY[0x1E0CB0098]();
}

uint64_t sub_1B0266AFC()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1B0266B08()
{
  return MEMORY[0x1E0CB00F8]();
}

uint64_t sub_1B0266B14()
{
  return MEMORY[0x1E0DC9390]();
}

uint64_t sub_1B0266B20()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1B0266B2C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B0266B38()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1B0266B44()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B0266B50()
{
  return MEMORY[0x1E0CB0260]();
}

uint64_t sub_1B0266B5C()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1B0266B68()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1B0266B74()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_1B0266B80()
{
  return MEMORY[0x1E0DB2F78]();
}

uint64_t sub_1B0266B8C()
{
  return MEMORY[0x1E0DB2F80]();
}

uint64_t sub_1B0266B98()
{
  return MEMORY[0x1E0CB03F8]();
}

uint64_t sub_1B0266BA4()
{
  return MEMORY[0x1E0CB0428]();
}

uint64_t sub_1B0266BB0()
{
  return MEMORY[0x1E0CB0450]();
}

uint64_t sub_1B0266BBC()
{
  return MEMORY[0x1E0CB0458]();
}

uint64_t sub_1B0266BC8()
{
  return MEMORY[0x1E0CB0480]();
}

uint64_t sub_1B0266BD4()
{
  return MEMORY[0x1E0CB04A0]();
}

uint64_t sub_1B0266BE0()
{
  return MEMORY[0x1E0CB04A8]();
}

uint64_t sub_1B0266BEC()
{
  return MEMORY[0x1E0CB04B0]();
}

uint64_t sub_1B0266BF8()
{
  return MEMORY[0x1E0CB0548]();
}

uint64_t sub_1B0266C04()
{
  return MEMORY[0x1E0CB0568]();
}

uint64_t sub_1B0266C10()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1B0266C1C()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1B0266C28()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1B0266C34()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B0266C40()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1B0266C4C()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1B0266C58()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1B0266C64()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1B0266C70()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1B0266C7C()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1B0266C88()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1B0266C94()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B0266CA0()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1B0266CAC()
{
  return MEMORY[0x1E0CB0830]();
}

uint64_t sub_1B0266CB8()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t _s11WeatherCore11SystemClockV4time10Foundation4DateVvg_0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B0266CD0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B0266CDC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B0266CE8()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1B0266CF4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B0266D00()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B0266D0C()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1B0266D18()
{
  return MEMORY[0x1E0CB0AD8]();
}

uint64_t sub_1B0266D24()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1B0266D30()
{
  return MEMORY[0x1E0DC93B8]();
}

uint64_t sub_1B0266D3C()
{
  return MEMORY[0x1E0CB0B90]();
}

uint64_t sub_1B0266D48()
{
  return MEMORY[0x1E0CB0B98]();
}

uint64_t sub_1B0266D54()
{
  return MEMORY[0x1E0CB0BA8]();
}

uint64_t sub_1B0266D60()
{
  return MEMORY[0x1E0CB0BB0]();
}

uint64_t sub_1B0266D6C()
{
  return MEMORY[0x1E0CB0BC8]();
}

uint64_t sub_1B0266D78()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1B0266D84()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1B0266D90()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1B0266D9C()
{
  return MEMORY[0x1E0CB0C20]();
}

uint64_t sub_1B0266DA8()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1B0266DB4()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1B0266DC0()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1B0266DCC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1B0266DD8()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1B0266DE4()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1B0266DF0()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1B0266DFC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B0266E08()
{
  return MEMORY[0x1E0DC93C0]();
}

uint64_t sub_1B0266E14()
{
  return MEMORY[0x1E0DC93C8]();
}

uint64_t sub_1B0266E20()
{
  return MEMORY[0x1E0CB0F98]();
}

uint64_t sub_1B0266E2C()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1B0266E38()
{
  return MEMORY[0x1E0CB0FE8]();
}

uint64_t sub_1B0266E44()
{
  return MEMORY[0x1E0CB1018]();
}

uint64_t sub_1B0266E50()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1B0266E5C()
{
  return MEMORY[0x1E0CB1040]();
}

uint64_t sub_1B0266E68()
{
  return MEMORY[0x1E0CB1058]();
}

uint64_t sub_1B0266E74()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1B0266E80()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1B0266E8C()
{
  return MEMORY[0x1E0CB1098]();
}

uint64_t sub_1B0266E98()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1B0266EA4()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1B0266EB0()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1B0266EBC()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1B0266EC8()
{
  return MEMORY[0x1E0DB2FC8]();
}

uint64_t sub_1B0266ED4()
{
  return MEMORY[0x1E0DB2FD0]();
}

uint64_t sub_1B0266EE0()
{
  return MEMORY[0x1E0CB1400]();
}

uint64_t sub_1B0266EEC()
{
  return MEMORY[0x1E0CB1408]();
}

uint64_t sub_1B0266EF8()
{
  return MEMORY[0x1E0CB1418]();
}

uint64_t sub_1B0266F04()
{
  return MEMORY[0x1E0CB1438]();
}

uint64_t sub_1B0266F10()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1B0266F1C()
{
  return MEMORY[0x1E0CB1448]();
}

uint64_t sub_1B0266F28()
{
  return MEMORY[0x1E0CB1450]();
}

uint64_t sub_1B0266F34()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1B0266F40()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1B0266F4C()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1B0266F58()
{
  return MEMORY[0x1E0DB54A0]();
}

uint64_t sub_1B0266F64()
{
  return MEMORY[0x1E0DB54B0]();
}

uint64_t sub_1B0266F70()
{
  return MEMORY[0x1E0DB54B8]();
}

uint64_t sub_1B0266F7C()
{
  return MEMORY[0x1E0DB54C0]();
}

uint64_t sub_1B0266F88()
{
  return MEMORY[0x1E0DB54C8]();
}

uint64_t sub_1B0266F94()
{
  return MEMORY[0x1E0DB54F8]();
}

uint64_t sub_1B0266FA0()
{
  return MEMORY[0x1E0DB5510]();
}

uint64_t sub_1B0266FAC()
{
  return MEMORY[0x1E0DB5518]();
}

uint64_t sub_1B0266FB8()
{
  return MEMORY[0x1E0DB5520]();
}

uint64_t _s11TeaSettings0B0C11WeatherCoreE13NotificationsV13PrecipitationV9OverridesCfd_0()
{
  return MEMORY[0x1E0DB5548]();
}

uint64_t sub_1B0266FD0()
{
  return MEMORY[0x1E0DB55D0]();
}

uint64_t sub_1B0266FDC()
{
  return MEMORY[0x1E0DB55D8]();
}

uint64_t sub_1B0266FE8()
{
  return MEMORY[0x1E0DB55E0]();
}

uint64_t sub_1B0266FF4()
{
  return MEMORY[0x1E0DB55E8]();
}

uint64_t sub_1B0267000()
{
  return MEMORY[0x1E0DB5628]();
}

uint64_t sub_1B026700C()
{
  return MEMORY[0x1E0DB5630]();
}

uint64_t sub_1B0267018()
{
  return MEMORY[0x1E0DB5658]();
}

uint64_t sub_1B0267024()
{
  return MEMORY[0x1E0DB57F0]();
}

uint64_t sub_1B0267030()
{
  return MEMORY[0x1E0DB5808]();
}

uint64_t sub_1B026703C()
{
  return MEMORY[0x1E0DB5818]();
}

uint64_t sub_1B0267048()
{
  return MEMORY[0x1E0DB5858]();
}

uint64_t sub_1B0267054()
{
  return MEMORY[0x1E0DB5860]();
}

uint64_t sub_1B0267060()
{
  return MEMORY[0x1E0DB5868]();
}

uint64_t sub_1B026706C()
{
  return MEMORY[0x1E0DB5890]();
}

uint64_t sub_1B0267078()
{
  return MEMORY[0x1E0DB58A0]();
}

uint64_t sub_1B0267084()
{
  return MEMORY[0x1E0DB58B0]();
}

uint64_t sub_1B0267090()
{
  return MEMORY[0x1E0DC9410]();
}

uint64_t sub_1B026709C()
{
  return MEMORY[0x1E0DB58B8]();
}

uint64_t sub_1B02670A8()
{
  return MEMORY[0x1E0DB58C0]();
}

uint64_t sub_1B02670B4()
{
  return MEMORY[0x1E0DB5930]();
}

uint64_t sub_1B02670C0()
{
  return MEMORY[0x1E0DB5938]();
}

uint64_t sub_1B02670CC()
{
  return MEMORY[0x1E0DB5940]();
}

uint64_t sub_1B02670D8()
{
  return MEMORY[0x1E0DCC020]();
}

uint64_t sub_1B02670E4()
{
  return MEMORY[0x1E0DB3050]();
}

uint64_t sub_1B02670F0()
{
  return MEMORY[0x1E0DB3058]();
}

uint64_t sub_1B02670FC()
{
  return MEMORY[0x1E0DB3060]();
}

uint64_t sub_1B0267108()
{
  return MEMORY[0x1E0DB3070]();
}

uint64_t sub_1B0267114()
{
  return MEMORY[0x1E0DB30E8]();
}

uint64_t sub_1B0267120()
{
  return MEMORY[0x1E0DB30F0]();
}

uint64_t sub_1B026712C()
{
  return MEMORY[0x1E0DB30F8]();
}

uint64_t sub_1B0267138()
{
  return MEMORY[0x1E0DB3100]();
}

uint64_t sub_1B0267144()
{
  return MEMORY[0x1E0DB3108]();
}

uint64_t sub_1B0267150()
{
  return MEMORY[0x1E0DB3110]();
}

uint64_t sub_1B026715C()
{
  return MEMORY[0x1E0DB3118]();
}

uint64_t sub_1B0267168()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1B0267174()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1B0267180()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1B026718C()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1B0267198()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1B02671A4()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1B02671B0()
{
  return MEMORY[0x1E0DB32C0]();
}

uint64_t sub_1B02671BC()
{
  return MEMORY[0x1E0DB32D0]();
}

uint64_t sub_1B02671C8()
{
  return MEMORY[0x1E0DB3348]();
}

uint64_t sub_1B02671D4()
{
  return MEMORY[0x1E0DB33C8]();
}

uint64_t sub_1B02671E0()
{
  return MEMORY[0x1E0DB33E0]();
}

uint64_t sub_1B02671EC()
{
  return MEMORY[0x1E0DB33E8]();
}

uint64_t sub_1B02671F8()
{
  return MEMORY[0x1E0DB33F0]();
}

uint64_t sub_1B0267204()
{
  return MEMORY[0x1E0DB33F8]();
}

uint64_t sub_1B0267210()
{
  return MEMORY[0x1E0DB3420]();
}

uint64_t sub_1B026721C()
{
  return MEMORY[0x1E0DB3430]();
}

uint64_t sub_1B0267228()
{
  return MEMORY[0x1E0DB3438]();
}

uint64_t sub_1B0267234()
{
  return MEMORY[0x1E0DB3440]();
}

uint64_t sub_1B0267240()
{
  return MEMORY[0x1E0DB3450]();
}

uint64_t sub_1B026724C()
{
  return MEMORY[0x1E0DB3530]();
}

uint64_t sub_1B0267258()
{
  return MEMORY[0x1E0DB3540]();
}

uint64_t sub_1B0267264()
{
  return MEMORY[0x1E0DB35D0]();
}

uint64_t sub_1B0267270()
{
  return MEMORY[0x1E0DB35E8]();
}

uint64_t sub_1B026727C()
{
  return MEMORY[0x1E0DB35F0]();
}

uint64_t sub_1B0267288()
{
  return MEMORY[0x1E0DB3680]();
}

uint64_t sub_1B0267294()
{
  return MEMORY[0x1E0DB3688]();
}

uint64_t sub_1B02672A0()
{
  return MEMORY[0x1E0DB3690]();
}

uint64_t sub_1B02672AC()
{
  return MEMORY[0x1E0DB36B0]();
}

uint64_t sub_1B02672B8()
{
  return MEMORY[0x1E0DB36F0]();
}

uint64_t sub_1B02672C4()
{
  return MEMORY[0x1E0DB3770]();
}

uint64_t sub_1B02672D0()
{
  return MEMORY[0x1E0DB3790]();
}

uint64_t sub_1B02672DC()
{
  return MEMORY[0x1E0DB37C0]();
}

uint64_t sub_1B02672E8()
{
  return MEMORY[0x1E0DB3820]();
}

uint64_t sub_1B02672F4()
{
  return MEMORY[0x1E0DB3828]();
}

uint64_t sub_1B0267300()
{
  return MEMORY[0x1E0DB3880]();
}

uint64_t sub_1B026730C()
{
  return MEMORY[0x1E0DB3890]();
}

uint64_t sub_1B0267318()
{
  return MEMORY[0x1E0DB38A8]();
}

uint64_t sub_1B0267324()
{
  return MEMORY[0x1E0DB38B0]();
}

uint64_t sub_1B0267330()
{
  return MEMORY[0x1E0DB38B8]();
}

uint64_t sub_1B026733C()
{
  return MEMORY[0x1E0DB3958]();
}

uint64_t sub_1B0267348()
{
  return MEMORY[0x1E0DB3960]();
}

uint64_t sub_1B0267354()
{
  return MEMORY[0x1E0DB3978]();
}

uint64_t sub_1B0267360()
{
  return MEMORY[0x1E0DB3B08]();
}

uint64_t sub_1B026736C()
{
  return MEMORY[0x1E0DB3C60]();
}

uint64_t sub_1B0267378()
{
  return MEMORY[0x1E0DB3C68]();
}

uint64_t sub_1B0267384()
{
  return MEMORY[0x1E0DB4140]();
}

uint64_t sub_1B0267390()
{
  return MEMORY[0x1E0DB4148]();
}

uint64_t sub_1B026739C()
{
  return MEMORY[0x1E0DB4160]();
}

uint64_t sub_1B02673A8()
{
  return MEMORY[0x1E0DB4190]();
}

uint64_t sub_1B02673B4()
{
  return MEMORY[0x1E0DB4198]();
}

uint64_t sub_1B02673C0()
{
  return MEMORY[0x1E0DB41B8]();
}

uint64_t sub_1B02673CC()
{
  return MEMORY[0x1E0DB4280]();
}

uint64_t sub_1B02673D8()
{
  return MEMORY[0x1E0DB4288]();
}

uint64_t sub_1B02673E4()
{
  return MEMORY[0x1E0DB4290]();
}

uint64_t sub_1B02673F0()
{
  return MEMORY[0x1E0DB4348]();
}

uint64_t sub_1B02673FC()
{
  return MEMORY[0x1E0DB43A8]();
}

uint64_t sub_1B0267408()
{
  return MEMORY[0x1E0DB43B0]();
}

uint64_t sub_1B0267414()
{
  return MEMORY[0x1E0DB43B8]();
}

uint64_t sub_1B0267420()
{
  return MEMORY[0x1E0DB4548]();
}

uint64_t sub_1B026742C()
{
  return MEMORY[0x1E0DB4550]();
}

uint64_t sub_1B0267438()
{
  return MEMORY[0x1E0DB4558]();
}

uint64_t sub_1B0267444()
{
  return MEMORY[0x1E0DB4598]();
}

uint64_t sub_1B0267450()
{
  return MEMORY[0x1E0DB45A0]();
}

uint64_t sub_1B026745C()
{
  return MEMORY[0x1E0DB45A8]();
}

uint64_t sub_1B0267468()
{
  return MEMORY[0x1E0DB45D0]();
}

uint64_t sub_1B0267474()
{
  return MEMORY[0x1E0DB46C8]();
}

uint64_t sub_1B0267480()
{
  return MEMORY[0x1E0DB46D0]();
}

uint64_t sub_1B026748C()
{
  return MEMORY[0x1E0DB48E0]();
}

uint64_t sub_1B0267498()
{
  return MEMORY[0x1E0DB48F8]();
}

uint64_t sub_1B02674A4()
{
  return MEMORY[0x1E0DB4910]();
}

uint64_t sub_1B02674B0()
{
  return MEMORY[0x1E0DB4928]();
}

uint64_t sub_1B02674BC()
{
  return MEMORY[0x1E0DB49B8]();
}

uint64_t sub_1B02674C8()
{
  return MEMORY[0x1E0DB49E8]();
}

uint64_t sub_1B02674D4()
{
  return MEMORY[0x1E0DB49F0]();
}

uint64_t sub_1B02674E0()
{
  return MEMORY[0x1E0DB4A20]();
}

uint64_t sub_1B02674EC()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1B02674F8()
{
  return MEMORY[0x1E0DB4AC8]();
}

uint64_t sub_1B0267504()
{
  return MEMORY[0x1E0DB4AD0]();
}

uint64_t sub_1B0267510()
{
  return MEMORY[0x1E0DB4AD8]();
}

uint64_t sub_1B026751C()
{
  return MEMORY[0x1E0DB4AE0]();
}

uint64_t sub_1B0267528()
{
  return MEMORY[0x1E0DB4B60]();
}

uint64_t sub_1B0267534()
{
  return MEMORY[0x1E0DB4BA8]();
}

uint64_t sub_1B0267540()
{
  return MEMORY[0x1E0DB4BC8]();
}

uint64_t sub_1B026754C()
{
  return MEMORY[0x1E0DB4BF0]();
}

uint64_t sub_1B0267558()
{
  return MEMORY[0x1E0DB4BF8]();
}

uint64_t sub_1B0267564()
{
  return MEMORY[0x1E0DB4C00]();
}

uint64_t sub_1B0267570()
{
  return MEMORY[0x1E0DB4C08]();
}

uint64_t sub_1B026757C()
{
  return MEMORY[0x1E0DB4C10]();
}

uint64_t sub_1B0267588()
{
  return MEMORY[0x1E0DB4C30]();
}

uint64_t sub_1B0267594()
{
  return MEMORY[0x1E0DB4C38]();
}

uint64_t sub_1B02675A0()
{
  return MEMORY[0x1E0DB4C48]();
}

uint64_t sub_1B02675AC()
{
  return MEMORY[0x1E0DB4C58]();
}

uint64_t sub_1B02675B8()
{
  return MEMORY[0x1E0DB4C60]();
}

uint64_t sub_1B02675C4()
{
  return MEMORY[0x1E0DB4C68]();
}

uint64_t sub_1B02675D0()
{
  return MEMORY[0x1E0DB4C78]();
}

uint64_t sub_1B02675DC()
{
  return MEMORY[0x1E0DB4C80]();
}

uint64_t sub_1B02675E8()
{
  return MEMORY[0x1E0DB4C88]();
}

uint64_t sub_1B02675F4()
{
  return MEMORY[0x1E0DB4CB8]();
}

uint64_t sub_1B0267600()
{
  return MEMORY[0x1E0DB4CC0]();
}

uint64_t sub_1B026760C()
{
  return MEMORY[0x1E0DB4CD0]();
}

uint64_t sub_1B0267618()
{
  return MEMORY[0x1E0DB4CE8]();
}

uint64_t sub_1B0267624()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1B0267630()
{
  return MEMORY[0x1E0DB4D20]();
}

uint64_t sub_1B026763C()
{
  return MEMORY[0x1E0DB4E70]();
}

uint64_t sub_1B0267648()
{
  return MEMORY[0x1E0DB4E78]();
}

uint64_t sub_1B0267654()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1B0267660()
{
  return MEMORY[0x1E0DB4F90]();
}

uint64_t sub_1B026766C()
{
  return MEMORY[0x1E0DB4FA0]();
}

uint64_t sub_1B0267678()
{
  return MEMORY[0x1E0DB5038]();
}

uint64_t sub_1B0267684()
{
  return MEMORY[0x1E0DB50E8]();
}

uint64_t sub_1B0267690()
{
  return MEMORY[0x1E0DC9608]();
}

uint64_t sub_1B026769C()
{
  return MEMORY[0x1E0DC9630]();
}

uint64_t sub_1B02676A8()
{
  return MEMORY[0x1E0DC9658]();
}

uint64_t sub_1B02676B4()
{
  return MEMORY[0x1E0DC9698]();
}

uint64_t sub_1B02676C0()
{
  return MEMORY[0x1E0DC96D0]();
}

uint64_t sub_1B02676CC()
{
  return MEMORY[0x1E0DC9768]();
}

uint64_t sub_1B02676D8()
{
  return MEMORY[0x1E0DC9780]();
}

uint64_t sub_1B02676E4()
{
  return MEMORY[0x1E0DC97E0]();
}

uint64_t sub_1B02676F0()
{
  return MEMORY[0x1E0DC9860]();
}

uint64_t sub_1B02676FC()
{
  return MEMORY[0x1E0DC9898]();
}

uint64_t sub_1B0267708()
{
  return MEMORY[0x1E0DC98A8]();
}

uint64_t sub_1B0267714()
{
  return MEMORY[0x1E0DC98E8]();
}

uint64_t sub_1B0267720()
{
  return MEMORY[0x1E0DC98F0]();
}

uint64_t sub_1B026772C()
{
  return MEMORY[0x1E0DC9918]();
}

uint64_t sub_1B0267738()
{
  return MEMORY[0x1E0DC9948]();
}

uint64_t sub_1B0267744()
{
  return MEMORY[0x1E0DC9978]();
}

uint64_t sub_1B0267750()
{
  return MEMORY[0x1E0DC99A8]();
}

uint64_t sub_1B026775C()
{
  return MEMORY[0x1E0DC99B0]();
}

uint64_t sub_1B0267768()
{
  return MEMORY[0x1E0DC99B8]();
}

uint64_t sub_1B0267774()
{
  return MEMORY[0x1E0DC99C8]();
}

uint64_t sub_1B0267780()
{
  return MEMORY[0x1E0DC9A00]();
}

uint64_t sub_1B026778C()
{
  return MEMORY[0x1E0DC9A18]();
}

uint64_t sub_1B0267798()
{
  return MEMORY[0x1E0DC9A28]();
}

uint64_t sub_1B02677A4()
{
  return MEMORY[0x1E0DC9AB0]();
}

uint64_t sub_1B02677B0()
{
  return MEMORY[0x1E0DC9B08]();
}

uint64_t sub_1B02677BC()
{
  return MEMORY[0x1E0DC9B18]();
}

uint64_t sub_1B02677C8()
{
  return MEMORY[0x1E0DC9BB8]();
}

uint64_t sub_1B02677D4()
{
  return MEMORY[0x1E0DC9C28]();
}

uint64_t sub_1B02677E0()
{
  return MEMORY[0x1E0DC9CE8]();
}

uint64_t sub_1B02677EC()
{
  return MEMORY[0x1E0DC9D08]();
}

uint64_t sub_1B02677F8()
{
  return MEMORY[0x1E0DC9D28]();
}

uint64_t sub_1B0267804()
{
  return MEMORY[0x1E0DC9D30]();
}

uint64_t sub_1B0267810()
{
  return MEMORY[0x1E0DC9D80]();
}

uint64_t sub_1B026781C()
{
  return MEMORY[0x1E0DC9E18]();
}

uint64_t sub_1B0267828()
{
  return MEMORY[0x1E0DC9E28]();
}

uint64_t sub_1B0267834()
{
  return MEMORY[0x1E0DC9E30]();
}

uint64_t sub_1B0267840()
{
  return MEMORY[0x1E0DC9E38]();
}

uint64_t sub_1B026784C()
{
  return MEMORY[0x1E0DC9E40]();
}

uint64_t sub_1B0267858()
{
  return MEMORY[0x1E0DC9E48]();
}

uint64_t sub_1B0267864()
{
  return MEMORY[0x1E0DC9E58]();
}

uint64_t sub_1B0267870()
{
  return MEMORY[0x1E0DC9E60]();
}

uint64_t sub_1B026787C()
{
  return MEMORY[0x1E0DC9F80]();
}

uint64_t sub_1B0267888()
{
  return MEMORY[0x1E0DC9FA8]();
}

uint64_t sub_1B0267894()
{
  return MEMORY[0x1E0DC9FC0]();
}

uint64_t sub_1B02678A0()
{
  return MEMORY[0x1E0DC9FD0]();
}

uint64_t sub_1B02678AC()
{
  return MEMORY[0x1E0DC9FF8]();
}

uint64_t sub_1B02678B8()
{
  return MEMORY[0x1E0DCA030]();
}

uint64_t sub_1B02678C4()
{
  return MEMORY[0x1E0DCA040]();
}

uint64_t sub_1B02678D0()
{
  return MEMORY[0x1E0DCA048]();
}

uint64_t sub_1B02678DC()
{
  return MEMORY[0x1E0DCA0E0]();
}

uint64_t sub_1B02678E8()
{
  return MEMORY[0x1E0DCA0F0]();
}

uint64_t sub_1B02678F4()
{
  return MEMORY[0x1E0DCA118]();
}

uint64_t sub_1B0267900()
{
  return MEMORY[0x1E0DCA148]();
}

uint64_t sub_1B026790C()
{
  return MEMORY[0x1E0DCA1A8]();
}

uint64_t sub_1B0267918()
{
  return MEMORY[0x1E0DCA1B8]();
}

uint64_t sub_1B0267924()
{
  return MEMORY[0x1E0DCA290]();
}

uint64_t sub_1B0267930()
{
  return MEMORY[0x1E0DCA2A0]();
}

uint64_t sub_1B026793C()
{
  return MEMORY[0x1E0DCA2B0]();
}

uint64_t sub_1B0267948()
{
  return MEMORY[0x1E0DCA2B8]();
}

uint64_t sub_1B0267954()
{
  return MEMORY[0x1E0DCA2C0]();
}

uint64_t sub_1B0267960()
{
  return MEMORY[0x1E0DCA2C8]();
}

uint64_t sub_1B026796C()
{
  return MEMORY[0x1E0DCA2D0]();
}

uint64_t sub_1B0267978()
{
  return MEMORY[0x1E0DCA2D8]();
}

uint64_t sub_1B0267984()
{
  return MEMORY[0x1E0DCA2E0]();
}

uint64_t sub_1B0267990()
{
  return MEMORY[0x1E0DCA2E8]();
}

uint64_t sub_1B026799C()
{
  return MEMORY[0x1E0DCA300]();
}

uint64_t sub_1B02679A8()
{
  return MEMORY[0x1E0DCA310]();
}

uint64_t sub_1B02679B4()
{
  return MEMORY[0x1E0DCA318]();
}

uint64_t sub_1B02679C0()
{
  return MEMORY[0x1E0DCA338]();
}

uint64_t sub_1B02679CC()
{
  return MEMORY[0x1E0DCA340]();
}

uint64_t sub_1B02679D8()
{
  return MEMORY[0x1E0DCA348]();
}

uint64_t sub_1B02679E4()
{
  return MEMORY[0x1E0DCA350]();
}

uint64_t sub_1B02679F0()
{
  return MEMORY[0x1E0DCA378]();
}

uint64_t sub_1B02679FC()
{
  return MEMORY[0x1E0DCA388]();
}

uint64_t sub_1B0267A08()
{
  return MEMORY[0x1E0DCA3A0]();
}

uint64_t sub_1B0267A14()
{
  return MEMORY[0x1E0DCA3B0]();
}

uint64_t sub_1B0267A20()
{
  return MEMORY[0x1E0DCA3B8]();
}

uint64_t sub_1B0267A2C()
{
  return MEMORY[0x1E0DCA3C0]();
}

uint64_t sub_1B0267A38()
{
  return MEMORY[0x1E0DCA3D0]();
}

uint64_t sub_1B0267A44()
{
  return MEMORY[0x1E0DCA448]();
}

uint64_t sub_1B0267A50()
{
  return MEMORY[0x1E0DCA458]();
}

uint64_t sub_1B0267A5C()
{
  return MEMORY[0x1E0DCA528]();
}

uint64_t sub_1B0267A68()
{
  return MEMORY[0x1E0DCA530]();
}

uint64_t sub_1B0267A74()
{
  return MEMORY[0x1E0DCA5C8]();
}

uint64_t sub_1B0267A80()
{
  return MEMORY[0x1E0DCA5F0]();
}

uint64_t sub_1B0267A8C()
{
  return MEMORY[0x1E0DCA640]();
}

uint64_t sub_1B0267A98()
{
  return MEMORY[0x1E0DCA6A0]();
}

uint64_t sub_1B0267AA4()
{
  return MEMORY[0x1E0DCA6E0]();
}

uint64_t sub_1B0267AB0()
{
  return MEMORY[0x1E0DCA6E8]();
}

uint64_t sub_1B0267ABC()
{
  return MEMORY[0x1E0DCA708]();
}

uint64_t sub_1B0267AC8()
{
  return MEMORY[0x1E0DCA748]();
}

uint64_t sub_1B0267AD4()
{
  return MEMORY[0x1E0DCA790]();
}

uint64_t sub_1B0267AE0()
{
  return MEMORY[0x1E0DCA7A0]();
}

uint64_t sub_1B0267AEC()
{
  return MEMORY[0x1E0DCA7E0]();
}

uint64_t sub_1B0267AF8()
{
  return MEMORY[0x1E0DCA810]();
}

uint64_t sub_1B0267B04()
{
  return MEMORY[0x1E0DCA820]();
}

uint64_t sub_1B0267B10()
{
  return MEMORY[0x1E0DCA830]();
}

uint64_t sub_1B0267B1C()
{
  return MEMORY[0x1E0DCA848]();
}

uint64_t sub_1B0267B28()
{
  return MEMORY[0x1E0DCA858]();
}

uint64_t sub_1B0267B34()
{
  return MEMORY[0x1E0DCA870]();
}

uint64_t sub_1B0267B40()
{
  return MEMORY[0x1E0DCA880]();
}

uint64_t sub_1B0267B4C()
{
  return MEMORY[0x1E0DCA8B8]();
}

uint64_t sub_1B0267B58()
{
  return MEMORY[0x1E0DCA958]();
}

uint64_t sub_1B0267B64()
{
  return MEMORY[0x1E0DCA970]();
}

uint64_t sub_1B0267B70()
{
  return MEMORY[0x1E0DCA978]();
}

uint64_t sub_1B0267B7C()
{
  return MEMORY[0x1E0DCA9A0]();
}

uint64_t sub_1B0267B88()
{
  return MEMORY[0x1E0DCA9E0]();
}

uint64_t sub_1B0267B94()
{
  return MEMORY[0x1E0DCAA00]();
}

uint64_t sub_1B0267BA0()
{
  return MEMORY[0x1E0DCAA10]();
}

uint64_t sub_1B0267BAC()
{
  return MEMORY[0x1E0DCAA28]();
}

uint64_t sub_1B0267BB8()
{
  return MEMORY[0x1E0DCAA40]();
}

uint64_t sub_1B0267BC4()
{
  return MEMORY[0x1E0DCAAF0]();
}

uint64_t sub_1B0267BD0()
{
  return MEMORY[0x1E0DCAB18]();
}

uint64_t sub_1B0267BDC()
{
  return MEMORY[0x1E0DCAB38]();
}

uint64_t sub_1B0267BE8()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_1B0267BF4()
{
  return MEMORY[0x1E0DF1ED0]();
}

uint64_t sub_1B0267C00()
{
  return MEMORY[0x1E0DF1F18]();
}

uint64_t sub_1B0267C0C()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1B0267C18()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1B0267C24()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1B0267C30()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1B0267C3C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B0267C48()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B0267C54()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B0267C60()
{
  return MEMORY[0x1E0DB2920]();
}

uint64_t sub_1B0267C6C()
{
  return MEMORY[0x1E0DB2928]();
}

uint64_t sub_1B0267C78()
{
  return MEMORY[0x1E0DB2930]();
}

uint64_t sub_1B0267C84()
{
  return MEMORY[0x1E0DB2938]();
}

uint64_t sub_1B0267C90()
{
  return MEMORY[0x1E0DB2940]();
}

uint64_t sub_1B0267C9C()
{
  return MEMORY[0x1E0DB2948]();
}

uint64_t sub_1B0267CA8()
{
  return MEMORY[0x1E0DB2958]();
}

uint64_t sub_1B0267CB4()
{
  return MEMORY[0x1E0DCAB90]();
}

uint64_t sub_1B0267CC0()
{
  return MEMORY[0x1E0DB2B10]();
}

uint64_t sub_1B0267CCC()
{
  return MEMORY[0x1E0DB2B70]();
}

uint64_t sub_1B0267CD8()
{
  return MEMORY[0x1E0DB2B78]();
}

uint64_t sub_1B0267CE4()
{
  return MEMORY[0x1E0DB2B90]();
}

uint64_t sub_1B0267CF0()
{
  return MEMORY[0x1E0DB2B98]();
}

uint64_t sub_1B0267CFC()
{
  return MEMORY[0x1E0DB2BA0]();
}

uint64_t sub_1B0267D08()
{
  return MEMORY[0x1E0DB2BA8]();
}

uint64_t sub_1B0267D14()
{
  return MEMORY[0x1E0DB2BB0]();
}

uint64_t sub_1B0267D20()
{
  return MEMORY[0x1E0DB2BC8]();
}

uint64_t sub_1B0267D2C()
{
  return MEMORY[0x1E0DB2BD0]();
}

uint64_t sub_1B0267D38()
{
  return MEMORY[0x1E0DB2BD8]();
}

uint64_t sub_1B0267D44()
{
  return MEMORY[0x1E0DB2BE0]();
}

uint64_t sub_1B0267D50()
{
  return MEMORY[0x1E0DB2BF0]();
}

uint64_t sub_1B0267D5C()
{
  return MEMORY[0x1E0DB2BF8]();
}

uint64_t sub_1B0267D68()
{
  return MEMORY[0x1E0DB2C00]();
}

uint64_t sub_1B0267D74()
{
  return MEMORY[0x1E0DB2C08]();
}

uint64_t sub_1B0267D80()
{
  return MEMORY[0x1E0DB2C10]();
}

uint64_t sub_1B0267D8C()
{
  return MEMORY[0x1E0DB2C40]();
}

uint64_t sub_1B0267D98()
{
  return MEMORY[0x1E0DB2C48]();
}

uint64_t sub_1B0267DA4()
{
  return MEMORY[0x1E0DB2C50]();
}

uint64_t sub_1B0267DB0()
{
  return MEMORY[0x1E0DB2C58]();
}

uint64_t sub_1B0267DBC()
{
  return MEMORY[0x1E0DB2C60]();
}

uint64_t sub_1B0267DC8()
{
  return MEMORY[0x1E0DB2C78]();
}

uint64_t sub_1B0267DD4()
{
  return MEMORY[0x1E0DB2C98]();
}

uint64_t sub_1B0267DE0()
{
  return MEMORY[0x1E0DB2CA0]();
}

uint64_t sub_1B0267DEC()
{
  return MEMORY[0x1E0DB2CD8]();
}

uint64_t sub_1B0267DF8()
{
  return MEMORY[0x1E0DB2CE0]();
}

uint64_t sub_1B0267E04()
{
  return MEMORY[0x1E0DB2CF0]();
}

uint64_t sub_1B0267E10()
{
  return MEMORY[0x1E0DB2CF8]();
}

uint64_t sub_1B0267E1C()
{
  return MEMORY[0x1E0DB2D00]();
}

uint64_t sub_1B0267E28()
{
  return MEMORY[0x1E0DB2D08]();
}

uint64_t sub_1B0267E34()
{
  return MEMORY[0x1E0DB2D10]();
}

uint64_t sub_1B0267E40()
{
  return MEMORY[0x1E0DB2D28]();
}

uint64_t sub_1B0267E4C()
{
  return MEMORY[0x1E0DB2D60]();
}

uint64_t sub_1B0267E58()
{
  return MEMORY[0x1E0DB2D90]();
}

uint64_t sub_1B0267E64()
{
  return MEMORY[0x1E0DCAB98]();
}

uint64_t sub_1B0267E70()
{
  return MEMORY[0x1E0DB2DB8]();
}

uint64_t sub_1B0267E7C()
{
  return MEMORY[0x1E0DB2DD8]();
}

uint64_t sub_1B0267E88()
{
  return MEMORY[0x1E0DB2DE0]();
}

uint64_t sub_1B0267E94()
{
  return MEMORY[0x1E0DCABA0]();
}

uint64_t sub_1B0267EA0()
{
  return MEMORY[0x1E0DB2E08]();
}

uint64_t sub_1B0267EAC()
{
  return MEMORY[0x1E0DB2E30]();
}

uint64_t sub_1B0267EB8()
{
  return MEMORY[0x1E0DB2E40]();
}

uint64_t sub_1B0267EC4()
{
  return MEMORY[0x1E0DB2E88]();
}

uint64_t sub_1B0267ED0()
{
  return MEMORY[0x1E0DB2E90]();
}

uint64_t sub_1B0267EDC()
{
  return MEMORY[0x1E0DB2E98]();
}

uint64_t sub_1B0267EE8()
{
  return MEMORY[0x1E0DB2EB8]();
}

uint64_t sub_1B0267EF4()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1B0267F00()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B0267F0C()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1B0267F18()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1B0267F24()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B0267F30()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1B0267F3C()
{
  return MEMORY[0x1E0DEF588]();
}

uint64_t sub_1B0267F48()
{
  return MEMORY[0x1E0DEF590]();
}

uint64_t sub_1B0267F54()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1B0267F60()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B0267F6C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B0267F78()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B0267F84()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1B0267F90()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1B0267F9C()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1B0267FA8()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1B0267FB4()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1B0267FC0()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1B0267FCC()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1B0267FD8()
{
  return MEMORY[0x1E0D116F0]();
}

uint64_t sub_1B0267FE4()
{
  return MEMORY[0x1E0D11720]();
}

uint64_t sub_1B0267FF0()
{
  return MEMORY[0x1E0D11728]();
}

uint64_t sub_1B0267FFC()
{
  return MEMORY[0x1E0D11730]();
}

uint64_t sub_1B0268008()
{
  return MEMORY[0x1E0D11738]();
}

uint64_t sub_1B0268014()
{
  return MEMORY[0x1E0D11748]();
}

uint64_t sub_1B0268020()
{
  return MEMORY[0x1E0D11750]();
}

uint64_t sub_1B026802C()
{
  return MEMORY[0x1E0D11780]();
}

uint64_t sub_1B0268038()
{
  return MEMORY[0x1E0D11898]();
}

uint64_t sub_1B0268044()
{
  return MEMORY[0x1E0D118A0]();
}

uint64_t sub_1B0268050()
{
  return MEMORY[0x1E0D118A8]();
}

uint64_t sub_1B026805C()
{
  return MEMORY[0x1E0D118B0]();
}

uint64_t sub_1B0268068()
{
  return MEMORY[0x1E0D118B8]();
}

uint64_t sub_1B0268074()
{
  return MEMORY[0x1E0D118C0]();
}

uint64_t sub_1B0268080()
{
  return MEMORY[0x1E0D118C8]();
}

uint64_t sub_1B026808C()
{
  return MEMORY[0x1E0D118D0]();
}

uint64_t sub_1B0268098()
{
  return MEMORY[0x1E0D118D8]();
}

uint64_t sub_1B02680A4()
{
  return MEMORY[0x1E0D118E0]();
}

uint64_t sub_1B02680B0()
{
  return MEMORY[0x1E0D118E8]();
}

uint64_t sub_1B02680BC()
{
  return MEMORY[0x1E0D118F0]();
}

uint64_t sub_1B02680C8()
{
  return MEMORY[0x1E0D118F8]();
}

uint64_t sub_1B02680D4()
{
  return MEMORY[0x1E0D11900]();
}

uint64_t sub_1B02680E0()
{
  return MEMORY[0x1E0D11908]();
}

uint64_t sub_1B02680EC()
{
  return MEMORY[0x1E0D11910]();
}

uint64_t sub_1B02680F8()
{
  return MEMORY[0x1E0D11C18]();
}

uint64_t sub_1B0268104()
{
  return MEMORY[0x1E0D11C20]();
}

uint64_t sub_1B0268110()
{
  return MEMORY[0x1E0D11F08]();
}

uint64_t sub_1B026811C()
{
  return MEMORY[0x1E0D11F88]();
}

uint64_t sub_1B0268128()
{
  return MEMORY[0x1E0D11F90]();
}

uint64_t sub_1B0268134()
{
  return MEMORY[0x1E0D11F98]();
}

uint64_t sub_1B0268140()
{
  return MEMORY[0x1E0D11FA0]();
}

uint64_t sub_1B026814C()
{
  return MEMORY[0x1E0D11FA8]();
}

uint64_t sub_1B0268158()
{
  return MEMORY[0x1E0D11FB0]();
}

uint64_t sub_1B0268164()
{
  return MEMORY[0x1E0D12140]();
}

uint64_t sub_1B0268170()
{
  return MEMORY[0x1E0D12148]();
}

uint64_t sub_1B026817C()
{
  return MEMORY[0x1E0D12160]();
}

uint64_t sub_1B0268188()
{
  return MEMORY[0x1E0D12168]();
}

uint64_t sub_1B0268194()
{
  return MEMORY[0x1E0D12170]();
}

uint64_t sub_1B02681A0()
{
  return MEMORY[0x1E0D12188]();
}

uint64_t sub_1B02681AC()
{
  return MEMORY[0x1E0D12190]();
}

uint64_t sub_1B02681B8()
{
  return MEMORY[0x1E0D121A0]();
}

uint64_t sub_1B02681C4()
{
  return MEMORY[0x1E0D12380]();
}

uint64_t sub_1B02681D0()
{
  return MEMORY[0x1E0D125F8]();
}

uint64_t sub_1B02681DC()
{
  return MEMORY[0x1E0D12600]();
}

uint64_t sub_1B02681E8()
{
  return MEMORY[0x1E0D12618]();
}

uint64_t sub_1B02681F4()
{
  return MEMORY[0x1E0D12620]();
}

uint64_t sub_1B0268200()
{
  return MEMORY[0x1E0D12628]();
}

uint64_t sub_1B026820C()
{
  return MEMORY[0x1E0D12630]();
}

uint64_t sub_1B0268218()
{
  return MEMORY[0x1E0D12638]();
}

uint64_t sub_1B0268224()
{
  return MEMORY[0x1E0D12640]();
}

uint64_t sub_1B0268230()
{
  return MEMORY[0x1E0D12658]();
}

uint64_t sub_1B026823C()
{
  return MEMORY[0x1E0D12660]();
}

uint64_t sub_1B0268248()
{
  return MEMORY[0x1E0D12670]();
}

uint64_t sub_1B0268254()
{
  return MEMORY[0x1E0D12678]();
}

uint64_t sub_1B0268260()
{
  return MEMORY[0x1E0D12680]();
}

uint64_t sub_1B026826C()
{
  return MEMORY[0x1E0D128B0]();
}

uint64_t sub_1B0268278()
{
  return MEMORY[0x1E0D128B8]();
}

uint64_t sub_1B0268284()
{
  return MEMORY[0x1E0D128C8]();
}

uint64_t sub_1B0268290()
{
  return MEMORY[0x1E0D128D8]();
}

uint64_t sub_1B026829C()
{
  return MEMORY[0x1E0D12990]();
}

uint64_t sub_1B02682A8()
{
  return MEMORY[0x1E0D12998]();
}

uint64_t sub_1B02682B4()
{
  return MEMORY[0x1E0D129A0]();
}

uint64_t sub_1B02682C0()
{
  return MEMORY[0x1E0D12BA0]();
}

uint64_t sub_1B02682CC()
{
  return MEMORY[0x1E0D12BA8]();
}

uint64_t sub_1B02682D8()
{
  return MEMORY[0x1E0D12BB0]();
}

uint64_t sub_1B02682E4()
{
  return MEMORY[0x1E0D12BC0]();
}

uint64_t sub_1B02682F0()
{
  return MEMORY[0x1E0D12BD8]();
}

uint64_t sub_1B02682FC()
{
  return MEMORY[0x1E0D12BE8]();
}

uint64_t sub_1B0268308()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1B0268314()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1B0268320()
{
  return MEMORY[0x1E0CA92B8]();
}

uint64_t sub_1B026832C()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1B0268338()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1B0268344()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1B0268350()
{
  return MEMORY[0x1E0CA9A18]();
}

uint64_t sub_1B026835C()
{
  return MEMORY[0x1E0CA9A48]();
}

uint64_t sub_1B0268368()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B0268374()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B0268380()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B026838C()
{
  return MEMORY[0x1E0DB5108]();
}

uint64_t sub_1B0268398()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B02683A4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B02683B0()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B02683BC()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1B02683C8()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B02683D4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1B02683E0()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1B02683EC()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1B02683F8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B0268404()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1B0268410()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1B026841C()
{
  return MEMORY[0x1E0CB18C8]();
}

uint64_t sub_1B0268428()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1B0268434()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1B0268440()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1B026844C()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1B0268458()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B0268464()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1B0268470()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B026847C()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1B0268488()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B0268494()
{
  return MEMORY[0x1E0CB19A0]();
}

uint64_t sub_1B02684A0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B02684AC()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B02684B8()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B02684C4()
{
  return MEMORY[0x1E0CB1A60]();
}

uint64_t sub_1B02684D0()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B02684DC()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1B02684E8()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1B02684F4()
{
  return MEMORY[0x1E0DB5188]();
}

uint64_t sub_1B0268500()
{
  return MEMORY[0x1E0DB5190]();
}

uint64_t sub_1B026850C()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1B0268518()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B0268524()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B0268530()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B026853C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B0268548()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1B0268554()
{
  return MEMORY[0x1E0DB51C8]();
}

uint64_t sub_1B0268560()
{
  return MEMORY[0x1E0DB5960]();
}

uint64_t sub_1B026856C()
{
  return MEMORY[0x1E0DB5968]();
}

uint64_t sub_1B0268578()
{
  return MEMORY[0x1E0DB5970]();
}

uint64_t sub_1B0268584()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1B0268590()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1B026859C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1B02685A8()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1B02685B4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B02685C0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B02685CC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B02685D8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B02685E4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B02685F0()
{
  return MEMORY[0x1E0DB5208]();
}

uint64_t sub_1B02685FC()
{
  return MEMORY[0x1E0DB5210]();
}

uint64_t sub_1B0268608()
{
  return MEMORY[0x1E0DB5228]();
}

uint64_t sub_1B0268614()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B0268620()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B026862C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B0268638()
{
  return MEMORY[0x1E0D12D18]();
}

uint64_t sub_1B0268644()
{
  return MEMORY[0x1E0D12D20]();
}

uint64_t sub_1B0268650()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B026865C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1B0268668()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1B0268674()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1B0268680()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1B026868C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1B0268698()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B02686A4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B02686B0()
{
  return MEMORY[0x1E0DF0790]();
}

uint64_t sub_1B02686BC()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_1B02686C8()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1B02686D4()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1B02686E0()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1B02686EC()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1B02686F8()
{
  return MEMORY[0x1E0DF0838]();
}

uint64_t sub_1B0268704()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1B0268710()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1B026871C()
{
  return MEMORY[0x1E0DF0950]();
}

uint64_t sub_1B0268728()
{
  return MEMORY[0x1E0DF0980]();
}

uint64_t sub_1B0268734()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1B0268740()
{
  return MEMORY[0x1E0DCABB0]();
}

uint64_t sub_1B026874C()
{
  return MEMORY[0x1E0DCABB8]();
}

uint64_t sub_1B0268758()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1B0268764()
{
  return MEMORY[0x1E0DEB110]();
}

uint64_t sub_1B0268770()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B026877C()
{
  return MEMORY[0x1E0DB52E8]();
}

uint64_t sub_1B0268788()
{
  return MEMORY[0x1E0DB52F0]();
}

uint64_t sub_1B0268794()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B02687A0()
{
  return MEMORY[0x1E0DEB4D8]();
}

uint64_t sub_1B02687AC()
{
  return MEMORY[0x1E0DEB4E8]();
}

uint64_t sub_1B02687B8()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1B02687C4()
{
  return MEMORY[0x1E0DEB570]();
}

uint64_t sub_1B02687D0()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1B02687DC()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1B02687E8()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1B02687F4()
{
  return MEMORY[0x1E0DCABC0]();
}

uint64_t sub_1B0268800()
{
  return MEMORY[0x1E0CB1C98]();
}

uint64_t sub_1B026880C()
{
  return MEMORY[0x1E0CB1DB0]();
}

uint64_t sub_1B0268818()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B0268824()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B0268830()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B026883C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B0268848()
{
  return MEMORY[0x1E0CB1DE0]();
}

uint64_t sub_1B0268854()
{
  return MEMORY[0x1E0DCABC8]();
}

uint64_t sub_1B0268860()
{
  return MEMORY[0x1E0DCABD0]();
}

uint64_t sub_1B026886C()
{
  return MEMORY[0x1E0CB1EA0]();
}

uint64_t sub_1B0268878()
{
  return MEMORY[0x1E0DCABD8]();
}

uint64_t sub_1B0268884()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B0268890()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1B026889C()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1B02688A8()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B02688B4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B02688C0()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B02688CC()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1B02688D8()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1B02688E4()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1B02688F0()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1B02688FC()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1B0268908()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1B0268914()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1B0268920()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1B026892C()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1B0268938()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1B0268944()
{
  return MEMORY[0x1E0DCABE0]();
}

uint64_t sub_1B0268950()
{
  return MEMORY[0x1E0DCABE8]();
}

uint64_t sub_1B026895C()
{
  return MEMORY[0x1E0DCABF0]();
}

uint64_t sub_1B0268968()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1B0268974()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B0268980()
{
  return MEMORY[0x1E0CB2218]();
}

uint64_t sub_1B026898C()
{
  return MEMORY[0x1E0CB2220]();
}

uint64_t sub_1B0268998()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1B02689A4()
{
  return MEMORY[0x1E0DB5388]();
}

uint64_t sub_1B02689B0()
{
  return MEMORY[0x1E0DB5390]();
}

uint64_t sub_1B02689BC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B02689C8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1B02689D4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B02689E0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B02689EC()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1B02689F8()
{
  return MEMORY[0x1E0CB2470]();
}

uint64_t sub_1B0268A04()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B0268A10()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1B0268A1C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1B0268A28()
{
  return MEMORY[0x1E0CB25B0]();
}

uint64_t sub_1B0268A34()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B0268A40()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1B0268A4C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B0268A58()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B0268A64()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B0268A70()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B0268A7C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B0268A88()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B0268A94()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B0268AA0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B0268AAC()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B0268AB8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B0268AC4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B0268AD0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B0268ADC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B0268AE8()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1B0268AF4()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1B0268B00()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B0268B0C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B0268B18()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B0268B24()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B0268B30()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B0268B3C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B0268B48()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t sub_1B0268B54()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_1B0268B60()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1B0268B6C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1B0268B78()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B0268B84()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B0268B90()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B0268B9C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B0268BA8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B0268BB4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B0268BC0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B0268BCC()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1B0268BD8()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1B0268BE4()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1B0268BF0()
{
  return MEMORY[0x1E0DB53C0]();
}

uint64_t sub_1B0268BFC()
{
  return MEMORY[0x1E0DB53C8]();
}

uint64_t sub_1B0268C08()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1B0268C14()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1B0268C20()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1B0268C2C()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1B0268C38()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B0268C44()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1B0268C50()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1B0268C5C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B0268C68()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1B0268C74()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1B0268C80()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1B0268C8C()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1B0268C98()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1B0268CA4()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1B0268CB0()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B0268CBC()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1B0268CC8()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1B0268CD4()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1B0268CE0()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_1B0268CEC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B0268CF8()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1B0268D04()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B0268D10()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B0268D1C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1B0268D28()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B0268D34()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B0268D40()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1B0268D4C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1B0268D58()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B0268D64()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B0268D70()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B0268D7C()
{
  return MEMORY[0x1E0DCAC40]();
}

uint64_t sub_1B0268D88()
{
  return MEMORY[0x1E0DEDAF8]();
}

uint64_t sub_1B0268D94()
{
  return MEMORY[0x1E0DEDB00]();
}

uint64_t sub_1B0268DA0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B0268DAC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B0268DB8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B0268DC4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B0268DD0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B0268DDC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B0268DE8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B0268DF4()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B0268E00()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1B0268E0C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B0268E18()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t sub_1B0268E24()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B0268E30()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B0268E3C()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1B0268E48()
{
  return MEMORY[0x1E0D12D68]();
}

uint64_t sub_1B0268E54()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B0268E60()
{
  return MEMORY[0x1E0DEE8E8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1E0D26670]();
}

uint64_t GEOMapRectForMapRegion()
{
  return MEMORY[0x1E0D266A8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t WDDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0DCAC50]();
}

uint64_t WDWeatherAppIsInstalled()
{
  return MEMORY[0x1E0DCAC58]();
}

uint64_t WDWeatherLibraryDirectory()
{
  return MEMORY[0x1E0DCAC60]();
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1E0DDDAD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return MEMORY[0x1E0C9A380]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1E0DEEB48]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t wd_xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0DCAC68]();
}

