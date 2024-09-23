uint64_t sub_1C0478588()
{
  return sub_1C0477928();
}

void sub_1C047859C(void *a1, id a2, uint64_t a3)
{
  void *v6;

  if ((objc_msgSend(a2, sel_isCancelled) & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1C3B9BA20]();
    sub_1C0478618(a1, (uint64_t)a2, a3);
    objc_autoreleasePoolPop(v6);
  }
}

uint64_t sub_1C0478618(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v22[3];
  _QWORD v23[5];
  char v24;

  type metadata accessor for AppIntentProcessor();
  v6 = a2 + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store;
  v7 = *(_QWORD *)(a2 + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store);
  v8 = *(unsigned __int8 *)(v6 + 8);
  v9 = *(unsigned __int8 *)(v6 + 9);
  v10 = *(unsigned __int8 *)(v6 + 10);
  v11 = *(unsigned __int8 *)(v6 + 11);
  v13 = *(_QWORD *)(v6 + 16);
  v12 = *(_QWORD *)(v6 + 24);
  v14 = *(_QWORD *)(v6 + 32);
  v15 = *(_BYTE *)(v6 + 40);
  v16 = v9 == 0;
  v17 = 256;
  if (v16)
    v17 = 0;
  v18 = v17 | v8;
  v19 = 0x10000;
  if (!v10)
    v19 = 0;
  v20 = 0x1000000;
  if (!v11)
    v20 = 0;
  v23[0] = v7;
  v23[1] = v18 | v19 | v20;
  v23[2] = v13;
  v23[3] = v12;
  v23[4] = v14;
  v24 = v15;
  memset(v22, 0, 41);
  swift_retain();
  swift_retain();
  sub_1C03FB48C(v12, v14);
  sub_1C0472644(a1, (uint64_t)v23, a3, (uint64_t)v22, 0);
  swift_release();
  swift_release();
  return sub_1C03FB2C8(v12, v14);
}

id AppIntentBackfiller.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppIntentBackfiller();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AppIntentBackfiller()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1C04787D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_1C0478838()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1C0478864(void *a1)
{
  uint64_t v1;

  sub_1C047859C(a1, *(id *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return sub_1C0486164();
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 144) + 8))(*(_QWORD *)(v0 - 160), *(_QWORD *)(v0 - 152));
}

void *OUTLINED_FUNCTION_7_19@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

uint64_t sub_1C047889C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  char v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    v4 = OUTLINED_FUNCTION_1_27();
    sub_1C047FB68(v4, v5, v6);
    result = v11;
    v7 = (uint64_t *)(a1 + 32);
    do
    {
      v8 = *v7;
      v12 = result;
      v10 = *(_QWORD *)(result + 16);
      v9 = *(_QWORD *)(result + 24);
      if (v10 >= v9 >> 1)
      {
        sub_1C047FB68(v9 > 1, v10 + 1, 1);
        result = v12;
      }
      *(_QWORD *)(result + 16) = v10 + 1;
      *(_QWORD *)(result + 8 * v10 + 32) = v8;
      v7 += 2;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1C0478950(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1C047FAD8(0, v2, 0);
    result = v9;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *v4;
      v4 += 2;
      v5 = v6;
      v10 = result;
      v8 = *(_QWORD *)(result + 16);
      v7 = *(_QWORD *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1C047FAD8(v7 > 1, v8 + 1, 1);
        result = v10;
      }
      *(_QWORD *)(result + 16) = v8 + 1;
      *(_QWORD *)(result + 8 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1C0478A0C(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double *v7;
  double *v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v5 >= v4)
    v6 = *(_QWORD *)(a1 + 16);
  else
    v6 = *(_QWORD *)(a2 + 16);
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1C047FB68(0, v6, 0);
  v26 = a2;
  v27 = a1;
  if (v6)
  {
    v7 = (double *)(a1 + 32);
    v8 = (double *)(a2 + 32);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v10 = v6;
    v11 = v4;
    v12 = v5;
    v13 = v5;
    while (v4)
    {
      if (!v12)
        goto LABEL_22;
      v14 = *v7;
      v15 = *v8;
      v17 = *(_QWORD *)(v28 + 16);
      v16 = *(_QWORD *)(v28 + 24);
      if (v17 >= v16 >> 1)
      {
        v23 = v11;
        v24 = v13;
        result = sub_1C047FB68(v16 > 1, v17 + 1, 1);
        v11 = v23;
        v13 = v24;
      }
      --v12;
      *(_QWORD *)(v28 + 16) = v17 + 1;
      *(double *)(v28 + 8 * v17 + 32) = (v14 + v15) * 0.5;
      --v4;
      ++v8;
      ++v7;
      if (!--v10)
        goto LABEL_13;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v11 = v4;
    v13 = v5;
LABEL_13:
    if (v11 <= v13)
    {
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v28;
    }
    while (v6 < v11)
    {
      if (v13 == v6)
        goto LABEL_20;
      if (v6 >= v13)
        goto LABEL_24;
      v18 = *(double *)(v27 + 32 + 8 * v6);
      v19 = *(double *)(v26 + 32 + 8 * v6);
      v21 = *(_QWORD *)(v28 + 16);
      v20 = *(_QWORD *)(v28 + 24);
      if (v21 >= v20 >> 1)
      {
        v22 = v11;
        v25 = v13;
        result = sub_1C047FB68(v20 > 1, v21 + 1, 1);
        v13 = v25;
        v11 = v22;
      }
      ++v6;
      *(_QWORD *)(v28 + 16) = v21 + 1;
      *(double *)(v28 + 8 * v21 + 32) = (v18 + v19) * 0.5;
      if (v11 == v6)
        goto LABEL_20;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

void sub_1C0478C34(uint64_t a1, uint64_t a2, double a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double *v9;
  uint64_t *v10;
  unint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a2 + 16);
  if (v7 >= v6)
    v8 = *(_QWORD *)(a1 + 16);
  else
    v8 = *(_QWORD *)(a2 + 16);
  v25 = MEMORY[0x1E0DEE9D8];
  sub_1C047FB68(0, v8, 0);
  v23 = a1;
  v24 = v7;
  v21 = v6;
  v22 = a2;
  if (v8)
  {
    v9 = (double *)(a1 + 32);
    v10 = (uint64_t *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = v8;
    while (v6)
    {
      if (!v7)
        goto LABEL_22;
      v12 = *v9;
      v13 = log((double)*v10);
      v15 = *(_QWORD *)(v25 + 16);
      v14 = *(_QWORD *)(v25 + 24);
      if (v15 >= v14 >> 1)
        sub_1C047FB68(v14 > 1, v15 + 1, 1);
      --v7;
      *(_QWORD *)(v25 + 16) = v15 + 1;
      *(double *)(v25 + 8 * v15 + 32) = v13 + (0.0 - v12) / a3 * ((0.0 - v12) / a3) * -0.5;
      --v6;
      ++v10;
      ++v9;
      if (!--v11)
        goto LABEL_13;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_13:
    v16 = v24;
    if (v21 <= v24)
    {
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    while (v8 < v21)
    {
      if (v16 == v8)
        goto LABEL_20;
      if (v8 >= v16)
        goto LABEL_24;
      v17 = *(double *)(v23 + 32 + 8 * v8);
      v18 = log((double)*(uint64_t *)(v22 + 32 + 8 * v8));
      v20 = *(_QWORD *)(v25 + 16);
      v19 = *(_QWORD *)(v25 + 24);
      if (v20 >= v19 >> 1)
        sub_1C047FB68(v19 > 1, v20 + 1, 1);
      ++v8;
      *(_QWORD *)(v25 + 16) = v20 + 1;
      *(double *)(v25 + 8 * v20 + 32) = v18 + (0.0 - v17) / a3 * ((0.0 - v17) / a3) * -0.5;
      v16 = v24;
      if (v21 == v8)
        goto LABEL_20;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

double IntervalFrequency.interval.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void IntervalFrequency.interval.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*IntervalFrequency.interval.modify())()
{
  return nullsub_1;
}

uint64_t IntervalFrequency.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t IntervalFrequency.count.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*IntervalFrequency.count.modify())()
{
  return nullsub_1;
}

SiriRemembers::IntervalFrequency __swiftcall IntervalFrequency.init(interval:count:)(Swift::Double interval, Swift::Int count)
{
  uint64_t v2;
  SiriRemembers::IntervalFrequency result;

  *(Swift::Double *)v2 = interval;
  *(_QWORD *)(v2 + 8) = count;
  result.interval = interval;
  result.count = count;
  return result;
}

BOOL static IntervalFrequency.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
}

double static PriorDistributionUtils.defaultDirichletBandWidth.getter()
{
  return 864000.0;
}

double static PriorDistributionUtils.time7DaysBandWidth.getter()
{
  return 604800.0;
}

double static PriorDistributionUtils.computeDirichlet(frequencies:bandwidth:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  sub_1C047889C(a1);
  sub_1C0424374();
  v4 = sub_1C047889C(a1);
  v5 = sub_1C0478A0C((uint64_t)&unk_1E79BB3B0, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = sub_1C0478950(a1);
  sub_1C0478C34(v5, v6, a2);
  v8 = v7;
  OUTLINED_FUNCTION_24_0();
  swift_bridgeObjectRelease();
  v9 = sub_1C0478FFC(v8);
  swift_bridgeObjectRelease();
  return v9;
}

double sub_1C0478FFC(uint64_t a1)
{
  uint64_t v1;
  double *v2;
  double v3;
  double v4;
  long double v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return -INFINITY;
  v2 = (double *)(a1 + 32);
  v3 = -INFINITY;
  do
  {
    if (*v2 >= v3)
      v4 = *v2;
    else
      v4 = v3;
    if (*v2 < v3)
      v3 = *v2;
    if (v3 != -INFINITY)
    {
      v5 = exp(v3 - v4);
      v4 = v4 + log1p(v5);
    }
    ++v2;
    v3 = v4;
    --v1;
  }
  while (v1);
  return v4;
}

uint64_t static PriorDistributionUtils.normalize(scores:)(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  int64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  long double v18;
  unint64_t v19;
  uint64_t v21;

  v1 = sub_1C0479220(a1);
  v2 = sub_1C0478FFC(v1);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v5 = v2;
    v21 = MEMORY[0x1E0DEE9D8];
    v6 = OUTLINED_FUNCTION_1_27();
    sub_1C047FB68(v6, v7, v8);
    v9 = 0;
    v10 = v21;
    v11 = *(_QWORD *)(v21 + 16);
    do
    {
      v12 = *(double *)(v1 + 8 * v9 + 32);
      v13 = *(_QWORD *)(v21 + 24);
      if (v11 >= v13 >> 1)
        sub_1C047FB68(v13 > 1, v11 + 1, 1);
      ++v9;
      *(_QWORD *)(v21 + 16) = v11 + 1;
      *(double *)(v21 + 8 * v11++ + 32) = v12 - v5;
    }
    while (v3 != v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
  }
  v14 = *(_QWORD *)(v10 + 16);
  if (v14)
  {
    sub_1C047FB68(0, v14, 0);
    v15 = 0;
    v16 = v4;
    v17 = *(_QWORD *)(v4 + 16);
    do
    {
      v18 = exp(*(long double *)(v10 + 8 * v15 + 32));
      v19 = *(_QWORD *)(v16 + 24);
      if (v17 >= v19 >> 1)
        sub_1C047FB68(v19 > 1, v17 + 1, 1);
      ++v15;
      *(_QWORD *)(v16 + 16) = v17 + 1;
      *(long double *)(v16 + 8 * v17++ + 32) = v18;
    }
    while (v14 != v15);
    OUTLINED_FUNCTION_24_0();
  }
  else
  {
    OUTLINED_FUNCTION_24_0();
    return MEMORY[0x1E0DEE9D8];
  }
  return v16;
}

uint64_t sub_1C0479220(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  long double v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  long double v13;
  uint64_t v14;
  double v15;
  double v16;
  long double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  long double v22;
  long double v23;
  unint64_t v24;
  uint64_t v26;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v26 = MEMORY[0x1E0DEE9D8];
    sub_1C047FB68(0, v1, 0);
    v4 = v26;
    v5 = (double *)(a1 + 32);
    while (1)
    {
      v6 = *v5;
      if (*v5 > 0.0)
        break;
      v7 = 0.0;
      if (v6 != -INFINITY)
        goto LABEL_6;
LABEL_7:
      v10 = *(_QWORD *)(v26 + 16);
      v9 = *(_QWORD *)(v26 + 24);
      v11 = v10 + 1;
      if (v10 >= v9 >> 1)
        sub_1C047FB68(v9 > 1, v10 + 1, 1);
      *(_QWORD *)(v26 + 16) = v11;
      *(double *)(v26 + 8 * v10 + 32) = v7;
      ++v5;
      if (!--v1)
        goto LABEL_13;
    }
    v7 = *v5;
    v6 = 0.0;
LABEL_6:
    v8 = exp(v6 - v7);
    v7 = v7 + log1p(v8);
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
  if (v11)
  {
    v4 = MEMORY[0x1E0DEE9D8];
LABEL_13:
    v12 = 0;
    v13 = -INFINITY;
    do
    {
      v14 = v4 + 8 * v12;
      v15 = *(double *)(v14 + 32);
      if (v15 >= v13)
        v16 = v13;
      else
        v16 = *(double *)(v14 + 32);
      if (v15 >= v13)
        v13 = *(double *)(v14 + 32);
      if (v16 != -INFINITY)
      {
        v17 = exp(v16 - v13);
        v13 = v13 + log1p(v17);
      }
      ++v12;
    }
    while (v11 != v12);
    sub_1C047FB68(0, v11, 0);
    v18 = v2;
    v19 = 0;
    v20 = exp(v13) + 1.0;
    v21 = *(_QWORD *)(v18 + 16);
    do
    {
      v22 = exp(*(double *)(v4 + 8 * v19 + 32) - v13);
      v23 = log(v22 - sqrt(v22 * (1.0 - v22) / v20));
      v24 = *(_QWORD *)(v18 + 24);
      if (v21 >= v24 >> 1)
        sub_1C047FB68(v24 > 1, v21 + 1, 1);
      ++v19;
      *(_QWORD *)(v18 + 16) = v21 + 1;
      *(long double *)(v18 + 8 * v21++ + 32) = v23;
    }
    while (v11 != v19);
  }
  else
  {
    v18 = MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t getEnumTagSinglePayload for IntervalFrequency(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IntervalFrequency(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntervalFrequency()
{
  return &type metadata for IntervalFrequency;
}

ValueMetadata *type metadata accessor for PriorDistributionUtils()
{
  return &type metadata for PriorDistributionUtils;
}

uint64_t sub_1C04794B4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_1ED73B6D8 != -1)
    swift_once();
  v0 = (id)qword_1ED73AD20;
  sub_1C0486BC0();
  sub_1C0487208();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739BB8);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1C04881A0;
  v2 = sub_1C0487310();
  v4 = v3;
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 64) = sub_1C047970C();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  sub_1C0486BA8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C04795E8()
{
  uint64_t v0;
  id v1;

  v0 = sub_1C0486BE4();
  __swift_allocate_value_buffer(v0, qword_1ED73CCE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED73CCE8);
  if (qword_1ED73B6D8 != -1)
    swift_once();
  v1 = (id)qword_1ED73AD20;
  return sub_1C0486BF0();
}

uint64_t sub_1C0479668()
{
  uint64_t result;

  sub_1C04796D0();
  result = sub_1C0487244();
  qword_1ED73AD20 = result;
  return result;
}

unint64_t sub_1C04796D0()
{
  unint64_t result;

  result = qword_1ED73B758;
  if (!qword_1ED73B758)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED73B758);
  }
  return result;
}

unint64_t sub_1C047970C()
{
  unint64_t result;

  result = qword_1ED73A798;
  if (!qword_1ED73A798)
  {
    result = MEMORY[0x1C3B9BEA0](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED73A798);
  }
  return result;
}

uint64_t String.jsonValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 3;
  return swift_bridgeObjectRetain();
}

void sub_1C047975C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_28_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A7A8);
  sub_1C0467EB0(&qword_1ED73A7B0, (uint64_t (*)(void))sub_1C04052F0, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
  OUTLINED_FUNCTION_19_16();
  if (!v0)
  {
    OUTLINED_FUNCTION_14_19();
    OUTLINED_FUNCTION_13_19();
    if (v2)
    {
      OUTLINED_FUNCTION_0_23();
    }
    else
    {
      if (qword_1ED73AAD0 != -1)
        swift_once();
      v3 = OUTLINED_FUNCTION_12_0();
      __swift_project_value_buffer(v3, (uint64_t)qword_1ED73CCE8);
      OUTLINED_FUNCTION_67();
      v4 = OUTLINED_FUNCTION_96();
      if (OUTLINED_FUNCTION_34_3(v4))
      {
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_30_4();
        v5 = OUTLINED_FUNCTION_10_19(4.8754e-34);
        OUTLINED_FUNCTION_35_8(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriRemembers/SiriRemembers/SiriRemembers/Utils.swift");
        OUTLINED_FUNCTION_1_28();
        OUTLINED_FUNCTION_61_1();
        OUTLINED_FUNCTION_21_13((uint64_t)"toJSONString(encoder:)");
        OUTLINED_FUNCTION_1_28();
        OUTLINED_FUNCTION_6_20();
        OUTLINED_FUNCTION_8_16(&dword_1C03F3000, v6, v7, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld");
        OUTLINED_FUNCTION_14_15();
        OUTLINED_FUNCTION_0_0();
      }

      sub_1C0414AA0();
      OUTLINED_FUNCTION_175_0();
      OUTLINED_FUNCTION_27_14();
      OUTLINED_FUNCTION_0_23();
    }
  }
  OUTLINED_FUNCTION_23_15();
  OUTLINED_FUNCTION_1_2();
}

void sub_1C04798FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_28_11();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601180);
  sub_1C047B220(&qword_1EF601188, (uint64_t (*)(void))sub_1C04052F0, MEMORY[0x1E0DEAF10]);
  OUTLINED_FUNCTION_19_16();
  if (!v0)
  {
    OUTLINED_FUNCTION_14_19();
    OUTLINED_FUNCTION_13_19();
    if (v2)
    {
      OUTLINED_FUNCTION_0_23();
    }
    else
    {
      if (qword_1ED73AAD0 != -1)
        swift_once();
      v3 = OUTLINED_FUNCTION_12_0();
      __swift_project_value_buffer(v3, (uint64_t)qword_1ED73CCE8);
      OUTLINED_FUNCTION_67();
      v4 = OUTLINED_FUNCTION_96();
      if (OUTLINED_FUNCTION_34_3(v4))
      {
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_30_4();
        v5 = OUTLINED_FUNCTION_10_19(4.8754e-34);
        OUTLINED_FUNCTION_35_8(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriRemembers/SiriRemembers/SiriRemembers/Utils.swift");
        OUTLINED_FUNCTION_1_28();
        OUTLINED_FUNCTION_61_1();
        OUTLINED_FUNCTION_21_13((uint64_t)"toJSONString(encoder:)");
        OUTLINED_FUNCTION_1_28();
        OUTLINED_FUNCTION_6_20();
        OUTLINED_FUNCTION_8_16(&dword_1C03F3000, v6, v7, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld");
        OUTLINED_FUNCTION_14_15();
        OUTLINED_FUNCTION_0_0();
      }

      sub_1C0414AA0();
      OUTLINED_FUNCTION_175_0();
      OUTLINED_FUNCTION_27_14();
      OUTLINED_FUNCTION_0_23();
    }
  }
  OUTLINED_FUNCTION_23_15();
  OUTLINED_FUNCTION_1_2();
}

void sub_1C0479A94(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19[3];
  char v20;

  sub_1C0486D88();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = a2;
  v19[2] = a3;
  v20 = a4;
  sub_1C04052F0();
  sub_1C0485D08();
  if (!v4)
  {
    OUTLINED_FUNCTION_14_19();
    OUTLINED_FUNCTION_13_19();
    if (v11)
    {
      OUTLINED_FUNCTION_0_23();
    }
    else
    {
      if (qword_1ED73AAD0 != -1)
        swift_once();
      v12 = OUTLINED_FUNCTION_12_0();
      __swift_project_value_buffer(v12, (uint64_t)qword_1ED73CCE8);
      OUTLINED_FUNCTION_67();
      v13 = OUTLINED_FUNCTION_96();
      if (OUTLINED_FUNCTION_34_3(v13))
      {
        OUTLINED_FUNCTION_2();
        v19[0] = OUTLINED_FUNCTION_30_4();
        v14 = OUTLINED_FUNCTION_10_19(4.8754e-34);
        v18 = sub_1C0414ADC(v14, 0x80000001C0491BC0, v19);
        OUTLINED_FUNCTION_1_28();
        OUTLINED_FUNCTION_61_1();
        v18 = sub_1C0414ADC(0xD000000000000016, 0x80000001C0491C20, v19);
        OUTLINED_FUNCTION_1_28();
        *((_WORD *)v10 + 11) = 2050;
        v18 = 40;
        sub_1C048725C();
        OUTLINED_FUNCTION_8_16(&dword_1C03F3000, v15, v16, "unwrapped nil. file=%{public}s function=%{public}s line=%{public}ld");
        OUTLINED_FUNCTION_14_15();
        OUTLINED_FUNCTION_0_0();
      }

      sub_1C0414AA0();
      OUTLINED_FUNCTION_175_0();
      OUTLINED_FUNCTION_27_14();
      OUTLINED_FUNCTION_0_23();
    }
  }
  OUTLINED_FUNCTION_23_15();
  OUTLINED_FUNCTION_1_2();
}

void JSONValue.BOOLValue.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1C0479CBC()
{
  unsigned __int8 v1;

  if (swift_dynamicCast())
    return v1;
  else
    return 2;
}

uint64_t JSONValue.intValue.getter()
{
  _BYTE *v0;

  if (v0[16] == 1)
    return *(_QWORD *)v0;
  else
    return 0;
}

uint64_t JSONValue.doubleValue.getter()
{
  _BYTE *v0;

  if (v0[16] == 2)
    return *(_QWORD *)v0;
  else
    return 0;
}

uint64_t JSONValue.stringValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (*((_BYTE *)v0 + 16) != 3)
    return 0;
  v1 = *v0;
  OUTLINED_FUNCTION_9();
  return v1;
}

uint64_t JSONValue.arrayValue.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16) == 4)
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t JSONValue.objectValue.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16) == 5)
    return swift_bridgeObjectRetain();
  else
    return 0;
}

void JSONValue.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1C0479E70()
{
  char v0;

  if ((v0 & 1) != 0)
    return 1702195828;
  else
    return 0x65736C6166;
}

uint64_t JSONValue.jsonValue.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *a1 = *(_QWORD *)v1;
  a1[1] = v3;
  return OUTLINED_FUNCTION_25_17(v2, v3, *(_BYTE *)(v1 + 16), (uint64_t)a1);
}

uint64_t Array<A>.jsonValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[8];

  v10[7] = a1;
  v10[4] = a2;
  v10[5] = a3;
  v10[2] = a3;
  v10[3] = swift_getKeyPath();
  v5 = sub_1C0486FD4();
  v6 = MEMORY[0x1C3B9BEA0](MEMORY[0x1E0DEAF50], v5);
  v8 = sub_1C03FBC58((void (*)(uint64_t, uint64_t))sub_1C03FC26C, (uint64_t)v10, v5, (uint64_t)&type metadata for JSONValue, MEMORY[0x1E0DEDCE8], v6, MEMORY[0x1E0DEDD18], v7);
  result = swift_release();
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 4;
  return result;
}

void Int.jsonValue.getter(_QWORD *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  a1[1] = 0;
  OUTLINED_FUNCTION_48_7((uint64_t)a1);
}

void JSONValue.subscript.getter(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (v2[16] == 4)
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(*(_QWORD *)v2 + 16) > a1)
    {
      v3 = *(_QWORD *)v2 + 24 * a1;
      v4 = *(_QWORD *)(v3 + 32);
      v5 = *(_QWORD *)(v3 + 40);
      *a2 = v4;
      a2[1] = v5;
      OUTLINED_FUNCTION_25_17(v4, v5, *(_BYTE *)(v3 + 48), (uint64_t)a2);
      return;
    }
    __break(1u);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    OUTLINED_FUNCTION_48_7((uint64_t)a2);
  }
}

void JSONValue.subscript.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (*((_BYTE *)v1 + 16) == 5)
  {
    v3 = *v1;
    if (*(_QWORD *)(v3 + 16))
    {
      swift_bridgeObjectRetain();
      v4 = sub_1C04386E0();
      if ((v5 & 1) != 0)
      {
        v6 = *(_QWORD *)(v3 + 56) + 24 * v4;
        v7 = *(_QWORD *)v6;
        v8 = *(_QWORD *)(v6 + 8);
        *(_QWORD *)a1 = *(_QWORD *)v6;
        *(_QWORD *)(a1 + 8) = v8;
        v9 = *(_BYTE *)(v6 + 16);
        *(_BYTE *)(a1 + 16) = v9;
        sub_1C040722C(v7, v8, v9);
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
    }
  }
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = -1;
  OUTLINED_FUNCTION_24_1();
}

void JSONValue.rawValue.getter()
{
  __asm { BR              X10 }
}

void sub_1C047A1A4()
{
  uint64_t v0;
  char v1;

  *(_QWORD *)(v0 + 24) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)v0 = v1 & 1;
  OUTLINED_FUNCTION_24_1();
}

uint64_t sub_1C047A1E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  v0[3] = MEMORY[0x1E0DEA968];
  *v0 = v2;
  v0[1] = v3;
  return swift_bridgeObjectRetain();
}

void sub_1C047A22C()
{
  __asm { BR              X10 }
}

uint64_t sub_1C047A278()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_17();
  sub_1C0486E48();
  swift_bridgeObjectRelease();
  sub_1C0486E48();
  return v0;
}

void sub_1C047A574()
{
  __asm { BR              X10 }
}

void sub_1C047A5B8()
{
  int8x16_t *v0;
  char v1;
  int32x2_t v2;
  int64x2_t v3;

  v2 = vdup_n_s32((v1 & 1) == 0);
  v3.i64[0] = v2.u32[0];
  v3.i64[1] = v2.u32[1];
  *v0 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v3, 0x3FuLL)), (int8x16_t)xmmword_1C048ECC0, (int8x16_t)xmmword_1C048ECB0);
  v0[1].i64[0] = 0;
  v0[1].i64[1] = 0;
  v0[2].i8[0] = 2;
}

void static JSONValue.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1C047AA68()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (v4)
  {
    sub_1C040722C(v0, v1, v4);
    v10 = OUTLINED_FUNCTION_103_0();
    v12 = OUTLINED_FUNCTION_3_19(v10, v11, v3);
    sub_1C03F7074(v12, v13, v4);
    v9 = 0;
  }
  else
  {
    v5 = OUTLINED_FUNCTION_103_0();
    v7 = OUTLINED_FUNCTION_3_19(v5, v6, 0);
    sub_1C03F7074(v7, v8, 0);
    v9 = ((v2 & 1) == 0) ^ v0;
  }
  return v9 & 1;
}

void JSONValue.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C048767C();
  __asm { BR              X9 }
}

uint64_t sub_1C047ACB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_5_21(a1, a2, a3, a4, a5, a6, a7, a8, v10, v11, v12, v13, v14);
  v8 = sub_1C0487598();
  return OUTLINED_FUNCTION_49_6(v8);
}

void sub_1C047AE24(_QWORD *a1)
{
  JSONValue.encode(to:)(a1);
}

uint64_t JSONValue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_42_6();
  sub_1C0487664();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    OUTLINED_FUNCTION_42_6();
    v5 = sub_1C0487550();
    v7 = v6;
    OUTLINED_FUNCTION_49_6(v5);
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = 3;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1C047B0C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return JSONValue.init(from:)(a1, a2);
}

uint64_t Bool.jsonValue.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result & 1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_1C047B0F0@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return Bool.jsonValue.getter(*v1, a1);
}

void sub_1C047B0F8(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  Int.jsonValue.getter(a1, *v1);
}

void Double.jsonValue.getter(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  OUTLINED_FUNCTION_48_7(a1);
}

void sub_1C047B110(uint64_t a1@<X8>)
{
  double *v1;

  Double.jsonValue.getter(a1, *v1);
}

uint64_t sub_1C047B118@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return String.jsonValue.getter(*v1, v1[1], a1);
}

uint64_t Substring.jsonValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MEMORY[0x1C3B9B0CC]();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 3;
  return result;
}

uint64_t sub_1C047B14C@<X0>(uint64_t a1@<X8>)
{
  return Substring.jsonValue.getter(a1);
}

double sub_1C047B158@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  char v4;
  double result;
  __int128 v6;
  char v7;

  (*(void (**)(__int128 *__return_ptr, _QWORD))(*(_QWORD *)(a2 + a1 - 8) + 8))(&v6, *(_QWORD *)(a2 + a1 - 16));
  v4 = v7;
  result = *(double *)&v6;
  *(_OWORD *)a3 = v6;
  *(_BYTE *)(a3 + 16) = v4;
  return result;
}

uint64_t sub_1C047B1AC()
{
  return 16;
}

__n128 sub_1C047B1B8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1C047B1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  return Array<A>.jsonValue.getter(*v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a2 - 8), a3);
}

uint64_t Dictionary<>.jsonValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_1C047B288(a1);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 5;
  return result;
}

uint64_t sub_1C047B218@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return Dictionary<>.jsonValue.getter(*v1, a1);
}

uint64_t sub_1C047B220(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF601180);
    v8 = a2();
    result = MEMORY[0x1C3B9BEA0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C047B288(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  char v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739B58);
  result = sub_1C04873E8();
  v3 = (_QWORD *)result;
  v4 = 0;
  v37 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v29 = v6;
  v30 = (unint64_t)(v8 + 63) >> 6;
  v31 = result + 64;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v37 + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    sub_1C04238AC(*(_QWORD *)(v37 + 56) + 40 * i, (uint64_t)v34);
    v19 = v35;
    v20 = v36;
    __swift_project_boxed_opaque_existential_1(v34, v35);
    v21 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v20 + 8);
    swift_bridgeObjectRetain();
    v21(v32, v19, v20);
    v22 = v32[0];
    v23 = v32[1];
    LOBYTE(v20) = v33;
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    *(_QWORD *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v24 = (_QWORD *)(v3[6] + 16 * i);
    *v24 = v18;
    v24[1] = v17;
    v25 = v3[7] + 24 * i;
    *(_QWORD *)v25 = v22;
    *(_QWORD *)(v25 + 8) = v23;
    *(_BYTE *)(v25 + 16) = v20;
    v26 = v3[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v28;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v13 >= v30)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v29 + 8 * v13);
    ++v4;
    if (!v14)
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v30)
        return (uint64_t)v3;
      v14 = *(_QWORD *)(v29 + 8 * v4);
      if (!v14)
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v30)
          return (uint64_t)v3;
        v14 = *(_QWORD *)(v29 + 8 * v4);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v10 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v30)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v29 + 8 * v15);
  if (v14)
  {
    v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v30)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v29 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t destroy for JSONValue(uint64_t a1)
{
  return sub_1C03F7074(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s13SiriRemembers9JSONValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C040722C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for JSONValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C040722C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1C03F7074(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for JSONValue(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1C03F7074(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSONValue(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 5)
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

uint64_t storeEnumTagSinglePayload for JSONValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1C047B644(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1C047B64C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for JSONValue()
{
  return &type metadata for JSONValue;
}

uint64_t dispatch thunk of JSONValueConvertible.jsonValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1C047B66C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C044848C();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_1C047B6D4(v5);
  *a1 = v2;
}

void sub_1C047B6D4(uint64_t *a1)
{
  uint64_t v1;
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  int64_t v104;
  char v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;

  v3 = a1[1];
  v4 = sub_1C0487514();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_1C047BD6C(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  v138 = sub_1C042343C(v3 / 2);
  v139 = v3;
  v141 = v11;
  v136 = a1;
  if (v3 <= 0)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    v53 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_110:
    v117 = v14;
    if (v53 < 2)
    {
LABEL_121:
      v126 = swift_bridgeObjectRelease();
      if (v139 >= -1)
      {
        OUTLINED_FUNCTION_162_1(v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, (uint64_t)v136, v137, v138);
        return;
      }
      goto LABEL_149;
    }
    v118 = *v136;
    while (1)
    {
      v119 = v53 - 2;
      if (v53 < 2)
        break;
      if (!v118)
        goto LABEL_153;
      v120 = v117;
      v121 = *(_QWORD *)(v117 + 32 + 16 * v119);
      v122 = *(_QWORD *)(v117 + 32 + 16 * (v53 - 1) + 8);
      OUTLINED_FUNCTION_44_7((char *)(v118 + 40 * v121), (char *)(v118 + 40 * *(_QWORD *)(v117 + 32 + 16 * (v53 - 1))), v118 + 40 * v122, v6, v7, v8, v9, v10, v134, v135, (uint64_t)v136, v137, v138, v139, v140, v141);
      if (v1)
        goto LABEL_106;
      if (v122 < v121)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C0447D00(v120);
        v120 = v125;
      }
      if (v119 >= *(_QWORD *)(v120 + 16))
        goto LABEL_140;
      v123 = (_QWORD *)(v120 + 32 + 16 * v119);
      *v123 = v121;
      v123[1] = v122;
      v124 = *(_QWORD *)(v120 + 16);
      if (v53 > v124)
        goto LABEL_141;
      memmove((void *)(v120 + 32 + 16 * (v53 - 1)), (const void *)(v120 + 32 + 16 * v53), 16 * (v124 - v53));
      v117 = v120;
      *(_QWORD *)(v120 + 16) = v124 - 1;
      v53 = v124 - 1;
      if (v124 <= 2)
        goto LABEL_121;
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
  v137 = v5;
  v12 = 0;
  v13 = *a1;
  v134 = *a1 - 40;
  v135 = *a1 + 8;
  v14 = MEMORY[0x1E0DEE9D8];
  v140 = *a1;
  while (1)
  {
    v15 = v12++;
    if (v12 >= v3)
      goto LABEL_32;
    v16 = (uint64_t *)(v13 + 40 * v12);
    v17 = *v16;
    v18 = v16[1];
    v19 = (_QWORD *)(v13 + 40 * v15);
    if (v17 == *v19 && v18 == v19[1])
    {
      v22 = v15 + 2;
      if (v15 + 2 >= v139)
        goto LABEL_31;
      v21 = 0;
    }
    else
    {
      v21 = OUTLINED_FUNCTION_80_0();
      v22 = v15 + 2;
      if (v15 + 2 >= v139)
        goto LABEL_23;
    }
    v23 = (_QWORD *)(v135 + 40 * v22);
    do
    {
      v24 = (_QWORD *)(v13 + 40 * v12);
      if (*(v23 - 1) == *v24 && *v23 == v24[1])
      {
        if ((v21 & 1) != 0)
          goto LABEL_24;
      }
      else if (((v21 ^ OUTLINED_FUNCTION_80_0()) & 1) != 0)
      {
        goto LABEL_23;
      }
      v23 += 5;
      v26 = v22 + 1;
      v12 = v22;
      v22 = v26;
    }
    while (v26 < v139);
    v22 = v26;
LABEL_23:
    v12 = v22;
    if ((v21 & 1) != 0)
    {
LABEL_24:
      if (v22 < v15)
        goto LABEL_148;
      if (v15 < v22)
      {
        v27 = 40 * v22;
        v28 = 40 * v15;
        v29 = v22;
        v30 = v15;
        do
        {
          if (v30 != --v29)
          {
            if (!v13)
              goto LABEL_152;
            v31 = v13 + v28;
            v32 = v13 + v27;
            v33 = *(_QWORD *)(v13 + v28);
            v34 = *(_QWORD *)(v13 + v28 + 8);
            v35 = *(_BYTE *)(v13 + v28 + 32);
            v36 = *(_OWORD *)(v13 + v28 + 16);
            v37 = *(_QWORD *)(v13 + v27 - 8);
            v38 = *(_OWORD *)(v13 + v27 - 24);
            *(_OWORD *)v31 = *(_OWORD *)(v13 + v27 - 40);
            *(_OWORD *)(v31 + 16) = v38;
            *(_QWORD *)(v31 + 32) = v37;
            *(_QWORD *)(v32 - 40) = v33;
            *(_QWORD *)(v32 - 32) = v34;
            *(_OWORD *)(v32 - 24) = v36;
            *(_BYTE *)(v32 - 8) = v35;
          }
          ++v30;
          v27 -= 40;
          v28 += 40;
        }
        while (v30 < v29);
      }
LABEL_31:
      v12 = v22;
    }
LABEL_32:
    if (v12 < v139)
    {
      if (__OFSUB__(v12, v15))
        goto LABEL_143;
      if (v12 - v15 < v137)
      {
        if (__OFADD__(v15, v137))
          goto LABEL_146;
        if (v15 + v137 >= v139)
          v39 = v139;
        else
          v39 = v15 + v137;
        if (v39 < v15)
          goto LABEL_147;
        if (v12 != v39)
        {
          v40 = v134 + 40 * v12;
          do
          {
            v41 = v15;
            v42 = v40;
            do
            {
              v43 = v42 + 40;
              v44 = *(_QWORD *)(v42 + 40) == *(_QWORD *)v42 && *(_QWORD *)(v42 + 48) == *(_QWORD *)(v42 + 8);
              if (v44 || (OUTLINED_FUNCTION_80_0() & 1) == 0)
                break;
              if (!v13)
                goto LABEL_150;
              v46 = *(_QWORD *)(v42 + 40);
              v45 = *(_QWORD *)(v42 + 48);
              v47 = *(_BYTE *)(v42 + 72);
              v48 = *(_OWORD *)(v42 + 56);
              v49 = *(_OWORD *)(v42 + 16);
              v50 = *(_QWORD *)(v42 + 32);
              *(_OWORD *)v43 = *(_OWORD *)v42;
              *(_OWORD *)(v42 + 56) = v49;
              *(_QWORD *)v42 = v46;
              *(_QWORD *)(v42 + 8) = v45;
              *(_OWORD *)(v42 + 16) = v48;
              *(_BYTE *)(v42 + 32) = v47;
              v42 -= 40;
              ++v41;
              *(_QWORD *)(v43 + 32) = v50;
            }
            while (v12 != v41);
            ++v12;
            v40 += 40;
          }
          while (v12 != v39);
          v12 = v39;
        }
      }
    }
    if (v12 < v15)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v103 = OUTLINED_FUNCTION_32_9();
      sub_1C0447C18(v103, v104, v105, v106);
      v14 = v107;
    }
    v52 = *(_QWORD *)(v14 + 16);
    v51 = *(_QWORD *)(v14 + 24);
    v53 = v52 + 1;
    if (v52 >= v51 >> 1)
    {
      sub_1C0447C18(v51 > 1, v52 + 1, 1, (char *)v14);
      v14 = v108;
    }
    *(_QWORD *)(v14 + 16) = v53;
    v54 = v14 + 32;
    v55 = (uint64_t *)(v14 + 32 + 16 * v52);
    *v55 = v15;
    v55[1] = v12;
    if (v52)
      break;
    v53 = 1;
    v13 = v140;
LABEL_101:
    v3 = v139;
    if (v12 >= v139)
      goto LABEL_110;
  }
  v13 = v140;
  while (1)
  {
    v56 = v53 - 1;
    if (v53 >= 4)
    {
      v61 = v54 + 16 * v53;
      v62 = *(_QWORD *)(v61 - 64);
      v63 = *(_QWORD *)(v61 - 56);
      v67 = __OFSUB__(v63, v62);
      v64 = v63 - v62;
      if (v67)
        goto LABEL_127;
      v66 = *(_QWORD *)(v61 - 48);
      v65 = *(_QWORD *)(v61 - 40);
      v67 = __OFSUB__(v65, v66);
      v59 = v65 - v66;
      v60 = v67;
      if (v67)
        goto LABEL_128;
      v68 = v53 - 2;
      v69 = (uint64_t *)(v54 + 16 * (v53 - 2));
      v71 = *v69;
      v70 = v69[1];
      v67 = __OFSUB__(v70, v71);
      v72 = v70 - v71;
      if (v67)
        goto LABEL_129;
      v67 = __OFADD__(v59, v72);
      v73 = v59 + v72;
      if (v67)
        goto LABEL_131;
      if (v73 >= v64)
      {
        v91 = (uint64_t *)(v54 + 16 * v56);
        v93 = *v91;
        v92 = v91[1];
        v67 = __OFSUB__(v92, v93);
        v94 = v92 - v93;
        if (v67)
          goto LABEL_137;
        v84 = v59 < v94;
        goto LABEL_90;
      }
    }
    else
    {
      if (v53 != 3)
      {
        v85 = *(_QWORD *)(v14 + 32);
        v86 = *(_QWORD *)(v14 + 40);
        v67 = __OFSUB__(v86, v85);
        v78 = v86 - v85;
        v79 = v67;
        goto LABEL_84;
      }
      v58 = *(_QWORD *)(v14 + 32);
      v57 = *(_QWORD *)(v14 + 40);
      v67 = __OFSUB__(v57, v58);
      v59 = v57 - v58;
      v60 = v67;
    }
    if ((v60 & 1) != 0)
      goto LABEL_130;
    v68 = v53 - 2;
    v74 = (uint64_t *)(v54 + 16 * (v53 - 2));
    v76 = *v74;
    v75 = v74[1];
    v77 = __OFSUB__(v75, v76);
    v78 = v75 - v76;
    v79 = v77;
    if (v77)
      goto LABEL_132;
    v80 = (uint64_t *)(v54 + 16 * v56);
    v82 = *v80;
    v81 = v80[1];
    v67 = __OFSUB__(v81, v82);
    v83 = v81 - v82;
    if (v67)
      goto LABEL_134;
    if (__OFADD__(v78, v83))
      goto LABEL_136;
    if (v78 + v83 >= v59)
    {
      v84 = v59 < v83;
LABEL_90:
      if (v84)
        v56 = v68;
      goto LABEL_92;
    }
LABEL_84:
    if ((v79 & 1) != 0)
      goto LABEL_133;
    v87 = (uint64_t *)(v54 + 16 * v56);
    v89 = *v87;
    v88 = v87[1];
    v67 = __OFSUB__(v88, v89);
    v90 = v88 - v89;
    if (v67)
      goto LABEL_135;
    if (v90 < v78)
      goto LABEL_101;
LABEL_92:
    v95 = v56 - 1;
    if (v56 - 1 >= v53)
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
    if (!v13)
      goto LABEL_151;
    v96 = v14;
    v97 = v13;
    v98 = (uint64_t *)(v54 + 16 * v95);
    v99 = *v98;
    v100 = (_QWORD *)(v54 + 16 * v56);
    v101 = v100[1];
    OUTLINED_FUNCTION_44_7((char *)(v97 + 40 * *v98), (char *)(v97 + 40 * *v100), v97 + 40 * v101, v6, v7, v8, v9, v10, v134, v135, (uint64_t)v136, v137, v138, v139, v140, v141);
    if (v1)
      break;
    if (v101 < v99)
      goto LABEL_124;
    if (v56 > *(_QWORD *)(v96 + 16))
      goto LABEL_125;
    *v98 = v99;
    *(_QWORD *)(v54 + 16 * v95 + 8) = v101;
    v102 = *(_QWORD *)(v96 + 16);
    if (v56 >= v102)
      goto LABEL_126;
    v14 = v96;
    v53 = v102 - 1;
    memmove((void *)(v54 + 16 * v56), v100 + 2, 16 * (v102 - 1 - v56));
    *(_QWORD *)(v96 + 16) = v102 - 1;
    v84 = v102 > 2;
    v13 = v140;
    if (!v84)
      goto LABEL_101;
  }
LABEL_106:
  v109 = swift_bridgeObjectRelease();
  if (v139 < -1)
    goto LABEL_145;
  OUTLINED_FUNCTION_162_1(v109, v110, v111, v112, v113, v114, v115, v116, v134, v135, (uint64_t)v136, v137, v138);
}

uint64_t sub_1C047BD6C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 40 * a3 - 40;
    while (2)
    {
      v9 = v6;
      v10 = v8;
      do
      {
        v11 = v10 + 40;
        result = *(_QWORD *)(v10 + 40);
        if (result == *(_QWORD *)v10 && *(_QWORD *)(v10 + 48) == *(_QWORD *)(v10 + 8))
          break;
        result = OUTLINED_FUNCTION_80_0();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        v14 = *(_QWORD *)(v10 + 40);
        v13 = *(_QWORD *)(v10 + 48);
        v15 = *(_BYTE *)(v10 + 72);
        v16 = *(_OWORD *)(v10 + 56);
        v17 = *(_OWORD *)(v10 + 16);
        v18 = *(_QWORD *)(v10 + 32);
        *(_OWORD *)v11 = *(_OWORD *)v10;
        *(_OWORD *)(v10 + 56) = v17;
        *(_QWORD *)v10 = v14;
        *(_QWORD *)(v10 + 8) = v13;
        *(_OWORD *)(v10 + 16) = v16;
        *(_BYTE *)(v10 + 32) = v15;
        v10 -= 40;
        ++v9;
        *(_QWORD *)(v11 + 32) = v18;
      }
      while (v4 != v9);
      ++v4;
      v8 += 40;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_1C047BE4C(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  unint64_t v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  if (v9 >= v11)
  {
    sub_1C047E890(a2, (uint64_t)(a3 - (_QWORD)a2) / 40, a4);
    v12 = &v4[40 * v11];
    if (v7 >= v6 || v10 < 40)
      goto LABEL_43;
    v18 = a3 - 40;
    while (1)
    {
      v19 = (char *)(v18 + 40);
      v20 = v12 - 40;
      v21 = *((_QWORD *)v12 - 5) == *((_QWORD *)v6 - 5) && *((_QWORD *)v12 - 4) == *((_QWORD *)v6 - 4);
      if (v21 || (OUTLINED_FUNCTION_80_0() & 1) == 0)
      {
        v23 = v19 != v12 || v18 >= (unint64_t)v12;
        v12 -= 40;
        if (!v23)
          goto LABEL_39;
      }
      else
      {
        v22 = v19 != v6 || v18 >= (unint64_t)v6;
        v20 = v6 - 40;
        v6 -= 40;
        if (!v22)
          goto LABEL_39;
      }
      v24 = *(_OWORD *)v20;
      v25 = *((_OWORD *)v20 + 1);
      *(_QWORD *)(v18 + 32) = *((_QWORD *)v20 + 4);
      *(_OWORD *)v18 = v24;
      *(_OWORD *)(v18 + 16) = v25;
LABEL_39:
      v18 -= 40;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_43;
    }
  }
  sub_1C047E890(a1, (a2 - a1) / 40, a4);
  v12 = &v4[40 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 40)
  {
    while (1)
    {
      v13 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v13 && (OUTLINED_FUNCTION_80_0() & 1) != 0)
        break;
      v14 = v4;
      v13 = v7 == v4;
      v4 += 40;
      if (!v13)
        goto LABEL_13;
LABEL_14:
      v7 += 40;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v14 = v6;
    v13 = v7 == v6;
    v6 += 40;
    if (v13)
      goto LABEL_14;
LABEL_13:
    v15 = *(_OWORD *)v14;
    v16 = *((_OWORD *)v14 + 1);
    *((_QWORD *)v7 + 4) = *((_QWORD *)v14 + 4);
    *(_OWORD *)v7 = v15;
    *((_OWORD *)v7 + 1) = v16;
    goto LABEL_14;
  }
LABEL_19:
  v6 = v7;
LABEL_43:
  sub_1C047E890(v4, (v12 - v4) / 40, v6);
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C04071E8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_19(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1C03F7074(a1, a2, a3);
  return v3;
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  return sub_1C0486E48();
}

uint64_t OUTLINED_FUNCTION_5_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&a10, a13);
}

uint64_t OUTLINED_FUNCTION_6_20()
{
  uint64_t v0;
  uint64_t v1;

  *(_WORD *)(v0 + 22) = 2050;
  *(_QWORD *)(v1 - 88) = 40;
  return sub_1C048725C();
}

uint64_t OUTLINED_FUNCTION_9_25()
{
  return sub_1C0487580();
}

unint64_t OUTLINED_FUNCTION_10_19(float a1)
{
  float *v1;

  *v1 = a1;
  return 0xD00000000000005BLL;
}

uint64_t OUTLINED_FUNCTION_11_17(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_13_19()
{
  return sub_1C0486D70();
}

uint64_t OUTLINED_FUNCTION_14_19()
{
  return sub_1C0486D7C();
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_1C040722C(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_19_16()
{
  return sub_1C0485D08();
}

uint64_t OUTLINED_FUNCTION_21_13@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1C0414ADC(0xD000000000000016, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 80));
}

uint64_t OUTLINED_FUNCTION_23_15()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_24_13()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_25_17@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_BYTE *)(a4 + 16) = a3;
  return sub_1C040722C(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_27_14()
{
  return swift_willThrow();
}

void OUTLINED_FUNCTION_28_11()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
}

uint64_t OUTLINED_FUNCTION_29_8()
{
  return sub_1C0486D88();
}

uint64_t OUTLINED_FUNCTION_32_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_35_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1C0414ADC(a1, (a2 - 32) | 0x8000000000000000, (uint64_t *)(v2 - 80));
}

uint64_t OUTLINED_FUNCTION_37_8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_1C03F7074(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_42_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44_7(char *a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
  return sub_1C047BE4C(a1, a2, a3, a16);
}

_QWORD *OUTLINED_FUNCTION_46_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_1C047A574((uint64_t *)va);
}

void OUTLINED_FUNCTION_48_7(uint64_t a1@<X8>)
{
  char v1;

  *(_BYTE *)(a1 + 16) = v1;
}

uint64_t OUTLINED_FUNCTION_49_6(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

char *sub_1C047C200(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  __int16 v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  int64_t v18;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v17 = result;
  v18 = a6 >> 1;
  v7 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v8 = v6;
  v9 = MEMORY[0x1E0DEE9D8];
  if (!v7)
    return (char *)v9;
  v23 = MEMORY[0x1E0DEE9D8];
  result = sub_1C047FB4C(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v9 = v23;
    while (1)
    {
      v12 = v11 + 1;
      if (__OFADD__(v11, 1))
        break;
      if (a5 + v11 >= v18 || v11 >= v7)
        goto LABEL_19;
      v21 = *(_BYTE *)(a4 + a5 + v11);
      result = (char *)((char *(*)(uint64_t *__return_ptr, char *, uint64_t *))v17)(&v22, &v21, &v20);
      if (v8)
      {
        swift_release();
        return (char *)v9;
      }
      v8 = 0;
      v14 = v22;
      v23 = v9;
      v16 = *(_QWORD *)(v9 + 16);
      v15 = *(_QWORD *)(v9 + 24);
      if (v16 >= v15 >> 1)
      {
        result = sub_1C047FB4C((char *)(v15 > 1), v16 + 1, 1);
        v9 = v23;
      }
      *(_QWORD *)(v9 + 16) = v16 + 1;
      *(_WORD *)(v9 + 2 * v16 + 32) = v14;
      ++v11;
      if (v12 == v7)
        return (char *)v9;
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_1C047C35C(uint64_t a1)
{
  sub_1C047C408(a1, (void (*)(uint64_t))sub_1C041D43C);
}

void sub_1C047C368()
{
  sub_1C047C3DC();
}

void sub_1C047C374()
{
  OUTLINED_FUNCTION_195_0();
  OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C3A0()
{
  sub_1C047C3DC();
}

void sub_1C047C3AC()
{
  OUTLINED_FUNCTION_195_0();
  OUTLINED_FUNCTION_18_15();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C3D0()
{
  sub_1C047C3DC();
}

void sub_1C047C3DC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_195_0();
  OUTLINED_FUNCTION_62_3(v0);
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C408(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_195_0();
  a2(a1);
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C450()
{
  OUTLINED_FUNCTION_195_0();
  OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C47C()
{
  sub_1C047CA20();
}

uint64_t sub_1C047C488()
{
  OUTLINED_FUNCTION_23_16();
  return OUTLINED_FUNCTION_5_22();
}

void sub_1C047C4E0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C047C524()
{
  OUTLINED_FUNCTION_23_16();
  return OUTLINED_FUNCTION_5_22();
}

void sub_1C047C594(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C047C5D8()
{
  OUTLINED_FUNCTION_23_16();
  return OUTLINED_FUNCTION_5_22();
}

void sub_1C047C618(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C047C658()
{
  OUTLINED_FUNCTION_23_16();
  return OUTLINED_FUNCTION_5_22();
}

void sub_1C047C744(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C047C778()
{
  OUTLINED_FUNCTION_23_16();
  return OUTLINED_FUNCTION_5_22();
}

void sub_1C047C7D4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C047C814()
{
  sub_1C0486DF4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C047C8BC()
{
  return sub_1C0486DF4();
}

void sub_1C047C8DC()
{
  sub_1C0487634();
  OUTLINED_FUNCTION_0();
}

void sub_1C047C8FC()
{
  OUTLINED_FUNCTION_34_10();
  OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C928()
{
  OUTLINED_FUNCTION_34_10();
  OUTLINED_FUNCTION_18_15();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C94C(uint64_t a1, uint64_t a2)
{
  sub_1C047C958(a1, a2, (void (*)(uint64_t))sub_1C041D43C);
}

void sub_1C047C958(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_34_10();
  a3(a2);
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C9A0()
{
  sub_1C047C9C8();
}

void sub_1C047C9B0()
{
  sub_1C047C9C8();
}

void sub_1C047C9BC()
{
  sub_1C047C9C8();
}

void sub_1C047C9C8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_34_10();
  OUTLINED_FUNCTION_62_3(v0);
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047C9F4()
{
  OUTLINED_FUNCTION_34_10();
  OUTLINED_FUNCTION_51_5();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void sub_1C047CA20()
{
  OUTLINED_FUNCTION_34_10();
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_271();
  OUTLINED_FUNCTION_45();
}

void HistoryStats.frequency.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = OUTLINED_FUNCTION_116();
  v2 = MEMORY[0x1E0DEE9D8];
  if (*(_QWORD *)(*(_QWORD *)(v0 + *(int *)(v1 + 20)) + 16))
  {
    OUTLINED_FUNCTION_58_3();
    OUTLINED_FUNCTION_39_8();
    v2 = v11;
    do
    {
      OUTLINED_FUNCTION_57_2();
      if (v4)
      {
        OUTLINED_FUNCTION_50_6(v3 > 1);
        v2 = v11;
      }
      OUTLINED_FUNCTION_36_7();
    }
    while (!v5);
    swift_bridgeObjectRelease();
  }
  v6 = *(_QWORD *)(v2 + 16);
  if (v6)
  {
    v7 = 0;
    v8 = (uint64_t *)(v2 + 32);
    while (1)
    {
      v9 = *v8++;
      v10 = __OFADD__(v7, v9);
      v7 += v9;
      if (v10)
        break;
      if (!--v6)
        goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_29_9();
  }
}

uint64_t type metadata accessor for HistoryStats()
{
  uint64_t result;

  result = qword_1ED73A080;
  if (!qword_1ED73A080)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C047CB88(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = MEMORY[0x1E0DEE9D8];
  sub_1C047FBA0();
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    v3 = 0;
    v4 = a1 + 32;
    v5 = &off_1E79BA000;
    while (v3 < (unint64_t)v5[450])
    {
      v6 = *(__int16 *)(v4 + 2 * v3);
      v7 = qword_1C048F288[*((char *)&unk_1E79BAE00 + v3 + 32)];
      v8 = *(_QWORD *)(v10 + 16);
      if (v8 >= *(_QWORD *)(v10 + 24) >> 1)
      {
        sub_1C047FBA0();
        v5 = &off_1E79BA000;
      }
      ++v3;
      *(_QWORD *)(v10 + 16) = v8 + 1;
      v9 = v10 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v7;
      *(_QWORD *)(v9 + 40) = v6;
      if (v2 == v3)
        goto LABEL_7;
    }
    __break(1u);
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
  }
}

void HistoryStats.init()(uint64_t a1@<X8>)
{
  uint64_t v2;

  sub_1C0486014();
  if (qword_1ED7398B8 != -1)
    swift_once();
  v2 = sub_1C047CDD0(0, qword_1ED73A158);
  *(_QWORD *)(a1 + *(int *)(OUTLINED_FUNCTION_116() + 20)) = v2;
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1C047CD24(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t HistoryStats.recency.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_53();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t HistoryStats.frequencies.getter()
{
  OUTLINED_FUNCTION_116();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C047CDD0(__int16 a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = sub_1C04873D0();
    __break(1u);
  }
  else if (a2)
  {
    result = sub_1C0486FBC();
    v5 = 0;
    *(_QWORD *)(result + 16) = a2;
    do
    {
      v6 = result + 2 * v5++;
      *(_WORD *)(v6 + 32) = a1;
    }
    while (a2 != v5);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

void HistoryStats.init(recency:frequencies:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_53();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  *(_QWORD *)(a3 + *(int *)(OUTLINED_FUNCTION_116() + 20)) = a2;
  OUTLINED_FUNCTION_24_1();
}

void HistoryStats.insert(date:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  void (*v12)(_BYTE *, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _BYTE v19[15];
  unsigned __int8 v20;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_53();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v19[-v9];
  sub_1C048057C((unint64_t *)&qword_1ED739D10, MEMORY[0x1E0CB08B0]);
  v11 = sub_1C0486D40();
  v12 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  if ((v11 & 1) != 0)
    v13 = a1;
  else
    v13 = v2;
  v12(v10, v13, v4);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v5 + 40))(v2, v10, v4);
  v12(v8, a1, v4);
  sub_1C047D020((uint64_t)v8, (char *)&v20);
  v14 = v20;
  v15 = *(int *)(OUTLINED_FUNCTION_116() + 20);
  v16 = *(_QWORD *)(v2 + v15);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C048052C();
    v16 = v18;
  }
  if (*(_QWORD *)(v16 + 16) <= v14)
  {
    __break(1u);
  }
  else
  {
    v17 = *(__int16 *)(v16 + 32 + 2 * v14) + 1;
    if ((__int16)(*(_WORD *)(v16 + 32 + 2 * v14) + 1) == v17)
    {
      *(_WORD *)(v16 + 32 + 2 * v14) = v17;
      *(_QWORD *)(v2 + v15) = v16;
      return;
    }
  }
  __break(1u);
}

uint64_t sub_1C047D020@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  double v4;
  double v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  char v9;

  sub_1C048605C();
  v5 = v4;
  v6 = OUTLINED_FUNCTION_53();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = -(uint64_t)v5;
  if (__OFSUB__(0, (uint64_t)v5))
  {
LABEL_24:
    __break(1u);
    return result;
  }
  if ((uint64_t)v8 < 121)
  {
    v9 = 0;
  }
  else if (v8 < 0x259)
  {
    v9 = 1;
  }
  else if (v8 < 0xE11)
  {
    v9 = 2;
  }
  else if (v8 < 0x5461)
  {
    v9 = 3;
  }
  else if (v8 < 0x15181)
  {
    v9 = 4;
  }
  else if (v8 < 0x93A81)
  {
    v9 = 5;
  }
  else if (v8 <= 0x24EA00)
  {
    v9 = 6;
  }
  else
  {
    v9 = 7;
  }
  *a2 = v9;
  return result;
}

uint64_t IntervalBucket.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void HistoryStats.subscript.getter(unsigned __int8 *a1)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *a1;
  if (*(_QWORD *)(*(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_116() + 20)) + 16) <= v2)
    __break(1u);
  else
    OUTLINED_FUNCTION_0();
}

uint64_t sub_1C047D184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  qword_1EF601198 = sub_1C047CD24(1, (uint64_t)&unk_1E79BB3D8);
  unk_1EF6011A0 = v0;
  qword_1EF6011A8 = v1;
  unk_1EF6011B0 = v2;
  return swift_bridgeObjectRelease();
}

void *sub_1C047D1C4()
{
  return &unk_1E79BB3D8;
}

uint64_t sub_1C047D1D0()
{
  unint64_t v0;

  v0 = sub_1C0487400();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_1C047D21C()
{
  return 9;
}

uint64_t sub_1C047D224(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C047D258 + 4 * byte_1C048ECF3[a1]))(0x79636E65636572, 0xE700000000000000);
}

uint64_t sub_1C047D258()
{
  return 7156326;
}

uint64_t sub_1C047D268()
{
  return 1831874918;
}

uint64_t sub_1C047D278()
{
  return 1919431014;
}

uint64_t sub_1C047D288()
{
  return 1919432294;
}

uint64_t sub_1C047D29C()
{
  return 0x7961643166;
}

uint64_t sub_1C047D2B0()
{
  return 0x7961643766;
}

uint64_t sub_1C047D2C8()
{
  return 0x796164383266;
}

uint64_t sub_1C047D2DC()
{
  return 1718511974;
}

uint64_t sub_1C047D2EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C047D320 + 4 * byte_1C048ECFC[a1]))(0x79636E65636572, 0xE700000000000000);
}

uint64_t sub_1C047D320()
{
  return 7156326;
}

uint64_t sub_1C047D330()
{
  return 1831874918;
}

uint64_t sub_1C047D340()
{
  return 1919431014;
}

uint64_t sub_1C047D350()
{
  return 1919432294;
}

uint64_t sub_1C047D364()
{
  return 0x7961643166;
}

uint64_t sub_1C047D378()
{
  return 0x7961643766;
}

uint64_t sub_1C047D390()
{
  return 0x796164383266;
}

uint64_t sub_1C047D3A4()
{
  return 1718511974;
}

void sub_1C047D3B4(char *a1)
{
  sub_1C0402D20(*a1);
}

void sub_1C047D3C0()
{
  unsigned __int8 *v0;

  sub_1C047C408(*v0, (void (*)(uint64_t))sub_1C047D224);
}

void sub_1C047D3E0(uint64_t a1)
{
  char *v1;

  sub_1C047C7D4(a1, *v1);
}

void sub_1C047D3E8(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_1C047C958(a1, *v1, (void (*)(uint64_t))sub_1C047D224);
}

uint64_t sub_1C047D408@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C047D1D0();
  *a1 = result;
  return result;
}

void sub_1C047D434(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_1C047D224(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1C047D458()
{
  unsigned __int8 *v0;

  return sub_1C047D2EC(*v0);
}

uint64_t sub_1C047D460@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C047D218();
  *a1 = result;
  return result;
}

uint64_t sub_1C047D484@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C047D21C();
  *a1 = result;
  return result;
}

void *sub_1C047D4A8@<X0>(_QWORD *a1@<X8>)
{
  void *result;

  result = sub_1C047D1C4();
  *a1 = result;
  return result;
}

uint64_t sub_1C047D4CC()
{
  sub_1C0480540();
  return sub_1C0487694();
}

uint64_t sub_1C047D4F4()
{
  sub_1C0480540();
  return sub_1C04876A0();
}

void HistoryStats.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  int64_t v14;

  OUTLINED_FUNCTION_4_5();
  v3 = v0;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011B8);
  OUTLINED_FUNCTION_12();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_214();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1C0480540();
  sub_1C0487688();
  sub_1C04860B0();
  sub_1C048057C(&qword_1ED739D08, MEMORY[0x1E0CB0890]);
  OUTLINED_FUNCTION_35_3();
  if (v1)
  {
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  }
  else
  {
    if (qword_1EF5FF9B0 != -1)
      goto LABEL_24;
    while (1)
    {
      v13 = v2;
      v9 = qword_1EF6011A8;
      v8 = unk_1EF6011B0;
      v3 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for HistoryStats() + 20));
      if (v9 == v8 >> 1)
        break;
      v14 = v8 >> 1;
      if (v9 >= (uint64_t)(v8 >> 1))
      {
        __break(1u);
        return;
      }
      v10 = *(_QWORD *)(v3 + 16);
      if (!v10)
        break;
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_106();
      v11 = 0;
      v2 = v9 + 1;
      while (v11 < v10)
      {
        if (*(_WORD *)(v3 + 2 * v11 + 32))
          sub_1C04874F0();
        if (~v9 + v14 == v11)
          goto LABEL_20;
        if ((uint64_t)(v2 + v11) < v9 || (uint64_t)(v2 + v11) >= v14)
          goto LABEL_23;
        v10 = *(_QWORD *)(v3 + 16);
        if (++v11 == v10)
          goto LABEL_20;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_once();
    }
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_106();
LABEL_20:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
  }
  OUTLINED_FUNCTION_55_4(v7);
  OUTLINED_FUNCTION_34_0();
}

void HistoryStats.init(from:)()
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_4_5();
  v27 = v0;
  v3 = v2;
  v23 = v4;
  v26 = sub_1C04860B0();
  v24 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_7();
  v25 = (uint64_t *)(v6 - v5);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011C8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_16_2();
  v9 = type metadata accessor for HistoryStats();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_7();
  v12 = v11 - v10;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1C0480540();
  sub_1C0487670();
  if (v0)
  {
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    v21 = v9;
    v22 = v12;
    v27 = v8;
    sub_1C048057C(&qword_1ED739D18, MEMORY[0x1E0CB08C0]);
    sub_1C048746C();
    v13 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(v24 + 32))(v22, v25, v26);
    if (qword_1EF5FF9B0 != -1)
      v13 = swift_once();
    v25 = &v20;
    v14 = qword_1EF601198;
    v15 = unk_1EF6011A0;
    v17 = qword_1EF6011A8;
    v16 = unk_1EF6011B0;
    MEMORY[0x1E0C80A78](v13);
    *(&v20 - 2) = v1;
    swift_unknownObjectRetain();
    v18 = sub_1C047C200((char *)sub_1C04805B8, (uint64_t)(&v20 - 4), v14, v15, v17, v16);
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_17_14();
    v19 = v22;
    *(_QWORD *)(v22 + *(int *)(v21 + 20)) = v18;
    sub_1C04805D4(v19, v23);
    OUTLINED_FUNCTION_25_0();
    sub_1C0480618(v19);
  }
  OUTLINED_FUNCTION_34_0();
}

uint64_t sub_1C047D9B8@<X0>(_QWORD *a1@<X2>, _WORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011C8);
  result = sub_1C0487430();
  if (v2)
  {
    *a1 = v2;
  }
  else if ((result & 0x10000) != 0)
  {
    *a2 = 0;
  }
  else
  {
    *a2 = result;
  }
  return result;
}

void HistoryStats.privatized.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = OUTLINED_FUNCTION_116();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_7();
  v6 = v5 - v4;
  sub_1C04805D4(v1, v5 - v4);
  sub_1C047DA94(v6, a1);
  OUTLINED_FUNCTION_24_1();
}

void sub_1C047DA94(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  __int16 v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v4 = OUTLINED_FUNCTION_53();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_7();
  v7 = v6 - v5;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v6 - v5, a1);
  sub_1C047D020(v7, &v25);
  v9 = v25;
  v10 = *(_QWORD *)(a1 + *(int *)(OUTLINED_FUNCTION_116() + 20));
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
  {
    swift_bridgeObjectRetain();
    v12 = MEMORY[0x1E0DEE9D8];
LABEL_14:
    sub_1C0480618(a1);
    swift_bridgeObjectRelease();
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v12;
    return;
  }
  v23 = a2;
  v24 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_1C047FB84(0, v11, 0);
  v12 = v24;
  v13 = (unsigned __int16 *)(v10 + 32);
  while (1)
  {
    v15 = *v13++;
    v14 = v15;
    if (!v15)
    {
      v20 = 0;
      goto LABEL_9;
    }
    v16 = (double)v14;
    v17 = log10(fabs(v16));
    v18 = __exp10(round(v17) + -1.0);
    v19 = v18 * round(v16 / v18);
    if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
      break;
    if (v19 <= -2147483650.0)
      goto LABEL_16;
    if (v19 >= 2147483650.0)
      goto LABEL_17;
    v20 = (int)v19;
LABEL_9:
    v22 = *(_QWORD *)(v24 + 16);
    v21 = *(_QWORD *)(v24 + 24);
    if (v22 >= v21 >> 1)
      sub_1C047FB84((char *)(v21 > 1), v22 + 1, 1);
    *(_QWORD *)(v24 + 16) = v22 + 1;
    *(_DWORD *)(v24 + 4 * v22 + 32) = v20;
    if (!--v11)
    {
      a2 = v23;
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

void *static IntervalBucket.allCases.getter()
{
  return &unk_1E79BAE00;
}

Swift::Double __swiftcall HistoryStats.computeDirichlet(bandwidth:)(Swift::Double bandwidth)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  OUTLINED_FUNCTION_116();
  v2 = swift_bridgeObjectRetain();
  sub_1C047CB88(v2);
  v4 = v3;
  OUTLINED_FUNCTION_24_0();
  v5 = static PriorDistributionUtils.computeDirichlet(frequencies:bandwidth:)(v4, bandwidth);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t static HistoryStats.computeNormalizedDirichlet(stats:bandwidth:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v5 = OUTLINED_FUNCTION_116();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_214();
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x1E0DEE9D8];
  if (v7)
  {
    v19 = MEMORY[0x1E0DEE9D8];
    sub_1C047FB68(0, v7, 0);
    v9 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v10 = *(_QWORD *)(v6 + 72);
    v8 = v19;
    do
    {
      sub_1C04805D4(v9, v2);
      v11 = OUTLINED_FUNCTION_106();
      sub_1C047CB88(v11);
      v13 = v12;
      swift_bridgeObjectRelease();
      v14 = static PriorDistributionUtils.computeDirichlet(frequencies:bandwidth:)(v13, a2);
      swift_bridgeObjectRelease();
      sub_1C0480618(v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C047FB68(0, *(_QWORD *)(v8 + 16) + 1, 1);
        v8 = v19;
      }
      v16 = *(_QWORD *)(v8 + 16);
      v15 = *(_QWORD *)(v8 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_1C047FB68(v15 > 1, v16 + 1, 1);
        v8 = v19;
      }
      *(_QWORD *)(v8 + 16) = v16 + 1;
      *(double *)(v8 + 8 * v16 + 32) = v14;
      v9 += v10;
      --v7;
    }
    while (v7);
  }
  v17 = static PriorDistributionUtils.normalize(scores:)(v8);
  swift_bridgeObjectRelease();
  return v17;
}

BOOL static HistoryStats.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_1C0486080() & 1) == 0)
    return 0;
  v4 = *(int *)(OUTLINED_FUNCTION_116() + 20);
  return sub_1C0423378(*(_QWORD *)(a1 + v4), *(_QWORD *)(a2 + v4));
}

void sub_1C047DEDC()
{
  HistoryStats.init(from:)();
}

void sub_1C047DEF0()
{
  HistoryStats.encode(to:)();
}

void PrivatizedHistoryStats.recency.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t PrivatizedHistoryStats.frequencies.getter()
{
  return swift_bridgeObjectRetain();
}

void PrivatizedHistoryStats.frequency.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v1 = MEMORY[0x1E0DEE9D8];
  if (*(_QWORD *)(*(_QWORD *)(v0 + 8) + 16))
  {
    OUTLINED_FUNCTION_58_3();
    OUTLINED_FUNCTION_39_8();
    v1 = v10;
    do
    {
      OUTLINED_FUNCTION_57_2();
      if (v3)
      {
        OUTLINED_FUNCTION_50_6(v2 > 1);
        v1 = v10;
      }
      OUTLINED_FUNCTION_36_7();
    }
    while (!v4);
    swift_bridgeObjectRelease();
  }
  v5 = *(_QWORD *)(v1 + 16);
  if (v5)
  {
    v6 = 0;
    v7 = (uint64_t *)(v1 + 32);
    while (1)
    {
      v8 = *v7++;
      v9 = __OFADD__(v6, v8);
      v6 += v8;
      if (v9)
        break;
      if (!--v5)
        goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_29_9();
  }
}

unsigned __int8 *PrivatizedHistoryStats.subscript.getter(unsigned __int8 *result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = *(_QWORD *)(v1 + 8);
  if (*(_QWORD *)(v3 + 16) > v2)
    return (unsigned __int8 *)*(int *)(v3 + 4 * v2 + 32);
  __break(1u);
  return result;
}

BOOL static PrivatizedHistoryStats.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && sub_1C0423240(*((_QWORD *)a1 + 1), *((_QWORD *)a2 + 1));
}

uint64_t sub_1C047E020(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x79636E65636572 && a2 == 0xE700000000000000;
  if (v2 || (sub_1C0487544() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x636E657571657266 && a2 == 0xEB00000000736569)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1C0487544();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1C047E124(char a1)
{
  if ((a1 & 1) != 0)
    return 0x636E657571657266;
  else
    return 0x79636E65636572;
}

uint64_t sub_1C047E164()
{
  char *v0;

  return sub_1C047E124(*v0);
}

uint64_t sub_1C047E16C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C047E020(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C047E190()
{
  sub_1C0480654();
  return sub_1C0487694();
}

uint64_t sub_1C047E1B8()
{
  sub_1C0480654();
  return sub_1C04876A0();
}

void PrivatizedHistoryStats.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011D0);
  OUTLINED_FUNCTION_12();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_214();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1C0480654();
  sub_1C0487688();
  sub_1C0480690();
  OUTLINED_FUNCTION_35_3();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011E8);
    sub_1C0480708(&qword_1EF6011F0, MEMORY[0x1E0DEDBD0], MEMORY[0x1E0DEAF10]);
    OUTLINED_FUNCTION_35_3();
  }
  OUTLINED_FUNCTION_55_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_34_0();
}

void PrivatizedHistoryStats.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_4_5();
  v15 = v14;
  v17 = v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011F8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_16_2();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_1C0480654();
  sub_1C0487670();
  if (!v13)
  {
    sub_1C04806CC();
    OUTLINED_FUNCTION_60_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6011E8);
    sub_1C0480708(&qword_1EF601208, MEMORY[0x1E0DEDBF8], MEMORY[0x1E0DEAF40]);
    OUTLINED_FUNCTION_60_2();
    OUTLINED_FUNCTION_48_8();
    *(_BYTE *)v17 = a13;
    *(_QWORD *)(v17 + 8) = v19;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  OUTLINED_FUNCTION_34_0();
}

void sub_1C047E454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  PrivatizedHistoryStats.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_1C047E468()
{
  PrivatizedHistoryStats.encode(to:)();
}

void sub_1C047E480()
{
  swift_bridgeObjectRelease();
  qword_1ED73A158 = 8;
  OUTLINED_FUNCTION_0();
}

uint64_t static IntervalBucket.count.getter()
{
  if (qword_1ED7398B8 != -1)
    swift_once();
  return qword_1ED73A158;
}

uint64_t IntervalBucket.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C047E51C + 4 * byte_1C048ED05[*v0]))(0x6E694D3274736170, 0xE800000000000000);
}

uint64_t sub_1C047E51C()
{
  return 0x316F543274736170;
}

uint64_t sub_1C047E53C()
{
  return 0x694D303174736170;
}

uint64_t sub_1C047E560()
{
  return 0x5472483174736170;
}

uint64_t sub_1C047E5A0()
{
  return 0x376F543174736170;
}

uint64_t sub_1C047E5C0()
{
  return 0x326F543774736170;
}

uint64_t sub_1C047E5E0()
{
  return 0x6168547265646C6FLL;
}

SiriRemembers::IntervalBucket_optional __swiftcall IntervalBucket.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 8;
  if ((unint64_t)rawValue < 8)
    v2 = rawValue;
  *v1 = v2;
  return (SiriRemembers::IntervalBucket_optional)rawValue;
}

void sub_1C047E618()
{
  sub_1C047C450();
}

void sub_1C047E630()
{
  sub_1C047C9F4();
}

SiriRemembers::IntervalBucket_optional sub_1C047E648(Swift::Int *a1)
{
  return IntervalBucket.init(rawValue:)(*a1);
}

void sub_1C047E650(uint64_t *a1@<X8>)
{
  *a1 = IntervalBucket.rawValue.getter();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1C047E670()
{
  sub_1C0481090();
  return sub_1C0486F50();
}

uint64_t sub_1C047E6CC()
{
  sub_1C0481090();
  return sub_1C0486F38();
}

void sub_1C047E718(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E79BAE00;
}

void sub_1C047E72C(uint64_t a1, uint64_t a2)
{
  sub_1C047EAFC(a1, a2);
}

char *sub_1C047E738(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C04873F4();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C047E7BC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

void sub_1C047E814(uint64_t a1, uint64_t a2)
{
  sub_1C047EAFC(a1, a2);
}

char *sub_1C047E820(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

void sub_1C047E878(uint64_t a1, uint64_t a2)
{
  sub_1C047EAFC(a1, a2);
}

void sub_1C047E884(uint64_t a1, uint64_t a2)
{
  sub_1C047EAFC(a1, a2);
}

char *sub_1C047E894(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047E8EC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C04873F4();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_1C047E974(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047E9D0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047EA30(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047EA90(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[56 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

void sub_1C047EAF0(uint64_t a1, uint64_t a2)
{
  sub_1C047EC4C(a1, a2);
}

void sub_1C047EAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_41_8();
    if (v5 && (v4(0), OUTLINED_FUNCTION_53_8(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_43_7();
      }
      else
      {
        OUTLINED_FUNCTION_16_15();
        OUTLINED_FUNCTION_25_18();
      }
    }
    else
    {
      v4(0);
      OUTLINED_FUNCTION_16_15();
      OUTLINED_FUNCTION_24_14();
    }
  }
}

char *sub_1C047EB88(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[2 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047EBE0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_57_1();
    __src = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_1C047EC40(uint64_t a1, uint64_t a2)
{
  sub_1C047EC4C(a1, a2);
}

void sub_1C047EC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_41_8();
    if (v5 && (__swift_instantiateConcreteTypeFromMangledName(v4), OUTLINED_FUNCTION_53_8(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_43_7();
      }
      else
      {
        OUTLINED_FUNCTION_16_15();
        OUTLINED_FUNCTION_25_18();
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v4);
      OUTLINED_FUNCTION_16_15();
      OUTLINED_FUNCTION_24_14();
    }
  }
}

char *sub_1C047ECD4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    result = (char *)OUTLINED_FUNCTION_1_29();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_24(a3, result);
  }
  return result;
}

char *sub_1C047ED34(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C04873F4();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

uint64_t sub_1C047EDB8(uint64_t a1, uint64_t a2)
{
  return sub_1C047F484(a1, a2);
}

uint64_t sub_1C047EDC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1C04873F4();
  __break(1u);
  return result;
}

uint64_t sub_1C047EE90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return OUTLINED_FUNCTION_40_8();
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

uint64_t sub_1C047EF28(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (v3 = a1 + 40 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1C04873F4();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A7C8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C047F018(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    OUTLINED_FUNCTION_49_7();
    if (v4 + 8 * v3 <= v2 || v2 + 8 * v3 <= v4)
    {
      sub_1C041C998();
      OUTLINED_FUNCTION_31_11();
      return OUTLINED_FUNCTION_11_18();
    }
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

uint64_t sub_1C047F0B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 24 * a2 <= a1 || a1 + 24 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1C04873F4();
  __break(1u);
  return result;
}

uint64_t sub_1C047F180(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    if (a3 + 40 * a2 <= a1 || a1 + 40 * a2 <= a3)
      return OUTLINED_FUNCTION_40_8();
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

uint64_t sub_1C047F21C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    OUTLINED_FUNCTION_49_7();
    if (v4 + 40 * v3 <= v2 || v2 + 40 * v3 <= v4)
    {
      __swift_instantiateConcreteTypeFromMangledName(v5);
      OUTLINED_FUNCTION_31_11();
      return OUTLINED_FUNCTION_11_18();
    }
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

uint64_t sub_1C047F2B8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 56 * a2 <= a1 || a1 + 56 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1C04873F4();
  __break(1u);
  return result;
}

uint64_t sub_1C047F38C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF600460) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_1C04873F4();
  __break(1u);
  return result;
}

uint64_t sub_1C047F484(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    OUTLINED_FUNCTION_49_7();
    v6 = *(_QWORD *)(*(_QWORD *)(v5(0) - 8) + 72) * v2;
    v7 = v3 + v6;
    v8 = v4 + v6;
    if (v7 <= v4 || v8 <= v3)
    {
      OUTLINED_FUNCTION_31_11();
      return OUTLINED_FUNCTION_11_18();
    }
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

void *sub_1C047F528(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  const void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  void *result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    OUTLINED_FUNCTION_47_5();
    if (!v8 && v7)
    {
      v7 = v6 >= v3;
      v8 = v6 == v3;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    if (v8 || !v7)
      return OUTLINED_FUNCTION_19_17(v5, v4, 8 * v2);
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = (void *)OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

void *sub_1C047F5AC(char *a1, uint64_t a2, char *a3)
{
  void *result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_10_20();
  }
  else
  {
    if (&a3[2 * a2] <= a1 || &a1[2 * a2] <= a3)
      return OUTLINED_FUNCTION_19_17(a3, a1, 2 * a2);
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_9_26();
  }
  result = (void *)OUTLINED_FUNCTION_3_20();
  __break(1u);
  return result;
}

uint64_t sub_1C047F640(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (v3 = a1 + 24 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1C04873F4();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397A8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_1C047F730(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[4 * a2] <= __src || &__src[4 * a2] <= __dst))
    return memcpy(__dst, __src, 4 * a2);
  result = (void *)sub_1C04873F4();
  __break(1u);
  return result;
}

void *sub_1C047F7F8(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[16 * a2] <= __src || &__src[16 * a2] <= __dst))
    return memcpy(__dst, __src, 16 * a2);
  result = (void *)sub_1C04873F4();
  __break(1u);
  return result;
}

void sub_1C047F8C0()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047F8EC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C0480450();
  *v0 = v1;
}

void sub_1C047F920()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047F94C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C0480450();
  *v0 = v1;
}

void sub_1C047F980()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047F9AC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047F9D8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C04801D8();
  *v0 = v1;
}

void sub_1C047FA0C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FCE4();
  *v0 = v1;
}

void sub_1C047FA38()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FCE4();
  *v0 = v1;
}

void sub_1C047FA64()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047FA90(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1C047FD94(a1, a2, a3, *v3);
  *v3 = v4;
}

void sub_1C047FAAC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FF74();
  *v0 = v1;
}

void sub_1C047FAD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1C0480020(a1, a2, a3, *v3, &qword_1ED739BA8);
  *v3 = v4;
}

void sub_1C047FAFC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C047FBD4();
  *v0 = v1;
}

void sub_1C047FB28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1C0480020(a1, a2, a3, *v3, &qword_1ED739BB0);
  *v3 = v4;
}

char *sub_1C047FB4C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C04800DC(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

uint64_t sub_1C047FB68(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1C0480290(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1C047FB84(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C0480370(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_1C047FBA0()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C0480450();
  *v0 = v1;
}

void sub_1C047FBD4()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const void *v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_44_8();
  if ((v5 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_111_0();
      if (v9)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v8 = v4;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v8;
  if (!v12)
    goto LABEL_17;
  OUTLINED_FUNCTION_30_9(v3, v4, v5, v6, v7);
  v13 = *(_QWORD *)(v1(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (const void *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_22;
  OUTLINED_FUNCTION_42_7(v17 - v15);
LABEL_17:
  v1(0);
  OUTLINED_FUNCTION_52_1();
  v20 = v0 + v19;
  if ((v2 & 1) != 0)
  {
    sub_1C047EAFC(v20, v11);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1C047F484(v20, v11);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_14_1();
}

void sub_1C047FCD0()
{
  sub_1C047FF74();
}

void sub_1C047FCE4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  char *v14;

  OUTLINED_FUNCTION_44_8();
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_111_0();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v7 = v3;
  }
  v10 = *(_QWORD *)(v0 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(v0 + 16);
  else
    v11 = v7;
  if (v11)
  {
    OUTLINED_FUNCTION_30_9(v2, v3, v4, v5, v6);
    v12 = (char *)OUTLINED_FUNCTION_8_2();
    v13 = _swift_stdlib_malloc_size(v12);
    OUTLINED_FUNCTION_42_7(v13 - 32);
  }
  else
  {
    v12 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v14 = (char *)(v0 + 32);
  if ((v1 & 1) != 0)
  {
    sub_1C047EA30(v14, v10, v12 + 32);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1C047F21C((uint64_t)v14, v10);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_26();
}

void sub_1C047FD94(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_111_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601288);
    v11 = (char *)OUTLINED_FUNCTION_8_2();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 56);
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_1C047EA90(v14, v9, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F2B8((unint64_t)v14, v9, (unint64_t)v13);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_26();
}

void sub_1C047FE54(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v17;
  unint64_t v18;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_111_0();
      if (v7)
      {
LABEL_24:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (!v10)
  {
    v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF600930);
  v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF600460) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = _swift_stdlib_malloc_size(v14);
  if (!v12)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v15 - v13 == 0x8000000000000000 && v12 == -1)
    goto LABEL_23;
  v14[2] = v9;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_18:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF600460);
  OUTLINED_FUNCTION_52_1();
  v18 = a4 + v17;
  if ((a1 & 1) != 0)
  {
    sub_1C047EC4C(v18, v9);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F38C(v18, v9, (unint64_t)v14 + v17);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_14_1();
}

void sub_1C047FF74()
{
  uint64_t v0;
  void (*v1)(char *, uint64_t, char *);
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  char *v16;

  OUTLINED_FUNCTION_44_8();
  if ((v5 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_111_0();
      if (v9)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v8 = v4;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v8;
  if (v12)
  {
    OUTLINED_FUNCTION_30_9(v3, v4, v5, v6, v7);
    v13 = (char *)OUTLINED_FUNCTION_8_2();
    v14 = _swift_stdlib_malloc_size(v13);
    OUTLINED_FUNCTION_42_7(v14 - 32);
  }
  else
  {
    v13 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v15 = v13 + 32;
  v16 = (char *)(v0 + 32);
  if ((v2 & 1) != 0)
  {
    sub_1C047E974(v16, v11, v15);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16, v11, v15);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_26();
}

void sub_1C0480020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  char *v14;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_111_0();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    OUTLINED_FUNCTION_30_9(a1, a2, a3, a4, a5);
    v12 = OUTLINED_FUNCTION_8_2();
    v13 = _swift_stdlib_malloc_size((const void *)v12);
    *(_QWORD *)(v12 + 16) = v10;
    *(_QWORD *)(v12 + 24) = 2 * ((uint64_t)(v13 - 32) / 8);
  }
  else
  {
    v12 = MEMORY[0x1E0DEE9D8];
  }
  v14 = (char *)(a4 + 32);
  if ((v6 & 1) != 0)
  {
    sub_1C047E894(v14, v10, (char *)(v12 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F528((uint64_t)v14, v10);
  }
  OUTLINED_FUNCTION_16_7();
}

char *sub_1C04800DC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A968);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C047EB88(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F5AC(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_1C04801BC()
{
  sub_1C04801D8();
}

void sub_1C04801D8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, _QWORD *);
  void (*v2)(uint64_t, uint64_t, _QWORD *);
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_63_3();
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_111_0();
      if (v10)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v9 = v5;
  }
  v12 = *(_QWORD *)(v0 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(v0 + 16);
  else
    v13 = v9;
  if (v13)
  {
    OUTLINED_FUNCTION_30_9(v4, v5, v6, v7, v8);
    v14 = (_QWORD *)OUTLINED_FUNCTION_8_2();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v12;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 24);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v16 = v14 + 4;
  v17 = v0 + 32;
  if ((v3 & 1) != 0)
  {
    v2(v17, v12, v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v17, v12, v16);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_14_1();
}

uint64_t sub_1C0480290(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;

  v5 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739BA0);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  v12 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C047E894(v12, v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F528((uint64_t)v12, v8);
  }
  swift_release();
  return v10;
}

char *sub_1C0480370(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601278);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C047ED34(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C047F730(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_1C0480450()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, _QWORD *);
  void (*v2)(uint64_t, uint64_t, _QWORD *);
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_63_3();
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_1();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_111_0();
      if (v10)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_1();
    }
  }
  else
  {
    v9 = v5;
  }
  v12 = *(_QWORD *)(v0 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(v0 + 16);
  else
    v13 = v9;
  if (v13)
  {
    OUTLINED_FUNCTION_30_9(v4, v5, v6, v7, v8);
    v14 = (_QWORD *)OUTLINED_FUNCTION_8_2();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v12;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 16);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v16 = v14 + 4;
  v17 = v0 + 32;
  if ((v3 & 1) != 0)
  {
    v2(v17, v12, v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v17, v12, v16);
  }
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_26();
}

void sub_1C0480504()
{
  sub_1C04374B4();
}

void sub_1C0480518()
{
  sub_1C043793C();
}

void sub_1C048052C()
{
  sub_1C0437C4C();
}

unint64_t sub_1C0480540()
{
  unint64_t result;

  result = qword_1EF6011C0;
  if (!qword_1EF6011C0)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F234, &type metadata for HistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6011C0);
  }
  return result;
}

void sub_1C048057C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_1C04860B0();
    atomic_store(MEMORY[0x1C3B9BEA0](a2, v4), a1);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1C04805B8@<X0>(_QWORD *a1@<X1>, _WORD *a2@<X8>)
{
  return sub_1C047D9B8(a1, a2);
}

uint64_t sub_1C04805D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HistoryStats();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C0480618(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HistoryStats();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C0480654()
{
  unint64_t result;

  result = qword_1EF6011D8;
  if (!qword_1EF6011D8)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F1E4, &type metadata for PrivatizedHistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF6011D8);
  }
  return result;
}

unint64_t sub_1C0480690()
{
  unint64_t result;

  result = qword_1EF6011E0;
  if (!qword_1EF6011E0)
  {
    result = MEMORY[0x1C3B9BEA0](&protocol conformance descriptor for IntervalBucket, &type metadata for IntervalBucket);
    atomic_store(result, (unint64_t *)&qword_1EF6011E0);
  }
  return result;
}

unint64_t sub_1C04806CC()
{
  unint64_t result;

  result = qword_1EF601200;
  if (!qword_1EF601200)
  {
    result = MEMORY[0x1C3B9BEA0](&protocol conformance descriptor for IntervalBucket, &type metadata for IntervalBucket);
    atomic_store(result, (unint64_t *)&qword_1EF601200);
  }
  return result;
}

uint64_t sub_1C0480708(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF6011E8);
    v8 = a2;
    result = MEMORY[0x1C3B9BEA0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C048076C()
{
  unint64_t result;

  result = qword_1EF601210;
  if (!qword_1EF601210)
  {
    result = MEMORY[0x1C3B9BEA0](&protocol conformance descriptor for IntervalBucket, &type metadata for IntervalBucket);
    atomic_store(result, (unint64_t *)&qword_1EF601210);
  }
  return result;
}

void sub_1C04807A8()
{
  sub_1C0480ED4(&qword_1EF601218, &qword_1EF601220);
}

uint64_t *initializeBufferWithCopyOfBuffer for HistoryStats(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1C04860B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for HistoryStats(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C04860B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HistoryStats(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C04860B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HistoryStats(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C04860B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for HistoryStats(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C04860B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for HistoryStats(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C04860B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HistoryStats()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C0480A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_53();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HistoryStats()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1C0480AB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_53();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    OUTLINED_FUNCTION_24_1();
  }
}

uint64_t sub_1C0480B1C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C04860B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PrivatizedHistoryStats(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrivatizedHistoryStats(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PrivatizedHistoryStats(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PrivatizedHistoryStats()
{
  return &type metadata for PrivatizedHistoryStats;
}

uint64_t storeEnumTagSinglePayload for IntervalBucket(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1C0480C98 + 4 * byte_1C048ED12[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1C0480CCC + 4 * byte_1C048ED0D[v4]))();
}

uint64_t sub_1C0480CCC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480CD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C0480CDCLL);
  return result;
}

uint64_t sub_1C0480CE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C0480CF0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1C0480CF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480CFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntervalBucket()
{
  return &type metadata for IntervalBucket;
}

uint64_t storeEnumTagSinglePayload for PrivatizedHistoryStats.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C0480D64 + 4 * byte_1C048ED1C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C0480D98 + 4 * byte_1C048ED17[v4]))();
}

uint64_t sub_1C0480D98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480DA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C0480DA8);
  return result;
}

uint64_t sub_1C0480DB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C0480DBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C0480DC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480DC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrivatizedHistoryStats.CodingKeys()
{
  return &type metadata for PrivatizedHistoryStats.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for HistoryStats.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1C0480E30 + 4 * byte_1C048ED26[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1C0480E64 + 4 * byte_1C048ED21[v4]))();
}

uint64_t sub_1C0480E64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480E6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C0480E74);
  return result;
}

uint64_t sub_1C0480E80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C0480E88);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1C0480E8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C0480E94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HistoryStats.CodingKeys()
{
  return &type metadata for HistoryStats.CodingKeys;
}

void sub_1C0480EB0()
{
  sub_1C0480ED4(&qword_1EF601228, &qword_1EF601230);
}

void sub_1C0480ED4(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1C3B9BEA0](MEMORY[0x1E0DEAF50], v3), a1);
  }
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1C0480F14()
{
  unint64_t result;

  result = qword_1EF601238;
  if (!qword_1EF601238)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F104, &type metadata for HistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601238);
  }
  return result;
}

unint64_t sub_1C0480F54()
{
  unint64_t result;

  result = qword_1EF601240;
  if (!qword_1EF601240)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F1BC, &type metadata for PrivatizedHistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601240);
  }
  return result;
}

unint64_t sub_1C0480F94()
{
  unint64_t result;

  result = qword_1EF601248;
  if (!qword_1EF601248)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F12C, &type metadata for PrivatizedHistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601248);
  }
  return result;
}

unint64_t sub_1C0480FD4()
{
  unint64_t result;

  result = qword_1EF601250;
  if (!qword_1EF601250)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F154, &type metadata for PrivatizedHistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601250);
  }
  return result;
}

unint64_t sub_1C0481014()
{
  unint64_t result;

  result = qword_1EF601258;
  if (!qword_1EF601258)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F004, &type metadata for HistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601258);
  }
  return result;
}

unint64_t sub_1C0481054()
{
  unint64_t result;

  result = qword_1EF601260;
  if (!qword_1EF601260)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F02C, &type metadata for HistoryStats.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF601260);
  }
  return result;
}

unint64_t sub_1C0481090()
{
  unint64_t result;

  result = qword_1EF601270;
  if (!qword_1EF601270)
  {
    result = MEMORY[0x1C3B9BEA0](&protocol conformance descriptor for IntervalBucket, &type metadata for IntervalBucket);
    atomic_store(result, (unint64_t *)&qword_1EF601270);
  }
  return result;
}

void *OUTLINED_FUNCTION_2_24@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  return sub_1C04873F4();
}

uint64_t OUTLINED_FUNCTION_5_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_16_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_17_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 88) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_15()
{
  return sub_1C0486DF4();
}

void *OUTLINED_FUNCTION_19_17(void *__dst, const void *__src, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

uint64_t OUTLINED_FUNCTION_23_16()
{
  return sub_1C0486DF4();
}

uint64_t OUTLINED_FUNCTION_24_14()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_25_18()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_30_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return __swift_instantiateConcreteTypeFromMangledName(a5);
}

uint64_t OUTLINED_FUNCTION_31_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_10()
{
  return sub_1C0487628();
}

void OUTLINED_FUNCTION_36_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 8 * v2 + 32) = v3;
}

void OUTLINED_FUNCTION_39_8()
{
  uint64_t v0;

  sub_1C047FAD8(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  return swift_arrayInitWithCopy();
}

void OUTLINED_FUNCTION_42_7(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = 2 * (a1 / v3);
}

uint64_t OUTLINED_FUNCTION_48_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_50_6(uint64_t a1)
{
  uint64_t v1;

  sub_1C047FAD8(a1, v1, 1);
}

uint64_t OUTLINED_FUNCTION_51_5()
{
  return sub_1C0487634();
}

uint64_t OUTLINED_FUNCTION_55_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return sub_1C048746C();
}

uint64_t OUTLINED_FUNCTION_62_3(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

void *static AppSelectionUtilityHelper.equivalentInteractionIntentsFor(intent:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = objc_msgSend(a1, sel__className);
  v3 = sub_1C0486D58();
  v5 = v4;

  if (v3 == 0xD000000000000011 && v5 == 0x80000001C048F4E0
    || (OUTLINED_FUNCTION_1_30() & 1) != 0
    || v3 == 0xD000000000000016 && v5 == 0x80000001C048F500)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_1_30();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED739B88);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1C04881A0;
      v9 = objc_msgSend(a1, sel__className);
      v10 = sub_1C0486D58();
      v12 = v11;

      *(_QWORD *)(v6 + 32) = v10;
      *(_QWORD *)(v6 + 40) = v12;
      return (void *)v6;
    }
  }
  return &unk_1E79BAD20;
}

uint64_t static AppSelectionUtilityHelper.getCountryCode(handleId:)()
{
  uint64_t v0;
  uint64_t v1;

  if ((sub_1C048163C() & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_9();
  v0 = sub_1C0481774(10);
  v1 = MEMORY[0x1C3B9B0CC](v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static AppSelectionUtilityHelper.getBundleId(bundle:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = a1;
  sub_1C0481558(124, 0xE100000000000000, a1, a2);
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_9();
  }
  else
  {
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_3_21();
    OUTLINED_FUNCTION_0_24();
    v4 = OUTLINED_FUNCTION_4_18();
    v2 = MEMORY[0x1C3B9B0CC](v4);
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_1C0481558(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v11;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v7 = 4 * v4;
  v8 = 15;
  while (sub_1C0486EE4() != a1 || v9 != a2)
  {
    v11 = sub_1C0487544();
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      return v8;
    v8 = sub_1C0486E0C();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C048163C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  uint64_t v6;

  sub_1C044CD14();
  sub_1C044CD50();
  if ((sub_1C0486D1C() & 1) == 0 || sub_1C0486E00() < 12)
    return 0;
  OUTLINED_FUNCTION_9();
  v0 = sub_1C0486E78();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      if ((sub_1C0486D10() & 1) != 0 || (v2 == 43 ? (v4 = v3 == 0xE100000000000000) : (v4 = 0), v4))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = sub_1C0487544();
        swift_bridgeObjectRelease();
        if ((v5 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_1C0486E78();
      v3 = v6;
    }
    while (v6);
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C0481774(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C0486E24();
    OUTLINED_FUNCTION_3_21();
    OUTLINED_FUNCTION_0_24();
    return OUTLINED_FUNCTION_4_18();
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSelectionUtilityHelper()
{
  return &type metadata for AppSelectionUtilityHelper;
}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_21()
{
  return sub_1C0486EFC();
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C0481850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD v10[4];
  uint64_t v11;
  uint64_t Value;
  uint64_t v13;

  v3 = sub_1C04860B0();
  v10[2] = *(_QWORD *)(v3 - 8);
  v10[3] = v3;
  MEMORY[0x1E0C80A78](v3);
  v10[1] = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Value = type metadata accessor for QueryValue();
  v5 = *(_QWORD *)(Value - 8);
  MEMORY[0x1E0C80A78](Value);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C0486428();
  MEMORY[0x1E0C80A78](v11);
  if (*(_QWORD *)(a1 + 16))
  {
    v10[0] = v1;
    v13 = MEMORY[0x1E0DEE9D8];
    sub_1C047F980();
    sub_1C0439800(a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for QueryValue);
    v8 = (char *)&loc_1C04819A0 + 4 * byte_1C048F2EA[swift_getEnumCaseMultiPayload()];
    __asm { BR              X9 }
  }
  return MEMORY[0x1E0DEE9D8];
}

double EntityQuery.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = -1;
  *(_QWORD *)(a1 + 40) = MEMORY[0x1E0DEE9D8];
  return result;
}

uint64_t EntityQuery.filter(matchingTokens:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(v2 + 8);
  v15 = v8;
  v16 = *(_QWORD *)v2;
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = *(_QWORD *)(v2 + 40);
  v12 = *(_BYTE *)(v2 + 32);
  v13 = *(_BYTE *)(a1 + 32);
  sub_1C0423678(v16, v8, v9, v10, v12);
  swift_bridgeObjectRetain();
  sub_1C042368C(v4, v5, v6, v7, v13);
  result = sub_1C0423714(v16, v15, v9, v10, v12);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = v13;
  *(_QWORD *)(a2 + 40) = v11;
  return result;
}

void sub_1C0481BC8()
{
  sub_1C0481C20();
}

void sub_1C0481BF4()
{
  sub_1C0481C20();
}

void sub_1C0481C20()
{
  uint64_t *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t *v7;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  _QWORD v71[3];
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  _QWORD *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91[5];
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;

  OUTLINED_FUNCTION_6_10();
  v87 = v1;
  v89 = v2;
  v90 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = sub_1C04866E0();
  v84 = *(_QWORD *)(v10 - 8);
  v85 = v10;
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_29_10(v12);
  v13 = sub_1C0486260();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_29_10(v15);
  sub_1C0486884();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_29_10(v17);
  sub_1C0486668();
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_47_0();
  v71[1] = v19;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739780);
  v74 = *(_QWORD *)(v75 - 8);
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_47_0();
  v73 = v21;
  v86 = v7;
  v22 = __swift_instantiateConcreteTypeFromMangledName(v7);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x1E0C80A78](v22);
  v26 = (char *)v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v24);
  v83 = (char *)v71 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v72 = (char *)v71 - v30;
  MEMORY[0x1E0C80A78](v29);
  v32 = (char *)v71 - v31;
  v95 = v0[5];
  v5(0);
  sub_1C0415F70(v89, v5);
  sub_1C0486278();
  v33 = v13;
  v34 = *(_QWORD **)(v95 + 16);
  v79 = v9;
  v78 = v33;
  v77 = v14;
  if (v34)
  {
    v71[0] = v0;
    v35 = swift_bridgeObjectRetain();
    v90 = 0;
    v82 = v23;
    v81 = v32;
    v80 = v26;
    v89 = v34;
    v36 = *(_QWORD *)(v35 + 32);
    v37 = *(_QWORD *)(v35 + 40);
    v38 = *(unsigned __int8 *)(v35 + 48);
    swift_bridgeObjectRetain();
    sub_1C0439580(v36, v37);
    v39 = swift_bridgeObjectRetain();
    v40 = v90;
    v88 = sub_1C0481850(v39);
    v90 = v40;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v26, v32, v22);
    *(_QWORD *)&v92 = sub_1C046D280(v36, v37);
    *((_QWORD *)&v92 + 1) = v41;
    OUTLINED_FUNCTION_64_1();
    __asm { BR              X8 }
  }
  v42 = *((unsigned __int8 *)v0 + 32);
  if (v42 == 255)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v9, v32, v22);
  }
  else
  {
    v90 = v22;
    v44 = v0[2];
    v43 = v0[3];
    v46 = *v0;
    v45 = v0[1];
    v47 = OUTLINED_FUNCTION_28_12();
    sub_1C042368C(v47, v48, v49, v50, v51);
    sub_1C048662C();
    sub_1C0486620();
    *(_QWORD *)&v92 = v46;
    *((_QWORD *)&v92 + 1) = v45;
    *(_QWORD *)&v93 = v44;
    *((_QWORD *)&v93 + 1) = v43;
    LOBYTE(v94) = v42;
    sub_1C045F638();
    v53 = v52;
    v54 = v32;
    v56 = v55;
    v57 = OUTLINED_FUNCTION_28_12();
    sub_1C0423714(v57, v58, v59, v60, v61);
    *(_QWORD *)&v92 = v53;
    *((_QWORD *)&v92 + 1) = v56;
    sub_1C0439650();
    sub_1C048665C();
    swift_bridgeObjectRelease();
    sub_1C0486620();
    sub_1C0486878();
    v94 = 0;
    v92 = 0u;
    v93 = 0u;
    v62 = v73;
    sub_1C0486230();
    v63 = v72;
    v64 = v54;
    v65 = v54;
    v66 = v90;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v72, v65, v90);
    v67 = v76;
    v68 = v75;
    sub_1C0486224();
    v91[3] = sub_1C04868B4();
    v91[4] = MEMORY[0x1E0D24658];
    __swift_allocate_boxed_opaque_existential_1(v91);
    sub_1C04868A8();
    *((_QWORD *)&v93 + 1) = sub_1C0486434();
    v94 = MEMORY[0x1E0D23DC0];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v92);
    v69 = v78;
    sub_1C0486518();
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v67, v69);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
    sub_1C04160B0(v87, v86);
    sub_1C04864E8();
    v70 = *(void (**)(char *, uint64_t))(v23 + 8);
    v70(v63, v66);
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v62, v68);
    v70(v64, v66);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v92);
  }
  OUTLINED_FUNCTION_32_1();
}

void EntityQuery.filter(id:)()
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

  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_40_9(v0, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73B4E0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_3_7();
  v4 = MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_5_23(v4, v5, v6, v7, v8, v9, v10, v11, v14);
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_30_10();
  v12 = OUTLINED_FUNCTION_23_17();
  sub_1C0439754(v12, v13, &qword_1ED73B4E0);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_18_16();
  sub_1C042EA20();
  OUTLINED_FUNCTION_31_12();
  OUTLINED_FUNCTION_9_27();
  OUTLINED_FUNCTION_7_20();
  OUTLINED_FUNCTION_32_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73B4E0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_20_13(v1, v5);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_2_25();
  v3 = OUTLINED_FUNCTION_6_21();
  sub_1C0439754(v3, v4, &qword_1ED73B4E0);
  OUTLINED_FUNCTION_19_18();
  sub_1C042EA20();
  OUTLINED_FUNCTION_37_9();
  OUTLINED_FUNCTION_9_27();
  OUTLINED_FUNCTION_8_20();
  OUTLINED_FUNCTION_32_1();
}

void EntityQuery.filter(type:)()
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

  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_40_9(v0, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73B4E0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_3_7();
  v4 = MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_5_23(v4, v5, v6, v7, v8, v9, v10, v11, v14);
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_30_10();
  v12 = OUTLINED_FUNCTION_23_17();
  sub_1C0439754(v12, v13, &qword_1ED73B4E0);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_18_16();
  sub_1C042EA20();
  OUTLINED_FUNCTION_31_12();
  OUTLINED_FUNCTION_9_27();
  OUTLINED_FUNCTION_7_20();
  OUTLINED_FUNCTION_32_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73B4E0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_20_13(v1, v5);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_2_25();
  v3 = OUTLINED_FUNCTION_6_21();
  sub_1C0439754(v3, v4, &qword_1ED73B4E0);
  OUTLINED_FUNCTION_19_18();
  sub_1C042EA20();
  OUTLINED_FUNCTION_37_9();
  OUTLINED_FUNCTION_9_27();
  OUTLINED_FUNCTION_8_20();
  OUTLINED_FUNCTION_32_1();
}

void EntityQuery.fetchAll(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  __int128 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  char v30;
  __int128 v31;
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
  uint64_t *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;

  OUTLINED_FUNCTION_4_5();
  v14 = v13;
  v57 = *(_QWORD *)(type metadata accessor for _Entity(0) - 8);
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_11_19();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v50 - v17;
  v19 = OUTLINED_FUNCTION_9_20();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_7();
  v23 = (_QWORD *)(v22 - v21);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D78);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_7();
  v28 = v27 - v26;
  v29 = *(unsigned __int8 *)(v14 + 8);
  v30 = *(_BYTE *)(v14 + 40);
  v31 = v11[1];
  v59 = *v11;
  v60 = v31;
  v61 = v11[2];
  if (v29 == 1)
  {
    v32 = OUTLINED_FUNCTION_12_19(v30);
    sub_1C0482968(v32, v33, v34, v35, v36, v37, v38, v39, v50, v51);
  }
  else
  {
    v55 = v28;
    OUTLINED_FUNCTION_13_20(v30);
    v40 = sub_1C046932C();
    if (!v12)
    {
      v56 = v10;
      v54 = v40;
      v41 = v55;
      sub_1C0481C20();
      v53 = &v50;
      MEMORY[0x1E0C80A78](v42);
      *(&v50 - 2) = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601290);
      sub_1C0486404();
      v51 = v25;
      v52 = v24;
      v43 = v58;
      v44 = v58[2];
      v45 = v56;
      if (v44)
      {
        OUTLINED_FUNCTION_22_16(MEMORY[0x1E0DEE9D8]);
        v46 = *(unsigned __int8 *)(v57 + 80);
        v53 = v43;
        v47 = (uint64_t)v43 + ((v46 + 32) & ~v46);
        v57 = *(_QWORD *)(v57 + 72);
        do
        {
          OUTLINED_FUNCTION_43_8(v47, (uint64_t)v18);
          OUTLINED_FUNCTION_43_8((uint64_t)v18, (uint64_t)v45);
          sub_1C0466C9C(v45, v23);
          sub_1C048358C((uint64_t)v18);
          v48 = a10;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_17_15();
            v48 = a10;
          }
          v49 = *(_QWORD *)(v48 + 16);
          if (v49 >= *(_QWORD *)(v48 + 24) >> 1)
          {
            sub_1C047F8C0();
            v48 = a10;
          }
          *(_QWORD *)(v48 + 16) = v49 + 1;
          sub_1C04397CC((uint64_t)v23, v48+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(_QWORD *)(v20 + 72) * v49, (uint64_t (*)(_QWORD))type metadata accessor for Entity);
          v45 = v56;
          v47 += v57;
          --v44;
        }
        while (v44);
      }
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_39_9();
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v55, v52);
    }
  }
  OUTLINED_FUNCTION_34_0();
}

void sub_1C0482968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  char v68;
  char v69;
  __int128 v70;
  uint64_t v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;

  OUTLINED_FUNCTION_4_5();
  v63 = (uint64_t *)v11;
  v14 = v13;
  v59 = sub_1C0486B3C();
  v64 = *(_QWORD *)(v59 - 8);
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v54 - v17;
  v19 = OUTLINED_FUNCTION_9_20();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_7();
  v23 = v22 - v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED73AEE8);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_7();
  v28 = v27 - v26;
  v29 = *v14;
  LOBYTE(v27) = *((_BYTE *)v14 + 8);
  v30 = *((_BYTE *)v14 + 9);
  v31 = *((_BYTE *)v14 + 10);
  v32 = *((_BYTE *)v14 + 11);
  v33 = v14[4];
  v34 = *((_BYTE *)v14 + 40);
  v35 = v10[1];
  v73 = *v10;
  v74 = v35;
  v75 = v10[2];
  v65 = v29;
  v66 = v27;
  v67 = v30;
  v68 = v31;
  v69 = v32;
  v70 = *((_OWORD *)v14 + 1);
  v71 = v33;
  v72 = v34;
  v36 = (uint64_t)v63;
  v37 = sub_1C046932C();
  if (!v36)
  {
    v57 = v25;
    v56 = v18;
    v38 = v59;
    v58 = v24;
    v62 = v12;
    v63 = (uint64_t *)v23;
    v61 = v20;
    v39 = v37;
    sub_1C0481C20();
    MEMORY[0x1E0C80A78](v40);
    v54[-2] = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012C8);
    sub_1C0486404();
    v54[1] = v39;
    v55 = v28;
    v41 = v65;
    v42 = *(_QWORD *)(v65 + 16);
    if (v42)
    {
      OUTLINED_FUNCTION_22_16(MEMORY[0x1E0DEE9D8]);
      v43 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      v54[0] = v41;
      v44 = v41 + v43;
      v60 = *(_QWORD *)(v64 + 72);
      v45 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
      v46 = v63;
      v47 = v38;
      v48 = v56;
      do
      {
        v45(v48, v44, v47);
        v49 = v62;
        v45((char *)v62, (uint64_t)v48, v47);
        sub_1C0467010(v49, v46);
        OUTLINED_FUNCTION_35_9();
        v50 = a10;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_17_15();
          v50 = a10;
        }
        v51 = v61;
        v52 = *(_QWORD *)(v50 + 16);
        if (v52 >= *(_QWORD *)(v50 + 24) >> 1)
        {
          sub_1C047F8C0();
          v51 = v61;
          v50 = a10;
        }
        *(_QWORD *)(v50 + 16) = v52 + 1;
        v53 = v50
            + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))
            + *(_QWORD *)(v51 + 72) * v52;
        v46 = v63;
        sub_1C04397CC((uint64_t)v63, v53, (uint64_t (*)(_QWORD))type metadata accessor for Entity);
        v44 += v60;
        --v42;
      }
      while (v42);
      OUTLINED_FUNCTION_42_8();
      OUTLINED_FUNCTION_25_19();
    }
    else
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_25_19();
    }
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v58);
  }
  OUTLINED_FUNCTION_34_0();
}

uint64_t sub_1C0482D08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D78);
  sub_1C04160B0(&qword_1EF6012B8, &qword_1ED739D78);
  sub_1C0415F70(&qword_1EF6012C0, (void (*)(uint64_t))type metadata accessor for _Entity);
  result = sub_1C0486308();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_1C0482DAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(qword_1ED73AEE8);
  sub_1C04160B0(&qword_1EF6012A8, qword_1ED73AEE8);
  sub_1C0415F70(&qword_1EF6012B0, (void (*)(uint64_t))MEMORY[0x1E0D3BE28]);
  result = sub_1C0486308();
  if (!v1)
    *a1 = result;
  return result;
}

void EntityQuery.fetchOne(_:)()
{
  uint64_t v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  __int128 v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;

  OUTLINED_FUNCTION_4_5();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = type metadata accessor for _Entity(0);
  OUTLINED_FUNCTION_16();
  v10 = MEMORY[0x1E0C80A78](v9);
  v41 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v37 = (uint64_t)v33 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601298);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_11_19();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v33 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D78);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_7();
  v22 = v21 - v20;
  v23 = *(unsigned __int8 *)(v5 + 8);
  v24 = *(_BYTE *)(v5 + 40);
  v25 = v1[1];
  v38 = *v1;
  v39 = v25;
  v40 = v1[2];
  if (v23 == 1)
  {
    OUTLINED_FUNCTION_12_19(v24);
    sub_1C0483130();
  }
  else
  {
    v35 = v18;
    v36 = v19;
    v34 = v7;
    OUTLINED_FUNCTION_13_20(v24);
    v26 = sub_1C046932C();
    if (!v3)
    {
      v27 = v26;
      sub_1C0481C20();
      MEMORY[0x1E0C80A78](v28);
      v33[-2] = v22;
      sub_1C0486404();
      v33[1] = v27;
      sub_1C0439754((uint64_t)v16, v0, &qword_1EF601298);
      v29 = 1;
      if (__swift_getEnumTagSinglePayload(v0, 1, v8) == 1)
      {
        v30 = v34;
      }
      else
      {
        v31 = v37;
        sub_1C04397CC(v0, v37, type metadata accessor for _Entity);
        OUTLINED_FUNCTION_43_8(v31, (uint64_t)v41);
        v30 = v34;
        sub_1C0466C9C(v41, v34);
        sub_1C048358C(v31);
        v29 = 0;
      }
      v32 = OUTLINED_FUNCTION_9_20();
      __swift_storeEnumTagSinglePayload((uint64_t)v30, v29, 1, v32);
      sub_1C03FB55C((uint64_t)v16, &qword_1EF601298);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v22, v36);
    }
  }
  OUTLINED_FUNCTION_34_0();
}

void sub_1C0483130()
{
  uint64_t v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  __int128 v54;
  uint64_t v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  OUTLINED_FUNCTION_4_5();
  v4 = v1;
  v6 = v5;
  v46 = v7;
  v47 = sub_1C0486B3C();
  v45 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_38_1();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v41 - v10;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012A0);
  OUTLINED_FUNCTION_16();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_11_19();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v41 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED73AEE8);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_7();
  v20 = v19 - v18;
  v21 = *v6;
  LOBYTE(v19) = *((_BYTE *)v6 + 8);
  v22 = *((_BYTE *)v6 + 9);
  v23 = *((_BYTE *)v6 + 10);
  v24 = *((_BYTE *)v6 + 11);
  v25 = v6[4];
  v26 = *((_BYTE *)v6 + 40);
  v27 = v4[1];
  v57 = *v4;
  v58 = v27;
  v59 = v4[2];
  v49 = v21;
  v50 = v19;
  v51 = v22;
  v52 = v23;
  v53 = v24;
  v54 = *((_OWORD *)v6 + 1);
  v55 = v25;
  v56 = v26;
  v28 = sub_1C046932C();
  if (!v2)
  {
    v42 = v3;
    v43 = v0;
    v29 = v47;
    v44 = v17;
    v60 = v16;
    v30 = v28;
    sub_1C0481C20();
    MEMORY[0x1E0C80A78](v31);
    v32 = v20;
    *(&v41 - 2) = v20;
    sub_1C0486404();
    v33 = (uint64_t)v15;
    v48 = (uint64_t)v30;
    v34 = v43;
    sub_1C0439754((uint64_t)v15, v43, &qword_1EF6012A0);
    v35 = 1;
    if (__swift_getEnumTagSinglePayload(v34, 1, v29) == 1)
    {
      v36 = v46;
    }
    else
    {
      v37 = v45;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v11, v34, v29);
      v38 = v42;
      (*(void (**)(uint64_t, char *, uint64_t))(v37 + 16))(v42, v11, v29);
      v36 = v46;
      sub_1C0467010(v38, v46);
      OUTLINED_FUNCTION_38_8();
      v35 = 0;
    }
    v39 = v44;
    v40 = OUTLINED_FUNCTION_9_20();
    __swift_storeEnumTagSinglePayload((uint64_t)v36, v35, 1, v40);
    sub_1C03FB55C(v33, &qword_1EF6012A0);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v32, v60);
  }
  OUTLINED_FUNCTION_34_0();
}

uint64_t sub_1C0483434()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D78);
  sub_1C04160B0(&qword_1EF6012B8, &qword_1ED739D78);
  sub_1C0415F70(&qword_1EF6012C0, (void (*)(uint64_t))type metadata accessor for _Entity);
  return sub_1C0486314();
}

uint64_t sub_1C04834D4()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED73AEE8);
  sub_1C04160B0(&qword_1EF6012A8, qword_1ED73AEE8);
  sub_1C0415F70(&qword_1EF6012B0, (void (*)(uint64_t))MEMORY[0x1E0D3BE28]);
  return sub_1C0486314();
}

uint64_t sub_1C0483574@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C0482D08(a1);
}

uint64_t sub_1C048358C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _Entity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C04835C8()
{
  return sub_1C0483434();
}

uint64_t destroy for EntityQuery(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(a1 + 32);
  if (v1 != 255)
    sub_1C0423728(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EntityQuery(uint64_t a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *((unsigned __int8 *)a2 + 32);
  if (v4 == 255)
  {
    v9 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  }
  else
  {
    v5 = *a2;
    v6 = a2[1];
    v7 = a2[2];
    v8 = a2[3];
    sub_1C042368C(*a2, v6, v7, v8, v4);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v8;
    *(_BYTE *)(a1 + 32) = v4;
  }
  *(_QWORD *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EntityQuery(uint64_t a1, __int128 *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = *((unsigned __int8 *)a2 + 32);
  if (*(unsigned __int8 *)(a1 + 32) == 255)
  {
    if (v4 == 255)
    {
      v20 = *a2;
      v21 = a2[1];
      *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
      *(_OWORD *)a1 = v20;
      *(_OWORD *)(a1 + 16) = v21;
    }
    else
    {
      v14 = *(_QWORD *)a2;
      v15 = *((_QWORD *)a2 + 1);
      v16 = *((_QWORD *)a2 + 2);
      v17 = *((_QWORD *)a2 + 3);
      sub_1C042368C(*(_QWORD *)a2, v15, v16, v17, v4);
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v15;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = v17;
      *(_BYTE *)(a1 + 32) = v4;
    }
  }
  else if (v4 == 255)
  {
    sub_1C04837BC(a1);
    v18 = *((_BYTE *)a2 + 32);
    v19 = a2[1];
    *(_OWORD *)a1 = *a2;
    *(_OWORD *)(a1 + 16) = v19;
    *(_BYTE *)(a1 + 32) = v18;
  }
  else
  {
    v5 = *(_QWORD *)a2;
    v6 = *((_QWORD *)a2 + 1);
    v7 = *((_QWORD *)a2 + 2);
    v8 = *((_QWORD *)a2 + 3);
    sub_1C042368C(*(_QWORD *)a2, v6, v7, v8, v4);
    v9 = *(_QWORD *)a1;
    v10 = *(_QWORD *)(a1 + 8);
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v8;
    v13 = *(_BYTE *)(a1 + 32);
    *(_BYTE *)(a1 + 32) = v4;
    sub_1C0423728(v9, v10, v11, v12, v13);
  }
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C04837BC(uint64_t a1)
{
  destroy for FTSFilter(a1);
  return a1;
}

uint64_t assignWithTake for EntityQuery(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 == 255)
    goto LABEL_5;
  v5 = *(unsigned __int8 *)(a2 + 32);
  if (v5 == 255)
  {
    sub_1C04837BC(a1);
LABEL_5:
    v11 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v11;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    goto LABEL_6;
  }
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_BYTE *)(a1 + 32) = v5;
  sub_1C0423728(v6, v7, v8, v9, v4);
LABEL_6:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityQuery(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EntityQuery(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EntityQuery()
{
  return &type metadata for EntityQuery;
}

uint64_t sub_1C048390C()
{
  return sub_1C04834D4();
}

uint64_t sub_1C0483924@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C0482DAC(a1);
}

void OUTLINED_FUNCTION_2_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v2 - 128) = *(_QWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v1 + 16);
  sub_1C0426734(v3, v4, v5);
  sub_1C041E940(v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_5_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v13 = (uint64_t *)((char *)&a9 - v9);
  *(_QWORD *)(v12 - 136) = *(_QWORD *)(v10 + 40);
  *v13 = *(_QWORD *)(v12 - 128);
  v13[1] = v11;
  return type metadata accessor for QueryValue();
}

uint64_t OUTLINED_FUNCTION_6_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1C0426760(v6, v7, v5);
  *(_QWORD *)v1 = v8;
  *(_QWORD *)(v1 + 8) = v9;
  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(v10 - 128);
  return v2;
}

void OUTLINED_FUNCTION_7_20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *v1;
  *(_QWORD *)(v8 + 16) = v0 + 1;
  v9 = v8 + 32 * v0;
  *(_QWORD *)(v9 + 32) = v3;
  *(_QWORD *)(v9 + 40) = v4;
  *(_BYTE *)(v9 + 48) = v5;
  *(_QWORD *)(v9 + 56) = v6;
  sub_1C03FB55C(v2, v7);
}

void OUTLINED_FUNCTION_8_20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *v1;
  *(_QWORD *)(v8 + 16) = v0 + 1;
  v9 = v8 + 32 * v0;
  *(_QWORD *)(v9 + 32) = v2;
  *(_QWORD *)(v9 + 40) = v3;
  *(_BYTE *)(v9 + 48) = v4;
  *(_QWORD *)(v9 + 56) = v5;
  sub_1C03FB55C(v7, v6);
}

uint64_t OUTLINED_FUNCTION_9_27()
{
  uint64_t v0;

  return sub_1C043743C(*(_QWORD *)(*(_QWORD *)v0 + 16));
}

uint64_t OUTLINED_FUNCTION_12_19@<X0>(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 - 176) = v7;
  *(_BYTE *)(v8 - 168) = 1;
  *(_BYTE *)(v8 - 167) = v6;
  *(_BYTE *)(v8 - 166) = v5;
  *(_BYTE *)(v8 - 165) = v4;
  *(_QWORD *)(v8 - 160) = v3;
  *(_QWORD *)(v8 - 152) = v2;
  *(_QWORD *)(v8 - 144) = v1;
  *(_BYTE *)(v8 - 136) = a1;
  return v8 - 176;
}

void OUTLINED_FUNCTION_13_20(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 - 176) = v7;
  *(_BYTE *)(v8 - 168) = 0;
  *(_BYTE *)(v8 - 167) = v6;
  *(_BYTE *)(v8 - 166) = v5;
  *(_BYTE *)(v8 - 165) = v4;
  *(_QWORD *)(v8 - 160) = v3;
  *(_QWORD *)(v8 - 152) = v2;
  *(_QWORD *)(v8 - 144) = v1;
  *(_BYTE *)(v8 - 136) = a1;
}

void OUTLINED_FUNCTION_17_15()
{
  sub_1C047F8C0();
}

uint64_t OUTLINED_FUNCTION_18_16()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C0423678(v3, v4, v0, v1, v2);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_18()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C0423678(v3, v4, v0, v1, v2);
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_20_13(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_22_16(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  sub_1C047F8C0();
}

uint64_t OUTLINED_FUNCTION_23_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)v1 = v5;
  *(_QWORD *)(v1 + 8) = v6;
  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(v7 - 136);
  return v2;
}

uint64_t OUTLINED_FUNCTION_25_19()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_28_12()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29_10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_30_10()
{
  return swift_storeEnumTagMultiPayload();
}

void OUTLINED_FUNCTION_31_12()
{
  sub_1C04373EC();
}

uint64_t OUTLINED_FUNCTION_35_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void OUTLINED_FUNCTION_37_9()
{
  sub_1C04373EC();
}

uint64_t OUTLINED_FUNCTION_38_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_39_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_9(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = result;
  *(_QWORD *)(v2 - 120) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_42_8()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_43_8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_1C0439800(a1, a2, v2);
}

void sub_1C0483C38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v20[2] = a4;
  v25 = a2;
  v7 = a3(0);
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = (_QWORD *)((char *)v20 - v10);
  v27 = MEMORY[0x1E0DEE9D8];
  v22 = *(_QWORD *)(a1 + 16);
  if (v22)
  {
    v20[1] = v4;
    v12 = 0;
    v13 = MEMORY[0x1E0DEE9D8];
    v21 = a1;
    while (v12 < *(_QWORD *)(a1 + 16))
    {
      v14 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v15 = *(_QWORD *)(v24 + 72);
      sub_1C0449F24(a1 + v14 + v15 * v12, (uint64_t)v11, a3);
      v17 = *v11;
      v16 = v11[1];
      OUTLINED_FUNCTION_9();
      LOBYTE(v16) = sub_1C0465618(&v26, v17, v16);
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
      {
        sub_1C0449E10((uint64_t)v11, v23, a3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          OUTLINED_FUNCTION_2_26(0, *(_QWORD *)(v13 + 16) + 1);
        v13 = v27;
        v19 = *(_QWORD *)(v27 + 16);
        v18 = *(_QWORD *)(v27 + 24);
        if (v19 >= v18 >> 1)
        {
          OUTLINED_FUNCTION_2_26(v18 > 1, v19 + 1);
          v13 = v27;
        }
        *(_QWORD *)(v13 + 16) = v19 + 1;
        sub_1C0449E10(v23, v13 + v14 + v19 * v15, a3);
        a1 = v21;
      }
      else
      {
        sub_1C040577C((uint64_t)v11, a3);
      }
      if (v22 == ++v12)
        goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C0483E28(uint64_t a1)
{
  return sub_1C0483E50(a1, type metadata accessor for InteractionWithParameters, (uint64_t)sub_1C047F9AC);
}

uint64_t sub_1C0483E3C(uint64_t a1)
{
  return sub_1C0483E50(a1, type metadata accessor for Interaction, (uint64_t)sub_1C047FAFC);
}

uint64_t sub_1C0483E50(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  if (*(_QWORD *)(a1 + 16) > 1uLL)
  {
    v9 = sub_1C04870C4();
    v6 = OUTLINED_FUNCTION_9();
    sub_1C0483C38(v6, (uint64_t)&v9, a2, a3);
    v3 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_9();
  }
  return v3;
}

uint64_t OUTLINED_FUNCTION_2_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 - 144))(a1, a2, 1);
}

uint64_t NowPlayingEventSource.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  _QWORD *v6;

  if (qword_1ED7399B0 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED73CBF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
  result = OUTLINED_FUNCTION_3_22();
  v5 = (_QWORD *)(a1 + *(int *)(result + 20));
  *v5 = 0xD000000000000015;
  v5[1] = 0x80000001C048F2F0;
  v6 = (_QWORD *)(a1 + *(int *)(result + 24));
  *v6 = 0x6979616C50776F4ELL;
  v6[1] = 0xEA0000000000676ELL;
  return result;
}

uint64_t sub_1C0483FA8()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  __swift_allocate_value_buffer(v0, qword_1ED73CBF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED73CBF8);
  sub_1C0484C88();
  return sub_1C048614C();
}

uint64_t type metadata accessor for NowPlayingEventSource()
{
  uint64_t result;

  result = qword_1ED7399B8;
  if (!qword_1ED7399B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t NowPlayingEventSource.id.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_1_31();
  return v0;
}

uint64_t NowPlayingEventSource.biomeStreamIdentifier.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_1_31();
  return v0;
}

uint64_t NowPlayingEventSource.aggregatedEvents(since:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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

  v37 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012D8);
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_7();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012E0);
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_7();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012E8);
  v32 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_43();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_7();
  v17 = v16 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED739D20);
  OUTLINED_FUNCTION_43();
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v31 - v22;
  v24 = sub_1C04860B0();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_7();
  v28 = v27 - v26;
  sub_1C04787D8(a1, (uint64_t)v21);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v24) == 1)
  {
    sub_1C0410FD0((uint64_t)v21);
    OUTLINED_FUNCTION_4_19((uint64_t)v23, 1);
  }
  else
  {
    sub_1C0486020();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v24);
    OUTLINED_FUNCTION_4_19((uint64_t)v23, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v28, v23, v24);
      goto LABEL_6;
    }
  }
  sub_1C0485FFC();
  sub_1C0410FD0((uint64_t)v23);
LABEL_6:
  sub_1C0486008();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  sub_1C0484D98(&qword_1EF6012F0, &qword_1ED7397D0, MEMORY[0x1E0D02538]);
  sub_1C0486158();
  sub_1C0484D98(&qword_1EF6012F8, &qword_1EF6012E8, MEMORY[0x1E0D023D8]);
  v29 = sub_1C0486128();
  MEMORY[0x1E0C80A78](v29);
  *(&v31 - 2) = v12;
  type metadata accessor for AggregatedEvent();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v7, *MEMORY[0x1E0DF07B8], v34);
  sub_1C0487058();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v17, v13);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v28, v24);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v12, v36);
}

id sub_1C04843DC(void *a1)
{
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(a1, sel_eventBody);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_playbackState);

    return (id)(v3 == (id)1);
  }
  return result;
}

void sub_1C048442C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, char *, uint64_t);
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601300);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v16 - v8;
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)v16 - v8, a1, v3);
  v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v12 = swift_allocObject();
  v13 = *(void (**)(unint64_t, char *, uint64_t))(v4 + 32);
  v13(v12 + v11, v9, v3);
  v10(v7, a1, v3);
  v14 = swift_allocObject();
  v13(v14 + v11, v7, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6012E0);
  sub_1C0484D98(&qword_1EF601308, &qword_1EF6012E0, MEMORY[0x1E0D02378]);
  v15 = (void *)sub_1C048611C();
  swift_release();
  swift_release();

}

void sub_1C04845C4(uint64_t a1)
{
  uint64_t v1;

  sub_1C048442C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1C04845CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601300);
  return sub_1C0487034();
}

id sub_1C04845F8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id result;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for AggregatedEvent();
  MEMORY[0x1E0C80A78](v2);
  v4 = (uint64_t *)((char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601310);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_eventBody);
  if (result)
  {
    v10 = result;
    v11 = objc_msgSend(result, sel_bundleID);
    v19 = v5;
    v12 = v11;
    v13 = sub_1C0486D58();
    v15 = v14;

    objc_msgSend(v10, sel_absoluteTimestamp);
    v17 = v16;
    objc_msgSend(a1, sel_timestamp);
    sub_1C0485FFC();
    *v4 = v13;
    v4[1] = v15;
    v4[2] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601300);
    sub_1C0487028();

    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NowPlayingEventSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for NowPlayingEventSource(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NowPlayingEventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NowPlayingEventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for NowPlayingEventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for NowPlayingEventSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NowPlayingEventSource()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C0484AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NowPlayingEventSource()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C0484B44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7397D0);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

void sub_1C0484BC0()
{
  unint64_t v0;

  sub_1C0484C34();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1C0484C34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7397D8)
  {
    sub_1C0484C88();
    v0 = sub_1C0486140();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7397D8);
  }
}

unint64_t sub_1C0484C88()
{
  unint64_t result;

  result = qword_1ED739B18;
  if (!qword_1ED739B18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED739B18);
  }
  return result;
}

uint64_t sub_1C0484CC8(uint64_t a1)
{
  return sub_1C0484D48(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1C04845CC);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601300);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1C0484D3C(uint64_t a1)
{
  return sub_1C0484D48(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1C04845F8);
}

uint64_t sub_1C0484D48(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF601300) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_1C0484D98(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3B9BEA0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_22()
{
  return type metadata accessor for NowPlayingEventSource();
}

uint64_t OUTLINED_FUNCTION_4_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t dispatch thunk of AggregatedEventSource.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AggregatedEventSource.aggregatedEvents(since:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1C0484DFC(char a1, void (*a2)(), uint64_t a3)
{
  id v6;
  id v7;
  _QWORD *v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  char **v37;
  id v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 aBlock;
  void *v51;
  void *v52;
  void (*v53)();
  uint64_t v54;

  sub_1C048509C();
  v6 = sub_1C04850D8(0xD000000000000022, 0x80000001C0491C40, 4096);
  v7 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EF610A38);
  OUTLINED_FUNCTION_0_25((uint64_t)v7, sel_setRemoteObjectInterface_);

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = a2;
  v8[4] = a3;
  v9 = MEMORY[0x1E0C809B0];
  OUTLINED_FUNCTION_2_27((int)v8, v10, v11, v12, v13, v14, v15, v16, v40, v43, v47, *((uint64_t *)&v47 + 1), v48, v49, MEMORY[0x1E0C809B0]);
  v17 = OUTLINED_FUNCTION_3_23();
  swift_retain();
  v18 = swift_release();
  OUTLINED_FUNCTION_0_25(v18, sel_setInterruptionHandler_);
  _Block_release(v7);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  v53 = sub_1C04856C0;
  v54 = v19;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v51 = sub_1C04447F8;
  v52 = &block_descriptor_6_1;
  OUTLINED_FUNCTION_2_27(v19, v20, v21, v22, v23, v24, v25, v26, v41, v44, v47, *((uint64_t *)&v47 + 1), v48, v49, v9);
  v27 = OUTLINED_FUNCTION_3_23();
  v28 = swift_release();
  OUTLINED_FUNCTION_0_25(v28, sel_setInvalidationHandler_);
  _Block_release(v7);
  v29 = objc_msgSend(v27, sel_resume);
  if ((a1 & 1) != 0)
  {
    v53 = a2;
    v54 = a3;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v51 = sub_1C041B440;
    v52 = &block_descriptor_12_0;
    OUTLINED_FUNCTION_2_27(v29, v30, v31, v32, v33, v34, v35, v36, v42, v45, v47, *((uint64_t *)&v47 + 1), v48, v49, v9);
    OUTLINED_FUNCTION_1_32();
    swift_release();
    v37 = &selRef_remoteObjectProxyWithErrorHandler_;
  }
  else
  {
    v53 = a2;
    v54 = a3;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v51 = sub_1C041B440;
    v52 = &block_descriptor_9_1;
    OUTLINED_FUNCTION_2_27(v29, v30, v31, v32, v33, v34, v35, v36, v42, v45, v47, *((uint64_t *)&v47 + 1), v48, v49, v9);
    OUTLINED_FUNCTION_1_32();
    swift_release();
    v37 = &selRef_synchronousRemoteObjectProxyWithErrorHandler_;
  }
  v38 = objc_msgSend(v27, *v37, a2);
  _Block_release(a2);
  sub_1C0487298();
  swift_unknownObjectRelease();

  sub_1C0415FE8(&aBlock, &v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF601320);
  swift_dynamicCast();
  return v46;
}

unint64_t sub_1C048509C()
{
  unint64_t result;

  result = qword_1EF601318;
  if (!qword_1EF601318)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF601318);
  }
  return result;
}

id sub_1C04850D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1C0486D4C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

void sub_1C0485150(void *a1, void (*a2)(void *, _BYTE *))
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  _BYTE *v14;
  uint64_t v15;

  v3 = objc_msgSend(a1, sel__xpcConnection);
  v4 = xpc_connection_copy_invalidation_reason();
  swift_unknownObjectRelease();
  if (v4)
  {
    v5 = sub_1C0486E6C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0xE000000000000000;
  }
  if (qword_1ED73AAD0 != -1)
    swift_once();
  v8 = sub_1C0486BE4();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED73CCE8);
  swift_bridgeObjectRetain();
  v9 = sub_1C0486BD8();
  v10 = sub_1C0487148();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C0414ADC(v5, v7, &v15);
    sub_1C048725C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C03F3000, v9, v10, "XPC connection interrupted: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B9BF6C](v12, -1, -1);
    MEMORY[0x1C3B9BF6C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1C04856C8();
  v13 = (void *)swift_allocError();
  *v14 = 0;
  a2(v13, v14);

}

void sub_1C048536C(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(a1, sel__xpcConnection);
  v2 = xpc_connection_copy_invalidation_reason();
  swift_unknownObjectRelease();
  if (v2)
  {
    v3 = sub_1C0486E6C();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  if (qword_1ED73AAD0 != -1)
    swift_once();
  v6 = sub_1C0486BE4();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED73CCE8);
  swift_bridgeObjectRetain();
  v7 = sub_1C0486BD8();
  v8 = sub_1C0487148();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C0414ADC(v3, v5, &v11);
    sub_1C048725C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C03F3000, v7, v8, "XPC connection invalidated: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B9BF6C](v10, -1, -1);
    MEMORY[0x1C3B9BF6C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_1C0485544()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_1C0487400();
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

uint64_t sub_1C0485594(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F707365526F6ELL;
  else
    return 0xD000000000000015;
}

void sub_1C04855D4(char *a1, char *a2)
{
  sub_1C040269C(*a1, *a2);
}

void sub_1C04855E0()
{
  sub_1C047C47C();
}

uint64_t sub_1C04855E8()
{
  return sub_1C047C488();
}

void sub_1C04855F0()
{
  sub_1C047CA20();
}

uint64_t sub_1C04855F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C0485544();
  *a1 = result;
  return result;
}

uint64_t sub_1C0485624@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1C0485594(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1C048564C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1C0485678()
{
  uint64_t v0;

  sub_1C0485150(*(void **)(v0 + 16), *(void (**)(void *, _BYTE *))(v0 + 24));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1C048569C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1C04856C0()
{
  uint64_t v0;

  sub_1C048536C(*(void **)(v0 + 16));
}

unint64_t sub_1C04856C8()
{
  unint64_t result;

  result = qword_1EF601328;
  if (!qword_1EF601328)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F450, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_1EF601328);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for XPCError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C0485750 + 4 * byte_1C048F38D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C0485784 + 4 * byte_1C048F388[v4]))();
}

uint64_t sub_1C0485784(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C048578C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C0485794);
  return result;
}

uint64_t sub_1C04857A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C04857A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C04857AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C04857B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

unint64_t sub_1C04857D4()
{
  unint64_t result;

  result = qword_1EF601330;
  if (!qword_1EF601330)
  {
    result = MEMORY[0x1C3B9BEA0](&unk_1C048F428, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_1EF601330);
  }
  return result;
}

id OUTLINED_FUNCTION_0_25(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void *OUTLINED_FUNCTION_2_27(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char aBlock)
{
  return _Block_copy(&aBlock);
}

id OUTLINED_FUNCTION_3_23()
{
  void *v0;

  return v0;
}

uint64_t sub_1C0485848(uint64_t a1)
{
  uint64_t inited;
  _QWORD v4[4];

  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF600448);
  v4[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED739B88);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C04881A0;
  *(_QWORD *)(inited + 32) = 0x6E65697069636572;
  *(_QWORD *)(inited + 40) = 0xEA00000000007374;
  swift_bridgeObjectRetain();
  sub_1C044A6C0((uint64_t)v4, inited);
  swift_setDeallocating();
  sub_1C041D25C();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_1C04858F4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = objc_msgSend(v0, sel_privateSearchForMediaIntentData);
  if (!v1)
    return 1;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_appInferred);

  if (!v3)
    return 1;
  v4 = objc_msgSend(v3, sel_BOOLValue);

  if (!v4)
    return 1;
  if (qword_1ED73AAD0 != -1)
    swift_once();
  v5 = sub_1C0486BE4();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED73CCE8);
  v6 = sub_1C0486BD8();
  v7 = sub_1C048713C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C03F3000, v6, v7, "INSearchForMediaIntent with appInferred; donation will be skipped", v8, 2u);
    MEMORY[0x1C3B9BF6C](v8, -1, -1);
  }

  return 0;
}

uint64_t sub_1C0485A28()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __n128 *inited;
  uint64_t v12;
  id v13;
  __n128 *v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = v0;
  v3 = type metadata accessor for Entity();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C04574F4(v2);
  if (v7)
    v8 = v7;
  else
    v8 = MEMORY[0x1E0DEE9D8];
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1C04873DC();
    OUTLINED_FUNCTION_60();
    if (v12)
      goto LABEL_6;
  }
  else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    sub_1C04557B4(v8, v2);
    v10 = v9;
    OUTLINED_FUNCTION_60();
    if (v1)
      return (uint64_t)v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A960);
    inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_3_11(inited, (__n128)xmmword_1C04881A0)[3].n128_u64[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A800);
    return sub_1C0486CE0();
  }
  v13 = OUTLINED_FUNCTION_2_28();

  OUTLINED_FUNCTION_60();
  if (!v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A800);
    return sub_1C0486CE0();
  }
  v2 = OUTLINED_FUNCTION_2_28();
  sub_1C04565F4(0, v2);

  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A960);
    v15 = (__n128 *)swift_initStackObject();
    v18 = xmmword_1C04881A0;
    OUTLINED_FUNCTION_3_11(v15, (__n128)xmmword_1C04881A0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A930);
    v16 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = v18;
    sub_1C041C9D4((uint64_t)v6, v17 + v16);
    v15[3].n128_u64[0] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED73A800);
    v2 = (id)sub_1C0486CE0();
    sub_1C041CA18((uint64_t)v6);
  }
  return (uint64_t)v2;
}

uint64_t sub_1C0485C94()
{
  return sub_1C04858F4() & 1;
}

uint64_t sub_1C0485CB8()
{
  return sub_1C0485A28();
}

id OUTLINED_FUNCTION_2_28()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 718));
}

uint64_t sub_1C0485CE4()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1C0485CF0()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1C0485CFC()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1C0485D08()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1C0485D14()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1C0485D20()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1C0485D2C()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_1C0485D38()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1C0485D44()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_1C0485D50()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1C0485D5C()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1C0485D68()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1C0485D74()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1C0485D80()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1C0485D8C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1C0485D98()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1C0485DA4()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1C0485DB0()
{
  return MEMORY[0x1E0CAE930]();
}

uint64_t sub_1C0485DBC()
{
  return MEMORY[0x1E0CAE940]();
}

uint64_t sub_1C0485DC8()
{
  return MEMORY[0x1E0CAE968]();
}

uint64_t sub_1C0485DD4()
{
  return MEMORY[0x1E0CAE978]();
}

uint64_t sub_1C0485DE0()
{
  return MEMORY[0x1E0CAE990]();
}

uint64_t sub_1C0485DEC()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1C0485DF8()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1C0485E04()
{
  return MEMORY[0x1E0CAE9D8]();
}

uint64_t sub_1C0485E10()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1C0485E1C()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1C0485E28()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1C0485E34()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1C0485E40()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1C0485E4C()
{
  return MEMORY[0x1E0CAEA58]();
}

uint64_t sub_1C0485E58()
{
  return MEMORY[0x1E0CAEA68]();
}

uint64_t sub_1C0485E64()
{
  return MEMORY[0x1E0CAEA88]();
}

uint64_t sub_1C0485E70()
{
  return MEMORY[0x1E0CAEAA0]();
}

uint64_t sub_1C0485E7C()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1C0485E88()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1C0485E94()
{
  return MEMORY[0x1E0CAF6F0]();
}

uint64_t sub_1C0485EA0()
{
  return MEMORY[0x1E0CAF700]();
}

uint64_t sub_1C0485EAC()
{
  return MEMORY[0x1E0CAF710]();
}

uint64_t sub_1C0485EB8()
{
  return MEMORY[0x1E0CAF728]();
}

uint64_t sub_1C0485EC4()
{
  return MEMORY[0x1E0CAF738]();
}

uint64_t sub_1C0485ED0()
{
  return MEMORY[0x1E0CAF768]();
}

uint64_t sub_1C0485EDC()
{
  return MEMORY[0x1E0CAF770]();
}

uint64_t sub_1C0485EE8()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1C0485EF4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C0485F00()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1C0485F0C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1C0485F18()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1C0485F24()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1C0485F30()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1C0485F3C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1C0485F48()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1C0485F54()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1C0485F60()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1C0485F6C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1C0485F78()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1C0485F84()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t sub_1C0485F90()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1C0485F9C()
{
  return MEMORY[0x1E0CB0098]();
}

uint64_t sub_1C0485FA8()
{
  return MEMORY[0x1E0CB00F8]();
}

uint64_t sub_1C0485FB4()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1C0485FC0()
{
  return MEMORY[0x1E0CB0178]();
}

uint64_t sub_1C0485FCC()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1C0485FD8()
{
  return MEMORY[0x1E0CB01B8]();
}

uint64_t sub_1C0485FE4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C0485FF0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C0485FFC()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1C0486008()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1C0486014()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1C0486020()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1C048602C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1C0486038()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1C0486044()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1C0486050()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1C048605C()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1C0486068()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1C0486074()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1C0486080()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1C048608C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1C0486098()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1C04860A4()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C04860B0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C04860BC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C04860C8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C04860D4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C04860E0()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1C04860EC()
{
  return MEMORY[0x1E0CB0F28]();
}

uint64_t sub_1C04860F8()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1C0486104()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1C0486110()
{
  return MEMORY[0x1E0DEFCD0]();
}

uint64_t sub_1C048611C()
{
  return MEMORY[0x1E0D02398]();
}

uint64_t sub_1C0486128()
{
  return MEMORY[0x1E0D023A8]();
}

uint64_t sub_1C0486134()
{
  return MEMORY[0x1E0D023E8]();
}

uint64_t sub_1C0486140()
{
  return MEMORY[0x1E0D02510]();
}

uint64_t sub_1C048614C()
{
  return MEMORY[0x1E0D02530]();
}

uint64_t sub_1C0486158()
{
  return MEMORY[0x1E0D02548]();
}

uint64_t sub_1C0486164()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1C0486170()
{
  return MEMORY[0x1E0D235E0]();
}

uint64_t sub_1C048617C()
{
  return MEMORY[0x1E0D235E8]();
}

uint64_t sub_1C0486188()
{
  return MEMORY[0x1E0D235F0]();
}

uint64_t sub_1C0486194()
{
  return MEMORY[0x1E0D23600]();
}

uint64_t sub_1C04861A0()
{
  return MEMORY[0x1E0D23608]();
}

uint64_t sub_1C04861AC()
{
  return MEMORY[0x1E0D23618]();
}

uint64_t sub_1C04861B8()
{
  return MEMORY[0x1E0D23628]();
}

uint64_t sub_1C04861C4()
{
  return MEMORY[0x1E0D23640]();
}

uint64_t sub_1C04861D0()
{
  return MEMORY[0x1E0D236A0]();
}

uint64_t sub_1C04861DC()
{
  return MEMORY[0x1E0D236B0]();
}

uint64_t sub_1C04861E8()
{
  return MEMORY[0x1E0D23708]();
}

uint64_t sub_1C04861F4()
{
  return MEMORY[0x1E0D23868]();
}

uint64_t sub_1C0486200()
{
  return MEMORY[0x1E0D23918]();
}

uint64_t sub_1C048620C()
{
  return MEMORY[0x1E0D23940]();
}

uint64_t sub_1C0486218()
{
  return MEMORY[0x1E0D23948]();
}

uint64_t sub_1C0486224()
{
  return MEMORY[0x1E0D23960]();
}

uint64_t sub_1C0486230()
{
  return MEMORY[0x1E0D23968]();
}

uint64_t sub_1C048623C()
{
  return MEMORY[0x1E0D23978]();
}

uint64_t sub_1C0486248()
{
  return MEMORY[0x1E0D23980]();
}

uint64_t sub_1C0486254()
{
  return MEMORY[0x1E0D23988]();
}

uint64_t sub_1C0486260()
{
  return MEMORY[0x1E0D239F0]();
}

uint64_t sub_1C048626C()
{
  return MEMORY[0x1E0D23A10]();
}

uint64_t sub_1C0486278()
{
  return MEMORY[0x1E0D23A18]();
}

uint64_t sub_1C0486284()
{
  return MEMORY[0x1E0D23A28]();
}

uint64_t sub_1C0486290()
{
  return MEMORY[0x1E0D23A30]();
}

uint64_t sub_1C048629C()
{
  return MEMORY[0x1E0D23A40]();
}

uint64_t sub_1C04862A8()
{
  return MEMORY[0x1E0D23A48]();
}

uint64_t sub_1C04862B4()
{
  return MEMORY[0x1E0D23A50]();
}

uint64_t sub_1C04862C0()
{
  return MEMORY[0x1E0D23A60]();
}

uint64_t sub_1C04862CC()
{
  return MEMORY[0x1E0D23A88]();
}

uint64_t sub_1C04862D8()
{
  return MEMORY[0x1E0D23AE8]();
}

uint64_t sub_1C04862E4()
{
  return MEMORY[0x1E0D23AF8]();
}

uint64_t sub_1C04862F0()
{
  return MEMORY[0x1E0D23B28]();
}

uint64_t sub_1C04862FC()
{
  return MEMORY[0x1E0D23B38]();
}

uint64_t sub_1C0486308()
{
  return MEMORY[0x1E0D23B40]();
}

uint64_t sub_1C0486314()
{
  return MEMORY[0x1E0D23B48]();
}

uint64_t sub_1C0486320()
{
  return MEMORY[0x1E0D23BA0]();
}

uint64_t sub_1C048632C()
{
  return MEMORY[0x1E0D23BF0]();
}

uint64_t sub_1C0486338()
{
  return MEMORY[0x1E0D23C10]();
}

uint64_t sub_1C0486344()
{
  return MEMORY[0x1E0D23C28]();
}

uint64_t sub_1C0486350()
{
  return MEMORY[0x1E0D23C30]();
}

uint64_t sub_1C048635C()
{
  return MEMORY[0x1E0D23C58]();
}

uint64_t sub_1C0486368()
{
  return MEMORY[0x1E0D23C60]();
}

uint64_t sub_1C0486374()
{
  return MEMORY[0x1E0D23C68]();
}

uint64_t sub_1C0486380()
{
  return MEMORY[0x1E0D23C70]();
}

uint64_t sub_1C048638C()
{
  return MEMORY[0x1E0D23C78]();
}

uint64_t sub_1C0486398()
{
  return MEMORY[0x1E0D23C88]();
}

uint64_t sub_1C04863A4()
{
  return MEMORY[0x1E0D23C90]();
}

uint64_t sub_1C04863B0()
{
  return MEMORY[0x1E0D23CB8]();
}

uint64_t sub_1C04863BC()
{
  return MEMORY[0x1E0D23CE0]();
}

uint64_t sub_1C04863C8()
{
  return MEMORY[0x1E0D23D00]();
}

uint64_t sub_1C04863D4()
{
  return MEMORY[0x1E0D23D08]();
}

uint64_t sub_1C04863E0()
{
  return MEMORY[0x1E0D23D10]();
}

uint64_t sub_1C04863EC()
{
  return MEMORY[0x1E0D23D18]();
}

uint64_t sub_1C04863F8()
{
  return MEMORY[0x1E0D23D20]();
}

uint64_t sub_1C0486404()
{
  return MEMORY[0x1E0D23D28]();
}

uint64_t sub_1C0486410()
{
  return MEMORY[0x1E0D23D40]();
}

uint64_t sub_1C048641C()
{
  return MEMORY[0x1E0D23D60]();
}

uint64_t sub_1C0486428()
{
  return MEMORY[0x1E0D23D70]();
}

uint64_t sub_1C0486434()
{
  return MEMORY[0x1E0D23DC8]();
}

uint64_t sub_1C0486440()
{
  return MEMORY[0x1E0D23DE0]();
}

uint64_t sub_1C048644C()
{
  return MEMORY[0x1E0D23E10]();
}

uint64_t sub_1C0486458()
{
  return MEMORY[0x1E0D23E68]();
}

uint64_t sub_1C0486464()
{
  return MEMORY[0x1E0D23E70]();
}

uint64_t sub_1C0486470()
{
  return MEMORY[0x1E0D23E78]();
}

uint64_t sub_1C048647C()
{
  return MEMORY[0x1E0D23E80]();
}

uint64_t sub_1C0486488()
{
  return MEMORY[0x1E0D23E88]();
}

uint64_t sub_1C0486494()
{
  return MEMORY[0x1E0D23E90]();
}

uint64_t sub_1C04864A0()
{
  return MEMORY[0x1E0D23EB0]();
}

uint64_t sub_1C04864AC()
{
  return MEMORY[0x1E0D23EB8]();
}

uint64_t sub_1C04864B8()
{
  return MEMORY[0x1E0D23EC0]();
}

uint64_t sub_1C04864C4()
{
  return MEMORY[0x1E0D23EC8]();
}

uint64_t sub_1C04864D0()
{
  return MEMORY[0x1E0D23EF8]();
}

uint64_t sub_1C04864DC()
{
  return MEMORY[0x1E0D23F00]();
}

uint64_t sub_1C04864E8()
{
  return MEMORY[0x1E0D23F08]();
}

uint64_t sub_1C04864F4()
{
  return MEMORY[0x1E0D23F18]();
}

uint64_t sub_1C0486500()
{
  return MEMORY[0x1E0D23F20]();
}

uint64_t sub_1C048650C()
{
  return MEMORY[0x1E0D23F28]();
}

uint64_t sub_1C0486518()
{
  return MEMORY[0x1E0D23F38]();
}

uint64_t sub_1C0486524()
{
  return MEMORY[0x1E0D23F40]();
}

uint64_t sub_1C0486530()
{
  return MEMORY[0x1E0D23F58]();
}

uint64_t sub_1C048653C()
{
  return MEMORY[0x1E0D23F60]();
}

uint64_t sub_1C0486548()
{
  return MEMORY[0x1E0D23F68]();
}

uint64_t sub_1C0486554()
{
  return MEMORY[0x1E0D23F70]();
}

uint64_t sub_1C0486560()
{
  return MEMORY[0x1E0D23F78]();
}

uint64_t sub_1C048656C()
{
  return MEMORY[0x1E0D23F80]();
}

uint64_t sub_1C0486578()
{
  return MEMORY[0x1E0D23F88]();
}

uint64_t sub_1C0486584()
{
  return MEMORY[0x1E0D23FA0]();
}

uint64_t sub_1C0486590()
{
  return MEMORY[0x1E0D23FA8]();
}

uint64_t sub_1C048659C()
{
  return MEMORY[0x1E0D23FB0]();
}

uint64_t sub_1C04865A8()
{
  return MEMORY[0x1E0D23FB8]();
}

uint64_t sub_1C04865B4()
{
  return MEMORY[0x1E0D23FC8]();
}

uint64_t sub_1C04865C0()
{
  return MEMORY[0x1E0D23FD0]();
}

uint64_t sub_1C04865CC()
{
  return MEMORY[0x1E0D23FE0]();
}

uint64_t sub_1C04865D8()
{
  return MEMORY[0x1E0D24010]();
}

uint64_t sub_1C04865E4()
{
  return MEMORY[0x1E0D24020]();
}

uint64_t sub_1C04865F0()
{
  return MEMORY[0x1E0D24028]();
}

uint64_t sub_1C04865FC()
{
  return MEMORY[0x1E0D24030]();
}

uint64_t sub_1C0486608()
{
  return MEMORY[0x1E0D24038]();
}

uint64_t sub_1C0486614()
{
  return MEMORY[0x1E0D24050]();
}

uint64_t sub_1C0486620()
{
  return MEMORY[0x1E0D24070]();
}

uint64_t sub_1C048662C()
{
  return MEMORY[0x1E0D24078]();
}

uint64_t sub_1C0486638()
{
  return MEMORY[0x1E0D24080]();
}

uint64_t sub_1C0486644()
{
  return MEMORY[0x1E0D24088]();
}

uint64_t sub_1C0486650()
{
  return MEMORY[0x1E0D24098]();
}

uint64_t sub_1C048665C()
{
  return MEMORY[0x1E0D240A0]();
}

uint64_t sub_1C0486668()
{
  return MEMORY[0x1E0D240A8]();
}

uint64_t sub_1C0486674()
{
  return MEMORY[0x1E0D240B0]();
}

uint64_t sub_1C0486680()
{
  return MEMORY[0x1E0D240B8]();
}

uint64_t sub_1C048668C()
{
  return MEMORY[0x1E0D240C0]();
}

uint64_t sub_1C0486698()
{
  return MEMORY[0x1E0D240D8]();
}

uint64_t sub_1C04866A4()
{
  return MEMORY[0x1E0D240E0]();
}

uint64_t sub_1C04866B0()
{
  return MEMORY[0x1E0D240E8]();
}

uint64_t sub_1C04866BC()
{
  return MEMORY[0x1E0D240F8]();
}

uint64_t sub_1C04866C8()
{
  return MEMORY[0x1E0D24130]();
}

uint64_t sub_1C04866D4()
{
  return MEMORY[0x1E0D24148]();
}

uint64_t sub_1C04866E0()
{
  return MEMORY[0x1E0D24150]();
}

uint64_t sub_1C04866EC()
{
  return MEMORY[0x1E0D24178]();
}

uint64_t sub_1C04866F8()
{
  return MEMORY[0x1E0D241A8]();
}

uint64_t sub_1C0486704()
{
  return MEMORY[0x1E0D241B0]();
}

uint64_t sub_1C0486710()
{
  return MEMORY[0x1E0D241E0]();
}

uint64_t sub_1C048671C()
{
  return MEMORY[0x1E0D241E8]();
}

uint64_t sub_1C0486728()
{
  return MEMORY[0x1E0D24230]();
}

uint64_t sub_1C0486734()
{
  return MEMORY[0x1E0D24238]();
}

uint64_t sub_1C0486740()
{
  return MEMORY[0x1E0D24248]();
}

uint64_t sub_1C048674C()
{
  return MEMORY[0x1E0D24260]();
}

uint64_t sub_1C0486758()
{
  return MEMORY[0x1E0D242E0]();
}

uint64_t sub_1C0486764()
{
  return MEMORY[0x1E0D24300]();
}

uint64_t sub_1C0486770()
{
  return MEMORY[0x1E0D24340]();
}

uint64_t sub_1C048677C()
{
  return MEMORY[0x1E0D24348]();
}

uint64_t sub_1C0486788()
{
  return MEMORY[0x1E0D24378]();
}

uint64_t sub_1C0486794()
{
  return MEMORY[0x1E0D24390]();
}

uint64_t sub_1C04867A0()
{
  return MEMORY[0x1E0D24398]();
}

uint64_t sub_1C04867AC()
{
  return MEMORY[0x1E0D243A0]();
}

uint64_t sub_1C04867B8()
{
  return MEMORY[0x1E0D243B8]();
}

uint64_t sub_1C04867C4()
{
  return MEMORY[0x1E0D243C8]();
}

uint64_t sub_1C04867D0()
{
  return MEMORY[0x1E0D243D8]();
}

uint64_t sub_1C04867DC()
{
  return MEMORY[0x1E0D243F8]();
}

uint64_t sub_1C04867E8()
{
  return MEMORY[0x1E0D24408]();
}

uint64_t sub_1C04867F4()
{
  return MEMORY[0x1E0D24410]();
}

uint64_t sub_1C0486800()
{
  return MEMORY[0x1E0D24420]();
}

uint64_t sub_1C048680C()
{
  return MEMORY[0x1E0D24488]();
}

uint64_t sub_1C0486818()
{
  return MEMORY[0x1E0D244F0]();
}

uint64_t sub_1C0486824()
{
  return MEMORY[0x1E0D24500]();
}

uint64_t sub_1C0486830()
{
  return MEMORY[0x1E0D24508]();
}

uint64_t sub_1C048683C()
{
  return MEMORY[0x1E0D24510]();
}

uint64_t sub_1C0486848()
{
  return MEMORY[0x1E0D24518]();
}

uint64_t sub_1C0486854()
{
  return MEMORY[0x1E0D24538]();
}

uint64_t sub_1C0486860()
{
  return MEMORY[0x1E0D24560]();
}

uint64_t sub_1C048686C()
{
  return MEMORY[0x1E0D24578]();
}

uint64_t sub_1C0486878()
{
  return MEMORY[0x1E0D24580]();
}

uint64_t sub_1C0486884()
{
  return MEMORY[0x1E0D24598]();
}

uint64_t sub_1C0486890()
{
  return MEMORY[0x1E0D245B0]();
}

uint64_t sub_1C048689C()
{
  return MEMORY[0x1E0D245B8]();
}

uint64_t sub_1C04868A8()
{
  return MEMORY[0x1E0D24640]();
}

uint64_t sub_1C04868B4()
{
  return MEMORY[0x1E0D24670]();
}

uint64_t sub_1C04868C0()
{
  return MEMORY[0x1E0D24678]();
}

uint64_t sub_1C04868CC()
{
  return MEMORY[0x1E0D246F0]();
}

uint64_t sub_1C04868D8()
{
  return MEMORY[0x1E0D246F8]();
}

uint64_t sub_1C04868E4()
{
  return MEMORY[0x1E0D24700]();
}

uint64_t sub_1C04868F0()
{
  return MEMORY[0x1E0D24708]();
}

uint64_t sub_1C04868FC()
{
  return MEMORY[0x1E0D24710]();
}

uint64_t sub_1C0486908()
{
  return MEMORY[0x1E0D24718]();
}

uint64_t sub_1C0486914()
{
  return MEMORY[0x1E0D24728]();
}

uint64_t sub_1C0486920()
{
  return MEMORY[0x1E0D24758]();
}

uint64_t sub_1C048692C()
{
  return MEMORY[0x1E0D24760]();
}

uint64_t sub_1C0486938()
{
  return MEMORY[0x1E0D24768]();
}

uint64_t sub_1C0486944()
{
  return MEMORY[0x1E0D24780]();
}

uint64_t sub_1C0486950()
{
  return MEMORY[0x1E0D247C8]();
}

uint64_t sub_1C048695C()
{
  return MEMORY[0x1E0D247E0]();
}

uint64_t sub_1C0486968()
{
  return MEMORY[0x1E0D24800]();
}

uint64_t sub_1C0486974()
{
  return MEMORY[0x1E0D24828]();
}

uint64_t sub_1C0486980()
{
  return MEMORY[0x1E0D24838]();
}

uint64_t sub_1C048698C()
{
  return MEMORY[0x1E0D24840]();
}

uint64_t sub_1C0486998()
{
  return MEMORY[0x1E0D24848]();
}

uint64_t sub_1C04869A4()
{
  return MEMORY[0x1E0D24850]();
}

uint64_t sub_1C04869B0()
{
  return MEMORY[0x1E0D24858]();
}

uint64_t sub_1C04869BC()
{
  return MEMORY[0x1E0D24868]();
}

uint64_t sub_1C04869C8()
{
  return MEMORY[0x1E0D24880]();
}

uint64_t sub_1C04869D4()
{
  return MEMORY[0x1E0D24910]();
}

uint64_t sub_1C04869E0()
{
  return MEMORY[0x1E0D24918]();
}

uint64_t sub_1C04869EC()
{
  return MEMORY[0x1E0D24920]();
}

uint64_t sub_1C04869F8()
{
  return MEMORY[0x1E0D24928]();
}

uint64_t sub_1C0486A04()
{
  return MEMORY[0x1E0D3BC78]();
}

uint64_t sub_1C0486A10()
{
  return MEMORY[0x1E0D3BC80]();
}

uint64_t sub_1C0486A1C()
{
  return MEMORY[0x1E0D3BC90]();
}

uint64_t sub_1C0486A28()
{
  return MEMORY[0x1E0D3BCC8]();
}

uint64_t sub_1C0486A34()
{
  return MEMORY[0x1E0D3BCD0]();
}

uint64_t sub_1C0486A40()
{
  return MEMORY[0x1E0D3BCD8]();
}

uint64_t sub_1C0486A4C()
{
  return MEMORY[0x1E0D3BCE8]();
}

uint64_t sub_1C0486A58()
{
  return MEMORY[0x1E0D3BCF0]();
}

uint64_t sub_1C0486A64()
{
  return MEMORY[0x1E0D3BCF8]();
}

uint64_t sub_1C0486A70()
{
  return MEMORY[0x1E0D3BD08]();
}

uint64_t sub_1C0486A7C()
{
  return MEMORY[0x1E0D3BD10]();
}

uint64_t sub_1C0486A88()
{
  return MEMORY[0x1E0D3BD18]();
}

uint64_t sub_1C0486A94()
{
  return MEMORY[0x1E0D3BD20]();
}

uint64_t sub_1C0486AA0()
{
  return MEMORY[0x1E0D3BD28]();
}

uint64_t sub_1C0486AAC()
{
  return MEMORY[0x1E0D3BD30]();
}

uint64_t sub_1C0486AB8()
{
  return MEMORY[0x1E0D3BD38]();
}

uint64_t sub_1C0486AC4()
{
  return MEMORY[0x1E0D3BD40]();
}

uint64_t sub_1C0486AD0()
{
  return MEMORY[0x1E0D3BD50]();
}

uint64_t sub_1C0486ADC()
{
  return MEMORY[0x1E0D3BD70]();
}

uint64_t sub_1C0486AE8()
{
  return MEMORY[0x1E0D3BD90]();
}

uint64_t sub_1C0486AF4()
{
  return MEMORY[0x1E0D3BD98]();
}

uint64_t sub_1C0486B00()
{
  return MEMORY[0x1E0D3BDE0]();
}

uint64_t sub_1C0486B0C()
{
  return MEMORY[0x1E0D3BDE8]();
}

uint64_t sub_1C0486B18()
{
  return MEMORY[0x1E0D3BDF0]();
}

uint64_t sub_1C0486B24()
{
  return MEMORY[0x1E0D3BE10]();
}

uint64_t sub_1C0486B30()
{
  return MEMORY[0x1E0D3BE18]();
}

uint64_t sub_1C0486B3C()
{
  return MEMORY[0x1E0D3BE28]();
}

uint64_t sub_1C0486B48()
{
  return MEMORY[0x1E0D3BE40]();
}

uint64_t sub_1C0486B54()
{
  return MEMORY[0x1E0D3BE50]();
}

uint64_t sub_1C0486B60()
{
  return MEMORY[0x1E0D3BFF8]();
}

uint64_t sub_1C0486B6C()
{
  return MEMORY[0x1E0D3C010]();
}

uint64_t sub_1C0486B78()
{
  return MEMORY[0x1E0D3C018]();
}

uint64_t sub_1C0486B84()
{
  return MEMORY[0x1E0D3C020]();
}

uint64_t sub_1C0486B90()
{
  return MEMORY[0x1E0D98868]();
}

uint64_t sub_1C0486B9C()
{
  return MEMORY[0x1E0D98878]();
}

uint64_t sub_1C0486BA8()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1C0486BB4()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1C0486BC0()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1C0486BCC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C0486BD8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C0486BE4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C0486BF0()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1C0486BFC()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1C0486C08()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1C0486C14()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C0486C20()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1C0486C2C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C0486C38()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1C0486C44()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C0486C50()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1C0486C5C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1C0486C68()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1C0486C74()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1C0486C80()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1C0486C8C()
{
  return MEMORY[0x1E0CA9920]();
}

uint64_t sub_1C0486C98()
{
  return MEMORY[0x1E0CA9938]();
}

uint64_t sub_1C0486CA4()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1C0486CB0()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1C0486CBC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C0486CC8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C0486CD4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1C0486CE0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C0486CEC()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1C0486CF8()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1C0486D04()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1C0486D10()
{
  return MEMORY[0x1E0DEA2B8]();
}

uint64_t sub_1C0486D1C()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t sub_1C0486D28()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1C0486D34()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1C0486D40()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1C0486D4C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C0486D58()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C0486D64()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1C0486D70()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1C0486D7C()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1C0486D88()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1C0486D94()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C0486DA0()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1C0486DAC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1C0486DB8()
{
  return MEMORY[0x1E0D24978]();
}

uint64_t sub_1C0486DC4()
{
  return MEMORY[0x1E0D24980]();
}

uint64_t sub_1C0486DD0()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1C0486DDC()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1C0486DE8()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1C0486DF4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C0486E00()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1C0486E0C()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1C0486E18()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1C0486E24()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1C0486E30()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1C0486E3C()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1C0486E48()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C0486E54()
{
  return MEMORY[0x1E0DEA818]();
}

uint64_t sub_1C0486E60()
{
  return MEMORY[0x1E0DEA820]();
}

uint64_t sub_1C0486E6C()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1C0486E78()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1C0486E84()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C0486E90()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1C0486E9C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1C0486EA8()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1C0486EB4()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1C0486EC0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1C0486ECC()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1C0486ED8()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1C0486EE4()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1C0486EF0()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1C0486EFC()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C0486F08()
{
  return MEMORY[0x1E0D24990]();
}

uint64_t sub_1C0486F14()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1C0486F20()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_1C0486F2C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1C0486F38()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1C0486F44()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1C0486F50()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1C0486F5C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C0486F68()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C0486F74()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C0486F80()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C0486F8C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C0486F98()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1C0486FA4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C0486FB0()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1C0486FBC()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1C0486FC8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C0486FD4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1C0486FE0()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1C0486FEC()
{
  return MEMORY[0x1E0D249B8]();
}

uint64_t sub_1C0486FF8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C0487004()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1C0487010()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C048701C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C0487028()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1C0487034()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1C0487040()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1C048704C()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1C0487058()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1C0487064()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1C0487070()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1C048707C()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1C0487088()
{
  return MEMORY[0x1E0DF0900]();
}

uint64_t sub_1C0487094()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1C04870A0()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1C04870AC()
{
  return MEMORY[0x1E0D249E0]();
}

uint64_t sub_1C04870B8()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1C04870C4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1C04870D0()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1C04870DC()
{
  return MEMORY[0x1E0D24A10]();
}

uint64_t sub_1C04870E8()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1C04870F4()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1C0487100()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1C048710C()
{
  return MEMORY[0x1E0DEB5C8]();
}

uint64_t sub_1C0487118()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1C0487124()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1C0487130()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C048713C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C0487148()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C0487154()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1C0487160()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1C048716C()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1C0487178()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C0487184()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C0487190()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1C048719C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C04871A8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C04871B4()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1C04871C0()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1C04871CC()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1C04871D8()
{
  return MEMORY[0x1E0DEFA00]();
}

uint64_t sub_1C04871E4()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1C04871F0()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1C04871FC()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1C0487208()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1C0487214()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1C0487220()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1C048722C()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1C0487238()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1C0487244()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1C0487250()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C048725C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C0487268()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C0487274()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C0487280()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t sub_1C048728C()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1C0487298()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C04872A4()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1C04872B0()
{
  return MEMORY[0x1E0DEBF58]();
}

uint64_t sub_1C04872BC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C04872C8()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1C04872D4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C04872E0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C04872EC()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1C04872F8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C0487304()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C0487310()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1C048731C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C0487328()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1C0487334()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1C0487340()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1C048734C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C0487358()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C0487364()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C0487370()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1C048737C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C0487388()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C0487394()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1C04873A0()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1C04873AC()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1C04873B8()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C04873C4()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1C04873D0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C04873DC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C04873E8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C04873F4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C0487400()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C048740C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1C0487418()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1C0487424()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1C0487430()
{
  return MEMORY[0x1E0DECF90]();
}

uint64_t sub_1C048743C()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C0487448()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1C0487454()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1C0487460()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1C048746C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C0487478()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1C0487484()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1C0487490()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1C048749C()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1C04874A8()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1C04874B4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C04874C0()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1C04874CC()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1C04874D8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1C04874E4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C04874F0()
{
  return MEMORY[0x1E0DED130]();
}

uint64_t sub_1C04874FC()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1C0487508()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1C0487514()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1C0487520()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C048752C()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1C0487538()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1C0487544()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C0487550()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1C048755C()
{
  return MEMORY[0x1E0DED630]();
}

uint64_t sub_1C0487568()
{
  return MEMORY[0x1E0DED638]();
}

uint64_t sub_1C0487574()
{
  return MEMORY[0x1E0DED648]();
}

uint64_t sub_1C0487580()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1C048758C()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_1C0487598()
{
  return MEMORY[0x1E0DED6D0]();
}

uint64_t sub_1C04875A4()
{
  return MEMORY[0x1E0DED6D8]();
}

uint64_t sub_1C04875B0()
{
  return MEMORY[0x1E0DED6E8]();
}

uint64_t sub_1C04875BC()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1C04875C8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C04875D4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C04875E0()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C04875EC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C04875F8()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C0487604()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C0487610()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C048761C()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1C0487628()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C0487634()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C0487640()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1C048764C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C0487658()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t sub_1C0487664()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1C0487670()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C048767C()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1C0487688()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C0487694()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C04876A0()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1C04876AC()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t INMediaItemTypeGetName()
{
  return MEMORY[0x1E0CBD538]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x1E0CBD6C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log1p(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BD0](__x);
  return result;
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

