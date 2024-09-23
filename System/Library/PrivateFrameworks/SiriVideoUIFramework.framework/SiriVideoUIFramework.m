uint64_t sub_247492510@<X0>(uint64_t a1@<X8>)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];

  v2 = v1;
  v29[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DC0);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_6();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DC8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DD0);
  v29[0] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  sub_24749312C(v2, (uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for FilteredListView);
  v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = swift_allocObject();
  sub_247492F60((uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DD8);
  sub_247493020(&qword_2576A8DE0, &qword_2576A8DD8, MEMORY[0x24BDF5428]);
  sub_24749D558();
  sub_24749D564();
  v21 = OUTLINED_FUNCTION_4();
  v22(v21);
  v23 = sub_24749D570();
  v24 = OUTLINED_FUNCTION_4();
  v25(v24);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v23);
  sub_247493020(&qword_2576A8DE8, &qword_2576A8DC8, MEMORY[0x24BEADC00]);
  v27 = v26;
  MEMORY[0x24957C7D4](v6, v10, v26);
  sub_2474931A8(v6, &qword_2576A8DC0);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  v29[2] = v10;
  v29[3] = v27;
  swift_getOpaqueTypeConformance2();
  sub_24749D480();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v29[0] + 8))(v18, v15);
}

void sub_2474927A0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v21 = a1;
  type metadata accessor for ResultsList();
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v20 - v4;
  v6 = sub_24749D618();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DF0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - v14;
  v16 = sub_24749D2B8();
  v30 = MEMORY[0x24BEE0D00];
  v31 = MEMORY[0x24BEAE5B8];
  v28 = v16;
  v29 = v17;
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  sub_24749D60C();
  sub_24749305C();
  sub_24749D48C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_24749309C((uint64_t)v13, (uint64_t)v15);
  sub_24749D1C8();
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  sub_2474930E4((uint64_t)v15, (uint64_t)v13);
  sub_24749312C((uint64_t)v5, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  v18 = v21;
  sub_2474930E4((uint64_t)v13, v21);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8E00);
  sub_24749312C((uint64_t)v3, v18 + *(int *)(v19 + 48), (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  sub_24749316C((uint64_t)v5);
  sub_2474931A8((uint64_t)v15, &qword_2576A8DF0);
  sub_24749316C((uint64_t)v3);
  sub_2474931A8((uint64_t)v13, &qword_2576A8DF0);
}

uint64_t sub_247492A08()
{
  return sub_24749D474();
}

uint64_t *sub_247492A2C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_24749D2C4();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957CB34]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247492B24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = a1 + *(int *)(sub_24749D2C4() + 20);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t sub_247492B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(sub_24749D2C4() + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t sub_247492C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(sub_24749D2C4() + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t sub_247492C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = *(int *)(sub_24749D2C4() + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_247492D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = *(int *)(sub_24749D2C4() + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_247492DAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247492DB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_247492DEC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247492DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for FilteredListView()
{
  uint64_t result;

  result = qword_2576A8D88;
  if (!qword_2576A8D88)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247492E68()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24749D2C4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247492ED0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247492EE0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  OUTLINED_FUNCTION_0(v0);
  sub_24749D2C4();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  OUTLINED_FUNCTION_0(v1);
  return swift_deallocObject();
}

uint64_t sub_247492F60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FilteredListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_247492FA4(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_6();
  sub_2474927A0(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957CB40](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_247493020(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24957CB4C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_24749305C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A8DF8;
  if (!qword_2576A8DF8)
  {
    v1 = sub_24749D618();
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEAE2C8], v1);
    atomic_store(result, (unint64_t *)&qword_2576A8DF8);
  }
  return result;
}

uint64_t sub_24749309C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2474930E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24749312C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_24749316C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ResultsList();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2474931A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_2474931E0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8DD0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8DC8);
  sub_247493020(&qword_2576A8DE8, &qword_2576A8DC8, MEMORY[0x24BEADC00]);
  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_3();
}

uint64_t sub_247493264@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_24749D2C4();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return type metadata accessor for FilteredListView();
}

uint64_t *sub_2474932F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_24749339C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_2474933FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_24749347C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_2474934FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_24749357C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_2474935FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247493608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = sub_24749D2A0();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_247493664()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247493670(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = sub_24749D2A0();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for ResultsList()
{
  uint64_t result;

  result = qword_2576A8E68;
  if (!qword_2576A8E68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24749370C()
{
  unint64_t v0;
  unint64_t v1;

  sub_24749D540();
  if (v0 <= 0x3F)
  {
    sub_247493790();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_247493790()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576A8E78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2576A8E80);
    v0 = sub_24749D1B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576A8E78);
  }
}

uint64_t sub_2474937E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2474937F8@<X0>(uint64_t a1@<X8>)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];

  v2 = v1;
  v29[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DC0);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_2_0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8EB0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8EB8);
  v29[0] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  sub_24749312C(v2, (uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = swift_allocObject();
  sub_247493CFC((uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8EC0);
  sub_247493D78();
  sub_24749D558();
  sub_24749D564();
  v21 = OUTLINED_FUNCTION_6_0();
  v22(v21);
  v23 = sub_24749D570();
  v24 = OUTLINED_FUNCTION_6_0();
  v25(v24);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v23);
  sub_247493E34(&qword_2576A8ED8, &qword_2576A8EB0);
  v27 = v26;
  MEMORY[0x24957C7D4](v6, v10, v26);
  sub_247493DF4(v6);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  v29[2] = v10;
  v29[3] = v27;
  OUTLINED_FUNCTION_4_0();
  sub_24749D480();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v29[0] + 8))(v18, v15);
}

uint64_t sub_247493A64()
{
  type metadata accessor for ResultsList();
  sub_24749D294();
  __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8EE0);
  type metadata accessor for VideoResult();
  sub_247493E34(&qword_2576A8EE8, qword_2576A8E80);
  sub_247493E68(&qword_2576A8ED0, (void (*)(uint64_t))type metadata accessor for VideoResult);
  sub_247493E68(&qword_2576A8EF0, (void (*)(uint64_t))MEMORY[0x24BEA8ED0]);
  return sub_24749D4C8();
}

uint64_t sub_247493B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = sub_24749D3D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for VideoResult();
  sub_24749312C(a1, a2 + *(int *)(v8 + 24), (uint64_t (*)(_QWORD))MEMORY[0x24BEA8ED0]);
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  v10[1] = 0x4028000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF1890], v4);
  sub_247493E9C();
  return sub_24749D36C();
}

uint64_t sub_247493C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_2_0();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v3 + *(int *)(v1 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A8E08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_247493CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ResultsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247493D40()
{
  OUTLINED_FUNCTION_2_0();
  return sub_247493A64();
}

unint64_t sub_247493D78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2576A8EC8;
  if (!qword_2576A8EC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8EC0);
    sub_247493E68(&qword_2576A8ED0, (void (*)(uint64_t))type metadata accessor for VideoResult);
    v3 = v2;
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDF4A08], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2576A8EC8);
  }
  return result;
}

uint64_t sub_247493DF4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_247493E34(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_5();
}

void sub_247493E68(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_247493E9C()
{
  unint64_t result;

  result = qword_2576A8EF8;
  if (!qword_2576A8EF8)
  {
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2576A8EF8);
  }
  return result;
}

uint64_t sub_247493ED8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8EB8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8EB0);
  sub_247493E34(&qword_2576A8ED8, &qword_2576A8EB0);
  OUTLINED_FUNCTION_4_0();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_24749D540();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return type metadata accessor for ResultsList();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_5_0()
{
  JUMPOUT(0x24957CB4CLL);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return v0;
}

uint64_t ConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
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
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v53 = a1;
  v2 = sub_24749D594();
  v3 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  v52 = v3;
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1();
  v50 = v6 - v5;
  v46 = sub_24749D4E0();
  v7 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_2_1();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F00);
  v45 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F08);
  v49 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_1_0();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v47 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v44 = (char *)&v38 - v19;
  v39 = v1;
  OUTLINED_FUNCTION_7();
  v20 = *(unsigned __int8 *)(v12 + 80);
  v43 = ((v20 + 16) & ~v20) + v13;
  v42 = v20 | 7;
  v21 = swift_allocObject();
  OUTLINED_FUNCTION_5_1(v21);
  v55 = v1;
  sub_24749D4BC();
  v22 = *MEMORY[0x24BEAD978];
  v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
  v23 = v46;
  v41(v10, v22, v46);
  v24 = sub_247494478();
  OUTLINED_FUNCTION_3_0();
  v40 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v40(v10, v23);
  OUTLINED_FUNCTION_8();
  v25 = v39;
  OUTLINED_FUNCTION_7();
  v26 = swift_allocObject();
  OUTLINED_FUNCTION_5_1(v26);
  v54 = v25;
  sub_24749D4BC();
  v41(v10, *MEMORY[0x24BEAD970], v23);
  v27 = v47;
  OUTLINED_FUNCTION_3_0();
  v40(v10, v23);
  OUTLINED_FUNCTION_8();
  v59 = v14;
  v60 = v24;
  swift_getOpaqueTypeConformance2();
  v28 = v48;
  v29 = v44;
  v30 = sub_24749D3FC();
  v31 = MEMORY[0x24BDF4780];
  v32 = MEMORY[0x24BEAD938];
  v61 = MEMORY[0x24BDF4780];
  v62 = MEMORY[0x24BEAD938];
  v59 = v30;
  v33 = sub_24749D3FC();
  v57 = v31;
  v58 = v32;
  v56 = v33;
  v34 = v50;
  sub_24749D588();
  sub_247494828();
  v35 = v51;
  sub_24749D480();
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v34, v35);
  v36 = *(void (**)(char *, uint64_t))(v49 + 8);
  v36(v27, v28);
  return ((uint64_t (*)(char *, uint64_t))v36)(v29, v28);
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result;

  result = qword_2576A8F80;
  if (!qword_2576A8F80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2474943C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247494408(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24749444C()
{
  return sub_24749475C(MEMORY[0x24BEA8F48]);
}

uint64_t sub_247494458@<X0>(uint64_t a1@<X8>)
{
  return sub_247494798(MEMORY[0x24BEA8F40], a1);
}

unint64_t sub_247494478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A8F18;
  if (!qword_2576A8F18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8F00);
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDF43B0], v1);
    atomic_store(result, (unint64_t *)&qword_2576A8F18);
  }
  return result;
}

uint64_t sub_2474944BC(uint64_t a1, void (*a2)(void))
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
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  sub_24749D528();
  v15 = sub_24749D5E8();
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1)
    return sub_247495074(v14, &qword_2576A8FD0);
  OUTLINED_FUNCTION_2_1();
  a2();
  v17 = sub_24749D174();
  __swift_storeEnumTagSinglePayload(v10, 0, 1, v17);
  v18 = sub_24749D57C();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v18);
  sub_24749D5DC();
  sub_247495074(v6, &qword_2576A8FC0);
  sub_247495074(v10, &qword_2576A8FC8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_2_1();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v3 + *(int *)(v1 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (int *)OUTLINED_FUNCTION_6_1();
  v9 = v5 + v8[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v7(v5 + v8[6], v6);
  v11(v5 + v8[7], v10);
  return swift_deallocObject();
}

uint64_t sub_247494750()
{
  return sub_24749475C(MEMORY[0x24BEA8F58]);
}

uint64_t sub_24749475C(void (*a1)(void))
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_1() - 8) + 80);
  return sub_2474944BC(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_247494798@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2_1();
  a1();
  sub_247495038();
  result = sub_24749D3F0();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  return result;
}

uint64_t sub_247494808@<X0>(uint64_t a1@<X8>)
{
  return sub_247494798(MEMORY[0x24BEA8F50], a1);
}

unint64_t sub_247494828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A8F20;
  if (!qword_2576A8F20)
  {
    v1 = sub_24749D594();
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEADCC0], v1);
    atomic_store(result, (unint64_t *)&qword_2576A8F20);
  }
  return result;
}

uint64_t sub_247494868()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v13 = (int *)sub_24749D2D0();
    v14 = v13[5];
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    v12(&v9[v13[6]], &v10[v13[6]], v11);
    v18(&v9[v13[7]], &v10[v13[7]], v17);
  }
  return a1;
}

uint64_t destroy for ConfirmationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t);

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (int *)sub_24749D2D0();
  v9 = v5 + v8[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v12(v9, v10);
  v7(v5 + v8[6], v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v5 + v8[7], v10);
}

uint64_t initializeWithCopy for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v12 = (int *)sub_24749D2D0();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t assignWithCopy for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = (int *)sub_24749D2D0();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t initializeWithTake for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = (int *)sub_24749D2D0();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t assignWithTake for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = (int *)sub_24749D2D0();
  v13 = v12[5];
  v14 = v8 + v13;
  v15 = v9 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40);
  v17(v14, v15, v16);
  v11(v8 + v12[6], v9 + v12[6], v10);
  v17(v8 + v12[7], v9 + v12[7], v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247494EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_6_1();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for ConfirmationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247494F0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_6_1();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_247494F6C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24749D540();
  if (v1 <= 0x3F)
  {
    result = sub_24749D2D0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_247494FF0()
{
  sub_24749D594();
  sub_247494828();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_247495038()
{
  unint64_t result;

  result = qword_2576A8FB8;
  if (!qword_2576A8FB8)
  {
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A8FB8);
  }
  return result;
}

uint64_t sub_247495074(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return type metadata accessor for ConfirmationView();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_24749D408();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_247494408(v1, a1 + v2);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_24749D2D0();
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2474943C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t *sub_247495104(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v17 = (int *)sub_24749D264();
    v16(&v13[v17[5]], &v14[v17[5]], v15);
    v16(&v13[v17[6]], &v14[v17[6]], v15);
    v16(&v13[v17[7]], &v14[v17[7]], v15);
    v16(&v13[v17[8]], &v14[v17[8]], v15);
    v16(&v13[v17[9]], &v14[v17[9]], v15);
    v18 = v17[10];
    v19 = &v13[v18];
    v20 = &v14[v18];
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = v17[11];
    v23 = &v13[v22];
    v24 = &v14[v22];
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    v16(&v13[v17[12]], &v14[v17[12]], v15);
  }
  return a1;
}

uint64_t sub_2474952D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v15)(uint64_t, uint64_t);

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v15(v7, v8);
  v9 = (int *)sub_24749D264();
  v15(v7 + v9[5], v8);
  v15(v7 + v9[6], v8);
  v15(v7 + v9[7], v8);
  v15(v7 + v9[8], v8);
  v15(v7 + v9[9], v8);
  v10 = v7 + v9[10];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = v7 + v9[11];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v7 + v9[12], v8);
}

uint64_t sub_247495450(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v16 = (int *)sub_24749D264();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  v17 = v16[10];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = v16[11];
  v22 = v12 + v21;
  v23 = v13 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_2474955F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24);
  v15(v12, v13, v14);
  v16 = (int *)sub_24749D264();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  v17 = v16[10];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = v16[11];
  v22 = v12 + v21;
  v23 = v13 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_2474957A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v16 = (int *)sub_24749D264();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  v17 = v16[10];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = v16[11];
  v22 = v12 + v21;
  v23 = v13 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_247495948(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v16 = (int *)sub_24749D264();
  v15(v12 + v16[5], v13 + v16[5], v14);
  v15(v12 + v16[6], v13 + v16[6], v14);
  v15(v12 + v16[7], v13 + v16[7], v14);
  v15(v12 + v16[8], v13 + v16[8], v14);
  v15(v12 + v16[9], v13 + v16[9], v14);
  v17 = v16[10];
  v18 = v12 + v17;
  v19 = v13 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = v16[11];
  v22 = v12 + v21;
  v23 = v13 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v15(v12 + v16[12], v13 + v16[12], v14);
  return a1;
}

uint64_t sub_247495AF0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247495AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v9;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = OUTLINED_FUNCTION_9();
      v10 = *(int *)(a3 + 24);
    }
    v8 = v4 + v10;
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_247495B7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247495B88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_9();
      v12 = *(int *)(a4 + 24);
    }
    v10 = v5 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for VideoResult()
{
  uint64_t result;

  result = qword_2576A9050;
  if (!qword_2576A9050)
    return swift_getSingletonMetadata();
  return result;
}

void sub_247495C48()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_24749D540();
  if (v0 <= 0x3F)
  {
    sub_247495CE8();
    if (v1 <= 0x3F)
    {
      sub_24749D264();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_247495CE8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576A9060)
  {
    sub_247493E9C();
    v0 = sub_24749D384();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576A9060);
  }
}

uint64_t sub_247495D40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247495D50@<X0>(uint64_t a1@<X8>)
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
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v48[2];
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
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v2 = v1;
  v59 = a1;
  v3 = OUTLINED_FUNCTION_10();
  v52 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v54 = v4;
  v56 = (uint64_t)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9098);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1();
  v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90A0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1();
  v12 = v11 - v10;
  v13 = sub_24749D600();
  v50 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_1();
  v17 = v16 - v15;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90A8);
  v51 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_1();
  v21 = v20 - v19;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90B0);
  v57 = *(_QWORD *)(v58 - 8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_8_0();
  v53 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90B8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_8_0();
  v49 = v25;
  v26 = sub_24749D258();
  v74 = MEMORY[0x24BEE0D00];
  v75 = MEMORY[0x24BEAE5B8];
  if (v27)
    v28 = v26;
  else
    v28 = 0;
  v29 = 0xE000000000000000;
  if (v27)
    v29 = v27;
  v72 = v28;
  v73 = v29;
  v30 = v2;
  sub_2474961FC(v12);
  sub_2474976F4(&qword_2576A90C0, &qword_2576A90A0, (uint64_t (*)(void))sub_2474976D8);
  v31 = sub_24749D3FC();
  sub_247497DA4(v12, &qword_2576A90A0);
  v32 = MEMORY[0x24BDF4780];
  v33 = MEMORY[0x24BEAD938];
  v70 = MEMORY[0x24BDF4780];
  v71 = MEMORY[0x24BEAD938];
  v69 = v31;
  v34 = sub_24749D21C();
  if (v35)
  {
    *((_QWORD *)&v67 + 1) = MEMORY[0x24BEE0D00];
    v68 = MEMORY[0x24BEAE5B8];
    *(_QWORD *)&v66 = v34;
    *((_QWORD *)&v66 + 1) = v35;
  }
  else
  {
    v68 = 0;
    v66 = 0u;
    v67 = 0u;
  }
  v65 = 0;
  v63 = 0u;
  v64 = 0u;
  sub_247496734(v8);
  sub_2474977B0();
  v36 = sub_24749D3FC();
  sub_247497DA4(v8, &qword_2576A9098);
  v62 = v33;
  v61 = v32;
  v60 = v36;
  sub_24749D5F4();
  v37 = v56;
  sub_2474978A8(v30, v56);
  v38 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  v39 = swift_allocObject();
  sub_247497A18(v37, v39 + v38);
  sub_247497FAC(&qword_2576A9110, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE228], MEMORY[0x24BEAE208]);
  v41 = v40;
  sub_24749D42C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v17, v13);
  v72 = v13;
  v73 = v41;
  v42 = OUTLINED_FUNCTION_11();
  v43 = v53;
  v44 = v55;
  sub_24749D480();
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v21, v44);
  v72 = v44;
  v73 = v42;
  OUTLINED_FUNCTION_11();
  v45 = v49;
  v46 = v58;
  sub_24749D48C();
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v43, v46);
  return sub_247497A84(v45, v59);
}

void sub_2474961FC(uint64_t a1@<X8>)
{
  char *v1;
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
  char *v14;
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
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v46 = a1;
  v47 = sub_24749D510();
  v41 = *(_QWORD *)(v47 - 8);
  v2 = MEMORY[0x24BDAC7A8](v47);
  v40 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)v36 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)v36 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)v36 - v8;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9160);
  MEMORY[0x24BDAC7A8](v44);
  v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9168);
  MEMORY[0x24BDAC7A8](v43);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90D0);
  MEMORY[0x24BDAC7A8](v45);
  v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90E0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  v42 = v1;
  v18 = sub_24749D234();
  v20 = v19;
  v21 = sub_24749D240();
  v23 = sub_24749C93C(v18, v20, v21, v22);
  v48 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_retain();
    *(_QWORD *)v17 = sub_24749D39C();
    *((_QWORD *)v17 + 1) = 0;
    v17[16] = 0;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9170);
    sub_2474973B4(v23, &v17[*(int *)(v25 + 44)]);
    sub_247497D64((uint64_t)v17, (uint64_t)v12, &qword_2576A90E0);
    swift_storeEnumTagMultiPayload();
    sub_24749776C();
    sub_247497FAC(&qword_2576A90E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADAB8], MEMORY[0x24BEADAB0]);
    sub_24749D3A8();
    sub_247497D64((uint64_t)v14, (uint64_t)v10, &qword_2576A90D0);
    swift_storeEnumTagMultiPayload();
    sub_2474976D8();
    sub_24749D3A8();
    swift_release_n();
    swift_bridgeObjectRelease();
    sub_247497DA4((uint64_t)v14, &qword_2576A90D0);
    sub_247497DA4((uint64_t)v17, &qword_2576A90E0);
  }
  else
  {
    v27 = v39;
    v26 = v40;
    v36[0] = v12;
    v36[1] = v15;
    v42 = v14;
    v29 = v37;
    v28 = v38;
    v30 = (uint64_t)v10;
    v31 = v41;
    v32 = v47;
    if (v48)
    {
      swift_bridgeObjectRetain();
      sub_24749D228();
      if (v33)
        swift_bridgeObjectRelease();
      v34 = v31;
      sub_24749D51C();
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v29, v28, v32);
      (*(void (**)(_QWORD, char *, uint64_t))(v31 + 16))(v36[0], v29, v32);
      swift_storeEnumTagMultiPayload();
      sub_24749776C();
      sub_247497FAC(&qword_2576A90E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADAB8], MEMORY[0x24BEADAB0]);
      v35 = (uint64_t)v42;
      sub_24749D3A8();
      sub_247497D64(v35, v30, &qword_2576A90D0);
      swift_storeEnumTagMultiPayload();
      sub_2474976D8();
      sub_24749D3A8();
      swift_bridgeObjectRelease();
      sub_247497DA4(v35, &qword_2576A90D0);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v32);
    }
    else
    {
      sub_24749D228();
      sub_24749D51C();
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v27, v26, v32);
      (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v30, v27, v32);
      swift_storeEnumTagMultiPayload();
      sub_2474976D8();
      sub_247497FAC(&qword_2576A90E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADAB8], MEMORY[0x24BEADAB0]);
      sub_24749D3A8();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v32);
    }
  }
}

uint64_t sub_247496734@<X0>(uint64_t a1@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (**v16)(char *, uint64_t);
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
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t (**v31)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t (**v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t OpaqueTypeConformance2;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t, uint64_t);
  uint64_t (**v82)(char *, uint64_t);
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v106 = a1;
  v88 = sub_24749D1BC();
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v86 = (char *)&v81 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_24749D150();
  v91 = *(_QWORD *)(v2 - 8);
  v92 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v85 = (char *)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9118);
  MEMORY[0x24BDAC7A8](v4);
  v84 = (uint64_t)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9120);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24749D168();
  MEMORY[0x24BDAC7A8](v9);
  v83 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9128);
  MEMORY[0x24BDAC7A8](v104);
  v105 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_24749D138();
  v107 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24749D1A4();
  MEMORY[0x24BDAC7A8](v14);
  v90 = sub_24749D4EC();
  v93 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v16 = (uint64_t (**)(char *, uint64_t))((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9100);
  v96 = *(_QWORD *)(v17 - 8);
  v97 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v95 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90F8);
  v100 = *(_QWORD *)(v19 - 8);
  v101 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v99 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9130);
  v103 = *(_QWORD *)(v89 - 8);
  v21 = MEMORY[0x24BDAC7A8](v89);
  v98 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v102 = (char *)&v81 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9138);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v81 - v28;
  v30 = sub_24749D120();
  v31 = *(uint64_t (***)(char *, uint64_t))(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v81 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  sub_24749D24C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, v30) == 1)
  {
    sub_247497DA4((uint64_t)v29, &qword_2576A9138);
    v34 = sub_24749D180();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v34);
    v35 = sub_24749D144();
    v36 = v84;
    __swift_storeEnumTagSinglePayload(v84, 1, 1, v35);
    v37 = *MEMORY[0x24BEAAE50];
    v82 = v16;
    v38 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v91 + 104))(v85, v37, v92);
    v39 = *MEMORY[0x24BEAABB0];
    v81 = *(void (**)(char *, uint64_t, uint64_t))(v107 + 104);
    v40 = (uint64_t)v8;
    v41 = v94;
    v81(v13, v39, v94);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9140);
    v42 = sub_24749D12C();
    v43 = *(_QWORD *)(v42 - 8);
    v44 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_24749DA00;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v43 + 104))(v45 + v44, *MEMORY[0x24BEAA998], v42);
    sub_247497ACC(v45);
    v46 = v87;
    v47 = v86;
    v48 = v88;
    (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v86, *MEMORY[0x24BEAD480], v88);
    sub_24749D15C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
    v49 = *(void (**)(char *, uint64_t))(v107 + 8);
    v49(v13, v41);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v38, v92);
    sub_247497DA4(v36, &qword_2576A9118);
    sub_247497DA4(v40, &qword_2576A9120);
    v50 = v82;
    sub_24749D504();
    v81(v13, *MEMORY[0x24BEAAB78], v41);
    sub_247497FAC(&qword_2576A9108, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
    v52 = v51;
    v53 = v95;
    v54 = v90;
    sub_24749D414();
    v49(v13, v41);
    (*(void (**)(uint64_t (**)(char *, uint64_t), uint64_t))(v93 + 8))(v50, v54);
    v108 = v54;
    v109 = v52;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v56 = v99;
    v57 = v97;
    sub_24749D438();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v53, v57);
    v108 = v57;
    v109 = OpaqueTypeConformance2;
    v58 = swift_getOpaqueTypeConformance2();
    v59 = v98;
    v60 = v101;
    sub_24749D420();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v56, v60);
    v62 = v102;
    v61 = v103;
    v63 = v89;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v102, v59, v89);
    (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v105, v62, v63);
    swift_storeEnumTagMultiPayload();
    v108 = v60;
    v109 = v58;
    swift_getOpaqueTypeConformance2();
    sub_24749D3A8();
    return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v62, v63);
  }
  else
  {
    v82 = v31;
    ((void (*)(char *, char *, uint64_t))v31[4])(v33, v29, v30);
    __swift_storeEnumTagSinglePayload((uint64_t)v27, 1, 1, v30);
    sub_24749D18C();
    sub_247497DA4((uint64_t)v27, &qword_2576A9138);
    sub_24749D4F8();
    v65 = v89;
    v66 = v107;
    v67 = v94;
    (*(void (**)(char *, _QWORD, uint64_t))(v107 + 104))(v13, *MEMORY[0x24BEAAB78], v94);
    sub_247497FAC(&qword_2576A9108, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
    v69 = v68;
    v70 = v95;
    v71 = (char *)v16;
    v72 = v90;
    sub_24749D414();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v13, v67);
    (*(void (**)(char *, uint64_t))(v93 + 8))(v71, v72);
    v108 = v72;
    v109 = v69;
    v73 = swift_getOpaqueTypeConformance2();
    v74 = v99;
    v75 = v97;
    sub_24749D438();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v70, v75);
    v108 = v75;
    v109 = v73;
    v76 = swift_getOpaqueTypeConformance2();
    v77 = v98;
    v78 = v101;
    sub_24749D420();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v74, v78);
    v80 = v102;
    v79 = v103;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v102, v77, v65);
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v105, v80, v65);
    swift_storeEnumTagMultiPayload();
    v108 = v78;
    v109 = v76;
    swift_getOpaqueTypeConformance2();
    sub_24749D3A8();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v65);
    return v82[1](v33, v30);
  }
}

void sub_247497138()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = sub_24749D174();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VideoResult();
  sub_24749D210();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    v16 = &qword_2576A8FC8;
    v17 = (uint64_t)v11;
LABEL_5:
    sub_247497DA4(v17, v16);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  sub_24749D528();
  v18 = sub_24749D5E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v16 = &qword_2576A8FD0;
    v17 = (uint64_t)v5;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  v19 = sub_24749D57C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v19);
  sub_24749D5DC();
  sub_247497DA4((uint64_t)v2, &qword_2576A8FC0);
  sub_247497DA4((uint64_t)v9, &qword_2576A8FC8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v5, v18);
}

uint64_t sub_2474973B4@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char v33;
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;

  v36 = a1;
  v39 = a2;
  v2 = sub_24749D498();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24749D510();
  v37 = *(_QWORD *)(v6 - 8);
  v7 = v37;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v36 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  type metadata accessor for VideoResult();
  sub_24749D228();
  sub_24749D51C();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v12, v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
  v15 = sub_24749D4A4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  sub_24749D378();
  sub_24749D4D4();
  sub_24749D390();
  v16 = v55;
  v17 = v56;
  v18 = v57;
  LOBYTE(v5) = v58;
  v20 = v59;
  v19 = v60;
  v21 = sub_24749D3C0();
  sub_24749D360();
  v40 = v15;
  v41 = 0;
  v42 = 1;
  v43 = v16;
  v44 = v17;
  v45 = v18;
  v46 = (char)v5;
  v47 = v20;
  v48 = v19;
  v49 = v21;
  v50 = v22;
  v51 = v23;
  v52 = v24;
  v53 = v25;
  v54 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9178);
  sub_247497DF8(&qword_2576A9180, &qword_2576A9178, (uint64_t (*)(void))sub_247497DD4, MEMORY[0x24BDECC60]);
  v26 = sub_24749D3FC();
  swift_release();
  v27 = v37;
  v28 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v29 = v38;
  v28(v38, v14, v6);
  LOBYTE(v40) = 1;
  v30 = v39;
  v28(v39, v29, v6);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91A8);
  *(_QWORD *)&v30[*(int *)(v31 + 48)] = v26;
  v32 = &v30[*(int *)(v31 + 64)];
  v33 = v40;
  *(_QWORD *)v32 = 0;
  v32[8] = v33;
  v34 = *(void (**)(char *, uint64_t))(v27 + 8);
  swift_retain();
  v34(v14, v6);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v34)(v29, v6);
}

void sub_2474976D8()
{
  sub_2474976F4(&qword_2576A90C8, &qword_2576A90D0, (uint64_t (*)(void))sub_24749776C);
}

void sub_2474976F4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v6 = a3();
    sub_247497FAC(&qword_2576A90E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADAB8], MEMORY[0x24BEADAB0]);
    v8[0] = v6;
    v8[1] = v7;
    atomic_store(MEMORY[0x24957CB4C](MEMORY[0x24BDEF3E0], v5, v8), a1);
  }
  OUTLINED_FUNCTION_6_2();
}

unint64_t sub_24749776C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A90D8;
  if (!qword_2576A90D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A90E0);
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2576A90D8);
  }
  return result;
}

unint64_t sub_2474977B0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_2576A90F0;
  if (!qword_2576A90F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9098);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A90F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9100);
    sub_24749D4EC();
    sub_247497FAC(&qword_2576A9108, (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38], MEMORY[0x24BEADA20]);
    swift_getOpaqueTypeConformance2();
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = v3[0];
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2576A90F0);
  }
  return result;
}

uint64_t sub_2474978A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2474978EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = OUTLINED_FUNCTION_10();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_24749D540();
  OUTLINED_FUNCTION_4_1();
  v4(v3);
  v5 = v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD8);
  OUTLINED_FUNCTION_4_1();
  v6(v5);
  v7 = v3 + *(int *)(v1 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (int *)OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(v9[5]);
  OUTLINED_FUNCTION_0_1(v9[6]);
  OUTLINED_FUNCTION_0_1(v9[7]);
  OUTLINED_FUNCTION_0_1(v9[8]);
  OUTLINED_FUNCTION_0_1(v9[9]);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  OUTLINED_FUNCTION_2_2(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  OUTLINED_FUNCTION_2_2(v11);
  OUTLINED_FUNCTION_0_1(v9[12]);
  return swift_deallocObject();
}

uint64_t sub_247497A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VideoResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_247497A5C()
{
  OUTLINED_FUNCTION_10();
  sub_247497138();
}

uint64_t sub_247497A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247497ACC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_24749D12C();
  v31 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  if (!*(_QWORD *)(a1 + 16))
  {
    v9 = MEMORY[0x24BEE4B08];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9148);
  result = sub_24749D678();
  v9 = result;
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v9;
  }
  v10 = 0;
  v30 = result + 56;
  v11 = *(unsigned __int8 *)(v31 + 80);
  v26 = a1;
  v27 = a1 + ((v11 + 32) & ~v11);
  while (v10 < *(_QWORD *)(a1 + 16))
  {
    v12 = *(_QWORD *)(v31 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v13(v7, v27 + v12 * v10, v2);
    sub_247497FAC(&qword_2576A9150, (uint64_t (*)(uint64_t))MEMORY[0x24BEAA9A0], MEMORY[0x24BEAA9B0]);
    v14 = sub_24749D624();
    v15 = -1 << *(_BYTE *)(v9 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
    v19 = 1 << v16;
    if (((1 << v16) & v18) != 0)
    {
      v29 = v10;
      v20 = ~v15;
      while (1)
      {
        v13(v5, *(_QWORD *)(v9 + 48) + v16 * v12, v2);
        sub_247497FAC(&qword_2576A9158, (uint64_t (*)(uint64_t))MEMORY[0x24BEAA9A0], MEMORY[0x24BEAA9B8]);
        v21 = sub_24749D630();
        v22 = *(void (**)(char *, uint64_t))(v31 + 8);
        v22(v5, v2);
        if ((v21 & 1) != 0)
          break;
        v16 = (v16 + 1) & v20;
        v17 = v16 >> 6;
        v18 = *(_QWORD *)(v30 + 8 * (v16 >> 6));
        v19 = 1 << v16;
        if ((v18 & (1 << v16)) == 0)
        {
          a1 = v26;
          v10 = v29;
          goto LABEL_10;
        }
      }
      result = ((uint64_t (*)(char *, uint64_t))v22)(v7, v2);
      a1 = v26;
      v10 = v29;
    }
    else
    {
LABEL_10:
      *(_QWORD *)(v30 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32))(*(_QWORD *)(v9 + 48) + v16 * v12, v7, v2);
      v23 = *(_QWORD *)(v9 + 16);
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_18;
      *(_QWORD *)(v9 + 16) = v25;
    }
    if (++v10 == v28)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

void sub_247497D64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

void sub_247497DA4(uint64_t a1, uint64_t *a2)
{
  void (*v3)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_1();
  v3(a1);
  OUTLINED_FUNCTION_5();
}

void sub_247497DD4()
{
  sub_247497DF8(&qword_2576A9188, &qword_2576A9190, (uint64_t (*)(void))sub_247497E54, MEMORY[0x24BDEBEE0]);
}

void sub_247497DF8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  _QWORD v8[2];

  if (!*a1)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v8[0] = a3();
    v8[1] = a4;
    atomic_store(MEMORY[0x24957CB4C](MEMORY[0x24BDED308], v7, v8), a1);
  }
  OUTLINED_FUNCTION_6_2();
}

unint64_t sub_247497E54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576A9198;
  if (!qword_2576A9198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A91A0);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576A9198);
  }
  return result;
}

unint64_t sub_247497EBC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_2576A91B0;
  if (!qword_2576A91B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A90B8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A90A8);
    sub_24749D600();
    sub_247497FAC(&qword_2576A9110, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE228], MEMORY[0x24BEAE208]);
    v5[2] = v2;
    v5[3] = swift_getOpaqueTypeConformance2();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_247497FAC(&qword_2576A91B8, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v5[0] = OpaqueTypeConformance2;
    v5[1] = v4;
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2576A91B0);
  }
  return result;
}

void sub_247497FAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24957CB4C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_24749D264();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return type metadata accessor for VideoResult();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t DisambiguationList.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v1 = OUTLINED_FUNCTION_2_3();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_247499A2C(v0, (uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_247499BD4((uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91D0);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A91D8);
  sub_247493E34(&qword_2576A91E0, &qword_2576A91D8);
  v9[0] = v6;
  v9[1] = v7;
  swift_getOpaqueTypeConformance2();
  return sub_24749D558();
}

uint64_t type metadata accessor for DisambiguationList()
{
  uint64_t result;

  result = qword_2576A9240;
  if (!qword_2576A9240)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2474981B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17[1] = a2;
  v3 = type metadata accessor for DisambiguationList();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = sub_24749D5D0();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91D8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24957C66C](v9);
  v23 = MEMORY[0x24BEE0D00];
  v24 = MEMORY[0x24BEAE5B8];
  v21 = v12;
  v22 = v13;
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  sub_24749D5C4();
  sub_247499A2C(a1, (uint64_t)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = swift_allocObject();
  sub_247499BD4((uint64_t)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9288);
  sub_24749985C();
  sub_24749D5A0();
  sub_24749D2F4();
  sub_247499018();
  sub_247493E34(&qword_2576A91E0, &qword_2576A91D8);
  sub_24749D480();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_2474983B8()
{
  return sub_247499820((uint64_t (*)(uint64_t))sub_2474981B0);
}

uint64_t sub_2474983C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2474983D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];

  v2 = type metadata accessor for DisambiguationList();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v10[3] = sub_24749D2E8();
  sub_247499A2C(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_247499BD4((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92B0);
  sub_247493E34(&qword_2576A92B8, &qword_2576A92A8);
  v7 = sub_24749D5B8();
  sub_247493E68(&qword_2576A9298, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  sub_247493E68(&qword_2576A92C0, (void (*)(uint64_t))MEMORY[0x24BEA8FC0]);
  return sub_24749D4C8();
}

uint64_t sub_24749857C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v40 = a2;
  v46 = a3;
  v4 = sub_24749D348();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v43 = v5;
  v45 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DisambiguationList();
  v35 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v36 = v7;
  v38 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92C8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_24749D5B8();
  v41 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92B0);
  v37 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24749D318();
  v17 = MEMORY[0x24BEE0D00];
  v18 = MEMORY[0x24BEAE5B8];
  v73 = MEMORY[0x24BEE0D00];
  v74 = MEMORY[0x24BEAE5B8];
  if (v16)
    v19 = v15;
  else
    v19 = 0;
  v20 = 0xE000000000000000;
  if (v16)
    v20 = v16;
  v71 = v19;
  v72 = v20;
  v21 = sub_24749D330();
  if (v22)
  {
    *((_QWORD *)&v69 + 1) = v17;
    v70 = v18;
    *(_QWORD *)&v68 = v21;
    *((_QWORD *)&v68 + 1) = v22;
  }
  else
  {
    v70 = 0;
    v68 = 0u;
    v69 = 0u;
  }
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v61 = 0;
  v59 = 0u;
  v60 = 0u;
  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v55 = 0;
  v53 = 0u;
  v54 = 0u;
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v23 = v40;
  sub_247498940(a1, (uint64_t)v10);
  sub_247493E34(&qword_2576A92D0, &qword_2576A92C8);
  v24 = sub_24749D3FC();
  sub_2474931A8((uint64_t)v10, &qword_2576A92C8);
  v48 = MEMORY[0x24BDF4780];
  v49 = MEMORY[0x24BEAD938];
  v47 = v24;
  sub_24749D5AC();
  v25 = v38;
  sub_247499A2C(v23, v38, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  v26 = MEMORY[0x24BEA8FC0];
  v27 = (uint64_t)a1;
  v28 = v45;
  sub_247499A2C(v27, v45, (uint64_t (*)(_QWORD))MEMORY[0x24BEA8FC0]);
  v29 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v30 = (v36 + *(unsigned __int8 *)(v42 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v31 = swift_allocObject();
  sub_247499BD4(v25, v31 + v29, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationList);
  sub_247499BD4(v28, v31 + v30, (uint64_t (*)(_QWORD))v26);
  sub_247493E68(&qword_2576A9298, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v32 = v44;
  sub_24749D42C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v32);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v46, v14, v39);
}

void sub_247498940(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  char *v32;
  int EnumTagSinglePayload;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
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
  uint64_t v79;

  v73 = (char *)a2;
  v3 = sub_24749D138();
  v78 = *(_QWORD *)(v3 - 8);
  v79 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v77 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24749D1A4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24749D4EC();
  v70 = *(_QWORD *)(v8 - 8);
  v71 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v76 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9100);
  v68 = *(_QWORD *)(v10 - 8);
  v69 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9138);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v64 - v16;
  v18 = sub_24749D120();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92D8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v64 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v74 = (char *)&v64 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v64 - v31;
  v72 = a1;
  sub_24749D33C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18);
  v75 = v28;
  v66 = v7;
  if (EnumTagSinglePayload == 1)
  {
    v34 = v67;
    sub_2474931A8((uint64_t)v17, &qword_2576A9138);
    v35 = 1;
    v36 = (uint64_t)v73;
    v38 = v69;
    v37 = v70;
    v39 = v71;
    v40 = v68;
  }
  else
  {
    v41 = (unsigned int *)MEMORY[0x24BEAAC20];
    v65 = v19;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v18);
    sub_24749D18C();
    sub_2474931A8((uint64_t)v15, &qword_2576A9138);
    v42 = v76;
    sub_24749D4F8();
    v43 = *v41;
    v45 = v77;
    v44 = v78;
    v46 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 104))(v77, v43, v79);
    sub_247493E68(&qword_2576A9108, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v47 = v67;
    v48 = v71;
    sub_24749D414();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
    v37 = v70;
    (*(void (**)(char *, uint64_t))(v70 + 8))(v42, v48);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
    v40 = v68;
    v34 = v47;
    v49 = v47;
    v38 = v69;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v32, v49, v69);
    v35 = 0;
    v36 = (uint64_t)v73;
    v39 = v48;
  }
  v50 = 1;
  v73 = v32;
  __swift_storeEnumTagSinglePayload((uint64_t)v32, v35, 1, v38);
  sub_24749D30C();
  if (v51)
  {
    sub_24749D198();
    swift_bridgeObjectRelease();
    v52 = v76;
    sub_24749D4F8();
    v53 = *MEMORY[0x24BEAAC20];
    v72 = v25;
    v54 = v40;
    v56 = v78;
    v55 = v79;
    v57 = v37;
    v58 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 104))(v77, v53, v79);
    sub_247493E68(&qword_2576A9108, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    sub_24749D414();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v55);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v52, v39);
    v59 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
    v25 = v72;
    v60 = (uint64_t)v74;
    v59(v74, v34, v38);
    v50 = 0;
  }
  else
  {
    v60 = (uint64_t)v74;
  }
  __swift_storeEnumTagSinglePayload(v60, v50, 1, v38);
  v61 = (uint64_t)v73;
  v62 = (uint64_t)v75;
  sub_247499C5C((uint64_t)v73, (uint64_t)v75);
  sub_247499C5C(v60, (uint64_t)v25);
  sub_247499C5C(v62, v36);
  v63 = __swift_instantiateConcreteTypeFromMangledName(qword_2576A92E0);
  sub_247499C5C((uint64_t)v25, v36 + *(int *)(v63 + 48));
  sub_2474931A8(v60, &qword_2576A92D8);
  sub_2474931A8(v61, &qword_2576A92D8);
  sub_2474931A8((uint64_t)v25, &qword_2576A92D8);
  sub_2474931A8(v62, &qword_2576A92D8);
}

void sub_247498E90()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24749D528();
  v9 = sub_24749D5E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_2474931A8((uint64_t)v8, &qword_2576A8FD0);
  }
  else
  {
    sub_24749D324();
    v10 = sub_24749D57C();
    __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v10);
    sub_24749D5DC();
    sub_2474931A8((uint64_t)v2, &qword_2576A8FC0);
    sub_2474931A8((uint64_t)v5, &qword_2576A8FC8);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
}

uint64_t sub_247499018()
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_2474998FC();
  sub_24749D66C();
  sub_24749D66C();
  if (v5 == v3 && v6 == v4)
    v1 = 1;
  else
    v1 = sub_24749D684();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationList(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
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
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = sub_24749D300();
    v13 = *(int *)(v12 + 20);
    v14 = &v9[v13];
    v15 = &v10[v13];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = *(int *)(v12 + 24);
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for DisambiguationList(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = sub_24749D300();
  v8 = v5 + *(int *)(v7 + 20);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v5 + *(int *)(v7 + 24);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = sub_24749D300();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = *(int *)(v11 + 24);
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = sub_24749D300();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = *(int *)(v11 + 24);
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = sub_24749D300();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = *(int *)(v11 + 24);
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for DisambiguationList(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = sub_24749D300();
  v12 = *(int *)(v11 + 20);
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = *(int *)(v11 + 24);
  v17 = v8 + v16;
  v18 = v9 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationList()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24749968C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_7_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_6_3();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for DisambiguationList()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2474996F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_7_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_6_3();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t sub_247499760()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24749D540();
  if (v1 <= 0x3F)
  {
    result = sub_24749D300();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void sub_2474997E4()
{
  sub_247493E34(&qword_2576A9278, &qword_2576A9280);
}

uint64_t sub_247499814()
{
  return sub_247499820(sub_2474983D4);
}

uint64_t sub_247499820(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12();
  return a1(v1 + v2);
}

unint64_t sub_24749985C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_2576A9290;
  if (!qword_2576A9290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9288);
    v2 = sub_24749D5B8();
    sub_247493E68(&qword_2576A9298, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
    v4[1] = v2;
    v4[2] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDF4A08], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2576A9290);
  }
  return result;
}

unint64_t sub_2474998FC()
{
  unint64_t result;

  result = qword_2576A92A0;
  if (!qword_2576A92A0)
  {
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEA8FF0], MEMORY[0x24BEA8FE8]);
    atomic_store(result, (unint64_t *)&qword_2576A92A0);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2_3();
  v0 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_1(v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  OUTLINED_FUNCTION_0(v1);
  OUTLINED_FUNCTION_6_3();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  OUTLINED_FUNCTION_1_1(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  OUTLINED_FUNCTION_0(v3);
  return swift_deallocObject();
}

uint64_t sub_2474999F0@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12();
  return sub_24749857C(a1, v2 + v5, a2);
}

void sub_247499A2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_5_2(a1, a2, a3);
  OUTLINED_FUNCTION_9_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_247499A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = OUTLINED_FUNCTION_2_3();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = (int *)sub_24749D348();
  v6 = *(unsigned __int8 *)(*((_QWORD *)v5 - 1) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_1(v8);
  v9 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  OUTLINED_FUNCTION_8_1();
  v10 = v9 + *(int *)(OUTLINED_FUNCTION_6_3() + 20);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A91C8);
  OUTLINED_FUNCTION_3_1(v12);
  OUTLINED_FUNCTION_8_1();
  v13 = v0 + v7 + v5[5];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  OUTLINED_FUNCTION_11_0(v5[6]);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  OUTLINED_FUNCTION_1_1(v15);
  OUTLINED_FUNCTION_11_0(v5[8]);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  OUTLINED_FUNCTION_0(v16);
  return swift_deallocObject();
}

void sub_247499BD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_5_2(a1, a2, a3);
  OUTLINED_FUNCTION_9_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

void sub_247499C00()
{
  OUTLINED_FUNCTION_2_3();
  sub_24749D348();
  sub_247498E90();
}

uint64_t sub_247499C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for DisambiguationList();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_24749D300();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_24749D540();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t *sub_247499D2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(sub_24749D288() + 20);
    v13 = &v9[v12];
    v14 = &v10[v12];
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_247499E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v5 + *(int *)(sub_24749D288() + 20);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_247499EA0(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(sub_24749D288() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_247499F58(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(sub_24749D288() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_24749A010(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(sub_24749D288() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_24749A0C8(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(sub_24749D288() + 20);
  v12 = v8 + v11;
  v13 = v9 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_24749A180()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24749A18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_3_2();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_24749A1E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24749A1F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_3_2();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for StandardButtonView()
{
  uint64_t result;

  result = qword_2576A9340;
  if (!qword_2576A9340)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24749A288()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24749D540();
  if (v1 <= 0x3F)
  {
    result = sub_24749D288();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24749A30C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24749A31C@<X0>(uint64_t a1@<X8>)
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
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v25 = a1;
  v2 = sub_24749D54C();
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1();
  v5 = v4 - v3;
  v6 = OUTLINED_FUNCTION_4_2();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F00);
  v22 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1();
  v12 = v11 - v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9378);
  v23 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1();
  v16 = v15 - v14;
  sub_24749A7E0(v1, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  sub_24749A8D0((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  v26 = v1;
  sub_24749D4BC();
  sub_24749D3B4();
  v19 = sub_247494478();
  v20 = sub_24749A944();
  sub_24749D468();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v9);
  v27 = v9;
  v28 = v2;
  v29 = v19;
  v30 = v20;
  swift_getOpaqueTypeConformance2();
  sub_24749D480();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v16, v13);
}

uint64_t sub_24749A54C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24749D528();
  v9 = sub_24749D5E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
    return sub_24749A994((uint64_t)v8, &qword_2576A8FD0);
  type metadata accessor for StandardButtonView();
  sub_24749D270();
  v11 = sub_24749D174();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v11);
  v12 = sub_24749D57C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v12);
  sub_24749D5DC();
  sub_24749A994((uint64_t)v2, &qword_2576A8FC0);
  sub_24749A994((uint64_t)v5, &qword_2576A8FC8);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_24749A6F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  type metadata accessor for StandardButtonView();
  MEMORY[0x24957C60C]();
  sub_247495038();
  v2 = sub_24749D3F0();
  v4 = v3;
  v6 = v5 & 1;
  sub_24749D3CC();
  v7 = sub_24749D3E4();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_24749A984(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_24749A7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandardButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24749A824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_2() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  OUTLINED_FUNCTION_0_2(v4);
  OUTLINED_FUNCTION_3_2();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8F10);
  OUTLINED_FUNCTION_0_2(v5);
  return swift_deallocObject();
}

uint64_t sub_24749A8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandardButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24749A914()
{
  OUTLINED_FUNCTION_4_2();
  return sub_24749A54C();
}

uint64_t sub_24749A93C@<X0>(uint64_t a1@<X8>)
{
  return sub_24749A6F8(a1);
}

unint64_t sub_24749A944()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A9380;
  if (!qword_2576A9380)
  {
    v1 = sub_24749D54C();
    result = MEMORY[0x24957CB4C](MEMORY[0x24BEADB70], v1);
    atomic_store(result, (unint64_t *)&qword_2576A9380);
  }
  return result;
}

uint64_t sub_24749A984(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_24749A994(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_2(v3);
  return a1;
}

uint64_t sub_24749A9C0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9378);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A8F00);
  sub_24749D54C();
  sub_247494478();
  sub_24749A944();
  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_3();
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_24749D288();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return type metadata accessor for StandardButtonView();
}

uint64_t *sub_24749AA68(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24749D540();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = (int *)sub_24749D204();
    v13 = v12[5];
    v14 = &v9[v13];
    v15 = &v10[v13];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v9[v12[6]], &v10[v12[6]], v16);
    v18 = v12[7];
    v19 = &v9[v18];
    v20 = &v10[v18];
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = v12[8];
    v23 = &v9[v22];
    v24 = &v10[v22];
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  }
  return a1;
}

uint64_t sub_24749ABD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (int *)sub_24749D204();
  v8 = v5 + v7[5];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v5 + v7[6], v9);
  v11 = v5 + v7[7];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = v5 + v7[8];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

uint64_t sub_24749ACE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = (int *)sub_24749D204();
  v12 = v11[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  v17 = v11[7];
  v18 = v8 + v17;
  v19 = v9 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = v11[8];
  v22 = v8 + v21;
  v23 = v9 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  return a1;
}

uint64_t sub_24749AE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = (int *)sub_24749D204();
  v12 = v11[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  v17 = v11[7];
  v18 = v8 + v17;
  v19 = v9 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = v11[8];
  v22 = v8 + v21;
  v23 = v9 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  return a1;
}

uint64_t sub_24749AF68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = (int *)sub_24749D204();
  v12 = v11[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  v17 = v11[7];
  v18 = v8 + v17;
  v19 = v9 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = v11[8];
  v22 = v8 + v21;
  v23 = v9 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  return a1;
}

uint64_t sub_24749B0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_24749D540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = (int *)sub_24749D204();
  v12 = v11[5];
  v13 = v8 + v12;
  v14 = v9 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(v8 + v11[6], v9 + v11[6], v15);
  v17 = v11[7];
  v18 = v8 + v17;
  v19 = v9 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = v11[8];
  v22 = v8 + v21;
  v23 = v9 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t sub_24749B1F0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24749B1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7_1();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_24749B254()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24749B260(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_7_1();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for PersonVideoFactListView()
{
  uint64_t result;

  result = qword_2576A93E0;
  if (!qword_2576A93E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24749B2F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24749D540();
  if (v1 <= 0x3F)
  {
    result = sub_24749D204();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24749B37C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24749B38C@<X0>(uint64_t a1@<X8>)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];

  v2 = v1;
  v29[1] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8DC0);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_1_2();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9418);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  v14 = v13 - v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9420);
  v29[0] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1();
  v18 = v17 - v16;
  sub_24749312C(v2, (uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for PersonVideoFactListView);
  v19 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = swift_allocObject();
  sub_24749C0A0((uint64_t)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9428);
  sub_247493E34(&qword_2576A9430, &qword_2576A9428);
  sub_24749D558();
  sub_24749D564();
  v21 = OUTLINED_FUNCTION_4();
  v22(v21);
  v23 = sub_24749D570();
  v24 = OUTLINED_FUNCTION_4();
  v25(v24);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v23);
  sub_247493E34(&qword_2576A9438, &qword_2576A9418);
  v27 = v26;
  MEMORY[0x24957C7D4](v6, v10, v26);
  sub_247497DA4(v6, &qword_2576A8DC0);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  v29[2] = v10;
  v29[3] = v27;
  OUTLINED_FUNCTION_4_0();
  sub_24749D480();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v29[0] + 8))(v18, v15);
}

void sub_24749B618(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
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
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v51 = a2;
  v49 = type metadata accessor for ResultsList();
  v3 = MEMORY[0x24BDAC7A8](v49);
  v50 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v39 - v5;
  v6 = type metadata accessor for PersonVideoFactListView();
  v42 = *(_QWORD *)(v6 - 8);
  v43 = *(_QWORD *)(v42 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A92D8);
  MEMORY[0x24BDAC7A8](v39);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24749D600();
  v45 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A90A8);
  v47 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9440);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v44 = (uint64_t)&v39 - v19;
  v41 = a1 + *(int *)(v6 + 20);
  v20 = sub_24749D1D4();
  v21 = MEMORY[0x24BEE0D00];
  v22 = MEMORY[0x24BEAE5B8];
  v67 = MEMORY[0x24BEE0D00];
  v68 = MEMORY[0x24BEAE5B8];
  v65 = v20;
  v66 = v23;
  v24 = sub_24749D1EC();
  v63 = v21;
  v64 = v22;
  v61 = v24;
  v62 = v25;
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  sub_24749BB00((uint64_t)v9);
  sub_24749C10C();
  v26 = sub_24749D3FC();
  sub_247497DA4((uint64_t)v9, &qword_2576A92D8);
  v54 = MEMORY[0x24BEAD938];
  v53 = MEMORY[0x24BDF4780];
  v52 = v26;
  sub_24749D5F4();
  v27 = a1;
  v28 = v40;
  sub_24749312C(v27, v40, (uint64_t (*)(_QWORD))type metadata accessor for PersonVideoFactListView);
  v29 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v30 = swift_allocObject();
  sub_24749C0A0(v28, v30 + v29);
  sub_247493E68(&qword_2576A9110, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v32 = v31;
  sub_24749D42C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v10);
  v65 = v10;
  v66 = v32;
  swift_getOpaqueTypeConformance2();
  v33 = v46;
  sub_24749D48C();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v33);
  v34 = v44;
  sub_24749C2D4((uint64_t)v18, v44);
  v35 = (uint64_t)v48;
  sub_24749D1C8();
  _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
  sub_24749C31C(v34, (uint64_t)v18);
  v36 = v50;
  sub_24749312C(v35, v50, (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  v37 = v51;
  sub_24749C31C((uint64_t)v18, v51);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9450);
  sub_24749312C(v36, v37 + *(int *)(v38 + 48), (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  sub_24749316C(v35);
  sub_247497DA4(v34, &qword_2576A9440);
  sub_24749316C(v36);
  sub_247497DA4((uint64_t)v18, &qword_2576A9440);
}

uint64_t sub_24749BB00@<X0>(uint64_t a1@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = a1;
  v1 = sub_24749D138();
  v32 = *(_QWORD *)(v1 - 8);
  v33 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v31 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24749D1A4();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_24749D4EC();
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9100);
  v29 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9138);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  v15 = sub_24749D120();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersonVideoFactListView();
  sub_24749D1F8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_247497DA4((uint64_t)v14, &qword_2576A9138);
    v19 = 1;
    v21 = v34;
    v20 = v35;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v15);
    sub_24749D18C();
    sub_247497DA4((uint64_t)v12, &qword_2576A9138);
    sub_24749D4F8();
    v23 = v31;
    v22 = v32;
    v24 = v33;
    (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v31, *MEMORY[0x24BEAAAD8], v33);
    sub_247493E68(&qword_2576A9108, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    sub_24749D414();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v26 = v34;
    v25 = v35;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v35, v8, v34);
    v19 = 0;
    v20 = v25;
    v21 = v26;
  }
  return __swift_storeEnumTagSinglePayload(v20, v19, 1, v21);
}

void sub_24749BE1C()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FD0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FC8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = sub_24749D174();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersonVideoFactListView();
  sub_24749D1E0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    v16 = &qword_2576A8FC8;
    v17 = (uint64_t)v11;
LABEL_5:
    sub_247497DA4(v17, v16);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  sub_24749D528();
  v18 = sub_24749D5E8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v18) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v16 = &qword_2576A8FD0;
    v17 = (uint64_t)v5;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v12);
  v19 = sub_24749D57C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v19);
  sub_24749D5DC();
  sub_247497DA4((uint64_t)v2, &qword_2576A8FC0);
  sub_247497DA4((uint64_t)v9, &qword_2576A8FC8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v5, v18);
}

uint64_t sub_24749C0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PersonVideoFactListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24749C0E4(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_1_2();
  v3 = OUTLINED_FUNCTION_6_4(v2);
  sub_24749B618(v3, a1);
}

unint64_t sub_24749C10C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_2576A9448;
  if (!qword_2576A9448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A92D8);
    v2 = sub_24749D4EC();
    sub_247493E68(&qword_2576A9108, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v4[1] = v2;
    v4[2] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDF5578], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2576A9448);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;

  v1 = OUTLINED_FUNCTION_1_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_24749D540();
  OUTLINED_FUNCTION_4_1();
  v4(v3);
  v5 = v3 + *(int *)(v1 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D20);
  OUTLINED_FUNCTION_0(v6);
  v7 = (int *)OUTLINED_FUNCTION_7_1();
  v8 = v5 + v7[5];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8D28);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v5 + v7[6], v9);
  v11 = v5 + v7[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FE8);
  OUTLINED_FUNCTION_4_1();
  v12(v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A8FF0);
  OUTLINED_FUNCTION_0(v13);
  return swift_deallocObject();
}

void sub_24749C2BC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6_4(v0);
  sub_24749BE1C();
}

uint64_t sub_24749C2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24749C31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24749C364()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9420);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A9418);
  sub_247493E34(&qword_2576A9438, &qword_2576A9418);
  OUTLINED_FUNCTION_4_0();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return type metadata accessor for PersonVideoFactListView();
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_24749D204();
}

void static SnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
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
  uint64_t (*v16)(_QWORD);
  char *v17;

  type metadata accessor for PersonVideoFactListView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  sub_24749D204();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  type metadata accessor for FilteredListView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  sub_24749D2C4();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  type metadata accessor for StandardButtonView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  sub_24749D288();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_5_3();
  sub_24749D2D0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_1();
  type metadata accessor for DisambiguationList();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1();
  sub_24749D300();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1();
  type metadata accessor for ResultsList();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1();
  sub_24749D2A0();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1();
  sub_24749D354();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1();
  sub_247499A2C(a1, v15 - v14, v16);
  v17 = (char *)sub_24749C650 + 4 * byte_24749DC50[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_24749C650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;

  v4 = MEMORY[0x24BEA8F10];
  OUTLINED_FUNCTION_4_3(v0);
  OUTLINED_FUNCTION_3_3(*(int *)(v3 + 20));
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_10_0(&qword_2576A9480, v5, (uint64_t)&unk_24749D904);
  v6 = sub_24749D3FC();
  sub_24749C8AC(v1, (uint64_t (*)(_QWORD))type metadata accessor for ResultsList);
  sub_24749C8AC(v2, (uint64_t (*)(_QWORD))v4);
  return v6;
}

void sub_24749C8AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

ValueMetadata *type metadata accessor for SnippetProvider()
{
  return &type metadata for SnippetProvider;
}

void OUTLINED_FUNCTION_3_3(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t v3;

  sub_247499A2C(v3, v1 + a1, v2);
}

void OUTLINED_FUNCTION_4_3(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_247499BD4(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF959SnippetUI06ActionG0Vvpfi_0();
}

void OUTLINED_FUNCTION_10_0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_247497FAC(a1, v3, a3);
}

uint64_t sub_24749C93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a2;
  if (a2)
  {
    v8 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v9 = objc_msgSend(v8, sel_VideosUICoreBundle);
    if (a4)
    {
      swift_bridgeObjectRetain();
      v10 = sub_24749D058(v9, (SEL *)&selRef_bundleIdentifier);
      if (v11)
      {
        v12 = HIBYTE(v11) & 0xF;
        if ((v11 & 0x2000000000000000) == 0)
          v12 = v10 & 0xFFFFFFFFFFFFLL;
        if (v12)
        {
          v13 = objc_allocWithZone(MEMORY[0x24BEBFEF0]);
          swift_bridgeObjectRetain();
          v14 = sub_24749CEC4(a3, a4, a1, v4, 0, 0, 0);
          v15 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
          v16 = objc_msgSend(v15, sel_badgeForContentRating_drawUnknownRatingBadge_, v14, 0);
          if (v16)
          {
            v17 = v16;
            v18 = (id)MEMORY[0x24957CA20]();
            if (v18)
            {
              v19 = v18;
              swift_bridgeObjectRelease();
              sub_24749D648();

              sub_24749D0AC();
              sub_24749CE64();
              v4 = sub_24749D4B0();

              return v4;
            }
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9488);
            v25 = OUTLINED_FUNCTION_2_4();
            *(_OWORD *)(v25 + 16) = xmmword_24749DA00;
            *(_QWORD *)(v25 + 64) = OUTLINED_FUNCTION_3_4(v25, MEMORY[0x24BEE0D00]);
            *(_QWORD *)(v25 + 32) = a1;
            *(_QWORD *)(v25 + 40) = v4;
            OUTLINED_FUNCTION_0_4();
            OUTLINED_FUNCTION_1_3();

          }
          else
          {
            swift_bridgeObjectRelease();
            v22 = sub_24749CC9C(v14);
            if (v22)
            {
              v23 = v22;
              v24 = objc_msgSend(v15, sel_badgeForContentRating_drawUnknownRatingBadge_, v22, 0);

            }
            else
            {
              v24 = 0;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9488);
            v26 = OUTLINED_FUNCTION_2_4();
            *(_OWORD *)(v26 + 16) = xmmword_24749DA00;
            *(_QWORD *)(v26 + 64) = OUTLINED_FUNCTION_3_4(v26, MEMORY[0x24BEE0D00]);
            *(_QWORD *)(v26 + 32) = a1;
            *(_QWORD *)(v26 + 40) = v4;
            OUTLINED_FUNCTION_0_4();
            OUTLINED_FUNCTION_1_3();

          }
          return 0;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A9488);
    v20 = OUTLINED_FUNCTION_2_4();
    *(_OWORD *)(v20 + 16) = xmmword_24749DA00;
    *(_QWORD *)(v20 + 64) = OUTLINED_FUNCTION_3_4(v20, MEMORY[0x24BEE0D00]);
    *(_QWORD *)(v20 + 32) = a1;
    *(_QWORD *)(v20 + 40) = v4;
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_1_3();
    return 0;
  }
  return v4;
}

unint64_t sub_24749CC60()
{
  unint64_t result;

  result = qword_2576A9490;
  if (!qword_2576A9490)
  {
    result = MEMORY[0x24957CB4C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A9490);
  }
  return result;
}

id sub_24749CC9C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v14;
  uint64_t v15;

  sub_24749D058(a1, (SEL *)&selRef_ratingLabel);
  if (!v2)
    return 0;
  v3 = sub_24749D660();
  v5 = v4;
  swift_bridgeObjectRelease();
  v6 = v3 == 6369841 && v5 == 0xE300000000000000;
  if (v6 || (sub_24749D684() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (objc_msgSend(a1, sel_ratingSystem) == (id)134)
    {
      v7 = objc_msgSend(a1, sel_rank);
      v8 = sub_24749D058(a1, (SEL *)&selRef_ratingDescription);
      v10 = v9;
      objc_allocWithZone(MEMORY[0x24BEBFEF0]);
      v11 = 12849;
      return sub_24749CF98(134, v11, 0xE200000000000000, (uint64_t)v7, v8, v10);
    }
  }
  else
  {
    if (v3 == 3682674 && v5 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = sub_24749D684();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
        return 0;
    }
    if (objc_msgSend(a1, sel_ratingSystem) == (id)134)
    {
      v7 = objc_msgSend(a1, sel_rank);
      v8 = sub_24749D058(a1, (SEL *)&selRef_ratingDescription);
      v10 = v15;
      objc_allocWithZone(MEMORY[0x24BEBFEF0]);
      v11 = 14385;
      return sub_24749CF98(134, v11, 0xE200000000000000, (uint64_t)v7, v8, v10);
    }
  }
  return 0;
}

id sub_24749CE64()
{
  void *v0;
  id v1;

  v0 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v0);

  return v1;
}

id sub_24749CEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v11 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v12 = 0;
    if (a7)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
  if (!a7)
    goto LABEL_5;
LABEL_3:
  v13 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
LABEL_6:
  v14 = objc_msgSend(v7, sel_initWithRatingSystemString_ratingLabel_rank_ratingDescription_, v11, v12, a5, v13);

  return v14;
}

id sub_24749CF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v10;
  void *v11;
  id v12;

  if (!a3)
  {
    v10 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v11 = (void *)sub_24749D63C();
  swift_bridgeObjectRelease();
LABEL_6:
  v12 = objc_msgSend(v6, sel_initWithRatingSystem_ratingLabel_rank_ratingDescription_, a1, v10, a4, v11);

  return v12;
}

uint64_t sub_24749D058(void *a1, SEL *a2)
{
  uint64_t v2;

  if (!objc_msgSend(a1, *a2))
    return 0;
  sub_24749D648();
  OUTLINED_FUNCTION_1_3();
  return v2;
}

unint64_t sub_24749D0AC()
{
  unint64_t result;

  result = qword_2576A9498;
  if (!qword_2576A9498)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576A9498);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_24749D654();
}

void OUTLINED_FUNCTION_1_3()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_3_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a1 + 56) = a2;
  return sub_24749CC60();
}

uint64_t sub_24749D120()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24749D12C()
{
  return MEMORY[0x24BEAA9A0]();
}

uint64_t sub_24749D138()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_24749D144()
{
  return MEMORY[0x24BEAACB8]();
}

uint64_t sub_24749D150()
{
  return MEMORY[0x24BEAAE60]();
}

uint64_t sub_24749D15C()
{
  return MEMORY[0x24BEAAFA8]();
}

uint64_t sub_24749D168()
{
  return MEMORY[0x24BEAB090]();
}

uint64_t sub_24749D174()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_24749D180()
{
  return MEMORY[0x24BEACF00]();
}

uint64_t sub_24749D18C()
{
  return MEMORY[0x24BEAD2B8]();
}

uint64_t sub_24749D198()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_24749D1A4()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_24749D1B0()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_24749D1BC()
{
  return MEMORY[0x24BEAD488]();
}

uint64_t sub_24749D1C8()
{
  return MEMORY[0x24BEA8E60]();
}

uint64_t sub_24749D1D4()
{
  return MEMORY[0x24BEA8E68]();
}

uint64_t sub_24749D1E0()
{
  return MEMORY[0x24BEA8E70]();
}

uint64_t sub_24749D1EC()
{
  return MEMORY[0x24BEA8E78]();
}

uint64_t sub_24749D1F8()
{
  return MEMORY[0x24BEA8E80]();
}

uint64_t sub_24749D204()
{
  return MEMORY[0x24BEA8E88]();
}

uint64_t sub_24749D210()
{
  return MEMORY[0x24BEA8E98]();
}

uint64_t sub_24749D21C()
{
  return MEMORY[0x24BEA8EA0]();
}

uint64_t sub_24749D228()
{
  return MEMORY[0x24BEA8EA8]();
}

uint64_t sub_24749D234()
{
  return MEMORY[0x24BEA8EB0]();
}

uint64_t sub_24749D240()
{
  return MEMORY[0x24BEA8EB8]();
}

uint64_t sub_24749D24C()
{
  return MEMORY[0x24BEA8EC0]();
}

uint64_t sub_24749D258()
{
  return MEMORY[0x24BEA8EC8]();
}

uint64_t sub_24749D264()
{
  return MEMORY[0x24BEA8ED0]();
}

uint64_t sub_24749D270()
{
  return MEMORY[0x24BEA8EE8]();
}

uint64_t sub_24749D27C()
{
  return MEMORY[0x24BEA8EF0]();
}

uint64_t sub_24749D288()
{
  return MEMORY[0x24BEA8EF8]();
}

uint64_t sub_24749D294()
{
  return MEMORY[0x24BEA8F08]();
}

uint64_t sub_24749D2A0()
{
  return MEMORY[0x24BEA8F10]();
}

uint64_t sub_24749D2AC()
{
  return MEMORY[0x24BEA8F20]();
}

uint64_t sub_24749D2B8()
{
  return MEMORY[0x24BEA8F28]();
}

uint64_t sub_24749D2C4()
{
  return MEMORY[0x24BEA8F30]();
}

uint64_t sub_24749D2D0()
{
  return MEMORY[0x24BEA8F60]();
}

uint64_t sub_24749D2DC()
{
  return MEMORY[0x24BEA8F70]();
}

uint64_t sub_24749D2E8()
{
  return MEMORY[0x24BEA8F78]();
}

uint64_t sub_24749D2F4()
{
  return MEMORY[0x24BEA8F80]();
}

uint64_t sub_24749D300()
{
  return MEMORY[0x24BEA8F88]();
}

uint64_t sub_24749D30C()
{
  return MEMORY[0x24BEA8F98]();
}

uint64_t sub_24749D318()
{
  return MEMORY[0x24BEA8FA0]();
}

uint64_t sub_24749D324()
{
  return MEMORY[0x24BEA8FA8]();
}

uint64_t sub_24749D330()
{
  return MEMORY[0x24BEA8FB0]();
}

uint64_t sub_24749D33C()
{
  return MEMORY[0x24BEA8FB8]();
}

uint64_t sub_24749D348()
{
  return MEMORY[0x24BEA8FC0]();
}

uint64_t sub_24749D354()
{
  return MEMORY[0x24BEA8FD8]();
}

uint64_t sub_24749D360()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_24749D36C()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_24749D378()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_24749D384()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_24749D390()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_24749D39C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_24749D3A8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_24749D3B4()
{
  return MEMORY[0x24BEAD6A0]();
}

uint64_t sub_24749D3C0()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_24749D3CC()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_24749D3D8()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_24749D3E4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_24749D3F0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24749D3FC()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_24749D408()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_24749D414()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_24749D420()
{
  return MEMORY[0x24BEAD7A0]();
}

uint64_t sub_24749D42C()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_24749D438()
{
  return MEMORY[0x24BEAD830]();
}

uint64_t sub_24749D444()
{
  return MEMORY[0x24BEAD840]();
}

uint64_t sub_24749D450()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24749D45C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24749D468()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_24749D474()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24749D480()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_24749D48C()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_24749D498()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_24749D4A4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_24749D4B0()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_24749D4BC()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_24749D4C8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_24749D4D4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_24749D4E0()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_24749D4EC()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_24749D4F8()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_24749D504()
{
  return MEMORY[0x24BEADA68]();
}

uint64_t sub_24749D510()
{
  return MEMORY[0x24BEADAB8]();
}

uint64_t sub_24749D51C()
{
  return MEMORY[0x24BEADAC8]();
}

uint64_t sub_24749D528()
{
  return MEMORY[0x24BEADAD8]();
}

uint64_t _s20SiriVideoUIFramework16ConfirmationViewV14_actionHandler33_19ADDAB092E0F06738070D2C59FBEF95LL9SnippetUI06ActionG0Vvpfi_0()
{
  return MEMORY[0x24BEADAF8]();
}

uint64_t sub_24749D540()
{
  return MEMORY[0x24BEADB08]();
}

uint64_t sub_24749D54C()
{
  return MEMORY[0x24BEADB88]();
}

uint64_t sub_24749D558()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_24749D564()
{
  return MEMORY[0x24BEADC18]();
}

uint64_t sub_24749D570()
{
  return MEMORY[0x24BEADC38]();
}

uint64_t sub_24749D57C()
{
  return MEMORY[0x24BEADCA0]();
}

uint64_t sub_24749D588()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_24749D594()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_24749D5A0()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_24749D5AC()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_24749D5B8()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_24749D5C4()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_24749D5D0()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_24749D5DC()
{
  return MEMORY[0x24BEAE088]();
}

uint64_t sub_24749D5E8()
{
  return MEMORY[0x24BEAE098]();
}

uint64_t sub_24749D5F4()
{
  return MEMORY[0x24BEAE220]();
}

uint64_t sub_24749D600()
{
  return MEMORY[0x24BEAE228]();
}

uint64_t sub_24749D60C()
{
  return MEMORY[0x24BEAE2E0]();
}

uint64_t sub_24749D618()
{
  return MEMORY[0x24BEAE2F0]();
}

uint64_t sub_24749D624()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24749D630()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24749D63C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24749D648()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24749D654()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24749D660()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_24749D66C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24749D678()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24749D684()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t _UIImageIdentityName()
{
  return MEMORY[0x24BEBEA90]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

