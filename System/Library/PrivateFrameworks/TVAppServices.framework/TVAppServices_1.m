uint64_t sub_247D889A0()
{
  sub_247D99310();
  sub_247D99328();
  return sub_247D99334();
}

uint64_t sub_247D889F8()
{
  sub_247D99310();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

void sub_247D88A9C(uint64_t a1, char a2)
{
  sub_247D99310();
  __asm { BR              X10 }
}

uint64_t sub_247D88AE8()
{
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t sub_247D88B80@<X0>(uint64_t result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  double v15;
  double v16;
  char v17;
  double v18;

  if (!result)
    goto LABEL_9;
  v8 = result;
  v9 = *a2;
  result = sub_247D73698(0x4Du, result);
  if (!v10)
    goto LABEL_9;
  v11 = result;
  v12 = v10;
  v13 = sub_247D738F4(0x50u, v8);
  if ((v14 & 1) != 0
    || (v15 = *(double *)&v13, v16 = COERCE_DOUBLE(sub_247D738F4(0x10u, v8)), (v17 & 1) != 0)
    || v15 * v16 <= 0.0)
  {
    result = swift_bridgeObjectRelease();
LABEL_9:
    *(_QWORD *)(a5 + 32) = 0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    return result;
  }
  if (v9 == 2)
  {
    v18 = v15 / v16;
  }
  else
  {
    v18 = 1.777777;
    if ((v9 & 1) != 0)
      v18 = 1.0;
  }
  *(_QWORD *)a5 = v11;
  *(_QWORD *)(a5 + 8) = v12;
  *(double *)(a5 + 16) = v18;
  *(_QWORD *)(a5 + 24) = a3;
  *(_QWORD *)(a5 + 32) = a4;
  return swift_bridgeObjectRetain();
}

uint64_t ImageTemplate.urlTemplate.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double ImageTemplate.aspectRatio.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t ImageTemplate.accessibilityText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

void AspectRatio.init(rawValue:)(char *a1@<X8>, double a2@<D0>)
{
  char v2;

  if (a2 == 1.0)
    v2 = 1;
  else
    v2 = 2;
  if (a2 == 1.777777)
    v2 = 0;
  *a1 = v2;
}

double AspectRatio.rawValue.getter()
{
  _BYTE *v0;
  double result;

  result = 1.777777;
  if (*v0)
    return 1.0;
  return result;
}

BOOL sub_247D88D1C(_BYTE *a1, _BYTE *a2)
{
  double v2;
  double v3;

  v2 = 1.777777;
  if (*a1)
    v3 = 1.0;
  else
    v3 = 1.777777;
  if (*a2)
    v2 = 1.0;
  return v3 == v2;
}

unint64_t sub_247D88D50()
{
  unint64_t result;

  result = qword_2576F8048;
  if (!qword_2576F8048)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for AspectRatio, &type metadata for AspectRatio);
    atomic_store(result, (unint64_t *)&qword_2576F8048);
  }
  return result;
}

uint64_t sub_247D88D94()
{
  return sub_247D88944();
}

uint64_t sub_247D88D9C()
{
  return sub_247D99328();
}

uint64_t sub_247D88DE0()
{
  return sub_247D889A0();
}

double *sub_247D88DE8@<X0>(double *result@<X0>, _BYTE *a2@<X8>)
{
  if (*result == 1.777777)
  {
    *a2 = 0;
  }
  else if (*result == 1.0)
  {
    *a2 = 1;
  }
  else
  {
    *a2 = 2;
  }
  return result;
}

void sub_247D88E28(double *a1@<X8>)
{
  _BYTE *v1;
  double v2;

  v2 = 1.777777;
  if (*v1)
    v2 = 1.0;
  *a1 = v2;
}

uint64_t destroy for ImageTemplate()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImageTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ImageTemplate(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ImageTemplate(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ImageTemplate()
{
  return &type metadata for ImageTemplate;
}

uint64_t storeEnumTagSinglePayload for AspectRatio(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247D88FD0 + 4 * byte_247DA045F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247D89004 + 4 * byte_247DA045A[v4]))();
}

uint64_t sub_247D89004(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D8900C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247D89014);
  return result;
}

uint64_t sub_247D89020(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247D89028);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247D8902C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D89034(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AspectRatio()
{
  return &type metadata for AspectRatio;
}

uint64_t sub_247D89050()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for MusicService();
  v0 = swift_allocObject();
  type metadata accessor for MusicAPIRequestFactory();
  swift_allocObject();
  result = sub_247D3A3A8();
  *(_QWORD *)(v0 + 16) = result;
  qword_2576F8050 = v0;
  return result;
}

uint64_t static MusicService.shared.getter()
{
  if (qword_2576F5040 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_247D890E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7D10);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v3 = sub_247D987E8();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247D89188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  _OWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t (*v17)(uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  sub_247D39100(*(_QWORD *)(v0 + 32), v3);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_247D7CAB8(*(_QWORD *)(v0 + 56));
    sub_247D89BEC();
    swift_allocError();
    *v5 = xmmword_247D9B2B0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 72);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
    v11(v8, *(_QWORD *)(v0 + 56), v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v7, v8, v9);
    type metadata accessor for AMSMediaRequestHandler();
    v12 = swift_allocObject();
    *(_QWORD *)(v0 + 96) = v12;
    v13 = v12 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v11(v12 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v7, v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
    if (qword_254457630 != -1)
      swift_once();
    v14 = *(_QWORD *)(v0 + 64);
    v15 = *(_QWORD *)(v0 + 48);
    sub_247D89C30(v12 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v15);
    result = v4(v15, 1, v14);
    if ((_DWORD)result == 1)
    {
      __break(1u);
    }
    else
    {
      v17 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5588 + dword_2576F5588);
      v16 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v16;
      *v16 = v0;
      v16[1] = sub_247D893A8;
      return v17(*(_QWORD *)(v0 + 48));
    }
  }
  return result;
}

uint64_t sub_247D893A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v6 = (_QWORD *)*v5;
  v6[14] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = v4;
  swift_task_dealloc();
  if (!v4)
  {
    v7 = v6[8];
    v8 = v6[6];
    v9 = *(void (**)(uint64_t, uint64_t))(v6[9] + 8);
    v6[19] = v9;
    v9(v8, v7);
  }
  return swift_task_switch();
}

uint64_t sub_247D89430()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 144);
  sub_247D98830();
  swift_allocObject();
  sub_247D98824();
  sub_247D8AF10();
  sub_247D9880C();
  v11 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  v3 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 64);
  swift_release();
  sub_247D0D968(v5, v4);
  swift_release();

  v11(v6, v7);
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 16);
    v10 = *(_QWORD *)(v0 + 24);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v9, v10);
  }
}

uint64_t sub_247D895DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 72) + 8);
  v4(*(_QWORD *)(v0 + 48), v3);
  swift_setDeallocating();
  sub_247D7CAB8(v2 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
  swift_deallocClassInstance();
  v4(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D89688(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7D10);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  v4 = sub_247D987E8();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247D89730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  _OWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t);

  sub_247D39500(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 56));
  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_247D7CAB8(v3);
    sub_247D89BEC();
    swift_allocError();
    *v5 = xmmword_247D9B2B0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 88);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v9(v7, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v8, v7, v1);
    type metadata accessor for AMSMediaRequestHandler();
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 96) = v10;
    v11 = v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v9(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v8, v1);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v11, 0, 1, v1);
    if (qword_254457630 != -1)
      swift_once();
    v12 = *(_QWORD *)(v0 + 64);
    v13 = *(_QWORD *)(v0 + 48);
    sub_247D89C30(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v13);
    result = v4(v13, 1, v12);
    if ((_DWORD)result == 1)
    {
      __break(1u);
    }
    else
    {
      v15 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5588 + dword_2576F5588);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v14;
      *v14 = v0;
      v14[1] = sub_247D89950;
      return v15(*(_QWORD *)(v0 + 48));
    }
  }
  return result;
}

uint64_t sub_247D89950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v6 = (_QWORD *)*v5;
  v6[14] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = v4;
  swift_task_dealloc();
  if (!v4)
  {
    v7 = v6[8];
    v8 = v6[6];
    v9 = *(void (**)(uint64_t, uint64_t))(v6[9] + 8);
    v6[19] = v9;
    v9(v8, v7);
  }
  return swift_task_switch();
}

uint64_t sub_247D899D8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(uint64_t, uint64_t);
  void *v23;

  v1 = v0[18];
  sub_247D98830();
  swift_allocObject();
  sub_247D98824();
  sub_247D8ABB0();
  sub_247D9880C();
  if (v1)
  {
    v22 = (void (*)(uint64_t, uint64_t))v0[19];
    v2 = (void *)v0[16];
    v3 = (void *)v0[17];
    v5 = v0[14];
    v4 = v0[15];
    v6 = v0[11];
    v7 = v0[8];
    swift_release();
    sub_247D0D968(v5, v4);
    swift_release();

    v22(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    v9 = (_QWORD *)v0[2];
    v10 = (_QWORD *)v0[3];
    v12 = (void *)v0[16];
    v11 = (void *)v0[17];
    v14 = v0[14];
    v13 = v0[15];
    if (v9[2])
    {
      v23 = (void *)v0[17];
      v15 = v9[5];
      v16 = v9[6];
      v17 = v9[7];
      v18 = v9[8];
      v19 = v9[9];
      v20 = v9[10];
      *v10 = v9[4];
      v10[1] = v15;
      v10[2] = v16;
      v10[3] = v17;
      v10[4] = v18;
      v10[5] = v19;
      v10[6] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247D0D968(v14, v13);
      swift_bridgeObjectRelease();
      swift_release();

    }
    else
    {
      sub_247D0D968(v0[14], v0[15]);
      swift_bridgeObjectRelease();
      swift_release();

      v10[6] = 0;
      *((_OWORD *)v10 + 1) = 0u;
      *((_OWORD *)v10 + 2) = 0u;
      *(_OWORD *)v10 = 0u;
    }
    ((void (*)(_QWORD, _QWORD))v0[19])(v0[11], v0[8]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

unint64_t sub_247D89BEC()
{
  unint64_t result;

  result = qword_2576F8060;
  if (!qword_2576F8060)
  {
    result = MEMORY[0x249591B70](&unk_247DA05B4, &type metadata for MusicService.MusicServiceError);
    atomic_store(result, (unint64_t *)&qword_2576F8060);
  }
  return result;
}

uint64_t sub_247D89C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7D10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247D89C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7D10);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  v5 = sub_247D987E8();
  v4[9] = v5;
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247D89D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  _OWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t);

  sub_247D399E4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 64));
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_247D7CAB8(v3);
    sub_247D89BEC();
    swift_allocError();
    *v5 = xmmword_247D9B2B0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v9(v7, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v8, v7, v1);
    type metadata accessor for AMSMediaRequestHandler();
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 104) = v10;
    v11 = v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v9(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v8, v1);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v11, 0, 1, v1);
    if (qword_254457630 != -1)
      swift_once();
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 56);
    sub_247D89C30(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v13);
    result = v4(v13, 1, v12);
    if ((_DWORD)result == 1)
    {
      __break(1u);
    }
    else
    {
      v15 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5588 + dword_2576F5588);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v14;
      *v14 = v0;
      v14[1] = sub_247D89F44;
      return v15(*(_QWORD *)(v0 + 56));
    }
  }
  return result;
}

uint64_t sub_247D89F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v6 = (_QWORD *)*v5;
  v6[15] = a1;
  v6[16] = a2;
  v6[17] = a3;
  v6[18] = a4;
  v6[19] = v4;
  swift_task_dealloc();
  if (!v4)
  {
    v7 = v6[9];
    v8 = v6[7];
    v9 = *(void (**)(uint64_t, uint64_t))(v6[10] + 8);
    v6[20] = v9;
    v9(v8, v7);
  }
  return swift_task_switch();
}

uint64_t sub_247D89FCC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(uint64_t, uint64_t);
  void *v23;

  v1 = v0[19];
  sub_247D98830();
  swift_allocObject();
  sub_247D98824();
  sub_247D8ABB0();
  sub_247D9880C();
  if (v1)
  {
    v22 = (void (*)(uint64_t, uint64_t))v0[20];
    v2 = (void *)v0[17];
    v3 = (void *)v0[18];
    v5 = v0[15];
    v4 = v0[16];
    v6 = v0[12];
    v7 = v0[9];
    swift_release();
    sub_247D0D968(v5, v4);
    swift_release();

    v22(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    v9 = (_QWORD *)v0[2];
    v10 = (_QWORD *)v0[3];
    v12 = (void *)v0[17];
    v11 = (void *)v0[18];
    v14 = v0[15];
    v13 = v0[16];
    if (v9[2])
    {
      v23 = (void *)v0[18];
      v15 = v9[5];
      v16 = v9[6];
      v17 = v9[7];
      v18 = v9[8];
      v19 = v9[9];
      v20 = v9[10];
      *v10 = v9[4];
      v10[1] = v15;
      v10[2] = v16;
      v10[3] = v17;
      v10[4] = v18;
      v10[5] = v19;
      v10[6] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247D0D968(v14, v13);
      swift_bridgeObjectRelease();
      swift_release();

    }
    else
    {
      sub_247D0D968(v0[15], v0[16]);
      swift_bridgeObjectRelease();
      swift_release();

      v10[6] = 0;
      *((_OWORD *)v10 + 1) = 0u;
      *((_OWORD *)v10 + 2) = 0u;
      *(_OWORD *)v10 = 0u;
    }
    ((void (*)(_QWORD, _QWORD))v0[20])(v0[12], v0[9]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

uint64_t sub_247D8A1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 8);
  v4(*(_QWORD *)(v0 + 56), v3);
  swift_setDeallocating();
  sub_247D7CAB8(v2 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
  swift_deallocClassInstance();
  v4(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D8A28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7D10);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  v5 = sub_247D987E8();
  v4[9] = v5;
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247D8A334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  _OWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t);

  sub_247D39C08(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 64));
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_247D7CAB8(v3);
    sub_247D89BEC();
    swift_allocError();
    *v5 = xmmword_247D9B2B0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v9(v7, v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v8, v7, v1);
    type metadata accessor for AMSMediaRequestHandler();
    v10 = swift_allocObject();
    *(_QWORD *)(v0 + 104) = v10;
    v11 = v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest;
    v9(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v8, v1);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v11, 0, 1, v1);
    if (qword_254457630 != -1)
      swift_once();
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 56);
    sub_247D89C30(v10 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest, v13);
    result = v4(v13, 1, v12);
    if ((_DWORD)result == 1)
    {
      __break(1u);
    }
    else
    {
      v15 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5588 + dword_2576F5588);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v14;
      *v14 = v0;
      v14[1] = sub_247D8A558;
      return v15(*(_QWORD *)(v0 + 56));
    }
  }
  return result;
}

uint64_t sub_247D8A558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v6 = (_QWORD *)*v5;
  v6[15] = a1;
  v6[16] = a2;
  v6[17] = a3;
  v6[18] = a4;
  v6[19] = v4;
  swift_task_dealloc();
  if (!v4)
  {
    v7 = v6[9];
    v8 = v6[7];
    v9 = *(void (**)(uint64_t, uint64_t))(v6[10] + 8);
    v6[20] = v9;
    v9(v8, v7);
  }
  return swift_task_switch();
}

uint64_t sub_247D8A5E0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  _QWORD *v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _OWORD *v23;
  void *v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void *v32;

  v1 = v0[19];
  sub_247D98830();
  swift_allocObject();
  sub_247D98824();
  sub_247D8ABB0();
  sub_247D9880C();
  if (v1)
  {
    v31 = (void (*)(uint64_t, uint64_t))v0[20];
    v2 = (void *)v0[17];
    v3 = (void *)v0[18];
    v4 = v0[15];
    v5 = v0[16];
    v6 = v0[12];
    v7 = v0[9];
    swift_release();
    sub_247D0D968(v4, v5);
    swift_release();

    v31(v6, v7);
  }
  else
  {
    swift_release();
    v9 = (_QWORD *)v0[2];
    v10 = (void (*)(uint64_t, uint64_t))v0[20];
    v11 = (void *)v0[18];
    v12 = v0[15];
    v30 = v0[16];
    v32 = (void *)v0[17];
    v13 = v0[12];
    v14 = v0[13];
    if (v9[2])
    {
      v29 = v0[9];
      v24 = (void *)v0[18];
      v25 = (void (*)(uint64_t, uint64_t))v0[20];
      v15 = (_QWORD *)v0[3];
      v16 = v0[12];
      v17 = v9[5];
      v27 = v9[6];
      v28 = v9[4];
      v18 = v9[7];
      v26 = v9[8];
      v19 = v9[9];
      v20 = v9[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_247D0D968(v12, v30);
      swift_release();

      v25(v16, v29);
      *v15 = v28;
      v15[1] = v17;
      v15[2] = v27;
      v15[3] = v18;
      v15[4] = v26;
      v15[5] = v19;
      v15[6] = v20;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v8 = (uint64_t (*)(void))v0[1];
      return v8();
    }
    v22 = v0[9];
    swift_bridgeObjectRelease();
    sub_247D89BEC();
    swift_allocError();
    *v23 = xmmword_247DA0550;
    swift_willThrow();
    sub_247D0D968(v12, v30);

    swift_setDeallocating();
    sub_247D7CAB8(v14 + OBJC_IVAR____TtC13TVAppServices22AMSMediaRequestHandler_urlRequest);
    swift_deallocClassInstance();
    v10(v13, v22);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_247D8A890(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return swift_task_switch();
}

uint64_t sub_247D8A8AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[9];
  v1 = v0[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254457818);
  v3 = swift_allocObject();
  v0[12] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_247D99ED0;
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  *v4 = v0;
  v4[1] = sub_247D8A954;
  return sub_247D89688((uint64_t)(v0 + 2), v3);
}

uint64_t sub_247D8A954()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_247D8A9C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;

  v1 = v0[3];
  if (!v1)
  {
    v8 = 0;
    goto LABEL_7;
  }
  v2 = v0[2];
  v3 = v0[8];
  if (!v3)
  {
    v11 = v0[2];
    v12 = v0[3];
LABEL_10:
    sub_247D80D48(v11, v12);
LABEL_12:
    sub_247D89BEC();
    swift_allocError();
    *v13 = xmmword_247DA0550;
    swift_willThrow();
    v9 = (uint64_t (*)(uint64_t))v0[1];
    v10 = 0;
    return v9(v10);
  }
  if (!*(_QWORD *)(v3 + 16))
  {
    v11 = v0[2];
    v12 = v0[3];
    goto LABEL_10;
  }
  v5 = v0[9];
  v4 = v0[10];
  swift_bridgeObjectRetain();
  v6 = sub_247D077D4(v5, v4);
  if ((v7 & 1) == 0)
  {
    sub_247D80D48(v2, v1);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v3 + 56) + v6);
  sub_247D80D48(v2, v1);
  swift_bridgeObjectRelease();
LABEL_7:
  v9 = (uint64_t (*)(uint64_t))v0[1];
  v10 = v8;
  return v9(v10);
}

uint64_t sub_247D8AB38()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t MusicService.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t MusicService.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_247D8ABB0()
{
  unint64_t result;

  result = qword_2576F8068[0];
  if (!qword_2576F8068[0])
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for MusicPlaylistsResponse, &type metadata for MusicPlaylistsResponse);
    atomic_store(result, qword_2576F8068);
  }
  return result;
}

uint64_t type metadata accessor for MusicService()
{
  return objc_opt_self();
}

uint64_t method lookup function for MusicService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MusicService.fetchSavedSongsPlaylist(checkIfHasTracks:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 104) + *(_QWORD *)(*(_QWORD *)v2 + 104));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_247D4E55C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of MusicService.fetchPlaylist(withId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 112)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 112));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_247D28CA8;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of MusicService.addToSavedSongsPlaylist(songId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 120)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 120));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_247D4E55C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of MusicService.isSongAddedToSavedSongPlaylist(songId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_247D8AE04;
  return v8(a1, a2);
}

uint64_t sub_247D8AE04(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t getEnumTagSinglePayload for MusicService.MusicServiceError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MusicService.MusicServiceError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicService.MusicServiceError()
{
  return &type metadata for MusicService.MusicServiceError;
}

unint64_t sub_247D8AF10()
{
  unint64_t result;

  result = qword_2576F8180[0];
  if (!qword_2576F8180[0])
  {
    result = MEMORY[0x249591B70](&unk_247D9D81C, &type metadata for MusicCatalogSongsResponse);
    atomic_store(result, qword_2576F8180);
  }
  return result;
}

uint64_t sub_247D8AF5C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_247D8AFB8(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[2];
  char v38;
  _QWORD v39[5];
  char v40[8];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _UNKNOWN **v44;
  uint64_t v45;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544577D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UTSEndpoint();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_247D98A04();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v33 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v34 = (char *)&v30 - v17;
  v18 = *a3;
  v19 = *(_QWORD *)(v3 + 576);
  v31 = *(_QWORD *)(v3 + 584);
  v32 = v19;
  v43 = _s14VideoItemRouteVMa(0, v19, v31, v20);
  v44 = &off_25195BF20;
  v35 = v18;
  v36 = a1;
  v40[0] = v18;
  v41 = a1;
  v42 = a2;
  v21 = (void *)objc_opt_self();
  v45 = a2;
  swift_bridgeObjectRetain();
  v22 = objc_msgSend(v21, "app");
  v39[3] = type metadata accessor for TVAppBag(0);
  v39[4] = &protocol witness table for TVAppBag;
  v39[0] = v22;
  v37[0] = 0;
  v37[1] = 0;
  v38 = 2;
  sub_247D67460((uint64_t)v40, v39, v37, 0, 0, (uint64_t)v12);
  sub_247D0DA3C((uint64_t)&v12[*(int *)(v10 + 24)], (uint64_t)v9, &qword_2544577D8);
  sub_247D2D9CC((uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) == 1)
  {
    swift_bridgeObjectRelease();
    sub_247D07E44((uint64_t)v9, &qword_2544577D8);
    v24 = _s17RequestBuildErrorOMa(0, v32, v31, v23);
    MEMORY[0x249591B70](&unk_247DA0780, v24);
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    v25 = v34;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v34, v9, v13);
    v26 = (uint64_t)v33;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v33, v25, v13);
    swift_allocObject();
    v24 = sub_247D8B450(v26);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v25, v13);
    v27 = (_QWORD *)(v24 + qword_257703B80);
    v28 = v36;
    *v27 = v35;
    v27[1] = v28;
    v27[2] = v45;
    swift_bridgeObjectRelease();
  }
  return v24;
}

unint64_t sub_247D8B2A8()
{
  _BYTE *v0;
  int v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = 0xD000000000000019;
  if (v1 == 1)
    v3 = 0xD000000000000011;
  else
    v3 = 0;
  if (v1 != 12)
    v2 = v3;
  if (*v0)
    return v2;
  else
    return 0xD000000000000012;
}

uint64_t sub_247D8B314()
{
  _BYTE *v0;

  if (*v0 != 1 && *v0)
    return 0;
  sub_247D0CD58();
  return sub_247D98FA4();
}

_BYTE *sub_247D8B404@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_BYTE *)a4 = *result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_247D8B418(uint64_t a1)
{
  swift_allocObject();
  return sub_247D8B450(a1);
}

uint64_t sub_247D8B450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_247D98A04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)(v1 + qword_257703B78);
  *v7 = 0;
  v7[1] = 0;
  v8 = (_QWORD *)(v1 + qword_257703B80);
  *v8 = 0;
  v8[1] = 0;
  v8[2] = 0;
  *(_BYTE *)(v1 + qword_257703B88) = 26;
  v9 = (_OWORD *)(v1 + qword_257703B90);
  *v9 = 0u;
  v9[1] = 0u;
  v9[2] = 0u;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v10 = sub_247D0DE10((uint64_t)v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v10;
}

uint64_t sub_247D8B538(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[76] = v1;
  v2[75] = a1;
  v2[77] = *v1;
  v3 = sub_247D988A8();
  v2[78] = v3;
  v2[79] = *(_QWORD *)(v3 - 8);
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254457610);
  v2[82] = swift_task_alloc();
  v4 = type metadata accessor for UTSEndpoint();
  v2[83] = v4;
  v2[84] = *(_QWORD *)(v4 - 8);
  v2[85] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247D8B600()
{
  uint64_t v0;

  if (qword_254457660 != -1)
    swift_once();
  *(_QWORD *)(v0 + 688) = qword_254457658;
  return swift_task_switch();
}

uint64_t sub_247D8B664()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 688) + 112;
  swift_beginAccess();
  sub_247D0DA3C(v1, v0 + 16, &qword_2576F5A90);
  return swift_task_switch();
}

uint64_t sub_247D8B6CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int64_t v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD *v91;
  uint64_t v92;
  unint64_t v93;
  int64_t v94;

  v1 = *(_QWORD *)(v0 + 608);
  v2 = v1 + qword_257703B90;
  swift_beginAccess();
  sub_247D8C4EC(v0 + 16, v2);
  swift_endAccess();
  v3 = (uint64_t *)(v1 + qword_257703B80);
  if (!*(_QWORD *)(v1 + qword_257703B80 + 16))
    goto LABEL_25;
  v4 = *v3;
  sub_247D0DA3C(v2, v0 + 160, &qword_2576F5A90);
  if (!*(_QWORD *)(v0 + 160))
  {
    v14 = *(_QWORD *)(v0 + 672);
    v15 = *(_QWORD *)(v0 + 664);
    v16 = *(_QWORD *)(v0 + 656);
    sub_247D07E44(v0 + 160, &qword_2576F5A90);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v16, 1, 1, v15);
LABEL_24:
    sub_247D07E44(*(_QWORD *)(v0 + 656), (uint64_t *)&unk_254457610);
LABEL_25:
    sub_247D185F4();
    swift_allocError();
    *v26 = 5;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = (uint64_t *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 616);
  sub_247D8C534(v0 + 160, v0 + 208);
  swift_bridgeObjectRetain();
  sub_247D07E44(v0 + 160, &qword_2576F5A90);
  v8 = _s14VideoItemRouteVMa(0, *(_QWORD *)(v6 + 576), *(_QWORD *)(v6 + 584), v7);
  v9 = v4;
  if ((_BYTE)v4)
  {
    v10 = 0xE000000000000000;
    if (v4 == 1)
      v11 = 0xD000000000000011;
    else
      v11 = 0;
    if (v4 == 1)
      v10 = 0x8000000247DA48F0;
    if (v4 == 12)
      v12 = 0xD000000000000019;
    else
      v12 = v11;
    if (v9 == 12)
      v13 = 0x8000000247DA48D0;
    else
      v13 = v10;
  }
  else
  {
    v12 = 0xD000000000000012;
    v13 = 0x8000000247DA4910;
  }
  swift_bridgeObjectRelease();
  v17 = *v5;
  if (*(_QWORD *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    v18 = sub_247D077D4(v12, v13);
    v19 = *(_QWORD *)(v0 + 672);
    v20 = *(_QWORD *)(v0 + 664);
    v21 = *(_QWORD *)(v0 + 656);
    if ((v22 & 1) != 0)
    {
      sub_247D35C9C(*(_QWORD *)(v17 + 56) + *(_QWORD *)(v19 + 72) * v18, *(_QWORD *)(v0 + 656));
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v20);
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v19 + 56))(*(_QWORD *)(v0 + 656), 1, 1, v20);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 672) + 56))(*(_QWORD *)(v0 + 656), 1, 1, *(_QWORD *)(v0 + 664));
  }
  v23 = *(_QWORD *)(v0 + 672);
  v24 = *(_QWORD *)(v0 + 664);
  v25 = *(_QWORD *)(v0 + 656);
  swift_bridgeObjectRelease();
  sub_247D8C570(v0 + 208);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v25, 1, v24) == 1)
    goto LABEL_24;
  v28 = *(_QWORD *)(v0 + 680);
  v29 = *(_QWORD *)(v0 + 664);
  sub_247D105B0(*(_QWORD *)(v0 + 656), v28);
  v30 = (uint64_t *)(v28 + *(int *)(v29 + 36));
  v31 = v30[1];
  if (!v31)
  {
    sub_247D2D9CC(*(_QWORD *)(v0 + 680));
    goto LABEL_25;
  }
  v32 = *v30;
  sub_247D0DA3C(v2, v0 + 304, &qword_2576F5A90);
  if (!*(_QWORD *)(v0 + 304))
  {
    sub_247D07E44(v0 + 304, &qword_2576F5A90);
LABEL_74:
    v64 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 696) = v64;
    *v64 = v0;
    v64[1] = sub_247D8C178;
    return sub_247D0E04C(*(_QWORD *)(v0 + 600));
  }
  sub_247D8C534(v0 + 304, v0 + 256);
  swift_bridgeObjectRetain();
  sub_247D07E44(v0 + 304, &qword_2576F5A90);
  sub_247D0CF04(v0 + 264, v0 + 352);
  sub_247D8C570(v0 + 256);
  v33 = *(_QWORD *)(v0 + 376);
  if (!v33)
  {
    swift_bridgeObjectRelease();
    sub_247D07E44(v0 + 352, qword_2576F8290);
    goto LABEL_74;
  }
  v34 = (_OWORD *)(v0 + 392);
  v35 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 352), v33);
  v36 = *v35;
  if (!*(_QWORD *)(*v35 + 16))
  {
    *v34 = 0u;
    *(_OWORD *)(v0 + 408) = 0u;
LABEL_72:
    sub_247D07E44(v0 + 392, &qword_2544579F0);
    goto LABEL_73;
  }
  swift_bridgeObjectRetain();
  v37 = sub_247D077D4(v32, v31);
  if ((v38 & 1) != 0)
  {
    sub_247D07E08(*(_QWORD *)(v36 + 56) + 32 * v37, v0 + 392);
  }
  else
  {
    *v34 = 0u;
    *(_OWORD *)(v0 + 408) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 416))
    goto LABEL_72;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254457790);
  v39 = MEMORY[0x24BEE4AD8] + 8;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_73:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 352);
    goto LABEL_74;
  }
  v40 = (_OWORD *)(v0 + 424);
  v90 = *(_QWORD *)(v0 + 632);
  v91 = (_OWORD *)(v0 + 64);
  v41 = *(_QWORD *)(v0 + 592);
  swift_bridgeObjectRelease();
  result = __swift_destroy_boxed_opaque_existential_1(v0 + 352);
  v42 = 0;
  v86 = v41 + 64;
  v43 = -1;
  v44 = -1 << *(_BYTE *)(v41 + 32);
  if (-v44 < 64)
    v43 = ~(-1 << -(char)v44);
  v45 = v43 & *(_QWORD *)(v41 + 64);
  v46 = (unint64_t)(63 - v44) >> 6;
  v89 = v41;
  v83 = v46 - 1;
  v84 = v41 + 104;
  v87 = v46;
  v85 = v46 - 5;
  v88 = v8;
  if (!v45)
    goto LABEL_46;
LABEL_44:
  v47 = __clz(__rbit64(v45));
  v45 &= v45 - 1;
  v93 = v42;
  v48 = v47 | (v42 << 6);
  v49 = v0 + 112;
LABEL_45:
  v50 = (_QWORD *)(*(_QWORD *)(v89 + 48) + 16 * v48);
  v51 = v50[1];
  *(_QWORD *)(v0 + 64) = *v50;
  *(_QWORD *)(v0 + 72) = v51;
  sub_247D07E08(*(_QWORD *)(v89 + 56) + 32 * v48, v0 + 80);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_247D35C54((uint64_t)v91, v49);
    if (!*(_QWORD *)(v0 + 120))
    {
      swift_release();
      v65 = v3[2];
      if (v65)
      {
        v66 = v3[1];
        *(_BYTE *)(v0 + 504) = *v3;
        *(_QWORD *)(v0 + 512) = v66;
        *(_QWORD *)(v0 + 520) = v65;
        result = sub_247D67828(v0 + 504, v8, (uint64_t)&off_25195BF20);
        if (result)
        {
          v67 = 0;
          v68 = *(_QWORD *)(result + 64);
          v92 = result + 64;
          v69 = -1;
          v70 = -1 << *(_BYTE *)(result + 32);
          if (-v70 < 64)
            v69 = ~(-1 << -(char)v70);
          v71 = v69 & v68;
          v94 = (unint64_t)(63 - v70) >> 6;
          if ((v69 & v68) == 0)
            goto LABEL_81;
LABEL_80:
          for (v71 &= v71 - 1; ; v71 = (v73 - 1) & v73)
          {
            v75 = *(_QWORD *)(v0 + 608);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_247D98884();
            v76 = (unint64_t *)(v75 + OBJC_IVAR____TtC13TVAppServices14RequestBuilder_queryParams);
            swift_beginAccess();
            v77 = *v76;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *v76 = v77;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v77 = sub_247D499F0(0, *(_QWORD *)(v77 + 16) + 1, 1, v77);
              *v76 = v77;
            }
            v80 = *(_QWORD *)(v77 + 16);
            v79 = *(_QWORD *)(v77 + 24);
            if (v80 >= v79 >> 1)
            {
              v77 = sub_247D499F0(v79 > 1, v80 + 1, 1, v77);
              *v76 = v77;
            }
            v81 = *(_QWORD *)(v0 + 640);
            v82 = *(_QWORD *)(v0 + 624);
            *(_QWORD *)(v77 + 16) = v80 + 1;
            (*(void (**)(unint64_t, uint64_t, uint64_t))(v90 + 32))(v77+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(_QWORD *)(v90 + 72) * v80, v81, v82);
            swift_endAccess();
            swift_bridgeObjectRelease();
            result = swift_bridgeObjectRelease();
            if (v71)
              goto LABEL_80;
LABEL_81:
            v72 = v67 + 1;
            if (__OFADD__(v67, 1))
              goto LABEL_103;
            if (v72 >= v94)
            {
LABEL_101:
              swift_release();
              goto LABEL_74;
            }
            v73 = *(_QWORD *)(v92 + 8 * v72);
            ++v67;
            if (!v73)
            {
              v67 = v72 + 1;
              if (v72 + 1 >= v94)
                goto LABEL_101;
              v73 = *(_QWORD *)(v92 + 8 * v67);
              if (!v73)
              {
                v67 = v72 + 2;
                if (v72 + 2 >= v94)
                  goto LABEL_101;
                v73 = *(_QWORD *)(v92 + 8 * v67);
                if (!v73)
                {
                  v74 = v72 + 3;
                  if (v74 >= v94)
                    goto LABEL_101;
                  v73 = *(_QWORD *)(v92 + 8 * v74);
                  if (!v73)
                  {
                    while (1)
                    {
                      v67 = v74 + 1;
                      if (__OFADD__(v74, 1))
                        goto LABEL_104;
                      if (v67 >= v94)
                        goto LABEL_101;
                      v73 = *(_QWORD *)(v92 + 8 * v67);
                      ++v74;
                      if (v73)
                        goto LABEL_94;
                    }
                  }
                  v67 = v74;
                }
              }
            }
LABEL_94:
            ;
          }
        }
      }
      goto LABEL_74;
    }
    sub_247D077C4((_OWORD *)(v0 + 128), v40);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v55 = v39;
      v56 = *(_QWORD *)(v0 + 608);
      sub_247D98884();
      v57 = (unint64_t *)(v56 + OBJC_IVAR____TtC13TVAppServices14RequestBuilder_queryParams);
      swift_beginAccess();
      v58 = *v57;
      v59 = swift_isUniquelyReferenced_nonNull_native();
      *v57 = v58;
      if ((v59 & 1) == 0)
      {
        v58 = sub_247D499F0(0, *(_QWORD *)(v58 + 16) + 1, 1, v58);
        *v57 = v58;
      }
      v61 = *(_QWORD *)(v58 + 16);
      v60 = *(_QWORD *)(v58 + 24);
      if (v61 >= v60 >> 1)
      {
        v58 = sub_247D499F0(v60 > 1, v61 + 1, 1, v58);
        *v57 = v58;
      }
      v62 = *(_QWORD *)(v0 + 648);
      v63 = *(_QWORD *)(v0 + 624);
      *(_QWORD *)(v58 + 16) = v61 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v90 + 32))(v58+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(_QWORD *)(v90 + 72) * v61, v62, v63);
      swift_endAccess();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v39 = v55;
      v40 = (_OWORD *)(v0 + 424);
      v8 = v88;
      v42 = v93;
      if (v45)
        goto LABEL_44;
    }
    else
    {
      result = swift_bridgeObjectRelease();
      v42 = v93;
      if (v45)
        goto LABEL_44;
    }
LABEL_46:
    v52 = v42 + 1;
    v49 = v0 + 112;
    if (__OFADD__(v42, 1))
      break;
    if (v52 >= v87)
    {
      v54 = v42;
    }
    else
    {
      v53 = *(_QWORD *)(v86 + 8 * v52);
      if (v53)
        goto LABEL_49;
      v54 = v42 + 1;
      if ((uint64_t)(v42 + 2) < v87)
      {
        v53 = *(_QWORD *)(v86 + 8 * (v42 + 2));
        if (v53)
        {
          v52 = v42 + 2;
LABEL_49:
          v45 = (v53 - 1) & v53;
          v48 = __clz(__rbit64(v53)) + (v52 << 6);
          v93 = v52;
          goto LABEL_45;
        }
        v54 = v42 + 2;
        if ((uint64_t)(v42 + 3) < v87)
        {
          v53 = *(_QWORD *)(v86 + 8 * (v42 + 3));
          if (v53)
          {
            v52 = v42 + 3;
            goto LABEL_49;
          }
          v52 = v42 + 4;
          v54 = v42 + 3;
          if ((uint64_t)(v42 + 4) < v87)
          {
            v53 = *(_QWORD *)(v86 + 8 * v52);
            if (v53)
              goto LABEL_49;
            while (v85 != v42)
            {
              v53 = *(_QWORD *)(v84 + 8 * v42++);
              if (v53)
              {
                v52 = v42 + 4;
                goto LABEL_49;
              }
            }
            v54 = v83;
          }
        }
      }
    }
    v45 = 0;
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    v93 = v54;
    *v91 = 0u;
  }
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

uint64_t sub_247D8C178()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 704) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247D8C1DC()
{
  uint64_t v0;

  sub_247D2D9CC(*(_QWORD *)(v0 + 680));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D8C248()
{
  uint64_t v0;

  sub_247D2D9CC(*(_QWORD *)(v0 + 680));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D8C2B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_247D07E44(v0 + qword_257703B90, &qword_2576F5A90);
}

uint64_t sub_247D8C300()
{
  uint64_t v0;

  v0 = sub_247D0FC5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247D07E44(v0 + qword_257703B90, &qword_2576F5A90);
  return v0;
}

uint64_t sub_247D8C364()
{
  sub_247D8C300();
  return swift_deallocClassInstance();
}

uint64_t _s23VideoDataRequestBuilderCMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s23VideoDataRequestBuilderCMn);
}

uint64_t sub_247D8C390()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247D8C39C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D8C3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_247D8C3D8(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247D8C420(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_247D8C458(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_247D8C4A0(uint64_t result, int a2, int a3)
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

uint64_t _s14VideoItemRouteVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s14VideoItemRouteVMn);
}

uint64_t sub_247D8C4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5A90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_247D8C534(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for UTSCommonConfigHandler(a2, a1);
  return a2;
}

uint64_t sub_247D8C570(uint64_t a1)
{
  destroy for UTSCommonConfigHandler(a1);
  return a1;
}

uint64_t _s17RequestBuildErrorOMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s17RequestBuildErrorOMn);
}

uint64_t sub_247D8C5B0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_247D8C5B8(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247D8C5F8 + 4 * byte_247DA0600[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247D8C618 + 4 * byte_247DA0605[v4]))();
}

_BYTE *sub_247D8C5F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247D8C618(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247D8C620(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247D8C628(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247D8C630(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247D8C638(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_247D8C644()
{
  JUMPOUT(0x249591B70);
}

uint64_t TimedMetadataFetcherMock.__allocating_init(programID:adamID:contentID:playablePassThrough:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_allocObject();
  sub_247D98BA8();
  return TimedMetadataFetcher.init(programID:adamID:contentID:playablePassThrough:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_247D8C728(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 296) = a2;
  *(_QWORD *)(v4 + 304) = v3;
  *(_QWORD *)(v4 + 288) = a1;
  *(double *)(v4 + 280) = a3;
  v5 = sub_247D98A04();
  *(_QWORD *)(v4 + 312) = v5;
  *(_QWORD *)(v4 + 320) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 328) = swift_task_alloc();
  *(_QWORD *)(v4 + 336) = swift_task_alloc();
  *(_QWORD *)(v4 + 344) = swift_task_alloc();
  *(_QWORD *)(v4 + 352) = swift_task_alloc();
  *(_QWORD *)(v4 + 360) = swift_task_alloc();
  *(_QWORD *)(v4 + 368) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544577D8);
  *(_QWORD *)(v4 + 376) = swift_task_alloc();
  *(_QWORD *)(v4 + 384) = swift_task_alloc();
  *(_QWORD *)(v4 + 392) = swift_task_alloc();
  *(_QWORD *)(v4 + 400) = swift_task_alloc();
  *(_QWORD *)(v4 + 408) = swift_task_alloc();
  *(_QWORD *)(v4 + 416) = swift_task_alloc();
  v6 = sub_247D98BE4();
  *(_QWORD *)(v4 + 424) = v6;
  *(_QWORD *)(v4 + 432) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 440) = swift_task_alloc();
  *(_QWORD *)(v4 + 448) = swift_task_alloc();
  *(_QWORD *)(v4 + 456) = swift_task_alloc();
  *(_QWORD *)(v4 + 464) = sub_247D98E30();
  *(_QWORD *)(v4 + 472) = sub_247D98E24();
  *(_QWORD *)(v4 + 480) = sub_247D98E00();
  *(_QWORD *)(v4 + 488) = v7;
  return swift_task_switch();
}

uint64_t sub_247D8C8E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, unint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, unint64_t, uint64_t);
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  _BOOL4 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  os_log_type_t type;
  os_log_type_t typea;
  NSObject *log;
  os_log_t loga;
  uint64_t v138;
  unint64_t v139;
  _QWORD *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t (*v147)(uint64_t, uint64_t, uint64_t);
  uint64_t v148;
  void (*v149)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 296);
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 304);
    swift_beginAccess();
    v3 = *(_QWORD *)(v2 + 40);
    if (!v3)
      goto LABEL_16;
    v4 = HIBYTE(v3) & 0xF;
    v148 = *(_QWORD *)(v2 + 32);
    if ((v3 & 0x2000000000000000) == 0)
      v4 = v148 & 0xFFFFFFFFFFFFLL;
    if (!v4)
    {
LABEL_16:
      swift_release();
      v22 = sub_247D98B9C();
      v23 = sub_247D98EE4();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_247CFF000, v22, v23, "Unable to fetch timed metadata because program ID is empty", v24, 2u);
        MEMORY[0x249591C3C](v24, -1, -1);
      }

      sub_247D82314();
      swift_allocError();
      swift_willThrow();
      goto LABEL_80;
    }
    swift_bridgeObjectRetain();
    v5 = sub_247D98B9C();
    v6 = sub_247D98EF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_247CFF000, v5, v6, "Attempting to retrieve data from test file", v7, 2u);
      MEMORY[0x249591C3C](v7, -1, -1);
    }

    v8 = (void *)CPSharedResourcesDirectory();
    if (v8)
    {
      v9 = v8;
      v150 = 0;
      v151 = 0;
      sub_247D98CB0();

    }
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v30 = sub_247D98C98();
    v31 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v30);

    if (!v31)
      goto LABEL_29;
    v32 = *(_QWORD *)(v0 + 440);
    v33 = *(_QWORD *)(v0 + 424);
    v34 = *(_QWORD *)(v0 + 432);
    v35 = objc_msgSend(v31, sel_bundlePath);

    sub_247D98CBC();
    sub_247D98BF0();
    sub_247D98BD8();
    v36 = sub_247D98BCC();
    v30 = v37;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_82;
    while (1)
    {
      v39 = v29[2];
      v38 = v29[3];
      if (v39 >= v38 >> 1)
        v29 = sub_247D49D30((_QWORD *)(v38 > 1), v39 + 1, 1, v29);
      v29[2] = v39 + 1;
      v40 = &v29[2 * v39];
      v40[4] = v36;
      v40[5] = v30;
LABEL_29:
      v149 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 320) + 56);
      v149(*(_QWORD *)(v0 + 416), 1, 1, *(_QWORD *)(v0 + 312));
      v142 = v29[2];
      if (!v142)
        break;
      v41 = *(_QWORD *)(v0 + 320);
      v36 = *(_QWORD *)(v0 + 304);
      v143 = v36;
      v42 = 0;
      v141 = (id)objc_opt_self();
      v139 = v3;
      v140 = v29;
      while (v42 < v29[2])
      {
        swift_bridgeObjectRetain();
        sub_247D98968();
        swift_bridgeObjectRelease();
        v51 = objc_msgSend(v141, sel_defaultManager);
        v52 = (void *)sub_247D9898C();
        type metadata accessor for URLResourceKey(0);
        v53 = (void *)sub_247D98DDC();
        *(_QWORD *)(v0 + 256) = 0;
        v54 = objc_msgSend(v51, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v52, v53, 0, v0 + 256);

        v55 = *(void **)(v0 + 256);
        if (v54)
        {
          v144 = v42;
          v56 = sub_247D98DE8();
          v57 = v55;

          v58 = *(_QWORD *)(v56 + 16);
          v145 = v56;
          if (v58)
          {
            v59 = v56 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
            swift_bridgeObjectRetain();
            v60 = *(_QWORD *)(v41 + 72);
            v61 = *(void (**)(uint64_t, unint64_t, uint64_t))(v41 + 16);
            v62 = v58;
            while (1)
            {
              v63 = *(_QWORD *)(v0 + 408);
              v64 = *(_QWORD *)(v0 + 312);
              v61(v63, v59, v64);
              v149(v63, 0, 1, v64);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v63, 1, v64) == 1)
                break;
              (*(void (**)(_QWORD, _QWORD, _QWORD))(v41 + 32))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 312));
              *(_QWORD *)(v0 + 168) = sub_247D98980();
              *(_QWORD *)(v0 + 176) = v65;
              *(_QWORD *)(v0 + 120) = v148;
              *(_QWORD *)(v0 + 128) = v3;
              sub_247D0CD58();
              v66 = sub_247D98FB0();
              swift_bridgeObjectRelease();
              if ((v66 & 1) != 0)
              {
                v68 = *(_QWORD *)(v0 + 416);
                v70 = *(_QWORD *)(v0 + 352);
                v69 = *(_QWORD *)(v0 + 360);
                v71 = *(_QWORD *)(v0 + 312);
                swift_bridgeObjectRelease();
                sub_247D52B54(v68);
                v61(v68, v69, v71);
                v149(v68, 0, 1, v71);
                v61(v70, v69, v71);
                swift_bridgeObjectRetain_n();
                v72 = sub_247D98B9C();
                v73 = sub_247D98EF0();
                v74 = os_log_type_enabled(v72, v73);
                v75 = *(_QWORD *)(v0 + 352);
                v76 = *(_QWORD *)(v0 + 360);
                v77 = *(_QWORD *)(v0 + 312);
                v42 = v144;
                if (v74)
                {
                  log = v72;
                  v78 = swift_slowAlloc();
                  v138 = swift_slowAlloc();
                  v150 = v138;
                  *(_DWORD *)v78 = 136315394;
                  swift_bridgeObjectRetain();
                  *(_QWORD *)(v0 + 264) = sub_247D8E3E8(v148, v3, &v150);
                  type = v73;
                  sub_247D98F80();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v78 + 12) = 2080;
                  sub_247D0DAD8();
                  v79 = sub_247D99238();
                  *(_QWORD *)(v0 + 272) = sub_247D8E3E8(v79, v80, &v150);
                  sub_247D98F80();
                  swift_bridgeObjectRelease();
                  v81 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
                  v81(v75, v77);
                  _os_log_impl(&dword_247CFF000, log, type, "Using test data file for program ID %s: %s", (uint8_t *)v78, 0x16u);
                  swift_arrayDestroy();
                  MEMORY[0x249591C3C](v138, -1, -1);
                  MEMORY[0x249591C3C](v78, -1, -1);

                }
                else
                {
                  swift_bridgeObjectRelease_n();
                  v81 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
                  v81(v75, v77);

                }
                v81(v76, v77);
                v67 = v145;
                goto LABEL_48;
              }
              (*(void (**)(_QWORD, _QWORD))(v41 + 8))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 312));
              v59 += v60;
              if (!--v62)
                goto LABEL_42;
            }
          }
          else
          {
            swift_bridgeObjectRetain();
LABEL_42:
            v149(*(_QWORD *)(v0 + 408), 1, 1, *(_QWORD *)(v0 + 312));
          }
          v67 = v145;
          swift_bridgeObjectRelease();
          v42 = v144;
LABEL_48:
          v82 = *(_QWORD *)(v0 + 400);
          v30 = *(_QWORD *)(v0 + 312);
          sub_247D214D4(*(_QWORD *)(v0 + 416), v82);
          v147 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 48);
          v83 = v147(v82, 1, v30);
          v84 = *(_QWORD *)(v0 + 400);
          if (v83 == 1)
          {
            sub_247D52B54(*(_QWORD *)(v0 + 400));
            v85 = v143;
            if (v58)
            {
              v86 = v67 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
              swift_beginAccess();
              v87 = *(_QWORD *)(v41 + 72);
              v88 = *(void (**)(uint64_t, unint64_t, uint64_t))(v41 + 16);
              while (1)
              {
                v89 = *(_QWORD *)(v0 + 392);
                v30 = *(_QWORD *)(v0 + 312);
                v88(v89, v86, v30);
                v149(v89, 0, 1, v30);
                if (v147(v89, 1, v30) == 1)
                  break;
                (*(void (**)(_QWORD, _QWORD, _QWORD))(v41 + 32))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 312));
                v90 = *(_QWORD *)(v85 + 56);
                if (!v90)
                  goto LABEL_51;
                v30 = *(_QWORD *)(v85 + 48);
                v91 = HIBYTE(v90) & 0xF;
                if ((v90 & 0x2000000000000000) == 0)
                  v91 = v30 & 0xFFFFFFFFFFFFLL;
                if (v91)
                {
                  swift_bridgeObjectRetain();
                  *(_QWORD *)(v0 + 152) = sub_247D98980();
                  *(_QWORD *)(v0 + 160) = v92;
                  *(_QWORD *)(v0 + 184) = v30;
                  *(_QWORD *)(v0 + 192) = v90;
                  sub_247D0CD58();
                  v93 = sub_247D98FB0();
                  swift_bridgeObjectRelease();
                  if ((v93 & 1) != 0)
                  {
                    v98 = *(_QWORD *)(v0 + 416);
                    v100 = *(_QWORD *)(v0 + 336);
                    v99 = *(_QWORD *)(v0 + 344);
                    v101 = *(_QWORD *)(v0 + 312);
                    swift_bridgeObjectRelease();
                    sub_247D52B54(v98);
                    v88(v98, v99, v101);
                    v149(v98, 0, 1, v101);
                    v88(v100, v99, v101);
                    swift_bridgeObjectRetain();
                    v102 = sub_247D98B9C();
                    v103 = sub_247D98EF0();
                    v104 = os_log_type_enabled(v102, v103);
                    v105 = *(_QWORD *)(v0 + 368);
                    v106 = *(_QWORD *)(v0 + 336);
                    v107 = *(_QWORD *)(v0 + 344);
                    v108 = *(_QWORD *)(v0 + 312);
                    if (v104)
                    {
                      v146 = *(_QWORD *)(v0 + 344);
                      v109 = swift_slowAlloc();
                      loga = (os_log_t)swift_slowAlloc();
                      v150 = (uint64_t)loga;
                      *(_DWORD *)v109 = 136315394;
                      typea = v103;
                      swift_bridgeObjectRetain();
                      *(_QWORD *)(v0 + 232) = sub_247D8E3E8(v30, v90, &v150);
                      sub_247D98F80();
                      swift_bridgeObjectRelease_n();
                      *(_WORD *)(v109 + 12) = 2080;
                      sub_247D0DAD8();
                      v110 = sub_247D99238();
                      v30 = v111;
                      *(_QWORD *)(v0 + 240) = sub_247D8E3E8(v110, v111, &v150);
                      sub_247D98F80();
                      swift_bridgeObjectRelease();
                      v112 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
                      v112(v106, v108);
                      _os_log_impl(&dword_247CFF000, v102, typea, "Using test data file for adam ID %s: %s", (uint8_t *)v109, 0x16u);
                      swift_arrayDestroy();
                      MEMORY[0x249591C3C](loga, -1, -1);
                      MEMORY[0x249591C3C](v109, -1, -1);

                      v112(v146, v108);
                    }
                    else
                    {

                      v112 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
                      v112(v106, v108);
                      swift_bridgeObjectRelease_n();
                      v112(v107, v108);
                    }
                    v112(v105, v108);
                    goto LABEL_64;
                  }
                  (*(void (**)(_QWORD, _QWORD))(v41 + 8))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 312));
                  swift_bridgeObjectRelease();
                  v85 = v143;
                }
                else
                {
LABEL_51:
                  (*(void (**)(_QWORD, _QWORD))(v41 + 8))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 312));
                }
                v86 += v87;
                if (!--v58)
                  goto LABEL_62;
              }
            }
            else
            {
LABEL_62:
              v149(*(_QWORD *)(v0 + 392), 1, 1, *(_QWORD *)(v0 + 312));
            }
            v95 = *(_QWORD *)(v0 + 368);
            v96 = *(_QWORD *)(v0 + 312);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v95, v96);
LABEL_64:
            v3 = v139;
            v29 = v140;
            v42 = v144;
          }
          else
          {
            v94 = *(_QWORD *)(v0 + 368);
            v30 = *(_QWORD *)(v0 + 312);
            swift_bridgeObjectRelease();
            sub_247D52B54(v84);
            (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v94, v30);
            v29 = v140;
          }
          v36 = *(_QWORD *)(v0 + 384);
          v97 = *(_QWORD *)(v0 + 312);
          sub_247D214D4(*(_QWORD *)(v0 + 416), v36);
          LODWORD(v97) = v147(v36, 1, v97);
          sub_247D52B54(v36);
          if ((_DWORD)v97 != 1)
            goto LABEL_71;
        }
        else
        {
          v43 = *(_QWORD *)(v0 + 368);
          v44 = *(_QWORD *)(v0 + 312);
          v45 = v55;
          v46 = (void *)sub_247D98944();

          v30 = (uint64_t)v46;
          swift_willThrow();
          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v44);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2576F8328);
          v47 = swift_allocObject();
          *(_OWORD *)(v47 + 16) = xmmword_247D99ED0;
          v150 = 0;
          v151 = 0xE000000000000000;
          sub_247D99034();
          v48 = v151;
          *(_QWORD *)(v0 + 136) = v150;
          *(_QWORD *)(v0 + 144) = v48;
          v36 = v0 + 136;
          sub_247D98D34();
          *(_QWORD *)(v0 + 248) = v46;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544579E0);
          sub_247D990B8();
          v49 = *(_QWORD *)(v0 + 136);
          v50 = *(_QWORD *)(v0 + 144);
          *(_QWORD *)(v47 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v47 + 32) = v49;
          *(_QWORD *)(v47 + 40) = v50;
          sub_247D99304();
          swift_bridgeObjectRelease();

        }
        if (++v42 == v142)
          goto LABEL_71;
      }
      __break(1u);
LABEL_82:
      v29 = sub_247D49D30(0, v29[2] + 1, 1, v29);
    }
LABEL_71:
    swift_bridgeObjectRelease();
    v113 = *(_QWORD *)(v0 + 376);
    v114 = *(_QWORD *)(v0 + 312);
    v115 = *(_QWORD *)(v0 + 320);
    sub_247D214D4(*(_QWORD *)(v0 + 416), v113);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v113, 1, v114) == 1)
    {
      v116 = *(_QWORD *)(v0 + 376);
      swift_release();
      sub_247D52B54(v116);
      swift_retain_n();
      swift_bridgeObjectRetain();
      v117 = sub_247D98B9C();
      v118 = sub_247D98EE4();
      v119 = os_log_type_enabled(v117, v118);
      v120 = *(_QWORD *)(v0 + 304);
      if (v119)
      {
        v121 = swift_slowAlloc();
        v122 = swift_slowAlloc();
        v150 = v122;
        *(_DWORD *)v121 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 224) = sub_247D8E3E8(v148, v3, &v150);
        sub_247D98F80();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v121 + 12) = 2080;
        swift_beginAccess();
        v123 = *(_QWORD *)(v120 + 56);
        if (v123)
        {
          v124 = *(_QWORD *)(v120 + 48);
          v125 = v123;
        }
        else
        {
          v124 = 0;
          v125 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 216) = sub_247D8E3E8(v124, v125, &v150);
        sub_247D98F80();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_247CFF000, v117, v118, "Unable to locate test file URL for metadata with program ID %s, or adamId: %s", (uint8_t *)v121, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249591C3C](v122, -1, -1);
        MEMORY[0x249591C3C](v121, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      v133 = *(_QWORD *)(v0 + 416);
      sub_247D82314();
      swift_allocError();
      swift_willThrow();
      sub_247D52B54(v133);
      goto LABEL_80;
    }
    v126 = *(_QWORD *)(v0 + 376);
    v128 = *(_QWORD *)(v0 + 320);
    v127 = *(_QWORD *)(v0 + 328);
    v129 = *(_QWORD *)(v0 + 312);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 32))(v127, v126, v129);
    v14 = sub_247D98A10();
    v13 = v131;
    v132 = *(_QWORD *)(v0 + 416);
    (*(void (**)(_QWORD, _QWORD))(v128 + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312));
    sub_247D52B54(v132);
  }
  else
  {
    sub_247D1051C(*(_QWORD *)(v0 + 288), v1);
    v10 = sub_247D98B9C();
    v11 = sub_247D98EF0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_247CFF000, v10, v11, "Parsing provided existing data; not retrieving", v12, 2u);
      MEMORY[0x249591C3C](v12, -1, -1);
    }

    v14 = *(_QWORD *)(v0 + 288);
    v13 = *(_QWORD *)(v0 + 296);
  }
  *(_QWORD *)(v0 + 496) = v14;
  *(_QWORD *)(v0 + 504) = v13;
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_247D98A1C();
  *(_QWORD *)(v0 + 208) = 0;
  v17 = objc_msgSend(v15, sel_JSONObjectWithData_options_error_, v16, 2, v0 + 208);

  v18 = *(void **)(v0 + 208);
  if (v17)
  {
    v19 = v18;
    sub_247D98FBC();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7BA0);
    if (swift_dynamicCast())
    {
      v20 = *(double *)(v0 + 280);
      v21 = *(_QWORD *)(v0 + 200);
      type metadata accessor for TimedMetadataParser();
      *(_QWORD *)(v0 + 512) = sub_247D6E5D0(v21, v20);
      *(_QWORD *)(v0 + 520) = 0;
      swift_bridgeObjectRelease();
      return swift_task_switch();
    }
    swift_release();
    v26 = sub_247D98B9C();
    v27 = sub_247D98EE4();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_247CFF000, v26, v27, "JSON file is not of type [String: AnyObject]", v28, 2u);
      MEMORY[0x249591C3C](v28, -1, -1);
    }

    sub_247D82314();
    swift_allocError();
  }
  else
  {
    v25 = v18;
    swift_release();
    sub_247D98944();

  }
  swift_willThrow();
  sub_247D0D968(v14, v13);
LABEL_80:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D8DDE4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 528) = sub_247D98E24();
  sub_247D98E00();
  return swift_task_switch();
}

uint64_t sub_247D8DE78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 304);
  swift_release();
  sub_247D8E034(v2, v1);
  return swift_task_switch();
}

uint64_t sub_247D8DEFC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 504));
}

uint64_t sub_247D8E034(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5700);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  *(_QWORD *)(a1 + 104) = a2;
  swift_retain();
  swift_release();
  v7 = sub_247D98B9C();
  v8 = sub_247D98EF0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_247CFF000, v7, v8, "Fetching songs playlist state", v9, 2u);
    MEMORY[0x249591C3C](v9, -1, -1);
  }

  v10 = sub_247D98E48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_247D98E30();
  swift_retain();
  swift_retain();
  v11 = sub_247D98E24();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = a2;
  v12[5] = a1;
  sub_247D570BC((uint64_t)v6, (uint64_t)&unk_2576F7D38, (uint64_t)v12);
  return swift_release();
}

uint64_t TimedMetadataFetcherMock.init(programID:adamID:contentID:playablePassThrough:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_247D98BA8();
  return TimedMetadataFetcher.init(programID:adamID:contentID:playablePassThrough:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_247D8E298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  v2 = sub_247D98BB4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t TimedMetadataFetcherMock.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = TimedMetadataFetcher.deinit();
  v1 = v0 + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  v2 = sub_247D98BB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t TimedMetadataFetcherMock.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;

  v0 = TimedMetadataFetcher.deinit() + OBJC_IVAR____TtC13TVAppServices24TimedMetadataFetcherMock_logger;
  v1 = sub_247D98BB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  return swift_deallocClassInstance();
}

uint64_t sub_247D8E378(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_247D8E3E8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_247D98F80();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_247D8E3E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_247D8E614(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247D07E08((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_247D07E08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247D8E4B8()
{
  return type metadata accessor for TimedMetadataFetcherMock();
}

uint64_t type metadata accessor for TimedMetadataFetcherMock()
{
  uint64_t result;

  result = qword_2576F8358;
  if (!qword_2576F8358)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247D8E4FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247D98BB4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_247D8E568()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247D8E59C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_247D28CA8;
  return sub_247D7F578(a1, v4, v5, v7, v6);
}

uint64_t sub_247D8E614(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_247D98F8C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_247D8E7CC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_247D99070();
  if (!v8)
  {
    sub_247D990DC();
    __break(1u);
LABEL_17:
    result = sub_247D99124();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_247D8E7CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247D8E860(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_247D8EAB0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_247D8EAB0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247D8E860(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_247D8E9D4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_247D99040();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_247D990DC();
      __break(1u);
LABEL_10:
      v2 = sub_247D98D40();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_247D99124();
    __break(1u);
LABEL_14:
    result = sub_247D990DC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_247D8E9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247D8EA38(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_247D98D7C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2495910B4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_247D8EAB0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_247D99124();
  __break(1u);
  return result;
}

uint64_t URL.queryParameters.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  char v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t result;
  _QWORD v43[2];
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, unint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;

  v0 = sub_247D988A8();
  v51 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F6190);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247D988FC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247D988D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_247D914E4((uint64_t)v5);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v10 = sub_247D988C0();
  if (!v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return 0;
  }
  v44 = v9;
  v45 = v7;
  v46 = v6;
  v11 = *(_QWORD *)(v10 + 16);
  v43[1] = v10;
  if (!v11)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_30:
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
    swift_bridgeObjectRelease();
    return (uint64_t)v14;
  }
  v12 = v10 + ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
  v13 = *(void (**)(char *, unint64_t, uint64_t))(v51 + 16);
  v49 = *(_QWORD *)(v51 + 72);
  v50 = v13;
  v14 = (_QWORD *)MEMORY[0x24BEE4B00];
  v47 = v2;
  v48 = v0;
  v13(v2, v12, v0);
  while (1)
  {
    v16 = sub_247D98890();
    v18 = v17;
    v19 = sub_247D9889C();
    if (v20)
      break;
    swift_bridgeObjectRetain();
    v33 = sub_247D077D4(v16, v18);
    v35 = v34;
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53 = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_247D91CDC();
        v14 = v53;
      }
      swift_bridgeObjectRelease();
      sub_247D90A80(v33, (uint64_t)v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_8:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v2, v0);
    v12 += v49;
    if (!--v11)
      goto LABEL_30;
    v50(v2, v12, v0);
  }
  v21 = v20;
  v52 = v11;
  v22 = v19;
  v23 = swift_isUniquelyReferenced_nonNull_native();
  v53 = v14;
  v24 = v18;
  v26 = sub_247D077D4(v16, v18);
  v27 = v14[2];
  v28 = (v25 & 1) == 0;
  v29 = v27 + v28;
  if (!__OFADD__(v27, v28))
  {
    v30 = v25;
    if (v14[3] < v29)
    {
      sub_247D8EFFC(v29, v23);
      v31 = sub_247D077D4(v16, v24);
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_34;
      v26 = v31;
      v14 = v53;
      if ((v30 & 1) == 0)
        goto LABEL_22;
LABEL_6:
      v15 = (uint64_t *)(v14[7] + 16 * v26);
      swift_bridgeObjectRelease();
      *v15 = v22;
      v15[1] = v21;
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v2 = v47;
      v0 = v48;
      v11 = v52;
      goto LABEL_8;
    }
    if ((v23 & 1) != 0)
    {
      v14 = v53;
      if ((v25 & 1) != 0)
        goto LABEL_6;
    }
    else
    {
      sub_247D91CDC();
      v14 = v53;
      if ((v30 & 1) != 0)
        goto LABEL_6;
    }
LABEL_22:
    v14[(v26 >> 6) + 8] |= 1 << v26;
    v37 = (uint64_t *)(v14[6] + 16 * v26);
    *v37 = v16;
    v37[1] = v24;
    v38 = (uint64_t *)(v14[7] + 16 * v26);
    *v38 = v22;
    v38[1] = v21;
    v39 = v14[2];
    v40 = __OFADD__(v39, 1);
    v41 = v39 + 1;
    if (v40)
      goto LABEL_33;
    v14[2] = v41;
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  result = sub_247D992A4();
  __break(1u);
  return result;
}

uint64_t sub_247D8EFFC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544576D8);
  v42 = a2;
  v6 = sub_247D9910C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247D8F320(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for UTSEndpoint();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84F0);
  v43 = a2;
  v9 = sub_247D9910C();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_247D105B0(v30, (uint64_t)v7);
    }
    else
    {
      sub_247D35C9C(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_247D105B0((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_247D8F688(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  int v39;
  _OWORD v40[2];

  v3 = v2;
  v5 = sub_247D990D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F8500);
  v39 = a2;
  v10 = sub_247D9910C();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v38 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v36 = v2;
  v37 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = v38;
    v24 = v38[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_34;
      v24 = v38[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_34:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v38[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v37)
              goto LABEL_34;
            v24 = v38[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v39 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      sub_247D077C4((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v21), v40);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      sub_247D07E08(*(_QWORD *)(v9 + 56) + 32 * v21, (uint64_t)v40);
    }
    result = sub_247D98C74();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    result = (uint64_t)sub_247D077C4(v40, (_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v19));
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = v38;
  if ((v39 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v9 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_247D8FA0C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84F8);
  v37 = a2;
  v6 = sub_247D9910C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_247D22558(v25, (uint64_t)v38);
    }
    else
    {
      sub_247D0CF04((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_247D22558(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247D8FD30(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5388);
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_247D98B00();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5380);
  v11 = sub_247D9910C();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_247D92FDC();
    result = sub_247D98C74();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_247D90118(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5368);
  v36 = a2;
  v6 = sub_247D9910C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247D9042C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5360);
  v37 = a2;
  v6 = sub_247D9910C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247D90734(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38[17];
  _BYTE v39[144];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7F18);
  v37 = a2;
  v6 = sub_247D9910C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      if ((v37 & 1) != 0)
        goto LABEL_10;
      goto LABEL_23;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_22;
          }
        }
        v13 = v24;
      }
    }
LABEL_22:
    v10 = (v23 - 1) & v23;
    v17 = __clz(__rbit64(v23)) + (v13 << 6);
    if ((v37 & 1) != 0)
    {
LABEL_10:
      v18 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v19 = *v18;
      v20 = v18[1];
      sub_247D929C0(*(_QWORD *)(v5 + 56) + 136 * v17, (uint64_t)v38);
      goto LABEL_24;
    }
LABEL_23:
    v25 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v19 = *v25;
    v20 = v25[1];
    sub_247D929C0(*(_QWORD *)(v5 + 56) + 136 * v17, (uint64_t)v38);
    swift_bridgeObjectRetain();
    sub_247D92A08(v38);
LABEL_24:
    sub_247D929C0((uint64_t)v38, (uint64_t)v39);
    sub_247D99310();
    sub_247D98D10();
    result = sub_247D99334();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v19;
    v15[1] = v20;
    result = sub_247D929C0((uint64_t)v39, *(_QWORD *)(v7 + 56) + 136 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_247D90A80(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_247D98FE0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_247D99310();
        swift_bridgeObjectRetain();
        sub_247D98D10();
        v9 = sub_247D99334();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_247D90C54(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;

  v4 = sub_247D990D0();
  v36 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_247D98FE0();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v35 = (result + 1) & v11;
      v12 = *(_QWORD *)(v36 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v34(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = sub_247D98C74();
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v35)
        {
          if (v19 >= v35 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v12 = v15;
              v13 = v17;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_OWORD *)(v23 + 32 * a1);
            v25 = (_OWORD *)(v23 + 32 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 2))
            {
              v26 = v25[1];
              *v24 = *v25;
              v24[1] = v26;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v35 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v27;
    v29 = (-1 << a1) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v27;
    v28 = (-1 << a1) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(a2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_247D90ED8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_247D98FE0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_247D99310();
        swift_bridgeObjectRetain();
        sub_247D98D10();
        v11 = sub_247D99334();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_247D910C0(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;

  v4 = sub_247D98B00();
  v36 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_247D98FE0();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v35 = (result + 1) & v11;
      v12 = *(_QWORD *)(v36 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v34(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_247D92FDC();
        v17 = sub_247D98C74();
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v35)
        {
          if (v18 >= v35 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            if (v14 * a1 < v15
              || *(_QWORD *)(a2 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v15 + v14))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v14 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v21 = *(_QWORD *)(a2 + 56);
            v22 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576F5388) - 8) + 72);
            v23 = v22 * a1;
            result = v21 + v22 * a1;
            v24 = v22 * v10;
            v25 = v21 + v22 * v10 + v22;
            if (v23 < v24 || result >= v25)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v16;
            }
            else
            {
              a1 = v10;
              v13 = v16;
              if (v23 != v24)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v16;
                a1 = v10;
              }
            }
          }
        }
        else if (v18 >= v35 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        v10 = (v10 + 1) & v13;
        v12 = v14;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v27;
    v29 = (-1 << a1) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v27;
    v28 = (-1 << a1) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(a2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_247D91370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_247D077D4(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_247D91CDC();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_247D8EFFC(v17, a5 & 1);
  v23 = sub_247D077D4(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_247D992A4();
  __break(1u);
  return result;
}

uint64_t sub_247D914E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F6190);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247D91524(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_247D077D4(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for UTSEndpoint() - 8) + 72) * v12;
        return sub_247D920C0(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_247D91E94();
      goto LABEL_7;
    }
    sub_247D8F320(v15, a4 & 1);
    v22 = sub_247D077D4(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_247D91A90(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_247D992A4();
  __break(1u);
  return result;
}

_OWORD *sub_247D91658(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _OWORD *v21;
  _OWORD *result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_247D990D0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_247D75AC0(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (_OWORD *)(v20[7] + 32 * v14);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
        return sub_247D077C4(a1, v21);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_247D92104();
      goto LABEL_7;
    }
    sub_247D8F688(v17, a3 & 1);
    v23 = sub_247D75AC0(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_247D91B18(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = (_OWORD *)sub_247D992A4();
  __break(1u);
  return result;
}

uint64_t sub_247D917D4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_247D98B00();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_247D75BB4(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5388);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_247D92528();
      goto LABEL_7;
    }
    sub_247D8FD30(v17, a3 & 1);
    v24 = sub_247D75BB4(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_247D91BB8(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_247D992A4();
  __break(1u);
  return result;
}

_OWORD *sub_247D91960(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_247D077D4(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_247D077C4(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_247D92A60();
      goto LABEL_7;
    }
    sub_247D074C8(v15, a4 & 1);
    v21 = sub_247D077D4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_247D91C74(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_247D992A4();
  __break(1u);
  return result;
}

uint64_t sub_247D91A90(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for UTSEndpoint();
  result = sub_247D105B0(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

_OWORD *sub_247D91B18(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_247D990D0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_247D077C4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_247D91BB8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_247D98B00();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5388);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

_OWORD *sub_247D91C74(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_247D077C4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_247D91CDC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544576D8);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_247D91E94()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for UTSEndpoint();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84F0);
  v5 = *v0;
  v6 = sub_247D99100();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_247D35C9C(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_247D105B0((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_247D920C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UTSEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *sub_247D92104()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  _OWORD v26[2];

  v1 = v0;
  v2 = sub_247D990D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F8500);
  v6 = *v0;
  v7 = sub_247D99100();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v24 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v25 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v25 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 32 * v18;
    sub_247D07E08(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = sub_247D077C4(v26, (_OWORD *)(*(_QWORD *)(v8 + 56) + v20));
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_247D92340()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F84F8);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_247D0CF04(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_247D22558(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

char *sub_247D92528()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5388);
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_247D98B00();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5380);
  v33 = v0;
  v3 = *v0;
  v4 = sub_247D99100();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_247D9280C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5368);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_247D929C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_247D92A08(uint64_t *a1)
{
  sub_247D80D98(*a1, a1[1]);
  return a1;
}

void *sub_247D92A60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544579C8);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_247D07E08(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_247D077C4(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_247D92C44()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F5360);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_247D92DEC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26[17];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F7F18);
  v2 = *v0;
  v3 = sub_247D99100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 136 * v15;
    sub_247D929C0(*(_QWORD *)(v2 + 56) + 136 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_247D929C0((uint64_t)v26, *(_QWORD *)(v4 + 56) + v20);
    swift_bridgeObjectRetain();
    result = sub_247D92A08(v26);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_247D92FDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576F6BE0;
  if (!qword_2576F6BE0)
  {
    v1 = sub_247D98B00();
    result = MEMORY[0x249591B70](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_2576F6BE0);
  }
  return result;
}

uint64_t sub_247D93024(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_247D9302C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UTSConfigurationResponse()
{
  return objc_opt_self();
}

uint64_t sub_247D93070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v5 + 72) = a3;
  *(_QWORD *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = a2;
  *(_QWORD *)(v5 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B28);
  *(_QWORD *)(v5 + 96) = swift_task_alloc();
  *(_QWORD *)(v5 + 104) = _s5CacheV5ValueOMa(0);
  v6 = swift_task_alloc();
  *(_BYTE *)(v5 + 144) = *(_BYTE *)v4;
  *(_BYTE *)(v5 + 145) = *(_BYTE *)(v4 + 1);
  v7 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)(v5 + 112) = v6;
  *(_QWORD *)(v5 + 120) = v7;
  *(_BYTE *)(v5 + 146) = *(_BYTE *)(v4 + 16);
  return swift_task_switch();
}

uint64_t sub_247D93114()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  unsigned __int8 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_BYTE *)(v0 + 145);
  v3 = *(_BYTE *)(v0 + 144);
  *(_QWORD *)(v0 + 40) = &_s9FavoritesO6ActionVN;
  *(_QWORD *)(v0 + 48) = &off_25195C4B8;
  *(_BYTE *)(v0 + 16) = v3;
  *(_BYTE *)(v0 + 17) = v2;
  *(_QWORD *)(v0 + 24) = v1;
  v4 = *(_BYTE *)(v0 + 146);
  *(_BYTE *)(v0 + 32) = v4;
  sub_247D98330(v1, v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v5;
  *v5 = v0;
  v5[1] = sub_247D931A8;
  return sub_247D83558(*(_QWORD *)(v0 + 112), v0 + 16, *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
}

uint64_t sub_247D931A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_247D93214()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;

  v1 = *(unsigned __int8 *)(v0 + 145);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_BYTE **)(v0 + 96);
  v4 = (uint64_t)&v3[*(int *)(*(_QWORD *)(v0 + 88) + 48)];
  *v3 = v1;
  sub_247D104B0(v2, v4, _s5CacheV5ValueOMa);
  if (v1 == 1 && swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = *(_QWORD *)(v0 + 56);
    sub_247D10560(*(_QWORD *)(v0 + 112), _s5CacheV5ValueOMa);
    sub_247D7A8D4(v4, v5, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 96);
    sub_247D883F0();
    swift_allocError();
    swift_willThrow();
    sub_247D10560(v7, _s5CacheV5ValueOMa);
    sub_247D07E44(v8, &qword_254456B28);
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t sub_247D93344()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SportsFavoriteService.Favorites.Favorite.Type.init(rawValue:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_247D99148();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t SportsFavoriteService.Favorites.Favorite.Type.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756761656CLL;
  else
    return 1835099508;
}

uint64_t sub_247D9341C(char *a1, char *a2)
{
  return sub_247D84EA4(*a1, *a2);
}

uint64_t sub_247D93428()
{
  sub_247D99310();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t sub_247D9349C()
{
  sub_247D98D10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D934EC()
{
  sub_247D99310();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t sub_247D9355C@<X0>(char *a1@<X8>)
{
  return SportsFavoriteService.Favorites.Favorite.Type.init(rawValue:)(a1);
}

void sub_247D93568(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 1835099508;
  if (*v1)
    v2 = 0x65756761656CLL;
  v3 = 0xE400000000000000;
  if (*v1)
    v3 = 0xE600000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_247D9359C()
{
  sub_247D982EC();
  return sub_247D98DD0();
}

uint64_t sub_247D935F8()
{
  sub_247D982EC();
  return sub_247D98DC4();
}

uint64_t SportsFavoriteService.Favorites.Favorite.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void SportsFavoriteService.Favorites.Favorite.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t SportsFavoriteService.Favorites.Favorite.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_247D98D10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D936C4()
{
  sub_247D97078();
  return sub_247D99394();
}

uint64_t sub_247D936EC()
{
  sub_247D97078();
  return sub_247D993A0();
}

uint64_t SportsFavoriteService.Favorites.Favorite.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F85A8);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D97078();
  sub_247D9937C();
  v13 = 0;
  sub_247D991F0();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_247D970BC();
    sub_247D99220();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

uint64_t SportsFavoriteService.Favorites.Favorite.hashValue.getter()
{
  sub_247D99310();
  swift_bridgeObjectRetain();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t SportsFavoriteService.Favorites.Favorite.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F85C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D97078();
  sub_247D99370();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = 0;
  v9 = sub_247D99190();
  v11 = v10;
  v15 = 1;
  sub_247D97100();
  swift_bridgeObjectRetain();
  sub_247D991C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v16;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D93A54@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SportsFavoriteService.Favorites.Favorite.init(from:)(a1, a2);
}

uint64_t sub_247D93A68(_QWORD *a1)
{
  return SportsFavoriteService.Favorites.Favorite.encode(to:)(a1);
}

uint64_t sub_247D93A7C()
{
  sub_247D99310();
  swift_bridgeObjectRetain();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t sub_247D93AD4()
{
  swift_bridgeObjectRetain();
  sub_247D98D10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D93B18()
{
  sub_247D99310();
  swift_bridgeObjectRetain();
  sub_247D98D10();
  swift_bridgeObjectRelease();
  return sub_247D99334();
}

uint64_t sub_247D93B70()
{
  _BYTE *v0;
  uint64_t v1;
  char v2;
  int64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)v0;
  v2 = v0[8];
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if ((v2 & 1) != 0)
  {
    if (v3)
    {
      v19 = MEMORY[0x24BEE4AF8];
      sub_247D80E60(0, v3, 0);
      v4 = v19;
      v5 = (uint64_t *)(v1 + 40);
      do
      {
        v7 = *(v5 - 1);
        v6 = *v5;
        v8 = *(_QWORD *)(v19 + 16);
        v9 = *(_QWORD *)(v19 + 24);
        swift_bridgeObjectRetain();
        if (v8 >= v9 >> 1)
          sub_247D80E60(v9 > 1, v8 + 1, 1);
        v5 += 2;
        *(_QWORD *)(v19 + 16) = v8 + 1;
        v10 = v19 + 24 * v8;
        *(_QWORD *)(v10 + 32) = v7;
        *(_QWORD *)(v10 + 40) = v6;
        *(_BYTE *)(v10 + 48) = 1;
        --v3;
      }
      while (v3);
    }
  }
  else if (v3)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_247D80E60(0, v3, 0);
    v4 = v20;
    v11 = (uint64_t *)(v1 + 40);
    do
    {
      v13 = *(v11 - 1);
      v12 = *v11;
      v14 = *(_QWORD *)(v20 + 16);
      v15 = *(_QWORD *)(v20 + 24);
      swift_bridgeObjectRetain();
      if (v14 >= v15 >> 1)
        sub_247D80E60(v15 > 1, v14 + 1, 1);
      v11 += 2;
      *(_QWORD *)(v20 + 16) = v14 + 1;
      v16 = v20 + 24 * v14;
      *(_QWORD *)(v16 + 32) = v13;
      *(_QWORD *)(v16 + 40) = v12;
      *(_BYTE *)(v16 + 48) = 0;
      --v3;
    }
    while (v3);
  }
  v17 = sub_247D4DFF4(v4);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t static SportsFavoriteService.Favorites.Modification.FailureReason.== infix(_:_:)()
{
  return 1;
}

uint64_t SportsFavoriteService.Favorites.Modification.FailureReason.hash(into:)()
{
  return sub_247D9931C();
}

uint64_t SportsFavoriteService.Favorites.Modification.FailureReason.hashValue.getter()
{
  sub_247D99310();
  sub_247D9931C();
  return sub_247D99334();
}

uint64_t SportsFavoriteService.Favorites.State.favorites.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SportsFavoriteService.Favorites.State.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SportsFavoriteService.Favorites.State();
  return sub_247D0DA3C(v1 + *(int *)(v3 + 20), a1, &qword_254456B10);
}

uint64_t sub_247D93DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  char v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v3 = v2;
  v6 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v26 = a2;
    swift_bridgeObjectRetain();
    v13 = (_BYTE *)(a1 + 40);
    v14 = MEMORY[0x24BEE4B08];
    do
    {
      v15 = *((_QWORD *)v13 - 1);
      v16 = *v13;
      v13 += 16;
      v27 = v15;
      v28 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = sub_247D93B70();
      v14 = sub_247D93FC4(v17, v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    a2 = v26;
    if (*(_QWORD *)(v14 + 16))
      goto LABEL_5;
  }
  else
  {
    v14 = MEMORY[0x24BEE4B08];
    if (*(_QWORD *)(MEMORY[0x24BEE4B08] + 16))
    {
LABEL_5:
      v18 = *v3;
      swift_bridgeObjectRetain();
      v19 = sub_247D93FC4(v14, v18);
      sub_247D98AD0();
      v20 = sub_247D98AE8();
      v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
      v21(v11, 0, 1, v20);
      v22 = *((_BYTE *)v3 + *(int *)(v6 + 24));
      v23 = (uint64_t)v8 + *(int *)(v6 + 20);
      v21((char *)v23, 1, 1, v20);
      *v8 = v19;
      sub_247D7A864((uint64_t)v11, v23);
      *((_BYTE *)v8 + *(int *)(v6 + 24)) = v22;
      return sub_247D7A8D4((uint64_t)v8, a2, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
    }
  }
  sub_247D104B0((uint64_t)v3, a2, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D93FC4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = result;
  v3 = 0;
  v5 = result + 56;
  v4 = *(_QWORD *)(result + 56);
  v20 = a2;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v4;
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v3 << 6);
      goto LABEL_5;
    }
    v16 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v9)
      goto LABEL_23;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    ++v3;
    if (!v17)
    {
      v3 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_23;
      v17 = *(_QWORD *)(v5 + 8 * v3);
      if (!v17)
      {
        v3 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_23;
        v17 = *(_QWORD *)(v5 + 8 * v3);
        if (!v17)
        {
          v3 = v16 + 3;
          if (v16 + 3 >= v9)
            goto LABEL_23;
          v17 = *(_QWORD *)(v5 + 8 * v3);
          if (!v17)
            break;
        }
      }
    }
LABEL_22:
    v8 = (v17 - 1) & v17;
    v11 = __clz(__rbit64(v17)) + (v3 << 6);
LABEL_5:
    v12 = *(_QWORD *)(v2 + 48) + 24 * v11;
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v15 = *(_BYTE *)(v12 + 16);
    swift_bridgeObjectRetain();
    sub_247D5A2A0((uint64_t)&v19, v13, v14, v15);
    result = swift_bridgeObjectRelease();
  }
  v18 = v16 + 4;
  if (v18 >= v9)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
  {
    v3 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v3 >= v9)
      goto LABEL_23;
    v17 = *(_QWORD *)(v5 + 8 * v3);
    ++v18;
    if (v17)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_247D94154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v3 = v2;
  v6 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
    v14 = MEMORY[0x24BEE4B08];
    v18 = *(_QWORD *)(MEMORY[0x24BEE4B08] + 16);
    if (v18)
      goto LABEL_5;
LABEL_8:
    sub_247D104B0(v3, a2, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
    return swift_bridgeObjectRelease();
  }
  v26 = v2;
  v27 = a2;
  swift_bridgeObjectRetain();
  v13 = (_BYTE *)(a1 + 40);
  v14 = MEMORY[0x24BEE4B08];
  do
  {
    v15 = *((_QWORD *)v13 - 1);
    v16 = *v13;
    v13 += 16;
    v28 = v15;
    v29 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = sub_247D93B70();
    v14 = sub_247D93FC4(v17, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  v3 = v26;
  a2 = v27;
  v18 = *(_QWORD *)(v14 + 16);
  if (!v18)
    goto LABEL_8;
LABEL_5:
  v19 = *(_QWORD *)v3;
  if (v18 <= *(_QWORD *)(*(_QWORD *)v3 + 16) >> 3)
  {
    v28 = *(_QWORD *)v3;
    swift_bridgeObjectRetain();
    sub_247D9640C(v14);
    swift_bridgeObjectRelease();
    v20 = v28;
  }
  else
  {
    swift_bridgeObjectRetain();
    v20 = sub_247D965C8(v14, v19);
    swift_bridgeObjectRelease();
  }
  sub_247D98AD0();
  v22 = sub_247D98AE8();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v11, 0, 1, v22);
  v24 = *(_BYTE *)(v3 + *(int *)(v6 + 24));
  v25 = (uint64_t)v8 + *(int *)(v6 + 20);
  v23((char *)v25, 1, 1, v22);
  *v8 = v20;
  sub_247D7A864((uint64_t)v11, v25);
  *((_BYTE *)v8 + *(int *)(v6 + 24)) = v24;
  return sub_247D7A8D4((uint64_t)v8, a2, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
}

uint64_t sub_247D943B0()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000010;
  if (*v0 != 1)
    v1 = 0x79747269447369;
  if (*v0)
    return v1;
  else
    return 0x657469726F766166;
}

uint64_t sub_247D94414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247D98194(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247D94438()
{
  sub_247D97180();
  return sub_247D99394();
}

uint64_t sub_247D94460()
{
  sub_247D97180();
  return sub_247D993A0();
}

uint64_t SportsFavoriteService.Favorites.State.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F85D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D97180();
  sub_247D9937C();
  v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254456C68);
  sub_247D97208(&qword_2576F85D8, (uint64_t (*)(void))sub_247D971C4, MEMORY[0x24BEE1700]);
  sub_247D99220();
  if (!v2)
  {
    type metadata accessor for SportsFavoriteService.Favorites.State();
    v10[6] = 1;
    sub_247D98AE8();
    sub_247D88598(&qword_2576F7FD8, MEMORY[0x24BDCE920]);
    sub_247D991E4();
    v10[5] = 2;
    sub_247D991FC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SportsFavoriteService.Favorites.State.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  uint64_t v33;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
  MEMORY[0x24BDAC7A8](v3);
  v25 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456C90);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SportsFavoriteService.Favorites.State();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (uint64_t)v11 + *(int *)(v9 + 20);
  v13 = sub_247D98AE8();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v28 = v12;
  v14(v12, 1, 1, v13);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247D97180();
  v27 = v7;
  v15 = v29;
  sub_247D99370();
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_247D07E44(v28, &qword_254456B10);
  }
  else
  {
    v16 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254456C68);
    v32 = 0;
    sub_247D97208(&qword_254456C70, (uint64_t (*)(void))sub_247D97270, MEMORY[0x24BEE1720]);
    v17 = v26;
    sub_247D991C0();
    v18 = (uint64_t)v11;
    *v11 = v33;
    v31 = 1;
    sub_247D88598(&qword_254456B08, MEMORY[0x24BDCE960]);
    v19 = (uint64_t)v25;
    sub_247D99184();
    sub_247D7A864(v19, v28);
    v30 = 2;
    v20 = v27;
    v21 = sub_247D9919C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v17);
    *(_BYTE *)(v18 + *(int *)(v8 + 24)) = v21 & 1;
    sub_247D104B0(v18, v24, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_247D10560(v18, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
  }
}

uint64_t sub_247D94958@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SportsFavoriteService.Favorites.State.init(from:)(a1, a2);
}

uint64_t sub_247D9496C(_QWORD *a1)
{
  return SportsFavoriteService.Favorites.State.encode(to:)(a1);
}

uint64_t sub_247D94980()
{
  uint64_t v0;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 16) || (*(_BYTE *)(v0 + 8) & 1) == 0)
    return 0;
  if (qword_254456C58 != -1)
    swift_once();
  sub_247D98ECC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254457820);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_247D99ED0;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254457930);
  *(_QWORD *)(v2 + 64) = sub_247D98550((unint64_t *)&qword_254457938, MEMORY[0x24BDCFBF8]);
  *(_QWORD *)(v2 + 32) = &unk_251954C68;
  sub_247D98B60();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_247D94A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 64) = a2;
  *(_QWORD *)(v4 + 72) = a3;
  *(_QWORD *)(v4 + 56) = a1;
  type metadata accessor for SportsFavoriteService.UserConsent.State();
  *(_QWORD *)(v4 + 80) = swift_task_alloc();
  *(_QWORD *)(v4 + 88) = _s5CacheV5ValueOMa(0);
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  *(_QWORD *)(v4 + 104) = swift_task_alloc();
  *(_BYTE *)(v4 + 128) = *(_BYTE *)(v3 + 16);
  return swift_task_switch();
}

uint64_t sub_247D94B18()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_BYTE *)(v0 + 128) == 1)
  {
    *(_QWORD *)(v0 + 40) = &_s11UserConsentO6ActionVN;
    *(_QWORD *)(v0 + 48) = &off_25195B988;
    *(_WORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 18) = 3;
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v1;
    *v1 = v0;
    v1[1] = sub_247D94BD4;
    return sub_247D83558(*(_QWORD *)(v0 + 104), v0 + 16, *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_247D94BD4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_247D94C40()
{
  uint64_t v0;
  int EnumCaseMultiPayload;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unsigned __int8 *v5;
  unsigned int v6;
  char v7;
  uint64_t v8;

  sub_247D104B0(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 96), _s5CacheV5ValueOMa);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  if (EnumCaseMultiPayload == 1)
  {
    sub_247D79BCC();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    sub_247D10560(v3, _s5CacheV5ValueOMa);
    sub_247D10560(v2, _s5CacheV5ValueOMa);
  }
  else
  {
    v5 = *(unsigned __int8 **)(v0 + 80);
    sub_247D7A8D4(*(_QWORD *)(v0 + 96), (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.UserConsent.State);
    sub_247D10560(v2, _s5CacheV5ValueOMa);
    v6 = *v5;
    sub_247D10560((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.UserConsent.State);
    if (v6 > 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = sub_247D99268();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0)
      {
        if (qword_254456C58 != -1)
          swift_once();
        sub_247D98EE4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254457820);
        v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_247D99ED0;
        *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254457930);
        *(_QWORD *)(v8 + 64) = sub_247D98550((unint64_t *)&qword_254457938, MEMORY[0x24BDCFBF8]);
        *(_QWORD *)(v8 + 32) = &unk_251954C98;
        sub_247D98B60();
        swift_bridgeObjectRelease();
        sub_247D98594();
        swift_allocError();
        swift_willThrow();
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D94ED8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D94F30()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 8);
  *(_BYTE *)(v1 + 152) = *(_BYTE *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_247D94F54()
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t (*v27)(void);
  uint64_t v29;
  _QWORD *v30;
  uint64_t (*v31)(uint64_t, unint64_t, void *, void *);
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  char v36;

  if (!*(_BYTE *)(v0 + 152))
  {
    sub_247D883F0();
    swift_allocError();
    swift_willThrow();
    v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
  if (*(_BYTE *)(v0 + 152) != 1)
  {
    v7 = *(_QWORD *)(v0 + 16);
    v8 = swift_bridgeObjectRetain();
    v9 = sub_247D95A24(v8);
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
    if (v10)
    {
      v11 = sub_247D95A24(v7);
      *(_QWORD *)(v0 + 88) = v11;
      swift_bridgeObjectRelease();
      if (qword_254457630 != -1)
        swift_once();
      v35 = v11;
      v36 = 3;
      swift_bridgeObjectRetain();
      v12 = sub_247D20C54((uint64_t)&v35);
      *(_QWORD *)(v0 + 96) = v12;
      v29 = (uint64_t)v12;
      v34 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
      v30 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v30;
      v31 = sub_247D956CC;
      goto LABEL_24;
    }
    sub_247D95A24(*(_QWORD *)(v0 + 16));
    v21 = v20;
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRelease();
    v23 = *(_QWORD *)(v0 + 16);
    if (v22)
    {
      sub_247D95A24(*(_QWORD *)(v0 + 16));
      v25 = v24;
      *(_QWORD *)(v0 + 120) = v24;
      sub_247D9835C(v23, 2u);
      swift_bridgeObjectRelease();
      if (qword_254457630 != -1)
        swift_once();
      v35 = v25;
      v36 = 4;
      swift_bridgeObjectRetain();
      v26 = sub_247D20C54((uint64_t)&v35);
      *(_QWORD *)(v0 + 128) = v26;
      v29 = (uint64_t)v26;
      v34 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
      v30 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 136) = v30;
      v31 = sub_247D95910;
      goto LABEL_24;
    }
    v32 = *(_QWORD *)(v0 + 16);
    v33 = 2;
LABEL_23:
    sub_247D9835C(v32, v33);
    v27 = *(uint64_t (**)(void))(v0 + 8);
    return v27();
  }
  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_bridgeObjectRetain();
  v3 = sub_247D95A24(v2);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    sub_247D95A24(*(_QWORD *)(v0 + 16));
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = *(_QWORD *)(v14 + 16);
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v0 + 16);
    if (v15)
    {
      sub_247D95A24(*(_QWORD *)(v0 + 16));
      v18 = v17;
      *(_QWORD *)(v0 + 56) = v17;
      sub_247D9835C(v16, 1u);
      swift_bridgeObjectRelease();
      if (qword_254457630 != -1)
        swift_once();
      v35 = v18;
      v36 = 2;
      swift_bridgeObjectRetain();
      v19 = sub_247D20C54((uint64_t)&v35);
      *(_QWORD *)(v0 + 64) = v19;
      v29 = (uint64_t)v19;
      v34 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
      v30 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v30;
      v31 = sub_247D955B8;
      goto LABEL_24;
    }
    v32 = *(_QWORD *)(v0 + 16);
    v33 = 1;
    goto LABEL_23;
  }
  v5 = sub_247D95A24(v1);
  *(_QWORD *)(v0 + 24) = v5;
  swift_bridgeObjectRelease();
  if (qword_254457630 != -1)
    swift_once();
  v35 = v5;
  v36 = 1;
  swift_bridgeObjectRetain();
  v6 = sub_247D20C54((uint64_t)&v35);
  *(_QWORD *)(v0 + 32) = v6;
  v29 = (uint64_t)v6;
  v34 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v30;
  v31 = sub_247D95378;
LABEL_24:
  *v30 = v0;
  v30[1] = v31;
  return v34(v29);
}

uint64_t sub_247D95378(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)v5 + 48) = v4;
  swift_task_dealloc();
  if (!v4)
  {
    sub_247D0D968(a1, a2);
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_247D9541C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(void);
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  char v15;

  swift_bridgeObjectRelease();
  v1 = v0[6];
  sub_247D95A24(v0[2]);
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  v5 = v0[2];
  if (!v4)
  {
    sub_247D9835C(v0[2], 1u);
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  sub_247D95A24(v0[2]);
  v7 = v6;
  v0[7] = v6;
  sub_247D9835C(v5, 1u);
  swift_bridgeObjectRelease();
  if (qword_254457630 != -1)
    swift_once();
  v14 = v7;
  v15 = 2;
  swift_bridgeObjectRetain();
  v8 = sub_247D20C54((uint64_t)&v14);
  v0[8] = v8;
  if (v1)
  {
    swift_bridgeObjectRelease();
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  v11 = (uint64_t)v8;
  v13 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
  v12 = (_QWORD *)swift_task_alloc();
  v0[9] = v12;
  *v12 = v0;
  v12[1] = sub_247D955B8;
  return v13(v11);
}

uint64_t sub_247D95570()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  sub_247D9835C(v1, 1u);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D955B8(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)v5 + 80) = v4;
  swift_task_dealloc();
  if (!v4)
  {
    sub_247D0D968(a1, a2);
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_247D9565C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D95690()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D956CC(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)v5 + 112) = v4;
  swift_task_dealloc();
  if (!v4)
  {
    sub_247D0D968(a1, a2);
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_247D95770()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(void);
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  char v15;

  swift_bridgeObjectRelease();
  v1 = v0[14];
  sub_247D95A24(v0[2]);
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  v5 = v0[2];
  if (!v4)
  {
    sub_247D9835C(v0[2], 2u);
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  sub_247D95A24(v0[2]);
  v7 = v6;
  v0[15] = v6;
  sub_247D9835C(v5, 2u);
  swift_bridgeObjectRelease();
  if (qword_254457630 != -1)
    swift_once();
  v14 = v7;
  v15 = 4;
  swift_bridgeObjectRetain();
  v8 = sub_247D20C54((uint64_t)&v14);
  v0[16] = v8;
  if (v1)
  {
    swift_bridgeObjectRelease();
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  v11 = (uint64_t)v8;
  v13 = (uint64_t (*)(uint64_t))((char *)&dword_2576F5260 + dword_2576F5260);
  v12 = (_QWORD *)swift_task_alloc();
  v0[17] = v12;
  *v12 = v0;
  v12[1] = sub_247D95910;
  return v13(v11);
}

uint64_t sub_247D958C4()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  sub_247D9835C(v1, 2u);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D95910(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)v5 + 144) = v4;
  swift_task_dealloc();
  if (!v4)
  {
    sub_247D0D968(a1, a2);
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_247D959B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D959E8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247D95A24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B08];
  v17 = a1 + 32;
  swift_bridgeObjectRetain();
  v2 = 0;
  v3 = MEMORY[0x24BEE4B08];
  v4 = MEMORY[0x24BEE4B08];
  do
  {
    v6 = (uint64_t *)(v17 + 16 * v2);
    v7 = *v6;
    if ((v6[1] & 1) != 0)
    {
      v19 = v3;
      v8 = *(_QWORD *)(v7 + 16);
      if (v8)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v9 = (uint64_t *)(v7 + 40);
        do
        {
          v10 = *(v9 - 1);
          v11 = *v9;
          swift_bridgeObjectRetain();
          sub_247D02458(&v18, v10, v11);
          swift_bridgeObjectRelease();
          v9 += 2;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v3 = v19;
      }
    }
    else
    {
      v19 = v4;
      v12 = *(_QWORD *)(v7 + 16);
      if (v12)
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v13 = (uint64_t *)(v7 + 40);
        do
        {
          v14 = *(v13 - 1);
          v15 = *v13;
          swift_bridgeObjectRetain();
          sub_247D02458(&v18, v14, v15);
          swift_bridgeObjectRelease();
          v13 += 2;
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
        v5 = v19;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v5 = v4;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 = v5;
    }
    ++v2;
  }
  while (v2 != v1);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247D95BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B40);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for SportsFavoriteService.Favorites.State();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(_QWORD *)(v2 + 8);
  v15 = *(unsigned __int8 *)(v2 + 16);
  if (v15 == 2)
  {
    if (qword_254456B90 != -1)
      swift_once();
    sub_247D8330C();
    v16 = a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20);
    sub_247D94154(v14, (uint64_t)v13);
    return sub_247D9850C((uint64_t)v13, v16);
  }
  if (v15 == 1)
  {
    if (qword_254456B90 != -1)
      swift_once();
    sub_247D8330C();
    v16 = a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20);
    sub_247D93DA4(v14, (uint64_t)v13);
    return sub_247D9850C((uint64_t)v13, v16);
  }
  sub_247D0DA3C(a2, (uint64_t)v10, &qword_254456B40);
  v18 = _s10NetworkingO12FetchedValueOMa(0);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v10, 1, v18) == 1)
    return sub_247D07E44((uint64_t)v10, &qword_254456B40);
  if (swift_getEnumCaseMultiPayload() != 1)
    return sub_247D10560((uint64_t)v10, _s10NetworkingO12FetchedValueOMa);
  v19 = *v10;
  v20 = (uint64_t *)(a1 + *(int *)(_s5CacheV5ModelVMa(0) + 20));
  if ((sub_247D59C88(*v20, v19) & 1) == 0)
  {
    if (qword_254456B90 != -1)
      swift_once();
    sub_247D8330C();
  }
  sub_247D0DA3C((uint64_t)v20 + *(int *)(v11 + 20), (uint64_t)v7, &qword_254456B10);
  v21 = (uint64_t)v13 + *(int *)(v11 + 20);
  v22 = sub_247D98AE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  *v13 = v19;
  swift_bridgeObjectRetain();
  sub_247D7A864((uint64_t)v7, v21);
  *((_BYTE *)v13 + *(int *)(v11 + 24)) = 0;
  sub_247D10560((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
  sub_247D7A8D4((uint64_t)v13, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for SportsFavoriteService.Favorites.State);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247D95EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_247D4E55C;
  return sub_247D94A80(a1, a2, a3);
}

uint64_t sub_247D95F54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_247D28CA8;
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 8);
  *(_BYTE *)(v2 + 152) = *(_BYTE *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_247D95FBC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_247D4E55C;
  return sub_247D1DF98(a1);
}

uint64_t SportsFavoriteService.Favorites.State.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int v12;
  int v13;
  char v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
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
  uint64_t v35;
  int v36;
  _QWORD v37[2];

  v1 = v0;
  v2 = sub_247D98AAC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v33 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
  MEMORY[0x24BDAC7A8](v5);
  v34 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v0;
  v8 = *(_QWORD *)(*v0 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v30 = v3;
    v31 = v2;
    v32 = v0;
    v37[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_247D806B4(0, v8, 0);
    v9 = v37[0];
    result = sub_247D96E24(v7);
    v11 = result;
    v13 = v12;
    v15 = v14 & 1;
    v35 = v7 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(v7 + 32))
    {
      if (((*(_QWORD *)(v35 + (((unint64_t)v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_16;
      if (*(_DWORD *)(v7 + 36) != v13)
        goto LABEL_17;
      v36 = v15;
      v16 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 24 * v11);
      v18 = *v16;
      v17 = v16[1];
      v37[0] = v9;
      v20 = *(_QWORD *)(v9 + 16);
      v19 = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRetain();
      if (v20 >= v19 >> 1)
      {
        sub_247D806B4(v19 > 1, v20 + 1, 1);
        v9 = v37[0];
      }
      *(_QWORD *)(v9 + 16) = v20 + 1;
      v21 = v9 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v18;
      *(_QWORD *)(v21 + 40) = v17;
      result = sub_247D96EC8(v11, v13, v36 & 1, v7);
      v11 = result;
      v13 = v22;
      v15 = v23 & 1;
      if (!--v8)
      {
        sub_247D214C8(result, v22, v15);
        swift_bridgeObjectRelease();
        v2 = v31;
        v1 = v32;
        v3 = v30;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
LABEL_11:
    v37[0] = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254457930);
    sub_247D98550((unint64_t *)&qword_2576F5418, MEMORY[0x24BEE12B0]);
    sub_247D98C80();
    swift_bridgeObjectRelease();
    v37[0] = 0;
    v37[1] = 0xE000000000000000;
    sub_247D99034();
    swift_bridgeObjectRelease();
    strcpy((char *)v37, "(favorites:[");
    BYTE5(v37[1]) = 0;
    HIWORD(v37[1]) = -5120;
    sub_247D98D34();
    swift_bridgeObjectRelease();
    sub_247D98D34();
    v24 = type metadata accessor for SportsFavoriteService.Favorites.State();
    v25 = v34;
    sub_247D0DA3C((uint64_t)v1 + *(int *)(v24 + 20), v34, &qword_254456B10);
    v26 = sub_247D98AE8();
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
    {
      sub_247D07E44(v25, &qword_254456B10);
    }
    else
    {
      v28 = v33;
      sub_247D875DC(v33);
      sub_247D98A58();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v28, v2);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    }
    sub_247D98D34();
    swift_bridgeObjectRelease();
    sub_247D98D34();
    sub_247D98D34();
    swift_bridgeObjectRelease();
    sub_247D98D34();
    return v37[0];
  }
  return result;
}

uint64_t sub_247D9640C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  _BYTE v18[8];

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v3 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v7)
        return swift_release();
      v16 = *(_QWORD *)(v3 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v7)
          return swift_release();
        v16 = *(_QWORD *)(v3 + 8 * v8);
        if (!v16)
        {
          v8 = v15 + 3;
          if (v15 + 3 >= v7)
            return swift_release();
          v16 = *(_QWORD *)(v3 + 8 * v8);
          if (!v16)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_6:
    v11 = *(_QWORD *)(v2 + 48) + 24 * v10;
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)(v11 + 8);
    v14 = *(_BYTE *)(v11 + 16);
    swift_bridgeObjectRetain();
    sub_247D5D918(v12, v13, v14, (uint64_t)v18);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v17 = v15 + 4;
  if (v17 >= v7)
    return swift_release();
  v16 = *(_QWORD *)(v3 + 8 * v17);
  if (v16)
  {
    v8 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v3 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247D965C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  char v31;
  uint64_t isStackAllocationSafe;
  char v33;
  unint64_t v34;
  size_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  _QWORD v46[7];

  v2 = a2;
  v46[5] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v3 = *(_QWORD *)(a1 + 56);
  v43 = a1 + 56;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  v40 = ~v4;
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & v3;
  v41 = (unint64_t)(63 - v4) >> 6;
  v7 = a2 + 56;
  v8 = swift_bridgeObjectRetain();
  v9 = 0;
  v42 = v8;
  while (1)
  {
    if (v6)
    {
      v44 = (v6 - 1) & v6;
      v45 = v9;
      v10 = __clz(__rbit64(v6)) | (v9 << 6);
    }
    else
    {
      v11 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_60;
      }
      if (v11 >= v41)
        goto LABEL_58;
      v12 = *(_QWORD *)(v43 + 8 * v11);
      v13 = v9 + 1;
      if (!v12)
      {
        v13 = v9 + 2;
        if (v9 + 2 >= v41)
          goto LABEL_58;
        v12 = *(_QWORD *)(v43 + 8 * v13);
        if (!v12)
        {
          v13 = v9 + 3;
          if (v9 + 3 >= v41)
            goto LABEL_58;
          v12 = *(_QWORD *)(v43 + 8 * v13);
          if (!v12)
          {
            v13 = v9 + 4;
            if (v9 + 4 >= v41)
              goto LABEL_58;
            v12 = *(_QWORD *)(v43 + 8 * v13);
            if (!v12)
            {
              v14 = v9 + 5;
              if (v9 + 5 >= v41)
              {
LABEL_58:
                sub_247D35D2C();
                return v2;
              }
              v12 = *(_QWORD *)(v43 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  v13 = v14 + 1;
                  if (__OFADD__(v14, 1))
                    break;
                  if (v13 >= v41)
                    goto LABEL_58;
                  v12 = *(_QWORD *)(v43 + 8 * v13);
                  ++v14;
                  if (v12)
                    goto LABEL_24;
                }
LABEL_60:
                __break(1u);
              }
              v13 = v9 + 5;
            }
          }
        }
      }
LABEL_24:
      v44 = (v12 - 1) & v12;
      v45 = v13;
      v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    v15 = *(_QWORD *)(v8 + 48) + 24 * v10;
    v17 = *(_QWORD *)v15;
    v16 = *(_QWORD *)(v15 + 8);
    v18 = *(unsigned __int8 *)(v15 + 16);
    sub_247D99310();
    swift_bridgeObjectRetain_n();
    sub_247D98D10();
    swift_bridgeObjectRelease();
    v19 = sub_247D99334();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v7 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
      break;
LABEL_6:
    swift_bridgeObjectRelease();
    v8 = v42;
    v6 = v44;
    v9 = v45;
  }
  v22 = ~v20;
  if (v18)
    v23 = 0x65756761656CLL;
  else
    v23 = 1835099508;
  if (v18)
    v24 = 0xE600000000000000;
  else
    v24 = 0xE400000000000000;
  while (1)
  {
    v25 = *(_QWORD *)(v2 + 48) + 24 * v21;
    v26 = *(unsigned __int8 *)(v25 + 16);
    v27 = *(_QWORD *)v25 == v17 && *(_QWORD *)(v25 + 8) == v16;
    if (!v27 && (sub_247D99268() & 1) == 0)
      goto LABEL_32;
    v28 = v26 ? 0x65756761656CLL : 1835099508;
    v29 = v26 ? 0xE600000000000000 : 0xE400000000000000;
    if (v28 == v23 && v29 == v24)
      break;
    v31 = sub_247D99268();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
      goto LABEL_52;
LABEL_32:
    v21 = (v21 + 1) & v22;
    if (((*(_QWORD *)(v7 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_6;
  }
  swift_bridgeObjectRelease_n();
LABEL_52:
  isStackAllocationSafe = swift_bridgeObjectRelease();
  v46[0] = v42;
  v46[1] = v43;
  v46[2] = v40;
  v46[3] = v45;
  v46[4] = v44;
  v33 = *(_BYTE *)(v2 + 32);
  v34 = (unint64_t)((1 << v33) + 63) >> 6;
  v35 = 8 * v34;
  if ((v33 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v35);
    v36 = sub_247D96ABC((uint64_t)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0), v34, v2, v21, v46);
    swift_release();
    sub_247D35D2C();
  }
  else
  {
    v37 = (void *)swift_slowAlloc();
    memcpy(v37, (const void *)(v2 + 56), v35);
    v36 = sub_247D96ABC((uint64_t)v37, v34, v2, v21, v46);
    swift_release();
    sub_247D35D2C();
    MEMORY[0x249591C3C](v37, -1, -1);
  }
  return v36;
}

uint64_t sub_247D96ABC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  uint64_t v31;
  unint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v39;
  unint64_t *v40;
  _QWORD *v41;
  uint64_t v42;

  v6 = *(_QWORD *)(a3 + 16);
  v40 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v7 = v6 - 1;
  v42 = a3 + 56;
  v41 = a5;
LABEL_2:
  v39 = v7;
LABEL_4:
  while (2)
  {
    v9 = a5[3];
    v8 = a5[4];
    if (v8)
    {
      v10 = (v8 - 1) & v8;
      v11 = __clz(__rbit64(v8)) | (v9 << 6);
LABEL_16:
      v17 = *(_QWORD *)(*a5 + 48) + 24 * v11;
      v19 = *(_QWORD *)v17;
      v18 = *(_QWORD *)(v17 + 8);
      v20 = *(unsigned __int8 *)(v17 + 16);
      a5[3] = v9;
      a5[4] = v10;
      sub_247D99310();
      swift_bridgeObjectRetain();
      sub_247D98D10();
      v21 = sub_247D99334();
      v22 = -1 << *(_BYTE *)(a3 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v42 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      {
LABEL_3:
        result = swift_bridgeObjectRelease();
        a5 = v41;
        continue;
      }
      v24 = ~v22;
      v25 = v20 == 0;
      if (v20)
        v26 = 0x65756761656CLL;
      else
        v26 = 1835099508;
      if (v25)
        v27 = 0xE400000000000000;
      else
        v27 = 0xE600000000000000;
      while (1)
      {
        v28 = *(_QWORD *)(a3 + 48) + 24 * v23;
        v29 = *(unsigned __int8 *)(v28 + 16);
        v30 = *(_QWORD *)v28 == v19 && *(_QWORD *)(v28 + 8) == v18;
        if (v30 || (sub_247D99268() & 1) != 0)
        {
          if (v29)
            v31 = 0x65756761656CLL;
          else
            v31 = 1835099508;
          if (v29)
            v32 = 0xE600000000000000;
          else
            v32 = 0xE400000000000000;
          if (v31 == v26 && v32 == v27)
          {
            swift_bridgeObjectRelease_n();
LABEL_42:
            result = swift_bridgeObjectRelease();
            v35 = (v23 >> 3) & 0x1FFFFFFFFFFFFFF8;
            a5 = v41;
            v36 = *(unint64_t *)((char *)v40 + v35);
            *(unint64_t *)((char *)v40 + v35) = v36 & ~(1 << v23);
            if ((v36 & (1 << v23)) != 0)
            {
              v7 = v39 - 1;
              if (__OFSUB__(v39, 1))
                goto LABEL_60;
              if (v39 == 1)
                return MEMORY[0x24BEE4B08];
              goto LABEL_2;
            }
            goto LABEL_4;
          }
          v34 = sub_247D99268();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v34 & 1) != 0)
            goto LABEL_42;
        }
        v23 = (v23 + 1) & v24;
        if (((*(_QWORD *)(v42 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          goto LABEL_3;
      }
    }
    break;
  }
  v12 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    v13 = (unint64_t)(a5[2] + 64) >> 6;
    if (v12 >= v13)
    {
      v12 = a5[3];
LABEL_56:
      a5[3] = v12;
      a5[4] = 0;
      swift_retain();
      return sub_247D4B80C(v40, a2, v39, a3);
    }
    v14 = a5[1];
    v15 = *(_QWORD *)(v14 + 8 * v12);
    if (v15)
      goto LABEL_15;
    v16 = v9 + 2;
    if (v9 + 2 >= v13)
      goto LABEL_56;
    v15 = *(_QWORD *)(v14 + 8 * v16);
    if (!v15)
    {
      if (v9 + 3 >= v13)
        goto LABEL_57;
      v15 = *(_QWORD *)(v14 + 8 * (v9 + 3));
      if (v15)
      {
        v12 = v9 + 3;
        goto LABEL_15;
      }
      v16 = v9 + 4;
      if (v9 + 4 >= v13)
      {
        v12 = v9 + 3;
        goto LABEL_56;
      }
      v15 = *(_QWORD *)(v14 + 8 * v16);
      if (!v15)
      {
        v12 = v9 + 5;
        if (v9 + 5 >= v13)
        {
LABEL_57:
          v12 = v16;
          goto LABEL_56;
        }
        v15 = *(_QWORD *)(v14 + 8 * v12);
        if (!v15)
        {
          v12 = v13 - 1;
          v37 = v9 + 6;
          while (v13 != v37)
          {
            v15 = *(_QWORD *)(v14 + 8 * v37++);
            if (v15)
            {
              v12 = v37 - 1;
              goto LABEL_15;
            }
          }
          goto LABEL_56;
        }
        goto LABEL_15;
      }
    }
    v12 = v16;
LABEL_15:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
    v9 = v12;
    goto LABEL_16;
  }
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

uint64_t sub_247D96E24(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

int64_t sub_247D96EC8(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s13TVAppServices21SportsFavoriteServiceV9FavoritesO0D0V2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = 0, (sub_247D99268() & 1) != 0))
  {
    if (v2)
      v6 = 0x65756761656CLL;
    else
      v6 = 1835099508;
    if (v2)
      v7 = 0xE600000000000000;
    else
      v7 = 0xE400000000000000;
    if (v3)
      v8 = 0x65756761656CLL;
    else
      v8 = 1835099508;
    if (v3)
      v9 = 0xE600000000000000;
    else
      v9 = 0xE400000000000000;
    if (v6 == v8 && v7 == v9)
      v5 = 1;
    else
      v5 = sub_247D99268();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

unint64_t sub_247D97078()
{
  unint64_t result;

  result = qword_2576F85B0;
  if (!qword_2576F85B0)
  {
    result = MEMORY[0x249591B70](&unk_247DA0DBC, &_s9FavoritesO8FavoriteV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576F85B0);
  }
  return result;
}

unint64_t sub_247D970BC()
{
  unint64_t result;

  result = qword_2576F85B8;
  if (!qword_2576F85B8)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite.Type, &type metadata for SportsFavoriteService.Favorites.Favorite.Type);
    atomic_store(result, (unint64_t *)&qword_2576F85B8);
  }
  return result;
}

unint64_t sub_247D97100()
{
  unint64_t result;

  result = qword_2576F85C8;
  if (!qword_2576F85C8)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite.Type, &type metadata for SportsFavoriteService.Favorites.Favorite.Type);
    atomic_store(result, (unint64_t *)&qword_2576F85C8);
  }
  return result;
}

uint64_t type metadata accessor for SportsFavoriteService.Favorites.State()
{
  uint64_t result;

  result = qword_254456C48;
  if (!qword_254456C48)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_247D97180()
{
  unint64_t result;

  result = qword_254456C28;
  if (!qword_254456C28)
  {
    result = MEMORY[0x249591B70](&unk_247DA0D6C, &_s9FavoritesO5StateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_254456C28);
  }
  return result;
}

unint64_t sub_247D971C4()
{
  unint64_t result;

  result = qword_2576F85E0;
  if (!qword_2576F85E0)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite, &type metadata for SportsFavoriteService.Favorites.Favorite);
    atomic_store(result, (unint64_t *)&qword_2576F85E0);
  }
  return result;
}

uint64_t sub_247D97208(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254456C68);
    v8 = a2();
    result = MEMORY[0x249591B70](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247D97270()
{
  unint64_t result;

  result = qword_254456C20;
  if (!qword_254456C20)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite, &type metadata for SportsFavoriteService.Favorites.Favorite);
    atomic_store(result, (unint64_t *)&qword_254456C20);
  }
  return result;
}

unint64_t sub_247D972B8()
{
  unint64_t result;

  result = qword_2576F85E8;
  if (!qword_2576F85E8)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite.Type, &type metadata for SportsFavoriteService.Favorites.Favorite.Type);
    atomic_store(result, (unint64_t *)&qword_2576F85E8);
  }
  return result;
}

unint64_t sub_247D97300()
{
  unint64_t result;

  result = qword_254456C18;
  if (!qword_254456C18)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite, &type metadata for SportsFavoriteService.Favorites.Favorite);
    atomic_store(result, (unint64_t *)&qword_254456C18);
  }
  return result;
}

unint64_t sub_247D97348()
{
  unint64_t result;

  result = qword_2576F85F0;
  if (!qword_2576F85F0)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Modification.FailureReason, &type metadata for SportsFavoriteService.Favorites.Modification.FailureReason);
    atomic_store(result, (unint64_t *)&qword_2576F85F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites()
{
  return &type metadata for SportsFavoriteService.Favorites;
}

uint64_t sub_247D973A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s9FavoritesO8FavoriteVwet(uint64_t a1, int a2)
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

uint64_t _s9FavoritesO8FavoriteVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Favorite()
{
  return &type metadata for SportsFavoriteService.Favorites.Favorite;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Favorite.Type()
{
  return &type metadata for SportsFavoriteService.Favorites.Favorite.Type;
}

uint64_t _s9FavoritesO12ModificationOwCP(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s9FavoritesO12ModificationOwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s9FavoritesO12ModificationOwca(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9FavoritesO12ModificationOwta(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s9FavoritesO12ModificationOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s9FavoritesO12ModificationOwst(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_247D97650(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_247D97658(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Modification()
{
  return &type metadata for SportsFavoriteService.Favorites.Modification;
}

uint64_t _s9FavoritesO12ModificationO13FailureReasonOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247D976B4 + 4 * byte_247DA0860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247D976D4 + 4 * byte_247DA0865[v4]))();
}

_BYTE *sub_247D976B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247D976D4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247D976DC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247D976E4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247D976EC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247D976F4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SportsFavoriteService.Favorites.Modification.FailureReason()
{
  return &type metadata for SportsFavoriteService.Favorites.Modification.FailureReason;
}

_QWORD *_s9FavoritesO5StateVwCP(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247D98AE8();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((_BYTE *)v7 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v7;
}

uint64_t _s9FavoritesO5StateVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_247D98AE8();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *_s9FavoritesO5StateVwcp(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247D98AE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *_s9FavoritesO5StateVwca(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247D98AE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *_s9FavoritesO5StateVwtk(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247D98AE8();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *_s9FavoritesO5StateVwta(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247D98AE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t _s9FavoritesO5StateVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247D97CC8(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t _s9FavoritesO5StateVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_247D97D54(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254456B10);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_247D97DCC()
{
  unint64_t v0;

  sub_247D20C00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t _s9FavoritesO5StateV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247D97E98 + 4 * byte_247DA086F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247D97ECC + 4 * byte_247DA086A[v4]))();
}

uint64_t sub_247D97ECC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D97ED4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247D97EDCLL);
  return result;
}

uint64_t sub_247D97EE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247D97EF0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247D97EF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D97EFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s9FavoritesO5StateV10CodingKeysOMa()
{
  return &_s9FavoritesO5StateV10CodingKeysON;
}

uint64_t _s9FavoritesO8FavoriteV4TypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247D97F64 + 4 * byte_247DA0879[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247D97F98 + 4 * byte_247DA0874[v4]))();
}

uint64_t sub_247D97F98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D97FA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247D97FA8);
  return result;
}

uint64_t sub_247D97FB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247D97FBCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247D97FC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247D97FC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s9FavoritesO8FavoriteV10CodingKeysOMa()
{
  return &_s9FavoritesO8FavoriteV10CodingKeysON;
}

unint64_t sub_247D97FE8()
{
  unint64_t result;

  result = qword_2576F85F8;
  if (!qword_2576F85F8)
  {
    result = MEMORY[0x249591B70](&unk_247DA0C8C, &_s9FavoritesO8FavoriteV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576F85F8);
  }
  return result;
}

unint64_t sub_247D98030()
{
  unint64_t result;

  result = qword_2576F8600;
  if (!qword_2576F8600)
  {
    result = MEMORY[0x249591B70](&unk_247DA0D44, &_s9FavoritesO5StateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576F8600);
  }
  return result;
}

unint64_t sub_247D98078()
{
  unint64_t result;

  result = qword_254456C38;
  if (!qword_254456C38)
  {
    result = MEMORY[0x249591B70](&unk_247DA0CB4, &_s9FavoritesO5StateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_254456C38);
  }
  return result;
}

unint64_t sub_247D980C0()
{
  unint64_t result;

  result = qword_254456C30;
  if (!qword_254456C30)
  {
    result = MEMORY[0x249591B70](&unk_247DA0CDC, &_s9FavoritesO5StateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_254456C30);
  }
  return result;
}

unint64_t sub_247D98108()
{
  unint64_t result;

  result = qword_2576F8608;
  if (!qword_2576F8608)
  {
    result = MEMORY[0x249591B70](&unk_247DA0BFC, &_s9FavoritesO8FavoriteV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576F8608);
  }
  return result;
}

unint64_t sub_247D98150()
{
  unint64_t result;

  result = qword_2576F8610;
  if (!qword_2576F8610)
  {
    result = MEMORY[0x249591B70](&unk_247DA0C24, &_s9FavoritesO8FavoriteV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576F8610);
  }
  return result;
}

uint64_t sub_247D98194(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x657469726F766166 && a2 == 0xE900000000000073;
  if (v2 || (sub_247D99268() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247DA4630 || (sub_247D99268() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79747269447369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_247D99268();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_247D982EC()
{
  unint64_t result;

  result = qword_2576F8618;
  if (!qword_2576F8618)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Favorite.Type, &type metadata for SportsFavoriteService.Favorites.Favorite.Type);
    atomic_store(result, &qword_2576F8618);
  }
  return result;
}

uint64_t sub_247D98330(uint64_t a1, unsigned __int8 a2)
{
  uint64_t result;

  if (a2 - 1 <= 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t _s9FavoritesO6ActionVwxx(uint64_t a1)
{
  return sub_247D9835C(*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_247D9835C(uint64_t a1, unsigned __int8 a2)
{
  uint64_t result;

  if (a2 - 1 <= 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s9FavoritesO6ActionVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  sub_247D98330(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s9FavoritesO6ActionVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  sub_247D98330(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  sub_247D9835C(v5, v6);
  return a1;
}

uint64_t _s9FavoritesO6ActionVwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unsigned __int8 v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_247D9835C(v4, v5);
  return a1;
}

uint64_t _s9FavoritesO6ActionVwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[17])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s9FavoritesO6ActionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *_s9FavoritesO6ActionVMa()
{
  return &_s9FavoritesO6ActionVN;
}

uint64_t sub_247D9850C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SportsFavoriteService.Favorites.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_247D98550(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254457930);
    result = MEMORY[0x249591B70](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247D98594()
{
  unint64_t result;

  result = qword_2576F8650;
  if (!qword_2576F8650)
  {
    result = MEMORY[0x249591B70](&protocol conformance descriptor for SportsFavoriteService.Favorites.Modification.FailureReason, &type metadata for SportsFavoriteService.Favorites.Modification.FailureReason);
    atomic_store(result, (unint64_t *)&qword_2576F8650);
  }
  return result;
}

uint64_t _s9FavoritesO6ActionV9OperationOwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_247D98330(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwxx(uint64_t a1)
{
  return sub_247D9835C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t _s9FavoritesO6ActionV9OperationOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_247D98330(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_247D9835C(v5, v6);
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_247D9835C(v4, v5);
  return a1;
}

uint64_t _s9FavoritesO6ActionV9OperationOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s9FavoritesO6ActionV9OperationOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_247D98744(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *_s9FavoritesO6ActionV9OperationOMa()
{
  return &_s9FavoritesO6ActionV9OperationON;
}

uint64_t sub_247D98764()
{
  return MEMORY[0x24BDCAFF0]();
}

uint64_t sub_247D98770()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_247D9877C()
{
  return MEMORY[0x24BDCB008]();
}

uint64_t sub_247D98788()
{
  return MEMORY[0x24BDCB020]();
}

uint64_t sub_247D98794()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_247D987A0()
{
  return MEMORY[0x24BDCB038]();
}

uint64_t sub_247D987AC()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_247D987B8()
{
  return MEMORY[0x24BDCB080]();
}

uint64_t sub_247D987C4()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_247D987D0()
{
  return MEMORY[0x24BDCB098]();
}

uint64_t sub_247D987DC()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_247D987E8()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_247D987F4()
{
  return MEMORY[0x24BDCB1E0]();
}

uint64_t sub_247D98800()
{
  return MEMORY[0x24BDCB1F0]();
}

uint64_t sub_247D9880C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_247D98818()
{
  return MEMORY[0x24BDCB238]();
}

uint64_t sub_247D98824()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_247D98830()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_247D9883C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_247D98848()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_247D98854()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_247D98860()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_247D9886C()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_247D98878()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_247D98884()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_247D98890()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_247D9889C()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_247D988A8()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_247D988B4()
{
  return MEMORY[0x24BDCBA48]();
}

uint64_t sub_247D988C0()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_247D988CC()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_247D988D8()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_247D988E4()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_247D988F0()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_247D988FC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_247D98908()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_247D98914()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_247D98920()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_247D9892C()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_247D98938()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_247D98944()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_247D98950()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_247D9895C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_247D98968()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_247D98974()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_247D98980()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_247D9898C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_247D98998()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_247D989A4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_247D989B0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_247D989BC()
{
  return MEMORY[0x24BDCDA28]();
}

uint64_t sub_247D989C8()
{
  return MEMORY[0x24BDCDA30]();
}

uint64_t sub_247D989D4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_247D989E0()
{
  return MEMORY[0x24BDCDA88]();
}

uint64_t sub_247D989EC()
{
  return MEMORY[0x24BDCDA90]();
}

uint64_t sub_247D989F8()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_247D98A04()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_247D98A10()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_247D98A1C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247D98A28()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247D98A34()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_247D98A40()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_247D98A4C()
{
  return MEMORY[0x24BDCDE98]();
}

uint64_t sub_247D98A58()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_247D98A64()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_247D98A70()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_247D98A7C()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_247D98A88()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_247D98A94()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_247D98AA0()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_247D98AAC()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_247D98AB8()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_247D98AC4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_247D98AD0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_247D98ADC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_247D98AE8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_247D98AF4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_247D98B00()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247D98B0C()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_247D98B18()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_247D98B24()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_247D98B30()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_247D98B3C()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_247D98B48()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_247D98B54()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_247D98B60()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_247D98B6C()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_247D98B78()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_247D98B84()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_247D98B90()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_247D98B9C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_247D98BA8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_247D98BB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247D98BC0()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_247D98BCC()
{
  return MEMORY[0x24BEE6070]();
}

uint64_t sub_247D98BD8()
{
  return MEMORY[0x24BEE60C0]();
}

uint64_t sub_247D98BE4()
{
  return MEMORY[0x24BEE60D8]();
}

uint64_t sub_247D98BF0()
{
  return MEMORY[0x24BEE6100]();
}

uint64_t sub_247D98BFC()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_247D98C08()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_247D98C14()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_247D98C20()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_247D98C2C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_247D98C38()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_247D98C44()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_247D98C50()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_247D98C5C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_247D98C68()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_247D98C74()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_247D98C80()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_247D98C8C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247D98C98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247D98CA4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_247D98CB0()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_247D98CBC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247D98CC8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_247D98CD4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247D98CE0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_247D98CEC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_247D98CF8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_247D98D04()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_247D98D10()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247D98D1C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_247D98D28()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_247D98D34()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247D98D40()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247D98D4C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_247D98D58()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_247D98D64()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_247D98D70()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_247D98D7C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_247D98D88()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_247D98D94()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_247D98DA0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_247D98DAC()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_247D98DB8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_247D98DC4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_247D98DD0()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_247D98DDC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247D98DE8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_247D98DF4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247D98E00()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_247D98E0C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_247D98E18()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_247D98E24()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_247D98E30()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_247D98E3C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_247D98E48()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_247D98E54()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_247D98E60()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_247D98E6C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_247D98E78()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_247D98E84()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_247D98E90()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_247D98E9C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_247D98EA8()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_247D98EB4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_247D98EC0()
{
  return MEMORY[0x24BEE7628]();
}

uint64_t sub_247D98ECC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_247D98ED8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_247D98EE4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247D98EF0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_247D98EFC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_247D98F08()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_247D98F14()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_247D98F20()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_247D98F2C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_247D98F38()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_247D98F44()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_247D98F50()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_247D98F5C()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_247D98F68()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_247D98F74()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247D98F80()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247D98F8C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247D98F98()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_247D98FA4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_247D98FB0()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_247D98FBC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247D98FC8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_247D98FD4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_247D98FE0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_247D98FEC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_247D98FF8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_247D99004()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_247D99010()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_247D9901C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_247D99028()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_247D99034()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247D99040()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247D9904C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247D99058()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_247D99064()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_247D99070()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247D9907C()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_247D99088()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_247D99094()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_247D990A0()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_247D990AC()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_247D990B8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247D990C4()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_247D990D0()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_247D990DC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247D990E8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_247D990F4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247D99100()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_247D9910C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_247D99118()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247D99124()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247D99130()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_247D9913C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_247D99148()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_247D99154()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_247D99160()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_247D9916C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_247D99178()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_247D99184()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_247D99190()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_247D9919C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_247D991A8()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_247D991B4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_247D991C0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247D991CC()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_247D991D8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_247D991E4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_247D991F0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_247D991FC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_247D99208()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_247D99214()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_247D99220()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_247D9922C()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_247D99238()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247D99244()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_247D99250()
{
  return MEMORY[0x24BEE35C8]();
}

uint64_t sub_247D9925C()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_247D99268()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247D99274()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_247D99280()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_247D9928C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_247D99298()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_247D992A4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247D992B0()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_247D992BC()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_247D992C8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_247D992D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247D992E0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247D992EC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247D992F8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247D99304()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_247D99310()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247D9931C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247D99328()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_247D99334()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247D99340()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_247D9934C()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_247D99358()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_247D99364()
{
  return MEMORY[0x24BEE4600]();
}

uint64_t sub_247D99370()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247D9937C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247D99388()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_247D99394()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247D993A0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_247D993AC()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

