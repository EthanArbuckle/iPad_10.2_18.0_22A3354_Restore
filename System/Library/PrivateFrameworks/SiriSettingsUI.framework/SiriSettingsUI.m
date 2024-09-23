uint64_t BinarySettingView.body.getter()
{
  const void *v0;
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
  _OWORD v27[9];
  __int128 v28;
  _OWORD v29[3];

  v17 = sub_2471E9D84();
  v1 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  v4 = v3 - v2;
  v5 = sub_2471E9F28();
  v18 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  v8 = v7 - v6;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC28);
  v20 = *(_QWORD *)(v19 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  v11 = v10 - v9;
  v23 = sub_2471E9F70();
  v24 = *(_QWORD *)(v23 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_5();
  v21 = v12;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC30);
  v26 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_5();
  v22 = v13;
  memcpy(v27, v0, sizeof(v27));
  v29[1] = v27[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC38);
  sub_2471E9EE0();
  v28 = v27[3];
  v29[0] = v27[2];
  type metadata accessor for SettingViewUtils();
  swift_initStackObject();
  sub_2471E163C((uint64_t)v29);
  sub_2471E163C((uint64_t)&v28);
  sub_2471E916C();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEAAB78], v17);
  sub_2471E1D1C(&qword_25767AC40, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
  sub_2471E9E5C();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v17);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v8, v5);
  OUTLINED_FUNCTION_2();
  sub_2471E9E50();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v11, v19);
  sub_2471E9F64();
  v14 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(v14);
  sub_2471E1670((uint64_t)v27);
  sub_2471E1D1C(&qword_25767AC48, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE258], MEMORY[0x24BEAE248]);
  sub_2471E9E68();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v21, v23);
  sub_2471E9EC8();
  v15 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(v15);
  sub_2471E1670((uint64_t)v27);
  OUTLINED_FUNCTION_2();
  sub_2471E9EA4();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v22, v25);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249573FE0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2471E1198(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  uint64_t v10;

  v2 = sub_2471E9D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 80))
  {
    v6 = qword_25767AC18;
    swift_bridgeObjectRetain();
    if (v6 != -1)
      swift_once();
    sub_2471EA024();
    sub_2471E9DD8();
    v7 = *(void **)(a1 + 112);
    if (!v7)
    {
      sub_2471E1670(a1);
      sub_2471E9FA0();
      sub_2471E1D1C((unint64_t *)&qword_25767AC58, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
      result = sub_2471E9DFC();
      __break(1u);
      return result;
    }
    v8 = v7;
    sub_2471E9D6C();
    sub_2471E9F88();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (qword_25767AC18 != -1)
    swift_once();
  sub_2471EA024();
  return sub_2471E9DD8();
}

uint64_t sub_2471E1374(int a1, int a2, void *__src)
{
  void *v4;
  uint64_t inited;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _QWORD __dst[14];
  _BYTE v13[16];
  _QWORD v14[2];

  memcpy(__dst, __src, sizeof(__dst));
  sub_2471E1CD4((uint64_t)&__dst[11], (uint64_t)v13);
  sub_2471E1CD4((uint64_t)v13, (uint64_t)v14);
  if (v14[1])
  {
    if (qword_25767AC18 != -1)
      swift_once();
    sub_2471EA024();
    sub_2471E9DD8();
    v4 = (void *)*((_QWORD *)__src + 14);
    if (v4)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC60);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2471EA4C0;
      v6 = v4;
      v7 = MEMORY[0x24BEE0D00];
      sub_2471EA060();
      v9 = __dst[0];
      v8 = __dst[1];
      *(_QWORD *)(inited + 96) = v7;
      *(_QWORD *)(inited + 72) = v9;
      *(_QWORD *)(inited + 80) = v8;
      swift_bridgeObjectRetain();
      sub_2471EA060();
      v10 = __dst[13];
      *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1768];
      *(_QWORD *)(inited + 144) = v10;
      sub_2471E9FAC();
      sub_2471E9F94();

      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_2471E1670((uint64_t)__src);
      sub_2471E9FA0();
      sub_2471E1D1C((unint64_t *)&qword_25767AC58, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
      result = sub_2471E9DFC();
      __break(1u);
    }
  }
  else
  {
    if (qword_25767AC18 != -1)
      swift_once();
    sub_2471EA024();
    return sub_2471E9DD8();
  }
  return result;
}

uint64_t sub_2471E1620()
{
  return sub_2471E9E98();
}

uint64_t sub_2471E163C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2471E1668()
{
  uint64_t v0;

  return sub_2471E1198(v0 + 16);
}

uint64_t sub_2471E1670(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 112);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2471E1760(int a1, int a2)
{
  uint64_t v2;

  return sub_2471E1374(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_2471E1768()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for BinarySettingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BinarySettingView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for BinarySettingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  v9 = *(void **)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BinarySettingView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v4 = *(void **)(a1 + 112);
  v5 = *(void **)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy144_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x90uLL);
}

uint64_t assignWithTake for BinarySettingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + 112);
  v11 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v11;

  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BinarySettingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 144))
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

uint64_t storeEnumTagSinglePayload for BinarySettingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 144) = 1;
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
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingView()
{
  return &type metadata for BinarySettingView;
}

uint64_t sub_2471E1B90()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767AC30);
  sub_2471E9F70();
  sub_2471E1D1C(&qword_25767AC48, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE258], MEMORY[0x24BEAE248]);
  OUTLINED_FUNCTION_2();
  return OUTLINED_FUNCTION_2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249573FEC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

BOOL sub_2471E1C68(uint64_t *a1, uint64_t *a2)
{
  return sub_2471E8534(*a1, *a2);
}

void sub_2471E1C74(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_2471E1CA4();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_2471E1CAC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2471E1CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471E1D1C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249573FF8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for INSetNumericSettingIntentResponseCode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25767AC68)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25767AC68);
  }
}

void *OUTLINED_FUNCTION_0(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 + 368), 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_allocObject();
}

unint64_t static SnippetModels.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_2471E1E18()
{
  return 1;
}

uint64_t sub_2471E1E20()
{
  return sub_2471EA18C();
}

uint64_t sub_2471E1E44()
{
  return 0;
}

uint64_t sub_2471E1E50()
{
  return 12383;
}

void sub_2471E1E60()
{
  sub_2471E2188();
}

uint64_t sub_2471E1E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2471E211C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2471E1EA8()
{
  return sub_2471E1E44();
}

uint64_t sub_2471E1EC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471E1E18();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2471E1EE8()
{
  sub_2471E26A8();
  return sub_2471EA1BC();
}

uint64_t sub_2471E1F10()
{
  sub_2471E26A8();
  return sub_2471EA1C8();
}

BOOL sub_2471E1F38(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2471E1F48()
{
  return sub_2471EA18C();
}

uint64_t sub_2471E1F6C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x65537972616E6962 && a2 == 0xED0000676E697474;
  if (v3 || (sub_2471EA174() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x53636972656D756ELL && a2 == 0xEE00676E69747465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2471EA174();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2471E2080()
{
  return 2;
}

uint64_t sub_2471E2088()
{
  sub_2471EA180();
  sub_2471EA18C();
  return sub_2471EA198();
}

uint64_t sub_2471E20CC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x53636972656D756ELL;
  else
    return 0x65537972616E6962;
}

uint64_t sub_2471E211C(uint64_t a1, uint64_t a2)
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
    v3 = sub_2471EA174();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_2471E2188()
{
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
}

BOOL sub_2471E21AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2471E1F38(*a1, *a2);
}

uint64_t sub_2471E21B8()
{
  return sub_2471E2088();
}

uint64_t sub_2471E21C0()
{
  return sub_2471E1F48();
}

uint64_t sub_2471E21C8()
{
  sub_2471EA180();
  sub_2471EA18C();
  return sub_2471EA198();
}

uint64_t sub_2471E2208()
{
  char *v0;

  return sub_2471E20CC(*v0);
}

uint64_t sub_2471E2210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2471E1F6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2471E2234()
{
  return sub_2471E1E44();
}

uint64_t sub_2471E2250@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471E2080();
  *a1 = result;
  return result;
}

uint64_t sub_2471E2274()
{
  sub_2471E25E8();
  return sub_2471EA1BC();
}

uint64_t sub_2471E229C()
{
  sub_2471E25E8();
  return sub_2471EA1C8();
}

void sub_2471E22C4()
{
  sub_2471EA180();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2471E22EC()
{
  sub_2471E2630();
  return sub_2471EA1BC();
}

uint64_t sub_2471E2314()
{
  sub_2471E2630();
  return sub_2471EA1C8();
}

void SnippetModels.encode(to:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  const void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  char v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _OWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[152];
  _BYTE v35[160];
  uint64_t v36;

  OUTLINED_FUNCTION_29();
  v24 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25767AC70) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_35();
  v23 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25767AC78) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  v4 = v3 - v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC80);
  v36 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  v8 = v7 - v6;
  sub_2471E25B0(v0, v34);
  OUTLINED_FUNCTION_47();
  sub_2471EA1B0();
  sub_2471E25B0(v34, v35);
  v9 = sub_2471E2624((uint64_t)v35);
  v10 = nullsub_1(v35);
  v11 = (const void *)v10;
  if (v9 == 1)
  {
    LOBYTE(v26[0]) = 1;
    sub_2471E2630();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_40(v26, v11);
    sub_2471E266C();
    sub_2471EA168();
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8);
    v13 = v1;
  }
  else
  {
    v25 = *(_OWORD *)v10;
    v21 = *(_OWORD *)(v10 + 32);
    v22 = *(_OWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 48);
    v15 = *(_QWORD *)(v10 + 56);
    v16 = *(_BYTE *)(v10 + 64);
    v20 = *(_BYTE *)(v10 + 65);
    v18 = *(_OWORD *)(v10 + 88);
    v19 = *(_OWORD *)(v10 + 72);
    v17 = *(_QWORD *)(v10 + 104);
    sub_2471E26A8();
    OUTLINED_FUNCTION_27();
    v26[0] = v25;
    v26[1] = v22;
    v26[2] = v21;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v30 = v20;
    v31 = v19;
    v32 = v18;
    v33 = v17;
    sub_2471E26E4();
    sub_2471EA168();
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    v13 = v4;
  }
  OUTLINED_FUNCTION_32(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v8, v5);
  OUTLINED_FUNCTION_4_0();
}

void *sub_2471E25B0(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x91uLL);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2471E25E8()
{
  unint64_t result;

  result = qword_25767AC88;
  if (!qword_25767AC88)
  {
    result = MEMORY[0x249573FF8](&unk_2471EADE4, &type metadata for SnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AC88);
  }
  return result;
}

uint64_t sub_2471E2624(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 144);
}

unint64_t sub_2471E2630()
{
  unint64_t result;

  result = qword_25767AC90;
  if (!qword_25767AC90)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAD94, &type metadata for SnippetModels.NumericSettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AC90);
  }
  return result;
}

unint64_t sub_2471E266C()
{
  unint64_t result;

  result = qword_25767AC98;
  if (!qword_25767AC98)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(result, (unint64_t *)&qword_25767AC98);
  }
  return result;
}

unint64_t sub_2471E26A8()
{
  unint64_t result;

  result = qword_25767ACA0;
  if (!qword_25767ACA0)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAD44, &type metadata for SnippetModels.BinarySettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767ACA0);
  }
  return result;
}

unint64_t sub_2471E26E4()
{
  unint64_t result;

  result = qword_25767ACA8;
  if (!qword_25767ACA8)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(result, (unint64_t *)&qword_25767ACA8);
  }
  return result;
}

void SnippetModels.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char v18;
  void *v19;
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[160];
  uint64_t v38;

  OUTLINED_FUNCTION_29();
  v3 = v2;
  v19 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACB0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACB8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_35();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  v20 = v3;
  OUTLINED_FUNCTION_47();
  sub_2471EA1A4();
  if (v0)
    goto LABEL_9;
  v38 = v6;
  v7 = sub_2471EA114();
  v8 = *(_QWORD *)(v7 + 16);
  v9 = v5;
  if (!v8)
  {
    v14 = v1;
LABEL_8:
    v15 = sub_2471EA084();
    swift_allocError();
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACC8);
    *v17 = &type metadata for SnippetModels;
    sub_2471EA0C0();
    sub_2471EA078();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26D0], v15);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v14, v9);
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1(v20);
    goto LABEL_10;
  }
  v18 = *(_BYTE *)(v7 + 32);
  sub_2471E47C0(1, v8, v7, v7 + 32, 0, (2 * v8) | 1);
  v11 = v10;
  v13 = v12;
  OUTLINED_FUNCTION_41();
  if (v11 != v13 >> 1)
  {
    v14 = v1;
    v9 = v5;
    goto LABEL_8;
  }
  if ((v18 & 1) != 0)
  {
    LOBYTE(v21[0]) = 1;
    sub_2471E2630();
    OUTLINED_FUNCTION_19();
    sub_2471E4838();
    sub_2471EA108();
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_32(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    OUTLINED_FUNCTION_40(v21, v29);
    sub_2471E4874((uint64_t)v21);
  }
  else
  {
    LOBYTE(v21[0]) = 0;
    sub_2471E26A8();
    OUTLINED_FUNCTION_19();
    sub_2471E4880();
    sub_2471EA108();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_32(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    v21[0] = v29[0];
    v21[1] = v29[1];
    v21[2] = v29[2];
    v22 = v30;
    v23 = v31;
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v27 = v35;
    v28 = v36;
    sub_2471E48BC((uint64_t)v21);
  }
  sub_2471E25B0(v21, v37);
  sub_2471E25B0(v37, v19);
  __swift_destroy_boxed_opaque_existential_1(v3);
LABEL_10:
  OUTLINED_FUNCTION_4_0();
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

unint64_t sub_2471E2B54()
{
  static SnippetModels.bundleName.getter();
  return 0xD000000000000014;
}

void sub_2471E2B74()
{
  SnippetModels.init(from:)();
}

void sub_2471E2B88()
{
  SnippetModels.encode(to:)();
}

void BinarySettingModel.settingId.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void BinarySettingModel.graphicIcon.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void BinarySettingModel.label.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void BinarySettingModel.secondLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

uint64_t BinarySettingModel.oldValue.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t BinarySettingModel.updatedValue.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

void BinarySettingModel.url.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void BinarySettingModel.directInvocationId.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

uint64_t BinarySettingModel.deviceCategoryInt.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 104);
}

void __swiftcall BinarySettingModel.init(settingId:graphicIcon:label:secondLabel:oldValue:updatedValue:url:directInvocationId:deviceCategoryInt:)(SiriSettingsUI::BinarySettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String label, Swift::String secondLabel, Swift::Bool oldValue, Swift::Bool updatedValue, Swift::String_optional url, Swift::String_optional directInvocationId, Swift::Int deviceCategoryInt)
{
  retstr->settingId = settingId;
  retstr->graphicIcon = graphicIcon;
  retstr->label = label;
  retstr->secondLabel = secondLabel;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->url = url;
  retstr->directInvocationId = directInvocationId;
  retstr->deviceCategoryInt = deviceCategoryInt;
}

BOOL sub_2471E2CB0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2471E2CC0()
{
  return sub_2471EA18C();
}

uint64_t sub_2471E2CE4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v12;

  v3 = a1 == 0x49676E6974746573 && a2 == 0xE900000000000064;
  if (v3 || (sub_2471EA174() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
    if (v6 || (sub_2471EA174() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
      if (v7 || (sub_2471EA174() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x614C646E6F636573 && a2 == 0xEB000000006C6562;
        if (v8 || (sub_2471EA174() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x65756C6156646C6FLL && a2 == 0xE800000000000000;
          if (v9 || (sub_2471EA174() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x5664657461647075 && a2 == 0xEC00000065756C61;
            if (v10 || (sub_2471EA174() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 7107189 && a2 == 0xE300000000000000;
              if (v11 || (sub_2471EA174() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0xD000000000000012 && a2 == 0x80000002471EC100 || (sub_2471EA174() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else if (a1 == 0xD000000000000011 && a2 == 0x80000002471EC030)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                v12 = sub_2471EA174();
                swift_bridgeObjectRelease();
                if ((v12 & 1) != 0)
                  return 8;
                else
                  return 9;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2471E3058()
{
  return 9;
}

uint64_t sub_2471E3060(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2471E309C + 4 * byte_2471EA5F0[a1]))(0xD000000000000012, 0x80000002471EC100);
}

uint64_t sub_2471E309C()
{
  return 0x49676E6974746573;
}

uint64_t sub_2471E30B8()
{
  return 0x4963696870617267;
}

uint64_t sub_2471E30D8()
{
  return 0x6C6562616CLL;
}

uint64_t sub_2471E30EC()
{
  return 0x614C646E6F636573;
}

uint64_t sub_2471E310C()
{
  return 0x65756C6156646C6FLL;
}

uint64_t sub_2471E3124()
{
  return 0x5664657461647075;
}

uint64_t sub_2471E3144()
{
  return 7107189;
}

unint64_t sub_2471E3154()
{
  return 0xD000000000000011;
}

BOOL sub_2471E3170(char *a1, char *a2)
{
  return sub_2471E2CB0(*a1, *a2);
}

void sub_2471E317C()
{
  sub_2471E3E28();
}

uint64_t sub_2471E3194()
{
  return sub_2471E2CC0();
}

uint64_t sub_2471E31A0()
{
  unsigned __int8 *v0;

  return sub_2471E3060(*v0);
}

uint64_t sub_2471E31A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2471E2CE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2471E31CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471E3058();
  *a1 = result;
  return result;
}

uint64_t sub_2471E31F0()
{
  sub_2471E48C4();
  return sub_2471EA1BC();
}

uint64_t sub_2471E3218()
{
  sub_2471E48C4();
  return sub_2471EA1C8();
}

void BinarySettingModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_29();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACE0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_34();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2471E48C4();
  sub_2471EA1B0();
  sub_2471EA138();
  if (!v0)
  {
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_33();
    sub_2471EA15C();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_4_0();
}

void BinarySettingModel.init(from:)()
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_29();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACF0);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2471E48C4();
  sub_2471EA1A4();
  if (v0)
  {
    OUTLINED_FUNCTION_48();
  }
  else
  {
    v5 = OUTLINED_FUNCTION_10();
    v7 = v6;
    OUTLINED_FUNCTION_8();
    v25 = OUTLINED_FUNCTION_10();
    v26 = v5;
    v9 = v8;
    OUTLINED_FUNCTION_8();
    v28 = v9;
    v24 = OUTLINED_FUNCTION_10();
    v11 = v10;
    OUTLINED_FUNCTION_8();
    v27 = v11;
    v23 = OUTLINED_FUNCTION_10();
    v13 = v12;
    swift_bridgeObjectRetain();
    v22 = OUTLINED_FUNCTION_37();
    v21 = OUTLINED_FUNCTION_37();
    v19 = OUTLINED_FUNCTION_38();
    v20 = v14;
    OUTLINED_FUNCTION_8();
    v17 = OUTLINED_FUNCTION_38();
    v18 = v15;
    OUTLINED_FUNCTION_8();
    v16 = sub_2471EA0FC();
    OUTLINED_FUNCTION_1_0();
    *(_QWORD *)v4 = v26;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v25;
    *(_QWORD *)(v4 + 24) = v28;
    *(_QWORD *)(v4 + 32) = v24;
    *(_QWORD *)(v4 + 40) = v27;
    *(_QWORD *)(v4 + 48) = v23;
    *(_QWORD *)(v4 + 56) = v13;
    *(_BYTE *)(v4 + 64) = v22 & 1;
    *(_BYTE *)(v4 + 65) = v21 & 1;
    *(_QWORD *)(v4 + 72) = v19;
    *(_QWORD *)(v4 + 80) = v20;
    *(_QWORD *)(v4 + 88) = v17;
    *(_QWORD *)(v4 + 96) = v18;
    *(_QWORD *)(v4 + 104) = v16;
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_18();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4_0();
}

void sub_2471E384C()
{
  BinarySettingModel.init(from:)();
}

void sub_2471E3860()
{
  BinarySettingModel.encode(to:)();
}

void NumericSettingModel.settingId.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void NumericSettingModel.graphicIcon.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void NumericSettingModel.leftIconName.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void NumericSettingModel.rightIconName.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

void NumericSettingModel.label.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

double NumericSettingModel.oldValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

double NumericSettingModel.updatedValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double NumericSettingModel.minValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

double NumericSettingModel.maxValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

double NumericSettingModel.step.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 112);
}

void NumericSettingModel.url.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6();
}

uint64_t NumericSettingModel.deviceCategoryInt.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

void __swiftcall NumericSettingModel.init(settingId:graphicIcon:leftIconName:rightIconName:label:oldValue:updatedValue:minValue:maxValue:step:url:deviceCategoryInt:)(SiriSettingsUI::NumericSettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String leftIconName, Swift::String rightIconName, Swift::String label, Swift::Double oldValue, Swift::Double updatedValue, Swift::Double minValue, Swift::Double maxValue, Swift::Double step, Swift::String_optional url, Swift::Int deviceCategoryInt)
{
  retstr->settingId = settingId;
  retstr->graphicIcon = graphicIcon;
  retstr->leftIconName = leftIconName;
  retstr->rightIconName = rightIconName;
  retstr->label = label;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->minValue = minValue;
  retstr->maxValue = maxValue;
  retstr->step = step;
  retstr->url = url;
  retstr->deviceCategoryInt = deviceCategoryInt;
}

uint64_t sub_2471E399C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  char v16;

  v3 = a1 == 0x49676E6974746573 && a2 == 0xE900000000000064;
  if (v3 || (sub_2471EA174() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4963696870617267 && a2 == 0xEB000000006E6F63;
    if (v6 || (sub_2471EA174() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E6F63497466656CLL && a2 == 0xEC000000656D614ELL;
      if (v7 || (sub_2471EA174() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6F63497468676972 && a2 == 0xED0000656D614E6ELL;
        if (v8 || (sub_2471EA174() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
          if (v9 || (sub_2471EA174() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x65756C6156646C6FLL && a2 == 0xE800000000000000;
            if (v10 || (sub_2471EA174() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x5664657461647075 && a2 == 0xEC00000065756C61;
              if (v11 || (sub_2471EA174() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x65756C61566E696DLL && a2 == 0xE800000000000000;
                if (v12 || (sub_2471EA174() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x65756C615678616DLL && a2 == 0xE800000000000000;
                  if (v13 || (sub_2471EA174() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 1885697139 && a2 == 0xE400000000000000;
                    if (v14 || (sub_2471EA174() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 7107189 && a2 == 0xE300000000000000;
                      if (v15 || (sub_2471EA174() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else if (a1 == 0xD000000000000011 && a2 == 0x80000002471EC030)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else
                      {
                        v16 = sub_2471EA174();
                        swift_bridgeObjectRelease();
                        if ((v16 & 1) != 0)
                          return 11;
                        else
                          return 12;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2471E3E20()
{
  return 12;
}

void sub_2471E3E28()
{
  OUTLINED_FUNCTION_46();
  sub_2471EA18C();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2471E3E58(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2471E3E90 + 4 * byte_2471EA5F9[a1]))(0xD000000000000011, 0x80000002471EC030);
}

uint64_t sub_2471E3E90()
{
  return 0x49676E6974746573;
}

uint64_t sub_2471E3EAC()
{
  return 0x4963696870617267;
}

uint64_t sub_2471E3ECC()
{
  return 0x6E6F63497466656CLL;
}

uint64_t sub_2471E3EEC()
{
  return 0x6F63497468676972;
}

uint64_t sub_2471E3F10()
{
  return 0x6C6562616CLL;
}

uint64_t sub_2471E3F24()
{
  return 0x65756C6156646C6FLL;
}

uint64_t sub_2471E3F7C()
{
  return 1885697139;
}

uint64_t sub_2471E3F8C()
{
  return 7107189;
}

void sub_2471E3F9C()
{
  sub_2471EA180();
  sub_2471EA18C();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2471E3FD0()
{
  unsigned __int8 *v0;

  return sub_2471E3E58(*v0);
}

uint64_t sub_2471E3FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2471E399C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2471E3FFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471E3E20();
  *a1 = result;
  return result;
}

uint64_t sub_2471E4020()
{
  sub_2471E4900();
  return sub_2471EA1BC();
}

uint64_t sub_2471E4048()
{
  sub_2471E4900();
  return sub_2471EA1C8();
}

void NumericSettingModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_39();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ACF8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_34();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2471E4900();
  sub_2471EA1B0();
  sub_2471EA138();
  if (!v0)
  {
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_12();
    sub_2471EA12C();
    sub_2471EA15C();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_11();
}

void NumericSettingModel.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
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
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[18];
  _QWORD v40[18];
  char v41;

  OUTLINED_FUNCTION_39();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767AD08);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2471E4900();
  sub_2471EA1A4();
  if (v0)
  {
    OUTLINED_FUNCTION_44();
  }
  else
  {
    v34 = v4;
    v5 = OUTLINED_FUNCTION_3_0();
    v7 = v6;
    OUTLINED_FUNCTION_8();
    v33 = OUTLINED_FUNCTION_3_0();
    v9 = v8;
    OUTLINED_FUNCTION_8();
    v38 = v9;
    v32 = OUTLINED_FUNCTION_3_0();
    v11 = v10;
    OUTLINED_FUNCTION_8();
    v37 = v11;
    v31 = OUTLINED_FUNCTION_3_0();
    v13 = v12;
    OUTLINED_FUNCTION_8();
    v36 = v13;
    v30 = OUTLINED_FUNCTION_3_0();
    v15 = v14;
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_2_0();
    v35 = v15;
    v17 = v16;
    OUTLINED_FUNCTION_2_0();
    v19 = v18;
    OUTLINED_FUNCTION_2_0();
    v21 = v20;
    OUTLINED_FUNCTION_2_0();
    v23 = v22;
    OUTLINED_FUNCTION_2_0();
    v25 = v24;
    LOBYTE(v40[0]) = 10;
    v29 = sub_2471EA0CC();
    v27 = v26;
    v41 = 11;
    OUTLINED_FUNCTION_8();
    v28 = sub_2471EA0FC();
    OUTLINED_FUNCTION_0_0();
    v39[0] = v5;
    v39[1] = v7;
    v39[2] = v33;
    v39[3] = v38;
    v39[4] = v32;
    v39[5] = v37;
    v39[6] = v31;
    v39[7] = v36;
    v39[8] = v30;
    v39[9] = v35;
    v39[10] = v17;
    v39[11] = v19;
    v39[12] = v21;
    v39[13] = v23;
    v39[14] = v25;
    v39[15] = v29;
    v39[16] = v27;
    v39[17] = v28;
    sub_2471E493C((uint64_t)v39);
    OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_40(v34, v39);
    OUTLINED_FUNCTION_44();
    v40[0] = v5;
    v40[1] = v7;
    v40[2] = v33;
    v40[3] = v38;
    v40[4] = v32;
    v40[5] = v37;
    v40[6] = v31;
    v40[7] = v36;
    v40[8] = v30;
    v40[9] = v35;
    v40[10] = v17;
    v40[11] = v19;
    v40[12] = v21;
    v40[13] = v23;
    v40[14] = v25;
    v40[15] = v29;
    v40[16] = v27;
    v40[17] = v28;
    sub_2471E49B0((uint64_t)v40);
  }
  OUTLINED_FUNCTION_11();
}

void sub_2471E4798()
{
  NumericSettingModel.init(from:)();
}

void sub_2471E47AC()
{
  NumericSettingModel.encode(to:)();
}

uint64_t sub_2471E47C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_2471E4838()
{
  unint64_t result;

  result = qword_25767ACD0;
  if (!qword_25767ACD0)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(result, (unint64_t *)&qword_25767ACD0);
  }
  return result;
}

uint64_t sub_2471E4874(uint64_t result)
{
  *(_BYTE *)(result + 144) = 1;
  return result;
}

unint64_t sub_2471E4880()
{
  unint64_t result;

  result = qword_25767ACD8;
  if (!qword_25767ACD8)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(result, (unint64_t *)&qword_25767ACD8);
  }
  return result;
}

uint64_t sub_2471E48BC(uint64_t result)
{
  *(_BYTE *)(result + 144) = 0;
  return result;
}

unint64_t sub_2471E48C4()
{
  unint64_t result;

  result = qword_25767ACE8;
  if (!qword_25767ACE8)
  {
    result = MEMORY[0x249573FF8](&unk_2471EACF4, &type metadata for BinarySettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767ACE8);
  }
  return result;
}

unint64_t sub_2471E4900()
{
  unint64_t result;

  result = qword_25767AD00;
  if (!qword_25767AD00)
  {
    result = MEMORY[0x249573FF8](&unk_2471EACA4, &type metadata for NumericSettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD00);
  }
  return result;
}

uint64_t sub_2471E493C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2471E49B0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_2471E4A28()
{
  unint64_t result;

  result = qword_25767AD10;
  if (!qword_25767AD10)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for SnippetModels, &type metadata for SnippetModels);
    atomic_store(result, (unint64_t *)&qword_25767AD10);
  }
  return result;
}

unint64_t sub_2471E4A68()
{
  unint64_t result;

  result = qword_25767AD18;
  if (!qword_25767AD18)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for SnippetModels, &type metadata for SnippetModels);
    atomic_store(result, (unint64_t *)&qword_25767AD18);
  }
  return result;
}

unint64_t sub_2471E4AA4(uint64_t a1)
{
  unint64_t result;

  result = sub_2471E4AC8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2471E4AC8()
{
  unint64_t result;

  result = qword_25767AD20;
  if (!qword_25767AD20)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(result, (unint64_t *)&qword_25767AD20);
  }
  return result;
}

unint64_t sub_2471E4B0C(uint64_t a1)
{
  unint64_t result;

  result = sub_2471E4B30();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2471E4B30()
{
  unint64_t result;

  result = qword_25767AD28;
  if (!qword_25767AD28)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(result, (unint64_t *)&qword_25767AD28);
  }
  return result;
}

uint64_t sub_2471E4B74()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SnippetModels()
{
  return sub_2471E4C4C();
}

uint64_t sub_2471E4C4C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
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

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v13 = a2[9];
  v14 = a2[10];
  v15 = a2[11];
  v16 = a2[12];
  v17 = a2[13];
  v18 = a2[14];
  v19 = a2[15];
  v20 = a2[16];
  v21 = a2[17];
  v22 = *((_BYTE *)a2 + 144);
  sub_2471E4B74();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_QWORD *)(a1 + 128) = v20;
  *(_QWORD *)(a1 + 136) = v21;
  *(_BYTE *)(a1 + 144) = v22;
  return a1;
}

uint64_t assignWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
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

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  v9 = a2[6];
  v10 = a2[7];
  v11 = a2[8];
  v13 = a2[9];
  v14 = a2[10];
  v15 = a2[11];
  v16 = a2[12];
  v17 = a2[13];
  v18 = a2[14];
  v19 = a2[15];
  v20 = a2[16];
  v21 = a2[17];
  v22 = *((_BYTE *)a2 + 144);
  sub_2471E4B74();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_QWORD *)(a1 + 128) = v20;
  *(_QWORD *)(a1 + 136) = v21;
  *(_BYTE *)(a1 + 144) = v22;
  sub_2471E4C4C();
  return a1;
}

void *__swift_memcpy145_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x91uLL);
}

uint64_t assignWithTake for SnippetModels(uint64_t a1, uint64_t a2)
{
  char v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_BYTE *)(a2 + 144);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = v3;
  sub_2471E4C4C();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetModels(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 145))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 144);
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

uint64_t storeEnumTagSinglePayload for SnippetModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 144) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 145) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 145) = 0;
    if (a2)
      *(_BYTE *)(result + 144) = -(char)a2;
  }
  return result;
}

uint64_t sub_2471E508C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 144) = a2 & 1;
  return result;
}

void type metadata accessor for SnippetModels()
{
  OUTLINED_FUNCTION_42();
}

uint64_t sub_2471E50A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2471E50AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2471E50B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_2471E50BC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t destroy for BinarySettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BinarySettingModel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for BinarySettingModel()
{
  OUTLINED_FUNCTION_42();
}

uint64_t destroy for NumericSettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NumericSettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v9 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NumericSettingModel(_QWORD *a1, _QWORD *a2)
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
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  return a1;
}

uint64_t assignWithTake for NumericSettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  return a1;
}

void type metadata accessor for NumericSettingModel()
{
  OUTLINED_FUNCTION_42();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NumericSettingModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 11) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for NumericSettingModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_2471E578C + 4 * byte_2471EA60A[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_2471E57C0 + 4 * byte_2471EA605[v4]))();
}

uint64_t sub_2471E57C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E57C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2471E57D0);
  return result;
}

uint64_t sub_2471E57DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2471E57E4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_2471E57E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E57F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingModel.CodingKeys()
{
  return &type metadata for NumericSettingModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 8) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for BinarySettingModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2471E58E0 + 4 * byte_2471EA614[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_2471E5914 + 4 * byte_2471EA60F[v4]))();
}

uint64_t sub_2471E5914(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E591C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2471E5924);
  return result;
}

uint64_t sub_2471E5930(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2471E5938);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_2471E593C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E5944(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E5950(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2471E5958(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingModel.CodingKeys()
{
  return &type metadata for BinarySettingModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SnippetModels.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SnippetModels.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2471E5A44 + 4 * byte_2471EA61E[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2471E5A78 + 4 * byte_2471EA619[v4]))();
}

uint64_t sub_2471E5A78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E5A80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2471E5A88);
  return result;
}

uint64_t sub_2471E5A94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2471E5A9CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2471E5AA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471E5AA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2471E5AB4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels.CodingKeys()
{
  return &type metadata for SnippetModels.CodingKeys;
}

uint64_t sub_2471E5ADC()
{
  return 0;
}

ValueMetadata *type metadata accessor for SnippetModels.BinarySettingCodingKeys()
{
  return &type metadata for SnippetModels.BinarySettingCodingKeys;
}

uint64_t _s14SiriSettingsUI13SnippetModelsO23BinarySettingCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s14SiriSettingsUI13SnippetModelsO23BinarySettingCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2471E5B84 + 4 * byte_2471EA623[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2471E5BA4 + 4 * byte_2471EA628[v4]))();
}

_BYTE *sub_2471E5B84(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2471E5BA4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2471E5BAC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2471E5BB4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2471E5BBC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2471E5BC4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels.NumericSettingCodingKeys()
{
  return &type metadata for SnippetModels.NumericSettingCodingKeys;
}

unint64_t sub_2471E5BE4()
{
  unint64_t result;

  result = qword_25767AD30;
  if (!qword_25767AD30)
  {
    result = MEMORY[0x249573FF8](&unk_2471EA99C, &type metadata for SnippetModels.NumericSettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD30);
  }
  return result;
}

unint64_t sub_2471E5C24()
{
  unint64_t result;

  result = qword_25767AD38;
  if (!qword_25767AD38)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAA54, &type metadata for SnippetModels.BinarySettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD38);
  }
  return result;
}

unint64_t sub_2471E5C64()
{
  unint64_t result;

  result = qword_25767AD40;
  if (!qword_25767AD40)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAB0C, &type metadata for SnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD40);
  }
  return result;
}

unint64_t sub_2471E5CA4()
{
  unint64_t result;

  result = qword_25767AD48;
  if (!qword_25767AD48)
  {
    result = MEMORY[0x249573FF8](&unk_2471EABC4, &type metadata for BinarySettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD48);
  }
  return result;
}

unint64_t sub_2471E5CE4()
{
  unint64_t result;

  result = qword_25767AD50;
  if (!qword_25767AD50)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAC7C, &type metadata for NumericSettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD50);
  }
  return result;
}

unint64_t sub_2471E5D24()
{
  unint64_t result;

  result = qword_25767AD58;
  if (!qword_25767AD58)
  {
    result = MEMORY[0x249573FF8](&unk_2471EABEC, &type metadata for NumericSettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD58);
  }
  return result;
}

unint64_t sub_2471E5D64()
{
  unint64_t result;

  result = qword_25767AD60;
  if (!qword_25767AD60)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAC14, &type metadata for NumericSettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD60);
  }
  return result;
}

unint64_t sub_2471E5DA4()
{
  unint64_t result;

  result = qword_25767AD68;
  if (!qword_25767AD68)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAB34, &type metadata for BinarySettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD68);
  }
  return result;
}

unint64_t sub_2471E5DE4()
{
  unint64_t result;

  result = qword_25767AD70;
  if (!qword_25767AD70)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAB5C, &type metadata for BinarySettingModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD70);
  }
  return result;
}

unint64_t sub_2471E5E24()
{
  unint64_t result;

  result = qword_25767AD78;
  if (!qword_25767AD78)
  {
    result = MEMORY[0x249573FF8](&unk_2471EA9C4, &type metadata for SnippetModels.BinarySettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD78);
  }
  return result;
}

unint64_t sub_2471E5E64()
{
  unint64_t result;

  result = qword_25767AD80;
  if (!qword_25767AD80)
  {
    result = MEMORY[0x249573FF8](&unk_2471EA9EC, &type metadata for SnippetModels.BinarySettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD80);
  }
  return result;
}

unint64_t sub_2471E5EA4()
{
  unint64_t result;

  result = qword_25767AD88;
  if (!qword_25767AD88)
  {
    result = MEMORY[0x249573FF8](&unk_2471EA90C, &type metadata for SnippetModels.NumericSettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD88);
  }
  return result;
}

unint64_t sub_2471E5EE4()
{
  unint64_t result;

  result = qword_25767AD90;
  if (!qword_25767AD90)
  {
    result = MEMORY[0x249573FF8](&unk_2471EA934, &type metadata for SnippetModels.NumericSettingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD90);
  }
  return result;
}

unint64_t sub_2471E5F24()
{
  unint64_t result;

  result = qword_25767AD98;
  if (!qword_25767AD98)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAA7C, &type metadata for SnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767AD98);
  }
  return result;
}

unint64_t sub_2471E5F64()
{
  unint64_t result;

  result = qword_25767ADA0;
  if (!qword_25767ADA0)
  {
    result = MEMORY[0x249573FF8](&unk_2471EAAA4, &type metadata for SnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767ADA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_2471EA0F0();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_2471EA0D8();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_2471EA0D8();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_2471EA150();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2471EA138();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_2471EA0B4();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 8) + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 48) + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_2471EA120();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_2471EA144();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_2471EA198();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_2471EA12C();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_2471EA0E4();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_2471EA0CC();
}

void *OUTLINED_FUNCTION_40(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 + 88));
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_2471EA18C();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_2471EA180();
}

unint64_t OUTLINED_FUNCTION_47()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(v0, v1);
  return sub_2471E25E8();
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t NumericSettingView.body.getter()
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
  uint64_t *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[144];
  char v44[8];
  __int128 v45;
  char v46[8];
  __int128 v47;

  v0 = sub_2471E9F7C();
  OUTLINED_FUNCTION_11_0(v0, (uint64_t)&v47 + 8);
  OUTLINED_FUNCTION_2_1(v1);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5();
  v39 = v3;
  v4 = sub_2471EA018();
  OUTLINED_FUNCTION_11_0(v4, (uint64_t)&v45 + 8);
  OUTLINED_FUNCTION_2_1(v5);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_1();
  v9 = v8 - v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADA8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADB0);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADB8);
  v20 = OUTLINED_FUNCTION_11_0(v19, (uint64_t)v44);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_1();
  v23 = v22 - v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADC0);
  OUTLINED_FUNCTION_11_0(v24, (uint64_t)v46);
  OUTLINED_FUNCTION_2_1(v25);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_5();
  v37 = v27;
  OUTLINED_FUNCTION_8_0(v43);
  v28 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_8_0((void *)(v28 + 16));
  OUTLINED_FUNCTION_9_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADC8);
  sub_2471E8F18(&qword_25767ADD0, &qword_25767ADC8);
  sub_2471E9F40();
  sub_2471E9F1C();
  v29 = sub_2471E9F10();
  swift_release();
  v47 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADD8);
  sub_2471E9EC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v18, v14, v10);
  v30 = (uint64_t *)(v18 + *(int *)(v15 + 36));
  *v30 = v29;
  v30[1] = v42;
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  v31 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(v31);
  OUTLINED_FUNCTION_9_0();
  sub_2471EA00C();
  v32 = (char *)(v23 + *(int *)(v36 + 36));
  v33 = sub_2471E9DE4();
  (*(void (**)(char *, uint64_t))(v38 + 16))(&v32[*(int *)(v33 + 20)], v9);
  *(_QWORD *)v32 = &unk_25767ADE8;
  *((_QWORD *)v32 + 1) = v31;
  sub_2471E9050(v18, v23, &qword_25767ADB0);
  (*(void (**)(uint64_t))(v38 + 8))(v9);
  sub_2471E9090(v18, &qword_25767ADB0);
  (*(void (**)(uint64_t, _QWORD))(v40 + 104))(v39, *MEMORY[0x24BEAE368]);
  sub_2471E785C();
  sub_2471E9E74();
  (*(void (**)(uint64_t))(v40 + 8))(v39);
  sub_2471E9090(v23, &qword_25767ADB8);
  sub_2471E9EC8();
  v34 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(v34);
  OUTLINED_FUNCTION_9_0();
  swift_getOpaqueTypeConformance2();
  sub_2471E9EA4();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v41 + 8))(v37);
}

uint64_t sub_2471E66C8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v19;
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
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t result;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t, uint64_t);
  unint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  _OWORD *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  void (*v94)(char *, char *, uint64_t);
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t);
  _QWORD v100[5];
  void (*v101)(char *, uint64_t);
  void (*v102)(char *, uint64_t, uint64_t);
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(char *, uint64_t);
  char *v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;

  v127 = a2;
  v122 = sub_2471E9DF0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v126 = (char *)v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_2471E9F04();
  v124 = *(_QWORD *)(v125 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v123 = (char *)v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471E9DA8();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v107 = (char *)v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE30);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v108 = (char *)v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE38);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v112 = (char *)v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v137 = (char *)v100 - v9;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE40);
  v115 = *(_QWORD *)(v116 - 8);
  MEMORY[0x24BDAC7A8](v116);
  v113 = (char *)v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE48);
  MEMORY[0x24BDAC7A8](v109);
  v118 = (char *)v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE50);
  MEMORY[0x24BDAC7A8](v114);
  v119 = (char *)v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE58);
  v13 = MEMORY[0x24BDAC7A8](v117);
  v121 = (uint64_t)v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v120 = (uint64_t)v100 - v15;
  v16 = sub_2471E9D84();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2471E9F28();
  v138 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC28);
  v130 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  v24 = (char *)v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_2471E9F58();
  v133 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v132 = (char *)v100 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE60);
  MEMORY[0x24BDAC7A8](v135);
  v131 = (char *)v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE68);
  v142 = *(_QWORD *)(v140 - 8);
  v27 = MEMORY[0x24BDAC7A8](v140);
  v139 = (char *)v100 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v141 = (char *)v100 - v29;
  type metadata accessor for SettingViewUtils();
  swift_initStackObject();
  v100[2] = *(_QWORD *)(a1 + 32);
  v100[1] = *(_QWORD *)(a1 + 40);
  v100[4] = *(_QWORD *)(a1 + 48);
  v100[3] = *(_QWORD *)(a1 + 56);
  v30 = *(_QWORD *)(a1 + 72);
  v128 = *(_QWORD *)(a1 + 64);
  v31 = *(double *)(a1 + 96);
  v32 = *(double *)(a1 + 104);
  sub_2471E916C();
  v33 = *MEMORY[0x24BEAAC18];
  v102 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 104);
  v102(v19, v33, v16);
  sub_2471E90C8(&qword_25767AC40, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
  v35 = v34;
  sub_2471E9E5C();
  v36 = *(void (**)(char *, uint64_t))(v17 + 8);
  v105 = v19;
  v106 = v16;
  v101 = v36;
  v36(v19, v16);
  v37 = *(void (**)(char *, uint64_t))(v138 + 8);
  v103 = v22;
  v136 = v37;
  v37(v22, v20);
  v104 = v20;
  v148 = v20;
  v149 = v35;
  swift_getOpaqueTypeConformance2();
  v38 = v129;
  v39 = sub_2471E9E50();
  (*(void (**)(char *, uint64_t))(v130 + 8))(v24, v38);
  v150 = MEMORY[0x24BDF4780];
  v151 = MEMORY[0x24BEAD938];
  v148 = v39;
  *(_QWORD *)&v145 = v128;
  *((_QWORD *)&v145 + 1) = v30;
  sub_2471E8CE8();
  swift_bridgeObjectRetain();
  v40 = sub_2471E9E44();
  v42 = v41;
  LOBYTE(v30) = v43 & 1;
  sub_2471E9E2C();
  v44 = sub_2471E9E38();
  v46 = v45;
  LOBYTE(v16) = v47;
  v49 = v48;
  swift_release();
  sub_2471E8D24(v40, v42, v30);
  swift_bridgeObjectRelease();
  v146 = MEMORY[0x24BDF1FA8];
  v147 = MEMORY[0x24BEAD6B0];
  v50 = swift_allocObject();
  *(_QWORD *)&v145 = v50;
  *(_QWORD *)(v50 + 16) = v44;
  *(_QWORD *)(v50 + 24) = v46;
  v51 = v139;
  *(_BYTE *)(v50 + 32) = v16 & 1;
  *(_QWORD *)(v50 + 40) = v49;
  v52 = v132;
  sub_2471E9F4C();
  v53 = v133;
  v54 = (uint64_t)v131;
  v55 = v134;
  (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v131, v52, v134);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v55);
  v56 = swift_allocObject();
  memcpy((void *)(v56 + 16), (const void *)a1, 0xC0uLL);
  sub_2471E7430(a1);
  sub_2471E8D70();
  sub_2471E9E68();
  swift_release();
  sub_2471E9090(v54, &qword_25767AE60);
  (*(void (**)(char *, char *, uint64_t))(v142 + 32))(v141, v51, v140);
  v145 = *(_OWORD *)(a1 + 160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADD8);
  result = sub_2471E9EE0();
  if (v31 > v32)
  {
    __break(1u);
  }
  else
  {
    *(double *)&v145 = v31;
    *((double *)&v145 + 1) = v32;
    v135 = swift_allocObject();
    memcpy((void *)(v135 + 16), (const void *)a1, 0xC0uLL);
    sub_2471E7430(a1);
    sub_2471E9D90();
    v58 = v103;
    sub_2471E9F34();
    v59 = sub_2471E9EB0();
    v138 = *(_QWORD *)(v138 + 16);
    v60 = (uint64_t)v108;
    v61 = v104;
    ((void (*)(char *, char *, uint64_t))v138)(v108, v58, v104);
    v62 = v110;
    *(_QWORD *)(v60 + *(int *)(v110 + 36)) = v59;
    v136(v58, v61);
    LODWORD(v134) = *MEMORY[0x24BEAAB68];
    v63 = v105;
    v64 = v106;
    v65 = v102;
    ((void (*)(char *))v102)(v105);
    v66 = sub_2471E8E7C();
    sub_2471E9E5C();
    v67 = v101;
    v101(v63, v64);
    sub_2471E9090(v60, &qword_25767AE30);
    sub_2471E9D90();
    sub_2471E9F34();
    v68 = sub_2471E9EB0();
    ((void (*)(uint64_t, char *, uint64_t))v138)(v60, v58, v61);
    *(_QWORD *)(v60 + *(int *)(v62 + 36)) = v68;
    v136(v58, v61);
    v65(v63, v134, v64);
    sub_2471E9E5C();
    v67(v63, v64);
    sub_2471E9090(v60, &qword_25767AE30);
    v143 = v62;
    v144 = v66;
    swift_getOpaqueTypeConformance2();
    sub_2471E8F4C();
    v69 = v113;
    sub_2471E9EEC();
    LOBYTE(v67) = sub_2471E9E20();
    v70 = v115;
    v71 = (uint64_t)v118;
    v72 = v116;
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v118, v69, v116);
    v73 = v71 + *(int *)(v109 + 36);
    *(_BYTE *)v73 = (_BYTE)v67;
    *(_OWORD *)(v73 + 8) = 0u;
    *(_OWORD *)(v73 + 24) = 0u;
    *(_BYTE *)(v73 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v72);
    v74 = v123;
    sub_2471E9EF8();
    v75 = v126;
    v76 = &v126[*(int *)(v122 + 20)];
    v77 = *MEMORY[0x24BDEEB68];
    v78 = sub_2471E9E14();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 104))(v76, v77, v78);
    __asm { FMOV            V0.2D, #10.0 }
    *v75 = _Q0;
    v84 = (uint64_t)v119;
    v85 = &v119[*(int *)(v114 + 36)];
    v86 = v124;
    v87 = v125;
    (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v85, v74, v125);
    v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AEB8);
    sub_2471E8F88((uint64_t)v75, (uint64_t)&v85[*(int *)(v88 + 52)]);
    *(_WORD *)&v85[*(int *)(v88 + 56)] = 256;
    sub_2471E9050(v71, v84, &qword_25767AE48);
    sub_2471E8FCC((uint64_t)v75);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v74, v87);
    sub_2471E9090(v71, &qword_25767AE48);
    LOBYTE(v85) = sub_2471E9E20();
    v89 = v121;
    sub_2471E9050(v84, v121, &qword_25767AE50);
    v90 = v89 + *(int *)(v117 + 36);
    *(_BYTE *)v90 = (_BYTE)v85;
    *(_OWORD *)(v90 + 8) = 0u;
    *(_OWORD *)(v90 + 24) = 0u;
    *(_BYTE *)(v90 + 40) = 1;
    sub_2471E9090(v84, &qword_25767AE50);
    v91 = v120;
    sub_2471E9008(v89, v120);
    v93 = v141;
    v92 = v142;
    v94 = *(void (**)(char *, char *, uint64_t))(v142 + 16);
    v95 = v139;
    v96 = v140;
    v94(v139, v141, v140);
    sub_2471E9050(v91, v89, &qword_25767AE58);
    v97 = v127;
    v94(v127, v95, v96);
    v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AEC0);
    sub_2471E9050(v89, (uint64_t)&v97[*(int *)(v98 + 48)], &qword_25767AE58);
    sub_2471E9090(v91, &qword_25767AE58);
    v99 = *(void (**)(char *, uint64_t))(v92 + 8);
    v99(v93, v96);
    sub_2471E9090(v89, &qword_25767AE58);
    return ((uint64_t (*)(char *, uint64_t))v99)(v95, v96);
  }
  return result;
}

uint64_t sub_2471E7428@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_2471E66C8(v1 + 16, a1);
}

uint64_t sub_2471E7430(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 144);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  swift_retain();
  return a1;
}

uint64_t sub_2471E74D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  uint64_t v10;

  v2 = sub_2471E9D78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 128))
  {
    v6 = qword_25767AC20;
    swift_bridgeObjectRetain();
    if (v6 != -1)
      swift_once();
    sub_2471EA024();
    sub_2471E9DD8();
    v7 = *(void **)(a1 + 144);
    if (!v7)
    {
      sub_2471E7430(a1);
      sub_2471E9FA0();
      sub_2471E90C8(&qword_25767AC58, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
      result = sub_2471E9DFC();
      __break(1u);
      return result;
    }
    v8 = v7;
    sub_2471E9D6C();
    sub_2471E9F88();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (qword_25767AC20 != -1)
    swift_once();
  sub_2471EA024();
  return sub_2471E9DD8();
}

uint64_t sub_2471E76B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC38);
  return sub_2471E9ED4();
}

uint64_t sub_2471E76F8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  sub_2471EA000();
  *(_QWORD *)(v1 + 48) = sub_2471E9FF4();
  sub_2471E9FE8();
  return swift_task_switch();
}

uint64_t sub_2471E7764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = *(_QWORD *)(v1 + 88);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 160);
  *(_QWORD *)(v0 + 32) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767ADD8);
  sub_2471E9ED4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471E77C8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_2471E7814;
  return sub_2471E76F8(v0 + 16);
}

uint64_t sub_2471E7814()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_2471E785C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25767ADF0;
  if (!qword_25767ADF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767ADB8);
    v2 = sub_2471E78E0();
    sub_2471E90C8(&qword_25767AE18, (void (*)(uint64_t))MEMORY[0x24BDEC4E0]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249573FF8](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25767ADF0);
  }
  return result;
}

unint64_t sub_2471E78E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25767ADF8;
  if (!qword_25767ADF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767ADB0);
    sub_2471E8F18(&qword_25767AE00, &qword_25767ADA8);
    v3 = v2;
    sub_2471E8F18(&qword_25767AE08, &qword_25767AE10);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249573FF8](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25767ADF8);
  }
  return result;
}

void sub_2471E797C(uint64_t a1, double *a2)
{
  double v2;
  char v3;

  v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767AC38);
  sub_2471E9EC8();
  if (v3 == 1)
    sub_2471E7A00(v2);
}

void sub_2471E79E8(uint64_t a1, double *a2)
{
  sub_2471E797C(a1, a2);
}

uint64_t sub_2471E79F0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2471E7A00(double a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  os_log_type_t v15;
  NSObject *v16;
  id v17;
  uint8_t *v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[17];
  v6 = objc_allocWithZone(MEMORY[0x24BDDA148]);
  v7 = sub_2471E83E0(0, 0, 0, 0, v5);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, a1);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9EB8]), sel_initWithValue_unit_, v8, 1);
  v10 = objc_allocWithZone(MEMORY[0x24BDDA150]);
  v11 = v7;
  v12 = v9;
  swift_bridgeObjectRetain();
  v13 = sub_2471E8484(v3, v4, v7, 0);
  sub_2471E84F8();
  v14 = sub_2471E7E84(v13, v9, 0, 0, 0);
  v15 = sub_2471EA024();
  if (qword_25767AC20 != -1)
    swift_once();
  v16 = qword_25767C3A0;
  if (os_log_type_enabled((os_log_t)qword_25767C3A0, v15))
  {
    v17 = v14;
    v18 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_DWORD *)v18 = 136315138;
    v19 = v17;
    v20 = objc_msgSend(v19, sel_description);
    v21 = sub_2471E9FC4();
    v23 = v22;

    sub_2471E8540(v21, v23, &v25);
    sub_2471EA048();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2471DF000, v16, v15, "NumericSettingView handleNumericIntent | handling SetNumericIntentHandler for intent: %s", v18, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_10_0();
  }
  sub_2471E9DCC();
  v24 = (void *)sub_2471E9DC0();
  sub_2471E9DB4();

}

uint64_t sub_2471E7CE0(void *a1)
{
  uint64_t result;
  os_log_type_t v3;
  NSObject *v4;
  id v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  result = (uint64_t)objc_msgSend(a1, sel_code);
  if (result != 3)
  {
    v3 = sub_2471EA030();
    if (qword_25767AC20 != -1)
      swift_once();
    v4 = qword_25767C3A0;
    result = os_log_type_enabled((os_log_t)qword_25767C3A0, v3);
    if ((_DWORD)result)
    {
      v5 = a1;
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v10 = v7;
      *(_DWORD *)v6 = 136315138;
      objc_msgSend(v5, sel_code);
      type metadata accessor for INSetNumericSettingIntentResponseCode();
      v8 = sub_2471E9FD0();
      sub_2471E8540(v8, v9, &v10);
      sub_2471EA048();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2471DF000, v4, v3, "NumericSettingView handleNumericIntent | handle failed, response code %s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249574058](v7, -1, -1);
      return MEMORY[0x249574058](v6, -1, -1);
    }
  }
  return result;
}

id sub_2471E7E84(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;

  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSettingMetadata_numericValue_boundedValue_action_temporalEventTrigger_, a1, a2, a3, a4, a5);

  return v8;
}

uint64_t destroy for NumericSettingView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for NumericSettingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v9 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v9;
  v10 = *(void **)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v10;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = v10;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NumericSettingView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v4 = *(void **)(a1 + 144);
  v5 = *(void **)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC0uLL);
}

uint64_t assignWithTake for NumericSettingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  v11 = *(void **)(a1 + 144);
  v12 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v12;

  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_release();
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NumericSettingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 192))
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

uint64_t storeEnumTagSinglePayload for NumericSettingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 192) = 1;
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
    *(_BYTE *)(result + 192) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingView()
{
  return &type metadata for NumericSettingView;
}

uint64_t sub_2471E8368()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767ADC0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767ADB8);
  sub_2471E785C();
  OUTLINED_FUNCTION_6_0();
  return OUTLINED_FUNCTION_6_0();
}

id sub_2471E83E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  void *v9;
  id v10;

  if (!a2)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)sub_2471E9FB8();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)sub_2471E9FB8();
  swift_bridgeObjectRelease();
LABEL_6:
  v10 = objc_msgSend(v5, sel_initWithDeviceName_deviceModel_deviceCategory_, v8, v9, a5);

  return v10;
}

id sub_2471E8484(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v4;
  void *v7;
  id v8;

  v7 = (void *)sub_2471E9FB8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v4, sel_initWithSettingId_targetDevice_targetApp_, v7, a3, a4);

  return v8;
}

unint64_t sub_2471E84F8()
{
  unint64_t result;

  result = qword_25767AE20;
  if (!qword_25767AE20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25767AE20);
  }
  return result;
}

BOOL sub_2471E8534(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_2471E8540(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2471E8610(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2471E8CA8((uint64_t)v12, *a3);
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
      sub_2471E8CA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2471E8610(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2471E8764((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2471EA054();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2471E8828(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2471EA090();
    if (!v8)
    {
      result = sub_2471EA09C();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_2471E8764(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2471EA0A8();
  __break(1u);
  return result;
}

uint64_t sub_2471E8828(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2471E88BC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2471E8A90(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2471E8A90((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2471E88BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2471E9FDC();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_2471E8A2C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2471EA06C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2471EA0A8();
  __break(1u);
LABEL_14:
  result = sub_2471EA09C();
  __break(1u);
  return result;
}

_QWORD *sub_2471E8A2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2471E8A90(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE28);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2471E8C28(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2471E8B64(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2471E8B64(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2471EA0A8();
  __break(1u);
  return result;
}

char *sub_2471E8C28(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2471EA0A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2471E8CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2471E8CE8()
{
  unint64_t result;

  result = qword_25767AE70;
  if (!qword_25767AE70)
  {
    result = MEMORY[0x249573FF8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25767AE70);
  }
  return result;
}

uint64_t sub_2471E8D24(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_2471E8D34()
{
  uint64_t v0;

  sub_2471E8D24(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2471E8D68()
{
  uint64_t v0;

  return sub_2471E74D4(v0 + 16);
}

unint64_t sub_2471E8D70()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25767AE78;
  if (!qword_25767AE78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767AE60);
    sub_2471E90C8(&qword_25767AE80, (void (*)(uint64_t))MEMORY[0x24BEADDA0]);
    v3 = v2;
    sub_2471E8F18(&qword_25767AE88, &qword_25767AE90);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249573FF8](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25767AE78);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2471E8E74()
{
  return sub_2471E76B0();
}

unint64_t sub_2471E8E7C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25767AE98;
  if (!qword_25767AE98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25767AE30);
    sub_2471E90C8(&qword_25767AC40, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v3 = v2;
    sub_2471E8F18(&qword_25767AEA0, &qword_25767AEA8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249573FF8](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25767AE98);
  }
  return result;
}

void sub_2471E8F18(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_5_1();
  }
  OUTLINED_FUNCTION_6();
}

unint64_t sub_2471E8F4C()
{
  unint64_t result;

  result = qword_25767AEB0;
  if (!qword_25767AEB0)
  {
    result = MEMORY[0x249573FF8](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_25767AEB0);
  }
  return result;
}

uint64_t sub_2471E8F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471E9DF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471E8FCC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2471E9DF0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2471E9008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767AE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2471E9050(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_6();
}

void sub_2471E9090(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_6();
}

void sub_2471E90C8(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_5_1();
  }
  OUTLINED_FUNCTION_6();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void *OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 - 320), 0xC0uLL);
}

void OUTLINED_FUNCTION_5_1()
{
  JUMPOUT(0x249573FF8);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_getOpaqueTypeConformance2();
}

void *OUTLINED_FUNCTION_8_0(void *a1)
{
  const void *v1;

  return memcpy(a1, v1, 0xC0uLL);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;

  return sub_2471E7430(v0 - 320);
}

void OUTLINED_FUNCTION_10_0()
{
  JUMPOUT(0x249574058);
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

void sub_2471E916C()
{
  id v0;
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  UIImage *v8;
  NSData *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_2471E9DA8();
  MEMORY[0x24BDAC7A8]();
  if (qword_25767AC10 != -1)
    swift_once();
  sub_2471EA024();
  OUTLINED_FUNCTION_0_1();
  sub_2471E94C0();
  swift_bridgeObjectRetain();
  v0 = sub_2471E940C();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_initWithSize_scale_, 60.0, 60.0, 3.0);
  objc_msgSend(v1, sel_setGraphicVariant_, 1);
  sub_2471EA024();
  v2 = OUTLINED_FUNCTION_0_1();
  v3 = OUTLINED_FUNCTION_1_2(v2, sel_imageForDescriptor_);
  if (v3)
  {
    v4 = v3;
    v5 = OUTLINED_FUNCTION_1_2((uint64_t)objc_msgSend(v3, sel_placeholder), sel_prepareImageForDescriptor_);

  }
  else
  {
    v5 = 0;
  }
  sub_2471EA024();
  sub_2471E9DD8();
  if (!v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v6 = objc_msgSend(v5, sel_CGImage);
  if (v6)
  {
    v7 = v6;
    v8 = (UIImage *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_, v6);
    v9 = UIImagePNGRepresentation(v8);

    if (v9)
    {
      v10 = sub_2471E9D54();
      v12 = v11;

      if (v12 >> 60 != 15)
      {
        sub_2471E94FC(v10, v12);
        sub_2471E9D9C();
        OUTLINED_FUNCTION_2_2();
        sub_2471E9F34();

        OUTLINED_FUNCTION_2_2();
        return;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
}

id sub_2471E940C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2471E9FB8();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithType_, v1);

  return v2;
}

uint64_t SettingViewUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SettingViewUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SettingViewUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for SettingViewUtils()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_2471E94C0()
{
  unint64_t result;

  result = qword_25767AF68;
  if (!qword_25767AF68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25767AF68);
  }
  return result;
}

uint64_t sub_2471E94FC(uint64_t a1, unint64_t a2)
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

uint64_t sub_2471E9540(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2471E9554(a1, a2);
  return a1;
}

uint64_t sub_2471E9554(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_2471E9DD8();
}

id OUTLINED_FUNCTION_1_2(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  uint64_t v0;
  unint64_t v1;

  return sub_2471E9540(v0, v1);
}

uint64_t SiriSettingsUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriSettingsUIPlugin.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriSettingsUIPlugin.snippet(for:mode:idiom:)(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD __src[24];
  _BYTE v30[152];
  _QWORD __dst[24];
  _BYTE v32[152];
  _BYTE v33[160];

  sub_2471E25B0(a1, v32);
  sub_2471E25B0(v32, v33);
  if (sub_2471E2624((uint64_t)v33) == 1)
  {
    v1 = (_QWORD *)nullsub_1(v33);
    sub_2471E25B0(v32, v30);
    v2 = nullsub_1(v30);
    sub_2471E493C(v2);
    if (qword_25767AC10 != -1)
      swift_once();
    sub_2471EA024();
    sub_2471E9DD8();
    sub_2471E9FA0();
    sub_2471E9998();
    v3 = sub_2471E9E08();
    v5 = v4;
    LOBYTE(__src[0]) = 0;
    sub_2471E9EBC();
    v6 = __dst[0];
    v7 = __dst[1];
    v8 = v1[10];
    memcpy(__dst, v1, 0x90uLL);
    __dst[18] = v3;
    __dst[19] = v5;
    __dst[20] = v8;
    __dst[21] = 0;
    LOBYTE(__dst[22]) = v6;
    __dst[23] = v7;
    memcpy(__src, __dst, sizeof(__src));
    sub_2471E99D8();
    v9 = sub_2471E9E50();
    sub_2471E9A14((uint64_t)__dst);
  }
  else
  {
    v10 = nullsub_1(v33);
    v11 = *(_QWORD *)v10;
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 16);
    v27 = *(_QWORD *)(v10 + 32);
    v28 = *(_QWORD *)(v10 + 24);
    v25 = *(_QWORD *)(v10 + 48);
    v26 = *(_QWORD *)(v10 + 40);
    v24 = *(_QWORD *)(v10 + 56);
    v23 = *(_BYTE *)(v10 + 64);
    v14 = *(_BYTE *)(v10 + 65);
    v21 = *(_QWORD *)(v10 + 80);
    v22 = *(_QWORD *)(v10 + 72);
    v19 = *(_QWORD *)(v10 + 96);
    v20 = *(_QWORD *)(v10 + 88);
    v18 = *(_QWORD *)(v10 + 104);
    sub_2471E25B0(v32, __dst);
    nullsub_1(__dst);
    v15 = qword_25767AC10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v15 != -1)
      swift_once();
    sub_2471EA024();
    sub_2471E9DD8();
    sub_2471E9FA0();
    sub_2471E9998();
    __src[0] = v11;
    __src[1] = v12;
    __src[2] = v13;
    __src[3] = v28;
    __src[4] = v27;
    __src[5] = v26;
    __src[6] = v25;
    __src[7] = v24;
    LOBYTE(__src[8]) = v23;
    BYTE1(__src[8]) = v14;
    __src[9] = v22;
    __src[10] = v21;
    __src[11] = v20;
    __src[12] = v19;
    __src[13] = v18;
    __src[14] = sub_2471E9E08();
    __src[15] = v16;
    LOBYTE(__src[16]) = v14;
    __src[17] = 0;
    memcpy(v30, __src, 0x90uLL);
    sub_2471E9AB8();
    v9 = sub_2471E9E50();
    sub_2471E9AF4((uint64_t)__src);
  }
  return v9;
}

uint64_t SiriSettingsUIPlugin.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriSettingsUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2471E9960@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = SiriSettingsUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_2471E9984(void *a1)
{
  return SiriSettingsUIPlugin.snippet(for:mode:idiom:)(a1);
}

unint64_t sub_2471E9998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25767AC58;
  if (!qword_25767AC58)
  {
    v1 = sub_2471E9FA0();
    result = MEMORY[0x249573FF8](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_25767AC58);
  }
  return result;
}

unint64_t sub_2471E99D8()
{
  unint64_t result;

  result = qword_25767AF70;
  if (!qword_25767AF70)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for NumericSettingView, &type metadata for NumericSettingView);
    atomic_store(result, (unint64_t *)&qword_25767AF70);
  }
  return result;
}

uint64_t sub_2471E9A14(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_2471E9AB8()
{
  unint64_t result;

  result = qword_25767AF78;
  if (!qword_25767AF78)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for BinarySettingView, &type metadata for BinarySettingView);
    atomic_store(result, (unint64_t *)&qword_25767AF78);
  }
  return result;
}

uint64_t sub_2471E9AF4(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return a1;
}

unint64_t sub_2471E9B88()
{
  unint64_t result;

  result = qword_25767AF80;
  if (!qword_25767AF80)
  {
    result = MEMORY[0x249573FF8](&protocol conformance descriptor for SnippetModels, &type metadata for SnippetModels);
    atomic_store(result, (unint64_t *)&qword_25767AF80);
  }
  return result;
}

uint64_t type metadata accessor for SiriSettingsUIPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriSettingsUIPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSettingsUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

void sub_2471E9BF8()
{
  OUTLINED_FUNCTION_1_3();
  qword_25767C390 = sub_2471EA03C();
  OUTLINED_FUNCTION_6();
}

unint64_t sub_2471E9C54()
{
  unint64_t result;

  result = qword_25767AF88;
  if (!qword_25767AF88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25767AF88);
  }
  return result;
}

void sub_2471E9C90()
{
  OUTLINED_FUNCTION_1_3();
  qword_25767C398 = sub_2471EA03C();
  OUTLINED_FUNCTION_6();
}

void sub_2471E9CEC()
{
  OUTLINED_FUNCTION_1_3();
  qword_25767C3A0 = sub_2471EA03C();
  OUTLINED_FUNCTION_6();
}

unint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_2471E9C54();
}

uint64_t sub_2471E9D54()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2471E9D60()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_2471E9D6C()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_2471E9D78()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_2471E9D84()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_2471E9D90()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_2471E9D9C()
{
  return MEMORY[0x24BEAD2E0]();
}

uint64_t sub_2471E9DA8()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_2471E9DB4()
{
  return MEMORY[0x24BEA6250]();
}

uint64_t sub_2471E9DC0()
{
  return MEMORY[0x24BEA6258]();
}

uint64_t sub_2471E9DCC()
{
  return MEMORY[0x24BEA6260]();
}

uint64_t sub_2471E9DD8()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2471E9DE4()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_2471E9DF0()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2471E9DFC()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_2471E9E08()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2471E9E14()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2471E9E20()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2471E9E2C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2471E9E38()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2471E9E44()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2471E9E50()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_2471E9E5C()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_2471E9E68()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_2471E9E74()
{
  return MEMORY[0x24BEAD898]();
}

uint64_t sub_2471E9E80()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2471E9E8C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2471E9E98()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2471E9EA4()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_2471E9EB0()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_2471E9EBC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2471E9EC8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2471E9ED4()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2471E9EE0()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2471E9EEC()
{
  return MEMORY[0x24BDF45B0]();
}

uint64_t sub_2471E9EF8()
{
  return MEMORY[0x24BDF4E08]();
}

uint64_t sub_2471E9F04()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_2471E9F10()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_2471E9F1C()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_2471E9F28()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_2471E9F34()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2471E9F40()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_2471E9F4C()
{
  return MEMORY[0x24BEADD88]();
}

uint64_t sub_2471E9F58()
{
  return MEMORY[0x24BEADDA0]();
}

uint64_t sub_2471E9F64()
{
  return MEMORY[0x24BEAE250]();
}

uint64_t sub_2471E9F70()
{
  return MEMORY[0x24BEAE258]();
}

uint64_t sub_2471E9F7C()
{
  return MEMORY[0x24BEAE380]();
}

uint64_t sub_2471E9F88()
{
  return MEMORY[0x24BEAE550]();
}

uint64_t sub_2471E9F94()
{
  return MEMORY[0x24BEAE568]();
}

uint64_t sub_2471E9FA0()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_2471E9FAC()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2471E9FB8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2471E9FC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2471E9FD0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2471E9FDC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2471E9FE8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2471E9FF4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2471EA000()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2471EA00C()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2471EA018()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2471EA024()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2471EA030()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2471EA03C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2471EA048()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2471EA054()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2471EA060()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2471EA06C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2471EA078()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2471EA084()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2471EA090()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2471EA09C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2471EA0A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2471EA0B4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2471EA0C0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2471EA0CC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2471EA0D8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2471EA0E4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2471EA0F0()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2471EA0FC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2471EA108()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2471EA114()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2471EA120()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2471EA12C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2471EA138()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2471EA144()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2471EA150()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2471EA15C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2471EA168()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2471EA174()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2471EA180()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2471EA18C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2471EA198()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2471EA1A4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2471EA1B0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2471EA1BC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2471EA1C8()
{
  return MEMORY[0x24BEE4A10]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

