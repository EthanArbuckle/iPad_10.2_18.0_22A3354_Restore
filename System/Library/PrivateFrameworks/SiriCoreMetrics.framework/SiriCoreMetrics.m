uint64_t sub_2461F1EB8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461F1EF4 + 4 * byte_24620BBA0[a1]))(0xD000000000000019, 0x800000024620D550);
}

uint64_t sub_2461F1EF4()
{
  return 0x6F69736E656D6964;
}

uint64_t sub_2461F1F14()
{
  return 0x54746E6572727563;
}

uint64_t sub_2461F1F38()
{
  return 0x6E7275547478656ELL;
}

uint64_t sub_2461F1F54()
{
  return 0x6552726573557369;
}

unint64_t sub_2461F1F78()
{
  return 0xD000000000000018;
}

BOOL sub_2461F1F94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2461F1FA8()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t sub_2461F1FEC()
{
  return sub_24620B74C();
}

uint64_t sub_2461F2014()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t sub_2461F2054()
{
  unsigned __int8 *v0;

  return sub_2461F1EB8(*v0);
}

uint64_t sub_2461F205C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2461F2DE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2461F2080()
{
  return 0;
}

void sub_2461F208C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2461F2098()
{
  sub_2461F23A0();
  return sub_24620B788();
}

uint64_t sub_2461F20C0()
{
  sub_2461F23A0();
  return sub_24620B794();
}

uint64_t ProcessedSiriTurn.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[4];
  uint64_t v16;
  uint64_t v17;
  char v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AEF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2461F23A0();
  sub_24620B77C();
  v9 = *(_OWORD *)(v3 + 16);
  v10 = *(_OWORD *)(v3 + 32);
  v11 = *(_OWORD *)(v3 + 48);
  v12 = *(_QWORD *)(v3 + 64);
  v13 = *(_QWORD *)(v3 + 72);
  v15[0] = *(_OWORD *)v3;
  v15[1] = v9;
  v15[2] = v10;
  v15[3] = v11;
  v16 = v12;
  v17 = v13;
  v18 = 0;
  sub_2461F23E4();
  sub_24620B6C8();
  if (!v2)
  {
    type metadata accessor for ProcessedSiriTurn();
    LOBYTE(v15[0]) = 1;
    sub_24620B08C();
    sub_2461F44D8(&qword_25755AF10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_24620B6B0();
    LOBYTE(v15[0]) = 2;
    sub_24620B6B0();
    LOBYTE(v15[0]) = 3;
    sub_24620B698();
    LOBYTE(v15[0]) = 4;
    sub_24620B6A4();
    LOBYTE(v15[0]) = 5;
    sub_24620B6A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249554DD4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2461F23A0()
{
  unint64_t result;

  result = qword_25755AF00;
  if (!qword_25755AF00)
  {
    result = MEMORY[0x249554DEC](&unk_24620BEDC, &type metadata for ProcessedSiriTurn.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755AF00);
  }
  return result;
}

unint64_t sub_2461F23E4()
{
  unint64_t result;

  result = qword_25755AF08;
  if (!qword_25755AF08)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for DynamicDimensionsSiriCoreMetrics, &type metadata for DynamicDimensionsSiriCoreMetrics);
    atomic_store(result, (unint64_t *)&qword_25755AF08);
  }
  return result;
}

uint64_t type metadata accessor for ProcessedSiriTurn()
{
  uint64_t result;

  result = qword_25755AFB8;
  if (!qword_25755AFB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ProcessedSiriTurn.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t v30;
  char v31;
  char v32;
  char *v33;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  int *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  char v47;

  v36 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v35 - v6;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF20);
  v8 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ProcessedSiriTurn();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_2461F23A0();
  v37 = v10;
  v15 = v40;
  sub_24620B770();
  if (v15)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  v16 = (uint64_t)v7;
  v35 = v5;
  v17 = v8;
  v40 = (int *)v11;
  v47 = 0;
  sub_2461F28DC();
  v18 = v37;
  v19 = v38;
  sub_24620B680();
  v20 = v42;
  v21 = v43;
  v22 = v44;
  v23 = v45;
  v24 = v46;
  *(_OWORD *)v13 = v41;
  *((_OWORD *)v13 + 1) = v20;
  *((_OWORD *)v13 + 2) = v21;
  *((_OWORD *)v13 + 3) = v22;
  *((_QWORD *)v13 + 8) = v23;
  *((_QWORD *)v13 + 9) = v24;
  sub_24620B08C();
  LOBYTE(v41) = 1;
  sub_2461F44D8(&qword_25755AF30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  sub_24620B668();
  v25 = v40;
  sub_2461F2920(v16, (uint64_t)&v13[v40[5]]);
  LOBYTE(v41) = 2;
  v26 = (uint64_t)v35;
  sub_24620B668();
  sub_2461F2920(v26, (uint64_t)&v13[v25[6]]);
  LOBYTE(v41) = 3;
  v13[v25[7]] = sub_24620B650();
  LOBYTE(v41) = 4;
  v27 = sub_24620B65C();
  v28 = &v13[v25[8]];
  *(_QWORD *)v28 = v27;
  v28[8] = v29 & 1;
  LOBYTE(v41) = 5;
  v30 = sub_24620B65C();
  v32 = v31;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v19);
  v33 = &v13[v25[9]];
  *(_QWORD *)v33 = v30;
  v33[8] = v32 & 1;
  sub_2461F2968((uint64_t)v13, v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  return sub_2461F29AC((uint64_t)v13);
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

uint64_t sub_2461F289C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2461F28DC()
{
  unint64_t result;

  result = qword_25755AF28;
  if (!qword_25755AF28)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for DynamicDimensionsSiriCoreMetrics, &type metadata for DynamicDimensionsSiriCoreMetrics);
    atomic_store(result, (unint64_t *)&qword_25755AF28);
  }
  return result;
}

uint64_t sub_2461F2920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461F2968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ProcessedSiriTurn();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461F29AC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ProcessedSiriTurn();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2461F29E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProcessedSiriTurn.init(from:)(a1, a2);
}

uint64_t sub_2461F29FC(_QWORD *a1)
{
  return ProcessedSiriTurn.encode(to:)(a1);
}

uint64_t sub_2461F2A10()
{
  return 1;
}

uint64_t sub_2461F2A18()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t sub_2461F2A58()
{
  return sub_24620B74C();
}

uint64_t sub_2461F2A7C()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t sub_2461F2ABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2461F3074(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_2461F2AE4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2461F2AF0()
{
  sub_2461F2C64();
  return sub_24620B788();
}

uint64_t sub_2461F2B18()
{
  sub_2461F2C64();
  return sub_24620B794();
}

uint64_t ProcessedSiriConversation.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2461F2C64();
  sub_24620B77C();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF48);
  sub_2461F4454(&qword_25755AF50, &qword_25755AF58, (uint64_t)&protocol conformance descriptor for ProcessedSiriTurn, MEMORY[0x24BEE12A0]);
  sub_24620B6C8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2461F2C64()
{
  unint64_t result;

  result = qword_25755AF40;
  if (!qword_25755AF40)
  {
    result = MEMORY[0x249554DEC](&unk_24620BE8C, &type metadata for ProcessedSiriConversation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755AF40);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249554DE0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *ProcessedSiriConversation.init(from:)(_QWORD *a1)
{
  return sub_2461F3134(a1);
}

_QWORD *sub_2461F2D00@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_2461F3134(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2461F2D28(_QWORD *a1)
{
  uint64_t *v1;

  return ProcessedSiriConversation.encode(to:)(a1, *v1);
}

uint64_t variable initialization expression of SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores()
{
  return MEMORY[0x24BEE4AF8];
}

unint64_t variable initialization expression of SiriCoreMetricsJsonLoggingReporter.jsonResult()
{
  return sub_2461F83D4(MEMORY[0x24BEE4AF8]);
}

uint64_t variable initialization expression of SiriCoreMetricsV2.logger()
{
  return sub_24620B440();
}

uint64_t variable initialization expression of SiriCoreMetrics.logger()
{
  return sub_24620B440();
}

void sub_2461F2DC8(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

BOOL sub_2461F2DD4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2461F2DE8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x54746E6572727563 && a2 == 0xED000064496E7275 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E7275547478656ELL && a2 == 0xEA00000000006449 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6552726573557369 && a2 == 0xED00007473657571 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024620D550 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024620D570)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_24620B6EC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2461F3074(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65737365636F7270 && a2 == 0xEE00736E72755464)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_24620B6EC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2461F3110()
{
  return 0x65737365636F7270;
}

_QWORD *sub_2461F3134(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B040);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2461F2C64();
  sub_24620B770();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF48);
    sub_2461F4454(&qword_25755B048, &qword_25755B050, (uint64_t)&protocol conformance descriptor for ProcessedSiriTurn, MEMORY[0x24BEE12D0]);
    sub_24620B680();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProcessedSiriTurn(_QWORD *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v30;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = *((_QWORD *)a2 + 1);
    *a1 = *(_QWORD *)a2;
    a1[1] = v6;
    v7 = *((_QWORD *)a2 + 3);
    a1[2] = *((_QWORD *)a2 + 2);
    a1[3] = v7;
    v8 = *((_QWORD *)a2 + 5);
    a1[4] = *((_QWORD *)a2 + 4);
    a1[5] = v8;
    v9 = *((_QWORD *)a2 + 7);
    a1[6] = *((_QWORD *)a2 + 6);
    a1[7] = v9;
    v10 = *((_QWORD *)a2 + 9);
    v11 = a3[5];
    __dst = (char *)a1 + v11;
    v12 = &a2[v11];
    a1[8] = *((_QWORD *)a2 + 8);
    a1[9] = v10;
    v13 = sub_24620B08C();
    v30 = *(_QWORD *)(v13 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
      memcpy(__dst, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
      v16 = v30;
    }
    else
    {
      v16 = v30;
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(__dst, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(__dst, 0, 1, v13);
    }
    v18 = a3[6];
    v19 = (char *)v4 + v18;
    v20 = &a2[v18];
    if (v14(&a2[v18], 1, v13))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v20, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v19, 0, 1, v13);
    }
    v22 = a3[8];
    *((_BYTE *)v4 + a3[7]) = a2[a3[7]];
    v23 = (char *)v4 + v22;
    v24 = &a2[v22];
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = a3[9];
    v26 = (char *)v4 + v25;
    v27 = &a2[v25];
    *(_QWORD *)v26 = *(_QWORD *)v27;
    v26[8] = v27[8];
  }
  return v4;
}

uint64_t destroy for ProcessedSiriTurn(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_24620B08C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return result;
}

_QWORD *initializeWithCopy for ProcessedSiriTurn(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v28;
  char *__dst;

  v5 = *((_QWORD *)a2 + 1);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *((_QWORD *)a2 + 3);
  a1[2] = *((_QWORD *)a2 + 2);
  a1[3] = v6;
  v7 = *((_QWORD *)a2 + 5);
  a1[4] = *((_QWORD *)a2 + 4);
  a1[5] = v7;
  v8 = *((_QWORD *)a2 + 7);
  a1[6] = *((_QWORD *)a2 + 6);
  a1[7] = v8;
  v9 = *((_QWORD *)a2 + 9);
  v10 = a3[5];
  __dst = (char *)a1 + v10;
  v11 = &a2[v10];
  a1[8] = *((_QWORD *)a2 + 8);
  a1[9] = v9;
  v12 = sub_24620B08C();
  v28 = *(_QWORD *)(v12 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  swift_bridgeObjectRetain();
  v14 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v11, 1, v12))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    v16 = v28;
  }
  else
  {
    v16 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(__dst, v14, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v12);
  }
  v17 = a3[6];
  v18 = (char *)a1 + v17;
  v19 = &a2[v17];
  if (v13(&a2[v17], 1, v12))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, v19, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v12);
  }
  v21 = a3[8];
  *((_BYTE *)a1 + a3[7]) = a2[a3[7]];
  v22 = (char *)a1 + v21;
  v23 = &a2[v21];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v23[8];
  v24 = a3[9];
  v25 = (char *)a1 + v24;
  v26 = &a2[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v25[8] = v26[8];
  return a1;
}

char *assignWithCopy for ProcessedSiriTurn(char *a1, _QWORD *a2, int *a3)
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
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = a2[2];
  *((_QWORD *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 6) = a2[6];
  *((_QWORD *)a1 + 7) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 8) = a2[8];
  *((_QWORD *)a1 + 9) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_24620B08C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = *((_BYTE *)a2 + a3[7]);
  v21 = a3[8];
  v22 = &a1[v21];
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v22[8] = v23[8];
  *(_QWORD *)v22 = v24;
  v25 = a3[9];
  v26 = &a1[v25];
  v27 = (char *)a2 + v25;
  v28 = *(_QWORD *)v27;
  v26[8] = v27[8];
  *(_QWORD *)v26 = v28;
  return a1;
}

_OWORD *initializeWithTake for ProcessedSiriTurn(_OWORD *a1, char *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;

  v6 = *((_OWORD *)a2 + 3);
  a1[2] = *((_OWORD *)a2 + 2);
  a1[3] = v6;
  a1[4] = *((_OWORD *)a2 + 4);
  v7 = *((_OWORD *)a2 + 1);
  *a1 = *(_OWORD *)a2;
  a1[1] = v7;
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = &a2[v8];
  v11 = sub_24620B08C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[6];
  v16 = (char *)a1 + v15;
  v17 = &a2[v15];
  if (v13(&a2[v15], 1, v11))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v16, v17, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
  }
  v19 = a3[8];
  *((_BYTE *)a1 + a3[7]) = a2[a3[7]];
  v20 = (char *)a1 + v19;
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[9];
  v23 = (char *)a1 + v22;
  v24 = &a2[v22];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  return a1;
}

char *assignWithTake for ProcessedSiriTurn(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;

  v6 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  *((_QWORD *)a1 + 2) = a2[2];
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  *((_QWORD *)a1 + 6) = a2[6];
  *((_QWORD *)a1 + 7) = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  *((_QWORD *)a1 + 8) = a2[8];
  *((_QWORD *)a1 + 9) = v10;
  swift_bridgeObjectRelease();
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = (char *)a2 + v11;
  v14 = sub_24620B08C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  v20 = a3[6];
  v21 = &a1[v20];
  v22 = (char *)a2 + v20;
  v23 = v16(&a1[v20], 1, v14);
  v24 = v16(v22, 1, v14);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v21, v22, v14);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v14);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v22, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
LABEL_13:
  v26 = a3[8];
  a1[a3[7]] = *((_BYTE *)a2 + a3[7]);
  v27 = &a1[v26];
  v28 = (char *)a2 + v26;
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v27[8] = v28[8];
  v29 = a3[9];
  v30 = &a1[v29];
  v31 = (char *)a2 + v29;
  *(_QWORD *)v30 = *(_QWORD *)v31;
  v30[8] = v31[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessedSiriTurn()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461F3DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ProcessedSiriTurn()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461F3E70(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_2461F3EE8()
{
  unint64_t v0;

  sub_2461F3F74();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2461F3F74()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25755AFC8[0])
  {
    sub_24620B08C();
    v0 = sub_24620B578();
    if (!v1)
      atomic_store(v0, qword_25755AFC8);
  }
}

ValueMetadata *type metadata accessor for ProcessedSiriConversation()
{
  return &type metadata for ProcessedSiriConversation;
}

void type metadata accessor for SISchemaDataSharingOptInState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25755B008)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25755B008);
  }
}

uint64_t getEnumTagSinglePayload for ProcessedSiriConversation.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProcessedSiriConversation.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2461F40C4 + 4 * byte_24620BBA6[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2461F40E4 + 4 * byte_24620BBAB[v4]))();
}

_BYTE *sub_2461F40C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2461F40E4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2461F40EC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461F40F4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461F40FC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2461F4104(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2461F4110()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProcessedSiriConversation.CodingKeys()
{
  return &type metadata for ProcessedSiriConversation.CodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProcessedSiriTurn.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessedSiriTurn.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461F4214 + 4 * byte_24620BBB5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2461F4248 + 4 * byte_24620BBB0[v4]))();
}

uint64_t sub_2461F4248(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461F4250(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461F4258);
  return result;
}

uint64_t sub_2461F4264(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461F426CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2461F4270(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461F4278(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461F4284(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2461F428C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProcessedSiriTurn.CodingKeys()
{
  return &type metadata for ProcessedSiriTurn.CodingKeys;
}

unint64_t sub_2461F42A8()
{
  unint64_t result;

  result = qword_25755B010;
  if (!qword_25755B010)
  {
    result = MEMORY[0x249554DEC](&unk_24620BDAC, &type metadata for ProcessedSiriTurn.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B010);
  }
  return result;
}

unint64_t sub_2461F42F0()
{
  unint64_t result;

  result = qword_25755B018;
  if (!qword_25755B018)
  {
    result = MEMORY[0x249554DEC]("ŽS\v %", &type metadata for ProcessedSiriConversation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B018);
  }
  return result;
}

unint64_t sub_2461F4338()
{
  unint64_t result;

  result = qword_25755B020;
  if (!qword_25755B020)
  {
    result = MEMORY[0x249554DEC](&unk_24620BDD4, &type metadata for ProcessedSiriConversation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B020);
  }
  return result;
}

unint64_t sub_2461F4380()
{
  unint64_t result;

  result = qword_25755B028;
  if (!qword_25755B028)
  {
    result = MEMORY[0x249554DEC](&unk_24620BDFC, &type metadata for ProcessedSiriConversation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B028);
  }
  return result;
}

unint64_t sub_2461F43C8()
{
  unint64_t result;

  result = qword_25755B030;
  if (!qword_25755B030)
  {
    result = MEMORY[0x249554DEC](&unk_24620BD1C, &type metadata for ProcessedSiriTurn.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B030);
  }
  return result;
}

unint64_t sub_2461F4410()
{
  unint64_t result;

  result = qword_25755B038;
  if (!qword_25755B038)
  {
    result = MEMORY[0x249554DEC](&unk_24620BD44, &type metadata for ProcessedSiriTurn.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B038);
  }
  return result;
}

uint64_t sub_2461F4454(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25755AF48);
    v10 = sub_2461F44D8(a2, (uint64_t (*)(uint64_t))type metadata accessor for ProcessedSiriTurn, a3);
    result = MEMORY[0x249554DEC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2461F44D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249554DEC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SiriCoreMetricsResultsV2.eventStreamMetadata.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResultsV2.eventStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResultsV2.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResultsV2.conversationStreamMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResultsV2.conversationStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResultsV2.turns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2461F45A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2461F45A8()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsCalculatorV2.__allocating_init(logger:bookmarkService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = swift_allocObject();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = a2;
  return v4;
}

uint64_t SiriCoreMetricsCalculatorV2.init(logger:bookmarkService:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = a2;
  return v2;
}

uint64_t SiriCoreMetricsCalculatorV2.doWork(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[7] = a1;
  v2[8] = v1;
  v3 = sub_24620B050();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  v2[13] = swift_task_alloc();
  v4 = sub_24620B08C();
  v2[14] = v4;
  v2[15] = *(_QWORD *)(v4 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B078);
  v2[19] = v5;
  v2[20] = *(_QWORD *)(v5 - 8);
  v2[21] = swift_task_alloc();
  return swift_task_switch();
}

void sub_2461F47B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __objc2_ivar_list **p_ivars;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(_QWORD, unint64_t, _QWORD);

  *(_QWORD *)(v0 + 40) = MEMORY[0x24BEE4B08];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B080);
  v1 = sub_24620B128();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 120);
    v61 = v1;
    v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    p_ivars = &SiriCoreMetrics.ivars;
    v71 = *(_QWORD *)(v3 + 72);
    v72 = *(void (**)(_QWORD, unint64_t, _QWORD))(v3 + 16);
    v65 = v4;
    v66 = v3;
    v72(*(_QWORD *)(v0 + 168), v5, *(_QWORD *)(v0 + 152));
    while (1)
    {
      v7 = (void *)sub_24620B110();
      v8 = objc_msgSend(v7, sel_eventData);

      if (v8)
      {
        v9 = sub_24620AFFC();
        v11 = v10;

        v8 = (id)sub_24620AFF0();
        sub_2461F5198(v9, v11);
      }
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95AA0]), (SEL)p_ivars[30], v8);

      if (!v12)
      {
        __break(1u);
        return;
      }
      if (objc_msgSend(v12, sel_anyEventType) == 6)
      {
        v13 = objc_msgSend(v12, sel_payload);
        if (v13)
        {
          v14 = v13;
          v15 = sub_24620AFFC();
          v17 = v16;

          v18 = (void *)sub_24620AFF0();
          v19 = v17;
          p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
          sub_2461F5198(v15, v19);
        }
        else
        {
          v18 = 0;
        }
        v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), (SEL)p_ivars[30], v18);

        if (v20)
        {
          v21 = objc_msgSend(v20, sel_event);
          if (v21)
          {
            v22 = v21;
            v23 = objc_msgSend(v20, sel_metadata);

            v12 = v22;
          }

        }
      }
      if (objc_msgSend(v12, sel_anyEventType, v61) != 1)
      {
        (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));

        goto LABEL_4;
      }
      v24 = objc_msgSend(v12, sel_payload);
      if (v24)
      {
        v25 = sub_24620AFFC();
        v27 = v26;

        v24 = (id)sub_24620AFF0();
        sub_2461F5198(v25, v27);
      }
      v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95AD8]), (SEL)p_ivars[30], v24);

      if (!v28)
        goto LABEL_26;
      v29 = objc_msgSend(v28, sel_eventMetadata);
      if (!v29)
        break;
      v30 = v29;
      v31 = objc_msgSend(v29, sel_turnID);

      if (!v31)
        break;
      v67 = *(_QWORD *)(v0 + 104);
      v69 = *(_QWORD *)(v0 + 112);
      v32 = sub_24620AFFC();
      v34 = v33;

      v35 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      sub_2461F5154(v32, v34);
      v36 = (void *)sub_24620AFF0();
      v37 = objc_msgSend(v35, sel_initWithBytesAsData_, v36);
      sub_2461F5198(v32, v34);

      sub_24620B548();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v67, 1, v69) == 1)
      {
        v38 = *(_QWORD *)(v0 + 104);
        (*(void (**)(_QWORD, _QWORD))(v66 + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));

        v39 = v32;
        v3 = v66;
        sub_2461F5198(v39, v34);

        sub_2461F289C(v38);
        v4 = v65;
        p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
        goto LABEL_4;
      }
      v44 = *(_QWORD *)(v0 + 144);
      v68 = *(_QWORD *)(v0 + 152);
      v70 = *(_QWORD *)(v0 + 136);
      v62 = v34;
      v63 = v44;
      v45 = *(char **)(v0 + 128);
      v46 = *(_QWORD *)(v0 + 112);
      v4 = v65;
      v64 = *(_QWORD *)(v0 + 168);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v65 + 32))(v44, *(_QWORD *)(v0 + 104), v46);
      (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v45, v44, v46);
      sub_2461F51DC(v70, v45);

      sub_2461F5198(v32, v62);
      v47 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v47(v70, v46);
      v47(v63, v46);
      v3 = v66;
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v68);
LABEL_27:
      p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
LABEL_4:
      v5 += v71;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        v48 = *(_QWORD *)(v0 + 40);
        goto LABEL_31;
      }
      v72(*(_QWORD *)(v0 + 168), v5, *(_QWORD *)(v0 + 152));
    }

LABEL_26:
    v40 = *(_QWORD *)(v0 + 168);
    v41 = v4;
    v42 = *(_QWORD *)(v0 + 152);

    v43 = v42;
    v4 = v41;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v43);
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  v48 = MEMORY[0x24BEE4B08];
LABEL_31:
  swift_bridgeObjectRetain();
  v49 = sub_24620B434();
  v50 = sub_24620B560();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v51 = 134217984;
    *(_QWORD *)(v0 + 48) = *(_QWORD *)(v48 + 16);
    sub_24620B584();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2461F0000, v49, v50, "marker: read %ld Siri turns in this run", v51, 0xCu);
    MEMORY[0x249554E64](v51, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_24620B200();
  if ((v52 & 1) != 0)
  {
    v54 = *(_QWORD *)(v0 + 80);
    v53 = *(_QWORD *)(v0 + 88);
    v55 = *(_QWORD *)(v0 + 72);
    sub_24620B170();
    sub_24620B014();
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
  }
  v56 = *(_QWORD *)(v0 + 96);
  v57 = *(_QWORD *)(v0 + 80);
  v58 = *(_QWORD *)(v0 + 72);
  sub_24620B008();
  v59 = sub_24620B140();
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
  swift_beginAccess();
  v60 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 8))(v59, MEMORY[0x24BEE4AF8], v60);
}

uint64_t SiriCoreMetricsCalculatorV2.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_calendar;
  v4 = sub_24620B104();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsCalculatorV2.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_calendar;
  v4 = sub_24620B104();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2461F4F80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_2461F4FD4;
  return SiriCoreMetricsCalculatorV2.doWork(_:)(a2);
}

uint64_t sub_2461F4FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = *v4;
  v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    v10 = *(_QWORD **)(v8 + 16);
    *v10 = a1;
    v10[1] = a2;
    v10[2] = a3;
  }
  return (*(uint64_t (**)(void))(v9 + 8))();
}

uint64_t sub_2461F5044(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2461F5054(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2461F5088@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_2461F50B0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_24620B644();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

_BYTE **sub_2461F5144(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2461F5154(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2461F5198(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2461F51DC(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_24620B08C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_2461F578C(&qword_25755B168, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v30 = a2;
  v11 = sub_24620B470();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v29 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_2461F578C(&qword_25755B170, MEMORY[0x24BDCEA98]);
      v21 = sub_24620B488();
      v22 = *(void (**)(char *, uint64_t))(v29 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v30, v6);
    v20(v27, *(_QWORD *)(*v26 + 48) + v17 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v30;
    v18(v9, v30, v6);
    v31 = *v3;
    *v3 = 0x8000000000000000;
    sub_2461F5B30((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v31;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

unint64_t sub_2461F5434()
{
  unint64_t result;

  result = qword_25755B088;
  if (!qword_25755B088)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriCoreMetricsResultsV2, &type metadata for SiriCoreMetricsResultsV2);
    atomic_store(result, (unint64_t *)&qword_25755B088);
  }
  return result;
}

unint64_t sub_2461F547C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25755B090;
  if (!qword_25755B090)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25755B080);
    result = MEMORY[0x249554DEC](MEMORY[0x24BE2B6B0], v1);
    atomic_store(result, (unint64_t *)&qword_25755B090);
  }
  return result;
}

uint64_t destroy for SiriCoreMetricsResultsV2()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15SiriCoreMetrics24SiriCoreMetricsResultsV2VwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SiriCoreMetricsResultsV2(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriCoreMetricsResultsV2(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsResultsV2(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsResultsV2(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriCoreMetricsResultsV2()
{
  return &type metadata for SiriCoreMetricsResultsV2;
}

uint64_t sub_2461F56B4()
{
  return type metadata accessor for SiriCoreMetricsCalculatorV2();
}

uint64_t type metadata accessor for SiriCoreMetricsCalculatorV2()
{
  uint64_t result;

  result = qword_25755B0C8;
  if (!qword_25755B0C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461F56F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = sub_24620B104();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_2461F578C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_24620B08C();
    result = MEMORY[0x249554DEC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2461F57CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_24620B08C();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B178);
  v6 = sub_24620B5C0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(_QWORD *)(v5 + 48) + v22 * v17;
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v23, v2);
      sub_2461F578C(&qword_25755B168, MEMORY[0x24BDCEA88]);
      result = sub_24620B470();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_2461F5B30(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_24620B08C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2461F57CC();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2461F5D24();
      goto LABEL_12;
    }
    sub_2461F5F48();
  }
  v12 = *v3;
  sub_2461F578C(&qword_25755B168, MEMORY[0x24BDCEA88]);
  v13 = sub_24620B470();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_2461F578C(&qword_25755B170, MEMORY[0x24BDCEA98]);
      v18 = sub_24620B488();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_24620B6F8();
  __break(1u);
  return result;
}

void *sub_2461F5D24()
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
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_24620B08C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B178);
  v6 = *v0;
  v7 = sub_24620B5B4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2461F5F48()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_24620B08C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B178);
  v7 = sub_24620B5C0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_2461F578C(&qword_25755B168, MEMORY[0x24BDCEA88]);
    result = sub_24620B470();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t SiriCoreMetricsCalculator.conversationTurnType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SiriCoreMetricsCalculator.calendar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  v4 = sub_24620B104();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SiriCoreMetricsCalculator.__allocating_init(logger:conversationTurnType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = swift_allocObject();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  *(_QWORD *)(v4 + 16) = a2;
  return v4;
}

uint64_t SiriCoreMetricsCalculator.init(logger:conversationTurnType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  *(_QWORD *)(v2 + 16) = a2;
  return v2;
}

uint64_t SiriCoreMetricsCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v4 = type metadata accessor for SiriCountsAll(0);
  v3[13] = v4;
  v3[14] = *(_QWORD *)(v4 - 8);
  v3[15] = swift_task_alloc();
  v5 = sub_24620B1C4();
  v3[16] = v5;
  v3[17] = *(_QWORD *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  v6 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v3[22] = v6;
  v3[23] = *(_QWORD *)(v6 - 8);
  v3[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B190);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B198);
  v3[27] = swift_task_alloc();
  v7 = type metadata accessor for ProcessedSiriTurn();
  v3[28] = v7;
  v3[29] = *(_QWORD *)(v7 - 8);
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v8 = sub_24620B050();
  v3[32] = v8;
  v3[33] = *(_QWORD *)(v8 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2461F6550()
{
  _QWORD *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  _QWORD *v28;
  unint64_t v29;
  char v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  uint64_t *v76;
  NSObject *v77;
  os_log_type_t v78;
  _BOOL4 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  void (*v99)(_QWORD *@<X8>);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int64_t v113;
  unint64_t v114;
  int64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t, uint64_t, uint64_t);
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  _QWORD *v137;
  int v138;
  char v139;
  unint64_t v140;
  uint64_t v141;
  _BOOL8 v142;
  uint64_t v143;
  char v144;
  _QWORD *v145;
  uint64_t v146;
  unint64_t v147;
  char v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  char v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  void (*v162)(uint64_t, uint64_t);
  _QWORD *v163;
  char v164;
  uint64_t v165;
  void (*v166)(_QWORD *);
  int v167;
  BOOL v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void (*v173)(_QWORD *);
  int v174;
  char v175;
  unint64_t v176;
  uint64_t v177;
  _BOOL8 v178;
  uint64_t v179;
  char v180;
  unint64_t v181;
  char v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  uint64_t v191;
  _QWORD *v192;
  id *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  unint64_t v201;
  _QWORD *v202;
  _QWORD *v203;
  _QWORD *v204;
  unint64_t v205;
  _QWORD *v206;
  int64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  _QWORD *v211;
  unint64_t v212;
  uint64_t v213;
  _QWORD *v214;
  unint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  int64_t v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  _QWORD *v232;
  uint64_t v233[2];

  v1 = objc_allocWithZone((Class)sub_24620B41C());
  v196 = (void *)sub_24620B410();
  v2 = sub_24620B248();
  v3 = MEMORY[0x24BEE4AF8];
  v4 = (_QWORD *)sub_2461F7E04(MEMORY[0x24BEE4AF8]);
  v214 = (_QWORD *)sub_2461F7E04(v3);
  v230 = sub_2461F7F14(v3);
  v201 = sub_2461F80AC(v3);
  v231 = v3;
  v197 = v2;
  if (v2 >> 62)
    goto LABEL_185;
  v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
LABEL_3:
  v211 = v0;
  v199 = v5;
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    v9 = v197;
    while (1)
    {
      if ((v197 & 0xC000000000000001) != 0)
      {
        MEMORY[0x249554954](v7, v9);
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_181;
      }
      else
      {
        if (v7 >= *(_QWORD *)((v197 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_187;
        }
        swift_retain();
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_181;
      }
      v205 = v10;
      v11 = sub_24620B398();
      if (v11 >> 62)
      {
        swift_bridgeObjectRetain();
        v12 = sub_24620B614();
        swift_bridgeObjectRelease();
      }
      else
      {
        v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v221 = v12;
      if (v12)
        break;
LABEL_5:
      swift_bridgeObjectRelease();
      result = swift_release();
      v7 = v205;
      v9 = v197;
      if (v205 == v199)
        goto LABEL_56;
    }
    v215 = v7;
    v218 = v11;
    v13 = 0;
    v227 = v11 & 0xC000000000000001;
    v14 = (_QWORD *)v12;
    while (1)
    {
      if (v227)
      {
        MEMORY[0x249554954](v13, v11);
        v0 = (_QWORD *)(v13 + 1);
        if (__OFADD__(v13, 1))
          goto LABEL_168;
      }
      else
      {
        swift_retain();
        v0 = (_QWORD *)(v13 + 1);
        if (__OFADD__(v13, 1))
        {
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          swift_bridgeObjectRetain_n();
          v5 = sub_24620B614();
          result = swift_bridgeObjectRelease();
          goto LABEL_3;
        }
      }
      v16 = sub_24620B3E0();
      v17 = swift_retain();
      if ((v16 & 1) == 0)
      {
        swift_retain();
        v35 = sub_24620B434();
        v36 = sub_24620B56C();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = swift_slowAlloc();
          v38 = swift_slowAlloc();
          v233[0] = v38;
          *(_DWORD *)v37 = 136315138;
          v39 = sub_24620B3EC();
          *(_QWORD *)(v37 + 4) = sub_2461FA9B8(v39, v40, v233);
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_2461F0000, v35, v36, "Turn: %s has an invalid timestamp", (uint8_t *)v37, 0xCu);
          swift_arrayDestroy();
          v41 = v38;
          v11 = v218;
          MEMORY[0x249554E64](v41, -1, -1);
          v42 = v37;
          v14 = (_QWORD *)v221;
          MEMORY[0x249554E64](v42, -1, -1);
          swift_release();
        }
        else
        {
          swift_release_n();
        }

        goto LABEL_18;
      }
      v224 = v8;
      MEMORY[0x249554864](v17);
      if (*(_QWORD *)((v231 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v231 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24620B518();
      sub_24620B530();
      sub_24620B50C();
      v18 = sub_24620B3EC();
      v20 = v19;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v233[0] = (uint64_t)v214;
      v23 = sub_2461FB1AC(v18, v20);
      v24 = v214[2];
      v25 = (v22 & 1) == 0;
      v26 = v24 + v25;
      if (__OFADD__(v24, v25))
        goto LABEL_169;
      v27 = v22;
      if (v214[3] >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v28 = v214;
          if ((v22 & 1) != 0)
            goto LABEL_37;
        }
        else
        {
          sub_2461FDBAC();
          v28 = (_QWORD *)v233[0];
          v214 = (_QWORD *)v233[0];
          if ((v27 & 1) != 0)
            goto LABEL_37;
        }
      }
      else
      {
        sub_2461FBF84(v26, isUniquelyReferenced_nonNull_native);
        v28 = (_QWORD *)v233[0];
        v29 = sub_2461FB1AC(v18, v20);
        if ((v27 & 1) != (v30 & 1))
          return sub_24620B704();
        v23 = v29;
        v214 = v28;
        if ((v27 & 1) != 0)
        {
LABEL_37:
          *(_QWORD *)(v28[7] + 8 * v23) = v215;
          goto LABEL_38;
        }
      }
      v28[(v23 >> 6) + 8] |= 1 << v23;
      v31 = (uint64_t *)(v28[6] + 16 * v23);
      *v31 = v18;
      v31[1] = v20;
      *(_QWORD *)(v28[7] + 8 * v23) = v215;
      v32 = v28[2];
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
        goto LABEL_173;
      v28[2] = v34;
      swift_bridgeObjectRetain();
LABEL_38:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v43 = sub_24620B3EC();
      v45 = v44;
      v46 = swift_isUniquelyReferenced_nonNull_native();
      v233[0] = (uint64_t)v4;
      v48 = sub_2461FB1AC(v43, v45);
      v49 = v4[2];
      v50 = (v47 & 1) == 0;
      v51 = v49 + v50;
      if (__OFADD__(v49, v50))
        goto LABEL_170;
      v52 = v47;
      if (v4[3] >= v51)
      {
        if ((v46 & 1) != 0)
        {
          v14 = (_QWORD *)v221;
          if ((v47 & 1) != 0)
            goto LABEL_46;
        }
        else
        {
          sub_2461FDBAC();
          v4 = (_QWORD *)v233[0];
          v14 = (_QWORD *)v221;
          if ((v52 & 1) != 0)
            goto LABEL_46;
        }
      }
      else
      {
        sub_2461FBF84(v51, v46);
        v4 = (_QWORD *)v233[0];
        v53 = sub_2461FB1AC(v43, v45);
        if ((v52 & 1) != (v54 & 1))
          return sub_24620B704();
        v48 = v53;
        v14 = (_QWORD *)v221;
        if ((v52 & 1) != 0)
        {
LABEL_46:
          v56 = v224;
          *(_QWORD *)(v4[7] + 8 * v48) = v224;
          goto LABEL_47;
        }
      }
      v4[(v48 >> 6) + 8] |= 1 << v48;
      v55 = (uint64_t *)(v4[6] + 16 * v48);
      *v55 = v43;
      v55[1] = v45;
      v56 = v224;
      *(_QWORD *)(v4[7] + 8 * v48) = v224;
      v57 = v4[2];
      v33 = __OFADD__(v57, 1);
      v58 = v57 + 1;
      if (v33)
        goto LABEL_174;
      v4[2] = v58;
      swift_bridgeObjectRetain();
LABEL_47:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v33 = __OFADD__(v56, 1);
      v8 = v56 + 1;
      v11 = v218;
      if (v33)
        goto LABEL_171;
LABEL_18:
      ++v13;
      v15 = v0 == v14;
      v0 = v211;
      if (v15)
        goto LABEL_5;
    }
  }
LABEL_56:
  swift_bridgeObjectRelease();
  sub_24620B3BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v199)
  {
    v4 = 0;
    v209 = v0[29];
    v216 = v0[12] + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
    v206 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v219 = v0[33];
    while (1)
    {
      if ((v197 & 0xC000000000000001) != 0)
      {
        MEMORY[0x249554954](v4, v197);
        v33 = __OFADD__(v4, 1);
        v4 = (_QWORD *)((char *)v4 + 1);
        if (v33)
          goto LABEL_172;
      }
      else
      {
        if ((unint64_t)v4 >= *(_QWORD *)((v197 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_179;
        swift_retain();
        v33 = __OFADD__(v4, 1);
        v4 = (_QWORD *)((char *)v4 + 1);
        if (v33)
          goto LABEL_172;
      }
      v59 = sub_24620B398();
      if (v59 >> 62)
      {
        v60 = sub_24620B614();
        v203 = v4;
        if (v60)
        {
LABEL_66:
          if (v60 < 1)
            goto LABEL_176;
          v61 = 0;
          v228 = v59 & 0xC000000000000001;
          v212 = MEMORY[0x24BEE4AF8];
          v222 = v60;
          v225 = v59;
          do
          {
            if (v228)
              MEMORY[0x249554954](v61, v59);
            else
              swift_retain();
            if ((sub_24620B3E0() & 1) != 0)
            {
              v67 = v0[35];
              v66 = v0[36];
              v68 = v0[32];
              sub_24620B3F8();
              sub_24620B008();
              sub_24620B020();
              v69 = *(void (**)(uint64_t, uint64_t))(v219 + 8);
              v69(v67, v68);
              if ((MEMORY[0x24955448C](v66, v216) & 1) != 0)
              {
                v70 = sub_24620B434();
                v71 = sub_24620B554();
                if (os_log_type_enabled(v70, v71))
                {
                  v72 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v72 = 0;
                  _os_log_impl(&dword_2461F0000, v70, v71, "Skipping turns that happen today or in the future.", v72, 2u);
                  MEMORY[0x249554E64](v72, -1, -1);

                  swift_release();
                }
                else
                {
                  swift_release();

                }
                v59 = v225;
                v69(v0[36], v0[32]);
                v60 = v222;
              }
              else
              {
                v76 = (uint64_t *)v0[27];
                v75 = v0[28];
                swift_bridgeObjectRetain();
                SiriCoreMetricsCalculator.processTurn(turn:turnIdToConvIdx:counts:)((uint64_t)v214, (uint64_t *)&v230, v76);
                swift_bridgeObjectRelease();
                if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v209 + 48))(v76, 1, v75) == 1)
                {
                  sub_2461FE7F0(v0[27], &qword_25755B198);
                  swift_retain_n();
                  v77 = sub_24620B434();
                  v78 = sub_24620B56C();
                  v79 = os_log_type_enabled(v77, v78);
                  v80 = v0[36];
                  v81 = v0[32];
                  if (v79)
                  {
                    v82 = swift_slowAlloc();
                    v83 = swift_slowAlloc();
                    v233[0] = v83;
                    *(_DWORD *)v82 = 136315138;
                    v84 = sub_24620B3EC();
                    *(_QWORD *)(v82 + 4) = sub_2461FA9B8(v84, v85, v233);
                    swift_bridgeObjectRelease();
                    swift_release_n();
                    _os_log_impl(&dword_2461F0000, v77, v78, "    Could not create processed turn struct from featurizd turn:\n    %s", (uint8_t *)v82, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249554E64](v83, -1, -1);
                    v86 = v82;
                    v0 = v211;
                    MEMORY[0x249554E64](v86, -1, -1);

                    swift_release();
                  }
                  else
                  {
                    swift_release_n();

                  }
                  v69(v80, v81);
                }
                else
                {
                  v87 = v0[30];
                  v88 = v0[31];
                  sub_2461FDAE8(v0[27], v88, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  sub_2461FDB2C(v88, v87, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v212 = sub_2461FA71C(0, *(_QWORD *)(v212 + 16) + 1, 1, v212, &qword_25755B318, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  v90 = *(_QWORD *)(v212 + 16);
                  v89 = *(_QWORD *)(v212 + 24);
                  if (v90 >= v89 >> 1)
                    v212 = sub_2461FA71C(v89 > 1, v90 + 1, 1, v212, &qword_25755B318, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  v91 = v0[36];
                  v93 = v0[31];
                  v92 = v0[32];
                  v94 = v0[30];
                  *(_QWORD *)(v212 + 16) = v90 + 1;
                  sub_2461FDAE8(v94, v212+ ((*(unsigned __int8 *)(v209 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v209 + 80))+ *(_QWORD *)(v209 + 72) * v90, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  swift_release();
                  sub_2461FDB70(v93, (uint64_t (*)(_QWORD))type metadata accessor for ProcessedSiriTurn);
                  v69(v91, v92);
                }
                v60 = v222;
                v59 = v225;
              }
            }
            else
            {
              swift_retain_n();
              v73 = sub_24620B434();
              v74 = sub_24620B56C();
              if (os_log_type_enabled(v73, v74))
              {
                v62 = swift_slowAlloc();
                v63 = swift_slowAlloc();
                v233[0] = v63;
                *(_DWORD *)v62 = 136315138;
                v64 = sub_24620B3EC();
                *(_QWORD *)(v62 + 4) = sub_2461FA9B8(v64, v65, v233);
                swift_bridgeObjectRelease();
                swift_release_n();
                _os_log_impl(&dword_2461F0000, v73, v74, "Turn: %s has an invalid timestamp", (uint8_t *)v62, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x249554E64](v63, -1, -1);
                MEMORY[0x249554E64](v62, -1, -1);
                swift_release();
              }
              else
              {
                swift_release_n();
              }

            }
            ++v61;
          }
          while (v60 != v61);
          goto LABEL_95;
        }
      }
      else
      {
        v60 = *(_QWORD *)((v59 & 0xFFFFFFFFFFFFF8) + 0x10);
        v203 = v4;
        if (v60)
          goto LABEL_66;
      }
      v212 = MEMORY[0x24BEE4AF8];
LABEL_95:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v206 = sub_2461FA600(0, v206[2] + 1, 1, v206);
      v4 = v203;
      v96 = v206[2];
      v95 = v206[3];
      if (v96 >= v95 >> 1)
        v206 = sub_2461FA600((_QWORD *)(v95 > 1), v96 + 1, 1, v206);
      v206[2] = v96 + 1;
      v206[v96 + 4] = v212;
      swift_release();
      if (v203 == (_QWORD *)v199)
        goto LABEL_102;
    }
  }
  v206 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_102:
  v202 = v0 + 6;
  v204 = v0 + 2;
  v4 = (_QWORD *)v0[34];
  v208 = v0[23];
  v217 = v0[22];
  v97 = (_QWORD *)v0[17];
  v210 = v0[14];
  v213 = v0[13];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24620B170();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1A0);
  v98 = swift_allocObject();
  *(_OWORD *)(v98 + 16) = xmmword_24620C040;
  *(_QWORD *)(v98 + 32) = sub_24620B230();
  v197 = sub_24620B134();
  swift_bridgeObjectRelease();
  result = sub_2461F8240(MEMORY[0x24BEE4AF8]);
  v99 = 0;
  v223 = 0;
  v100 = *(_QWORD *)(v230 + 64);
  v198 = v230 + 64;
  v101 = -1;
  v214 = (_QWORD *)v230;
  v102 = -1 << *(_BYTE *)(v230 + 32);
  v232 = (_QWORD *)result;
  if (-v102 < 64)
    v101 = ~(-1 << -(char)v102);
  v103 = v101 & v100;
  v207 = (unint64_t)(63 - v102) >> 6;
  v200 = v0 + 19;
  v220 = v0 + 18;
  while (1)
  {
    if (v103)
    {
      v106 = __clz(__rbit64(v103));
      v107 = (v103 - 1) & v103;
      v108 = v106 | (v223 << 6);
      v109 = v211;
LABEL_110:
      v110 = v109[25];
      sub_2461FDB2C(v214[6] + *(_QWORD *)(v208 + 72) * v108, v110, type metadata accessor for SiriCoreMetricsAggregationKeys);
      v111 = v214[7];
      v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1A8);
      *(_QWORD *)(v110 + *(int *)(v112 + 48)) = *(_QWORD *)(v111 + 8 * v108);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v110, 0, 1, v112);
      goto LABEL_129;
    }
    v113 = v223 + 1;
    v109 = v211;
    if (__OFADD__(v223, 1))
      goto LABEL_180;
    if (v113 < v207)
    {
      v114 = *(_QWORD *)(v198 + 8 * v113);
      if (v114)
        goto LABEL_114;
      v115 = v223 + 2;
      ++v223;
      if (v113 + 1 < v207)
      {
        v114 = *(_QWORD *)(v198 + 8 * v115);
        if (v114)
          goto LABEL_117;
        v223 = v113 + 1;
        if (v113 + 2 < v207)
        {
          v114 = *(_QWORD *)(v198 + 8 * (v113 + 2));
          if (v114)
          {
            v113 += 2;
            goto LABEL_114;
          }
          v115 = v113 + 3;
          v223 = v113 + 2;
          if (v113 + 3 < v207)
            break;
        }
      }
    }
LABEL_128:
    v116 = v211[25];
    v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1A8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v117 - 8) + 56))(v116, 1, 1, v117);
    v107 = 0;
LABEL_129:
    v118 = v109[26];
    sub_2461FE82C(v109[25], v118, &qword_25755B190);
    v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v119 - 8) + 48))(v118, 1, v119) == 1)
    {
      v187 = v109[33];
      v188 = v109[34];
      v189 = v109;
      v190 = v109[32];
      v191 = v109[11];
      v192 = (_QWORD *)v109[10];
      swift_release();
      v193 = *(id **)(v191 + *(int *)(type metadata accessor for SiriCoreMetricsDataRecord(0) + 20));
      v194 = (uint64_t)v232;
      swift_bridgeObjectRetain();
      v195 = SiriCoreMetricsCalculator.calculateTwoByThree(previousRequestCounts:totalCounts:)(v193, v194);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();

      (*(void (**)(uint64_t, uint64_t))(v187 + 8))(v188, v190);
      swift_bridgeObjectRelease();
      sub_2461FA70C((uint64_t)v99);
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
      *v192 = v206;
      v192[1] = v201;
      v192[2] = MEMORY[0x24BEE4AF8];
      v192[3] = v197;
      v192[4] = v194;
      v192[5] = v195;
      return ((uint64_t (*)(void))v189[1])();
    }
    v226 = v107;
    v120 = v109[26];
    v121 = v109[24];
    v122 = v109[21];
    v124 = v109[15];
    v123 = v109[16];
    v229 = *(_QWORD *)(v120 + *(int *)(v119 + 48));
    sub_2461FDAE8(v120, v121, type metadata accessor for SiriCoreMetricsAggregationKeys);
    v4 = v97;
    v125 = (void (*)(uint64_t, uint64_t, uint64_t))v97[2];
    v125(v122, v121, v123);
    v125(v124, v121, v123);
    v126 = (uint64_t *)(v121 + *(int *)(v217 + 20));
    v128 = *v126;
    v127 = v126[1];
    v129 = v126[2];
    v0 = (_QWORD *)v126[3];
    v130 = v126[4];
    v131 = v126[5];
    v132 = v126[6];
    v133 = v126[7];
    v134 = v126[8];
    v135 = v126[9];
    v136 = (_QWORD *)(v124 + *(int *)(v213 + 20));
    *v136 = v128;
    v136[1] = v127;
    v136[2] = v129;
    v136[3] = v0;
    v136[4] = v130;
    v136[5] = v131;
    v136[6] = v132;
    v136[7] = v133;
    v136[8] = v134;
    v136[9] = v135;
    *(_QWORD *)(v124 + *(int *)(v213 + 24)) = v229;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2461FA70C((uint64_t)v99);
    v137 = (_QWORD *)v201;
    v138 = swift_isUniquelyReferenced_nonNull_native();
    v233[0] = v201;
    v140 = sub_2461FB210(v122);
    v141 = *(_QWORD *)(v201 + 16);
    v142 = (v139 & 1) == 0;
    v143 = v141 + v142;
    if (__OFADD__(v141, v142))
      goto LABEL_175;
    v144 = v139;
    if (*(_QWORD *)(v201 + 24) >= v143)
    {
      v145 = v211;
      v97 = v4;
      if ((v138 & 1) == 0)
      {
        sub_2461FD8B8();
        v137 = (_QWORD *)v233[0];
      }
    }
    else
    {
      v145 = v211;
      v146 = v211[21];
      sub_2461FBBF0(v143, v138);
      v137 = (_QWORD *)v233[0];
      v147 = sub_2461FB210(v146);
      if ((v144 & 1) != (v148 & 1))
        return sub_24620B704();
      v140 = v147;
      v97 = v4;
    }
    swift_bridgeObjectRelease();
    if ((v144 & 1) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v149 = v145[21];
      v0 = (_QWORD *)v145[16];
      v137[(v140 >> 6) + 8] |= 1 << v140;
      v150 = v137[6] + v97[9] * v140;
      swift_bridgeObjectRetain();
      v125(v150, v149, (uint64_t)v0);
      *(_QWORD *)(v137[7] + 8 * v140) = MEMORY[0x24BEE4AF8];
      v151 = v137[2];
      v33 = __OFADD__(v151, 1);
      v152 = v151 + 1;
      if (v33)
        goto LABEL_178;
      v137[2] = v152;
    }
    v153 = v137[7];
    v201 = (unint64_t)v137;
    swift_bridgeObjectRelease();
    v154 = *(_QWORD *)(v153 + 8 * v140);
    v155 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v153 + 8 * v140) = v154;
    if ((v155 & 1) == 0)
    {
      v154 = sub_2461FA71C(0, *(_QWORD *)(v154 + 16) + 1, 1, v154, &qword_25755B338, type metadata accessor for SiriCountsAll);
      *(_QWORD *)(v153 + 8 * v140) = v154;
    }
    v157 = *(_QWORD *)(v154 + 16);
    v156 = *(_QWORD *)(v154 + 24);
    if (v157 >= v156 >> 1)
    {
      v154 = sub_2461FA71C(v156 > 1, v157 + 1, 1, v154, &qword_25755B338, type metadata accessor for SiriCountsAll);
      *(_QWORD *)(v153 + 8 * v140) = v154;
    }
    v158 = v145[21];
    v159 = v145[15];
    v160 = v145[16];
    *(_QWORD *)(v154 + 16) = v157 + 1;
    sub_2461FDAE8(v159, v154+ ((*(unsigned __int8 *)(v210 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v210 + 80))+ *(_QWORD *)(v210 + 72) * v157, type metadata accessor for SiriCountsAll);
    v161 = v145;
    v162 = (void (*)(uint64_t, uint64_t))v97[1];
    v162(v158, v160);
    v163 = v232;
    if (!v232[2] || (sub_2461FB210(v161[24]), (v164 & 1) == 0))
    {
      v0 = (_QWORD *)v161[18];
      v125((uint64_t)v0, v161[24], v161[16]);
      v174 = swift_isUniquelyReferenced_nonNull_native();
      v233[0] = (uint64_t)v163;
      v176 = sub_2461FB210((uint64_t)v0);
      v177 = v163[2];
      v178 = (v175 & 1) == 0;
      v179 = v177 + v178;
      if (__OFADD__(v177, v178))
        goto LABEL_177;
      v180 = v175;
      if (v163[3] >= v179)
      {
        if ((v174 & 1) != 0)
        {
          if ((v175 & 1) == 0)
            goto LABEL_160;
        }
        else
        {
          sub_2461FD684();
          v163 = (_QWORD *)v233[0];
          if ((v180 & 1) == 0)
            goto LABEL_160;
        }
      }
      else
      {
        v0 = (_QWORD *)*v220;
        sub_2461FB860(v179, v174);
        v163 = (_QWORD *)v233[0];
        v181 = sub_2461FB210((uint64_t)v0);
        if ((v180 & 1) != (v182 & 1))
          return sub_24620B704();
        v176 = v181;
        if ((v180 & 1) == 0)
        {
LABEL_160:
          v183 = v211[18];
          v184 = v211[16];
          v163[(v176 >> 6) + 8] |= 1 << v176;
          v125(v163[6] + v97[9] * v176, v183, v184);
          *(_QWORD *)(v163[7] + 8 * v176) = v229;
          v185 = v163[2];
          v33 = __OFADD__(v185, 1);
          v186 = v185 + 1;
          if (v33)
            goto LABEL_182;
          v163[2] = v186;
          goto LABEL_106;
        }
      }
      *(_QWORD *)(v163[7] + 8 * v176) = v229;
LABEL_106:
      v232 = v163;
      swift_bridgeObjectRelease();
      v104 = v220;
      goto LABEL_107;
    }
    v0 = (_QWORD *)v161[20];
    v125((uint64_t)v0, v161[24], v161[16]);
    v166 = sub_2461F870C(v204);
    if ((*(_BYTE *)(v165 + 8) & 1) == 0)
    {
      v167 = *(_DWORD *)(v165 + 4);
      v168 = __CFADD__(v167, HIDWORD(v229));
      v169 = v167 + HIDWORD(v229);
      if (v168)
        goto LABEL_183;
      *(_DWORD *)(v165 + 4) = v169;
      v161 = v211;
    }
    ((void (*)(_QWORD *, _QWORD))v166)(v204, 0);
    v170 = v161[24];
    v0 = (_QWORD *)v161[19];
    v171 = v161[16];
    v162(v161[20], v171);
    v125((uint64_t)v0, v170, v171);
    v173 = sub_2461F870C(v202);
    if ((*(_BYTE *)(v172 + 8) & 1) == 0)
    {
      if (__CFADD__(*(_DWORD *)v172, (_DWORD)v229))
        goto LABEL_184;
      *(_DWORD *)v172 += v229;
    }
    ((void (*)(_QWORD *, _QWORD))v173)(v202, 0);
    v104 = v200;
LABEL_107:
    v105 = v211[24];
    v162(*v104, v211[16]);
    result = sub_2461FDB70(v105, type metadata accessor for SiriCoreMetricsAggregationKeys);
    v99 = sub_2461F8628;
    v103 = v226;
  }
  v114 = *(_QWORD *)(v198 + 8 * v115);
  if (v114)
  {
LABEL_117:
    v113 = v115;
LABEL_114:
    v107 = (v114 - 1) & v114;
    v108 = __clz(__rbit64(v114)) + (v113 << 6);
    v223 = v113;
    goto LABEL_110;
  }
  while (1)
  {
    v113 = v115 + 1;
    if (__OFADD__(v115, 1))
      break;
    if (v113 >= v207)
    {
      v223 = v207 - 1;
      goto LABEL_128;
    }
    v114 = *(_QWORD *)(v198 + 8 * v113);
    ++v115;
    if (v114)
      goto LABEL_114;
  }
LABEL_187:
  __break(1u);
  return result;
}

unint64_t sub_2461F7C70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B300);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2D8);
  v6 = sub_24620B638();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2461FEC04(v12, (uint64_t)v5, &qword_25755B300);
    result = sub_2461FB210((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_24620B1C4();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_BYTE *)(v7[7] + v16) = v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F7E04(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B310);
  v2 = (_QWORD *)sub_24620B638();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2461FB1AC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F7F14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B360);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B308);
  v6 = sub_24620B638();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2461FEC04(v12, (uint64_t)v5, &qword_25755B360);
    result = sub_2461FAFF8((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
    result = sub_2461FDAE8((uint64_t)v5, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, type metadata accessor for SiriCoreMetricsAggregationKeys);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F80AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B358);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B328);
  v6 = sub_24620B638();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2461FEC04(v12, (uint64_t)v5, &qword_25755B358);
    result = sub_2461FB210((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_24620B1C4();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F8240(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B348);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B330);
  v6 = sub_24620B638();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2461FEC04(v12, (uint64_t)v5, &qword_25755B348);
    result = sub_2461FB210((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_24620B1C4();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F83D4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2C8);
  v2 = sub_24620B638();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2461FEC04(v6, (uint64_t)&v15, &qword_25755B2D0);
    v7 = v15;
    v8 = v16;
    result = sub_2461FB1AC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2461FE7C4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2461F8508(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2C0);
  v2 = (_QWORD *)sub_24620B638();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2461FB1AC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_2461F8628(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

void (*sub_2461F8638(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = malloc(0x30uLL);
  *a1 = v4;
  v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v6 = malloc(*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  v4[4] = v6;
  sub_2461FDB2C(a2, (uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v4[5] = sub_2461FC454(v4, (uint64_t)v6);
  return sub_2461F86C4;
}

void sub_2461F86C4(_QWORD *a1)
{
  void *v1;
  void *v2;

  v1 = (void *)*a1;
  v2 = *(void **)(*a1 + 32);
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  sub_2461FDB70((uint64_t)v2, type metadata accessor for SiriCoreMetricsAggregationKeys);
  free(v2);
  free(v1);
}

void (*sub_2461F870C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  v3 = sub_24620B1C4();
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v5 = malloc(*(_QWORD *)(v4 + 64));
  v2[6] = v5;
  (*(void (**)(void))(v4 + 16))();
  v2[7] = sub_2461FC56C(v2, (uint64_t)v5);
  return sub_2461F879C;
}

void sub_2461F879C(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)*a1;
  v2 = *(void **)(*a1 + 48);
  v3 = *(_QWORD *)(*a1 + 32);
  v4 = *(_QWORD *)(*a1 + 40);
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);
  free(v1);
}

void (*SiriCoreMetricsCalculator.processTurn(turn:turnIdToConvIdx:counts:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t *a3@<X8>))(_QWORD *a1)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*result)(_QWORD *);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *v69;
  unsigned int v70;
  uint64_t v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  uint64_t v76;
  char v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  uint64_t v104;
  _BOOL4 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  int *v118;
  int v119;
  char v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  int *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(char *, uint64_t);
  char *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;

  v165 = a3;
  v163 = a1;
  v164 = a2;
  v155 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v3 = MEMORY[0x24BDAC7A8](v155);
  v152 = (uint64_t)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v151 = (uint64_t)&v136 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v150 = (uint64_t)&v136 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v156 = (char *)&v136 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v136 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v157 = (uint64_t)&v136 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v158 = (char *)&v136 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1B0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v136 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_24620B0C8();
  v161 = *(_QWORD *)(v20 - 8);
  v162 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v136 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24620B0E0();
  v159 = *(_QWORD *)(v23 - 8);
  v160 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v136 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_24620B050();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v136 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v136 - v31;
  if ((sub_24620B3E0() & 1) == 0)
  {
    v60 = v165;
    swift_retain_n();
    v61 = sub_24620B434();
    v62 = sub_24620B56C();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      v64 = swift_slowAlloc();
      v167 = v64;
      *(_DWORD *)v63 = 136315138;
      v65 = sub_24620B3EC();
      v169 = sub_2461FA9B8(v65, v66, &v167);
      sub_24620B584();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2461F0000, v61, v62, "Turn %s has an invalid timestamp", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249554E64](v64, -1, -1);
      MEMORY[0x249554E64](v63, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v67 = type metadata accessor for ProcessedSiriTurn();
    v68 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56);
    v69 = v60;
    goto LABEL_26;
  }
  v146 = v13;
  sub_24620B3F8();
  sub_24620B008();
  v154 = v32;
  v142 = v166 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  sub_24620B020();
  v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  v143 = v30;
  v149 = v26;
  v153 = v33;
  v33(v30, v26);
  v147 = sub_24620B2E4();
  sub_24620B2CC();
  sub_24620B3D4();
  swift_bridgeObjectRelease();
  v141 = v167;
  sub_24620B314();
  sub_24620B2F0();
  sub_24620B3D4();
  swift_bridgeObjectRelease();
  v140 = v167;
  v139 = v168;
  sub_24620B2FC();
  sub_24620B3D4();
  swift_bridgeObjectRelease();
  v34 = v167;
  v35 = v168;
  sub_24620B308();
  sub_24620B3D4();
  swift_bridgeObjectRelease();
  v136 = v167;
  v148 = v168;
  v36 = objc_msgSend((id)objc_opt_self(), sel_autoupdatingCurrentLocale);
  sub_24620B0B0();

  sub_24620B0D4();
  (*(void (**)(char *, uint64_t))(v159 + 8))(v25, v160);
  sub_24620B0BC();
  (*(void (**)(char *, uint64_t))(v161 + 8))(v22, v162);
  v37 = sub_24620B0A4();
  v38 = *(_QWORD *)(v37 - 8);
  result = (void (*)(_QWORD *))(*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v19, 1, v37);
  if ((_DWORD)result != 1)
  {
    v138 = v35;
    v137 = v34;
    v40 = sub_24620B098();
    v42 = v41;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v37);
    v43 = CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN");
    v44 = CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN");
    v145 = sub_24620B4A0();
    v162 = v45;

    v46 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    v47 = CFSTR("AUDIOINPUTROUTE_UNKNOWN");
    v159 = sub_24620B4A0();
    v49 = v48;

    v50 = CFSTR("UNKNOWN");
    v51 = CFSTR("UNKNOWN");
    v52 = sub_24620B4A0();
    v54 = v53;

    v55 = CFSTR("PRODUCT_UNKNOWN");
    v56 = CFSTR("PRODUCT_UNKNOWN");
    v160 = sub_24620B4A0();
    v58 = v57;

    sub_24620B350();
    sub_24620B344();
    sub_24620B3D4();
    swift_bridgeObjectRelease();
    v59 = v168;
    if (v168)
    {
      v144 = v167;
      swift_bridgeObjectRelease();
      v161 = v59;
    }
    else
    {
      v161 = v42;
      v144 = v40;
    }
    sub_24620B338();
    type metadata accessor for SISchemaDataSharingOptInState();
    sub_24620B3D4();
    swift_bridgeObjectRelease();
    if (BYTE4(v167) != 1)
    {
      v70 = v167;
      swift_bridgeObjectRelease();
      if (v70 > 3)
      {
        v72 = CFSTR("UNKNOWN");
        v73 = CFSTR("UNKNOWN");
      }
      else
      {
        v71 = (int)v70;
        v72 = off_251747D50[v71];
        v73 = off_251747D70[v71];
      }
      v74 = v72;
      v75 = v73;
      v52 = sub_24620B4A0();
      v54 = v76;

    }
    sub_24620B2D8();
    sub_24620B3D4();
    swift_bridgeObjectRelease();
    v77 = v167;
    if (v167 != 2)
    {
      swift_bridgeObjectRelease();
      if ((v77 & 1) != 0)
        v78 = CFSTR("PRODUCT_DICTATION");
      else
        v78 = CFSTR("PRODUCT_ASSISTANT");
      v79 = v78;
      v80 = v78;
      v160 = sub_24620B4A0();
      v58 = v81;

    }
    sub_24620B32C();
    sub_24620B320();
    sub_24620B3D4();
    swift_bridgeObjectRelease();
    v82 = v168;
    v83 = v54;
    if (v168)
    {
      v159 = v167;
      swift_bridgeObjectRelease();
      v49 = v82;
    }
    sub_24620B3EC();
    v84 = (uint64_t)v158;
    sub_24620B05C();
    swift_bridgeObjectRelease();
    v85 = sub_24620B08C();
    v86 = *(_QWORD *)(v85 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48))(v84, 1, v85) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2461FE7F0(v84, &qword_25755AF18);
      v87 = sub_24620B434();
      v88 = sub_24620B56C();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        _os_log_impl(&dword_2461F0000, v87, v88, "Turn Id is not available", v89, 2u);
        MEMORY[0x249554E64](v89, -1, -1);
      }

      v153(v154, v149);
      v67 = type metadata accessor for ProcessedSiriTurn();
      v68 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56);
      v69 = v165;
LABEL_26:
      v90 = 1;
      return (void (*)(_QWORD *))v68(v69, v90, 1, v67);
    }
    v166 = v141 & 1;
    sub_2461FE7F0(v84, &qword_25755AF18);
    sub_24620B3EC();
    sub_24620B05C();
    swift_bridgeObjectRelease();
    v91 = v143;
    v92 = v148;
    if (v148)
    {
      v93 = v163;
      v94 = *(_QWORD *)(v163 + 16);
      v147 = v58;
      if (v94)
      {
        swift_bridgeObjectRetain();
        v95 = sub_2461FB1AC(v136, v92);
        v97 = v52;
        if ((v96 & 1) != 0)
          v98 = *(_QWORD *)(*(_QWORD *)(v93 + 56) + 8 * v95);
        else
          v98 = 0;
        v99 = v96 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        v97 = v52;
        v98 = 0;
        v99 = 1;
      }
      v100 = sub_24620B3EC();
      if (*(_QWORD *)(v163 + 16) && (v102 = sub_2461FB1AC(v100, v101), (v103 & 1) != 0))
      {
        v104 = *(_QWORD *)(*(_QWORD *)(v163 + 56) + 8 * v102);
        swift_bridgeObjectRelease();
        v105 = v98 != v104;
        v91 = v143;
        if (((v99 | v105) & 1) == 0)
        {
LABEL_37:
          v106 = v49;
          sub_24620B05C();
          swift_bridgeObjectRelease();
          v52 = v97;
          v58 = v147;
LABEL_41:
          v107 = v161;
          swift_bridgeObjectRetain();
          v108 = v162;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_24620B020();
          sub_24620B014();
          v109 = v149;
          v153(v91, v149);
          v110 = (uint64_t)v156;
          sub_24620B1A0();
          v111 = (uint64_t *)(v110 + *(int *)(v155 + 20));
          *v111 = v144;
          v111[1] = v107;
          v111[2] = v145;
          v111[3] = v108;
          v113 = v159;
          v112 = v160;
          v111[4] = v159;
          v111[5] = v106;
          v111[6] = v112;
          v111[7] = v58;
          v163 = v52;
          v111[8] = v52;
          v111[9] = v83;
          v114 = v83;
          v115 = *v164;
          if (!*(_QWORD *)(*v164 + 16) || (v116 = sub_2461FAFF8(v110), (v117 & 1) == 0))
          {
            v127 = v152;
            sub_2461FDB2C(v110, v152, type metadata accessor for SiriCoreMetricsAggregationKeys);
            v128 = v164;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v167 = *v128;
            *v128 = 0x8000000000000000;
            v120 = v166;
            sub_2461FE3CC((v166 << 32) | 1, v127, isUniquelyReferenced_nonNull_native);
            *v128 = v167;
            swift_bridgeObjectRelease();
            v126 = v127;
            goto LABEL_53;
          }
          v118 = (int *)(*(_QWORD *)(v115 + 56) + 8 * v116);
          v119 = *v118;
          v120 = v166;
          if ((_DWORD)v166)
          {
            v121 = v118[1];
            v122 = v150;
            sub_2461FDB2C(v110, v150, type metadata accessor for SiriCoreMetricsAggregationKeys);
            result = sub_2461F8638(&v167, v122);
            if ((*(_BYTE *)(v123 + 8) & 1) == 0)
            {
              if (v121 == -1)
              {
LABEL_56:
                __break(1u);
                goto LABEL_57;
              }
              *(_DWORD *)(v123 + 4) = v121 + 1;
            }
            ((void (*)(uint64_t *, _QWORD))result)(&v167, 0);
            sub_2461FDB70(v150, type metadata accessor for SiriCoreMetricsAggregationKeys);
          }
          v124 = v151;
          sub_2461FDB2C(v110, v151, type metadata accessor for SiriCoreMetricsAggregationKeys);
          result = sub_2461F8638(&v167, v124);
          if ((*(_BYTE *)(v125 + 8) & 1) != 0)
          {
LABEL_51:
            ((void (*)(uint64_t *, _QWORD))result)(&v167, 0);
            v126 = v151;
LABEL_53:
            sub_2461FDB70(v126, type metadata accessor for SiriCoreMetricsAggregationKeys);
            sub_2461FDB70(v110, type metadata accessor for SiriCoreMetricsAggregationKeys);
            v153(v154, v109);
            v130 = v165;
            v131 = v161;
            *v165 = v144;
            v130[1] = v131;
            v132 = v162;
            v130[2] = v145;
            v130[3] = v132;
            v130[4] = v113;
            v130[5] = v106;
            v130[6] = v160;
            v130[7] = v58;
            v130[8] = v163;
            v130[9] = v114;
            v133 = (int *)type metadata accessor for ProcessedSiriTurn();
            sub_2461FE82C(v157, (uint64_t)v130 + v133[5], &qword_25755AF18);
            sub_2461FE82C((uint64_t)v146, (uint64_t)v130 + v133[6], &qword_25755AF18);
            *((_BYTE *)v130 + v133[7]) = v120;
            v134 = (char *)v130 + v133[8];
            *(_QWORD *)v134 = v140;
            v134[8] = v139;
            v135 = (char *)v130 + v133[9];
            *(_QWORD *)v135 = v137;
            v135[8] = v138;
            v68 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*((_QWORD *)v133 - 1) + 56);
            v69 = v130;
            v90 = 0;
            v67 = (uint64_t)v133;
            return (void (*)(_QWORD *))v68(v69, v90, 1, v67);
          }
          if (v119 != -1)
          {
            *(_DWORD *)v125 = v119 + 1;
            goto LABEL_51;
          }
          __break(1u);
          goto LABEL_56;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v91 = v143;
        if ((v99 & 1) != 0)
          goto LABEL_37;
      }
      swift_bridgeObjectRelease();
      v52 = v97;
      v58 = v147;
    }
    v106 = v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v146, 1, 1, v85);
    goto LABEL_41;
  }
LABEL_57:
  __break(1u);
  return result;
}

uint64_t SiriCoreMetricsCalculator.calculateTwoByThree(previousRequestCounts:totalCounts:)(id *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  char v23;
  char isUniquelyReferenced_nonNull_native;
  void (*v25)(uint64_t, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  char *v40;
  id *v41;
  int64_t v42;
  uint64_t v43;
  unint64_t v44;

  v41 = a1;
  v3 = sub_24620B1C4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1B8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v15 = sub_2461F7C70(MEMORY[0x24BEE4AF8]);
  v16 = *(_QWORD *)(a2 + 64);
  v38 = a2 + 64;
  v17 = 1 << *(_BYTE *)(a2 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & v16;
  v39 = (unint64_t)(v17 + 63) >> 6;
  v37 = v39 - 1;
  v43 = a2;
  result = swift_bridgeObjectRetain();
  v42 = 0;
  if (!v19)
    goto LABEL_8;
LABEL_6:
  v26 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  v27 = v26 | (v42 << 6);
  while (2)
  {
    v28 = v43;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v12, *(_QWORD *)(v43 + 48) + *(_QWORD *)(v4 + 72) * v27, v3);
    v29 = *(_QWORD *)(v28 + 56);
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
    *(_QWORD *)&v12[*(int *)(v30 + 48)] = *(_QWORD *)(v29 + 8 * v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v12, 0, 1, v30);
    while (1)
    {
      sub_2461FE82C((uint64_t)v12, (uint64_t)v14, &qword_25755B1B8);
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 48))(v14, 1, v35) == 1)
      {
        swift_release();
        return v15;
      }
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v8, v14, v3);
      v21 = (uint64_t)v40;
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v40, v8, v3);
      sub_24620B194();
      sub_2461F9A48(v41, v43);
      v23 = v22;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v44 = v15;
      sub_2461FE524(v23, v21, isUniquelyReferenced_nonNull_native);
      v15 = v44;
      swift_bridgeObjectRelease();
      v25 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      v25(v21, v3);
      result = ((uint64_t (*)(char *, uint64_t))v25)(v8, v3);
      if (v19)
        goto LABEL_6;
LABEL_8:
      v31 = v42 + 1;
      if (__OFADD__(v42, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v31 < v39)
      {
        v32 = *(_QWORD *)(v38 + 8 * v31);
        if (v32)
          goto LABEL_11;
        v33 = v42 + 2;
        ++v42;
        if (v31 + 1 < v39)
        {
          v32 = *(_QWORD *)(v38 + 8 * v33);
          if (v32)
            goto LABEL_14;
          v42 = v31 + 1;
          if (v31 + 2 < v39)
          {
            v32 = *(_QWORD *)(v38 + 8 * (v31 + 2));
            if (v32)
            {
              v31 += 2;
              goto LABEL_11;
            }
            v33 = v31 + 3;
            v42 = v31 + 2;
            if (v31 + 3 < v39)
              break;
          }
        }
      }
LABEL_25:
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v12, 1, 1, v34);
      v19 = 0;
    }
    v32 = *(_QWORD *)(v38 + 8 * v33);
    if (v32)
    {
LABEL_14:
      v31 = v33;
LABEL_11:
      v19 = (v32 - 1) & v32;
      v27 = __clz(__rbit64(v32)) + (v31 << 6);
      v42 = v31;
      continue;
    }
    break;
  }
  while (1)
  {
    v31 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v31 >= v39)
    {
      v42 = v37;
      goto LABEL_25;
    }
    v32 = *(_QWORD *)(v38 + 8 * v31);
    ++v33;
    if (v32)
      goto LABEL_11;
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_2461F9A48(id *a1, uint64_t a2)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  __objc2_ivar_list **p_ivars;
  __objc2_ivar_list **v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  unsigned int v66;
  id v67;
  void *v68;
  id v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  unint64_t v83;
  char *v84;
  uint64_t v85;
  id v86;
  void *v87;
  unsigned int v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  char v98;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  id *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;

  v110 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2E8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v112 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v113 = (uint64_t)&v106 - v7;
  v8 = sub_24620B050();
  v122 = *(_QWORD *)(v8 - 8);
  v123 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v111 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v119 = (char *)&v106 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v121 = (char *)&v106 - v13;
  v127 = sub_24620B1C4();
  v14 = *(_QWORD *)(v127 - 8);
  MEMORY[0x24BDAC7A8](v127);
  v16 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1B8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v106 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2F0);
  v23 = sub_24620B524();
  *(_QWORD *)(v23 + 16) = 7;
  *(_DWORD *)(v23 + 32) = 33686018;
  v115 = v23 + 32;
  v116 = v23;
  *(_DWORD *)(v23 + 35) = 33686018;
  v24 = *(_QWORD *)(a2 + 64);
  v114 = a2 + 64;
  v25 = 1 << *(_BYTE *)(a2 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v126 = v26 & v24;
  v120 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  v27 = v22 + 4;
  v28 = (unint64_t)(v25 + 63) >> 6;
  v107 = v28 - 1;
  swift_bridgeObjectRetain();
  v29 = 0;
  v117 = v28;
  v108 = v28 - 5;
  v124 = a2;
  v109 = a2 + 104;
  v30 = (unint64_t)&qword_25755B1C0;
  v118 = v20;
  while (1)
  {
    if (v126)
    {
      v31 = __clz(__rbit64(v126));
      v125 = v29;
      v126 &= v126 - 1;
      v32 = v31 | (v29 << 6);
LABEL_8:
      v33 = v124;
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v20, *(_QWORD *)(v124 + 48) + *(_QWORD *)(v14 + 72) * v32, v127);
      v34 = *(_QWORD *)(v33 + 56);
      v30 = (unint64_t)&qword_25755B1C0;
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
      *(_QWORD *)&v20[*(int *)(v35 + 48)] = *(_QWORD *)(v34 + 8 * v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v20, 0, 1, v35);
      goto LABEL_15;
    }
    v36 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v36 >= v117)
    {
      v38 = v29;
    }
    else
    {
      v37 = *(_QWORD *)(v114 + 8 * v36);
      if (v37)
        goto LABEL_12;
      v38 = v29 + 1;
      if ((uint64_t)(v29 + 2) < v117)
      {
        v37 = *(_QWORD *)(v114 + 8 * (v29 + 2));
        if (v37)
        {
          v36 = v29 + 2;
LABEL_12:
          v125 = v36;
          v126 = (v37 - 1) & v37;
          v32 = __clz(__rbit64(v37)) + (v36 << 6);
          goto LABEL_8;
        }
        v38 = v29 + 2;
        if ((uint64_t)(v29 + 3) < v117)
        {
          v37 = *(_QWORD *)(v114 + 8 * (v29 + 3));
          if (v37)
          {
            v36 = v29 + 3;
            goto LABEL_12;
          }
          v36 = v29 + 4;
          v38 = v29 + 3;
          if ((uint64_t)(v29 + 4) < v117)
          {
            v37 = *(_QWORD *)(v114 + 8 * v36);
            if (v37)
              goto LABEL_12;
            while (v108 != v29)
            {
              v37 = *(_QWORD *)(v109 + 8 * v29++);
              if (v37)
              {
                v36 = v29 + 4;
                goto LABEL_12;
              }
            }
            v38 = v107;
          }
        }
      }
    }
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v20, 1, 1, v39);
    v125 = v38;
    v126 = 0;
LABEL_15:
    sub_2461FE82C((uint64_t)v20, (uint64_t)v22, &qword_25755B1B8);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v22, 1, v40) == 1)
      break;
    v41 = *(_DWORD *)&v27[*(int *)(v40 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v22, v127);
    if (sub_24620B1AC() == 1)
    {
      sub_24620B194();
      v42 = v121;
      sub_24620B008();
      v43 = v14;
      v44 = v119;
      sub_24620B008();
      v45 = sub_24620B0F8();
      v46 = v27;
      v47 = v22;
      v48 = *(void (**)(char *, uint64_t))(v122 + 8);
      v49 = v44;
      v50 = v123;
      v48(v49, v123);
      v51 = v42;
      v30 = (unint64_t)&qword_25755B1C0;
      v52 = v50;
      v14 = v43;
      v20 = v118;
      v48(v51, v52);
      v22 = v47;
      v27 = v46;
      if ((unint64_t)(v45 - 8) >= 0xFFFFFFFFFFFFFFF9)
      {
        v53 = v45 - 1;
        v54 = *(_QWORD *)(v116 + 16);
        if (v41 >= 2)
        {
          if (v53 >= v54)
            goto LABEL_68;
          v55 = 1;
        }
        else
        {
          if (v53 >= v54)
            goto LABEL_67;
          v55 = 0;
        }
        *(_BYTE *)(v115 + v53) = v55;
      }
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v127);
    v29 = v125;
  }
  swift_release();
  v30 = (unint64_t)v110;
  if (!((unint64_t)v110 >> 62))
  {
    v56 = *(_QWORD *)(((unint64_t)v110 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v56)
      goto LABEL_37;
LABEL_70:
    swift_bridgeObjectRelease();
    v92 = v116;
    v93 = *(_QWORD *)(v116 + 16);
    if (v93)
    {
      swift_bridgeObjectRetain();
      v94 = 0;
      v95 = MEMORY[0x24BEE4AF8];
      do
      {
        v98 = *(_BYTE *)(v92 + v94 + 32);
        if ((v98 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v128 = v95;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2461FE7D4(0, *(_QWORD *)(v95 + 16) + 1, 1);
            v95 = v128;
          }
          v97 = *(_QWORD *)(v95 + 16);
          v96 = *(_QWORD *)(v95 + 24);
          if (v97 >= v96 >> 1)
          {
            sub_2461FE7D4(v96 > 1, v97 + 1, 1);
            v95 = v128;
          }
          *(_QWORD *)(v95 + 16) = v97 + 1;
          *(_BYTE *)(v95 + v97 + 32) = v98;
        }
        ++v94;
      }
      while (v93 != v94);
      swift_bridgeObjectRelease();
    }
    swift_release();
    v100 = *(_QWORD *)(v92 + 16);
    if (v100)
    {
      swift_bridgeObjectRetain();
      v101 = 0;
      v102 = MEMORY[0x24BEE4AF8];
      do
      {
        if (*(_BYTE *)(v92 + v101 + 32) == 2)
        {
          v105 = swift_isUniquelyReferenced_nonNull_native();
          v128 = v102;
          if ((v105 & 1) == 0)
          {
            sub_2461FE7D4(0, *(_QWORD *)(v102 + 16) + 1, 1);
            v102 = v128;
          }
          v104 = *(_QWORD *)(v102 + 16);
          v103 = *(_QWORD *)(v102 + 24);
          if (v104 >= v103 >> 1)
          {
            sub_2461FE7D4(v103 > 1, v104 + 1, 1);
            v102 = v128;
          }
          *(_QWORD *)(v102 + 16) = v104 + 1;
          *(_BYTE *)(v102 + v104 + 32) = 2;
        }
        ++v101;
      }
      while (v100 != v101);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
LABEL_69:
  swift_bridgeObjectRetain();
  v56 = sub_24620B614();
  if (!v56)
    goto LABEL_70;
LABEL_37:
  v57 = v30 & 0xC000000000000001;
  v58 = 4;
  p_ivars = &SiriCoreMetrics.ivars;
  v60 = &SiriCoreMetrics.ivars;
  while (2)
  {
    if (v57)
      v61 = (id)MEMORY[0x249554954](v58 - 4, v30);
    else
      v61 = *(id *)(v30 + 8 * v58);
    v62 = v61;
    v63 = v58 - 3;
    if (__OFADD__(v58 - 4, 1))
    {
      __break(1u);
      goto LABEL_66;
    }
    v64 = objc_msgSend(v61, (SEL)p_ivars[37]);
    if (!v64 || (v65 = v64, v66 = objc_msgSend(v64, (SEL)v60[39]), v65, v66 != 1))
    {

      goto LABEL_39;
    }
    v67 = objc_msgSend(v62, (SEL)p_ivars[37]);
    if (!v67)
    {
      v72 = v113;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v122 + 56))(v113, 1, 1, v123);
      goto LABEL_52;
    }
    v68 = v67;
    v69 = objc_msgSend(v67, sel_aggregationWindowStartTimestamp);

    if (v69)
    {
      v70 = v112;
      sub_24620B044();

      v71 = 0;
    }
    else
    {
      v71 = 1;
      v70 = v112;
    }
    v74 = v122;
    v73 = v123;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v70, v71, 1, v123);
    v75 = (uint64_t)v70;
    v72 = v113;
    sub_2461FE82C(v75, v113, &qword_25755B2E8);
    v76 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v72, 1, v73);
    v60 = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
    if (v76 == 1)
    {
LABEL_52:

      sub_2461FE7F0(v72, &qword_25755B2E8);
      goto LABEL_39;
    }
    v77 = v122;
    v78 = v123;
    v79 = v111;
    (*(void (**)(char *, uint64_t, uint64_t))(v122 + 32))(v111, v72, v123);
    v80 = v121;
    sub_24620B008();
    v81 = sub_24620B0F8();
    v82 = *(void (**)(char *, uint64_t))(v77 + 8);
    v82(v80, v78);
    v83 = v81 - 1;
    if (v81 < 1)
    {
      v84 = v79;
      v85 = v78;
LABEL_57:
      v82(v84, v85);

      v30 = (unint64_t)v110;
      p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
      v60 = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
      goto LABEL_39;
    }
    if ((unint64_t)v81 > 7)
    {
      v84 = v111;
      v85 = v123;
      goto LABEL_57;
    }
    v86 = objc_msgSend(v62, sel_statistics);
    p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
    if (!v86)
      goto LABEL_93;
    v87 = v86;
    v88 = objc_msgSend(v86, sel_userRequestCount);

    v89 = *(_QWORD *)(v116 + 16);
    if (v88 >= 2)
    {
      v90 = v123;
      v91 = v111;
      if (v83 >= v89)
        goto LABEL_92;
      *(_BYTE *)(v115 + v83) = 1;
LABEL_64:

      v82(v91, v90);
      v30 = (unint64_t)v110;
      v60 = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
LABEL_39:
      ++v58;
      if (v63 == v56)
        goto LABEL_70;
      continue;
    }
    break;
  }
  v90 = v123;
  v91 = v111;
  if (v83 < v89)
  {
    *(_BYTE *)(v115 + v83) = 0;
    goto LABEL_64;
  }
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
}

uint64_t SiriCoreMetricsCalculator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  v4 = sub_24620B104();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetricsCalculator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_calendar;
  v4 = sub_24620B104();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_2461FA540(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 64) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 72) = v4;
  *v4 = v2;
  v4[1] = sub_2461FA5A8;
  return SiriCoreMetricsCalculator.doWork(_:)(v2 + 16, a2);
}

uint64_t sub_2461FA5A8()
{
  uint64_t *v0;
  _OWORD *v1;
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  uint64_t v6;

  v1 = (_OWORD *)*v0;
  v2 = *(_OWORD **)(*v0 + 64);
  v6 = *v0;
  swift_task_dealloc();
  v3 = v1[1];
  v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *v2 = v3;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

_QWORD *sub_2461FA600(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25755B350);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2461FE9FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2461FA70C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2461FA71C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_24620B5FC();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461FEAEC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_2461FA928(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2461FA948(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2461FA9B8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_24620B584();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2461FA9B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2461FAA88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2461FE9C0((uint64_t)v12, *a3);
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
      sub_2461FE9C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2461FAA88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24620B590();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2461FAC40(a5, a6);
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
  v8 = sub_24620B5F0();
  if (!v8)
  {
    sub_24620B5FC();
    __break(1u);
LABEL_17:
    result = sub_24620B644();
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

uint64_t sub_2461FAC40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2461FACD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2461FAEAC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2461FAEAC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2461FACD4(uint64_t a1, unint64_t a2)
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
      v3 = sub_2461FAE48(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24620B5D8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24620B5FC();
      __break(1u);
LABEL_10:
      v2 = sub_24620B4E8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24620B644();
    __break(1u);
LABEL_14:
    result = sub_24620B5FC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2461FAE48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B320);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2461FAEAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25755B320);
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
  result = sub_24620B644();
  __break(1u);
  return result;
}

unint64_t sub_2461FAFF8(uint64_t a1)
{
  uint64_t v2;

  sub_24620B740();
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v2 = sub_24620B758();
  return sub_2461FCD9C(a1, v2);
}

unint64_t sub_2461FB1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24620B740();
  sub_24620B4D0();
  v4 = sub_24620B758();
  return sub_2461FD014(a1, a2, v4);
}

unint64_t sub_2461FB210(uint64_t a1)
{
  uint64_t v2;

  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  v2 = sub_24620B470();
  return sub_2461FD0F4(a1, v2);
}

uint64_t sub_2461FB27C(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v3 = v2;
  v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B308);
  v10 = (_QWORD *)sub_24620B62C();
  if (*(_QWORD *)(v9 + 16))
  {
    v26 = v3;
    v11 = 1 << *(_BYTE *)(v9 + 32);
    v12 = (_QWORD *)(v9 + 64);
    v13 = -1;
    if (v11 < 64)
      v13 = ~(-1 << v11);
    v14 = v13 & *(_QWORD *)(v9 + 64);
    v15 = (unint64_t)(v11 + 63) >> 6;
    result = swift_retain();
    v17 = 0;
    while (1)
    {
      if (v14)
      {
        v18 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        v19 = v18 | (v17 << 6);
      }
      else
      {
        v20 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v20 >= v15)
          goto LABEL_23;
        v21 = v12[v20];
        ++v17;
        if (!v21)
        {
          v17 = v20 + 1;
          if (v20 + 1 >= v15)
            goto LABEL_23;
          v21 = v12[v17];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v26;
                goto LABEL_30;
              }
              v24 = 1 << *(_BYTE *)(v9 + 32);
              if (v24 >= 64)
                bzero((void *)(v9 + 64), ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v12 = -1 << v24;
              v3 = v26;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v21 = v12[v22];
            if (!v21)
            {
              while (1)
              {
                v17 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_32;
                if (v17 >= v15)
                  goto LABEL_23;
                v21 = v12[v17];
                ++v22;
                if (v21)
                  goto LABEL_20;
              }
            }
            v17 = v22;
          }
        }
LABEL_20:
        v14 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v17 << 6);
      }
      v23 = *(_QWORD *)(v9 + 48) + *(_QWORD *)(v6 + 72) * v19;
      if ((a2 & 1) != 0)
        sub_2461FDAE8(v23, (uint64_t)v8, type metadata accessor for SiriCoreMetricsAggregationKeys);
      else
        sub_2461FDB2C(v23, (uint64_t)v8, type metadata accessor for SiriCoreMetricsAggregationKeys);
      result = sub_2461FC97C((uint64_t)v8, *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v19), v10);
    }
  }
  result = swift_release();
LABEL_30:
  *v3 = v10;
  return result;
}

uint64_t sub_2461FB4C4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_24620B1C4();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v2;
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2D8);
  v8 = sub_24620B62C();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
    v35 = v38;
LABEL_42:
    *v35 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 64);
  v40 = (_QWORD *)(v7 + 64);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v39 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 64;
  result = swift_retain();
  v16 = 0;
  HIDWORD(v37) = a2;
  v17 = 16;
  if ((a2 & 1) != 0)
    v17 = 32;
  v41 = v17;
  while (1)
  {
    if (v13)
    {
      v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v20 = v19 | (v16 << 6);
      goto LABEL_24;
    }
    v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v21 >= v39)
    {
      swift_release();
      v35 = v38;
      v22 = v40;
      if ((v37 & 0x100000000) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v7 + 32);
        if (v36 >= 64)
          bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v22 = -1 << v36;
        *(_QWORD *)(v7 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v16;
    if (!v23)
    {
      v16 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_34;
      v23 = v40[v16];
      if (!v23)
        break;
    }
LABEL_23:
    v13 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + v41))(v6, *(_QWORD *)(v7 + 48) + v25 * v20, v4);
    v26 = v7;
    v27 = *(_BYTE *)(*(_QWORD *)(v7 + 56) + v20);
    sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
    result = sub_24620B470();
    v28 = -1 << *(_BYTE *)(v9 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v14 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32))(*(_QWORD *)(v9 + 48) + v25 * v18, v6, v4);
    *(_BYTE *)(*(_QWORD *)(v9 + 56) + v18) = v27;
    ++*(_QWORD *)(v9 + 16);
    v7 = v26;
  }
  v24 = v21 + 2;
  if (v24 >= v39)
  {
LABEL_34:
    swift_release();
    v35 = v38;
    if ((v37 & 0x100000000) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v23 = v40[v24];
  if (v23)
  {
    v16 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    v16 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v16 >= v39)
      goto LABEL_34;
    v23 = v40[v16];
    ++v24;
    if (v23)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_2461FB860(uint64_t a1, int a2)
{
  uint64_t *v2;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;

  v4 = sub_24620B1C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v2;
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B330);
  v9 = sub_24620B62C();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release();
    v35 = v39;
LABEL_42:
    *v35 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v38 = a2;
  v18 = 16;
  if ((a2 & 1) != 0)
    v18 = 32;
  v42 = v18;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v22 >= v40)
    {
      swift_release();
      v35 = v39;
      v23 = v41;
      if ((v38 & 1) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v8 + 32);
        if (v36 >= 64)
          bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v23 = -1 << v36;
        *(_QWORD *)(v8 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
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
        break;
    }
LABEL_23:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_24:
    v26 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + v42))(v7, *(_QWORD *)(v8 + 48) + v26 * v21, v4);
    v27 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v21);
    sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
    result = sub_24620B470();
    v28 = -1 << *(_BYTE *)(v10 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v26 * v19, v7, v4);
    *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v19) = v27;
    ++*(_QWORD *)(v10 + 16);
  }
  v25 = v22 + 2;
  if (v25 >= v40)
  {
LABEL_34:
    swift_release();
    v35 = v39;
    if ((v38 & 1) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v24 = v41[v25];
  if (v24)
  {
    v17 = v25;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v17 >= v40)
      goto LABEL_34;
    v24 = v41[v17];
    ++v25;
    if (v24)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_2461FBBF0(uint64_t a1, int a2)
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
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_24620B1C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B328);
  v42 = a2;
  v10 = sub_24620B62C();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
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
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
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
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
    result = sub_24620B470();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_2461FBF84(uint64_t a1, char a2)
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
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B310);
  v37 = a2;
  v6 = sub_24620B62C();
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
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_24620B740();
    sub_24620B4D0();
    result = sub_24620B758();
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

uint64_t sub_2461FC28C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  result = sub_2461FDAE8(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, type metadata accessor for SiriCoreMetricsAggregationKeys);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_2461FC324(unint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24620B1C4();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_BYTE *)(a4[7] + a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_2461FC3BC(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24620B1C4();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void (*sub_2461FC454(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x58uLL);
  *a1 = v4;
  v5 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v6 = malloc(*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  v4[8] = v6;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_2461FDB2C(a2, (uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v4[9] = sub_2461FC930(v4);
  v4[10] = sub_2461FC698(v4 + 4, (uint64_t)v6, isUniquelyReferenced_nonNull_native);
  return sub_2461FC50C;
}

void sub_2461FC50C(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);
  void *v3;

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  v3 = *(void **)(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  sub_2461FDB70((uint64_t)v3, type metadata accessor for SiriCoreMetricsAggregationKeys);
  v2(v1, 0);
  free(v3);
  free(v1);
}

void (*sub_2461FC56C(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x68uLL);
  *a1 = v4;
  v5 = sub_24620B1C4();
  v4[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[9] = v6;
  v7 = malloc(*(_QWORD *)(v6 + 64));
  v4[10] = v7;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v7, a2, v5);
  v4[11] = sub_2461FC950(v4);
  v4[12] = sub_2461FC7C8(v4 + 4, (uint64_t)v7, isUniquelyReferenced_nonNull_native);
  return sub_2461FC62C;
}

void sub_2461FC62C(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v3 = *(void **)(*(_QWORD *)a1 + 80);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 96))(*(_QWORD *)a1 + 32, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0);
  free(v3);
  free(v1);
}

void (*sub_2461FC698(_QWORD *a1, uint64_t a2, char a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void (*result)(_QWORD *, uint64_t);

  v4 = v3;
  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[2] = a2;
  v8[3] = v4;
  v9 = *v4;
  v11 = sub_2461FAFF8(a2);
  *((_BYTE *)v8 + 9) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = v10 ^ 1;
  v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[4] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *v8 = v17;
        *((_BYTE *)v8 + 8) = v13 & 1;
        return sub_2461FC7BC;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_2461FD234();
      goto LABEL_7;
    }
    sub_2461FB27C(v14, a3 & 1);
    v18 = sub_2461FAFF8(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      v11 = v18;
      v8[4] = v18;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  result = (void (*)(_QWORD *, uint64_t))sub_24620B704();
  __break(1u);
  return result;
}

void sub_2461FC7BC(_QWORD *a1, uint64_t a2)
{
  sub_2461FC8F8(a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2461FCBA0);
}

void (*sub_2461FC7C8(_QWORD *a1, uint64_t a2, char a3))(_QWORD *a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void (*result)(_QWORD *, uint64_t);

  v4 = v3;
  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[2] = a2;
  v8[3] = v4;
  v9 = *v4;
  v11 = sub_2461FB210(a2);
  *((_BYTE *)v8 + 9) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = v10 ^ 1;
  v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[4] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *v8 = v17;
        *((_BYTE *)v8 + 8) = v13 & 1;
        return sub_2461FC8EC;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_2461FD684();
      goto LABEL_7;
    }
    sub_2461FB860(v14, a3 & 1);
    v18 = sub_2461FB210(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      v11 = v18;
      v8[4] = v18;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  sub_24620B1C4();
  result = (void (*)(_QWORD *, uint64_t))sub_24620B704();
  __break(1u);
  return result;
}

void sub_2461FC8EC(_QWORD *a1, uint64_t a2)
{
  sub_2461FC8F8(a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2461FCCA0);
}

void sub_2461FC8F8(_QWORD *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  void *v3;

  v3 = (void *)*a1;
  a3(*a1, *(unsigned __int8 *)(*a1 + 9), *(_QWORD *)(*a1 + 24), *(_QWORD *)(*a1 + 32), *(_QWORD *)(*a1 + 16));
  free(v3);
}

uint64_t (*sub_2461FC930(_QWORD *a1))()
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_2461FEC48;
}

uint64_t (*sub_2461FC950(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_2461FC970;
}

uint64_t sub_2461FC970(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_2461FC97C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  sub_24620B740();
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  v6 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_24620B758();
  v4 = sub_24620B5A8();
  *(_QWORD *)((char *)a3 + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v4;
  result = sub_2461FDAE8(a1, a3[6] + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * v4, type metadata accessor for SiriCoreMetricsAggregationKeys);
  *(_QWORD *)(a3[7] + 8 * v4) = a2;
  ++a3[2];
  return result;
}

unint64_t sub_2461FCBA0(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10;
  unint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v10 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  result = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      return sub_2461FDD58(a4, *a3);
    }
  }
  else
  {
    v14 = *(_QWORD *)a1;
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v14;
    }
    else
    {
      v15 = (_QWORD *)*a3;
      sub_2461FDB2C(a5, (uint64_t)v13, type metadata accessor for SiriCoreMetricsAggregationKeys);
      return sub_2461FC28C(a4, (uint64_t)v13, v14, v15);
    }
  }
  return result;
}

unint64_t sub_2461FCCA0(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10;
  unint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v10 = sub_24620B1C4();
  result = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      return sub_2461FE12C(a4, *a3);
    }
  }
  else
  {
    v15 = *(_QWORD *)a1;
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v15;
    }
    else
    {
      v16 = (_QWORD *)*a3;
      (*(void (**)(char *, uint64_t))(v12 + 16))(v14, a5);
      return sub_2461FC3BC(a4, (uint64_t)v14, v15, v16);
    }
  }
  return result;
}

unint64_t sub_2461FCD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = a1;
  v32 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  MEMORY[0x24BDAC7A8](v32);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = v2 + 64;
  v45 = v2;
  v7 = -1 << *(_BYTE *)(v2 + 32);
  v8 = a2 & ~v7;
  if (((*(_QWORD *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v42 = ~v7;
    v43 = *(_QWORD *)(v4 + 72);
    v9 = type metadata accessor for SiriCoreMetricsAggregationKeys;
    while (1)
    {
      v10 = v9;
      sub_2461FDB2C(*(_QWORD *)(v45 + 48) + v43 * v8, (uint64_t)v6, v9);
      if ((sub_24620B1B8() & 1) != 0)
      {
        v11 = *(int *)(v32 + 20);
        v12 = *(_QWORD *)&v6[v11];
        v13 = *(_QWORD *)&v6[v11 + 8];
        v14 = *(_QWORD *)&v6[v11 + 16];
        v15 = *(_QWORD *)&v6[v11 + 24];
        v17 = *(_QWORD *)&v6[v11 + 32];
        v16 = *(_QWORD *)&v6[v11 + 40];
        v40 = *(_QWORD *)&v6[v11 + 48];
        v41 = v16;
        v18 = *(_QWORD *)&v6[v11 + 56];
        v19 = *(_QWORD *)&v6[v11 + 64];
        v34 = *(_QWORD *)&v6[v11 + 72];
        v20 = (uint64_t *)(v46 + v11);
        v21 = *v20;
        v22 = v20[1];
        v24 = v20[2];
        v23 = v20[3];
        v26 = v20[4];
        v25 = v20[5];
        v27 = v20[6];
        v38 = v19;
        v39 = v27;
        v35 = v20[7];
        v36 = v18;
        v29 = v20[8];
        v28 = v20[9];
        v37 = v29;
        v33 = v28;
        if (v12 == v21 && v13 == v22)
          goto LABEL_3;
        if ((sub_24620B6EC() & 1) != 0)
        {
LABEL_3:
          if ((v14 == v24 && v15 == v23 || (sub_24620B6EC() & 1) != 0)
            && (v17 == v26 && v41 == v25 || (sub_24620B6EC() & 1) != 0)
            && (v40 == v39 && v36 == v35 || (sub_24620B6EC() & 1) != 0)
            && (v38 == v37 && v34 == v33 || (sub_24620B6EC() & 1) != 0))
          {
            break;
          }
        }
      }
      v9 = v10;
      sub_2461FDB70((uint64_t)v6, v10);
      v8 = (v8 + 1) & v42;
      if (((*(_QWORD *)(v44 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        return v8;
    }
    sub_2461FDB70((uint64_t)v6, type metadata accessor for SiriCoreMetricsAggregationKeys);
  }
  return v8;
}

unint64_t sub_2461FD014(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24620B6EC() & 1) == 0)
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
      while (!v14 && (sub_24620B6EC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2461FD0F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_24620B1C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_2461F44D8(&qword_25755B340, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B8]);
      v14 = sub_24620B488();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_2461FD234()
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
  uint64_t v9;
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
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B308);
  v5 = *v0;
  v6 = sub_24620B620();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = v5 + 64;
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
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
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v16)
        goto LABEL_26;
      v23 = *(_QWORD *)(v9 + 8 * v12);
      if (!v23)
        break;
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v26 + 72) * v18;
    sub_2461FDB2C(*(_QWORD *)(v5 + 48) + v19, (uint64_t)v4, type metadata accessor for SiriCoreMetricsAggregationKeys);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20);
    result = (void *)sub_2461FDAE8((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19, type metadata accessor for SiriCoreMetricsAggregationKeys);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v20) = v21;
  }
  v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v9 + 8 * v24);
  if (v23)
  {
    v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v9 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2461FD464()
{
  uint64_t *v0;
  uint64_t v1;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = sub_24620B1C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2D8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_24620B620();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v24 + 8 * v11);
      if (!v20)
        break;
    }
LABEL_25:
    v14 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v16) = v18;
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2461FD684()
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
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = sub_24620B1C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B330);
  v6 = *v0;
  v7 = sub_24620B620();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
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
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v16)
        goto LABEL_26;
      v23 = *(_QWORD *)(v26 + 8 * v12);
      if (!v23)
        break;
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v20);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v21;
  }
  v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v26 + 8 * v24);
  if (v23)
  {
    v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2461FD8B8()
{
  uint64_t *v0;
  uint64_t v1;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_24620B1C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B328);
  v24 = v0;
  v5 = *v0;
  v6 = sub_24620B620();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2461FDAE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2461FDB2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2461FDB70(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_2461FDBAC()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B310);
  v2 = *v0;
  v3 = sub_24620B620();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2461FDD58(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;

  v38 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  v4 = *(_QWORD *)(v38 - 8);
  result = MEMORY[0x24BDAC7A8](v38);
  v37 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + 64;
  v8 = -1 << *(_BYTE *)(a2 + 32);
  v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(_QWORD *)(a2 + 64 + 8 * (v9 >> 6))) != 0)
  {
    v10 = ~v8;
    result = sub_24620B59C();
    if ((*(_QWORD *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      v11 = *(_QWORD *)(v4 + 72);
      v33 = a2 + 64;
      v34 = a2;
      v35 = (result + 1) & v10;
      v36 = v10;
      v32 = v11;
      do
      {
        v42 = a1;
        v12 = *(_QWORD *)(a2 + 48);
        v39 = v11 * v9;
        v13 = v37;
        sub_2461FDB2C(v12 + v11 * v9, v37, type metadata accessor for SiriCoreMetricsAggregationKeys);
        sub_24620B740();
        sub_24620B1C4();
        sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
        sub_24620B47C();
        v14 = v13 + *(int *)(v38 + 20);
        v15 = *(_QWORD *)(v14 + 64);
        v40 = *(_QWORD *)(v14 + 48);
        v41 = v15;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24620B4D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24620B4D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24620B4D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24620B4D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24620B4D0();
        a1 = v42;
        swift_bridgeObjectRelease();
        v16 = v36;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v17 = sub_24620B758();
        v18 = v35;
        v19 = v17;
        result = sub_2461FDB70(v13, type metadata accessor for SiriCoreMetricsAggregationKeys);
        v20 = v19 & v16;
        if (a1 >= (uint64_t)v18)
        {
          if (v20 < v18)
          {
            v7 = v33;
            a2 = v34;
            v11 = v32;
          }
          else
          {
            v7 = v33;
            a2 = v34;
            v11 = v32;
            if (a1 >= (uint64_t)v20)
              goto LABEL_12;
          }
        }
        else
        {
          v7 = v33;
          a2 = v34;
          v11 = v32;
          if (v20 >= v18 || a1 >= (uint64_t)v20)
          {
LABEL_12:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v11 * a1;
            if (v11 * a1 < v39 || result >= v21 + v39 + v11)
            {
              result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v11 * a1 != v39)
            {
              result = swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_QWORD *)(v22 + 8 * a1);
            v24 = (_QWORD *)(v22 + 8 * v9);
            if (a1 != v9 || (a1 = v9, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v9;
            }
          }
        }
        v9 = (v9 + 1) & v16;
      }
      while (((*(_QWORD *)(v7 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
    v25 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2461FE12C(int64_t a1, uint64_t a2)
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
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_24620B1C4();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_24620B59C();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
        v18 = sub_24620B470();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
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
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2461FE3CC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_2461FAFF8(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  result = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = v11[3];
  if (v18 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    v19 = *v4;
    if ((v17 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v19[7] + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_2461FD234();
    goto LABEL_7;
  }
  sub_2461FB27C(result, a3 & 1);
  result = sub_2461FAFF8(a2);
  if ((v17 & 1) != (v20 & 1))
  {
LABEL_14:
    result = sub_24620B704();
    __break(1u);
    return result;
  }
  v13 = result;
  v19 = *v4;
  if ((v17 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_2461FDB2C(a2, (uint64_t)v10, type metadata accessor for SiriCoreMetricsAggregationKeys);
  return sub_2461FC28C(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_2461FE524(char a1, uint64_t a2, char a3)
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
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;

  v4 = (_QWORD **)v3;
  v8 = sub_24620B1C4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_2461FB210(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v20[7] + v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_2461FD464();
    goto LABEL_7;
  }
  sub_2461FB4C4(result, a3 & 1);
  result = sub_2461FB210(a2);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_14:
    result = sub_24620B704();
    __break(1u);
    return result;
  }
  v14 = result;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_2461FC324(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_2461FE674()
{
  return sub_2461F44D8((unint64_t *)&qword_25755B1C8, type metadata accessor for SiriCoreMetricsDataRecord, (uint64_t)&protocol conformance descriptor for SiriCoreMetricsDataRecord);
}

unint64_t sub_2461FE6A4()
{
  unint64_t result;

  result = qword_25755B1D0;
  if (!qword_25755B1D0)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriCoreMetricsResults, &type metadata for SiriCoreMetricsResults);
    atomic_store(result, (unint64_t *)&qword_25755B1D0);
  }
  return result;
}

uint64_t sub_2461FE6E8()
{
  return type metadata accessor for SiriCoreMetricsCalculator();
}

uint64_t type metadata accessor for SiriCoreMetricsCalculator()
{
  uint64_t result;

  result = qword_25755B208;
  if (!qword_25755B208)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461FE72C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = sub_24620B104();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

_OWORD *sub_2461FE7C4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2461FE7D4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2461FE870(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2461FE7F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2461FE82C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2461FE870(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2F8);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24620B644();
  __break(1u);
  return result;
}

uint64_t sub_2461FE9C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2461FE9FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24620B644();
  __break(1u);
  return result;
}

uint64_t sub_2461FEAEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_24620B644();
  __break(1u);
  return result;
}

uint64_t sub_2461FEC04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t SiriCoreMetricsResults.init(processedConversations:countsReportedAll:totalCounts:conversationStreamMetadata:eventStreamMetadata:twoByThreeResults:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a5;
  a7[3] = a4;
  a7[4] = a3;
  a7[5] = a6;
  return result;
}

__n128 SiriCoreMetricsAggregationKeys.init(aggregationStartTimeSince2001:aggregationIntervalInDays:siriInputLocale:viewMode:audioInputRoute:product:siriDataSharingOptInStatus:)@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, __n128 a9, uint64_t a10)
{
  uint64_t v18;
  __n128 result;

  sub_24620B1A0();
  v18 = a8 + *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  *(_QWORD *)v18 = a1;
  *(_QWORD *)(v18 + 8) = a2;
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  *(_QWORD *)(v18 + 32) = a5;
  *(_QWORD *)(v18 + 40) = a6;
  *(_QWORD *)(v18 + 48) = a7;
  result = a9;
  *(__n128 *)(v18 + 56) = a9;
  *(_QWORD *)(v18 + 72) = a10;
  return result;
}

uint64_t TwoByThreeSegment.getODMSegment()(uint64_t result)
{
  return result;
}

BOOL static TwoByThreeSegment.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TwoByThreeSegment.hash(into:)()
{
  return sub_24620B74C();
}

uint64_t TwoByThreeSegment.hashValue.getter()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t DynamicDimensionsSiriCoreMetrics.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461FEE58(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461FEE90 + 4 * byte_24620C0E0[a1]))(0xD00000000000001ALL, 0x800000024620DB00);
}

uint64_t sub_2461FEE90()
{
  return 0x75706E4969726973;
}

uint64_t sub_2461FEEB4()
{
  return 0x65646F4D77656976;
}

uint64_t sub_2461FEECC()
{
  return 0x746E496F69647561;
}

uint64_t sub_2461FEEF0()
{
  return 0x746375646F7270;
}

uint64_t sub_2461FEF08()
{
  unsigned __int8 *v0;

  return sub_2461FEE58(*v0);
}

uint64_t sub_2461FEF10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246200D00(a1, a2);
  *a3 = result;
  return result;
}

void sub_2461FEF34(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2461FEF40()
{
  sub_24620099C();
  return sub_24620B788();
}

uint64_t sub_2461FEF68()
{
  sub_24620099C();
  return sub_24620B794();
}

uint64_t DynamicDimensionsSiriCoreMetrics.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B368);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24620099C();
  sub_24620B77C();
  v8[15] = 0;
  sub_24620B6BC();
  if (!v1)
  {
    v8[14] = 1;
    sub_24620B6BC();
    v8[13] = 2;
    sub_24620B6BC();
    v8[12] = 3;
    sub_24620B6BC();
    v8[11] = 4;
    sub_24620B6BC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DynamicDimensionsSiriCoreMetrics.hashValue.getter()
{
  sub_24620B740();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  return sub_24620B758();
}

__n128 DynamicDimensionsSiriCoreMetrics.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_246200F28(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_2461FF258()
{
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461FF350()
{
  sub_24620B740();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  return sub_24620B758();
}

__n128 sub_2461FF458@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[5];

  sub_246200F28(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_2461FF4A0(_QWORD *a1)
{
  return DynamicDimensionsSiriCoreMetrics.encode(to:)(a1);
}

uint64_t sub_2461FF4B4(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  _OWORD v9[5];

  v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  v3 = a1[4];
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return _s15SiriCoreMetrics017DynamicDimensionsabC0V23__derived_struct_equalsySbAC_ACtFZ_0(v8, v9) & 1;
}

__n128 SiriCoreMetricsAggregationKeys.init(aggregationInterval:dimension:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __n128 result;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 48) = v8;
  *(_OWORD *)(v7 + 64) = *(_OWORD *)(a2 + 64);
  result = *(__n128 *)(a2 + 16);
  *(_OWORD *)v7 = *(_OWORD *)a2;
  *(__n128 *)(v7 + 16) = result;
  return result;
}

uint64_t type metadata accessor for SiriCoreMetricsAggregationKeys(uint64_t a1)
{
  return sub_246201570(a1, qword_25755B430);
}

uint64_t SiriCoreMetricsAggregationKeys.description.getter()
{
  uint64_t v1;

  sub_24620B5CC();
  sub_24620B4DC();
  v1 = sub_24620B1AC();
  sub_24620B6E0();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  sub_24620B4DC();
  sub_24620B194();
  sub_24620B53C();
  sub_24620B4DC();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  sub_24620B4DC();
  swift_bridgeObjectRetain();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  sub_24620B4DC();
  swift_bridgeObjectRetain();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  sub_24620B4DC();
  swift_bridgeObjectRetain();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  sub_24620B4DC();
  swift_bridgeObjectRetain();
  sub_24620B4DC();
  swift_bridgeObjectRelease();
  return HIDWORD(v1);
}

uint64_t SiriCoreMetricsAggregationKeys.hash(into:)()
{
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease_n();
}

uint64_t SiriCoreMetricsAggregationKeys.hashValue.getter()
{
  sub_24620B740();
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  type metadata accessor for SiriCoreMetricsAggregationKeys(0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return sub_24620B758();
}

uint64_t sub_2461FFB14()
{
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_2461FFC9C()
{
  sub_24620B740();
  sub_24620B1C4();
  sub_2461F44D8((unint64_t *)&qword_25755B2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7B0]);
  sub_24620B47C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24620B4D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return sub_24620B758();
}

BOOL static SiriRequestCounts.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_2461FFE3C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x65757165526C6C61;
}

BOOL sub_2461FFE84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2461FFE9C()
{
  char *v0;

  return sub_2461FFE3C(*v0);
}

uint64_t sub_2461FFEA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246201310(a1, a2);
  *a3 = result;
  return result;
}

void sub_2461FFEC8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2461FFED4()
{
  sub_2462012CC();
  return sub_24620B788();
}

uint64_t sub_2461FFEFC()
{
  sub_2462012CC();
  return sub_24620B794();
}

uint64_t SiriRequestCounts.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B378);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2462012CC();
  sub_24620B77C();
  v8[15] = 0;
  sub_24620B6D4();
  if (!v1)
  {
    v8[14] = 1;
    sub_24620B6D4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SiriRequestCounts.init(from:)(_QWORD *a1)
{
  return sub_24620140C(a1);
}

uint64_t sub_24620004C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_24620140C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_246200074(_QWORD *a1)
{
  return SiriRequestCounts.encode(to:)(a1);
}

BOOL sub_24620008C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t SiriCountsAll.aggregationInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_24620B1C4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

_QWORD *SiriCountsAll.dimensions.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for SiriCountsAll(0) + 20));
  return sub_2462015A4(v3, a1);
}

_QWORD *SiriCountsAll.dimensions.setter(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for SiriCountsAll(0) + 20));
  return sub_2462015D8(a1, v3);
}

uint64_t (*SiriCountsAll.dimensions.modify())()
{
  type metadata accessor for SiriCountsAll(0);
  return nullsub_1;
}

uint64_t SiriCountsAll.requestCounts.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriCountsAll(0) + 24));
}

uint64_t SiriCountsAll.requestCounts.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SiriCountsAll(0);
  *(_QWORD *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*SiriCountsAll.requestCounts.modify())()
{
  type metadata accessor for SiriCountsAll(0);
  return nullsub_1;
}

uint64_t sub_2462001D8(char a1)
{
  if (!a1)
    return 0xD000000000000013;
  if (a1 == 1)
    return 0x6F69736E656D6964;
  return 0x4374736575716572;
}

uint64_t sub_246200244()
{
  char *v0;

  return sub_2462001D8(*v0);
}

uint64_t sub_24620024C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246202EFC(a1, a2);
  *a3 = result;
  return result;
}

void sub_246200270(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24620027C()
{
  sub_24620160C();
  return sub_24620B788();
}

uint64_t sub_2462002A4()
{
  sub_24620160C();
  return sub_24620B794();
}

uint64_t SiriCountsAll.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B388);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24620160C();
  sub_24620B77C();
  LOBYTE(v20) = 0;
  sub_24620B1C4();
  sub_2461F44D8(&qword_25755B398, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7A8]);
  sub_24620B6C8();
  if (!v2)
  {
    v9 = type metadata accessor for SiriCountsAll(0);
    v10 = (__int128 *)(v3 + *(int *)(v9 + 20));
    v11 = *v10;
    v12 = v10[1];
    v13 = v10[2];
    v14 = v10[3];
    v16 = *((_QWORD *)v10 + 8);
    v15 = *((_QWORD *)v10 + 9);
    v20 = v11;
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v24 = v16;
    v25 = v15;
    v19 = 1;
    sub_2461F23E4();
    sub_24620B6C8();
    *(_QWORD *)&v20 = *(_QWORD *)(v3 + *(int *)(v9 + 24));
    v19 = 2;
    sub_246201650();
    sub_24620B6C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SiriCountsAll.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char v36;

  v24 = a2;
  v25 = sub_24620B1C4();
  v3 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v26 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B3A8);
  v5 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SiriCountsAll(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24620160C();
  v28 = v7;
  v11 = v29;
  sub_24620B770();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v29 = v8;
  v12 = (uint64_t)a1;
  LOBYTE(v30) = 0;
  sub_2461F44D8(&qword_25755B3B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE2B798], MEMORY[0x24BE2B7C0]);
  v14 = v25;
  v13 = v26;
  sub_24620B680();
  v23[1] = v3;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v13, v14);
  v36 = 1;
  sub_2461F28DC();
  sub_24620B680();
  v15 = v31;
  v16 = v32;
  v17 = v33;
  v18 = v34;
  v19 = v35;
  v20 = v29;
  v21 = &v10[*(int *)(v29 + 20)];
  *(_OWORD *)v21 = v30;
  *((_OWORD *)v21 + 1) = v15;
  *((_OWORD *)v21 + 2) = v16;
  *((_OWORD *)v21 + 3) = v17;
  *((_QWORD *)v21 + 8) = v18;
  *((_QWORD *)v21 + 9) = v19;
  v36 = 2;
  sub_246201694();
  sub_24620B680();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v28, v27);
  *(_QWORD *)&v10[*(int *)(v20 + 24)] = v30;
  sub_2462016D8((uint64_t)v10, v24);
  __swift_destroy_boxed_opaque_existential_1(v12);
  return sub_24620171C((uint64_t)v10);
}

uint64_t sub_2462007C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriCountsAll.init(from:)(a1, a2);
}

uint64_t sub_2462007DC(_QWORD *a1)
{
  return SiriCountsAll.encode(to:)(a1);
}

uint64_t SiriCoreMetricsResults.processedConversations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.countsReportedAll.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.eventStreamMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResults.eventStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResults.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.conversationStreamMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SiriCoreMetricsResults.conversationStreamMetadata.modify())()
{
  return nullsub_1;
}

uint64_t SiriCoreMetricsResults.totalCounts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsResults.twoByThreeResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_246200894()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24620089C()
{
  return swift_bridgeObjectRetain();
}

uint64_t _s15SiriCoreMetrics017DynamicDimensionsabC0V23__derived_struct_equalsySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  BOOL v7;
  char v8;
  char v9;
  char v10;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_24620B6EC(), result = 0, (v5 & 1) != 0))
  {
    v7 = a1[2] == a2[2] && a1[3] == a2[3];
    if (v7 || (v8 = sub_24620B6EC(), result = 0, (v8 & 1) != 0))
    {
      if (a1[4] == a2[4] && a1[5] == a2[5] || (v9 = sub_24620B6EC(), result = 0, (v9 & 1) != 0))
      {
        if (a1[6] == a2[6] && a1[7] == a2[7] || (v10 = sub_24620B6EC(), result = 0, (v10 & 1) != 0))
        {
          if (a1[8] == a2[8] && a1[9] == a2[9])
            return 1;
          else
            return sub_24620B6EC();
        }
      }
    }
  }
  return result;
}

unint64_t sub_24620099C()
{
  unint64_t result;

  result = qword_25755B370;
  if (!qword_25755B370)
  {
    result = MEMORY[0x249554DEC](&unk_24620C7AC, &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B370);
  }
  return result;
}

BOOL _s15SiriCoreMetrics0A9CountsAllV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char v17;
  _BOOL8 result;
  BOOL v19;
  char v20;
  BOOL v21;
  char v22;
  BOOL v23;
  char v24;
  BOOL v25;
  char v26;
  uint64_t v27;
  int v28;
  int v29;
  int *v30;
  int v31;
  int v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((sub_24620B1B8() & 1) == 0)
    return 0;
  v34 = type metadata accessor for SiriCountsAll(0);
  v4 = *(int *)(v34 + 20);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = *(_QWORD *)(a1 + v4 + 16);
  v8 = *(_QWORD *)(a1 + v4 + 24);
  v9 = *(_QWORD *)(a1 + v4 + 32);
  v10 = *(_QWORD *)(a1 + v4 + 40);
  v41 = *(_QWORD *)(a1 + v4 + 56);
  v42 = *(_QWORD *)(a1 + v4 + 48);
  v37 = *(_QWORD *)(a1 + v4 + 72);
  v38 = *(_QWORD *)(a1 + v4 + 64);
  v11 = (_QWORD *)(a2 + v4);
  v12 = v11[2];
  v13 = v11[3];
  v15 = v11[4];
  v14 = v11[5];
  v39 = v11[7];
  v40 = v11[6];
  v35 = v11[9];
  v36 = v11[8];
  v16 = v5 == *v11 && v6 == v11[1];
  if (v16 || (v17 = sub_24620B6EC(), result = 0, (v17 & 1) != 0))
  {
    v19 = v7 == v12 && v8 == v13;
    if (v19 || (v20 = sub_24620B6EC(), result = 0, (v20 & 1) != 0))
    {
      v21 = v9 == v15 && v10 == v14;
      if (v21 || (v22 = sub_24620B6EC(), result = 0, (v22 & 1) != 0))
      {
        v23 = v42 == v40 && v41 == v39;
        if (v23 || (v24 = sub_24620B6EC(), result = 0, (v24 & 1) != 0))
        {
          v25 = v38 == v36 && v37 == v35;
          if (v25 || (v26 = sub_24620B6EC(), result = 0, (v26 & 1) != 0))
          {
            v27 = *(int *)(v34 + 24);
            v29 = *(_DWORD *)(a1 + v27);
            v28 = *(_DWORD *)(a1 + v27 + 4);
            v30 = (int *)(a2 + v27);
            v32 = *v30;
            v31 = v30[1];
            return v29 == v32 && v28 == v31;
          }
        }
      }
    }
  }
  return result;
}

uint64_t _s15SiriCoreMetrics0abC15AggregationKeysV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((sub_24620B1B8() & 1) == 0)
    return 0;
  v4 = *(int *)(type metadata accessor for SiriCoreMetricsAggregationKeys(0) + 20);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = *(_QWORD *)(a1 + v4 + 16);
  v8 = *(_QWORD *)(a1 + v4 + 24);
  v9 = *(_QWORD *)(a1 + v4 + 32);
  v10 = *(_QWORD *)(a1 + v4 + 40);
  v28 = *(_QWORD *)(a1 + v4 + 56);
  v29 = *(_QWORD *)(a1 + v4 + 48);
  v26 = *(_QWORD *)(a1 + v4 + 72);
  v27 = *(_QWORD *)(a1 + v4 + 64);
  v11 = (_QWORD *)(a2 + v4);
  v12 = v11[2];
  v13 = v11[3];
  v14 = v11[4];
  v15 = v11[5];
  v16 = v11[6];
  v17 = v11[7];
  v24 = v11[9];
  v25 = v11[8];
  v18 = v5 == *v11 && v6 == v11[1];
  if ((v18 || (sub_24620B6EC() & 1) != 0)
    && (v7 == v12 ? (v19 = v8 == v13) : (v19 = 0),
        (v19 || (sub_24620B6EC() & 1) != 0)
     && (v9 == v14 ? (v20 = v10 == v15) : (v20 = 0),
         (v20 || (sub_24620B6EC() & 1) != 0)
      && (v29 == v16 ? (v21 = v28 == v17) : (v21 = 0),
          (v21 || (sub_24620B6EC() & 1) != 0)
       && (v27 == v25 ? (v22 = v26 == v24) : (v22 = 0), v22 || (sub_24620B6EC() & 1) != 0)))))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_246200D00(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x75706E4969726973 && a2 == 0xEF656C61636F4C74;
  if (v3 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F4D77656976 && a2 == 0xE800000000000000 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E496F69647561 && a2 == 0xEE00656361667265 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746375646F7270 && a2 == 0xE700000000000000 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000024620DB00)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_24620B6EC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_246200F28@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B550);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24620099C();
  sub_24620B770();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v38 = 0;
  v9 = sub_24620B674();
  v11 = v10;
  v32 = v9;
  v37 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_24620B674();
  v33 = v13;
  v29 = v12;
  v36 = 2;
  swift_bridgeObjectRetain();
  v31 = 0;
  v28 = sub_24620B674();
  v35 = 3;
  v15 = v14;
  swift_bridgeObjectRetain();
  v16 = sub_24620B674();
  v30 = v15;
  v27 = v16;
  v34 = 4;
  v18 = v17;
  swift_bridgeObjectRetain();
  v19 = sub_24620B674();
  v21 = v20;
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v31 = v19;
  v22(v8, v5);
  swift_bridgeObjectRetain();
  v23 = v33;
  swift_bridgeObjectRetain();
  v24 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v29;
  a2[3] = v23;
  a2[4] = v28;
  a2[5] = v24;
  a2[6] = v27;
  a2[7] = v18;
  a2[8] = v31;
  a2[9] = v21;
  return result;
}

unint64_t sub_2462012CC()
{
  unint64_t result;

  result = qword_25755B380;
  if (!qword_25755B380)
  {
    result = MEMORY[0x249554DEC](&unk_24620C75C, &type metadata for SiriRequestCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B380);
  }
  return result;
}

uint64_t sub_246201310(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65757165526C6C61 && a2 == 0xEF746E756F437473;
  if (v3 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024620DB20)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24620B6EC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24620140C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE v10[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B548);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2462012CC();
  sub_24620B770();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v10[15] = 0;
  v7 = sub_24620B68C();
  v10[14] = 1;
  v8 = sub_24620B68C();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7 | (unint64_t)(v8 << 32);
}

uint64_t type metadata accessor for SiriCountsAll(uint64_t a1)
{
  return sub_246201570(a1, qword_25755B4C0);
}

uint64_t sub_246201570(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_2462015A4(_QWORD *a1, _QWORD *a2)
{
  initializeWithCopy for DynamicDimensionsSiriCoreMetrics(a2, a1);
  return a2;
}

_QWORD *sub_2462015D8(_QWORD *a1, _QWORD *a2)
{
  assignWithTake for DynamicDimensionsSiriCoreMetrics(a2, a1);
  return a2;
}

unint64_t sub_24620160C()
{
  unint64_t result;

  result = qword_25755B390;
  if (!qword_25755B390)
  {
    result = MEMORY[0x249554DEC](&unk_24620C70C, &type metadata for SiriCountsAll.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B390);
  }
  return result;
}

unint64_t sub_246201650()
{
  unint64_t result;

  result = qword_25755B3A0;
  if (!qword_25755B3A0)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriRequestCounts, &type metadata for SiriRequestCounts);
    atomic_store(result, (unint64_t *)&qword_25755B3A0);
  }
  return result;
}

unint64_t sub_246201694()
{
  unint64_t result;

  result = qword_25755B3B8;
  if (!qword_25755B3B8)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriRequestCounts, &type metadata for SiriRequestCounts);
    atomic_store(result, (unint64_t *)&qword_25755B3B8);
  }
  return result;
}

uint64_t sub_2462016D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriCountsAll(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24620171C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiriCountsAll(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24620175C()
{
  unint64_t result;

  result = qword_25755B3C0;
  if (!qword_25755B3C0)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for TwoByThreeSegment, &type metadata for TwoByThreeSegment);
    atomic_store(result, (unint64_t *)&qword_25755B3C0);
  }
  return result;
}

unint64_t sub_2462017A4()
{
  unint64_t result;

  result = qword_25755B3C8;
  if (!qword_25755B3C8)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for DynamicDimensionsSiriCoreMetrics, &type metadata for DynamicDimensionsSiriCoreMetrics);
    atomic_store(result, (unint64_t *)&qword_25755B3C8);
  }
  return result;
}

uint64_t sub_2462017E8()
{
  return sub_2461F44D8(&qword_25755B3D0, type metadata accessor for SiriCoreMetricsAggregationKeys, (uint64_t)&protocol conformance descriptor for SiriCoreMetricsAggregationKeys);
}

ValueMetadata *type metadata accessor for TwoByThreeSegment()
{
  return &type metadata for TwoByThreeSegment;
}

uint64_t initializeBufferWithCopyOfBuffer for DynamicDimensionsSiriCoreMetrics(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DynamicDimensionsSiriCoreMetrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DynamicDimensionsSiriCoreMetrics(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DynamicDimensionsSiriCoreMetrics(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_QWORD *assignWithTake for DynamicDimensionsSiriCoreMetrics(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DynamicDimensionsSiriCoreMetrics()
{
  return &type metadata for DynamicDimensionsSiriCoreMetrics;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCoreMetricsAggregationKeys(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
    v7 = sub_24620B1C4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = v10[3];
    v9[2] = v10[2];
    v9[3] = v12;
    v13 = v10[5];
    v9[4] = v10[4];
    v9[5] = v13;
    v14 = v10[7];
    v9[6] = v10[6];
    v9[7] = v14;
    v15 = v10[9];
    v9[8] = v10[8];
    v9[9] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t initializeWithCopy for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  v8[9] = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[3];
  v8[2] = v9[2];
  v8[3] = v10;
  v8[4] = v9[4];
  v11 = v9[1];
  *v8 = *v9;
  v8[1] = v11;
  return a1;
}

uint64_t assignWithTake for SiriCoreMetricsAggregationKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsAggregationKeys()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsAggregationKeys()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246201EEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B1C4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriRequestCounts(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SiriRequestCounts(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestCounts()
{
  return &type metadata for SiriRequestCounts;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCountsAll(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24620B1C4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = v11[3];
    v10[2] = v11[2];
    v10[3] = v13;
    v14 = v11[5];
    v10[4] = v11[4];
    v10[5] = v14;
    v15 = v11[7];
    v10[6] = v11[6];
    v10[7] = v15;
    v16 = v11[9];
    v10[8] = v11[8];
    v10[9] = v16;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s15SiriCoreMetrics30SiriCoreMetricsAggregationKeysVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  v13 = v10[5];
  v9[4] = v10[4];
  v9[5] = v13;
  v14 = v10[7];
  v9[6] = v10[6];
  v9[7] = v14;
  v15 = v10[9];
  v9[8] = v10[8];
  v9[9] = v15;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = *(_QWORD *)(a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  v8[5] = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[6] = v9[6];
  v8[7] = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[8] = v9[8];
  v8[9] = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (_DWORD *)(a1 + v10);
  v12 = (_DWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

uint64_t initializeWithTake for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[3];
  v9[2] = v10[2];
  v9[3] = v11;
  v9[4] = v10[4];
  v12 = v10[1];
  *v9 = *v10;
  v9[1] = v12;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for SiriCountsAll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_24620B1C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  v14 = v9[9];
  v8[8] = v9[8];
  v8[9] = v14;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCountsAll()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_24620B1C4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCountsAll()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_24620B1C4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_24620253C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B1C4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for SiriCoreMetricsResults()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SiriCoreMetricsResults(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SiriCoreMetricsResults(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for SiriCoreMetricsResults(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsResults(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsResults(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriCoreMetricsResults()
{
  return &type metadata for SiriCoreMetricsResults;
}

uint64_t _s15SiriCoreMetrics17TwoByThreeSegmentOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s15SiriCoreMetrics17TwoByThreeSegmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246202930 + 4 * byte_24620C0EA[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246202964 + 4 * byte_24620C0E5[v4]))();
}

uint64_t sub_246202964(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24620296C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246202974);
  return result;
}

uint64_t sub_246202980(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246202988);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24620298C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246202994(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriCountsAll.CodingKeys()
{
  return &type metadata for SiriCountsAll.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriRequestCounts.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriRequestCounts.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246202A8C + 4 * byte_24620C0F4[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246202AC0 + 4 * byte_24620C0EF[v4]))();
}

uint64_t sub_246202AC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246202AC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246202AD0);
  return result;
}

uint64_t sub_246202ADC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246202AE4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246202AE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246202AF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246202AFC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestCounts.CodingKeys()
{
  return &type metadata for SiriRequestCounts.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicDimensionsSiriCoreMetrics.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246202BF4 + 4 * byte_24620C0FE[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246202C28 + 4 * byte_24620C0F9[v4]))();
}

uint64_t sub_246202C28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246202C30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246202C38);
  return result;
}

uint64_t sub_246202C44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246202C4CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_246202C50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246202C58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensionsSiriCoreMetrics.CodingKeys()
{
  return &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys;
}

unint64_t sub_246202C78()
{
  unint64_t result;

  result = qword_25755B500;
  if (!qword_25755B500)
  {
    result = MEMORY[0x249554DEC](&unk_24620C574, &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B500);
  }
  return result;
}

unint64_t sub_246202CC0()
{
  unint64_t result;

  result = qword_25755B508;
  if (!qword_25755B508)
  {
    result = MEMORY[0x249554DEC](&unk_24620C62C, &type metadata for SiriRequestCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B508);
  }
  return result;
}

unint64_t sub_246202D08()
{
  unint64_t result;

  result = qword_25755B510;
  if (!qword_25755B510)
  {
    result = MEMORY[0x249554DEC](&unk_24620C6E4, &type metadata for SiriCountsAll.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B510);
  }
  return result;
}

unint64_t sub_246202D50()
{
  unint64_t result;

  result = qword_25755B518;
  if (!qword_25755B518)
  {
    result = MEMORY[0x249554DEC](&unk_24620C654, &type metadata for SiriCountsAll.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B518);
  }
  return result;
}

unint64_t sub_246202D98()
{
  unint64_t result;

  result = qword_25755B520;
  if (!qword_25755B520)
  {
    result = MEMORY[0x249554DEC](&unk_24620C67C, &type metadata for SiriCountsAll.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B520);
  }
  return result;
}

unint64_t sub_246202DE0()
{
  unint64_t result;

  result = qword_25755B528;
  if (!qword_25755B528)
  {
    result = MEMORY[0x249554DEC](&unk_24620C59C, &type metadata for SiriRequestCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B528);
  }
  return result;
}

unint64_t sub_246202E28()
{
  unint64_t result;

  result = qword_25755B530;
  if (!qword_25755B530)
  {
    result = MEMORY[0x249554DEC](&unk_24620C5C4, &type metadata for SiriRequestCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B530);
  }
  return result;
}

unint64_t sub_246202E70()
{
  unint64_t result;

  result = qword_25755B538;
  if (!qword_25755B538)
  {
    result = MEMORY[0x249554DEC](&unk_24620C4E4, &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B538);
  }
  return result;
}

unint64_t sub_246202EB8()
{
  unint64_t result;

  result = qword_25755B540;
  if (!qword_25755B540)
  {
    result = MEMORY[0x249554DEC](&unk_24620C50C, &type metadata for DynamicDimensionsSiriCoreMetrics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25755B540);
  }
  return result;
}

uint64_t sub_246202EFC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000024620DB40 || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_24620B6EC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4374736575716572 && a2 == 0xED000073746E756FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_24620B6EC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t SiriCoreMetricsSELFReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v4 = sub_24620B08C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.getter()
{
  return sub_246203128();
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.setter(uint64_t a1)
{
  return sub_246203178(a1, &OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll);
}

uint64_t (*SiriCoreMetricsSELFReporter.odmClientEventsCountsReportedAll.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.getter()
{
  return sub_246203128();
}

uint64_t sub_246203128()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.setter(uint64_t a1)
{
  return sub_246203178(a1, &OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores);
}

uint64_t sub_246203178(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriCoreMetricsSELFReporter.odmClientEventsTurnRestatementScores.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SiriCoreMetricsSELFReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v5;
  v6 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  v7 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a1, v7);
  v8 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v9 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a2, v9);
  return v4;
}

uint64_t SiriCoreMetricsSELFReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v5;
  v6 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  v7 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a1, v7);
  v8 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v9 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a2, v9);
  return v2;
}

uint64_t SiriCoreMetricsSELFReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = v1;
  v3 = sub_24620B08C();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2462033C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = _s15SiriCoreMetrics0abC20SELFMessageConverterO28convertToODMSiriClientEvents17countsReportedAll17twoByThreeResults5odmId6loggerSaySo0h6SchemahI5EventCGSDy11DeepThought19AggregationIntervalVSayAA0a6CountsM0VGG_SDyAnA03TwooP7SegmentOG10Foundation4UUIDV2os6LoggerVtFZ_0(*(_QWORD *)(*(_QWORD *)(v0 + 72) + 8), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 40), v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId, v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger);
  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRelease();
  v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24620B614();
    v5 = result;
    if (!result)
      goto LABEL_13;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_13;
  }
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  v7 = v4 & 0xC000000000000001;
  v8 = (void *)objc_opt_self();
  v9 = 0;
  v45 = v8;
  do
  {
    if (v7)
      v10 = (id)MEMORY[0x249554954](v9, v4);
    else
      v10 = *(id *)(v4 + 8 * v9 + 32);
    v11 = v10;
    v12 = objc_msgSend(v8, sel_sharedAnalytics);
    v13 = objc_msgSend(v12, sel_defaultMessageStream);

    v14 = v11;
    v15 = sub_24620B434();
    v16 = sub_24620B560();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = v7;
      v19 = v5;
      v20 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      *(_QWORD *)(v17 + 4) = v14;
      *v20 = v14;

      _os_log_impl(&dword_2461F0000, v15, v16, "SELF reporter: reported task with message = %@", (uint8_t *)v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25755B568);
      swift_arrayDestroy();
      v21 = v20;
      v5 = v19;
      v7 = v18;
      MEMORY[0x249554E64](v21, -1, -1);
      v22 = v17;
      v8 = v45;
      MEMORY[0x249554E64](v22, -1, -1);
    }
    else
    {

    }
    ++v9;

    objc_msgSend(v13, sel_emitMessage_, v14);
  }
  while (v5 != v9);
LABEL_13:
  v23 = v44;
  v24 = (uint64_t *)v44[9];
  swift_bridgeObjectRelease();
  v25 = *v24;
  v44[8] = *v24;
  v26 = *(_QWORD *)(v25 + 16);
  if (v26)
  {
    v27 = v44 + 5;
    v46 = v44[12];
    v28 = v44[10] + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores;
    v29 = (uint64_t *)(v25 + 32);
    swift_bridgeObjectRetain();
    v43 = (_QWORD *)v28;
    do
    {
      v31 = v23[13];
      v32 = *v29;
      swift_bridgeObjectRetain();
      _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
      v33 = (void *)_s15SiriCoreMetrics0abC20SELFMessageConverterO27convertToODMSiriClientEvent21processedConversation5odmId6loggerSo0h6SchemahiJ0CSgAA09ProcessedaL0V_10Foundation4UUIDV2os6LoggerVtFZ_0(v32, v31);
      swift_bridgeObjectRelease();
      if (v33)
      {
        v34 = objc_msgSend((id)objc_opt_self(), sel_sharedAnalytics);
        v35 = objc_msgSend(v34, sel_defaultMessageStream);

        v36 = v33;
        v37 = sub_24620B434();
        v38 = sub_24620B560();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = swift_slowAlloc();
          v40 = v27;
          v41 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v39 = 138412290;
          *(_QWORD *)(v39 + 4) = v36;
          *v41 = v33;

          _os_log_impl(&dword_2461F0000, v37, v38, "SELF reporter: reported task with message = %@", (uint8_t *)v39, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25755B568);
          swift_arrayDestroy();
          v42 = v41;
          v27 = v40;
          MEMORY[0x249554E64](v42, -1, -1);
          MEMORY[0x249554E64](v39, -1, -1);
        }
        else
        {

        }
        objc_msgSend(v35, sel_emitMessage_, v36);

        swift_beginAccess();
        v30 = v36;
        MEMORY[0x249554864]();
        if (*(_QWORD *)((*v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24620B518();
        sub_24620B530();
        sub_24620B50C();
        swift_endAccess();

        v23 = v44;
      }
      (*(void (**)(_QWORD, _QWORD))(v46 + 8))(v23[13], v23[11]);
      ++v29;
      --v26;
    }
    while (v26);
    sub_246205854((uint64_t)(v44 + 8));
  }
  swift_task_dealloc();
  return ((uint64_t (*)(void))v23[1])();
}

uint64_t sub_2462038CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v2 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  v4 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SiriCoreMetricsSELFReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v2 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  v4 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriCoreMetricsSELFReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId;
  v2 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger;
  v4 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_246203A74(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_24620B584();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t _s15SiriCoreMetrics0abC20SELFMessageConverterO28convertToODMSiriClientEvents17countsReportedAll17twoByThreeResults5odmId6loggerSaySo0h6SchemahI5EventCGSDy11DeepThought19AggregationIntervalVSayAA0a6CountsM0VGG_SDyAnA03TwooP7SegmentOG10Foundation4UUIDV2os6LoggerVtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __objc2_ivar_list **p_ivars;
  uint64_t v50;
  unsigned int *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint8_t *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint8_t *v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  signed int v90;
  char *v91;
  id v92;
  void *v93;
  char *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  void *v103;
  id v104;
  id v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  int64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  int64_t v126;
  uint64_t v127;
  id v128;
  char *v129;
  id v130;
  uint64_t v131;
  char *v132;
  int64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;

  v122 = a3;
  v121 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_24620B08C();
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v113 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B688);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = type metadata accessor for SiriCountsAll(0);
  v117 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v14 = (char *)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24620B1C4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v138 = (uint64_t)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B698);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v109 - v22;
  if (!*(_QWORD *)(a1 + 16))
  {
    v106 = sub_24620B434();
    v107 = sub_24620B554();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v108 = 0;
      _os_log_impl(&dword_2461F0000, v106, v107, "no aggregations to report", v108, 2u);
      MEMORY[0x249554E64](v108, -1, -1);
    }

    return MEMORY[0x24BEE4AF8];
  }
  v24 = *(_QWORD *)(a1 + 64);
  v123 = a1 + 64;
  v141 = MEMORY[0x24BEE4AF8];
  v25 = 1 << *(_BYTE *)(a1 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v112 = v8;
  v27 = v26 & v24;
  v126 = (unint64_t)(v25 + 63) >> 6;
  v110 = v126 - 1;
  result = swift_bridgeObjectRetain();
  v133 = 0;
  v111 = 0x800000024620DC00;
  v116 = MEMORY[0x24BEE4AD8] + 8;
  v129 = v12;
  v135 = v14;
  v127 = v15;
  v120 = v16;
  v136 = v23;
  v125 = a4;
  v119 = a1;
  v132 = v21;
LABEL_7:
  if (v27)
  {
    v137 = (v27 - 1) & v27;
    v29 = __clz(__rbit64(v27)) | (v133 << 6);
LABEL_9:
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v21, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v16 + 72) * v29, v15);
    v30 = *(_QWORD *)(a1 + 56);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6A0);
    *(_QWORD *)&v21[*(int *)(v31 + 48)] = *(_QWORD *)(v30 + 8 * v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v21, 0, 1, v31);
    swift_bridgeObjectRetain();
    v23 = v136;
LABEL_28:
    sub_2462059B0((uint64_t)v21, (uint64_t)v23);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6A0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 48))(v23, 1, v36) == 1)
    {
      swift_release();
      return v141;
    }
    v37 = *(_QWORD *)&v23[*(int *)(v36 + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v138, v23, v15);
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955C0]), sel_init);
    if (!v38)
      goto LABEL_117;
    v39 = v38;
    v134 = v37;
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955E8]), sel_init);
    if (!v40)
      goto LABEL_116;
    v41 = v40;
    v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955E0]), sel_init);
    if (!v42)
      goto LABEL_115;
    v43 = v42;
    v128 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955B8]), sel_init);
    if (!v128)
      goto LABEL_114;
    v124 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95610]), sel_init);
    if (!v124)
    {

      v39 = v41;
      v41 = v43;
      v43 = v128;
LABEL_114:

      v39 = v41;
      v41 = v43;
LABEL_115:

      v39 = v41;
LABEL_116:

LABEL_117:
      swift_bridgeObjectRelease();
      v69 = sub_24620B434();
      v70 = sub_24620B56C();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v71 = 0;
        _os_log_impl(&dword_2461F0000, v69, v70, "Unable to create ODMSiriSchemaODMSiriClientEvent SELF message", v71, 2u);
        v72 = v71;
        v15 = v127;
        MEMORY[0x249554E64](v72, -1, -1);
      }
      v21 = v132;
      goto LABEL_6;
    }
    v130 = v43;
    v44 = sub_24620B1AC();
    v45 = v128;
    objc_msgSend(v128, sel_setAggregationIntervalInDays_, v44);
    sub_24620B194();
    objc_msgSend(v45, sel_setAggregationIntervalStartTimestampInSecondsSince2001_);
    v46 = *(_QWORD *)(v134 + 16);
    if (!v46)
    {
      swift_bridgeObjectRelease();
      goto LABEL_120;
    }
    v118 = v41;
    v47 = v134 + ((*(unsigned __int8 *)(v117 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80));
    v48 = *(_QWORD *)(v117 + 72);
    p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
    while (1)
    {
      sub_2462016D8(v47, (uint64_t)v14);
      v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955D0]), (SEL)p_ivars[46]);
      if (!v52)
        goto LABEL_48;
      v53 = v52;
      v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955B0]), (SEL)p_ivars[46]);
      if (!v54)
        break;
      v55 = v54;
      v56 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955F0]), (SEL)p_ivars[46]);
      if (!v56)
      {

        p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
        goto LABEL_47;
      }
      v57 = v56;
      v58 = (void *)MEMORY[0x249554540](*(_QWORD *)&v14[*(int *)(v131 + 20)], *(_QWORD *)&v14[*(int *)(v131 + 20) + 8]);
      -[NSObject setSiriInputLocale:](v55, sel_setSiriInputLocale_, v58);

      v59 = (id)sub_24620B494();
      if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN")) & 1) != 0)
      {
        v60 = 0;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_COMPACT")) & 1) != 0)
      {
        v60 = 1;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_TV")) & 1) != 0)
      {
        v60 = 2;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_BLUETOOTH_CAR")) & 1) != 0)
      {
        v60 = 3;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_EYES_FREE")) & 1) != 0)
      {
        v60 = 4;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_CARPLAY")) & 1) != 0)
      {
        v60 = 5;
      }
      else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_VOX")) & 1) != 0)
      {
        v60 = 6;
      }
      else if (objc_msgSend(v59, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_NOT_APPLICABLE")))
      {
        v60 = 7;
      }
      else
      {
        v60 = 0;
      }

      -[NSObject setViewMode:](v55, sel_setViewMode_, v60);
      v64 = (id)sub_24620B494();
      if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_UNKNOWN")) & 1) != 0)
      {
        v65 = 0;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_DEVICE")) & 1) != 0)
      {
        v65 = 1;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH")) & 1) != 0)
      {
        v65 = 3;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH")) & 1) != 0)
      {
        v65 = 4;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_WIRED")) & 1) != 0)
      {
        v65 = 5;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_WIRED")) & 1) != 0)
      {
        v65 = 6;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_CARPLAY")) & 1) != 0)
      {
        v65 = 7;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH_DO_AP_DEVICE")) & 1) != 0)
      {
        v65 = 8;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_DO_AP_DEVICE")) & 1) != 0)
      {
        v65 = 9;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH_HANDS_FREE_DEVICE")) & 1) != 0)
      {
        v65 = 10;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_HANDS_FREE_DEVICE")) & 1) != 0)
      {
        v65 = 11;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_USB_AUDIO")) & 1) != 0)
      {
        v65 = 12;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_SIRI_ACCESSORY")) & 1) != 0)
      {
        v65 = 13;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_AUDIO_INJECTION")) & 1) != 0)
      {
        v65 = 14;
      }
      else if (objc_msgSend(v64, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_DARWIN")))
      {
        v65 = 15;
      }
      else
      {
        v65 = 0;
      }

      -[NSObject setAudioInterface:](v55, sel_setAudioInterface_, v65);
      v66 = (id)sub_24620B494();
      if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PRODUCT_UNKNOWN")) & 1) != 0)
      {
        v67 = 0;
      }
      else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PRODUCT_ASSISTANT")) & 1) != 0)
      {
        v67 = 1;
      }
      else if (objc_msgSend(v66, "isEqualToString:", CFSTR("PRODUCT_DICTATION")))
      {
        v67 = 2;
      }
      else
      {
        v67 = 0;
      }

      -[NSObject setProduct:](v55, sel_setProduct_, v67);
      v68 = (id)sub_24620B494();
      if ((objc_msgSend(v68, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v50 = 0;
      }
      else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("OPTED_IN")) & 1) != 0)
      {
        v50 = 1;
      }
      else if ((objc_msgSend(v68, "isEqualToString:", CFSTR("OPTED_OUT")) & 1) != 0)
      {
        v50 = 2;
      }
      else if (objc_msgSend(v68, "isEqualToString:", CFSTR("DISMISSED")))
      {
        v50 = 3;
      }
      else
      {
        v50 = 0;
      }

      -[NSObject setSiriDataSharingOptInStatus:](v55, sel_setSiriDataSharingOptInStatus_, v50);
      v14 = v135;
      v51 = (unsigned int *)&v135[*(int *)(v131 + 24)];
      objc_msgSend(v57, sel_setAllRequestCount_, *v51);
      objc_msgSend(v57, sel_setUserRequestCount_, v51[1]);
      -[NSObject setDimensions:](v53, sel_setDimensions_, v55);
      -[NSObject setRequestCounts:](v53, sel_setRequestCounts_, v57);

      objc_msgSend(v130, sel_addSiriCountsAll_, v53);
      v12 = v129;
      p_ivars = &SiriCoreMetrics.ivars;
LABEL_39:

      sub_24620171C((uint64_t)v14);
      v47 += v48;
      if (!--v46)
      {
        swift_bridgeObjectRelease();
        v41 = v118;
LABEL_120:
        v73 = v121;
        a1 = v119;
        if (*(_QWORD *)(v121 + 16) && (v74 = sub_2461FB210(v138), (v75 & 1) != 0))
          v76 = *(unsigned __int8 *)(*(_QWORD *)(v73 + 56) + v74);
        else
          v76 = 2;
        v77 = v130;
        objc_msgSend(v130, sel_addSegments_, v76);
        objc_msgSend(v77, sel_setAggregationInterval_, v128);
        sub_24620B290();
        v78 = sub_24620B2A8();
        v79 = (uint64_t)v12;
        v80 = *(_QWORD *)(v78 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48))(v79, 1, v78) == 1)
        {
          sub_2461FE7F0(v79, &qword_25755B688);
          v81 = 0;
          v69 = 0;
        }
        else
        {
          v69 = sub_24620B29C();
          (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v78);
          v82 = -[NSObject bmltTaskId](v69, sel_bmltTaskId);
          sub_24620B4A0();

          v81 = (void *)sub_24620B494();
          swift_bridgeObjectRelease();
        }
        v83 = v124;
        objc_msgSend(v124, sel_setExperimentId_, v81);

        v16 = v120;
        if (v69)
        {
          v84 = -[NSObject treatmentId](v69, sel_treatmentId);
          if (v84)
          {
            v85 = v84;
            sub_24620B4A0();

            v86 = (uint64_t)v112;
            sub_24620B05C();
            swift_bridgeObjectRelease();
            v87 = v114;
            v88 = v115;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v114 + 48))(v86, 1, v115) == 1)
            {
              sub_2461FE7F0(v86, &qword_25755AF18);
              v89 = 0;
            }
            else
            {
              v91 = v113;
              (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v113, v86, v88);
              v92 = objc_allocWithZone(MEMORY[0x24BE95C78]);
              v93 = (void *)sub_24620B074();
              v89 = objc_msgSend(v92, sel_initWithNSUUID_, v93);

              v94 = v91;
              v16 = v120;
              (*(void (**)(char *, uint64_t))(v87 + 8))(v94, v88);
            }
            v83 = v124;
          }
          else
          {
            v89 = 0;
          }
          objc_msgSend(v83, sel_setTreatmentId_, v89);
          v90 = -[NSObject deploymentId](v69, sel_deploymentId);
        }
        else
        {
          objc_msgSend(v83, sel_setTreatmentId_, 0);
          v89 = 0;
          v90 = -1;
        }
        objc_msgSend(v83, sel_setDeploymentId_, v90);
        v95 = objc_allocWithZone(MEMORY[0x24BE95C78]);
        v96 = (void *)sub_24620B074();
        v97 = objc_msgSend(v95, sel_initWithNSUUID_, v96);

        objc_msgSend(v41, sel_setOdmId_, v97);
        objc_msgSend(v41, sel_setTrialExperimentIdentifiers_, v83);
        v98 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
        v99 = objc_msgSend(v98, sel_infoDictionary);

        if (!v99)
        {
          v139 = 0u;
          v140 = 0u;
LABEL_145:
          sub_2461FE7F0((uint64_t)&v139, &qword_25755B690);
          goto LABEL_146;
        }
        v100 = sub_24620B458();

        if (*(_QWORD *)(v100 + 16) && (v101 = sub_2461FB1AC(0xD00000000000001DLL, v111), (v102 & 1) != 0))
        {
          sub_2461FE9C0(*(_QWORD *)(v100 + 56) + 32 * v101, (uint64_t)&v139);
        }
        else
        {
          v139 = 0u;
          v140 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((_QWORD *)&v140 + 1))
          goto LABEL_145;
        if ((swift_dynamicCast() & 1) != 0)
        {
          v103 = (void *)sub_24620B494();
          swift_bridgeObjectRelease();
          goto LABEL_147;
        }
LABEL_146:
        v103 = 0;
LABEL_147:
        objc_msgSend(v41, sel_setPluginVersion_, v103);

        objc_msgSend(v39, sel_setEventMetadata_, v41);
        v104 = v130;
        objc_msgSend(v39, sel_setCountsReportedAll_, v130);
        v105 = v39;
        MEMORY[0x249554864]();
        if (*(_QWORD *)((v141 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v141 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24620B518();
        sub_24620B530();
        sub_24620B50C();

        v14 = v135;
        v15 = v127;
        v21 = v132;
        v12 = v129;
LABEL_6:

        result = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v138, v15);
        v23 = v136;
        v27 = v137;
        goto LABEL_7;
      }
    }
    v55 = v53;
LABEL_47:

LABEL_48:
    v53 = sub_24620B434();
    v61 = sub_24620B56C();
    if (os_log_type_enabled(v53, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl(&dword_2461F0000, v53, v61, "Unable to create ODMSiriSchemaODMSiriCountsAll SELF message", v62, 2u);
      v63 = v62;
      v14 = v135;
      MEMORY[0x249554E64](v63, -1, -1);
    }
    goto LABEL_39;
  }
  v32 = v133 + 1;
  if (!__OFADD__(v133, 1))
  {
    if (v32 < v126)
    {
      v33 = *(_QWORD *)(v123 + 8 * v32);
      if (v33)
      {
LABEL_13:
        v137 = (v33 - 1) & v33;
        v29 = __clz(__rbit64(v33)) + (v32 << 6);
        v133 = v32;
        goto LABEL_9;
      }
      v34 = v133 + 2;
      ++v133;
      if (v32 + 1 < v126)
      {
        v33 = *(_QWORD *)(v123 + 8 * v34);
        if (v33)
        {
LABEL_16:
          v32 = v34;
          goto LABEL_13;
        }
        v133 = v32 + 1;
        if (v32 + 2 < v126)
        {
          v33 = *(_QWORD *)(v123 + 8 * (v32 + 2));
          if (v33)
          {
            v32 += 2;
            goto LABEL_13;
          }
          v34 = v32 + 3;
          v133 = v32 + 2;
          if (v32 + 3 < v126)
          {
            v33 = *(_QWORD *)(v123 + 8 * v34);
            if (v33)
              goto LABEL_16;
            while (1)
            {
              v32 = v34 + 1;
              if (__OFADD__(v34, 1))
                goto LABEL_155;
              if (v32 >= v126)
                break;
              v33 = *(_QWORD *)(v123 + 8 * v32);
              ++v34;
              if (v33)
                goto LABEL_13;
            }
            v133 = v110;
          }
        }
      }
    }
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v21, 1, 1, v35);
    v137 = 0;
    goto LABEL_28;
  }
  __break(1u);
LABEL_155:
  __break(1u);
  return result;
}

void *sub_246204CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  int *v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;
  uint64_t v33;

  v33 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v32 - v5;
  v7 = sub_24620B08C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95600]), sel_init);
  if (v14)
  {
    v15 = v14;
    v16 = (int *)type metadata accessor for ProcessedSiriTurn();
    sub_246205968(v33 + v16[5], (uint64_t)v6);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    if (v17(v6, 1, v7) == 1)
    {
      sub_2461FE7F0((uint64_t)v6, &qword_25755AF18);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
      v21 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v22 = sub_24620B074();
      v32 = v11;
      v23 = (void *)v22;
      v24 = objc_msgSend(v21, sel_initWithNSUUID_, v22);

      v11 = v32;
      objc_msgSend(v15, sel_setCurrentTurnId_, v24);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    sub_246205968(v33 + v16[6], (uint64_t)v4);
    if (v17(v4, 1, v7) == 1)
    {
      sub_2461FE7F0((uint64_t)v4, &qword_25755AF18);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v4, v7);
      v25 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v26 = (void *)sub_24620B074();
      v27 = objc_msgSend(v25, sel_initWithNSUUID_, v26);

      objc_msgSend(v15, sel_setNextTurnId_, v27);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
    v28 = *(unsigned __int8 *)(v33 + v16[7]);
    if (v28 != 2)
      objc_msgSend(v15, sel_setIsUserRequest_, v28 & 1);
    v29 = v33 + v16[8];
    if ((*(_BYTE *)(v29 + 8) & 1) == 0)
      objc_msgSend(v15, sel_setUtteranceRestatementScore_, *(double *)v29);
    v30 = v33 + v16[9];
    if ((*(_BYTE *)(v30 + 8) & 1) == 0)
      objc_msgSend(v15, sel_setPhoneticRestatementScore_, *(double *)v30);
  }
  else
  {
    v18 = sub_24620B434();
    v19 = sub_24620B56C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2461F0000, v18, v19, "Unable to create ODMSiriSchemaODMSiriTurnRestatementScore SELF message", v20, 2u);
      MEMORY[0x249554E64](v20, -1, -1);
    }

    return 0;
  }
  return v15;
}

uint64_t sub_24620507C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  result = MEMORY[0x24BEE4AF8];
  v9 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(type metadata accessor for ProcessedSiriTurn() - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    do
    {
      v7 = sub_246204CFC(v5);
      if (v7)
      {
        v8 = v7;
        MEMORY[0x249554864]();
        if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24620B518();
        sub_24620B530();
        sub_24620B50C();

      }
      v5 += v6;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

unint64_t _s15SiriCoreMetrics0abC20SELFMessageConverterO27convertToODMSiriClientEvent21processedConversation5odmId6loggerSo0h6SchemahiJ0CSgAA09ProcessedaL0V_10Foundation4UUIDV2os6LoggerVtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t result;
  unint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  __objc2_ivar_list **p_ivars;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  id v44;
  void *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  void *v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  __int128 v68;
  __int128 v69;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24620B08C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B688);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955C0]), sel_init);
  if (!v14)
    return (unint64_t)v14;
  v67 = v10;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955E8]), sel_init);
  if (!v15)
    goto LABEL_42;
  v16 = v15;
  v66 = v8;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95608]), sel_init);
  if (!v17)
  {

    return 0;
  }
  v18 = v17;
  v65 = v7;
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95610]), sel_init);
  if (!v19)
  {

    return 0;
  }
  v20 = v19;
  v64 = a2;
  result = sub_24620507C(a1);
  v22 = result;
  if (!(result >> 62))
  {
    v23 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v23)
      goto LABEL_7;
    goto LABEL_39;
  }
  result = sub_24620B614();
  v23 = result;
  if (!result)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    v59 = sub_24620B434();
    v60 = sub_24620B554();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_2461F0000, v59, v60, "No restatement scores to report", v61, 2u);
      MEMORY[0x249554E64](v61, -1, -1);
    }

LABEL_42:
    return 0;
  }
LABEL_7:
  v62 = v20;
  v63 = v16;
  if (v23 >= 1)
  {
    for (i = 0; i != v23; ++i)
    {
      if ((v22 & 0xC000000000000001) != 0)
        v25 = (id)MEMORY[0x249554954](i, v22);
      else
        v25 = *(id *)(v22 + 8 * i + 32);
      v26 = v25;
      objc_msgSend(v18, sel_addSiriTurnRestatementScores_, v25, v62);

    }
    swift_bridgeObjectRelease();
    sub_24620B290();
    v27 = sub_24620B2A8();
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v13, 1, v27) == 1)
    {
      sub_2461FE7F0((uint64_t)v13, &qword_25755B688);
      v29 = 0;
      v30 = 0;
    }
    else
    {
      v30 = (void *)sub_24620B29C();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v27);
      v31 = objc_msgSend(v30, sel_bmltTaskId);
      sub_24620B4A0();

      v29 = (void *)sub_24620B494();
      swift_bridgeObjectRelease();
    }
    v33 = v62;
    v32 = v63;
    objc_msgSend(v62, sel_setExperimentId_, v29);

    v34 = 0x24BE95000;
    p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
    if (v30)
    {
      v36 = objc_msgSend(v30, sel_treatmentId);
      if (v36)
      {
        v37 = v36;
        sub_24620B4A0();

        sub_24620B05C();
        swift_bridgeObjectRelease();
        v38 = v65;
        v39 = v66;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v6, 1, v65) == 1)
        {
          sub_2461FE7F0((uint64_t)v6, &qword_25755AF18);
          v40 = 0;
          p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
          v34 = 0x24BE95000;
        }
        else
        {
          v42 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
          v63 = v30;
          v43 = v67;
          v42(v67, v6, v38);
          v44 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v45 = (void *)sub_24620B074();
          v46 = v44;
          v34 = 0x24BE95000uLL;
          v40 = objc_msgSend(v46, sel_initWithNSUUID_, v45);

          v47 = v43;
          v30 = v63;
          v48 = v38;
          p_ivars = &SiriCoreMetrics.ivars;
          (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v48);
        }
      }
      else
      {
        v40 = 0;
      }
      objc_msgSend(v33, sel_setTreatmentId_, v40);
      v41 = (int)objc_msgSend(v30, sel_deploymentId);
    }
    else
    {
      objc_msgSend(v33, sel_setTreatmentId_, 0);
      v40 = 0;
      v41 = -1;
    }
    objc_msgSend(v33, sel_setDeploymentId_, v41);
    v49 = objc_allocWithZone(*(Class *)(v34 + 3192));
    v50 = (void *)sub_24620B074();
    v51 = objc_msgSend(v49, (SEL)p_ivars[51], v50);

    objc_msgSend(v32, sel_setOdmId_, v51);
    objc_msgSend(v32, sel_setTrialExperimentIdentifiers_, v33);
    v52 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v53 = objc_msgSend(v52, sel_infoDictionary);

    if (v53)
    {
      v54 = sub_24620B458();

      if (*(_QWORD *)(v54 + 16) && (v55 = sub_2461FB1AC(0xD00000000000001DLL, 0x800000024620DC00), (v56 & 1) != 0))
      {
        sub_2461FE9C0(*(_QWORD *)(v54 + 56) + 32 * v55, (uint64_t)&v68);
      }
      else
      {
        v68 = 0u;
        v69 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v69 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v57 = (void *)sub_24620B494();
          swift_bridgeObjectRelease();
LABEL_37:
          objc_msgSend(v32, sel_setPluginVersion_, v57);

          objc_msgSend(v14, sel_setEventMetadata_, v32);
          v58 = v18;
          objc_msgSend(v14, sel_setTurnRestatementScoresReported_, v58);

          return (unint64_t)v14;
        }
LABEL_36:
        v57 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v68 = 0u;
      v69 = 0u;
    }
    sub_2461FE7F0((uint64_t)&v68, &qword_25755B690);
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_246205854(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24620587C()
{
  return type metadata accessor for SiriCoreMetricsSELFReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsSELFReporter()
{
  uint64_t result;

  result = qword_25755B598;
  if (!qword_25755B598)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2462058C0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24620B08C();
  if (v1 <= 0x3F)
  {
    result = sub_24620B44C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsSELFMessageConverter()
{
  return &type metadata for SiriCoreMetricsSELFMessageConverter;
}

uint64_t sub_246205968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2462059B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2462059FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SiriCoreMetricsJsonLoggingReporter.jsonResult.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void *SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE.unsafeMutableAddressor()
{
  return &static SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE;
}

uint64_t static SiriCoreMetricsJsonLoggingReporter.SAVE_TO_FILE.getter()
{
  return 0;
}

void *SiriCoreMetricsJsonLoggingReporter.FILE_PATH.unsafeMutableAddressor()
{
  return &static SiriCoreMetricsJsonLoggingReporter.FILE_PATH;
}

unint64_t static SiriCoreMetricsJsonLoggingReporter.FILE_PATH.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_2461F83D4(MEMORY[0x24BEE4AF8]);
  v3 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  v4 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  *(_QWORD *)(v1 + 16) = sub_2461F83D4(MEMORY[0x24BEE4AF8]);
  v3 = v1 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  v4 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  swift_release();
  return v1;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[56] = a1;
  v2[57] = v1;
  sub_24620B4C4();
  v2[58] = swift_task_alloc();
  sub_24620AF9C();
  v2[59] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246205C2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  const char *v31;
  uint64_t v33;
  uint64_t v34;

  v2 = *(uint64_t **)(v0 + 448);
  v1 = *(_QWORD *)(v0 + 456);
  sub_24620AFCC();
  swift_allocObject();
  sub_24620AFC0();
  sub_24620AF90();
  sub_24620AFA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24620C880;
  *(_QWORD *)(inited + 32) = 0xD000000000000016;
  *(_QWORD *)(inited + 40) = 0x800000024620DF30;
  v4 = *v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6C0);
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0xD000000000000011;
  *(_QWORD *)(inited + 88) = 0x800000024620DF50;
  v6 = v2[1];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6C8);
  *(_QWORD *)(inited + 96) = v6;
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 128) = 0x756F436C61746F74;
  *(_QWORD *)(inited + 136) = 0xEB0000000073746ELL;
  v8 = v2[4];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6D0);
  *(_QWORD *)(inited + 144) = v8;
  *(_QWORD *)(inited + 168) = v9;
  *(_QWORD *)(inited + 176) = 0xD000000000000011;
  *(_QWORD *)(inited + 184) = 0x800000024620DF70;
  v10 = v2[5];
  *(_QWORD *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6D8);
  *(_QWORD *)(inited + 192) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_2461F83D4(inited);
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v11;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6E0);
  v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_24620C880;
  *(_QWORD *)(v12 + 32) = 0xD000000000000016;
  *(_QWORD *)(v12 + 40) = 0x800000024620DF30;
  *(_QWORD *)(v12 + 48) = MEMORY[0x249554870](v4, &type metadata for ProcessedSiriConversation);
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = 0xD000000000000011;
  *(_QWORD *)(v12 + 72) = 0x800000024620DF50;
  sub_24620B1C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6E8);
  sub_24620630C();
  *(_QWORD *)(v12 + 80) = sub_24620B464();
  *(_QWORD *)(v12 + 88) = v14;
  *(_QWORD *)(v12 + 96) = 0x756F436C61746F74;
  *(_QWORD *)(v12 + 104) = 0xEB0000000073746ELL;
  *(_QWORD *)(v12 + 112) = sub_24620B464();
  *(_QWORD *)(v12 + 120) = v15;
  *(_QWORD *)(v12 + 128) = 0xD000000000000011;
  *(_QWORD *)(v12 + 136) = 0x800000024620DF70;
  *(_QWORD *)(v12 + 144) = sub_24620B464();
  *(_QWORD *)(v12 + 152) = v16;
  *(_QWORD *)(v0 + 424) = sub_2461F8508(v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B6F0);
  sub_246206354();
  v17 = sub_24620AFB4();
  v19 = v18;
  swift_bridgeObjectRelease();
  sub_24620B4B8();
  v20 = sub_24620B4AC();
  if (v21)
  {
    v22 = v20;
    v23 = v21;
    swift_bridgeObjectRetain();
    v24 = sub_24620B434();
    v25 = sub_24620B560();
    if (os_log_type_enabled(v24, v25))
    {
      v33 = v22;
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v34 = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 440) = sub_2461FA9B8(v33, v23, &v34);
      sub_24620B584();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2461F0000, v24, v25, "json_string=%s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249554E64](v27, -1, -1);
      MEMORY[0x249554E64](v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v28 = sub_24620B434();
    v29 = sub_24620B56C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      v31 = "Unable to convert JSON string to data.";
      goto LABEL_9;
    }
  }
  else
  {
    v28 = sub_24620B434();
    v29 = sub_24620B56C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      v31 = "Extracting results to JSON failed";
LABEL_9:
      _os_log_impl(&dword_2461F0000, v28, v29, v31, v30, 2u);
      MEMORY[0x249554E64](v30, -1, -1);
    }
  }
  sub_2461F5198(v17, v19);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_24620630C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25755B2E0;
  if (!qword_25755B2E0)
  {
    v1 = sub_24620B1C4();
    result = MEMORY[0x249554DEC](MEMORY[0x24BE2B7B0], v1);
    atomic_store(result, (unint64_t *)&qword_25755B2E0);
  }
  return result;
}

unint64_t sub_246206354()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25755B6F8;
  if (!qword_25755B6F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25755B6F0);
    v2[0] = MEMORY[0x24BEE0D08];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x249554DEC](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25755B6F8);
  }
  return result;
}

uint64_t sub_2462063B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  v2 = sub_24620B44C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t SiriCoreMetricsJsonLoggingReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SiriCoreMetricsJsonLoggingReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_246206498@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2462064E4()
{
  return type metadata accessor for SiriCoreMetricsJsonLoggingReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsJsonLoggingReporter()
{
  uint64_t result;

  result = qword_25755B728;
  if (!qword_25755B728)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246206528()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t SiriCoreMetricsReporter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriCoreMetricsReporter.report(_:)()
{
  return swift_task_switch();
}

uint64_t sub_2462065C0()
{
  return sub_24620B608();
}

uint64_t SiriCoreMetricsReporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24620663C(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = a1[1];
  *(_OWORD *)(v2 + 16) = *a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = a1[2];
  v6 = (uint64_t (*)(uint64_t))(**(int **)(**(_QWORD **)v1 + 80) + *(_QWORD *)(**(_QWORD **)v1 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 64) = v4;
  *v4 = v2;
  v4[1] = sub_2462066B4;
  return v6(v2 + 16);
}

uint64_t sub_2462066B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for SiriCoreMetricsReporter()
{
  return objc_opt_self();
}

uint64_t SiriCoreMetricsSELFReporterV2.__allocating_init(stream:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = a1;
  return v4;
}

uint64_t SiriCoreMetricsSELFReporterV2.init(stream:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  v6 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a2, v6);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = a1;
  return v2;
}

uint64_t SiriCoreMetricsSELFReporterV2.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v5 = sub_24620B08C();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246206860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
  v4 = sub_246206F34(v3, v1, v2 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream), sel_emitMessage_, v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v6 = sub_24620B434();
    v7 = sub_24620B560();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 40);
    if (v8)
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v10 = 134217984;
      *(_QWORD *)(v0 + 16) = *(_QWORD *)(v9 + 16);
      sub_24620B584();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2461F0000, v6, v7, "marker: reported %ld Siri turns from this run", v10, 0xCu);
      MEMORY[0x249554E64](v10, -1, -1);
      v11 = v6;
      v6 = v5;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = v5;
    }

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriCoreMetricsSELFReporterV2.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t SiriCoreMetricsSELFReporterV2.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_246206AD4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_246206B38;
  return SiriCoreMetricsSELFReporterV2.report(_:)(v2, v3, v4);
}

uint64_t sub_246206B38()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_246206B84(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  id v26;
  id v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;

  v30 = a2;
  v3 = sub_24620B08C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BEE4AF8];
  v10 = *(_QWORD *)(a1 + 56);
  v31 = a1 + 56;
  v11 = 1 << *(_BYTE *)(a1 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v32 = (unint64_t)(v11 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v15 = 0;
  while (1)
  {
    if (v13)
    {
      v21 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_24;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v23 >= v32)
      goto LABEL_28;
    v24 = *(_QWORD *)(v31 + 8 * v23);
    ++v15;
    if (!v24)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v32)
        goto LABEL_28;
      v24 = *(_QWORD *)(v31 + 8 * v15);
      if (!v24)
      {
        v15 = v23 + 2;
        if (v23 + 2 >= v32)
          goto LABEL_28;
        v24 = *(_QWORD *)(v31 + 8 * v15);
        if (!v24)
          break;
      }
    }
LABEL_23:
    v13 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_24:
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * v22, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
      goto LABEL_29;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
    v26 = objc_allocWithZone(MEMORY[0x24BE95600]);
    v27 = objc_msgSend(v26, sel_init, v30);
    if (v27)
    {
      v16 = v27;
      v17 = objc_allocWithZone(MEMORY[0x24BE95C78]);
      v18 = (void *)sub_24620B074();
      v19 = objc_msgSend(v17, sel_initWithNSUUID_, v18);

      objc_msgSend(v16, sel_setCurrentTurnId_, v19);
      v20 = v16;
      MEMORY[0x249554864]();
      if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24620B518();
      sub_24620B530();
      sub_24620B50C();
    }
    else
    {
      v20 = sub_24620B434();
      v28 = sub_24620B56C();
      if (os_log_type_enabled(v20, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2461F0000, v20, v28, "Unable to create ODMSiriSchemaODMSiriTurnRestatementScore SELF message", v29, 2u);
        MEMORY[0x249554E64](v29, -1, -1);
      }
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v25 = v23 + 3;
  if (v25 >= v32)
  {
LABEL_28:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
LABEL_29:
    swift_release();
    return v33;
  }
  v24 = *(_QWORD *)(v31 + 8 * v25);
  if (v24)
  {
    v15 = v25;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v15 >= v32)
      goto LABEL_28;
    v24 = *(_QWORD *)(v31 + 8 * v15);
    ++v25;
    if (v24)
      goto LABEL_23;
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_246206F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t result;
  unint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  unint64_t v36;
  __objc2_ivar_list **p_ivars;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  id v46;
  void *v47;
  void *v48;
  char *v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  void *v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  __int128 v70;
  __int128 v71;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755AF18);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24620B08C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B688);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955C0]), sel_init);
  if (!v16)
    return (unint64_t)v16;
  v69 = v12;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955E8]), sel_init);
  if (!v17)
    goto LABEL_42;
  v18 = v17;
  v68 = v10;
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95608]), sel_init);
  if (!v19)
  {

    return 0;
  }
  v20 = v19;
  v67 = v9;
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95610]), sel_init);
  if (!v21)
  {

    return 0;
  }
  v22 = v21;
  v66 = a2;
  result = sub_246206B84(a1, a3);
  v24 = result;
  if (!(result >> 62))
  {
    v25 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v25)
      goto LABEL_7;
    goto LABEL_39;
  }
  result = sub_24620B614();
  v25 = result;
  if (!result)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    v61 = sub_24620B434();
    v62 = sub_24620B554();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_2461F0000, v61, v62, "No restatement scores to report", v63, 2u);
      MEMORY[0x249554E64](v63, -1, -1);
    }

LABEL_42:
    return 0;
  }
LABEL_7:
  v64 = v22;
  v65 = v18;
  if (v25 >= 1)
  {
    for (i = 0; i != v25; ++i)
    {
      if ((v24 & 0xC000000000000001) != 0)
        v27 = (id)MEMORY[0x249554954](i, v24);
      else
        v27 = *(id *)(v24 + 8 * i + 32);
      v28 = v27;
      objc_msgSend(v20, sel_addSiriTurnRestatementScores_, v27, v64);

    }
    swift_bridgeObjectRelease();
    sub_24620B290();
    v29 = sub_24620B2A8();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v15, 1, v29) == 1)
    {
      sub_2461FE7F0((uint64_t)v15, &qword_25755B688);
      v31 = 0;
      v32 = 0;
    }
    else
    {
      v32 = (void *)sub_24620B29C();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v29);
      v33 = objc_msgSend(v32, sel_bmltTaskId);
      sub_24620B4A0();

      v31 = (void *)sub_24620B494();
      swift_bridgeObjectRelease();
    }
    v35 = v64;
    v34 = v65;
    objc_msgSend(v64, sel_setExperimentId_, v31);

    v36 = 0x24BE95000;
    p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
    if (v32)
    {
      v38 = objc_msgSend(v32, sel_treatmentId);
      if (v38)
      {
        v39 = v38;
        sub_24620B4A0();

        sub_24620B05C();
        swift_bridgeObjectRelease();
        v40 = v67;
        v41 = v68;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v8, 1, v67) == 1)
        {
          sub_2461FE7F0((uint64_t)v8, &qword_25755AF18);
          v42 = 0;
          p_ivars = (__objc2_ivar_list **)(&SiriCoreMetrics + 48);
          v36 = 0x24BE95000;
        }
        else
        {
          v44 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
          v65 = v32;
          v45 = v69;
          v44(v69, v8, v40);
          v46 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v47 = (void *)sub_24620B074();
          v48 = v46;
          v36 = 0x24BE95000uLL;
          v42 = objc_msgSend(v48, sel_initWithNSUUID_, v47);

          v49 = v45;
          v32 = v65;
          v50 = v40;
          p_ivars = &SiriCoreMetrics.ivars;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v49, v50);
        }
      }
      else
      {
        v42 = 0;
      }
      objc_msgSend(v35, sel_setTreatmentId_, v42);
      v43 = (int)objc_msgSend(v32, sel_deploymentId);
    }
    else
    {
      objc_msgSend(v35, sel_setTreatmentId_, 0);
      v42 = 0;
      v43 = -1;
    }
    objc_msgSend(v35, sel_setDeploymentId_, v43);
    v51 = objc_allocWithZone(*(Class *)(v36 + 3192));
    v52 = (void *)sub_24620B074();
    v53 = objc_msgSend(v51, (SEL)p_ivars[51], v52);

    objc_msgSend(v34, sel_setOdmId_, v53);
    objc_msgSend(v34, sel_setTrialExperimentIdentifiers_, v35);
    v54 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v55 = objc_msgSend(v54, sel_infoDictionary);

    if (v55)
    {
      v56 = sub_24620B458();

      if (*(_QWORD *)(v56 + 16) && (v57 = sub_2461FB1AC(0xD00000000000001DLL, 0x800000024620DC00), (v58 & 1) != 0))
      {
        sub_2461FE9C0(*(_QWORD *)(v56 + 56) + 32 * v57, (uint64_t)&v70);
      }
      else
      {
        v70 = 0u;
        v71 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v71 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v59 = (void *)sub_24620B494();
          swift_bridgeObjectRelease();
LABEL_37:
          objc_msgSend(v34, sel_setPluginVersion_, v59);

          objc_msgSend(v16, sel_setEventMetadata_, v34);
          v60 = v20;
          objc_msgSend(v16, sel_setTurnRestatementScoresReported_, v60);

          return (unint64_t)v16;
        }
LABEL_36:
        v59 = 0;
        goto LABEL_37;
      }
    }
    else
    {
      v70 = 0u;
      v71 = 0u;
    }
    sub_2461FE7F0((uint64_t)&v70, &qword_25755B690);
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_246207608()
{
  return type metadata accessor for SiriCoreMetricsSELFReporterV2();
}

uint64_t type metadata accessor for SiriCoreMetricsSELFReporterV2()
{
  uint64_t result;

  result = qword_25755B8D8;
  if (!qword_25755B8D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24620764C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsSELFMessageConverterV2()
{
  return &type metadata for SiriCoreMetricsSELFMessageConverterV2;
}

uint64_t SiriCoreMetricsBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  v7 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  v8 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  v9 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  v10 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a3, v10);
  return v6;
}

uint64_t SiriCoreMetricsBiomeReporter.init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  v7 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a2, v7);
  v8 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  v9 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a3, v9);
  return v3;
}

uint64_t SiriCoreMetricsBiomeReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_24620B1C4();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1B8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246207890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 32);
  v23 = v2 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v2 + 64);
  v24 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  if (!v5)
    goto LABEL_8;
LABEL_6:
  v11 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v12 = v11 | (v7 << 6);
  while (2)
  {
    v13 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t, unint64_t, _QWORD))(v1 + 16))(v13, *(_QWORD *)(v2 + 48) + *(_QWORD *)(v1 + 72) * v12, *(_QWORD *)(v0 + 32));
    v14 = *(_QWORD *)(v2 + 56);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
    *(_QWORD *)(v13 + *(int *)(v15 + 48)) = *(_QWORD *)(v14 + 8 * v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
    while (1)
    {
      v21 = *(_QWORD *)(v0 + 64);
      sub_246207B84(*(_QWORD *)(v0 + 56), v21);
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v21, 1, v22) == 1)
      {
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v8 = *(_QWORD *)(v0 + 48);
      v9 = *(_QWORD *)(v0 + 32);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 32))(v8, *(_QWORD *)(v0 + 64), v9);
      v10 = _s15SiriCoreMetrics0abC13BiomeReporterC06createdA18RequestCountsEvent5odmId19aggregationInterval07requestH0So06BMSirigH0C10Foundation4UUIDV_11DeepThought011AggregationM0VAA0agH0VtFZ_0();
      sub_24620B158();

      result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v8, v9);
      if (v5)
        goto LABEL_6;
LABEL_8:
      v16 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v16 < v24)
      {
        v17 = *(_QWORD *)(v23 + 8 * v16);
        if (v17)
          goto LABEL_11;
        v18 = v7 + 2;
        ++v7;
        if (v16 + 1 < v24)
        {
          v17 = *(_QWORD *)(v23 + 8 * v18);
          if (v17)
            goto LABEL_14;
          v7 = v16 + 1;
          if (v16 + 2 < v24)
          {
            v17 = *(_QWORD *)(v23 + 8 * (v16 + 2));
            if (v17)
            {
              v16 += 2;
              goto LABEL_11;
            }
            v18 = v16 + 3;
            v7 = v16 + 2;
            if (v16 + 3 < v24)
              break;
          }
        }
      }
LABEL_25:
      v19 = *(_QWORD *)(v0 + 56);
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1C0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
      v5 = 0;
    }
    v17 = *(_QWORD *)(v23 + 8 * v18);
    if (v17)
    {
LABEL_14:
      v16 = v18;
LABEL_11:
      v5 = (v17 - 1) & v17;
      v12 = __clz(__rbit64(v17)) + (v16 << 6);
      v7 = v16;
      continue;
    }
    break;
  }
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v24)
    {
      v7 = v24 - 1;
      goto LABEL_25;
    }
    v17 = *(_QWORD *)(v23 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_11;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_246207B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B1B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static BMSiriRequestCountsMetadataSchedule.fromIntervalInDays(intervalInDays:)(int a1)
{
  int v1;
  unsigned int v2;

  if (a1 == 7)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 30)
    v2 = 3;
  else
    v2 = v1;
  if (a1 == 1)
    return 1;
  else
    return v2;
}

uint64_t sub_246207BF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  v4 = sub_24620B08C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t SiriCoreMetricsBiomeReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  v4 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetricsBiomeReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId;
  v4 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

id _s15SiriCoreMetrics0abC13BiomeReporterC06createdA18RequestCountsEvent5odmId19aggregationInterval07requestH0So06BMSirigH0C10Foundation4UUIDV_11DeepThought011AggregationM0VAA0agH0VtFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v19;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25755B2E8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24620B050();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24620B194();
  sub_24620B008();
  v7 = sub_24620B1AC();
  if (v7 == 7)
    v8 = 2;
  else
    v8 = v7 == 1;
  if (v7 == 30)
    v9 = 3;
  else
    v9 = v8;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v2, v6, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  sub_24620B068();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    v10 = 0;
  }
  else
  {
    v10 = (void *)sub_24620B038();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  v11 = objc_allocWithZone(MEMORY[0x24BE0C740]);
  v12 = (void *)sub_24620B494();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithSchedule_aggregationWindowStartTimestamp_odmId_, v9, v10, v12);

  v14 = (void *)sub_24620B764();
  v15 = (void *)sub_24620B764();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C748]), sel_initWithAllRequestCount_userRequestCount_, v14, v15);

  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C738]), sel_initWithMetadata_statistics_, v13, v16);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v17;
}

uint64_t sub_246207F90()
{
  return type metadata accessor for SiriCoreMetricsBiomeReporter();
}

uint64_t type metadata accessor for SiriCoreMetricsBiomeReporter()
{
  uint64_t result;

  result = qword_25755B9B0;
  if (!qword_25755B9B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246207FD4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = sub_24620B08C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t static SiriCoreMetricsError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t SiriCoreMetricsError.hash(into:)()
{
  return sub_24620B74C();
}

uint64_t SiriCoreMetricsError.hashValue.getter()
{
  sub_24620B740();
  sub_24620B74C();
  return sub_24620B758();
}

uint64_t SiriCoreMetricsV2.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SiriCoreMetricsV2.init()();
  return v0;
}

uint64_t SiriCoreMetricsV2.init()()
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
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint8_t *v29;
  char *v30;
  char *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = sub_24620B104();
  v51 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v50 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24620B050();
  v48 = *(_QWORD *)(v3 - 8);
  v49 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24620B44C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v52 = (char *)&v46 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v46 - v12;
  v58 = v0;
  v14 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  sub_24620B440();
  v15 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v16 = (void *)sub_24620B494();
  v17 = objc_msgSend(v15, sel_initWithSuiteName_, v16);

  if (!v17)
  {
    v26 = v7;
    v25 = v6;
    v27 = sub_24620B434();
    v28 = sub_24620B56C();
    if (os_log_type_enabled(v27, (os_log_type_t)v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2461F0000, v27, (os_log_type_t)v28, "Can't get user defaults initialized", v29, 2u);
      MEMORY[0x249554E64](v29, -1, -1);
    }

    sub_2462087C4();
    swift_allocError();
    swift_willThrow();
    v24 = v58;
    goto LABEL_8;
  }
  v46 = v1;
  v18 = sub_24620B3B0();
  swift_allocObject();
  v19 = v17;
  v20 = sub_24620B3A4();
  v56 = v18;
  v57 = MEMORY[0x24BE2BB98];
  v55 = v20;
  v53 = v7;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21(v13, v14, v6);
  sub_24620B224();
  swift_allocObject();
  v22 = v54;
  v23 = sub_24620B1F4();
  if (v22)
  {

    v24 = v58;
    v25 = v6;
    v26 = v53;
LABEL_8:
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v14, v25);
    type metadata accessor for SiriCoreMetricsV2();
    swift_deallocPartialClassInstance();
    return v24;
  }
  v30 = (char *)v23;
  v54 = v19;
  sub_24620B2C0();
  v31 = v50;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_24620B218();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v46);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v5, v49);
  v21(v52, v14, v6);
  v32 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  v33 = objc_msgSend(v32, sel_PrivateLearning);
  swift_unknownObjectRelease();
  v34 = objc_msgSend(v33, sel_SELFEvent);
  swift_unknownObjectRelease();
  objc_msgSend(v34, sel_source);

  sub_24620B1DC();
  v35 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755BA68);
  swift_allocObject();
  v37 = sub_24620B17C();
  v24 = v58;
  *(_QWORD *)(v58 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsDataProvider) = v37;
  v38 = v47;
  v21(v47, v14, v35);
  type metadata accessor for SiriCoreMetricsCalculatorV2();
  v39 = swift_allocObject();
  swift_retain();
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v53 = *(_QWORD *)(v53 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v53)(v39 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_logger, v38, v35);
  *(_QWORD *)(v39 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsCalculatorV2_bookmarkService) = v30;
  *(_QWORD *)(v24 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsCalculator) = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755BA80);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_24620CA30;
  v41 = objc_msgSend((id)objc_opt_self(), sel_sharedAnalytics);
  v42 = objc_msgSend(v41, sel_defaultMessageStream);
  v52 = v30;
  v43 = v42;

  v21(v38, v14, v35);
  type metadata accessor for SiriCoreMetricsSELFReporterV2();
  v44 = swift_allocObject();
  ((void (*)(uint64_t, char *, uint64_t))v53)(v44 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_logger, v38, v35);
  *(_QWORD *)(v44 + OBJC_IVAR____TtC15SiriCoreMetrics29SiriCoreMetricsSELFReporterV2_stream) = v43;
  *(_QWORD *)(v40 + 32) = v44;
  v55 = v40;
  sub_24620B50C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755BA88);
  swift_allocObject();
  v55 = sub_24620B164();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25755BA90);
  swift_allocObject();
  v45 = sub_24620B188();

  *(_QWORD *)(v24 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_siriCoreMetricsReporter) = v45;
  return v24;
}

unint64_t sub_2462087C4()
{
  unint64_t result;

  result = qword_25755BA60;
  if (!qword_25755BA60)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriCoreMetricsError, &type metadata for SiriCoreMetricsError);
    atomic_store(result, (unint64_t *)&qword_25755BA60);
  }
  return result;
}

uint64_t type metadata accessor for SiriCoreMetricsV2()
{
  uint64_t result;

  result = qword_25755BB18;
  if (!qword_25755BB18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SiriCoreMetricsV2.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24620885C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE2B730] + MEMORY[0x24BE2B730]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_2462088CC;
  return v3(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2462088CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t SiriCoreMetricsV2.doWork(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24620892C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_24620898C;
  return SiriCoreMetricsCalculatorV2.doWork(_:)(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24620898C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *v4;
  v9 = swift_task_dealloc();
  if (!v3)
  {
    v9 = a1;
    v10 = a2;
    v11 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 8))(v9, v10, v11);
}

uint64_t SiriCoreMetricsV2.report(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  return swift_task_switch();
}

uint64_t sub_246208A14()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 32) = v1;
  v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2B750] + MEMORY[0x24BE2B750]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  *v2 = v0;
  v2[1] = sub_246208A94;
  return v4(v0 + 16);
}

uint64_t sub_246208A94()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_246208B00()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriCoreMetricsV2.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsV2.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics17SiriCoreMetricsV2_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_246208C00(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_246208C1C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_246208C3C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_246208C9C;
  return SiriCoreMetricsCalculatorV2.doWork(_:)(*(_QWORD *)(v0 + 24));
}

uint64_t sub_246208C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = *v4;
  v9 = *v4;
  swift_task_dealloc();
  if (!v3)
  {
    v10 = *(_QWORD **)(v8 + 16);
    *v10 = a1;
    v10[1] = a2;
    v10[2] = a3;
  }
  return (*(uint64_t (**)(void))(v9 + 8))();
}

uint64_t sub_246208D0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  *(_OWORD *)(v2 + 40) = *(_OWORD *)a1;
  v3 = *v1;
  *(_QWORD *)(v2 + 56) = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v2 + 64) = v3;
  return swift_task_switch();
}

unint64_t sub_246208D38()
{
  unint64_t result;

  result = qword_25755BAB8;
  if (!qword_25755BAB8)
  {
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriCoreMetricsError, &type metadata for SiriCoreMetricsError);
    atomic_store(result, (unint64_t *)&qword_25755BAB8);
  }
  return result;
}

uint64_t sub_246208D7C()
{
  return sub_246208DE8(&qword_25755BAC0, (uint64_t)&protocol conformance descriptor for SiriCoreMetricsV2);
}

uint64_t sub_246208DA0()
{
  return sub_246208DE8(&qword_25755BAC8, (uint64_t)&protocol conformance descriptor for SiriCoreMetricsV2);
}

uint64_t sub_246208DC4()
{
  return sub_246208DE8(qword_25755BAD0, (uint64_t)&protocol conformance descriptor for SiriCoreMetricsV2);
}

uint64_t sub_246208DE8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SiriCoreMetricsV2();
    result = MEMORY[0x249554DEC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246208E68 + 4 * byte_24620CA40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246208E88 + 4 * byte_24620CA45[v4]))();
}

_BYTE *sub_246208E68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246208E88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246208E90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246208E98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246208EA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246208EA8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriCoreMetricsError()
{
  return &type metadata for SiriCoreMetricsError;
}

uint64_t sub_246208EC4()
{
  return type metadata accessor for SiriCoreMetricsV2();
}

uint64_t sub_246208ECC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t SiriCoreMetricsDataRecord.featurizedConversationData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_24620B254();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SiriCoreMetricsDataRecord.previousRequestCounts.getter()
{
  type metadata accessor for SiriCoreMetricsDataRecord(0);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SiriCoreMetricsDataRecord(uint64_t a1)
{
  return sub_246201570(a1, qword_25755BC50);
}

uint64_t SiriCoreMetricsDataProvider.__allocating_init(conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = a1;
  v7 = v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  v8 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a3, v8);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = a2;
  return v6;
}

uint64_t SiriCoreMetricsDataProvider.init(conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = a1;
  v6 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  v7 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a3, v7);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = a2;
  return v3;
}

uint64_t SiriCoreMetricsDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_24620B254();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v4 = sub_24620B26C();
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = swift_task_alloc();
  v5 = sub_24620B050();
  v2[10] = v5;
  v2[11] = *(_QWORD *)(v5 - 8);
  v2[12] = swift_task_alloc();
  v6 = sub_24620B104();
  v2[13] = v6;
  v2[14] = *(_QWORD *)(v6 - 8);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_246209184()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD);

  v2 = v0[14];
  v1 = v0[15];
  v4 = v0[12];
  v3 = v0[13];
  v5 = v0[10];
  v6 = v0[11];
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_24620B2C0();
  sub_24620B20C();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v9 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE2B898] + MEMORY[0x24BE2B898]);
  v7 = (_QWORD *)swift_task_alloc();
  v0[16] = v7;
  *v7 = v0;
  v7[1] = sub_24620926C;
  return v9(v0[9]);
}

uint64_t sub_24620926C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2462092D0()
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

  v1 = *(_QWORD *)(v0 + 136);
  v2 = SiriCoreMetricsDataProvider.loadRequestCountsData()();
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  }
  else
  {
    v3 = v2;
    v5 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 32);
    v8 = *(_QWORD *)(v0 + 40);
    v10 = *(_QWORD *)(v0 + 16);
    sub_24620B260();
    sub_24620B23C();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v10, v7, v9);
    *(_QWORD *)(v10 + *(int *)(type metadata accessor for SiriCoreMetricsDataRecord(0) + 20)) = v3;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2462093F8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t SiriCoreMetricsDataProvider.loadRequestCountsData()()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t result;
  void *v22;
  uint64_t v23;
  char v24;
  char v25;
  id v26;
  void (*v27)(id, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  void *v34;
  void *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v0 = sub_24620B050();
  v44 = *(_QWORD *)(v0 - 8);
  v45 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (char *)&v38 - v5;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v38 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v38 - v10;
  v12 = sub_24620B104();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v38 - v17;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  v19 = v47;
  v20 = sub_24620B1DC();
  v46 = v19;
  if (v19)
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  v22 = (void *)v20;
  v39 = v6;
  v40 = (_QWORD *)v13;
  v23 = v45;
  v41 = v18;
  v42 = v11;
  v47 = v12;
  v43 = v3;
  sub_24620B35C();
  v25 = v24;

  if ((v25 & 1) != 0)
  {
    v26 = v39;
    sub_24620B2C0();
    sub_24620B02C();
    v27 = *(void (**)(id, uint64_t))(v44 + 8);
    v27(v26, v23);
    sub_24620B020();
    v27(v9, v23);
  }
  else
  {
    sub_24620B008();
  }
  v28 = v40;
  _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
  sub_24620B02C();
  v29 = v47;
  v40 = (_QWORD *)v28[1];
  ((void (*)(char *, uint64_t))v40)(v16, v47);
  sub_24620B374();
  sub_24620B014();
  v39 = (id)sub_24620B368();
  result = sub_24620B2B4();
  v30 = result;
  v48 = MEMORY[0x24BEE4AF8];
  if (result >> 62)
  {
    result = sub_24620B614();
    v31 = result;
    if (!result)
      goto LABEL_19;
  }
  else
  {
    v31 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v31)
      goto LABEL_19;
  }
  if (v31 < 1)
  {
    __break(1u);
    return result;
  }
  for (i = 0; i != v31; ++i)
  {
    if ((v30 & 0xC000000000000001) != 0)
      v33 = (id)MEMORY[0x249554954](i, v30);
    else
      v33 = *(id *)(v30 + 8 * i + 32);
    v34 = v33;
    v35 = (void *)sub_24620B428();
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x249554864](v35);
      if (*(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24620B518();
      sub_24620B530();
      sub_24620B50C();
      v29 = v47;
    }

  }
LABEL_19:
  swift_bridgeObjectRelease();

  v36 = *(void (**)(char *, uint64_t))(v44 + 8);
  v37 = v45;
  v36(v43, v45);
  v36(v42, v37);
  ((void (*)(char *, uint64_t))v40)(v41, v29);
  return v48;
}

uint64_t SiriCoreMetricsDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriCoreMetricsDataProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_2462098EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25755B1C8;
  if (!qword_25755B1C8)
  {
    v1 = type metadata accessor for SiriCoreMetricsDataRecord(255);
    result = MEMORY[0x249554DEC](&protocol conformance descriptor for SiriCoreMetricsDataRecord, v1);
    atomic_store(result, (unint64_t *)&qword_25755B1C8);
  }
  return result;
}

uint64_t sub_246209934(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246209988;
  return SiriCoreMetricsDataProvider.loadData()(a1);
}

uint64_t sub_246209988()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriCoreMetricsDataRecord(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_24620B254();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriCoreMetricsDataRecord(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24620B254();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24620B254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24620B254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24620B254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SiriCoreMetricsDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24620B254();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriCoreMetricsDataRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246209C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_24620B254();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriCoreMetricsDataRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246209CC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_24620B254();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_246209D38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B254();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246209DAC()
{
  return type metadata accessor for SiriCoreMetricsDataProvider(0);
}

uint64_t type metadata accessor for SiriCoreMetricsDataProvider(uint64_t a1)
{
  return sub_246201570(a1, qword_25755BCB0);
}

uint64_t sub_246209DC8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void *SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION.unsafeMutableAddressor()
{
  return &static SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION;
}

unint64_t static SiriCoreMetrics.DEFAULT_BOOKMARK_LOCATION.getter()
{
  return 0xD000000000000043;
}

void sub_246209E6C()
{
  qword_25755DED0 = 0x65726F4369726953;
  *(_QWORD *)algn_25755DED8 = 0xEF7363697274654DLL;
}

uint64_t SiriCoreMetrics.__allocating_init(bookmarkLocation:conversationType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  SiriCoreMetrics.init(bookmarkLocation:conversationType:)(a1, a2, a3);
  return v6;
}

uint64_t SiriCoreMetrics.init(bookmarkLocation:conversationType:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  void (*v60)(uint64_t, char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v66 = a3;
  v6 = sub_24620B08C();
  v71 = *(_QWORD *)(v6 - 8);
  v72 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v64 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24620B44C();
  v73 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v63 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v69 = (char *)&v59 - v11;
  v12 = sub_24620AFE4();
  v76 = *(_QWORD *)(v12 - 8);
  v77 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v75 = (char *)&v59 - v16;
  v17 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  sub_24620B440();
  v78 = v3;
  v74 = v3 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0();
  if (!a2)
  {
    a1 = 0xD000000000000043;
    a2 = 0x800000024620E220;
  }
  swift_bridgeObjectRetain_n();
  v18 = sub_24620B434();
  v19 = sub_24620B560();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v68 = v8;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v67 = v17;
    v23 = v22;
    v80 = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    v79 = sub_2461FA9B8(a1, a2, &v80);
    sub_24620B584();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2461F0000, v18, v19, "marker: streams bookmark path=%s", v21, 0xCu);
    swift_arrayDestroy();
    v24 = v23;
    v17 = v67;
    MEMORY[0x249554E64](v24, -1, -1);
    v25 = v21;
    v8 = v68;
    MEMORY[0x249554E64](v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v26 = v75;
  sub_24620AFD8();
  swift_bridgeObjectRelease();
  sub_24620B224();
  if (qword_25755AEF0 != -1)
    swift_once();
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v15, v26, v77);
  v27 = v73;
  v65 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
  v65(v69, v17, v8);
  swift_bridgeObjectRetain();
  v28 = v70;
  v29 = sub_24620B1E8();
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v76 + 8))(v26, v77);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v17, v8);
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v74, v72);
    type metadata accessor for SiriCoreMetrics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v30 = v29;
    *(_QWORD *)(v78 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_conversationType) = v66;
    v69 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_25755BA80);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_24620CCF0;
    v32 = objc_allocWithZone((Class)sub_24620B380());
    v70 = 0;
    *(_QWORD *)(v31 + 32) = objc_msgSend(v32, sel_init);
    *(_QWORD *)(v31 + 40) = objc_msgSend(objc_allocWithZone((Class)sub_24620B404()), sel_init);
    *(_QWORD *)(v31 + 48) = objc_msgSend(objc_allocWithZone((Class)sub_24620B38C()), sel_init);
    *(_QWORD *)(v31 + 56) = objc_msgSend(objc_allocWithZone((Class)sub_24620B3C8()), sel_init);
    v80 = v31;
    sub_24620B50C();
    v33 = v17;
    v34 = v63;
    v35 = v65;
    v65(v63, v33, v8);
    sub_24620B278();
    swift_allocObject();
    v61 = v30;
    swift_retain();
    v36 = sub_24620B284();
    v35(v34, v33, v8);
    type metadata accessor for SiriCoreMetricsDataProvider(0);
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_featurizedConversationProvider) = v36;
    v62 = v36;
    v38 = *(void (**)(uint64_t, char *, uint64_t))(v73 + 32);
    v38(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_logger, v34, v8);
    *(_QWORD *)(v37 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsDataProvider_bookmarkService) = v30;
    v39 = v78;
    *(_QWORD *)(v78 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsDataProvider) = v37;
    v35(v34, v33, v8);
    type metadata accessor for SiriCoreMetricsCalculator();
    v40 = swift_allocObject();
    swift_retain();
    swift_retain();
    _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA87310Foundation8CalendarVvpfi_0();
    v38(v40 + OBJC_IVAR____TtC15SiriCoreMetrics25SiriCoreMetricsCalculator_logger, v34, v8);
    *(_QWORD *)(v40 + 16) = v66;
    *(_QWORD *)(v39 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsCalculator) = v40;
    v67 = v33;
    v41 = v35;
    v35(v34, v33, v8);
    type metadata accessor for SiriCoreMetricsJsonLoggingReporter();
    v42 = swift_allocObject();
    swift_retain();
    v43 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v42 + 16) = sub_2461F83D4(MEMORY[0x24BEE4AF8]);
    v38(v42 + OBJC_IVAR____TtC15SiriCoreMetrics34SiriCoreMetricsJsonLoggingReporter_logger, v34, v8);
    v44 = v38;
    v60 = v38;
    swift_release();
    v41(v34, v33, v8);
    v45 = v71;
    v46 = v72;
    v73 = *(_QWORD *)(v71 + 16);
    v47 = v8;
    v68 = v8;
    v48 = v64;
    ((void (*)(char *, uint64_t, uint64_t))v73)(v64, v74, v72);
    type metadata accessor for SiriCoreMetricsSELFReporter();
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsCountsReportedAll) = v43;
    *(_QWORD *)(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmClientEventsTurnRestatementScores) = v43;
    v44(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_logger, v34, v47);
    v71 = *(_QWORD *)(v45 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v71)(v49 + OBJC_IVAR____TtC15SiriCoreMetrics27SiriCoreMetricsSELFReporter_odmId, v48, v46);
    v50 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
    swift_unknownObjectRelease();
    v51 = objc_msgSend(v50, sel_SiriRequestCounts);
    swift_unknownObjectRelease();
    v52 = objc_msgSend(v51, sel_source);

    __swift_instantiateConcreteTypeFromMangledName(&qword_25755BD60);
    swift_allocObject();
    v53 = sub_24620B14C();
    v54 = v68;
    v65(v34, v67, v68);
    ((void (*)(char *, uint64_t, uint64_t))v73)(v48, v74, v46);
    type metadata accessor for SiriCoreMetricsBiomeReporter();
    v55 = swift_allocObject();
    *(_QWORD *)(v55 + 16) = v53;
    v60(v55 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_logger, v34, v54);
    ((void (*)(uint64_t, char *, uint64_t))v71)(v55 + OBJC_IVAR____TtC15SiriCoreMetrics28SiriCoreMetricsBiomeReporter_odmId, v48, v46);
    v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_24620CD00;
    *(_QWORD *)(v56 + 32) = v49;
    *(_QWORD *)(v56 + 40) = v55;
    *(_QWORD *)(v56 + 48) = v42;
    v80 = v56;
    sub_24620B50C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25755BD68);
    swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v80 = sub_24620B164();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25755BD70);
    swift_allocObject();
    v57 = sub_24620B188();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v77);
    *(_QWORD *)(v78 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_siriCoreMetricsReporter) = v57;
  }
  return v78;
}

uint64_t type metadata accessor for SiriCoreMetrics()
{
  uint64_t result;

  result = qword_25755BDE8;
  if (!qword_25755BDE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SiriCoreMetrics.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_24620A8A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_2462088CC;
  return SiriCoreMetricsDataProvider.loadData()(*(_QWORD *)(v0 + 16));
}

uint64_t SiriCoreMetrics.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_24620A91C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_24620A984;
  return SiriCoreMetricsCalculator.doWork(_:)(v0 + 16, *(_QWORD *)(v0 + 72));
}

uint64_t sub_24620A984()
{
  uint64_t *v0;
  _OWORD *v1;
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  uint64_t v6;

  v1 = (_OWORD *)*v0;
  v2 = *(_OWORD **)(*v0 + 64);
  v6 = *v0;
  swift_task_dealloc();
  v3 = v1[1];
  v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *v2 = v3;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t SiriCoreMetrics.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = v1;
  return swift_task_switch();
}

uint64_t sub_24620A9F4()
{
  uint64_t v0;
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v1 = *(_OWORD **)(v0 + 64);
  v3 = v1[1];
  v2 = v1[2];
  v6 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2B750] + MEMORY[0x24BE2B750]);
  *(_OWORD *)(v0 + 16) = *v1;
  *(_OWORD *)(v0 + 32) = v3;
  *(_OWORD *)(v0 + 48) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_24620AA78;
  return v6(v0 + 16);
}

uint64_t sub_24620AA78()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24620AAE4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriCoreMetrics.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  v4 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriCoreMetrics.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_logger;
  v2 = sub_24620B44C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC15SiriCoreMetrics15SiriCoreMetrics_odmId;
  v4 = sub_24620B08C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_24620AC34(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_24620AC50(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[8] = a1;
  v3[9] = a2;
  v3[10] = *v2;
  return swift_task_switch();
}

uint64_t sub_24620AC70()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_24620ACD8;
  return SiriCoreMetricsCalculator.doWork(_:)(v0 + 16, *(_QWORD *)(v0 + 72));
}

uint64_t sub_24620ACD8()
{
  uint64_t *v0;
  _OWORD *v1;
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  uint64_t v6;

  v1 = (_OWORD *)*v0;
  v2 = *(_OWORD **)(*v0 + 64);
  v6 = *v0;
  swift_task_dealloc();
  v3 = v1[1];
  v4 = v1[3];
  v2[1] = v1[2];
  v2[2] = v4;
  *v2 = v3;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_24620AD34(_OWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  __int128 v3;

  v3 = a1[1];
  *(_OWORD *)(v2 + 64) = *a1;
  *(_OWORD *)(v2 + 80) = v3;
  *(_OWORD *)(v2 + 96) = a1[2];
  *(_QWORD *)(v2 + 112) = *v1;
  return swift_task_switch();
}

uint64_t sub_24620AD60()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2B750] + MEMORY[0x24BE2B750]);
  v1 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  v2 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v0 + 48) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v3;
  *v3 = v0;
  v3[1] = sub_24620ADE4;
  return v5(v0 + 16);
}

uint64_t sub_24620ADE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24620AE50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24620AE5C()
{
  return sub_2461F44D8(&qword_25755BD90, (uint64_t (*)(uint64_t))type metadata accessor for SiriCoreMetrics, (uint64_t)&protocol conformance descriptor for SiriCoreMetrics);
}

uint64_t sub_24620AE88()
{
  return sub_2461F44D8(&qword_25755BD98, (uint64_t (*)(uint64_t))type metadata accessor for SiriCoreMetrics, (uint64_t)&protocol conformance descriptor for SiriCoreMetrics);
}

uint64_t sub_24620AEB4()
{
  return sub_2461F44D8(qword_25755BDA0, (uint64_t (*)(uint64_t))type metadata accessor for SiriCoreMetrics, (uint64_t)&protocol conformance descriptor for SiriCoreMetrics);
}

uint64_t sub_24620AEE0()
{
  return type metadata accessor for SiriCoreMetrics();
}

uint64_t sub_24620AEE8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24620B44C();
  if (v1 <= 0x3F)
  {
    result = sub_24620B08C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_24620AF90()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_24620AF9C()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_24620AFA8()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_24620AFB4()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24620AFC0()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24620AFCC()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24620AFD8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_24620AFE4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24620AFF0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24620AFFC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24620B008()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_24620B014()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_24620B020()
{
  return MEMORY[0x24BE2B630]();
}

uint64_t sub_24620B02C()
{
  return MEMORY[0x24BE2B650]();
}

uint64_t sub_24620B038()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_24620B044()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24620B050()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24620B05C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_24620B068()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24620B074()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t _s15SiriCoreMetricsAAC5odmId10Foundation4UUIDVvpfi_0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24620B08C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24620B098()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_24620B0A4()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_24620B0B0()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_24620B0BC()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_24620B0C8()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_24620B0D4()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_24620B0E0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t _s15SiriCoreMetrics0abC12CalculatorV2C8calendar33_28959E01A8E4B28E36DBA7F9119AA873LL10Foundation8CalendarVvpfi_0()
{
  return MEMORY[0x24BE2B660]();
}

uint64_t sub_24620B0F8()
{
  return MEMORY[0x24BE2B670]();
}

uint64_t sub_24620B104()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24620B110()
{
  return MEMORY[0x24BE2B678]();
}

uint64_t sub_24620B11C()
{
  return MEMORY[0x24BE2B688]();
}

uint64_t sub_24620B128()
{
  return MEMORY[0x24BE2B6A0]();
}

uint64_t sub_24620B134()
{
  return MEMORY[0x24BE2B6B8]();
}

uint64_t sub_24620B140()
{
  return MEMORY[0x24BE2B6C0]();
}

uint64_t sub_24620B14C()
{
  return MEMORY[0x24BE2B6D0]();
}

uint64_t sub_24620B158()
{
  return MEMORY[0x24BE2B6E0]();
}

uint64_t sub_24620B164()
{
  return MEMORY[0x24BE2B718]();
}

uint64_t sub_24620B170()
{
  return MEMORY[0x24BE2B728]();
}

uint64_t sub_24620B17C()
{
  return MEMORY[0x24BE2B738]();
}

uint64_t sub_24620B188()
{
  return MEMORY[0x24BE2B770]();
}

uint64_t sub_24620B194()
{
  return MEMORY[0x24BE2B778]();
}

uint64_t sub_24620B1A0()
{
  return MEMORY[0x24BE2B780]();
}

uint64_t sub_24620B1AC()
{
  return MEMORY[0x24BE2B788]();
}

uint64_t sub_24620B1B8()
{
  return MEMORY[0x24BE2B790]();
}

uint64_t sub_24620B1C4()
{
  return MEMORY[0x24BE2B798]();
}

uint64_t sub_24620B1D0()
{
  return MEMORY[0x24BE2B7D8]();
}

uint64_t sub_24620B1DC()
{
  return MEMORY[0x24BE2B7E0]();
}

uint64_t sub_24620B1E8()
{
  return MEMORY[0x24BE2B7F0]();
}

uint64_t sub_24620B1F4()
{
  return MEMORY[0x24BE2B7F8]();
}

uint64_t sub_24620B200()
{
  return MEMORY[0x24BE2B808]();
}

uint64_t sub_24620B20C()
{
  return MEMORY[0x24BE2B810]();
}

uint64_t sub_24620B218()
{
  return MEMORY[0x24BE2B818]();
}

uint64_t sub_24620B224()
{
  return MEMORY[0x24BE2B830]();
}

uint64_t sub_24620B230()
{
  return MEMORY[0x24BE2B848]();
}

uint64_t sub_24620B23C()
{
  return MEMORY[0x24BE2B850]();
}

uint64_t sub_24620B248()
{
  return MEMORY[0x24BE2B858]();
}

uint64_t sub_24620B254()
{
  return MEMORY[0x24BE2B860]();
}

uint64_t sub_24620B260()
{
  return MEMORY[0x24BE2B888]();
}

uint64_t sub_24620B26C()
{
  return MEMORY[0x24BE2B890]();
}

uint64_t sub_24620B278()
{
  return MEMORY[0x24BE2B8A0]();
}

uint64_t sub_24620B284()
{
  return MEMORY[0x24BE2B8B0]();
}

uint64_t sub_24620B290()
{
  return MEMORY[0x24BECE080]();
}

uint64_t sub_24620B29C()
{
  return MEMORY[0x24BECE090]();
}

uint64_t sub_24620B2A8()
{
  return MEMORY[0x24BECE098]();
}

uint64_t sub_24620B2B4()
{
  return MEMORY[0x24BE2B910]();
}

uint64_t sub_24620B2C0()
{
  return MEMORY[0x24BE2B938]();
}

uint64_t sub_24620B2CC()
{
  return MEMORY[0x24BE2B960]();
}

uint64_t sub_24620B2D8()
{
  return MEMORY[0x24BE2B968]();
}

uint64_t sub_24620B2E4()
{
  return MEMORY[0x24BE2B970]();
}

uint64_t sub_24620B2F0()
{
  return MEMORY[0x24BE2B978]();
}

uint64_t sub_24620B2FC()
{
  return MEMORY[0x24BE2B980]();
}

uint64_t sub_24620B308()
{
  return MEMORY[0x24BE2B988]();
}

uint64_t sub_24620B314()
{
  return MEMORY[0x24BE2B990]();
}

uint64_t sub_24620B320()
{
  return MEMORY[0x24BE2B998]();
}

uint64_t sub_24620B32C()
{
  return MEMORY[0x24BE2B9A0]();
}

uint64_t sub_24620B338()
{
  return MEMORY[0x24BE2B9B8]();
}

uint64_t sub_24620B344()
{
  return MEMORY[0x24BE2B9C0]();
}

uint64_t sub_24620B350()
{
  return MEMORY[0x24BE2B9C8]();
}

uint64_t sub_24620B35C()
{
  return MEMORY[0x24BE2BA78]();
}

uint64_t sub_24620B368()
{
  return MEMORY[0x24BE2BAA0]();
}

uint64_t sub_24620B374()
{
  return MEMORY[0x24BE2BAC0]();
}

uint64_t sub_24620B380()
{
  return MEMORY[0x24BE2BAF8]();
}

uint64_t sub_24620B38C()
{
  return MEMORY[0x24BE2BB00]();
}

uint64_t sub_24620B398()
{
  return MEMORY[0x24BE2BB48]();
}

uint64_t sub_24620B3A4()
{
  return MEMORY[0x24BE2BB88]();
}

uint64_t sub_24620B3B0()
{
  return MEMORY[0x24BE2BBA8]();
}

uint64_t sub_24620B3BC()
{
  return MEMORY[0x24BE2BBC8]();
}

uint64_t sub_24620B3C8()
{
  return MEMORY[0x24BE2BBD8]();
}

uint64_t sub_24620B3D4()
{
  return MEMORY[0x24BE2BBE8]();
}

uint64_t sub_24620B3E0()
{
  return MEMORY[0x24BE2BBF0]();
}

uint64_t sub_24620B3EC()
{
  return MEMORY[0x24BE2BBF8]();
}

uint64_t sub_24620B3F8()
{
  return MEMORY[0x24BE2BC08]();
}

uint64_t sub_24620B404()
{
  return MEMORY[0x24BE2BC30]();
}

uint64_t sub_24620B410()
{
  return MEMORY[0x24BE2BC58]();
}

uint64_t sub_24620B41C()
{
  return MEMORY[0x24BE2BC60]();
}

uint64_t sub_24620B428()
{
  return MEMORY[0x24BE2BCD8]();
}

uint64_t sub_24620B434()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24620B440()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24620B44C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24620B458()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24620B464()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24620B470()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24620B47C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24620B488()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24620B494()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24620B4A0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24620B4AC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_24620B4B8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_24620B4C4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_24620B4D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24620B4DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24620B4E8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24620B4F4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24620B500()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24620B50C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24620B518()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24620B524()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24620B530()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24620B53C()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_24620B548()
{
  return MEMORY[0x24BE948A0]();
}

uint64_t sub_24620B554()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24620B560()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24620B56C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24620B578()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24620B584()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24620B590()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24620B59C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24620B5A8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_24620B5B4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24620B5C0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24620B5CC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24620B5D8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24620B5E4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24620B5F0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24620B5FC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24620B608()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24620B614()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24620B620()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24620B62C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24620B638()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24620B644()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24620B650()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_24620B65C()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_24620B668()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_24620B674()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_24620B680()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24620B68C()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_24620B698()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_24620B6A4()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_24620B6B0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_24620B6BC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_24620B6C8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24620B6D4()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_24620B6E0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24620B6EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24620B6F8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24620B704()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24620B710()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24620B71C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24620B728()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24620B734()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24620B740()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24620B74C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24620B758()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24620B764()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t sub_24620B770()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24620B77C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24620B788()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24620B794()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

