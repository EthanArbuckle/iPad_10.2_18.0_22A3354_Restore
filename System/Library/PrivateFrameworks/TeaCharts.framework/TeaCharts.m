uint64_t getEnumTagSinglePayload for SparklineModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

double CategoryDataPoint.value.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t destroy for CategoryDataPoint()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for CategoryDataPoint()
{
  return &type metadata for CategoryDataPoint;
}

uint64_t storeEnumTagSinglePayload for CategoryDataPoint(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CategoryDataPoint(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
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

TeaCharts::CategoryDataPoint __swiftcall CategoryDataPoint.init(category:value:)(Swift::String category, Swift::Double value)
{
  uint64_t v2;
  TeaCharts::CategoryDataPoint result;

  *(Swift::String *)v2 = category;
  *(Swift::Double *)(v2 + 16) = value;
  result.category = category;
  result.value = value;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t ValueAxis.init(range:calculationModel:grids:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t result;

  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  result = sub_1B81DF244(a1, a3 + 16);
  *(_QWORD *)(a3 + 56) = a2;
  return result;
}

uint64_t sub_1B81DF244(__int128 *a1, uint64_t a2)
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

ValueMetadata *type metadata accessor for ValueAxis()
{
  return &type metadata for ValueAxis;
}

uint64_t storeEnumTagSinglePayload for SparklineModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t Series.init(_:points:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t LinearAxisCalculationModel.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1B81DF28C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;

  if (*(double *)a1 != *(double *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
    return 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if (v9 || (v10 = sub_1B820ECCC(), result = 0, (v10 & 1) != 0))
  {
    if ((sub_1B81DF358(v3, v7) & 1) == 0)
      return 0;
    if (v4 == v6 && v5 == v8)
      return 1;
    else
      return sub_1B820ECCC();
  }
  return result;
}

uint64_t sub_1B81DF358(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double *v3;
  double *v4;
  double v5;
  double v6;
  char v8;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (double *)(a2 + 48);
    v4 = (double *)(a1 + 48);
    do
    {
      v5 = *v4;
      v6 = *v3;
      if (*((_QWORD *)v4 - 2) == *((_QWORD *)v3 - 2) && *((_QWORD *)v4 - 1) == *((_QWORD *)v3 - 1))
      {
        if (v5 != v6)
          return 0;
      }
      else
      {
        v8 = sub_1B820ECCC();
        result = 0;
        if ((v8 & 1) == 0 || v5 != v6)
          return result;
      }
      v3 += 3;
      v4 += 3;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t type metadata accessor for LineChartAssembly()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF424()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1B81E3450();
  if (v1 <= 0x3F)
  {
    result = sub_1B820E57C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CategoryAxisGridViewModelGenerator()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF4E0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for SparklineAssembly()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LineStyle()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ChartsAssembly()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ColumnChartInteractor()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF5EC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ColumnChartViewProvider()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF650(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for StyleManager<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for LineChartViewProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ColumnChartAssembly()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ValueAxisGridViewModelGenerator()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF6DC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GridAssembly()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for FrameworkAssembly()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF760()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_1B81DF7F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B820E708();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1B81DF864()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B820EA74();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for LineChartInteractor()
{
  return objc_opt_self();
}

uint64_t sub_1B81DF8F4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1ED554960;
  if (!qword_1ED554960)
  {
    sub_1B81DFB28(255, &qword_1ED554768, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t (*)(void))sub_1B81E5ECC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for ChartModelFactory);
    type metadata accessor for ColumnChartViewProvider();
    type metadata accessor for ColumnChartCoordinateProvider();
    sub_1B81E6018(255, v1, v2, v3);
    sub_1B81E5A18();
    sub_1B81DFB28(255, qword_1ED5548D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    sub_1B81E5CB0();
    sub_1B81DFAAC(&qword_1ED554C38, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartViewProvider, (uint64_t)&protocol conformance descriptor for ColumnChartViewProvider);
    sub_1B81DFAAC(&qword_1ED554FD8, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartCoordinateProvider, (uint64_t)&protocol conformance descriptor for ColumnChartCoordinateProvider);
    sub_1B81DFAAC(&qword_1ED5542E8, (uint64_t (*)(uint64_t))sub_1B81E6018, (uint64_t)&protocol conformance descriptor for StyleManager<A>);
    sub_1B81DFAAC(&qword_1ED554C18, (uint64_t (*)(uint64_t))sub_1B81E5A18, (uint64_t)&protocol conformance descriptor for GridViewModelGenerator<A, B>);
    sub_1B81E5B5C();
    type metadata accessor for ChartViewController();
  }
  return result;
}

uint64_t sub_1B81DFAAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCAE964](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1B81DFAEC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1BCCAE964](a3, v5), a1);
  }
  OUTLINED_FUNCTION_0();
}

void sub_1B81DFB28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

uint64_t sub_1B81DFB98()
{
  uint64_t result;

  result = qword_1ED554958;
  if (!qword_1ED554958)
  {
    sub_1B81E5D10(255);
    type metadata accessor for LineChartViewProvider();
    type metadata accessor for LineChartCoordinateProvider();
    sub_1B81E5FD4(255, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
    sub_1B81E5A18();
    sub_1B81E5BBC(255);
    sub_1B81DFAEC(&qword_1ED554750, (uint64_t (*)(uint64_t))sub_1B81E5D10, (uint64_t)&protocol conformance descriptor for ChartModelFactory<A>);
    sub_1B81DFAEC(&qword_1ED554AD8, (uint64_t (*)(uint64_t))type metadata accessor for LineChartViewProvider, (uint64_t)&protocol conformance descriptor for LineChartViewProvider);
    sub_1B81DFAEC(&qword_1ED554E50, (uint64_t (*)(uint64_t))type metadata accessor for LineChartCoordinateProvider, (uint64_t)&protocol conformance descriptor for LineChartCoordinateProvider);
    sub_1B81E6060(&qword_1ED5542F8, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle);
    sub_1B81DFAEC(&qword_1ED554C18, (uint64_t (*)(uint64_t))sub_1B81E5A18, (uint64_t)&protocol conformance descriptor for GridViewModelGenerator<A, B>);
    sub_1B81DFAEC(&qword_1ED5548B8, (uint64_t (*)(uint64_t))sub_1B81E5BBC, (uint64_t)&protocol conformance descriptor for InteractionManager<A>);
    type metadata accessor for ChartViewController();
  }
  return result;
}

uint64_t sub_1B81DFD54@<X0>(uint64_t (*a1)(_QWORD)@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = a1(0);
  result = swift_allocObject();
  a3[3] = v5;
  a3[4] = a2;
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for CategoryCoordinateCalculator()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ValueCoordinateCalculator()
{
  return objc_opt_self();
}

uint64_t SparklineStyle.init(lineStyle:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = sub_1B820E4A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B820E498();
  v8 = sub_1B820E48C();
  v10 = v9;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  a2[1] = v10;
  a2[2] = a1;
  return result;
}

uint64_t sub_1B81DFE7C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B81DFEA0()
{
  return sub_1B820E720();
}

uint64_t LinePathGenerator.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SparklineView()
{
  return objc_opt_self();
}

uint64_t FrameworkAssembly.init()()
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

  sub_1B81E57E8();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B820FEF0;
  v2 = type metadata accessor for ChartsAssembly();
  v3 = OUTLINED_FUNCTION_0_8();
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = OUTLINED_FUNCTION_1_5(&qword_1ED553F80, v4, (uint64_t)&unk_1B8211C58);
  *(_QWORD *)(v1 + 32) = v3;
  v5 = type metadata accessor for GridAssembly();
  v6 = OUTLINED_FUNCTION_0_8();
  *(_QWORD *)(v1 + 96) = v5;
  *(_QWORD *)(v1 + 104) = OUTLINED_FUNCTION_1_5(&qword_1ED553FB0, v7, (uint64_t)&unk_1B8210B54);
  *(_QWORD *)(v1 + 72) = v6;
  v8 = type metadata accessor for LineChartAssembly();
  v9 = OUTLINED_FUNCTION_0_8();
  *(_QWORD *)(v1 + 136) = v8;
  *(_QWORD *)(v1 + 144) = OUTLINED_FUNCTION_1_5(&qword_1ED554058, v10, (uint64_t)&unk_1B8211274);
  *(_QWORD *)(v1 + 112) = v9;
  v11 = type metadata accessor for ColumnChartAssembly();
  v12 = OUTLINED_FUNCTION_0_8();
  *(_QWORD *)(v1 + 176) = v11;
  *(_QWORD *)(v1 + 184) = OUTLINED_FUNCTION_1_5(&qword_1ED5540B8, v13, (uint64_t)&unk_1B8210D24);
  *(_QWORD *)(v1 + 152) = v12;
  v14 = type metadata accessor for SparklineAssembly();
  v15 = OUTLINED_FUNCTION_0_8();
  *(_QWORD *)(v1 + 216) = v14;
  *(_QWORD *)(v1 + 224) = OUTLINED_FUNCTION_1_5(&qword_1ED554088, v16, (uint64_t)&unk_1B8210074);
  *(_QWORD *)(v1 + 192) = v15;
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_1B81E0094()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            result = sub_1B820EA74();
            if (v6 <= 0x3F)
              return swift_initClassMetadata2();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B81E01C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1B820E654();
  OUTLINED_FUNCTION_1_3(v0, &qword_1ED5550C0);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v1 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(v1, &qword_1ED555178);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  sub_1B81E623C(0);
  sub_1B820E744();
  swift_release();
  OUTLINED_FUNCTION_19();
  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(v2, &qword_1ED555180);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v3 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(v3, &qword_1ED554108);
  sub_1B820E750();
  swift_release();
  return swift_release();
}

uint64_t sub_1B81E0300(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t destroy for SparklineStyle()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1B81E0374()
{
  sub_1B820E654();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for GridViewProvider();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for CategoryAxisGridViewModelGenerator();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for ValueAxisGridViewModelGenerator();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  sub_1B81E0300(0, &qword_1ED5550C8);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for GridViewRenderer();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for GridViewStyler();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  sub_1B81E0300(0, &qword_1ED554AD0);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  return swift_release();
}

uint64_t destroy for SparklineViewRenderer.LRUCacheKey()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1B81E04D4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554A20);
  result = sub_1B820E618();
  if (v6)
  {
    v4 = type metadata accessor for SparklineViewRenderer();
    swift_allocObject();
    result = sub_1B81E059C((uint64_t)v5);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_1E6E13F68;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SparklineViewRenderer()
{
  return objc_opt_self();
}

uint64_t sub_1B81E059C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;

  v2 = v1;
  sub_1B81E071C();
  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 56) = sub_1B820E72C();
  sub_1B81E06A4();
  OUTLINED_FUNCTION_52();
  *(_QWORD *)(v1 + 64) = sub_1B820E7C8();
  sub_1B81E0660(a1, v1 + 16);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v2, sel_didReceiveMemoryWarning, *MEMORY[0x1E0DC4778], 0);

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t sub_1B81E0660(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1B81E06A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553300)
  {
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555370);
    sub_1B81E5AE4();
    v0 = sub_1B820E7D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553300);
  }
}

void sub_1B81E071C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED554128[0])
  {
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555368);
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555370);
    v0 = sub_1B820E738();
    if (!v1)
      atomic_store(v0, qword_1ED554128);
  }
}

uint64_t sub_1B81E07A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1B820E654();
  OUTLINED_FUNCTION_1_3(v0, &qword_1ED554D00);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  swift_release();
  v1 = sub_1B820E654();
  OUTLINED_FUNCTION_1_3(v1, &qword_1ED554A20);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  swift_release();
  v2 = sub_1B820E654();
  OUTLINED_FUNCTION_1_3(v2, &qword_1ED5550D0);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  return swift_release();
}

uint64_t sub_1B81E0860@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _BYTE v18[24];
  uint64_t v19;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, qword_1ED554B90);
  result = sub_1B820E618();
  if (v19)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x1E0C80A78](v4);
    v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = *v6;
    v9 = type metadata accessor for LinePathGenerator();
    v17[3] = v9;
    v17[4] = &off_1E6E14D58;
    v17[0] = v8;
    v10 = type metadata accessor for LineImageGenerator();
    v11 = (_QWORD *)swift_allocObject();
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v9);
    MEMORY[0x1E0C80A78](v12);
    v14 = (_QWORD *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1E6E14D58;
    v11[2] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &off_1E6E12DC0;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81E09F4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v9[3];
  uint64_t v10;
  char **v11;

  v10 = *a1;
  v11 = &off_1E6E12DC0;
  v9[0] = a1;
  type metadata accessor for SparklineLoader();
  v1 = swift_allocObject();
  v2 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
  MEMORY[0x1E0C80A78](v2);
  v4 = (_QWORD *)((char *)&v9[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v5 + 16))(v4);
  v6 = sub_1B81E0BC4(*v4, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

uint64_t sub_1B81E0AB0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];
  uint64_t v11;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554C28);
  result = sub_1B820E618();
  if (v11)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    MEMORY[0x1E0C80A78](v4);
    v6 = (uint64_t **)&v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(uint64_t **))(v7 + 16))(v6);
    v8 = sub_1B81E09F4(*v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
    result = type metadata accessor for SparklineLoader();
    a2[3] = result;
    a2[4] = (uint64_t)&off_1E6E14590;
    *a2 = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SparklineLoader()
{
  return objc_opt_self();
}

uint64_t sub_1B81E0BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char **v15;

  v4 = sub_1B820EA08();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1B820E810();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1B820EA14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LineImageGenerator();
  v15 = &off_1E6E12DC0;
  *(_QWORD *)&v13 = a1;
  sub_1B81E0DD0();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DEF8D8], v7);
  sub_1B820E804();
  v12 = MEMORY[0x1E0DEE9D8];
  sub_1B81DFAAC(&qword_1ED553E98, v5, MEMORY[0x1E0DEF828]);
  sub_1B81E0E0C();
  sub_1B81DFAAC(&qword_1ED553E80, (uint64_t (*)(uint64_t))sub_1B81E0E0C, MEMORY[0x1E0DEAF38]);
  sub_1B820EA98();
  *(_QWORD *)(a2 + 56) = sub_1B820EA38();
  sub_1B81DF244(&v13, a2 + 16);
  return a2;
}

uint64_t type metadata accessor for LineImageGenerator()
{
  return objc_opt_self();
}

unint64_t sub_1B81E0DD0()
{
  unint64_t result;

  result = qword_1ED555360;
  if (!qword_1ED555360)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED555360);
  }
  return result;
}

void sub_1B81E0E0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553E78)
  {
    sub_1B820EA08();
    v0 = sub_1B820E924();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553E78);
  }
}

uint64_t sub_1B81E0E60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B81E0E7C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1B81E0E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView), sel_setImage_, *(_QWORD *)(a1 + 8));
  swift_retain();
  sub_1B820E7B0();
  return swift_release();
}

uint64_t LineChartCoordinateProvider.__deallocating_deinit()
{
  LineChartCoordinateProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t LineChartCoordinateProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  sub_1B81E38B8(v0 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace, (uint64_t (*)(_QWORD))sub_1B81E3D14);
  swift_release();
  return v0;
}

Swift::Void __swiftcall SparklineView.layoutSubviews()()
{
  char *v0;
  void *v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

_QWORD *_s9TeaCharts14SparklineStyleVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1B81E1058()
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

  sub_1B820E654();
  OUTLINED_FUNCTION_3_8();
  sub_1B81DF8F4();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for ColumnChartViewProvider();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  sub_1B820E654();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for ColumnChartCoordinateProvider();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  v0 = OUTLINED_FUNCTION_3_8();
  sub_1B81E6018(v0, v1, v2, v3);
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  v4 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v4, &qword_1ED554C30);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v5 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v5, &qword_1ED554CE8);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v6 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v6, &qword_1ED554AC8);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  sub_1B81E5A18();
  OUTLINED_FUNCTION_2_8();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  sub_1B81DFB28(0, qword_1ED5548D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
  OUTLINED_FUNCTION_2_8();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for ColumnChartInteractor();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  v7 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v7, &qword_1ED554DA0);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v8 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v8, &qword_1ED5550B8);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  return swift_release();
}

uint64_t sub_1B81E12A8(_QWORD *a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED5550C0);
  result = sub_1B820E618();
  if (v6)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED555178);
    result = sub_1B820E618();
    if (v4)
    {
      type metadata accessor for LineChartCoordinateProvider();
      swift_allocObject();
      return sub_1B81E5204(&v5, &v3);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81E138C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_12_2();
  result = sub_1B820E60C();
  if (result)
  {
    v9 = OUTLINED_FUNCTION_3_8();
    v10 = a2(v9);
    result = OUTLINED_FUNCTION_14();
    *(_QWORD *)(result + 16) = v4;
    a4[3] = v10;
    a4[4] = a3;
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for LineChartCoordinateProvider()
{
  uint64_t result;

  result = qword_1ED554E58;
  if (!qword_1ED554E58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B81E143C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1B820E654();
  OUTLINED_FUNCTION_3_8();
  sub_1B81DFB98();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for LineChartViewProvider();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for LineSeriesAccessibilityElementProvider();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_3_8();
  sub_1B81E5BBC(v0);
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  v1 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(v1, &qword_1ED554C28);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  sub_1B81E5FD4(0, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for LineChartRenderer();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  v2 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v2, &qword_1ED554A18);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v3 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v3, qword_1ED554B90);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_8();
  sub_1B81E5A18();
  OUTLINED_FUNCTION_7_5();
  sub_1B820E744();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_7_5();
  sub_1B820E744();
  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_0_15();
  swift_release();
  OUTLINED_FUNCTION_19();
  v4 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v4, &qword_1ED554CF8);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  OUTLINED_FUNCTION_19();
  v5 = OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_3(v5, &qword_1ED554CF0);
  OUTLINED_FUNCTION_0_5();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for LinearAxisCalculationModel()
{
  return objc_opt_self();
}

uint64_t sub_1B81E16DC()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id SparklineView.init(frame:)()
{
  void *v0;
  uint64_t v1;
  id v2;
  char *v3;
  double v4;
  id v5;
  SEL v6;
  id v7;
  id v8;
  double v9;
  objc_super *v10;
  SEL v11;
  id v12;

  OUTLINED_FUNCTION_2_13();
  v1 = OUTLINED_FUNCTION_4();
  v2 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v3 = v0;
  v4 = OUTLINED_FUNCTION_0_24();
  v7 = objc_msgSend(v5, v6, v4);
  *(_QWORD *)&v3[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView] = v7;
  v8 = v7;

  v9 = OUTLINED_FUNCTION_0_24();
  v12 = objc_msgSendSuper2(v10, v11, v9, v3, v1);
  objc_msgSend(v12, sel_addSubview_, v8);

  return v12;
}

uint64_t initializeWithCopy for SparklineViewRenderer.LRUCacheKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1B81E184C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1B81E1880(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), *(double *)(v4 + 56), *(double *)(v4 + 64), *(double *)(v4 + 72), *(_QWORD *)(v4 + 48));
}

uint64_t sub_1B81E1880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, uint64_t a12)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  double *v36;
  _QWORD *v37;
  uint64_t v38;
  void (**v39)(uint64_t);
  void *v40;
  uint64_t v41;
  char *v42;
  uint64_t v44;
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
  uint64_t v55;
  uint64_t v56;
  _QWORD aBlock[7];

  v46 = a7;
  v47 = a8;
  v48 = a3;
  v49 = a4;
  v44 = a2;
  v45 = a12;
  v52 = sub_1B820E7F8();
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v51 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1B820E810();
  v53 = *(_QWORD *)(v20 - 8);
  v54 = v20;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for SparklineModel();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(_QWORD *)(v24 + 64);
  MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = a1;
  *(_QWORD *)(v27 + 24) = a2;
  v50 = *(_QWORD *)(a5 + 56);
  sub_1B81E1C50(a6, (uint64_t)v26);
  v28 = (*(unsigned __int8 *)(v24 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v29 = (v25 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v29 + 31) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v30 + 31) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = a5;
  sub_1B81E1C94((uint64_t)v26, v33 + v28);
  v34 = (_QWORD *)(v33 + v29);
  v35 = v47;
  *v34 = v46;
  v34[1] = v35;
  v34[2] = v45;
  v36 = (double *)(v33 + v30);
  *v36 = a9;
  v36[1] = a10;
  v36[2] = a11;
  v37 = (_QWORD *)(v33 + v31);
  v38 = v49;
  *v37 = v48;
  v37[1] = v38;
  v39 = (void (**)(uint64_t))(v33 + v32);
  *v39 = sub_1B81E4748;
  v39[1] = (void (*)(uint64_t))v27;
  aBlock[4] = sub_1B81E45F4;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B81E45C8;
  aBlock[3] = &block_descriptor_1;
  v40 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1B820E804();
  v56 = MEMORY[0x1E0DEE9D8];
  sub_1B81E1CD8();
  sub_1B81E1BA0(0, &qword_1ED5530D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1B81E1BF8();
  v42 = v51;
  v41 = v52;
  sub_1B820EA98();
  MEMORY[0x1BCCAE1E4](0, v22, v42, v40);
  _Block_release(v40);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v41);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v54);
  return swift_release();
}

void sub_1B81E1BA0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1B81E1BF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5530D8;
  if (!qword_1ED5530D8)
  {
    sub_1B81E1BA0(255, &qword_1ED5530D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCAE964](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED5530D8);
  }
  return result;
}

uint64_t sub_1B81E1C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SparklineModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B81E1C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SparklineModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B81E1CD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED552C48;
  if (!qword_1ED552C48)
  {
    v1 = sub_1B820E7F8();
    result = MEMORY[0x1BCCAE964](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1ED552C48);
  }
  return result;
}

void CoordinateSpace.init(x:y:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
  type metadata accessor for CoordinateSpace();
}

uint64_t sub_1B81E1D70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 52), v2, v1);
}

void type metadata accessor for CoordinateSpace()
{
  JUMPOUT(0x1BCCAE91CLL);
}

BOOL static CategoryDataPoint.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  char v5;
  _BOOL8 result;

  v2 = *(double *)(a1 + 16);
  v3 = *(double *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 == v3;
  v5 = sub_1B820ECCC();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

void sub_1B81E1E0C(uint64_t a1, char *a2, uint64_t *a3, uint64_t a4, unsigned __int8 *a5)
{
  sub_1B81E1E2C(a1, a2, a3, a4, a5);
}

void sub_1B81E1E2C(uint64_t a1, char *a2, uint64_t *a3, uint64_t a4, unsigned __int8 *a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  SEL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  CGRect v31;
  CGRect v32;

  v6 = v5;
  v10 = *a3;
  v9 = a3[1];
  v11 = a3[2];
  v13 = *(_QWORD *)(a4 + 16);
  v12 = *(_QWORD *)(a4 + 24);
  v29 = *a5;
  v14 = OUTLINED_FUNCTION_0_16();
  objc_msgSend(v15, v16, v14);
  v17 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SparklineModel() + 20));
  v19 = *v17;
  v18 = v17[1];
  v20 = v17[2];
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_3();
  swift_retain_n();
  sub_1B820E7E0();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_19();
  if (v30)
  {
    objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView], sel_setImage_, v30);
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_7();

    return;
  }
  v28 = a1;
  v31.origin.x = OUTLINED_FUNCTION_0_16();
  CGRectGetWidth(v31);
  v32.origin.x = OUTLINED_FUNCTION_0_16();
  CGRectGetHeight(v32);
  v21 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v21, sel_scale);

  v22 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v6[5]);
  if (v29)
  {
    OUTLINED_FUNCTION_1_12(v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 16));
    MEMORY[0x1E0C80A78]();
    sub_1B81E227C();
    sub_1B820E7A4();
    v23 = (void *)sub_1B820E5DC();
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = a2;
    v24[3] = v13;
    v24[4] = v12;
    v24[5] = v19;
    v24[6] = v18;
    v24[7] = v20;
    v24[8] = v10;
    v24[9] = v9;
    v24[10] = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v25 = a2;
    sub_1B820E774();
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_19();

    swift_release();
  }
  else
  {
    v26 = OUTLINED_FUNCTION_1_12(v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8));
    if (v26)
    {
      v27 = (void *)v26;
      objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView], sel_setImage_, v26);
      OUTLINED_FUNCTION_9_3();
      sub_1B820E7B0();

      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_19();
      return;
    }
  }
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
}

void SparklineModel.init(coordinateSpace:series:)(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a2;
  sub_1B81E3874(a1, a3);
  v6 = a3 + *(int *)(type metadata accessor for SparklineModel() + 20);
  *(_QWORD *)v6 = v5;
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(a2 + 1);
  OUTLINED_FUNCTION_9();
}

uint64_t SparklineModel.series.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for SparklineModel() + 20));
  v4 = v3[1];
  v5 = v3[2];
  *a1 = *v3;
  a1[1] = v4;
  a1[2] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SparklineModel()
{
  uint64_t result;

  result = qword_1ED553308;
  if (!qword_1ED553308)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B81E227C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED553110)
  {
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555368);
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555370);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED553110);
  }
}

void sub_1B81E2308()
{
  sub_1B81E2328();
}

void sub_1B81E2328()
{
  sub_1B81E1BA0(0, (unint64_t *)&qword_1ED552C40, (uint64_t (*)(uint64_t))sub_1B81E583C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  sub_1B820E78C();
  OUTLINED_FUNCTION_1_15();
}

uint64_t sub_1B81E23A4(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1B81E23DC()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 5);
  v5 = *v0;
  v6 = v1;
  v7 = *(__int128 *)((char *)v0 + 24);
  v8 = v2;
  v9 = v0[3];
  sub_1B820ED2C();
  sub_1B81E2440((uint64_t)v4);
  return sub_1B820ED50();
}

uint64_t sub_1B81E2440(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 32);
  sub_1B820ED44();
  sub_1B820ED44();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1B820E894();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B81E2534(a1, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1B820E894();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1B81E2534(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_1B820ED38();
  if (v3)
  {
    v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_1B820E894();
      sub_1B820ED44();
      result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

_QWORD *_s9TeaCharts17CategoryDataPointVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B81E25E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B81E3450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B81E262C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t initializeWithCopy for ValueAxis(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t initializeWithCopy for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t CategoryAxis.init(categories:grids:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void (*v33)(uint64_t **, _QWORD);
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  _QWORD *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;

  v62 = a2;
  OUTLINED_FUNCTION_4_6(a1, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v53 - v9;
  OUTLINED_FUNCTION_3_10(v8, &qword_1ED554100, v11, v12, MEMORY[0x1E0DECC48]);
  v14 = v13;
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v53 - v16;
  OUTLINED_FUNCTION_3_10(v15, qword_1ED555378, v18, v19, MEMORY[0x1E0DECC58]);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v53 - v24;
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v26(a3, a1, v6);
  v53 = OUTLINED_FUNCTION_7_4();
  v27 = *(int *)(v53 + 24);
  v55 = a1;
  v56 = a3;
  *(_QWORD *)(a3 + v27) = v62;
  v59 = (void (*)(char *, char *, uint64_t))v26;
  v26((uint64_t)v25, a1, v6);
  v28 = (uint64_t *)sub_1B820E828();
  v54 = v25;
  sub_1B81E3FDC((uint64_t)v25, (uint64_t)v23);
  v61 = v7;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v23, v6);
  sub_1B81E3E24(&qword_1ED554110, MEMORY[0x1E0DB3DB8]);
  v60 = v10;
  sub_1B820E8A0();
  v29 = *(int *)(v14 + 36);
  *(_QWORD *)&v17[v29] = 0;
  v30 = MEMORY[0x1E0DB3DC0];
  sub_1B81E2F8C(0, &qword_1ED5540F8, (unint64_t *)&qword_1ED554118, MEMORY[0x1E0DB3DC0], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DEC8F8]);
  v31 = sub_1B81E3E24((unint64_t *)&qword_1ED554118, v30);
  OUTLINED_FUNCTION_0_18();
  if (&qword_1ED554118 == v63)
  {
LABEL_13:
    sub_1B81E3E84((uint64_t)v17, &qword_1ED554100, MEMORY[0x1E0DECC48]);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v55, v6);
    result = sub_1B81E3E84((uint64_t)v54, qword_1ED555378, MEMORY[0x1E0DECC58]);
    *(_QWORD *)(v56 + *(int *)(v53 + 20)) = v28;
  }
  else
  {
    v57 = v29;
    v58 = v31;
    while (1)
    {
      v32 = v28;
      v33 = (void (*)(uint64_t **, _QWORD))sub_1B820E9A8();
      v35 = *v34;
      v36 = v34[1];
      swift_bridgeObjectRetain();
      v33(&v63, 0);
      v37 = v60;
      v59(v60, v17, v6);
      sub_1B820E99C();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v37, v6);
      v38 = *(_QWORD *)&v17[v29];
      if (__OFADD__(v38, 1))
        break;
      v62 = *(_QWORD *)&v17[v29];
      *(_QWORD *)&v17[v29] = v38 + 1;
      v39 = v32;
      swift_isUniquelyReferenced_nonNull_native();
      v63 = v32;
      v40 = v35;
      v41 = v36;
      v42 = sub_1B81E2E68();
      if (__OFADD__(v39[2], (v43 & 1) == 0))
        goto LABEL_15;
      v44 = v42;
      v45 = v43;
      sub_1B81E34CC(0, &qword_1ED5532B8, MEMORY[0x1E0DEB418], MEMORY[0x1E0DEA978], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DECB20]);
      if ((sub_1B820EBF4() & 1) != 0)
      {
        v46 = sub_1B81E2E68();
        if ((v45 & 1) != (v47 & 1))
          goto LABEL_17;
        v44 = v46;
      }
      v28 = v63;
      if ((v45 & 1) != 0)
      {
        *(_QWORD *)(v63[7] + 8 * v44) = v62;
      }
      else
      {
        v63[(v44 >> 6) + 8] |= 1 << v44;
        v48 = (_QWORD *)(v28[6] + 16 * v44);
        *v48 = v40;
        v48[1] = v41;
        *(_QWORD *)(v28[7] + 8 * v44) = v62;
        v49 = v28[2];
        v50 = __OFADD__(v49, 1);
        v51 = v49 + 1;
        if (v50)
          goto LABEL_16;
        v28[2] = v51;
        swift_bridgeObjectRetain();
      }
      OUTLINED_FUNCTION_5_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_18();
      v29 = v57;
      if ((uint64_t *)v44 == v63)
        goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_1B820ECE4();
    __break(1u);
  }
  return result;
}

uint64_t destroy for SparklineModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v3 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  v6 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v6 + 20)) = *(_QWORD *)(a2 + *(int *)(v6 + 20));
  *(_QWORD *)(a1 + *(int *)(v6 + 24)) = *(_QWORD *)(a2 + *(int *)(v6 + 24));
  v7 = *(int *)(sub_1B81E3450() + 52);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  v10 = a1 + v7 + 16;
  v11 = a2 + v7 + 16;
  v12 = *(_OWORD *)(a2 + v7 + 40);
  *(_OWORD *)(v8 + 40) = v12;
  v13 = v12;
  v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v10, v11, v13);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  v15 = *(int *)(a3 + 20);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v16[2] = v17[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t type metadata accessor for CategoryAxis()
{
  uint64_t result;

  result = qword_1ED5541B8;
  if (!qword_1ED5541B8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B81E2E10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED554120)
  {
    v0 = sub_1B820E708();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED554120);
  }
}

unint64_t sub_1B81E2E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_2_10();
  v2 = OUTLINED_FUNCTION_5_8();
  return sub_1B81E2EAC(v1, v0, v2);
}

unint64_t sub_1B81E2EAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B820ECCC() & 1) == 0)
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
      while (!v14 && (sub_1B820ECCC() & 1) == 0);
    }
  }
  return v6;
}

void sub_1B81E2F8C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  if (!*a2)
  {
    sub_1B81E34CC(255, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
    v11 = v10;
    v12 = sub_1B81E3E24(a3, a4);
    v13 = a5(a1, v11, v12);
    if (!v14)
      atomic_store(v13, a2);
  }
}

uint64_t sub_1B81E3028(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[7];
  char v20;

  sub_1B81E3D14();
  MEMORY[0x1E0C80A78](v5);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1B81E3450();
  MEMORY[0x1E0C80A78](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = (uint64_t)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1B81E3CD4(v11, (uint64_t)v7, (uint64_t (*)(_QWORD))sub_1B81E3D14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    v12 = (uint64_t (*)(_QWORD))sub_1B81E3D14;
    v13 = (uint64_t)v7;
  }
  else
  {
    sub_1B81E3874((uint64_t)v7, (uint64_t)v10);
    if ((*((_BYTE *)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 16) & 1) == 0)
    {
      v15 = *(double *)((char *)v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size);
      v16 = v2[10];
      v17 = v2[11];
      __swift_project_boxed_opaque_existential_1(v2 + 7, v16);
      v20 = 0;
      v14 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, char *, uint64_t, uint64_t, double))(v17 + 8))(a1, a2, v10, &v20, v16, v17, v15);
      sub_1B81E38B8((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1B81E3450);
      return v14;
    }
    v12 = (uint64_t (*)(_QWORD))sub_1B81E3450;
    v13 = (uint64_t)v10;
  }
  sub_1B81E38B8(v13, v12);
  return 0;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void OUTLINED_FUNCTION_0_0()
{
  sub_1B81E2E10();
}

void *OUTLINED_FUNCTION_0_1@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return type metadata accessor for LineChartModel();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_1B820E750();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_bridgeObjectRetain();
}

double OUTLINED_FUNCTION_0_7()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_allocObject();
}

double OUTLINED_FUNCTION_0_9()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  return sub_1B820E990();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return swift_getAssociatedConformanceWitness();
}

void OUTLINED_FUNCTION_0_14(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  sub_1B81EFE84(0, a3, a4);
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return sub_1B820E744();
}

double OUTLINED_FUNCTION_0_16()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  return sub_1B820E990();
}

uint64_t OUTLINED_FUNCTION_0_19@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2);
}

uint64_t OUTLINED_FUNCTION_0_20()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_0_21()
{
  return type metadata accessor for ColumnChartModel();
}

uint64_t OUTLINED_FUNCTION_0_22()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return type metadata accessor for SparklineModel();
}

double OUTLINED_FUNCTION_0_24()
{
  double v0;

  return v0;
}

double OUTLINED_FUNCTION_0_25()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_0_27(double a1)
{
  void *v1;
  uint64_t v2;
  double v3;

  return objc_msgSend(v1, (SEL)(v2 + 896), a1, v3);
}

uint64_t OUTLINED_FUNCTION_0_28()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0_29()
{
  return swift_getFunctionTypeMetadata1();
}

uint64_t OUTLINED_FUNCTION_0_30()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

_QWORD *OUTLINED_FUNCTION_0_32(uint64_t a1)
{
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
}

void OUTLINED_FUNCTION_0_33(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v5 - 184) = v8;
  *(_QWORD *)(v5 - 176) = v7;
  *(_QWORD *)(v5 - 168) = v6;
  *(double *)(v5 - 160) = a5;
  *(double *)(v5 - 152) = a4;
  *(double *)(v5 - 144) = a3;
  *(_QWORD *)(v5 - 136) = a1;
  *(double *)(v5 - 128) = a2;
}

uint64_t sub_1B81E3450()
{
  uint64_t result;

  result = qword_1ED5544D0;
  if (!qword_1ED5544D0)
  {
    type metadata accessor for CategoryAxis();
    type metadata accessor for CoordinateSpace();
  }
  return result;
}

void sub_1B81E34CC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, MEMORY[0x1E0DEA968]);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_1B81E3514(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v6 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(unsigned __int8 *)(v9 + 80);
  v14 = v12 + v13;
  v15 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_23;
  v16 = (v14 & ~v13) + *(_QWORD *)(v9 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v19 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v8 >= v10)
        {
          v10 = v8;
        }
        else
        {
          a1 = (v14 + a1) & ~v13;
          v5 = v6;
        }
        return __swift_getEnumTagSinglePayload(a1, v10, v5);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_23;
LABEL_14:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if (!(_DWORD)v16)
    return v11 + v20 + 1;
  if (v16 <= 3)
    v21 = v16;
  else
    v21 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B81E35F0 + 4 * byte_1B8210E58[v21 - 1]))();
}

uint64_t getEnumTagSinglePayload for CategoryAxis()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void OUTLINED_FUNCTION_1()
{
  void *v0;

  sub_1B81E7534(v0, 1);
}

void OUTLINED_FUNCTION_1_0()
{
  sub_1B81E87EC();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, unint64_t *a2)
{
  return sub_1B81E0300(0, a2);
}

unint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_1B81E2E68();
}

uint64_t OUTLINED_FUNCTION_1_5(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  return sub_1B81DFAAC(a1, v3, a3);
}

id OUTLINED_FUNCTION_1_6()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3016));
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_1B820E654();
}

uint64_t OUTLINED_FUNCTION_1_12@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return a2(a1, v4 - 200, v4 - 224, v2, v3);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return sub_1B820ED2C();
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return sub_1B820E8E8();
}

uint64_t OUTLINED_FUNCTION_1_18(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return LineChartCoordinateProvider.location(for:in:)((uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_1_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for HighlightInteraction.InteractionType(255, a2, a2, a4);
}

uint64_t OUTLINED_FUNCTION_1_20()
{
  return sub_1B820E708();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1B81E3874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B81E3450();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B81E38B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_0();
}

uint64_t destroy for ValueAxis(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B81E3918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t destroy for CategoryAxis(uint64_t a1)
{
  uint64_t v2;

  sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1B81E3A00(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  return sub_1B81E3A18(a5, a1, a2, a3, a4);
}

uint64_t sub_1B81E3A18(double a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  double v14;

  v6 = *a5;
  v7 = *(_QWORD *)(a4 + *(int *)(type metadata accessor for CategoryAxis() + 20));
  if (!*(_QWORD *)(v7 + 16))
    return 0;
  swift_bridgeObjectRetain();
  v8 = sub_1B81E2E68();
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_bridgeObjectRelease();
  if (a1 <= 0.0)
    return 0;
  OUTLINED_FUNCTION_0_0();
  result = sub_1B820E6FC();
  v12 = result - 1;
  v13 = __OFSUB__(result, 1);
  if ((v6 & 1) == 0)
  {
    if (!v13)
    {
      v14 = a1 / (double)v12 * (double)v10;
      goto LABEL_14;
    }
LABEL_21:
    __break(1u);
    return result;
  }
  if (v13)
  {
    __break(1u);
    goto LABEL_21;
  }
  v14 = a1 - a1 / (double)v12 * (double)v10;
LABEL_14:
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0 || v14 == 1.79769313e308)
    return 0;
  else
    return *(_QWORD *)&v14;
}

uint64_t sub_1B81E3B30(double a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD);
  uint64_t v11;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  double v17;
  _BYTE v18[7];
  char v19;

  sub_1B81E3D14();
  MEMORY[0x1E0C80A78](v3);
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1B81E3450();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = (uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1B81E3CD4(v9, (uint64_t)v5, (uint64_t (*)(_QWORD))sub_1B81E3D14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    v10 = (uint64_t (*)(_QWORD))sub_1B81E3D14;
    v11 = (uint64_t)v5;
LABEL_5:
    sub_1B81E38B8(v11, v10);
    return 0;
  }
  sub_1B81E3874((uint64_t)v5, (uint64_t)v8);
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 16) & 1) != 0)
  {
    v10 = (uint64_t (*)(_QWORD))sub_1B81E3450;
    v11 = (uint64_t)v8;
    goto LABEL_5;
  }
  v13 = *(double *)((char *)v1 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size + 8);
  v14 = v1[5];
  v15 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v14);
  v16 = &v8[*(int *)(v6 + 52)];
  v19 = 1;
  v17 = (*(double (**)(_BYTE *, char *, uint64_t, uint64_t, double, double))(v15 + 8))(v16, &v19, v14, v15, a1, v13);
  sub_1B81E38B8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1B81E3450);
  return *(_QWORD *)&v17;
}

void sub_1B81E3CD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_0();
}

void sub_1B81E3D14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5544D8)
  {
    sub_1B81E3450();
    v0 = sub_1B820EA74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5544D8);
  }
}

void sub_1B81E3D68(double *a1, double a2, double a3)
{
  sub_1B81E3D7C(a1, a2, a3);
}

void sub_1B81E3D7C(double *a1, double a2, double a3)
{
  uint64_t v3;

  if (a1[1] - *a1 > 0.0 && a3 > 0.0)
  {
    OUTLINED_FUNCTION_0_32((uint64_t)a1);
    OUTLINED_FUNCTION_2_19(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  OUTLINED_FUNCTION_1_22();
}

double sub_1B81E3DEC(double a1, double a2, double a3)
{
  return LinearAxisCalculationModel.relativeLocation(for:in:)(a1, a2, a3);
}

double LinearAxisCalculationModel.relativeLocation(for:in:)(double a1, double a2, double a3)
{
  double result;

  result = 0.0;
  if (a2 != a3)
    return (a1 - a2) / (a3 - a2);
  return result;
}

uint64_t sub_1B81E3E24(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1B81E34CC(255, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
    result = MEMORY[0x1BCCAE964](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B81E3E84(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;

  sub_1B81E2F8C(0, a2, &qword_1ED554110, MEMORY[0x1E0DB3DB8], a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

size_t OUTLINED_FUNCTION_3_2(_QWORD *a1)
{
  uint64_t v1;
  size_t result;

  result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / 16);
  return result;
}

id OUTLINED_FUNCTION_3_3()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 968));
}

void OUTLINED_FUNCTION_3_4()
{
  type metadata accessor for Series.CodingKeys();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_1B820E924();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return swift_release();
}

void OUTLINED_FUNCTION_3_10(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t *v5;
  uint64_t v6;

  sub_1B81E2F8C(0, a2, v5, v6, a5);
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return sub_1B820E894();
}

uint64_t sub_1B81E3FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B81E2F8C(0, qword_1ED555378, &qword_1ED554110, MEMORY[0x1E0DB3DB8], MEMORY[0x1E0DECC58]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_4_4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_1B820E660();
}

void OUTLINED_FUNCTION_4_6(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD))
{
  sub_1B81E34CC(0, a2, a3, a4, a5);
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return sub_1B820E57C();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return sub_1B820E8F4();
}

double OUTLINED_FUNCTION_2()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_2_3()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3656));
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_1B820E744();
}

id OUTLINED_FUNCTION_2_9()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return sub_1B820E894();
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_1B81E3450();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_2_15(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_16()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_17()
{
  return sub_1B820E5E8();
}

uint64_t OUTLINED_FUNCTION_2_19@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCCAE91C](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  uint64_t v0;

  return v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_1B820ED50();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of ValueCoordinateCalculatorType.location(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t CoordinateSpace.y.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return OUTLINED_FUNCTION_0_19(*(_QWORD *)(a1 + 24), a2);
}

uint64_t SparklineModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B81E25E8(v1, a1);
}

_BYTE *sub_1B81E4318(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Orientation()
{
  return &type metadata for Orientation;
}

uint64_t static Series.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  v2 = *a1 == *a2 && a1[1] == a2[1];
  if (v2 || (sub_1B820ECCC() & 1) != 0)
    return sub_1B820E93C();
  else
    return 0;
}

uint64_t LinearAxisCalculationModel.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

ValueMetadata *type metadata accessor for SparklineStyle()
{
  return &type metadata for SparklineStyle;
}

ValueMetadata *type metadata accessor for LineCap()
{
  return &type metadata for LineCap;
}

ValueMetadata *type metadata accessor for Stroke()
{
  return &type metadata for Stroke;
}

uint64_t Series.points.getter()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for Fill()
{
  return &type metadata for Fill;
}

uint64_t dispatch thunk of SparklineViewRendererType.render(_:on:style:layoutAttributes:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

ValueMetadata *type metadata accessor for SparklineLayoutAttributes()
{
  return &type metadata for SparklineLayoutAttributes;
}

TeaCharts::SparklineLayoutAttributes __swiftcall SparklineLayoutAttributes.init(frame:)(TeaCharts::SparklineLayoutAttributes frame)
{
  TeaCharts::SparklineLayoutAttributes *v1;

  *v1 = frame;
  return frame;
}

ValueMetadata *type metadata accessor for StrokeStyle()
{
  return &type metadata for StrokeStyle;
}

ValueMetadata *type metadata accessor for SparklineViewRendererOptions()
{
  return &type metadata for SparklineViewRendererOptions;
}

TeaCharts::SparklineViewRendererOptions __swiftcall SparklineViewRendererOptions.init(method:)(TeaCharts::SparklineViewRendererOptions method)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)method.method;
  return method;
}

ValueMetadata *type metadata accessor for SparklineViewRendererOptions.Method()
{
  return &type metadata for SparklineViewRendererOptions.Method;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t LineStyle.init(stroke:fill:zoneStyles:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 24);
  v7 = *a2;
  v8 = *((_BYTE *)a2 + 8);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)a1;
  *(_QWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 32) = v5;
  *(_BYTE *)(v3 + 40) = v6;
  *(_QWORD *)(v3 + 48) = v7;
  *(_BYTE *)(v3 + 56) = v8;
  *(_QWORD *)(v3 + 64) = a3;
  return v3;
}

_BYTE *sub_1B81E44FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_QWORD *Stroke.init(style:width:color:lineCap:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  char v5;

  v5 = *a3;
  *(_QWORD *)a4 = *result;
  *(double *)(a4 + 8) = a5;
  *(_QWORD *)(a4 + 16) = a2;
  *(_BYTE *)(a4 + 24) = v5;
  return result;
}

uint64_t sub_1B81E4520(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

uint64_t sub_1B81E4534@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B81E138C(a1, (uint64_t (*)(uint64_t))type metadata accessor for LinePathGenerator, (uint64_t)&off_1E6E14D58, a2);
}

id SparklineView.imageView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC9TeaCharts13SparklineView_imageView);
}

_QWORD *sub_1B81E4558(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

uint64_t sub_1B81E4578@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B81DFD54((uint64_t (*)(_QWORD))type metadata accessor for CategoryCoordinateCalculator, (uint64_t)&off_1E6E12DA8, a1);
}

uint64_t sub_1B81E458C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B81DFD54((uint64_t (*)(_QWORD))type metadata accessor for ValueCoordinateCalculator, (uint64_t)&off_1E6E154E0, a1);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1B81E45C8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1B81E45F4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_0_23() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 31) & 0xFFFFFFFFFFFFFFF8;
  sub_1B81E4680(*(double *)(v0 + v4), *(double *)(v0 + v4 + 8), *(double *)(v0 + v4 + 16), *(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + v3 + 16), *(void (**)(void))(v0 + ((v4 + 31) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(void))(v0 + ((((v4 + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_1B81E4680(double a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void), uint64_t a10, void (*a11)(void))
{
  uint64_t v13;
  void *v14;
  id v15;
  double v16[3];
  _QWORD v17[3];

  v17[0] = a6;
  v17[1] = a7;
  v17[2] = a8;
  v16[0] = a1;
  v16[1] = a2;
  v16[2] = a3;
  v13 = sub_1B81E4798(a5, (uint64_t)v17, v16);
  if (v13)
  {
    v15 = (id)v13;
    a11();

  }
  else
  {
    sub_1B81FED58();
    v14 = (void *)swift_allocError();
    a9();

  }
}

void sub_1B81E4740(uint64_t a1)
{
  uint64_t v1;

  sub_1B81E4770(a1, *(void (**)(uint64_t *))(v1 + 16));
}

void sub_1B81E4748(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *);
  uint64_t v3;

  v2 = *(void (**)(uint64_t *))(v1 + 16);
  v3 = a1;
  v2(&v3);
  OUTLINED_FUNCTION_2_12();
}

void sub_1B81E4770(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t v2;

  v2 = a1;
  a2(&v2);
  OUTLINED_FUNCTION_2_12();
}

uint64_t sub_1B81E4798(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v3;
  uint64_t v5;
  double v6;
  double v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD v13[5];

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *a3;
  v7 = a3[1];
  v8 = a3[2];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
  sub_1B81E4870(a1, v13, v6, v7);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  OUTLINED_FUNCTION_0_23();
  swift_bridgeObjectRetain();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_1B81E49FC(v6, v7, v8, v9, (uint64_t)&v12, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

uint64_t sub_1B81E4870@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  _QWORD v24[5];
  uint64_t v25[5];

  v9 = *v4;
  __swift_project_boxed_opaque_existential_1(v4 + 2, v4[5]);
  sub_1B81E50C8(a1, v25, a3, a4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v25[3]);
  OUTLINED_FUNCTION_4_0();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_3_0();
  v12 = (uint64_t *)(v11 - v10);
  (*(void (**)(uint64_t))(v13 + 16))(v11 - v10);
  v14 = *v12;
  v15 = type metadata accessor for LinePathGenerator();
  v24[3] = v15;
  v24[4] = &off_1E6E14D58;
  v24[0] = v14;
  v16 = (_QWORD *)swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v15);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_3_0();
  v20 = (uint64_t *)(v19 - v18);
  (*(void (**)(uint64_t))(v21 + 16))(v19 - v18);
  v22 = *v20;
  v16[5] = v15;
  v16[6] = &off_1E6E14D58;
  v16[2] = v22;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  a2[3] = v9;
  a2[4] = &off_1E6E12DC0;
  *a2 = v16;
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t type metadata accessor for LinePathGenerator()
{
  return objc_opt_self();
}

uint64_t sub_1B81E49FC(CGFloat a1, CGFloat a2, CGFloat a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double *v18;
  id v19;
  UIImage *v20;
  uint64_t result;
  CGContext *v22;
  CGContext *v23;
  uint64_t v24;
  int64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  const CGPath *v38;
  const __CFArray *v39;
  CGColorSpace *DeviceRGB;
  CGGradient *v41;
  id v42;
  id v43;
  CGContext *v44;
  uint64_t v45;
  CGSize v46;
  CGPoint v47;
  CGPoint v48;

  v11 = sub_1B820E588();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_3_0();
  v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 40));
  OUTLINED_FUNCTION_2();
  v17 = sub_1B81E4E8C(v16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 40));
  OUTLINED_FUNCTION_2();
  v19 = sub_1B81E55E0(v18);
  if (a1 == 0.0 || a2 == 0.0)
  {

    return 0;
  }
  v46.width = a1;
  v46.height = a2;
  UIGraphicsBeginImageContextWithOptions(v46, 0, a3);
  v22 = UIGraphicsGetCurrentContext();
  if (!v22)
  {
    sub_1B81E74F8();
    v31 = (void *)sub_1B820EA68();
    sub_1B820E9E4();
    sub_1B820E7EC();

    return 0;
  }
  v23 = v22;
  objc_msgSend(*(id *)(a6 + 32), sel_setStroke);
  objc_msgSend(v17, sel_setLineWidth_, *(double *)(a6 + 24));
  v24 = *(_QWORD *)(a6 + 16);
  if (v24)
  {
    v25 = *(_QWORD *)(v24 + 16);
    if (v25)
    {
      v44 = v23;
      v45 = MEMORY[0x1E0DEE9D8];
      v42 = v19;
      v43 = v17;
      sub_1B81E7544(0, v25, 0);
      v26 = (uint64_t *)(v24 + 32);
      v27 = *(_QWORD *)(v45 + 16);
      do
      {
        v29 = *v26++;
        v28 = v29;
        v30 = *(_QWORD *)(v45 + 24);
        if (v27 >= v30 >> 1)
          sub_1B81E7544((char *)(v30 > 1), v27 + 1, 1);
        *(_QWORD *)(v45 + 16) = v27 + 1;
        *(double *)(v45 + 8 * v27++ + 32) = (double)v28;
        --v25;
      }
      while (v25);
      v19 = v42;
      v17 = v43;
      v23 = v44;
    }
    sub_1B820E9CC();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v17, sel_stroke);
  v32 = *(_QWORD *)(a6 + 48);
  if ((*(_BYTE *)(a6 + 56) & 1) == 0)
  {
    objc_msgSend((id)v32, sel_setFill);
    v38 = (const CGPath *)objc_msgSend(v19, sel_CGPath);
    CGContextAddPath(v23, v38);

    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v15, *MEMORY[0x1E0C9B8A0], v11);
    sub_1B820E9D8();
    sub_1B81E7534((void *)v32, 0);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
LABEL_31:
    v20 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return (uint64_t)v20;
  }
  swift_bridgeObjectRetain();
  objc_msgSend(v19, sel_addClip);
  if (!(v32 >> 62))
  {
    v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v33)
      goto LABEL_19;
LABEL_28:
    OUTLINED_FUNCTION_1();
    type metadata accessor for CGColor(0);
    v39 = (const __CFArray *)sub_1B820E8D0();
    swift_bridgeObjectRelease();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v41 = CGGradientCreateWithColors(DeviceRGB, v39, 0);

    if (v41)
    {
      v47.x = 0.0;
      v47.y = 0.0;
      v48.x = 0.0;
      v48.y = a2;
      CGContextDrawLinearGradient(v23, v41, v47, v48, 0);

    }
    else
    {

    }
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  v33 = sub_1B820EC24();
  OUTLINED_FUNCTION_1();
  if (!v33)
    goto LABEL_28;
LABEL_19:
  result = sub_1B820EBB8();
  if ((v33 & 0x8000000000000000) == 0)
  {
    v34 = 0;
    do
    {
      if ((v32 & 0xC000000000000001) != 0)
        v35 = (id)MEMORY[0x1BCCAE340](v34, v32);
      else
        v35 = *(id *)(v32 + 8 * v34 + 32);
      v36 = v35;
      ++v34;
      v37 = objc_msgSend(v35, sel_CGColor);

      sub_1B820EBA0();
      sub_1B820EBC4();
      sub_1B820EBD0();
      sub_1B820EBAC();
    }
    while (v33 != v34);
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

id sub_1B81E4E8C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  char v22;
  char v23;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3508]), sel_init);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
    v4 = v3 == 1;
  else
    v4 = 1;
  if (!v4)
  {
    v6 = swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_1_18(v6, v7, v8);
    v11 = v10;
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v2, sel_moveToPoint_, *(double *)&v9, v11);
      v14 = a1 + 72;
      v15 = v3 - 1;
      do
      {
        v16 = swift_bridgeObjectRetain();
        v19 = OUTLINED_FUNCTION_1_18(v16, v17, v18);
        v21 = v20;
        v23 = v22;
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0)
          objc_msgSend(v2, sel_addLineToPoint_, *(double *)&v19, v21);
        v14 += 24;
        --v15;
      }
      while (v15);
    }
  }
  return v2;
}

uint64_t LineChartCoordinateProvider.location(for:in:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v1 = *a1;
  v2 = a1[1];
  v3 = *((double *)a1 + 2);
  sub_1B820E594();
  v4 = sub_1B81E3028(v1, v2);
  if ((v5 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v6 = v4;
    sub_1B81E3B30(v3);
    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = v6;
  }
  sub_1B820E5A0();
  return v8;
}

void sub_1B81E5070(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1ED555358);
}

uint64_t sub_1B81E50C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v9 = *v4;
  v10 = LineChartCoordinateProvider.copy()();
  sub_1B820E594();
  sub_1B81E5504(a1, a3, a4);
  sub_1B820E5A0();
  result = OUTLINED_FUNCTION_14();
  *(_QWORD *)(result + 16) = v10;
  a2[3] = v9;
  a2[4] = (uint64_t)&off_1E6E14D58;
  *a2 = result;
  return result;
}

uint64_t LineChartCoordinateProvider.copy()()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3[2];
  __int128 v4[2];

  sub_1B81E51C4(v0 + 16, (uint64_t)v4);
  sub_1B81E51C4(v0 + 56, (uint64_t)v3);
  v1 = swift_allocObject();
  sub_1B81E5204(v4, v3);
  return v1;
}

void sub_1B81E51C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B81E5204(__int128 *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1B820E5B8();
  MEMORY[0x1E0C80A78]();
  v5 = v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  v6 = sub_1B81E3450();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  v7 = v2 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size;
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0;
  *(_BYTE *)(v7 + 16) = 1;
  v8 = OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_lock;
  sub_1B820E5AC();
  sub_1B820E5D0();
  swift_allocObject();
  *(_QWORD *)(v2 + v8) = sub_1B820E5C4();
  sub_1B81DF244(a1, v2 + 16);
  sub_1B81DF244(a2, v2 + 56);
  return v2;
}

void sub_1B81E5304(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  if (a3 > v7)
  {
    if (v8 <= 3)
    {
      v12 = ((a3 - v7 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0u;
  }
  if (v7 < a2)
  {
    v11 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v13 = v11 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X14 }
}

uint64_t storeEnumTagSinglePayload for CategoryAxis()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B81E5504(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_1B81E3D14();
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B81E3CD4(a1, (uint64_t)v8, (uint64_t (*)(_QWORD))sub_1B81E3450);
  v9 = sub_1B81E3450();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  v10 = v3 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1B81E57A4((uint64_t)v8, v10);
  swift_endAccess();
  v11 = v3 + OBJC_IVAR____TtC9TeaCharts27LineChartCoordinateProvider_size;
  *(double *)v11 = a2;
  *(double *)(v11 + 8) = a3;
  *(_BYTE *)(v11 + 16) = 0;
  OUTLINED_FUNCTION_0_34();
}

id sub_1B81E55E0(double *a1)
{
  id v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char v8;
  double v9;
  char v10;
  char v11;

  v2 = sub_1B81E4E8C((uint64_t)a1);
  objc_msgSend(v2, sel_currentPoint);
  OUTLINED_FUNCTION_0_27(v3);
  if (*((_QWORD *)a1 + 2))
  {
    v5 = *((_QWORD *)a1 + 4);
    v4 = *((_QWORD *)a1 + 5);
    v6 = a1[6];
    swift_bridgeObjectRetain();
    v7 = LineChartCoordinateProvider.horizontalLocation(for:in:)(v5, v4);
    if ((v8 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(double *)&v7;
      LineChartCoordinateProvider.verticalLocation(for:in:)(v6);
      v11 = v10;
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        OUTLINED_FUNCTION_0_27(v9);
        objc_msgSend(v2, sel_closePath);
      }
    }
  }
  return v2;
}

uint64_t LineChartCoordinateProvider.horizontalLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B820E594();
  v4 = sub_1B81E3028(a1, a2);
  sub_1B820E5A0();
  return v4;
}

uint64_t LineChartCoordinateProvider.verticalLocation(for:in:)(double a1)
{
  uint64_t v2;

  sub_1B820E594();
  v2 = sub_1B81E3B30(a1);
  sub_1B820E5A0();
  return v2;
}

uint64_t sub_1B81E57A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B81E3D14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1B81E57E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5540E8)
  {
    sub_1B81E62B4();
    v0 = sub_1B820ECB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5540E8);
  }
}

unint64_t sub_1B81E583C()
{
  unint64_t result;

  result = qword_1ED555370;
  if (!qword_1ED555370)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED555370);
  }
  return result;
}

uint64_t sub_1B81E5878()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for Series()
{
  JUMPOUT(0x1BCCAE91CLL);
}

uint64_t type metadata accessor for LineSeriesAccessibilityElementProvider()
{
  return objc_opt_self();
}

void sub_1B81E58AC()
{
  unint64_t v0;

  sub_1B81E3D14();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for ColumnChartCoordinateProvider()
{
  uint64_t result;

  result = qword_1ED554FE0;
  if (!qword_1ED554FE0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B81E5988()
{
  unint64_t v0;

  sub_1B81E3D14();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1B81E5A18()
{
  uint64_t result;

  result = qword_1ED554C20;
  if (!qword_1ED554C20)
  {
    type metadata accessor for CategoryAxisGridViewModelGenerator();
    type metadata accessor for ValueAxisGridViewModelGenerator();
    type metadata accessor for GridViewModelGenerator();
  }
  return result;
}

void type metadata accessor for GridViewModelGenerator()
{
  JUMPOUT(0x1BCCAE91CLL);
}

unint64_t sub_1B81E5AA8()
{
  unint64_t result;

  result = qword_1ED5538B8;
  if (!qword_1ED5538B8)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8210C94, &type metadata for SparklineViewRenderer.LRUCacheKey);
    atomic_store(result, (unint64_t *)&qword_1ED5538B8);
  }
  return result;
}

unint64_t sub_1B81E5AE4()
{
  unint64_t result;

  result = qword_1ED5538B0;
  if (!qword_1ED5538B0)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8210CBC, &type metadata for SparklineViewRenderer.LRUCacheKey);
    atomic_store(result, (unint64_t *)&qword_1ED5538B0);
  }
  return result;
}

uint64_t sub_1B81E5B20()
{
  return sub_1B81DFAAC(&qword_1ED554A28, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, (uint64_t)&protocol conformance descriptor for ColumnChartInteractor);
}

uint64_t sub_1B81E5B3C()
{
  return sub_1B81E1058();
}

void type metadata accessor for ChartViewController()
{
  JUMPOUT(0x1BCCAE91CLL);
}

unint64_t sub_1B81E5B5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5548C8;
  if (!qword_1ED5548C8)
  {
    sub_1B81DFB28(255, qword_1ED5548D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for InteractionManager<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5548C8);
  }
  return result;
}

void sub_1B81E5BBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1ED5548C0)
  {
    v2 = type metadata accessor for LineChartInteractor();
    sub_1B81DFAEC(&qword_1ED554968, (uint64_t (*)(uint64_t))type metadata accessor for LineChartInteractor, (uint64_t)&protocol conformance descriptor for LineChartInteractor);
    v5 = type metadata accessor for InteractionManager(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1ED5548C0);
  }
}

uint64_t type metadata accessor for InteractionManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InteractionManager);
}

uint64_t sub_1B81E5C40()
{
  return sub_1B81E07A0();
}

uint64_t type metadata accessor for LineChartRenderer()
{
  return objc_opt_self();
}

uint64_t sub_1B81E5C74()
{
  return sub_1B81E143C();
}

uint64_t FrameworkAssembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B81E5C90()
{
  return FrameworkAssembly.assemblies.getter();
}

unint64_t sub_1B81E5CB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED554760;
  if (!qword_1ED554760)
  {
    sub_1B81DFB28(255, &qword_1ED554768, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t (*)(void))sub_1B81E5ECC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for ChartModelFactory);
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for ChartModelFactory<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1ED554760);
  }
  return result;
}

void sub_1B81E5D10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1ED554758)
  {
    v2 = type metadata accessor for LineChartModel();
    sub_1B81DFAEC((unint64_t *)&qword_1ED5543A0, (uint64_t (*)(uint64_t))type metadata accessor for LineChartModel, (uint64_t)&protocol conformance descriptor for LineChartModel);
    v5 = type metadata accessor for ChartModelFactory(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1ED554758);
  }
}

uint64_t type metadata accessor for ChartModelFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ChartModelFactory);
}

unint64_t sub_1B81E5D98()
{
  unint64_t result;

  result = qword_1ED5546C8[0];
  if (!qword_1ED5546C8[0])
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryDataPoint, &type metadata for CategoryDataPoint);
    atomic_store(result, qword_1ED5546C8);
  }
  return result;
}

uint64_t type metadata accessor for GridViewRenderer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GridViewProvider()
{
  return objc_opt_self();
}

uint64_t sub_1B81E5E14()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B81E3450();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ColumnChartModel()
{
  uint64_t result;

  result = qword_1ED5544E8;
  if (!qword_1ED5544E8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1B81E5ECC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5544E0;
  if (!qword_1ED5544E0)
  {
    v1 = type metadata accessor for ColumnChartModel();
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for ColumnChartModel, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5544E0);
  }
  return result;
}

uint64_t sub_1B81E5F0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B81E3450();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for LineChartModel()
{
  uint64_t result;

  result = qword_1ED5543A8;
  if (!qword_1ED5543A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for GridViewStyler()
{
  return objc_opt_self();
}

void sub_1B81E5FD4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1B81E6018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED5542F0)
  {
    v4 = type metadata accessor for StyleManager(0, (uint64_t)&type metadata for ColumnChartStyle, a3, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED5542F0);
  }
}

void sub_1B81E6060(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v4;

  if (!*a1)
  {
    sub_1B81E5FD4(255, a2, a3, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
    atomic_store(MEMORY[0x1BCCAE964](&protocol conformance descriptor for StyleManager<A>, v4), a1);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t type metadata accessor for StyleManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for StyleManager);
}

uint64_t sub_1B81E60B0()
{
  return sub_1B81E0374();
}

unint64_t sub_1B81E60C4()
{
  unint64_t result;

  result = qword_1ED554260[0];
  if (!qword_1ED554260[0])
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryZone, &type metadata for CategoryZone);
    atomic_store(result, qword_1ED554260);
  }
  return result;
}

unint64_t sub_1B81E6100()
{
  unint64_t result;

  result = qword_1ED554258;
  if (!qword_1ED554258)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryZone, &type metadata for CategoryZone);
    atomic_store(result, (unint64_t *)&qword_1ED554258);
  }
  return result;
}

unint64_t sub_1B81E613C()
{
  unint64_t result;

  result = qword_1ED554250;
  if (!qword_1ED554250)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryZone, &type metadata for CategoryZone);
    atomic_store(result, (unint64_t *)&qword_1ED554250);
  }
  return result;
}

unint64_t sub_1B81E6178(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1B81E6100();
  result = sub_1B81E613C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_1B81E61A4()
{
  unint64_t v0;

  sub_1B81E34CC(319, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1B81E623C(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED5541B0)
  {
    v2 = sub_1B81E60C4();
    v4 = type metadata accessor for ZoneManager(a1, (uint64_t)&type metadata for CategoryZone, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED5541B0);
  }
}

uint64_t type metadata accessor for ZoneManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ZoneManager);
}

uint64_t sub_1B81E62A0()
{
  return sub_1B81E01C4();
}

unint64_t sub_1B81E62B4()
{
  unint64_t result;

  result = qword_1ED553F78;
  if (!qword_1ED553F78)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED553F78);
  }
  return result;
}

uint64_t sub_1B81E63B8()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_1B81E63C0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t sub_1B81E63EC()
{
  return swift_release();
}

_QWORD *sub_1B81E63F4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *sub_1B81E6438(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StrokeStyle(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StrokeStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
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

uint64_t sub_1B81E650C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t type metadata accessor for GridLabel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GridLabel);
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1EF19BAD0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1EF19BAD8);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1EF19BAE0);
}

uint64_t initializeBufferWithCopyOfBuffer for Stroke(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t getEnumTagSinglePayload for ColumnChartCoordinateOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ColumnChartCoordinateOptions(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1EF19BAE8);
}

uint64_t getEnumTagSinglePayload for ChartLayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ChartLayoutOptions(uint64_t result, int a2, int a3)
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
  sub_1B81E5070(a1, &qword_1EF19BAF0);
}

uint64_t sub_1B81E6674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1B81E66C4(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_1B81E66CC(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_1B81E66D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_1B81E66F8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_1B81E6710(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_1B81E6720(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_1B81E6728(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1B81E6734(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1B81E6740(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1B81E674C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1B81E6758(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

uint64_t sub_1B81E6768()
{
  uint64_t *v0;

  return sub_1B81E6D98(*v0, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1B81E6788()
{
  return sub_1B81E6B88();
}

uint64_t sub_1B81E6790()
{
  return sub_1B81FA000();
}

uint64_t sub_1B81E6798()
{
  uint64_t *v0;

  return sub_1B81E6D98(*v0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1B81E67C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B81E6D64();
  *a1 = result;
  return result;
}

uint64_t sub_1B81E67E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = j__OUTLINED_FUNCTION_5_2();
  *a1 = result;
  return result;
}

uint64_t sub_1B81E6808@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1B81E66C4(*a1, *v2);
  *a2 = result;
  return result;
}

void sub_1B81E6834(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_1B81EBAB0(*a1, *v2);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B81E685C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1B81E66CC(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1B81E6888(_QWORD *a1, uint64_t *a2)
{
  return sub_1B81EBAB8(a1, *a2);
}

uint64_t sub_1B81E6890@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_1B81E66D4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1B81E68C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_1B81E66F8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1B81E68F0(uint64_t *a1)
{
  return sub_1B81EBAE4(*a1);
}

uint64_t sub_1B81E68F8(uint64_t *a1)
{
  return sub_1B81EBAF4(*a1);
}

uint64_t sub_1B81E6900(uint64_t *a1)
{
  return sub_1B81E6710(*a1);
}

uint64_t sub_1B81E6908@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1B81E6720(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1B81E6934(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1B81E6728(*a1, *v1);
}

BOOL sub_1B81E6940(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1B81E6734(*a1, *v1);
}

BOOL sub_1B81E694C(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1B81E6740(*a1, *v1);
}

BOOL sub_1B81E6958()
{
  uint64_t *v0;

  return sub_1B81E674C(*v0);
}

uint64_t sub_1B81E6960()
{
  return sub_1B820EA8C();
}

uint64_t sub_1B81E6978(uint64_t *a1)
{
  return sub_1B81E6758(*a1);
}

void sub_1B81E6980()
{
  sub_1B81FA068();
}

BOOL sub_1B81E698C(uint64_t *a1, uint64_t *a2)
{
  return sub_1B81EBAA4(*a1, *a2);
}

uint64_t sub_1B81E6998@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_1B81E6674(a1);
  *a2 = result;
  return result;
}

_QWORD *sub_1B81E69BC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B81E69C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1B820E864();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B81E6A0C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1B81E6A34(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B81E6A38()
{
  sub_1B81DFAAC(&qword_1ED5530E8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FB58);
  sub_1B81DFAAC(&qword_1EF19BB30, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FAAC);
  return sub_1B820EC30();
}

_QWORD *sub_1B81E6ABC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1B81E6ACC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1B81E6AD8()
{
  return sub_1B81DFAAC(&qword_1EF19BAF8, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1B820F884);
}

uint64_t sub_1B81E6B04()
{
  return sub_1B81DFAAC(&qword_1EF19BB00, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1B820F850);
}

uint64_t sub_1B81E6B30()
{
  return sub_1B81DFAAC(&qword_1EF19BB08, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1B820F8B0);
}

uint64_t sub_1B81E6B5C()
{
  return sub_1B81DFAAC(&qword_1EF19BB10, (uint64_t (*)(uint64_t))type metadata accessor for UIRectCorner, (uint64_t)&unk_1B820F8EC);
}

uint64_t sub_1B81E6B88()
{
  sub_1B820E888();
  sub_1B820E894();
  return swift_bridgeObjectRelease();
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1EF19BB18);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1B81E5070(a1, &qword_1ED5530F8);
}

uint64_t sub_1B81E6BF0()
{
  return sub_1B81DFAAC(&qword_1EF19BB20, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FA70);
}

uint64_t sub_1B81E6C1C()
{
  return sub_1B81DFAAC(&qword_1EF19BB28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FA44);
}

uint64_t sub_1B81E6C48()
{
  return sub_1B81DFAAC(&qword_1ED5530F0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FAE0);
}

uint64_t sub_1B81E6C74(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1B820E870();
  *a2 = 0;
  return result;
}

uint64_t sub_1B81E6CE8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1B820E87C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B81E6D64()
{
  uint64_t v0;

  sub_1B820E888();
  v0 = sub_1B820E864();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B81E6D98(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1B820E888();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void destroy for GridViewModel(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for GridViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  __int128 v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for GridViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(void **)(a2 + 32);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for GridViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridViewModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for GridViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridViewModel()
{
  return &type metadata for GridViewModel;
}

BOOL static LineCap.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LineCap.hash(into:)()
{
  return sub_1B820ED38();
}

uint64_t LineCap.hashValue.getter()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

uint64_t sub_1B81E70E0()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

unint64_t sub_1B81E7124()
{
  unint64_t result;

  result = qword_1EF19BB38;
  if (!qword_1EF19BB38)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for LineCap, &type metadata for LineCap);
    atomic_store(result, (unint64_t *)&qword_1EF19BB38);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LineCap(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LineCap(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81E7240 + 4 * byte_1B820FBB1[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B81E7274 + 4 * asc_1B820FBAC[v4]))();
}

uint64_t sub_1B81E7274(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81E727C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81E7284);
  return result;
}

uint64_t sub_1B81E7290(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81E7298);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B81E729C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81E72A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81E72B0(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of ChartInteractorType.dataPoint(for:model:size:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of CategoryCoordinateCalculatorType.location(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of CategoryCoordinateCalculatorType.category(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_1B81E72EC(double a1, double a2, uint64_t a3, unsigned __int8 *a4)
{
  int v6;
  BOOL v7;
  uint64_t result;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *a4;
  v7 = sub_1B81E7430();
  result = 0;
  if (v7 || a2 <= 0.0)
    return result;
  OUTLINED_FUNCTION_0_0();
  result = sub_1B820E6FC();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = a1 / a2;
  if (v6)
    v9 = 1.0 - a1 / a2;
  v10 = round(v9 * (double)(result - 1));
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
    goto LABEL_14;
  if (v10 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v11 = (uint64_t)v10;
  sub_1B81E74B8();
  sub_1B820E978();
  sub_1B820E990();
  v12 = sub_1B820E984();
  result = 0;
  if ((v11 & 0x8000000000000000) == 0 && v12 > v11)
  {
    sub_1B820E714();
    return v13;
  }
  return result;
}

BOOL sub_1B81E7430()
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_0_0();
  sub_1B81E74B8();
  sub_1B820E978();
  sub_1B820E990();
  return v2 == v1;
}

uint64_t sub_1B81E7494()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B81E74A4(uint64_t a1, unsigned __int8 *a2, double a3, double a4)
{
  return sub_1B81E72EC(a3, a4, a1, a2);
}

unint64_t sub_1B81E74B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED554118;
  if (!qword_1ED554118)
  {
    sub_1B81E2E10();
    result = MEMORY[0x1BCCAE964](MEMORY[0x1E0DB3DC0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED554118);
  }
  return result;
}

unint64_t sub_1B81E74F8()
{
  unint64_t result;

  result = qword_1EF19BB40;
  if (!qword_1EF19BB40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF19BB40);
  }
  return result;
}

void sub_1B81E7534(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_bridgeObjectRelease();
  else

}

char *sub_1B81E7544(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E765C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E7560(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E775C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E757C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7864(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1B81E7598(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1B81E797C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E75B4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7A90(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E75D0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7B98(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E75EC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7CA0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E7608(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7DB4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E7624(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7ECC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E7640(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1B81E7FD4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1B81E765C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1EF19BB48);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12)
      memmove(v12, v13, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1B81E775C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553180);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7864(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553130);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[48 * v8] <= v12)
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_1B81E797C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1B81E81BC();
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    sub_1B81E8210();
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7A90(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553140);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7B98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553150);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12)
      memmove(v12, v13, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7CA0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553158);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[48 * v8] <= v12)
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7DB4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553138);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[80 * v8] <= v12)
      memmove(v12, v13, 80 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7ECC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553168);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E7FD4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B81E8178(0, &qword_1ED553190);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12)
      memmove(v12, v13, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1B81E80E8(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_1(a3, result);
  return result;
}

char *sub_1B81E8108(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[48 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_1(a3, result);
  return result;
}

char *sub_1B81E8130(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[80 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_1(a3, result);
  return result;
}

char *sub_1B81E8158(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[8 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_1(a3, result);
  return result;
}

void sub_1B81E8178(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1B820ECB4();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_1B81E81BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553170)
  {
    sub_1B81E8210();
    v0 = sub_1B820ECB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553170);
  }
}

void sub_1B81E8210()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5530B8)
  {
    type metadata accessor for LineStyle();
    v0 = sub_1B820E84C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5530B8);
  }
}

uint64_t sub_1B81E8274(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2 - result;
  if (__OFSUB__(a2, result))
    goto LABEL_19;
  if (v3)
  {
    v5 = result;
    v22 = MEMORY[0x1E0DEE9D8];
    result = sub_1B820EBB8();
    if (a2 < v5 || v3 < 0)
      goto LABEL_20;
    v18 = v3;
    v6 = 0;
    while (v6 != v3)
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(a3 + 56), *(_QWORD *)(a3 + 80));
      v7 = *(_QWORD *)(sub_1B81FE974(v5) + 64);
      v8 = *(_QWORD *)(v7 + 16);
      if (v8)
      {
        v20 = v5;
        v21 = MEMORY[0x1E0DEE9D8];
        swift_bridgeObjectRetain();
        sub_1B81E7560(0, v8, 0);
        v9 = v21;
        v10 = (uint64_t *)(v7 + 40);
        do
        {
          v12 = *(v10 - 1);
          v11 = *v10;
          v14 = *(_QWORD *)(v21 + 16);
          v13 = *(_QWORD *)(v21 + 24);
          swift_bridgeObjectRetain();
          if (v14 >= v13 >> 1)
            sub_1B81E7560((char *)(v13 > 1), v14 + 1, 1);
          v10 += 3;
          *(_QWORD *)(v21 + 16) = v14 + 1;
          v15 = v21 + 16 * v14;
          *(_QWORD *)(v15 + 32) = v12;
          *(_QWORD *)(v15 + 40) = v11;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
        v5 = v20;
        v3 = v18;
      }
      else
      {
        v9 = MEMORY[0x1E0DEE9D8];
      }
      ++v6;
      v16 = objc_allocWithZone((Class)type metadata accessor for LineSeriesView());
      sub_1B81ED26C(v9);
      swift_release();
      sub_1B820EBA0();
      sub_1B820EBC4();
      sub_1B820EBD0();
      result = sub_1B820EBAC();
      ++v5;
      if (v6 == v3)
      {
        v17 = v22;
        swift_release();
        return v17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  swift_release();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t LineChartViewProvider.zoneManager.getter()
{
  return swift_retain();
}

uint64_t LineChartViewProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t LineChartViewProvider.__deallocating_deinit()
{
  LineChartViewProvider.deinit();
  return swift_deallocClassInstance();
}

void *LineChartViewProvider.view(for:style:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + *(int *)(type metadata accessor for LineChartModel() + 20)) + 16);
  swift_retain();
  v3 = sub_1B81E8274(0, v2, v1);
  v4 = objc_allocWithZone((Class)type metadata accessor for LineChartView());
  return LineChartView.init(seriesViews:)(v3);
}

uint64_t LineChartViewProvider.present(_:on:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t result;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23[12];
  __int128 v24;
  CGRect v25;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_5_3();
  v9 = *(double *)a3;
  v10 = *(double *)(a3 + 8);
  v11 = *(double *)(a3 + 16);
  v12 = *(double *)(a3 + 24);
  v13 = *(double *)(a3 + 32);
  v14 = *(double *)(a3 + 40);
  v15 = *(double *)(a3 + 48);
  v16 = *(double *)(a3 + 56);
  v22 = *(double *)(a3 + 64);
  v21 = *(double *)(a3 + 72);
  v20 = *(double *)(a3 + 80);
  v19 = *(double *)(a3 + 88);
  v18 = *(_OWORD *)(a3 + 96);
  v25.origin.x = *(CGFloat *)a3;
  v25.origin.y = v10;
  v25.size.width = v11;
  v25.size.height = v12;
  result = CGRectIsEmpty(v25);
  if ((result & 1) == 0)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_0_2();
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v11;
    v23[3] = v12;
    v23[4] = v13;
    v23[5] = v14;
    v23[6] = v15;
    v23[7] = v16;
    v23[8] = v22;
    v23[9] = v21;
    v23[10] = v20;
    v23[11] = v19;
    v24 = v18;
    sub_1B81EFF14(v6, v5, v3, v23);
    return OUTLINED_FUNCTION_3_1();
  }
  return result;
}

void *sub_1B81E86B4(uint64_t a1)
{
  return LineChartViewProvider.view(for:style:)(a1);
}

uint64_t sub_1B81E86D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return LineChartViewProvider.present(_:on:attributes:)(a1, a2, a3);
}

uint64_t LineChartViewProvider.updateZones(with:view:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8[2];
  _QWORD v9[5];

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_5_3();
  sub_1B81E0660(v1 + 16, (uint64_t)v9);
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2();
  objc_msgSend(v0, sel_bounds);
  v8[0] = v5;
  v8[1] = v6;
  sub_1B81F0C34(v2, v3, (uint64_t)v0, v8);
  OUTLINED_FUNCTION_3_1();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_1B81E87A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = LineChartViewProvider.zoneManager.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1B81E87CC()
{
  return LineChartViewProvider.updateZones(with:view:)();
}

void sub_1B81E87EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552C28)
  {
    sub_1B81E6100();
    sub_1B81E613C();
    v0 = sub_1B820E708();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552C28);
  }
}

uint64_t sub_1B81E8850()
{
  return sub_1B81DFAAC((unint64_t *)&qword_1ED5543A0, (uint64_t (*)(uint64_t))type metadata accessor for LineChartModel, (uint64_t)&protocol conformance descriptor for LineChartModel);
}

uint64_t sub_1B81E887C()
{
  return sub_1B81DFAAC(&qword_1ED552C50, (uint64_t (*)(uint64_t))sub_1B81E623C, (uint64_t)&protocol conformance descriptor for ZoneManager<A>);
}

uint64_t method lookup function for LineChartViewProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ChartCoordinateProviderType.register(model:size:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ChartCoordinateProviderType.location(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

id SeriesStyle.strokeColor.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

id SeriesStyle.fill.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  char v3;

  v2 = *(void **)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  return sub_1B81E892C(v2, v3);
}

id sub_1B81E892C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_bridgeObjectRetain();
  else
    return a1;
}

uint64_t SeriesStyle.init(strokeColor:fill:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v4;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v3;
  *(_BYTE *)(a3 + 16) = v4;
  return result;
}

void destroy for SeriesStyle(uint64_t a1)
{

  sub_1B81E7534(*(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s9TeaCharts11SeriesStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 16);
  v6 = v3;
  sub_1B81E892C(v4, v5);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SeriesStyle(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v2 = a2;
  v4 = *(void **)a1;
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  v6 = v5;

  v7 = v2[1];
  LOBYTE(v2) = *((_BYTE *)v2 + 16);
  sub_1B81E892C(v7, (char)v2);
  v8 = *(void **)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = (_BYTE)v2;
  sub_1B81E7534(v8, v9);
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

uint64_t assignWithTake for SeriesStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(void **)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1B81E7534(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SeriesStyle(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SeriesStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SeriesStyle()
{
  return &type metadata for SeriesStyle;
}

uint64_t ZoneStyle.init(identifier:style:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  char *v7;

  *a5 = a1;
  a5[1] = a2;
  v7 = (char *)a5 + *(int *)(type metadata accessor for ZoneStyle(0, a4, a3, a4) + 28);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v7, a3, a4);
}

uint64_t type metadata accessor for ZoneStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ZoneStyle);
}

uint64_t sub_1B81E8BAC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B81E8BB4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B81E8C2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_1B81E8CEC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_1B81E8D30(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *sub_1B81E8DA0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_1B81E8E18(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_1B81E8E68(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1B81E8ED0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  unint64_t v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 16) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload((a1 + v8 + 16) & ~v8, v6, v4);
      v16 = *(_QWORD *)(a1 + 8);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B81E8FA4 + 4 * byte_1B820FE00[(v10 - 1)]))();
}

void sub_1B81E9010(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t dispatch thunk of ChartLayoutAttributesProviderType.chartLayoutAttributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1B81E9208(uint64_t a1, uint64_t a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double *v28;
  uint64_t (**v29)(uint64_t);
  _QWORD v31[2];
  uint64_t v32;

  v16 = OUTLINED_FUNCTION_0_3();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  swift_retain();
  v21 = swift_bridgeObjectRetain();
  v32 = sub_1B81E9414(v21, (void (*)(uint64_t, _QWORD *))sub_1B81EA21C);
  swift_bridgeObjectRelease();
  swift_retain();
  v22 = swift_bridgeObjectRetain();
  v23 = sub_1B81E9550(v22, a9);
  swift_bridgeObjectRelease();
  v31[1] = sub_1B820E648();
  sub_1B81EA224(a8, (uint64_t)v19);
  v24 = (*(unsigned __int8 *)(v17 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v25 = (v18 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  v28 = (double *)swift_allocObject();
  v28[2] = a3;
  v28[3] = a4;
  v28[4] = a5;
  sub_1B81EA3B0((uint64_t)v19, (uint64_t)v28 + v24);
  *(_QWORD *)((char *)v28 + v25) = v32;
  *(_QWORD *)((char *)v28 + v26) = a9;
  *(_QWORD *)((char *)v28 + v27) = v23;
  v29 = (uint64_t (**)(uint64_t))((char *)v28 + ((v27 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v29 = sub_1B81EA1EC;
  v29[1] = (uint64_t (*)(uint64_t))v20;
  swift_retain();
  sub_1B820E63C();
  return swift_release();
}

uint64_t sub_1B81E93E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a3 + 56), *(_QWORD *)(a3 + 80));
  return sub_1B81FE974(a1);
}

uint64_t sub_1B81E9414(uint64_t a1, void (*a2)(uint64_t, _QWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  sub_1B820EBB8();
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = (uint64_t *)(a1 + 48);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      v10[0] = *(v6 - 2);
      v10[1] = v8;
      v10[2] = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a2(v5, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B820EBA0();
      sub_1B820EBC4();
      sub_1B820EBD0();
      sub_1B820EBAC();
      v6 += 3;
      ++v5;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1B81E9550(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18[4];
  uint64_t v19;

  v3 = v2;
  v19 = MEMORY[0x1E0DEE9D8];
  sub_1B81E7598(0, 0, 0);
  v6 = v19;
  v7 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v7)
  {
    v8 = 0;
    v9 = (uint64_t *)(a1 + 48);
    while (1)
    {
      v10 = *(v9 - 1);
      v11 = *v9;
      v12 = *(v9 - 2);
      v18[0] = v8;
      v18[1] = v12;
      v18[2] = v10;
      v18[3] = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B81E9954(v18, a2, &v17);
      if (v3)
        break;
      v3 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v13 = v17;
      v19 = v6;
      v15 = *(_QWORD *)(v6 + 16);
      v14 = *(_QWORD *)(v6 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_1B81E7598((_QWORD *)(v14 > 1), v15 + 1, 1);
        v6 = v19;
      }
      ++v8;
      v9 += 3;
      *(_QWORD *)(v6 + 16) = v15 + 1;
      *(_QWORD *)(v6 + 8 * v15 + 32) = v13;
      if (v7 == v8)
        goto LABEL_7;
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1B81E96C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char v38[24];
  uint64_t v39;

  v39 = MEMORY[0x1E0DEE9D8];
  sub_1B81E75B4(0, 0, 0);
  v14 = v39;
  v15 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v36 = v15;
  v37 = a4;
  if (v15)
  {
    v16 = 0;
    v34 = a2 & 0xC000000000000001;
    v35 = (_QWORD *)(a3 + 16);
    v31 = a4 + 32;
    v32 = a2;
    v17 = (uint64_t *)(a1 + 48);
    v18 = a2;
    v33 = a3;
    while (1)
    {
      v20 = *(v17 - 2);
      v19 = *(v17 - 1);
      v21 = *v17;
      sub_1B8207E74(v16, v34 == 0, v18);
      if (v34)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v22 = MEMORY[0x1BCCAE340](v16, v18);
      }
      else
      {
        v22 = *(_QWORD *)(v18 + 8 * v16 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      __swift_project_boxed_opaque_existential_1(v35, *(_QWORD *)(a3 + 40));
      result = sub_1B81E49FC(a5, a6, a7, v21, (uint64_t)v38, v22);
      if (v16 >= *(_QWORD *)(v37 + 16))
        break;
      v24 = a3;
      v25 = result;
      v26 = *(_QWORD *)(v31 + 8 * v16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      v27 = sub_1B81E9B78(MEMORY[0x1E0DEE9E0], v26, v24, a5, a6, a7, v20, v19, v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v39 = v14;
      v29 = *(_QWORD *)(v14 + 16);
      v28 = *(_QWORD *)(v14 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_1B81E75B4((char *)(v28 > 1), v29 + 1, 1);
        v14 = v39;
      }
      ++v16;
      v17 += 3;
      *(_QWORD *)(v14 + 16) = v29 + 1;
      v30 = v14 + 16 * v29;
      *(_QWORD *)(v30 + 32) = v25;
      *(_QWORD *)(v30 + 40) = v27;
      v18 = v32;
      a3 = v33;
      if (v36 == v16)
        goto LABEL_11;
    }
    __break(1u);
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return v14;
  }
  return result;
}

uint64_t sub_1B81E9954@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  v4 = *a1;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 80));
  v5 = *(_QWORD *)(sub_1B81FE974(v4) + 64);
  swift_bridgeObjectRetain();
  swift_release();
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    v8 = (uint64_t *)(v5 + 48);
    while (1)
    {
      v24 = v6;
      v10 = *(v8 - 2);
      v9 = *(v8 - 1);
      v11 = *v8;
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_isUniquelyReferenced_nonNull_native();
      v12 = sub_1B81E2E68();
      if (__OFADD__(v7[2], (v13 & 1) == 0))
        break;
      v14 = v12;
      v15 = v13;
      sub_1B81EA460(0, &qword_1ED5532B0, (void (*)(uint64_t))type metadata accessor for LineStyle);
      if ((sub_1B820EBF4() & 1) != 0)
      {
        v16 = sub_1B81E2E68();
        if ((v15 & 1) != (v17 & 1))
          goto LABEL_17;
        v14 = v16;
      }
      if ((v15 & 1) != 0)
      {
        v18 = v7[7];
        swift_release();
        *(_QWORD *)(v18 + 8 * v14) = v11;
      }
      else
      {
        v7[(v14 >> 6) + 8] |= 1 << v14;
        v19 = (_QWORD *)(v7[6] + 16 * v14);
        *v19 = v10;
        v19[1] = v9;
        *(_QWORD *)(v7[7] + 8 * v14) = v11;
        v20 = v7[2];
        v21 = __OFADD__(v20, 1);
        v22 = v20 + 1;
        if (v21)
          goto LABEL_16;
        v7[2] = v22;
        swift_bridgeObjectRetain();
      }
      swift_release();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v8 += 3;
      --v6;
      if (v24 == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_1B820ECE4();
    __break(1u);
  }
  else
  {
    v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_14:
    result = swift_bridgeObjectRelease();
    *a3 = v7;
  }
  return result;
}

uint64_t sub_1B81E9B78(_QWORD *a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  int64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  char v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[6];

  sub_1B81ED91C(v65, a2);
  v14 = v65[3];
  v15 = v65[4];
  v58 = a3;
  v55 = (_QWORD *)(a3 + 16);
  v56 = v65[0];
  v53 = v65[1];
  v54 = (unint64_t)(v65[2] + 64) >> 6;
  swift_bridgeObjectRetain();
  if (!v15)
    goto LABEL_3;
LABEL_2:
  v16 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  v17 = v16 | (v14 << 6);
  while (1)
  {
    v22 = (uint64_t *)(*(_QWORD *)(v56 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = *(_QWORD *)(*(_QWORD *)(v56 + 56) + 8 * v17);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    if (UIAccessibilityIsBoldTextEnabled())
    {
      v26 = *(_QWORD *)(v25 + 16);
      v27 = *(double *)(v25 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      v28 = *(void **)(v25 + 32);
      v29 = *(_BYTE *)(v25 + 40);
      v63[0] = v26;
      *(double *)&v63[1] = v27 * 1.5;
      v63[2] = v28;
      v64 = v29;
      v31 = *(_BYTE *)(v25 + 56);
      v61 = *(void **)(v25 + 48);
      v30 = v61;
      v62 = v31;
      v32 = *(_QWORD *)(v25 + 64);
      v33 = v28;
      sub_1B81E892C(v30, v31);
      swift_bridgeObjectRetain();
      swift_release();
      type metadata accessor for LineStyle();
      swift_allocObject();
      v34 = LineStyle.init(stroke:fill:zoneStyles:)((uint64_t)v63, (uint64_t *)&v61, v32);
    }
    else
    {
      swift_release();
      v34 = v25;
    }
    __swift_project_boxed_opaque_existential_1(v55, *(_QWORD *)(v58 + 40));
    v35 = sub_1B81E49FC(a4, a5, a6, a9, (uint64_t)v63, v34);
    if (!v35)
    {
      swift_bridgeObjectRetain();
      v44 = sub_1B81E2E68();
      v46 = v45;
      swift_bridgeObjectRelease();
      if ((v46 & 1) != 0)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v63[0] = a1;
        sub_1B81EA460(0, &qword_1ED5532D0, (void (*)(uint64_t))sub_1B81E583C);
        sub_1B820EBF4();
        a1 = (_QWORD *)v63[0];
        swift_bridgeObjectRelease();
        v47 = *(void **)(a1[7] + 8 * v44);
        sub_1B81E583C();
        sub_1B820EC00();
        swift_release();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease_n();
      }
      goto LABEL_35;
    }
    v36 = v35;
    v60 = v15;
    v59 = v14;
    swift_isUniquelyReferenced_nonNull_native();
    v63[0] = a1;
    v37 = sub_1B81E2E68();
    if (__OFADD__(a1[2], (v38 & 1) == 0))
      break;
    v39 = v37;
    v40 = v38;
    sub_1B81EA460(0, &qword_1ED5532D0, (void (*)(uint64_t))sub_1B81E583C);
    if ((sub_1B820EBF4() & 1) != 0)
    {
      v41 = sub_1B81E2E68();
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_41;
      v39 = v41;
    }
    a1 = (_QWORD *)v63[0];
    if ((v40 & 1) != 0)
    {
      v43 = *(_QWORD *)(v63[0] + 56);

      *(_QWORD *)(v43 + 8 * v39) = v36;
    }
    else
    {
      *(_QWORD *)(v63[0] + 8 * (v39 >> 6) + 64) |= 1 << v39;
      v48 = (_QWORD *)(a1[6] + 16 * v39);
      *v48 = v24;
      v48[1] = v23;
      *(_QWORD *)(a1[7] + 8 * v39) = v36;
      v49 = a1[2];
      v50 = __OFADD__(v49, 1);
      v51 = v49 + 1;
      if (v50)
        goto LABEL_40;
      a1[2] = v51;
      swift_bridgeObjectRetain();
    }
    swift_release();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v14 = v59;
    v15 = v60;
LABEL_35:
    swift_release();
    if (v15)
      goto LABEL_2;
LABEL_3:
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
      goto LABEL_39;
    if (v18 >= v54)
      goto LABEL_37;
    v19 = *(_QWORD *)(v53 + 8 * v18);
    v20 = v14 + 1;
    if (!v19)
    {
      v20 = v14 + 2;
      if (v14 + 2 >= v54)
        goto LABEL_37;
      v19 = *(_QWORD *)(v53 + 8 * v20);
      if (!v19)
      {
        v20 = v14 + 3;
        if (v14 + 3 >= v54)
          goto LABEL_37;
        v19 = *(_QWORD *)(v53 + 8 * v20);
        if (!v19)
        {
          v20 = v14 + 4;
          if (v14 + 4 >= v54)
            goto LABEL_37;
          v19 = *(_QWORD *)(v53 + 8 * v20);
          if (!v19)
          {
            v20 = v14 + 5;
            if (v14 + 5 >= v54)
              goto LABEL_37;
            v19 = *(_QWORD *)(v53 + 8 * v20);
            if (!v19)
            {
              v21 = v14 + 6;
              while (v21 < v54)
              {
                v19 = *(_QWORD *)(v53 + 8 * v21++);
                if (v19)
                {
                  v20 = v21 - 1;
                  goto LABEL_18;
                }
              }
LABEL_37:
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              return (uint64_t)a1;
            }
          }
        }
      }
    }
LABEL_18:
    v15 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v20 << 6);
    v14 = v20;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_1B820ECE4();
  __break(1u);
  return result;
}

uint64_t sub_1B81EA0A8(CGFloat a1, CGFloat a2, CGFloat a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t))
{
  uint64_t v15;
  uint64_t v16;

  type metadata accessor for LineChartModel();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v15 = swift_bridgeObjectRetain();
  v16 = sub_1B81E96C8(v15, a5, a6, a7, a1, a2, a3);
  swift_bridgeObjectRelease();
  a8(v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B81EA17C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LineChartImageLoader()
{
  return objc_opt_self();
}

uint64_t sub_1B81EA1C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81EA1EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_1B81EA21C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B81E93E0(a1, a2, v2);
}

uint64_t sub_1B81EA224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B81EA268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_0_3();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 40) & ~v2);
  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  type metadata accessor for CategoryAxis();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_1();
  v5 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(v3 + *(int *)(v5 + 52) + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v6 = v3 + *(int *)(v1 + 32);
  v7 = sub_1B820E57C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81EA3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B81EA3F4()
{
  CGFloat *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_0_3() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1B81EA0A8(v0[2], v0[3], v0[4], (uint64_t)v0 + v2, *(_QWORD *)((char *)v0 + v3), *(_QWORD *)((char *)v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)((char *)v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(uint64_t))((char *)v0+ ((((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_1B81EA460(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B820EC0C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1B81EA4BC(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  __int128 *i;
  char v31;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  id v46;
  __int128 v47;
  __int128 v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  char v55;
  uint64_t v56;

  v18 = v17;
  v19 = *(_QWORD *)(a1 + 16);
  v20 = MEMORY[0x1E0DEE9D8];
  if (v19)
  {
    v56 = MEMORY[0x1E0DEE9D8];
    sub_1B81E75EC(0, v19, 0);
    v20 = v56;
    for (i = (__int128 *)(a1 + 56); ; i += 5)
    {
      v31 = *((_BYTE *)i + 16);
      v46 = (id)*((_QWORD *)i - 3);
      v47 = *(i - 1);
      v48 = *i;
      v49 = v31;
      v32 = *(__int128 *)((char *)i + 40);
      v50 = *(__int128 *)((char *)i + 24);
      v51 = v32;
      v33 = v46;
      sub_1B81EAF60((uint64_t)&v46, a2, a3, (uint64_t)&v52, a4, a5, a6, a7, a8, a9, a10, a11, a12);
      if (v18)
        break;
      v18 = 0;

      v34 = v52;
      v35 = v53;
      v36 = v54;
      v37 = v55;
      v56 = v20;
      v39 = *(_QWORD *)(v20 + 16);
      v38 = *(_QWORD *)(v20 + 24);
      if (v39 >= v38 >> 1)
      {
        v42 = v53;
        v43 = v52;
        sub_1B81E75EC((char *)(v38 > 1), v39 + 1, 1);
        v35 = v42;
        v34 = v43;
        v20 = v56;
      }
      *(_QWORD *)(v20 + 16) = v39 + 1;
      v40 = v20 + 48 * v39;
      *(_OWORD *)(v40 + 32) = v34;
      *(_OWORD *)(v40 + 48) = v35;
      *(_QWORD *)(v40 + 64) = v36;
      *(_BYTE *)(v40 + 72) = v37;
      if (!--v19)
        return v20;
    }
    swift_release();

  }
  return v20;
}

uint64_t sub_1B81EA684(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  int64_t v8;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_BYTE *, _QWORD *, uint64_t, uint64_t);
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  int64_t v38;
  _QWORD v39[6];
  char v40;
  _BYTE v41[8];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char v46;
  char v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v50 = MEMORY[0x1E0DEE9D8];
    sub_1B81E75D0(0, v8, 0);
    v16 = a2;
    v17 = v50;
    v18 = (_OWORD *)(a1 + 96);
    do
    {
      v37 = v17;
      v38 = v8;
      v19 = *((_BYTE *)v18 - 64);
      v20 = *((_QWORD *)v18 - 7);
      v21 = *((_QWORD *)v18 - 6);
      v22 = *((_QWORD *)v18 - 5);
      v23 = (void *)*((_QWORD *)v18 - 4);
      v24 = *((_BYTE *)v18 - 24);
      v25 = *((_BYTE *)v18 - 23);
      v27 = *(_QWORD *)(v16 + 40);
      v26 = *(_QWORD *)(v16 + 48);
      v35 = *v18;
      v36 = *(v18 - 1);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 16), v27);
      v41[0] = v19;
      v42 = v20;
      v43 = v21;
      v44 = v22;
      v45 = v23;
      v46 = v24;
      v47 = v25;
      v48 = v36;
      v49 = v35;
      *(double *)v39 = a3;
      *(double *)&v39[1] = a4;
      *(double *)&v39[2] = a5;
      *(double *)&v39[3] = a6;
      *(double *)&v39[4] = a7;
      *(double *)&v39[5] = a8;
      v40 = v25;
      v28 = *(uint64_t (**)(_BYTE *, _QWORD *, uint64_t, uint64_t))(v26 + 8);
      swift_bridgeObjectRetain();
      v29 = v23;
      swift_bridgeObjectRetain();
      v17 = v37;
      v30 = v28(v41, v39, v27, v26);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v50 = v37;
      v32 = *(_QWORD *)(v37 + 16);
      v31 = *(_QWORD *)(v37 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_1B81E75D0((char *)(v31 > 1), v32 + 1, 1);
        v17 = v50;
      }
      *(_QWORD *)(v17 + 16) = v32 + 1;
      *(_QWORD *)(v17 + 8 * v32 + 32) = v30;
      v18 += 5;
      v8 = v38 - 1;
      v16 = a2;
    }
    while (v38 != 1);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  return v17;
}

void sub_1B81EA884(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  char v24;
  id v25;
  id *v26;
  uint64_t v27;
  double v28;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  char v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  void *v86;
  __int128 v87;
  __int128 v88;

  v7 = sub_1B820E558();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v77 = (char *)&v70 - v12;
  v13 = *a2;
  v14 = a2[1];
  v79 = *(_QWORD *)(a1 + 16);
  if (v79)
  {
    v72 = v10;
    v73 = v3;
    v74 = v8;
    v75 = a3;
    v76 = v7;
    v15 = a1 + 32;
    v80 = (id)*MEMORY[0x1E0DC32A0];
    v71 = a1;
    swift_bridgeObjectRetain();
    v16 = 0;
    v17 = MEMORY[0x1E0DEE9D8];
    v83 = MEMORY[0x1E0DEE9B8] + 8;
    v78 = a1 + 32;
    while (1)
    {
      v18 = v17;
      v19 = v15 + 80 * v16;
      v20 = *(_QWORD *)(v19 + 8);
      v21 = *(void **)(v19 + 32);
      v22 = *(_QWORD *)(v20 + 16);
      v82 = *(_QWORD *)(v19 + 16);
      v81 = v21;
      if (v22)
        break;
      swift_bridgeObjectRetain();
      v50 = v21;
      swift_bridgeObjectRetain();
      v27 = MEMORY[0x1E0DEE9D8];
LABEL_31:
      v51 = *(_QWORD *)(v27 + 16);
      v52 = *(_QWORD *)(v18 + 16);
      v53 = v52 + v51;
      if (__OFADD__(v52, v51))
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        return;
      }
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || (v17 = v18, v53 > *(_QWORD *)(v18 + 24) >> 1))
      {
        if (v52 <= v53)
          v55 = v52 + v51;
        else
          v55 = v52;
        sub_1B81EBEF8(isUniquelyReferenced_nonNull_native, v55, 1, v18, &qword_1ED553160, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1B81E8130);
        v17 = v56;
      }
      if (*(_QWORD *)(v27 + 16))
      {
        if ((*(_QWORD *)(v17 + 24) >> 1) - *(_QWORD *)(v17 + 16) < v51)
          goto LABEL_61;
        swift_arrayInitWithCopy();
        if (v51)
        {
          v57 = *(_QWORD *)(v17 + 16);
          v58 = __OFADD__(v57, v51);
          v59 = v57 + v51;
          if (v58)
            goto LABEL_62;
          *(_QWORD *)(v17 + 16) = v59;
        }
      }
      else if (v51)
      {
        goto LABEL_60;
      }
      ++v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 = v78;
      if (v16 == v79)
      {
        a1 = v71;
        swift_bridgeObjectRelease();
        v7 = v76;
        a3 = v75;
        v8 = v74;
        v3 = v73;
        v10 = v72;
        goto LABEL_47;
      }
    }
    v23 = *(_OWORD *)(v19 + 48);
    v84 = *(_OWORD *)(v19 + 64);
    v85 = v23;
    v24 = *(_BYTE *)(v15 + 80 * v16);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v25 = v21;
    v26 = (id *)(v20 + 40);
    v27 = MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v28 = *((double *)v26 - 1);
      if (*v26 && v28 != 1.0)
        break;
LABEL_28:
      v26 += 2;
      if (!--v22)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_31;
      }
    }
    v30 = *v26;
    if ((uint64_t)objc_msgSend(v30, sel_length) >= 1)
    {
      v31 = objc_msgSend(v30, sel_attributesAtIndex_effectiveRange_, 0, 0);
      type metadata accessor for Key(0);
      sub_1B81DFAAC(&qword_1ED5530E8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1B820FB58);
      v32 = sub_1B820E81C();

      if (*(_QWORD *)(v32 + 16))
      {
        v33 = v80;
        v34 = sub_1B81F985C((uint64_t)v33);
        if ((v35 & 1) != 0)
        {
          sub_1B81EBCCC(*(_QWORD *)(v32 + 56) + 32 * v34, (uint64_t)&v87);
        }
        else
        {
          v87 = 0u;
          v88 = 0u;
        }

      }
      else
      {
        v87 = 0u;
        v88 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v88 + 1))
      {
        sub_1B81EBD98(0, &qword_1ED553100);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v36 = v86;
LABEL_21:
          objc_msgSend(v30, sel_boundingRectWithSize_options_context_, 1, 0, v13, v14);
          v38 = v37;
          v40 = v39;
          v41 = v30;
          v42 = v14;
          if (v36)
          {
            objc_msgSend(v36, sel_ascender);
            v42 = v43;

            v41 = v36;
          }

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B81EBEF8(0, *(_QWORD *)(v27 + 16) + 1, 1, v27, &qword_1ED553160, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1B81E8130);
            v27 = v48;
          }
          v45 = *(_QWORD *)(v27 + 16);
          v44 = *(_QWORD *)(v27 + 24);
          if (v45 >= v44 >> 1)
          {
            sub_1B81EBEF8(v44 > 1, v45 + 1, 1, v27, &qword_1ED553160, (uint64_t)&type metadata for GridLayoutAttributesFactory.Label, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1B81E8130);
            v27 = v49;
          }
          *(_QWORD *)(v27 + 16) = v45 + 1;
          v46 = v27 + 80 * v45;
          *(_QWORD *)(v46 + 32) = v30;
          *(_QWORD *)(v46 + 40) = v38;
          *(_QWORD *)(v46 + 48) = v40;
          *(double *)(v46 + 56) = v42;
          *(double *)(v46 + 64) = v28;
          *(_BYTE *)(v46 + 72) = v24;
          v47 = v84;
          *(_OWORD *)(v46 + 80) = v85;
          *(_OWORD *)(v46 + 96) = v47;
          goto LABEL_28;
        }
      }
      else
      {
        sub_1B81EBC74((uint64_t)&v87);
      }
    }
    v36 = 0;
    goto LABEL_21;
  }
  v17 = MEMORY[0x1E0DEE9D8];
LABEL_47:
  v60 = *(_QWORD *)(v17 + 16);
  if (v60)
  {
    v61 = v17 + 56;
    v62 = 0.0;
    v63 = 0.0;
    do
    {
      if ((*(_BYTE *)(v61 + 16) & 1) != 0)
      {
        if (v62 <= *(double *)(v61 + 24) + *(double *)v61)
          v62 = *(double *)(v61 + 24) + *(double *)v61;
      }
      else
      {
        v64 = *(double *)(v61 + 32);
        v65 = *(double *)(v61 - 16);
        if (v63 <= v65 + *(double *)(v61 + 48) + v64)
          v63 = v65 + *(double *)(v61 + 48) + v64;
      }
      v61 += 80;
      --v60;
    }
    while (v60);
  }
  else
  {
    v63 = 0.0;
    v62 = 0.0;
  }
  v66 = (uint64_t)v77;
  sub_1B820E54C();
  sub_1B820E54C();
  v67 = sub_1B81EA4BC(v17, (uint64_t)v10, v66, v13, v14, v13 - v63, v14 - v62, 3.0, 0.0, 0.0, v62, v63);
  swift_bridgeObjectRelease();
  swift_retain();
  v68 = sub_1B81EA684(a1, v3, v13, v14, 0.0, 0.0, v62, v63);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(double *)(a3 + 16) = v13;
  *(double *)(a3 + 24) = v14;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 40) = 0;
  *(double *)(a3 + 48) = v62;
  *(double *)(a3 + 56) = v63;
  *(_QWORD *)(a3 + 64) = v68;
  *(_QWORD *)(a3 + 72) = v67;
  v69 = *(void (**)(char *, uint64_t))(v8 + 8);
  v69(v10, v7);
  v69((char *)v66, v7);
}

void sub_1B81EAF60(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>, double a13)
{
  uint64_t v13;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MinX;
  BOOL v38;
  double MaxX;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  double v50;
  unint64_t v51;
  double v52;
  double v53;
  unint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  void *v62;
  uint64_t v63;
  double v64;
  unint64_t v65;
  double v66;
  unint64_t v67;
  double v68;
  unint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  char v80;
  double MinY;
  double v82;
  double MaxY;
  id v84;
  double v85;
  double v86;
  double v87;
  double v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  char v99;
  void *v100;
  id v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  double v105;
  double v106;
  uint64_t v107;
  __int128 v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  uint64_t v117;
  double v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  double v122;
  __int128 v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  char v129;
  double v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  unint64_t v135;
  double v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  *(double *)&v123 = a12;
  v136 = a10;
  v24 = sub_1B820E558();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v102 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(void **)a1;
  v30 = *(double *)(a1 + 8);
  v29 = *(double *)(a1 + 16);
  v31 = *(double *)(a1 + 32);
  v32 = *(double *)(a1 + 48);
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    v76 = a5 - v30 - *(double *)(a1 + 72);
    v77 = v31 * a8 + v32;
    v139.origin.x = v76;
    v139.origin.y = v77;
    v139.size.width = *(CGFloat *)(a1 + 8);
    v139.size.height = *(CGFloat *)(a1 + 16);
    v78 = CGRectGetMinY(v139) - a9;
    if ((~*(_QWORD *)&v78 & 0x7FF0000000000000) != 0)
    {
      if (v78 > -9.22337204e18)
      {
        if (v78 < 9.22337204e18)
        {
          v140.origin.x = v76;
          v140.origin.y = v77;
          v140.size.width = v30;
          v140.size.height = v29;
          v79 = CGRectGetMaxY(v140) + a9;
          if ((~*(_QWORD *)&v79 & 0x7FF0000000000000) != 0)
          {
            if (v79 > -9.22337204e18)
            {
              if (v79 < 9.22337204e18)
              {
                if (((uint64_t)v79 & (unint64_t)~((uint64_t)v79 >> 63)) >= ((uint64_t)v78 & (unint64_t)~((uint64_t)v78 >> 63)))
                {
                  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a2, v24);
                  v80 = sub_1B820E4EC();
                  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
                  if ((v80 & 1) != 0)
                  {
                    *(_QWORD *)(a4 + 32) = 0;
                    *(_OWORD *)a4 = 0u;
                    *(_OWORD *)(a4 + 16) = 0u;
                    *(_BYTE *)(a4 + 40) = 1;
                    return;
                  }
                  v141.origin.x = v76;
                  v141.origin.y = v77;
                  v141.size.width = v30;
                  v141.size.height = v29;
                  MinY = CGRectGetMinY(v141);
                  v82 = MinY;
                  if ((~*(_QWORD *)&MinY & 0x7FF0000000000000) != 0)
                  {
                    if (MinY > -9.22337204e18)
                    {
                      if (MinY < 9.22337204e18)
                      {
                        v142.origin.x = v76;
                        v142.origin.y = v77;
                        v142.size.width = v30;
                        v142.size.height = v29;
                        MaxY = CGRectGetMaxY(v142);
                        if ((~*(_QWORD *)&MaxY & 0x7FF0000000000000) != 0)
                        {
                          if (MaxY > -9.22337204e18)
                          {
                            if (MaxY < 9.22337204e18)
                            {
                              if ((uint64_t)MaxY >= (uint64_t)v82)
                              {
                                sub_1B820E504();
                                *(_QWORD *)a4 = v28;
                                *(double *)(a4 + 8) = v76;
                                *(double *)(a4 + 16) = v77;
                                *(double *)(a4 + 24) = v30;
                                *(double *)(a4 + 32) = v29;
                                *(_BYTE *)(a4 + 40) = 0;
                                v84 = v28;
                                return;
                              }
                              goto LABEL_54;
                            }
LABEL_53:
                            __break(1u);
LABEL_54:
                            __break(1u);
LABEL_55:
                            __break(1u);
                            goto LABEL_56;
                          }
LABEL_52:
                          __break(1u);
                          goto LABEL_53;
                        }
LABEL_51:
                        __break(1u);
                        goto LABEL_52;
                      }
LABEL_50:
                      __break(1u);
                      goto LABEL_51;
                    }
LABEL_49:
                    __break(1u);
                    goto LABEL_50;
                  }
LABEL_48:
                  __break(1u);
                  goto LABEL_49;
                }
LABEL_47:
                __break(1u);
                goto LABEL_48;
              }
LABEL_46:
              __break(1u);
              goto LABEL_47;
            }
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_43;
  }
  v121 = *(_QWORD *)(a1 + 72);
  v113 = v32;
  v115 = a8;
  v122 = a5;
  v118 = *(double *)(a1 + 24);
  v33 = *(double *)(a1 + 56);
  v119 = *(_QWORD *)(a1 + 64);
  v114 = a7;
  v34 = v31;
  v120 = v33;
  v35 = v31 * a7 + a11 + v33;
  v112 = a6;
  v36 = a6 - v29;
  v137.origin.x = v35;
  v137.origin.y = a6 - v29;
  v137.size.width = v30;
  v137.size.height = v29;
  MinX = CGRectGetMinX(v137);
  v38 = MinX == 1.79769313e308 || (*(_QWORD *)&MinX & 0x7FF0000000000000) == 0x7FF0000000000000;
  v117 = v13;
  v116 = v28;
  if (v38
    || ((v138.origin.x = v35,
         v138.origin.y = a6 - v29,
         v138.size.width = v30,
         v138.size.height = v29,
         MaxX = CGRectGetMaxX(v138),
         MaxX != 1.79769313e308)
      ? (v40 = (*(_QWORD *)&MaxX & 0x7FF0000000000000) == 0x7FF0000000000000)
      : (v40 = 1),
        v40))
  {
    v105 = a13;
    v109 = sub_1B820E9E4();
    sub_1B81EC390(0, (unint64_t *)&qword_1EF19BBC8, (void (*)(uint64_t))sub_1B81EBD08);
    v110 = v41;
    v42 = swift_allocObject();
    v108 = xmmword_1B820FEF0;
    *(_OWORD *)(v42 + 16) = xmmword_1B820FEF0;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = *(_QWORD *)&v35;
    v125 = a6 - v29;
    v126 = v30;
    v127 = v29;
    type metadata accessor for CGRect(0);
    v107 = v43;
    sub_1B820EBDC();
    v111 = a4;
    v44 = (uint64_t)v28;
    v45 = v134;
    v46 = v135;
    v47 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v42 + 56) = MEMORY[0x1E0DEA968];
    v48 = sub_1B81EBD5C();
    *(_QWORD *)(v42 + 64) = v48;
    *(double *)(v42 + 32) = v45;
    *(_QWORD *)(v42 + 40) = v46;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = *(_QWORD *)&v136;
    v125 = a11;
    v106 = a11;
    v126 = *(double *)&v123;
    v127 = a13;
    type metadata accessor for UIEdgeInsets(0);
    v104 = v49;
    sub_1B820EBDC();
    v50 = v134;
    v51 = v135;
    *(_QWORD *)(v42 + 96) = v47;
    *(_QWORD *)(v42 + 104) = v48;
    *(double *)(v42 + 72) = v50;
    *(_QWORD *)(v42 + 80) = v51;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = v44;
    v125 = v30;
    v126 = v29;
    v127 = v118;
    v128 = v34;
    v103 = v34;
    v129 = 1;
    v52 = v113;
    v130 = v113;
    v131 = v120;
    v132 = v119;
    v133 = v121;
    sub_1B820EBDC();
    v53 = v134;
    v54 = v135;
    *(_QWORD *)(v42 + 136) = v47;
    *(_QWORD *)(v42 + 144) = v48;
    *(double *)(v42 + 112) = v53;
    *(_QWORD *)(v42 + 120) = v54;
    v124 = 0;
    v125 = -2.68156159e154;
    v55 = v112;
    v134 = v122;
    v135 = *(_QWORD *)&v112;
    sub_1B820EBDC();
    v56 = v124;
    v57 = v125;
    *(_QWORD *)(v42 + 176) = v47;
    *(_QWORD *)(v42 + 184) = v48;
    *(_QWORD *)(v42 + 152) = v56;
    *(double *)(v42 + 160) = v57;
    v124 = 0;
    v125 = -2.68156159e154;
    v58 = v114;
    v59 = v115;
    v134 = v114;
    v135 = *(_QWORD *)&v115;
    type metadata accessor for CGSize(0);
    sub_1B820EBDC();
    v60 = v124;
    v61 = v125;
    *(_QWORD *)(v42 + 216) = v47;
    *(_QWORD *)(v42 + 224) = v48;
    *(_QWORD *)(v42 + 192) = v60;
    *(double *)(v42 + 200) = v61;
    sub_1B81EBD98(0, (unint64_t *)&qword_1EF19BB40);
    v62 = (void *)sub_1B820EA68();
    sub_1B820E7EC();
    swift_bridgeObjectRelease();

    v109 = sub_1B820E9F0();
    v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = v108;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = *(_QWORD *)&v35;
    v125 = v36;
    v126 = v30;
    v127 = v29;
    sub_1B820EBDC();
    v64 = v134;
    v65 = v135;
    *(_QWORD *)(v63 + 56) = v47;
    *(_QWORD *)(v63 + 64) = v48;
    *(double *)(v63 + 32) = v64;
    *(_QWORD *)(v63 + 40) = v65;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = *(_QWORD *)&v136;
    v125 = v106;
    v126 = *(double *)&v123;
    v127 = v105;
    sub_1B820EBDC();
    v66 = v134;
    v67 = v135;
    *(_QWORD *)(v63 + 96) = v47;
    *(_QWORD *)(v63 + 104) = v48;
    *(double *)(v63 + 72) = v66;
    *(_QWORD *)(v63 + 80) = v67;
    v134 = 0.0;
    v135 = 0xE000000000000000;
    v124 = (uint64_t)v116;
    v125 = v30;
    v126 = v29;
    v127 = v118;
    v128 = v103;
    v129 = 1;
    v130 = v52;
    v131 = v120;
    v132 = v119;
    v133 = v121;
    sub_1B820EBDC();
    v68 = v134;
    v69 = v135;
    *(_QWORD *)(v63 + 136) = v47;
    *(_QWORD *)(v63 + 144) = v48;
    *(double *)(v63 + 112) = v68;
    *(_QWORD *)(v63 + 120) = v69;
    v124 = 0;
    v125 = -2.68156159e154;
    v134 = v122;
    v135 = *(_QWORD *)&v55;
    sub_1B820EBDC();
    v70 = v124;
    v71 = v125;
    *(_QWORD *)(v63 + 176) = v47;
    *(_QWORD *)(v63 + 184) = v48;
    *(_QWORD *)(v63 + 152) = v70;
    *(double *)(v63 + 160) = v71;
    v124 = 0;
    v125 = -2.68156159e154;
    v134 = v58;
    v135 = *(_QWORD *)&v59;
    sub_1B820EBDC();
    v72 = v124;
    v73 = v125;
    *(_QWORD *)(v63 + 216) = v47;
    *(_QWORD *)(v63 + 224) = v48;
    *(_QWORD *)(v63 + 192) = v72;
    *(double *)(v63 + 200) = v73;
    v74 = (void *)sub_1B820EA68();
    sub_1B820E7EC();
    swift_bridgeObjectRelease();

    v75 = v111;
    *(_QWORD *)(v111 + 32) = 0;
    *(_OWORD *)v75 = 0u;
    *(_OWORD *)(v75 + 16) = 0u;
    *(_BYTE *)(v75 + 40) = 1;
    return;
  }
  v143.origin.x = v35;
  v143.origin.y = a6 - v29;
  v143.size.width = v30;
  v143.size.height = v29;
  v85 = CGRectGetMinX(v143);
  v86 = v85 + -3.0;
  if ((~COERCE__INT64(v85 + -3.0) & 0x7FF0000000000000) == 0)
    goto LABEL_55;
  if (v86 <= -9.22337204e18)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v86 >= 9.22337204e18)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v144.origin.x = v35;
  v144.origin.y = v36;
  v144.size.width = v30;
  v144.size.height = v29;
  v87 = CGRectGetMaxX(v144) + 3.0;
  if ((~*(_QWORD *)&v87 & 0x7FF0000000000000) == 0)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  if (v87 <= -9.22337204e18)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  v88 = v122;
  if (v87 >= 9.22337204e18)
  {
LABEL_60:
    __break(1u);
    return;
  }
  v89 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
  v90 = (uint64_t)v87 & ~((uint64_t)v87 >> 63);
  if (v90 >= v89)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a3, v24);
    v124 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
    v125 = *(double *)&v90;
    *(_QWORD *)&v123 = v90;
    sub_1B81EBDCC();
    sub_1B81DFAAC(&qword_1ED5530C8, (uint64_t (*)(uint64_t))sub_1B81EBDCC, MEMORY[0x1E0DEA4E8]);
    v99 = sub_1B820E4F8();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    if ((v99 & 1) == 0)
    {
      v145.origin.x = v35;
      v145.origin.y = v36;
      v145.size.width = v30;
      v145.size.height = v29;
      if (CGRectGetMaxX(v145) < v88)
      {
        v124 = (uint64_t)v86 & ~((uint64_t)v86 >> 63);
        v125 = *(double *)&v123;
        sub_1B820E510();
        v100 = v116;
        *(_QWORD *)a4 = v116;
        *(double *)(a4 + 8) = v35;
        *(double *)(a4 + 16) = v36;
        *(double *)(a4 + 24) = v30;
        *(double *)(a4 + 32) = v29;
        *(_BYTE *)(a4 + 40) = 0;
        v101 = v100;
        return;
      }
    }
  }
  else
  {
    sub_1B820E9E4();
    sub_1B81EC390(0, (unint64_t *)&qword_1EF19BBC8, (void (*)(uint64_t))sub_1B81EBD08);
    v91 = swift_allocObject();
    v123 = xmmword_1B820FEE0;
    *(_OWORD *)(v91 + 16) = xmmword_1B820FEE0;
    v92 = MEMORY[0x1E0DEB418];
    v93 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v91 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v91 + 64) = v93;
    *(_QWORD *)(v91 + 32) = v89;
    *(_QWORD *)(v91 + 96) = v92;
    *(_QWORD *)(v91 + 104) = v93;
    *(double *)(v91 + 72) = *(double *)&v90;
    sub_1B81EBD98(0, (unint64_t *)&qword_1EF19BB40);
    v94 = v90;
    v95 = (void *)sub_1B820EA68();
    sub_1B820E7EC();
    swift_bridgeObjectRelease();

    sub_1B820E9F0();
    v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = v123;
    v97 = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v96 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v96 + 64) = v93;
    *(_QWORD *)(v96 + 32) = v89;
    *(_QWORD *)(v96 + 96) = v97;
    *(_QWORD *)(v96 + 104) = v93;
    *(_QWORD *)(v96 + 72) = v94;
    v98 = (void *)sub_1B820EA68();
    sub_1B820E7EC();
    swift_bridgeObjectRelease();

  }
  *(_QWORD *)(a4 + 32) = 0;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_BYTE *)(a4 + 40) = 1;
}

uint64_t type metadata accessor for GridLayoutAttributesFactory()
{
  return objc_opt_self();
}

BOOL sub_1B81EBAA4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1B81EBAB0(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_1B81EBAB8(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1B81EBAE4(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_1B81EBAF4(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

void sub_1B81EBB04()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_15_0(v7, &qword_1ED553178, (void (*)(uint64_t))sub_1B81EBDCC);
    v8 = (_QWORD *)OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_3_2(v8);
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E80E8((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v3 + 32), (const void *)(v0 + 32), 16 * v2);
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
}

void sub_1B81EBBB0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  char *v8;
  size_t v9;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_14_0(v7, &qword_1ED553130, (uint64_t)&type metadata for CategoryZone, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v8 = (char *)OUTLINED_FUNCTION_6_1();
    v9 = _swift_stdlib_malloc_size(v8);
    OUTLINED_FUNCTION_13(v9);
  }
  else
  {
    v8 = (char *)MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E8108((char *)(v0 + 32), v2, v8 + 32);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_1B81EBC74(uint64_t a1)
{
  uint64_t v2;

  sub_1B81EC3D8(0, &qword_1ED553290, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B81EBCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1B81EBD08()
{
  unint64_t result;

  result = qword_1EF19BBD0;
  if (!qword_1EF19BBD0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF19BBD0);
  }
  return result;
}

unint64_t sub_1B81EBD5C()
{
  unint64_t result;

  result = qword_1EF19BBD8;
  if (!qword_1EF19BBD8)
  {
    result = MEMORY[0x1BCCAE964](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF19BBD8);
  }
  return result;
}

void sub_1B81EBD98(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_0();
}

void sub_1B81EBDCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5530C0)
  {
    v0 = sub_1B820E858();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5530C0);
  }
}

void sub_1B81EBE1C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  char *v8;
  size_t v9;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_15_0(v7, &qword_1ED553148, (void (*)(uint64_t))sub_1B81EC25C);
    v8 = (char *)OUTLINED_FUNCTION_6_1();
    v9 = _swift_stdlib_malloc_size(v8);
    OUTLINED_FUNCTION_13(v9);
  }
  else
  {
    v8 = (char *)MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E8108((char *)(v0 + 32), v2, v8 + 32);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1B81EC25C();
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_2();
}

void sub_1B81EBEDC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1B81EBEF8(a1, a2, a3, a4, &qword_1ED553138, (uint64_t)&type metadata for GridViewModel, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1B81E8130);
}

void sub_1B81EBEF8(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_8();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    sub_1B81EC3D8(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v16 = (_QWORD *)OUTLINED_FUNCTION_6_1();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 80);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v14, v16 + 4);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_7();
}

void sub_1B81EBFF0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_14_0(v7, &qword_1ED553168, (uint64_t)&type metadata for GridLine, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v8 = (_QWORD *)OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_3_2(v8);
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E80E8((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
}

void sub_1B81EC0A0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_14_0(v7, &qword_1ED553188, MEMORY[0x1E0DEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v8 = OUTLINED_FUNCTION_5_4();
    v9 = _swift_stdlib_malloc_size((const void *)v8);
    *(_QWORD *)(v8 + 16) = v2;
    *(_QWORD *)(v8 + 24) = 2 * ((uint64_t)(v9 - 32) / 8);
  }
  else
  {
    v8 = MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E8158((char *)(v0 + 32), v2, (char *)(v8 + 32));
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v8 + 32), (const void *)(v0 + 32), 8 * v2);
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
}

void sub_1B81EC16C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_10();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_2();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_8();
      if (v5)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_0_4();
    }
  }
  OUTLINED_FUNCTION_2_2();
  if (v3)
  {
    OUTLINED_FUNCTION_15_0(v7, &qword_1EF19BBE0, (void (*)(uint64_t))sub_1B81EC21C);
    v8 = (_QWORD *)OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_3_2(v8);
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    sub_1B81E80E8((char *)(v0 + 32), v2, (char *)(v3 + 32));
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1B81EC21C();
    OUTLINED_FUNCTION_11();
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_2();
}

unint64_t sub_1B81EC21C()
{
  unint64_t result;

  result = qword_1EF19BBE8;
  if (!qword_1EF19BBE8)
  {
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1EF19BBE8);
  }
  return result;
}

uint64_t sub_1B81EC25C()
{
  uint64_t result;

  result = qword_1ED552D00;
  if (!qword_1ED552D00)
  {
    sub_1B81EC2DC();
    sub_1B81EC318();
    sub_1B81EC354();
    type metadata accessor for InteractionCursor();
  }
  return result;
}

unint64_t sub_1B81EC2DC()
{
  unint64_t result;

  result = qword_1ED553458;
  if (!qword_1ED553458)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryDataPoint, &type metadata for CategoryDataPoint);
    atomic_store(result, (unint64_t *)&qword_1ED553458);
  }
  return result;
}

unint64_t sub_1B81EC318()
{
  unint64_t result;

  result = qword_1ED553448;
  if (!qword_1ED553448)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryDataPoint, &type metadata for CategoryDataPoint);
    atomic_store(result, (unint64_t *)&qword_1ED553448);
  }
  return result;
}

unint64_t sub_1B81EC354()
{
  unint64_t result;

  result = qword_1ED553450;
  if (!qword_1ED553450)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for CategoryDataPoint, &type metadata for CategoryDataPoint);
    atomic_store(result, (unint64_t *)&qword_1ED553450);
  }
  return result;
}

void sub_1B81EC390(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B820ECB4();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_0();
}

void sub_1B81EC3D8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(a1, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
  OUTLINED_FUNCTION_0();
}

void destroy for GridLayoutAttributesFactory.Label(id *a1)
{

}

uint64_t initializeWithCopy for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  id v5;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t assignWithTake for GridLayoutAttributesFactory.Label(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridLayoutAttributesFactory.Label(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 80))
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

uint64_t storeEnumTagSinglePayload for GridLayoutAttributesFactory.Label(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridLayoutAttributesFactory.Label()
{
  return &type metadata for GridLayoutAttributesFactory.Label;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = 2 * ((result - 32) / v3);
  return result;
}

void OUTLINED_FUNCTION_14_0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_1B81EC3D8(0, a2, a3, a4);
}

void OUTLINED_FUNCTION_15_0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1B81EC390(0, a2, a3);
}

uint64_t InteractionCursor.series.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t InteractionCursor.point.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t sub_1B81EC69C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B81EC714(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 24) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    a1[2] = a2[2];
    v11 = ((unint64_t)a1 + v6 + 24) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 24) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_1B81EC7E8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_1B81EC834(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 24) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 24) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *sub_1B81EC8B4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1B81EC944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 24 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 24 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_1B81EC99C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1B81ECA14(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  unint64_t v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 24) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload((a1 + v8 + 24) & ~v8, v6, v4);
      v16 = *(_QWORD *)(a1 + 8);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B81ECAE8 + 4 * byte_1B820FF70[(v10 - 1)]))();
}

void sub_1B81ECB54(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

void type metadata accessor for InteractionCursor()
{
  JUMPOUT(0x1BCCAE91CLL);
}

uint64_t InteractionManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t InteractionManager.__deallocating_deinit()
{
  InteractionManager.deinit();
  return swift_deallocClassInstance();
}

void InteractionManager.register(model:on:)(uint64_t a1, void *a2)
{
  MultiTouchInteractionManager.register(model:on:)(a1, a2);
}

void sub_1B81ECDA4()
{
  OUTLINED_FUNCTION_0();
}

void InteractionManager.add<A>(interactionHandler:)()
{
  MultiTouchInteractionManager.add<A>(interactionHandler:)();
}

void sub_1B81ECDC0()
{
  OUTLINED_FUNCTION_0();
}

void InteractionManager.remove<A>(interactionHandler:)()
{
  MultiTouchInteractionManager.remove<A>(interactionHandler:)();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B81ECDE4()
{
  return swift_getAssociatedConformanceWitness();
}

void sub_1B81ECE00(uint64_t a1, void *a2)
{
  InteractionManager.register(model:on:)(a1, a2);
}

void sub_1B81ECE20()
{
  InteractionManager.add<A>(interactionHandler:)();
}

uint64_t dispatch thunk of InteractionManagerType.register(model:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of InteractionManagerType.add<A>(interactionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t method lookup function for InteractionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B81ECE5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED5550C0);
  result = sub_1B820E618();
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED555178);
    result = sub_1B820E618();
    if (v8)
    {
      v5 = type metadata accessor for SparklineCoordinateProvider();
      v6 = swift_allocObject();
      sub_1B81DF244(&v9, v6 + 16);
      result = sub_1B81DF244(&v7, v6 + 56);
      a2[3] = v5;
      a2[4] = (uint64_t)&protocol witness table for SparklineCoordinateProvider;
      *a2 = v6;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for GridLine(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for GridLine(uint64_t a1)
{

}

_QWORD *assignWithCopy for GridLine(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a1[1];
  v4 = (void *)a2[1];
  a1[1] = v4;
  v5 = v4;

  return a1;
}

_QWORD *assignWithTake for GridLine(_QWORD *a1, _QWORD *a2)
{
  void *v3;

  *a1 = *a2;
  v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for GridLine(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GridLine(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for GridLine()
{
  return &type metadata for GridLine;
}

uint64_t dispatch thunk of ColumnChartStylerType.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1B81ED0D4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess();
  *a1 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B81ED11C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ColumnChartStyler()
{
  return objc_opt_self();
}

uint64_t sub_1B81ED160@<X0>(_QWORD *a1@<X8>)
{
  return sub_1B81ED0D4(a1);
}

id LineSeriesView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LineSeriesView.init(coder:)()
{
  char *v0;
  uint64_t v1;

  v1 = OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews;
  type metadata accessor for LineView();
  *(_QWORD *)&v0[v1] = sub_1B820E828();

  sub_1B820EC18();
  __break(1u);
}

uint64_t sub_1B81ED26C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  id v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  char *v31;
  objc_class *v32;
  uint64_t v33;
  _QWORD *v34;
  objc_super v35;

  v3 = OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews;
  v4 = (objc_class *)type metadata accessor for LineView();
  v5 = v1;
  *(_QWORD *)&v1[v3] = sub_1B820E828();
  v32 = v4;
  v6 = objc_msgSend(objc_allocWithZone(v4), sel_init);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView] = v6;

  v35.receiver = v5;
  v35.super_class = (Class)type metadata accessor for LineSeriesView();
  v7 = (char *)objc_msgSendSuper2(&v35, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = *(_QWORD *)&v7[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
  v9 = v7;
  objc_msgSend(v9, sel_addSubview_, v8);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    v11 = &v9[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews];
    OUTLINED_FUNCTION_0_6();
    v31 = v9;
    v12 = (uint64_t *)(a1 + 40);
    while (1)
    {
      v33 = v10;
      v14 = *(v12 - 1);
      v13 = *v12;
      v15 = objc_allocWithZone(v32);
      OUTLINED_FUNCTION_0_6();
      v16 = objc_msgSend(v15, sel_init);
      objc_msgSend(v16, sel_setHidden_, 1);
      objc_msgSend(v9, sel_addSubview_, v16);
      swift_beginAccess();
      OUTLINED_FUNCTION_0_6();
      v17 = v16;
      swift_isUniquelyReferenced_nonNull_native();
      v18 = *(_QWORD **)v11;
      v34 = *(_QWORD **)v11;
      *(_QWORD *)v11 = 0x8000000000000000;
      v19 = OUTLINED_FUNCTION_1_4();
      if (__OFADD__(v18[2], (v20 & 1) == 0))
        break;
      v21 = v19;
      v22 = v20;
      sub_1B81ED958();
      if ((sub_1B820EBF4() & 1) != 0)
      {
        v23 = OUTLINED_FUNCTION_1_4();
        if ((v22 & 1) != (v24 & 1))
          goto LABEL_17;
        v21 = v23;
      }
      if ((v22 & 1) != 0)
      {
        v25 = v34[7];

        *(_QWORD *)(v25 + 8 * v21) = v17;
      }
      else
      {
        v34[(v21 >> 6) + 8] |= 1 << v21;
        v26 = (_QWORD *)(v34[6] + 16 * v21);
        *v26 = v14;
        v26[1] = v13;
        *(_QWORD *)(v34[7] + 8 * v21) = v17;
        v27 = v34[2];
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_16;
        v34[2] = v29;
        OUTLINED_FUNCTION_0_6();
      }
      v12 += 2;
      *(_QWORD *)v11 = v34;
      swift_bridgeObjectRelease();
      swift_endAccess();

      swift_bridgeObjectRelease_n();
      v10 = v33 - 1;
      v9 = v31;
      if (v33 == 1)
      {

        swift_bridgeObjectRelease_n();
        return (uint64_t)v9;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_1B820ECE4();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();

    return (uint64_t)v9;
  }
  return result;
}

uint64_t sub_1B81ED538(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;

  sub_1B81ED920(a1, v19);
  v3 = v19[0];
  v20 = v19[1];
  v4 = v19[3];
  v5 = v19[4];
  v6 = (unint64_t)(v19[2] + 64) >> 6;
  result = OUTLINED_FUNCTION_0_6();
  if (!v5)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v9 = v8 | (v4 << 6);
  while (1)
  {
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    v18 = v17;
    a2(v15, v16, v18);

    result = swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_2;
LABEL_3:
    v10 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v10 >= v6)
      return swift_release();
    v11 = *(_QWORD *)(v20 + 8 * v10);
    v12 = v4 + 1;
    if (!v11)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v6)
        return swift_release();
      v11 = *(_QWORD *)(v20 + 8 * v12);
      if (!v11)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v6)
          return swift_release();
        v11 = *(_QWORD *)(v20 + 8 * v12);
        if (!v11)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v6)
            return swift_release();
          v11 = *(_QWORD *)(v20 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v6)
              return swift_release();
            v11 = *(_QWORD *)(v20 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 6;
              while (v13 < v6)
              {
                v11 = *(_QWORD *)(v20 + 8 * v13++);
                if (v11)
                {
                  v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v4 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81ED6D4()
{
  char *v0;
  void *v1;
  uint64_t v2;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for LineSeriesView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  sub_1B81ED538(v2, (void (*)(uint64_t, uint64_t, id))sub_1B81ED7E4);
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LineSeriesView()
{
  return objc_opt_self();
}

id sub_1B81ED7AC(int a1, int a2, void *a3, id a4)
{
  objc_msgSend(a4, sel_bounds);
  return objc_msgSend(a3, sel_setFrame_);
}

id sub_1B81ED7E4(int a1, int a2, void *a3)
{
  uint64_t v3;

  return sub_1B81ED7AC(a1, a2, a3, *(id *)(v3 + 16));
}

id LineSeriesView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void LineSeriesView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LineSeriesView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LineSeriesView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for LineSeriesView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B81ED920@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

void sub_1B81ED958()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5532A8)
  {
    type metadata accessor for LineView();
    v0 = sub_1B820EC0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5532A8);
  }
}

uint64_t sub_1B81ED9BC(void (*a1)(_QWORD *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v34;
  __int128 v35;
  char v36;
  char v37;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  char v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[5];
  char v50;
  char v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v54 = MEMORY[0x1E0DEE9D8];
    sub_1B81E7608(0, v5, 0);
    v6 = v54;
    v8 = (_QWORD *)(a3 + 112);
    while (1)
    {
      v9 = *(v8 - 10);
      v10 = *((_BYTE *)v8 - 72);
      v11 = *(v8 - 8);
      v12 = *(v8 - 7);
      v13 = (void *)*(v8 - 6);
      v14 = *((_BYTE *)v8 - 40);
      v15 = *((_BYTE *)v8 - 39);
      v16 = *v8;
      v39 = v9;
      v40 = v10;
      v41 = v11;
      v42 = v12;
      v43 = v13;
      v44 = v14;
      v45 = v15;
      v17 = *((_OWORD *)v8 - 1);
      v46 = *((_OWORD *)v8 - 2);
      v47 = v17;
      v48 = v16;
      sub_1B81EE390(v9, v10);
      swift_retain();
      swift_bridgeObjectRetain();
      v18 = v4;
      v19 = v13;
      a1(v49, &v39);
      if (v18)
        break;
      sub_1B81EE39C(v9, v10);
      swift_release();

      swift_bridgeObjectRelease();
      v20 = v49[0];
      v21 = v49[1];
      v22 = v49[2];
      v23 = v49[3];
      v24 = v49[4];
      v25 = v50;
      v26 = v51;
      v28 = *(_QWORD *)(v6 + 16);
      v27 = *(_QWORD *)(v6 + 24);
      v30 = v52;
      v29 = v53;
      v54 = v6;
      if (v28 >= v27 >> 1)
      {
        v32 = v49[0];
        v36 = v51;
        v37 = v50;
        v34 = v52;
        v35 = v53;
        sub_1B81E7608((char *)(v27 > 1), v28 + 1, 1);
        v30 = v34;
        v29 = v35;
        v26 = v36;
        v25 = v37;
        v20 = v32;
        v6 = v54;
      }
      *(_QWORD *)(v6 + 16) = v28 + 1;
      v31 = v6 + 80 * v28;
      *(_BYTE *)(v31 + 32) = v20;
      v8 += 11;
      *(_QWORD *)(v31 + 40) = v21;
      *(_QWORD *)(v31 + 48) = v22;
      *(_QWORD *)(v31 + 56) = v23;
      *(_QWORD *)(v31 + 64) = v24;
      *(_BYTE *)(v31 + 72) = v25;
      *(_BYTE *)(v31 + 73) = v26;
      *(_OWORD *)(v31 + 80) = v30;
      *(_OWORD *)(v31 + 96) = v29;
      --v5;
      v4 = 0;
      if (!v5)
        return v6;
    }
    sub_1B81EE39C(v9, v10);
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1B81EDBC8(void (*a1)(_QWORD *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *i;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1B81E7624(0, v5, 0);
    v6 = v18;
    for (i = (uint64_t *)(a3 + 32); ; ++i)
    {
      v16 = *i;
      a1(v17, &v16);
      if (v4)
        break;
      v4 = 0;
      v10 = v17[0];
      v11 = v17[1];
      v18 = v6;
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1B81E7624((char *)(v12 > 1), v13 + 1, 1);
        v6 = v18;
      }
      *(_QWORD *)(v6 + 16) = v13 + 1;
      v14 = v6 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v11;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

char *sub_1B81EDCE4(_QWORD *(*a1)(_QWORD *__return_ptr, _QWORD), double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char *result;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *(*v30)(_QWORD *__return_ptr, _QWORD);
  char v31;
  double v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = v4;
  v10 = sub_1B81EE3DC(a2, a3, a4);
  v36 = MEMORY[0x1E0DEE9D8];
  result = sub_1B81E7624(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0)
    goto LABEL_33;
  v13 = v36;
  if (!v10)
  {
    v31 = 0;
    v14 = 0;
    v16 = a2;
    goto LABEL_17;
  }
  v31 = 0;
  v14 = 0;
  v12.n128_f64[0] = a2;
  v30 = a1;
  do
  {
    v15 = v12.n128_f64[0] <= a3;
    if (a4 > 0.0)
      v15 = v12.n128_f64[0] >= a3;
    if (v15)
    {
      if (v31 & 1 | (v12.n128_f64[0] != a3))
        goto LABEL_31;
      v31 = 1;
      v16 = v12.n128_f64[0];
    }
    else
    {
      v17 = __OFADD__(v14++, 1);
      if (v17)
        goto LABEL_32;
      v16 = a2 + (double)v14 * a4;
    }
    v32 = v12.n128_f64[0];
    v33 = 0;
    result = (char *)a1(&v34, &v32);
    if (v5)
    {
LABEL_28:
      swift_release();
      return (char *)v13;
    }
    v5 = 0;
    v18 = v34;
    v19 = v35;
    v36 = v13;
    v21 = *(_QWORD *)(v13 + 16);
    v20 = *(_QWORD *)(v13 + 24);
    if (v21 >= v20 >> 1)
    {
      result = sub_1B81E7624((char *)(v20 > 1), v21 + 1, 1);
      v13 = v36;
    }
    *(_QWORD *)(v13 + 16) = v21 + 1;
    v22 = v13 + 16 * v21;
    *(_QWORD *)(v22 + 32) = v18;
    *(_QWORD *)(v22 + 40) = v19;
    v12.n128_f64[0] = v16;
    --v10;
    a1 = v30;
  }
  while (v10);
  while (1)
  {
LABEL_17:
    v23 = v16 <= a3;
    if (a4 > 0.0)
      v23 = v16 >= a3;
    if (!v23)
      break;
    if ((v16 != a3) | v31 & 1)
      return (char *)v13;
    v31 = 1;
    v24 = v16;
LABEL_24:
    v32 = v16;
    result = (char *)((char *(*)(uint64_t *__return_ptr, double *, __n128))a1)(&v34, &v32, v12);
    if (v5)
      goto LABEL_28;
    v5 = 0;
    v25 = v34;
    v26 = v35;
    v36 = v13;
    v28 = *(_QWORD *)(v13 + 16);
    v27 = *(_QWORD *)(v13 + 24);
    if (v28 >= v27 >> 1)
    {
      result = sub_1B81E7624((char *)(v27 > 1), v28 + 1, 1);
      v13 = v36;
    }
    *(_QWORD *)(v13 + 16) = v28 + 1;
    v29 = v13 + 16 * v28;
    *(_QWORD *)(v29 + 32) = v25;
    *(_QWORD *)(v29 + 40) = v26;
    v16 = v24;
  }
  v17 = __OFADD__(v14++, 1);
  if (!v17)
  {
    v12.n128_f64[0] = (double)v14;
    v24 = a2 + (double)v14 * a4;
    goto LABEL_24;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t ValueAxisGridViewModelGenerator.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t ValueAxisGridViewModelGenerator.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t ValueAxisGridViewModelGenerator.models(for:orientation:options:)(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  char v13;
  double v14;
  void *v15;
  void *v16;

  v4 = MEMORY[0x1E0DEE9D8];
  if (*(double *)(a1 + 8) - *(double *)a1 > 0.0 && *a3 > 0.0)
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = MEMORY[0x1E0C80A78](a1);
    v12[2] = v3;
    v12[3] = v7;
    v13 = v8;
    v14 = v6;
    v15 = v9;
    v16 = v9;
    v10 = v9;
    swift_bridgeObjectRetain();
    v4 = sub_1B81ED9BC((void (*)(_QWORD *__return_ptr, uint64_t *))sub_1B81EE33C, (uint64_t)v12, v5);

    swift_bridgeObjectRelease();
  }
  return v4;
}

double sub_1B81EE084@<D0>(double *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>, double a8@<D0>)
{
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double result;
  BOOL v20;

  v14 = *a1;
  v15 = a2[5];
  v16 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v15);
  v20 = (a4 & 1) == 0;
  v17 = (*(double (**)(uint64_t, BOOL *, uint64_t, uint64_t, double, double))(v16 + 8))(a3, &v20, v15, v16, v14, a8);
  if (a5)
    v18 = sub_1B81EF5A0(a6, v14);
  else
    v18 = 0;
  result = v17 / a8;
  *(double *)a7 = v17 / a8;
  *(_QWORD *)(a7 + 8) = v18;
  return result;
}

id sub_1B81EE158@<X0>(uint64_t a1@<X0>, double *a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  int v10;
  char v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  __int128 v40;
  __int128 v41;

  v5 = *(uint64_t *)a1;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = a3 & 1;
  v9 = *(void **)(a1 + 32);
  v10 = *(unsigned __int8 *)(a1 + 40);
  v11 = *(_BYTE *)(a1 + 41);
  v12 = *(_OWORD *)(a1 + 48);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 80);
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    v38 = *(unsigned __int8 *)(a1 + 41);
    v39 = v10;
    v40 = v13;
    v41 = v12;
    v17 = MEMORY[0x1E0C80A78](a1);
    v31 = v18;
    v32 = v19;
    v33 = v8;
    v34 = v17;
    v35 = v20;
    v36 = v14;
    v37 = v21;
    swift_retain();
    sub_1B81EE390(v5, 0);
    v16 = sub_1B81EDBC8((void (*)(_QWORD *__return_ptr, uint64_t *))sub_1B81EE3A8, (uint64_t)&v30, v5);
    swift_release();
    v11 = v38;
    sub_1B81EE39C(v5, 0);
LABEL_6:
    v13 = v40;
    v12 = v41;
    LOBYTE(v10) = v39;
    goto LABEL_7;
  }
  v15 = *(double *)a1;
  if (*(double *)&v5 != 0.0)
  {
    v39 = *(unsigned __int8 *)(a1 + 40);
    v40 = v13;
    v41 = v12;
    v23 = *a2;
    v22 = a2[1];
    v24 = MEMORY[0x1E0C80A78](a1);
    v31 = v25;
    v32 = v26;
    v33 = v8;
    v34 = v24;
    v35 = v27;
    v36 = v14;
    v37 = v28;
    swift_retain();
    v16 = (uint64_t)sub_1B81EDCE4((_QWORD *(*)(_QWORD *__return_ptr, _QWORD))sub_1B81EE3A8, v23, v22, v15);
    swift_release();
    goto LABEL_6;
  }
  v16 = MEMORY[0x1E0DEE9D8];
LABEL_7:
  *(_BYTE *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v16;
  *(_QWORD *)(a4 + 16) = v6;
  *(_QWORD *)(a4 + 24) = v7;
  *(_QWORD *)(a4 + 32) = v9;
  *(_BYTE *)(a4 + 40) = v10;
  *(_BYTE *)(a4 + 41) = v11;
  *(_OWORD *)(a4 + 48) = v12;
  *(_OWORD *)(a4 + 64) = v13;
  swift_bridgeObjectRetain();
  return v9;
}

id sub_1B81EE33C()
{
  uint64_t v0;
  double *v1;
  char v2;
  uint64_t v3;

  OUTLINED_FUNCTION_0_7();
  return sub_1B81EE158(v0, v1, v2, v3);
}

_UNKNOWN **sub_1B81EE358()
{
  return &protocol witness table for ValueAxis;
}

uint64_t sub_1B81EE364(uint64_t a1, uint64_t a2, double *a3)
{
  return ValueAxisGridViewModelGenerator.models(for:orientation:options:)(a1, a2, a3);
}

uint64_t method lookup function for ValueAxisGridViewModelGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B81EE390(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1B81EE39C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

double sub_1B81EE3A8()
{
  return sub_1B81EE3BC();
}

double sub_1B81EE3BC()
{
  uint64_t v0;
  double v1;
  double *v2;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_0_7();
  return sub_1B81EE084(v2, v3, v4, v5, v6, *(_QWORD *)(v0 + 64), v7, v1);
}

uint64_t sub_1B81EE3DC(double a1, double a2, double a3)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  double v6;
  _BOOL4 v7;
  BOOL v8;

  result = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1;
  while (1)
  {
    v7 = v6 <= a2;
    if (a3 > 0.0)
      v7 = v6 >= a2;
    if (v7)
    {
      if ((v6 != a2) | v4 & 1)
        return result;
      v4 = 1;
      goto LABEL_9;
    }
    v8 = __OFADD__(v5++, 1);
    if (v8)
      break;
    v6 = a1 + (double)v5 * a3;
LABEL_9:
    v8 = __OFADD__(result++, 1);
    if (v8)
    {
      __break(1u);
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81EE448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v22 = *(_QWORD *)(a1 + 16);
  if (v22)
  {
    v20 = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    v6 = MEMORY[0x1E0DEE9D8];
    do
    {
      v7 = (uint64_t *)(v20 + 24 * v5);
      v8 = v7[2];
      v9 = *(_QWORD *)(v8 + 16);
      if (v9)
      {
        v21 = *v7;
        v23 = v7[1];
        v10 = (uint64_t *)(v8 + 48);
        while (1)
        {
          v11 = *(v10 - 2);
          v12 = *(v10 - 1);
          v13 = *v10;
          if (v11 == a2 && v12 == a3)
            break;
          if ((sub_1B820ECCC() & 1) != 0)
            goto LABEL_13;
          v10 += 3;
          if (!--v9)
            goto LABEL_18;
        }
        v11 = a2;
        v12 = a3;
LABEL_13:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B81EBE1C();
          v6 = v17;
        }
        v15 = *(_QWORD *)(v6 + 16);
        if (v15 >= *(_QWORD *)(v6 + 24) >> 1)
        {
          sub_1B81EBE1C();
          v6 = v18;
        }
        *(_QWORD *)(v6 + 16) = v15 + 1;
        v16 = (_QWORD *)(v6 + 48 * v15);
        v16[4] = v21;
        v16[5] = v23;
        v16[6] = v8;
        v16[7] = v11;
        v16[8] = v12;
        v16[9] = v13;
      }
LABEL_18:
      ++v5;
    }
    while (v5 != v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t LineChartInteractor.__allocating_init(categoryCoordinateCalculator:valueCoordinateCalculator:)(__int128 *a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_1B81DF244(a1, v4 + 16);
  sub_1B81DF244(a2, v4 + 56);
  return v4;
}

uint64_t LineChartInteractor.init(categoryCoordinateCalculator:valueCoordinateCalculator:)(__int128 *a1, __int128 *a2)
{
  uint64_t v2;

  sub_1B81DF244(a1, v2 + 16);
  sub_1B81DF244(a2, v2 + 56);
  return v2;
}

void LineChartInteractor.dataPoint(for:model:size:)(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  _QWORD *v6;
  uint64_t v13;
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
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  double *v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[7];
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v13 = v6[5];
  v14 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v13);
  LOBYTE(v45[0]) = 0;
  v15 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, double, double))(v14 + 16))(a1, v45, v13, v14, a3, a5);
  if (!v16)
    goto LABEL_6;
  v17 = v15;
  v18 = v16;
  v20 = v6[10];
  v19 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v20);
  v21 = a1 + *(int *)(sub_1B81E3450() + 52);
  LOBYTE(v45[0]) = 1;
  v22 = (*(double (**)(uint64_t, _QWORD *, uint64_t, uint64_t, double, double))(v19 + 16))(v21, v45, v20, v19, a4, a6);
  type metadata accessor for LineChartModel();
  swift_bridgeObjectRetain();
  v23 = swift_bridgeObjectRetain();
  v24 = sub_1B81EE448(v23, v17, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v47 = 0;
  v48 = 0;
  v46 = v24;
  sub_1B81EEA14((uint64_t)v45);
  if (!v45[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    return;
  }
  v25 = v45[0];
  v27 = v46;
  v26 = v47;
  v28 = *(_QWORD *)(v46 + 16);
  if (v47 == v28)
  {
    swift_bridgeObjectRetain();
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 0x8000000000000000) == 0)
    {
      if (v25 < *(_QWORD *)(v24 + 16))
      {
        v35 = (_QWORD *)(v24 + 48 * v25);
        v36 = v35[4];
        v37 = v35[5];
        v39 = v35[6];
        v38 = v35[7];
        v40 = v35[8];
        v41 = v35[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)a2 = v36;
        *(_QWORD *)(a2 + 8) = v37;
        *(_QWORD *)(a2 + 16) = v39;
        *(_QWORD *)(a2 + 24) = v38;
        *(_QWORD *)(a2 + 32) = v40;
        *(_QWORD *)(a2 + 40) = v41;
        return;
      }
      goto LABEL_23;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v44 = *(_QWORD *)(v46 + 16);
  if (v47 < v28)
  {
    v29 = *(double *)&v45[6];
    v30 = v48;
    v42 = v24;
    swift_bridgeObjectRetain_n();
    v31 = (double *)(v27 + 48 * v26 + 72);
    v32 = v26;
    v33 = v44;
    v43 = v27;
    while ((v26 & 0x8000000000000000) == 0)
    {
      if (v32 >= *(_QWORD *)(v27 + 16))
        goto LABEL_20;
      if (__OFADD__(v30, 1))
        goto LABEL_21;
      v34 = *v31;
      if (vabdd_f64(*v31, v22) < vabdd_f64(v29, v22))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v27 = v43;
        swift_bridgeObjectRelease();
        v33 = v44;
        v25 = v30;
        v29 = v34;
      }
      ++v32;
      ++v30;
      v31 += 6;
      if (v33 == v32)
      {
        v24 = v42;
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_24:
  __break(1u);
}

uint64_t LineChartInteractor.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t LineChartInteractor.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

void sub_1B81EE9F4(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  LineChartInteractor.dataPoint(for:model:size:)(a1, a2, a3, a4, a5, a6);
}

void sub_1B81EEA14(uint64_t a1@<X8>)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1[1];
  v3 = *(_QWORD *)(*v1 + 16);
  if (v2 == v3)
  {
    *(_QWORD *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return;
  }
  if (v2 >= v3)
  {
    __break(1u);
  }
  else
  {
    v4 = (_QWORD *)(*v1 + 48 * v2);
    v6 = v4[4];
    v5 = v4[5];
    v8 = v4[6];
    v7 = v4[7];
    v9 = v4[8];
    v10 = v4[9];
    v1[1] = v2 + 1;
    v11 = v1[2];
    if (!__OFADD__(v11, 1))
    {
      v1[2] = v11 + 1;
      *(_QWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = v5;
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = v7;
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 48) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return;
    }
  }
  __break(1u);
}

unint64_t sub_1B81EEAC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED5543A0;
  if (!qword_1ED5543A0)
  {
    v1 = type metadata accessor for LineChartModel();
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for LineChartModel, v1);
    atomic_store(result, (unint64_t *)&qword_1ED5543A0);
  }
  return result;
}

uint64_t method lookup function for LineChartInteractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LineChartInteractor.__allocating_init(categoryCoordinateCalculator:valueCoordinateCalculator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t FrameworkAssembly.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FrameworkAssembly.init()();
  return v0;
}

uint64_t FrameworkAssembly.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FrameworkAssembly.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for FrameworkAssembly()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FrameworkAssembly.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of Zonable.zoneManager.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Zonable.updateZones(with:view:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t getEnumTagSinglePayload for LayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LayoutOptions(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LayoutOptions()
{
  return &type metadata for LayoutOptions;
}

TeaCharts::ChartLayoutOptions __swiftcall ChartLayoutOptions.init(size:)(TeaCharts::ChartLayoutOptions size)
{
  CGFloat *v1;

  *v1 = size.size.width;
  v1[1] = size.size.height;
  return size;
}

double ChartLayoutOptions.size.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

ValueMetadata *type metadata accessor for ChartLayoutOptions()
{
  return &type metadata for ChartLayoutOptions;
}

ValueMetadata *type metadata accessor for GridLayoutOptions()
{
  return &type metadata for GridLayoutOptions;
}

double ColumnChartInteractor.dataPoint(for:model:size:)@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t ColumnChartInteractor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ColumnChartInteractor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

double sub_1B81EEC68@<D0>(_OWORD *a1@<X8>)
{
  return ColumnChartInteractor.dataPoint(for:model:size:)(a1);
}

uint64_t method lookup function for ColumnChartInteractor()
{
  return swift_lookUpClassMethod();
}

void sub_1B81EEC88()
{
  char *v0;
  uint64_t v1;
  id v2;
  double v3;
  id v4;
  SEL v5;
  uint64_t v6;

  v1 = OBJC_IVAR____TtC9TeaCharts8LineView_imageView;
  v2 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v3 = OUTLINED_FUNCTION_0_9();
  *(_QWORD *)&v0[v1] = objc_msgSend(v4, v5, v3);
  v6 = OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2840]), sel_init);

  sub_1B820EC18();
  __break(1u);
}

char *sub_1B81EED54()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  double v5;
  SEL v6;
  uint64_t v7;
  double v8;
  objc_super *v9;
  SEL v10;
  char *v11;

  v1 = OUTLINED_FUNCTION_4();
  v2 = OBJC_IVAR____TtC9TeaCharts8LineView_imageView;
  v3 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v4 = v0;
  v5 = OUTLINED_FUNCTION_0_9();
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, v6, v5);
  v7 = OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer;
  *(_QWORD *)&v4[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2840]), sel_init);

  v8 = OUTLINED_FUNCTION_0_9();
  v11 = (char *)objc_msgSendSuper2(v9, v10, v8, v4, v1);
  objc_msgSend(v11, sel_addSubview_, *(_QWORD *)&v11[OBJC_IVAR____TtC9TeaCharts8LineView_imageView]);
  return v11;
}

Swift::Void __swiftcall LineView.layoutSubviews()()
{
  void *v0;
  objc_super v1;

  v1.receiver = v0;
  v1.super_class = (Class)OUTLINED_FUNCTION_4();
  objc_msgSendSuper2(&v1, sel_layoutSubviews);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_6();
}

void sub_1B81EEEE8(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;

  if (a1)
  {
    v2 = a1;
    v3 = OUTLINED_FUNCTION_2_3();
    v4 = objc_msgSend(v3, sel_mask);

    v5 = *(void **)(v1 + OBJC_IVAR____TtC9TeaCharts8LineView_maskLayer);
    if (!v4
      || (sub_1B81EF150(),
          v6 = v5,
          v7 = v4,
          v8 = sub_1B820EA5C(),
          v7,
          v7,
          v6,
          (v8 & 1) == 0))
    {
      v9 = OUTLINED_FUNCTION_2_3();
      objc_msgSend(v9, sel_setMask_, v5);

    }
    v10 = objc_msgSend(v2, sel_CGPath);
    objc_msgSend(v5, sel_setPath_);

  }
  else
  {
    v10 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_layer);
    objc_msgSend(v10, sel_setMask_, 0);
  }

}

id LineView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void LineView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LineView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LineView()
{
  return objc_opt_self();
}

unint64_t sub_1B81EF150()
{
  unint64_t result;

  result = qword_1ED553118;
  if (!qword_1ED553118)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED553118);
  }
  return result;
}

uint64_t sub_1B81EF18C(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  char v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
    return MEMORY[0x1E0DEE9D8];
  v4 = a3;
  swift_bridgeObjectRetain();
  v5 = 0;
  v34 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v6 = v4;
    v7 = v4 + v5;
    v8 = *(_QWORD *)(v4 + v5 + 32);
    v9 = *(_BYTE *)(v4 + v5 + 40);
    v10 = *(void **)(v4 + v5 + 64);
    v11 = *(_QWORD *)(v7 + 112);
    v12 = *(_BYTE *)(v7 + 73);
    v13 = *(_BYTE *)(v7 + 72);
    v14 = *(_QWORD *)(v7 + 56);
    v15 = *(_QWORD *)(v7 + 48);
    v44 = v8;
    v45 = v9;
    v46 = v15;
    v47 = v14;
    v48 = v10;
    v49 = v13;
    v50 = v12;
    v16 = *(_OWORD *)(v7 + 96);
    v51 = *(_OWORD *)(v7 + 80);
    v52 = v16;
    v53 = v11;
    sub_1B81EE390(v8, v9);
    swift_retain();
    swift_bridgeObjectRetain();
    v17 = v10;
    a1(&v36, &v44);
    if (v35)
      break;
    v35 = 0;
    sub_1B81EE39C(v8, v9);
    swift_release();

    swift_bridgeObjectRelease();
    v18 = v37;
    if (v37)
    {
      v19 = v36;
      v31 = v38;
      v20 = v39;
      v22 = v40;
      v21 = v41;
      v32 = v43;
      v33 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v23 = v34;
      }
      else
      {
        sub_1B81EBEDC(0, *(_QWORD *)(v34 + 16) + 1, 1, v34);
        v23 = v27;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_1B81EBEDC(v24 > 1, v25 + 1, 1, v23);
        v23 = v28;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v34 = v23;
      v26 = v23 + 80 * v25;
      *(_BYTE *)(v26 + 32) = v19 & 1;
      *(_QWORD *)(v26 + 40) = v18;
      *(_QWORD *)(v26 + 48) = v31;
      *(_QWORD *)(v26 + 56) = v20;
      *(_QWORD *)(v26 + 64) = v22;
      *(_BYTE *)(v26 + 72) = v21;
      *(_BYTE *)(v26 + 73) = HIBYTE(v21) & 1;
      *(_OWORD *)(v26 + 80) = v33;
      *(_OWORD *)(v26 + 96) = v32;
    }
    v4 = v6;
    v5 += 88;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return v34;
    }
  }
  sub_1B81EE39C(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B81EF3DC(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t *__return_ptr, uint64_t *);
  BOOL v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a5;
  v8 = a1;
  v26 = 0;
  v9 = 0;
  v24 = (a5 >> 63) ^ 0x7FFFFFFFFFFFFFFFLL;
  v25 = 0;
  v10 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v11 = a3 <= a4;
    if (v6 > 0)
      v11 = a3 >= a4;
    if (v11)
    {
      if ((a3 != a4) | v26 & 1)
        return v10;
      if (v9)
      {
        v26 = 1;
        v12 = a4;
        v9 = 1;
      }
      else
      {
        if (v25 == 0x8000000000000000)
          return v10;
        v9 = 0;
        v26 = 1;
        v12 = a4;
      }
    }
    else
    {
      v13 = __OFADD__(a3, v6);
      if (v13)
        v12 = v24;
      else
        v12 = a3 + v6;
      v14 = 0x8000000000000000;
      if (!v13)
        v14 = 0;
      v25 = v14;
      v9 = !v13;
    }
    v29 = a3;
    v8(&v27, &v29);
    if (v5)
      break;
    v15 = v28;
    if (v28 != 1)
    {
      v16 = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B81EBFF0();
        v10 = v19;
      }
      v17 = *(_QWORD *)(v10 + 16);
      if (v17 >= *(_QWORD *)(v10 + 24) >> 1)
      {
        sub_1B81EBFF0();
        v10 = v20;
      }
      *(_QWORD *)(v10 + 16) = v17 + 1;
      v18 = v10 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v16;
      *(_QWORD *)(v18 + 40) = v15;
      v8 = a1;
      v6 = a5;
    }
    a3 = v12;
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B81EF5A0(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  swift_beginAccess();
  sub_1B81EFE34(v2 + 56, (uint64_t)&v9, &qword_1ED552ED8, &qword_1ED552ED0);
  if (v10)
  {
    sub_1B81DF244(&v9, (uint64_t)v11);
    v5 = v12;
    v6 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    *(_QWORD *)&v9 = a1;
    v7 = (*(uint64_t (**)(__int128 *, uint64_t, uint64_t, double))(v6 + 8))(&v9, v5, v6, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    sub_1B81EFED8((uint64_t)&v9, &qword_1ED552ED8, &qword_1ED552ED0);
    return 0;
  }
  return v7;
}

uint64_t sub_1B81EF690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, __int128 *, uint64_t, uint64_t);
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  swift_beginAccess();
  sub_1B81EFE34(v3 + 16, (uint64_t)&v12, &qword_1ED552EE8, &qword_1ED552EE0);
  if (v13)
  {
    sub_1B81DF244(&v12, (uint64_t)v14);
    v7 = v15;
    v8 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    *(_QWORD *)&v12 = a3;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    v10 = v9(a1, a2, &v12, v7, v8);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    sub_1B81EFED8((uint64_t)&v12, &qword_1ED552EE8, &qword_1ED552EE0);
    return 0;
  }
  return v10;
}

uint64_t CategoryAxisGridViewModelGenerator.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t CategoryAxisGridViewModelGenerator.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1B81EF7D8(uint64_t a1, char *a2, uint64_t *a3)
{
  return CategoryAxisGridViewModelGenerator.models(for:orientation:options:)(a1, a2, a3);
}

uint64_t CategoryAxisGridViewModelGenerator.models(for:orientation:options:)(uint64_t a1, char *a2, uint64_t *a3)
{
  uint64_t v3;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v5 = *a2;
  v6 = *a3;
  v7 = (void *)a3[1];
  v8 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for CategoryAxis() + 24));
  v13 = v3;
  v14 = a1;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v18 = v7;
  v9 = v7;
  swift_bridgeObjectRetain();
  v10 = sub_1B81EF18C((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1B81EFDE8, (uint64_t)&v12, v8);

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B81EF89C(uint64_t a1, _QWORD *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7)
{
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, double);
  uint64_t v26;
  char v27;
  double v28;
  void *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  char v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _QWORD *v45;
  uint64_t v46;
  _BYTE v47[8];

  v10 = a4 & 1;
  v11 = *(uint64_t *)a1;
  v12 = *(_BYTE *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 80);
  v42 = a6;
  v43 = v13;
  if ((v12 & 1) == 0)
  {
    v19 = *(_QWORD *)(v11 + 16);
    if (!v19)
      return MEMORY[0x1E0DEE9D8];
    v45 = a2 + 2;
    v46 = a3;
    swift_retain();
    sub_1B81EE390(v11, 0);
    v44 = v10 ^ 1;
    v41 = v11;
    v20 = (uint64_t *)(v11 + 40);
    v18 = MEMORY[0x1E0DEE9D8];
    do
    {
      v21 = *(v20 - 1);
      v22 = *v20;
      v24 = a2[5];
      v23 = a2[6];
      __swift_project_boxed_opaque_existential_1(v45, v24);
      v47[0] = v44;
      v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, double))(v23 + 8);
      swift_bridgeObjectRetain();
      *(double *)&v26 = COERCE_DOUBLE(v25(v21, v22, v46, v47, v24, v23, a7));
      if ((v27 & 1) != 0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v28 = *(double *)&v26;
        if (v43)
        {
          swift_retain();
          v29 = (void *)sub_1B81EF690(v21, v22, v42);
          swift_bridgeObjectRelease();
          swift_release();
        }
        else
        {
          swift_bridgeObjectRelease();
          v29 = 0;
        }
        v30 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B81EBFF0();
          v18 = v33;
        }
        v31 = *(_QWORD *)(v18 + 16);
        if (v31 >= *(_QWORD *)(v18 + 24) >> 1)
        {
          sub_1B81EBFF0();
          v18 = v34;
        }
        *(_QWORD *)(v18 + 16) = v31 + 1;
        v32 = v18 + 16 * v31;
        *(double *)(v32 + 32) = v28 / a7;
        *(_QWORD *)(v32 + 40) = v29;

      }
      v20 += 2;
      --v19;
    }
    while (v19);
    sub_1B81EE39C(v41, 0);
    swift_release();
    return v18;
  }
  sub_1B81E2E10();
  sub_1B81E74B8();
  swift_retain();
  sub_1B820E978();
  sub_1B820E990();
  result = sub_1B820E984();
  if ((~v11 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (*(double *)&v11 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(double *)&v11 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((uint64_t)*(double *)&v11)
  {
    MEMORY[0x1E0C80A78](result);
    v35[2] = a3;
    v35[3] = a2;
    v36 = v10;
    v37 = a7;
    v38 = a5;
    v39 = v43;
    v40 = v42;
    v18 = sub_1B81EF3DC((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1B81EFE18, (uint64_t)v35, 0, v16, v17);
    swift_release();
    return v18;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1B81EFBA0@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, char a3@<W3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  double v20;
  uint64_t v21;
  uint64_t result;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a5;
  sub_1B81E2E10();
  sub_1B820E714();
  v14 = v24;
  v13 = v25;
  v15 = a2 + 2;
  v16 = a2[5];
  v17 = a2[6];
  __swift_project_boxed_opaque_existential_1(v15, v16);
  LOBYTE(v24) = (a3 & 1) == 0;
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, double))(v17 + 8))(v14, v25, a1, &v24, v16, v17, a7);
  if ((v19 & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v23 = 0.0;
    v21 = 1;
  }
  else
  {
    v20 = *(double *)&v18;
    if (a4)
      v21 = sub_1B81EF690(v14, v13, v26);
    else
      v21 = 0;
    result = swift_bridgeObjectRelease();
    v23 = v20 / a7;
  }
  *(double *)a6 = v23;
  *(_QWORD *)(a6 + 8) = v21;
  return result;
}

id sub_1B81EFCC4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>, double a8@<D0>)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id result;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v9 = *((_BYTE *)a1 + 8);
  v10 = a1[2];
  v11 = a1[3];
  v12 = (void *)a1[4];
  v13 = a4 & 1;
  v14 = *((unsigned __int8 *)a1 + 40);
  v15 = *((unsigned __int8 *)a1 + 41);
  v16 = a1[6];
  v17 = a1[7];
  v18 = a1[8];
  v19 = a1[9];
  v20 = a1[10];
  v25 = *a1;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v21 = sub_1B81EF89C((uint64_t)&v25, a2, a3, a4 & 1, a5, a6, a8);
  if (*(_QWORD *)(v21 + 16))
  {
    v22 = 256;
    if (!v15)
      v22 = 0;
    v23 = v22 | v14;
    *a7 = v13;
    a7[1] = v21;
    swift_bridgeObjectRetain();
    result = v12;
  }
  else
  {
    result = (id)swift_bridgeObjectRelease();
    v10 = 0;
    v12 = 0;
    v23 = 0;
    *a7 = 0;
    a7[1] = 0;
    v11 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  a7[2] = v10;
  a7[3] = v11;
  a7[4] = v12;
  a7[5] = v23;
  a7[6] = v16;
  a7[7] = v17;
  a7[8] = v18;
  a7[9] = v19;
  return result;
}

id sub_1B81EFDE8()
{
  double v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v0 = OUTLINED_FUNCTION_0_7();
  return sub_1B81EFCC4(v1, v2, v3, v4, v5, v6, v7, v0);
}

_UNKNOWN **sub_1B81EFE00()
{
  return &protocol witness table for CategoryAxis;
}

uint64_t method lookup function for CategoryAxisGridViewModelGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B81EFE18()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  _QWORD *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_0_7();
  return sub_1B81EFBA0(v2, v3, v4, v5, *(_QWORD *)(v0 + 64), v6, v1);
}

uint64_t sub_1B81EFE34(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v6;

  sub_1B81EFE84(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_1B81EFE84(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1B81E0300(255, a3);
    v4 = sub_1B820EA74();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1B81EFED8(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1B81EFE84(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1B81EFF14(uint64_t a1, uint64_t a2, id a3, double *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18[3];

  v5 = v4;
  v9 = a4[2];
  v10 = a4[3];
  objc_msgSend(a3, sel_setFrame_, *a4, a4[1], v9, v10);
  v11 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v11, sel_scale);

  __swift_project_boxed_opaque_existential_1(v5 + 2, v5[5]);
  sub_1B81F149C();
  swift_allocObject();
  sub_1B820E78C();
  objc_msgSend(a3, sel_setAlpha_, 0.0);
  __swift_project_boxed_opaque_existential_1(v5 + 17, v5[20]);
  sub_1B81E23A4(0, (unint64_t *)&qword_1ED555360);
  v12 = (void *)sub_1B820EA20();
  sub_1B820E6A8();

  v13 = (void *)sub_1B820E5DC();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_1B81F153C;
  *(_QWORD *)(v15 + 24) = v14;
  v16 = a3;
  sub_1B820E768();
  swift_release();
  swift_release();

  swift_release();
  *(double *)v18 = v9;
  *(double *)&v18[1] = v10;
  sub_1B81F0C34(a2, a1, (uint64_t)v16, v18);
  return swift_release();
}

uint64_t sub_1B81F013C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v29 = a5;
  v26 = a4;
  v27 = a2;
  v8 = type metadata accessor for LineChartModel();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B81E87EC();
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = a1;
  v31 = a2;
  v32 = a3;
  sub_1B81F15C4();
  sub_1B820E7A4();
  v28 = sub_1B820E5DC();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v26, v13);
  sub_1B81EA224(v29, (uint64_t)v11);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = (v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (*(unsigned __int8 *)(v9 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v17, v16, v13);
  v21 = v27;
  *(_QWORD *)(v20 + v18) = v27;
  sub_1B81EA3B0((uint64_t)v11, v20 + v19);
  swift_retain();
  v22 = v21;
  v23 = (void *)v28;
  v24 = sub_1B820E768();
  swift_release();

  swift_release();
  return v24;
}

uint64_t sub_1B81F030C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, _QWORD);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  char v26;
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
  void (*v38)(_QWORD *, _QWORD);
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t i;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v63[4];
  uint64_t v64;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD **)(a2 + 184);
  swift_beginAccess();
  v7 = v6[5];
  v59 = v6[4];
  v60 = v6[6];
  v58 = v6[7];
  v56 = v6[8];
  v57 = v6[9];
  sub_1B81F1838(v59, v7);
  sub_1B81E87EC();
  sub_1B81F1444(&qword_1ED552C20, MEMORY[0x1E0DB3DC0]);
  sub_1B820E978();
  sub_1B820E990();
  if (v64 == v63[0])
  {
    v8 = a4;
    if (!v7)
      goto LABEL_30;
    v9 = v7;
    v10 = 0;
    v11 = 0;
    v12 = v59;
    goto LABEL_25;
  }
  v13 = (void (*)(_QWORD *, _QWORD))sub_1B820E9A8();
  v11 = *v14;
  v15 = v14[1];
  v16 = v14[2];
  v17 = v14[3];
  v18 = v14[5];
  v54 = v14[4];
  swift_bridgeObjectRetain();
  v55 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v63, 0);
  v9 = v7;
  if (!v7)
  {
    v8 = a4;
    if (!v15)
      goto LABEL_30;
    v12 = v59;
    v10 = v15;
    goto LABEL_25;
  }
  if (!v15)
  {
    v10 = 0;
    v12 = v59;
LABEL_25:
    sub_1B81F1874(v12, v9);
    v30 = v11;
    v31 = v10;
LABEL_26:
    sub_1B81F1874(v30, v31);
    swift_beginAccess();
    sub_1B81F18B0();
    sub_1B820E834();
    swift_endAccess();
    sub_1B820E978();
    sub_1B820E990();
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    if (v64 != v63[0])
    {
      v38 = (void (*)(_QWORD *, _QWORD))sub_1B820E9A8();
      v40 = *v39;
      v33 = v39[1];
      v41 = v39[2];
      v35 = v39[3];
      v36 = v39[4];
      v37 = v39[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v38(v63, 0);
      v34 = v41;
      v32 = v40;
    }
    v42 = v6[4];
    v43 = v6[5];
    v6[4] = v32;
    v6[5] = v33;
    v6[6] = v34;
    v6[7] = v35;
    v6[8] = v36;
    v6[9] = v37;
    goto LABEL_29;
  }
  v19 = v59;
  v20 = v59 == v11 && v7 == v15;
  v21 = v16;
  v22 = v11;
  if (!v20)
  {
    v23 = sub_1B820ECCC();
    v9 = v7;
    v19 = v59;
    if ((v23 & 1) == 0)
      goto LABEL_39;
  }
  if (v60 != v21 || v58 != v55)
  {
    v25 = v9;
    v26 = sub_1B820ECCC();
    v9 = v25;
    v19 = v59;
    if ((v26 & 1) == 0)
    {
LABEL_39:
      v51 = v15;
      v28 = v9;
      sub_1B81F1838(v19, v9);
      sub_1B81F1874(v22, v51);
      goto LABEL_40;
    }
  }
  v53 = v15;
  if (v56 != v54 || v57 != v18)
  {
    v28 = v9;
    v29 = v19;
    v52 = sub_1B820ECCC();
    sub_1B81F1838(v29, v28);
    sub_1B81F1874(v22, v53);
    if ((v52 & 1) != 0)
      goto LABEL_42;
LABEL_40:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = v59;
    v31 = v28;
    goto LABEL_26;
  }
  v28 = v9;
  sub_1B81F1838(v19, v9);
  sub_1B81F1874(v22, v53);
LABEL_42:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = v59;
  v43 = v28;
LABEL_29:
  sub_1B81F1874(v42, v43);
  v8 = a4;
LABEL_30:
  v44 = *(_QWORD *)(v8 + OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews);
  if (v44 >> 62)
    goto LABEL_44;
  v45 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (; v45; v45 = sub_1B820EC24())
  {
    for (i = 4; ; ++i)
    {
      v47 = (v44 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x1BCCAE340](i - 4, v44)
          : (char *)*(id *)(v44 + 8 * i);
      v48 = v47;
      v49 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      sub_1B81F0884(i - 4, v47, v5, a5);

      if (v49 == v45)
        return swift_bridgeObjectRelease_n();
    }
    __break(1u);
LABEL_44:
    swift_bridgeObjectRetain_n();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_1B81F0884(unint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  unint64_t v21;

  v8 = type metadata accessor for LineChartModel();
  MEMORY[0x1E0C80A78](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v20 = a3;
  v21 = a1;
  v11 = swift_bridgeObjectRetain();
  sub_1B81ED538(v11, (void (*)(uint64_t, uint64_t, id))sub_1B81F1914);
  swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)(a3 + 16) <= a1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(_QWORD *)(a3 + 16 * a1 + 32))
    objc_msgSend(*(id *)(*(_QWORD *)&a2[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView]+ OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_setImage_);
  sub_1B81EA224(a4, (uint64_t)v10);
  v12 = *(_QWORD *)(*(_QWORD *)&v10[*(int *)(v8 + 20)] + 16);
  sub_1B81F191C((uint64_t)v10, (void (*)(_QWORD))type metadata accessor for LineChartModel);
  if (v12 > a1)
  {
    v13 = LineSeriesAccessibilityElementProvider.seriesContainerElement(for:in:chartModel:)(a1, a2, a4);
    objc_msgSend(v13, sel_setIsAccessibilityElement_, 0);
    v14 = *(_QWORD *)(a4 + *(int *)(v8 + 20));
    if (*(_QWORD *)(v14 + 16) > a1)
    {
      v15 = v14 + 24 * a1;
      v16 = *(_QWORD *)(v15 + 32);
      v17 = *(_QWORD *)(v15 + 40);
      swift_bridgeObjectRetain();
      sub_1B81F1950(v16, v17, v13);
      sub_1B81E5FD4(0, &qword_1ED553190, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1B82103A0;
      *(_QWORD *)(v18 + 56) = type metadata accessor for LineSeriesAccessibilityElement();
      *(_QWORD *)(v18 + 32) = v13;
      sub_1B8207F04(v18, a2);
      return;
    }
LABEL_11:
    __break(1u);
  }
}

void sub_1B81F0AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v8;
  id v9;

  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(_QWORD *)(a4 + 16) <= a5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v8 = *(_QWORD *)(a4 + 16 * a5 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = (id)sub_1B820AA64(a1, a2, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC9TeaCharts8LineView_imageView), sel_setImage_, v9);

  }
}

void sub_1B81F0B68(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  v6[4] = sub_1B81F1580;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B81E45C8;
  v6[3] = &block_descriptor;
  v4 = _Block_copy(v6);
  v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t sub_1B81F0C34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void (*v39)(_QWORD *, _QWORD);
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  _QWORD v77[3];

  v61 = a2;
  v60 = a1;
  sub_1B81F13D4();
  v59 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B81E87EC();
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9);
  v73 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v58 = (char *)&v52 - v14;
  v15 = *a4;
  v16 = a4[1];
  v53 = *(_QWORD *)(a3 + OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews);
  if (v53 >> 62)
    goto LABEL_25;
  v17 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v17)
    return swift_bridgeObjectRelease();
  while (1)
  {
    result = type metadata accessor for LineChartModel();
    if (v17 < 1)
      break;
    v19 = 0;
    v20 = 0;
    v57 = *(int *)(result + 20);
    v54 = (_QWORD *)(v62 + 96);
    v56 = v53 & 0xC000000000000001;
    v52 = v53 + 32;
    v70 = v8;
    v69 = v11;
    v55 = v17;
    while (1)
    {
      v21 = v56 ? (id)MEMORY[0x1BCCAE340](v19, v53) : *(id *)(v52 + 8 * v19);
      v22 = v21;
      v23 = *(_QWORD *)(v61 + v57);
      if (v19 >= *(_QWORD *)(v23 + 16))
        break;
      v67 = v20;
      v68 = v19;
      v24 = (_QWORD *)(v23 + 24 * v19);
      v25 = v24[5];
      v63 = v24[4];
      v26 = v24[6];
      v72 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v72(v58, v60, v10);
      v76[0] = MEMORY[0x1E0DEE9D8];
      sub_1B81F1444(&qword_1ED552C18, MEMORY[0x1E0DB3DB8]);
      v27 = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B820E8A0();
      v71 = &v27[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_zoneLineViews];
      OUTLINED_FUNCTION_5_1();
      sub_1B81F1444(&qword_1ED552C20, MEMORY[0x1E0DB3DC0]);
      OUTLINED_FUNCTION_0_10();
      v66 = v27;
      v65 = v25;
      v64 = v26;
      if (v22 != (void *)v77[0])
      {
        do
        {
          v39 = (void (*)(_QWORD *, _QWORD))sub_1B820E9A8();
          v41 = *v40;
          v42 = v40[1];
          v43 = v40[2];
          v44 = v40[3];
          v45 = v40[5];
          v74 = v40[4];
          v75 = v43;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v39(v77, 0);
          v46 = v73;
          v72(v73, (uint64_t)v8, v10);
          sub_1B820E99C();
          (*(void (**)(char *, uint64_t))(v11 + 8))(v46, v10);
          if (*(_QWORD *)(*(_QWORD *)v71 + 16))
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1B81E2E68();
            if ((v47 & 1) != 0)
            {
              OUTLINED_FUNCTION_3();
              swift_bridgeObjectRelease();
              v48 = v76[0];
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_1B81E757C(0, *(_QWORD *)(v48 + 16) + 1, 1);
                v48 = v76[0];
              }
              v50 = *(_QWORD *)(v48 + 16);
              v49 = *(_QWORD *)(v48 + 24);
              if (v50 >= v49 >> 1)
              {
                sub_1B81E757C((char *)(v49 > 1), v50 + 1, 1);
                v48 = v76[0];
              }
              *(_QWORD *)(v48 + 16) = v50 + 1;
              v51 = (_QWORD *)(v48 + 48 * v50);
              v51[4] = v41;
              v51[5] = v42;
              v51[6] = v75;
              v51[7] = v44;
              v51[8] = v74;
              v51[9] = v45;
              v8 = v70;
              v11 = v69;
              goto LABEL_22;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
LABEL_22:
          OUTLINED_FUNCTION_0_10();
        }
        while (v41 != v77[0]);
      }
      v19 = v68 + 1;
      sub_1B81F191C((uint64_t)v8, (void (*)(_QWORD))sub_1B81F13D4);
      v28 = v66;

      v29 = v76[0];
      __swift_project_boxed_opaque_existential_1(v54, *(_QWORD *)(v62 + 120));
      v30 = sub_1B81E6100();
      v31 = sub_1B81E613C();
      v32 = (uint64_t)v73;
      MEMORY[0x1BCCADE78](v29, &type metadata for CategoryZone, v30, v31);
      v77[0] = v63;
      v77[1] = v65;
      v77[2] = v64;
      v76[0] = v15;
      v76[1] = v16;
      v33 = (void *)sub_1B820C8E8(v32, (uint64_t)v77, (uint64_t)v76);
      v75 = v34;
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v32, v10);
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      v35 = OUTLINED_FUNCTION_5_1();
      MEMORY[0x1E0C80A78](v35);
      v36 = v75;
      *(&v52 - 2) = (unint64_t)v33;
      *(&v52 - 1) = v36;
      v37 = swift_bridgeObjectRetain();
      v20 = v67;
      sub_1B81ED538(v37, sub_1B81F1484);
      swift_bridgeObjectRelease();
      v38 = *(id *)&v28[OBJC_IVAR____TtC9TeaCharts14LineSeriesView_defaultLineView];
      sub_1B81EEEE8(v33);

      OUTLINED_FUNCTION_3();
      if (v19 == v55)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v17 = sub_1B820EC24();
    if (!v17)
      return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_1B81F12B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  id v10;

  swift_bridgeObjectRetain();
  v9 = (void *)sub_1B820AA64(a1, a2, a5);
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = v9;
    sub_1B81EEEE8(v9);

    objc_msgSend(a3, sel_setHidden_, 0);
  }
  else
  {
    sub_1B81EEEE8(0);
    objc_msgSend(a3, sel_setHidden_, 1);
  }
}

uint64_t sub_1B81F1370()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B81F13B4()
{
  sub_1B81F1370();
  return swift_deallocClassInstance();
}

void sub_1B81F13D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552BF0)
  {
    sub_1B81E87EC();
    sub_1B81F1444(&qword_1ED552C20, MEMORY[0x1E0DB3DC0]);
    v0 = sub_1B820EBE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552BF0);
  }
}

uint64_t sub_1B81F1444(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1B81E87EC();
    result = MEMORY[0x1BCCAE964](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1B81F1484(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_1B81F12B4(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_1B81F148C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1B81E9208(a1, a2, *(double *)(v4 + 32), *(double *)(v4 + 40), *(double *)(v4 + 48), a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

void sub_1B81F149C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552C38)
  {
    sub_1B81E5FD4(255, &qword_1ED5530E0, (uint64_t)&type metadata for LineChartImages, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v0 = sub_1B820E798();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552C38);
  }
}

uint64_t sub_1B81F1508()
{
  uint64_t v0;

  return sub_1B81F013C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1B81F1518()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B81F153C()
{
  uint64_t v0;

  sub_1B81F0B68(*(void **)(v0 + 16));
}

uint64_t sub_1B81F1544()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81F1568(uint64_t a1)
{
  uint64_t v1;

  return sub_1B820D3B0(a1, *(uint64_t (**)(void))(v1 + 16));
}

id sub_1B81F1580()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
}

uint64_t sub_1B81F1594()
{
  return sub_1B820E720();
}

void sub_1B81F15C4()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED553108)
  {
    sub_1B81E23A4(255, (unint64_t *)&qword_1ED555368);
    sub_1B81E5FD4(255, &qword_1ED5530E0, (uint64_t)&type metadata for LineChartImages, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED553108);
  }
}

uint64_t sub_1B81F1658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);

  sub_1B81E87EC();
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = type metadata accessor for LineChartModel();
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (v5 + v7 + 8) & ~v7;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);

  sub_1B81E2E10();
  OUTLINED_FUNCTION_1_7();
  v9(v0 + v8);
  type metadata accessor for CategoryAxis();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_1();
  v10 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(v0 + v8 + *(int *)(v10 + 52) + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v11 = v0 + v8 + *(int *)(v6 + 32);
  sub_1B820E57C();
  OUTLINED_FUNCTION_1_7();
  v12(v11);
  return swift_deallocObject();
}

uint64_t sub_1B81F17A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  sub_1B81E87EC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LineChartModel() - 8) + 80);
  return sub_1B81F030C(a1, *(_QWORD *)(v1 + 16), v1 + v5, *(_QWORD *)(v1 + v6), v1 + ((v6 + v7 + 8) & ~v7));
}

uint64_t sub_1B81F1838(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B81F1874(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1B81F18B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553298)
  {
    type metadata accessor for LineSeriesAccessibilityElement();
    v0 = sub_1B820E840();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553298);
  }
}

void sub_1B81F1914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1B81F0AA0(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_1B81F191C(uint64_t a1, void (*a2)(_QWORD))
{
  void (*v3)(uint64_t);

  a2(0);
  OUTLINED_FUNCTION_1_7();
  v3(a1);
  return a1;
}

void sub_1B81F1950(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1B820E864();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAccessibilityLabel_, v4);

}

uint64_t initializeWithCopy for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(_OWORD *)(a2 + 8);
  v8 = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v8;
  *(_OWORD *)(a1 + 8) = v7;
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for GridLabelLayoutAttributes(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridLabelLayoutAttributes(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 41))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GridLabelLayoutAttributes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridLabelLayoutAttributes()
{
  return &type metadata for GridLabelLayoutAttributes;
}

uint64_t ChartModelFactory.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t ChartModelFactory.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t ChartModelFactory.model(for:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t (*v2)(__int128 *);
  __int128 v4;

  v2 = *(uint64_t (**)(__int128 *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

uint64_t ChartModelFactory.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ChartModelFactory.__deallocating_deinit()
{
  ChartModelFactory.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B81F1C1C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_1B81F1C24(__int128 *a1)
{
  return ChartModelFactory.model(for:)(a1);
}

uint64_t dispatch thunk of ChartModelFactoryType.model(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for ChartModelFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ChartModelFactory.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t Series.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_2_4();
  return v1;
}

uint64_t Series.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1B820E894();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_4();
  sub_1B820E930();
  return swift_bridgeObjectRelease();
}

BOOL sub_1B81F1D04(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1B81F1D14()
{
  return sub_1B820ED38();
}

uint64_t sub_1B81F1D38(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1B820ECCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E696F70 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1B820ECCC();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B81F1E0C()
{
  return 2;
}

uint64_t sub_1B81F1E14()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

uint64_t sub_1B81F1E58()
{
  return 0;
}

uint64_t sub_1B81F1E64(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73746E696F70;
  else
    return 1701667182;
}

BOOL sub_1B81F1E90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B81F1D04(*a1, *a2);
}

uint64_t sub_1B81F1EA8()
{
  return sub_1B81F1E14();
}

uint64_t sub_1B81F1EBC()
{
  return sub_1B81F1D14();
}

uint64_t sub_1B81F1ED0()
{
  sub_1B820ED2C();
  sub_1B81F1D14();
  return sub_1B820ED50();
}

uint64_t sub_1B81F1F18()
{
  char *v0;

  return sub_1B81F1E64(*v0);
}

uint64_t sub_1B81F1F2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B81F1D38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B81F1F5C()
{
  return sub_1B81F1E58();
}

uint64_t sub_1B81F1F84@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B81F1E0C();
  *a1 = result;
  return result;
}

uint64_t sub_1B81F1FB4(uint64_t a1)
{
  MEMORY[0x1BCCAE964](&unk_1B82106B0, a1);
  return sub_1B820ED74();
}

uint64_t sub_1B81F1FE8(uint64_t a1)
{
  MEMORY[0x1BCCAE964](&unk_1B82106B0, a1);
  return sub_1B820ED80();
}

void Series.encode(to:)()
{
  OUTLINED_FUNCTION_3_4();
}

void sub_1B81F2054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  MEMORY[0x1BCCAE964](&unk_1B82106B0, a1);
  sub_1B820EC90();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&a9 - v14;
  *(_QWORD *)(v12 - 136) = *v9;
  *(_QWORD *)(v12 - 184) = v9[2];
  v16 = v10[3];
  v17 = v10;
  v19 = v18;
  __swift_project_boxed_opaque_existential_1(v17, v16);
  sub_1B820ED68();
  *(_BYTE *)(v12 - 112) = 0;
  v20 = *(_QWORD *)(v12 - 128);
  sub_1B820EC6C();
  if (!v20)
  {
    *(_QWORD *)(v12 - 112) = *(_QWORD *)(v12 - 184);
    *(_BYTE *)(v12 - 65) = 1;
    v21 = sub_1B820E924();
    *(_QWORD *)(v12 - 120) = *(_QWORD *)(v12 - 160);
    MEMORY[0x1BCCAE964](MEMORY[0x1E0DEAF10], v21, v12 - 120);
    sub_1B820EC84();
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v19);
  OUTLINED_FUNCTION_1_8();
}

uint64_t Series.hashValue.getter()
{
  sub_1B820ED2C();
  Series.hash(into:)();
  return sub_1B820ED50();
}

void Series.init(from:)()
{
  OUTLINED_FUNCTION_3_4();
}

void sub_1B81F221C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  MEMORY[0x1BCCAE964](&unk_1B82106B0, a1);
  *(_QWORD *)(v3 - 128) = sub_1B820EC60();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x1E0C80A78](v4);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_1B820ED5C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    *(_QWORD *)(v3 - 152) = v2;
    v5 = *(_QWORD **)(v3 - 144);
    v6 = *(_QWORD *)(v3 - 136);
    *(_BYTE *)(v3 - 112) = 0;
    v7 = sub_1B820EC3C();
    v9 = v8;
    *(_QWORD *)(v3 - 160) = v7;
    v10 = sub_1B820E924();
    *(_BYTE *)(v3 - 65) = 1;
    *(_QWORD *)(v3 - 120) = v6;
    swift_bridgeObjectRetain();
    MEMORY[0x1BCCAE964](MEMORY[0x1E0DEAF40], v10, v3 - 120);
    sub_1B820EC54();
    OUTLINED_FUNCTION_0_11();
    v11 = *(_QWORD *)(v3 - 112);
    *v5 = *(_QWORD *)(v3 - 160);
    v5[1] = v9;
    v5[2] = v11;
    OUTLINED_FUNCTION_2_4();
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 152));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_8();
}

uint64_t sub_1B81F23B4()
{
  sub_1B820ED2C();
  Series.hash(into:)();
  return sub_1B820ED50();
}

void sub_1B81F23F4()
{
  Series.init(from:)();
}

void sub_1B81F2414()
{
  Series.encode(to:)();
}

uint64_t sub_1B81F2428(_QWORD *a1, _QWORD *a2)
{
  return static Series.== infix(_:_:)(a1, a2);
}

void type metadata accessor for Series.CodingKeys()
{
  JUMPOUT(0x1BCCAE91CLL);
}

void sub_1B81F2444()
{
  JUMPOUT(0x1BCCAE964);
}

_QWORD *sub_1B81F2458(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_4();
  return a1;
}

_QWORD *sub_1B81F2490(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B81F24F4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B81F2538()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for Orientation(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_1B81F25C8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81F2614 + 4 * byte_1B82104DD[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B81F2648 + 4 * asc_1B82104D8[v4]))();
}

uint64_t sub_1B81F2648(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F2650(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81F2658);
  return result;
}

uint64_t sub_1B81F2664(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81F266CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B81F2670(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F2678(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1B81F2684()
{
  JUMPOUT(0x1BCCAE964);
}

void sub_1B81F2694()
{
  JUMPOUT(0x1BCCAE964);
}

void sub_1B81F26A4()
{
  JUMPOUT(0x1BCCAE964);
}

void sub_1B81F26B4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1B81F2730(v1);
}

void sub_1B81F26E0()
{
  _QWORD *v0;
  id *v1;
  id v2;

  v1 = (id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8));
  OUTLINED_FUNCTION_12();
  v2 = *v1;
  OUTLINED_FUNCTION_50();
}

void sub_1B81F2730(void *a1)
{
  _QWORD *v1;
  void **v3;
  void *v4;

  v3 = (void **)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE8));
  OUTLINED_FUNCTION_12();
  v4 = *v3;
  *v3 = a1;

  OUTLINED_FUNCTION_50();
}

void sub_1B81F2784(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  OUTLINED_FUNCTION_29(*v1);
  OUTLINED_FUNCTION_12();
  v3 = OUTLINED_FUNCTION_28();
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
  OUTLINED_FUNCTION_24();
}

void sub_1B81F27E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  OUTLINED_FUNCTION_29(*v1);
  OUTLINED_FUNCTION_12();
  v3 = OUTLINED_FUNCTION_28();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_24();
}

void sub_1B81F2844()
{
  _QWORD *v0;
  id v1;

  v1 = *(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8));
  OUTLINED_FUNCTION_0();
}

void sub_1B81F287C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0xF8);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t ChartViewController.chartLayoutAttributes.getter()
{
  return swift_retain();
}

void sub_1B81F28C0()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1B81F2934(v0);
}

void sub_1B81F28E8()
{
  OUTLINED_FUNCTION_12();
  swift_retain();
  OUTLINED_FUNCTION_50();
}

void sub_1B81F2934(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;

  v3 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x108));
  OUTLINED_FUNCTION_12();
  *v3 = a1;
  swift_release();
  OUTLINED_FUNCTION_50();
}

uint64_t (*sub_1B81F2988())()
{
  OUTLINED_FUNCTION_12();
  return j__swift_endAccess;
}

void ChartViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;

  objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  OUTLINED_FUNCTION_0();
}

void ChartViewController.init(coder:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[7];

  v2 = v0;
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *MEMORY[0x1E0DEEDD8] & *v0;
  v5 = *(_QWORD *)(v4 + 0x50);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v11 - v7;
  *(_QWORD *)((char *)v2 + *(_QWORD *)(v4 + 232)) = 0;
  __swift_storeEnumTagSinglePayload((uint64_t)v2 + *(_QWORD *)((*v3 & *v2) + 0xF0), 1, 1, v5);
  *(_QWORD *)((char *)v2 + *(_QWORD *)((*v3 & *v2) + 0xF8)) = 0;
  v9 = *(_QWORD *)((*v3 & *v2) + 0x100);
  sub_1B81F2BB8();
  memset(v11, 0, sizeof(v11));
  OUTLINED_FUNCTION_52();
  *(_QWORD *)((char *)v2 + v9) = sub_1B820E684();
  v10 = *(_QWORD *)((*v3 & *v2) + 0x108);
  sub_1B820E69C();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v1);
  *(_QWORD *)((char *)v2 + v10) = sub_1B820E678();

  sub_1B820EC18();
  __break(1u);
}

void sub_1B81F2BB8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5532E8)
  {
    sub_1B81F2C0C();
    v0 = sub_1B820E69C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5532E8);
  }
}

void sub_1B81F2C0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5538A8)
  {
    v0 = sub_1B820EA74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5538A8);
  }
}

void sub_1B81F2C54(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  ChartViewController.init(coder:)();
}

void ChartViewController.__allocating_init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  ChartViewController.init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)();
}

void ChartViewController.init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  _QWORD *v0;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[6];
  __int128 v54;

  OUTLINED_FUNCTION_22();
  v44 = v2;
  v42 = v3;
  v46 = v5;
  v47 = v4;
  v48 = v7;
  v49 = v6;
  v9 = v8;
  v39 = v8;
  v10 = *MEMORY[0x1E0DEEDD8] & *v0;
  v43 = *(_QWORD *)(v10 + 0x80);
  v41 = *(_QWORD *)(v10 + 80);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v36 - v12;
  *(_QWORD *)((char *)v0 + *(_QWORD *)(v10 + 232)) = 0;
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_23((uint64_t)v0 + *(_QWORD *)(v14 + 240));
  OUTLINED_FUNCTION_33();
  *(_QWORD *)((char *)v0 + *(_QWORD *)(v15 + 248)) = 0;
  OUTLINED_FUNCTION_33();
  v17 = *(_QWORD *)(v16 + 256);
  sub_1B81F2BB8();
  v54 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  memset(v53, 0, sizeof(v53));
  OUTLINED_FUNCTION_52();
  v18 = v0;
  *(_QWORD *)((char *)v0 + v17) = sub_1B820E684();
  OUTLINED_FUNCTION_3_5();
  v20 = *(_QWORD *)(v19 + 264);
  sub_1B820E69C();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v1);
  *(_QWORD *)&v18[v20] = sub_1B820E678();
  OUTLINED_FUNCTION_3_5();
  v22 = &v18[*(_QWORD *)(v21 + 176)];
  v45 = *(_QWORD *)(v10 + 88);
  v40 = *(_QWORD *)(v45 - 8);
  (*(void (**)(char *, uint64_t))(v40 + 16))(v22, v9);
  OUTLINED_FUNCTION_3_5();
  v24 = &v18[*(_QWORD *)(v23 + 184)];
  v25 = *(_QWORD *)(v10 + 96);
  v38 = *(_QWORD *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v24, v49, v25);
  OUTLINED_FUNCTION_3_5();
  v27 = (uint64_t)&v18[*(_QWORD *)(v26 + 192)];
  v28 = *(_QWORD *)(v10 + 104);
  v37 = *(_QWORD *)(v28 - 8);
  OUTLINED_FUNCTION_53(v27, v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16));
  OUTLINED_FUNCTION_3_5();
  sub_1B81E51C4(v47, (uint64_t)&v18[*(_QWORD *)(v29 + 200)]);
  OUTLINED_FUNCTION_3_5();
  sub_1B81E51C4(v46, (uint64_t)&v18[*(_QWORD *)(v30 + 208)]);
  OUTLINED_FUNCTION_3_5();
  v32 = *(_QWORD *)(v10 + 112);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(&v18[*(_QWORD *)(v31 + 216)], v42, v32);
  OUTLINED_FUNCTION_3_5();
  v34 = *(_QWORD *)(v10 + 120);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(&v18[*(_QWORD *)(v33 + 224)], v44, v34);

  v35 = *(_QWORD *)(v10 + 168);
  *(_QWORD *)&v50 = v41;
  *((_QWORD *)&v50 + 1) = v45;
  *(_QWORD *)&v51 = v25;
  *((_QWORD *)&v51 + 1) = v28;
  *(_QWORD *)&v52 = v32;
  *((_QWORD *)&v52 + 1) = v34;
  v53[0] = v43;
  *(_OWORD *)&v53[1] = *(_OWORD *)(v10 + 136);
  *(_OWORD *)&v53[3] = *(_OWORD *)(v10 + 152);
  v53[5] = v35;
  OUTLINED_FUNCTION_41();
}

id sub_1B81F2F80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void (*v10)(_QWORD, uint64_t);
  void (*v11)(_QWORD, uint64_t);
  uint64_t (*v12)(uint64_t, _QWORD);

  *(_QWORD *)(v8 - 224) = v1;
  *(_QWORD *)(v8 - 216) = a1;
  v9 = objc_msgSendSuper2((objc_super *)(v8 - 224), sel_initWithNibName_bundle_, 0, 0);
  OUTLINED_FUNCTION_37(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v8 - 256));
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v8 - 248));
  OUTLINED_FUNCTION_35();
  v10(*(_QWORD *)(v8 - 240), v4);
  OUTLINED_FUNCTION_35();
  v11(*(_QWORD *)(v8 - 232), v3);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_55(*(_QWORD *)(v8 - 312), v12);
  return v9;
}

void ChartViewController.__deallocating_deinit()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, *MEMORY[0x1E0DC44D0], 0);

  OUTLINED_FUNCTION_41();
}

id sub_1B81F30BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 48) = v1;
  *(_QWORD *)(v2 - 40) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 48), sel_dealloc);
}

void sub_1B81F30E4(void *a1)
{
  id v1;

  v1 = a1;
  ChartViewController.__deallocating_deinit();
}

uint64_t sub_1B81F3108(_QWORD *a1)
{
  uint64_t *v2;
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

  v2 = (uint64_t *)(*MEMORY[0x1E0DEEDD8] & *a1);
  OUTLINED_FUNCTION_6((uint64_t)a1 + v2[22], v2[11]);
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6((uint64_t)a1 + *(_QWORD *)(v3 + 184), v2[12]);
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6((uint64_t)a1 + *(_QWORD *)(v4 + 192), v2[13]);
  OUTLINED_FUNCTION_1_9();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(_QWORD *)(v5 + 200));
  OUTLINED_FUNCTION_1_9();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(_QWORD *)(v6 + 208));
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6((uint64_t)a1 + *(_QWORD *)(v7 + 216), v2[14]);
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_6((uint64_t)a1 + *(_QWORD *)(v8 + 224), v2[15]);
  OUTLINED_FUNCTION_1_9();

  OUTLINED_FUNCTION_1_9();
  v11 = (char *)a1 + *(_QWORD *)(v10 + 240);
  v12 = OUTLINED_FUNCTION_28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  OUTLINED_FUNCTION_1_9();

  OUTLINED_FUNCTION_1_9();
  swift_release();
  OUTLINED_FUNCTION_1_9();
  return swift_release();
}

void sub_1B81F3224()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_21();
  type metadata accessor for CoordinateSpace();
}

void sub_1B81F32F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
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
  __int128 v32;
  __int128 v33;

  *(_QWORD *)(v12 - 424) = a1;
  *(_QWORD *)(v12 - 432) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_36(v14);
  v15 = *(_QWORD *)(v10 + 128);
  v16 = *(_QWORD *)(v10 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = sub_1B820EA74();
  *(_QWORD *)(v12 - 360) = v18;
  *(_QWORD *)(v12 - 368) = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_36(v20);
  *(_QWORD *)(v12 - 336) = *(_QWORD *)(v16 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_36(v22);
  sub_1B820EA74();
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_25();
  *(_QWORD *)(v12 - 328) = AssociatedTypeWitness;
  *(_QWORD *)(v12 - 304) = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v24);
  *(_QWORD *)(v12 - 352) = (char *)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_36((uint64_t)&a9 - v27);
  v28 = *(_QWORD *)(v10 + 88);
  v29 = *(_QWORD *)(v10 + 120);
  v30 = *(_QWORD *)(v10 + 136);
  v31 = *(_QWORD *)(v10 + 168);
  *(_QWORD *)(v12 - 280) = v16;
  *(_QWORD *)(v12 - 392) = v28;
  *(_QWORD *)(v12 - 272) = v28;
  v32 = *(_OWORD *)(v10 + 96);
  *(_OWORD *)(v12 - 416) = v32;
  *(_OWORD *)(v12 - 264) = v32;
  *(_QWORD *)(v12 - 384) = v9;
  *(_QWORD *)(v12 - 248) = v9;
  *(_QWORD *)(v12 - 240) = v29;
  *(_QWORD *)(v12 - 320) = v15;
  *(_QWORD *)(v12 - 232) = v15;
  *(_QWORD *)(v12 - 224) = v30;
  *(_QWORD *)(v12 - 400) = v30;
  v33 = *(_OWORD *)(v10 + 144);
  *(_OWORD *)(v12 - 448) = v33;
  *(_OWORD *)(v12 - 216) = v33;
  *(_QWORD *)(v12 - 464) = v11;
  *(_QWORD *)(v12 - 200) = v11;
  *(_QWORD *)(v12 - 192) = v31;
  OUTLINED_FUNCTION_41();
}

void sub_1B81F34C8(uint64_t a1)
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
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t AssociatedConformanceWitness;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;

  *(_QWORD *)(v6 - 168) = v1;
  *(_QWORD *)(v6 - 160) = a1;
  objc_msgSendSuper2((objc_super *)(v6 - 168), sel_viewDidLayoutSubviews);
  OUTLINED_FUNCTION_42();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = OUTLINED_FUNCTION_4_4(v9, sel_view);
    if (!v11)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_26(v11);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_9_0();

  }
  OUTLINED_FUNCTION_43();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = OUTLINED_FUNCTION_4_4(v12, sel_view);
    if (!v14)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_26(v14);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_9_0();

  }
  v15 = OUTLINED_FUNCTION_4_4(v12, sel_view);
  if (!v15)
  {
    __break(1u);
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_26(v15);
  OUTLINED_FUNCTION_13_0();
  sub_1B81F2784(v5);
  if (__swift_getEnumTagSinglePayload(v5, 1, v4))
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v3);
    return;
  }
  v16 = *(_QWORD *)(v6 - 336);
  v17 = *(_QWORD *)(v6 - 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, v5, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v3);
  *(_QWORD *)(v6 - 280) = v7;
  *(_QWORD *)(v6 - 272) = v8;
  v18 = *(_QWORD *)(v6 - 352);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 24))(v6 - 280, v4);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v4);
  v19 = *(_QWORD *)(v6 - 304);
  v20 = *(_QWORD *)(v6 - 312);
  v21 = *(_QWORD *)(v6 - 328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v20, v18, v21);
  OUTLINED_FUNCTION_42();
  if (!v22)
  {
    v66 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v67 = v20;
    goto LABEL_16;
  }
  v23 = v22;
  OUTLINED_FUNCTION_43();
  if (!v24)
  {
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);

    return;
  }
  v25 = v24;
  sub_1B81F28E8();
  v26 = *(_QWORD *)(v6 - 376);
  v27 = OUTLINED_FUNCTION_44();
  v28(v27);
  __swift_storeEnumTagSinglePayload(v26, 0, 1, v21);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_19();
  v29 = OUTLINED_FUNCTION_55(v26, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 368) + 8));
  v30 = OUTLINED_FUNCTION_4_4(v29, sel_view);
  if (v30)
  {
    v31 = v30;
    *(_QWORD *)(v6 - 336) = v25;
    v32 = v23;
    OUTLINED_FUNCTION_26(v30);

    v34 = OUTLINED_FUNCTION_4_4(v33, sel_view);
    if (v34)
    {
      v35 = v34;
      v36 = objc_msgSend(v34, sel_traitCollection);
      *(_QWORD *)(v6 - 344) = v36;

      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      v38 = *(_QWORD *)(v6 - 456);
      v39 = *(_QWORD *)(v6 - 312);
      (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 72))(v21, AssociatedConformanceWitness);
      OUTLINED_FUNCTION_32();
      *(_QWORD *)(v40 - 256) = v36;
      v41 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 - 464) + 40))(v38, v6 - 280, *(_QWORD *)(v6 - 384));
      OUTLINED_FUNCTION_55(v38, *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 432) + 8));
      OUTLINED_FUNCTION_8_0();
      v43 = (_QWORD *)(v1 + *(_QWORD *)(v42 + 200));
      v44 = v43[3];
      v45 = v43[4];
      __swift_project_boxed_opaque_existential_1(v43, v44);
      *(_QWORD *)(v6 - 296) = v7;
      *(_QWORD *)(v6 - 288) = v8;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8))(v41, v6 - 296, v44, v45);
      *(_QWORD *)(v6 - 320) = *(_QWORD *)(v6 - 280);
      *(_QWORD *)(v6 - 352) = *(_QWORD *)(v6 - 272);
      v46 = *(double *)(v6 - 264);
      v47 = *(double *)(v6 - 256);
      v48 = *(_QWORD *)(v6 - 232);
      v49 = *(_QWORD *)(v6 - 224);
      v50 = *(_QWORD *)(v6 - 216);
      v51 = *(_QWORD *)(v6 - 208);
      *(_QWORD *)(v6 - 360) = *(_QWORD *)(v6 - 200);
      *(_QWORD *)(v6 - 368) = *(_QWORD *)(v6 - 192);
      v52 = *(_QWORD *)(v6 - 184);
      v53 = *(_QWORD *)(v6 - 176);
      OUTLINED_FUNCTION_8_0();
      *(_QWORD *)(v6 - 280) = v54;
      *(_QWORD *)(v6 - 272) = v55;
      OUTLINED_FUNCTION_27();
      *(_QWORD *)(v6 - 208) = v51;
      *(_QWORD *)(v6 - 200) = v56;
      *(_QWORD *)(v6 - 192) = v57;
      *(_QWORD *)(v6 - 184) = v52;
      *(_QWORD *)(v6 - 176) = v53;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_45();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_8_0();
      (*(void (**)(uint64_t, _QWORD, double, double))(*(_QWORD *)(v6 - 448) + 24))(v39, *(_QWORD *)(v6 - 416), v46, v47);
      OUTLINED_FUNCTION_8_0();
      *(_QWORD *)(v6 - 280) = *(_QWORD *)(v6 - 320);
      *(_QWORD *)(v6 - 272) = *(_QWORD *)(v6 - 352);
      OUTLINED_FUNCTION_27();
      v58 = *(_QWORD *)(v6 - 360);
      *(_QWORD *)(v6 - 208) = v51;
      *(_QWORD *)(v6 - 200) = v58;
      v59 = *(_QWORD *)(v6 - 368);
      *(_QWORD *)(v6 - 192) = v59;
      *(_QWORD *)(v6 - 184) = v52;
      *(_QWORD *)(v6 - 176) = v53;
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(*(_QWORD *)(v6 - 400) + 48))(v39, v32, v6 - 280, *(_QWORD *)(v6 - 392));
      OUTLINED_FUNCTION_8_0();
      v61 = (_QWORD *)(v1 + *(_QWORD *)(v60 + 208));
      v62 = v61[3];
      v63 = v61[4];
      __swift_project_boxed_opaque_existential_1(v61, v62);
      OUTLINED_FUNCTION_32();
      *(_QWORD *)(v64 - 256) = v48;
      *(_QWORD *)(v6 - 256) = v49;
      *(_QWORD *)(v6 - 248) = v50;
      *(_QWORD *)(v6 - 240) = v51;
      *(_QWORD *)(v6 - 232) = v58;
      *(_QWORD *)(v6 - 224) = v59;
      *(_QWORD *)(v6 - 216) = v52;
      *(_QWORD *)(v6 - 208) = v53;
      v65 = *(void **)(v6 - 336);
      (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(v63 + 16))(v41, v6 - 280, v65, v62, v63);
      OUTLINED_FUNCTION_45();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_35();
      v67 = v39;
LABEL_16:
      v66(v67, v21);
      return;
    }
    goto LABEL_22;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
}

void sub_1B81F3A68(void *a1)
{
  a1;
  sub_1B81F3224();
}

void sub_1B81F3A88()
{
  void *v0;

}

void sub_1B81F3A9C()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_21();
  type metadata accessor for CoordinateSpace();
}

id sub_1B81F3B5C(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
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
  _BYTE *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  id result;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t AssociatedConformanceWitness;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void (*v57)(_BYTE *, id, uint64_t, uint64_t);
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  _BYTE v62[112];

  *(_QWORD *)(v6 - 224) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v6 - 216) = a1;
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_15_1();
  *(_QWORD *)(v6 - 232) = v10;
  v11 = v3[12];
  *(_QWORD *)(v6 - 160) = v11;
  *(_QWORD *)(v6 - 168) = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_15_1();
  *(_QWORD *)(v6 - 176) = v13;
  v14 = v3[16];
  v15 = v3[10];
  swift_getAssociatedTypeWitness();
  v16 = OUTLINED_FUNCTION_11_0();
  *(_QWORD *)(v6 - 192) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v6 - 184) = v16;
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_25();
  v18 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1E0C80A78](v19);
  v21 = &v62[-v20];
  sub_1B820EA74();
  OUTLINED_FUNCTION_0_12();
  v23 = MEMORY[0x1E0C80A78](v22);
  v25 = &v62[-v24];
  (*(void (**)(_BYTE *, uint64_t, uint64_t, double))(*(_QWORD *)(v15 - 8) + 16))(&v62[-v24], v4, v15, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v15);
  sub_1B81F27E0((uint64_t)v25);
  result = OUTLINED_FUNCTION_4_4(v26, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_13_0();
  *(double *)(v6 - 136) = v7;
  *(double *)(v6 - 128) = v8;
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24);
  *(_QWORD *)(v6 - 240) = v14;
  v28(v6 - 136, v15, v14);
  sub_1B81F28E8();
  *(_QWORD *)(v6 - 248) = v18;
  OUTLINED_FUNCTION_53(v5, (uint64_t)v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16));
  *(_QWORD *)(v6 - 152) = v2;
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v2);
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_19();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 192) + 8))(v5, *(_QWORD *)(v6 - 184));
  v29 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v31 = *(_QWORD *)(v6 - 176);
  v30 = *(_QWORD *)(v6 - 168);
  v32 = *(_QWORD *)(v6 - 160);
  v33 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 16))(v31, &v1[*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1) + 0xB8)], v32);
  result = OUTLINED_FUNCTION_4_4(v33, sel_view);
  if (!result)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_13_0();
  (*(void (**)(_BYTE *, uint64_t, double, double))(v3[18] + 24))(v21, v32, v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
  v34 = &v1[*(_QWORD *)((*v29 & *(_QWORD *)v1) + 0xC0)];
  (*(void (**)(_QWORD, _QWORD))(v3[19] + 16))(*(_QWORD *)(v6 - 144), v3[13]);
  OUTLINED_FUNCTION_43();
  if (v35)
  {
    OUTLINED_FUNCTION_49(v35);

  }
  OUTLINED_FUNCTION_42();
  if (v36)
  {
    OUTLINED_FUNCTION_49(v36);

  }
  result = OUTLINED_FUNCTION_4_4((uint64_t)v36, sel_view);
  if (!result)
    goto LABEL_15;
  objc_msgSend(result, sel_bounds);
  OUTLINED_FUNCTION_13_0();
  result = OUTLINED_FUNCTION_4_4(v37, sel_view);
  v38 = *(_QWORD *)(v6 - 152);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v39 = result;
  v40 = objc_msgSend(result, sel_traitCollection);

  OUTLINED_FUNCTION_14_1();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v42 = *(_QWORD *)(v6 - 232);
  v43 = v21;
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 72))(v38, AssociatedConformanceWitness);
  *(double *)(v6 - 136) = v7;
  *(double *)(v6 - 128) = v8;
  *(_QWORD *)(v6 - 160) = v40;
  *(_QWORD *)(v6 - 120) = v40;
  v44 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 - 200) + 40))(v42, v6 - 136, *(_QWORD *)(v6 - 208));
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 224) + 8))(v42, *(_QWORD *)(v6 - 216));
  OUTLINED_FUNCTION_14_1();
  v46 = &v1[*(_QWORD *)(v45 + 208)];
  v47 = *((_QWORD *)v46 + 3);
  v48 = *((_QWORD *)v46 + 4);
  __swift_project_boxed_opaque_existential_1(v46, v47);
  v49 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 8))(v44, v47, v48);
  v50 = OUTLINED_FUNCTION_45();
  result = OUTLINED_FUNCTION_4_4(v50, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v51 = result;
  objc_msgSend(result, sel_addSubview_, v49);

  OUTLINED_FUNCTION_14_1();
  v52 = (void *)(*(uint64_t (**)(_BYTE *, _QWORD, _QWORD))(v3[17] + 40))(v43, *(_QWORD *)(v6 - 144), v3[11]);
  result = OUTLINED_FUNCTION_4_4((uint64_t)v52, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v53 = result;
  objc_msgSend(result, sel_addSubview_, v52);

  v54 = v52;
  sub_1B81F2730(v52);
  v55 = v49;
  sub_1B81F287C((uint64_t)v49);
  OUTLINED_FUNCTION_14_1();
  v56 = v3[21];
  v57 = *(void (**)(_BYTE *, id, uint64_t, uint64_t))(v56 + 32);
  v58 = v3[15];
  v59 = v54;
  v57(v43, v59, v58, v56);

  result = OUTLINED_FUNCTION_4_4(v60, sel_view);
  if (result)
  {
    v61 = result;
    objc_msgSend(result, sel_setNeedsLayout);

    return (id)(*(uint64_t (**)(_BYTE *, _QWORD))(*(_QWORD *)(v6 - 248) + 8))(v43, *(_QWORD *)(v6 - 152));
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_1B81F408C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  _OWORD v7[7];

  sub_1B820EA74();
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v7 - v2;
  sub_1B81F2844();
  if (v4)
  {
    OUTLINED_FUNCTION_47(v4);

  }
  sub_1B81F26E0();
  if (v5)
  {
    OUTLINED_FUNCTION_47(v5);

  }
  OUTLINED_FUNCTION_23((uint64_t)v3);
  sub_1B81F27E0((uint64_t)v3);
  memset(v7, 0, sizeof(v7));
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1B81F4164()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_28();
  return sub_1B820EA74();
}

void sub_1B81F41BC(void *a1)
{
  id v1;

  v1 = a1;
  sub_1B81F4164();

}

uint64_t sub_1B81F41F0()
{
  return 0;
}

id ChartViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1B820E864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ChartViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1B81F4298(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  if (a3)
    sub_1B820E888();
  v5 = a4;
  ChartViewController.init(nibName:bundle:)();
}

void ChartViewController<>.add(zone:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_22();
  v20 = v3;
  OUTLINED_FUNCTION_30();
  v4 = OUTLINED_FUNCTION_10_0();
  v18 = *(_QWORD *)(v4 - 8);
  v19 = v4;
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_15_1();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_39();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v20, AssociatedTypeWitness, AssociatedConformanceWitness);
  OUTLINED_FUNCTION_37(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_1B81F28E8();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_19();
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v2, v19);
  }
  else
  {
    OUTLINED_FUNCTION_20();
    sub_1B81F26E0();
    if (v11)
    {
      v12 = OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_40(v12, v13, v14);

    }
    v15 = OUTLINED_FUNCTION_44();
    v17(v15, v16);
  }
  OUTLINED_FUNCTION_5_5();
}

void ChartViewController<>.removeZone(with:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t AssociatedConformanceWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_22();
  v3 = v0;
  v30 = v4;
  v31 = v5;
  v6 = *MEMORY[0x1E0DEEDD8] & *(_QWORD *)v0;
  OUTLINED_FUNCTION_30();
  v7 = OUTLINED_FUNCTION_10_0();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_38();
  v29 = v9;
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_15_1();
  v28 = v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v25 - v15;
  v25[1] = &v3[*(_QWORD *)(v6 + 176)];
  OUTLINED_FUNCTION_39();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v30, v31, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, AssociatedTypeWitness);
  sub_1B81F28E8();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_19();
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v27);
  }
  else
  {
    OUTLINED_FUNCTION_20();
    sub_1B81F26E0();
    if (v18)
    {
      v19 = OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_40(v19, v20, v21);

    }
    v22 = OUTLINED_FUNCTION_44();
    v24(v22, v23);
  }
  OUTLINED_FUNCTION_5_5();
}

void ChartViewController<>.removeZones(with:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[2];

  OUTLINED_FUNCTION_22();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0DEEDD8] & *v2;
  OUTLINED_FUNCTION_30();
  v8 = OUTLINED_FUNCTION_11_0();
  v26 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - v10;
  v27 = *(_QWORD *)(v1 - 8);
  OUTLINED_FUNCTION_0_12();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - v13;
  v15 = *(_QWORD *)(v6 + 16);
  if (v15)
  {
    v24 = v8;
    v25 = v7;
    swift_bridgeObjectRetain();
    v16 = (uint64_t *)(v6 + 40);
    do
    {
      v17 = *v16;
      v28[0] = *(v16 - 1);
      v28[1] = v17;
      swift_bridgeObjectRetain();
      sub_1B81F47D0(v28, v2, v4);
      swift_bridgeObjectRelease();
      v16 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    v8 = v24;
  }
  sub_1B81F28E8();
  sub_1B820E690();
  OUTLINED_FUNCTION_19();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v8);
  }
  else
  {
    v18 = v27;
    OUTLINED_FUNCTION_53((uint64_t)v14, (uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
    sub_1B81F26E0();
    if (v19)
    {
      v20 = v19;
      v21 = OUTLINED_FUNCTION_44();
      v22(v21);

    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v1);
  }
  OUTLINED_FUNCTION_5_5();
}

uint64_t sub_1B81F47D0(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;

  v5 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a2) + 0x58);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v10 = (char *)&v15 - v9;
  v12 = *a1;
  v11 = a1[1];
  (*(void (**)(uint64_t, uint64_t, double))(a3 + 48))(v5, a3, v8);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v12, v11, AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
}

void sub_1B81F48F0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1B81F26E0();
  *a1 = v2;
}

void sub_1B81F4924(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1B81F28E8();
  *a1 = v2;
}

uint64_t method lookup function for ChartViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ChartViewController.chartView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of ChartViewController.model.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ChartViewController.model.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ChartViewController.model.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of ChartViewController.__allocating_init(viewProvider:coordinateProvider:styleManager:layoutAttributesFactory:gridViewProvider:gridViewModelGenerator:interactionManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of ChartViewController.show(modelFactory:style:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of ChartViewController.clear()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of ChartViewController.accessibilityRedrawsOnBoldTextStatusChange.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

void *OUTLINED_FUNCTION_7_0(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x60uLL);
}

id OUTLINED_FUNCTION_9_0()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;

  return objc_msgSend(v0, (SEL)(v1 + 3016), v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_1B820EA74();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_1B820EA74();
}

void OUTLINED_FUNCTION_13_0()
{
  void *v0;

}

double OUTLINED_FUNCTION_16()
{
  void *v0;
  double result;

  return result;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v3, v0);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

id OUTLINED_FUNCTION_26(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 968));
}

void OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v0 - 264) = v1;
  *(_QWORD *)(v0 - 256) = v2;
  *(_QWORD *)(v0 - 248) = v3;
  *(_QWORD *)(v0 - 240) = v4;
  *(_QWORD *)(v0 - 232) = v5;
  *(_QWORD *)(v0 - 224) = v6;
  *(_QWORD *)(v0 - 216) = v7;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1B820EA74();
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return v2 + *(_QWORD *)((v1 & a1) + 0xF0);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1B820E66C();
}

void OUTLINED_FUNCTION_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 - 280) = v1;
  *(_QWORD *)(v0 - 272) = v2;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return 96;
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_37@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  return a3(a1, a2, v4, v3);
}

void OUTLINED_FUNCTION_41()
{
  type metadata accessor for ChartViewController();
}

void OUTLINED_FUNCTION_42()
{
  sub_1B81F26E0();
}

void OUTLINED_FUNCTION_43()
{
  sub_1B81F2844();
}

uint64_t OUTLINED_FUNCTION_44()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_47(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 1736));
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_1B820E690();
}

id OUTLINED_FUNCTION_49(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 1736));
}

uint64_t OUTLINED_FUNCTION_53@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_55@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

void MultiTouchInteractionManager.__allocating_init(interactor:)()
{
  swift_allocObject();
  MultiTouchInteractionManager.init(interactor:)();
}

uint64_t sub_1B81F4CB4()
{
  uint64_t v0;

  return v0;
}

void MultiTouchInteractionManager.register(model:on:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedTypeWitness;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];

  v7 = *v3;
  v8 = *(_QWORD *)(*v3 + 80);
  v24[0] = *(_QWORD *)(*v3 + 88);
  swift_getAssociatedTypeWitness();
  v9 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v24 - v11;
  v13 = *(_QWORD *)(v7 + 136);
  v14 = *(void **)((char *)v3 + v13);
  if (v14)
    objc_msgSend(v14, sel_removeGestureRecognizer_, *(uint64_t *)((char *)v3 + *(_QWORD *)(v7 + 120)));
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v12, a1, v2);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v2);
  v15 = (uint64_t)v3 + *(_QWORD *)(*v3 + 144);
  OUTLINED_FUNCTION_12();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v15, v12, v9);
  swift_endAccess();
  v16 = *(void **)((char *)v3 + v13);
  *(uint64_t *)((char *)v3 + v13) = (uint64_t)a2;

  objc_msgSend(a2, sel_addGestureRecognizer_, *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 120)));
  v17 = (uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 104));
  v18 = OUTLINED_FUNCTION_12();
  v24[6] = *v17;
  MEMORY[0x1E0C80A78](v18);
  v19 = v24[0];
  v24[-4] = v8;
  v24[-3] = v19;
  v24[-2] = a1;
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v21 = OUTLINED_FUNCTION_0_13();
  v22 = OUTLINED_FUNCTION_0_13();
  v23 = OUTLINED_FUNCTION_0_13();
  swift_bridgeObjectRetain();
  v24[1] = AssociatedTypeWitness;
  v24[2] = v21;
  v24[3] = v22;
  v24[4] = v23;
  OUTLINED_FUNCTION_8_1();
}

void sub_1B81F4EC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for InteractionHandlerWrapper(255, v1, a1, v2);
  v3 = OUTLINED_FUNCTION_15();
  MEMORY[0x1BCCAE964](MEMORY[0x1E0DEAF38], v3);
  sub_1B820E8B8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5();
}

void MultiTouchInteractionManager.add<A>(interactionHandler:)()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_1B81F500C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for InteractionHandlerWrapper(0, v4, a1, v5);
  v6 = (_QWORD *)OUTLINED_FUNCTION_14_2();
  v6[2] = v3;
  v6[3] = v9;
  v6[4] = v2;
  v6[5] = v10;
  v6[6] = v1;
  v7 = (_QWORD *)OUTLINED_FUNCTION_14_2();
  v7[2] = v3;
  v7[3] = v9;
  v7[4] = v2;
  v7[5] = v10;
  v7[6] = v1;
  sub_1B8205324((uint64_t)sub_1B81F5CFC, (uint64_t)v6, (uint64_t)sub_1B81F5D24, (uint64_t)v7);
  OUTLINED_FUNCTION_12();
  sub_1B820E924();
  swift_unknownObjectRetain_n();
  swift_retain();
  sub_1B820E918();
  swift_endAccess();
  return swift_release();
}

void MultiTouchInteractionManager.init(interactor:)()
{
  OUTLINED_FUNCTION_11_1();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_1B81F51DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  type metadata accessor for InteractionHandlerWrapper(0, v5, a1, v2);
  *(_QWORD *)(v1 + v6) = sub_1B820E8F4();
  *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112)) = 0;
  v7 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  LOBYTE(v13) = 0;
  v8 = objc_allocWithZone((Class)type metadata accessor for TapDragGestureRecognizer());
  *(_QWORD *)(v1 + v7) = sub_1B8200F08((char *)&v13);
  v9 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v10 = objc_allocWithZone(MEMORY[0x1E0DC39C8]);
  *(_QWORD *)(v1 + v9) = objc_msgSend(v10, sel_init, v13);
  *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 136)) = 0;
  __swift_storeEnumTagSinglePayload(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144), 1, 1, v5);
  v11 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 96), v3, v4);
  objc_msgSend(*(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120)), sel_addTarget_action_, v1, sel_handleGestureWithGesture_);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v4);
  return v1;
}

void sub_1B81F52F8(void *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v2;
  v29 = a1;
  v5 = *v2;
  v28[2] = *(_QWORD *)(*v2 + 88);
  swift_getAssociatedTypeWitness();
  v6 = (_QWORD *)OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v28 - v8;
  v10 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v28 - v12;
  v14 = *(void **)((char *)v4 + *(_QWORD *)(v5 + 136));
  if (v14)
  {
    v15 = (uint64_t)v4 + *(_QWORD *)(v5 + 144);
    OUTLINED_FUNCTION_12();
    (*(void (**)(char *, uint64_t, _QWORD *))(v3 + 16))(v9, v15, v6);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v1) == 1)
    {
      (*(void (**)(char *, _QWORD *))(v3 + 8))(v9, v6);
      goto LABEL_17;
    }
    v16 = v10;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v9, v1);
    v17 = v14;
    v18 = (char *)objc_msgSend(v29, sel_state);
    if ((unint64_t)(v18 - 3) < 2)
    {
      OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_12();
      if (!*v6)
      {
        OUTLINED_FUNCTION_7_1();
        swift_endAccess();
        goto LABEL_16;
      }
      swift_endAccess();
      v23 = swift_retain();
      sub_1B8209184(v23, v24, v25, v26);
    }
    else
    {
      if (v18 != (char *)2)
      {
        if (v18 == (char *)1)
        {
          swift_getAssociatedConformanceWitness();
          v28[1] = v16;
          v19 = OUTLINED_FUNCTION_11_1();
          v20 = OUTLINED_FUNCTION_1_10();
          v21 = OUTLINED_FUNCTION_1_10();
          v22 = OUTLINED_FUNCTION_1_10();
          v30 = v19;
          v31 = v20;
          v32 = v21;
          v33 = v22;
          OUTLINED_FUNCTION_8_1();
        }
        goto LABEL_14;
      }
      OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_12();
      if (!*v6)
      {
LABEL_14:
        OUTLINED_FUNCTION_7_1();
LABEL_16:

        goto LABEL_17;
      }
      v27 = swift_retain();
      OUTLINED_FUNCTION_12_1(v27, (uint64_t)v29, v17);
    }
    swift_release();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v1);
  }
LABEL_17:
  OUTLINED_FUNCTION_5_5();
}

uint64_t sub_1B81F5684(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double Width;
  uint64_t (*v34)(char *, uint64_t);
  char *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, double, double);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  double v44;
  double v45;
  char *v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  uint64_t TupleTypeMetadata2;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v66 = a5;
  v60 = a1;
  v7 = *a4;
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v61 = type metadata accessor for HighlightInteraction.InteractionType(0, v8, v8, (uint64_t)a4);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x1E0C80A78](v61);
  v58 = (char *)&v57 - v9;
  v10 = sub_1B820EA74();
  v63 = *(_QWORD *)(v10 - 8);
  v64 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v57 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v57 - v17;
  v65 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v19);
  v57 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v62 = (char *)&v57 - v22;
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v57 - v24;
  v26 = a2 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  result = swift_beginAccess();
  v28 = *(unsigned __int8 *)(v26 + 32);
  if (v28 != 255)
  {
    v30 = *(double *)(v26 + 16);
    v29 = *(double *)(v26 + 24);
    v31 = *(double *)(v26 + 8);
    if (*(double *)v26 > 0.0)
      v32 = *(double *)v26;
    else
      v32 = 0.0;
    objc_msgSend(a3, sel_bounds);
    Width = CGRectGetWidth(v67);
    if (Width < v32)
      v32 = Width;
    if ((v28 & 1) != 0)
    {
      objc_msgSend(a3, sel_bounds);
      v36 = CGRectGetWidth(v68);
      objc_msgSend(a3, sel_bounds);
      v38 = *(_QWORD *)(v7 + 80);
      v37 = *(_QWORD *)(v7 + 88);
      v39 = *(void (**)(uint64_t, uint64_t, uint64_t, double, double))(v37 + 24);
      v40 = v66;
      v39(v66, v38, v37, v32, v31);
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v8) == 1)
      {
        v34 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
        v35 = v15;
      }
      else
      {
        v44 = 0.0;
        if (v30 > 0.0)
          v44 = v30;
        if (v36 >= v44)
          v45 = v44;
        else
          v45 = v36;
        v46 = v15;
        v47 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        v47(v62, v46, v8);
        objc_msgSend(a3, sel_bounds);
        v39(v40, v38, v37, v45, v29);
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v8) != 1)
        {
          v48 = v57;
          v47(v57, v12, v8);
          TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
          v50 = v58;
          v51 = &v58[*(int *)(TupleTypeMetadata2 + 48)];
          v52 = v65;
          v53 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
          v54 = v62;
          v53(v58, v62, v8);
          v53(v51, v48, v8);
          v55 = v61;
          swift_storeEnumTagMultiPayload();
          sub_1B82090B0();
          (*(void (**)(char *, uint64_t))(v59 + 8))(v50, v55);
          v56 = *(void (**)(char *, uint64_t))(v52 + 8);
          v56(v48, v8);
          return ((uint64_t (*)(char *, uint64_t))v56)(v54, v8);
        }
        (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v8);
        v34 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
        v35 = v12;
      }
    }
    else
    {
      objc_msgSend(a3, sel_bounds);
      (*(void (**)(uint64_t, _QWORD, double, double))(*(_QWORD *)(v7 + 88) + 24))(v66, *(_QWORD *)(v7 + 80), v32, v31);
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v8) != 1)
      {
        v41 = v65;
        (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v25, v18, v8);
        v42 = v58;
        (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v58, v25, v8);
        v43 = v61;
        swift_storeEnumTagMultiPayload();
        sub_1B82090B0();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v42, v43);
        return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v25, v8);
      }
      v34 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
      v35 = v18;
    }
    return v34(v35, v64);
  }
  return result;
}

uint64_t sub_1B81F5B24(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(void (**)(uint64_t *))(*(_QWORD *)a1 + 32);
  v4 = a2;
  swift_retain();
  v2(&v4);
  return swift_release();
}

uint64_t sub_1B81F5B74(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_1B81F52F8(v3);

  return swift_release();
}

uint64_t MultiTouchInteractionManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), *(_QWORD *)(*(_QWORD *)v0 + 80));
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_10_1(*(_QWORD *)(*(_QWORD *)v0 + 120));
  OUTLINED_FUNCTION_10_1(*(_QWORD *)(*(_QWORD *)v0 + 128));
  OUTLINED_FUNCTION_10_1(*(_QWORD *)(*(_QWORD *)v0 + 136));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 144);
  swift_getAssociatedTypeWitness();
  v2 = sub_1B820EA74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MultiTouchInteractionManager.__deallocating_deinit()
{
  MultiTouchInteractionManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B81F5CA8()
{
  return sub_1B81FA8DC();
}

uint64_t sub_1B81F5CD8()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1B81F5CFC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 40) + 40))(a1, *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B81F5D24(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 40);
  v5 = *a1;
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 48))(&v5, v2);
}

void sub_1B81F5D60(uint64_t a1, void *a2)
{
  MultiTouchInteractionManager.register(model:on:)(a1, a2);
}

void sub_1B81F5D80()
{
  MultiTouchInteractionManager.add<A>(interactionHandler:)();
}

uint64_t sub_1B81F5DA0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;

  v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    v0 = sub_1B820EA74();
    if (v2 <= 0x3F)
    {
      inited = swift_initClassMetadata2();
      if (inited)
        return inited;
      else
        return 0;
    }
  }
  return v0;
}

uint64_t type metadata accessor for MultiTouchInteractionManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MultiTouchInteractionManager);
}

uint64_t method lookup function for MultiTouchInteractionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MultiTouchInteractionManager.__allocating_init(interactor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1B81F5EA0(uint64_t a1)
{
  uint64_t v1;

  return sub_1B81F5B24(a1, *(_QWORD *)(v1 + 32));
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_8_1()
{
  type metadata accessor for InteractionCursor();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_1B820EA74();
}

void OUTLINED_FUNCTION_10_1(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t *v4;

  return sub_1B81F5684(a1, a2, a3, v4, v3);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_allocObject();
}

uint64_t sub_1B81F5F24(uint64_t a1, uint64_t a2, __int128 *a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v11;
  uint64_t result;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28[3];
  id v29;
  uint64_t v30;
  __int128 v31;
  _OWORD v32[2];

  v6 = v5;
  v11 = a3[1];
  v31 = *a3;
  v32[0] = v11;
  *(_OWORD *)((char *)v32 + 9) = *(__int128 *)((char *)a3 + 25);
  if (sub_1B81E7430())
    return MEMORY[0x1E0DEE9D8];
  v13 = sub_1B81E3450();
  v14 = *(double *)(a2 + *(int *)(v13 + 52) + 8) - *(double *)(a2 + *(int *)(v13 + 52));
  result = MEMORY[0x1E0DEE9D8];
  if (v14 > 0.0 && a5 > 0.0 && a4 > 0.0)
  {
    v30 = MEMORY[0x1E0DEE9D8];
    v27 = *(_QWORD *)(a1 + 16);
    if (v27)
    {
      swift_bridgeObjectRetain();
      v15 = 0;
      do
      {
        v16 = (uint64_t *)(a1 + 32 + 24 * v15);
        v17 = *v16;
        v18 = v16[1];
        v19 = v16[2];
        v20 = objc_allocWithZone(MEMORY[0x1E0DC3508]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        v21 = objc_msgSend(v20, sel_init);
        v29 = v21;
        v22 = *(_QWORD *)(v19 + 16);
        if (v22)
        {
          swift_bridgeObjectRetain();
          v23 = (uint64_t *)(v19 + 48);
          do
          {
            v24 = *v23;
            v25 = *(v23 - 1);
            v28[0] = *(v23 - 2);
            v28[1] = v25;
            v28[2] = v24;
            swift_bridgeObjectRetain();
            sub_1B81F614C(&v29, v28, v6, v17, v18, v19, (uint64_t)&v31, a4, a5);
            swift_bridgeObjectRelease();
            v23 += 3;
            --v22;
          }
          while (v22);
          OUTLINED_FUNCTION_45();
        }
        OUTLINED_FUNCTION_45();
        v26 = v21;
        MEMORY[0x1BCCAE07C]();
        if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B820E8E8();
        ++v15;
        sub_1B820E90C();
        sub_1B820E8DC();
        OUTLINED_FUNCTION_45();
        swift_bridgeObjectRelease();

      }
      while (v15 != v27);
      swift_bridgeObjectRelease();
      return v30;
    }
  }
  return result;
}

void sub_1B81F614C(id *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  char v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  BOOL v23;
  double Width;
  BOOL v26;
  double Height;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  double v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55[3];
  CGRect v56;
  CGRect v57;

  v12 = a2[1];
  v13 = a2[2];
  v14 = *(_QWORD *)(a3 + 16);
  v49 = *(double *)a2;
  v50 = *(double *)&v12;
  v51 = *(double *)&v13;
  v55[0] = a4;
  v55[1] = a5;
  v55[2] = a6;
  *(double *)&v15 = COERCE_DOUBLE(ColumnChartCoordinateProvider.location(for:in:)((uint64_t *)&v49, v55));
  if ((v17 & 1) == 0)
  {
    v18 = *(double *)&v15;
    v19 = v16;
    v20 = v14 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
    swift_beginAccess();
    if ((*(_BYTE *)(v20 + 32) & 1) == 0)
    {
      v21 = *(double *)v20;
      v22 = a9 - v19;
      if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) == 0)
        goto LABEL_20;
      v23 = v18 == 1.79769313e308 || (~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0;
      if (v23 || v19 == 1.79769313e308)
        goto LABEL_20;
      v56.origin.x = v18;
      v56.origin.y = v19;
      v56.size.width = *(CGFloat *)v20;
      v56.size.height = v22;
      Width = CGRectGetWidth(v56);
      v26 = Width == 1.79769313e308 || (*(_QWORD *)&Width & 0x7FF0000000000000) == 0x7FF0000000000000;
      if (v26
        || ((v57.origin.x = v18,
             v57.origin.y = v19,
             v57.size.width = v21,
             v57.size.height = v22,
             Height = CGRectGetHeight(v57),
             Height != 1.79769313e308)
          ? (v28 = (*(_QWORD *)&Height & 0x7FF0000000000000) == 0x7FF0000000000000)
          : (v28 = 1),
            v28))
      {
LABEL_20:
        sub_1B820E9E4();
        sub_1B81F6608();
        v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_1B82103A0;
        v53 = 0;
        v54 = 0xE000000000000000;
        v49 = v18;
        v50 = v19;
        v51 = v21;
        v52 = v22;
        type metadata accessor for CGRect(0);
        sub_1B820EBDC();
        v30 = v53;
        v31 = v54;
        *(_QWORD *)(v29 + 56) = MEMORY[0x1E0DEA968];
        v32 = sub_1B81EBD5C();
        *(_QWORD *)(v29 + 64) = v32;
        *(_QWORD *)(v29 + 32) = v30;
        *(_QWORD *)(v29 + 40) = v31;
        sub_1B81E74F8();
        v33 = (void *)sub_1B820EA68();
        sub_1B820E7EC();
        swift_bridgeObjectRelease();

        sub_1B820E9F0();
        v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_1B82103A0;
        v53 = 0;
        v54 = 0xE000000000000000;
        v49 = v18;
        v50 = v19;
        v51 = v21;
        v52 = v22;
        sub_1B820EBDC();
        v35 = v53;
        v36 = v54;
        *(_QWORD *)(v34 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v34 + 64) = v32;
        *(_QWORD *)(v34 + 32) = v35;
        *(_QWORD *)(v34 + 40) = v36;
        v37 = (id)sub_1B820EA68();
        sub_1B820E7EC();
      }
      else
      {
        v38 = v21 * *(double *)(a7 + 32);
        if (v38 != 1.79769313e308
          && (COERCE_UNSIGNED_INT64(v21 * *(double *)(a7 + 32)) & 0x7FF0000000000000) != 0x7FF0000000000000)
        {
          v37 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_, *(_QWORD *)(a7 + 24), v18, v19, v21, v22, v38, v38);
          objc_msgSend(*a1, sel_appendPath_, v37);
          goto LABEL_22;
        }
        sub_1B820E9E4();
        sub_1B81F6608();
        v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = xmmword_1B82103A0;
        v41 = sub_1B820E954();
        v43 = v42;
        *(_QWORD *)(v40 + 56) = MEMORY[0x1E0DEA968];
        v44 = sub_1B81EBD5C();
        *(_QWORD *)(v40 + 64) = v44;
        *(_QWORD *)(v40 + 32) = v41;
        *(_QWORD *)(v40 + 40) = v43;
        sub_1B81E74F8();
        v45 = (void *)sub_1B820EA68();
        sub_1B820E7EC();
        swift_bridgeObjectRelease();

        sub_1B820E9F0();
        v46 = swift_allocObject();
        *(_OWORD *)(v46 + 16) = xmmword_1B82103A0;
        v47 = sub_1B820E954();
        *(_QWORD *)(v46 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v46 + 64) = v44;
        *(_QWORD *)(v46 + 32) = v47;
        *(_QWORD *)(v46 + 40) = v48;
        v37 = (id)sub_1B820EA68();
        sub_1B820E7EC();
      }
      swift_bridgeObjectRelease();
LABEL_22:

    }
  }
}

uint64_t type metadata accessor for ColumnPathGenerator()
{
  return objc_opt_self();
}

void sub_1B81F6608()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF19BBC8)
  {
    sub_1B81EBD08();
    v0 = sub_1B820ECB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF19BBC8);
  }
}

TeaCharts::GridLabelFormatterOptions __swiftcall GridLabelFormatterOptions.init(traitCollection:)(TeaCharts::GridLabelFormatterOptions traitCollection)
{
  TeaCharts::GridLabelFormatterOptions *v1;

  v1->traitCollection.super.isa = traitCollection.traitCollection.super.isa;
  return traitCollection;
}

uint64_t GridLabelFormatter.format(value:options:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[24];
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8);
  MEMORY[0x1E0C80A78](a1);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v7 = &v19[-v6];
  v9 = *v8;
  OUTLINED_FUNCTION_5_1();
  sub_1B81F68B4(v1 + 16, (uint64_t)&v20, &qword_1ED552EE8, &qword_1ED552EE0);
  if (!v21)
  {
    sub_1B81F68E0((uint64_t)&v20, &qword_1ED552EE8, &qword_1ED552EE0);
    goto LABEL_6;
  }
  sub_1B81DF244(&v20, (uint64_t)v22);
  OUTLINED_FUNCTION_7_2((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  if ((OUTLINED_FUNCTION_5_7() & 1) == 0)
  {
    OUTLINED_FUNCTION_10_2();
LABEL_6:
    OUTLINED_FUNCTION_5_1();
    sub_1B81F68B4(v1 + 56, (uint64_t)&v20, &qword_1ED552ED8, &qword_1ED552ED0);
    if (v21)
    {
      sub_1B81DF244(&v20, (uint64_t)v22);
      OUTLINED_FUNCTION_7_2((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      if ((OUTLINED_FUNCTION_5_7() & 1) != 0)
      {
        v15 = *(double *)&v20;
        v16 = v23;
        v17 = v24;
        __swift_project_boxed_opaque_existential_1(v22, v23);
        *(_QWORD *)&v20 = v9;
        v14 = (*(uint64_t (**)(__int128 *, uint64_t, uint64_t, double))(v17 + 8))(&v20, v16, v17, v15);
        goto LABEL_9;
      }
      OUTLINED_FUNCTION_10_2();
    }
    else
    {
      sub_1B81F68E0((uint64_t)&v20, &qword_1ED552ED8, &qword_1ED552ED0);
    }
    return 0;
  }
  v11 = *((_QWORD *)&v20 + 1);
  v10 = v20;
  v12 = v23;
  v13 = v24;
  __swift_project_boxed_opaque_existential_1(v22, v23);
  *(_QWORD *)&v20 = v9;
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, uint64_t))(v13 + 8))(v10, v11, &v20, v12, v13);
  swift_bridgeObjectRelease();
LABEL_9:
  OUTLINED_FUNCTION_10_2();
  return v14;
}

void sub_1B81F68B4(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_14(a1, a2, a3, a4);
  OUTLINED_FUNCTION_6_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_0();
}

void sub_1B81F68E0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1B81EFE84(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  OUTLINED_FUNCTION_0();
}

id GridLabelFormatterOptions.traitCollection.getter()
{
  id *v0;

  return *v0;
}

double GridLabelFormatter.__allocating_init()()
{
  _OWORD *v0;

  v0 = (_OWORD *)OUTLINED_FUNCTION_1_11();
  return OUTLINED_FUNCTION_9_2(v0);
}

double GridLabelFormatter.init()()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t GridLabelFormatter.deinit()
{
  uint64_t v0;

  sub_1B81F68E0(v0 + 16, &qword_1ED552EE8, &qword_1ED552EE0);
  sub_1B81F68E0(v0 + 56, &qword_1ED552ED8, &qword_1ED552ED0);
  return v0;
}

uint64_t GridLabelFormatter.__deallocating_deinit()
{
  GridLabelFormatter.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B81F69C4(uint64_t a1)
{
  return GridLabelFormatter.format(value:options:)(a1);
}

void GridLabelFormatter<A>.init(formatter:)(__int128 *a1)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[40];

  v2 = (_OWORD *)OUTLINED_FUNCTION_1_11();
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[1] = 0u;
  sub_1B81DF244(a1, (uint64_t)v7);
  v3 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_11_2(v3, v4, &qword_1ED552EE8, &qword_1ED552EE0, (uint64_t)&protocol descriptor for StringLabelFormatterType, v5, v6);
  swift_endAccess();
  OUTLINED_FUNCTION_3_7();
}

{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[40];

  v2 = (_OWORD *)OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_9_2(v2);
  sub_1B81DF244(a1, (uint64_t)v7);
  v3 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_11_2(v3, v4, &qword_1ED552ED8, &qword_1ED552ED0, (uint64_t)&protocol descriptor for ValueLabelFormatterType, v5, v6);
  swift_endAccess();
  OUTLINED_FUNCTION_3_7();
}

void sub_1B81F6AC0(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4;

  OUTLINED_FUNCTION_0_14(a1, a2, a3, a4);
  OUTLINED_FUNCTION_6_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40));
  OUTLINED_FUNCTION_0();
}

ValueMetadata *type metadata accessor for GridLabelFormatterOptions()
{
  return &type metadata for GridLabelFormatterOptions;
}

uint64_t dispatch thunk of GridLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of StringLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of ValueLabelFormatterType.format(value:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1B81F6B14()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GridLabelFormatter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GridLabelFormatter);
}

uint64_t method lookup function for GridLabelFormatter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GridLabelFormatter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t OUTLINED_FUNCTION_6_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_7_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

double OUTLINED_FUNCTION_9_2(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 120);
}

void OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  sub_1B81F6AC0((uint64_t)va, v7, a3, a4);
}

uint64_t GridStyle.init(stroke:insetBehavior:labelPadding:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v7 = *(_QWORD *)(result + 8);
  v8 = *(_QWORD *)(result + 16);
  v9 = *(_BYTE *)(result + 24);
  v10 = *a2;
  *(_QWORD *)a3 = *(_QWORD *)result;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_BYTE *)(a3 + 24) = v9;
  *(_BYTE *)(a3 + 25) = v10;
  *(double *)(a3 + 32) = a4;
  *(double *)(a3 + 40) = a5;
  *(double *)(a3 + 48) = a6;
  *(double *)(a3 + 56) = a7;
  return result;
}

BOOL static GridInsetBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t GridInsetBehavior.hash(into:)()
{
  return sub_1B820ED38();
}

uint64_t GridInsetBehavior.hashValue.getter()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

unint64_t sub_1B81F6C7C()
{
  unint64_t result;

  result = qword_1EF19BD68;
  if (!qword_1EF19BD68)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for GridInsetBehavior, &type metadata for GridInsetBehavior);
    atomic_store(result, (unint64_t *)&qword_1EF19BD68);
  }
  return result;
}

void destroy for Stroke(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for GridStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  __int128 v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for GridStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for GridStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for GridStyle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GridStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridStyle()
{
  return &type metadata for GridStyle;
}

uint64_t storeEnumTagSinglePayload for GridInsetBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81F6F10 + 4 * byte_1B8210945[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B81F6F44 + 4 * byte_1B8210940[v4]))();
}

uint64_t sub_1B81F6F44(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F6F4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81F6F54);
  return result;
}

uint64_t sub_1B81F6F60(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81F6F68);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B81F6F6C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F6F74(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GridInsetBehavior()
{
  return &type metadata for GridInsetBehavior;
}

uint64_t dispatch thunk of ValueAxisCalculationModelType.relativeLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ValueAxisCalculationModelType.value(for:in:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static Orientation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Orientation.hash(into:)()
{
  return sub_1B820ED38();
}

uint64_t Orientation.hashValue.getter()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

unint64_t sub_1B81F7034()
{
  unint64_t result;

  result = qword_1EF19BD70;
  if (!qword_1EF19BD70)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for Orientation, &type metadata for Orientation);
    atomic_store(result, (unint64_t *)&qword_1EF19BD70);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Orientation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81F70BC + 4 * byte_1B8210A15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B81F70F0 + 4 * byte_1B8210A10[v4]))();
}

uint64_t sub_1B81F70F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F70F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81F7100);
  return result;
}

uint64_t sub_1B81F710C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81F7114);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B81F7118(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F7120(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t GridViewProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t GridViewProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t GridViewProvider.view(for:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  _OWORD *v19;
  id v20;
  void *v21;
  char v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  char v27;
  char v28;
  __int128 v29;
  __int128 v30;
  id v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  __int128 v36;
  double v37[5];
  char v38;
  char v39;
  __int128 v40;
  __int128 v41;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 32 + 80 * v3 + 8);
      v6 = *(_QWORD *)(v5 + 16);
      if (v6)
        break;
      v7 = 0;
LABEL_9:
      v11 = __OFADD__(v4, v7);
      v4 += v7;
      if (v11)
        goto LABEL_25;
      if (++v3 == v2)
        goto LABEL_13;
    }
    v7 = 0;
    v8 = (uint64_t *)(v5 + 40);
    while (1)
    {
      v9 = *v8;
      v8 += 2;
      v10 = v9 != 0;
      v11 = __OFADD__(v7, v10);
      v7 += v10;
      if (v11)
        break;
      if (!--v6)
        goto LABEL_9;
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
    result = sub_1B820EC24();
    v16 = result;
    if (!result)
      goto LABEL_23;
    goto LABEL_15;
  }
  v4 = 0;
LABEL_13:
  v12 = objc_allocWithZone((Class)type metadata accessor for GridView());
  GridView.init(numberOfGrids:numberOfLabels:)(v2, v4);
  v14 = v13;
  v34 = (_QWORD *)(v35 + 56);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v35 + 56), *(_QWORD *)(v35 + 80));
  sub_1B820C560(v14);
  v15 = &v14[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers];
  swift_beginAccess();
  v33 = *(_QWORD *)v15;
  v32 = v14;
  if (*(_QWORD *)v15 >> 62)
    goto LABEL_26;
  v16 = *(_QWORD *)((*(_QWORD *)v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v16)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return (uint64_t)v32;
  }
LABEL_15:
  if (v16 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (!v2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v16 <= v2)
  {
    v18 = 0;
    v19 = (_OWORD *)(a1 + 96);
    do
    {
      if ((v33 & 0xC000000000000001) != 0)
        v20 = (id)MEMORY[0x1BCCAE340](v18, v33);
      else
        v20 = *(id *)(v33 + 32 + 8 * v18);
      v21 = v20;
      ++v18;
      v22 = *((_BYTE *)v19 - 64);
      v23 = *((double *)v19 - 7);
      v24 = *((double *)v19 - 6);
      v25 = *((double *)v19 - 5);
      v26 = (void *)*((_QWORD *)v19 - 4);
      v27 = *((_BYTE *)v19 - 24);
      v28 = *((_BYTE *)v19 - 23);
      v29 = *(v19 - 1);
      v30 = *v19;
      v19 += 5;
      v36 = v29;
      __swift_project_boxed_opaque_existential_1(v34, *(_QWORD *)(v35 + 80));
      LOBYTE(v37[0]) = v22;
      v37[1] = v23;
      v37[2] = v24;
      v37[3] = v25;
      *(_QWORD *)&v37[4] = v26;
      v38 = v27;
      v39 = v28;
      v40 = v36;
      v41 = v30;
      swift_bridgeObjectRetain();
      v31 = v26;
      swift_bridgeObjectRetain();
      sub_1B820C5C0(v21, v37);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    while (v16 != v18);
    goto LABEL_23;
  }
LABEL_30:
  __break(1u);
  return result;
}

void GridViewProvider.present(models:attributes:on:)(int a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _QWORD __src[8];
  __int128 v16;
  CGRect v17;

  v6 = *(double *)a2;
  v7 = *(double *)(a2 + 8);
  v8 = *(double *)(a2 + 16);
  v9 = *(double *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  v13 = *(_QWORD *)(a2 + 56);
  v14 = *(_OWORD *)(a2 + 64);
  v17.origin.x = *(CGFloat *)a2;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  if (!CGRectIsEmpty(v17))
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
    *(CGFloat *)__src = v6;
    *(CGFloat *)&__src[1] = v7;
    *(CGFloat *)&__src[2] = v8;
    *(CGFloat *)&__src[3] = v9;
    __src[4] = v10;
    __src[5] = v11;
    __src[6] = v12;
    __src[7] = v13;
    v16 = v14;
    sub_1B81FA0EC(a1, a3, __src);
  }
}

uint64_t sub_1B81F74C0(uint64_t a1)
{
  return GridViewProvider.view(for:)(a1);
}

void sub_1B81F74E0(int a1, uint64_t a2, void *a3)
{
  GridViewProvider.present(models:attributes:on:)(a1, a2, a3);
}

uint64_t dispatch thunk of GridViewProviderType.view(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of GridViewProviderType.present(models:attributes:on:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t method lookup function for GridViewProvider()
{
  return swift_lookUpClassMethod();
}

double DataPoint.x.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double DataPoint.y.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

TeaCharts::DataPoint __swiftcall DataPoint.init(x:y:)(Swift::Double x, Swift::Double y)
{
  Swift::Double *v2;
  TeaCharts::DataPoint result;

  *v2 = x;
  v2[1] = y;
  result.y = y;
  result.x = x;
  return result;
}

BOOL static DataPoint.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

ValueMetadata *type metadata accessor for DataPoint()
{
  return &type metadata for DataPoint;
}

uint64_t sub_1B81F7574(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void (*v10)(char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v2 = type metadata accessor for GridViewRenderer();
  result = sub_1B820E60C();
  if (result)
  {
    v21[3] = v2;
    v21[4] = &off_1E6E14000;
    v21[0] = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v4 = type metadata accessor for GridViewStyler();
    result = sub_1B820E60C();
    if (result)
    {
      v5 = result;
      v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v2);
      v7 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
      MEMORY[0x1E0C80A78](v6);
      v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
      v10 = *(void (**)(char *))(v9 + 16);
      v10((char *)&v15 - v8);
      v11 = *(uint64_t *)((char *)&v15 - v8);
      v20[3] = v2;
      v20[4] = &off_1E6E14000;
      v20[0] = v11;
      type metadata accessor for GridViewProvider();
      v12 = swift_allocObject();
      v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v2);
      MEMORY[0x1E0C80A78](v13);
      v10((char *)&v15 - v8);
      v14 = *(uint64_t *)((char *)&v15 - v8);
      v19[3] = v2;
      v19[4] = &off_1E6E14000;
      v19[0] = v14;
      sub_1B81E0660((uint64_t)v19, v12 + 16);
      v17 = v4;
      v18 = &off_1E6E155B0;
      *(_QWORD *)&v16 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      sub_1B81DF244(&v16, v12 + 56);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      return v12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81F7740(_QWORD *a1)
{
  return sub_1B81F7788(a1, &qword_1ED555178, (uint64_t)&protocol descriptor for CategoryCoordinateCalculatorType, (void (*)(_QWORD))type metadata accessor for CategoryAxisGridViewModelGenerator, (void (*)(_BYTE *, uint64_t))sub_1B81DF244);
}

uint64_t sub_1B81F7764(_QWORD *a1)
{
  return sub_1B81F7788(a1, &qword_1ED5550C0, (uint64_t)&protocol descriptor for ValueCoordinateCalculatorType, (void (*)(_QWORD))type metadata accessor for ValueAxisGridViewModelGenerator, (void (*)(_BYTE *, uint64_t))sub_1B81DF244);
}

uint64_t sub_1B81F7788(_QWORD *a1, unint64_t *a2, uint64_t a3, void (*a4)(_QWORD), void (*a5)(_BYTE *, uint64_t))
{
  uint64_t result;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, a2);
  result = sub_1B820E618();
  if (v11)
  {
    a4(0);
    v9 = swift_allocObject();
    a5(v10, v9 + 16);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F783C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554AD0);
  result = sub_1B820E618();
  if (v7)
  {
    v4 = type metadata accessor for GridLayoutAttributesFactory();
    v5 = swift_allocObject();
    result = sub_1B81DF244(&v6, v5 + 16);
    a2[3] = v4;
    a2[4] = (uint64_t)&off_1E6E12F28;
    *a2 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F78E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554108);
  sub_1B820E600();
  if (v6)
  {
    sub_1B81DF244(&v5, (uint64_t)&v7);
  }
  else
  {
    v1 = sub_1B820E630();
    swift_allocObject();
    v2 = sub_1B820E624();
    v8 = v1;
    v9 = MEMORY[0x1E0DB3668];
    *(_QWORD *)&v7 = v2;
    sub_1B81F7A48((uint64_t)&v5);
  }
  type metadata accessor for GridViewRenderer();
  v3 = swift_allocObject();
  sub_1B81DF244(&v7, v3 + 16);
  return v3;
}

uint64_t sub_1B81F79E4()
{
  type metadata accessor for GridViewStyler();
  return swift_allocObject();
}

uint64_t sub_1B81F7A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for GridPathGenerator();
  result = swift_allocObject();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for GridPathGenerator;
  *a1 = result;
  return result;
}

uint64_t sub_1B81F7A48(uint64_t a1)
{
  uint64_t v2;

  sub_1B81F7A84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B81F7A84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5532F0)
  {
    sub_1B81E0300(255, &qword_1ED554108);
    v0 = sub_1B820EA74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5532F0);
  }
}

BOOL static SparklineViewRendererOptions.Method.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SparklineViewRendererOptions.Method.hash(into:)()
{
  return sub_1B820ED38();
}

uint64_t SparklineViewRendererOptions.Method.hashValue.getter()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

void SparklineViewRendererOptions.method.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

unint64_t sub_1B81F7B88()
{
  unint64_t result;

  result = qword_1EF19BD78;
  if (!qword_1EF19BD78)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for SparklineViewRendererOptions.Method, &type metadata for SparklineViewRendererOptions.Method);
    atomic_store(result, (unint64_t *)&qword_1EF19BD78);
  }
  return result;
}

uint64_t sub_1B81F7BCC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81F7C18 + 4 * byte_1B8210B85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B81F7C4C + 4 * byte_1B8210B80[v4]))();
}

uint64_t sub_1B81F7C4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F7C54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81F7C5CLL);
  return result;
}

uint64_t sub_1B81F7C68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81F7C70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B81F7C74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F7C7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81F7C88()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 5);
  v5 = *v0;
  v6 = v1;
  v7 = *(__int128 *)((char *)v0 + 24);
  v8 = v2;
  v9 = v0[3];
  sub_1B820ED2C();
  sub_1B81E2440((uint64_t)v4);
  return sub_1B820ED50();
}

uint64_t sub_1B81F7CF8()
{
  OUTLINED_FUNCTION_9_3();
  sub_1B820E7BC();
  return swift_release();
}

uint64_t sub_1B81F7D4C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B81F7D78()
{
  sub_1B81F7D4C();
  return swift_deallocClassInstance();
}

_QWORD *assignWithCopy for SparklineViewRenderer.LRUCacheKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SparklineViewRenderer.LRUCacheKey(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SparklineViewRenderer.LRUCacheKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SparklineViewRenderer.LRUCacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SparklineViewRenderer.LRUCacheKey()
{
  return &type metadata for SparklineViewRenderer.LRUCacheKey;
}

uint64_t sub_1B81F7F50()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_retain();
}

id sub_1B81F7FA4(_QWORD *a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  _BYTE v14[24];
  uint64_t v15;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartViewProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  v3 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartCoordinateProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E6018(0, v5, v6, v7);
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v8 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED555180);
  result = (id)sub_1B820E618();
  if (!v15)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v9 = type metadata accessor for GridViewProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v13[3] = v9;
  v13[4] = &protocol witness table for GridViewProvider;
  v13[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E5A18();
  result = (id)sub_1B820E5F4();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v10 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81DFB28(0, qword_1ED5548D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
  result = (id)sub_1B820E5F4();
  if (result)
  {
    v11 = (uint64_t)result;
    v12 = objc_allocWithZone((Class)sub_1B81DF8F4());
    return sub_1B81FCED8(v3, v4, v8, (uint64_t)v14, (uint64_t)v13, v10, v11);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1B81F8214(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554C30);
  result = sub_1B820E618();
  if (v20)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED554AC8);
    result = sub_1B820E618();
    if (v18)
    {
      v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
      MEMORY[0x1E0C80A78](v3);
      v5 = (_QWORD *)((char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v6 + 16))(v5);
      v7 = *v5;
      v8 = type metadata accessor for ColumnChartRenderer();
      v16[3] = v8;
      v16[4] = &off_1E6E15710;
      v16[0] = v7;
      type metadata accessor for ColumnChartViewProvider();
      v9 = (_QWORD *)swift_allocObject();
      v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v8);
      MEMORY[0x1E0C80A78](v10);
      v12 = (_QWORD *)((char *)&v16[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v13 + 16))(v12);
      v14 = *v12;
      v9[5] = v8;
      v9[6] = &off_1E6E15710;
      v9[2] = v14;
      sub_1B81DF244(&v17, (uint64_t)(v9 + 7));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return (uint64_t)v9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81F83EC(_QWORD *a1)
{
  uint64_t result;
  __int128 v2;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED5550C0);
  result = sub_1B820E618();
  if (v3)
  {
    type metadata accessor for ColumnChartCoordinateProvider();
    swift_allocObject();
    return sub_1B820ACC8(&v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F847C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  sub_1B81E6018(0, a2, a3, a4);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_1B81F84A4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554DA0);
  result = sub_1B820E618();
  if (v13)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED554108);
    result = sub_1B820E600();
    if (v11)
    {
      v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
      MEMORY[0x1E0C80A78](v5);
      v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v8 + 16))(v7);
      v9 = sub_1B81F8C9C(*v7, &v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      result = type metadata accessor for ColumnChartRenderer();
      a2[3] = result;
      a2[4] = (uint64_t)&off_1E6E15710;
      *a2 = v9;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81F8618@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B81F8650(a1, (void (*)(_QWORD))type metadata accessor for ColumnChartCoordinateProvider, (uint64_t (*)(uint64_t))type metadata accessor for ColumnPathGenerator, (uint64_t)&off_1E6E139E8, a2);
}

uint64_t sub_1B81F8634@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B81F8650(a1, (void (*)(_QWORD))sub_1B81E6018, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartStyler, (uint64_t)&off_1E6E131B8, a2);
}

uint64_t sub_1B81F8650@<X0>(_QWORD *a1@<X0>, void (*a2)(_QWORD)@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  _QWORD *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a2(0);
  result = sub_1B820E60C();
  if (result)
  {
    v11 = OUTLINED_FUNCTION_3_8();
    v12 = a3(v11);
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v9;
    a5[3] = v12;
    a5[4] = a4;
    *a5 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F86E8(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for CategoryAxisGridViewModelGenerator();
  result = sub_1B820E60C();
  if (result)
  {
    v3 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    type metadata accessor for ValueAxisGridViewModelGenerator();
    result = sub_1B820E60C();
    if (result)
    {
      v4 = result;
      sub_1B81E5A18();
      result = swift_allocObject();
      *(_QWORD *)(result + 16) = v3;
      *(_QWORD *)(result + 24) = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81F8798(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for ColumnChartInteractor();
  result = sub_1B820E60C();
  if (result)
  {
    v2 = result;
    sub_1B81DFB28(0, qword_1ED5548D0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InteractionManager);
    v3 = swift_allocObject();
    sub_1B81DFB28(0, &qword_1ED553CF8, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartInteractor, sub_1B81E5B20, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for MultiTouchInteractionManager);
    swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_1B81FD184(v2);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F886C()
{
  type metadata accessor for ColumnChartInteractor();
  return swift_allocObject();
}

uint64_t sub_1B81F888C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  __int128 v20;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED5550B8);
  result = sub_1B820E618();
  if (v23)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED554AC8);
    result = sub_1B820E618();
    if (v21)
    {
      v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
      MEMORY[0x1E0C80A78](v5);
      v7 = (_QWORD *)((char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v8 + 16))(v7);
      v9 = *v7;
      v10 = type metadata accessor for ColumnChartImageGenerator();
      v19[3] = v10;
      v19[4] = &off_1E6E13FE8;
      v19[0] = v9;
      v11 = type metadata accessor for ColumnChartImageLoader();
      v12 = (_QWORD *)swift_allocObject();
      v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v10);
      MEMORY[0x1E0C80A78](v13);
      v15 = (_QWORD *)((char *)&v19[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v16 + 16))(v15);
      v17 = *v15;
      v12[5] = v10;
      v12[6] = &off_1E6E13FE8;
      v12[2] = v17;
      sub_1B81DF244(&v20, (uint64_t)(v12 + 7));
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      a2[3] = v11;
      a2[4] = &off_1E6E14378;
      *a2 = v12;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81F8A80@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _BYTE v18[24];
  uint64_t v19;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554CE8);
  result = sub_1B820E618();
  if (v19)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x1E0C80A78](v4);
    v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = *v6;
    v9 = type metadata accessor for ColumnPathGenerator();
    v17[3] = v9;
    v17[4] = &off_1E6E139E8;
    v17[0] = v8;
    v10 = type metadata accessor for ColumnChartImageGenerator();
    v11 = (_QWORD *)swift_allocObject();
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v9);
    MEMORY[0x1E0C80A78](v12);
    v14 = (_QWORD *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1E6E139E8;
    v11[2] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &off_1E6E13FE8;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81F8C14(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v7;
  uint64_t v8;
  char **v9;

  v8 = type metadata accessor for ColumnChartImageLoader();
  v9 = &off_1E6E14378;
  *(_QWORD *)&v7 = a1;
  sub_1B81E071C();
  swift_allocObject();
  *(_QWORD *)(a3 + 96) = sub_1B820E72C();
  sub_1B81DF244(&v7, a3 + 16);
  sub_1B81DF244(a2, a3 + 56);
  return a3;
}

uint64_t sub_1B81F8C9C(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v12[3];
  uint64_t v13;
  char **v14;

  v13 = type metadata accessor for ColumnChartImageLoader();
  v14 = &off_1E6E14378;
  v12[0] = a1;
  type metadata accessor for ColumnChartRenderer();
  v4 = swift_allocObject();
  v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  MEMORY[0x1E0C80A78](v5);
  v7 = (_QWORD *)((char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  v9 = sub_1B81F8C14(*v7, a2, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

void *LineChartView.__allocating_init(seriesViews:)()
{
  unint64_t v0;

  OUTLINED_FUNCTION_2_9();
  return LineChartView.init(seriesViews:)(v0);
}

uint64_t sub_1B81F8D94(unint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1B820EC24())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BCCAE340](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      objc_msgSend(a2, sel_bounds);
      objc_msgSend(v7, sel_setFrame_);

      ++v5;
      if (v8 == v4)
        goto LABEL_9;
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

id LineChartView.__allocating_init(coder:)()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(OUTLINED_FUNCTION_2_9(), sel_initWithCoder_, v0);

  return v1;
}

void LineChartView.init(coder:)()
{
  sub_1B820EC18();
  __break(1u);
}

void *LineChartView.init(seriesViews:)(unint64_t a1)
{
  char *v1;
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id i;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v14;
  id v15;
  objc_super v16;

  v3 = (objc_class *)OUTLINED_FUNCTION_4();
  *(_QWORD *)&v1[OBJC_IVAR____TtC9TeaCharts13LineChartView_seriesViews] = a1;
  v16.receiver = v1;
  v16.super_class = v3;
  OUTLINED_FUNCTION_0_17();
  v4 = objc_msgSendSuper2(&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v5 = v4;
  if (a1 >> 62)
    goto LABEL_11;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = v4;
  OUTLINED_FUNCTION_0_17();
  for (i = v7; v6; v6 = sub_1B820EC24())
  {
    v9 = 4;
    while (1)
    {
      v10 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BCCAE340](v9 - 4, a1) : *(id *)(a1 + 8 * v9);
      v11 = v10;
      v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      objc_msgSend(v5, sel_addSubview_, v10, v16.receiver, v16.super_class);

      ++v9;
      if (v12 == v6)
        goto LABEL_9;
    }
    __break(1u);
LABEL_11:
    v14 = v5;
    OUTLINED_FUNCTION_0_17();
    v15 = v14;
  }
LABEL_9:

  swift_bridgeObjectRelease_n();
  return v5;
}

Swift::Void __swiftcall LineChartView.layoutSubviews()()
{
  void *v0;
  id v1;
  unint64_t v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)OUTLINED_FUNCTION_4();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  v1 = v0;
  v2 = OUTLINED_FUNCTION_0_17();
  sub_1B81F8D94(v2, v1);
  swift_bridgeObjectRelease();
}

id LineChartView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void LineChartView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LineChartView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LineChartView()
{
  return objc_opt_self();
}

uint64_t method lookup function for LineChartView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LineChartView.__allocating_init(seriesViews:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

UIImage *sub_1B81F9210(uint64_t a1, uint64_t a2, void *__src, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t v12;
  CGContext *v13;
  CGContext *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  UIImage *v20;
  __int128 v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  char v26;
  CGFloat __dst[10];
  CGSize v28;

  memcpy(__dst, __src, 0x41uLL);
  v8 = *a4;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
  v9 = __dst[0];
  v10 = __dst[1];
  v11 = __dst[2];
  v22 = *(_OWORD *)&__dst[3];
  v23 = __dst[5];
  v24 = __dst[6];
  v25 = __dst[7];
  v26 = LOBYTE(__dst[8]);
  v12 = sub_1B81F5F24(a1, a2, &v22, __dst[0], __dst[1]);
  v28.width = v9;
  v28.height = v10;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v11);
  v13 = UIGraphicsGetCurrentContext();
  if (v13)
  {
    v14 = v13;
    if (v12 >> 62)
      goto LABEL_14;
    v15 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v15; v15 = sub_1B820EC24())
    {
      v16 = 4;
      while (1)
      {
        v17 = (v12 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x1BCCAE340](v16 - 4, v12)
            : *(id *)(v12 + 8 * v16);
        v18 = v17;
        v19 = v16 - 3;
        if (__OFADD__(v16 - 4, 1))
          break;
        sub_1B81F942C(v16 - 4, v17, v8, v14, __dst);

        ++v16;
        if (v19 == v15)
          goto LABEL_10;
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    v20 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1B81E74F8();
    v14 = (CGContext *)sub_1B820EA68();
    sub_1B820E9E4();
    sub_1B820E7EC();
    v20 = 0;
  }

  return v20;
}

void sub_1B81F942C(uint64_t a1, void *a2, uint64_t a3, CGContext *a4, CGFloat *a5)
{
  uint64_t *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  CGColorSpace *DeviceRGB;
  CGGradient *v18;
  CFArrayRef colors;
  const __CFArray *colorsa;
  CFArrayRef colorsb;
  uint64_t v22;
  CGPoint v23;
  CGPoint v24;

  if (*(_QWORD *)(a3 + 16) > a1)
  {
    if ((a1 & 0x8000000000000000) == 0)
    {
      v8 = (uint64_t *)(a3 + 16 * a1 + 32);
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_18;
  }
  if (qword_1EF19BAC8 != -1)
LABEL_18:
    swift_once();
  v8 = &qword_1EF19C2D0;
LABEL_6:
  v9 = *v8;
  if ((v8[1] & 1) == 0)
  {
    sub_1B81E892C((void *)*v8, 0);
    objc_msgSend((id)v9, sel_setFill);
    objc_msgSend(a2, sel_fill);
    objc_msgSend(a2, sel_fill);
    sub_1B81E7534((void *)v9, 0);
    return;
  }
  v10 = (void *)objc_opt_self();
  sub_1B81E892C((void *)v9, 1);
  sub_1B81E892C((void *)v9, 1);
  v11 = objc_msgSend(v10, sel_clearColor);
  objc_msgSend(v11, sel_setFill);

  objc_msgSend(a2, sel_addClip);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1B820EC24();
    sub_1B81E7534((void *)v9, 1);
    if (v12)
      goto LABEL_9;
LABEL_20:
    sub_1B81E7534((void *)v9, 1);
    goto LABEL_21;
  }
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
    goto LABEL_20;
LABEL_9:
  v22 = MEMORY[0x1E0DEE9D8];
  sub_1B820EBB8();
  if (v12 < 0)
  {
    __break(1u);
    return;
  }
  colors = (CFArrayRef)a5;
  v13 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0)
      v14 = (id)MEMORY[0x1BCCAE340](v13, v9);
    else
      v14 = *(id *)(v9 + 8 * v13 + 32);
    v15 = v14;
    ++v13;
    v16 = objc_msgSend(v14, sel_CGColor, colors, v22);

    sub_1B820EBA0();
    sub_1B820EBC4();
    sub_1B820EBD0();
    sub_1B820EBAC();
  }
  while (v12 != v13);
  sub_1B81E7534((void *)v9, 1);
  a5 = (CGFloat *)colors;
LABEL_21:
  type metadata accessor for CGColor(0);
  colorsa = (const __CFArray *)sub_1B820E8D0();
  swift_bridgeObjectRelease();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18 = CGGradientCreateWithColors(DeviceRGB, colorsa, 0);

  if (v18)
  {
    v24.y = a5[1];
    v23.x = 0.0;
    v23.y = 0.0;
    v24.x = 0.0;
    CGContextDrawLinearGradient(a4, v18, v23, v24, 0);

  }
  objc_msgSend(a2, sel_fill, colorsa);
  sub_1B81E7534((void *)v9, 1);

}

uint64_t type metadata accessor for ColumnChartImageGenerator()
{
  return objc_opt_self();
}

uint64_t dispatch thunk of AxisType.grids.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

Swift::Int_optional __swiftcall CategoryAxis.index(of:)(Swift::String of)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  Swift::Int v5;
  char v6;
  Swift::Bool v7;
  Swift::Int v8;
  Swift::Int_optional result;

  v2 = *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_4() + 20));
  if (*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    v3 = sub_1B81E2E68();
    if ((v4 & 1) != 0)
      v5 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v3);
    else
      v5 = 0;
    v6 = v4 ^ 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
  v7 = v6 & 1;
  v8 = v5;
  result.value = v8;
  result.is_nil = v7;
  return result;
}

uint64_t CategoryAxis.categories.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_4_6(a1, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t CategoryAxis.grids.getter()
{
  OUTLINED_FUNCTION_7_4();
  return swift_bridgeObjectRetain();
}

unint64_t sub_1B81F985C(uint64_t a1)
{
  uint64_t v2;

  sub_1B820E888();
  sub_1B820ED2C();
  sub_1B820E894();
  v2 = OUTLINED_FUNCTION_5_8();
  swift_bridgeObjectRelease();
  return sub_1B81F997C(a1, v2);
}

unint64_t sub_1B81F98D8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B820ED20();
  return sub_1B81F9AF0(a1, v2);
}

unint64_t sub_1B81F9908(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_1_13();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_5_0();
  sub_1B820ED44();
  v4 = OUTLINED_FUNCTION_5_8();
  return sub_1B81F9B8C(v2, v1, v4, a1);
}

unint64_t sub_1B81F997C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1B820E888();
    v8 = v7;
    if (v6 == sub_1B820E888() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1B820ECCC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1B820E888();
          v15 = v14;
          if (v13 == sub_1B820E888() && v15 == v16)
            break;
          v18 = sub_1B820ECCC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1B81F9AF0(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1B81F9B8C(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  BOOL v15;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a3 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = v12 + 24 * v7;
      v14 = *(double *)(v13 + 16);
      v15 = *(_QWORD *)v13 == a1 && *(_QWORD *)(v13 + 8) == a2;
      if ((v15 || (sub_1B820ECCC() & 1) != 0) && v14 == a4)
        break;
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

uint64_t *initializeBufferWithCopyOfBuffer for CategoryAxis(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for CategoryAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1B81E34CC(0, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

void sub_1B81F9EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_4_6(a1, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_9();
}

void sub_1B81F9F70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  OUTLINED_FUNCTION_4_6(a1, (unint64_t *)&qword_1ED554120, MEMORY[0x1E0DEA990], MEMORY[0x1E0DB5150], (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DB3DA8]);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
}

uint64_t sub_1B81FA000()
{
  uint64_t v0;

  sub_1B820E888();
  sub_1B820ED2C();
  sub_1B820E894();
  v0 = OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_5_0();
  return v0;
}

void sub_1B81FA068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1B820E888();
  v2 = v1;
  if (v0 != sub_1B820E888() || v2 != v3)
    sub_1B820ECCC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return type metadata accessor for CategoryAxis();
}

void sub_1B81FA0EC(int a1, void *a2, void *__src)
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  double __dst[10];

  memcpy(__dst, __src, sizeof(__dst));
  objc_msgSend(a2, sel_setFrame_, __dst[0], __dst[1], __dst[2], __dst[3]);
  objc_msgSend(a2, sel_setAlpha_, 0.0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
  sub_1B81E0DD0();
  v5 = (void *)sub_1B820EA20();
  sub_1B820E6A8();

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1B81FA868;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = a2;
  v9 = (void *)sub_1B820E75C();
  sub_1B820E768();
  swift_release();
  swift_release();
  swift_release();

}

uint64_t sub_1B81FA238()
{
  sub_1B81E5FD4(0, &qword_1ED5532F8, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  return sub_1B820E78C();
}

uint64_t sub_1B81FA2A0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  void *v12;
  uint64_t result;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  BOOL v45;
  id v46;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD aBlock[6];
  uint64_t v52;
  uint64_t v53;

  v7 = *(_QWORD *)(a5 + 64);
  v53 = v7;
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = v7 + 32;
    v49 = a6;
    v10 = (uint64_t *)(a6 + OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers);
    swift_bridgeObjectRetain();
    v11 = 0;
    do
    {
      v12 = *(void **)(v9 + 8 * v11);
      result = swift_beginAccess();
      v14 = *v10;
      if ((*v10 & 0xC000000000000001) != 0)
      {
        v20 = v12;
        v17 = (id)MEMORY[0x1BCCAE340](v11, v14);
      }
      else
      {
        if (v11 >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        v15 = *(void **)(v14 + 8 * v11 + 32);
        v16 = v12;
        v17 = v15;
      }
      v18 = v17;
      ++v11;
      swift_endAccess();
      v19 = objc_msgSend(v12, sel_CGPath);
      objc_msgSend(v18, sel_setPath_, v19);

    }
    while (v8 != v11);
    sub_1B81FA89C((uint64_t)&v53);
    a6 = v49;
  }
  v21 = *(_QWORD *)(a5 + 72);
  v52 = v21;
  v22 = *(_QWORD *)(v21 + 16);
  if (!v22)
    return a1(v21);
  v23 = (_QWORD *)(a6 + OBJC_IVAR____TtC9TeaCharts8GridView_labels);
  v50 = *MEMORY[0x1E0DC4610];
  v24 = 0;
  v25 = v22 - 1;
  v26 = (_BYTE *)(swift_bridgeObjectRetain() + 72);
  v48 = v23;
  while (1)
  {
    v27 = (void *)*((_QWORD *)v26 - 5);
    v28 = *((double *)v26 - 4);
    v29 = *((double *)v26 - 3);
    v30 = *((double *)v26 - 2);
    v31 = *((double *)v26 - 1);
    v32 = *v26;
    result = swift_beginAccess();
    v33 = *v23;
    if ((*v23 & 0xC000000000000001) != 0)
    {
      v46 = v27;
      v36 = (id)MEMORY[0x1BCCAE340](v24, v33);
    }
    else
    {
      if ((v24 & 0x8000000000000000) != 0)
        goto LABEL_28;
      if (v24 >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_29;
      v34 = *(void **)(v33 + 8 * v24 + 32);
      v35 = v27;
      v36 = v34;
    }
    v37 = v36;
    swift_endAccess();
    if (v27)
      break;
LABEL_18:

    if (v25 == v24)
      goto LABEL_25;
LABEL_23:
    v26 += 48;
    ++v24;
  }
  if ((v32 & 1) != 0)
  {

    goto LABEL_18;
  }
  v38 = v27;
  objc_msgSend(v37, sel_setAttributedText_, v38);
  objc_msgSend(v37, sel_setFrame_, v28, v29, v30, v31);
  result = (uint64_t)objc_msgSend(v38, sel_length);
  if (result < 0)
    goto LABEL_30;
  v39 = result;
  v40 = v25;
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v37;
  v42 = swift_allocObject();
  *(_QWORD *)(v42 + 16) = sub_1B81FA8C4;
  *(_QWORD *)(v42 + 24) = v41;
  aBlock[4] = sub_1B81FA8DC;
  aBlock[5] = v42;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B81FA6E8;
  aBlock[3] = &block_descriptor_15;
  v43 = _Block_copy(aBlock);
  v44 = v37;
  swift_retain();
  swift_release();
  objc_msgSend(v38, sel_enumerateAttribute_inRange_options_usingBlock_, v50, 0, v39, 0, v43);

  _Block_release(v43);
  LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  result = swift_release();
  if ((v39 & 1) != 0)
    goto LABEL_31;
  v25 = v40;
  v45 = v40 == v24;
  v23 = v48;
  if (!v45)
    goto LABEL_23;
LABEL_25:
  v21 = sub_1B81FA89C((uint64_t)&v52);
  return a1(v21);
}

void sub_1B81FA668(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, void *a5)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  sub_1B81FA8FC(a1, (uint64_t)v9);
  if (v10)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_1B81F1950(v7, v8, a5);
      *a4 = 1;
    }
  }
  else
  {
    sub_1B81EBC74((uint64_t)v9);
  }
}

uint64_t sub_1B81FA6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(__int128 *, uint64_t, uint64_t, uint64_t);
  __int128 v11;
  __int128 v12;

  v9 = *(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v12 + 1) = swift_getObjectType();
    *(_QWORD *)&v11 = a2;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_unknownObjectRetain();
  v9(&v11, a3, a4, a5);
  return sub_1B81EBC74((uint64_t)&v11);
}

void sub_1B81FA770(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  v6[4] = sub_1B81F1580;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B81E45C8;
  v6[3] = &block_descriptor_0;
  v4 = _Block_copy(v6);
  v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t sub_1B81FA83C()
{
  return sub_1B81FA238();
}

uint64_t sub_1B81FA844()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B81FA868()
{
  uint64_t v0;

  sub_1B81FA770(*(void **)(v0 + 16));
}

uint64_t sub_1B81FA870()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81FA894(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1B81FA2A0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_1B81FA89C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void sub_1B81FA8C4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  sub_1B81FA668(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_1B81FA8CC()
{
  return swift_deallocObject();
}

uint64_t sub_1B81FA8DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B81FA8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B81E5FD4(0, &qword_1ED553290, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CoordinateSpace.x.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return OUTLINED_FUNCTION_0_19(*(_QWORD *)(a1 + 16), a2);
}

uint64_t *sub_1B81FA978(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8;
  v10 = *(_QWORD *)(v6 + 64) + v8;
  v11 = *(_DWORD *)(v6 + 80) | v8;
  v12 = v11;
  v13 = v11 & 0x100000;
  if (v12 > 7 || v13 != 0 || (v10 & (unint64_t)~v9) + *(_QWORD *)(v7 + 64) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v10) & v17, ((unint64_t)a2 + v10) & v17, v5);
  }
  return v4;
}

uint64_t sub_1B81FAA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1B81FAAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1B81FAB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t dispatch thunk of InteractionHandler.register(model:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of InteractionHandler.didStart(interaction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

void GridViewModelGenerator.models(for:options:)(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, char *, uint64_t *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v4 = *v2;
  v5 = *a2;
  v6 = (void *)a2[2];
  v18 = 1;
  v14 = v5;
  v15 = (uint64_t)v6;
  v7 = *(_QWORD *)(v4 + 96);
  v8 = *(void (**)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))(v7 + 24);
  v9 = *(_QWORD *)(v4 + 80);
  v6;
  v8(a1, &v18, &v14, v9, v7);
  v10 = OUTLINED_FUNCTION_0_20();
  v11 = OUTLINED_FUNCTION_0_20();
  v12 = OUTLINED_FUNCTION_1_14();
  v13 = OUTLINED_FUNCTION_1_14();
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  type metadata accessor for CoordinateSpace();
}

uint64_t sub_1B81FACA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  char v11;

  v5 = v1 + *(int *)(a1 + 52);
  v11 = 0;
  v10[0] = v4;
  v10[1] = v8;
  v6 = (*(uint64_t (**)(uint64_t, char *, _QWORD *, uint64_t, uint64_t))(v3 + 24))(v5, &v11, v10, v2, v3);
  v10[0] = v9;
  sub_1B81FAD9C(v6);

  return v10[0];
}

uint64_t *GridViewModelGenerator.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_6((uint64_t)v0 + *(_QWORD *)(*v0 + 112), *(_QWORD *)(*v0 + 80));
  OUTLINED_FUNCTION_6((uint64_t)v0 + *(_QWORD *)(*v0 + 120), *(_QWORD *)(v1 + 88));
  return v0;
}

uint64_t GridViewModelGenerator.__deallocating_deinit()
{
  GridViewModelGenerator.deinit();
  return swift_deallocClassInstance();
}

void sub_1B81FAD7C(uint64_t a1, uint64_t *a2)
{
  GridViewModelGenerator.models(for:options:)(a1, a2);
}

void sub_1B81FAD9C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
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
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v4 + v2;
    else
      v8 = v4;
    sub_1B81EBEDC(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v3;
    return;
  }
  v10 = *(_QWORD *)(v3 + 16);
  v11 = __OFADD__(v10, v2);
  v12 = v10 + v2;
  if (!v11)
  {
    *(_QWORD *)(v3 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1B81FAE80()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1B81FAEA0()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t initializeBufferWithCopyOfBuffer for GridViewModelGeneratorOptions(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for GridViewModelGeneratorOptions(uint64_t a1)
{

}

_QWORD *assignWithCopy for GridViewModelGeneratorOptions(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = (void *)a2[2];
  v4 = (void *)a1[2];
  a1[2] = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for GridViewModelGeneratorOptions(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for GridViewModelGeneratorOptions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GridViewModelGeneratorOptions(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridViewModelGeneratorOptions()
{
  return &type metadata for GridViewModelGeneratorOptions;
}

uint64_t dispatch thunk of GridViewModelGeneratorType.models(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t method lookup function for GridViewModelGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t ColumnChartModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B81E25E8(v1, a1);
}

uint64_t ColumnChartModel.series.getter()
{
  OUTLINED_FUNCTION_0_21();
  return swift_bridgeObjectRetain();
}

double ColumnChartModel.options.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_21() + 24);
  result = *(double *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v6 = *(_QWORD *)(v3 + 32);
  v7 = *(_BYTE *)(v3 + 40);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(double *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = v7;
  return result;
}

__n128 ColumnChartModel.init(coordinateSpace:series:options:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  __n128 *v11;
  __n128 result;
  __n128 v13;

  v13 = *a3;
  v6 = a3[1].n128_u64[0];
  v7 = a3[1].n128_u64[1];
  v8 = a3[2].n128_u64[0];
  v9 = a3[2].n128_u8[8];
  sub_1B81E3874(a1, a4);
  v10 = OUTLINED_FUNCTION_0_21();
  *(_QWORD *)(a4 + *(int *)(v10 + 20)) = a2;
  v11 = (__n128 *)(a4 + *(int *)(v10 + 24));
  result = v13;
  *v11 = v13;
  v11[1].n128_u64[0] = v6;
  v11[1].n128_u64[1] = v7;
  v11[2].n128_u64[0] = v8;
  v11[2].n128_u8[8] = v9;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ColumnChartModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v22;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1B81E2E10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    v9 = *(int *)(sub_1B81E3450() + 52);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    *(_OWORD *)v10 = *(_OWORD *)((char *)a2 + v9);
    v22 = (uint64_t)a1 + v9 + 16;
    v12 = (uint64_t)a2 + v9 + 16;
    v13 = *(_OWORD *)((char *)a2 + v9 + 40);
    *(_OWORD *)(v10 + 40) = v13;
    v14 = v13;
    v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v22, v12, v14);
    *((_QWORD *)v10 + 7) = *((_QWORD *)v11 + 7);
    v16 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v17 = (_OWORD *)((char *)a1 + v16);
    v18 = (_OWORD *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    *(_OWORD *)((char *)v17 + 25) = *(_OWORD *)((char *)v18 + 25);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ColumnChartModel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v3 + 52) + 16);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  v6 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v6 + 20)) = *(_QWORD *)(a2 + *(int *)(v6 + 20));
  *(_QWORD *)(a1 + *(int *)(v6 + 24)) = *(_QWORD *)(a2 + *(int *)(v6 + 24));
  v7 = *(int *)(sub_1B81E3450() + 52);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  v10 = a1 + v7 + 16;
  v11 = a2 + v7 + 16;
  v12 = *(_OWORD *)(a2 + v7 + 40);
  *(_OWORD *)(v8 + 40) = v12;
  v13 = v12;
  v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v10, v11, v13);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  v15 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v16 = (_OWORD *)(a1 + v15);
  v17 = (_OWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  *(_OWORD *)((char *)v16 + 25) = *(_OWORD *)((char *)v17 + 25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_QWORD *)(a1 + v8);
  v10 = a2 + v8;
  *v9 = *(_QWORD *)(a2 + v8);
  v9[1] = *(_QWORD *)(a2 + v8 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v8 + 16), (uint64_t *)(a2 + v8 + 16));
  v9[7] = *(_QWORD *)(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 24) = *(_QWORD *)(v13 + 24);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_BYTE *)(v12 + 40) = *(_BYTE *)(v13 + 40);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

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
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
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
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v10[2];
  v13 = v10[3];
  v14 = *(int *)(a3 + 20);
  v15 = *(int *)(a3 + 24);
  v16 = *(_QWORD *)(a2 + v14);
  v9[2] = v12;
  v9[3] = v13;
  *(_QWORD *)(a1 + v14) = v16;
  v17 = (_OWORD *)(a1 + v15);
  v18 = *(_OWORD *)(a2 + v15 + 16);
  *v17 = *(_OWORD *)(a2 + v15);
  v17[1] = v18;
  *(_OWORD *)((char *)v17 + 25) = *(_OWORD *)(a2 + v15 + 25);
  return a1;
}

uint64_t assignWithTake for ColumnChartModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  __swift_destroy_boxed_opaque_existential_1(a1 + v8 + 16);
  v11 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v9 + 32) = v11;
  v12 = *(_QWORD *)(v10 + 56);
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v9 + 56) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  *(_QWORD *)(v14 + 24) = *(_QWORD *)(v15 + 24);
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  *(_BYTE *)(v14 + 40) = *(_BYTE *)(v15 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColumnChartModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B81FB8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_1B81E3450();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnChartModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B81FB930(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_1B81E3450();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_1B81FB9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B81EE390(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_1B81FB9E8(uint64_t a1)
{
  return sub_1B81EE39C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_1B81FB9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B81EE390(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B81EE39C(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_1B81FBA5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B81EE39C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Fill(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Fill(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B81FBB1C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t type metadata accessor for GridType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for GridType);
}

BOOL sub_1B81FBB34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1B81F1D04(*a1, *a2);
}

uint64_t sub_1B81FBB40()
{
  return sub_1B81F1E14();
}

uint64_t sub_1B81FBB48()
{
  return sub_1B81F1D14();
}

uint64_t sub_1B81FBB60(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD __src[8];
  char v18;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v11 = a2[7];
  v12 = *((_BYTE *)a2 + 64);
  __swift_project_boxed_opaque_existential_1(v2 + 7, v2[10]);
  OUTLINED_FUNCTION_0_22();
  v13 = __src[0];
  if (!__src[0])
    return 0;
  __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
  v14 = *(_QWORD *)(a1 + *(int *)(OUTLINED_FUNCTION_0_21() + 20));
  __src[0] = v4;
  __src[1] = v5;
  __src[2] = v6;
  __src[3] = v7;
  __src[4] = v8;
  __src[5] = v9;
  __src[6] = v10;
  __src[7] = v11;
  v18 = v12;
  v16 = v13;
  sub_1B81F9210(v14, a1, __src, &v16);
  OUTLINED_FUNCTION_4_7();
  return a1;
}

uint64_t sub_1B81FBC58(uint64_t a1, const void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v5;
  uint64_t v6;
  _BYTE __dst[65];

  memcpy(__dst, a2, sizeof(__dst));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 80));
  v3 = OUTLINED_FUNCTION_0_22();
  if (v6)
  {
    MEMORY[0x1E0C80A78](v3);
    sub_1B81FC09C();
    OUTLINED_FUNCTION_52();
    sub_1B820E78C();
    OUTLINED_FUNCTION_4_7();
    return v2;
  }
  else
  {
    sub_1B81FC060();
    swift_allocError();
    *v5 = 0;
    sub_1B81FC09C();
    OUTLINED_FUNCTION_52();
    return sub_1B820E780();
  }
}

uint64_t sub_1B81FBD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD *v29;
  void (**v30)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v40 = a4;
  v41 = a8;
  v38 = a6;
  v39 = a3;
  v36 = a2;
  v12 = type metadata accessor for ColumnChartModel();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  v17 = *a5;
  v34 = a5[1];
  v35 = v17;
  v18 = *((_QWORD *)a5 + 4);
  v19 = *((_QWORD *)a5 + 5);
  v33 = *((_QWORD *)a5 + 6);
  v20 = *((_QWORD *)a5 + 7);
  LOBYTE(a5) = *((_BYTE *)a5 + 64);
  v37 = sub_1B820E648();
  sub_1B81FC120(a7, (uint64_t)v15);
  v21 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v22 = (v21 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v21 + v14 + 79) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v38;
  sub_1B81FC274((uint64_t)v15, v25 + v21);
  v26 = v25 + v22;
  v27 = v34;
  *(_OWORD *)v26 = v35;
  *(_OWORD *)(v26 + 16) = v27;
  *(_QWORD *)(v26 + 32) = v18;
  *(_QWORD *)(v26 + 40) = v19;
  *(_QWORD *)(v26 + 48) = v33;
  *(_QWORD *)(v26 + 56) = v20;
  *(_BYTE *)(v26 + 64) = (_BYTE)a5;
  v28 = v40;
  *(_QWORD *)(v25 + v23) = v41;
  v29 = (_QWORD *)(v25 + v24);
  *v29 = v39;
  v29[1] = v28;
  v30 = (void (**)(uint64_t))(v25 + ((v24 + 23) & 0xFFFFFFFFFFFFFFF8));
  *v30 = sub_1B81E4740;
  v30[1] = (void (*)(uint64_t))v16;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B820E63C();
  return swift_release();
}

void sub_1B81FBF30(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(void))
{
  uint64_t v12;
  UIImage *v13;
  void *v14;
  _BYTE *v15;
  UIImage *v16;
  uint64_t v17;
  _BYTE __dst[72];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
  v12 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for ColumnChartModel() + 20));
  memcpy(__dst, a3, 0x41uLL);
  v17 = a4;
  v13 = sub_1B81F9210(v12, a2, __dst, &v17);
  if (v13)
  {
    v16 = v13;
    a7();

  }
  else
  {
    sub_1B81FC060();
    v14 = (void *)swift_allocError();
    *v15 = 1;
    a5();

  }
}

uint64_t type metadata accessor for ColumnChartImageLoader()
{
  return objc_opt_self();
}

unint64_t sub_1B81FC060()
{
  unint64_t result;

  result = qword_1EF19BE28;
  if (!qword_1EF19BE28)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211114, &type metadata for ColumnChartImageLoader.ColumnChartImageLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EF19BE28);
  }
  return result;
}

void sub_1B81FC09C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552C40)
  {
    sub_1B81E583C();
    v0 = sub_1B820E798();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552C40);
  }
}

uint64_t sub_1B81FC0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1B81FBD5C(a1, a2, a3, a4, *(__int128 **)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
}

uint64_t sub_1B81FC0FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81FC120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ColumnChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B81FC164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_0_21() - 8) + 80);
  v2 = (v1 + 24) & ~v1;
  swift_release();
  v3 = v0 + v2;
  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  type metadata accessor for CategoryAxis();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_1();
  v5 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(v3 + *(int *)(v5 + 52) + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81FC274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ColumnChartModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B81FC2B8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_0_21() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v2 + *(_QWORD *)(v1 + 64);
  sub_1B81FBF30(*(_QWORD *)(v0 + 16), v0 + v2, (const void *)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 79) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v0 + ((((v3 + 79) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 79) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(void))(v0+ ((((((v3 + 79) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t storeEnumTagSinglePayload for ColumnChartImageLoader.ColumnChartImageLoaderError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B81FC370 + 4 * byte_1B8211025[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B81FC3A4 + 4 * byte_1B8211020[v4]))();
}

uint64_t sub_1B81FC3A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81FC3AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B81FC3B4);
  return result;
}

uint64_t sub_1B81FC3C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B81FC3C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B81FC3CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B81FC3D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ColumnChartImageLoader.ColumnChartImageLoaderError()
{
  return &type metadata for ColumnChartImageLoader.ColumnChartImageLoaderError;
}

unint64_t sub_1B81FC3F4()
{
  unint64_t result;

  result = qword_1EF19BE30;
  if (!qword_1EF19BE30)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B82110EC, &type metadata for ColumnChartImageLoader.ColumnChartImageLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EF19BE30);
  }
  return result;
}

uint64_t dispatch thunk of ChartSeriesAccessibilityElementProviderType.seriesContainerElement(for:in:chartModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t LineChartModel.coordinateSpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B81E25E8(v1, a1);
}

uint64_t LineChartModel.series.getter()
{
  OUTLINED_FUNCTION_0_3();
  return swift_bridgeObjectRetain();
}

uint64_t LineChartModel.tcAccessibleXAxisTitle.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_11();
  return v0;
}

void LineChartModel.tcAccessibleXAxisTitle.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_9();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*LineChartModel.tcAccessibleXAxisTitle.modify())(__n128, __n128, __n128, __n128)
{
  OUTLINED_FUNCTION_0_3();
  return nullsub_1;
}

uint64_t LineChartModel.tcAccessibleYAxisTitle.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_11();
  return v0;
}

void LineChartModel.tcAccessibleYAxisTitle.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_9();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_9();
}

uint64_t (*LineChartModel.tcAccessibleYAxisTitle.modify())(__n128, __n128, __n128, __n128)
{
  OUTLINED_FUNCTION_0_3();
  return nullsub_1;
}

uint64_t LineChartModel.marketTimeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_3() + 32);
  v4 = OUTLINED_FUNCTION_4_8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t LineChartModel.init(coordinateSpace:series:marketTimeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = (int *)OUTLINED_FUNCTION_0_3();
  v9 = (_QWORD *)(a4 + v8[6]);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_QWORD *)(a4 + v8[7]);
  *v10 = 0;
  v10[1] = 0;
  sub_1B81E3874(a1, a4);
  *(_QWORD *)(a4 + v8[5]) = a2;
  v11 = a4 + v8[8];
  v12 = OUTLINED_FUNCTION_4_8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a3, v12);
}

uint64_t *initializeBufferWithCopyOfBuffer for LineChartModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v31;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1B81E2E10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    v9 = *(int *)(sub_1B81E3450() + 52);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    *(_OWORD *)v10 = *(_OWORD *)((char *)a2 + v9);
    v31 = (uint64_t)a1 + v9 + 16;
    v12 = (uint64_t)a2 + v9 + 16;
    v13 = *(_OWORD *)((char *)a2 + v9 + 40);
    *(_OWORD *)(v10 + 40) = v13;
    v14 = v13;
    v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v31, v12, v14);
    *((_QWORD *)v10 + 7) = *((_QWORD *)v11 + 7);
    v16 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = a3[7];
    v21 = a3[8];
    v22 = (uint64_t *)((char *)a1 + v20);
    v23 = (uint64_t *)((char *)a2 + v20);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = (char *)a1 + v21;
    v26 = (char *)a2 + v21;
    v27 = sub_1B820E57C();
    v28 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v25, v26, v27);
  }
  return a1;
}

uint64_t destroy for LineChartModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(v5 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 32);
  v7 = sub_1B820E57C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  v6 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v6 + 20)) = *(_QWORD *)(a2 + *(int *)(v6 + 20));
  *(_QWORD *)(a1 + *(int *)(v6 + 24)) = *(_QWORD *)(a2 + *(int *)(v6 + 24));
  v7 = *(int *)(sub_1B81E3450() + 52);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)(a2 + v7);
  v10 = a1 + v7 + 16;
  v11 = a2 + v7 + 16;
  v12 = *(_OWORD *)(a2 + v7 + 40);
  *(_OWORD *)(v8 + 40) = v12;
  v13 = v12;
  v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v10, v11, v13);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  v15 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[7];
  v20 = a3[8];
  v21 = (_QWORD *)(a1 + v19);
  v22 = (_QWORD *)(a2 + v19);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = a1 + v20;
  v25 = a2 + v20;
  v26 = sub_1B820E57C();
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v24, v25, v26);
  return a1;
}

uint64_t assignWithCopy for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_QWORD *)(a1 + v8);
  v10 = a2 + v8;
  *v9 = *(_QWORD *)(a2 + v8);
  v9[1] = *(_QWORD *)(a2 + v8 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v8 + 16), (uint64_t *)(a2 + v8 + 16));
  v9[7] = *(_QWORD *)(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_1B820E57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

uint64_t initializeWithTake for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  v13 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  v14 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_1B820E57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t assignWithTake for LineChartModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  __swift_destroy_boxed_opaque_existential_1(a1 + v8 + 16);
  v11 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v9 + 32) = v11;
  v12 = *(_QWORD *)(v10 + 56);
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v9 + 56) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[8];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = sub_1B820E57C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v24, v25, v26);
  return a1;
}

uint64_t getEnumTagSinglePayload for LineChartModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B81FCDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = OUTLINED_FUNCTION_2_11();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v7 = OUTLINED_FUNCTION_4_8();
    v8 = v4 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for LineChartModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B81FCE58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_2_11();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = (v4 - 1);
      OUTLINED_FUNCTION_9();
      return;
    }
    v9 = OUTLINED_FUNCTION_4_8();
    v10 = v5 + *(int *)(a4 + 32);
  }
  __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

id sub_1B81FCED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1B81FCF1C(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(_QWORD))sub_1B81FE4F8, (uint64_t (*)(_QWORD))type metadata accessor for ColumnChartModel, sub_1B81FE514, (uint64_t (*)(_QWORD))sub_1B81DF8F4);
}

id sub_1B81FCF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(_QWORD), uint64_t (*a9)(_QWORD), void (*a10)(_QWORD), uint64_t (*a11)(_QWORD))
{
  char *v11;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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
  objc_class *v37;
  id v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(_QWORD);
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v43 = a4;
  v44 = a5;
  v42 = a3;
  v41 = a2;
  v40 = a1;
  v45 = a11;
  v14 = a8(0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v40 - v15;
  OUTLINED_FUNCTION_4_9();
  *(_QWORD *)&v11[*(_QWORD *)(v17 + 232)] = 0;
  OUTLINED_FUNCTION_4_9();
  *(_QWORD *)&v11[*(_QWORD *)(v18 + 240)] = 0;
  OUTLINED_FUNCTION_4_9();
  *(_QWORD *)&v11[*(_QWORD *)(v19 + 248)] = 0;
  OUTLINED_FUNCTION_4_9();
  v21 = *(_QWORD *)(v20 + 256);
  sub_1B81F2BB8();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  OUTLINED_FUNCTION_52();
  v22 = v11;
  *(_QWORD *)&v11[v21] = sub_1B820E684();
  OUTLINED_FUNCTION_3_12();
  v24 = *(_QWORD *)(v23 + 264);
  v25 = a9(0);
  OUTLINED_FUNCTION_11_3((uint64_t)v16, v26, v27, v25);
  a10(0);
  OUTLINED_FUNCTION_52();
  *(_QWORD *)&v22[v24] = sub_1B820E684();
  OUTLINED_FUNCTION_3_12();
  *(_QWORD *)&v22[*(_QWORD *)(v28 + 176)] = v40;
  OUTLINED_FUNCTION_3_12();
  *(_QWORD *)&v22[*(_QWORD *)(v29 + 184)] = v41;
  OUTLINED_FUNCTION_3_12();
  v31 = v43;
  *(_QWORD *)&v22[*(_QWORD *)(v30 + 192)] = v42;
  OUTLINED_FUNCTION_3_12();
  sub_1B81E51C4(v31, (uint64_t)&v22[*(_QWORD *)(v32 + 200)]);
  OUTLINED_FUNCTION_3_12();
  v34 = v44;
  sub_1B81E51C4(v44, (uint64_t)&v22[*(_QWORD *)(v33 + 208)]);
  OUTLINED_FUNCTION_3_12();
  *(_QWORD *)&v22[*(_QWORD *)(v35 + 216)] = a6;
  OUTLINED_FUNCTION_3_12();
  *(_QWORD *)&v22[*(_QWORD *)(v36 + 224)] = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  v37 = (objc_class *)v45(0);
  v46.receiver = v22;
  v46.super_class = v37;
  v38 = objc_msgSendSuper2(&v46, sel_initWithNibName_bundle_, 0, 0);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v34);
  __swift_destroy_boxed_opaque_existential_1(v31);
  swift_release();
  swift_release();
  swift_release();
  return v38;
}

_QWORD *sub_1B81FD184(uint64_t a1)
{
  return sub_1B81FD190(a1, (uint64_t (*)(_QWORD))type metadata accessor for ColumnChartModel);
}

_QWORD *sub_1B81FD190(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  _QWORD *v2;
  _QWORD *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v4 = v2;
  v2[3] = MEMORY[0x1E0DEE9D8];
  v2[4] = 0;
  v12 = 0;
  v6 = objc_allocWithZone((Class)type metadata accessor for TapDragGestureRecognizer());
  v2[5] = sub_1B8200F08(&v12);
  v2[6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC39C8]), sel_init);
  v2[7] = 0;
  v7 = (uint64_t)v4 + *(_QWORD *)(*v4 + 144);
  v8 = a2(0);
  OUTLINED_FUNCTION_11_3(v7, v9, v10, v8);
  v4[2] = a1;
  objc_msgSend((id)v4[5], sel_addTarget_action_, v4, sel_handleGestureWithGesture_);
  return v4;
}

id sub_1B81FD250(_QWORD *a1)
{
  id result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _BYTE v11[24];
  uint64_t v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartViewProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  v3 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartCoordinateProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v4 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E5FD4(0, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED555180);
  result = (id)sub_1B820E618();
  if (!v12)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = type metadata accessor for GridViewProvider();
  result = (id)sub_1B820E60C();
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v10[3] = v6;
  v10[4] = &protocol witness table for GridViewProvider;
  v10[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E5A18();
  result = (id)sub_1B820E5F4();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v7 = (uint64_t)result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E5BBC(0);
  result = (id)sub_1B820E5F4();
  if (result)
  {
    v8 = (uint64_t)result;
    v9 = objc_allocWithZone((Class)sub_1B81DFB98());
    return sub_1B81FCF1C(v3, v4, v5, (uint64_t)v11, (uint64_t)v10, v7, v8, (uint64_t (*)(_QWORD))sub_1B81FE4C0, (uint64_t (*)(_QWORD))type metadata accessor for LineChartModel, sub_1B81FE4DC, (uint64_t (*)(_QWORD))sub_1B81DFB98);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1B81FD4D8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  _QWORD v28[3];
  uint64_t v29;
  char **v30;
  _QWORD v31[5];
  _BYTE v32[24];
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  _UNKNOWN **v36;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v2 = type metadata accessor for LineChartRenderer();
  result = sub_1B820E60C();
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v35 = v2;
  v36 = &off_1E6E13388;
  v34[0] = result;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554A18);
  result = sub_1B820E618();
  if (!v33)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E623C(0);
  result = sub_1B820E60C();
  if (result)
  {
    v4 = result;
    v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
    v27[2] = v27;
    MEMORY[0x1E0C80A78](v5);
    v7 = (_QWORD *)((char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v8 + 16))(v7);
    v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
    v27[1] = v27;
    MEMORY[0x1E0C80A78](v9);
    v11 = (_QWORD *)((char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v12 + 16))(v11);
    v13 = *v7;
    v14 = *v11;
    v31[3] = v2;
    v31[4] = &off_1E6E13388;
    v31[0] = v13;
    v15 = type metadata accessor for LineChartStyler();
    v29 = v15;
    v30 = &off_1E6E14570;
    v28[0] = v14;
    type metadata accessor for LineChartViewProvider();
    v16 = (_QWORD *)swift_allocObject();
    v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v2);
    MEMORY[0x1E0C80A78](v17);
    v19 = (_QWORD *)((char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v20 + 16))(v19);
    v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
    MEMORY[0x1E0C80A78](v21);
    v23 = (_QWORD *)((char *)v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v24 + 16))(v23);
    v25 = *v19;
    v26 = *v23;
    v16[5] = v2;
    v16[6] = &off_1E6E13388;
    v16[2] = v25;
    v16[10] = v15;
    v16[11] = &off_1E6E14570;
    v16[12] = v4;
    v16[7] = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return (uint64_t)v16;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1B81FD7E4(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineChartInteractor();
  result = sub_1B820E60C();
  if (result)
  {
    v2 = result;
    type metadata accessor for LineSeriesAccessibilityElementProvider();
    swift_allocObject();
    return sub_1B81FF9BC(v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81FD85C()
{
  uint64_t result;

  sub_1B81E5FD4(0, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_1B81FD89C(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554CF0);
  result = sub_1B820E618();
  if (!v24)
  {
    __break(1u);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554A18);
  result = sub_1B820E618();
  if (!v22)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554CF8);
  result = sub_1B820E618();
  if (!v20)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554108);
  result = sub_1B820E600();
  if (!v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  type metadata accessor for LineSeriesAccessibilityElementProvider();
  result = sub_1B820E60C();
  if (result)
  {
    v3 = result;
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
    MEMORY[0x1E0C80A78](v4);
    v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
    MEMORY[0x1E0C80A78](v8);
    v10 = (uint64_t *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v11 + 16))(v10);
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    MEMORY[0x1E0C80A78](v12);
    v14 = (uint64_t *)((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = sub_1B81FE230(*v6, *v10, *v14, &v17, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return v16;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1B81FDB9C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E5FD4(0, &qword_1ED554300, (uint64_t)&type metadata for LineChartStyle, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for StyleManager);
  result = sub_1B820E60C();
  if (result)
  {
    v4 = result;
    v5 = type metadata accessor for LineChartStyler();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_1E6E14570;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81FDC38(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_13_2();
  result = sub_1B820E60C();
  if (result)
  {
    v2 = result;
    sub_1B81E5BBC(0);
    v3 = OUTLINED_FUNCTION_14();
    sub_1B81FE0D0(0);
    OUTLINED_FUNCTION_52();
    *(_QWORD *)(v3 + 16) = sub_1B81FD190(v2, (uint64_t (*)(_QWORD))type metadata accessor for LineChartModel);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B81FDCBC(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED555178);
  result = sub_1B820E618();
  if (v7)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED5550C0);
    result = sub_1B820E618();
    if (v5)
    {
      type metadata accessor for LineChartInteractor();
      v3 = swift_allocObject();
      sub_1B81DF244(&v6, v3 + 16);
      sub_1B81DF244(&v4, v3 + 56);
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B81FDDB0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B81E138C(a1, (uint64_t (*)(uint64_t))type metadata accessor for LineZoneMaskProvider, (uint64_t)&off_1E6E15658, a2);
}

uint64_t sub_1B81FDDC4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[3];
  uint64_t v31;
  char **v32;
  _QWORD v33[5];
  _BYTE v34[24];
  uint64_t v35;
  _BYTE v36[24];
  uint64_t v37;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED554C28);
  result = sub_1B820E618();
  if (v37)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B81E0300(0, &qword_1ED554A18);
    result = sub_1B820E618();
    if (v35)
    {
      v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
      v29[2] = v29;
      MEMORY[0x1E0C80A78](v5);
      v7 = (_QWORD *)((char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v8 + 16))(v7);
      v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
      v29[1] = v29;
      MEMORY[0x1E0C80A78](v9);
      v11 = (_QWORD *)((char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v12 + 16))(v11);
      v13 = *v7;
      v14 = *v11;
      v15 = type metadata accessor for LineImageGenerator();
      v33[3] = v15;
      v33[4] = &off_1E6E12DC0;
      v33[0] = v13;
      v16 = type metadata accessor for LineChartStyler();
      v31 = v16;
      v32 = &off_1E6E14570;
      v30[0] = v14;
      v17 = type metadata accessor for LineChartImageLoader();
      v18 = (_QWORD *)swift_allocObject();
      v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v15);
      MEMORY[0x1E0C80A78](v19);
      v21 = (_QWORD *)((char *)v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v22 + 16))(v21);
      v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v31);
      MEMORY[0x1E0C80A78](v23);
      v25 = (_QWORD *)((char *)v29 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v26 + 16))(v25);
      v27 = *v21;
      v28 = *v25;
      v18[5] = v15;
      v18[6] = &off_1E6E12DC0;
      v18[2] = v27;
      v18[10] = v16;
      v18[11] = &off_1E6E14570;
      v18[7] = v28;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
      a2[3] = v17;
      a2[4] = &off_1E6E12EC8;
      *a2 = v18;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1B81FE0D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1ED552EF0)
  {
    v2 = type metadata accessor for LineChartInteractor();
    sub_1B81DFAEC(&qword_1ED554968, (uint64_t (*)(uint64_t))type metadata accessor for LineChartInteractor, (uint64_t)&protocol conformance descriptor for LineChartInteractor);
    v5 = type metadata accessor for MultiTouchInteractionManager(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1ED552EF0);
  }
}

uint64_t sub_1B81FE148(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, uint64_t a6)
{
  __int128 v13;
  uint64_t v14;
  _UNKNOWN **v15;
  __int128 v16;
  uint64_t v17;
  char **v18;
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;

  v20 = type metadata accessor for LineChartImageLoader();
  v21 = &off_1E6E12EC8;
  *(_QWORD *)&v19 = a1;
  v17 = type metadata accessor for LineChartStyler();
  v18 = &off_1E6E14570;
  *(_QWORD *)&v16 = a2;
  v14 = type metadata accessor for LineZoneMaskProvider();
  v15 = &off_1E6E15658;
  *(_QWORD *)&v13 = a3;
  sub_1B81FE408();
  swift_allocObject();
  *(_QWORD *)(a6 + 176) = sub_1B820E72C();
  sub_1B81DF244(&v19, a6 + 16);
  sub_1B81DF244(&v16, a6 + 56);
  sub_1B81DF244(&v13, a6 + 96);
  sub_1B81DF244(a4, a6 + 136);
  *(_QWORD *)(a6 + 184) = a5;
  return a6;
}

uint64_t sub_1B81FE230(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v26[3];
  uint64_t v27;
  _UNKNOWN **v28;
  _QWORD v29[3];
  uint64_t v30;
  char **v31;
  _QWORD v32[3];
  uint64_t v33;
  _UNKNOWN **v34;

  v33 = type metadata accessor for LineChartImageLoader();
  v34 = &off_1E6E12EC8;
  v32[0] = a1;
  v30 = type metadata accessor for LineChartStyler();
  v31 = &off_1E6E14570;
  v29[0] = a2;
  v27 = type metadata accessor for LineZoneMaskProvider();
  v28 = &off_1E6E15658;
  v26[0] = a3;
  type metadata accessor for LineChartRenderer();
  v10 = swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
  MEMORY[0x1E0C80A78](v11);
  v13 = (_QWORD *)((char *)&v26[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
  MEMORY[0x1E0C80A78](v15);
  v17 = (_QWORD *)((char *)&v26[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
  MEMORY[0x1E0C80A78](v19);
  v21 = (_QWORD *)((char *)&v26[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  v23 = sub_1B81FE148(*v13, *v17, *v21, a4, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return v23;
}

void sub_1B81FE408()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552C30)
  {
    sub_1B81FE484();
    sub_1B81E5FD4(255, &qword_1ED5530E0, (uint64_t)&type metadata for LineChartImages, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v0 = sub_1B820E738();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552C30);
  }
}

unint64_t sub_1B81FE484()
{
  unint64_t result;

  result = qword_1ED555368;
  if (!qword_1ED555368)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED555368);
  }
  return result;
}

void sub_1B81FE4C0(uint64_t a1)
{
  sub_1B81E1BA0(a1, &qword_1ED552C58, (uint64_t (*)(uint64_t))type metadata accessor for LineChartModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1B81FE4DC(uint64_t a1)
{
  sub_1B81E1BA0(a1, &qword_1ED552C10, (uint64_t (*)(uint64_t))sub_1B81FE4C0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB3938]);
}

void sub_1B81FE4F8(uint64_t a1)
{
  sub_1B81E1BA0(a1, &qword_1ED553440, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1B81FE514(uint64_t a1)
{
  sub_1B81E1BA0(a1, &qword_1ED5532E0, (uint64_t (*)(uint64_t))sub_1B81FE4F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB3938]);
}

uint64_t OUTLINED_FUNCTION_11_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return type metadata accessor for LineChartCoordinateProvider();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return type metadata accessor for LineChartInteractor();
}

id ColumnChartView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void ColumnChartView.init(coder:)()
{
  char *v0;
  uint64_t v1;
  id v2;
  double v3;
  id v4;
  SEL v5;

  v1 = OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView;
  v2 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v3 = OUTLINED_FUNCTION_0_9();
  *(_QWORD *)&v0[v1] = objc_msgSend(v4, v5, v3);

  sub_1B820EC18();
  __break(1u);
}

char *sub_1B81FE65C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  double v5;
  SEL v6;
  double v7;
  objc_super *v8;
  SEL v9;
  char *v10;

  v1 = OUTLINED_FUNCTION_4();
  v2 = OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView;
  v3 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v4 = v0;
  v5 = OUTLINED_FUNCTION_0_9();
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, v6, v5);

  v7 = OUTLINED_FUNCTION_0_9();
  v10 = (char *)objc_msgSendSuper2(v8, v9, v7, v4, v1);
  objc_msgSend(v10, sel_addSubview_, *(_QWORD *)&v10[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView]);
  return v10;
}

Swift::Void __swiftcall ColumnChartView.layoutSubviews()()
{
  char *v0;
  void *v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

id ColumnChartView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ColumnChartView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ColumnChartView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ColumnChartView()
{
  return objc_opt_self();
}

uint64_t sub_1B81FE8A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    *a1 = v4;
  }
  else
  {
    sub_1B81FEAA8();
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1B82112D0;
    if (qword_1EF19BAC0 != -1)
      swift_once();
    *(_QWORD *)(v5 + 32) = qword_1EF19C088;
    sub_1B820E8DC();
    *a1 = v5;
    swift_retain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B81FE974(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v7;

  sub_1B81FE8A8((uint64_t *)&v7);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1B820EC24();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v2 <= a1)
  {
    if (qword_1EF19BAC0 != -1)
      swift_once();
    v5 = qword_1EF19C088;
    swift_retain();
  }
  else
  {
    sub_1B81FE8A8((uint64_t *)&v7);
    v3 = v7;
    v4 = v7 & 0xC000000000000001;
    sub_1B8207E74(a1, (v7 & 0xC000000000000001) == 0, v7);
    if (v4)
    {
      v5 = MEMORY[0x1BCCAE340](a1, v3);
    }
    else
    {
      v5 = *(_QWORD *)(v3 + 8 * a1 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t type metadata accessor for LineChartStyler()
{
  return objc_opt_self();
}

void sub_1B81FEAA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5540F0)
  {
    v0 = sub_1B820ECB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5540F0);
  }
}

uint64_t dispatch thunk of SparklineLoaderType.generateSparkline(for:style:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SparklineLoaderType.sparkline(for:style:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_1B81FEB04()
{
  return sub_1B820ED38();
}

void sub_1B81FEB28()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  sub_1B820ED50();
  OUTLINED_FUNCTION_1_15();
}

uint64_t sub_1B81FEB60()
{
  return 1;
}

uint64_t sub_1B81FEB70()
{
  sub_1B820ED2C();
  sub_1B820ED38();
  return sub_1B820ED50();
}

uint64_t sub_1B81FEBAC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_1B81FEBD8(uint64_t a1, uint64_t a2, double *a3)
{
  return sub_1B81E4798(a1, a2, a3);
}

uint64_t sub_1B81FEBF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B81FEC1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_0_23() - 8) + 80);
  v2 = (v1 + 24) & ~v1;
  swift_release();
  v3 = v0 + v2;
  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  type metadata accessor for CategoryAxis();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = sub_1B81E3450();
  __swift_destroy_boxed_opaque_existential_1(v3 + *(int *)(v5 + 52) + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1B81FED58()
{
  unint64_t result;

  result = qword_1EF19BE98;
  if (!qword_1EF19BE98)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211400, &type metadata for SparklineLoader.SparklineLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EF19BE98);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SparklineLoader.SparklineLoaderError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SparklineLoader.SparklineLoaderError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B81FEE28 + 4 * byte_1B8211320[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B81FEE48 + 4 * byte_1B8211325[v4]))();
}

_BYTE *sub_1B81FEE28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B81FEE48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B81FEE50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B81FEE58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B81FEE60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B81FEE68(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SparklineLoader.SparklineLoaderError()
{
  return &type metadata for SparklineLoader.SparklineLoaderError;
}

unint64_t sub_1B81FEE88()
{
  unint64_t result;

  result = qword_1EF19BEA0;
  if (!qword_1EF19BEA0)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B82113D8, &type metadata for SparklineLoader.SparklineLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EF19BEA0);
  }
  return result;
}

uint64_t destroy for GridSetLayoutAttributes()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GridSetLayoutAttributes(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GridSetLayoutAttributes(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for GridSetLayoutAttributes(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridSetLayoutAttributes(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 64);
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

uint64_t storeEnumTagSinglePayload for GridSetLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridSetLayoutAttributes()
{
  return &type metadata for GridSetLayoutAttributes;
}

uint64_t *initializeBufferWithCopyOfBuffer for SparklineModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1B81E2E10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for CategoryAxis();
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 24));
    v9 = *(int *)(sub_1B81E3450() + 52);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    *(_OWORD *)v10 = *(_OWORD *)((char *)a2 + v9);
    v22 = (uint64_t)a1 + v9 + 16;
    v12 = (uint64_t)a2 + v9 + 16;
    v13 = *(_OWORD *)((char *)a2 + v9 + 40);
    *(_OWORD *)(v10 + 40) = v13;
    v14 = v13;
    v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v22, v12, v14);
    *((_QWORD *)v10 + 7) = *((_QWORD *)v11 + 7);
    v16 = *(int *)(a3 + 20);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v17[2] = v18[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_QWORD *)(a1 + v8);
  v10 = a2 + v8;
  *v9 = *(_QWORD *)(a2 + v8);
  v9[1] = *(_QWORD *)(a2 + v8 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + v8 + 16), (uint64_t *)(a2 + v8 + 16));
  v9[7] = *(_QWORD *)(v10 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 20);
  v12 = (_QWORD *)(a1 + v11);
  v13 = a2 + v11;
  *v12 = *(_QWORD *)(a2 + v11);
  v12[1] = *(_QWORD *)(a2 + v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12[2] = *(_QWORD *)(v13 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  v13 = *(int *)(a3 + 20);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  return a1;
}

uint64_t assignWithTake for SparklineModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  sub_1B81E2E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for CategoryAxis();
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v7 + 24)) = *(_QWORD *)(a2 + *(int *)(v7 + 24));
  swift_bridgeObjectRelease();
  v8 = *(int *)(sub_1B81E3450() + 52);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  __swift_destroy_boxed_opaque_existential_1(a1 + v8 + 16);
  v11 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(v10 + 16);
  *(_OWORD *)(v9 + 32) = v11;
  v12 = *(_QWORD *)(v10 + 56);
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v9 + 56) = v12;
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 20);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v14[2] = v15[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B81FF4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_1B81E3450();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

void sub_1B81FF554(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = sub_1B81E3450();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_9();
  }
}

id SparklineView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void SparklineView.init(coder:)()
{
  sub_1B820EC18();
  __break(1u);
}

id SparklineView.__allocating_init(frame:)()
{
  Class v0;
  id v1;
  double v2;
  id v3;
  SEL v4;

  OUTLINED_FUNCTION_2_13();
  v1 = objc_allocWithZone(v0);
  v2 = OUTLINED_FUNCTION_0_24();
  return objc_msgSend(v3, v4, v2);
}

id SparklineView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall LineSeriesAccessibilityElementProvider.clearElements()()
{
  OUTLINED_FUNCTION_12();
  sub_1B81FFD98(0, (unint64_t *)&qword_1ED553298, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DEA000]);
  sub_1B820E834();
  swift_endAccess();
  OUTLINED_FUNCTION_50();
}

id LineSeriesAccessibilityElementProvider.seriesContainerElement(for:in:chartModel:)(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id result;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22[3];

  v7 = type metadata accessor for LineChartModel();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v22[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_12();
  v10 = *(_QWORD *)(v3 + 24);
  if (*(_QWORD *)(v10 + 16))
  {
    v11 = sub_1B81F98D8(a1);
    if ((v12 & 1) != 0)
    {
      v21 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v11);
      OUTLINED_FUNCTION_3_13();
      return v21;
    }
  }
  result = (id)OUTLINED_FUNCTION_3_13();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v14 = *(_QWORD *)(a3 + *(int *)(v7 + 20));
    if (*(_QWORD *)(v14 + 16) > a1)
    {
      v15 = (_QWORD *)(v14 + 24 * a1);
      v16 = v15[5];
      v17 = v15[6];
      v22[0] = v15[4];
      v22[1] = v16;
      v22[2] = v17;
      sub_1B81EA224(a3, (uint64_t)v9);
      objc_allocWithZone((Class)type metadata accessor for LineSeriesAccessibilityElement());
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v18 = a2;
      swift_retain();
      v19 = sub_1B8205F7C(v18, v22, (uint64_t)v9);
      OUTLINED_FUNCTION_12();
      v20 = v19;
      sub_1B81FFA7C((uint64_t)v20, a1);
      OUTLINED_FUNCTION_3_13();
      return v20;
    }
  }
  __break(1u);
  return result;
}

void LineSeriesAccessibilityElementProvider.currentZone.getter(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12();
  v2 = OUTLINED_FUNCTION_1_16();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  sub_1B81F1838(v2, v3);
  OUTLINED_FUNCTION_50();
}

uint64_t LineSeriesAccessibilityElementProvider.currentZone.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v2 = *((_QWORD *)a1 + 2);
  v7 = *(__int128 *)((char *)a1 + 24);
  v8 = *a1;
  v3 = *((_QWORD *)a1 + 5);
  OUTLINED_FUNCTION_12();
  v4 = OUTLINED_FUNCTION_1_16();
  *(_OWORD *)(v1 + 32) = v8;
  *(_QWORD *)(v1 + 48) = v2;
  *(_OWORD *)(v1 + 56) = v7;
  *(_QWORD *)(v1 + 72) = v3;
  return sub_1B81F1874(v4, v5);
}

uint64_t (*LineSeriesAccessibilityElementProvider.currentZone.modify())()
{
  OUTLINED_FUNCTION_12();
  return j__swift_endAccess;
}

uint64_t sub_1B81FF9BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  v2 = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v2;
  OUTLINED_FUNCTION_12();
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  sub_1B81F1874(v3, v4);
  return v1;
}

uint64_t LineSeriesAccessibilityElementProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  v1 = OUTLINED_FUNCTION_1_16();
  sub_1B81F1874(v1, v2);
  return v0;
}

uint64_t LineSeriesAccessibilityElementProvider.__deallocating_deinit()
{
  LineSeriesAccessibilityElementProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B81FFA7C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_1B81FFBF8(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

void sub_1B81FFAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1B81E2E68();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_1B81FFE00();
  if ((sub_1B820EBF4() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1B81E2E68();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_1B820ECE4();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1B81FFD00(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

void sub_1B81FFBF8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_1B81F98D8(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  sub_1B81FFD98(0, &qword_1ED5532D8, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))MEMORY[0x1E0DECB20]);
  if ((sub_1B820EBF4() & 1) == 0)
    goto LABEL_5;
  v11 = sub_1B81F98D8(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    sub_1B820ECE4();
    __break(1u);
    return;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    v14 = v13[7];

    *(_QWORD *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_1B81FFD48(v9, a2, a1, v13);
  }
}

unint64_t sub_1B81FFD00(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_1B81FFD48(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t method lookup function for LineSeriesAccessibilityElementProvider()
{
  return swift_lookUpClassMethod();
}

void sub_1B81FFD98(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for LineSeriesAccessibilityElement();
    v7 = a3(a1, MEMORY[0x1E0DEB418], v6, MEMORY[0x1E0DEB428]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_1B81FFE00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5532C8)
  {
    sub_1B81FFE64();
    v0 = sub_1B820EC0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5532C8);
  }
}

unint64_t sub_1B81FFE64()
{
  unint64_t result;

  result = qword_1ED553E90;
  if (!qword_1ED553E90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED553E90);
  }
  return result;
}

ValueMetadata *type metadata accessor for SparklineLayoutOptions()
{
  return &type metadata for SparklineLayoutOptions;
}

uint64_t CategoryZone.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall CategoryZone.init(identifier:from:to:)(TeaCharts::CategoryZone *__return_ptr retstr, Swift::String identifier, Swift::String from, Swift::String to)
{
  retstr->identifier = identifier;
  retstr->fromCategory = from;
  retstr->toCategory = to;
}

uint64_t static CategoryZone.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  uint64_t result;
  BOOL v13;
  char v14;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = *a1 == *a2 && a1[1] == a2[1];
  if (v10 || (v11 = sub_1B820ECCC(), result = 0, (v11 & 1) != 0))
  {
    v13 = v2 == v6 && v4 == v7;
    if (v13 || (v14 = sub_1B820ECCC(), result = 0, (v14 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
        return 1;
      else
        return sub_1B820ECCC();
    }
  }
  return result;
}

uint64_t destroy for CategoryZone()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CategoryZone(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CategoryZone(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for CategoryZone(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CategoryZone(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for CategoryZone(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CategoryZone()
{
  return &type metadata for CategoryZone;
}

void sub_1B82001E8(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  int64_t v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;

  v4 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B820EAC8();
    sub_1B82025CC();
    sub_1B8202608();
    sub_1B820E96C();
    v4 = v28;
    v25 = v29;
    v6 = v30;
    v5 = v31;
    v7 = v32;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
    v6 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
  }
  v24 = (unint64_t)(v6 + 64) >> 6;
  if (v4 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v7)
    {
      v11 = (v7 - 1) & v7;
      v12 = __clz(__rbit64(v7)) | (v5 << 6);
      v13 = v5;
      goto LABEL_29;
    }
    v16 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v16 >= v24)
      goto LABEL_38;
    v17 = *(_QWORD *)(v25 + 8 * v16);
    v13 = v5 + 1;
    if (!v17)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v24)
        goto LABEL_38;
      v17 = *(_QWORD *)(v25 + 8 * v13);
      if (!v17)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v24)
          goto LABEL_38;
        v17 = *(_QWORD *)(v25 + 8 * v13);
        if (!v17)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v24)
            goto LABEL_38;
          v17 = *(_QWORD *)(v25 + 8 * v13);
          if (!v17)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v24)
              goto LABEL_38;
            v17 = *(_QWORD *)(v25 + 8 * v13);
            if (!v17)
            {
              v18 = v5 + 6;
              while (v18 < v24)
              {
                v17 = *(_QWORD *)(v25 + 8 * v18++);
                if (v17)
                {
                  v13 = v18 - 1;
                  goto LABEL_28;
                }
              }
LABEL_38:
              sub_1B8202648();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    v11 = (v17 - 1) & v17;
    v12 = __clz(__rbit64(v17)) + (v13 << 6);
LABEL_29:
    v15 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
    if (!v15)
      goto LABEL_38;
    while (1)
    {
      v19 = &a2[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches];
      swift_beginAccess();
      v20 = *(_QWORD *)v19;
      if ((v20 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v21 = sub_1B820EAF8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = *(_QWORD *)(v20 + 16);
      }
      if (v21 > 1)
      {
        objc_msgSend(a2, sel_ignoreTouch_forEvent_, v15, a3);

      }
      else
      {
        swift_beginAccess();
        v22 = v15;
        sub_1B8202650(&v33, v22);
        swift_endAccess();
        v23 = v33;

      }
      v5 = v13;
      v7 = v11;
      if ((v4 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v14 = sub_1B820EB1C();
      if (v14)
      {
        v33 = (void *)v14;
        sub_1B82025CC();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v15 = v27;
        swift_unknownObjectRelease();
        v13 = v5;
        v11 = v7;
        if (v27)
          continue;
      }
      goto LABEL_38;
    }
  }
  __break(1u);
}

void sub_1B8200564(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;

  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B820EAC8();
    sub_1B82025CC();
    sub_1B8202608();
    sub_1B820E96C();
    v5 = v22;
    v21 = v23;
    v6 = v24;
    v7 = v25;
    v8 = v26;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v21 = a1 + 56;
    v10 = ~v9;
    v11 = -v9;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v8 = v12 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v6 = v10;
    v7 = 0;
  }
  v20 = (unint64_t)(v6 + 64) >> 6;
  if (v5 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v8)
    {
      v13 = (v8 - 1) & v8;
      v14 = __clz(__rbit64(v8)) | (v7 << 6);
      v15 = v7;
      goto LABEL_29;
    }
    v17 = v7 + 1;
    if (__OFADD__(v7, 1))
      break;
    if (v17 >= v20)
      goto LABEL_32;
    v18 = *(_QWORD *)(v21 + 8 * v17);
    v15 = v7 + 1;
    if (!v18)
    {
      v15 = v7 + 2;
      if (v7 + 2 >= v20)
        goto LABEL_32;
      v18 = *(_QWORD *)(v21 + 8 * v15);
      if (!v18)
      {
        v15 = v7 + 3;
        if (v7 + 3 >= v20)
          goto LABEL_32;
        v18 = *(_QWORD *)(v21 + 8 * v15);
        if (!v18)
        {
          v15 = v7 + 4;
          if (v7 + 4 >= v20)
            goto LABEL_32;
          v18 = *(_QWORD *)(v21 + 8 * v15);
          if (!v18)
          {
            v15 = v7 + 5;
            if (v7 + 5 >= v20)
              goto LABEL_32;
            v18 = *(_QWORD *)(v21 + 8 * v15);
            if (!v18)
            {
              v19 = v7 + 6;
              while (v19 < v20)
              {
                v18 = *(_QWORD *)(v21 + 8 * v19++);
                if (v18)
                {
                  v15 = v19 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1B8202648();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    v13 = (v18 - 1) & v18;
    v14 = __clz(__rbit64(v18)) + (v15 << 6);
LABEL_29:
    v16 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v14);
    if (!v16)
      goto LABEL_32;
    while (1)
    {
      objc_msgSend(a2, sel_ignoreTouch_forEvent_, v16, a3);

      v7 = v15;
      v8 = v13;
      if ((v5 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1B820EB1C())
      {
        sub_1B82025CC();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v16 = v27;
        swift_unknownObjectRelease();
        v15 = v7;
        v13 = v8;
        if (v27)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_1B820082C(uint64_t a1, void *a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1B820EAC8();
    sub_1B82025CC();
    sub_1B8202608();
    sub_1B820E96C();
    v3 = v21;
    v19 = v22;
    v5 = v23;
    v4 = v24;
    v6 = v25;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v19 = a1 + 56;
    v5 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = 0;
  }
  v18 = (unint64_t)(v5 + 64) >> 6;
  if (v3 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v6)
    {
      v10 = (v6 - 1) & v6;
      v11 = __clz(__rbit64(v6)) | (v4 << 6);
      v12 = v4;
      goto LABEL_29;
    }
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v14 >= v18)
      goto LABEL_32;
    v15 = *(_QWORD *)(v19 + 8 * v14);
    v12 = v4 + 1;
    if (!v15)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v18)
        goto LABEL_32;
      v15 = *(_QWORD *)(v19 + 8 * v12);
      if (!v15)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v18)
          goto LABEL_32;
        v15 = *(_QWORD *)(v19 + 8 * v12);
        if (!v15)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v18)
            goto LABEL_32;
          v15 = *(_QWORD *)(v19 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v18)
              goto LABEL_32;
            v15 = *(_QWORD *)(v19 + 8 * v12);
            if (!v15)
            {
              v16 = v4 + 6;
              while (v16 < v18)
              {
                v15 = *(_QWORD *)(v19 + 8 * v16++);
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1B8202648();

              return;
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v11);
    if (!v13)
      goto LABEL_32;
    while (1)
    {
      swift_beginAccess();
      v17 = (void *)sub_1B820432C(v13);
      swift_endAccess();

      v4 = v12;
      v6 = v10;
      if ((v3 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1B820EB1C())
      {
        sub_1B82025CC();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v13 = v20;
        swift_unknownObjectRelease();
        v12 = v4;
        v10 = v6;
        if (v20)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1B8200B0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_1B820EABC();
    v4 = v3;
    v5 = 1;
  }
  else
  {
    v2 = sub_1B8204E28(a1);
    v4 = v6;
    v5 = v7 & 1;
  }
  v8 = sub_1B8204B90(a1);
  v10 = v9;
  v12 = v11 & 1;
  v13 = sub_1B8204EA8(v2, v4, v5, v8, v9, v11 & 1);
  sub_1B8204EDC(v8, v10, v12);
  if (v13)
  {
    sub_1B8204EDC(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_1B8204BE0(v2, v4, v5, a1);
    v14 = v15;
    sub_1B8204EDC(v2, v4, v5);
  }
  return v14;
}

__n128 TapDragGestureRecognizer.locations.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  OUTLINED_FUNCTION_12();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

__n128 TapDragGestureRecognizer.locations.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;
  __n128 *v5;
  __n128 result;
  __n128 v7;

  v7 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u8[0];
  v5 = (__n128 *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations);
  OUTLINED_FUNCTION_12();
  result = v7;
  *v5 = v7;
  v5[1].n128_u64[0] = v2;
  v5[1].n128_u64[1] = v3;
  v5[2].n128_u8[0] = v4;
  return result;
}

uint64_t (*TapDragGestureRecognizer.locations.modify())()
{
  OUTLINED_FUNCTION_12();
  return j_j__swift_endAccess;
}

double TapDragGestureRecognizer.minimumPressDuration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration;
  OUTLINED_FUNCTION_12();
  return *(double *)v1;
}

uint64_t TapDragGestureRecognizer.minimumPressDuration.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration);
  result = OUTLINED_FUNCTION_12();
  *v3 = a1;
  return result;
}

uint64_t (*TapDragGestureRecognizer.minimumPressDuration.modify())()
{
  OUTLINED_FUNCTION_12();
  return j__swift_endAccess;
}

id TapDragGestureRecognizer.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void TapDragGestureRecognizer.init(coder:)()
{
  char *v0;
  char *v1;
  uint64_t v2;

  v1 = &v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v1[32] = -1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration] = 0x3FB999999999999ALL;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B820EC24())
    sub_1B820229C(MEMORY[0x1E0DEE9D8]);
  else
    v2 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches] = v2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = 0;

  sub_1B820EC18();
  __break(1u);
}

id sub_1B8200F08(char *a1)
{
  char *v1;
  objc_class *ObjectType;
  char v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *a1;
  v5 = &v1[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = -1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration] = 0x3FB999999999999ALL;
  v6 = v1;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B820EC24())
    sub_1B820229C(MEMORY[0x1E0DEE9D8]);
  else
    v7 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches] = v7;
  *(_QWORD *)&v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = 0;
  v6[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation] = v4;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_initWithTarget_action_, 0, 0);
}

void TapDragGestureRecognizer.touchesBegan(_:with:)(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;

  OUTLINED_FUNCTION_12();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_1B8201184(v5);
  swift_bridgeObjectRelease();
  v7 = v2;
  v8 = a2;
  if (v6 > 1)
  {
    sub_1B8200564(a1, v7, v8);
    return;
  }
  sub_1B82001E8(a1, v7, v8);
  if (objc_msgSend(v7, sel_state))
  {
    v9 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
  }
  else
  {
    v10 = OUTLINED_FUNCTION_3_14();
    v11 = sub_1B8201184(v10);
    OUTLINED_FUNCTION_5_0();
    v9 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
    if (v11 == 1 && !*(_QWORD *)&v7[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer])
    {
      v14 = OUTLINED_FUNCTION_3_14();
      v15 = (void *)sub_1B8200B0C(v14);
      OUTLINED_FUNCTION_5_0();
      if (v15)
      {
        v16 = objc_msgSend(v7, sel_view);
        objc_msgSend(v15, sel_locationInView_, v16);
        v18 = v17;
        v20 = v19;

        sub_1B82011A4(v18, v20);
      }
      return;
    }
  }
  if (*(_QWORD *)&v7[v9])
  {
    v12 = OUTLINED_FUNCTION_2_14();
    v13 = sub_1B8201184(v12);
    swift_bridgeObjectRelease();
    if (v13 < 2)
      return;
    sub_1B82015B4();
  }
  sub_1B82012D0();
}

uint64_t sub_1B8201184(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_1B820EAF8();
  else
    return *(_QWORD *)(a1 + 16);
}

void sub_1B82011A4(double a1, double a2)
{
  char *v2;
  void *v5;
  double *v6;
  double v7;
  uint64_t v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = (void *)objc_opt_self();
  v6 = (double *)&v2[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_minimumPressDuration];
  swift_beginAccess();
  v7 = *v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v2;
  *(double *)(v8 + 24) = a1;
  *(double *)(v8 + 32) = a2;
  aBlock[4] = sub_1B820488C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B82020E8;
  aBlock[3] = &block_descriptor_2;
  v9 = _Block_copy(aBlock);
  v10 = v2;
  swift_release();
  v11 = objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v9, v7);
  _Block_release(v9);
  v12 = *(void **)&v10[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer];
  *(_QWORD *)&v10[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer] = v11;

}

id sub_1B82012D0()
{
  char *v0;
  char *v1;
  int v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id result;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = &v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations];
  swift_beginAccess();
  v2 = v1[32];
  v3 = (uint64_t *)&v0[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches];
  swift_beginAccess();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_1B8201184(v4);
  swift_bridgeObjectRelease();
  v6 = swift_bridgeObjectRetain();
  if (v5 == 1)
  {
    v7 = (void *)sub_1B8200B0C(v6);
    result = (id)swift_bridgeObjectRelease();
    if (!v7)
      return result;
    v9 = objc_msgSend(v0, sel_view);
    objc_msgSend(v7, sel_locationInView_, v9);
    v11 = v10;
    v13 = v12;

    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  else
  {
    v17 = sub_1B8201184(v6);
    swift_bridgeObjectRelease();
    if (v17 < 2)
    {
      *(_OWORD *)v1 = 0u;
      *((_OWORD *)v1 + 1) = 0u;
      v1[32] = -1;
      return objc_msgSend(v0, sel_setState_, 3);
    }
    v18 = *v3;
    swift_bridgeObjectRetain_n();
    v19 = v0;
    v20 = sub_1B82021AC(v18);
    swift_bridgeObjectRelease();
    v34 = v20;
    sub_1B8203334(&v34, v19);
    swift_bridgeObjectRelease();
    v21 = v34;
    v22 = v34 & 0xC000000000000001;
    sub_1B8207E74(0, (v34 & 0xC000000000000001) == 0, v34);
    if (v22)
      v23 = (id)MEMORY[0x1BCCAE340](0, v21);
    else
      v23 = *(id *)(v21 + 32);
    v24 = v23;
    v25 = objc_msgSend(v19, sel_view);
    objc_msgSend(v24, sel_locationInView_, v25);
    v11 = v26;
    v13 = v27;

    sub_1B8207E74(1, v22 == 0, v21);
    if (v22)
      v28 = (id)MEMORY[0x1BCCAE340](1, v21);
    else
      v28 = *(id *)(v21 + 40);
    v29 = v28;
    swift_release();
    v30 = objc_msgSend(v19, sel_view);
    objc_msgSend(v29, sel_locationInView_, v30);
    v15 = v31;
    v16 = v32;

    v14 = 1;
  }
  *(_QWORD *)v1 = v11;
  *((_QWORD *)v1 + 1) = v13;
  *((_QWORD *)v1 + 2) = v15;
  *((_QWORD *)v1 + 3) = v16;
  v1[32] = v14;
  if (v2 == 255)
    v33 = 1;
  else
    v33 = 2;
  return objc_msgSend(v0, sel_setState_, v33);
}

void sub_1B82015B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    v2 = *(void **)(v0 + v1);
  }
  *(_QWORD *)(v0 + v1) = 0;

}

void TapDragGestureRecognizer.touchesMoved(_:with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  char v5;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches);
  OUTLINED_FUNCTION_12();
  v4 = *v3;
  swift_bridgeObjectRetain();
  sub_1B82016DC(a1, v4);
  LOBYTE(a1) = v5;
  OUTLINED_FUNCTION_5_0();
  if ((a1 & 1) == 0 && !*(_QWORD *)(v1 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer))
    sub_1B82012D0();
  OUTLINED_FUNCTION_24();
}

void sub_1B82016DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  id v26;
  char v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  id v31;
  char v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;

  v2 = a2;
  v4 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (!sub_1B820EAF8())
      return;
  }
  else if (!*(_QWORD *)(a2 + 16))
  {
    return;
  }
  v5 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (!sub_1B820EAF8())
      return;
  }
  else if (!*(_QWORD *)(a1 + 16))
  {
    return;
  }
  if (!v4)
  {
    v6 = *(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_11;
LABEL_13:
    v7 = *(_QWORD *)(a1 + 16);
    goto LABEL_14;
  }
  v6 = sub_1B820EAF8();
  if (!v5)
    goto LABEL_13;
LABEL_11:
  v7 = sub_1B820EAF8();
LABEL_14:
  if (v6 >= v7)
    v8 = a1;
  else
    v8 = v2;
  if (v6 < v7)
    v2 = a1;
  if ((v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B820EAC8();
    sub_1B82025CC();
    sub_1B8202608();
    sub_1B820E96C();
    v8 = v38;
    v35 = v39;
    v9 = v40;
    v10 = v41;
    v11 = v42;
  }
  else
  {
    v12 = -1 << *(_BYTE *)(v8 + 32);
    v35 = v8 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(v8 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = 0;
  }
  sub_1B82025CC();
  v34 = (unint64_t)(v9 + 64) >> 6;
  v15 = v2 & 0xC000000000000001;
  v36 = v2 + 56;
  v33 = v8;
  while (1)
  {
    while (1)
    {
      v16 = v10;
      if ((v8 & 0x8000000000000000) == 0)
        break;
      if (!sub_1B820EB1C())
        goto LABEL_58;
      swift_dynamicCast();
      v19 = v37;
      if (v15)
        goto LABEL_54;
LABEL_31:
      if (*(_QWORD *)(v2 + 16))
      {
        v20 = sub_1B820EA50();
        v21 = -1 << *(_BYTE *)(v2 + 32);
        v22 = v20 & ~v21;
        if (((*(_QWORD *)(v36 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
        {
          v23 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v22);
          v24 = sub_1B820EA5C();

          if ((v24 & 1) != 0)
          {
LABEL_56:

            swift_bridgeObjectRelease();
            goto LABEL_57;
          }
          v25 = ~v21;
          while (1)
          {
            v22 = (v22 + 1) & v25;
            if (((*(_QWORD *)(v36 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
              break;
            v26 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v22);
            v27 = sub_1B820EA5C();

            if ((v27 & 1) != 0)
              goto LABEL_56;
          }
        }
      }

      v8 = v33;
      v15 = v2 & 0xC000000000000001;
    }
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v10 << 6);
      goto LABEL_53;
    }
    v28 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      return;
    }
    if (v28 >= v34)
      goto LABEL_58;
    v29 = *(_QWORD *)(v35 + 8 * v28);
    ++v10;
    if (!v29)
    {
      v10 = v16 + 2;
      if (v16 + 2 >= v34)
        goto LABEL_58;
      v29 = *(_QWORD *)(v35 + 8 * v10);
      if (!v29)
      {
        v10 = v16 + 3;
        if (v16 + 3 >= v34)
          goto LABEL_58;
        v29 = *(_QWORD *)(v35 + 8 * v10);
        if (!v29)
        {
          v10 = v16 + 4;
          if (v16 + 4 >= v34)
            goto LABEL_58;
          v29 = *(_QWORD *)(v35 + 8 * v10);
          if (!v29)
            break;
        }
      }
    }
LABEL_52:
    v11 = (v29 - 1) & v29;
    v18 = __clz(__rbit64(v29)) + (v10 << 6);
LABEL_53:
    v19 = *(void **)(*(_QWORD *)(v8 + 48) + 8 * v18);
    v37 = v19;
    v31 = v19;
    if (!v15)
      goto LABEL_31;
LABEL_54:
    v32 = sub_1B820EB28();

    if ((v32 & 1) != 0)
    {
      swift_bridgeObjectRelease();
LABEL_57:
      sub_1B8202648();
      return;
    }
  }
  v30 = v16 + 5;
  while (v30 < v34)
  {
    v29 = *(_QWORD *)(v35 + 8 * v30++);
    if (v29)
    {
      v10 = v30 - 1;
      goto LABEL_52;
    }
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1B8202648();
}

void TapDragGestureRecognizer.touchesEnded(_:with:)(uint64_t a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  BOOL v5;

  v3 = v1;
  sub_1B820082C(a1, v3);
  if (*(_QWORD *)&v3[OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer]
    && (OUTLINED_FUNCTION_12(), v4 = OUTLINED_FUNCTION_2_14(), v5 = sub_1B8201BC4(v4), swift_bridgeObjectRelease(), v5))
  {
    objc_msgSend(v3, sel_setState_, 4);
  }
  else
  {
    sub_1B82012D0();
  }
  OUTLINED_FUNCTION_24();
}

BOOL sub_1B8201BC4(uint64_t a1)
{
  uint64_t v1;

  if ((a1 & 0xC000000000000001) != 0)
    v1 = sub_1B820EAF8();
  else
    v1 = *(_QWORD *)(a1 + 16);
  return v1 == 0;
}

uint64_t sub_1B8201C08(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t))
{
  uint64_t v8;
  id v9;
  id v10;

  sub_1B82025CC();
  sub_1B8202608();
  v8 = sub_1B820E960();
  v9 = a4;
  v10 = a1;
  a5(v8);

  return swift_bridgeObjectRelease();
}

id TapDragGestureRecognizer.touchesCancelled(_:with:)()
{
  void *v0;

  return objc_msgSend(v0, sel_setState_, 4);
}

Swift::Void __swiftcall TapDragGestureRecognizer.reset()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B82015B4();
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1B820EC24())
  {
    sub_1B820229C(MEMORY[0x1E0DEE9D8]);
    v1 = v4;
  }
  else
  {
    v1 = MEMORY[0x1E0DEE9E8];
  }
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_touches);
  OUTLINED_FUNCTION_12();
  *v2 = v1;
  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_locations;
  OUTLINED_FUNCTION_12();
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_BYTE *)(v3 + 32) = -1;
}

id TapDragGestureRecognizer.__allocating_init(target:action:)(_QWORD *a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v4 = a1[3];
  if (v4)
  {
    v6 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v7 = *(_QWORD *)(v4 - 8);
    v8 = MEMORY[0x1E0C80A78](v6);
    v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v7 + 16))(v10, v8);
    v11 = sub_1B820ECC0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v2), sel_initWithTarget_action_, v11, a2);
  swift_unknownObjectRelease();
  return v12;
}

void TapDragGestureRecognizer.init(target:action:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TapDragGestureRecognizer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1B8201FB8(double a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;

  sub_1B82015B4();
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  v8 = (void *)sub_1B8200B0C(v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = objc_msgSend(a4, sel_view);
    objc_msgSend(v8, sel_locationInView_, v9);
    v11 = v10;

    v12 = vabdd_f64(a1, v11);
    v13 = objc_msgSend(a4, sel_view);
    objc_msgSend(v8, sel_locationInView_, v13);
    v15 = v14;

    v16 = vabdd_f64(a2, v15);
    if (v12 <= 5.0 && v16 <= 5.0)
      sub_1B82012D0();
    else
      objc_msgSend(a4, sel_setState_, 4, v16);

  }
}

void sub_1B82020E8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1B8202138(uint64_t result)
{
  uint64_t v1;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v1 = result;
    if (result)
    {
      sub_1B82025CC();
      result = sub_1B820E900();
      *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) = v1;
    }
    else
    {
      return MEMORY[0x1E0DEE9D8];
    }
  }
  return result;
}

uint64_t sub_1B8202190(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1B82021AC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_1B820EAF8();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x1E0DEE9D8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    sub_1B81FEAA8();
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v3[2] = v2;
    v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1B8204898(&v7, v3 + 4, v2, a1);
  result = sub_1B8202648();
  if (v5 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

void sub_1B820229C(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1B820EC24();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_1B8204808();
      v3 = sub_1B820EB64();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_1B820EC24();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_25;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v27 = v1;
  v28 = v1 & 0xC000000000000001;
  v24 = v1 + 32;
  v25 = v1 & 0xFFFFFFFFFFFFFF8;
  v26 = v4;
  while (1)
  {
    if (v28)
    {
      v8 = (id)MEMORY[0x1BCCAE340](v6, v1);
    }
    else
    {
      if (v6 >= *(_QWORD *)(v25 + 16))
        goto LABEL_28;
      v8 = *(id *)(v24 + 8 * v6);
    }
    v9 = v8;
    v10 = __OFADD__(v6++, 1);
    if (v10)
      break;
    v11 = sub_1B820EA50();
    v12 = -1 << *(_BYTE *)(v3 + 32);
    v13 = v11 & ~v12;
    v14 = v13 >> 6;
    v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
    v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_1B82025CC();
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_1B820EA5C();

      if ((v18 & 1) != 0)
      {
LABEL_20:

        v4 = v26;
        v1 = v27;
        goto LABEL_24;
      }
      v19 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v19;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v21 = sub_1B820EA5C();

        if ((v21 & 1) != 0)
          goto LABEL_20;
      }
      v4 = v26;
      v1 = v27;
    }
    *(_QWORD *)(v7 + 8 * v14) = v16 | v15;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v9;
    v22 = *(_QWORD *)(v3 + 16);
    v10 = __OFADD__(v22, 1);
    v23 = v22 + 1;
    if (v10)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_24:
    if (v6 == v4)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t type metadata accessor for TapDragGestureRecognizer()
{
  return objc_opt_self();
}

uint64_t method lookup function for TapDragGestureRecognizer()
{
  return swift_lookUpClassMethod();
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for TapDragGestureRecognizer.LocationType(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TapDragGestureRecognizer.LocationType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B82025A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1B82025B0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TapDragGestureRecognizer.LocationType()
{
  return &type metadata for TapDragGestureRecognizer.LocationType;
}

unint64_t sub_1B82025CC()
{
  unint64_t result;

  result = qword_1ED553270;
  if (!qword_1ED553270)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED553270);
  }
  return result;
}

unint64_t sub_1B8202608()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1ED553278;
  if (!qword_1ED553278)
  {
    v1 = sub_1B82025CC();
    result = MEMORY[0x1BCCAE964](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED553278);
  }
  return result;
}

uint64_t sub_1B8202648()
{
  return swift_release();
}

uint64_t sub_1B8202650(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  void *v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_1B820EB04();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1B82025CC();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1B820EAF8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_1B82028C8(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_1B8202A98();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_1B8202D2C((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v10 = sub_1B820EA50();
    v11 = -1 << *(_BYTE *)(v6 + 32);
    v12 = v10 & ~v11;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
    {
      sub_1B82025CC();
      v13 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v12);
      v14 = sub_1B820EA5C();

      if ((v14 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v18 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v12);
        *a1 = v18;
        v19 = v18;
        return 0;
      }
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v12);
        v17 = sub_1B820EA5C();

        if ((v17 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_1B8202DAC((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1B82028C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  sub_1B8204808();
  v2 = sub_1B820EB58();
  v14 = v2;
  sub_1B820EAC8();
  if (!sub_1B820EB1C())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_1B82025CC();
  while (1)
  {
    swift_dynamicCast();
    v2 = v14;
    if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
    {
      sub_1B8202A98();
      v2 = v14;
    }
    result = sub_1B820EA50();
    v4 = v2 + 56;
    v5 = -1 << *(_BYTE *)(v2 + 32);
    v6 = result & ~v5;
    v7 = v6 >> 6;
    if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) == 0)
      break;
    v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    ++*(_QWORD *)(v2 + 16);
    if (!sub_1B820EB1C())
      goto LABEL_16;
  }
  v9 = 0;
  v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    v11 = v7 == v10;
    if (v7 == v10)
      v7 = 0;
    v9 |= v11;
    v12 = *(_QWORD *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B8202A98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  sub_1B8204808();
  v3 = sub_1B820EB4C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_1B820EA50();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_38;
      if (v15 >= v9)
        goto LABEL_32;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_32;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_32;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              v1 = v28;
              v27 = 1 << *(_BYTE *)(v2 + 32);
              if (v27 > 63)
                sub_1B8202190(0, (unint64_t)(v27 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v27;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v12 >= v9)
                  goto LABEL_32;
                v16 = v6[v12];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v12 = v17;
          }
        }
      }
LABEL_20:
      v8 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1B8202D2C(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1B820EA50();
  result = sub_1B820EAB0();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_1B8202DAC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_1B8202A98();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1B8202F20();
      goto LABEL_14;
    }
    sub_1B82030C4();
  }
  v8 = *v3;
  v9 = sub_1B820EA50();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1B82025CC();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_1B820EA5C();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_1B820ECD8();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_1B820EA5C();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id sub_1B8202F20()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;

  v1 = v0;
  sub_1B8204808();
  v2 = *v0;
  v3 = sub_1B820EB40();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = v20;
    result = v20;
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B82030C4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  sub_1B8204808();
  v3 = sub_1B820EB4C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_1B820EA50();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_36;
    if (v15 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_32;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_32;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v8 = (v16 - 1) & v16;
  }
  v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1B8203334(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  id v7;
  uint64_t v8[2];

  v3 = *a1;
  v4 = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_1B8204B7C();
  v6 = *(_QWORD *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  v7 = v4;
  sub_1B82033D0(v8, v7);
  sub_1B820EBAC();

}

void sub_1B82033D0(uint64_t *a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  id v63;
  id v64;
  id v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  double v71;
  double v72;
  double v73;
  double v74;
  BOOL v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  uint64_t v105;
  char v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  BOOL v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  char *v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;

  v4 = a1[1];
  v5 = a2;
  v6 = sub_1B820ECA8();
  if (v6 >= v4)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (v4)
        sub_1B8203D50(0, v4, 1, a1, (_BYTE *)v5);
      else

      goto LABEL_121;
    }
    goto LABEL_144;
  }
  v7 = v6;
  v144 = v2;
  v8 = sub_1B8202138(v4 / 2);
  v142 = v9;
  v152 = v8;
  v151 = (void *)v5;
  v140 = v4;
  v135 = a1;
  if (v4 <= 0)
  {
    v12 = (char *)MEMORY[0x1E0DEE9D8];
    v80 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_105:
    if (v80 < 2)
    {
LABEL_119:
      swift_bridgeObjectRelease();
      if (v4 >= -1)
        goto LABEL_120;
      goto LABEL_149;
    }
    v129 = *v135;
    v150 = *v135;
    while (1)
    {
      v130 = v80 - 2;
      if (v80 < 2)
        break;
      if (!v129)
        goto LABEL_153;
      v131 = *(_QWORD *)&v12[16 * v130 + 32];
      v5 = *(_QWORD *)&v12[16 * v80 + 24];
      sub_1B8203ED8((char *)(v129 + 8 * v131), (char *)(v129 + 8 * *(_QWORD *)&v12[16 * v80 + 16]), v129 + 8 * v5, v142, v151);
      if (v144)
        goto LABEL_102;
      if (v5 < v131)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_1B8204318((uint64_t)v12);
      if (v130 >= *((_QWORD *)v12 + 2))
        goto LABEL_140;
      v132 = &v12[16 * v130 + 32];
      *(_QWORD *)v132 = v131;
      *((_QWORD *)v132 + 1) = v5;
      v133 = *((_QWORD *)v12 + 2);
      if (v80 > v133)
        goto LABEL_141;
      v5 = v133 - 1;
      memmove(&v12[16 * v80 + 16], &v12[16 * v80 + 32], 16 * (v133 - v80));
      *((_QWORD *)v12 + 2) = v133 - 1;
      v80 = v133 - 1;
      v4 = v140;
      v129 = v150;
      if (v133 <= 2)
        goto LABEL_119;
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:

    __break(1u);
LABEL_151:

    __break(1u);
LABEL_152:

    __break(1u);
LABEL_153:

    __break(1u);
    return;
  }
  v138 = v7;
  v10 = 0;
  v11 = *a1;
  v145 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
  v134 = *a1 - 8;
  v12 = (char *)MEMORY[0x1E0DEE9D8];
  v149 = *a1;
  while (1)
  {
    v13 = v10;
    v14 = v10 + 1;
    v141 = v10;
    if (v10 + 1 < v4)
    {
      v15 = *(void **)(v11 + 8 * v14);
      v16 = *(void **)(v11 + 8 * v10);
      v17 = *(_BYTE *)(v5 + v145);
      v18 = v15;
      v19 = v16;
      v20 = objc_msgSend((id)v5, sel_view);
      objc_msgSend(v18, sel_locationInView_, v20);
      v22 = v21;
      v24 = v23;

      v25 = objc_msgSend((id)v5, sel_view);
      v13 = v141;
      objc_msgSend(v19, sel_locationInView_, v25);
      v27 = v26;
      v29 = v28;

      v14 = v141 + 2;
      if ((v17 & 1) != 0)
        v30 = v24 < v29;
      else
        v30 = v22 < v27;
      v31 = v30;
      v146 = v31;
      v11 = v149;
      if (v14 < v4)
      {
        v136 = v12;
        do
        {
          v32 = v14;
          v33 = v11 + 8 * v13;
          v34 = *(void **)(v33 + 8);
          v35 = *((_BYTE *)v151 + v145);
          v36 = *(id *)(v33 + 16);
          v37 = v34;
          v38 = objc_msgSend(v151, sel_view);
          objc_msgSend(v36, sel_locationInView_, v38);
          v40 = v39;
          v42 = v41;

          v43 = objc_msgSend(v151, sel_view);
          objc_msgSend(v37, sel_locationInView_, v43);
          v45 = v44;
          v47 = v46;

          if ((v35 & 1) != 0)
          {
            v11 = v149;
            v14 = v32;
            if (v146 == v42 >= v47)
            {
              v14 = v13 + 2;
              goto LABEL_19;
            }
          }
          else
          {
            v11 = v149;
            v14 = v32;
            if (((v146 ^ (v40 >= v45)) & 1) == 0)
              goto LABEL_19;
          }
          ++v14;
          v48 = v13 + 1;
          v49 = v13 + 3;
          ++v13;
        }
        while (v49 < v140);
        v14 = v48 + 2;
LABEL_19:
        v4 = v140;
        v13 = v141;
        v12 = v136;
        v5 = (int64_t)v151;
      }
      if (v146)
      {
        if (v14 < v13)
          goto LABEL_146;
        if (v13 < v14)
        {
          v50 = (uint64_t *)(v134 + 8 * v14);
          v51 = v14;
          v52 = v13;
          v53 = (uint64_t *)(v11 + 8 * v13);
          do
          {
            if (v52 != --v51)
            {
              if (!v11)
                goto LABEL_152;
              v54 = *v53;
              *v53 = *v50;
              *v50 = v54;
            }
            ++v52;
            --v50;
            ++v53;
          }
          while (v52 < v51);
        }
      }
    }
    if (v14 < v4)
    {
      if (__OFSUB__(v14, v13))
        goto LABEL_143;
      if (v14 - v13 < v138)
      {
        if (__OFADD__(v13, v138))
          goto LABEL_147;
        if (v13 + v138 >= v4)
          v55 = v4;
        else
          v55 = v13 + v138;
        if (v55 < v13)
          goto LABEL_148;
        if (v14 != v55)
        {
          v137 = v12;
          v56 = v134 + 8 * v14;
          v139 = v55;
          do
          {
            v57 = v56;
            v58 = *(void **)(v11 + 8 * v14);
            v59 = v13;
            v143 = v57;
            v60 = v57;
            v147 = v14;
            while (1)
            {
              v61 = *(void **)v60;
              v5 = (int64_t)v151;
              v62 = *((_BYTE *)v151 + v145);
              v63 = v58;
              v64 = v61;
              v65 = objc_msgSend(v151, sel_view);
              objc_msgSend(v63, sel_locationInView_, v65);
              v67 = v66;
              v69 = v68;

              v70 = objc_msgSend(v151, sel_view);
              objc_msgSend(v64, sel_locationInView_, v70);
              v72 = v71;
              v74 = v73;

              v75 = (v62 & 1) != 0 ? v69 < v74 : v67 < v72;
              v11 = v149;
              if (!v75)
                break;
              v77 = v147;
              if (!v149)
                goto LABEL_150;
              v76 = *(void **)v60;
              v58 = *(void **)(v60 + 8);
              *(_QWORD *)v60 = v58;
              *(_QWORD *)(v60 + 8) = v76;
              v60 -= 8;
              if (v147 == ++v59)
                goto LABEL_46;
            }
            v77 = v147;
LABEL_46:
            v14 = v77 + 1;
            v56 = v143 + 8;
            v13 = v141;
          }
          while (v14 != v139);
          v14 = v139;
          v12 = v137;
          v5 = (int64_t)v151;
        }
      }
    }
    if (v14 < v13)
      goto LABEL_142;
    v148 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_1B8204228(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v79 = *((_QWORD *)v12 + 2);
    v78 = *((_QWORD *)v12 + 3);
    v80 = v79 + 1;
    v11 = v149;
    if (v79 >= v78 >> 1)
    {
      v128 = sub_1B8204228((char *)(v78 > 1), v79 + 1, 1, v12);
      v11 = v149;
      v12 = v128;
    }
    *((_QWORD *)v12 + 2) = v80;
    v81 = &v12[16 * v79 + 32];
    *(_QWORD *)v81 = v13;
    *((_QWORD *)v81 + 1) = v148;
    if (v79)
      break;
    v80 = 1;
LABEL_97:
    v4 = v140;
    v10 = v148;
    if (v148 >= v140)
      goto LABEL_105;
  }
  v82 = v12 + 32;
  while (1)
  {
    v83 = v80 - 1;
    if (v80 >= 4)
    {
      v88 = &v82[16 * v80];
      v89 = *((_QWORD *)v88 - 8);
      v90 = *((_QWORD *)v88 - 7);
      v94 = __OFSUB__(v90, v89);
      v91 = v90 - v89;
      if (v94)
        goto LABEL_127;
      v93 = *((_QWORD *)v88 - 6);
      v92 = *((_QWORD *)v88 - 5);
      v94 = __OFSUB__(v92, v93);
      v86 = v92 - v93;
      v87 = v94;
      if (v94)
        goto LABEL_128;
      v95 = v80 - 2;
      v96 = &v82[16 * v80 - 32];
      v98 = *(_QWORD *)v96;
      v97 = *((_QWORD *)v96 + 1);
      v94 = __OFSUB__(v97, v98);
      v99 = v97 - v98;
      if (v94)
        goto LABEL_129;
      v94 = __OFADD__(v86, v99);
      v100 = v86 + v99;
      if (v94)
        goto LABEL_131;
      if (v100 >= v91)
      {
        v118 = &v82[16 * v83];
        v120 = *(_QWORD *)v118;
        v119 = *((_QWORD *)v118 + 1);
        v94 = __OFSUB__(v119, v120);
        v121 = v119 - v120;
        if (v94)
          goto LABEL_137;
        v111 = v86 < v121;
        goto LABEL_86;
      }
    }
    else
    {
      if (v80 != 3)
      {
        v112 = *((_QWORD *)v12 + 4);
        v113 = *((_QWORD *)v12 + 5);
        v94 = __OFSUB__(v113, v112);
        v105 = v113 - v112;
        v106 = v94;
        goto LABEL_80;
      }
      v85 = *((_QWORD *)v12 + 4);
      v84 = *((_QWORD *)v12 + 5);
      v94 = __OFSUB__(v84, v85);
      v86 = v84 - v85;
      v87 = v94;
    }
    if ((v87 & 1) != 0)
      goto LABEL_130;
    v95 = v80 - 2;
    v101 = &v82[16 * v80 - 32];
    v103 = *(_QWORD *)v101;
    v102 = *((_QWORD *)v101 + 1);
    v104 = __OFSUB__(v102, v103);
    v105 = v102 - v103;
    v106 = v104;
    if (v104)
      goto LABEL_132;
    v107 = &v82[16 * v83];
    v109 = *(_QWORD *)v107;
    v108 = *((_QWORD *)v107 + 1);
    v94 = __OFSUB__(v108, v109);
    v110 = v108 - v109;
    if (v94)
      goto LABEL_134;
    if (__OFADD__(v105, v110))
      goto LABEL_136;
    if (v105 + v110 >= v86)
    {
      v111 = v86 < v110;
LABEL_86:
      if (v111)
        v83 = v95;
      goto LABEL_88;
    }
LABEL_80:
    if ((v106 & 1) != 0)
      goto LABEL_133;
    v114 = &v82[16 * v83];
    v116 = *(_QWORD *)v114;
    v115 = *((_QWORD *)v114 + 1);
    v94 = __OFSUB__(v115, v116);
    v117 = v115 - v116;
    if (v94)
      goto LABEL_135;
    if (v117 < v105)
      goto LABEL_97;
LABEL_88:
    v122 = v83 - 1;
    if (v83 - 1 >= v80)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v11)
      goto LABEL_151;
    v5 = (int64_t)&v82[16 * v122];
    v123 = *(_QWORD *)v5;
    v124 = v83;
    v125 = &v82[16 * v83];
    v126 = *((_QWORD *)v125 + 1);
    sub_1B8203ED8((char *)(v11 + 8 * *(_QWORD *)v5), (char *)(v11 + 8 * *(_QWORD *)v125), v11 + 8 * v126, v142, v151);
    if (v144)
      break;
    if (v126 < v123)
      goto LABEL_124;
    if (v124 > *((_QWORD *)v12 + 2))
      goto LABEL_125;
    *(_QWORD *)v5 = v123;
    v82 = v12 + 32;
    *(_QWORD *)&v12[16 * v122 + 40] = v126;
    v127 = *((_QWORD *)v12 + 2);
    if (v124 >= v127)
      goto LABEL_126;
    v144 = 0;
    v80 = v127 - 1;
    memmove(v125, v125 + 16, 16 * (v127 - 1 - v124));
    *((_QWORD *)v12 + 2) = v127 - 1;
    v11 = v149;
    v5 = (int64_t)v151;
    if (v127 <= 2)
      goto LABEL_97;
  }
LABEL_102:
  swift_bridgeObjectRelease();
  if (v140 < -1)
    goto LABEL_145;
LABEL_120:
  *(_QWORD *)((v152 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_1B820E8DC();

  v5 = (int64_t)v151;
  swift_bridgeObjectRelease();
LABEL_121:

}

void sub_1B8203D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _BYTE *a5)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  void *v23;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  if (a3 != a2)
  {
    v27 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    v29 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v6 = *(void **)(v29 + 8 * a3);
      v7 = a1;
      v26 = v5;
      v30 = a3;
      do
      {
        v8 = *(void **)v5;
        v9 = a5[v27];
        v10 = v6;
        v11 = v8;
        v12 = objc_msgSend(a5, sel_view);
        objc_msgSend(v10, sel_locationInView_, v12);
        v14 = v13;
        v16 = v15;

        v17 = objc_msgSend(a5, sel_view);
        objc_msgSend(v11, sel_locationInView_, v17);
        v19 = v18;
        v21 = v20;

        if ((v9 & 1) != 0)
          v22 = v16 < v21;
        else
          v22 = v14 < v19;
        if (!v22)
          break;
        if (!v29)
        {
          __break(1u);
          return;
        }
        v23 = *(void **)v5;
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)v5 = v6;
        *(_QWORD *)(v5 + 8) = v23;
        v5 -= 8;
        ++v7;
      }
      while (v30 != v7);
      a3 = v30 + 1;
      v5 = v26 + 8;
      if (v30 + 1 != a2)
        continue;
      break;
    }
  }

}

uint64_t sub_1B8203ED8(char *a1, char *a2, unint64_t a3, char *a4, _BYTE *a5)
{
  void **v5;
  id *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id *v29;
  BOOL v30;
  id *v33;
  id *v34;
  id *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  uint64_t v51;
  uint64_t v54;
  id *v55;
  uint64_t v56;
  char v57;
  void **v59;
  unint64_t v60;
  void **v61;
  void **v62;

  v5 = (void **)a4;
  v7 = (id *)a2;
  v8 = (id *)a1;
  v9 = a2 - a1;
  v10 = (a2 - a1) / 8;
  v11 = a3 - (_QWORD)a2;
  v12 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v10 >= v12)
  {
    sub_1B81E8158(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v13 = &v5[v12];
    if (v8 >= v7 || v11 <= 7)
      goto LABEL_43;
    v54 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    v33 = (id *)(a3 - 8);
    v62 = v5;
    while (1)
    {
      v60 = (unint64_t)v13;
      v34 = v13 - 1;
      v55 = v33 + 1;
      v35 = v7 - 1;
      v36 = *(v7 - 1);
      v57 = a5[v54];
      v37 = *(v13 - 1);
      v38 = v36;
      v39 = objc_msgSend(a5, sel_view);
      objc_msgSend(v37, sel_locationInView_, v39);
      v41 = v40;
      v43 = v42;

      v44 = objc_msgSend(a5, sel_view);
      objc_msgSend(v38, sel_locationInView_, v44);
      v46 = v45;
      v48 = v47;

      if ((v57 & 1) != 0)
      {
        if (v43 < v48)
          goto LABEL_32;
      }
      else if (v41 < v46)
      {
LABEL_32:
        v49 = v55 != v7 || v33 >= v7;
        --v7;
        v13 = (void **)v60;
        goto LABEL_36;
      }
      v49 = v55 != (id *)v60 || (unint64_t)v33 >= v60;
      v35 = v34;
      v13 = v34;
LABEL_36:
      if (v49)
        *v33 = *v35;
      --v33;
      v5 = v62;
      if (v7 <= v8 || v13 <= v62)
        goto LABEL_43;
    }
  }
  sub_1B81E8158(a1, (a2 - a1) / 8, a4);
  v13 = &v5[v10];
  if ((unint64_t)v7 < a3 && v9 > 7)
  {
    v56 = OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_orientation;
    v59 = &v5[v10];
    do
    {
      v61 = v5;
      v15 = *v5;
      v16 = a5[v56];
      v17 = *v7;
      v18 = v15;
      v19 = objc_msgSend(a5, sel_view);
      objc_msgSend(v17, sel_locationInView_, v19);
      v21 = v20;
      v23 = v22;

      v24 = objc_msgSend(a5, sel_view);
      objc_msgSend(v18, sel_locationInView_, v24);
      v26 = v25;
      v28 = v27;

      if ((v16 & 1) != 0)
      {
        if (v23 < v28)
          goto LABEL_11;
      }
      else if (v21 < v26)
      {
LABEL_11:
        v29 = v7;
        v30 = v8 == v7++;
        goto LABEL_12;
      }
      v29 = v5++;
      v30 = v8 == v61;
LABEL_12:
      v13 = v59;
      if (!v30)
        *v8 = *v29;
      ++v8;
    }
    while (v5 < v59 && (unint64_t)v7 < a3);
  }
  v7 = v8;
LABEL_43:
  v51 = v13 - v5;
  if (v7 != v5 || v7 >= &v5[v51])
    memmove(v7, v5, 8 * v51);

  return 1;
}

char *sub_1B8204228(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_1B8204EE8();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1B8204318(uint64_t a1)
{
  return sub_1B8204228(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1B820432C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v18;

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) == 0)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B820EA50();
    v8 = -1 << *(_BYTE *)(v3 + 32);
    v9 = v7 & ~v8;
    if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
    {
      sub_1B82025CC();
      v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
      v11 = sub_1B820EA5C();

      if ((v11 & 1) != 0)
      {
LABEL_9:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v16 = *v1;
        v18 = *v1;
        *v1 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_1B8202F20();
          v16 = v18;
        }
        v6 = *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * v9);
        sub_1B8204674(v9);
        *v1 = v18;
        goto LABEL_12;
      }
      v12 = ~v8;
      while (1)
      {
        v9 = (v9 + 1) & v12;
        if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          break;
        v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
        v14 = sub_1B820EA5C();

        if ((v14 & 1) != 0)
          goto LABEL_9;
      }
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v4 = a1;
  v5 = sub_1B820EB28();

  if ((v5 & 1) == 0)
    goto LABEL_13;
  v6 = sub_1B82044EC();
LABEL_12:
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1B82044EC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v1 = v0;
  swift_bridgeObjectRelease();
  v2 = sub_1B820EAF8();
  v3 = swift_unknownObjectRetain();
  v4 = sub_1B82028C8(v3, v2);
  v15 = v4;
  swift_retain();
  v5 = sub_1B820EA50();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    sub_1B82025CC();
    v8 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
    v9 = sub_1B820EA5C();

    if ((v9 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v13 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v7);
      sub_1B8204674(v7);
      if ((sub_1B820EA5C() & 1) != 0)
      {
        *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      v10 = ~v6;
      while (1)
      {
        v7 = (v7 + 1) & v10;
        if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          break;
        v11 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
        v12 = sub_1B820EA5C();

        if ((v12 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_1B8204674(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1B820EAA4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v11 = sub_1B820EA50();

        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_15:
            v15 = *(_QWORD *)(v3 + 48);
            v16 = (_QWORD *)(v15 + 8 * v2);
            v17 = (_QWORD *)(v15 + 8 * v6);
            v18 = v2 != v6 || v16 >= v17 + 1;
            v2 = v6;
            if (v18)
            {
              *v16 = *v17;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_15;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_1B8204808()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553280)
  {
    sub_1B82025CC();
    sub_1B8202608();
    v0 = sub_1B820EB70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553280);
  }
}

uint64_t sub_1B8204868()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B820488C(uint64_t a1)
{
  uint64_t v1;

  sub_1B8201FB8(*(double *)(v1 + 24), *(double *)(v1 + 32), a1, *(void **)(v1 + 16));
}

_QWORD *sub_1B8204898(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;

  v4 = a4;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1B820EAC8();
    sub_1B82025CC();
    sub_1B8202608();
    result = (_QWORD *)sub_1B820E96C();
    v4 = v26;
    v8 = v27;
    v9 = v28;
    v10 = v29;
    v11 = v30;
  }
  else
  {
    v10 = 0;
    v12 = -1 << *(_BYTE *)(a4 + 32);
    v8 = a4 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(a4 + 56);
  }
  if (!a2)
  {
    v15 = 0;
LABEL_47:
    *v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v10;
    v7[4] = v11;
    return (_QWORD *)v15;
  }
  if (!a3)
  {
    v15 = 0;
    goto LABEL_47;
  }
  if (a3 < 0)
    goto LABEL_49;
  v15 = 0;
  v24 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1B820EB1C())
        goto LABEL_46;
      sub_1B82025CC();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v18 = v25;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v25)
        goto LABEL_46;
      goto LABEL_28;
    }
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v17 = v16 | (v10 << 6);
      goto LABEL_27;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v19 >= v24)
    {
      v11 = 0;
      goto LABEL_46;
    }
    v20 = *(_QWORD *)(v8 + 8 * v19);
    if (v20)
      goto LABEL_26;
    v21 = v10 + 2;
    if (v10 + 2 >= v24)
    {
      v11 = 0;
      ++v10;
      goto LABEL_46;
    }
    v20 = *(_QWORD *)(v8 + 8 * v21);
    if (!v20)
    {
      if (v10 + 3 >= v24)
        goto LABEL_43;
      v20 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v20)
      {
        v19 = v10 + 3;
        goto LABEL_26;
      }
      v21 = v10 + 4;
      if (v10 + 4 >= v24)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_46;
      }
      v20 = *(_QWORD *)(v8 + 8 * v21);
      if (!v20)
      {
        v19 = v10 + 5;
        if (v10 + 5 >= v24)
        {
LABEL_43:
          v11 = 0;
          v10 = v21;
          goto LABEL_46;
        }
        v20 = *(_QWORD *)(v8 + 8 * v19);
        if (!v20)
        {
          v22 = v10 + 6;
          while (v22 < v24)
          {
            v20 = *(_QWORD *)(v8 + 8 * v22++);
            if (v20)
            {
              v19 = v22 - 1;
              goto LABEL_26;
            }
          }
          v11 = 0;
          v10 = v24 - 1;
          goto LABEL_46;
        }
        goto LABEL_26;
      }
    }
    v19 = v21;
LABEL_26:
    v11 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v19 << 6);
    v10 = v19;
LABEL_27:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    v18 = result;
    if (!result)
      goto LABEL_46;
LABEL_28:
    ++v15;
    *a2++ = v18;
    if (v15 == a3)
    {
      v15 = a3;
LABEL_46:
      v9 = v23;
      goto LABEL_47;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

void sub_1B8204B7C()
{
  JUMPOUT(0x1BCCAE454);
}

uint64_t sub_1B8204B90(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_1B820EB34();
  else
    return 1 << *(_BYTE *)(a1 + 32);
}

void sub_1B8204BE0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_1B820EAE0() == *(_DWORD *)(a4 + 36))
      {
        sub_1B820EAEC();
        sub_1B82025CC();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_1B820EA50();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_1B820EA5C();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_1B820EA5C();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x1BCCAE2C8](a1, a2, v7);
  sub_1B82025CC();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1B8204E28(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

BOOL sub_1B8204EA8(uint64_t a1, int a2, char a3, uint64_t a4, int a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0)
LABEL_9:
      JUMPOUT(0x1BCCAE28CLL);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((a6 & 1) != 0)
    goto LABEL_8;
  if (a2 != a5)
  {
    __break(1u);
    goto LABEL_8;
  }
  return a1 == a4;
}

uint64_t sub_1B8204EDC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_1B8204EE8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF19BF08)
  {
    sub_1B8204F3C();
    v0 = sub_1B820ECB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF19BF08);
  }
}

void sub_1B8204F3C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553288)
  {
    v0 = sub_1B820E9B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553288);
  }
}

uint64_t dispatch thunk of ChartModelType.coordinateSpace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ChartModelType.series.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

id sub_1B8204FA0()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  qword_1EF19BF10 = 0;
  qword_1EF19BF18 = 0x3FF0000000000000;
  qword_1EF19BF20 = (uint64_t)result;
  byte_1EF19BF28 = 0;
  return result;
}

id static Stroke.default.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v6;

  if (qword_1EF19BAB0 != -1)
    swift_once();
  v2 = qword_1EF19BF18;
  v3 = qword_1EF19BF20;
  v6 = (id)qword_1EF19BF20;
  v4 = byte_1EF19BF28;
  *(_QWORD *)a1 = qword_1EF19BF10;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t Stroke.style.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

double Stroke.width.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

id Stroke.color.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void Stroke.lineCap.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

uint64_t initializeWithCopy for Stroke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for Stroke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Stroke(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Stroke(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for Stroke(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GridPathGeneratorOptions(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 49))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 48);
      v4 = v3 >= 2;
      v2 = v3 - 2;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GridPathGeneratorOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for GridPathGeneratorOptions()
{
  return &type metadata for GridPathGeneratorOptions;
}

uint64_t sub_1B82052E0()
{
  return swift_initClassMetadata2();
}

_QWORD *sub_1B8205324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t sub_1B8205374(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_1B82053A8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1B82053CC()
{
  sub_1B82053A8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InteractionHandlerWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InteractionHandlerWrapper);
}

uint64_t sub_1B82053F8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

void *GridPathGenerator.path(for:options:)(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  id v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  id v26;
  double v27;
  double v30;

  v2 = *a1;
  v3 = *((_QWORD *)a1 + 1);
  v5 = *(double *)a2;
  v4 = *(double *)(a2 + 8);
  v6 = *(double *)(a2 + 16);
  v7 = *(double *)(a2 + 24);
  v8 = *(double *)(a2 + 32);
  v9 = *(double *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3508]), sel_init);
  v12 = v4;
  v13 = v11;
  v14 = v5 - v7 - v9;
  v15 = v4 - v6 - v8;
  v30 = v6;
  v16 = v6;
  v17 = v7;
  v18 = v14;
  v19 = v15;
  if ((v10 & 1) == 0)
  {
    v16 = *MEMORY[0x1E0DC49E8];
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = v5;
    v19 = v12;
  }
  v20 = *(_QWORD *)(v3 + 16);
  if (v20)
  {
    v21 = (void **)(v3 + 40);
    swift_bridgeObjectRetain();
    v22 = 1;
    while (1)
    {
      v23 = *((double *)v21 - 1);
      v24 = *v21;
      if (v2)
      {
        v25 = v7 + v14 * v23;
        v26 = v24;
        objc_msgSend(v13, sel_moveToPoint_, v25, v16);
        objc_msgSend(v13, sel_addLineToPoint_, v25, v19);
      }
      else
      {
        v27 = v30 + v15 * v23;
        v26 = v24;
        objc_msgSend(v13, sel_moveToPoint_, v17, v27);
        objc_msgSend(v13, sel_addLineToPoint_, v18, v27);
      }

      if (v20 == v22)
        break;
      v21 += 2;
      if (__OFADD__(v22++, 1))
      {
        __break(1u);
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t GridPathGenerator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t GridPathGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void *sub_1B82055C4(unsigned __int8 *a1, uint64_t a2)
{
  return GridPathGenerator.path(for:options:)(a1, a2);
}

uint64_t dispatch thunk of GridPathGeneratorType.path(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for GridPathGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for GridPathGenerator()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for GridLayoutAttributes()
{
  return &type metadata for GridLayoutAttributes;
}

uint64_t sub_1B820561C(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v5 = sub_1B820E480();
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v28 = a2;
    v24[1] = v2;
    v29 = MEMORY[0x1E0DEE9D8];
    sub_1B81E7560(0, v8, 0);
    v9 = v29;
    v25 = OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter;
    v10 = (uint64_t *)(a1 + 40);
    do
    {
      v11 = *(v10 - 1);
      v12 = *v10;
      swift_bridgeObjectRetain_n();
      sub_1B82062C0(v11, v12);
      if ((v13 & 1) != 0)
      {
        v17 = 0;
        v19 = 0xE000000000000000;
      }
      else
      {
        sub_1B820E474();
        v14 = *(id *)&v28[v25];
        v15 = (void *)sub_1B820E468();
        v16 = objc_msgSend(v14, sel_stringFromDate_, v15);

        v17 = sub_1B820E888();
        v19 = v18;

        (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
      }
      swift_bridgeObjectRelease();
      v29 = v9;
      v21 = *(_QWORD *)(v9 + 16);
      v20 = *(_QWORD *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_1B81E7560((char *)(v20 > 1), v21 + 1, 1);
        v9 = v29;
      }
      v10 += 2;
      *(_QWORD *)(v9 + 16) = v21 + 1;
      v22 = v9 + 16 * v21;
      *(_QWORD *)(v22 + 32) = v17;
      *(_QWORD *)(v22 + 40) = v19;
      --v8;
    }
    while (v8);

  }
  else
  {

    return MEMORY[0x1E0DEE9D8];
  }
  return v9;
}

uint64_t sub_1B8205804(uint64_t a1, void (*a2)(uint64_t, _QWORD *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  sub_1B820EBB8();
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = (uint64_t *)(a1 + 48);
    do
    {
      v7 = *v6;
      v8 = *(v6 - 1);
      v10[0] = *(v6 - 2);
      v10[1] = v8;
      v10[2] = v7;
      swift_bridgeObjectRetain();
      a2(v5, v10);
      swift_bridgeObjectRelease();
      sub_1B820EBA0();
      sub_1B820EBC4();
      sub_1B820EBD0();
      sub_1B820EBAC();
      v6 += 3;
      ++v5;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void sub_1B8205920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 == a2)
  {
LABEL_2:
    swift_bridgeObjectRelease();
    return;
  }
  v7 = a1;
  if (a2 < a1)
    goto LABEL_27;
  v9 = a6 - a4;
  if (!__OFSUB__(a6, a4))
  {
    v11 = MEMORY[0x1E0DEE9D8];
    while (1)
    {
      if (v7 >= a2)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        break;
      }
      v12 = v7 * a5;
      if ((unsigned __int128)(v7 * (__int128)a5) >> 64 != (v7 * a5) >> 63)
        goto LABEL_25;
      if (v12 < 1)
      {
        if (v9 <= 0 && v12 < v9)
          goto LABEL_22;
      }
      else if ((v9 & 0x8000000000000000) == 0 && v9 < v12)
      {
        goto LABEL_22;
      }
      v14 = a4 + v12;
      if (__OFADD__(a4, v12))
        goto LABEL_26;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B81EC0A0();
        v11 = v16;
      }
      v15 = *(_QWORD *)(v11 + 16);
      if (v15 >= *(_QWORD *)(v11 + 24) >> 1)
      {
        sub_1B81EC0A0();
        v11 = v17;
      }
      *(_QWORD *)(v11 + 16) = v15 + 1;
      *(_QWORD *)(v11 + 8 * v15 + 32) = v14;
LABEL_22:
      if (a2 == ++v7)
        goto LABEL_2;
    }
  }
  __break(1u);
}

id sub_1B8205A78(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v4 = &v1[OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v1[OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakAssign();
  v8.receiver = v1;
  v8.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v8, sel_initWithAccessibilityContainer_, a1);

  return v6;
}

double sub_1B8205B1C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  double v3;

  v1 = MEMORY[0x1BCCAEA60](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
  if (!v1)
    return 0.0;
  v2 = (void *)v1;
  v3 = sub_1B82074EC(v0);

  return v3;
}

uint64_t sub_1B8205BCC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel);
  if (!*(_QWORD *)(v0
                  + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedLabel
                  + 8))
  {
    v2 = MEMORY[0x1BCCAEA60](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
    if (v2)
    {
      v3 = (void *)v2;
      sub_1B8207808(v0);
      v5 = v4;
      v7 = v6;

      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
      v7 = 0;
    }
    *v1 = v5;
    v1[1] = v7;
    swift_bridgeObjectRelease();
  }
  v8 = *v1;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_1B8205C80()
{
  return swift_bridgeObjectRelease();
}

id sub_1B8205C94(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  a3();
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1B820E864();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t sub_1B8205CF8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue);
  if (!*(_QWORD *)(v0
                  + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_cachedValue
                  + 8))
  {
    v2 = MEMORY[0x1BCCAEA60](v0 + OBJC_IVAR____TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement_seriesElement);
    if (v2)
    {
      v3 = (void *)v2;
      sub_1B8207808(v0);
      v5 = v4;
      v7 = v6;

      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
      v7 = 0;
    }
    *v1 = v5;
    v1[1] = v7;
    swift_bridgeObjectRelease();
  }
  v8 = *v1;
  swift_bridgeObjectRetain();
  return v8;
}

void sub_1B8205DAC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    v6 = sub_1B820E888();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a1;
  a4(v6, v8);

}

void sub_1B8205E1C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1B8205E94()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1B8205EE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8205F64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements) = a1;
  return swift_bridgeObjectRelease();
}

id sub_1B8205F7C(void *a1, uint64_t *a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v7 = *a2;
  swift_weakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements] = 0;
  v8 = &v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series];
  *(_QWORD *)v8 = v7;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(a2 + 1);
  swift_weakAssign();
  sub_1B81EA224(a3, (uint64_t)&v3[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel]);
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3578]);
  v10 = v3;
  *(_QWORD *)&v10[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter] = OUTLINED_FUNCTION_10_3();

  v20.receiver = v10;
  v20.super_class = (Class)type metadata accessor for LineSeriesAccessibilityElement();
  v11 = objc_msgSendSuper2(&v20, sel_initWithAccessibilityContainer_, a1);
  v12 = objc_allocWithZone(MEMORY[0x1E0CB3A28]);
  v13 = v11;
  v14 = OUTLINED_FUNCTION_10_3();
  v15 = objc_msgSend(v14, sel_UUIDString);

  v16 = sub_1B820E888();
  v18 = v17;

  sub_1B8207FA8(v16, v18, v13);
  sub_1B82060F8();
  sub_1B8207234();

  OUTLINED_FUNCTION_6_3();
  sub_1B8207F6C(a3);
  return v13;
}

id sub_1B82060F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double v10;
  id result;
  char v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  uint64_t v19;

  v1 = v0;
  sub_1B81E2E10();
  v2 = (_QWORD *)sub_1B820E6CC();
  if (!v2[2])
    return (id)swift_bridgeObjectRelease();
  v4 = v2[4];
  v3 = v2[5];
  v5 = sub_1B820627C((uint64_t)v2);
  v7 = v6;
  OUTLINED_FUNCTION_9_4();
  swift_bridgeObjectRelease();
  if (!v7)
    return (id)swift_bridgeObjectRelease();
  v8 = sub_1B82062C0(v4, v3);
  if ((v9 & 1) != 0)
    return (id)swift_bridgeObjectRelease();
  v10 = *(double *)&v8;
  result = (id)sub_1B82062C0(v5, v7);
  if ((v12 & 1) == 0)
  {
    v13 = *(double *)&result;
    v14 = OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter;
    v15 = *(void **)(v0 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_xAxisDateFormatter);
    type metadata accessor for LineChartModel();
    v16 = v15;
    v17 = (void *)sub_1B820E570();
    OUTLINED_FUNCTION_2_15(v16, sel_setTimeZone_);

    v18 = vabdd_f64(v13, v10);
    if (v18 >= 86400.0)
      v19 = 3;
    else
      v19 = 0;
    objc_msgSend(*(id *)(v1 + v14), sel_setDateStyle_, v19);
    return objc_msgSend(*(id *)(v1 + v14), sel_setTimeStyle_, v18 < 2764800.0);
  }
  return result;
}

uint64_t sub_1B820627C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1B82062C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _BYTE *v7;
  char v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1B820EB7C();
    swift_bridgeObjectRelease();
    v6 = v9;
  }
  else
  {
    MEMORY[0x1E0C80A78](a1);
    if ((a2 & 0x2000000000000000) != 0)
    {
      v6 = (v3 > 0x20u || ((0x100003E01uLL >> v3) & 1) == 0)
        && (v7 = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0
        && *v7 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v4 = sub_1B820EB94();
      }
      v6 = sub_1B8207FF8(v4, v5, (void (*)(uint64_t *__return_ptr))sub_1B8208064);
      swift_bridgeObjectRelease();
    }
  }
  if ((v6 & 1) != 0)
    return 0;
  else
    return 0;
}

void sub_1B8206434(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;

  v4 = a1;
  a3();

  OUTLINED_FUNCTION_5_10();
}

void sub_1B8206484()
{
  void *v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(v0, sel_accessibilityContainer);
  if (v1)
  {
    v2 = v1;
    if ((objc_msgSend(v1, sel_respondsToSelector_, sel_accessibilityFrame) & 1) != 0)
      objc_msgSend(v2, sel_accessibilityFrame);
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5_10();
}

id sub_1B820652C()
{
  id result;

  result = sub_1B8206548();
  qword_1EF19D940 = (uint64_t)result;
  return result;
}

id sub_1B8206548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v0 = sub_1B820E4D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B820E4C8();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  sub_1B820E4BC();
  if (v5)
  {
    v6 = (void *)sub_1B820E864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, sel_setGroupingSeparator_, v6);

  sub_1B820E4B0();
  if (v7)
  {
    v8 = (void *)sub_1B820E864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, sel_setDecimalSeparator_, v8);

  objc_msgSend(v4, sel_setMinimumFractionDigits_, 2);
  objc_msgSend(v4, sel_setMaximumFractionDigits_, 2);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_1B82066BC()
{
  char *v0;
  void *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v1 = v0;
  v2 = &v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel];
  sub_1B81E2E10();
  v3 = sub_1B820E6CC();
  v4 = v1;
  sub_1B820561C(v3, v4);
  OUTLINED_FUNCTION_11_4();
  type metadata accessor for LineChartModel();
  objc_allocWithZone(MEMORY[0x1E0C8EDC8]);
  OUTLINED_FUNCTION_0_17();
  swift_bridgeObjectRetain();
  v5 = sub_1B8207B78();
  result = sub_1B81E3450();
  if (*(double *)&v2[*(int *)(result + 52)] > *(double *)&v2[*(int *)(result + 52) + 8])
  {
    __break(1u);
  }
  else
  {
    sub_1B81E23A4(0, &qword_1EF19BF68);
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1B820EA44();
    v8 = *(_QWORD *)&v4[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series];
    v9 = *(_QWORD *)&v4[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 8];
    MEMORY[0x1E0C80A78](v7);
    OUTLINED_FUNCTION_9_4();
    v10 = swift_bridgeObjectRetain();
    sub_1B8205804(v10, (void (*)(uint64_t, _QWORD *))sub_1B8207BF4);
    OUTLINED_FUNCTION_7();
    swift_bridgeObjectRelease();
    v11 = objc_allocWithZone(MEMORY[0x1E0C8EDF0]);
    v12 = sub_1B8207BFC(v8, v9, 1);
    sub_1B81E23A4(0, &qword_1EF19BF78);
    sub_1B81FEAA8();
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1B82112D0;
    *(_QWORD *)(v13 + 32) = v12;
    v14 = v5;
    v15 = v7;
    sub_1B820E8DC();
    v16 = sub_1B820E9FC();

    return v16;
  }
  return result;
}

void sub_1B82069BC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;

}

uint64_t sub_1B82069E4(double a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  if (qword_1EF19BAB8 != -1)
    swift_once();
  v2 = (void *)qword_1EF19D940;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v4 = objc_msgSend(v2, sel_stringFromNumber_, v3);

  if (!v4)
    return 0;
  v5 = sub_1B820E888();

  return v5;
}

uint64_t sub_1B8206AB0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = sub_1B81E23A4(0, &qword_1EF19BFF8);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(a3 + 16) > a1)
  {
    swift_bridgeObjectRetain();
    return sub_1B820E9C0();
  }
  __break(1u);
  return result;
}

void (*sub_1B8206B44(uint64_t *a1))(id *a1)
{
  *a1 = sub_1B82066BC();
  return destroy for GridLayoutAttributesFactory.Label;
}

uint64_t sub_1B8206B74(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  double v32;
  char v33;
  double v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  char v47;
  id v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v5 = sub_1B820E4D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_3_0();
  v9 = (void *)(v8 - v7);
  sub_1B8207C9C();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_3_0();
  v13 = v12 - v11;
  v14 = sub_1B820E480();
  v51 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_3_0();
  v17 = v16 - v15;
  v18 = sub_1B8207000(1.0);
  v53 = v14;
  if ((v19 & 1) == 0)
  {
    v20 = 0;
    if (!a1)
      goto LABEL_9;
LABEL_6:
    v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
    sub_1B820E4C8();
    v28 = v9;
    sub_1B820E4BC();
    if (v29)
    {
      sub_1B820E864();
      OUTLINED_FUNCTION_12_3();
    }
    else
    {
      v28 = 0;
    }
    OUTLINED_FUNCTION_2_15(v27, sel_setGroupingSeparator_);

    v42 = v9;
    sub_1B820E4B0();
    if (v43)
    {
      sub_1B820E864();
      OUTLINED_FUNCTION_12_3();
    }
    else
    {
      v42 = 0;
    }
    OUTLINED_FUNCTION_2_15(v27, sel_setDecimalSeparator_);

    v45 = OUTLINED_FUNCTION_8_2(v44, sel_setMinimumFractionDigits_);
    OUTLINED_FUNCTION_8_2((uint64_t)v45, sel_setMaximumFractionDigits_);
    v46 = sub_1B8207174(a2);
    if ((v47 & 1) == 0)
    {
      v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, *(double *)&v46);
      v49 = objc_msgSend(v27, sel_stringFromNumber_, v48);

      if (v49)
      {
        v41 = sub_1B820E888();

      }
      else
      {

        v41 = 0;
      }
      (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);
      return v41;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);

    return 0;
  }
  v21 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16);
  v22 = *(_QWORD *)(v21 + 16);
  if (v22 < 2)
  {
    v20 = 1;
    if (a1)
      goto LABEL_6;
  }
  else
  {
    v23 = v21 + 24 * v22;
    v24 = *(_QWORD *)(v23 + 8);
    v25 = *(_QWORD *)(v23 + 16);
    swift_bridgeObjectRetain();
    v18 = sub_1B82062C0(v24, v25);
    v20 = v26 & 1;
    if (a1)
      goto LABEL_6;
  }
LABEL_9:
  v30 = sub_1B8207000(0.0);
  if ((v31 & 1) != 0)
    return 0;
  if ((v20 & 1) != 0)
    return 0;
  v32 = *(double *)&v30;
  sub_1B8207000(a2);
  if ((v33 & 1) != 0)
    return 0;
  v34 = v32;
  sub_1B820E474();
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  sub_1B820E564();
  v36 = sub_1B820E57C();
  v37 = 0;
  if (__swift_getEnumTagSinglePayload(v13, 1, v36) != 1)
  {
    v37 = (void *)sub_1B820E570();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v13, v36);
  }
  OUTLINED_FUNCTION_2_15(v35, sel_setTimeZone_);

  if (vabdd_f64(*(double *)&v18, v34) >= 86400.0)
    v38 = 3;
  else
    v38 = 0;
  objc_msgSend(v35, sel_setDateStyle_, v38, v51);
  OUTLINED_FUNCTION_2_15(v35, sel_setTimeStyle_);
  v39 = (void *)sub_1B820E468();
  v40 = objc_msgSend(v35, sel_stringFromDate_, v39);

  v41 = sub_1B820E888();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v17, v53);
  return v41;
}

uint64_t sub_1B8207000(double a1)
{
  uint64_t v1;
  uint64_t Strong;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;

  if (a1 < 0.0 || a1 > 1.0)
    return 0;
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return 0;
  OUTLINED_FUNCTION_7_6(Strong, sel_accessibilityFrame);
  LineChartInteractor.dataPoint(for:model:size:)(v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel, (uint64_t)&v13, v5 * a1, v6 * 0.5, v5, v6);
  v7 = v14;
  if (!v14)
  {
    OUTLINED_FUNCTION_6_3();
    return v7;
  }
  v8 = v13;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_1B820E864();
  sub_1B82080A0(v8, v7);
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_numberFromString_, v10);

  if (!v11)
  {
    OUTLINED_FUNCTION_6_3();
    return 0;
  }
  v7 = sub_1B820E948();
  OUTLINED_FUNCTION_6_3();

  return v7;
}

uint64_t sub_1B8207174(double a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t Strong;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 >= 0.0 && a1 <= 1.0)
  {
    Strong = swift_weakLoadStrong();
    v4 = Strong;
    if (!Strong)
      return v4;
    OUTLINED_FUNCTION_7_6(Strong, sel_accessibilityFrame);
    LineChartInteractor.dataPoint(for:model:size:)(v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_chartModel, (uint64_t)&v9, v6 * a1, v7 * 0.5, v6, v7);
    swift_release();
    if (v10)
    {
      v4 = v11;
      sub_1B82080A0(v9, v10);
      return v4;
    }
  }
  return 0;
}

void sub_1B8207234()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  objc_class *v3;
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;

  objc_msgSend(v0, sel_setAccessibilityElements_, 0);
  v1 = *(_QWORD *)(*(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16] + 16);
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    if (v1 >= 0xA)
      v2 = 10;
    else
      v2 = *(_QWORD *)(*(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16] + 16);
    v3 = (objc_class *)type metadata accessor for LineSeriesDataElement();
    do
    {
      v4 = objc_allocWithZone(v3);
      v5 = v0;
      v6 = sub_1B8205A78(v5);
      MEMORY[0x1BCCAE07C]();
      if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1B820E8E8();
      sub_1B820E90C();
      sub_1B820E8DC();

      --v2;
    }
    while (v2);
    v7 = OUTLINED_FUNCTION_0_17();
    sub_1B8205F64(v7);
    v8 = sub_1B820736C(v9);
    OUTLINED_FUNCTION_7();
    sub_1B8207F04((uint64_t)v8, v5);
  }
}

char *sub_1B820736C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  id v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1B820EC24();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return (char *)v3;
  v10 = MEMORY[0x1E0DEE9D8];
  result = sub_1B81E7640(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x1BCCAE340](i, a1);
      else
        v6 = *(id *)(a1 + 8 * i + 32);
      type metadata accessor for LineSeriesDataElement();
      swift_dynamicCast();
      v3 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B81E7640(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v10;
      }
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1B81E7640((char *)(v7 > 1), v8 + 1, 1);
        v3 = v10;
      }
      *(_QWORD *)(v3 + 16) = v8 + 1;
      sub_1B8207F5C(&v9, (_OWORD *)(v3 + 32 * v8 + 32));
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

double sub_1B82074EC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  char **p_name;
  uint64_t IsEmpty;
  uint64_t v12;
  double MinX;
  uint64_t v14;
  uint64_t v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements);
  v3 = 0.0;
  if (!v2)
    return v3;
  swift_bridgeObjectRetain_n();
  sub_1B8207680(a1, v2);
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_7();
  if ((v8 & 1) != 0)
    goto LABEL_11;
  p_name = &stru_1E6E17FF8.name;
  OUTLINED_FUNCTION_7_6(v9, sel_accessibilityFrame);
  IsEmpty = CGRectIsEmpty(v17);
  if ((IsEmpty & 1) != 0)
    goto LABEL_11;
  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_0_17();
    v14 = sub_1B820EC24();
    IsEmpty = OUTLINED_FUNCTION_7();
    v15 = v14;
    p_name = (char **)(&stru_1E6E17FF8 + 8);
    if (v15)
      goto LABEL_6;
LABEL_11:
    OUTLINED_FUNCTION_7();
    return v3;
  }
  if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_6:
  OUTLINED_FUNCTION_7_6(IsEmpty, p_name[381]);
  CGRectGetWidth(v18);
  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_0_17();
    v12 = sub_1B820EC24();
    OUTLINED_FUNCTION_7();
  }
  else
  {
    v12 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  OUTLINED_FUNCTION_7();
  v19.origin.x = OUTLINED_FUNCTION_0_25();
  MinX = CGRectGetMinX(v19);
  v20.origin.x = OUTLINED_FUNCTION_0_25();
  v3 = MinX + (double)v6 / (double)v12 * CGRectGetWidth(v20);
  v21.origin.x = OUTLINED_FUNCTION_0_25();
  CGRectGetMinY(v21);
  v22.origin.x = OUTLINED_FUNCTION_0_25();
  CGRectGetHeight(v22);
  return v3;
}

void sub_1B8207680(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  unint64_t v8;
  id v9;
  void *v10;
  char v11;

  if (a2 >> 62)
    goto LABEL_21;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1BCCAE340](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      type metadata accessor for LineSeriesDataElement();
      v6 = sub_1B820EA5C();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v8 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v8 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v9 = (id)MEMORY[0x1BCCAE340](i + 1, a2);
          }
          else
          {
            if ((v8 & 0x8000000000000000) != 0)
              goto LABEL_19;
            if (v8 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_20;
            v9 = *(id *)(a2 + 32 + 8 * v8);
          }
          v10 = v9;
          v11 = sub_1B820EA5C();

          if ((v11 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        swift_bridgeObjectRetain();
        v3 = sub_1B820EC24();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

void sub_1B8207808(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v2 = *(_QWORD *)&v1[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_series + 16];
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return;
  v4 = *(_QWORD *)&v1[OBJC_IVAR____TtC9TeaCharts30LineSeriesAccessibilityElement_dataElements];
  if (!v4)
    return;
  OUTLINED_FUNCTION_9_4();
  sub_1B8207680(a1, v4);
  v7 = v6;
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
    return;
  v9 = *(_QWORD *)(v2 + 16);
  if (v9 >= 0xA)
    v10 = 10;
  else
    v10 = *(_QWORD *)(v2 + 16);
  if (!v10)
  {
    __break(1u);
    goto LABEL_16;
  }
  v11 = v3 - 1;
  v12 = v9 / v10;
  OUTLINED_FUNCTION_0_17();
  sub_1B8205920(0, v10, v2, 0, v12, v11);
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 >= *(_QWORD *)(v13 + 16))
  {
LABEL_17:
    __break(1u);
    return;
  }
  v14 = *(_QWORD *)(v13 + 8 * v7 + 32);
  swift_bridgeObjectRelease();
  v15 = (double)v14 / (double)*(uint64_t *)(v2 + 16);
  v16 = objc_msgSend(v1, sel_tc_accessibilityDataSeriesValueDescriptionForPosition_axis_, 0, v15);
  if (v16)
  {
    v17 = v16;
    sub_1B820E888();

  }
  v18 = objc_msgSend(v1, sel_tc_accessibilityDataSeriesValueDescriptionForPosition_axis_, 1, v15);
  if (v18)
  {
    v19 = v18;
    sub_1B820E888();

  }
}

id LineSeriesAccessibilityElement.__allocating_init(accessibilityContainer:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v4 = objc_msgSend(v3, sel_initWithAccessibilityContainer_, sub_1B820ECC0());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

void LineSeriesAccessibilityElement.init(accessibilityContainer:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LineSeriesAccessibilityElement.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LineSeriesAccessibilityElement.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LineSeriesAccessibilityElement.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LineSeriesAccessibilityElement();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B8207B78()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)sub_1B820E864();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_1B820E8D0();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithTitle_categoryOrder_, v1, v2);

  return v3;
}

uint64_t sub_1B8207BF4(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B8206AB0(a1, a2, *(_QWORD *)(v2 + 16));
}

id sub_1B8207BFC(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_1B820E864();
  swift_bridgeObjectRelease();
  sub_1B81E23A4(0, &qword_1EF19BFF8);
  v6 = (void *)sub_1B820E8D0();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_initWithName_isContinuous_dataPoints_, v5, a3 & 1, v6);

  return v7;
}

void sub_1B8207C9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED552C08)
  {
    sub_1B820E57C();
    v0 = sub_1B820EA74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED552C08);
  }
}

uint64_t type metadata accessor for LineSeriesAccessibilityElement()
{
  uint64_t result;

  result = qword_1ED552F28;
  if (!qword_1ED552F28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B8207D28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1B82066BC();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for LineSeriesDataElement()
{
  return objc_opt_self();
}

uint64_t sub_1B8207D74()
{
  return type metadata accessor for LineSeriesAccessibilityElement();
}

uint64_t sub_1B8207D7C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LineChartModel();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LineSeriesAccessibilityElement()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of LineSeriesAccessibilityElement.accessibilityChartDescriptor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

unint64_t sub_1B8207E78(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

_BYTE *sub_1B8207E9C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void sub_1B8207F04(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_1B820E8D0();
  OUTLINED_FUNCTION_11_4();
  objc_msgSend(a2, sel_setAccessibilityElements_, v3);

}

_OWORD *sub_1B8207F5C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B8207F6C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LineChartModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B8207FA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1B820E864();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAccessibilityIdentifier_, v4);

}

uint64_t sub_1B8207FF8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  uint64_t v3;
  char v4;
  uint64_t var2;

  if (a1)
  {
    a3(&var2);
    if (!v3)
      v4 = var2;
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, _QWORD, _QWORD))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3)
      v4 = BYTE1(var2);
  }
  return v4 & 1;
}

_BYTE *sub_1B820804C@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_1B8207E9C(a1, a2);
}

_QWORD *sub_1B8208064@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
    *a1 = v5;
  return result;
}

uint64_t sub_1B82080A0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_release();
}

id OUTLINED_FUNCTION_7_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_8_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 2);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_10_3()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return swift_bridgeObjectRelease();
}

double ValueAxis.range.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t ValueAxis.calculationModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B81E0660(v1 + 16, a1);
}

uint64_t ValueAxis.grids.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *assignWithCopy for ValueAxis(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ValueAxis(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueAxis(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
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

uint64_t storeEnumTagSinglePayload for ValueAxis(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

TeaCharts::LineChartStyle __swiftcall LineChartStyle.init(lineStyles:)(TeaCharts::LineChartStyle lineStyles)
{
  TeaCharts::LineChartStyle *v1;

  v1->lineStyles._rawValue = lineStyles.lineStyles._rawValue;
  return lineStyles;
}

ValueMetadata *type metadata accessor for LineChartStyle()
{
  return &type metadata for LineChartStyle;
}

uint64_t ChartViewController<>.accessibilityRedrawsOnBoldTextStatusChange.getter()
{
  return 1;
}

uint64_t sub_1B8208294(unint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1B820EC24())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BCCAE340](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(a2, sel_layer);
      objc_msgSend(v9, sel_bounds);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      objc_msgSend(v7, sel_setFrame_, v11, v13, v15, v17);
      ++v5;
      if (v8 == v4)
        goto LABEL_9;
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

void GridView.__allocating_init(numberOfGrids:numberOfLabels:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  GridView.init(numberOfGrids:numberOfLabels:)(a1, a2);
}

id GridView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void GridView.init(coder:)()
{
  char *v0;
  uint64_t v1;

  v1 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC9TeaCharts8GridView_labels] = v1;

  sub_1B820EC18();
  __break(1u);
}

void GridView.init(numberOfGrids:numberOfLabels:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  double v6;
  objc_super *v7;
  SEL v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  char *v17;
  id v18;
  double v19;
  id v20;
  SEL v21;
  id v22;
  id v23;

  OUTLINED_FUNCTION_4();
  v5 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC9TeaCharts8GridView_labels) = v5;
  v6 = OUTLINED_FUNCTION_0_9();
  v9 = (char *)objc_msgSendSuper2(v7, v8, v6);
  if (a1 < 0)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  v10 = v9;
  if (a1)
  {
    v11 = &v9[OBJC_IVAR____TtC9TeaCharts8GridView_gridLayers];
    v12 = v9;
    do
    {
      v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2840]), sel_init);
      OUTLINED_FUNCTION_0_26();
      v14 = v13;
      MEMORY[0x1BCCAE07C]();
      if (*(_QWORD *)((*(_QWORD *)v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v11 & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
        OUTLINED_FUNCTION_1_17();
      sub_1B820E90C();
      sub_1B820E8DC();
      swift_endAccess();
      v15 = objc_msgSend(v12, sel_layer);
      objc_msgSend(v15, sel_addSublayer_, v14);

      --a1;
    }
    while (a1);
  }
  else
  {
    v16 = v9;
  }
  if (a2 < 0)
    goto LABEL_17;
  if (a2)
  {
    v17 = &v10[OBJC_IVAR____TtC9TeaCharts8GridView_labels];
    do
    {
      v18 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
      v19 = OUTLINED_FUNCTION_0_9();
      v22 = objc_msgSend(v20, v21, v19);
      objc_msgSend(v22, sel_setIsAccessibilityElement_, 0);
      OUTLINED_FUNCTION_0_26();
      v23 = v22;
      MEMORY[0x1BCCAE07C]();
      if (*(_QWORD *)((*(_QWORD *)v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v17 & 0xFFFFFFFFFFFFFF8)
                                                                                   + 0x18) >> 1)
        OUTLINED_FUNCTION_1_17();
      sub_1B820E90C();
      sub_1B820E8DC();
      swift_endAccess();
      objc_msgSend(v10, sel_addSubview_, v23);

      --a2;
    }
    while (a2);
  }

}

Swift::Void __swiftcall GridView.layoutSubviews()()
{
  void *v0;
  id v1;
  unint64_t v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)OUTLINED_FUNCTION_4();
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  swift_beginAccess();
  v1 = v0;
  v2 = swift_bridgeObjectRetain();
  sub_1B8208294(v2, v1);
  swift_bridgeObjectRelease();
}

id GridView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void GridView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GridView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GridView()
{
  return objc_opt_self();
}

uint64_t method lookup function for GridView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GridView.__allocating_init(numberOfGrids:numberOfLabels:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *initializeBufferWithCopyOfBuffer for LineChartImages(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LineChartImages(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LineChartImages(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for LineChartImages(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LineChartImages(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LineChartImages(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LineChartImages()
{
  return &type metadata for LineChartImages;
}

uint64_t LinePathGenerator.__allocating_init(coordinateProvider:)(uint64_t a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_14();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t LinePathGenerator.init(coordinateProvider:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t LinePathGenerator.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t method lookup function for LinePathGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LinePathGenerator.__allocating_init(coordinateProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t LineStyle.__allocating_init(stroke:fill:zoneStyles:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_0_28();
  LineStyle.init(stroke:fill:zoneStyles:)(a1, a2, a3);
  return v6;
}

uint64_t sub_1B8208B04()
{
  void *v0;
  id v1;
  id v2;
  uint64_t result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_blackColor);
  v2 = objc_msgSend(v0, sel_clearColor);
  type metadata accessor for LineStyle();
  result = OUTLINED_FUNCTION_0_28();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0x3FF0000000000000;
  *(_QWORD *)(result + 32) = v1;
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = v2;
  *(_BYTE *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = MEMORY[0x1E0DEE9D8];
  qword_1EF19C088 = result;
  return result;
}

uint64_t static LineStyle.default.getter()
{
  if (qword_1EF19BAC0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t LineStyle.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1B81E7534(*(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LineStyle.__deallocating_deinit()
{
  LineStyle.deinit();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for LineStyle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LineStyle.__allocating_init(stroke:fill:zoneStyles:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

_QWORD *assignWithCopy for AxisGridViewModelGeneratorOptions(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for AxisGridViewModelGeneratorOptions(_QWORD *a1, _QWORD *a2)
{
  void *v3;

  *a1 = *a2;
  v3 = (void *)a1[1];
  a1[1] = a2[1];

  return a1;
}

ValueMetadata *type metadata accessor for AxisGridViewModelGeneratorOptions()
{
  return &type metadata for AxisGridViewModelGeneratorOptions;
}

uint64_t dispatch thunk of AxisGridViewModelGeneratorType.models(for:orientation:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t SparklineCoordinateProvider.location(for:in:model:size:)(double *a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  char v24;

  v6 = v5;
  v10 = *a1;
  v11 = *((_QWORD *)a1 + 1);
  v12 = a1[2];
  v13 = v6[10];
  v14 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v13);
  v24 = 0;
  v15 = (*(uint64_t (**)(double, uint64_t, uint64_t, char *, uint64_t, uint64_t, double))(v14 + 8))(COERCE_DOUBLE(*(_QWORD *)&v10), v11, a5, &v24, v13, v14, a2);
  if ((v16 & 1) != 0)
    return 0;
  v17 = v15;
  v18 = v6 + 2;
  v20 = v6[5];
  v19 = v6[6];
  __swift_project_boxed_opaque_existential_1(v18, v20);
  v21 = a5 + *(int *)(sub_1B81E3450() + 52);
  v23 = 1;
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, double, double))(v19 + 8))(v21, &v23, v20, v19, v12, a3);
  return v17;
}

uint64_t SparklineCoordinateProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t SparklineCoordinateProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_1B8208E2C(double *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  return SparklineCoordinateProvider.location(for:in:model:size:)(a1, a4, a5, a2, a3);
}

uint64_t dispatch thunk of SparklineCoordinateProviderType.location(for:in:model:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t type metadata accessor for SparklineCoordinateProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for SparklineCoordinateProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t StyleManager.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  v4 = sub_1B820EA74();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t StyleManager.register(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = sub_1B820EA74();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t, double))(*(_QWORD *)(v3 - 8) + 16))((char *)&v11 - v7, a1, v3, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v3);
  v9 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v9, v8, v4);
  return swift_endAccess();
}

uint64_t StyleManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_1B820EA74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StyleManager.__deallocating_deinit()
{
  StyleManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B8209054(uint64_t a1)
{
  return StyleManager.register(_:)(a1);
}

uint64_t sub_1B8209074@<X0>(uint64_t a1@<X8>)
{
  return StyleManager.style.getter(a1);
}

uint64_t dispatch thunk of StyleProviderType.style.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StyleManagerType.register(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for StyleManager()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B82090B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_19(v2, *(_QWORD *)(v1 + 80), v3, v4);
  OUTLINED_FUNCTION_0_29();
  v5 = OUTLINED_FUNCTION_15();
  swift_bridgeObjectRetain();
  MEMORY[0x1BCCAE964](MEMORY[0x1E0DEAF38], v5);
  sub_1B820E8B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8209158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2_16();
  v0 = swift_allocObject();
  sub_1B820943C(v0, v1, v2, v3);
  return v0;
}

uint64_t sub_1B8209184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v5 = v4;
  v6 = *v4;
  v7 = v4[3];
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = v7 + 40;
    do
    {
      v10 = *(void (**)(uint64_t))(v9 - 8);
      v11 = swift_retain();
      v10(v11);
      swift_release();
      v9 += 16;
      --v8;
    }
    while (v8);
    a1 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_19(a1, *(_QWORD *)(v6 + 80), a3, a4);
  OUTLINED_FUNCTION_0_29();
  v12 = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_12();
  v5[2] = v12;
  swift_bridgeObjectRelease();
  v5[3] = MEMORY[0x1E0DEE9D8];
  return swift_bridgeObjectRelease();
}

uint64_t HighlightInteraction.onChange(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *v2;
  v6 = (_QWORD *)swift_allocObject();
  v7 = *(_QWORD *)(v5 + 80);
  v6[2] = v7;
  v6[3] = a1;
  v6[4] = a2;
  OUTLINED_FUNCTION_12();
  type metadata accessor for HighlightInteraction.InteractionType(255, v7, v7, v8);
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_15();
  swift_retain();
  sub_1B820E918();
  return swift_endAccess();
}

uint64_t sub_1B8209308()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B820932C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t type metadata accessor for HighlightInteraction.InteractionType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HighlightInteraction.InteractionType);
}

void HighlightInteraction.onEnd(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  sub_1B82094B4();
  v6 = *(_QWORD *)(*(_QWORD *)(v2 + 24) + 16);
  sub_1B8209478(v6);
  v7 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v7 + 16) = v6 + 1;
  v8 = v7 + 16 * v6;
  *(_QWORD *)(v8 + 32) = sub_1B81FA8DC;
  *(_QWORD *)(v8 + 40) = v5;
}

uint64_t sub_1B82093E4()
{
  swift_release();
  OUTLINED_FUNCTION_2_16();
  return swift_deallocObject();
}

uint64_t HighlightInteraction.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HighlightInteraction.__deallocating_deinit()
{
  HighlightInteraction.deinit();
  OUTLINED_FUNCTION_2_16();
  return swift_deallocClassInstance();
}

_QWORD *sub_1B820943C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_1_19(a1, *(_QWORD *)(*v4 + 80), a3, a4);
  OUTLINED_FUNCTION_0_29();
  v5 = OUTLINED_FUNCTION_4_10();
  v6 = MEMORY[0x1E0DEE9D8];
  v4[2] = v5;
  v4[3] = v6;
  return v4;
}

void sub_1B8209478(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 + 1 > *(_QWORD *)(*(_QWORD *)v1 + 24) >> 1)
  {
    sub_1B81EC16C();
    *(_QWORD *)v1 = v2;
  }
}

void sub_1B82094B4()
{
  uint64_t *v0;
  uint64_t v1;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v3;

  v1 = *v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B81EC16C();
    *v0 = v3;
  }
}

uint64_t sub_1B82094FC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for HighlightInteraction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HighlightInteraction);
}

uint64_t method lookup function for HighlightInteraction()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B8209558()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B8209560()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2[4] = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_1B82095DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  void (*v19)(uint64_t *, uint64_t *, uint64_t);

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v8;
  v10 = ~(unint64_t)v8;
  v11 = v7 + v8;
  if ((v11 & v10) + v7 <= v7)
    v12 = *(_QWORD *)(v6 + 64);
  else
    v12 = (v11 & ~(unint64_t)v8) + v7;
  v13 = v8 & 0x100000;
  if (v9 > 7 || v13 != 0 || (unint64_t)(v12 + 1) > 0x18)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v9 + 16) & v10));
    swift_retain();
  }
  else
  {
    v17 = *((unsigned __int8 *)a2 + v12);
    if (v17 >= 2)
    {
      if (v12 <= 3)
        v18 = v12;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v19(a1, a2, *(_QWORD *)(a3 + 24));
    if (v17 == 1)
    {
      v19((uint64_t *)(((unint64_t)v4 + v11) & v10), (uint64_t *)(((unint64_t)a2 + v11) & v10), v5);
      *((_BYTE *)v4 + v12) = 1;
    }
    else
    {
      *((_BYTE *)v4 + v12) = 0;
    }
  }
  return v4;
}

uint64_t sub_1B820972C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t result;
  uint64_t (*v11)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  if (((v5 + v6) & ~v6) + v5 > v5)
    v5 += (v5 + v6) & ~v6;
  v8 = *(unsigned __int8 *)(a1 + v5);
  if (v8 >= 2)
  {
    if (v5 <= 3)
      v9 = v5;
    else
      v9 = 4;
    __asm { BR              X13 }
  }
  v11 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  result = v11(a1, *(_QWORD *)(a2 + 24));
  if (v8 == 1)
    return v11((v7 + a1) & ~v6, v3);
  return result;
}

uint64_t sub_1B820983C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  char v14;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  if (((v7 + v8) & ~v8) + v7 <= v7)
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = ((v7 + v8) & ~v8) + v7;
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 2)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v13(a1, a2, *(_QWORD *)(a3 + 24));
  if (v11 == 1)
  {
    v13((v9 + a1) & ~v8, (v9 + a2) & ~v8, v5);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  *(_BYTE *)(a1 + v10) = v14;
  return a1;
}

uint64_t sub_1B8209954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  unsigned int v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  char v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    if (((v7 + v8) & ~v8) + v7 <= v7)
      v10 = *(_QWORD *)(v6 + 64);
    else
      v10 = ((v7 + v8) & ~v8) + v7;
    v11 = *(unsigned __int8 *)(a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    v13 = ~v8;
    v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v14(a1, *(_QWORD *)(a3 + 24));
    if (v11 == 1)
      v14((v9 + a1) & v13, v5);
    v15 = *(unsigned __int8 *)(a2 + v10);
    if (v15 >= 2)
    {
      if (v10 <= 3)
        v16 = v10;
      else
        v16 = 4;
      __asm { BR              X11 }
    }
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v17(a1, a2, v5);
    if (v15 == 1)
    {
      v17((v9 + a1) & v13, (v9 + a2) & v13, v5);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    *(_BYTE *)(a1 + v10) = v18;
  }
  return a1;
}

uint64_t sub_1B8209B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  char v14;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  if (((v7 + v8) & ~v8) + v7 <= v7)
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = ((v7 + v8) & ~v8) + v7;
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 2)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v13(a1, a2, *(_QWORD *)(a3 + 24));
  if (v11 == 1)
  {
    v13((v9 + a1) & ~v8, (v9 + a2) & ~v8, v5);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  *(_BYTE *)(a1 + v10) = v14;
  return a1;
}

uint64_t sub_1B8209C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  unsigned int v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  char v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    if (((v7 + v8) & ~v8) + v7 <= v7)
      v10 = *(_QWORD *)(v6 + 64);
    else
      v10 = ((v7 + v8) & ~v8) + v7;
    v11 = *(unsigned __int8 *)(a1 + v10);
    if (v11 >= 2)
    {
      if (v10 <= 3)
        v12 = v10;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    v13 = ~v8;
    v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v14(a1, *(_QWORD *)(a3 + 24));
    if (v11 == 1)
      v14((v9 + a1) & v13, v5);
    v15 = *(unsigned __int8 *)(a2 + v10);
    if (v15 >= 2)
    {
      if (v10 <= 3)
        v16 = v10;
      else
        v16 = 4;
      __asm { BR              X11 }
    }
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    v17(a1, a2, v5);
    if (v15 == 1)
    {
      v17((v9 + a1) & v13, (v9 + a2) & v13, v5);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    *(_BYTE *)(a1 + v10) = v18;
  }
  return a1;
}

uint64_t sub_1B8209DEC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v12;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = ((v4 + *(unsigned __int8 *)(v3 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + v4;
  if (v5 > v4)
    v4 = v5;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v6 = v4 + 1;
  v7 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 > 0xFF)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 < 2)
    {
LABEL_21:
      v12 = *(unsigned __int8 *)(a1 + v4);
      if (v12 >= 2)
        return (v12 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_21;
LABEL_14:
  v11 = (v8 - 1) << v7;
  if (v6 > 3)
    v11 = 0;
  if (!(_DWORD)v6)
    return (v11 + 255);
  if (v6 > 3)
    LODWORD(v6) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B8209EBC + 4 * byte_1B8211B38[(v6 - 1)]))();
}

void sub_1B8209F08(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((v6 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + v6;
  if (v7 <= v6)
    v7 = v6;
  v8 = v7 + 1;
  v9 = 8 * (v7 + 1);
  if (a3 < 0xFF)
  {
    v10 = 0u;
  }
  else if (v8 <= 3)
  {
    v12 = ((a3 + ~(-1 << v9) - 254) >> v9) + 1;
    if (HIWORD(v12))
    {
      v10 = 4u;
    }
    else if (v12 >= 0x100)
    {
      v10 = 2;
    }
    else
    {
      v10 = v12 > 1;
    }
  }
  else
  {
    v10 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v11 = a2 - 255;
  if (v8 < 4)
  {
    if ((_DWORD)v7 != -1)
    {
      v13 = v11 & ~(-1 << v9);
      bzero(a1, v8);
      if ((_DWORD)v8 == 3)
      {
        *a1 = v13;
        *((_BYTE *)a1 + 2) = BYTE2(v13);
      }
      else if ((_DWORD)v8 == 2)
      {
        *a1 = v13;
      }
      else
      {
        *(_BYTE *)a1 = v13;
      }
    }
  }
  else
  {
    bzero(a1, v7 + 1);
    *(_DWORD *)a1 = v11;
  }
  __asm { BR              X10 }
}

uint64_t sub_1B820A0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = ((v3 + *(unsigned __int8 *)(v2 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)) + v3;
  if (v4 > v3)
    v3 = v4;
  if (*(unsigned __int8 *)(a1 + v3) < 2u)
    return *(unsigned __int8 *)(a1 + v3);
  if (v3 <= 3)
    v5 = v3;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1B820A10C + 4 * byte_1B8211B46[v5]))();
}

void sub_1B820A154(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  size_t v5;
  size_t v6;
  size_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = ((v5 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v5;
  if (a2 > 1)
  {
    if (v6 <= v5)
      v7 = v5;
    else
      v7 = v6;
    v8 = a2 - 2;
    if (v7 < 4)
    {
      v9 = v8 >> (8 * v7);
      v10 = v8 & ~(-1 << (8 * v7));
      a1[v7] = v9 + 2;
      bzero(a1, v7);
      if ((_DWORD)v7 == 3)
      {
        *(_WORD *)a1 = v10;
        a1[2] = BYTE2(v10);
      }
      else if ((_DWORD)v7 == 2)
      {
        *(_WORD *)a1 = v10;
      }
      else
      {
        *a1 = v10;
      }
    }
    else
    {
      a1[v7] = 2;
      bzero(a1, v7);
      *(_DWORD *)a1 = v8;
    }
  }
  else
  {
    if (v6 > v5)
      v5 = v6;
    a1[v5] = a2;
  }
}

uint64_t sub_1B820A230(uint64_t (**a1)(_QWORD))
{
  uint64_t v1;

  return (*a1)(*(_QWORD *)(v1 + 24));
}

void ZoneManager.zones.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  OUTLINED_FUNCTION_5_1();
  v4 = OUTLINED_FUNCTION_1_20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_24();
}

uint64_t ZoneManager.add(zone:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  char v7;
  _BYTE v9[24];

  v1 = *v0;
  v2 = sub_1B820E708();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v9[-v4];
  v6 = (char *)v0 + *(_QWORD *)(v1 + 96);
  OUTLINED_FUNCTION_5_1();
  (*(void (**)(_BYTE *, char *, uint64_t))(v3 + 16))(v5, v6, v2);
  OUTLINED_FUNCTION_2_17();
  v7 = sub_1B820E6F0();
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  if ((v7 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_17();
    OUTLINED_FUNCTION_0_30();
    sub_1B820E6E4();
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0_30();
  sub_1B820E6D8();
  return swift_endAccess();
}

uint64_t ZoneManager.remove(zone:)()
{
  sub_1B820E5E8();
  OUTLINED_FUNCTION_0_30();
  sub_1B820E708();
  sub_1B820E6E4();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall ZoneManager.removeZone(for:)(Swift::String a1)
{
  OUTLINED_FUNCTION_0_30();
  OUTLINED_FUNCTION_1_20();
  sub_1B820E6E4();
  swift_endAccess();
  OUTLINED_FUNCTION_24();
}

uint64_t ZoneManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 96);
  v2 = OUTLINED_FUNCTION_1_20();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ZoneManager.__deallocating_deinit()
{
  ZoneManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B820A56C()
{
  return ZoneManager.add(zone:)();
}

uint64_t sub_1B820A58C()
{
  return ZoneManager.remove(zone:)();
}

void sub_1B820A5AC(uint64_t a1, uint64_t a2)
{
  ZoneManager.removeZone(for:)(*(Swift::String *)&a1);
}

uint64_t sub_1B820A5CC(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for ZoneManager<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_1B820A5F8(uint64_t a1@<X8>)
{
  ZoneManager.zones.getter(a1);
}

uint64_t dispatch thunk of ZoneProviderType.zones.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ZoneManagerType.add(zone:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ZoneManagerType.remove(zone:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ZoneManagerType.removeZone(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t method lookup function for ZoneManager()
{
  return swift_lookUpClassMethod();
}

uint64_t initializeBufferWithCopyOfBuffer for Fill(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B81E892C(*(void **)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for Fill(uint64_t a1)
{
  sub_1B81E7534(*(void **)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for Fill(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B81E892C(*(void **)a2, v4);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B81E7534(v5, v6);
  return a1;
}

uint64_t assignWithTake for Fill(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B81E7534(v5, v6);
  return a1;
}

uint64_t sub_1B820A728()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1B81E623C(0);
  v0 = swift_allocObject();
  v1 = sub_1B81E6100();
  v2 = sub_1B81E613C();
  MEMORY[0x1BCCADE6C](MEMORY[0x1E0DEE9D8], &type metadata for CategoryZone, v1, v2);
  return v0;
}

uint64_t sub_1B820A79C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _BYTE v18[24];
  uint64_t v19;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B81E0300(0, &qword_1ED5550C8);
  result = sub_1B820E618();
  if (v19)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x1E0C80A78](v4);
    v6 = (_QWORD *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = *v6;
    v9 = type metadata accessor for GridLayoutAttributesFactory();
    v17[3] = v9;
    v17[4] = &off_1E6E12F28;
    v17[0] = v8;
    v10 = type metadata accessor for ChartLayoutAttributesFactory();
    v11 = (_QWORD *)swift_allocObject();
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v9);
    MEMORY[0x1E0C80A78](v12);
    v14 = (_QWORD *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1E6E12F28;
    v11[2] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &off_1E6E15258;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B820A930@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = sub_1B820E630();
  swift_allocObject();
  result = sub_1B820E624();
  v4 = MEMORY[0x1E0DB3668];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of ChartLayoutAttributesFactoryType.attributes(for:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

double sub_1B820A98C@<D0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17[2];
  _OWORD v18[2];
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;

  v6 = *a2;
  v7 = a2[1];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
  v17[0] = v6;
  v17[1] = v7;
  sub_1B81EA884(a1, v17, (uint64_t)v18);
  result = v19;
  v9 = v20;
  v10 = v21;
  v11 = v22;
  v12 = v6 - v20 - v22;
  v13 = v7 - v19 - v21;
  v14 = v23;
  v15 = v18[0];
  v16 = v18[1];
  *(double *)a3 = v20;
  *(double *)(a3 + 8) = result;
  *(double *)(a3 + 16) = v12;
  *(double *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 32) = v15;
  *(_OWORD *)(a3 + 48) = v16;
  *(double *)(a3 + 64) = result;
  *(double *)(a3 + 72) = v9;
  *(double *)(a3 + 80) = v10;
  *(double *)(a3 + 88) = v11;
  *(_OWORD *)(a3 + 96) = v14;
  return result;
}

uint64_t type metadata accessor for ChartLayoutAttributesFactory()
{
  return objc_opt_self();
}

double sub_1B820AA44@<D0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B820A98C(a1, a2, a3);
}

void sub_1B820AA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  id v6;

  if (*(_QWORD *)(a3 + 16))
  {
    v4 = sub_1B81E2E68();
    if ((v5 & 1) != 0)
      v6 = *(id *)(*(_QWORD *)(a3 + 56) + 8 * v4);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1B820AAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_1B81E2E68();
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_1B820AAFC(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  char v6;

  if (*(_QWORD *)(a4 + 16) && (v5 = sub_1B81F9908(a1), (v6 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v5);
  else
    return 0;
}

uint64_t ColumnChartCoordinateProvider.location(for:in:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v17[3];

  v3 = *a1;
  v4 = a1[1];
  v5 = *((double *)a1 + 2);
  v7 = *a2;
  v6 = a2[1];
  sub_1B820E594();
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary);
  if (!v8)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_1B820AAA8(v7, v6, v8);
  v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v12 = sub_1B820AAFC(v5, v3, v4, v11);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    v17[0] = v3;
    v17[1] = v4;
    *(double *)&v17[2] = v5;
    v15 = sub_1B820B7A0(v12, v9, v17);
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
  sub_1B820E5A0();
  return v15;
}

__n128 ColumnChartCoordinateProvider.options.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;

  v3 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  return result;
}

uint64_t sub_1B820ACC8(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_1B820E5B8();
  MEMORY[0x1E0C80A78](v3);
  v4 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
  v5 = sub_1B81E3450();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
  v6 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  *(_BYTE *)(v6 + 16) = 1;
  v7 = v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_BYTE *)(v7 + 32) = 1;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary) = 0;
  v8 = OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_lock;
  sub_1B820E5AC();
  sub_1B820E5D0();
  swift_allocObject();
  *(_QWORD *)(v1 + v8) = sub_1B820E5C4();
  sub_1B81DF244(a1, v1 + 16);
  return v1;
}

uint64_t ColumnChartCoordinateProvider.horizontalLocation(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1B820E594();
  sub_1B820AE4C(a1, a2);
  v5 = v4;
  sub_1B820E5A0();
  return v5;
}

double sub_1B820AE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  double result;

  v5 = v2 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
  swift_beginAccess();
  if ((*(_BYTE *)(v5 + 32) & 1) == 0)
    return *(double *)(v5 + 24) * (double)a1
         + *(double *)(v5 + 16) * (double)a1
         + *(double *)(v5 + 8) * (double)a2
         + *(double *)v5 * (double)a2;
  return result;
}

uint64_t ColumnChartCoordinateProvider.verticalLocation(for:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  sub_1B820E594();
  v6[0] = v1;
  v6[1] = v2;
  v6[2] = v3;
  v4 = sub_1B820AF5C((uint64_t)v6);
  sub_1B820E5A0();
  return v4;
}

uint64_t sub_1B820AF5C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  double v16;
  _BYTE v17[7];
  char v18;

  sub_1B81E3D14();
  MEMORY[0x1E0C80A78](v3);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1B81E3450();
  MEMORY[0x1E0C80A78](v6);
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size + 16) & 1) != 0)
    return 0;
  v9 = *(double *)(a1 + 16);
  v10 = *(double *)((char *)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size + 8);
  v11 = (uint64_t)v1 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
  swift_beginAccess();
  sub_1B81E3CD4(v11, (uint64_t)v5, (uint64_t (*)(_QWORD))sub_1B81E3D14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_1B81E38B8((uint64_t)v5, (uint64_t (*)(_QWORD))sub_1B81E3D14);
    return 0;
  }
  sub_1B81E3874((uint64_t)v5, (uint64_t)v8);
  v13 = v1[5];
  v14 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v13);
  v15 = &v8[*(int *)(v6 + 52)];
  v18 = 1;
  v16 = (*(double (**)(_BYTE *, char *, uint64_t, uint64_t, double, double))(v14 + 8))(v15, &v18, v13, v14, v9, v10);
  sub_1B81E38B8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1B81E3450);
  return *(_QWORD *)&v16;
}

uint64_t ColumnChartCoordinateProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1B81E38B8(v0 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace, (uint64_t (*)(_QWORD))sub_1B81E3D14);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t ColumnChartCoordinateProvider.__deallocating_deinit()
{
  ColumnChartCoordinateProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t ColumnChartCoordinateProvider.register(model:size:)(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  sub_1B820E594();
  v6 = type metadata accessor for ColumnChartModel();
  v7 = *(_QWORD *)(a1 + *(int *)(v6 + 20));
  v8 = a1 + *(int *)(v6 + 24);
  v9 = *(_QWORD *)(v8 + 16);
  v10 = *(_QWORD *)(v8 + 24);
  v11 = *(_QWORD *)(v8 + 32);
  v12 = *(_BYTE *)(v8 + 40);
  v14 = *(_OWORD *)v8;
  v15 = v9;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  sub_1B820B218(a1, v7, (double *)&v14, a2, a3);
  return sub_1B820E5A0();
}

uint64_t sub_1B820B218(uint64_t a1, uint64_t a2, double *a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  double *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;

  v6 = v5;
  sub_1B81E3D14();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a3;
  v15 = a3[1];
  v17 = a3[2];
  result = sub_1B81E7430();
  if ((result & 1) == 0 && a4 > 0.0)
  {
    v68 = *(_QWORD *)(a2 + 16);
    if (v68)
    {
      v19 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_size;
      *(double *)v19 = a4;
      *(double *)(v19 + 8) = a5;
      *(_BYTE *)(v19 + 16) = 0;
      sub_1B81E3CD4(a1, (uint64_t)v14, (uint64_t (*)(_QWORD))sub_1B81E3450);
      v20 = sub_1B81E3450();
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
      v21 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_coordinateSpace;
      swift_beginAccess();
      sub_1B81E57A4((uint64_t)v14, v21);
      swift_endAccess();
      sub_1B81E2E10();
      sub_1B81DFAEC((unint64_t *)&qword_1ED554118, (uint64_t (*)(uint64_t))sub_1B81E2E10, MEMORY[0x1E0DB3DC0]);
      sub_1B820E978();
      sub_1B820E990();
      v22 = sub_1B820E984();
      sub_1B820E978();
      sub_1B820E990();
      v23 = sub_1B820E984();
      if (!__OFSUB__(v23, 1))
      {
        v24 = (double)v68 * (double)v22;
        v25 = v15 * ((double)v68 + -1.0);
        v26 = v25 * (double)v22;
        v27 = (a4 - v26 - v17 * ((double)v22 + -1.0)) / v24;
        if (v16 < v27)
          v27 = v16;
        if (v27 > 1.0)
          v28 = v27;
        else
          v28 = 1.0;
        v29 = (a4 - v24 * v28 - v26) / (double)(v23 - 1);
        v30 = v25 + v28 * (double)v68;
        v66 = v6;
        v31 = v6 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_options;
        swift_beginAccess();
        *(double *)v31 = v28;
        *(double *)(v31 + 8) = v15;
        *(double *)(v31 + 16) = v29;
        *(double *)(v31 + 24) = v30;
        v67 = a2 + 32;
        *(_BYTE *)(v31 + 32) = 0;
        v65 = a2;
        swift_bridgeObjectRetain();
        v32 = 0;
        v33 = (_QWORD *)MEMORY[0x1E0DEE9E0];
        while (1)
        {
          v34 = (uint64_t *)(v67 + 24 * v32);
          v36 = *v34;
          v35 = v34[1];
          v37 = *(_QWORD *)(v34[2] + 16);
          if (v37)
            break;
          v40 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_24:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_isUniquelyReferenced_nonNull_native();
          v74 = v33;
          v54 = sub_1B81E2E68();
          if (__OFADD__(v33[2], (v55 & 1) == 0))
            goto LABEL_37;
          v56 = v54;
          v57 = v55;
          sub_1B820B8B0();
          if ((sub_1B820EBF4() & 1) != 0)
          {
            v58 = sub_1B81E2E68();
            if ((v57 & 1) != (v59 & 1))
              goto LABEL_40;
            v56 = v58;
          }
          v33 = v74;
          if ((v57 & 1) != 0)
          {
            v60 = (_QWORD *)(v74[7] + 16 * v56);
            swift_bridgeObjectRelease();
            *v60 = v32;
            v60[1] = v40;
          }
          else
          {
            v74[(v56 >> 6) + 8] |= 1 << v56;
            v61 = (_QWORD *)(v33[6] + 16 * v56);
            *v61 = v36;
            v61[1] = v35;
            v62 = (_QWORD *)(v33[7] + 16 * v56);
            *v62 = v32;
            v62[1] = v40;
            v63 = v33[2];
            v52 = __OFADD__(v63, 1);
            v64 = v63 + 1;
            if (v52)
              goto LABEL_38;
            v33[2] = v64;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (++v32 == v68)
          {
            swift_bridgeObjectRelease();
            *(_QWORD *)(v66 + OBJC_IVAR____TtC9TeaCharts29ColumnChartCoordinateProvider_seriesDictionary) = v33;
            return swift_bridgeObjectRelease();
          }
        }
        v70 = *v34;
        v71 = v33;
        v72 = v35;
        v73 = v32;
        v38 = 0;
        v69 = swift_bridgeObjectRetain();
        v39 = (double *)(v69 + 48);
        v40 = (_QWORD *)MEMORY[0x1E0DEE9E0];
        while (1)
        {
          v42 = *((_QWORD *)v39 - 2);
          v41 = *((_QWORD *)v39 - 1);
          v43 = *v39;
          swift_bridgeObjectRetain();
          swift_isUniquelyReferenced_nonNull_native();
          v74 = v40;
          v44 = sub_1B81F9908(v43);
          if (__OFADD__(v40[2], (v45 & 1) == 0))
            break;
          v46 = v44;
          v47 = v45;
          sub_1B820B988(0, &qword_1ED5532A0, (uint64_t (*)(uint64_t, ValueMetadata *, _QWORD, unint64_t))MEMORY[0x1E0DECB20]);
          if ((sub_1B820EBF4() & 1) != 0)
          {
            v48 = sub_1B81F9908(v43);
            if ((v47 & 1) != (v49 & 1))
              goto LABEL_40;
            v46 = v48;
          }
          v40 = v74;
          if ((v47 & 1) != 0)
          {
            *(_QWORD *)(v74[7] + 8 * v46) = v38;
          }
          else
          {
            v74[(v46 >> 6) + 8] |= 1 << v46;
            v50 = (double *)(v40[6] + 24 * v46);
            *(_QWORD *)v50 = v42;
            *((_QWORD *)v50 + 1) = v41;
            v50[2] = v43;
            *(_QWORD *)(v40[7] + 8 * v46) = v38;
            v51 = v40[2];
            v52 = __OFADD__(v51, 1);
            v53 = v51 + 1;
            if (v52)
              goto LABEL_36;
            v40[2] = v53;
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          ++v38;
          v39 += 3;
          if (v37 == v38)
          {
            swift_bridgeObjectRelease();
            v35 = v72;
            v32 = v73;
            v36 = v70;
            v33 = v71;
            goto LABEL_24;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
      }
      __break(1u);
      while (1)
      {
LABEL_40:
        sub_1B820ECE4();
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_1B820B7A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  _QWORD v11[3];

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[2];
  sub_1B820AE4C(a1, a2);
  if ((v7 & 1) != 0)
    return 0;
  v8 = v6;
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  sub_1B820AF5C((uint64_t)v11);
  if ((v9 & 1) != 0)
    return 0;
  else
    return v8;
}

void sub_1B820B81C()
{
  sub_1B81DFAEC((unint64_t *)&qword_1ED5544E0, (uint64_t (*)(uint64_t))type metadata accessor for ColumnChartModel, (uint64_t)&protocol conformance descriptor for ColumnChartModel);
}

uint64_t sub_1B820B848(uint64_t a1, double a2, double a3)
{
  return ColumnChartCoordinateProvider.register(model:size:)(a1, a2, a3);
}

uint64_t sub_1B820B868(uint64_t *a1, uint64_t *a2)
{
  return ColumnChartCoordinateProvider.location(for:in:)(a1, a2);
}

ValueMetadata *type metadata accessor for ColumnChartCoordinateOptions()
{
  return &type metadata for ColumnChartCoordinateOptions;
}

uint64_t sub_1B820B89C()
{
  return type metadata accessor for ColumnChartCoordinateProvider();
}

uint64_t method lookup function for ColumnChartCoordinateProvider()
{
  return swift_lookUpClassMethod();
}

void sub_1B820B8B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5532C0)
  {
    sub_1B820B914();
    v0 = sub_1B820EC0C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5532C0);
  }
}

void sub_1B820B914()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED553E88)
  {
    sub_1B820B988(255, &qword_1ED553E70, (uint64_t (*)(uint64_t, ValueMetadata *, _QWORD, unint64_t))MEMORY[0x1E0DEA048]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED553E88);
  }
}

void sub_1B820B988(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, _QWORD, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1B81EC354();
    v7 = a3(a1, &type metadata for CategoryDataPoint, MEMORY[0x1E0DEB418], v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t LinearAxisCalculationModel.__allocating_init()()
{
  return swift_allocObject();
}

double LinearAxisCalculationModel.value(for:in:)(double a1, double a2, double a3)
{
  double result;

  result = (a3 - a2) * a1 + a2;
  if (a2 == a3)
    return 0.0;
  return result;
}

uint64_t LinearAxisCalculationModel.deinit()
{
  uint64_t v0;

  return v0;
}

double sub_1B820BA20(double a1, double a2, double a3)
{
  return LinearAxisCalculationModel.value(for:in:)(a1, a2, a3);
}

uint64_t method lookup function for LinearAxisCalculationModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LinearAxisCalculationModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t CategoryDataPoint.category.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CategoryDataPoint.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1B820E894();
  swift_bridgeObjectRelease();
  return sub_1B820ED44();
}

uint64_t sub_1B820BAD0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v2 || (sub_1B820ECCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1B820ECCC();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1B820BBB4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 0x79726F6765746163;
}

uint64_t sub_1B820BBE8()
{
  char *v0;

  return sub_1B820BBB4(*v0);
}

uint64_t sub_1B820BBF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1B820BAD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B820BC14()
{
  return sub_1B81F1E58();
}

uint64_t sub_1B820BC30@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B81F1E0C();
  *a1 = result;
  return result;
}

uint64_t sub_1B820BC54()
{
  sub_1B820BDC0();
  return sub_1B820ED74();
}

uint64_t sub_1B820BC7C()
{
  sub_1B820BDC0();
  return sub_1B820ED80();
}

void CategoryDataPoint.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  sub_1B820C014(0, &qword_1EF19C298, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B820BDC0();
  sub_1B820ED68();
  v10 = 0;
  v7 = v8;
  sub_1B820EC6C();
  if (!v7)
  {
    v9 = 1;
    sub_1B820EC78();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_1_21();
}

unint64_t sub_1B820BDC0()
{
  unint64_t result;

  result = qword_1EF19C2A0;
  if (!qword_1EF19C2A0)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211FA8, &type metadata for CategoryDataPoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF19C2A0);
  }
  return result;
}

void CategoryDataPoint.hashValue.getter()
{
  sub_1B820ED2C();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3_15();
  swift_bridgeObjectRelease();
  sub_1B820ED44();
  sub_1B820ED50();
  OUTLINED_FUNCTION_2_18();
}

void CategoryDataPoint.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1B820C014(0, &qword_1EF19C2A8, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B820BDC0();
  sub_1B820ED5C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v6 = sub_1B820EC3C();
    v8 = v7;
    swift_bridgeObjectRetain();
    sub_1B820EC48();
    v10 = v9;
    OUTLINED_FUNCTION_0_31();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_21();
}

void sub_1B820BFBC()
{
  sub_1B820ED2C();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3_15();
  swift_bridgeObjectRelease();
  sub_1B820ED44();
  sub_1B820ED50();
  OUTLINED_FUNCTION_2_18();
}

void sub_1B820C014(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1B820BDC0();
    v7 = a3(a1, &type metadata for CategoryDataPoint.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_1B820C070(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  CategoryDataPoint.init(from:)(a1, a2);
}

void sub_1B820C084(_QWORD *a1)
{
  CategoryDataPoint.encode(to:)(a1);
}

_QWORD *assignWithCopy for CategoryDataPoint(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for CategoryDataPoint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t storeEnumTagSinglePayload for CategoryDataPoint.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B820C174 + 4 * byte_1B8211E05[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B820C1A8 + 4 * byte_1B8211E00[v4]))();
}

uint64_t sub_1B820C1A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B820C1B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B820C1B8);
  return result;
}

uint64_t sub_1B820C1C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B820C1CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B820C1D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B820C1D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CategoryDataPoint.CodingKeys()
{
  return &type metadata for CategoryDataPoint.CodingKeys;
}

unint64_t sub_1B820C1F8()
{
  unint64_t result;

  result = qword_1EF19C2B0;
  if (!qword_1EF19C2B0)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211F80, &type metadata for CategoryDataPoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF19C2B0);
  }
  return result;
}

unint64_t sub_1B820C238()
{
  unint64_t result;

  result = qword_1EF19C2B8;
  if (!qword_1EF19C2B8)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211EF0, &type metadata for CategoryDataPoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF19C2B8);
  }
  return result;
}

unint64_t sub_1B820C278()
{
  unint64_t result;

  result = qword_1EF19C2C0;
  if (!qword_1EF19C2C0)
  {
    result = MEMORY[0x1BCCAE964](&unk_1B8211F18, &type metadata for CategoryDataPoint.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF19C2C0);
  }
  return result;
}

uint64_t dispatch thunk of ValueCoordinateCalculatorType.value(for:on:orientation:size:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void sub_1B820C2BC(double *a1, double a2, double a3)
{
  uint64_t v3;

  if (a1[1] - *a1 > 0.0 && a3 > 0.0)
  {
    OUTLINED_FUNCTION_0_32((uint64_t)a1);
    OUTLINED_FUNCTION_2_19(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
  }
  OUTLINED_FUNCTION_1_22();
}

void sub_1B820C32C(double *a1, double a2, double a3)
{
  sub_1B820C2BC(a1, a2, a3);
}

uint64_t SparklineStyle.init(identifier:lineStyle:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t SparklineStyle.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1B820E894();
  return swift_bridgeObjectRelease();
}

uint64_t static SparklineStyle.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1B820ECCC();
}

uint64_t SparklineStyle.hashValue.getter()
{
  sub_1B820ED2C();
  swift_bridgeObjectRetain();
  sub_1B820E894();
  swift_bridgeObjectRelease();
  return sub_1B820ED50();
}

uint64_t sub_1B820C420()
{
  sub_1B820ED2C();
  swift_bridgeObjectRetain();
  sub_1B820E894();
  swift_bridgeObjectRelease();
  return sub_1B820ED50();
}

unint64_t sub_1B820C478()
{
  unint64_t result;

  result = qword_1EF19C2C8;
  if (!qword_1EF19C2C8)
  {
    result = MEMORY[0x1BCCAE964](&protocol conformance descriptor for SparklineStyle, &type metadata for SparklineStyle);
    atomic_store(result, (unint64_t *)&qword_1EF19C2C8);
  }
  return result;
}

_QWORD *assignWithCopy for SparklineStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SparklineStyle(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

void sub_1B820C560(void *a1)
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(a1, sel_setBackgroundColor_, v2);

}

void sub_1B820C5C0(void *a1, double *a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v3 = *((_QWORD *)a2 + 2);
  v4 = a2[3];
  v5 = (void *)*((_QWORD *)a2 + 4);
  objc_msgSend(a1, sel_setFillColor_, 0);
  v6 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(a1, sel_setStrokeColor_, v6);

  objc_msgSend(a1, sel_setLineWidth_, v4);
  objc_msgSend(a1, sel_setLineCap_, *MEMORY[0x1E0CD3010]);
  if (v3)
  {
    v7 = *(_QWORD *)(v3 + 16);
    v8 = MEMORY[0x1E0DEE9D8];
    if (v7)
    {
      v12 = MEMORY[0x1E0DEE9D8];
      sub_1B820EBB8();
      v9 = (uint64_t *)(v3 + 32);
      do
      {
        v10 = *v9++;
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v10);
        sub_1B820EBA0();
        sub_1B820EBC4();
        sub_1B820EBD0();
        sub_1B820EBAC();
        --v7;
      }
      while (v7);
      v8 = v12;
    }
    sub_1B820C780(v8, a1);
  }
  sub_1B820E888();
  v11 = (id)sub_1B820E864();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setLineCap_, v11);

}

void sub_1B820C780(uint64_t a1, void *a2)
{
  id v3;

  sub_1B820C7E0();
  v3 = (id)sub_1B820E8D0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setLineDashPattern_, v3);

}

unint64_t sub_1B820C7E0()
{
  unint64_t result;

  result = qword_1ED553120;
  if (!qword_1ED553120)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED553120);
  }
  return result;
}

uint64_t *ColumnChartOptions.init(preferredWidthPerBar:spacingBetweenSeries:minimumSpacingBetweenCategories:cornerRadius:renderSynchronous:)@<X0>(uint64_t *result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *result;
  v7 = result[1];
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(_QWORD *)(a3 + 24) = v6;
  *(_QWORD *)(a3 + 32) = v7;
  *(_BYTE *)(a3 + 40) = a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnChartOptions(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 40);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnChartOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnChartOptions()
{
  return &type metadata for ColumnChartOptions;
}

uint64_t sub_1B820C8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  double v31;
  uint64_t result;
  char v33;
  double v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
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
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v4 = v3;
  v7 = sub_1B820E558();
  v54 = *(_QWORD *)(v7 - 8);
  v55 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v51 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v57 = (char *)&v50 - v10;
  sub_1B81E87EC();
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(double *)a3;
  v17 = *(_QWORD *)(a3 + 8);
  sub_1B81FFE64();
  v18 = MEMORY[0x1E0DEE9D8];
  v58 = sub_1B820E828();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v19 = sub_1B820CD2C();
  v20 = *(_QWORD *)(v19 + 16);
  v52 = v19;
  if (v20)
  {
    v21 = *(_QWORD *)(v4 + 16);
    v22 = (uint64_t *)(v19 + 72);
    v59 = MEMORY[0x1E0DEE9D8];
    v53 = v4;
    v60 = v21;
    while (1)
    {
      v23 = *(v22 - 5);
      v24 = *(v22 - 4);
      v25 = *(v22 - 3);
      v26 = *(v22 - 2);
      v28 = *(v22 - 1);
      v27 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29 = LineChartCoordinateProvider.horizontalLocation(for:in:)(v25, v26);
      if ((v30 & 1) != 0
        || (v31 = *(double *)&v29,
            *(double *)&result = COERCE_DOUBLE(LineChartCoordinateProvider.horizontalLocation(for:in:)(v28, v27)),
            (v33 & 1) != 0)
        || (v34 = *(double *)&result, v31 >= *(double *)&result))
      {
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_3();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v31 <= -9.22337204e18)
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        if (v31 >= 9.22337204e18)
          goto LABEL_34;
        if ((*(_QWORD *)&v31 & 0x7FF0000000000000) == 0x7FF0000000000000
          || (result & 0x7FF0000000000000) == 0x7FF0000000000000)
        {
          goto LABEL_35;
        }
        if (*(double *)&result <= -9.22337204e18)
          goto LABEL_36;
        if (*(double *)&result >= 9.22337204e18)
          goto LABEL_37;
        result = (uint64_t)v31;
        v36 = (uint64_t)v34;
        if ((uint64_t)v34 < (uint64_t)v31)
          goto LABEL_38;
        v37 = (uint64_t)v57;
        v56 = (uint64_t)v31;
        sub_1B820E4E0();
        v61 = *(_QWORD *)&v16;
        v62 = v17;
        swift_bridgeObjectRetain();
        v38 = v59;
        swift_bridgeObjectRetain();
        v39 = sub_1B820CF98(v37, v38, (uint64_t)&v61);
        swift_bridgeObjectRelease();
        v40 = v58;
        swift_isUniquelyReferenced_nonNull_native();
        v61 = v40;
        sub_1B81FFAE8(v39, v23, v24);
        v58 = v61;
        OUTLINED_FUNCTION_5_0();
        OUTLINED_FUNCTION_3();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        {
          v41 = v59;
        }
        else
        {
          sub_1B81EBB04();
          v41 = v45;
        }
        v42 = *(_QWORD *)(v41 + 16);
        if (v42 >= *(_QWORD *)(v41 + 24) >> 1)
        {
          sub_1B81EBB04();
          v41 = v46;
        }
        *(_QWORD *)(v41 + 16) = v42 + 1;
        v59 = v41;
        v43 = v41 + 16 * v42;
        v44 = v57;
        *(_QWORD *)(v43 + 32) = v56;
        *(_QWORD *)(v43 + 40) = v36;
        (*(void (**)(char *, uint64_t))(v54 + 8))(v44, v55);
      }
      v22 += 6;
      if (!--v20)
        goto LABEL_25;
    }
  }
  v59 = v18;
LABEL_25:
  *(double *)&result = COERCE_DOUBLE(swift_bridgeObjectRelease());
  v47 = v59;
  if (!*(_QWORD *)(v59 + 16))
  {
    OUTLINED_FUNCTION_3();
    return 0;
  }
  if ((~*(_QWORD *)&v16 & 0x7FF0000000000000) == 0)
    goto LABEL_39;
  if (v16 <= -9.22337204e18)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (((uint64_t)v16 & 0x8000000000000000) == 0)
  {
    v48 = (uint64_t)v51;
    sub_1B820E4E0();
    v61 = *(_QWORD *)&v16;
    v62 = v17;
    v49 = sub_1B820CF98(v48, v47, (uint64_t)&v61);
    OUTLINED_FUNCTION_3();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v48, v55);
    return v49;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1B820CD2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
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

  sub_1B81E87EC();
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v0, v2);
  sub_1B81DFAAC(&qword_1ED552C18, (uint64_t (*)(uint64_t))sub_1B81E87EC, MEMORY[0x1E0DB3DB8]);
  v5 = sub_1B820E8AC();
  v6 = *(_QWORD *)(v5 + 16);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
  if (v6 < 2)
    return v5;
  v8 = 0;
  v9 = v6 >> 1;
  v10 = v6 - 1;
  v11 = 48 * v6 - 16;
  v12 = 72;
  v34 = v6 >> 1;
  while (1)
  {
    if (v8 == v10)
      goto LABEL_11;
    v13 = *(_QWORD *)(v5 + 16);
    if (v8 >= v13)
      break;
    if (v10 >= v13)
      goto LABEL_14;
    v15 = *(_QWORD *)(v5 + v12 - 40);
    v14 = *(_QWORD *)(v5 + v12 - 32);
    v16 = *(_QWORD *)(v5 + v12 - 16);
    v38 = *(_QWORD *)(v5 + v12 - 24);
    v39 = v14;
    v17 = *(_QWORD *)(v5 + v12);
    v36 = *(_QWORD *)(v5 + v12 - 8);
    v18 = v5 + v11;
    v19 = *(_QWORD *)(v5 + v11);
    v20 = *(_QWORD *)(v5 + v11 + 8);
    v42 = *(_QWORD *)(v5 + v11 + 16);
    v43 = v19;
    v21 = v5;
    v23 = *(_QWORD *)(v5 + v11 + 24);
    v22 = *(_QWORD *)(v18 + 32);
    v40 = v15;
    v41 = v22;
    v24 = *(_QWORD *)(v18 + 40);
    swift_bridgeObjectRetain();
    v37 = v16;
    swift_bridgeObjectRetain();
    v35 = v17;
    swift_bridgeObjectRetain();
    v44 = v20;
    v25 = v23;
    v5 = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B820D368();
      v5 = v32;
    }
    v26 = (_QWORD *)(v5 + v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v27 = v44;
    *(v26 - 5) = v43;
    *(v26 - 4) = v27;
    *(v26 - 3) = v42;
    *(v26 - 2) = v25;
    *(v26 - 1) = v41;
    *v26 = v24;
    if (v10 >= *(_QWORD *)(v5 + 16))
      goto LABEL_15;
    v28 = (_QWORD *)(v5 + v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v29 = v39;
    *v28 = v40;
    v28[1] = v29;
    v30 = v37;
    v28[2] = v38;
    v28[3] = v30;
    v9 = v34;
    v31 = v35;
    v28[4] = v36;
    v28[5] = v31;
LABEL_11:
    ++v8;
    v12 += 48;
    --v10;
    v11 -= 48;
    if (v9 == v8)
      return v5;
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1B820CF98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  void (*v17)(void);
  uint64_t v18;
  uint64_t *v19;
  uint64_t result;
  id v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  void (*v25)(uint64_t *, _QWORD);
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35[4];

  v5 = sub_1B820E534();
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B820D2B4();
  v9 = v8;
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B820E558();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(double *)(a3 + 8);
  v17 = *(void (**)(void))(v13 + 16);
  v34 = v15;
  v17();
  v18 = *(_QWORD *)(a2 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    v19 = (uint64_t *)(a2 + 40);
    while (1)
    {
      result = *(v19 - 1);
      if (*v19 < result)
        break;
      v19 += 2;
      sub_1B820E51C();
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    v31 = v13;
    v32 = v12;
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3508]), sel_init);
    sub_1B820E540();
    sub_1B820E528();
    v22 = *(void (**)(char *, uint64_t))(v33 + 8);
    v22(v7, v5);
    v23 = &v11[*(int *)(v9 + 36)];
    sub_1B81DFAAC((unint64_t *)&unk_1ED552BF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1358], MEMORY[0x1E0CB1378]);
    v24 = *(_QWORD *)v23;
    sub_1B820E990();
    if (v24 == v35[0])
    {
LABEL_9:
      sub_1B820D32C((uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v32);
      return (uint64_t)v21;
    }
    while (1)
    {
      v25 = (void (*)(uint64_t *, _QWORD))sub_1B820E9A8();
      v28 = *v26;
      v27 = v26[1];
      v25(v35, 0);
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v7, v11, v5);
      sub_1B820E99C();
      result = ((uint64_t (*)(char *, uint64_t))v22)(v7, v5);
      if (__OFSUB__(v27, v28))
        break;
      v29 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRect_, (double)v28, 0.0, (double)(v27 - v28), v16);
      objc_msgSend(v21, sel_appendPath_, v29);

      v30 = *(_QWORD *)v23;
      sub_1B820E990();
      if (v30 == v35[0])
        goto LABEL_9;
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LineZoneMaskProvider()
{
  return objc_opt_self();
}

void sub_1B820D2B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED553128)
  {
    sub_1B820E534();
    sub_1B81DFAAC((unint64_t *)&unk_1ED552BF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1358], MEMORY[0x1E0CB1378]);
    v0 = sub_1B820EBE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED553128);
  }
}

uint64_t sub_1B820D32C(uint64_t a1)
{
  uint64_t v2;

  sub_1B820D2B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B820D368()
{
  sub_1B81EBBB0();
}

TeaCharts::ColumnChartStyle __swiftcall ColumnChartStyle.init(columnStyles:)(TeaCharts::ColumnChartStyle columnStyles)
{
  TeaCharts::ColumnChartStyle *v1;

  v1->columnStyles._rawValue = columnStyles.columnStyles._rawValue;
  return columnStyles;
}

ValueMetadata *type metadata accessor for ColumnChartStyle()
{
  return &type metadata for ColumnChartStyle;
}

uint64_t CornerRadius.init(corners:radius:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

ValueMetadata *type metadata accessor for CornerRadius()
{
  return &type metadata for CornerRadius;
}

uint64_t sub_1B820D3B0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_1B820D3D8(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  int v7;
  id v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  uint64_t v21[8];
  char v22;

  v3 = v2;
  v6 = a1 + *(int *)(type metadata accessor for ColumnChartModel() + 24);
  v7 = *(unsigned __int8 *)(v6 + 40);
  __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
  v8 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v8, sel_scale);

  v10 = *(double *)v6;
  v9 = *(double *)(v6 + 8);
  v11 = *(double *)(v6 + 16);
  v12 = *(_QWORD *)(v6 + 24);
  v13 = *(double *)(v6 + 32);
  if (v7 == 1)
  {
    OUTLINED_FUNCTION_0_33(v12, v13, v11, v9, v10);
    v22 = 1;
    v14 = sub_1B81FBB60(a1, v21);
    if (v14)
    {
      v20 = (void *)v14;
      objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView], sel_setImage_);
      objc_msgSend(a2, sel_setAlpha_, 1.0);

    }
  }
  else
  {
    OUTLINED_FUNCTION_0_33(v12, v13, v11, v9, v10);
    v22 = 0;
    sub_1B81FBC58(a1, v21);
    objc_msgSend(a2, sel_setAlpha_, 0.0);
    __swift_project_boxed_opaque_existential_1(v3 + 7, v3[10]);
    sub_1B81E23A4(0, (unint64_t *)&qword_1ED555360);
    v15 = (void *)sub_1B820EA20();
    MEMORY[0x1E0C80A78](v15);
    sub_1B820E6A8();

    v16 = (void *)sub_1B820E5DC();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a2;
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = sub_1B820D898;
    *(_QWORD *)(v18 + 24) = v17;
    v19 = a2;
    sub_1B820E768();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
  }
}

uint64_t sub_1B820D678(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  sub_1B81E227C();
  sub_1B820E7A4();
  v3 = (void *)sub_1B820E5DC();
  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v4 = a2;
  v5 = sub_1B820E768();
  swift_release();

  swift_release();
  return v5;
}

void sub_1B820D730(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v2 = (void *)objc_opt_self();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  v6[4] = sub_1B81F1580;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1B81E45C8;
  v6[3] = &block_descriptor_3;
  v4 = _Block_copy(v6);
  v5 = a1;
  swift_release();
  objc_msgSend(v2, sel_animateWithDuration_animations_, v4, 0.15);
  _Block_release(v4);
}

uint64_t sub_1B820D7FC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t sub_1B820D828()
{
  sub_1B820D7FC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ColumnChartRenderer()
{
  return objc_opt_self();
}

uint64_t sub_1B820D868()
{
  uint64_t v0;

  return sub_1B820D678(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1B820D874()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B820D898()
{
  uint64_t v0;

  sub_1B820D730(*(void **)(v0 + 16));
}

uint64_t sub_1B820D8A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B820D8C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B820D8EC()
{
  return sub_1B820E720();
}

id sub_1B820D91C(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC9TeaCharts15ColumnChartView_imageView), sel_setImage_, *(_QWORD *)(a1 + 8));
}

id sub_1B820D968()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  qword_1EF19C2D0 = (uint64_t)result;
  byte_1EF19C2D8 = 0;
  return result;
}

uint64_t ColumnStyle.init(backgroundColor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

id static ColumnStyle.default.getter@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  char v3;

  if (qword_1EF19BAC8 != -1)
    swift_once();
  v2 = (void *)qword_1EF19C2D0;
  v3 = byte_1EF19C2D8;
  *(_QWORD *)a1 = qword_1EF19C2D0;
  *(_BYTE *)(a1 + 8) = v3;
  return sub_1B81E892C(v2, v3);
}

uint64_t ColumnStyle.init(fill:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for ColumnStyle()
{
  return &type metadata for ColumnStyle;
}

_QWORD *__swift_initWithCopy_strong(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t __swift_destroy_strong()
{
  return swift_release();
}

_QWORD *__swift_assignWithCopy_strong(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_assignWithTake_strong(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1B820DAD0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 8))
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

uint64_t sub_1B820DB10(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for InteractionType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InteractionType);
}

_QWORD *initializeBufferWithCopyOfBuffer for StrokeStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StrokeStyle()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for StrokeStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for StrokeStyle(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

void _s9TeaCharts27LineChartCoordinateProviderC8register15coordinateSpace4sizeyAA0eI0VyAA12CategoryAxisVAA05ValueL0VG_So6CGSizeVtF_0(uint64_t a1, double a2, double a3)
{
  sub_1B820E594();
  sub_1B81E5504(a1, a2, a3);
  sub_1B820E5A0();
  OUTLINED_FUNCTION_0_34();
}

uint64_t sub_1B820DC5C()
{
  return LineChartCoordinateProvider.register(coordinateSpace:size:)();
}

uint64_t sub_1B820DC7C(uint64_t *a1)
{
  return LineChartCoordinateProvider.location(for:in:)(a1);
}

uint64_t sub_1B820DCA0()
{
  return type metadata accessor for LineChartCoordinateProvider();
}

uint64_t method lookup function for LineChartCoordinateProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ChartViewProviderType.view(for:style:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ChartViewProviderType.present(_:on:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

id ColumnChartViewProvider.view(for:style:)()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ColumnChartView()), sel_init);
}

void ColumnChartViewProvider.present(_:on:attributes:)(uint64_t a1, char *a2, CGRect *a3)
{
  uint64_t v3;

  if (!CGRectIsEmpty(*a3))
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
    sub_1B820D3D8(a1, a2);
  }
}

uint64_t ColumnChartViewProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t ColumnChartViewProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

id sub_1B820DE20()
{
  return ColumnChartViewProvider.view(for:style:)();
}

void sub_1B820DE34(uint64_t a1, char *a2, CGRect *a3)
{
  ColumnChartViewProvider.present(_:on:attributes:)(a1, a2, a3);
}

uint64_t method lookup function for ColumnChartViewProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t Grid.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)v1;
  v3 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v3;
  return sub_1B81EE390(v2, v3);
}

id Grid.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __int128 v5;
  id v7;

  v2 = *(_QWORD *)(v1 + 24);
  v7 = *(id *)(v1 + 32);
  v3 = *(_BYTE *)(v1 + 40);
  v4 = *(_BYTE *)(v1 + 41);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 25) = v4;
  v5 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t Grid.label.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 80);
  return swift_retain();
}

__n128 Grid.init(_:style:label:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, __n128 *a4@<X8>)
{
  unsigned __int8 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  __n128 result;
  __n128 v12;

  v4 = *(_BYTE *)(a1 + 8);
  v5 = a2->n128_u64[0];
  v6 = a2->n128_i64[1];
  v7 = a2[1].n128_i64[0];
  v8 = a2[1].n128_i8[8];
  v9 = a2[1].n128_i8[9];
  v10 = *a3;
  a4->n128_u64[0] = *(_QWORD *)a1;
  a4->n128_u8[8] = v4;
  a4[1].n128_u64[0] = v5;
  a4[1].n128_u64[1] = v6;
  a4[2].n128_u64[0] = v7;
  a4[2].n128_u8[8] = v8;
  a4[2].n128_u8[9] = v9;
  result = a2[2];
  v12 = a2[3];
  a4[3] = result;
  a4[4] = v12;
  a4[5].n128_u64[0] = v10;
  return result;
}

uint64_t sub_1B820DF20(uint64_t a1)
{
  sub_1B81EE39C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1B820DF5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  id v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_1B81EE390(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v8 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  v9 = v7;
  swift_retain();
  return a1;
}

uint64_t sub_1B820DFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_1B81EE390(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_1B81EE39C(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v8 = *(void **)(a2 + 32);
  v9 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  v10 = v8;

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t sub_1B820E0BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  __int128 v9;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_1B81EE39C(v6, v7);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = a2[3];
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = a2[4];

  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_BYTE *)(a1 + 41) = *((_BYTE *)a2 + 41);
  v9 = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 80) = a2[10];
  swift_release();
  return a1;
}

uint64_t sub_1B820E14C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 32);
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

uint64_t sub_1B820E18C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for Grid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Grid);
}

double ChartLayoutAttributes.chartFrame.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t ChartLayoutAttributes.gridSetLayoutAttributes.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_QWORD *)(v1 + 96);
  v3 = *(_QWORD *)(v1 + 104);
  v4 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = v2;
  *(_QWORD *)(a1 + 72) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ChartLayoutAttributes()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChartLayoutAttributes(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ChartLayoutAttributes(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

_OWORD *assignWithTake for ChartLayoutAttributes(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ChartLayoutAttributes(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 96);
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

uint64_t storeEnumTagSinglePayload for ChartLayoutAttributes(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 96) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartLayoutAttributes()
{
  return &type metadata for ChartLayoutAttributes;
}

uint64_t sub_1B820E468()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B820E474()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1B820E480()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B820E48C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B820E498()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B820E4A4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B820E4B0()
{
  return MEMORY[0x1E0CB0B80]();
}

uint64_t sub_1B820E4BC()
{
  return MEMORY[0x1E0CB0BC0]();
}

uint64_t sub_1B820E4C8()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1B820E4D4()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B820E4E0()
{
  return MEMORY[0x1E0CB1268]();
}

uint64_t sub_1B820E4EC()
{
  return MEMORY[0x1E0CB1270]();
}

uint64_t sub_1B820E4F8()
{
  return MEMORY[0x1E0CB1278]();
}

uint64_t sub_1B820E504()
{
  return MEMORY[0x1E0CB12F8]();
}

uint64_t sub_1B820E510()
{
  return MEMORY[0x1E0CB1300]();
}

uint64_t sub_1B820E51C()
{
  return MEMORY[0x1E0CB1318]();
}

uint64_t sub_1B820E528()
{
  return MEMORY[0x1E0CB1350]();
}

uint64_t sub_1B820E534()
{
  return MEMORY[0x1E0CB1358]();
}

uint64_t sub_1B820E540()
{
  return MEMORY[0x1E0CB1388]();
}

uint64_t sub_1B820E54C()
{
  return MEMORY[0x1E0CB1398]();
}

uint64_t sub_1B820E558()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1B820E564()
{
  return MEMORY[0x1E0CB1420]();
}

uint64_t sub_1B820E570()
{
  return MEMORY[0x1E0CB1440]();
}

uint64_t sub_1B820E57C()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1B820E588()
{
  return MEMORY[0x1E0C9B8A8]();
}

uint64_t sub_1B820E594()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1B820E5A0()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1B820E5AC()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1B820E5B8()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1B820E5C4()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1B820E5D0()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1B820E5DC()
{
  return MEMORY[0x1E0DB3458]();
}

uint64_t sub_1B820E5E8()
{
  return MEMORY[0x1E0DB3550]();
}

uint64_t sub_1B820E5F4()
{
  return MEMORY[0x1E0DB35C8]();
}

uint64_t sub_1B820E600()
{
  return MEMORY[0x1E0DB35D0]();
}

uint64_t sub_1B820E60C()
{
  return MEMORY[0x1E0DB35E8]();
}

uint64_t sub_1B820E618()
{
  return MEMORY[0x1E0DB35F0]();
}

uint64_t sub_1B820E624()
{
  return MEMORY[0x1E0DB3670]();
}

uint64_t sub_1B820E630()
{
  return MEMORY[0x1E0DB3678]();
}

uint64_t sub_1B820E63C()
{
  return MEMORY[0x1E0DB37B8]();
}

uint64_t sub_1B820E648()
{
  return MEMORY[0x1E0DB37C0]();
}

uint64_t sub_1B820E654()
{
  return MEMORY[0x1E0DB38A8]();
}

uint64_t sub_1B820E660()
{
  return MEMORY[0x1E0DB38B0]();
}

uint64_t sub_1B820E66C()
{
  return MEMORY[0x1E0DB38F8]();
}

uint64_t sub_1B820E678()
{
  return MEMORY[0x1E0DB3900]();
}

uint64_t sub_1B820E684()
{
  return MEMORY[0x1E0DB3908]();
}

uint64_t sub_1B820E690()
{
  return MEMORY[0x1E0DB3910]();
}

uint64_t sub_1B820E69C()
{
  return MEMORY[0x1E0DB3938]();
}

uint64_t sub_1B820E6A8()
{
  return MEMORY[0x1E0DB3CF8]();
}

uint64_t sub_1B820E6B4()
{
  return MEMORY[0x1E0DB3D10]();
}

uint64_t sub_1B820E6C0()
{
  return MEMORY[0x1E0DB3D30]();
}

uint64_t sub_1B820E6CC()
{
  return MEMORY[0x1E0DB3D38]();
}

uint64_t sub_1B820E6D8()
{
  return MEMORY[0x1E0DB3D50]();
}

uint64_t sub_1B820E6E4()
{
  return MEMORY[0x1E0DB3D68]();
}

uint64_t sub_1B820E6F0()
{
  return MEMORY[0x1E0DB3D88]();
}

uint64_t sub_1B820E6FC()
{
  return MEMORY[0x1E0DB3D90]();
}

uint64_t sub_1B820E708()
{
  return MEMORY[0x1E0DB3DA8]();
}

uint64_t sub_1B820E714()
{
  return MEMORY[0x1E0DB3DD8]();
}

uint64_t sub_1B820E720()
{
  return MEMORY[0x1E0DB4260]();
}

uint64_t sub_1B820E72C()
{
  return MEMORY[0x1E0DB4268]();
}

uint64_t sub_1B820E738()
{
  return MEMORY[0x1E0DB4270]();
}

uint64_t sub_1B820E744()
{
  return MEMORY[0x1E0DB43B0]();
}

uint64_t sub_1B820E750()
{
  return MEMORY[0x1E0DB43B8]();
}

uint64_t sub_1B820E75C()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1B820E768()
{
  return MEMORY[0x1E0DB4C00]();
}

uint64_t sub_1B820E774()
{
  return MEMORY[0x1E0DB4C10]();
}

uint64_t sub_1B820E780()
{
  return MEMORY[0x1E0DB4C48]();
}

uint64_t sub_1B820E78C()
{
  return MEMORY[0x1E0DB4CC0]();
}

uint64_t sub_1B820E798()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1B820E7A4()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1B820E7B0()
{
  return MEMORY[0x1E0DB4EE8]();
}

uint64_t sub_1B820E7BC()
{
  return MEMORY[0x1E0DB4EF0]();
}

uint64_t sub_1B820E7C8()
{
  return MEMORY[0x1E0DB4F00]();
}

uint64_t sub_1B820E7D4()
{
  return MEMORY[0x1E0DB4F08]();
}

uint64_t sub_1B820E7E0()
{
  return MEMORY[0x1E0DB4F18]();
}

uint64_t sub_1B820E7EC()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B820E7F8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B820E804()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B820E810()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B820E81C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B820E828()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B820E834()
{
  return MEMORY[0x1E0DE9FF8]();
}

uint64_t sub_1B820E840()
{
  return MEMORY[0x1E0DEA000]();
}

uint64_t sub_1B820E84C()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1B820E858()
{
  return MEMORY[0x1E0DEA4B0]();
}

uint64_t sub_1B820E864()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B820E870()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B820E87C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B820E888()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B820E894()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B820E8A0()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1B820E8AC()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_1B820E8B8()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1B820E8C4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B820E8D0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B820E8DC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B820E8E8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B820E8F4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1B820E900()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B820E90C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B820E918()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1B820E924()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B820E930()
{
  return MEMORY[0x1E0DEAEE0]();
}

uint64_t sub_1B820E93C()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1B820E948()
{
  return MEMORY[0x1E0CB1B70]();
}

uint64_t sub_1B820E954()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1B820E960()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B820E96C()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B820E978()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1B820E984()
{
  return MEMORY[0x1E0DEB5A0]();
}

uint64_t sub_1B820E990()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1B820E99C()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1B820E9A8()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1B820E9B4()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1B820E9C0()
{
  return MEMORY[0x1E0C8ED70]();
}

uint64_t sub_1B820E9CC()
{
  return MEMORY[0x1E0C9B8D8]();
}

uint64_t sub_1B820E9D8()
{
  return MEMORY[0x1E0C9B938]();
}

uint64_t sub_1B820E9E4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B820E9F0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B820E9FC()
{
  return MEMORY[0x1E0C8ED78]();
}

uint64_t sub_1B820EA08()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B820EA14()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B820EA20()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B820EA2C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B820EA38()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B820EA44()
{
  return MEMORY[0x1E0C8ED90]();
}

uint64_t sub_1B820EA50()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B820EA5C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B820EA68()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B820EA74()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B820EA80()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B820EA8C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1B820EA98()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B820EAA4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B820EAB0()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B820EABC()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1B820EAC8()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B820EAD4()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1B820EAE0()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1B820EAEC()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1B820EAF8()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B820EB04()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B820EB10()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1B820EB1C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B820EB28()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1B820EB34()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1B820EB40()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B820EB4C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B820EB58()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B820EB64()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B820EB70()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1B820EB7C()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1B820EB88()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B820EB94()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B820EBA0()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B820EBAC()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B820EBB8()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B820EBC4()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B820EBD0()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B820EBDC()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B820EBE8()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1B820EBF4()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1B820EC00()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1B820EC0C()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1B820EC18()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B820EC24()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B820EC30()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B820EC3C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1B820EC48()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1B820EC54()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B820EC60()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1B820EC6C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1B820EC78()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1B820EC84()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B820EC90()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1B820EC9C()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1B820ECA8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B820ECB4()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1B820ECC0()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B820ECCC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B820ECD8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B820ECE4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B820ECF0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B820ECFC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B820ED08()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B820ED14()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B820ED20()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B820ED2C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B820ED38()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B820ED44()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1B820ED50()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B820ED5C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B820ED68()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B820ED74()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B820ED80()
{
  return MEMORY[0x1E0DEE8E8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
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

