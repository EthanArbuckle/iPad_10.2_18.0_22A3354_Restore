uint64_t sub_24615DF7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  return sub_24615DF84(a1, a2, a3 & 1, a4);
}

uint64_t sub_24615DF84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
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
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
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

  v45 = a4;
  v7 = sub_246187058();
  v40 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_6();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v39 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v38 = (uint64_t)&v38 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E400);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v16 = v15 - v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E408);
  v43 = *(_QWORD *)(v17 - 8);
  v44 = v17;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2();
  v21 = v20 - v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E410);
  v41 = *(_QWORD *)(v22 - 8);
  v42 = v22;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_2();
  v26 = v25 - v24;
  *(_QWORD *)v16 = sub_246187430();
  *(_QWORD *)(v16 + 8) = 0x4020000000000000;
  *(_BYTE *)(v16 + 16) = 0;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E418);
  a3 &= 1u;
  sub_24615E240(a1, a2, a3, v16 + *(int *)(v27 + 44));
  sub_24615EFA0(&qword_25754E420, &qword_25754E400);
  v29 = v28;
  v30 = v12;
  sub_2461875BC();
  sub_24615EF1C(v16, &qword_25754E400);
  sub_24615EB54(a2, a3);
  LOBYTE(v16) = sub_246167814();
  v31 = a2;
  v32 = v40;
  sub_24615EB8C(v31, a3);
  v33 = v38;
  if ((v16 & 1) != 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v32 + 104))(v38, *MEMORY[0x24BEAB4E8], v7);
  else
    OUTLINED_FUNCTION_5(v38);
  v34 = v39;
  OUTLINED_FUNCTION_5(v39);
  v46 = v30;
  v47 = v29;
  OUTLINED_FUNCTION_4();
  v35 = v44;
  sub_246187598();
  v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v36(v34, v7);
  v36(v33, v7);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v21, v35);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v45, v26, v42);
}

void sub_24615E240(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
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

  v28 = a4;
  v6 = a3 & 1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E428);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v29 = (uint64_t)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E430);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v27 - v16;
  sub_24615EB54(a2, v6);
  v18 = sub_246167814();
  sub_24615EB8C(a2, v6);
  if ((v18 & 1) != 0)
  {
    *(_QWORD *)v17 = sub_2461873C4();
    *((_QWORD *)v17 + 1) = 0;
    v17[16] = 1;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E490);
    sub_24615E580(a1, &v17[*(int *)(v19 + 44)]);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E438);
    v21 = (uint64_t)v17;
    v22 = 0;
  }
  else
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E438);
    v21 = (uint64_t)v17;
    v22 = 1;
  }
  __swift_storeEnumTagSinglePayload(v21, v22, 1, v20);
  *(_QWORD *)v11 = sub_246187430();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E440);
  v30 = a1;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a1;
  *(_QWORD *)(v23 + 24) = a2;
  *(_BYTE *)(v23 + 32) = v6 != 0;
  swift_bridgeObjectRetain();
  sub_24615EB54(a2, v6);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E448);
  sub_246186F98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E450);
  sub_24615EFA0(&qword_25754E458, &qword_25754E448);
  sub_24615EE20();
  sub_24615EEBC(&qword_25754E480, (void (*)(uint64_t))MEMORY[0x24BE91A98]);
  sub_24618770C();
  sub_24615EEF0((uint64_t)v17, (uint64_t)v15, &qword_25754E430);
  v24 = v29;
  sub_24615EEF0((uint64_t)v11, v29, &qword_25754E428);
  v25 = v28;
  sub_24615EEF0((uint64_t)v15, v28, &qword_25754E430);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E488);
  sub_24615EEF0(v24, v25 + *(int *)(v26 + 48), &qword_25754E428);
  sub_24615EF1C((uint64_t)v11, &qword_25754E428);
  sub_24615EF1C((uint64_t)v17, &qword_25754E430);
  sub_24615EF1C(v24, &qword_25754E428);
  sub_24615EF1C((uint64_t)v15, &qword_25754E430);
}

uint64_t sub_24615E580@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v35 = a1;
  v38 = a2;
  sub_246187010();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E498);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E4A0);
  v36 = *(_QWORD *)(v2 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v37 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v35 - v5;
  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v7 = (id)qword_257550D20;
  v8 = sub_24618755C();
  v10 = v9;
  v39 = v8;
  v40 = v9;
  v12 = v11 & 1;
  v41 = v11 & 1;
  v42 = v13;
  sub_246187634();
  sub_24615EF54(v8, v10, v12);
  swift_bridgeObjectRelease();
  v39 = *(_QWORD *)(v35 + 16);
  sub_246186FB0();
  sub_24615EF64();
  sub_246186EC0();
  sub_24615EFA0(&qword_25754E4B0, &qword_25754E498);
  v14 = sub_246187550();
  v16 = v15;
  v18 = v17 & 1;
  LODWORD(v39) = sub_246187490();
  v19 = sub_246187514();
  v21 = v20;
  v23 = v22;
  v25 = v24 & 1;
  sub_24615EF54(v14, v16, v18);
  swift_bridgeObjectRelease();
  v27 = v36;
  v26 = v37;
  v28 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v28(v37, v6, v2);
  v29 = v38;
  v28(v38, v26, v2);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E4B8);
  v31 = &v29[*(int *)(v30 + 48)];
  *(_QWORD *)v31 = 0;
  v31[8] = 1;
  v32 = &v29[*(int *)(v30 + 64)];
  *(_QWORD *)v32 = v19;
  *((_QWORD *)v32 + 1) = v21;
  v32[16] = v25;
  *((_QWORD *)v32 + 3) = v23;
  sub_24615EFD4(v19, v21, v25);
  v33 = *(void (**)(char *, uint64_t))(v27 + 8);
  swift_bridgeObjectRetain();
  v33(v6, v2);
  sub_24615EF54(v19, v21, v25);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v33)(v26, v2);
}

uint64_t sub_24615E8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  uint64_t v18;

  v8 = type metadata accessor for ParticipantLabelView();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E450);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24615EFEC(a1, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BE91A98]);
  v10[*(int *)(v8 + 20)] = 0;
  v10[*(int *)(v8 + 24)] = 0;
  a3 &= 1u;
  sub_24615EB54(a2, a3);
  LOBYTE(a1) = sub_246167814();
  sub_24615EB8C(a2, a3);
  v14 = 0;
  if ((a1 & 1) != 0)
    v14 = sub_2461874FC();
  KeyPath = swift_getKeyPath();
  sub_24615EFEC((uint64_t)v10, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ParticipantLabelView);
  v16 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  *v16 = KeyPath;
  v16[1] = v14;
  sub_24615F018((uint64_t)v10);
  return sub_24615F054((uint64_t)v13, a4);
}

uint64_t sub_24615EA60()
{
  return sub_24618761C();
}

uint64_t sub_24615EA78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24615DF7C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

uint64_t variable initialization expression of CalendarSnippetProvider.$__lazy_storage_$_eventStore()
{
  return 0;
}

void type metadata accessor for VRXIdiom()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25754E3F8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25754E3F8);
  }
}

BOOL sub_24615EAD4(uint64_t *a1, uint64_t *a2)
{
  return sub_24615EB44(*a1, *a2);
}

void sub_24615EAE0(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_24615EB10();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_24615EB18@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

BOOL sub_24615EB44(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_24615EB54(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for ParticipantListView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_24615EB8C(*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_24615EB8C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t _s14SiriCalendarUI19ParticipantListViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  sub_24615EB54(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ParticipantListView(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[1];
  LOBYTE(v2) = *((_BYTE *)v2 + 16);
  sub_24615EB54(v4, (char)v2);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = (_BYTE)v2;
  sub_24615EB8C(v5, v6);
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

uint64_t assignWithTake for ParticipantListView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = v4;
  sub_24615EB8C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParticipantListView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 17))
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

uint64_t storeEnumTagSinglePayload for ParticipantListView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParticipantListView()
{
  return &type metadata for ParticipantListView;
}

uint64_t sub_24615ED44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495523C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495523D4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_24615EDE4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_24615EB8C(*(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_24615EE14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_24615E8FC(a1, *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), a2);
}

unint64_t sub_24615EE20()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754E460;
  if (!qword_25754E460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E450);
    sub_24615EEBC(&qword_25754E468, (void (*)(uint64_t))type metadata accessor for ParticipantLabelView);
    v3 = v2;
    sub_24615EFA0(&qword_25754E470, &qword_25754E478);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754E460);
  }
  return result;
}

void sub_24615EEBC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_1();
}

void sub_24615EEF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1();
}

void sub_24615EF1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24615EF54(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_24615EF64()
{
  unint64_t result;

  result = qword_25754E4A8;
  if (!qword_25754E4A8)
  {
    result = MEMORY[0x2495523E0](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25754E4A8);
  }
  return result;
}

void sub_24615EFA0(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24615EFD4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

void sub_24615EFEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24615F018(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ParticipantLabelView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24615F054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24615F09C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E408);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E400);
  sub_24615EFA0(&qword_25754E420, &qword_25754E400);
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_4();
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x2495523E0);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

_QWORD *sub_24615F184(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v48;
  char *v49;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v48 = (uint64_t)a2 + v13;
    v49 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v49, v48, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = a3[5];
    v36 = a3[6];
    v37 = *(void **)((char *)a2 + v35);
    *(_QWORD *)((char *)v4 + v35) = v37;
    v38 = (char *)v4 + v36;
    v39 = (uint64_t)a2 + v36;
    v40 = sub_2461870C4();
    v41 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 16);
    swift_bridgeObjectRetain();
    v42 = v37;
    v41(v38, v39, v40);
    v43 = a3[7];
    v44 = (_QWORD *)((char *)v4 + v43);
    v45 = (uint64_t *)((char *)a2 + v43);
    v46 = v45[1];
    *v44 = *v45;
    v44[1] = v46;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_24615F43C(uint64_t a1, uint64_t a2)
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

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();

  v11 = a1 + *(int *)(a2 + 24);
  v12 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24615F590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  id v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v46 = a2 + v12;
  v47 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v47, v46, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = a3[5];
  v34 = a3[6];
  v35 = *(void **)(a2 + v33);
  *(_QWORD *)(a1 + v33) = v35;
  v36 = a1 + v34;
  v37 = a2 + v34;
  v38 = sub_2461870C4();
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16);
  swift_bridgeObjectRetain();
  v40 = v35;
  v39(v36, v37, v38);
  v41 = a3[7];
  v42 = (_QWORD *)(a1 + v41);
  v43 = (_QWORD *)(a2 + v41);
  v44 = v43[1];
  *v42 = *v43;
  v42[1] = v44;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24615F810(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v47;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_24616046C(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v47 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v31, v32, v47);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_24616046C(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = a3[5];
  v36 = *(void **)(a2 + v35);
  v37 = *(void **)(a1 + v35);
  *(_QWORD *)(a1 + v35) = v36;
  v38 = v36;

  v39 = a3[6];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 24))(v40, v41, v42);
  v43 = a3[7];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (_QWORD *)(a2 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_24615FBF8(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  return a1;
}

uint64_t sub_24615FDF4(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_24616046C(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v56 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v40, v41, v56);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    sub_24616046C(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = a3[5];
  v45 = *(void **)(a1 + v44);
  *(_QWORD *)(a1 + v44) = *(_QWORD *)(a2 + v44);

  v46 = a3[6];
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 40))(v47, v48, v49);
  v50 = a3[7];
  v51 = (_QWORD *)(a1 + v50);
  v52 = (uint64_t *)(a2 + v50);
  v54 = *v52;
  v53 = v52[1];
  *v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246160138()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246160144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v7 = sub_2461870C4();
    v8 = v4 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2461601D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461601E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = (v4 - 1);
      return result;
    }
    v9 = sub_2461870C4();
    v10 = v5 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for RenderableEvent()
{
  uint64_t result;

  result = qword_25754E520;
  if (!qword_25754E520)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461602A4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_246187124();
  if (v1 <= 0x3F)
  {
    result = sub_2461870C4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24616033C()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_246160348()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = (uint64_t)v0;
  v2 = type metadata accessor for RenderableEvent();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = *(_QWORD *)(v1 + 8);
  sub_246160428(v1, (uint64_t)v4);
  if (!v6)
  {
    v5 = *(_QWORD *)&v4[*(int *)(v2 + 28)];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_24616046C((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  return v5;
}

uint64_t sub_246160404@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_246160348();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246160428(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RenderableEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24616046C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_246187124();
}

_QWORD *sub_2461604B8(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v59;
  char *v60;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v59 = (uint64_t)a2 + v13;
    v60 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v60, v59, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + v36) = v37;
    v38 = v35[6];
    v39 = (char *)v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)((char *)v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[5];
    v49 = (char *)v4 + v48;
    v50 = (char *)a2 + v48;
    v51 = sub_246186F74();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v51))
    {
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
      memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(v49, v50, v51);
      __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v51);
    }
    v53 = a3[7];
    *((_BYTE *)v4 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v54 = (char *)v4 + v53;
    v55 = (uint64_t)a2 + v53;
    v56 = *(uint64_t *)((char *)a2 + v53);
    v57 = *(_BYTE *)(v55 + 8);
    sub_24615EB54(v56, v57);
    *(_QWORD *)v54 = v56;
    v54[8] = v57;
  }
  return v4;
}

uint64_t sub_246160824(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  v14 = a1 + *(int *)(a2 + 20);
  v15 = sub_246186F74();
  if (!__swift_getEnumTagSinglePayload(v14, 1, v15))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  return sub_24615EB8C(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_BYTE *)(a1 + *(int *)(a2 + 28) + 8));
}

uint64_t sub_2461609D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v57;
  uint64_t v58;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v57 = a2 + v12;
  v58 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v58, v57, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = a3[5];
  v47 = (void *)(a1 + v46);
  v48 = (const void *)(a2 + v46);
  v49 = sub_246186F74();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
  {
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v47, v48, v49);
    __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
  }
  v51 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v52 = a1 + v51;
  v53 = a2 + v51;
  v54 = *(_QWORD *)(a2 + v51);
  v55 = *(_BYTE *)(v53 + 8);
  sub_24615EB54(v54, v55);
  *(_QWORD *)v52 = v54;
  *(_BYTE *)(v52 + 8) = v55;
  return a1;
}

uint64_t sub_246160D14(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  const void *v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v63;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_24616120C(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v63 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v63 - 8) + 16))(v31, v32, v63);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
LABEL_8:
      memcpy(v28, v29, v27);
      goto LABEL_14;
    }
    sub_24616120C(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
    goto LABEL_8;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47 = a3[5];
  v48 = (void *)(a1 + v47);
  v49 = (const void *)(a2 + v47);
  v50 = sub_246186F74();
  v51 = __swift_getEnumTagSinglePayload((uint64_t)v48, 1, v50);
  v52 = __swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50);
  if (!v51)
  {
    v53 = *(_QWORD *)(v50 - 8);
    if (!v52)
    {
      (*(void (**)(void *, const void *, uint64_t))(v53 + 24))(v48, v49, v50);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v53 + 8))(v48, v50);
    goto LABEL_19;
  }
  if (v52)
  {
LABEL_19:
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
  __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
LABEL_20:
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v55 = a3[7];
  v56 = a1 + v55;
  v57 = a2 + v55;
  v58 = *(_QWORD *)v57;
  v59 = *(_BYTE *)(v57 + 8);
  sub_24615EB54(*(_QWORD *)v57, v59);
  v60 = *(_QWORD *)v56;
  v61 = *(_BYTE *)(v56 + 8);
  *(_QWORD *)v56 = v58;
  *(_BYTE *)(v56 + 8) = v59;
  sub_24615EB8C(v60, v61);
  return a1;
}

uint64_t sub_24616120C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  OUTLINED_FUNCTION_1_0(v3);
  return a1;
}

_OWORD *sub_246161238(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = a3[5];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_246186F74();
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  }
  v33 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  *(_QWORD *)v34 = *(_QWORD *)v35;
  v34[8] = v35[8];
  return a1;
}

uint64_t sub_2461614E4(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const void *v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v71;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_24616120C(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v71 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(v40, v41, v71);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_24616120C(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = a3[5];
  v57 = (void *)(a1 + v56);
  v58 = (const void *)(a2 + v56);
  v59 = sub_246186F74();
  v60 = __swift_getEnumTagSinglePayload((uint64_t)v57, 1, v59);
  v61 = __swift_getEnumTagSinglePayload((uint64_t)v58, 1, v59);
  if (!v60)
  {
    v62 = *(_QWORD *)(v59 - 8);
    if (!v61)
    {
      (*(void (**)(void *, const void *, uint64_t))(v62 + 40))(v57, v58, v59);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v62 + 8))(v57, v59);
    goto LABEL_19;
  }
  if (v61)
  {
LABEL_19:
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
    memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v59 - 8) + 32))(v57, v58, v59);
  __swift_storeEnumTagSinglePayload((uint64_t)v57, 0, 1, v59);
LABEL_20:
  v64 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v65 = a1 + v64;
  v66 = (uint64_t *)(a2 + v64);
  v67 = *v66;
  LOBYTE(v66) = *((_BYTE *)v66 + 8);
  v68 = *(_QWORD *)v65;
  v69 = *(_BYTE *)(v65 + 8);
  *(_QWORD *)v65 = v67;
  *(_BYTE *)(v65 + 8) = (_BYTE)v66;
  sub_24615EB8C(v68, v69);
  return a1;
}

uint64_t sub_246161928()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246161934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v11;

  v6 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v9;
    v8 = v4 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v11 = *(unsigned __int8 *)(v4 + *(int *)(a3 + 24));
  if (v11 >= 2)
    return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_2461619DC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461619E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  *(_BYTE *)(v5 + *(int *)(a4 + 24)) = v4 + 1;
  return result;
}

uint64_t type metadata accessor for EventCellView()
{
  uint64_t result;

  result = qword_25754E5C0;
  if (!qword_25754E5C0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246161AB4()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for RenderableEvent();
  if (v0 <= 0x3F)
  {
    sub_246161B4C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_246161B4C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25754E5D0)
  {
    sub_246186F74();
    v0 = sub_246187970();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25754E5D0);
  }
}

uint64_t sub_246161BA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246161BB0()
{
  sub_2461874E4();
  sub_2461874F0();
  swift_release();
  sub_2461874D8();
  type metadata accessor for EventCellView();
  sub_24618707C();
  swift_allocObject();
  return sub_246187070();
}

uint64_t sub_246161C78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_0();
  v5 = sub_246186F74();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v9 = v8 - v7;
  v10 = type metadata accessor for EventCellView();
  sub_246162044(v1 + *(int *)(v10 + 20), v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) == 1)
  {
    sub_24616208C(v2, &qword_25754E560);
LABEL_6:
    *a1 = 0;
    v13 = (unsigned int *)MEMORY[0x24BE148D8];
    goto LABEL_7;
  }
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v11(v9, v2, v5);
  sub_246187124();
  if ((sub_246186EA8() & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    goto LABEL_6;
  }
  v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754E630) + 48);
  v11((uint64_t)a1, v9, v5);
  a1[v12] = 0;
  v13 = (unsigned int *)MEMORY[0x24BE148E0];
LABEL_7:
  v14 = *v13;
  v15 = sub_2461870A0();
  return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(a1, v14, v15);
}

uint64_t sub_246161DE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
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
  char v19;
  uint64_t v20;

  sub_2461870A0();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  v6 = (_BYTE *)(v5 - v4);
  v7 = sub_2461870C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E608);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2();
  v15 = v14 - v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E610);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2_0();
  v18 = type metadata accessor for RenderableEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v1 + *(int *)(v18 + 24), v7);
  sub_246161C78(v6);
  sub_246187088();
  sub_246161BB0();
  sub_246161FA0();
  sub_2461875D4();
  swift_release();
  sub_24616208C(v15, &qword_25754E608);
  v19 = sub_2461874A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, v2, v16);
  v20 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754E628) + 36);
  *(_BYTE *)v20 = v19;
  *(_OWORD *)(v20 + 8) = 0u;
  *(_OWORD *)(v20 + 24) = 0u;
  *(_BYTE *)(v20 + 40) = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v2, v16);
}

unint64_t sub_246161FA0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25754E618;
  if (!qword_25754E618)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E608);
    v2 = sub_246162004();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25754E618);
  }
  return result;
}

unint64_t sub_246162004()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754E620;
  if (!qword_25754E620)
  {
    v1 = sub_246187094();
    result = MEMORY[0x2495523E0](MEMORY[0x24BE14890], v1);
    atomic_store(result, (unint64_t *)&qword_25754E620);
  }
  return result;
}

uint64_t sub_246162044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24616208C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0(v3);
  return a1;
}

unint64_t sub_2461620BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25754E638;
  if (!qword_25754E638)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E628);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E608);
    v2[3] = sub_246161FA0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754E638);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return type metadata accessor for RenderableEvent();
}

uint64_t sub_2461621A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  v1 = (uint64_t *)(v0 + 16);
  OUTLINED_FUNCTION_0_1(1, 64);
  OUTLINED_FUNCTION_0_1(2, 1);
  OUTLINED_FUNCTION_0_1(3, 2);
  OUTLINED_FUNCTION_0_1(4, 4);
  OUTLINED_FUNCTION_0_1(5, 8);
  OUTLINED_FUNCTION_0_1(6, 16);
  OUTLINED_FUNCTION_0_1(7, 32);
  swift_beginAccess();
  v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2461879B8();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_5:
    v2 = 0;
    goto LABEL_6;
  }
  if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_5;
LABEL_3:
  swift_bridgeObjectRetain();
LABEL_6:
  swift_release();
  return v2;
}

id sub_2461622BC()
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
  _QWORD *v14;
  int EnumCaseMultiPayload;
  id v16;
  id v17;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2();
  v5 = v4 - v3;
  v6 = sub_246186F74();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v10 = v9 - v8;
  v11 = sub_24618710C();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v14 = (_QWORD *)(v13 - v12);
  sub_246162444(v1, v13 - v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    v16 = 0;
    if (EnumCaseMultiPayload == 1)
      return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithOccurrenceCount_, *v14);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(v7 + 32))(v10, v14, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v10, v6);
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v6);
    v17 = objc_allocWithZone(MEMORY[0x24BDC7518]);
    v16 = sub_246162530(v5);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  return v16;
}

uint64_t sub_246162444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24618710C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246162488(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  uint64_t v6;

  if ((a2 & ~a3) == 0)
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_dayOfWeek_, result);
    v6 = swift_beginAccess();
    MEMORY[0x249551FA8](v6);
    sub_2461625E0(*(_QWORD *)((*(_QWORD *)(a4 + 16) & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_246187928();
    sub_246187910();
    return swift_endAccess();
  }
  return result;
}

id sub_246162530(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = v1;
  v4 = sub_246186F74();
  v5 = 0;
  if (__swift_getEnumTagSinglePayload(a1, 1, v4) != 1)
  {
    v5 = (void *)sub_246186F68();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  v6 = objc_msgSend(v2, sel_initWithEndDate_, v5);

  return v6;
}

uint64_t sub_2461625BC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2461625E0(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_24618791C();
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_246162488(a1, a2, v3, v2);
}

uint64_t *sub_246162618(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2461877B4();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_2461626B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2461877B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_2461626F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2461877B4();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *sub_246162768(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_2461627DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_246162838(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_2461628A4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461628B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_246162920()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24616292C(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t type metadata accessor for DisambiguateEventsSnippet()
{
  uint64_t result;

  result = qword_25754E698;
  if (!qword_25754E698)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461629C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461877B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246162A3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246162A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_1_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246163D18(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246163CEC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6D0);
  sub_246163D98(&qword_25754E6D8, &qword_25754E6D0, MEMORY[0x24BDF5428]);
  return sub_24618773C();
}

uint64_t sub_246162B40@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t OpaqueTypeConformance2;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *, uint64_t);
  _QWORD v37[2];
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v41 = a2;
  v3 = type metadata accessor for DisambiguateEventsSnippet();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6E0);
  v40 = *(_QWORD *)(v38 - 8);
  v6 = MEMORY[0x24BDAC7A8](v38);
  v39 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v37 - v8;
  v10 = sub_246187760();
  v42 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v37 - v14;
  sub_24618713C();
  sub_24618776C();
  v45 = *a1;
  sub_246163D18((uint64_t)a1, (uint64_t)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  v16 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v17 = swift_allocObject();
  sub_246163CEC((uint64_t)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6E8);
  v37[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6F0);
  sub_246163D98(&qword_25754E6F8, &qword_25754E6E8, MEMORY[0x24BEE12D8]);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E700);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E708);
  v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E710);
  v21 = sub_246163810();
  v43 = v20;
  v44 = v21;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v43 = v19;
  v44 = OpaqueTypeConformance2;
  v23 = swift_getOpaqueTypeConformance2();
  v43 = v18;
  v44 = v23;
  swift_getOpaqueTypeConformance2();
  sub_2461638AC();
  sub_24618770C();
  v24 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v25 = v13;
  v26 = v13;
  v27 = v15;
  v24(v26, v15, v10);
  v28 = v39;
  v29 = v40;
  v30 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v31 = v38;
  v30(v39, v9, v38);
  v32 = v41;
  v24(v41, v25, v10);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E748);
  v30(&v32[*(int *)(v33 + 48)], v28, v31);
  v34 = *(void (**)(char *, uint64_t))(v29 + 8);
  v34(v9, v31);
  v35 = *(void (**)(char *, uint64_t))(v42 + 8);
  v35(v27, v10);
  v34(v28, v31);
  return ((uint64_t (*)(char *, uint64_t))v35)(v25, v10);
}

uint64_t sub_246162E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t OpaqueTypeConformance2;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  unint64_t v50;

  v45 = a2;
  v48 = a3;
  v4 = type metadata accessor for RenderableEvent();
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v44 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DisambiguateEventsSnippet();
  v8 = *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64);
  v42 = *(_QWORD *)(v7 - 8);
  v43 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v41 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_246187058();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E728);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E710);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E708);
  v38 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E700);
  v24 = *(_QWORD *)(v23 - 8);
  v39 = v23;
  v40 = v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v37 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v16 = sub_246187430();
  *((_QWORD *)v16 + 1) = 0x4014000000000000;
  v16[16] = 0;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E750);
  sub_24616326C(a1, (uint64_t)&v16[*(int *)(v27 + 44)]);
  sub_2461638EC((uint64_t)v16, (uint64_t)v19);
  v19[*(int *)(v17 + 36)] = 0;
  sub_246163934((uint64_t)v16, &qword_25754E728);
  v28 = sub_246163810();
  sub_2461875BC();
  sub_246163934((uint64_t)v19, &qword_25754E710);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEAB4F0], v10);
  v49 = v17;
  v50 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_2461875A4();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v20);
  v30 = v41;
  sub_246163D18(v45, v41, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  v31 = v44;
  sub_246163D18(a1, v44, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v32 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v33 = (v43 + *(unsigned __int8 *)(v46 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  v34 = swift_allocObject();
  sub_246163CEC(v30, v34 + v32, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateEventsSnippet);
  sub_246163CEC(v31, v34 + v33, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v49 = v20;
  v50 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v35 = v39;
  sub_246187604();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v26, v35);
}

void sub_24616326C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v36 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v3);
  v34 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for RenderableEvent();
  MEMORY[0x24BDAC7A8](v5);
  v33 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for EventCellView();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v35 = (uint64_t)&v33 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E758);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E760);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = sub_246186F74();
  MEMORY[0x24BDAC7A8](v18);
  v19 = type metadata accessor for DateHeaderView();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v33 - v23;
  sub_246187124();
  sub_246186E9C();
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  swift_storeEnumTagMultiPayload();
  *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  sub_246180920();
  v25 = a1;
  v26 = v33;
  sub_246163D18(v25, v33, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v27 = (uint64_t)v34;
  sub_246186E9C();
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v18);
  v28 = (uint64_t)&v10[v7[5]];
  __swift_storeEnumTagSinglePayload(v28, 1, 1, v18);
  v29 = &v10[v7[7]];
  *(_QWORD *)v29 = swift_getKeyPath();
  v29[8] = 0;
  sub_246163CEC(v26, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_246163CA4(v27, v28);
  v10[v7[6]] = 0;
  v30 = v35;
  sub_246163CEC((uint64_t)v10, v35, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  sub_246163D18((uint64_t)v24, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  sub_246163D18(v30, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  v31 = v36;
  sub_246163D18((uint64_t)v22, v36, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E778);
  sub_246163D18((uint64_t)v10, v31 + *(int *)(v32 + 48), (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  sub_246163D44(v30, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  sub_246163D44((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  sub_246163D44((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  sub_246163D44((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
}

uint64_t sub_246163654(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_246187850();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 8))
  {
    v6 = *(void **)a1;
    v7 = *(_QWORD *)(a1 + 8);
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  type metadata accessor for DisambiguateEventsSnippet();
  swift_bridgeObjectRetain();
  sub_24618779C();
  sub_24617C8C0(v6, v7);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_246163730@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11();
  return sub_246162B40((uint64_t *)(v1 + v3), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_1();
  swift_bridgeObjectRelease();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(v0);
  return swift_deallocObject();
}

uint64_t sub_2461637D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11();
  return sub_246162E90(a1, v2 + v5, a2);
}

unint64_t sub_246163810()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754E718;
  if (!qword_25754E718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E710);
    sub_246163D98(&qword_25754E720, &qword_25754E728, MEMORY[0x24BDF4700]);
    v3 = v2;
    sub_246163D98(&qword_25754E730, &qword_25754E738, MEMORY[0x24BDEFAD8]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754E718);
  }
  return result;
}

unint64_t sub_2461638AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754E740;
  if (!qword_25754E740)
  {
    v1 = type metadata accessor for RenderableEvent();
    result = MEMORY[0x2495523E0](&unk_246187F58, v1);
    atomic_store(result, (unint64_t *)&qword_25754E740);
  }
  return result;
}

uint64_t sub_2461638EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_246163934(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24616395C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
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

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_1_1() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for RenderableEvent();
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  swift_bridgeObjectRelease();
  v6 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(v6);
  v7 = v0 + ((v2 + v3 + v5) & ~v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_246187124();
  v9 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v9);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v10 = v7 + *(int *)(v8 + 48);
  v11 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v10, 1, v11))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v12 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v12);
    }
  }
  swift_bridgeObjectRelease();

  v13 = sub_2461870C4();
  OUTLINED_FUNCTION_4_1(v13);
  OUTLINED_FUNCTION_2_1();
  return swift_deallocObject();
}

void sub_246163AEC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_1_1() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RenderableEvent() - 8) + 80);
  sub_246163654(v0 + ((v2 + v3 + v4) & ~v4));
  OUTLINED_FUNCTION_6_0();
}

void sub_246163B48()
{
  sub_24618731C();
  OUTLINED_FUNCTION_1();
}

void sub_246163B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_246163BA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEEA8], MEMORY[0x24BDEE3D8]);
}

void sub_246163B78()
{
  sub_246187328();
  OUTLINED_FUNCTION_1();
}

void sub_246163B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_246163BA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCF2D8], MEMORY[0x24BDEE430]);
}

void sub_246163BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_6_0();
}

void sub_246163C1C()
{
  sub_24618731C();
  OUTLINED_FUNCTION_1();
}

void sub_246163C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_246163BA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEEA8], MEMORY[0x24BDEE3D8]);
}

void sub_246163C5C()
{
  sub_246187328();
  OUTLINED_FUNCTION_1();
}

void sub_246163C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_246163BA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCF2D8], MEMORY[0x24BDEE430]);
}

uint64_t sub_246163CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_246163CEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_9(a1, a2, a3);
  OUTLINED_FUNCTION_10(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1();
}

void sub_246163D18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_9(a1, a2, a3);
  OUTLINED_FUNCTION_10(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

void sub_246163D44(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_1();
}

void sub_246163D6C()
{
  sub_246163D98(&qword_25754E780, &qword_25754E788, MEMORY[0x24BEADC00]);
}

void sub_246163D98(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2495523E0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return type metadata accessor for DisambiguateEventsSnippet();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_2461877B4();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_246163E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  id v7;
  void *v8;
  uint64_t v10[3];
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v11 = a3;
  v12 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_1, a1, v4);
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v7 = sub_24617BAF8();
  v8 = (void *)sub_2461870D0();

  LOBYTE(v4) = sub_246187844();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v4 & 1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t *sub_246163F90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2461877B4();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_24616402C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2461877B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_246164074(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2461877B4();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_2461640E4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_246164160(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_2461641BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_246164228()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246164234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_2461642B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461642BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PunchoutButtonSnippet()
{
  uint64_t result;

  result = qword_25754E7E8;
  if (!qword_25754E7E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24616435C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461877B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2461643D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2461643E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_0_2();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_2461647BC(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246164804((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E820);
  sub_246164944((unint64_t *)&qword_25754E828, &qword_25754E820, MEMORY[0x24BDF43B0]);
  return sub_24618773C();
}

uint64_t sub_2461644C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;

  v2 = type metadata accessor for PunchoutButtonSnippet();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_2461647BC(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_246164804((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5);
  v9 = a1;
  return sub_2461876F4();
}

uint64_t sub_2461645A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_246187850();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PunchoutButtonSnippet();
  sub_24618779C();
  v4 = (void *)sub_2461870F4();
  sub_246187838();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_246164644@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  result = sub_24616467C(*a1, a1[1]);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_24616467C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (!a2)
  {
    sub_246187400();
    v3 = qword_25754E3F0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v3 != -1)
      swift_once();
    v4 = (id)qword_257550D20;
    a1 = sub_24618755C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2461647BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246164804(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246164848()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_0_2();
  v1 = OUTLINED_FUNCTION_1_2(v0);
  return sub_2461644C4(v1);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_0_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 20);
  v5 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_2461648F8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(v0);
  return sub_2461645A0();
}

uint64_t sub_246164910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246164644(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_246164918()
{
  return sub_246164944(&qword_25754E830, &qword_25754E838, MEMORY[0x24BEADC00]);
}

uint64_t sub_246164944(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495523E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return type metadata accessor for PunchoutButtonSnippet();
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t initializeBufferWithCopyOfBuffer for NotifyAUIOfEditingModifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotifyAUIOfEditingModifier(uint64_t a1)
{
  swift_release();

}

uint64_t initializeWithCopy for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v3;
  swift_retain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for NotifyAUIOfEditingModifier(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotifyAUIOfEditingModifier(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for NotifyAUIOfEditingModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotifyAUIOfEditingModifier()
{
  return &type metadata for NotifyAUIOfEditingModifier;
}

uint64_t sub_246164BE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246164BF4@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
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
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t (**v19)(uint64_t);
  void (*v20)(uint64_t, uint64_t);
  id v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  char v30;

  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E840);
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_2();
  v4 = v3 - v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E848);
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v8 = v7 - v6;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E850);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  v29 = *v1;
  v30 = *((_BYTE *)v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E858);
  sub_246187190();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E860);
  sub_246164944(&qword_25754E868, &qword_25754E860, MEMORY[0x24BDEFB78]);
  sub_246187640();
  swift_release();
  swift_release();
  sub_246187178();
  v12 = (void *)*((_QWORD *)v1 + 3);
  v13 = OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_2(v13);
  sub_246165118((uint64_t)&v29);
  v14 = v12;
  swift_getOpaqueTypeConformance2();
  sub_24618764C();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v4, v23);
  if (v12)
  {
    v15 = v14;
    v16 = sub_2461878A4();

    v17 = OUTLINED_FUNCTION_1_3();
    v18 = OUTLINED_FUNCTION_2_2(v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v26 + 16))(v11, v8, v27, v18);
    *(_QWORD *)(v11 + *(int *)(v25 + 52)) = v16;
    v19 = (uint64_t (**)(uint64_t))(v11 + *(int *)(v25 + 56));
    *v19 = sub_2461651B0;
    v19[1] = (uint64_t (*)(uint64_t))v17;
    sub_246165118((uint64_t)&v29);
    v20 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v21 = v15;
    v20(v8, v27);
    return sub_2461651B8(v11, a1);
  }
  else
  {
    sub_2461878C8();
    sub_246165140();
    result = sub_24618728C();
    __break(1u);
  }
  return result;
}

void sub_246164EF8(__int128 *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  char v8;

  v6 = *a1;
  LOBYTE(v7) = *((_BYTE *)a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E858);
  sub_246187178();
  v2 = (void *)*((_QWORD *)a1 + 3);
  if (v8 == 1)
  {
    if (v2)
    {
      v3 = v2;
      sub_246187898();

      v4 = objc_msgSend(objc_allocWithZone((Class)sub_24618785C()), sel_init, v6, v7);
      v5 = v3;
      sub_2461878B0();

LABEL_6:
      return;
    }
  }
  else if (v2)
  {
    v5 = v2;
    sub_24618788C();
    goto LABEL_6;
  }
  sub_2461878C8();
  sub_246165140();
  sub_24618728C();
  __break(1u);
}

uint64_t sub_246164FDC(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;
  _BYTE v9[16];
  __int128 v10;
  char v11;

  v4 = sub_2461878BC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(_QWORD *, uint64_t))(v5 + 88))(v7, v4) != *MEMORY[0x24BEAE4E0])
    return (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 96))(v7, v4);
  if ((unint64_t)(*v7 - 3) <= 1)
  {
    v10 = *a2;
    v11 = *((_BYTE *)a2 + 16);
    v9[15] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E858);
    return sub_246187184();
  }
  return result;
}

uint64_t sub_2461650F0()
{
  return sub_2461871E4();
}

void sub_246165110()
{
  uint64_t v0;

  sub_246164EF8((__int128 *)(v0 + 16));
}

uint64_t sub_246165118(uint64_t a1)
{
  swift_retain();
  return a1;
}

unint64_t sub_246165140()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754E870;
  if (!qword_25754E870)
  {
    v1 = sub_2461878C8();
    result = MEMORY[0x2495523E0](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_25754E870);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2461651B0(uint64_t a1)
{
  uint64_t v1;

  return sub_246164FDC(a1, (__int128 *)(v1 + 16));
}

uint64_t sub_2461651B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246165200()
{
  return sub_246164944(qword_25754E878, &qword_25754E850, MEMORY[0x24BDEDA68]);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_allocObject();
}

__n128 OUTLINED_FUNCTION_2_2(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(v1 + 32);
  return result;
}

uint64_t *sub_24616524C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a3;
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    a1[3] = a2[3];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2461877B4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    v12(v9, v10, v11);
    v13 = *(int *)(v6 + 28);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(_QWORD *)v15;
    LOBYTE(v6) = v15[8];
    sub_24615EB54(*(_QWORD *)v15, v6);
    *(_QWORD *)v14 = v16;
    v14[8] = v6;
  }
  return v4;
}

uint64_t sub_246165340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return sub_24615EB8C(*(_QWORD *)(a1 + *(int *)(a2 + 28)), *(_BYTE *)(a1 + *(int *)(a2 + 28) + 8));
}

uint64_t sub_2461653AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2461877B4();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 28);
  v13 = a1 + v12;
  v14 = v4 + v12;
  v15 = *(_QWORD *)v14;
  LOBYTE(v4) = *(_BYTE *)(v14 + 8);
  sub_24615EB54(*(_QWORD *)v14, v4);
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = v4;
  return a1;
}

uint64_t sub_246165474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
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

  v4 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(v4 + 24);
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = v4 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = a1 + v10;
  v12 = v4 + v10;
  v13 = *(_QWORD *)v12;
  LOBYTE(v4) = *(_BYTE *)(v12 + 8);
  sub_24615EB54(*(_QWORD *)v12, v4);
  v14 = *(_QWORD *)v11;
  v15 = *(_BYTE *)(v11 + 8);
  *(_QWORD *)v11 = v13;
  *(_BYTE *)(v11 + 8) = v4;
  sub_24615EB8C(v14, v15);
  return a1;
}

uint64_t sub_24616554C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_BYTE *)(v11 + 8) = *(_BYTE *)(v12 + 8);
  return a1;
}

uint64_t sub_2461655E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 28);
  v12 = a1 + v11;
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  LOBYTE(v13) = *((_BYTE *)v13 + 8);
  v15 = *(_QWORD *)v12;
  v16 = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = (_BYTE)v13;
  sub_24615EB8C(v15, v16);
  return a1;
}

uint64_t sub_246165698()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461656A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_246165714()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246165720(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PromptForTitleSnippet()
{
  uint64_t result;

  result = qword_25754E8D8;
  if (!qword_25754E8D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461657C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461877B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246165844()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246165854()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v1 = sub_246187850();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[1];
  v6 = v0[2];
  v7 = v0[3];
  v13 = v5;
  v14 = v6;
  v15 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9A8);
  sub_2461876DC();
  v9 = (unint64_t)v16;
  v8 = v17;
  result = swift_bridgeObjectRelease();
  v11 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v11 = v9 & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    type metadata accessor for PromptForTitleSnippet();
    sub_24618779C();
    v13 = v5;
    v14 = v6;
    v15 = v7;
    sub_2461876DC();
    sub_24617C9B0(v16, v17);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_246165974()
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
  char v14;
  char v15;
  unint64_t v16;
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

  OUTLINED_FUNCTION_3_2();
  v3 = v0;
  v26 = v4;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E918);
  v23 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_2();
  v22 = v6 - v5;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E920);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_3();
  v8 = OUTLINED_FUNCTION_12();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E928);
  v11 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_4_2();
  v12 = v3 + *(int *)(v8 + 28);
  v13 = *(_QWORD *)v12;
  v14 = *(_BYTE *)(v12 + 8);
  sub_24615EB54(*(_QWORD *)v12, v14);
  v15 = sub_246167814();
  sub_24615EB8C(v13, v14);
  sub_246168784(v3, (uint64_t)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = swift_allocObject();
  sub_246167C80((uint64_t)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  if ((v15 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E950);
    sub_2461689F8(&qword_25754E958, &qword_25754E950);
    OUTLINED_FUNCTION_32();
    v18 = v25;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v2, v25);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_22(&qword_25754E940, &qword_25754E928);
    OUTLINED_FUNCTION_22(&qword_25754E948, &qword_25754E918);
    sub_24618746C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v18);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E930);
    sub_2461689F8(&qword_25754E938, &qword_25754E930);
    v19 = v22;
    OUTLINED_FUNCTION_32();
    v20 = v23;
    v21 = v27;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v1, v19, v27);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_22(&qword_25754E940, &qword_25754E928);
    OUTLINED_FUNCTION_22(&qword_25754E948, &qword_25754E918);
    sub_24618746C();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_246165C9C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, _QWORD, uint64_t);
  char *v44;
  char *v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t KeyPath;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;

  v106 = a2;
  v3 = sub_246187730();
  v99 = *(_QWORD *)(v3 - 8);
  v100 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v96 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PromptForTitleSnippet();
  v92 = *(_QWORD *)(v5 - 8);
  v93 = *(_QWORD *)(v92 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v90 = (uint64_t)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E820);
  v97 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v91 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA38);
  v103 = *(_QWORD *)(v8 - 8);
  v104 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v94 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA40);
  v10 = MEMORY[0x24BDAC7A8](v102);
  v105 = (uint64_t)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v98 = (char *)&v82 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v101 = (uint64_t)&v82 - v14;
  v15 = sub_246187058();
  v86 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v87 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v84 = (char *)&v82 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E960);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v82 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA48);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v82 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA50);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA58);
  v108 = *(_QWORD *)(v29 - 8);
  v109 = v29;
  v30 = MEMORY[0x24BDAC7A8](v29);
  v107 = (char *)&v82 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v85 = (char *)&v82 - v32;
  KeyPath = swift_getKeyPath();
  v83 = a1;
  v33 = *(_QWORD *)(a1 + 24);
  v110 = *(_OWORD *)(a1 + 8);
  v111 = v33;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9A8);
  sub_2461876E8();
  sub_246187718();
  LOBYTE(a1) = sub_2461874B4();
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v25, v22, v19);
  v34 = &v25[*(int *)(v23 + 36)];
  *v34 = a1;
  *(_OWORD *)(v34 + 8) = 0u;
  *(_OWORD *)(v34 + 24) = 0u;
  v34[40] = 1;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  LOBYTE(a1) = sub_24618719C();
  v36 = v35;
  LOBYTE(v23) = v37;
  sub_2461878C8();
  sub_24615EEBC(&qword_25754E870, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v38 = sub_246187298();
  v40 = v39;
  sub_24615EEF0((uint64_t)v25, (uint64_t)v28, &qword_25754EA48);
  v41 = &v28[*(int *)(v26 + 36)];
  *v41 = a1 & 1;
  *((_QWORD *)v41 + 1) = v36;
  v41[16] = v23 & 1;
  *((_QWORD *)v41 + 3) = v38;
  *((_QWORD *)v41 + 4) = v40;
  sub_246163934((uint64_t)v25, &qword_25754EA48);
  v42 = v86;
  v43 = *(void (**)(char *, _QWORD, uint64_t))(v86 + 104);
  v44 = v84;
  v43(v84, *MEMORY[0x24BEAB508], v15);
  v45 = v87;
  v43(v87, *MEMORY[0x24BEAB530], v15);
  sub_246168848(&qword_25754EA60, &qword_25754EA50);
  v46 = v107;
  sub_246187598();
  v47 = *(void (**)(char *, uint64_t))(v42 + 8);
  v47(v45, v15);
  v47(v44, v15);
  sub_246163934((uint64_t)v28, &qword_25754EA50);
  v48 = v108;
  v49 = v85;
  (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v85, v46, v109);
  v50 = v83;
  v51 = v90;
  sub_246168784(v83, v90, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v52 = (*(unsigned __int8 *)(v92 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  v53 = swift_allocObject();
  sub_246167C80(v51, v53 + v52, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v54 = v91;
  sub_2461876F4();
  v56 = v99;
  v55 = v100;
  v57 = v96;
  (*(void (**)(char *, _QWORD, uint64_t))(v99 + 104))(v96, *MEMORY[0x24BEAD978], v100);
  sub_2461689F8(&qword_25754E828, &qword_25754E820);
  v58 = v94;
  v59 = v95;
  sub_24618758C();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v55);
  (*(void (**)(char *, uint64_t))(v97 + 8))(v54, v59);
  v60 = *(_QWORD *)(v50 + 24);
  v112 = *(_OWORD *)(v50 + 8);
  v113 = v60;
  sub_2461876DC();
  v61 = v110;
  swift_bridgeObjectRelease();
  v62 = HIBYTE(*((_QWORD *)&v61 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v61 + 1) & 0x2000000000000000) == 0)
    v62 = v61 & 0xFFFFFFFFFFFFLL;
  v63 = v62 == 0;
  v64 = swift_getKeyPath();
  v65 = swift_allocObject();
  *(_BYTE *)(v65 + 16) = v63;
  v67 = v103;
  v66 = v104;
  v68 = v98;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v98, v58, v104);
  v69 = (uint64_t *)&v68[*(int *)(v102 + 36)];
  *v69 = v64;
  v69[1] = (uint64_t)sub_246168B58;
  v69[2] = v65;
  (*(void (**)(char *, uint64_t))(v67 + 8))(v58, v66);
  v70 = (uint64_t)v68;
  v71 = v101;
  sub_246168A28(v70, v101);
  v72 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  v73 = v107;
  v74 = v109;
  v72(v107, v49, v109);
  v75 = v105;
  sub_24615EEF0(v71, v105, &qword_25754EA40);
  v76 = v106;
  v77 = KeyPath;
  *v106 = KeyPath;
  *((_BYTE *)v76 + 8) = 0;
  v78 = v76;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA70);
  v72((char *)v78 + *(int *)(v79 + 48), v73, v74);
  sub_24615EEF0(v75, (uint64_t)v78 + *(int *)(v79 + 64), &qword_25754EA40);
  sub_24615EB54(v77, 0);
  swift_retain();
  sub_246163934(v71, &qword_25754EA40);
  v80 = *(void (**)(char *, uint64_t))(v108 + 8);
  v80(v49, v74);
  swift_release();
  sub_246163934(v75, &qword_25754EA40);
  v80(v73, v74);
  return sub_24615EB8C(v77, 0);
}

uint64_t sub_246166530@<X0>(uint64_t a1@<X8>)
{
  return sub_246167468(a1);
}

uint64_t sub_24616654C@<X0>(uint64_t a1@<X8>)
{
  return sub_246167468(a1);
}

uint64_t sub_24616655C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t OpaqueTypeConformance2;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
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
  _OWORD *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t (*v78)(void);
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unsigned __int8 v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *boxed_opaque_existential_1;
  int *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  void (*v109)(char *, char *, uint64_t);
  uint64_t v110;
  void (*v111)(char *, char *, uint64_t);
  char *v112;
  uint64_t v113;
  void (*v114)(char *, char *, uint64_t);
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t);
  void (*v121)(char *, uint64_t);
  void (*v122)(char *, uint64_t);
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;

  v156 = a2;
  v158 = sub_246187754();
  v164 = *(_QWORD *)(v158 - 8);
  v3 = MEMORY[0x24BDAC7A8](v158);
  v157 = (char *)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v163 = (char *)&v124 - v5;
  v151 = sub_246187280();
  MEMORY[0x24BDAC7A8](v151);
  v149 = (char *)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = sub_246187214();
  v147 = *(_QWORD *)(v148 - 8);
  MEMORY[0x24BDAC7A8](v148);
  v145 = (char *)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PromptForTitleSnippet();
  v143 = *(_QWORD *)(v8 - 8);
  v144 = *(_QWORD *)(v143 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v142 = (uint64_t)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_2461871C0();
  v135 = *(_QWORD *)(v136 - 8);
  MEMORY[0x24BDAC7A8](v136);
  v132 = (char *)&v124 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_246187448();
  v128 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v124 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E960);
  v127 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v124 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E968);
  v130 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  v18 = (char *)&v124 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E970);
  v137 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v126 = (char *)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E978);
  v138 = *(_QWORD *)(v140 - 8);
  MEMORY[0x24BDAC7A8](v140);
  v131 = (char *)&v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E980);
  MEMORY[0x24BDAC7A8](v134);
  v22 = (uint64_t)&v124 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E988);
  MEMORY[0x24BDAC7A8](v141);
  v139 = (char *)&v124 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E990);
  MEMORY[0x24BDAC7A8](v146);
  v25 = (char *)&v124 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E998);
  MEMORY[0x24BDAC7A8](v153);
  v152 = (uint64_t)&v124 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9A0);
  v166 = *(_QWORD *)(v162 - 8);
  v27 = MEMORY[0x24BDAC7A8](v162);
  v155 = (char *)&v124 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v150 = (char *)&v124 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v165 = (char *)&v124 - v31;
  v154 = sub_246187880();
  v160 = *(_QWORD *)(v154 - 8);
  v32 = MEMORY[0x24BDAC7A8](v154);
  v161 = (char *)&v124 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v124 - v34;
  sub_2461672D0();
  v174 = MEMORY[0x24BDF4780];
  v175 = MEMORY[0x24BEAD938];
  v171 = v36;
  v159 = v35;
  sub_246187874();
  v125 = a1;
  v37 = *(_QWORD *)(a1 + 24);
  v167 = *(_OWORD *)(a1 + 8);
  v168 = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9A8);
  sub_2461876E8();
  sub_246187718();
  sub_24618743C();
  sub_2461689F8(&qword_25754E9B0, &qword_25754E960);
  v39 = v38;
  sub_24615EEBC(&qword_25754E9B8, (void (*)(uint64_t))MEMORY[0x24BDEF048]);
  v41 = v40;
  sub_246187628();
  (*(void (**)(char *, uint64_t))(v128 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v16, v14);
  v42 = v132;
  sub_2461871B4();
  v171 = v14;
  v172 = v11;
  v43 = (uint64_t)v25;
  v173 = v39;
  v174 = v41;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v45 = v126;
  v46 = v129;
  sub_2461875F8();
  (*(void (**)(char *, uint64_t))(v135 + 8))(v42, v136);
  v47 = v18;
  v48 = v125;
  (*(void (**)(char *, uint64_t))(v130 + 8))(v47, v46);
  v49 = v142;
  sub_246168784(v48, v142, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v50 = (*(unsigned __int8 *)(v143 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80);
  v51 = swift_allocObject();
  sub_246167C80(v49, v51 + v50, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v52 = v145;
  sub_246187208();
  v171 = v46;
  v172 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v53 = v131;
  v54 = v133;
  sub_246187658();
  swift_release();
  (*(void (**)(char *, uint64_t))(v147 + 8))(v52, v148);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v45, v54);
  LOBYTE(OpaqueTypeConformance2) = sub_2461874B4();
  sub_24618716C();
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v63 = v138;
  v64 = v140;
  (*(void (**)(uint64_t, char *, uint64_t))(v138 + 16))(v22, v53, v140);
  v65 = v22 + *(int *)(v134 + 36);
  *(_BYTE *)v65 = OpaqueTypeConformance2;
  *(_QWORD *)(v65 + 8) = v56;
  *(_QWORD *)(v65 + 16) = v58;
  *(_QWORD *)(v65 + 24) = v60;
  *(_QWORD *)(v65 + 32) = v62;
  *(_BYTE *)(v65 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v63 + 8))(v53, v64);
  LODWORD(OpaqueTypeConformance2) = sub_246187484();
  v66 = v149;
  v67 = &v149[*(int *)(v151 + 20)];
  v68 = *MEMORY[0x24BDEEB68];
  v69 = sub_246187418();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 104))(v67, v68, v69);
  __asm { FMOV            V0.2D, #5.0 }
  *v66 = _Q0;
  v75 = (uint64_t)v139;
  v76 = &v139[*(int *)(v141 + 36)];
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9C0);
  v78 = MEMORY[0x24BDED998];
  sub_246168784((uint64_t)v66, (uint64_t)&v76[*(int *)(v77 + 52)], (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_DWORD *)v76 = OpaqueTypeConformance2;
  *(_WORD *)&v76[*(int *)(v77 + 56)] = 256;
  sub_24615EEF0(v22, v75, &qword_25754E980);
  sub_246163D44((uint64_t)v66, (uint64_t (*)(_QWORD))v78);
  sub_246163934(v22, &qword_25754E980);
  LOBYTE(OpaqueTypeConformance2) = sub_24618719C();
  v80 = v79;
  LOBYTE(v22) = v81;
  sub_2461878C8();
  sub_24615EEBC(&qword_25754E870, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v82 = sub_246187298();
  v84 = v83;
  sub_24615EEF0(v75, v43, &qword_25754E988);
  v85 = v43 + *(int *)(v146 + 36);
  *(_BYTE *)v85 = OpaqueTypeConformance2 & 1;
  *(_QWORD *)(v85 + 8) = v80;
  *(_BYTE *)(v85 + 16) = v22 & 1;
  *(_QWORD *)(v85 + 24) = v82;
  *(_QWORD *)(v85 + 32) = v84;
  sub_246163934(v75, &qword_25754E988);
  LOBYTE(v22) = sub_2461874A8();
  v86 = sub_2461874C0();
  v87 = sub_2461874CC();
  sub_2461874CC();
  if (sub_2461874CC() != v22)
    v87 = sub_2461874CC();
  sub_2461874CC();
  if (sub_2461874CC() != v86)
    v87 = sub_2461874CC();
  v88 = v152;
  sub_24615EEF0(v43, v152, &qword_25754E990);
  v89 = v88 + *(int *)(v153 + 36);
  *(_BYTE *)v89 = v87;
  *(_OWORD *)(v89 + 8) = 0u;
  *(_OWORD *)(v89 + 24) = 0u;
  *(_BYTE *)(v89 + 40) = 1;
  sub_246163934(v43, &qword_25754E990);
  sub_246167970();
  v90 = v150;
  sub_2461875B0();
  sub_246163934(v88, &qword_25754E998);
  (*(void (**)(char *, char *, uint64_t))(v166 + 32))(v165, v90, v162);
  sub_246167524();
  v175 = MEMORY[0x24BEAD938];
  v174 = MEMORY[0x24BDF4780];
  v171 = v91;
  v92 = sub_246187400();
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v99 = type metadata accessor for CalendarButtonView(0);
  v169 = v99;
  sub_24615EEBC(&qword_25754E9F8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
  v170 = v100;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v167);
  boxed_opaque_existential_1[7] = MEMORY[0x24BE91A60];
  boxed_opaque_existential_1[8] = sub_246167BFC();
  *((_BYTE *)boxed_opaque_existential_1 + 32) = 2;
  *((_BYTE *)boxed_opaque_existential_1 + 72) = 1;
  v102 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v103 = (char *)boxed_opaque_existential_1 + v102[6];
  v104 = *MEMORY[0x24BEAD970];
  v105 = sub_246187730();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 104))(v103, v104, v105);
  *boxed_opaque_existential_1 = v92;
  boxed_opaque_existential_1[1] = v94;
  *((_BYTE *)boxed_opaque_existential_1 + 16) = v96 & 1;
  boxed_opaque_existential_1[3] = v98;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v102[7]) = 0;
  *(uint64_t *)((char *)boxed_opaque_existential_1 + v102[8]) = 0;
  v106 = (char *)boxed_opaque_existential_1 + *(int *)(v99 + 20);
  *(_QWORD *)v106 = swift_getKeyPath();
  v106[8] = 0;
  sub_2461877A8();
  v107 = v163;
  sub_246187748();
  v108 = v161;
  v109 = *(void (**)(char *, char *, uint64_t))(v160 + 16);
  v110 = v154;
  v109(v161, v159, v154);
  v111 = *(void (**)(char *, char *, uint64_t))(v166 + 16);
  v112 = v155;
  v113 = v162;
  v111(v155, v165, v162);
  v114 = *(void (**)(char *, char *, uint64_t))(v164 + 16);
  v115 = v157;
  v116 = v107;
  v117 = v158;
  v114(v157, v116, v158);
  v118 = v156;
  v109(v156, v108, v110);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA08);
  v111(&v118[*(int *)(v119 + 48)], v112, v113);
  v114(&v118[*(int *)(v119 + 64)], v115, v117);
  v120 = *(void (**)(char *, uint64_t))(v164 + 8);
  v120(v163, v117);
  v121 = *(void (**)(char *, uint64_t))(v166 + 8);
  v121(v165, v113);
  v122 = *(void (**)(char *, uint64_t))(v160 + 8);
  v122(v159, v110);
  v120(v115, v117);
  v121(v112, v113);
  return ((uint64_t (*)(char *, uint64_t))v122)(v161, v110);
}

void sub_2461672D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;

  OUTLINED_FUNCTION_3_2();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E4A0);
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_3();
  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v4 = (id)qword_257550D20;
  v5 = sub_24618755C();
  v7 = v6;
  v9 = v8 & 1;
  sub_246187634();
  sub_24615EF54(v5, v7, v9);
  swift_bridgeObjectRelease();
  swift_getOpaqueTypeConformance2();
  sub_246187574();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_24616744C@<X0>(uint64_t a1@<X8>)
{
  return sub_246167468(a1);
}

uint64_t sub_246167468@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v2 = (id)qword_257550D20;
  result = sub_24618755C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

void sub_246167524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *v6;
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
  int v19;
  uint64_t v20;
  unint64_t v21;
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
  BOOL v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  char v46;

  OUTLINED_FUNCTION_3_2();
  v2 = OUTLINED_FUNCTION_12();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_2();
  v8 = type metadata accessor for CalendarButtonView(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2();
  v12 = v11 - v10;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA10);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v16 = v15 - v14;
  v17 = sub_246187400();
  v39 = v18;
  v40 = v17;
  v38 = v19;
  v37 = v20;
  sub_246168784(v0, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  v21 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22 = swift_allocObject();
  sub_246167C80((uint64_t)v5, v22 + v21, (uint64_t (*)(_QWORD))type metadata accessor for PromptForTitleSnippet);
  *(_QWORD *)&v44 = sub_24616796C;
  *((_QWORD *)&v44 + 1) = v22;
  v46 = 0;
  v23 = v1 + v6[6];
  v24 = *MEMORY[0x24BEAD978];
  v25 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  v26 = v39;
  *(_QWORD *)v1 = v40;
  *(_QWORD *)(v1 + 8) = v26;
  *(_BYTE *)(v1 + 16) = v38 & 1;
  *(_QWORD *)(v1 + 24) = v37;
  sub_246167C44((uint64_t)&v44, v1 + 32);
  *(_QWORD *)(v1 + v6[7]) = 0;
  *(_QWORD *)(v1 + v6[8]) = 0;
  sub_246167C80(v1, v12, type metadata accessor for CalendarButtonView.Model);
  v27 = v12 + *(int *)(v8 + 20);
  *(_QWORD *)v27 = swift_getKeyPath();
  *(_BYTE *)(v27 + 8) = 0;
  sub_2461877A8();
  v28 = *(_QWORD *)(v0 + 24);
  v44 = *(_OWORD *)(v0 + 8);
  v45 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E9A8);
  sub_2461876DC();
  v30 = v42;
  v29 = v43;
  swift_bridgeObjectRelease();
  v31 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0)
    v31 = v30 & 0xFFFFFFFFFFFFLL;
  v32 = v31 == 0;
  KeyPath = swift_getKeyPath();
  v34 = swift_allocObject();
  *(_BYTE *)(v34 + 16) = v32;
  sub_246168784(v12, v16, type metadata accessor for CalendarButtonView);
  v35 = (uint64_t *)(v16 + *(int *)(v41 + 36));
  *v35 = KeyPath;
  v35[1] = (uint64_t)sub_24616876C;
  v35[2] = v34;
  sub_246163D44(v12, type metadata accessor for CalendarButtonView);
  sub_2461687A4();
  sub_246187574();
  sub_246163934(v16, &qword_25754EA10);
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_246167814()
{
  char v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v9;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_3();
  if ((v1 & 1) != 0)
    return v0 & 1;
  swift_retain();
  sub_246187934();
  v3 = sub_24618749C();
  if (OUTLINED_FUNCTION_23(v3))
  {
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_30(4.8149e-34);
    v5 = sub_246167FB8(1819242306, 0xE400000000000000, v4);
    OUTLINED_FUNCTION_9_0(v5);
    OUTLINED_FUNCTION_14(&dword_24615C000, v6, v7, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_2_3();
  }

  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_15();
  return v9;
}

uint64_t sub_246167910()
{
  return sub_24616792C((uint64_t (*)(uint64_t))sub_246165C9C);
}

uint64_t sub_246167920()
{
  return sub_24616792C((uint64_t (*)(uint64_t))sub_24616655C);
}

uint64_t sub_24616792C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  return a1(v1 + v2);
}

unint64_t sub_246167970()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25754E9C8;
  if (!qword_25754E9C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E998);
    v2[0] = sub_246168848(&qword_25754E9D0, &qword_25754E990);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754E9C8);
  }
  return result;
}

unint64_t sub_2461679F4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754E9D8;
  if (!qword_25754E9D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E988);
    v2 = sub_246167A78();
    sub_2461689F8(&qword_25754E9E8, &qword_25754E9C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754E9D8);
  }
  return result;
}

unint64_t sub_246167A78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_25754E9E0;
  if (!qword_25754E9E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E980);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E970);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E968);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E960);
    sub_246187448();
    v3 = (void (*)(uint64_t))MEMORY[0x24BDEF048];
    sub_2461689F8(&qword_25754E9B0, &qword_25754E960);
    v5 = v4;
    sub_24615EEBC(&qword_25754E9B8, v3);
    v7[4] = v5;
    v7[5] = v6;
    swift_getOpaqueTypeConformance2();
    v7[2] = v2;
    v7[3] = swift_getOpaqueTypeConformance2();
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v7);
    atomic_store(result, (unint64_t *)&qword_25754E9E0);
  }
  return result;
}

unint64_t sub_246167BC0()
{
  unint64_t result;

  result = qword_25754E9F0;
  if (!qword_25754E9F0)
  {
    result = MEMORY[0x2495523E0](&unk_2461881DC, &type metadata for NotifyAUIOfEditingModifier);
    atomic_store(result, (unint64_t *)&qword_25754E9F0);
  }
  return result;
}

unint64_t sub_246167BFC()
{
  unint64_t result;

  result = qword_25754EA00;
  if (!qword_25754EA00)
  {
    result = MEMORY[0x2495523E0](MEMORY[0x24BE91A58], MEMORY[0x24BE91A60]);
    atomic_store(result, (unint64_t *)&qword_25754EA00);
  }
  return result;
}

uint64_t sub_246167C44(uint64_t a1, uint64_t a2)
{
  __swift_memcpy41_8(a2, a1);
  return a2;
}

void sub_246167C80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_9(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void sub_246167CB4()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_3();
  if ((v0 & 1) == 0)
  {
    swift_retain();
    sub_246187934();
    v2 = sub_24618749C();
    if (OUTLINED_FUNCTION_23(v2))
    {
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_30(4.8149e-34);
      v4 = sub_246167FB8(0x6D6F696449585256, 0xE800000000000000, v3);
      OUTLINED_FUNCTION_9_0(v4);
      OUTLINED_FUNCTION_14(&dword_24615C000, v5, v6, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_2_3();
    }

    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_15();
  }
  OUTLINED_FUNCTION_1_4();
}

void sub_246167D9C()
{
  sub_246167DE8();
}

void sub_246167DC0()
{
  sub_246167DE8();
}

void sub_246167DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t (*v7)(_QWORD);
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint8_t *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_3_2();
  v4 = v3;
  v19 = v5;
  v7 = v6;
  v9 = v8;
  v10 = v0;
  v12 = v11;
  v13 = sub_2461873A0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_3();
  __swift_instantiateConcreteTypeFromMangledName(v9);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4_2();
  sub_24615EEF0(v10, v2, v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = v7(0);
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v12, v2, v16);
  }
  else
  {
    v17 = sub_246187934();
    v18 = sub_24618749C();
    if (os_log_type_enabled(v18, v17))
    {
      OUTLINED_FUNCTION_13();
      v20 = OUTLINED_FUNCTION_6_1();
      *(_DWORD *)v12 = 136315138;
      sub_246167FB8(v19, v4, &v20);
      sub_24618797C();
      _os_log_impl(&dword_24615C000, v18, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_3();
    }

    OUTLINED_FUNCTION_29();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v13);
  }
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_246167FB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_246168088(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_246168A70((uint64_t)v12, *a3);
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
      sub_246168A70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_246168088(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2461681DC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_246187988();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2461682A0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2461879A0();
    if (!v8)
    {
      result = sub_2461879AC();
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

void *sub_2461681DC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2461879C4();
  __break(1u);
  return result;
}

uint64_t sub_2461682A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246168334(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246168508(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246168508((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246168334(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2461878EC();
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
  v3 = sub_2461684A4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_246187994();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2461879C4();
  __break(1u);
LABEL_14:
  result = sub_2461879AC();
  __break(1u);
  return result;
}

_QWORD *sub_2461684A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA78);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246168508(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA78);
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
    sub_2461686A0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461685DC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2461685DC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2461879C4();
  __break(1u);
  return result;
}

char *sub_2461686A0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2461879C4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_246168720(_BYTE *a1@<X8>)
{
  *a1 = sub_24618734C() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_246168748()
{
  sub_246187358();
  OUTLINED_FUNCTION_1();
}

_BYTE *sub_24616876C(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

void sub_246168784(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_9(a1, a2, a3);
  OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1();
}

unint64_t sub_2461687A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EA18;
  if (!qword_25754EA18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EA10);
    sub_24615EEBC(&qword_25754EA20, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    v3 = v2;
    sub_2461689F8(&qword_25754EA28, &qword_25754EA30);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EA18);
  }
  return result;
}

uint64_t sub_246168848(unint64_t *a1, uint64_t *a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_26(0, a2);
    v6[0] = v2();
    v6[1] = sub_246167BC0();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2461688AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754EA68;
  if (!qword_25754EA68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EA48);
    sub_2461689F8(&qword_25754E9B0, &qword_25754E960);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754EA68);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_12();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_release();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_24615EB8C(*(_QWORD *)(v3 + *(int *)(v1 + 28)), *(_BYTE *)(v3 + *(int *)(v1 + 28) + 8));
  return swift_deallocObject();
}

void sub_2461689D4()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11();
  sub_246165854();
  OUTLINED_FUNCTION_1();
}

void sub_2461689F8(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    OUTLINED_FUNCTION_26(0, a2);
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246168A28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EA40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246168A70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_246168AB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EA80;
  if (!qword_25754EA80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EA88);
    sub_2461689F8(&qword_25754E940, &qword_25754E928);
    v3 = v2;
    sub_2461689F8(&qword_25754E948, &qword_25754E918);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EA80);
  }
  return result;
}

void OUTLINED_FUNCTION_2_3()
{
  JUMPOUT(0x249552434);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_24618797C();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return type metadata accessor for PromptForTitleSnippet();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_24615EB8C(v0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_2461873A0();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_22(_QWORD *a1, uint64_t *a2)
{
  sub_2461689F8(a1, a2);
}

BOOL OUTLINED_FUNCTION_23(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_246187394();
}

void OUTLINED_FUNCTION_30(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_24618773C();
}

uint64_t sub_246168CD8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
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
  char v63;
  __int128 v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v29 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v72 = (uint64_t)a2 + v13;
    v73 = v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v73, v72, v14);
    *(_BYTE *)(v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)(v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)(v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (_BYTE *)(v4 + v24);
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)(v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)(v4 + v36) = v37;
    v38 = v35[6];
    v39 = v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)(v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[6];
    *(_QWORD *)(v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v49 = v4 + v48;
    v50 = (uint64_t)a2 + v48;
    v51 = sub_2461877B4();
    v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
    v53 = a3[7];
    v54 = v4 + v53;
    v55 = (uint64_t)a2 + v53;
    v56 = *(uint64_t *)((char *)a2 + v53);
    LOBYTE(v35) = *((_BYTE *)a2 + v53 + 8);
    sub_24615EB54(v56, (char)v35);
    *(_QWORD *)v54 = v56;
    *(_BYTE *)(v54 + 8) = (_BYTE)v35;
    *(_OWORD *)(v54 + 16) = *(_OWORD *)(v55 + 16);
    v57 = *(_QWORD *)(v55 + 40);
    *(_QWORD *)(v54 + 32) = *(_QWORD *)(v55 + 32);
    *(_QWORD *)(v54 + 40) = v57;
    v58 = a3[8];
    v59 = v4 + v58;
    v60 = (uint64_t)a2 + v58;
    v61 = *(uint64_t *)((char *)a2 + v58);
    v62 = *(_QWORD *)(v60 + 8);
    *(_QWORD *)v59 = v61;
    *(_QWORD *)(v59 + 8) = v62;
    *(_BYTE *)(v59 + 16) = *(_BYTE *)(v60 + 16);
    *(_QWORD *)(v59 + 24) = *(_QWORD *)(v60 + 24);
    v63 = *(_BYTE *)(v60 + 72);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v63 & 1) != 0)
    {
      v64 = *(_OWORD *)(v60 + 56);
      *(_OWORD *)(v59 + 56) = v64;
      (**(void (***)(uint64_t, uint64_t))(v64 - 8))(v59 + 32, v60 + 32);
    }
    else
    {
      v65 = *(_QWORD *)(v60 + 40);
      *(_QWORD *)(v59 + 32) = *(_QWORD *)(v60 + 32);
      *(_QWORD *)(v59 + 40) = v65;
      swift_retain();
    }
    *(_BYTE *)(v59 + 72) = v63;
    v66 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    v67 = v66[6];
    v68 = v59 + v67;
    v69 = v60 + v67;
    v70 = sub_246187730();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 16))(v68, v69, v70);
    *(_QWORD *)(v59 + v66[7]) = *(_QWORD *)(v60 + v66[7]);
    *(_QWORD *)(v59 + v66[8]) = *(_QWORD *)(v60 + v66[8]);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2461690DC(uint64_t a1, int *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = a1 + a2[6];
  v15 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  sub_24615EB8C(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  swift_release();
  v16 = a1 + a2[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v16 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v16 + 32);
  else
    swift_release();
  v17 = v16 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  v18 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  swift_release();
  return swift_release();
}

uint64_t sub_246169304(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
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
  char v61;
  __int128 v62;
  uint64_t v63;
  int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v70 = a2 + v12;
  v71 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v71, v70, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = sub_2461877B4();
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  v51 = a3[7];
  v52 = a1 + v51;
  v53 = a2 + v51;
  v54 = *(_QWORD *)(a2 + v51);
  LOBYTE(v33) = *(_BYTE *)(a2 + v51 + 8);
  sub_24615EB54(v54, (char)v33);
  *(_QWORD *)v52 = v54;
  *(_BYTE *)(v52 + 8) = (_BYTE)v33;
  *(_OWORD *)(v52 + 16) = *(_OWORD *)(v53 + 16);
  v55 = *(_QWORD *)(v53 + 40);
  *(_QWORD *)(v52 + 32) = *(_QWORD *)(v53 + 32);
  *(_QWORD *)(v52 + 40) = v55;
  v56 = a3[8];
  v57 = a1 + v56;
  v58 = a2 + v56;
  v59 = *(_QWORD *)(a2 + v56);
  v60 = *(_QWORD *)(v58 + 8);
  *(_QWORD *)v57 = v59;
  *(_QWORD *)(v57 + 8) = v60;
  *(_BYTE *)(v57 + 16) = *(_BYTE *)(v58 + 16);
  *(_QWORD *)(v57 + 24) = *(_QWORD *)(v58 + 24);
  v61 = *(_BYTE *)(v58 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v61 & 1) != 0)
  {
    v62 = *(_OWORD *)(v58 + 56);
    *(_OWORD *)(v57 + 56) = v62;
    (**(void (***)(uint64_t, uint64_t))(v62 - 8))(v57 + 32, v58 + 32);
  }
  else
  {
    v63 = *(_QWORD *)(v58 + 40);
    *(_QWORD *)(v57 + 32) = *(_QWORD *)(v58 + 32);
    *(_QWORD *)(v57 + 40) = v63;
    swift_retain();
  }
  *(_BYTE *)(v57 + 72) = v61;
  v64 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v65 = v64[6];
  v66 = v57 + v65;
  v67 = v58 + v65;
  v68 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 16))(v66, v67, v68);
  *(_QWORD *)(v57 + v64[7]) = *(_QWORD *)(v58 + v64[7]);
  *(_QWORD *)(v57 + v64[8]) = *(_QWORD *)(v58 + v64[8]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_2461696E0(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      v23 = *(int *)(v20 + 28);
      v24 = (void *)(v18 + v23);
      v25 = (const void *)(v19 + v23);
      v26 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v22)
  {
    sub_246163D44(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  if (a1 != a2)
  {
    v30 = *(int *)(v20 + 28);
    v31 = v18 + v30;
    v32 = (const void *)(v19 + v30);
    sub_246163D44(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
    v33 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    v69 = sub_246186F74();
    (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v69 - 8) + 16))(v31, v32, v69);
    swift_storeEnumTagMultiPayload();
  }
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47 = a3[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  v51 = a3[7];
  v52 = a1 + v51;
  v53 = (_QWORD *)(a2 + v51);
  v54 = *(_QWORD *)(a2 + v51);
  LOBYTE(v49) = *(_BYTE *)(a2 + v51 + 8);
  sub_24615EB54(v54, v49);
  v55 = *(_QWORD *)v52;
  v56 = *(_BYTE *)(v52 + 8);
  *(_QWORD *)v52 = v54;
  *(_BYTE *)(v52 + 8) = v49;
  sub_24615EB8C(v55, v56);
  *(_QWORD *)(v52 + 16) = v53[2];
  *(_QWORD *)(v52 + 24) = v53[3];
  v57 = v53[5];
  *(_QWORD *)(v52 + 32) = v53[4];
  *(_QWORD *)(v52 + 40) = v57;
  swift_retain();
  swift_release();
  v58 = a3[8];
  v59 = a1 + v58;
  v60 = a2 + v58;
  *(_QWORD *)v59 = *(_QWORD *)(a2 + v58);
  *(_QWORD *)(v59 + 8) = *(_QWORD *)(a2 + v58 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v59 + 16) = *(_BYTE *)(v60 + 16);
  *(_QWORD *)(v59 + 24) = *(_QWORD *)(v60 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v59 + 32);
    if ((*(_BYTE *)(v60 + 72) & 1) != 0)
    {
      v61 = *(_QWORD *)(v60 + 56);
      *(_QWORD *)(v59 + 56) = v61;
      *(_QWORD *)(v59 + 64) = *(_QWORD *)(v60 + 64);
      (**(void (***)(uint64_t, uint64_t))(v61 - 8))(v59 + 32, v60 + 32);
      *(_BYTE *)(v59 + 72) = 1;
    }
    else
    {
      v62 = *(_QWORD *)(v60 + 40);
      *(_QWORD *)(v59 + 32) = *(_QWORD *)(v60 + 32);
      *(_QWORD *)(v59 + 40) = v62;
      *(_BYTE *)(v59 + 72) = 0;
      swift_retain();
    }
  }
  v63 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v64 = v63[6];
  v65 = v59 + v64;
  v66 = v60 + v64;
  v67 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
  *(_QWORD *)(v59 + v63[7]) = *(_QWORD *)(v60 + v63[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(v59 + v63[8]) = *(_QWORD *)(v60 + v63[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_246169C90(uint64_t a1)
{
  destroy for CalendarButtonView.Model.Action(a1);
  return a1;
}

_OWORD *sub_246169CC4(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  __int128 v36;
  _OWORD *v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  int *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  v32 = a3[7];
  v33 = a3[8];
  v34 = (_OWORD *)((char *)a1 + v32);
  v35 = (_OWORD *)((char *)a2 + v32);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  v34[2] = v35[2];
  v37 = (_OWORD *)((char *)a1 + v33);
  v38 = (char *)a2 + v33;
  v39 = *(_OWORD *)((char *)a2 + v33 + 16);
  *v37 = *(_OWORD *)((char *)a2 + v33);
  v37[1] = v39;
  v40 = *(_OWORD *)((char *)a2 + v33 + 48);
  v37[2] = *(_OWORD *)((char *)a2 + v33 + 32);
  v37[3] = v40;
  *(_OWORD *)((char *)v37 + 57) = *(_OWORD *)((char *)a2 + v33 + 57);
  v41 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v42 = v41[6];
  v43 = (char *)v37 + v42;
  v44 = &v38[v42];
  v45 = sub_246187730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
  *(_QWORD *)((char *)v37 + v41[7]) = *(_QWORD *)&v38[v41[7]];
  *(_QWORD *)((char *)v37 + v41[8]) = *(_QWORD *)&v38[v41[8]];
  return a1;
}

uint64_t sub_246169F90(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  int *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      v32 = *(int *)(v29 + 28);
      v33 = (void *)(v27 + v32);
      v34 = (const void *)(v28 + v32);
      v35 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
      }
      else
      {
        v43 = sub_246186F74();
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v31)
  {
    sub_246163D44(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  if (a1 != a2)
  {
    v39 = *(int *)(v29 + 28);
    v40 = v27 + v39;
    v41 = (const void *)(v28 + v39);
    sub_246163D44(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
    v42 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    v77 = sub_246186F74();
    (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v77 - 8) + 32))(v40, v41, v77);
    swift_storeEnumTagMultiPayload();
  }
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v56 = a3[6];
  v57 = a1 + v56;
  v58 = a2 + v56;
  v59 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 40))(v57, v58, v59);
  v60 = a3[7];
  v61 = a1 + v60;
  v62 = a2 + v60;
  v63 = *(_BYTE *)(a2 + v60 + 8);
  v64 = *(_QWORD *)(a1 + v60);
  v65 = *(_BYTE *)(a1 + v60 + 8);
  *(_QWORD *)v61 = *(_QWORD *)(a2 + v60);
  *(_BYTE *)(v61 + 8) = v63;
  sub_24615EB8C(v64, v65);
  *(_QWORD *)(v61 + 16) = *(_QWORD *)(v62 + 16);
  *(_QWORD *)(v61 + 24) = *(_QWORD *)(v62 + 24);
  *(_OWORD *)(v61 + 32) = *(_OWORD *)(v62 + 32);
  swift_release();
  v66 = a3[8];
  v67 = a1 + v66;
  v68 = a2 + v66;
  v69 = *(_QWORD *)(a2 + v66 + 8);
  *(_QWORD *)v67 = *(_QWORD *)(a2 + v66);
  *(_QWORD *)(v67 + 8) = v69;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v67 + 16) = *(_BYTE *)(v68 + 16);
  *(_QWORD *)(v67 + 24) = *(_QWORD *)(v68 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v67 + 32);
    v70 = *(_OWORD *)(v68 + 48);
    *(_OWORD *)(v67 + 32) = *(_OWORD *)(v68 + 32);
    *(_OWORD *)(v67 + 48) = v70;
    *(_OWORD *)(v67 + 57) = *(_OWORD *)(v68 + 57);
  }
  v71 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v72 = v71[6];
  v73 = v67 + v72;
  v74 = v68 + v72;
  v75 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 40))(v73, v74, v75);
  *(_QWORD *)(v67 + v71[7]) = *(_QWORD *)(v68 + v71[7]);
  swift_release();
  *(_QWORD *)(v67 + v71[8]) = *(_QWORD *)(v68 + v71[8]);
  swift_release();
  return a1;
}

uint64_t sub_24616A41C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24616A428(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v6 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v11 = OUTLINED_FUNCTION_7();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v11;
      v12 = a3[6];
    }
    else
    {
      v7 = OUTLINED_FUNCTION_16();
      v12 = a3[8];
    }
    v8 = v4 + v12;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + a3[5]);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_24616A4D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24616A4E0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + a4[5]) = (v4 - 1);
      return result;
    }
    v11 = OUTLINED_FUNCTION_7();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = a4[6];
    }
    else
    {
      v9 = OUTLINED_FUNCTION_16();
      v12 = a4[8];
    }
    v10 = v5 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for ConflictingEventConfirmationSnippet()
{
  uint64_t result;

  result = qword_25754EAE8;
  if (!qword_25754EAE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24616A5C0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    result = sub_2461877B4();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for CalendarButtonView.Model(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_24616A674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24616A684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  id v5;
  uint64_t v7;

  OUTLINED_FUNCTION_17_0();
  sub_2461876B8();
  sub_246187568();
  OUTLINED_FUNCTION_14_0();
  v0 = sub_246187520();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_17_0();
  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v5 = (id)qword_257550D20;
  sub_24618755C();
  OUTLINED_FUNCTION_14_0();
  v7 = sub_246187520();
  OUTLINED_FUNCTION_7_0();
  sub_24615EF54(v0, v2, v4 & 1);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_24616A7F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_12_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246168784(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ConflictingEventConfirmationSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246167C80((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for ConflictingEventConfirmationSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB30);
  sub_24615EFA0(&qword_25754EB38, &qword_25754EB30);
  return sub_24618773C();
}

uint64_t sub_24616A8E4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *boxed_opaque_existential_1;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  int *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  int *v87;
  void (*v88)(char *, uint64_t);
  void (*v89)(char *, uint64_t);
  void (*v90)(char *, uint64_t);
  void (*v91)(char *, uint64_t);
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, char *, uint64_t);
  void (*v104)(char *, char *, uint64_t);
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122[5];
  uint64_t v123[5];

  v93 = a1;
  v107 = a2;
  v106 = sub_246187754();
  v114 = *(_QWORD *)(v106 - 8);
  v3 = MEMORY[0x24BDAC7A8](v106);
  v105 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v113 = (char *)&v93 - v5;
  v104 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_25754EB40);
  MEMORY[0x24BDAC7A8](v104);
  v103 = (void (*)(char *, char *, uint64_t))((char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB48);
  v120 = *(_QWORD *)(v112 - 8);
  v7 = MEMORY[0x24BDAC7A8](v112);
  v117 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v121 = (char *)&v93 - v9;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB50);
  MEMORY[0x24BDAC7A8](v98);
  v96 = (uint64_t *)((char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB58);
  MEMORY[0x24BDAC7A8](v11);
  v94 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB60);
  MEMORY[0x24BDAC7A8](v95);
  v14 = (char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB68);
  MEMORY[0x24BDAC7A8](v100);
  v97 = (uint64_t)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB70);
  v102 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB78);
  v119 = *(_QWORD *)(v111 - 8);
  v17 = MEMORY[0x24BDAC7A8](v111);
  v115 = (char *)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v118 = (char *)&v93 - v19;
  v20 = sub_246187058();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (int *)type metadata accessor for SingleEventView();
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v93 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB80);
  v116 = *(_QWORD *)(v110 - 8);
  v27 = MEMORY[0x24BDAC7A8](v110);
  v29 = (char *)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v93 - v30;
  v109 = (char *)&v93 - v30;
  sub_246168784(a1, (uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v26[v24[5]] = 0;
  v32 = &v26[v24[6]];
  *(_QWORD *)v32 = swift_getKeyPath();
  v32[8] = 0;
  sub_2461877A8();
  v33 = &v26[v24[8]];
  *(_QWORD *)v33 = swift_getKeyPath();
  v33[8] = 0;
  *((_QWORD *)v33 + 2) = 0x4030000000000000;
  *((_QWORD *)v33 + 3) = 1;
  *((_QWORD *)v33 + 4) = sub_2461752BC;
  *((_QWORD *)v33 + 5) = 0;
  v34 = &v26[v24[9]];
  *(_QWORD *)v34 = swift_getKeyPath();
  v34[8] = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v23, *MEMORY[0x24BEAB4E8], v20);
  sub_24615EEBC(&qword_25754EB88, (void (*)(uint64_t))type metadata accessor for SingleEventView);
  v108 = v29;
  sub_2461875A4();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  sub_246163D44((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v31, v29, v110);
  v35 = sub_24616A684();
  v37 = v36;
  v39 = v38;
  LOBYTE(v23) = v40 & 1;
  v41 = (uint64_t)v94;
  sub_246187454();
  v42 = sub_246187460();
  __swift_storeEnumTagSinglePayload(v41, 0, 1, v42);
  KeyPath = swift_getKeyPath();
  v44 = v96;
  sub_24615EEF0(v41, (uint64_t)v96 + *(int *)(v98 + 28), &qword_25754EB58);
  *v44 = KeyPath;
  sub_24615EEF0((uint64_t)v44, (uint64_t)&v14[*(int *)(v95 + 36)], &qword_25754EB50);
  *(_QWORD *)v14 = v35;
  *((_QWORD *)v14 + 1) = v37;
  v14[16] = (char)v23;
  *((_QWORD *)v14 + 3) = v39;
  sub_24615EFD4(v35, v37, (char)v23);
  swift_bridgeObjectRetain();
  sub_246163934((uint64_t)v44, &qword_25754EB50);
  sub_246163934(v41, &qword_25754EB58);
  sub_24615EF54(v35, v37, (char)v23);
  swift_bridgeObjectRelease();
  LOBYTE(v39) = sub_2461874A8();
  v45 = v97;
  sub_24615EEF0((uint64_t)v14, v97, &qword_25754EB60);
  v46 = v100;
  v47 = v45 + *(int *)(v100 + 36);
  *(_BYTE *)v47 = v39;
  *(_OWORD *)(v47 + 8) = 0u;
  *(_OWORD *)(v47 + 24) = 0u;
  *(_BYTE *)(v47 + 40) = 1;
  sub_246163934((uint64_t)v14, &qword_25754EB60);
  v48 = type metadata accessor for ConflictingEventConfirmationSnippet();
  v49 = v93;
  v50 = sub_24616C10C();
  v51 = v99;
  sub_2461875BC();
  sub_246163934(v45, &qword_25754EB68);
  v123[0] = v46;
  v123[1] = v50;
  swift_getOpaqueTypeConformance2();
  v52 = v115;
  v53 = v101;
  sub_2461875B0();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v51, v53);
  (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v118, v52, v111);
  v54 = sub_246187424();
  v55 = (uint64_t)v103;
  *(_QWORD *)v103 = v54;
  *(_QWORD *)(v55 + 8) = 0x4024000000000000;
  *(_BYTE *)(v55 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EBA8);
  v123[0] = *(_QWORD *)(v49 + *(int *)(v48 + 20));
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EBB0);
  sub_24615EFA0(&qword_25754E6F8, &qword_25754E6E8);
  sub_24616C1FC();
  sub_24615EEBC(&qword_25754E740, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  sub_24618770C();
  sub_24615EFA0(&qword_25754EBD0, &qword_25754EB40);
  v56 = v117;
  sub_2461875B0();
  sub_246163934(v55, &qword_25754EB40);
  (*(void (**)(char *, char *, uint64_t))(v120 + 32))(v121, v56, v112);
  v57 = v49 + *(int *)(v48 + 32);
  v58 = type metadata accessor for CalendarButtonView(0);
  v123[3] = v58;
  sub_24615EEBC(&qword_25754E9F8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
  v60 = v59;
  v123[4] = v59;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v123);
  sub_246168784(v57, (uint64_t)boxed_opaque_existential_1, type metadata accessor for CalendarButtonView.Model);
  v62 = (char *)boxed_opaque_existential_1 + *(int *)(v58 + 20);
  *(_QWORD *)v62 = swift_getKeyPath();
  v62[8] = 0;
  sub_2461877A8();
  v63 = sub_246187400();
  v65 = v64;
  LOBYTE(v45) = v66;
  v68 = v67;
  v122[3] = v58;
  v122[4] = v60;
  v69 = __swift_allocate_boxed_opaque_existential_1(v122);
  v69[7] = MEMORY[0x24BE91A60];
  v69[8] = sub_246167BFC();
  *((_BYTE *)v69 + 32) = 2;
  *((_BYTE *)v69 + 72) = 1;
  v70 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v71 = (char *)v69 + v70[6];
  v72 = *MEMORY[0x24BEAD970];
  v73 = sub_246187730();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 104))(v71, v72, v73);
  *v69 = v63;
  v69[1] = v65;
  *((_BYTE *)v69 + 16) = v45 & 1;
  v69[3] = v68;
  *(uint64_t *)((char *)v69 + v70[7]) = 0;
  *(uint64_t *)((char *)v69 + v70[8]) = 0;
  v74 = (char *)v69 + *(int *)(v58 + 20);
  *(_QWORD *)v74 = swift_getKeyPath();
  v74[8] = 0;
  sub_2461877A8();
  v75 = v113;
  sub_246187748();
  v76 = *(void (**)(char *, char *, uint64_t))(v116 + 16);
  v77 = v108;
  v78 = v110;
  v76(v108, v109, v110);
  v102 = *(_QWORD *)(v119 + 16);
  v79 = v115;
  v80 = v111;
  ((void (*)(char *, char *, uint64_t))v102)(v115, v118, v111);
  v103 = *(void (**)(char *, char *, uint64_t))(v120 + 16);
  v81 = v117;
  v82 = v112;
  v103(v117, v121, v112);
  v104 = *(void (**)(char *, char *, uint64_t))(v114 + 16);
  v83 = v105;
  v84 = v75;
  v85 = v106;
  v104(v105, v84, v106);
  v86 = v107;
  v76(v107, v77, v78);
  v87 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25754EBD8);
  ((void (*)(char *, char *, uint64_t))v102)(&v86[v87[12]], v79, v80);
  v103(&v86[v87[16]], v81, v82);
  v104(&v86[v87[20]], v83, v85);
  v88 = *(void (**)(char *, uint64_t))(v114 + 8);
  v88(v113, v85);
  v89 = *(void (**)(char *, uint64_t))(v120 + 8);
  v89(v121, v82);
  v90 = *(void (**)(char *, uint64_t))(v119 + 8);
  v90(v118, v80);
  v91 = *(void (**)(char *, uint64_t))(v116 + 8);
  v91(v109, v78);
  v88(v83, v85);
  v89(v117, v82);
  v90(v115, v80);
  return ((uint64_t (*)(char *, uint64_t))v91)(v108, v78);
}

uint64_t sub_24616B4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v4 = (int *)type metadata accessor for EventCellView();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for RenderableEvent();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246168784(a1, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v13 = sub_246186F74();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v13);
  v14 = (uint64_t)&v6[v4[5]];
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v13);
  v15 = &v6[v4[7]];
  *(_QWORD *)v15 = swift_getKeyPath();
  v15[8] = 0;
  sub_246167C80((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_246163CA4((uint64_t)v9, v14);
  v6[v4[6]] = 0;
  sub_246167C80((uint64_t)v6, a2, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EBB0);
  sub_246168784(a1, a2 + *(int *)(v16 + 36), (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  type metadata accessor for PunchoutToEventDetailsModifier();
  return sub_2461877A8();
}

uint64_t sub_24616B670()
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
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);

  v1 = (int *)type metadata accessor for ConflictingEventConfirmationSnippet();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v5);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_4_3();
  v6 = v3 + *(int *)(v4 + 48);
  v7 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v8 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v8);
    }
  }
  swift_bridgeObjectRelease();

  v9 = sub_2461870C4();
  OUTLINED_FUNCTION_3_1(v9);
  OUTLINED_FUNCTION_4_3();
  swift_bridgeObjectRelease();
  v10 = v3 + v1[6];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0();
  v11(v10);
  sub_24615EB8C(*(_QWORD *)(v3 + v1[7]), *(_BYTE *)(v3 + v1[7] + 8));
  swift_release();
  v12 = v3 + v1[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v12 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v12 + 32);
  else
    swift_release();
  v13 = v12 + *(int *)(OUTLINED_FUNCTION_16() + 24);
  sub_246187730();
  OUTLINED_FUNCTION_8_0();
  v14(v13);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24616B87C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_12_0() - 8) + 80);
  return sub_24616A8E4(v1 + ((v2 + 16) & ~v2), v0);
}

void sub_24616B8B8(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
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
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void);
  uint64_t v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v67 = a2;
  v64 = a3;
  v68 = a1;
  v5 = sub_2461870C4();
  v54 = *(_QWORD *)(v5 - 8);
  v55 = v5;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_3();
  v65 = v7;
  v8 = sub_246186F98();
  v62 = *(_QWORD *)(v8 - 8);
  v63 = v8;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_3();
  v61 = v10;
  sub_246187124();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for RenderableEvent();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3_3();
  v59 = v15;
  v16 = (int *)type metadata accessor for ConflictingEventConfirmationSnippet();
  v57 = a4 + v16[6];
  sub_2461877A8();
  v17 = a4 + v16[7];
  *(_QWORD *)v17 = swift_getKeyPath();
  *(_BYTE *)(v17 + 8) = 0;
  *(_QWORD *)(v17 + 16) = 0x4030000000000000;
  *(_QWORD *)(v17 + 24) = 1;
  *(_QWORD *)(v17 + 32) = sub_2461752BC;
  *(_QWORD *)(v17 + 40) = 0;
  v58 = v17;
  v53 = v16;
  v18 = v16[8];
  v56 = a4;
  v19 = a4 + v18;
  v20 = sub_246187400();
  v22 = v21;
  LOBYTE(v16) = v23;
  v25 = v24;
  *(_QWORD *)(v19 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(v19 + 64) = sub_246167BFC();
  *(_BYTE *)(v19 + 32) = 0;
  *(_BYTE *)(v19 + 72) = 1;
  v26 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v27 = v19 + v26[6];
  v28 = *MEMORY[0x24BEAD978];
  v29 = sub_246187730();
  v30 = v28;
  v31 = v59;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v30, v29);
  *(_QWORD *)v19 = v20;
  *(_QWORD *)(v19 + 8) = v22;
  *(_BYTE *)(v19 + 16) = v16 & 1;
  *(_QWORD *)(v19 + 24) = v25;
  *(_QWORD *)(v19 + v26[7]) = 0;
  *(_QWORD *)(v19 + v26[8]) = 0;
  sub_246168784(v68, (uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
  v32 = v60;
  v33 = (uint64_t *)(v31 + *(int *)(v60 + 28));
  v34 = v64;
  v35 = v61;
  sub_246186F8C();
  v36 = sub_246186F80();
  v38 = v37;
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v35, v63);
  *v33 = v36;
  v33[1] = v38;
  v39 = v65;
  sub_246168784((uint64_t)v13, v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
  v40 = sub_24617FDAC(v34);
  v41 = v32;
  v42 = *(int *)(v32 + 20);
  *(_QWORD *)(v31 + v42) = v40;
  v43 = v66;
  sub_246180008(v34, v39);
  if (v43)
  {

    v44 = MEMORY[0x24BE91AE8];
    sub_246163D44((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
    sub_246163D44(v31, (uint64_t (*)(_QWORD))v44);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_246163D44(v68, (uint64_t (*)(_QWORD))v44);
    sub_2461877B4();
    OUTLINED_FUNCTION_8_0();
    v50(v57);
    sub_24615EB8C(*(_QWORD *)v58, *(_BYTE *)(v58 + 8));
    swift_release();
    sub_246163D44(v19, type metadata accessor for CalendarButtonView.Model);
  }
  else
  {
    v45 = v31;
    v46 = v53;

    sub_246163D44((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v45 + *(int *)(v41 + 24), v39, v55);
    v47 = v45;
    v48 = v56;
    sub_246167C80(v47, v56, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
    v49 = v34;
    v51 = sub_24616BCD4(v67, v49);

    sub_246163D44(v68, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v48 + v46[5]) = v51;
  }
}

uint64_t sub_24616BCD4(uint64_t a1, void *a2)
{
  uint64_t v2;
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
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t *v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;

  v5 = sub_2461870C4();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_246186F98();
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_246187124();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v42 = (uint64_t)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RenderableEvent();
  v39 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a1 + 16);
  if (v16)
  {
    v38 = v7;
    v47 = v2;
    v48 = MEMORY[0x24BEE4AF8];
    sub_246175120(0, v16, 0);
    v17 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v36 = *(_QWORD *)(v11 + 72);
    v37 = a2;
    while (1)
    {
      v46 = v16;
      v18 = (uint64_t)v15;
      v19 = (int *)v13;
      v20 = v42;
      sub_246168784(v17, v42, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v21 = (uint64_t *)&v15[v19[7]];
      v22 = a2;
      v23 = v43;
      sub_246186F8C();
      v24 = sub_246186F80();
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v45);
      *v21 = v24;
      v21[1] = v26;
      sub_246168784(v20, v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v27 = sub_24617FDAC(v22);
      v28 = v19[5];
      *(_QWORD *)(v18 + v28) = v27;
      v29 = (uint64_t)v38;
      v30 = v47;
      sub_246180008(v22, (uint64_t)v38);

      sub_246163D44(v20, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v47 = v30;
      if (v30)
        break;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v18 + v19[6], v29, v41);
      v31 = v48;
      v15 = (char *)v18;
      v13 = (uint64_t)v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246175120(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v31 = v48;
      }
      v32 = v46;
      v34 = *(_QWORD *)(v31 + 16);
      v33 = *(_QWORD *)(v31 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_246175120(v33 > 1, v34 + 1, 1);
        v31 = v48;
      }
      *(_QWORD *)(v31 + 16) = v34 + 1;
      sub_246167C80(v18, v31+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(_QWORD *)(v39 + 72) * v34, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
      a2 = v37;
      v17 += v36;
      v16 = v32 - 1;
      if (!v16)
      {

        return v31;
      }
    }
    sub_246163D44(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);

    swift_bridgeObjectRelease();
    v31 = v48;

    swift_release();
  }
  else
  {

    return MEMORY[0x24BEE4AF8];
  }
  return v31;
}

void sub_24616C034()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_11_0() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_24616C054()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24616C06C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EB58);
  MEMORY[0x24BDAC7A8](v2);
  sub_24615EEF0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25754EB58);
  return sub_2461872F8();
}

void sub_24616C0EC()
{
  sub_2461872EC();
  OUTLINED_FUNCTION_1();
}

unint64_t sub_24616C10C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25754EB90;
  if (!qword_25754EB90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EB68);
    v2[0] = sub_24616C178();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754EB90);
  }
  return result;
}

unint64_t sub_24616C178()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754EB98;
  if (!qword_25754EB98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EB60);
    sub_24615EFA0(&qword_25754EBA0, &qword_25754EB50);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754EB98);
  }
  return result;
}

unint64_t sub_24616C1FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EBB8;
  if (!qword_25754EBB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EBB0);
    sub_24615EEBC(&qword_25754EBC0, (void (*)(uint64_t))type metadata accessor for EventCellView);
    v3 = v2;
    sub_24615EEBC(&qword_25754EBC8, (void (*)(uint64_t))type metadata accessor for PunchoutToEventDetailsModifier);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EBB8);
  }
  return result;
}

void sub_24616C298()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_11_0() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_24616C2B8()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1();
}

void sub_24616C2D0()
{
  sub_24615EFA0(&qword_25754EBE0, &qword_25754EBE8);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  sub_24615EF54(v0, v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_24618734C();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return type metadata accessor for ConflictingEventConfirmationSnippet();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

unint64_t OUTLINED_FUNCTION_17_0()
{
  return 0xD00000000000001BLL;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_246187358();
}

uint64_t sub_24616C3A0()
{
  unsigned __int8 v1;

  sub_24616C410();
  sub_2461873AC();
  return v1;
}

uint64_t sub_24616C3D8()
{
  sub_24616C410();
  return sub_2461873B8();
}

unint64_t sub_24616C410()
{
  unint64_t result;

  result = qword_25754EBF0;
  if (!qword_25754EBF0)
  {
    result = MEMORY[0x2495523E0](&unk_2461884E4, &_s18__Key_smartEnabledVN);
    atomic_store(result, (unint64_t *)&qword_25754EBF0);
  }
  return result;
}

ValueMetadata *_s18__Key_smartEnabledVMa()
{
  return &_s18__Key_smartEnabledVN;
}

void sub_24616C45C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_24616C464()
{
  return sub_2461871FC();
}

_QWORD *sub_24616C470(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  int *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  id v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  __int128 v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v89;
  char *v90;
  void (*v91)(char *, uint64_t, uint64_t);

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v89 = (uint64_t)a2 + v13;
    v90 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v90, v89, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v17 = v12[10];
    v18 = (_QWORD *)((char *)v4 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v12[11];
    v22 = (_QWORD *)((char *)v4 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = v12[12];
    v26 = (char *)v4 + v25;
    v27 = (char *)a2 + v25;
    v28 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
      v30 = a3;
    }
    else
    {
      v32 = v12;
      *v26 = *v27;
      *(_OWORD *)(v26 + 8) = *(_OWORD *)(v27 + 8);
      v33 = *(int *)(v28 + 28);
      v34 = &v26[v33];
      v35 = &v27[v33];
      v36 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        v37 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v34, v35, v37);
        swift_storeEnumTagMultiPayload();
      }
      v30 = a3;
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
      v16 = v32;
    }
    *(_QWORD *)((char *)v4 + v16[13]) = *(uint64_t *)((char *)a2 + v16[13]);
    v38 = (int *)type metadata accessor for RenderableEvent();
    v39 = v38[5];
    v40 = *(void **)((char *)a2 + v39);
    *(_QWORD *)((char *)v4 + v39) = v40;
    v41 = v38[6];
    v42 = (char *)v4 + v41;
    v43 = (uint64_t)a2 + v41;
    v44 = sub_2461870C4();
    v45 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 16);
    swift_bridgeObjectRetain();
    v46 = v40;
    v45(v42, v43, v44);
    v47 = v38[7];
    v48 = (_QWORD *)((char *)v4 + v47);
    v49 = (uint64_t *)((char *)a2 + v47);
    v50 = v49[1];
    *v48 = *v49;
    v48[1] = v50;
    v51 = v30[5];
    v52 = (char *)v4 + v51;
    v53 = (uint64_t)a2 + v51;
    v54 = *(uint64_t *)((char *)a2 + v51 + 8);
    *(_QWORD *)v52 = *(uint64_t *)((char *)a2 + v51);
    *((_QWORD *)v52 + 1) = v54;
    v52[16] = *((_BYTE *)a2 + v51 + 16);
    *((_QWORD *)v52 + 3) = *(uint64_t *)((char *)a2 + v51 + 24);
    v55 = *((_BYTE *)a2 + v51 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v55 & 1) != 0)
    {
      v56 = *(_OWORD *)(v53 + 56);
      *(_OWORD *)(v52 + 56) = v56;
      (**(void (***)(uint64_t, uint64_t))(v56 - 8))((uint64_t)(v52 + 32), v53 + 32);
    }
    else
    {
      v57 = *(_QWORD *)(v53 + 40);
      *((_QWORD *)v52 + 4) = *(_QWORD *)(v53 + 32);
      *((_QWORD *)v52 + 5) = v57;
      swift_retain();
    }
    v52[72] = v55;
    v58 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    v59 = v58[6];
    v60 = &v52[v59];
    v61 = v53 + v59;
    v62 = sub_246187730();
    v91 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 16);
    v91(v60, v61, v62);
    *(_QWORD *)&v52[v58[7]] = *(_QWORD *)(v53 + v58[7]);
    *(_QWORD *)&v52[v58[8]] = *(_QWORD *)(v53 + v58[8]);
    v63 = v30[6];
    v64 = (char *)v4 + v63;
    v65 = (uint64_t)a2 + v63;
    v66 = *(uint64_t *)((char *)a2 + v63 + 8);
    *(_QWORD *)v64 = *(uint64_t *)((char *)a2 + v63);
    *((_QWORD *)v64 + 1) = v66;
    v64[16] = *((_BYTE *)a2 + v63 + 16);
    *((_QWORD *)v64 + 3) = *(uint64_t *)((char *)a2 + v63 + 24);
    v67 = *((_BYTE *)a2 + v63 + 72);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v67 & 1) != 0)
    {
      v68 = *(_OWORD *)(v65 + 56);
      *(_OWORD *)(v64 + 56) = v68;
      (**(void (***)(uint64_t, uint64_t))(v68 - 8))((uint64_t)(v64 + 32), v65 + 32);
    }
    else
    {
      v69 = *(_QWORD *)(v65 + 40);
      *((_QWORD *)v64 + 4) = *(_QWORD *)(v65 + 32);
      *((_QWORD *)v64 + 5) = v69;
      swift_retain();
    }
    v64[72] = v67;
    v91(&v64[v58[6]], v65 + v58[6], v62);
    *(_QWORD *)&v64[v58[7]] = *(_QWORD *)(v65 + v58[7]);
    *(_QWORD *)&v64[v58[8]] = *(_QWORD *)(v65 + v58[8]);
    v70 = a3[7];
    v71 = (_QWORD *)((char *)v4 + v70);
    v72 = (uint64_t *)((char *)a2 + v70);
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v72, 1, (uint64_t)v58))
    {
      v73 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
      memcpy(v71, v72, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
    }
    else
    {
      v74 = v72[1];
      *v71 = *v72;
      v71[1] = v74;
      *((_BYTE *)v71 + 16) = *((_BYTE *)v72 + 16);
      v71[3] = v72[3];
      v75 = *((_BYTE *)v72 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v75 & 1) != 0)
      {
        v76 = *(_OWORD *)(v72 + 7);
        *(_OWORD *)(v71 + 7) = v76;
        (**(void (***)(uint64_t, uint64_t))(v76 - 8))((uint64_t)(v71 + 4), (uint64_t)(v72 + 4));
      }
      else
      {
        v77 = v72[5];
        v71[4] = v72[4];
        v71[5] = v77;
        swift_retain();
      }
      *((_BYTE *)v71 + 72) = v75;
      v91((char *)v71 + v58[6], (uint64_t)v72 + v58[6], v62);
      *(_QWORD *)((char *)v71 + v58[7]) = *(_QWORD *)((char *)v72 + v58[7]);
      *(_QWORD *)((char *)v71 + v58[8]) = *(_QWORD *)((char *)v72 + v58[8]);
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload((uint64_t)v71, 0, 1, (uint64_t)v58);
    }
    v78 = a3[9];
    *((_BYTE *)v4 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    *((_BYTE *)v4 + v78) = *((_BYTE *)a2 + v78);
    v79 = a3[10];
    v80 = (char *)v4 + v79;
    v81 = (uint64_t)a2 + v79;
    v82 = sub_2461877B4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 16))(v80, v81, v82);
    v83 = a3[11];
    v84 = (char *)v4 + v83;
    v85 = (uint64_t)a2 + v83;
    v86 = *(uint64_t *)((char *)a2 + v83);
    LOBYTE(v80) = *(_BYTE *)(v85 + 8);
    sub_24615EB54(v86, (char)v80);
    *(_QWORD *)v84 = v86;
    v84[8] = (char)v80;
    *((_OWORD *)v84 + 1) = *(_OWORD *)(v85 + 16);
    v87 = *(_QWORD *)(v85 + 40);
    *((_QWORD *)v84 + 4) = *(_QWORD *)(v85 + 32);
    *((_QWORD *)v84 + 5) = v87;
  }
  swift_retain();
  return v4;
}

uint64_t sub_24616CA2C(uint64_t a1, int *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  v14 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v14 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v14 + 32);
  else
    swift_release();
  v15 = type metadata accessor for CalendarButtonView.Model(0);
  v16 = v14 + *(int *)(v15 + 24);
  v17 = sub_246187730();
  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8);
  v18(v16, v17);
  swift_release();
  swift_release();
  v19 = a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v19 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v19 + 32);
  else
    swift_release();
  v18(v19 + *(int *)(v15 + 24), v17);
  swift_release();
  swift_release();
  v20 = a1 + a2[7];
  if (!__swift_getEnumTagSinglePayload(v20, 1, v15))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v20 + 72) & 1) != 0)
      __swift_destroy_boxed_opaque_existential_1(v20 + 32);
    else
      swift_release();
    v18(v20 + *(int *)(v15 + 24), v17);
    swift_release();
    swift_release();
  }
  v21 = a1 + a2[10];
  v22 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
  sub_24615EB8C(*(_QWORD *)(a1 + a2[11]), *(_BYTE *)(a1 + a2[11] + 8));
  return swift_release();
}

uint64_t sub_24616CD20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  int *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  int *v30;
  uint64_t v31;
  _BYTE *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  id v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  uint64_t v55;
  int *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v87 = a2 + v12;
  v88 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v88, v87, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = v11[11];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = v11[12];
  v25 = (_BYTE *)(a1 + v24);
  v26 = (_BYTE *)(a2 + v24);
  v27 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    v29 = a3;
  }
  else
  {
    v30 = v11;
    *v25 = *v26;
    *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
    v31 = *(int *)(v27 + 28);
    v32 = &v25[v31];
    v33 = &v26[v31];
    v34 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      v35 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v32, v33, v35);
      swift_storeEnumTagMultiPayload();
    }
    v29 = a3;
    __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    v15 = v30;
  }
  *(_QWORD *)(a1 + v15[13]) = *(_QWORD *)(a2 + v15[13]);
  v36 = (int *)type metadata accessor for RenderableEvent();
  v37 = v36[5];
  v38 = *(void **)(a2 + v37);
  *(_QWORD *)(a1 + v37) = v38;
  v39 = v36[6];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = sub_2461870C4();
  v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 16);
  swift_bridgeObjectRetain();
  v44 = v38;
  v43(v40, v41, v42);
  v45 = v36[7];
  v46 = (_QWORD *)(a1 + v45);
  v47 = (_QWORD *)(a2 + v45);
  v48 = v47[1];
  *v46 = *v47;
  v46[1] = v48;
  v49 = v29[5];
  v50 = a1 + v49;
  v51 = a2 + v49;
  v52 = *(_QWORD *)(a2 + v49 + 8);
  *(_QWORD *)v50 = *(_QWORD *)(a2 + v49);
  *(_QWORD *)(v50 + 8) = v52;
  *(_BYTE *)(v50 + 16) = *(_BYTE *)(a2 + v49 + 16);
  *(_QWORD *)(v50 + 24) = *(_QWORD *)(a2 + v49 + 24);
  v53 = *(_BYTE *)(a2 + v49 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v53 & 1) != 0)
  {
    v54 = *(_OWORD *)(v51 + 56);
    *(_OWORD *)(v50 + 56) = v54;
    (**(void (***)(uint64_t, uint64_t))(v54 - 8))(v50 + 32, v51 + 32);
  }
  else
  {
    v55 = *(_QWORD *)(v51 + 40);
    *(_QWORD *)(v50 + 32) = *(_QWORD *)(v51 + 32);
    *(_QWORD *)(v50 + 40) = v55;
    swift_retain();
  }
  *(_BYTE *)(v50 + 72) = v53;
  v56 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v57 = v56[6];
  v58 = v50 + v57;
  v59 = v51 + v57;
  v60 = sub_246187730();
  v89 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 16);
  v89(v58, v59, v60);
  *(_QWORD *)(v50 + v56[7]) = *(_QWORD *)(v51 + v56[7]);
  *(_QWORD *)(v50 + v56[8]) = *(_QWORD *)(v51 + v56[8]);
  v61 = v29[6];
  v62 = a1 + v61;
  v63 = a2 + v61;
  v64 = *(_QWORD *)(a2 + v61 + 8);
  *(_QWORD *)v62 = *(_QWORD *)(a2 + v61);
  *(_QWORD *)(v62 + 8) = v64;
  *(_BYTE *)(v62 + 16) = *(_BYTE *)(a2 + v61 + 16);
  *(_QWORD *)(v62 + 24) = *(_QWORD *)(a2 + v61 + 24);
  v65 = *(_BYTE *)(a2 + v61 + 72);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v65 & 1) != 0)
  {
    v66 = *(_OWORD *)(v63 + 56);
    *(_OWORD *)(v62 + 56) = v66;
    (**(void (***)(uint64_t, uint64_t))(v66 - 8))(v62 + 32, v63 + 32);
  }
  else
  {
    v67 = *(_QWORD *)(v63 + 40);
    *(_QWORD *)(v62 + 32) = *(_QWORD *)(v63 + 32);
    *(_QWORD *)(v62 + 40) = v67;
    swift_retain();
  }
  *(_BYTE *)(v62 + 72) = v65;
  v89(v62 + v56[6], v63 + v56[6], v60);
  *(_QWORD *)(v62 + v56[7]) = *(_QWORD *)(v63 + v56[7]);
  *(_QWORD *)(v62 + v56[8]) = *(_QWORD *)(v63 + v56[8]);
  v68 = a3[7];
  v69 = (_QWORD *)(a1 + v68);
  v70 = (_QWORD *)(a2 + v68);
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v70, 1, (uint64_t)v56))
  {
    v71 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
    memcpy(v69, v70, *(_QWORD *)(*(_QWORD *)(v71 - 8) + 64));
  }
  else
  {
    v72 = v70[1];
    *v69 = *v70;
    v69[1] = v72;
    *((_BYTE *)v69 + 16) = *((_BYTE *)v70 + 16);
    v69[3] = v70[3];
    v73 = *((_BYTE *)v70 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v73 & 1) != 0)
    {
      v74 = *(_OWORD *)(v70 + 7);
      *(_OWORD *)(v69 + 7) = v74;
      (**(void (***)(uint64_t, uint64_t))(v74 - 8))((uint64_t)(v69 + 4), (uint64_t)(v70 + 4));
    }
    else
    {
      v75 = v70[5];
      v69[4] = v70[4];
      v69[5] = v75;
      swift_retain();
    }
    *((_BYTE *)v69 + 72) = v73;
    v89((uint64_t)v69 + v56[6], (uint64_t)v70 + v56[6], v60);
    *(_QWORD *)((char *)v69 + v56[7]) = *(_QWORD *)((char *)v70 + v56[7]);
    *(_QWORD *)((char *)v69 + v56[8]) = *(_QWORD *)((char *)v70 + v56[8]);
    swift_retain();
    swift_retain();
    __swift_storeEnumTagSinglePayload((uint64_t)v69, 0, 1, (uint64_t)v56);
  }
  v76 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v76) = *(_BYTE *)(a2 + v76);
  v77 = a3[10];
  v78 = a1 + v77;
  v79 = a2 + v77;
  v80 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 16))(v78, v79, v80);
  v81 = a3[11];
  v82 = a1 + v81;
  v83 = a2 + v81;
  v84 = *(_QWORD *)(a2 + v81);
  LOBYTE(v78) = *(_BYTE *)(v83 + 8);
  sub_24615EB54(v84, v78);
  *(_QWORD *)v82 = v84;
  *(_BYTE *)(v82 + 8) = v78;
  *(_OWORD *)(v82 + 16) = *(_OWORD *)(v83 + 16);
  v85 = *(_QWORD *)(v83 + 40);
  *(_QWORD *)(v82 + 32) = *(_QWORD *)(v83 + 32);
  *(_QWORD *)(v82 + 40) = v85;
  swift_retain();
  return a1;
}

uint64_t sub_24616D2B4(uint64_t a1, uint64_t a2, int *a3)
{
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int EnumTagSinglePayload;
  int v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v87;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (int *)sub_246187124();
  v6 = v5[8];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_BYTE *)(a1 + v5[9]) = *(_BYTE *)(a2 + v5[9]);
  v10 = v5[10];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = v5[11];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = v5[12];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v17, 1, v19);
  v21 = __swift_getEnumTagSinglePayload(v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    if (!v21)
    {
      *(_BYTE *)v17 = *(_BYTE *)v18;
      *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
      *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v29 = *(int *)(v19 + 28);
      v30 = v17 + v29;
      v31 = (const void *)(v18 + v29);
      sub_246163D44(v30, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v32 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v87 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v87 - 8) + 16))(v30, v31, v87);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v26 = *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64);
      v27 = (void *)v30;
      v28 = v31;
LABEL_8:
      memcpy(v27, v28, v26);
      goto LABEL_14;
    }
    sub_246163D44(v17, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v27 = (void *)v17;
    v28 = (const void *)v18;
    goto LABEL_8;
  }
  if (v21)
    goto LABEL_7;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  *(_QWORD *)(v17 + 16) = *(_QWORD *)(v18 + 16);
  v22 = *(int *)(v19 + 28);
  v23 = (void *)(v17 + v22);
  v24 = (const void *)(v18 + v22);
  v25 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v33 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v23, v24, v33);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v17, 0, 1, v19);
LABEL_14:
  *(_QWORD *)(a1 + v5[13]) = *(_QWORD *)(a2 + v5[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = (int *)type metadata accessor for RenderableEvent();
  v35 = v34[5];
  v36 = *(void **)(a2 + v35);
  v37 = *(void **)(a1 + v35);
  *(_QWORD *)(a1 + v35) = v36;
  v38 = v36;

  v39 = v34[6];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 24))(v40, v41, v42);
  v43 = v34[7];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (_QWORD *)(a2 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = a3[5];
  v47 = a1 + v46;
  v48 = a2 + v46;
  *(_QWORD *)v47 = *(_QWORD *)(a2 + v46);
  *(_QWORD *)(v47 + 8) = *(_QWORD *)(a2 + v46 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v47 + 16) = *(_BYTE *)(v48 + 16);
  *(_QWORD *)(v47 + 24) = *(_QWORD *)(v48 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v47 + 32);
    if ((*(_BYTE *)(v48 + 72) & 1) != 0)
    {
      v49 = *(_QWORD *)(v48 + 56);
      *(_QWORD *)(v47 + 56) = v49;
      *(_QWORD *)(v47 + 64) = *(_QWORD *)(v48 + 64);
      (**(void (***)(uint64_t, uint64_t))(v49 - 8))(v47 + 32, v48 + 32);
      *(_BYTE *)(v47 + 72) = 1;
    }
    else
    {
      v50 = *(_QWORD *)(v48 + 40);
      *(_QWORD *)(v47 + 32) = *(_QWORD *)(v48 + 32);
      *(_QWORD *)(v47 + 40) = v50;
      *(_BYTE *)(v47 + 72) = 0;
      swift_retain();
    }
  }
  v51 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v52 = v51[6];
  v53 = v47 + v52;
  v54 = v48 + v52;
  v55 = sub_246187730();
  v56 = *(_QWORD *)(v55 - 8);
  v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 24);
  v57(v53, v54, v55);
  *(_QWORD *)(v47 + v51[7]) = *(_QWORD *)(v48 + v51[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(v47 + v51[8]) = *(_QWORD *)(v48 + v51[8]);
  swift_retain();
  swift_release();
  v58 = a3[6];
  v59 = a1 + v58;
  v60 = a2 + v58;
  *(_QWORD *)v59 = *(_QWORD *)(a2 + v58);
  *(_QWORD *)(v59 + 8) = *(_QWORD *)(a2 + v58 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v59 + 16) = *(_BYTE *)(v60 + 16);
  *(_QWORD *)(v59 + 24) = *(_QWORD *)(v60 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v59 + 32);
    if ((*(_BYTE *)(v60 + 72) & 1) != 0)
    {
      v61 = *(_QWORD *)(v60 + 56);
      *(_QWORD *)(v59 + 56) = v61;
      *(_QWORD *)(v59 + 64) = *(_QWORD *)(v60 + 64);
      (**(void (***)(uint64_t, uint64_t))(v61 - 8))(v59 + 32, v60 + 32);
      *(_BYTE *)(v59 + 72) = 1;
    }
    else
    {
      v62 = *(_QWORD *)(v60 + 40);
      *(_QWORD *)(v59 + 32) = *(_QWORD *)(v60 + 32);
      *(_QWORD *)(v59 + 40) = v62;
      *(_BYTE *)(v59 + 72) = 0;
      swift_retain();
    }
  }
  v57(v59 + v51[6], v60 + v51[6], v55);
  *(_QWORD *)(v59 + v51[7]) = *(_QWORD *)(v60 + v51[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(v59 + v51[8]) = *(_QWORD *)(v60 + v51[8]);
  swift_retain();
  swift_release();
  v63 = a3[7];
  v64 = a1 + v63;
  v65 = a2 + v63;
  v66 = __swift_getEnumTagSinglePayload(a1 + v63, 1, (uint64_t)v51);
  v67 = __swift_getEnumTagSinglePayload(v65, 1, (uint64_t)v51);
  if (v66)
  {
    if (!v67)
    {
      *(_QWORD *)v64 = *(_QWORD *)v65;
      *(_QWORD *)(v64 + 8) = *(_QWORD *)(v65 + 8);
      *(_BYTE *)(v64 + 16) = *(_BYTE *)(v65 + 16);
      *(_QWORD *)(v64 + 24) = *(_QWORD *)(v65 + 24);
      v68 = *(_BYTE *)(v65 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v68 & 1) != 0)
      {
        v69 = *(_QWORD *)(v65 + 56);
        *(_QWORD *)(v64 + 56) = v69;
        *(_QWORD *)(v64 + 64) = *(_QWORD *)(v65 + 64);
        (**(void (***)(uint64_t, uint64_t))(v69 - 8))(v64 + 32, v65 + 32);
      }
      else
      {
        v72 = *(_QWORD *)(v65 + 40);
        *(_QWORD *)(v64 + 32) = *(_QWORD *)(v65 + 32);
        *(_QWORD *)(v64 + 40) = v72;
        swift_retain();
      }
      *(_BYTE *)(v64 + 72) = v68;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v64 + v51[6], v65 + v51[6], v55);
      *(_QWORD *)(v64 + v51[7]) = *(_QWORD *)(v65 + v51[7]);
      *(_QWORD *)(v64 + v51[8]) = *(_QWORD *)(v65 + v51[8]);
      swift_retain();
      swift_retain();
      __swift_storeEnumTagSinglePayload(v64, 0, 1, (uint64_t)v51);
      goto LABEL_36;
    }
LABEL_28:
    v70 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
    memcpy((void *)v64, (const void *)v65, *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64));
    goto LABEL_36;
  }
  if (v67)
  {
    sub_246163D44(v64, type metadata accessor for CalendarButtonView.Model);
    goto LABEL_28;
  }
  *(_QWORD *)v64 = *(_QWORD *)v65;
  *(_QWORD *)(v64 + 8) = *(_QWORD *)(v65 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v64 + 16) = *(_BYTE *)(v65 + 16);
  *(_QWORD *)(v64 + 24) = *(_QWORD *)(v65 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v64 + 32);
    if ((*(_BYTE *)(v65 + 72) & 1) != 0)
    {
      v71 = *(_QWORD *)(v65 + 56);
      *(_QWORD *)(v64 + 56) = v71;
      *(_QWORD *)(v64 + 64) = *(_QWORD *)(v65 + 64);
      (**(void (***)(uint64_t, uint64_t))(v71 - 8))(v64 + 32, v65 + 32);
      *(_BYTE *)(v64 + 72) = 1;
    }
    else
    {
      v73 = *(_QWORD *)(v65 + 40);
      *(_QWORD *)(v64 + 32) = *(_QWORD *)(v65 + 32);
      *(_QWORD *)(v64 + 40) = v73;
      *(_BYTE *)(v64 + 72) = 0;
      swift_retain();
    }
  }
  v57(v64 + v51[6], v65 + v51[6], v55);
  *(_QWORD *)(v64 + v51[7]) = *(_QWORD *)(v65 + v51[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(v64 + v51[8]) = *(_QWORD *)(v65 + v51[8]);
  swift_retain();
  swift_release();
LABEL_36:
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v74 = a3[10];
  v75 = a1 + v74;
  v76 = a2 + v74;
  v77 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 24))(v75, v76, v77);
  v78 = a3[11];
  v79 = a1 + v78;
  v80 = a2 + v78;
  v81 = *(_QWORD *)(a2 + v78);
  v82 = *(_BYTE *)(v80 + 8);
  sub_24615EB54(v81, v82);
  v83 = *(_QWORD *)v79;
  v84 = *(_BYTE *)(v79 + 8);
  *(_QWORD *)v79 = v81;
  *(_BYTE *)(v79 + 8) = v82;
  sub_24615EB8C(v83, v84);
  *(_QWORD *)(v79 + 16) = *(_QWORD *)(v80 + 16);
  *(_QWORD *)(v79 + 24) = *(_QWORD *)(v80 + 24);
  v85 = *(_QWORD *)(v80 + 40);
  *(_QWORD *)(v79 + 32) = *(_QWORD *)(v80 + 32);
  *(_QWORD *)(v79 + 40) = v85;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24616DB88(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  int *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  _OWORD *v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _OWORD *v45;
  _OWORD *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  _OWORD *v57;
  __int128 v58;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = a3[5];
  v29 = (_OWORD *)((char *)a1 + v28);
  v30 = (char *)a2 + v28;
  v31 = *(_OWORD *)((char *)a2 + v28 + 16);
  *v29 = *(_OWORD *)((char *)a2 + v28);
  v29[1] = v31;
  *(_OWORD *)((char *)v29 + 57) = *(_OWORD *)((char *)a2 + v28 + 57);
  v32 = *(_OWORD *)((char *)a2 + v28 + 48);
  v29[2] = *(_OWORD *)((char *)a2 + v28 + 32);
  v29[3] = v32;
  v33 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v34 = v33[6];
  v35 = (char *)v29 + v34;
  v36 = &v30[v34];
  v37 = sub_246187730();
  v38 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 32);
  v38(v35, v36, v37);
  *(_QWORD *)((char *)v29 + v33[7]) = *(_QWORD *)&v30[v33[7]];
  *(_QWORD *)((char *)v29 + v33[8]) = *(_QWORD *)&v30[v33[8]];
  v39 = a3[6];
  v40 = (_OWORD *)((char *)a1 + v39);
  v41 = (char *)a2 + v39;
  v42 = *(_OWORD *)((char *)a2 + v39 + 16);
  *v40 = *(_OWORD *)((char *)a2 + v39);
  v40[1] = v42;
  v43 = *(_OWORD *)((char *)a2 + v39 + 48);
  v40[2] = *(_OWORD *)((char *)a2 + v39 + 32);
  v40[3] = v43;
  *(_OWORD *)((char *)v40 + 57) = *(_OWORD *)((char *)a2 + v39 + 57);
  v38((char *)a1 + v39 + v33[6], (char *)a2 + v39 + v33[6], v37);
  *(_QWORD *)((char *)v40 + v33[7]) = *(_QWORD *)&v41[v33[7]];
  *(_QWORD *)((char *)v40 + v33[8]) = *(_QWORD *)&v41[v33[8]];
  v44 = a3[7];
  v45 = (_OWORD *)((char *)a1 + v44);
  v46 = (_OWORD *)((char *)a2 + v44);
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v44, 1, (uint64_t)v33))
  {
    v47 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
  }
  else
  {
    v48 = v46[1];
    *v45 = *v46;
    v45[1] = v48;
    v49 = v46[3];
    v45[2] = v46[2];
    v45[3] = v49;
    *(_OWORD *)((char *)v45 + 57) = *(_OWORD *)((char *)v46 + 57);
    v38((char *)v45 + v33[6], (char *)v46 + v33[6], v37);
    *(_QWORD *)((char *)v45 + v33[7]) = *(_QWORD *)((char *)v46 + v33[7]);
    *(_QWORD *)((char *)v45 + v33[8]) = *(_QWORD *)((char *)v46 + v33[8]);
    __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, (uint64_t)v33);
  }
  v50 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  *((_BYTE *)a1 + v50) = *((_BYTE *)a2 + v50);
  v51 = a3[10];
  v52 = (char *)a1 + v51;
  v53 = (char *)a2 + v51;
  v54 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v52, v53, v54);
  v55 = a3[11];
  v56 = (_OWORD *)((char *)a1 + v55);
  v57 = (_OWORD *)((char *)a2 + v55);
  v58 = v57[1];
  *v56 = *v57;
  v56[1] = v58;
  v56[2] = v57[2];
  return a1;
}

uint64_t sub_24616DF54(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  int *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  _OWORD *v74;
  _OWORD *v75;
  int v76;
  int v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_246163D44(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v95 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v95 - 8) + 32))(v40, v41, v95);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
LABEL_8:
      memcpy(v37, v38, v36);
      goto LABEL_14;
    }
    sub_246163D44(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
    goto LABEL_8;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = a3;
  v57 = a3[5];
  v58 = a1 + v57;
  v59 = a2 + v57;
  v60 = *(_QWORD *)(a2 + v57 + 8);
  *(_QWORD *)v58 = *(_QWORD *)(a2 + v57);
  *(_QWORD *)(v58 + 8) = v60;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v58 + 16) = *(_BYTE *)(v59 + 16);
  *(_QWORD *)(v58 + 24) = *(_QWORD *)(v59 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v58 + 32);
    v61 = *(_OWORD *)(v59 + 48);
    *(_OWORD *)(v58 + 32) = *(_OWORD *)(v59 + 32);
    *(_OWORD *)(v58 + 48) = v61;
    *(_OWORD *)(v58 + 57) = *(_OWORD *)(v59 + 57);
  }
  v62 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v63 = v62[6];
  v64 = v58 + v63;
  v65 = v59 + v63;
  v66 = sub_246187730();
  v96 = *(_QWORD *)(v66 - 8);
  v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 40);
  v67(v64, v65, v66);
  *(_QWORD *)(v58 + v62[7]) = *(_QWORD *)(v59 + v62[7]);
  swift_release();
  *(_QWORD *)(v58 + v62[8]) = *(_QWORD *)(v59 + v62[8]);
  swift_release();
  v68 = v56[6];
  v69 = a1 + v68;
  v70 = a2 + v68;
  v71 = *(_QWORD *)(a2 + v68 + 8);
  *(_QWORD *)v69 = *(_QWORD *)(a2 + v68);
  *(_QWORD *)(v69 + 8) = v71;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v69 + 16) = *(_BYTE *)(v70 + 16);
  *(_QWORD *)(v69 + 24) = *(_QWORD *)(v70 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v69 + 32);
    v72 = *(_OWORD *)(v70 + 48);
    *(_OWORD *)(v69 + 32) = *(_OWORD *)(v70 + 32);
    *(_OWORD *)(v69 + 48) = v72;
    *(_OWORD *)(v69 + 57) = *(_OWORD *)(v70 + 57);
  }
  v67(v69 + v62[6], v70 + v62[6], v66);
  *(_QWORD *)(v69 + v62[7]) = *(_QWORD *)(v70 + v62[7]);
  swift_release();
  *(_QWORD *)(v69 + v62[8]) = *(_QWORD *)(v70 + v62[8]);
  swift_release();
  v73 = v56[7];
  v74 = (_OWORD *)(a1 + v73);
  v75 = (_OWORD *)(a2 + v73);
  v76 = __swift_getEnumTagSinglePayload(a1 + v73, 1, (uint64_t)v62);
  v77 = __swift_getEnumTagSinglePayload((uint64_t)v75, 1, (uint64_t)v62);
  if (v76)
  {
    if (!v77)
    {
      v78 = v75[1];
      *v74 = *v75;
      v74[1] = v78;
      v79 = v75[3];
      v74[2] = v75[2];
      v74[3] = v79;
      *(_OWORD *)((char *)v74 + 57) = *(_OWORD *)((char *)v75 + 57);
      (*(void (**)(char *, char *, uint64_t))(v96 + 32))((char *)v74 + v62[6], (char *)v75 + v62[6], v66);
      *(_QWORD *)((char *)v74 + v62[7]) = *(_QWORD *)((char *)v75 + v62[7]);
      *(_QWORD *)((char *)v74 + v62[8]) = *(_QWORD *)((char *)v75 + v62[8]);
      __swift_storeEnumTagSinglePayload((uint64_t)v74, 0, 1, (uint64_t)v62);
      goto LABEL_24;
    }
LABEL_23:
    v80 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
    memcpy(v74, v75, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
    goto LABEL_24;
  }
  if (v77)
  {
    sub_246163D44((uint64_t)v74, type metadata accessor for CalendarButtonView.Model);
    goto LABEL_23;
  }
  v93 = *((_QWORD *)v75 + 1);
  *(_QWORD *)v74 = *(_QWORD *)v75;
  *((_QWORD *)v74 + 1) = v93;
  swift_bridgeObjectRelease();
  *((_BYTE *)v74 + 16) = *((_BYTE *)v75 + 16);
  *((_QWORD *)v74 + 3) = *((_QWORD *)v75 + 3);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90((uint64_t)(v74 + 2));
    v94 = v75[3];
    v74[2] = v75[2];
    v74[3] = v94;
    *(_OWORD *)((char *)v74 + 57) = *(_OWORD *)((char *)v75 + 57);
  }
  v67((uint64_t)v74 + v62[6], (uint64_t)v75 + v62[6], v66);
  *(_QWORD *)((char *)v74 + v62[7]) = *(_QWORD *)((char *)v75 + v62[7]);
  swift_release();
  *(_QWORD *)((char *)v74 + v62[8]) = *(_QWORD *)((char *)v75 + v62[8]);
  swift_release();
LABEL_24:
  v81 = v56[9];
  *(_BYTE *)(a1 + v56[8]) = *(_BYTE *)(a2 + v56[8]);
  *(_BYTE *)(a1 + v81) = *(_BYTE *)(a2 + v81);
  v82 = v56[10];
  v83 = a1 + v82;
  v84 = a2 + v82;
  v85 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 40))(v83, v84, v85);
  v86 = v56[11];
  v87 = a1 + v86;
  v88 = a2 + v86;
  v89 = *(_BYTE *)(v88 + 8);
  v90 = *(_QWORD *)(a1 + v86);
  v91 = *(_BYTE *)(a1 + v86 + 8);
  *(_QWORD *)v87 = *(_QWORD *)v88;
  *(_BYTE *)(v87 + 8) = v89;
  sub_24615EB8C(v90, v91);
  *(_QWORD *)(v87 + 16) = *(_QWORD *)(v88 + 16);
  *(_QWORD *)(v87 + 24) = *(_QWORD *)(v88 + 24);
  *(_OWORD *)(v87 + 32) = *(_OWORD *)(v88 + 32);
  swift_release();
  return a1;
}

uint64_t sub_24616E5DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24616E5E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v17;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  if (v9)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_4();
  if (v9)
  {
    v7 = v10;
    v11 = a3[5];
LABEL_13:
    v8 = v4 + v11;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
  OUTLINED_FUNCTION_3_4();
  if (v12)
  {
    v7 = v13;
    v11 = a3[7];
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4();
  if (v14)
  {
    v7 = v15;
    v11 = a3[10];
    goto LABEL_13;
  }
  v17 = *(_QWORD *)(v4 + a3[11] + 32);
  if (v17 >= 0xFFFFFFFF)
    LODWORD(v17) = -1;
  return (v17 + 1);
}

uint64_t sub_24616E6A4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24616E6B0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4_4();
  if (v10)
  {
    v8 = v7;
    v9 = v5;
  }
  else
  {
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_4_4();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
      OUTLINED_FUNCTION_4_4();
      if (v13)
      {
        v8 = v14;
        v12 = a4[7];
      }
      else
      {
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_4_4();
        if (!v15)
        {
          *(_QWORD *)(v5 + a4[11] + 32) = (v4 - 1);
          return;
        }
        v8 = v16;
        v12 = a4[10];
      }
    }
    v9 = v5 + v12;
  }
  __swift_storeEnumTagSinglePayload(v9, v4, v4, v8);
}

uint64_t type metadata accessor for SingleEventWithButtonsSnippet()
{
  uint64_t result;

  result = qword_25754EC58;
  if (!qword_25754EC58)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24616E7A0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  type metadata accessor for RenderableEvent();
  if (v0 <= 0x3F)
  {
    type metadata accessor for CalendarButtonView.Model(319);
    if (v1 <= 0x3F)
    {
      sub_24616E870();
      if (v2 <= 0x3F)
      {
        sub_2461877B4();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_24616E870()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25754EC68[0])
  {
    type metadata accessor for CalendarButtonView.Model(255);
    v0 = sub_246187970();
    if (!v1)
      atomic_store(v0, qword_25754EC68);
  }
}

uint64_t sub_24616E8C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24616E8D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_12_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246168784(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246167C80((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECB0);
  sub_24615EFA0(&qword_25754ECB8, &qword_25754ECB0);
  return sub_24618773C();
}

uint64_t sub_24616E9C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t KeyPath;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;

  v36 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECC0);
  MEMORY[0x24BDAC7A8](v35);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECC8);
  v34 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)&v31 - v8;
  v9 = (int *)type metadata accessor for SingleEventView();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  KeyPath = swift_getKeyPath();
  sub_246168784(a1, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v16 = type metadata accessor for SingleEventWithButtonsSnippet();
  v12[v9[5]] = *(_BYTE *)(a1 + *(int *)(v16 + 36));
  v17 = &v12[v9[6]];
  *(_QWORD *)v17 = swift_getKeyPath();
  v17[8] = 0;
  sub_2461877A8();
  v18 = &v12[v9[8]];
  *(_QWORD *)v18 = swift_getKeyPath();
  v18[8] = 0;
  *((_QWORD *)v18 + 2) = 0x4030000000000000;
  *((_QWORD *)v18 + 3) = 1;
  *((_QWORD *)v18 + 4) = sub_2461752BC;
  *((_QWORD *)v18 + 5) = 0;
  v19 = &v12[v9[9]];
  *(_QWORD *)v19 = swift_getKeyPath();
  v19[8] = 0;
  v31 = v14;
  sub_246167C80((uint64_t)v12, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v20 = *(_QWORD *)(a1 + *(int *)(v16 + 44) + 16);
  *(_QWORD *)v4 = sub_246187424();
  *((_QWORD *)v4 + 1) = v20;
  v4[16] = 0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECD0);
  sub_24616ED34(a1, (uint64_t)&v4[*(int *)(v21 + 44)]);
  sub_24615EFA0(&qword_25754ECD8, &qword_25754ECC0);
  v22 = v32;
  sub_2461875BC();
  sub_246163934((uint64_t)v4, &qword_25754ECC0);
  sub_246168784((uint64_t)v14, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v23 = v33;
  v24 = v34;
  v25 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v25(v33, v22, v5);
  v26 = v36;
  *v36 = KeyPath;
  *((_BYTE *)v26 + 8) = 0;
  v27 = v26;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECE0);
  sub_246168784((uint64_t)v12, (uint64_t)v27 + *(int *)(v28 + 48), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v25((char *)v27 + *(int *)(v28 + 64), v23, v5);
  sub_24615EB54(KeyPath, 0);
  v29 = *(void (**)(char *, uint64_t))(v24 + 8);
  swift_retain();
  v29(v22, v5);
  sub_246163D44((uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  swift_release();
  v29(v23, v5);
  sub_246163D44((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  return sub_24615EB8C(KeyPath, 0);
}

void sub_24616ED34(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  uint64_t *v37;
  char *v38;
  uint64_t v39;
  uint64_t *boxed_opaque_existential_1;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[5];
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v79 = a2;
  v3 = type metadata accessor for CalendarButtonView(0);
  MEMORY[0x24BDAC7A8](v3);
  v67 = (uint64_t)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECE8);
  v66 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v65 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25754EBF8);
  MEMORY[0x24BDAC7A8](v6);
  v75 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = type metadata accessor for CalendarButtonView.Model(0);
  MEMORY[0x24BDAC7A8](v73);
  v64 = (uint64_t)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECF0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v77 = (uint64_t)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v76 = (char *)&v64 - v12;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ECF8);
  MEMORY[0x24BDAC7A8](v71);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED00);
  v15 = *(_QWORD *)(v72 - 8);
  v16 = MEMORY[0x24BDAC7A8](v72);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v64 - v19;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED08);
  MEMORY[0x24BDAC7A8](v68);
  v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_246187754();
  v23 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED10);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v74 = (uint64_t)&v64 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v69 = (char *)&v64 - v29;
  v30 = type metadata accessor for SingleEventWithButtonsSnippet();
  v31 = v30;
  v32 = *(int *)(v30 + 32);
  v80 = a1;
  if (*(_BYTE *)(a1 + v32) == 1)
  {
    v33 = v80;
    v34 = v80 + *(int *)(v30 + 20);
    v84 = v3;
    sub_24615EEBC(&qword_25754E9F8, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    v36 = v35;
    v85 = v35;
    v37 = __swift_allocate_boxed_opaque_existential_1(&v82);
    sub_246168784(v34, (uint64_t)v37, type metadata accessor for CalendarButtonView.Model);
    v38 = (char *)v37 + *(int *)(v3 + 20);
    *(_QWORD *)v38 = swift_getKeyPath();
    v38[8] = 0;
    sub_2461877A8();
    v39 = v33 + *(int *)(v31 + 24);
    v81[3] = v3;
    v81[4] = v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v81);
    sub_246168784(v39, (uint64_t)boxed_opaque_existential_1, type metadata accessor for CalendarButtonView.Model);
    v41 = (char *)boxed_opaque_existential_1 + *(int *)(v3 + 20);
    *(_QWORD *)v41 = swift_getKeyPath();
    v41[8] = 0;
    sub_2461877A8();
    sub_246187748();
    v42 = v70;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v22, v25, v70);
    swift_storeEnumTagMultiPayload();
    sub_24615EEBC(&qword_25754ED28, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    sub_24615EFA0(&qword_25754ED20, &qword_25754ECF8);
    v82 = v71;
    v83 = v43;
    swift_getOpaqueTypeConformance2();
    v44 = v69;
    sub_24618746C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v42);
    v45 = (uint64_t)v44;
  }
  else
  {
    *(_QWORD *)v14 = sub_246187424();
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 1;
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED18);
    sub_24616F510(v80, (uint64_t)&v14[*(int *)(v46 + 44)]);
    sub_24615EFA0(&qword_25754ED20, &qword_25754ECF8);
    v48 = v47;
    v49 = v71;
    sub_2461875B0();
    sub_246163934((uint64_t)v14, &qword_25754ECF8);
    v50 = v18;
    v51 = v72;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v50, v72);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v22, v20, v51);
    swift_storeEnumTagMultiPayload();
    sub_24615EEBC(&qword_25754ED28, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    v82 = v49;
    v83 = v48;
    swift_getOpaqueTypeConformance2();
    v45 = (uint64_t)v69;
    sub_24618746C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v51);
  }
  v52 = v75;
  sub_24615EEF0(v80 + *(int *)(v31 + 28), v75, qword_25754EBF8);
  if (__swift_getEnumTagSinglePayload(v52, 1, v73) == 1)
  {
    sub_246163934(v52, qword_25754EBF8);
    v53 = 1;
    v54 = v78;
    v55 = (uint64_t)v76;
  }
  else
  {
    v56 = v64;
    sub_246167C80(v52, v64, type metadata accessor for CalendarButtonView.Model);
    v57 = v67;
    sub_246168784(v56, v67, type metadata accessor for CalendarButtonView.Model);
    v58 = v57 + *(int *)(v3 + 20);
    *(_QWORD *)v58 = swift_getKeyPath();
    *(_BYTE *)(v58 + 8) = 0;
    sub_2461877A8();
    sub_24615EEBC(&qword_25754EA20, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    v59 = v65;
    sub_2461875B0();
    sub_246163D44(v57, type metadata accessor for CalendarButtonView);
    sub_246163D44(v56, type metadata accessor for CalendarButtonView.Model);
    v55 = (uint64_t)v76;
    v54 = v78;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v76, v59, v78);
    v53 = 0;
  }
  __swift_storeEnumTagSinglePayload(v55, v53, 1, v54);
  v60 = v74;
  sub_24615EEF0(v45, v74, &qword_25754ED10);
  v61 = v77;
  sub_24615EEF0(v55, v77, &qword_25754ECF0);
  v62 = v79;
  sub_24615EEF0(v60, v79, &qword_25754ED10);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED30);
  sub_24615EEF0(v61, v62 + *(int *)(v63 + 48), &qword_25754ECF0);
  sub_246163934(v55, &qword_25754ECF0);
  sub_246163934(v45, &qword_25754ED10);
  sub_246163934(v61, &qword_25754ECF0);
  sub_246163934(v60, &qword_25754ED10);
}

void sub_24616F510(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v3 = type metadata accessor for CalendarButtonView(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v20 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v20 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - v13;
  v15 = type metadata accessor for SingleEventWithButtonsSnippet();
  sub_246168784(a1 + *(int *)(v15 + 20), (uint64_t)v12, type metadata accessor for CalendarButtonView.Model);
  v16 = &v12[*(int *)(v3 + 20)];
  *(_QWORD *)v16 = swift_getKeyPath();
  v16[8] = 0;
  sub_2461877A8();
  sub_246167C80((uint64_t)v12, (uint64_t)v14, type metadata accessor for CalendarButtonView);
  sub_246168784(a1 + *(int *)(v15 + 24), (uint64_t)v9, type metadata accessor for CalendarButtonView.Model);
  v17 = &v9[*(int *)(v3 + 20)];
  *(_QWORD *)v17 = swift_getKeyPath();
  v17[8] = 0;
  sub_2461877A8();
  sub_246167C80((uint64_t)v9, (uint64_t)v12, type metadata accessor for CalendarButtonView);
  sub_246168784((uint64_t)v14, (uint64_t)v9, type metadata accessor for CalendarButtonView);
  sub_246168784((uint64_t)v12, (uint64_t)v6, type metadata accessor for CalendarButtonView);
  v18 = v21;
  sub_246168784((uint64_t)v9, v21, type metadata accessor for CalendarButtonView);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754ED38);
  sub_246168784((uint64_t)v6, v18 + *(int *)(v19 + 48), type metadata accessor for CalendarButtonView);
  sub_246163D44((uint64_t)v12, type metadata accessor for CalendarButtonView);
  sub_246163D44((uint64_t)v14, type metadata accessor for CalendarButtonView);
  sub_246163D44((uint64_t)v6, type metadata accessor for CalendarButtonView);
  sub_246163D44((uint64_t)v9, type metadata accessor for CalendarButtonView);
}

uint64_t sub_24616F720()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = (int *)OUTLINED_FUNCTION_12_1();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_246187124();
  v4 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v4);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  v5 = v2 + *(int *)(v3 + 48);
  v6 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v7 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v7);
    }
  }
  swift_bridgeObjectRelease();

  v8 = sub_2461870C4();
  OUTLINED_FUNCTION_3_1(v8);
  OUTLINED_FUNCTION_6_2();
  v9 = v2 + v1[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v9 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v9 + 32);
  else
    swift_release();
  v10 = OUTLINED_FUNCTION_16();
  v11 = v9 + *(int *)(v10 + 24);
  v12 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  swift_release();
  swift_release();
  v13 = v2 + v1[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v13 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v13 + 32);
  else
    swift_release();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  v14 = v2 + v1[7];
  if (!__swift_getEnumTagSinglePayload(v14, 1, v10))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v14 + 72) & 1) != 0)
      __swift_destroy_boxed_opaque_existential_1(v14 + 32);
    else
      swift_release();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_9_1();
  }
  v15 = v2 + v1[10];
  v16 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  sub_24615EB8C(*(_QWORD *)(v2 + v1[11]), *(_BYTE *)(v2 + v1[11] + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24616F9E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_12_1() - 8) + 80);
  return sub_24616E9C8(v1 + ((v3 + 16) & ~v3), a1);
}

void sub_24616FA34()
{
  sub_24615EFA0(&qword_25754ED40, &qword_25754ED48);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v2 + *(int *)(v0 + 24), v1);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return type metadata accessor for SingleEventWithButtonsSnippet();
}

_QWORD *sub_24616FAAC(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  char *v66;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v65 = (uint64_t)a2 + v13;
    v66 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v66, v65, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + v36) = v37;
    v38 = v35[6];
    v39 = (char *)v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)((char *)v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[6];
    *((_BYTE *)v4 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v49 = (char *)v4 + v48;
    v50 = *(uint64_t *)((char *)a2 + v48);
    LOBYTE(v35) = *((_BYTE *)a2 + v48 + 8);
    swift_bridgeObjectRetain();
    sub_24615EB54(v50, (char)v35);
    *(_QWORD *)v49 = v50;
    v49[8] = (char)v35;
    v51 = a3[7];
    v52 = (char *)v4 + v51;
    v53 = (uint64_t)a2 + v51;
    v54 = sub_2461877B4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(v52, v53, v54);
    v55 = a3[8];
    v56 = (char *)v4 + v55;
    v57 = (uint64_t)a2 + v55;
    v58 = *(uint64_t *)((char *)a2 + v55);
    LOBYTE(v53) = *((_BYTE *)a2 + v55 + 8);
    sub_24615EB54(v58, v53);
    *(_QWORD *)v56 = v58;
    v56[8] = v53;
    *((_OWORD *)v56 + 1) = *(_OWORD *)(v57 + 16);
    v59 = *(_QWORD *)(v57 + 40);
    *((_QWORD *)v56 + 4) = *(_QWORD *)(v57 + 32);
    *((_QWORD *)v56 + 5) = v59;
    v60 = a3[9];
    v61 = (char *)v4 + v60;
    v62 = (uint64_t)a2 + v60;
    v63 = *(_QWORD *)v62;
    LOBYTE(v58) = *(_BYTE *)(v62 + 8);
    swift_retain();
    sub_24615EB54(v63, v58);
    *(_QWORD *)v61 = v63;
    v61[8] = v58;
  }
  return v4;
}

uint64_t sub_24616FE28(uint64_t a1, int *a2)
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
  uint64_t v14;
  uint64_t v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  sub_24615EB8C(*(_QWORD *)(a1 + a2[6]), *(_BYTE *)(a1 + a2[6] + 8));
  v14 = a1 + a2[7];
  v15 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  sub_24615EB8C(*(_QWORD *)(a1 + a2[8]), *(_BYTE *)(a1 + a2[8] + 8));
  swift_release();
  return sub_24615EB8C(*(_QWORD *)(a1 + a2[9]), *(_BYTE *)(a1 + a2[9] + 8));
}

uint64_t sub_24616FFF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v63 = a2 + v12;
  v64 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v64, v63, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v47 = a1 + v46;
  v48 = *(_QWORD *)(a2 + v46);
  LOBYTE(v33) = *(_BYTE *)(a2 + v46 + 8);
  swift_bridgeObjectRetain();
  sub_24615EB54(v48, (char)v33);
  *(_QWORD *)v47 = v48;
  *(_BYTE *)(v47 + 8) = (_BYTE)v33;
  v49 = a3[7];
  v50 = a1 + v49;
  v51 = a2 + v49;
  v52 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v50, v51, v52);
  v53 = a3[8];
  v54 = a1 + v53;
  v55 = a2 + v53;
  v56 = *(_QWORD *)(a2 + v53);
  LOBYTE(v51) = *(_BYTE *)(a2 + v53 + 8);
  sub_24615EB54(v56, v51);
  *(_QWORD *)v54 = v56;
  *(_BYTE *)(v54 + 8) = v51;
  *(_OWORD *)(v54 + 16) = *(_OWORD *)(v55 + 16);
  v57 = *(_QWORD *)(v55 + 40);
  *(_QWORD *)(v54 + 32) = *(_QWORD *)(v55 + 32);
  *(_QWORD *)(v54 + 40) = v57;
  v58 = a3[9];
  v59 = a1 + v58;
  v60 = a2 + v58;
  v61 = *(_QWORD *)v60;
  LOBYTE(v56) = *(_BYTE *)(v60 + 8);
  swift_retain();
  sub_24615EB54(v61, v56);
  *(_QWORD *)v59 = v61;
  *(_BYTE *)(v59 + 8) = v56;
  return a1;
}

uint64_t sub_246170340(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v72;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_246163D44(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v72 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v72 - 8) + 16))(v31, v32, v72);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_246163D44(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v47 = a3[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = *(_QWORD *)v49;
  LOBYTE(v41) = *(_BYTE *)(v49 + 8);
  sub_24615EB54(*(_QWORD *)v49, v41);
  v51 = *(_QWORD *)v48;
  v52 = *(_BYTE *)(v48 + 8);
  *(_QWORD *)v48 = v50;
  *(_BYTE *)(v48 + 8) = v41;
  sub_24615EB8C(v51, v52);
  v53 = a3[7];
  v54 = a1 + v53;
  v55 = a2 + v53;
  v56 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 24))(v54, v55, v56);
  v57 = a3[8];
  v58 = a1 + v57;
  v59 = (_QWORD *)(a2 + v57);
  v60 = *(_QWORD *)(a2 + v57);
  LOBYTE(v55) = *(_BYTE *)(a2 + v57 + 8);
  sub_24615EB54(v60, v55);
  v61 = *(_QWORD *)v58;
  v62 = *(_BYTE *)(v58 + 8);
  *(_QWORD *)v58 = v60;
  *(_BYTE *)(v58 + 8) = v55;
  sub_24615EB8C(v61, v62);
  *(_QWORD *)(v58 + 16) = v59[2];
  *(_QWORD *)(v58 + 24) = v59[3];
  v63 = v59[5];
  *(_QWORD *)(v58 + 32) = v59[4];
  *(_QWORD *)(v58 + 40) = v63;
  swift_retain();
  swift_release();
  v64 = a3[9];
  v65 = a1 + v64;
  v66 = a2 + v64;
  v67 = *(_QWORD *)v66;
  v68 = *(_BYTE *)(v66 + 8);
  sub_24615EB54(*(_QWORD *)v66, v68);
  v69 = *(_QWORD *)v65;
  v70 = *(_BYTE *)(v65 + 8);
  *(_QWORD *)v65 = v67;
  *(_BYTE *)(v65 + 8) = v68;
  sub_24615EB8C(v69, v70);
  return a1;
}

_OWORD *sub_246170830(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  __int128 v39;
  char *v40;
  char *v41;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v29[8] = v30[8];
  *(_QWORD *)v29 = *(_QWORD *)v30;
  v31 = a3[7];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  v34 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
  v35 = a3[8];
  v36 = a3[9];
  v37 = (_OWORD *)((char *)a1 + v35);
  v38 = (_OWORD *)((char *)a2 + v35);
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v37[2] = v38[2];
  v40 = (char *)a1 + v36;
  v41 = (char *)a2 + v36;
  *(_QWORD *)v40 = *(_QWORD *)v41;
  v40[8] = v41[8];
  return a1;
}

uint64_t sub_246170AC0(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v79;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_246163D44(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v79 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v79 - 8) + 32))(v40, v41, v79);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    sub_246163D44(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v57 = a1 + v56;
  v58 = (uint64_t *)(a2 + v56);
  v59 = *v58;
  LOBYTE(v58) = *((_BYTE *)v58 + 8);
  v60 = *(_QWORD *)v57;
  v61 = *(_BYTE *)(v57 + 8);
  *(_QWORD *)v57 = v59;
  *(_BYTE *)(v57 + 8) = (_BYTE)v58;
  sub_24615EB8C(v60, v61);
  v62 = a3[7];
  v63 = a1 + v62;
  v64 = a2 + v62;
  v65 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 40))(v63, v64, v65);
  v66 = a3[8];
  v67 = a1 + v66;
  v68 = a2 + v66;
  v69 = *(_BYTE *)(a2 + v66 + 8);
  v70 = *(_QWORD *)(a1 + v66);
  v71 = *(_BYTE *)(a1 + v66 + 8);
  *(_QWORD *)v67 = *(_QWORD *)(a2 + v66);
  *(_BYTE *)(v67 + 8) = v69;
  sub_24615EB8C(v70, v71);
  *(_QWORD *)(v67 + 16) = *(_QWORD *)(v68 + 16);
  *(_QWORD *)(v67 + 24) = *(_QWORD *)(v68 + 24);
  *(_OWORD *)(v67 + 32) = *(_OWORD *)(v68 + 32);
  swift_release();
  v72 = a3[9];
  v73 = a1 + v72;
  v74 = (uint64_t *)(a2 + v72);
  v75 = *v74;
  LOBYTE(v74) = *((_BYTE *)v74 + 8);
  v76 = *(_QWORD *)v73;
  v77 = *(_BYTE *)(v73 + 8);
  *(_QWORD *)v73 = v75;
  *(_BYTE *)(v73 + 8) = (_BYTE)v74;
  sub_24615EB8C(v76, v77);
  return a1;
}

uint64_t sub_246170EDC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246170EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = OUTLINED_FUNCTION_7();
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v9;
    v8 = v4 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v11 = *(_QWORD *)(v4 + *(int *)(a3 + 32) + 32);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_246170F7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246170F88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  result = OUTLINED_FUNCTION_7();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  *(_QWORD *)(v5 + *(int *)(a4 + 32) + 32) = (v4 - 1);
  return result;
}

uint64_t type metadata accessor for SingleEventView()
{
  uint64_t result;

  result = qword_25754EDA8;
  if (!qword_25754EDA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246171050()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    result = sub_2461877B4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2461710F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246171104()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5_0();
  v3 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_27(v1 + *(int *)(v3 + 48));
  v4 = OUTLINED_FUNCTION_26_0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v0, 1, v4) != 1)
  {
    v6 = *v0;
    sub_246163D44((uint64_t)v0, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
    __asm { BR              X9 }
  }
  sub_246163934((uint64_t)v0, qword_25754E4C0);
  return 0;
}

uint64_t sub_246171224@<X0>(uint64_t a1@<X8>)
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
  uint64_t v27;
  uint64_t v28;
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

  v3 = v2;
  v41 = a1;
  v4 = sub_246187868();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v8 = v7 - v6;
  v40 = OUTLINED_FUNCTION_17_1();
  v9 = *(_QWORD *)(v40 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v40);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EDF0);
  v34 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2();
  v15 = v14 - v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EDF8);
  v37 = *(_QWORD *)(v16 - 8);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_5_0();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE00);
  v19 = *(_QWORD *)(v18 - 8);
  v38 = v18;
  v39 = v19;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_2();
  v23 = v22 - v21;
  sub_246168784(v3, (uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v24 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v25 = swift_allocObject();
  sub_246167C80((uint64_t)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE08);
  sub_24615EFA0(&qword_25754EE10, &qword_25754EE08);
  sub_24618773C();
  v27 = v35;
  v26 = v36;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v8, *MEMORY[0x24BEAE368], v36);
  sub_24615EFA0(&qword_25754EE18, &qword_25754EDF0);
  v29 = v28;
  sub_2461875C8();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v8, v26);
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v15, v11);
  v42 = v11;
  v43 = v29;
  v30 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22_0();
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v1, v16);
  v42 = v16;
  v43 = v30;
  OUTLINED_FUNCTION_4();
  v31 = v38;
  sub_2461875B0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v23, v31);
}

uint64_t sub_24617150C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v37 = a2;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE20);
  v3 = MEMORY[0x24BDAC7A8](v35);
  v36 = (uint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v34 = (char *)&v32 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E758);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E760);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_246186F74();
  MEMORY[0x24BDAC7A8](v12);
  v33 = type metadata accessor for DateHeaderView();
  MEMORY[0x24BDAC7A8](v33);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE28);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v32 - v20;
  sub_246187124();
  sub_246186E9C();
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  swift_storeEnumTagMultiPayload();
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  sub_246180920();
  sub_24615EEBC(&qword_25754EE30, (void (*)(uint64_t))type metadata accessor for DateHeaderView);
  sub_2461875BC();
  sub_246163D44((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
  v22 = v34;
  v23 = a1;
  sub_2461718C0(a1, v34);
  v24 = (uint64_t)v22;
  sub_246168784(v23, (uint64_t)&v22[*(int *)(v35 + 36)], (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  type metadata accessor for PunchoutToEventDetailsModifier();
  sub_2461877A8();
  v25 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v25(v19, v21, v15);
  v26 = (uint64_t)v22;
  v27 = v36;
  sub_24615EEF0(v26, v36, &qword_25754EE20);
  v28 = v37;
  v25(v37, v19, v15);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE38);
  sub_24615EEF0(v27, (uint64_t)&v28[*(int *)(v29 + 48)], &qword_25754EE20);
  sub_246163934(v24, &qword_25754EE20);
  v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  v30(v21, v15);
  sub_246163934(v27, &qword_25754EE20);
  return ((uint64_t (*)(char *, uint64_t))v30)(v19, v15);
}

uint64_t sub_2461718C0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *);
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t KeyPath;
  char *v64;
  uint64_t v65;

  v58 = a1;
  v64 = a2;
  KeyPath = type metadata accessor for SingleEventView();
  MEMORY[0x24BDAC7A8](KeyPath);
  v61 = (uint64_t)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE40);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v65 = (uint64_t)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (uint64_t)&v56 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v8);
  v59 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for RenderableEvent();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for EventCellView();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v56 - v17;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE48);
  v19 = *(_QWORD *)(v60 - 8);
  v20 = MEMORY[0x24BDAC7A8](v60);
  v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v56 - v23;
  sub_246168784(a1, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v25 = sub_246186F74();
  v26 = v59;
  __swift_storeEnumTagSinglePayload(v59, 1, 1, v25);
  v27 = (uint64_t)&v16[v13[5]];
  __swift_storeEnumTagSinglePayload(v27, 1, 1, v25);
  v28 = &v16[v13[7]];
  *(_QWORD *)v28 = swift_getKeyPath();
  v28[8] = 0;
  sub_246167C80((uint64_t)v12, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v29 = v27;
  v30 = v61;
  sub_246163CA4(v26, v29);
  v16[v13[6]] = 0;
  sub_246167C80((uint64_t)v16, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  sub_24615EEBC(&qword_25754EBC0, (void (*)(uint64_t))type metadata accessor for EventCellView);
  sub_2461875BC();
  sub_246163D44((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  v31 = v19;
  v32 = *(void (**)(char *, char *))(v19 + 32);
  v33 = v58;
  v34 = v24;
  v35 = v22;
  v36 = v22;
  v37 = v60;
  v32(v24, v36);
  v38 = v62;
  sub_246171DF8(v62);
  v39 = KeyPath;
  LODWORD(v24) = *(unsigned __int8 *)(v33 + *(int *)(KeyPath + 20));
  sub_246168784(v33, v30, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  if ((_DWORD)v24 == 1)
  {
    sub_246163D44(v30, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  }
  else
  {
    v40 = v30 + *(int *)(v39 + 24);
    v41 = *(_QWORD *)v40;
    v42 = *(_BYTE *)(v40 + 8);
    sub_24615EB54(*(_QWORD *)v40, v42);
    v43 = sub_246167814();
    sub_24615EB8C(v41, v42);
    sub_246163D44(v30, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
    if ((v43 & 1) != 0)
    {
LABEL_6:
      v44 = 0;
      KeyPath = 0;
      v61 = 0;
      v45 = 0;
      goto LABEL_7;
    }
  }
  v44 = *(_QWORD *)(v33 + *(int *)(sub_246187124() + 52));
  if (!*(_QWORD *)(v44 + 16))
    goto LABEL_6;
  KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  v61 = sub_2461874A8();
  v45 = 1;
LABEL_7:
  v57 = v31;
  v46 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v47 = v34;
  v46(v35, v34, v37);
  v48 = v65;
  sub_24615EEF0(v38, v65, &qword_25754EE40);
  v49 = v64;
  v46(v64, v35, v37);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE50);
  sub_24615EEF0(v48, (uint64_t)&v49[*(int *)(v50 + 48)], &qword_25754EE40);
  v51 = &v49[*(int *)(v50 + 64)];
  v52 = KeyPath;
  *(_QWORD *)v51 = v44;
  *((_QWORD *)v51 + 1) = v52;
  v53 = v61;
  *((_QWORD *)v51 + 2) = 0;
  *((_QWORD *)v51 + 3) = v53;
  *((_OWORD *)v51 + 2) = 0u;
  *((_OWORD *)v51 + 3) = 0u;
  v51[64] = v45;
  sub_246172E4C(v44, v52, 0);
  sub_246163934(v38, &qword_25754EE40);
  v54 = *(void (**)(char *, uint64_t))(v57 + 8);
  v54(v47, v37);
  sub_246172E80(v44, v52, 0);
  sub_246163934(v48, &qword_25754EE40);
  return ((uint64_t (*)(char *, uint64_t))v54)(v35, v37);
}

void sub_246171DF8(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  __int128 v95;
  __int128 v96;
  char v97;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E438);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2();
  v7 = v6 - v5;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE58);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_0();
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE60);
  v82 = *(_QWORD *)(v88 - 8);
  OUTLINED_FUNCTION_6();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v80 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v81 = (uint64_t)&v77 - v12;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE68);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_3();
  v85 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE40);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3_3();
  v87 = v16;
  sub_2461873F4();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_4_2();
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE70);
  v18 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_3_3();
  v79 = v19;
  v20 = OUTLINED_FUNCTION_17_1();
  v21 = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_20_0();
  if ((v21 & 1) != 0)
  {
    sub_2461724A4();
    if (v23)
    {
      v77 = v22;
      v78 = v18;
      v89 = a1;
      v24 = v2 + *(int *)(v20 + 36);
      v25 = *(_QWORD *)v24;
      v26 = *(_BYTE *)(v24 + 8);
      sub_24615EB54(*(_QWORD *)v24, v26);
      sub_246167CB4();
      sub_24615EB8C(v25, v26);
      if ((sub_246187964() & 1) != 0)
      {
        sub_2461873E8();
        sub_2461873DC();
        sub_2461873D0();
        swift_bridgeObjectRelease();
        sub_2461873DC();
        sub_24618740C();
        if (qword_25754E3F0 != -1)
          swift_once();
        v27 = (id)qword_257550D20;
        v28 = sub_24618755C();
        v30 = v29;
        v32 = v31 & 1;
        sub_2461874D8();
        v33 = sub_246187544();
        v35 = v34;
        v37 = v36;
        swift_release();
        v38 = v37 & 1;
        sub_24615EF54(v28, v30, v32);
        swift_bridgeObjectRelease();
        LODWORD(v90) = sub_246187490();
        v39 = sub_246187514();
        v41 = v40;
        v43 = v42;
        v45 = v44 & 1;
        sub_24615EF54(v33, v35, v38);
        swift_bridgeObjectRelease();
        v46 = sub_2461874A8();
        v90 = v39;
        v91 = v41;
        v92 = v45;
        v93 = v43;
        v94 = v46;
        v95 = 0u;
        v96 = 0u;
        v97 = 1;
        v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE90);
        v48 = sub_246172F38();
        v49 = v79;
        sub_2461875BC();
        sub_24615EF54(v39, v41, v45);
        swift_bridgeObjectRelease();
        v50 = v78;
        v51 = v84;
        OUTLINED_FUNCTION_21_0(v85, v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 16));
        swift_storeEnumTagMultiPayload();
        v90 = v47;
        v91 = v48;
        OUTLINED_FUNCTION_3_5();
        v52 = sub_246172EB4();
        v90 = v86;
        v91 = v52;
        OUTLINED_FUNCTION_3_5();
        v53 = v87;
        sub_24618746C();
        (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
      a1 = v89;
    }
  }
  v54 = sub_246171104();
  if (!v56)
  {
LABEL_11:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE78);
    OUTLINED_FUNCTION_1_4();
    __swift_storeEnumTagSinglePayload(v60, v61, v62, v63);
    return;
  }
  v57 = v54;
  v58 = v55;
  v89 = a1;
  v59 = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_20_0();
  if ((v59 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  *(_QWORD *)v7 = sub_2461873C4();
  *(_QWORD *)(v7 + 8) = 0;
  *(_BYTE *)(v7 + 16) = 1;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E490);
  sub_2461726D8(v57, v58 & 1, v2, (char *)(v7 + *(int *)(v64 + 44)));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v65 = sub_2461874A8();
  OUTLINED_FUNCTION_27(v7);
  v66 = v86;
  v67 = v1 + *(int *)(v86 + 36);
  *(_BYTE *)v67 = v65;
  *(_OWORD *)(v67 + 8) = 0u;
  *(_OWORD *)(v67 + 24) = 0u;
  *(_BYTE *)(v67 + 40) = 1;
  sub_246163934(v7, &qword_25754E438);
  v68 = sub_246172EB4();
  v69 = v80;
  OUTLINED_FUNCTION_22_0();
  sub_246163934(v1, &qword_25754EE58);
  v71 = v81;
  v70 = v82;
  v72 = (uint64_t)v69;
  v73 = v88;
  OUTLINED_FUNCTION_21_0(v81, v72, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 32));
  OUTLINED_FUNCTION_21_0(v85, v71, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 16));
  swift_storeEnumTagMultiPayload();
  v74 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EE90);
  v75 = sub_246172F38();
  v90 = v74;
  v91 = v75;
  OUTLINED_FUNCTION_3_5();
  v90 = v66;
  v91 = v68;
  OUTLINED_FUNCTION_3_5();
  v53 = v87;
  sub_24618746C();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v73);
LABEL_13:
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE78);
  __swift_storeEnumTagSinglePayload(v53, 0, 1, v76);
  sub_246172F9C(v53, v89);
  OUTLINED_FUNCTION_1_4();
}

void sub_2461724A4()
{
  uint64_t v0;
  unsigned __int8 *v1;
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
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_24618704C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2();
  v6 = v5 - v4;
  v7 = sub_246186F74();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_4_2();
  v13 = OUTLINED_FUNCTION_25();
  sub_24615EEF0(v0 + *(int *)(v13 + 48), (uint64_t)v1, qword_25754E4C0);
  v14 = OUTLINED_FUNCTION_26_0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v14) == 1)
  {
    sub_246163934((uint64_t)v1, qword_25754E4C0);
LABEL_5:
    OUTLINED_FUNCTION_1_4();
    return;
  }
  v26 = v3;
  v15 = *v1;
  v24 = v7;
  v16 = *((_QWORD *)v1 + 1);
  v25 = v2;
  v17 = sub_2461621A0();
  v18 = sub_2461622BC();
  v19 = objc_allocWithZone(MEMORY[0x24BDC7528]);
  v20 = sub_246172C18(v15, v16, v17, 0, 0, 0, 0, 0, v18);
  sub_246163D44((uint64_t)v1, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
  sub_246186E9C();
  v21 = (void *)sub_246186F68();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v24);
  sub_246187040();
  v22 = (void *)sub_246187034();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v6, v25);
  v23 = (id)CUIKStringForRecurrenceRule();

  if (v23)
  {
    sub_2461878E0();

    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_2461726D8@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X4>, char *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v45;
  int v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;

  v47 = a3;
  v48 = a4;
  v46 = a2;
  v45 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E4A0);
  v49 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v45 - v7;
  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v9 = (id)qword_257550D20;
  v10 = sub_24618755C();
  v12 = v11;
  v51 = v10;
  v52 = v11;
  v14 = v13 & 1;
  v53 = v13 & 1;
  v54 = v15;
  sub_246187634();
  sub_24615EF54(v10, v12, v14);
  swift_bridgeObjectRelease();
  v16 = (void *)qword_257550D20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = v16;
  v18 = sub_24618755C();
  v20 = v19;
  v22 = v21;
  v23 = v47 + *(int *)(type metadata accessor for SingleEventView() + 24);
  v24 = *(_QWORD *)v23;
  v25 = *(_BYTE *)(v23 + 8);
  sub_24615EB54(*(_QWORD *)v23, v25);
  v26 = sub_246167814();
  sub_24615EB8C(v24, v25);
  if ((v26 & 1) != 0)
    v27 = sub_246187490();
  else
    v27 = sub_246187478();
  v28 = v22 & 1;
  LODWORD(v51) = v27;
  v29 = sub_246187514();
  v31 = v30;
  v33 = v32;
  v35 = v34 & 1;
  sub_24615EF54(v18, v20, v28);
  swift_bridgeObjectRelease();
  v37 = v49;
  v36 = v50;
  v38 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v38(v50, v8, v4);
  v39 = v48;
  v38(v48, v36, v4);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E4B8);
  v41 = &v39[*(int *)(v40 + 48)];
  *(_QWORD *)v41 = 0;
  v41[8] = 1;
  v42 = &v39[*(int *)(v40 + 64)];
  *(_QWORD *)v42 = v29;
  *((_QWORD *)v42 + 1) = v31;
  v42[16] = v35;
  *((_QWORD *)v42 + 3) = v33;
  sub_24615EFD4(v29, v31, v35);
  v43 = *(void (**)(char *, uint64_t))(v37 + 8);
  swift_bridgeObjectRetain();
  v43(v8, v4);
  sub_24615EF54(v29, v31, v35);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v43)(v36, v4);
}

uint64_t sub_246172A34()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (int *)OUTLINED_FUNCTION_17_1();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = OUTLINED_FUNCTION_25();
  v5 = sub_246186EB4();
  OUTLINED_FUNCTION_4_1(v5);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v6 = v3 + *(int *)(v4 + 48);
  v7 = OUTLINED_FUNCTION_26_0();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v8 = sub_246186F74();
      OUTLINED_FUNCTION_4_1(v8);
    }
  }
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for RenderableEvent();

  v10 = v3 + *(int *)(v9 + 24);
  v11 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_16_0(v1[6]);
  v12 = v3 + v1[7];
  v13 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  sub_24615EB8C(*(_QWORD *)(v3 + v1[8]), *(_BYTE *)(v3 + v1[8] + 8));
  swift_release();
  OUTLINED_FUNCTION_16_0(v1[9]);
  OUTLINED_FUNCTION_1_4();
  return swift_deallocObject();
}

uint64_t sub_246172BD8@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_17_1() - 8) + 80);
  return sub_24617150C(v1 + ((v3 + 16) & ~v3), a1);
}

id sub_246172C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;

  if (a3)
  {
    sub_246172FE4(0, &qword_25754EEA8);
    v16 = (void *)sub_246187904();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_246172FE4(0, &qword_25754EEA0);
      v17 = (void *)sub_246187904();
      swift_bridgeObjectRelease();
      if (a5)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_246172FE4(0, &qword_25754EEA0);
    v18 = (void *)sub_246187904();
    swift_bridgeObjectRelease();
    if (a6)
      goto LABEL_5;
LABEL_10:
    v19 = 0;
    if (a7)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v18 = 0;
  if (!a6)
    goto LABEL_10;
LABEL_5:
  sub_246172FE4(0, &qword_25754EEA0);
  v19 = (void *)sub_246187904();
  swift_bridgeObjectRelease();
  if (a7)
  {
LABEL_6:
    sub_246172FE4(0, &qword_25754EEA0);
    v20 = (void *)sub_246187904();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_11:
  v20 = 0;
LABEL_12:
  if (a8)
  {
    sub_246172FE4(0, &qword_25754EEA0);
    v21 = (void *)sub_246187904();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  v22 = objc_msgSend(v24, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v21, a9);

  return v22;
}

uint64_t sub_246172E4C(uint64_t result, uint64_t a2, char a3)
{
  char v4;

  if (result)
  {
    v4 = a3 & 1;
    swift_bridgeObjectRetain();
    return sub_24615EB54(a2, v4);
  }
  return result;
}

uint64_t sub_246172E80(uint64_t result, uint64_t a2, char a3)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return sub_24615EB8C(a2, a3 & 1);
  }
  return result;
}

unint64_t sub_246172EB4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754EE80;
  if (!qword_25754EE80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EE58);
    sub_24615EFA0(&qword_25754EE88, &qword_25754E438);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754EE80);
  }
  return result;
}

unint64_t sub_246172F38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25754EE98;
  if (!qword_25754EE98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EE90);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754EE98);
  }
  return result;
}

uint64_t sub_246172F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EE40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246172FE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24617301C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EE00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EDF8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EDF0);
  sub_24615EFA0(&qword_25754EE18, &qword_25754EDF0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_4();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return 0x5F5952455645;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  uint64_t v0;
  char v1;

  sub_24615EB54(v0, v1);
  return sub_246167814();
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24615EB8C(*(_QWORD *)(v1 + a1), *(_BYTE *)(v1 + a1 + 8));
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return type metadata accessor for SingleEventView();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v0;
  char v1;

  return sub_24615EB8C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_2461875BC();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_246187124();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_246187118();
}

void OUTLINED_FUNCTION_27(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;

  sub_24615EEF0(a1, v1, v2);
}

void sub_246173178()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_52() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_246173198()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_1();
}

void sub_2461731B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;

  v4 = sub_2461870C4();
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_25_0();
  v6 = sub_246186F98();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_3();
  v35 = v8;
  v9 = sub_246187124();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_3();
  v34 = v11;
  v12 = (int *)OUTLINED_FUNCTION_40();
  v31 = *((_QWORD *)v12 - 1);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v16 = v15 - v14;
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
  {
    v30 = v1;
    v39 = MEMORY[0x24BEE4AF8];
    sub_246175120(0, v17, 0);
    v18 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v29 = *(_QWORD *)(v10 + 72);
    while (1)
    {
      v38 = v17;
      sub_246163D18(v18, v34, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v19 = sub_2461734FC();
      v20 = (uint64_t *)(v16 + v12[7]);
      sub_246186F8C();
      v21 = sub_246186F80();
      v23 = v22;
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
      *v20 = v21;
      v20[1] = v23;
      sub_246163D18(v34, v16, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v24 = sub_24617FDAC(v19);
      v25 = v12[5];
      *(_QWORD *)(v16 + v25) = v24;
      sub_246180008(v19, v30);

      sub_246163D44(v34, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      if (v2)
        break;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v16 + v12[6], v30, v33);
      v26 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246175120(0, *(_QWORD *)(v39 + 16) + 1, 1);
        v26 = v39;
      }
      v28 = *(_QWORD *)(v26 + 16);
      v27 = *(_QWORD *)(v26 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_246175120(v27 > 1, v28 + 1, 1);
        v26 = v39;
      }
      *(_QWORD *)(v26 + 16) = v28 + 1;
      sub_246163CEC(v16, v26+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v28, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
      v18 += v29;
      --v17;
      if (v38 == 1)
        goto LABEL_9;
    }
    sub_246163D44(v16, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
LABEL_9:
    swift_release();
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_2461734C8()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_1();
}

void sub_2461734E4()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_1();
}

id sub_2461734FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74E8]), sel_initWithEKOptions_, 0x2000);
    if (!v3)
      v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74E8]), sel_init);
    v4 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t CalendarSnippetProvider.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t CalendarSnippetProvider.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

void CalendarSnippetProvider.snippet(for:mode:idiom:)(uint64_t a1)
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(_QWORD);
  char *v70;
  _QWORD v71[50];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v74 = a1;
  type metadata accessor for EventListSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15_0(v3);
  v71[34] = type metadata accessor for PromptForTitleSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15_0(v5);
  v71[4] = type metadata accessor for EventStatusSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0((uint64_t)v71 - v8);
  v71[1] = type metadata accessor for SingleEventSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15_0(v10);
  v71[23] = type metadata accessor for PunchoutButtonSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15_0(v12);
  v13 = sub_2461870C4();
  v71[46] = *(_QWORD *)(v13 - 8);
  v71[47] = v13;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_15_0((uint64_t)v71 - v23);
  v72 = sub_246186F98();
  v71[48] = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_3_3();
  v71[49] = v25;
  v73 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_15_0((uint64_t)v71 - v35);
  type metadata accessor for ConflictingEventConfirmationSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_15_0(v37);
  sub_246187124();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_3_6();
  v71[45] = v40;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_3_6();
  v71[43] = v43;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_3_6();
  v71[42] = v46;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_3_6();
  v71[38] = v49;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_3_6();
  v71[44] = v52;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_3_6();
  v71[41] = v55;
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_3_6();
  v71[40] = v60;
  OUTLINED_FUNCTION_2_4();
  v62 = MEMORY[0x24BDAC7A8](v61);
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_3_6();
  v71[39] = v63;
  OUTLINED_FUNCTION_2_4();
  v65 = MEMORY[0x24BDAC7A8](v64);
  MEMORY[0x24BDAC7A8](v65);
  type metadata accessor for DisambiguateEventsSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_2();
  type metadata accessor for ModernDisambiguateEventsSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_2();
  sub_246187130();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_25_0();
  sub_246163D18(v74, v1, v69);
  v70 = (char *)sub_246173B70 + 4 * word_246188790[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_246173B70()
{
  _OWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  char v3;
  uint64_t v4;

  v2 = *(_OWORD **)(v1 - 344);
  *v2 = *v0;
  sub_2461877A8();
  v3 = OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_26_1(v3, &qword_25754EFD8, v4, (void (*)(void))sub_246175538);
  OUTLINED_FUNCTION_4_5((uint64_t)v2);
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_246174864(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v16;

  v4 = type metadata accessor for CalendarEnvironmentSetupModifier();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F020);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_246174DC8((uint64_t)v6);
  v6[*(int *)(v4 + 20)] = a1;
  v10 = *(int *)(v4 + 24);
  v11 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v12 = (void *)sub_2461878D4();
  v13 = objc_msgSend(v11, sel_BOOLForKey_, v12);

  v6[v10] = v13;
  sub_246163D18((uint64_t)v6, (uint64_t)v9 + *(int *)(v7 + 36), (uint64_t (*)(_QWORD))type metadata accessor for CalendarEnvironmentSetupModifier);
  *v9 = a2;
  swift_retain();
  sub_246163D44((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CalendarEnvironmentSetupModifier);
  sub_24617570C();
  v14 = sub_246187574();
  sub_246163934((uint64_t)v9, &qword_25754F020);
  return v14;
}

uint64_t sub_2461749FC(char a1, uint64_t *a2, uint64_t (*a3)(_QWORD), void (*a4)(void))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  v13 = v10 - v9 + *(int *)(v12 + 36);
  sub_246174C78(v13);
  v14 = type metadata accessor for CalendarEnvironmentSetupModifier();
  *(_BYTE *)(v13 + *(int *)(v14 + 20)) = a1;
  v15 = *(int *)(v14 + 24);
  v16 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v17 = (void *)sub_2461878D4();
  v18 = objc_msgSend(v16, sel_BOOLForKey_, v17);

  *(_BYTE *)(v13 + v15) = v18;
  sub_246163D18(v4, v11, a3);
  a4();
  v19 = sub_246187574();
  sub_246163934(v11, a2);
  return v19;
}

void sub_246174B3C()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_52() & 1;
  OUTLINED_FUNCTION_1();
}

void sub_246174B5C()
{
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_1();
}

void sub_246174B74()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_1();
}

void sub_246174B90()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_1();
}

uint64_t CalendarSnippetProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CalendarSnippetProvider.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_246174BE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CalendarSnippetProvider.__allocating_init()();
  *a1 = result;
  return result;
}

void sub_246174C0C(uint64_t a1)
{
  CalendarSnippetProvider.snippet(for:mode:idiom:)(a1);
}

void sub_246174C2C()
{
  uint64_t ObjCClassFromMetadata;

  type metadata accessor for CalendarSnippetProvider();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  qword_257550D20 = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  OUTLINED_FUNCTION_1();
}

void sub_246174C78(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EF90);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_25_0();
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v5 = objc_msgSend(v4, sel_languageCode);

  if (v5)
  {
    sub_2461878E0();

    swift_bridgeObjectRetain();
    sub_246186FA4();
    v6 = sub_246187010();
    __swift_storeEnumTagSinglePayload(v1, 0, 1, v6);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload(v1, 1, v6) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, v1, v6);
      return;
    }
  }
  else
  {
    v7 = sub_246187010();
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v7);
  }
  sub_246186FE0();
  sub_246163934(v1, &qword_25754EF90);
}

void sub_246174DC8(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EF90);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v6 = objc_msgSend(v5, sel_languageCode);

  if (v6)
  {
    sub_2461878E0();

    swift_bridgeObjectRetain();
    sub_246186FA4();
    v7 = sub_246187010();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v7);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v7) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, v4, v7);
      return;
    }
  }
  else
  {
    v8 = sub_246187010();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v8);
  }
  sub_246186FE0();
  sub_246163934((uint64_t)v4, &qword_25754EF90);
}

double sub_246174F30()
{
  double v1;

  sub_2461753C4();
  sub_24618782C();
  return v1;
}

uint64_t sub_246174F78(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_31();
    result = OUTLINED_FUNCTION_45();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_39();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_39();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_24617504C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_31();
  result = OUTLINED_FUNCTION_45();
  __break(1u);
  return result;
}

size_t sub_246175120(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_246175178(a1, a2, a3, *v3, &qword_25754EFA0, (void (*)(_QWORD))type metadata accessor for RenderableEvent);
  *v3 = result;
  return result;
}

size_t sub_24617514C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_246175178(a1, a2, a3, *v3, &qword_25754F048, (void (*)(_QWORD))type metadata accessor for DayEventGroupView.DayEventGroup);
  *v3 = result;
  return result;
}

size_t sub_246175178(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
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
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_24;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (unint64_t)v16 + v19;
  v21 = a4 + v19;
  if ((v8 & 1) != 0)
  {
    sub_246174F78(v21, v11, v20, a6);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24617504C(v21, v11, v20, (uint64_t (*)(_QWORD))a6);
  }
  swift_release();
  return (size_t)v16;
}

void sub_2461752BC(double *a1@<X8>)
{
  *a1 = sub_246174F30();
  OUTLINED_FUNCTION_1();
}

void sub_2461752DC()
{
  sub_24617582C(&qword_25754EEC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE91AF8], MEMORY[0x24BE91A88]);
}

uint64_t type metadata accessor for CalendarSnippetProvider()
{
  return objc_opt_self();
}

unint64_t sub_246175328()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EF78;
  if (!qword_25754EF78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EF70);
    sub_24617582C(&qword_25754EF80, (uint64_t (*)(uint64_t))type metadata accessor for ModernDisambiguateEventsSnippet, (uint64_t)&unk_246188C68);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EF78);
  }
  return result;
}

unint64_t sub_2461753C4()
{
  unint64_t result;

  result = qword_25754EF98;
  if (!qword_25754EF98)
  {
    result = MEMORY[0x2495523E0](&unk_246188CF4, &type metadata for CommonConstants);
    atomic_store(result, (unint64_t *)&qword_25754EF98);
  }
  return result;
}

unint64_t sub_246175400()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EFB0;
  if (!qword_25754EFB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EFA8);
    sub_24617582C(&qword_25754EFB8, (uint64_t (*)(uint64_t))type metadata accessor for DisambiguateEventsSnippet, (uint64_t)&unk_24618804C);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EFB0);
  }
  return result;
}

unint64_t sub_24617549C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EFC8;
  if (!qword_25754EFC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EFC0);
    sub_24617582C(&qword_25754EFD0, (uint64_t (*)(uint64_t))type metadata accessor for ConflictingEventConfirmationSnippet, (uint64_t)&unk_2461883C0);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EFC8);
  }
  return result;
}

unint64_t sub_246175538()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EFE0;
  if (!qword_25754EFE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EFD8);
    sub_24617582C(&qword_25754EFE8, (uint64_t (*)(uint64_t))type metadata accessor for PunchoutButtonSnippet, (uint64_t)&unk_246188160);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EFE0);
  }
  return result;
}

unint64_t sub_2461755D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754EFF8;
  if (!qword_25754EFF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754EFF0);
    sub_24617582C(&qword_25754F000, (uint64_t (*)(uint64_t))type metadata accessor for SingleEventSnippet, (uint64_t)&unk_246188910);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754EFF8);
  }
  return result;
}

unint64_t sub_246175670()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754F010;
  if (!qword_25754F010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F008);
    sub_24617582C(&qword_25754F018, (uint64_t (*)(uint64_t))type metadata accessor for PromptForTitleSnippet, (uint64_t)&unk_2461882A0);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754F010);
  }
  return result;
}

unint64_t sub_24617570C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754F028;
  if (!qword_25754F028)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F020);
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754F028);
  }
  return result;
}

unint64_t sub_246175790()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754F038;
  if (!qword_25754F038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F030);
    sub_24617582C(&qword_25754F040, (uint64_t (*)(uint64_t))type metadata accessor for EventListSnippet, (uint64_t)&unk_246188B58);
    v3 = v2;
    sub_24617582C(&qword_25754EF88, (uint64_t (*)(uint64_t))type metadata accessor for CalendarEnvironmentSetupModifier, (uint64_t)&unk_246188A00);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754F038);
  }
  return result;
}

void sub_24617582C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2495523E0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1();
}

void OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 176) + 8))(v0, *(_QWORD *)(v1 - 160));
}

void OUTLINED_FUNCTION_4_5(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_246163D44(a1, v1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 192) + 32))(v2 + *(int *)(v1 + 24), v0, *(_QWORD *)(v3 - 184));
}

uint64_t OUTLINED_FUNCTION_6_3@<X0>(uint64_t a1@<X8>)
{
  void *v1;

  return sub_246180008(v1, *(_QWORD *)(a1 - 256));
}

void OUTLINED_FUNCTION_8_3()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *v3 = v0;
  v3[1] = v2;
  sub_246163D18(v5, v4, v1);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_246186F8C();
}

void OUTLINED_FUNCTION_11_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_246163D18(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_246186F8C();
}

void OUTLINED_FUNCTION_14_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_246163CEC(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_15_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_246187100();
}

uint64_t OUTLINED_FUNCTION_17_2(char a1)
{
  uint64_t v1;

  return sub_246174864(a1 & 1, v1);
}

id OUTLINED_FUNCTION_18()
{
  return sub_2461734FC();
}

id OUTLINED_FUNCTION_19_1()
{
  void *v0;

  return sub_24617FDAC(v0);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_246186F80();
}

uint64_t OUTLINED_FUNCTION_26_1(char a1, uint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t (*v4)(_QWORD);

  return sub_2461749FC(a1 & 1, a2, v4, a4);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_28()
{
  uint64_t v0;
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(v1 + 20)) = result;
  return result;
}

void OUTLINED_FUNCTION_34(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_246163D44(v2, a2);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_246187400();
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return type metadata accessor for RenderableEvent();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_2461872B0();
}

uint64_t OUTLINED_FUNCTION_42(char a1)
{
  uint64_t v1;

  return sub_246174864(a1 & 1, v1);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44()
{
  uint64_t v0;
  uint64_t v1;

  return v1 + *(int *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_2461879C4();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_24616C3D8();
}

uint64_t OUTLINED_FUNCTION_48@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3 & 1;
  *(_QWORD *)(a5 + 24) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_2461872A4();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_24616C3A0();
}

_QWORD *sub_246175AE4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v54;
  char *v55;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v54 = (uint64_t)a2 + v13;
    v55 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v55, v54, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + v36) = v37;
    v38 = v35[6];
    v39 = (char *)v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)((char *)v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = *(int *)(a3 + 20);
    v49 = (char *)v4 + v48;
    v50 = (uint64_t)a2 + v48;
    v51 = sub_2461877B4();
    v52 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
  }
  return v4;
}

uint64_t sub_246175DD4(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  v14 = a1 + *(int *)(a2 + 20);
  v15 = sub_2461877B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
}

uint64_t sub_246175F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v52 = a2 + v12;
  v53 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v53, v52, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = *(int *)(a3 + 20);
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = sub_2461877B4();
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  return a1;
}

uint64_t sub_24617621C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_24616120C(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v52 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v31, v32, v52);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_24616120C(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47 = *(int *)(a3 + 20);
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  return a1;
}

_OWORD *sub_24617663C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = *(int *)(a3 + 20);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  return a1;
}

uint64_t sub_246176874(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_24616120C(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v61 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v61 - 8) + 32))(v40, v41, v61);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    sub_24616120C(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = *(int *)(a3 + 20);
  v57 = a1 + v56;
  v58 = a2 + v56;
  v59 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 40))(v57, v58, v59);
  return a1;
}

uint64_t sub_246176BF0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246176BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_246176C54()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246176C60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_7();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for PunchoutToEventDetailsModifier()
{
  uint64_t result;

  result = qword_25754F0A8;
  if (!qword_25754F0A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246176CF8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    result = sub_2461877B4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_246176D7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246176D8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_6_4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F0E0);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, a1, v11);
  *(_BYTE *)(v10 + *(int *)(v7 + 36)) = 0;
  sub_24617735C(v2, (uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_246177518((uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  sub_246177590();
  sub_246187604();
  swift_release();
  return sub_24617762C(v10);
}

void sub_246176ECC()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  int v29;
  uint8_t *v30;
  id v31;
  void *v32;
  void (*v33)(uint64_t, char *, uint64_t);
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  id v43;
  uint8_t *v44;
  os_log_t v45;
  uint64_t v46;
  int v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = sub_246187850();
  v51 = *(_QWORD *)(v1 - 8);
  v52 = v1;
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2();
  v50 = v3 - v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F100);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2();
  v7 = v6 - v5;
  v8 = sub_246186EE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)&v44 - v13;
  v14 = sub_246187160();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v44 - v19;
  v21 = *(int *)(sub_246187124() + 44);
  v49 = v0;
  if (*(_QWORD *)(v0 + v21 + 8)
    && (v53 = v14, sub_24617766C(), swift_bridgeObjectRetain(), v14 = v53, v22 = v20, (v23 = sub_246187958()) != 0))
  {
    v24 = (void *)v23;
    v25 = sub_246187148();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v20, v25, v14);
    v26 = v14;
    v27 = v24;
    v28 = sub_246187154();
    v29 = sub_246187940();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      v47 = v29;
      v30 = (uint8_t *)OUTLINED_FUNCTION_13();
      v46 = OUTLINED_FUNCTION_13();
      v55 = v46;
      *(_DWORD *)v30 = 136315138;
      v31 = objc_msgSend(v27, sel_punchOutUri);
      if (v31)
      {
        v32 = v31;
        v45 = v28;
        sub_246186ED8();

        v33 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
        v33(v7, v12, v8);
        OUTLINED_FUNCTION_9_3(v7, 0);
        if (__swift_getEnumTagSinglePayload(v7, 1, v8) != 1)
        {
          v44 = v30 + 4;
          v34 = v48;
          v33((uint64_t)v48, (char *)v7, v8);
          sub_2461776A8();
          v35 = sub_2461879D0();
          v37 = v36;
          (*(void (**)(char *, uint64_t))(v9 + 8))(v34, v8);
          v54 = sub_246167FB8(v35, v37, &v55);
          sub_24618797C();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24615C000, v45, (os_log_type_t)v47, "Attempting to punchout to %s", v30, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_3();
        }

      }
      else
      {

        OUTLINED_FUNCTION_9_3(v7, 1);
      }
      __break(1u);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v26);
      OUTLINED_FUNCTION_6_4();
      v42 = v50;
      sub_24618779C();
      v43 = v27;
      sub_246187838();

      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v42, v52);
    }
  }
  else
  {
    v38 = sub_246187148();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v38, v14);
    v39 = sub_246187154();
    v40 = sub_246187940();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_13();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_24615C000, v39, v40, "Punchout command not available for current event", v41, 2u);
      OUTLINED_FUNCTION_2_3();
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
}

uint64_t sub_24617735C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutToEventDetailsModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461773A0()
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

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_6_4() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_246187124();
  v4 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v4);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v5 = v2 + *(int *)(v3 + 48);
  v6 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v7 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v7);
    }
  }
  swift_bridgeObjectRelease();
  v8 = type metadata accessor for RenderableEvent();

  v9 = v2 + *(int *)(v8 + 24);
  v10 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  OUTLINED_FUNCTION_2_1();
  v11 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(v11);
  return swift_deallocObject();
}

uint64_t sub_246177518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PunchoutToEventDetailsModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24617755C()
{
  OUTLINED_FUNCTION_6_4();
  sub_246176ECC();
}

unint64_t sub_246177590()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25754F0F0;
  if (!qword_25754F0F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F0E0);
    v2[0] = sub_246164944(&qword_25754F0F8, &qword_25754F0E8, MEMORY[0x24BDEFB78]);
    v2[1] = sub_246164944(&qword_25754E730, &qword_25754E738, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754F0F0);
  }
  return result;
}

uint64_t sub_24617762C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F0E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24617766C()
{
  unint64_t result;

  result = qword_25754F108;
  if (!qword_25754F108)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25754F108);
  }
  return result;
}

unint64_t sub_2461776A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754F110;
  if (!qword_25754F110)
  {
    v1 = sub_246186EE4();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_25754F110);
  }
  return result;
}

uint64_t sub_2461776E8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F0E0);
  sub_246177590();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return type metadata accessor for PunchoutToEventDetailsModifier();
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

_QWORD *sub_246177748(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v49;
  char *v50;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v49 = (uint64_t)a2 + v13;
    v50 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v50, v49, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + v36) = v37;
    v38 = v35[6];
    v39 = (char *)v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)((char *)v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    *((_BYTE *)v4 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_246177A10(uint64_t a1)
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

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = sub_246187124();
  v3 = a1 + *(int *)(v2 + 32);
  v4 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(v2 + 48);
  v6 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    v7 = v5 + *(int *)(v6 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v8 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    }
  }
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for RenderableEvent();

  v10 = a1 + *(int *)(v9 + 24);
  v11 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_246177B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v47 = a2 + v12;
  v48 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v48, v47, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246177E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v48;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_246178D94(v31, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v48 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v31, v32, v48);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_246178D94(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

_OWORD *sub_246178200(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246178418(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_246178D94(v40, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v57 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v57 - 8) + 32))(v40, v41, v57);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    sub_246178D94(v27, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246178774()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246178780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_5_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_246178804()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246178810(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_5_2();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata accessor for SingleEventSnippet()
{
  uint64_t result;

  result = qword_25754F170;
  if (!qword_25754F170)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461788B8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246178928()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246178938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_4_6();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246163D18(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246163CEC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F1A8);
  sub_246163D98(&qword_25754F1B0, &qword_25754F1A8, MEMORY[0x24BDF5428]);
  return sub_24618773C();
}

uint64_t sub_246178A2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t KeyPath;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v4 = (int *)type metadata accessor for SingleEventView();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v16 - v8;
  KeyPath = swift_getKeyPath();
  sub_246163D18(a1, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v7[v4[5]] = *(_BYTE *)(a1 + *(int *)(type metadata accessor for SingleEventSnippet() + 20));
  v11 = &v7[v4[6]];
  *(_QWORD *)v11 = swift_getKeyPath();
  v11[8] = 0;
  sub_2461877A8();
  v12 = &v7[v4[8]];
  *(_QWORD *)v12 = swift_getKeyPath();
  v12[8] = 0;
  *((_QWORD *)v12 + 2) = 0x4030000000000000;
  *((_QWORD *)v12 + 3) = 1;
  *((_QWORD *)v12 + 4) = sub_2461752BC;
  *((_QWORD *)v12 + 5) = 0;
  v13 = &v7[v4[9]];
  *(_QWORD *)v13 = swift_getKeyPath();
  v13[8] = 0;
  sub_246163CEC((uint64_t)v7, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  sub_246163D18((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  *(_QWORD *)a2 = KeyPath;
  *(_BYTE *)(a2 + 8) = 0;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F1B8);
  sub_246163D18((uint64_t)v7, a2 + *(int *)(v14 + 48), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  sub_24615EB54(KeyPath, 0);
  sub_246178D94((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  sub_246178D94((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  return sub_24615EB8C(KeyPath, 0);
}

uint64_t sub_246178BF4()
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

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_6() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_246187124();
  v4 = sub_246186EB4();
  OUTLINED_FUNCTION_4_1(v4);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  v5 = v2 + *(int *)(v3 + 48);
  v6 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v7 = sub_246186F74();
      OUTLINED_FUNCTION_4_1(v7);
    }
  }
  swift_bridgeObjectRelease();
  v8 = OUTLINED_FUNCTION_5_2();

  v9 = v2 + *(int *)(v8 + 24);
  v10 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  OUTLINED_FUNCTION_6_2();
  return swift_deallocObject();
}

uint64_t sub_246178D4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_4_6() - 8) + 80);
  return sub_246178A2C(v1 + ((v3 + 16) & ~v3), a1);
}

void sub_246178D94(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_1();
}

void sub_246178DCC()
{
  sub_246163D98(&qword_25754F1C0, &qword_25754F1C8, MEMORY[0x24BEADC00]);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return type metadata accessor for SingleEventSnippet();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return type metadata accessor for RenderableEvent();
}

_QWORD *sub_246178E08(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246187010();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
  }
  return a1;
}

uint64_t sub_246178E98(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246187010();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_246178ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_246187010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t sub_246178F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246187010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246178F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_246187010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t sub_246178FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_246187010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t sub_246179060()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617906C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_3_7();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_2461790F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461790FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_3_7();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata accessor for CalendarEnvironmentSetupModifier()
{
  uint64_t result;

  result = qword_25754F228;
  if (!qword_25754F228)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461791A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246187010();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_246179218()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246179228@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v10;

  v2 = sub_246186FF8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246187004();
  v6 = sub_246186FEC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = sub_246187274();
  v8 = (unsigned int *)MEMORY[0x24BDED118];
  if (v6 != 2)
    v8 = (unsigned int *)MEMORY[0x24BDED100];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(a1, *v8, v7);
}

uint64_t sub_2461792EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t *v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;

  v45 = sub_246187274();
  v3 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_2();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F268);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F270);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v16 = v15 - v14;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F278);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_2();
  v20 = v19 - v18;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F280);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_2();
  v42 = v23 - v22;
  KeyPath = swift_getKeyPath();
  v25 = (uint64_t *)(v11 + *(int *)(v7 + 36));
  v26 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754F288) + 28);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_2_5();
  v27(v26, v2);
  *v25 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F290);
  OUTLINED_FUNCTION_2_5();
  v28(v11, a1);
  v29 = swift_getKeyPath();
  v30 = type metadata accessor for CalendarEnvironmentSetupModifier();
  if (*(_BYTE *)(v2 + *(int *)(v30 + 24)) == 1)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BDED118], v45);
  else
    sub_246179228(v6);
  v31 = (uint64_t *)(v16 + *(int *)(v12 + 36));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F298);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)v31 + *(int *)(v32 + 28), v6, v45);
  *v31 = v29;
  sub_2461796F0(v11, v16, &qword_25754F268);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v45);
  sub_24615EF1C(v11, &qword_25754F268);
  v33 = swift_getKeyPath();
  v34 = *(_BYTE *)(v2 + *(int *)(v30 + 20));
  sub_2461796F0(v16, v20, &qword_25754F270);
  v35 = v20 + *(int *)(v41 + 36);
  *(_QWORD *)v35 = v33;
  *(_BYTE *)(v35 + 8) = v34;
  sub_24615EF1C(v16, &qword_25754F270);
  v36 = sub_246187664();
  v37 = swift_getKeyPath();
  sub_2461796F0(v20, v42, &qword_25754F278);
  v38 = (uint64_t *)(v42 + *(int *)(v43 + 36));
  *v38 = v37;
  v38[1] = v36;
  sub_24615EF1C(v20, &qword_25754F278);
  return sub_246179728(v42, a2);
}

uint64_t sub_2461795E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_246187274();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2461872E0();
}

uint64_t sub_246179670()
{
  return sub_2461872D4();
}

uint64_t sub_24617969C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24618737C();
  *a1 = result;
  return result;
}

uint64_t sub_2461796C4()
{
  swift_retain();
  return sub_246187388();
}

void sub_2461796F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void (*v5)(uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_5();
  v5(a2, a1);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246179728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_246179774()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754F2A0;
  if (!qword_25754F2A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F280);
    v2 = sub_2461797F8();
    sub_246163D98(&qword_25754F2E8, qword_25754F2F0, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F2A0);
  }
  return result;
}

unint64_t sub_2461797F8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754F2A8;
  if (!qword_25754F2A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F278);
    v2 = sub_24617987C();
    sub_246163D98(&qword_25754F2D8, &qword_25754F2E0, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F2A8);
  }
  return result;
}

unint64_t sub_24617987C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754F2B0;
  if (!qword_25754F2B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F270);
    v2 = sub_246179900();
    sub_246163D98(&qword_25754F2D0, &qword_25754F298, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F2B0);
  }
  return result;
}

unint64_t sub_246179900()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_25754F2B8;
  if (!qword_25754F2B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F268);
    sub_246163D98(&qword_25754F2C0, &qword_25754F290, MEMORY[0x24BDEFB78]);
    v3 = v2;
    sub_246163D98(&qword_25754F2C8, &qword_25754F288, MEMORY[0x24BDF1028]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_25754F2B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_246187010();
}

uint64_t sub_2461799B4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
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
  char v23;
  __int128 v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    v7 = a1;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v8 = a3[6];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_2461877B4();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = v7 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = *(uint64_t *)((char *)a2 + v13);
    LOBYTE(v9) = *((_BYTE *)a2 + v13 + 8);
    sub_24615EB54(v16, v9);
    *(_QWORD *)v14 = v16;
    *(_BYTE *)(v14 + 8) = v9;
    *(_OWORD *)(v14 + 16) = *(_OWORD *)(v15 + 16);
    v17 = *(_QWORD *)(v15 + 40);
    *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
    *(_QWORD *)(v14 + 40) = v17;
    v18 = a3[8];
    v19 = v7 + v18;
    v20 = (uint64_t)a2 + v18;
    v21 = *(uint64_t *)((char *)a2 + v18);
    v22 = *(_QWORD *)(v20 + 8);
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
    *(_BYTE *)(v19 + 16) = *(_BYTE *)(v20 + 16);
    *(_QWORD *)(v19 + 24) = *(_QWORD *)(v20 + 24);
    v23 = *(_BYTE *)(v20 + 72);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v23 & 1) != 0)
    {
      v24 = *(_OWORD *)(v20 + 56);
      *(_OWORD *)(v19 + 56) = v24;
      (**(void (***)(uint64_t, uint64_t))(v24 - 8))(v19 + 32, v20 + 32);
    }
    else
    {
      v25 = *(_QWORD *)(v20 + 40);
      *(_QWORD *)(v19 + 32) = *(_QWORD *)(v20 + 32);
      *(_QWORD *)(v19 + 40) = v25;
      swift_retain();
    }
    *(_BYTE *)(v19 + 72) = v23;
    v26 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    v27 = v26[6];
    v28 = v19 + v27;
    v29 = v20 + v27;
    v30 = sub_246187730();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    *(_QWORD *)(v19 + v26[7]) = *(_QWORD *)(v20 + v26[7]);
    *(_QWORD *)(v19 + v26[8]) = *(_QWORD *)(v20 + v26[8]);
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_246179B64(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_24615EB8C(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  swift_release();
  v6 = a1 + a2[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v6 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v6 + 32);
  else
    swift_release();
  v7 = v6 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  v8 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  return swift_release();
}

uint64_t sub_246179C4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
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
  __int128 v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2461877B4();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)(a2 + v11);
  LOBYTE(v7) = *(_BYTE *)(a2 + v11 + 8);
  sub_24615EB54(v14, v7);
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = v7;
  *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 40);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_QWORD *)(v12 + 40) = v15;
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a2 + v16 + 8);
  *(_QWORD *)v17 = *(_QWORD *)(a2 + v16);
  *(_QWORD *)(v17 + 8) = v19;
  *(_BYTE *)(v17 + 16) = *(_BYTE *)(a2 + v16 + 16);
  *(_QWORD *)(v17 + 24) = *(_QWORD *)(a2 + v16 + 24);
  v20 = *(_BYTE *)(a2 + v16 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v20 & 1) != 0)
  {
    v21 = *(_OWORD *)(v18 + 56);
    *(_OWORD *)(v17 + 56) = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))(v17 + 32, v18 + 32);
  }
  else
  {
    v22 = *(_QWORD *)(v18 + 40);
    *(_QWORD *)(v17 + 32) = *(_QWORD *)(v18 + 32);
    *(_QWORD *)(v17 + 40) = v22;
    swift_retain();
  }
  *(_BYTE *)(v17 + 72) = v20;
  v23 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v24 = v23[6];
  v25 = v17 + v24;
  v26 = v18 + v24;
  v27 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  *(_QWORD *)(v17 + v23[7]) = *(_QWORD *)(v18 + v23[7]);
  *(_QWORD *)(v17 + v23[8]) = *(_QWORD *)(v18 + v23[8]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_246179DDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = (_QWORD *)(a2 + v10);
  v13 = *(_QWORD *)(a2 + v10);
  LOBYTE(v8) = *(_BYTE *)(a2 + v10 + 8);
  sub_24615EB54(v13, v8);
  v14 = *(_QWORD *)v11;
  v15 = *(_BYTE *)(v11 + 8);
  *(_QWORD *)v11 = v13;
  *(_BYTE *)(v11 + 8) = v8;
  sub_24615EB8C(v14, v15);
  *(_QWORD *)(v11 + 16) = v12[2];
  *(_QWORD *)(v11 + 24) = v12[3];
  v16 = v12[5];
  *(_QWORD *)(v11 + 32) = v12[4];
  *(_QWORD *)(v11 + 40) = v16;
  swift_retain();
  swift_release();
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)(a2 + v17);
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(a2 + v17 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v18 + 16) = *(_BYTE *)(v19 + 16);
  *(_QWORD *)(v18 + 24) = *(_QWORD *)(v19 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v18 + 32);
    if ((*(_BYTE *)(v19 + 72) & 1) != 0)
    {
      v20 = *(_QWORD *)(v19 + 56);
      *(_QWORD *)(v18 + 56) = v20;
      *(_QWORD *)(v18 + 64) = *(_QWORD *)(v19 + 64);
      (**(void (***)(uint64_t, uint64_t))(v20 - 8))(v18 + 32, v19 + 32);
      *(_BYTE *)(v18 + 72) = 1;
    }
    else
    {
      v21 = *(_QWORD *)(v19 + 40);
      *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
      *(_QWORD *)(v18 + 40) = v21;
      *(_BYTE *)(v18 + 72) = 0;
      swift_retain();
    }
  }
  v22 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v23 = v22[6];
  v24 = v18 + v23;
  v25 = v19 + v23;
  v26 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  *(_QWORD *)(v18 + v22[7]) = *(_QWORD *)(v19 + v22[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(v18 + v22[8]) = *(_QWORD *)(v19 + v22[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_246179FDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  _OWORD *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  int *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = a3[8];
  v12 = (_OWORD *)(a1 + v10);
  v13 = (_OWORD *)(a2 + v10);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v12[2] = v13[2];
  v15 = (_OWORD *)(a1 + v11);
  v16 = a2 + v11;
  v17 = *(_OWORD *)(a2 + v11 + 16);
  *v15 = *(_OWORD *)(a2 + v11);
  v15[1] = v17;
  v18 = *(_OWORD *)(a2 + v11 + 48);
  v15[2] = *(_OWORD *)(a2 + v11 + 32);
  v15[3] = v18;
  *(_OWORD *)((char *)v15 + 57) = *(_OWORD *)(a2 + v11 + 57);
  v19 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v20 = v19[6];
  v21 = (char *)v15 + v20;
  v22 = v16 + v20;
  v23 = sub_246187730();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  *(_QWORD *)((char *)v15 + v19[7]) = *(_QWORD *)(v16 + v19[7]);
  *(_QWORD *)((char *)v15 + v19[8]) = *(_QWORD *)(v16 + v19[8]);
  return a1;
}

uint64_t sub_24617A0DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_BYTE *)(a2 + v10 + 8);
  v14 = *(_QWORD *)(a1 + v10);
  v15 = *(_BYTE *)(a1 + v10 + 8);
  *(_QWORD *)v11 = *(_QWORD *)(a2 + v10);
  *(_BYTE *)(v11 + 8) = v13;
  sub_24615EB8C(v14, v15);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)(v12 + 32);
  swift_release();
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a2 + v16 + 8);
  *(_QWORD *)v17 = *(_QWORD *)(a2 + v16);
  *(_QWORD *)(v17 + 8) = v19;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v17 + 16) = *(_BYTE *)(v18 + 16);
  *(_QWORD *)(v17 + 24) = *(_QWORD *)(v18 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(v17 + 32);
    v20 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)(v17 + 32) = *(_OWORD *)(v18 + 32);
    *(_OWORD *)(v17 + 48) = v20;
    *(_OWORD *)(v17 + 57) = *(_OWORD *)(v18 + 57);
  }
  v21 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v22 = v21[6];
  v23 = v17 + v22;
  v24 = v18 + v22;
  v25 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 40))(v23, v24, v25);
  *(_QWORD *)(v17 + v21[7]) = *(_QWORD *)(v18 + v21[7]);
  swift_release();
  *(_QWORD *)(v17 + v21[8]) = *(_QWORD *)(v18 + v21[8]);
  swift_release();
  return a1;
}

uint64_t sub_24617A254()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617A260(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 24);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_16();
      v10 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v10, a2, v9);
  }
}

uint64_t sub_24617A2F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_24617A2FC(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 24);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_16();
      v10 = *(int *)(a4 + 32);
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for EventListSnippet()
{
  uint64_t result;

  result = qword_25754F350;
  if (!qword_25754F350)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24617A3C0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2461877B4();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for CalendarButtonView.Model(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24617A464()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24617A474(uint64_t a1, void *a2)
{
  uint64_t v2;
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
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t *v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;

  v5 = sub_2461870C4();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_246186F98();
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_246187124();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v42 = (uint64_t)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RenderableEvent();
  v39 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a1 + 16);
  if (v16)
  {
    v38 = v7;
    v47 = v2;
    v48 = MEMORY[0x24BEE4AF8];
    sub_246175120(0, v16, 0);
    v17 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v36 = *(_QWORD *)(v11 + 72);
    v37 = a2;
    while (1)
    {
      v46 = v16;
      v18 = (uint64_t)v15;
      v19 = (int *)v13;
      v20 = v42;
      sub_246163D18(v17, v42, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v21 = (uint64_t *)&v15[v19[7]];
      v22 = a2;
      v23 = v43;
      sub_246186F8C();
      v24 = sub_246186F80();
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v23, v45);
      *v21 = v24;
      v21[1] = v26;
      sub_246163D18(v20, v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v27 = sub_24617FDAC(v22);
      v28 = v19[5];
      *(_QWORD *)(v18 + v28) = v27;
      v29 = (uint64_t)v38;
      v30 = v47;
      sub_246180008(v22, (uint64_t)v38);

      sub_246163D44(v20, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);
      v47 = v30;
      if (v30)
        break;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v18 + v19[6], v29, v41);
      v31 = v48;
      v15 = (char *)v18;
      v13 = (uint64_t)v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246175120(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v31 = v48;
      }
      v32 = v46;
      v34 = *(_QWORD *)(v31 + 16);
      v33 = *(_QWORD *)(v31 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_246175120(v33 > 1, v34 + 1, 1);
        v31 = v48;
      }
      *(_QWORD *)(v31 + 16) = v34 + 1;
      sub_246163CEC(v18, v31+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(_QWORD *)(v39 + 72) * v34, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
      a2 = v37;
      v17 += v36;
      v16 = v32 - 1;
      if (!v16)
      {

        return v31;
      }
    }
    sub_246163D44(v18, (uint64_t (*)(_QWORD))MEMORY[0x24BE91AE8]);

    swift_bridgeObjectRelease();
    v31 = v48;

    swift_release();
  }
  else
  {

    return MEMORY[0x24BEE4AF8];
  }
  return v31;
}

uint64_t sub_24617A7CC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v3 = v2;
  v6 = sub_246186F98();
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DayEventGroupView.DayEventGroup(0);
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v40 = MEMORY[0x24BEE4AF8];
    sub_24617514C(0, v12, 0);
    v13 = v40;
    v14 = sub_2461870DC();
    v15 = *(_QWORD *)(v14 - 8);
    v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v17 = v14;
    v34 = *(_QWORD *)(v15 + 72);
    v18 = a2;
    v19 = swift_bridgeObjectRetain();
    v39 = v18;
    v20 = sub_24617A474(v19, v18);
    if (v3)
    {

      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = v20;
      v33[1] = v17;
      while (1)
      {
        swift_bridgeObjectRelease();
        sub_246186F8C();
        v22 = sub_246186F80();
        v24 = v23;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v38);
        *v11 = v22;
        v11[1] = v24;
        v11[2] = v21;
        v25 = (char *)v11 + *(int *)(v36 + 24);
        v26 = sub_246186F74();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v25, v16, v26);
        v13 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24617514C(0, *(_QWORD *)(v13 + 16) + 1, 1);
          v13 = v40;
        }
        v27 = v34;
        v29 = *(_QWORD *)(v13 + 16);
        v28 = *(_QWORD *)(v13 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_24617514C(v28 > 1, v29 + 1, 1);
          v13 = v40;
        }
        *(_QWORD *)(v13 + 16) = v29 + 1;
        sub_246163CEC((uint64_t)v11, v13+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(_QWORD *)(v35 + 72) * v29, type metadata accessor for DayEventGroupView.DayEventGroup);
        if (!--v12)
          break;
        v30 = v39;
        v31 = swift_bridgeObjectRetain();
        v21 = sub_24617A474(v31, v30);
        v16 += v27;
      }

    }
  }
  else
  {

    return MEMORY[0x24BEE4AF8];
  }
  return v13;
}

void sub_24617AA98(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;

  v5 = (int *)type metadata accessor for EventListSnippet();
  v23 = a4 + v5[6];
  sub_2461877A8();
  v6 = a4 + v5[7];
  *(_QWORD *)v6 = swift_getKeyPath();
  *(_BYTE *)(v6 + 8) = 0;
  *(_QWORD *)(v6 + 16) = 0x4030000000000000;
  *(_QWORD *)(v6 + 24) = 1;
  *(_QWORD *)(v6 + 32) = sub_2461752BC;
  *(_QWORD *)(v6 + 40) = 0;
  v7 = a4 + v5[8];
  v8 = sub_246187400();
  v10 = v9;
  v12 = v11;
  v24 = v13;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(v7 + 64) = sub_246167BFC();
  *(_BYTE *)(v7 + 32) = 0;
  *(_BYTE *)(v7 + 72) = 1;
  v14 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v15 = v7 + v14[6];
  v16 = *MEMORY[0x24BEAD978];
  v17 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  *(_QWORD *)v7 = v8;
  *(_QWORD *)(v7 + 8) = v10;
  *(_BYTE *)(v7 + 16) = v12 & 1;
  *(_QWORD *)(v7 + 24) = v24;
  *(_QWORD *)(v7 + v14[7]) = 0;
  *(_QWORD *)(v7 + v14[8]) = 0;
  v18 = a3;
  v19 = sub_24617A7CC(a1, v18);
  if (v27)
  {
    swift_bridgeObjectRelease();

    sub_2461877B4();
    OUTLINED_FUNCTION_8_0();
    v20(v23);
    sub_24615EB8C(*(_QWORD *)v6, *(_BYTE *)(v6 + 8));
    swift_release();
    sub_246163D44(v7, type metadata accessor for CalendarButtonView.Model);
  }
  else
  {
    v21 = v19;
    swift_bridgeObjectRelease();

    *(_QWORD *)a4 = v21;
    *(_BYTE *)(a4 + 8) = a2 & 1;
  }
}

uint64_t sub_24617AC6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_5_3();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246163D18(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for EventListSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246163CEC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for EventListSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F398);
  sub_24615EFA0(&qword_25754F3A0, &qword_25754F398);
  return sub_24618773C();
}

uint64_t sub_24617AD5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
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
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  _QWORD v48[2];
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  uint64_t KeyPath;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;

  v63 = a2;
  v53 = type metadata accessor for CalendarButtonView(0);
  MEMORY[0x24BDAC7A8](v53);
  v50 = (uint64_t)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3A8);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3B0);
  v51 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v49 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3B8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v62 = (uint64_t)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)v48 - v10;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3C0);
  MEMORY[0x24BDAC7A8](v57);
  v12 = (char *)v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3C8);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v61 = (char *)v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v48 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v48 - v20;
  KeyPath = swift_getKeyPath();
  v22 = sub_246187430();
  v23 = type metadata accessor for EventListSnippet();
  v24 = *(int *)(v23 + 28);
  v56 = a1;
  v48[0] = v23;
  v48[1] = (char *)a1 + v24;
  v25 = *(_QWORD *)((char *)a1 + v24 + 16);
  *(_QWORD *)v12 = v22;
  *((_QWORD *)v12 + 1) = v25;
  v12[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3D0);
  v64 = *a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3D8);
  type metadata accessor for DayEventGroupView(0);
  sub_24615EFA0(&qword_25754F3E0, &qword_25754F3D8);
  sub_24615EEBC(&qword_25754F3E8, (void (*)(uint64_t))type metadata accessor for DayEventGroupView);
  sub_24615EEBC(&qword_25754F3F0, (void (*)(uint64_t))type metadata accessor for DayEventGroupView.DayEventGroup);
  v26 = v21;
  v27 = v14;
  sub_24618770C();
  sub_24615EFA0(&qword_25754F3F8, &qword_25754F3C0);
  sub_2461875BC();
  sub_246163934((uint64_t)v12, &qword_25754F3C0);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v19, v13);
  if (*((_BYTE *)v56 + 8) == 1)
  {
    v28 = v50;
    sub_246163D18((uint64_t)v56 + *(int *)(v48[0] + 32), v50, type metadata accessor for CalendarButtonView.Model);
    v29 = v53;
    v30 = v28 + *(int *)(v53 + 20);
    *(_QWORD *)v30 = swift_getKeyPath();
    *(_BYTE *)(v30 + 8) = 0;
    sub_2461877A8();
    sub_24615EEBC(&qword_25754EA20, (void (*)(uint64_t))type metadata accessor for CalendarButtonView);
    v32 = v31;
    v33 = v52;
    sub_2461875BC();
    sub_246163D44(v28, type metadata accessor for CalendarButtonView);
    v64 = v29;
    v65 = v32;
    swift_getOpaqueTypeConformance2();
    v34 = v49;
    v35 = v55;
    sub_2461875B0();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v35);
    v36 = (uint64_t)v58;
    v37 = v60;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v58, v34, v60);
    v38 = 0;
    v39 = v37;
  }
  else
  {
    v38 = 1;
    v36 = (uint64_t)v58;
    v39 = v60;
  }
  __swift_storeEnumTagSinglePayload(v36, v38, 1, v39);
  v40 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v41 = v61;
  v40(v61, v21, v13);
  v42 = v62;
  sub_24617B494(v36, v62);
  v43 = v63;
  v44 = KeyPath;
  *v63 = KeyPath;
  *((_BYTE *)v43 + 8) = 0;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F400);
  v40((char *)v43 + *(int *)(v45 + 48), v41, v13);
  sub_24617B494(v42, (uint64_t)v43 + *(int *)(v45 + 64));
  sub_24615EB54(v44, 0);
  swift_retain();
  sub_246163934(v36, &qword_25754F3B8);
  v46 = *(void (**)(char *, uint64_t))(v27 + 8);
  v46(v26, v13);
  swift_release();
  sub_246163934(v42, &qword_25754F3B8);
  v46(v41, v13);
  return sub_24615EB8C(v44, 0);
}

uint64_t sub_24617B300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_246163D18(a1, a2, type metadata accessor for DayEventGroupView.DayEventGroup);
  type metadata accessor for DayEventGroupView(0);
  return sub_2461877A8();
}

uint64_t sub_24617B344()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  v1 = (int *)type metadata accessor for EventListSnippet();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));
  swift_bridgeObjectRelease();
  v3 = v2 + v1[6];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0();
  v4(v3);
  sub_24615EB8C(*(_QWORD *)(v2 + v1[7]), *(_BYTE *)(v2 + v1[7] + 8));
  swift_release();
  v5 = v2 + v1[8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v5 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v5 + 32);
  else
    swift_release();
  v6 = v5 + *(int *)(OUTLINED_FUNCTION_16() + 24);
  sub_246187730();
  OUTLINED_FUNCTION_8_0();
  v7(v6);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24617B458()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_5_3() - 8) + 80);
  return sub_24617AD5C((_QWORD *)(v1 + ((v2 + 16) & ~v2)), v0);
}

uint64_t sub_24617B494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F3B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24617B4EC()
{
  sub_24615EFA0(&qword_25754F408, qword_25754F410);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return type metadata accessor for EventListSnippet();
}

_QWORD *sub_24617B524(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v6 = a2;
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2461877B4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (char *)v7 + v13;
    v15 = (char *)v6 + v13;
    v16 = *(_QWORD *)((char *)v6 + v13);
    LOBYTE(v6) = *((_BYTE *)v6 + v13 + 8);
    sub_24615EB54(v16, (char)v6);
    *(_QWORD *)v14 = v16;
    v14[8] = (char)v6;
    *((_OWORD *)v14 + 1) = *((_OWORD *)v15 + 1);
    v17 = *((_QWORD *)v15 + 5);
    *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
    *((_QWORD *)v14 + 5) = v17;
  }
  swift_retain();
  return v7;
}

uint64_t sub_24617B604(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_24615EB8C(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 8));
  return swift_release();
}

_QWORD *sub_24617B670(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2;
  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)v4 + v11;
  v14 = *(_QWORD *)((char *)v4 + v11);
  LOBYTE(v4) = *((_BYTE *)v4 + v11 + 8);
  sub_24615EB54(v14, (char)v4);
  *(_QWORD *)v12 = v14;
  v12[8] = (char)v4;
  *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
  v15 = *((_QWORD *)v13 + 5);
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  *((_QWORD *)v12 + 5) = v15;
  swift_retain();
  return a1;
}

_QWORD *sub_24617B72C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v4 = a2;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)v4 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (_QWORD *)((char *)v4 + v10);
  v13 = *(_QWORD *)((char *)v4 + v10);
  LOBYTE(v4) = *((_BYTE *)v4 + v10 + 8);
  sub_24615EB54(v13, (char)v4);
  v14 = *(_QWORD *)v11;
  v15 = v11[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v4;
  sub_24615EB8C(v14, v15);
  *((_QWORD *)v11 + 2) = v12[2];
  *((_QWORD *)v11 + 3) = v12[3];
  v16 = v12[5];
  *((_QWORD *)v11 + 4) = v12[4];
  *((_QWORD *)v11 + 5) = v16;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_24617B804(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_OWORD *)((char *)a1 + v10);
  v12 = (_OWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v11[2] = v12[2];
  return a1;
}

_QWORD *sub_24617B88C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  char v15;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = v12[8];
  v14 = *(_QWORD *)((char *)a1 + v10);
  v15 = *((_BYTE *)a1 + v10 + 8);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v13;
  sub_24615EB8C(v14, v15);
  *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
  *((_QWORD *)v11 + 3) = *((_QWORD *)v12 + 3);
  *((_OWORD *)v11 + 2) = *((_OWORD *)v12 + 2);
  swift_release();
  return a1;
}

uint64_t sub_24617B948()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617B954(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_24617B9C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24617B9D0(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t type metadata accessor for ModernDisambiguateEventsSnippet()
{
  uint64_t result;

  result = qword_25754F470;
  if (!qword_25754F470)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24617BA68()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461877B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24617BAE8()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_24617BAF8()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
}

uint64_t sub_24617BB1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v1 = OUTLINED_FUNCTION_1_6();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = sub_246187790();
  MEMORY[0x24BDAC7A8](v4);
  sub_24617BC88();
  sub_246163D18(v0, (uint64_t)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  sub_246163CEC((uint64_t)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4B0);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F4B8);
  sub_24615EFA0(&qword_25754F4C0, &qword_25754F4B8);
  v10[0] = v7;
  v10[1] = v8;
  swift_getOpaqueTypeConformance2();
  return sub_246187778();
}

uint64_t sub_24617BC88()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_246187400();
  if (qword_25754E3F0 != -1)
    swift_once();
  v0 = (id)qword_257550D20;
  v1 = sub_24618755C();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v1;
  *(_QWORD *)(v9 + 24) = v3;
  *(_BYTE *)(v9 + 32) = v5 & 1;
  *(_QWORD *)(v9 + 40) = v7;
  return sub_246187784();
}

uint64_t sub_24617BDB4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_246187430();
  v6 = *(_QWORD *)((char *)a1 + *(int *)(type metadata accessor for ModernDisambiguateEventsSnippet() + 24) + 16);
  *(_QWORD *)v4 = v5;
  *((_QWORD *)v4 + 1) = v6;
  v4[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4C8);
  sub_24617BEB0(a1);
  sub_24615EFA0(&qword_25754F4C0, &qword_25754F4B8);
  sub_2461875BC();
  return sub_24617C4A4((uint64_t)v4);
}

uint64_t sub_24617BEB0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v2 = type metadata accessor for ModernDisambiguateEventsSnippet();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[3] = *a1;
  sub_246163D18((uint64_t)a1, (uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  sub_246163CEC((uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4D8);
  sub_24615EFA0(&qword_25754E6F8, &qword_25754E6E8);
  v11 = type metadata accessor for EventCellView();
  sub_24615EEBC(&qword_25754EBC0, (void (*)(uint64_t))type metadata accessor for EventCellView);
  v14[1] = v11;
  v14[2] = v12;
  swift_getOpaqueTypeConformance2();
  sub_24615EEBC(&qword_25754E740, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  sub_24618770C();
  sub_24617C5C4();
  sub_2461875B0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24617C0C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a2;
  v31 = a3;
  v26 = a1;
  v4 = type metadata accessor for ModernDisambiguateEventsSnippet();
  v29 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v29 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v28 = (uint64_t)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RenderableEvent();
  v27 = *(_QWORD *)(v9 - 8);
  v10 = *(_QWORD *)(v27 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for EventCellView();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  sub_246163D18(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v18 = sub_246186F74();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v18);
  v19 = (uint64_t)&v15[v12[5]];
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v18);
  v20 = &v15[v12[7]];
  *(_QWORD *)v20 = swift_getKeyPath();
  v20[8] = 0;
  sub_246163CEC((uint64_t)v11, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_246163CA4((uint64_t)v8, v19);
  v15[v12[6]] = 1;
  sub_246163CEC((uint64_t)v15, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  v21 = v28;
  sub_246163D18(v30, v28, (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  sub_246163D18(v26, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v22 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v23 = (v5 + *(unsigned __int8 *)(v27 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v24 = swift_allocObject();
  sub_246163CEC(v21, v24 + v22, (uint64_t (*)(_QWORD))type metadata accessor for ModernDisambiguateEventsSnippet);
  sub_246163CEC((uint64_t)v11, v24 + v23, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_24615EEBC(&qword_25754EBC0, (void (*)(uint64_t))type metadata accessor for EventCellView);
  sub_246187604();
  swift_release();
  return sub_24617C884((uint64_t)v17);
}

uint64_t sub_24617C39C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_246187850();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 8))
  {
    v6 = *(void **)a1;
    v7 = *(_QWORD *)(a1 + 8);
  }
  else
  {
    v6 = 0;
    v7 = 0xE000000000000000;
  }
  type metadata accessor for ModernDisambiguateEventsSnippet();
  swift_bridgeObjectRetain();
  sub_24618779C();
  sub_24617C8C0(v6, v7);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24617C478()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_11();
  return sub_24617BDB4((_QWORD *)(v0 + v1));
}

uint64_t sub_24617C4A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F4B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_1_6();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 20);
  v5 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_24615EB8C(*(_QWORD *)(v3 + *(int *)(v1 + 24)), *(_BYTE *)(v3 + *(int *)(v1 + 24) + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24617C588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_11();
  return sub_24617C0C4(a1, v2 + v5, a2);
}

unint64_t sub_24617C5C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];

  result = qword_25754F4E0;
  if (!qword_25754F4E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F4D0);
    v2 = type metadata accessor for EventCellView();
    sub_24615EEBC(&qword_25754EBC0, (void (*)(uint64_t))type metadata accessor for EventCellView);
    v4[1] = v2;
    v4[2] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDF4A08], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F4E0);
  }
  return result;
}

uint64_t sub_24617C66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
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

  v1 = OUTLINED_FUNCTION_1_6();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for RenderableEvent();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  swift_bridgeObjectRelease();
  v7 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_1(v7);
  sub_24615EB8C(*(_QWORD *)(v0 + v3 + *(int *)(v1 + 24)), *(_BYTE *)(v0 + v3 + *(int *)(v1 + 24) + 8));
  swift_release();
  v8 = v0 + ((v3 + v4 + v6) & ~v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = sub_246187124();
  v10 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v10);
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_4_7();
  v11 = v8 + *(int *)(v9 + 48);
  v12 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v13 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v13);
    }
  }
  swift_bridgeObjectRelease();

  v14 = v8 + *(int *)(v5 + 24);
  v15 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  OUTLINED_FUNCTION_4_7();
  return swift_deallocObject();
}

void sub_24617C828()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_1_6() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RenderableEvent() - 8) + 80);
  sub_24617C39C(v0 + ((v2 + v3 + v4) & ~v4));
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_24617C884(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EventCellView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24617C8C0(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v4 = MEMORY[0x24BE91A40];
  v6[3] = MEMORY[0x24BE91A40];
  v6[4] = sub_24617C944();
  v6[0] = a1;
  v6[1] = a2;
  __swift_project_boxed_opaque_existential_1(v6, v4);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11_2();
  v5 = (void *)OUTLINED_FUNCTION_3_8();

  OUTLINED_FUNCTION_10_0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  OUTLINED_FUNCTION_2_6();
}

unint64_t sub_24617C944()
{
  unint64_t result;

  result = qword_25754F4E8;
  if (!qword_25754F4E8)
  {
    result = MEMORY[0x2495523E0](MEMORY[0x24BE91A38], MEMORY[0x24BE91A40]);
    atomic_store(result, (unint64_t *)&qword_25754F4E8);
  }
  return result;
}

uint64_t sub_24617C980()
{
  uint64_t v0;

  sub_24615EF54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24617C9B0(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v4 = MEMORY[0x24BE91A50];
  v6[3] = MEMORY[0x24BE91A50];
  v6[4] = sub_24617CA34();
  v6[0] = a1;
  v6[1] = a2;
  __swift_project_boxed_opaque_existential_1(v6, v4);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11_2();
  v5 = (void *)OUTLINED_FUNCTION_3_8();

  OUTLINED_FUNCTION_10_0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  OUTLINED_FUNCTION_2_6();
}

unint64_t sub_24617CA34()
{
  unint64_t result;

  result = qword_25754F4F0;
  if (!qword_25754F4F0)
  {
    result = MEMORY[0x2495523E0](MEMORY[0x24BE91A48], MEMORY[0x24BE91A50]);
    atomic_store(result, (unint64_t *)&qword_25754F4F0);
  }
  return result;
}

void sub_24617CA70()
{
  sub_24615EFA0(&qword_25754F4F8, qword_25754F500);
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return type metadata accessor for ModernDisambiguateEventsSnippet();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_2461870D0();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_246187844();
}

id OUTLINED_FUNCTION_11_2()
{
  return sub_24617BAF8();
}

void sub_24617CAF0(_QWORD *a1@<X8>)
{
  *a1 = 0x4030000000000000;
}

ValueMetadata *type metadata accessor for CommonConstants()
{
  return &type metadata for CommonConstants;
}

uint64_t sub_24617CB0C()
{
  return sub_246187820();
}

uint64_t sub_24617CB20()
{
  return sub_246187814();
}

uint64_t sub_24617CB34()
{
  return sub_2461877FC();
}

uint64_t sub_24617CB48()
{
  return sub_246187808();
}

uint64_t sub_24617CB5C()
{
  return sub_2461877F0();
}

void sub_24617CB70(_QWORD *a1@<X8>)
{
  *a1 = 0x4024000000000000;
}

uint64_t sub_24617CB7C()
{
  return sub_2461877E4();
}

uint64_t destroy for CalendarButtonView.Model.Action(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2)
    v1 = *(_DWORD *)a1 + 2;
  if (v1 == 1)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  else
    return swift_release();
}

uint64_t initializeWithCopy for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  __int128 v4;
  char v5;
  uint64_t v6;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    v5 = 1;
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v6;
    swift_retain();
    v5 = 0;
  }
  *(_BYTE *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      swift_release();
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(_BYTE *)(a1 + 40) = 1;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 40) = 0;
      swift_retain();
    }
  }
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

uint64_t assignWithTake for CalendarButtonView.Model.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  char v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
      __swift_destroy_boxed_opaque_existential_1(a1);
    else
      swift_release();
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      v7 = 1;
    }
    else
    {
      v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(_BYTE *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CalendarButtonView.Model.Action(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CalendarButtonView.Model.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_24617CE20(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_24617CE3C(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CalendarButtonView.Model.Action()
{
  return &type metadata for CalendarButtonView.Model.Action;
}

_QWORD *sub_24617CE74(_QWORD *a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *v4 = *a2;
    v4[1] = v7;
    *((_BYTE *)v4 + 16) = *((_BYTE *)a2 + 16);
    v4[3] = a2[3];
    v8 = *((_BYTE *)a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v8 & 1) != 0)
    {
      v9 = *(_OWORD *)(a2 + 7);
      *(_OWORD *)(v4 + 7) = v9;
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 4), (uint64_t)(a2 + 4));
    }
    else
    {
      v11 = a2[5];
      v4[4] = a2[4];
      v4[5] = v11;
      swift_retain();
    }
    *((_BYTE *)v4 + 72) = v8;
    v12 = a3[6];
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = sub_246187730();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[8];
    *(_QWORD *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)v4 + v16) = *(uint64_t *)((char *)a2 + v16);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_24617CF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  else
    swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_release();
}

uint64_t sub_24617D00C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v7 & 1) != 0)
  {
    v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 56) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v9;
    swift_retain();
  }
  *(_BYTE *)(a1 + 72) = v7;
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24617D0F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(a1 + 32);
    if ((*(_BYTE *)(a2 + 72) & 1) != 0)
    {
      v6 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v6;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      *(_BYTE *)(a1 + 72) = 1;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v7;
      *(_BYTE *)(a1 + 72) = 0;
      swift_retain();
    }
  }
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24617D228(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  *(_OWORD *)((char *)a1 + 57) = *(_OWORD *)((char *)a2 + 57);
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_246187730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t sub_24617D2B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(a1 + 32);
    v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_24617D38C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_24617D398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_2_7(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_24617D3F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24617D404(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_6_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_3_9(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t type metadata accessor for CalendarButtonView.Model(uint64_t a1)
{
  return sub_24617DD6C(a1, qword_25754F560);
}

uint64_t sub_24617D470()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246187730();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24617D4F8@<X0>(uint64_t a1@<X8>)
{
  return sub_24617D500(2, a1);
}

uint64_t sub_24617D500@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v4 = sub_246187400();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  *(_QWORD *)(a2 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(a2 + 64) = sub_246167BFC();
  *(_BYTE *)(a2 + 32) = a1;
  *(_BYTE *)(a2 + 72) = 1;
  v11 = (int *)OUTLINED_FUNCTION_16();
  v12 = a2 + v11[6];
  v13 = *MEMORY[0x24BEAD970];
  v14 = OUTLINED_FUNCTION_0_5();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + v11[7]) = 0;
  *(_QWORD *)(a2 + v11[8]) = 0;
  return result;
}

uint64_t sub_24617D5D4@<X0>(uint64_t a1@<X8>)
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
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  unint64_t v38;

  v35 = a1;
  v2 = OUTLINED_FUNCTION_0_5();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_3();
  v26 = v4;
  v5 = type metadata accessor for CalendarButtonView(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E820);
  v29 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F640);
  v31 = *(_QWORD *)(v12 - 8);
  v32 = v12;
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2();
  v15 = v14 - v13;
  v30 = __swift_instantiateConcreteTypeFromMangledName(qword_25754F648);
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_3_3();
  v27 = v16;
  sub_24617E88C(v1, (uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CalendarButtonView);
  v17 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v18 = swift_allocObject();
  sub_24617E7D0((uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  v36 = v1;
  sub_2461876F4();
  v19 = v1 + *(int *)(OUTLINED_FUNCTION_16() + 24);
  v33 = v3;
  v34 = v2;
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v21 = v26;
  v20(v26, v19, v2);
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_6_5();
  if ((v17 & 1) != 0)
    sub_24617DA70();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_6_5();
  if ((v17 & 1) != 0)
    sub_24617DB18();
  v22 = sub_24617E848();
  sub_246187580();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v21, v34);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v11, v8);
  v37 = v8;
  v38 = v22;
  OUTLINED_FUNCTION_4();
  v23 = v27;
  v24 = v32;
  sub_246187634();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v15, v24);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v35, v23, v30);
}

uint64_t sub_24617D8BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  __int128 v15[2];
  char v16;

  v2 = sub_246187850();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24617E90C(a1 + 32, (uint64_t)v15);
  if ((v16 & 1) != 0)
  {
    sub_24617E940(v15, (uint64_t)v12);
    type metadata accessor for CalendarButtonView(0);
    sub_24618779C();
    v7 = v13;
    v8 = v14;
    v9 = __swift_project_boxed_opaque_existential_1(v12, v13);
    sub_246163E54((uint64_t)v9, (uint64_t)v5, v7, v8);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    (*(void (**)(uint64_t))&v15[0])(v6);
    return swift_release();
  }
}

uint64_t sub_24617D9AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  id v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = qword_25754E3F0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v2 != -1)
    swift_once();
  v3 = (id)qword_257550D20;
  result = sub_24618755C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v7;
  return result;
}

void sub_24617DA70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_25_0();
  v3 = *(_QWORD *)(v0 + *(int *)(v2 + 32));
  sub_24617E88C(v0, v0, v4);
  if (v3)
  {
    swift_retain();
  }
  else
  {
    v5 = sub_24617DB18();
    swift_release();
    if (v5)
    {
      sub_246187688();
      sub_2461871F0();
    }
  }
  sub_24617E8D0(v0);
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_24617DB18()
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
  uint64_t (*v11)(_QWORD);
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v17;

  sub_246187250();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_25_0();
  v2 = OUTLINED_FUNCTION_0_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_0();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v17 - v8;
  v10 = *(_QWORD *)(v0 + *(int *)(v7 + 28));
  v12 = sub_24617E88C(v0, (uint64_t)&v17 - v8, v11);
  if (v10)
  {
    swift_retain();
  }
  else
  {
    OUTLINED_FUNCTION_16_2(v12, *MEMORY[0x24BEAD978]);
    v13 = sub_246187724();
    OUTLINED_FUNCTION_17_3();
    v14 = sub_24617E88C((uint64_t)v9, (uint64_t)v6, type metadata accessor for CalendarButtonView.Model);
    if ((v13 & 1) != 0)
    {
      sub_24617E8D0((uint64_t)v6);
    }
    else
    {
      OUTLINED_FUNCTION_16_2(v14, *MEMORY[0x24BEAD960]);
      v15 = sub_246187724();
      OUTLINED_FUNCTION_17_3();
      sub_24617E8D0((uint64_t)v6);
      if ((v15 & 1) == 0)
      {
        sub_24617E8D0((uint64_t)v9);
        return 0;
      }
    }
    sub_246187244();
    v10 = sub_2461871F0();
  }
  sub_24617E8D0((uint64_t)v9);
  return v10;
}

void sub_24617DCE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);

  type metadata accessor for CalendarButtonView(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2();
  sub_24617E88C(v0, v3 - v2, v4);
  sub_24617DD9C();
  sub_246187700();
  OUTLINED_FUNCTION_6_0();
}

uint64_t type metadata accessor for CalendarButtonView(uint64_t a1)
{
  return sub_24617DD6C(a1, qword_25754F600);
}

uint64_t sub_24617DD6C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_24617DD9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754EA20;
  if (!qword_25754EA20)
  {
    v1 = type metadata accessor for CalendarButtonView(255);
    result = MEMORY[0x2495523E0](&unk_246188E18, v1);
    atomic_store(result, (unint64_t *)&qword_25754EA20);
  }
  return result;
}

uint64_t sub_24617DDDC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v10 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v8 = *((_BYTE *)a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v8 & 1) != 0)
    {
      v9 = *(_OWORD *)(a2 + 7);
      *(_OWORD *)(a1 + 56) = v9;
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 32, (uint64_t)(a2 + 4));
    }
    else
    {
      v11 = a2[5];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = v11;
      swift_retain();
    }
    *(_BYTE *)(a1 + 72) = v8;
    v12 = (int *)type metadata accessor for CalendarButtonView.Model(0);
    v13 = v12[6];
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_246187730();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    *(_QWORD *)(a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
    *(_QWORD *)(a1 + v12[8]) = *(uint64_t *)((char *)a2 + v12[8]);
    v17 = *(int *)(a3 + 20);
    v18 = a1 + v17;
    v19 = (uint64_t)a2 + v17;
    v20 = *(_QWORD *)v19;
    LOBYTE(v15) = *(_BYTE *)(v19 + 8);
    swift_retain();
    swift_retain();
    sub_24615EB54(v20, v15);
    *(_QWORD *)v18 = v20;
    *(_BYTE *)(v18 + 8) = v15;
    v21 = *(int *)(a3 + 24);
    v22 = a1 + v21;
    v23 = (uint64_t)a2 + v21;
    v24 = sub_2461877B4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  }
  return a1;
}

uint64_t sub_24617DF58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  else
    swift_release();
  v4 = a1 + *(int *)(type metadata accessor for CalendarButtonView.Model(0) + 24);
  v5 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  sub_24615EB8C(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_BYTE *)(a1 + *(int *)(a2 + 20) + 8));
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_2461877B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t sub_24617E028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  __int128 v8;
  uint64_t v9;
  int *v10;
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

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v7 & 1) != 0)
  {
    v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 56) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v9;
    swift_retain();
  }
  *(_BYTE *)(a1 + 72) = v7;
  v10 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v11 = v10[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  *(_QWORD *)(a1 + v10[7]) = *(_QWORD *)(a2 + v10[7]);
  *(_QWORD *)(a1 + v10[8]) = *(_QWORD *)(a2 + v10[8]);
  v15 = *(int *)(a3 + 20);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  LOBYTE(v13) = *(_BYTE *)(v17 + 8);
  swift_retain();
  swift_retain();
  sub_24615EB54(v18, v13);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v13;
  v19 = *(int *)(a3 + 24);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  return a1;
}

uint64_t sub_24617E178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(a1 + 32);
    if ((*(_BYTE *)(a2 + 72) & 1) != 0)
    {
      v6 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v6;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      *(_BYTE *)(a1 + 72) = 1;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = v7;
      *(_BYTE *)(a1 + 72) = 0;
      swift_retain();
    }
  }
  v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v9 = v8[6];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  *(_QWORD *)(a1 + v8[7]) = *(_QWORD *)(a2 + v8[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + v8[8]) = *(_QWORD *)(a2 + v8[8]);
  swift_retain();
  swift_release();
  v13 = *(int *)(a3 + 20);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_QWORD *)v15;
  LOBYTE(v10) = *(_BYTE *)(v15 + 8);
  sub_24615EB54(*(_QWORD *)v15, v10);
  v17 = *(_QWORD *)v14;
  v18 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v14 = v16;
  *(_BYTE *)(v14 + 8) = v10;
  sub_24615EB8C(v17, v18);
  v19 = *(int *)(a3 + 24);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

_OWORD *sub_24617E31C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  *(_OWORD *)((char *)a1 + 57) = *(_OWORD *)((char *)a2 + 57);
  v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246187730();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + v8[7]) = *(_QWORD *)((char *)a2 + v8[7]);
  *(_QWORD *)((char *)a1 + v8[8]) = *(_QWORD *)((char *)a2 + v8[8]);
  v13 = *(int *)(a3 + 20);
  v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v13;
  v16 = (char *)a2 + v13;
  v15[8] = v16[8];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v17 = (char *)a1 + v14;
  v18 = (char *)a2 + v14;
  v19 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_24617E400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_246169C90(a1 + 32);
    v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  v8 = (int *)type metadata accessor for CalendarButtonView.Model(0);
  v9 = v8[6];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_246187730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  *(_QWORD *)(a1 + v8[7]) = *(_QWORD *)(a2 + v8[7]);
  swift_release();
  *(_QWORD *)(a1 + v8[8]) = *(_QWORD *)(a2 + v8[8]);
  swift_release();
  v13 = *(int *)(a3 + 20);
  v14 = a1 + v13;
  v15 = (uint64_t *)(a2 + v13);
  v16 = *v15;
  LOBYTE(v15) = *((_BYTE *)v15 + 8);
  v17 = *(_QWORD *)v14;
  v18 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v14 = v16;
  *(_BYTE *)(v14 + 8) = (_BYTE)v15;
  sub_24615EB8C(v17, v18);
  v19 = *(int *)(a3 + 24);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
  return a1;
}

uint64_t sub_24617E534()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_24617E540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_10_1();
  if (v7 == (_DWORD)v3)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    if ((_DWORD)v3 == 254)
    {
      OUTLINED_FUNCTION_6_0();
      return;
    }
    v8 = OUTLINED_FUNCTION_7();
    v9 = v4 + *(int *)(a3 + 24);
  }
  OUTLINED_FUNCTION_2_7(v9, v3, v8);
}

uint64_t sub_24617E5B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24617E5BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v8 = OUTLINED_FUNCTION_10_1();
  if (v9 == a3)
  {
    v10 = v8;
    v11 = v5;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(v5 + *(int *)(a4 + 20) + 8) = -(char)v4;
      OUTLINED_FUNCTION_6_0();
      return;
    }
    v10 = OUTLINED_FUNCTION_7();
    v11 = v5 + *(int *)(a4 + 24);
  }
  OUTLINED_FUNCTION_3_9(v11, v4, v4, v10);
}

uint64_t sub_24617E62C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for CalendarButtonView.Model(319);
  if (v1 <= 0x3F)
  {
    result = sub_2461877B4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24617E6B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24617E6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for CalendarButtonView(0);
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v2 + 72) & 1) != 0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 32);
  else
    swift_release();
  v3 = v2 + *(int *)(OUTLINED_FUNCTION_16() + 24);
  v4 = OUTLINED_FUNCTION_0_5();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  sub_24615EB8C(*(_QWORD *)(v2 + *(int *)(v1 + 20)), *(_BYTE *)(v2 + *(int *)(v1 + 20) + 8));
  v5 = v2 + *(int *)(v1 + 24);
  v6 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_24617E7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CalendarButtonView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24617E814()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CalendarButtonView(0) - 8) + 80);
  return sub_24617D8BC(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_24617E840@<X0>(uint64_t a1@<X8>)
{
  return sub_24617D9AC(a1);
}

unint64_t sub_24617E848()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754E828;
  if (!qword_25754E828)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E820);
    result = MEMORY[0x2495523E0](MEMORY[0x24BDF43B0], v1);
    atomic_store(result, (unint64_t *)&qword_25754E828);
  }
  return result;
}

uint64_t sub_24617E88C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24617E8D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CalendarButtonView.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24617E90C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for CalendarButtonView.Model.Action(a2, a1);
  return a2;
}

uint64_t sub_24617E940(__int128 *a1, uint64_t a2)
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

uint64_t sub_24617E958()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F640);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754E820);
  sub_24617E848();
  OUTLINED_FUNCTION_4();
  return OUTLINED_FUNCTION_4();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_246187730();
}

uint64_t OUTLINED_FUNCTION_2_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_3_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  uint64_t v0;
  char v1;

  return sub_24615EB8C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;
  char v1;

  sub_24615EB54(v0, v1);
  return sub_246167814();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t *sub_24617EA50(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_246186F74();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 20);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_2461877B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t type metadata accessor for DayEventGroupView.DayEventGroup(uint64_t a1)
{
  return sub_24617DD6C(a1, qword_25754F738);
}

uint64_t sub_24617EB5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v5 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_2461877B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_24617EBE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_246186F74();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

_QWORD *sub_24617ECAC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246186F74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_24617ED7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

_QWORD *sub_24617EE24(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_246186F74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2461877B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_24617EEDC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617EEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_4_8();
  if (v7 == (_DWORD)v3)
  {
    v8 = v6;
    v9 = v4;
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7();
    v9 = v4 + *(int *)(a3 + 20);
  }
  return OUTLINED_FUNCTION_2_7(v9, v3, v8);
}

uint64_t sub_24617EF30()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617EF3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v8 = OUTLINED_FUNCTION_4_8();
  if (v9 == a3)
  {
    v10 = v8;
    v11 = v5;
  }
  else
  {
    v10 = OUTLINED_FUNCTION_7();
    v11 = v5 + *(int *)(a4 + 20);
  }
  return OUTLINED_FUNCTION_3_9(v11, v4, v4, v10);
}

uint64_t type metadata accessor for DayEventGroupView(uint64_t a1)
{
  return sub_24617DD6C(a1, qword_25754F6A8);
}

uint64_t sub_24617EFA0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for DayEventGroupView.DayEventGroup(319);
  if (v1 <= 0x3F)
  {
    result = sub_2461877B4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_24617F024(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_246186F74();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_24617F0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_246186F74();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_24617F128(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_246186F74();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_24617F1B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246186F74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_24617F244(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v7 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24617F2A8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_246186F74();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24617F324()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617F330(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_7_1();
    return OUTLINED_FUNCTION_2_7(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_24617F398()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24617F3A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_7_1();
    return OUTLINED_FUNCTION_3_9(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_24617F404()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246186F74();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24617F484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F778);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v3 = sub_246187430();
  *((_QWORD *)v3 + 1) = 0x4014000000000000;
  v3[16] = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F780);
  sub_24617F558(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_24615EFA0(&qword_25754F788, &qword_25754F778);
  sub_2461875B0();
  return sub_24617FB84((uint64_t)v3);
}

uint64_t sub_24617F558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
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
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a2;
  v3 = type metadata accessor for DayEventGroupView(0);
  v39 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v39 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v38 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F790);
  v42 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v37 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E758);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E760);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_246186F74();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for DateHeaderView();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v37 - v23;
  v25 = type metadata accessor for DayEventGroupView.DayEventGroup(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1 + *(int *)(v25 + 24), v15);
  *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  swift_storeEnumTagMultiPayload();
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  sub_246180920();
  v44 = *(_QWORD *)(a1 + 16);
  v26 = v38;
  sub_246163D18(a1, v38, type metadata accessor for DayEventGroupView);
  v27 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v28 = swift_allocObject();
  sub_246163CEC(v26, v28 + v27, type metadata accessor for DayEventGroupView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E6E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754EBB0);
  sub_24615EFA0(&qword_25754E6F8, &qword_25754E6E8);
  sub_24616C1FC();
  sub_24615EEBC(&qword_25754E740, (void (*)(uint64_t))type metadata accessor for RenderableEvent);
  v29 = v40;
  sub_24618770C();
  sub_246163D18((uint64_t)v24, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  v30 = v41;
  v31 = v42;
  v32 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v32(v41, v29, v5);
  v33 = v43;
  sub_246163D18((uint64_t)v22, v43, (uint64_t (*)(_QWORD))type metadata accessor for DateHeaderView);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F798);
  v32((char *)(v33 + *(int *)(v34 + 48)), v30, v5);
  v35 = *(void (**)(char *, uint64_t))(v31 + 8);
  v35(v29, v5);
  sub_24617FCE0((uint64_t)v24);
  v35(v30, v5);
  return sub_24617FCE0((uint64_t)v22);
}

uint64_t sub_24617F96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v21;

  v6 = (int *)type metadata accessor for EventCellView();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E560);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RenderableEvent();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246163D18(a1, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v15 = a2 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v16 = sub_246186F74();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v11, v15, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v16);
  v17 = (uint64_t)&v8[v6[5]];
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v16);
  v18 = &v8[v6[7]];
  *(_QWORD *)v18 = swift_getKeyPath();
  v18[8] = 0;
  sub_246163CEC((uint64_t)v14, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_246163CA4((uint64_t)v11, v17);
  v8[v6[6]] = 0;
  sub_246163CEC((uint64_t)v8, a3, (uint64_t (*)(_QWORD))type metadata accessor for EventCellView);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754EBB0);
  sub_246163D18(a1, a3 + *(int *)(v19 + 36), (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  type metadata accessor for PunchoutToEventDetailsModifier();
  return sub_2461877A8();
}

uint64_t sub_24617FB68@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24617FB74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24617FB84(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F778);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24617FBDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for DayEventGroupView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(type metadata accessor for DayEventGroupView.DayEventGroup(0) + 24);
  v5 = OUTLINED_FUNCTION_7_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + *(int *)(v1 + 20);
  v7 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_24617FC94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DayEventGroupView(0) - 8) + 80);
  return sub_24617F96C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_24617FCE0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24617FD1C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F778);
  sub_24615EFA0(&qword_25754F788, &qword_25754F778);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return type metadata accessor for DayEventGroupView.DayEventGroup(0);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_246186F74();
}

id sub_24617FDAC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v2 = v1;
  v4 = sub_246186F74();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2();
  if (!*(_QWORD *)(v1 + 8)
    || (v5 = (void *)sub_2461878D4(),
        v6 = objc_msgSend(a1, sel_eventWithIdentifier_, v5),
        v5,
        !v6))
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_eventWithEventStore_, a1);
  }
  v7 = *(_QWORD *)(v2 + 96);
  v8 = *(_QWORD *)(v2 + 104);
  v9 = v6;
  swift_bridgeObjectRetain();
  sub_24618075C(v7, v8, v9);

  swift_bridgeObjectRelease();
  v10 = sub_246187124();
  sub_246186E9C();
  v11 = (void *)sub_246186F68();
  v12 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_9(v12, sel_setStartDate_);

  sub_246186E90();
  v13 = (void *)sub_246186F68();
  v14 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_4_9(v14, sel_setEndDate_);

  v15 = v9;
  v16 = (void *)sub_2461878D4();
  v17 = objc_msgSend(a1, sel_calendarWithIdentifier_, v16);

  if (!v17)
    v17 = objc_msgSend(a1, sel_defaultCalendarForNewEvents);
  objc_msgSend(v15, sel_setCalendar_, v17);

  v18 = *(void **)(v2 + *(int *)(v10 + 40) + 8);
  v19 = v15;
  if (v18)
    v18 = (void *)sub_2461878D4();
  objc_msgSend(v15, sel_setLocation_, v18);

  objc_msgSend(v15, sel_setAllDay_, *(unsigned __int8 *)(v2 + *(int *)(v10 + 36)));
  return v15;
}

uint64_t sub_246180008@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;

  v3 = v2;
  v6 = sub_246187160();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v10 = v9 - v8;
  sub_246187124();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v14 = (uint64_t *)(v13 - v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F7A0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_2();
  v18 = v17 - v16;
  sub_2461801F4(v3, (uint64_t)v14);
  sub_2461802F8((uint64_t)a1, v14, v18);
  v19 = sub_2461870C4();
  if (__swift_getEnumTagSinglePayload(v18, 1, v19) != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a2, v18, v19);
  sub_2461806A4(v18);
  v20 = sub_246187148();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v20, v6);
  v21 = sub_246187154();
  v22 = sub_246187934();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_24615C000, v21, v22, "[Snippet.Event] Could not create event cell model", v23, 2u);
    MEMORY[0x249552434](v23, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  sub_2461806E4();
  swift_allocError();
  return swift_willThrow();
}

uint64_t sub_2461801F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_246187124();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246180238()
{
  return sub_246187A24();
}

uint64_t sub_24618025C()
{
  sub_246187A18();
  sub_246187A24();
  return sub_246187A30();
}

uint64_t sub_24618029C()
{
  return 1;
}

uint64_t sub_2461802AC()
{
  sub_246187A18();
  sub_246187A24();
  return sub_246187A30();
}

uint64_t sub_2461802F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  char *v28;
  void (*v29)(uint64_t, char *, uint64_t);
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v42 = a1;
  v43 = a3;
  sub_246186F74();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x24BDAC7A8](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F7A0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_8();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v38 - v11;
  v13 = sub_246187160();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2_8();
  v17 = v15 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v38 - v19;
  v41 = sub_2461870C4();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_2();
  v40 = (char *)(v22 - v21);
  if (a2[1])
  {
    v23 = *a2;
    swift_bridgeObjectRetain();
    v24 = sub_246187148();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, v24, v13);
    v25 = sub_246187154();
    v26 = sub_246187940();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_7_2();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_24615C000, v25, v26, "[Snippet.Event] Initializing EventListCellViewModel with concrete event", v27, 2u);
      OUTLINED_FUNCTION_2_3();
    }

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
    sub_2461870AC();
    sub_246180720((uint64_t)a2);
    if (!OUTLINED_FUNCTION_3_10((uint64_t)v12))
    {
      v28 = v40;
      v29 = *(void (**)(uint64_t, char *, uint64_t))(v39 + 32);
      v29((uint64_t)v40, v12, v23);
LABEL_12:
      v35 = v43;
      v29(v43, v28, v23);
      v36 = 0;
      return __swift_storeEnumTagSinglePayload(v35, v36, 1, v23);
    }
  }
  else
  {
    v38 = v9;
    v30 = sub_246187148();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v20, v30, v13);
    v31 = sub_246187154();
    v32 = sub_246187940();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_7_2();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_24615C000, v31, v32, "[Snippet.Event] Initializing EventListCellViewModel with draft event", v33, 2u);
      OUTLINED_FUNCTION_2_3();
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
    v23 = a2[12];
    sub_246187124();
    swift_bridgeObjectRetain();
    sub_246186E9C();
    sub_246186E90();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v34 = v38;
    sub_2461870B8();
    sub_246180720((uint64_t)a2);
    if (!OUTLINED_FUNCTION_3_10(v34))
    {
      v28 = v40;
      v29 = *(void (**)(uint64_t, char *, uint64_t))(v39 + 32);
      v29((uint64_t)v40, (char *)v34, v23);
      goto LABEL_12;
    }
    v12 = (char *)v34;
  }
  v35 = v43;
  sub_2461806A4((uint64_t)v12);
  v36 = 1;
  return __swift_storeEnumTagSinglePayload(v35, v36, 1, v23);
}

uint64_t sub_2461806A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F7A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2461806E4()
{
  unint64_t result;

  result = qword_25754F7A8;
  if (!qword_25754F7A8)
  {
    result = MEMORY[0x2495523E0](&unk_246189054, &type metadata for EventListCellViewModelError);
    atomic_store(result, (unint64_t *)&qword_25754F7A8);
  }
  return result;
}

uint64_t sub_246180720(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246187124();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24618075C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2461878D4();
  objc_msgSend(a3, sel_setTitle_, v4);

}

uint64_t getEnumTagSinglePayload for EventListCellViewModelError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EventListCellViewModelError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246180838 + 4 * byte_246188FC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246180858 + 4 * byte_246188FC5[v4]))();
}

_BYTE *sub_246180838(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246180858(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246180860(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246180868(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246180870(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246180878(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_246180884()
{
  return 0;
}

ValueMetadata *type metadata accessor for EventListCellViewModelError()
{
  return &type metadata for EventListCellViewModelError;
}

unint64_t sub_2461808A0()
{
  unint64_t result;

  result = qword_25754F7B0;
  if (!qword_25754F7B0)
  {
    result = MEMORY[0x2495523E0](&unk_24618902C, &type metadata for EventListCellViewModelError);
    atomic_store(result, (unint64_t *)&qword_25754F7B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_10(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, *(_QWORD *)(v1 - 104));
}

id OUTLINED_FUNCTION_4_9(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_slowAlloc();
}

void sub_246180920()
{
  uint64_t v0;
  char v1;
  char v2;
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  int *v30;
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

  OUTLINED_FUNCTION_3_2();
  v2 = v1;
  v39 = v3;
  v40 = v4;
  v37 = v5;
  v7 = v6;
  v9 = v8;
  v10 = sub_246186F2C();
  v43 = *(_QWORD *)(v10 - 8);
  v44 = v10;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v12 = sub_246186F14();
  v41 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_2();
  v38 = sub_246186F44();
  v36 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2();
  v17 = v16 - v15;
  v35 = *(_QWORD *)(OUTLINED_FUNCTION_11_3() - 8);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2_8();
  v21 = v19 - v20;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v35 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v35 - v26;
  OUTLINED_FUNCTION_7_1();
  v28 = OUTLINED_FUNCTION_26_2();
  v29(v28, v7);
  v30 = (int *)OUTLINED_FUNCTION_5_5();
  sub_2461825B4(v37, v9 + v30[5], &qword_25754E760);
  sub_2461825B4(v39, v9 + v30[6], &qword_25754E758);
  v31 = v9 + v30[7];
  *(_QWORD *)v31 = v40;
  *(_BYTE *)(v31 + 8) = v2 & 1;
  v32 = sub_2461877A8();
  MEMORY[0x24955157C](v32);
  sub_246186F38();
  sub_246186F50();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v17, v38);
  OUTLINED_FUNCTION_20_2(v21);
  sub_246186F08();
  sub_246186EF0();
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v0, v42);
  OUTLINED_FUNCTION_20_2((uint64_t)v25);
  sub_246186F20();
  sub_246186EFC();
  OUTLINED_FUNCTION_8_5(v43);
  OUTLINED_FUNCTION_20_2((uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(qword_25754F7B8);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2461890A0;
  *(_QWORD *)(v33 + 32) = 20554;
  *(_QWORD *)(v33 + 40) = 0xE200000000000000;
  v34 = v30[10];
  *(_QWORD *)(v33 + 48) = 21067;
  *(_QWORD *)(v33 + 56) = 0xE200000000000000;
  *(_QWORD *)(v9 + v34) = v33;
  OUTLINED_FUNCTION_1_4();
}

uint64_t type metadata accessor for DateHeaderView()
{
  uint64_t result;

  result = qword_25754F818;
  if (!qword_25754F818)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_246180BC0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246186F74();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_246187010();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_246187028();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *(_QWORD *)v19;
    v21 = v19[8];
    sub_24615EB54(*(_QWORD *)v19, v21);
    *(_QWORD *)v18 = v20;
    v18[8] = v21;
    v22 = a3[8];
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    v25 = sub_2461877B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    v26 = a3[9];
    v27 = (char *)a1 + v26;
    v28 = (char *)a2 + v26;
    v29 = sub_246186F5C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    *(uint64_t *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_246180DCC(uint64_t a1, int *a2)
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

  v4 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_246187010();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_246187028();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_24615EB8C(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  v9 = a1 + a2[8];
  v10 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = a1 + a2[9];
  v12 = sub_246186F5C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_246180F14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_246187010();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_246187028();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  sub_24615EB54(*(_QWORD *)v17, v19);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v19;
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  v24 = a3[9];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = sub_246186F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2461810F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (_QWORD *)(a1 + v7);
    v9 = (_QWORD *)(a2 + v7);
    sub_24615EF1C(a1 + v7, &qword_25754E768);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_246187010();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[6];
    v12 = (_QWORD *)(a1 + v11);
    v13 = (_QWORD *)(a2 + v11);
    sub_24615EF1C(a1 + v11, &qword_25754E770);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_246187028();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  sub_24615EB54(*(_QWORD *)v17, v19);
  v20 = *(_QWORD *)v16;
  v21 = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v19;
  sub_24615EB8C(v20, v21);
  v22 = a3[8];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 24))(v23, v24, v25);
  v26 = a3[9];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246186F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v27, v28, v29);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246181314(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
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

  v6 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_246187010();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[6];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_246187028();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  v17 = a3[7];
  v18 = a3[8];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  v21 = a1 + v18;
  v22 = a2 + v18;
  v23 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  v24 = a3[9];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = sub_246186F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_2461814D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_246186F74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_24615EF1C(a1 + v7, &qword_25754E768);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_246187010();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    v12 = a3[6];
    v13 = (void *)(a1 + v12);
    v14 = (const void *)(a2 + v12);
    sub_24615EF1C(a1 + v12, &qword_25754E770);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_246187028();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  LOBYTE(v19) = *((_BYTE *)v19 + 8);
  v21 = *(_QWORD *)v18;
  v22 = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v18 = v20;
  *(_BYTE *)(v18 + 8) = (_BYTE)v19;
  sub_24615EB8C(v21, v22);
  v23 = a3[8];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = sub_2461877B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v24, v25, v26);
  v27 = a3[9];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = sub_246186F5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(v28, v29, v30);
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2461816DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2461816E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v19;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_4();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E760);
  OUTLINED_FUNCTION_3_4();
  if (v9)
  {
    v7 = v10;
    v11 = a3[5];
LABEL_16:
    v8 = a1 + v11;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E758);
  OUTLINED_FUNCTION_3_4();
  if (v12)
  {
    v7 = v13;
    v11 = a3[6];
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_4();
  if (v14)
  {
    v7 = v15;
    v11 = a3[8];
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_3_4();
  if (v16)
  {
    v7 = v17;
    v11 = a3[9];
    goto LABEL_16;
  }
  v19 = *(_QWORD *)(a1 + a3[10]);
  if (v19 >= 0xFFFFFFFF)
    LODWORD(v19) = -1;
  return (v19 + 1);
}

uint64_t sub_2461817C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461817D4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_4();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754E760);
    OUTLINED_FUNCTION_4_4();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754E758);
      OUTLINED_FUNCTION_4_4();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_4_4();
        if (v15)
        {
          v8 = v16;
          v12 = a4[8];
        }
        else
        {
          OUTLINED_FUNCTION_11_3();
          OUTLINED_FUNCTION_4_4();
          if (!v17)
          {
            *(_QWORD *)(a1 + a4[10]) = (a2 - 1);
            return;
          }
          v8 = v18;
          v12 = a4[9];
        }
      }
    }
    v9 = a1 + v12;
  }
  __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_2461818B0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_246186F74();
  if (v0 <= 0x3F)
  {
    sub_2461819BC(319, &qword_25754F828, (void (*)(uint64_t))MEMORY[0x24BDCEEA8]);
    if (v1 <= 0x3F)
    {
      sub_2461819BC(319, qword_25754F830, (void (*)(uint64_t))MEMORY[0x24BDCF2D8]);
      if (v2 <= 0x3F)
      {
        sub_2461877B4();
        if (v3 <= 0x3F)
        {
          sub_246186F5C();
          if (v4 <= 0x3F)
            swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_2461819BC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2461871A8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_246181A08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246181A18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_3_2();
  v29 = v1;
  v30 = v2;
  v3 = sub_246187010();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F900);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_8();
  v26 = v9 - v10;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - v12;
  v14 = sub_246187028();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_5_5();
  sub_246167DC0();
  v16 = sub_24618701C();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0, v14);
  swift_bridgeObjectRetain();
  if ((v16 & 1) != 0)
  {
    sub_246167D9C();
    sub_246186FD4();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
    v17 = sub_246186FC8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v17) == 1)
    {
      sub_24615EF1C((uint64_t)v13, &qword_25754F900);
      v18 = 0;
    }
    else
    {
      v18 = sub_246186FBC();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v13, v17);
    }
    v22 = OUTLINED_FUNCTION_24_0(v18);
    OUTLINED_FUNCTION_17_4();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
      return sub_246187664();
  }
  else
  {
    sub_246167D9C();
    v19 = v26;
    sub_246186FD4();
    OUTLINED_FUNCTION_9_4(v27);
    v20 = sub_246186FC8();
    if (__swift_getEnumTagSinglePayload(v19, 1, v20) == 1)
    {
      sub_24615EF1C(v19, &qword_25754F900);
      v21 = 0;
    }
    else
    {
      v21 = sub_246186FBC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
    }
    v24 = OUTLINED_FUNCTION_24_0(v21);
    OUTLINED_FUNCTION_17_4();
    swift_bridgeObjectRelease();
    if ((v24 & 1) != 0)
      return sub_2461876AC();
  }
  return sub_2461876A0();
}

uint64_t sub_246181CBC(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_2461879DC();
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
    if (v12 || (sub_2461879DC() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_246181D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  __int128 v47;
  __int128 v48;
  char v49;

  OUTLINED_FUNCTION_3_2();
  v38 = v2;
  v3 = OUTLINED_FUNCTION_5_5();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v35 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_11_3();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_7_1();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_23_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v0 + *(int *)(v3 + 36), v6);
  sub_24617582C(&qword_25754F8F0, v7, MEMORY[0x24BDCE290]);
  sub_24617582C(&qword_25754F8F8, v13, MEMORY[0x24BDCE958]);
  v15 = sub_246187550();
  v17 = v16;
  LOBYTE(v11) = v18 & 1;
  v19 = sub_246187538();
  v21 = v20;
  v23 = v22 & 1;
  sub_24615EF54(v15, v17, v11);
  swift_bridgeObjectRelease();
  v39 = sub_246181A18();
  v24 = sub_246187514();
  v26 = v25;
  LOBYTE(v11) = v27;
  v29 = v28;
  sub_24615EF54(v19, v21, v23);
  swift_release();
  OUTLINED_FUNCTION_17_4();
  KeyPath = swift_getKeyPath();
  v31 = sub_2461874A8();
  v39 = v24;
  v40 = v26;
  v41 = v11 & 1;
  v42 = v29;
  v43 = KeyPath;
  v44 = 1;
  v45 = 0;
  v46 = v31;
  v47 = 0u;
  v48 = 0u;
  v49 = 1;
  v32 = v35;
  sub_2461828A8(v0, v35);
  v33 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v34 = swift_allocObject();
  sub_246182A38(v32, v34 + v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F8B8);
  sub_246182728();
  sub_246187604();
  swift_release();
  sub_24615EF54(v39, v40, v41);
  swift_release();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_246182038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = sub_246187850();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_2();
  v4 = v3 - v2;
  sub_246186EE4();
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  sub_24617766C();
  sub_246187064();
  v6 = (void *)sub_24618794C();
  OUTLINED_FUNCTION_5_5();
  sub_24618779C();
  v7 = v6;
  sub_246187838();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
}

void sub_246182124()
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
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  OUTLINED_FUNCTION_3_2();
  v42 = v4;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F878);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v41 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754F880);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14_3();
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F888);
  v9 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_4_2();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F890);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_15_1();
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F898);
  OUTLINED_FUNCTION_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_8();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v37 = (uint64_t)&v37 - v17;
  v18 = v0 + *(int *)(OUTLINED_FUNCTION_5_5() + 28);
  v19 = *(_QWORD *)v18;
  v20 = *(_BYTE *)(v18 + 8);
  sub_24615EB54(*(_QWORD *)v18, v20);
  v21 = sub_246167814();
  sub_24615EB8C(v19, v20);
  sub_246181D80();
  if ((v21 & 1) != 0)
  {
    v22 = v40;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v41, v1, v40);
    swift_storeEnumTagMultiPayload();
    sub_246182608();
    v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8B8);
    v24 = sub_246182728();
    v43 = v23;
    v44 = v24;
    OUTLINED_FUNCTION_19_2();
    sub_24618746C();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v22);
  }
  else
  {
    v25 = *MEMORY[0x24BDF1D90];
    v26 = sub_24618752C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v2, v25, v26);
    __swift_storeEnumTagSinglePayload(v2, 0, 1, v26);
    KeyPath = swift_getKeyPath();
    v28 = (uint64_t *)(v3 + *(int *)(v10 + 36));
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F8A0);
    sub_2461825D8(v2, (uint64_t)v28 + *(int *)(v29 + 28), &qword_25754F880);
    *v28 = KeyPath;
    v30 = v40;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v3, v1, v40);
    sub_24615EF1C(v2, &qword_25754F880);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v30);
    v31 = sub_246187508();
    v32 = swift_getKeyPath();
    sub_2461825D8(v3, v15, &qword_25754F890);
    v33 = (uint64_t *)(v15 + *(int *)(v38 + 36));
    *v33 = v32;
    v33[1] = v31;
    sub_24615EF1C(v3, &qword_25754F890);
    v34 = v37;
    sub_2461825B4(v15, v37, &qword_25754F898);
    sub_2461825D8(v34, v41, &qword_25754F898);
    swift_storeEnumTagMultiPayload();
    sub_246182608();
    v35 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8B8);
    v36 = sub_246182728();
    v43 = v35;
    v44 = v36;
    OUTLINED_FUNCTION_19_2();
    sub_24618746C();
    sub_24615EF1C(v34, &qword_25754F898);
  }
  OUTLINED_FUNCTION_1_4();
}

void sub_2461824B4()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_1();
}

void sub_2461824D0()
{
  swift_retain();
  sub_246187310();
  OUTLINED_FUNCTION_1();
}

void sub_2461824F4()
{
  sub_246187334();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246182510(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F880);
  MEMORY[0x24BDAC7A8](v2);
  sub_2461825D8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25754F880);
  return sub_246187340();
}

void sub_246182594()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_1();
}

void sub_2461825B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_16_3(a1, a2, a3);
  v3 = OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_23_1(v3, v4);
  OUTLINED_FUNCTION_1();
}

void sub_2461825D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_16_3(a1, a2, a3);
  OUTLINED_FUNCTION_23_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_1();
}

unint64_t sub_246182608()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754F8A8;
  if (!qword_25754F8A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F898);
    v2 = sub_246182684();
    sub_246182810(&qword_25754E470, &qword_25754E478);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F8A8);
  }
  return result;
}

unint64_t sub_246182684()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_25754F8B0;
  if (!qword_25754F8B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F890);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8B8);
    v4[3] = sub_246182728();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_246182810(&qword_25754F8E8, &qword_25754F8A0);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F8B0);
  }
  return result;
}

unint64_t sub_246182728()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25754F8C0;
  if (!qword_25754F8C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8B8);
    v2[0] = sub_246182794();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25754F8C0);
  }
  return result;
}

unint64_t sub_246182794()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754F8C8;
  if (!qword_25754F8C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8D0);
    sub_246182810(&qword_25754F8D8, &qword_25754F8E0);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754F8C8);
  }
  return result;
}

void sub_246182810(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x2495523E0](MEMORY[0x24BDF1028], v3), a1);
  }
  OUTLINED_FUNCTION_1();
}

void sub_24618284C(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = sub_246187364();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_1();
}

void sub_24618287C()
{
  sub_246187370();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_2461828A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2461828EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_5_5();
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  v3 = OUTLINED_FUNCTION_7_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E768);
  if (OUTLINED_FUNCTION_25_1() == 1)
  {
    v4 = sub_246187010();
    OUTLINED_FUNCTION_8_5(*(_QWORD *)(v4 - 8));
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754E770);
  if (OUTLINED_FUNCTION_25_1() == 1)
  {
    v5 = sub_246187028();
    OUTLINED_FUNCTION_8_5(*(_QWORD *)(v5 - 8));
  }
  else
  {
    swift_release();
  }
  sub_24615EB8C(*(_QWORD *)(v2 + *(int *)(v1 + 28)), *(_BYTE *)(v2 + *(int *)(v1 + 28) + 8));
  v6 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9_4(*(_QWORD *)(v6 - 8));
  v7 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_9_4(*(_QWORD *)(v7 - 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246182A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DateHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_246182A7C()
{
  OUTLINED_FUNCTION_5_5();
  sub_246182038();
  OUTLINED_FUNCTION_1();
}

unint64_t sub_246182AB0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[4];

  result = qword_25754F908;
  if (!qword_25754F908)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25754F910);
    v2 = sub_246182608();
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F8B8);
    v3[3] = sub_246182728();
    v3[0] = v2;
    v3[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754F908);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return type metadata accessor for DateHeaderView();
}

uint64_t OUTLINED_FUNCTION_8_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_9_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return sub_246186F5C();
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_20_2(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_246187304();
}

uint64_t OUTLINED_FUNCTION_23_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  return sub_246181CBC(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  uint64_t v0;

  return v0;
}

_QWORD *sub_246182C10(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v8 = *(int *)(sub_2461870E8() + 28);
    v9 = (char *)v4 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_246186F98();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    *((_BYTE *)v4 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)v4 + v13) = *((_BYTE *)a2 + v13);
  }
  return v4;
}

uint64_t sub_246182CE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(sub_2461870E8() + 28);
  v3 = sub_246186F98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t sub_246182D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = *(int *)(sub_2461870E8() + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186F98();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  return a1;
}

uint64_t sub_246182DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v6 = *(int *)(sub_2461870E8() + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_246186F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246182E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = *(int *)(sub_2461870E8() + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_246186F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  return a1;
}

uint64_t sub_246182F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v7 = *(int *)(sub_2461870E8() + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186F98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  return a1;
}

uint64_t sub_246182FAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246182FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = sub_2461870E8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_246183040()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24618304C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_2461870E8();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t type metadata accessor for ParticipantLabelView()
{
  uint64_t result;

  result = qword_25754F970;
  if (!qword_25754F970)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2461830F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2461870E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24618316C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_24618317C()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_2461873F4();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X9 }
}

uint64_t sub_246183224()
{
  OUTLINED_FUNCTION_2_9();
  sub_2461873DC();
  OUTLINED_FUNCTION_1_7();
  sub_2461873DC();
  return sub_24618740C();
}

void sub_246183314(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_2461873C4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F9B0);
  sub_24618335C(v1, a1 + *(int *)(v3 + 44));
}

void sub_24618335C(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;

  v4 = sub_246187238();
  v41 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F9B8);
  MEMORY[0x24BDAC7A8](v36);
  v6 = sub_2461876C4();
  MEMORY[0x24BDAC7A8](v6);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F9C0);
  MEMORY[0x24BDAC7A8](v42);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F9C8);
  v39 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v38 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v37 = (char *)v35 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754F9D0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v43 = (uint64_t)v35 - v15;
  v16 = type metadata accessor for ParticipantLabelView();
  v17 = *(_BYTE *)(a1 + *(int *)(v16 + 24));
  v44 = v16;
  v45 = v14;
  if ((v17 & 1) == 0)
  {
    v19 = *(unsigned __int8 *)(a1 + 16);
    v35[1] = a2;
    v20 = (char *)&loc_246183580 + 4 * byte_2461891C4[v19];
    v35[0] = v4;
    __asm { BR              X10 }
  }
  v18 = v43;
  __swift_storeEnumTagSinglePayload(v43, 1, 1, v7);
  if ((*(_BYTE *)(a1 + *(int *)(v44 + 20)) & 1) != 0 || (sub_24618317C(), !v21))
  {
    v26 = *(_QWORD *)(a1 + 8);
    v46 = *(_QWORD *)a1;
    v47 = v26;
    v48 = 0;
    v49 = MEMORY[0x24BEE4AF8];
    v50 = 1;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_25754E3F0 != -1)
      swift_once();
    v22 = (id)qword_257550D20;
    v46 = sub_24618755C();
    v47 = v23;
    v48 = v24 & 1;
    v49 = v25;
    v50 = 0;
  }
  sub_24618746C();
  v27 = v51;
  v28 = v52;
  v29 = v53;
  v30 = v54;
  v31 = v55;
  KeyPath = swift_getKeyPath();
  v33 = (uint64_t)v45;
  sub_246183B20(v18, (uint64_t)v45, &qword_25754F9D0);
  sub_246183B20(v33, a2, &qword_25754F9D0);
  v34 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25754FA08) + 48);
  *(_QWORD *)v34 = v27;
  *(_QWORD *)(v34 + 8) = v28;
  *(_QWORD *)(v34 + 16) = v29;
  *(_QWORD *)(v34 + 24) = v30;
  *(_BYTE *)(v34 + 32) = v31;
  *(_QWORD *)(v34 + 40) = KeyPath;
  *(_QWORD *)(v34 + 48) = 1;
  *(_BYTE *)(v34 + 56) = 0;
  sub_246183B60(v27, v28, v29);
  swift_retain();
  sub_24615EF1C(v18, &qword_25754F9D0);
  sub_246183B88(v27, v28, v29);
  swift_release();
  sub_24615EF1C(v33, &qword_25754F9D0);
}

uint64_t sub_246183970()
{
  return sub_2461872BC();
}

uint64_t sub_246183990(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2461876C4();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2461872C8();
}

unint64_t sub_246183A10()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_25754F9D8;
  if (!qword_25754F9D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F9C0);
    v2 = sub_246183A94();
    sub_246163D98(&qword_25754FA00, &qword_25754F9B8, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25754F9D8);
  }
  return result;
}

unint64_t sub_246183A94()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25754F9E0;
  if (!qword_25754F9E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754F9E8);
    sub_246163D98(&qword_25754F9F0, &qword_25754F9F8, MEMORY[0x24BDF0710]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2495523E0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754F9E0);
  }
  return result;
}

void sub_246183B20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_246183B60(uint64_t a1, uint64_t a2, char a3)
{
  sub_24615EFD4(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_246183B88(uint64_t a1, uint64_t a2, char a3)
{
  sub_24615EF54(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

void sub_246183BB0()
{
  sub_246163D98(&qword_25754FA10, qword_25754FA18, MEMORY[0x24BDF4498]);
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return sub_2461873D0();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return sub_2461873E8();
}

_QWORD *sub_246183BEC(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  char *v59;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(a1 + 73) = *(_OWORD *)((char *)a2 + 73);
    *(_OWORD *)(a1 + 64) = v10;
    v11 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v11;
    v12 = (int *)sub_246187124();
    v13 = v12[8];
    v58 = (uint64_t)a2 + v13;
    v59 = (char *)v4 + v13;
    v14 = sub_246186EB4();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v59, v58, v14);
    *((_BYTE *)v4 + v12[9]) = *((_BYTE *)a2 + v12[9]);
    v16 = v12[10];
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v12[11];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v12[12];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = sub_246187118();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      *v25 = *v26;
      *(_OWORD *)(v25 + 8) = *(_OWORD *)(v26 + 8);
      v30 = *(int *)(v27 + 28);
      v31 = &v25[v30];
      v32 = &v26[v30];
      v33 = sub_24618710C();
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
      }
      else
      {
        v34 = sub_246186F74();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v31, v32, v34);
        swift_storeEnumTagMultiPayload();
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
    }
    *(_QWORD *)((char *)v4 + v12[13]) = *(uint64_t *)((char *)a2 + v12[13]);
    v35 = (int *)type metadata accessor for RenderableEvent();
    v36 = v35[5];
    v37 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + v36) = v37;
    v38 = v35[6];
    v39 = (char *)v4 + v38;
    v40 = (uint64_t)a2 + v38;
    v41 = sub_2461870C4();
    v42 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16);
    swift_bridgeObjectRetain();
    v43 = v37;
    v42(v39, v40, v41);
    v44 = v35[7];
    v45 = (_QWORD *)((char *)v4 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = a3[6];
    *((_BYTE *)v4 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v49 = (char *)v4 + v48;
    v50 = (uint64_t)a2 + v48;
    v51 = sub_2461877C0();
    v52 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 16);
    swift_bridgeObjectRetain();
    v52(v49, v50, v51);
    v53 = a3[7];
    v54 = (char *)v4 + v53;
    v55 = (uint64_t)a2 + v53;
    v56 = *(_QWORD *)(v55 + 8);
    *(_QWORD *)v54 = *(_QWORD *)v55;
    *((_QWORD *)v54 + 1) = v56;
    v54[16] = *(_BYTE *)(v55 + 16);
    *((_QWORD *)v54 + 3) = *(_QWORD *)(v55 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_246183F14(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = a1 + *(int *)(v4 + 32);
  v6 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v4 + 48);
  v8 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    v9 = v7 + *(int *)(v8 + 28);
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v10 = sub_246186F74();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
    }
  }
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for RenderableEvent();

  v12 = a1 + *(int *)(v11 + 24);
  v13 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  v14 = a1 + *(int *)(a2 + 24);
  v15 = sub_2461877C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2461840B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 64) = v9;
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v56 = a2 + v12;
  v57 = a1 + v12;
  v13 = sub_246186EB4();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v57, v56, v13);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v15 = v11[10];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v11[11];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v11[12];
  v24 = (_BYTE *)(a1 + v23);
  v25 = (_BYTE *)(a2 + v23);
  v26 = sub_246187118();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    *v24 = *v25;
    *(_OWORD *)(v24 + 8) = *(_OWORD *)(v25 + 8);
    v28 = *(int *)(v26 + 28);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      v32 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
  }
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  v33 = (int *)type metadata accessor for RenderableEvent();
  v34 = v33[5];
  v35 = *(void **)(a2 + v34);
  *(_QWORD *)(a1 + v34) = v35;
  v36 = v33[6];
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = sub_2461870C4();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
  swift_bridgeObjectRetain();
  v41 = v35;
  v40(v37, v38, v39);
  v42 = v33[7];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)(a2 + v42);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = sub_2461877C0();
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 16);
  swift_bridgeObjectRetain();
  v50(v47, v48, v49);
  v51 = a3[7];
  v52 = a1 + v51;
  v53 = a2 + v51;
  v54 = *(_QWORD *)(v53 + 8);
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *(_QWORD *)(v52 + 8) = v54;
  *(_BYTE *)(v52 + 16) = *(_BYTE *)(v53 + 16);
  *(_QWORD *)(v52 + 24) = *(_QWORD *)(v53 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2461843AC(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  size_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;

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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)sub_246187124();
  v7 = v6[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + v6[9]) = *(_BYTE *)(a2 + v6[9]);
  v11 = v6[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = v6[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = v6[12];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload(v19, 1, v20);
  if (!EnumTagSinglePayload)
  {
    if (!v22)
    {
      *(_BYTE *)v18 = *(_BYTE *)v19;
      *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
      *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
      if (a1 == a2)
        goto LABEL_14;
      v30 = *(int *)(v20 + 28);
      v31 = v18 + v30;
      v32 = (const void *)(v19 + v30);
      sub_24618574C(v31, (void (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v33 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v55 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v55 - 8) + 16))(v31, v32, v55);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64);
      v28 = (void *)v31;
      v29 = v32;
      goto LABEL_8;
    }
    sub_24618574C(v18, (void (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v28 = (void *)v18;
    v29 = (const void *)v19;
LABEL_8:
    memcpy(v28, v29, v27);
    goto LABEL_14;
  }
  if (v22)
    goto LABEL_7;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v18 + 16) = *(_QWORD *)(v19 + 16);
  v23 = *(int *)(v20 + 28);
  v24 = (void *)(v18 + v23);
  v25 = (const void *)(v19 + v23);
  v26 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v34 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v24, v25, v34);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v20);
LABEL_14:
  *(_QWORD *)(a1 + v6[13]) = *(_QWORD *)(a2 + v6[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (int *)type metadata accessor for RenderableEvent();
  v36 = v35[5];
  v37 = *(void **)(a2 + v36);
  v38 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = v37;
  v39 = v37;

  v40 = v35[6];
  v41 = a1 + v40;
  v42 = a2 + v40;
  v43 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
  v44 = v35[7];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v47 = a3[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461877C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  v51 = a3[7];
  v52 = a1 + v51;
  v53 = a2 + v51;
  *(_QWORD *)v52 = *(_QWORD *)(a2 + v51);
  *(_QWORD *)(v52 + 8) = *(_QWORD *)(a2 + v51 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v52 + 16) = *(_BYTE *)(v53 + 16);
  *(_QWORD *)(v52 + 24) = *(_QWORD *)(v53 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_246184824(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  __int128 v35;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  *(_OWORD *)((char *)a1 + 73) = *(_OWORD *)((char *)a2 + 73);
  a1[6] = a2[6];
  v8 = (int *)sub_246187124();
  v9 = v8[8];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_246186EB4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *((_BYTE *)a1 + v8[9]) = *((_BYTE *)a2 + v8[9]);
  *(_OWORD *)((char *)a1 + v8[10]) = *(_OWORD *)((char *)a2 + v8[10]);
  *(_OWORD *)((char *)a1 + v8[11]) = *(_OWORD *)((char *)a2 + v8[11]);
  v13 = v8[12];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_246187118();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v14 = *v15;
    *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
    v18 = *(int *)(v16 + 28);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_24618710C();
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v22 = sub_246186F74();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
  v23 = (int *)type metadata accessor for RenderableEvent();
  *(_QWORD *)((char *)a1 + v23[5]) = *(_QWORD *)((char *)a2 + v23[5]);
  v24 = v23[6];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2461870C4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  *(_OWORD *)((char *)a1 + v23[7]) = *(_OWORD *)((char *)a2 + v23[7]);
  v28 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_2461877C0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  v32 = a3[7];
  v33 = (_OWORD *)((char *)a1 + v32);
  v34 = (_OWORD *)((char *)a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  return a1;
}

uint64_t sub_246184A78(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
  int v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  size_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)sub_246187124();
  v12 = v11[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246186EB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_BYTE *)(a1 + v11[9]) = *(_BYTE *)(a2 + v11[9]);
  v16 = v11[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = v11[11];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = v11[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  v29 = sub_246187118();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload(v28, 1, v29);
  if (!EnumTagSinglePayload)
  {
    if (!v31)
    {
      *(_BYTE *)v27 = *(_BYTE *)v28;
      *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
      if (a1 == a2)
        goto LABEL_14;
      v39 = *(int *)(v29 + 28);
      v40 = v27 + v39;
      v41 = (const void *)(v28 + v39);
      sub_24618574C(v40, (void (*)(_QWORD))MEMORY[0x24BE91AD0]);
      v42 = sub_24618710C();
      if (!swift_getEnumCaseMultiPayload())
      {
        v65 = sub_246186F74();
        (*(void (**)(uint64_t, const void *, uint64_t))(*(_QWORD *)(v65 - 8) + 32))(v40, v41, v65);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v36 = *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64);
      v37 = (void *)v40;
      v38 = v41;
      goto LABEL_8;
    }
    sub_24618574C(v27, (void (*)(_QWORD))MEMORY[0x24BE91AD8]);
LABEL_7:
    v36 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25754E4C0) - 8) + 64);
    v37 = (void *)v27;
    v38 = (const void *)v28;
LABEL_8:
    memcpy(v37, v38, v36);
    goto LABEL_14;
  }
  if (v31)
    goto LABEL_7;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_OWORD *)(v27 + 8) = *(_OWORD *)(v28 + 8);
  v32 = *(int *)(v29 + 28);
  v33 = (void *)(v27 + v32);
  v34 = (const void *)(v28 + v32);
  v35 = sub_24618710C();
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v43 = sub_246186F74();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v33, v34, v43);
    swift_storeEnumTagMultiPayload();
  }
  __swift_storeEnumTagSinglePayload(v27, 0, 1, v29);
LABEL_14:
  *(_QWORD *)(a1 + v11[13]) = *(_QWORD *)(a2 + v11[13]);
  swift_bridgeObjectRelease();
  v44 = (int *)type metadata accessor for RenderableEvent();
  v45 = v44[5];
  v46 = *(void **)(a1 + v45);
  *(_QWORD *)(a1 + v45) = *(_QWORD *)(a2 + v45);

  v47 = v44[6];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = sub_2461870C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  v51 = v44[7];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (uint64_t *)(a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v57 = a1 + v56;
  v58 = a2 + v56;
  v59 = sub_2461877C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 40))(v57, v58, v59);
  v60 = a3[7];
  v61 = a1 + v60;
  v62 = a2 + v60;
  v63 = *(_QWORD *)(v62 + 8);
  *(_QWORD *)v61 = *(_QWORD *)v62;
  *(_QWORD *)(v61 + 8) = v63;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v61 + 16) = *(_BYTE *)(v62 + 16);
  *(_QWORD *)(v61 + 24) = *(_QWORD *)(v62 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246184E30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246184E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = OUTLINED_FUNCTION_7_3();
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v9;
    v8 = v4 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v11 = *(_QWORD *)(v4 + *(int *)(a3 + 28) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_246184ED0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246184EDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_4_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  result = OUTLINED_FUNCTION_7_3();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
  }
  *(_QWORD *)(v5 + *(int *)(a4 + 28) + 8) = (v4 - 1);
  return result;
}

uint64_t type metadata accessor for EventStatusSnippet()
{
  uint64_t result;

  result = qword_25754FA78;
  if (!qword_25754FA78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246184FA4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for RenderableEvent();
  if (v1 <= 0x3F)
  {
    result = sub_2461877C0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_246185038()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246185048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_6_6();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_246163D18(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for EventStatusSnippet);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_246163CEC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for EventStatusSnippet);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754FAB8);
  sub_246163D98(&qword_25754FAC0, &qword_25754FAB8, MEMORY[0x24BDF5428]);
  return sub_24618773C();
}

uint64_t sub_24618513C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t KeyPath;
  uint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v44 = a2;
  v40 = (char *)sub_2461877C0();
  v38 = *((_QWORD *)v40 - 1);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_2461877D8();
  v42 = *(_QWORD *)(v45 - 8);
  v4 = MEMORY[0x24BDAC7A8](v45);
  v43 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - v6;
  v8 = (int *)type metadata accessor for SingleEventView();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - v12;
  KeyPath = swift_getKeyPath();
  sub_246163D18(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  v14 = type metadata accessor for EventStatusSnippet();
  v11[v8[5]] = *(_BYTE *)(a1 + *(int *)(v14 + 20));
  v15 = &v11[v8[6]];
  *(_QWORD *)v15 = swift_getKeyPath();
  v15[8] = 0;
  sub_2461877A8();
  v16 = &v11[v8[8]];
  *(_QWORD *)v16 = swift_getKeyPath();
  v16[8] = 0;
  *((_QWORD *)v16 + 2) = 0x4030000000000000;
  *((_QWORD *)v16 + 3) = 1;
  *((_QWORD *)v16 + 4) = sub_2461752BC;
  *((_QWORD *)v16 + 5) = 0;
  v17 = &v11[v8[9]];
  *(_QWORD *)v17 = swift_getKeyPath();
  v17[8] = 0;
  sub_246163CEC((uint64_t)v11, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v18 = qword_25754E3F0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 != -1)
    swift_once();
  v19 = (id)qword_257550D20;
  v20 = sub_24618755C();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v47 = MEMORY[0x24BDF1FA8];
  v48 = MEMORY[0x24BEAD6B0];
  v27 = swift_allocObject();
  v46 = v27;
  *(_QWORD *)(v27 + 16) = v20;
  *(_QWORD *)(v27 + 24) = v22;
  *(_BYTE *)(v27 + 32) = v24 & 1;
  *(_QWORD *)(v27 + 40) = v26;
  (*(void (**)(char *, uint64_t, char *))(v38 + 16))(v39, a1 + *(int *)(v14 + 24), v40);
  sub_2461877CC();
  LOBYTE(v46) = 0;
  sub_246163D18((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v40 = v13;
  v28 = v7;
  v29 = v42;
  v30 = v43;
  v31 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v32 = v45;
  v31(v43, v28, v45);
  LOBYTE(v20) = v46;
  v33 = v44;
  v34 = KeyPath;
  *v44 = KeyPath;
  *((_BYTE *)v33 + 8) = v20;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754FAC8);
  sub_246163D18((uint64_t)v11, (uint64_t)v33 + *(int *)(v35 + 48), (uint64_t (*)(_QWORD))type metadata accessor for SingleEventView);
  v31((char *)v33 + *(int *)(v35 + 64), v30, v32);
  sub_24615EB54(v34, v20);
  v36 = *(void (**)(char *, uint64_t))(v29 + 8);
  swift_retain();
  v36(v28, v32);
  sub_24618574C((uint64_t)v40, (void (*)(_QWORD))type metadata accessor for SingleEventView);
  swift_release();
  v36(v30, v32);
  sub_24618574C((uint64_t)v11, (void (*)(_QWORD))type metadata accessor for SingleEventView);
  return sub_24615EB8C(v34, v46);
}

uint64_t sub_246185544()
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
  void (*v11)(uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t);

  v1 = OUTLINED_FUNCTION_6_6();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_246187124();
  v5 = sub_246186EB4();
  OUTLINED_FUNCTION_3_1(v5);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_1();
  v6 = v3 + *(int *)(v4 + 48);
  v7 = sub_246187118();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    sub_24618710C();
    if (!swift_getEnumCaseMultiPayload())
    {
      v8 = sub_246186F74();
      OUTLINED_FUNCTION_3_1(v8);
    }
  }
  swift_bridgeObjectRelease();
  v9 = type metadata accessor for RenderableEvent();

  v10 = v3 + *(int *)(v9 + 24);
  sub_2461870C4();
  OUTLINED_FUNCTION_8_0();
  v11(v10);
  OUTLINED_FUNCTION_2_1();
  v12 = v3 + *(int *)(v1 + 24);
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_8_0();
  v13(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2461856D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_6_6() - 8) + 80);
  return sub_24618513C(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_24618571C()
{
  uint64_t v0;

  sub_24615EF54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24618574C(uint64_t a1, void (*a2)(_QWORD))
{
  void (*v3)(uint64_t);

  a2(0);
  OUTLINED_FUNCTION_8_0();
  v3(a1);
  OUTLINED_FUNCTION_1();
}

void sub_24618577C()
{
  sub_246163D98(&qword_25754FAD0, &qword_25754FAD8, MEMORY[0x24BEADC00]);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return type metadata accessor for EventStatusSnippet();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_2461877C0();
}

void sub_2461857B8()
{
  sub_2461857EC();
}

void sub_2461857D8()
{
  sub_2461857EC();
}

void sub_2461857EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  unsigned int v30;
  uint64_t v31;

  OUTLINED_FUNCTION_3_2();
  v4 = OUTLINED_FUNCTION_9_5(v3);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = (int *)OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_11_4();
  v8 = sub_246187400();
  v28 = v9;
  v11 = v10;
  v13 = v12;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BE91A60];
  v14 = sub_246167BFC();
  OUTLINED_FUNCTION_6_7(v14);
  v15 = *MEMORY[0x24BEAD970];
  v30 = *MEMORY[0x24BEAD970];
  v16 = OUTLINED_FUNCTION_0_5();
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104);
  v29(v2, v15, v16);
  *(_QWORD *)v1 = v8;
  *(_QWORD *)(v1 + 8) = v28;
  *(_BYTE *)(v1 + 16) = v11 & 1;
  *(_QWORD *)(v1 + 24) = v13;
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_24_1(v17, v18, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_24617E88C(v1, v0 + *(int *)(v4 + 20), type metadata accessor for CalendarButtonView.Model);
  v19 = OUTLINED_FUNCTION_10_2();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = v0 + *(int *)(v4 + 24);
  *(_QWORD *)(v26 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(v26 + 64) = v31;
  *(_BYTE *)(v26 + 32) = 1;
  *(_BYTE *)(v26 + 72) = 1;
  v29(v26 + v6[6], v30, v16);
  *(_QWORD *)v26 = v19;
  *(_QWORD *)(v26 + 8) = v21;
  *(_BYTE *)(v26 + 16) = v23 & 1;
  *(_QWORD *)(v26 + 24) = v25;
  *(_QWORD *)(v26 + v6[7]) = 0;
  *(_QWORD *)(v26 + v6[8]) = 0;
  OUTLINED_FUNCTION_2_10();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18_0(KeyPath);
  OUTLINED_FUNCTION_16_4((uint64_t)sub_2461752BC);
  OUTLINED_FUNCTION_14_4();
  sub_24616046C(v0, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  sub_24616046C(v1, type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_1_4();
}

void sub_2461859AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  unint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_3_2();
  v3 = (int *)OUTLINED_FUNCTION_9_5(v2);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v4);
  v5 = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - v8;
  v29 = sub_246187400();
  v11 = v10;
  v28 = v12;
  v14 = v13;
  *((_QWORD *)v9 + 7) = MEMORY[0x24BE91A60];
  v31 = sub_246167BFC();
  *((_QWORD *)v9 + 8) = v31;
  v9[32] = 0;
  v9[72] = 1;
  v15 = &v9[*(int *)(v5 + 24)];
  v16 = *MEMORY[0x24BEAD978];
  v17 = OUTLINED_FUNCTION_0_5();
  v30 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104);
  v30(v15, v16, v17);
  *(_QWORD *)v9 = v29;
  *((_QWORD *)v9 + 1) = v11;
  v9[16] = v28 & 1;
  *((_QWORD *)v9 + 3) = v14;
  OUTLINED_FUNCTION_20_3();
  v18 = sub_246187400();
  v20 = v19;
  LOBYTE(v11) = v21;
  v23 = v22;
  v24 = v31;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(v1 + 64) = v24;
  *(_BYTE *)(v1 + 32) = 1;
  *(_BYTE *)(v1 + 72) = 1;
  v30((char *)(v1 + *(int *)(v5 + 24)), *MEMORY[0x24BEAD970], v17);
  *(_QWORD *)v1 = v18;
  *(_QWORD *)(v1 + 8) = v20;
  *(_BYTE *)(v1 + 16) = v11 & 1;
  *(_QWORD *)(v1 + 24) = v23;
  OUTLINED_FUNCTION_19_3();
  sub_24617E88C(v32, v0, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_24617E88C((uint64_t)v9, v0 + v3[5], type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_23_2(v0 + v3[7], 1);
  *(_BYTE *)(v0 + v25) = 1;
  OUTLINED_FUNCTION_21_1();
  v26 = v0 + v3[11];
  *(_QWORD *)v26 = swift_getKeyPath();
  *(_BYTE *)(v26 + 8) = 0;
  *(_QWORD *)(v26 + 16) = 0x4030000000000000;
  *(_QWORD *)(v26 + 24) = 1;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_2461752BC);
  OUTLINED_FUNCTION_15_2();
  sub_24616046C(v0, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  OUTLINED_FUNCTION_13_1(v1);
  OUTLINED_FUNCTION_13_1((uint64_t)v9);
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_1_4();
}

void sub_246185BEC()
{
  OUTLINED_FUNCTION_5_6();
}

void sub_246185C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
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
  uint64_t KeyPath;
  char v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;

  OUTLINED_FUNCTION_3_2();
  v4 = OUTLINED_FUNCTION_9_5(v3);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = (int *)OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_11_4();
  v8 = sub_246187400();
  v10 = v9;
  v27 = v11;
  v13 = v12;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BE91A60];
  v14 = sub_246167BFC();
  OUTLINED_FUNCTION_6_7(v14);
  v15 = *MEMORY[0x24BEAD978];
  v16 = OUTLINED_FUNCTION_0_5();
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104);
  v28(v2, v15, v16);
  *(_QWORD *)v1 = v8;
  *(_QWORD *)(v1 + 8) = v10;
  *(_BYTE *)(v1 + 16) = v27 & 1;
  *(_QWORD *)(v1 + 24) = v13;
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_24_1(v17, v18, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_24617E88C(v1, v0 + *(int *)(v4 + 20), type metadata accessor for CalendarButtonView.Model);
  v19 = OUTLINED_FUNCTION_10_2();
  v21 = v20;
  LOBYTE(v8) = v22;
  v24 = v23;
  v25 = v0 + *(int *)(v4 + 24);
  *(_QWORD *)(v25 + 56) = MEMORY[0x24BE91A60];
  *(_QWORD *)(v25 + 64) = v29;
  *(_BYTE *)(v25 + 32) = 2;
  *(_BYTE *)(v25 + 72) = 1;
  v28(v25 + v6[6], *MEMORY[0x24BEAD970], v16);
  *(_QWORD *)v25 = v19;
  *(_QWORD *)(v25 + 8) = v21;
  *(_BYTE *)(v25 + 16) = v8 & 1;
  *(_QWORD *)(v25 + 24) = v24;
  *(_QWORD *)(v25 + v6[7]) = 0;
  *(_QWORD *)(v25 + v6[8]) = 0;
  OUTLINED_FUNCTION_2_10();
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_18_0(KeyPath);
  OUTLINED_FUNCTION_16_4((uint64_t)sub_2461752BC);
  OUTLINED_FUNCTION_14_4();
  sub_24616046C(v0, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  sub_24616046C(v1, type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_1_4();
}

void sub_246185DCC()
{
  OUTLINED_FUNCTION_5_6();
}

void sub_246185DE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_3_2();
  v34 = v3;
  v35 = v2;
  v4 = (int *)type metadata accessor for SingleEventWithButtonsSnippet();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - v9;
  v11 = sub_246187400();
  v31 = v12;
  v32 = v13;
  HIDWORD(v30) = v14;
  *((_QWORD *)v10 + 7) = MEMORY[0x24BE91A80];
  v33 = sub_24618605C();
  *((_QWORD *)v10 + 8) = v33;
  v10[32] = 1;
  v10[72] = 1;
  v15 = &v10[*(int *)(v6 + 24)];
  v16 = *MEMORY[0x24BEAD978];
  v17 = OUTLINED_FUNCTION_0_5();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104);
  v18(v15, v16, v17);
  v19 = v31;
  *(_QWORD *)v10 = v11;
  *((_QWORD *)v10 + 1) = v19;
  v10[16] = BYTE4(v30) & 1;
  *((_QWORD *)v10 + 3) = v32;
  OUTLINED_FUNCTION_20_3();
  v20 = sub_246187400();
  v22 = v21;
  LOBYTE(v11) = v23;
  v34 = v24;
  v25 = v33;
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BE91A80];
  *(_QWORD *)(v1 + 64) = v25;
  *(_BYTE *)(v1 + 32) = 2;
  *(_BYTE *)(v1 + 72) = 1;
  v18((char *)(v1 + *(int *)(v6 + 24)), *MEMORY[0x24BEAD970], v17);
  *(_QWORD *)v1 = v20;
  *(_QWORD *)(v1 + 8) = v22;
  *(_BYTE *)(v1 + 16) = v11 & 1;
  *(_QWORD *)(v1 + 24) = v34;
  OUTLINED_FUNCTION_19_3();
  sub_24617E88C(v26, v0, (uint64_t (*)(_QWORD))type metadata accessor for RenderableEvent);
  sub_24617E88C((uint64_t)v10, v0 + v4[5], type metadata accessor for CalendarButtonView.Model);
  OUTLINED_FUNCTION_7_4();
  v27 = v0 + v4[7];
  sub_24617D4F8(v27);
  OUTLINED_FUNCTION_23_2(v27, 0);
  *(_BYTE *)(v0 + v28) = 0;
  OUTLINED_FUNCTION_21_1();
  v29 = v0 + v4[11];
  *(_QWORD *)v29 = swift_getKeyPath();
  *(_BYTE *)(v29 + 8) = 0;
  *(_QWORD *)(v29 + 16) = 0x4030000000000000;
  *(_QWORD *)(v29 + 24) = 1;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_2461752BC);
  OUTLINED_FUNCTION_15_2();
  sub_24616046C(v0, (uint64_t (*)(_QWORD))type metadata accessor for SingleEventWithButtonsSnippet);
  OUTLINED_FUNCTION_13_1(v1);
  OUTLINED_FUNCTION_13_1((uint64_t)v10);
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_1_4();
}

unint64_t sub_24618601C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754FAE0;
  if (!qword_25754FAE0)
  {
    v1 = type metadata accessor for SingleEventWithButtonsSnippet();
    result = MEMORY[0x2495523E0](&unk_246188570, v1);
    atomic_store(result, (unint64_t *)&qword_25754FAE0);
  }
  return result;
}

unint64_t sub_24618605C()
{
  unint64_t result;

  result = qword_25754FAE8[0];
  if (!qword_25754FAE8[0])
  {
    result = MEMORY[0x2495523E0](MEMORY[0x24BE91A78], MEMORY[0x24BE91A80]);
    atomic_store(result, qword_25754FAE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v1 + v0[7], 1, 1, v2);
  *(_BYTE *)(v1 + v0[8]) = 1;
  *(_BYTE *)(v1 + v0[9]) = 0;
  return sub_2461877A8();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return type metadata accessor for CalendarButtonView.Model(0);
}

void OUTLINED_FUNCTION_5_6()
{
  sub_246185DE4();
}

uint64_t OUTLINED_FUNCTION_6_7(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = result;
  *(_QWORD *)(v1 + 64) = result;
  *(_BYTE *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 72) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;

  return sub_24617E88C(v3, v2 + *(int *)(v0 + 24), v1);
}

uint64_t OUTLINED_FUNCTION_9_5(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return type metadata accessor for SingleEventWithButtonsSnippet();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_246187400();
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  return sub_24616046C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  return sub_246187574();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_246187574();
}

unint64_t OUTLINED_FUNCTION_16_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  *(_QWORD *)(v1 + 40) = 0;
  return sub_24618601C();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)v1 = result;
  *(_BYTE *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 0x4030000000000000;
  *(_QWORD *)(v1 + 24) = v2;
  return result;
}

void OUTLINED_FUNCTION_19_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + *(int *)(v1 + 28)) = 0;
  *(_QWORD *)(v0 + *(int *)(v1 + 32)) = 0;
}

void OUTLINED_FUNCTION_20_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + *(int *)(v1 + 28)) = 0;
  *(_QWORD *)(v0 + *(int *)(v1 + 32)) = 0;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_2461877A8();
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
  *(_BYTE *)(v3 + *(int *)(v2 + 32)) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_24_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  return sub_24617E88C(*(_QWORD *)(v4 - 88), v3, a3);
}

void OUTLINED_FUNCTION_25_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + *(int *)(v1 + 28)) = 0;
  *(_QWORD *)(v0 + *(int *)(v1 + 32)) = 0;
}

uint64_t sub_246186270()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_246186278()
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

uint64_t sub_24618630C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64) + 7;
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((((v8 + ((v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v11 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v11 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
  }
  else
  {
    v12 = *(_QWORD *)a2;
    v13 = *(_BYTE *)(a2 + 8);
    sub_24615EB54(*(_QWORD *)a2, v13);
    *(_QWORD *)a1 = v12;
    *(_BYTE *)(a1 + 8) = v13;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))((a1 + v7 + 9) & ~v7, (a2 + v7 + 9) & ~v7, v5);
    v14 = (_QWORD *)((v8 + ((a1 + v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFF8);
    v15 = (_QWORD *)((v8 + ((a2 + v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFF8);
    *v14 = *v15;
    v16 = (_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
    v17 = v16[1];
    v18 = (_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v18 = *v16;
    v18[1] = v17;
  }
  swift_retain();
  return a1;
}

uint64_t sub_246186430(uint64_t a1, uint64_t a2)
{
  sub_24615EB8C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 9) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_release();
}

uint64_t sub_2461864A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_24615EB54(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 + 9 + a1) & ~v9;
  v11 = (v9 + 9 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v10, v11);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (_QWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = (_QWORD *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFFFF8);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

uint64_t sub_24618655C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_24615EB54(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_24615EB8C(v8, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v11 + 9 + a1) & ~v11;
  v13 = (v11 + 9 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v12, v13);
  v14 = *(_QWORD *)(v10 + 64) + 7;
  v15 = (_QWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  v17 = (_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24618662C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 + 9 + a1) & ~v5;
  v7 = (v5 + 9 + a2) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  v9 = (_QWORD *)((v8 + v6) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)((v8 + v7) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  *(_OWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2461866C4(uint64_t a1, uint64_t *a2, uint64_t a3)
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
  _QWORD *v15;
  _QWORD *v16;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_24615EB8C(v8, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v11 + 9 + a1) & ~v11;
  v13 = ((unint64_t)a2 + v11 + 9) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v12, v13);
  v14 = *(_QWORD *)(v10 + 64) + 7;
  v15 = (_QWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  *(_OWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_246186778(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;

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
  v9 = *(_QWORD *)(v5 + 64) + 7;
  if (v7 >= a2)
  {
    v14 = (a1 + v8 + 9) & ~v8;
    if (v6 < 0x7FFFFFFF)
    {
      v15 = *(_QWORD *)((((v9 + v14) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(v14, v6, v4);
    }
  }
  else
  {
    if (((((((v9 + ((v8 + 9) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v10 = 2;
    else
      v10 = a2 - v7 + 1;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24618680C + 4 * byte_2461893D0[v12]))();
  }
}

void sub_2461868A0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 9) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
  }
  if (a2 > v6)
  {
    if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 9) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v11 = ~v6 + a2;
      bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 9) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

void sub_2461869A8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  *(_BYTE *)(v6 + v7) = 0;
  if ((_DWORD)a1)
  {
    v8 = (v6 + v5 + 9) & a4;
    if (a2 < 0x7FFFFFFF)
    {
      v9 = (_QWORD *)((((v4 + v8) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
      if ((a1 & 0x80000000) != 0)
      {
        v10 = a1 ^ 0x80000000;
        v9[1] = 0;
      }
      else
      {
        v10 = (a1 - 1);
      }
      *v9 = v10;
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v8, a1, a2, a3);
    }
  }
}

uint64_t type metadata accessor for IdiomConstant(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IdiomConstant);
}

uint64_t sub_246186A50()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_24615EB54(v1, v2);
  sub_246167CB4();
  v4 = v3;
  sub_24615EB8C(v1, v2);
  return v4;
}

uint64_t sub_246186AA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_246186A50();
  v8 = *(int *)(a1 + 32);
  if (result != *(_QWORD *)(v1 + v8))
  {
    v9 = *(void (**)(uint64_t))(v1 + *(int *)(a1 + 36));
    v10 = sub_246186A50();
    v9(v10);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v1 + *(int *)(a1 + 28), v6, v3);
    result = sub_246186A50();
    *(_QWORD *)(v1 + v8) = result;
  }
  return result;
}

uint64_t sub_246186B70()
{
  return sub_24618725C();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249552374](a1, v6, a5);
}

uint64_t initializeBufferWithCopyOfBuffer for CalendarSashView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24615EB54(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for CalendarSashView(uint64_t a1)
{
  return sub_24615EB8C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for CalendarSashView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24615EB54(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_24615EB8C(v5, v6);
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

uint64_t assignWithTake for CalendarSashView(uint64_t a1, uint64_t *a2)
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
  sub_24615EB8C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CalendarSashView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CalendarSashView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for CalendarSashView()
{
  return &type metadata for CalendarSashView;
}

uint64_t sub_246186D3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246186D4C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a2 & 1;
  sub_24615EB54(a1, a2 & 1);
  v6 = sub_246167814();
  sub_24615EB8C(a1, v5);
  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    sub_24618713C();
    sub_24618776C();
    v7 = 0;
  }
  v8 = sub_246187760();
  return __swift_storeEnumTagSinglePayload(a3, v7, 1, v8);
}

uint64_t sub_246186DD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246186D4C(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), a1);
}

unint64_t sub_246186DE8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25754FB70;
  if (!qword_25754FB70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754FB78);
    v2 = sub_246186E4C();
    result = MEMORY[0x2495523E0](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25754FB70);
  }
  return result;
}

unint64_t sub_246186E4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754FB80;
  if (!qword_25754FB80)
  {
    v1 = sub_246187760();
    result = MEMORY[0x2495523E0](MEMORY[0x24BEADD78], v1);
    atomic_store(result, (unint64_t *)&qword_25754FB80);
  }
  return result;
}

uint64_t sub_246186E90()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_246186E9C()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_246186EA8()
{
  return MEMORY[0x24BDCB858]();
}

uint64_t sub_246186EB4()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_246186EC0()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_246186ECC()
{
  return MEMORY[0x24BDCCB18]();
}

uint64_t sub_246186ED8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_246186EE4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_246186EF0()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_246186EFC()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_246186F08()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_246186F14()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_246186F20()
{
  return MEMORY[0x24BDCE148]();
}

uint64_t sub_246186F2C()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_246186F38()
{
  return MEMORY[0x24BDCE1B8]();
}

uint64_t sub_246186F44()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_246186F50()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_246186F5C()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_246186F68()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_246186F74()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_246186F80()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246186F8C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_246186F98()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246186FA4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_246186FB0()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_246186FBC()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_246186FC8()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_246186FD4()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_246186FE0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_246186FEC()
{
  return MEMORY[0x24BDCEE00]();
}

uint64_t sub_246186FF8()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_246187004()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_246187010()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24618701C()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_246187028()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_246187034()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_246187040()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_24618704C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_246187058()
{
  return MEMORY[0x24BEAB538]();
}

uint64_t sub_246187064()
{
  return MEMORY[0x24BE145F0]();
}

uint64_t sub_246187070()
{
  return MEMORY[0x24BE14880]();
}

uint64_t sub_24618707C()
{
  return MEMORY[0x24BE14888]();
}

uint64_t sub_246187088()
{
  return MEMORY[0x24BE14898]();
}

uint64_t sub_246187094()
{
  return MEMORY[0x24BE148A0]();
}

uint64_t sub_2461870A0()
{
  return MEMORY[0x24BE148E8]();
}

uint64_t sub_2461870AC()
{
  return MEMORY[0x24BE148F0]();
}

uint64_t sub_2461870B8()
{
  return MEMORY[0x24BE148F8]();
}

uint64_t sub_2461870C4()
{
  return MEMORY[0x24BE14900]();
}

uint64_t sub_2461870D0()
{
  return MEMORY[0x24BE91A70]();
}

uint64_t sub_2461870DC()
{
  return MEMORY[0x24BE91A90]();
}

uint64_t sub_2461870E8()
{
  return MEMORY[0x24BE91A98]();
}

uint64_t sub_2461870F4()
{
  return MEMORY[0x24BE91AB0]();
}

uint64_t sub_246187100()
{
  return MEMORY[0x24BE91AC0]();
}

uint64_t sub_24618710C()
{
  return MEMORY[0x24BE91AD0]();
}

uint64_t sub_246187118()
{
  return MEMORY[0x24BE91AD8]();
}

uint64_t sub_246187124()
{
  return MEMORY[0x24BE91AE8]();
}

uint64_t sub_246187130()
{
  return MEMORY[0x24BE91AF8]();
}

uint64_t sub_24618713C()
{
  return MEMORY[0x24BE91B08]();
}

uint64_t sub_246187148()
{
  return MEMORY[0x24BE91B10]();
}

uint64_t sub_246187154()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246187160()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24618716C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_246187178()
{
  return MEMORY[0x24BDEB0A8]();
}

uint64_t sub_246187184()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_246187190()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_24618719C()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_2461871A8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2461871B4()
{
  return MEMORY[0x24BDEB7E8]();
}

uint64_t sub_2461871C0()
{
  return MEMORY[0x24BDEB800]();
}

uint64_t sub_2461871CC()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2461871D8()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2461871E4()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2461871F0()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_2461871FC()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_246187208()
{
  return MEMORY[0x24BDECB20]();
}

uint64_t sub_246187214()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_246187220()
{
  return MEMORY[0x24BDECB40]();
}

uint64_t sub_24618722C()
{
  return MEMORY[0x24BDECB48]();
}

uint64_t sub_246187238()
{
  return MEMORY[0x24BDECB68]();
}

uint64_t sub_246187244()
{
  return MEMORY[0x24BDECB98]();
}

uint64_t sub_246187250()
{
  return MEMORY[0x24BDECBA0]();
}

uint64_t sub_24618725C()
{
  return MEMORY[0x24BDECE58]();
}

uint64_t sub_246187268()
{
  return MEMORY[0x24BDECE68]();
}

uint64_t sub_246187274()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_246187280()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_24618728C()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_246187298()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2461872A4()
{
  return MEMORY[0x24BEAD5E0]();
}

uint64_t sub_2461872B0()
{
  return MEMORY[0x24BEAD5E8]();
}

uint64_t sub_2461872BC()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_2461872C8()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_2461872D4()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_2461872E0()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_2461872EC()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_2461872F8()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_246187304()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_246187310()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_24618731C()
{
  return MEMORY[0x24BDEE3C8]();
}

uint64_t sub_246187328()
{
  return MEMORY[0x24BDEE428]();
}

uint64_t sub_246187334()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_246187340()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_24618734C()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_246187358()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_246187364()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_246187370()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_24618737C()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_246187388()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_246187394()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2461873A0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2461873AC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_2461873B8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_2461873C4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2461873D0()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_2461873DC()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2461873E8()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2461873F4()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_246187400()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_24618740C()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_246187418()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_246187424()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_246187430()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_24618743C()
{
  return MEMORY[0x24BDEF038]();
}

uint64_t sub_246187448()
{
  return MEMORY[0x24BDEF048]();
}

uint64_t sub_246187454()
{
  return MEMORY[0x24BDEF0B8]();
}

uint64_t sub_246187460()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_24618746C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_246187478()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_246187484()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_246187490()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_24618749C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2461874A8()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_2461874B4()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2461874C0()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2461874CC()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2461874D8()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2461874E4()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2461874F0()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_2461874FC()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_246187508()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_246187514()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_246187520()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_24618752C()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_246187538()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_246187544()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_246187550()
{
  return MEMORY[0x24BDF1FB8]();
}

uint64_t sub_24618755C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_246187568()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_246187574()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_246187580()
{
  return MEMORY[0x24BEAD6E0]();
}

uint64_t sub_24618758C()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_246187598()
{
  return MEMORY[0x24BEAD750]();
}

uint64_t sub_2461875A4()
{
  return MEMORY[0x24BEAD768]();
}

uint64_t sub_2461875B0()
{
  return MEMORY[0x24BEAD7B0]();
}

uint64_t sub_2461875BC()
{
  return MEMORY[0x24BEAD818]();
}

uint64_t sub_2461875C8()
{
  return MEMORY[0x24BEAD898]();
}

uint64_t sub_2461875D4()
{
  return MEMORY[0x24BE14910]();
}

uint64_t sub_2461875E0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2461875EC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2461875F8()
{
  return MEMORY[0x24BDF2440]();
}

uint64_t sub_246187604()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_246187610()
{
  return MEMORY[0x24BDF2678]();
}

uint64_t sub_24618761C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_246187628()
{
  return MEMORY[0x24BDF2790]();
}

uint64_t sub_246187634()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_246187640()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_24618764C()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_246187658()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_246187664()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_246187670()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_24618767C()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_246187688()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_246187694()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_2461876A0()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2461876AC()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2461876B8()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2461876C4()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2461876D0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2461876DC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2461876E8()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2461876F4()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_246187700()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_24618770C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_246187718()
{
  return MEMORY[0x24BDF5368]();
}

uint64_t sub_246187724()
{
  return MEMORY[0x24BEAD968]();
}

uint64_t sub_246187730()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_24618773C()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_246187748()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_246187754()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_246187760()
{
  return MEMORY[0x24BEADDA0]();
}

uint64_t sub_24618776C()
{
  return MEMORY[0x24BEADDC0]();
}

uint64_t sub_246187778()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_246187784()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_246187790()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_24618779C()
{
  return MEMORY[0x24BEADF40]();
}

uint64_t sub_2461877A8()
{
  return MEMORY[0x24BEADF48]();
}

uint64_t sub_2461877B4()
{
  return MEMORY[0x24BEADF50]();
}

uint64_t sub_2461877C0()
{
  return MEMORY[0x24BEADF98]();
}

uint64_t sub_2461877CC()
{
  return MEMORY[0x24BEADFB0]();
}

uint64_t sub_2461877D8()
{
  return MEMORY[0x24BEADFC0]();
}

uint64_t sub_2461877E4()
{
  return MEMORY[0x24BEAE288]();
}

uint64_t sub_2461877F0()
{
  return MEMORY[0x24BEAE290]();
}

uint64_t sub_2461877FC()
{
  return MEMORY[0x24BEAE298]();
}

uint64_t sub_246187808()
{
  return MEMORY[0x24BEAE2A0]();
}

uint64_t sub_246187814()
{
  return MEMORY[0x24BEAE2A8]();
}

uint64_t sub_246187820()
{
  return MEMORY[0x24BEAE2B0]();
}

uint64_t sub_24618782C()
{
  return MEMORY[0x24BEAE2B8]();
}

uint64_t sub_246187838()
{
  return MEMORY[0x24BEAE338]();
}

uint64_t sub_246187844()
{
  return MEMORY[0x24BEAE348]();
}

uint64_t sub_246187850()
{
  return MEMORY[0x24BEAE350]();
}

uint64_t sub_24618785C()
{
  return MEMORY[0x24BEAE358]();
}

uint64_t sub_246187868()
{
  return MEMORY[0x24BEAE380]();
}

uint64_t sub_246187874()
{
  return MEMORY[0x24BEAE3E0]();
}

uint64_t sub_246187880()
{
  return MEMORY[0x24BEAE3E8]();
}

uint64_t sub_24618788C()
{
  return MEMORY[0x24BEAE480]();
}

uint64_t sub_246187898()
{
  return MEMORY[0x24BEAE498]();
}

uint64_t sub_2461878A4()
{
  return MEMORY[0x24BEAE4D0]();
}

uint64_t sub_2461878B0()
{
  return MEMORY[0x24BEAE4D8]();
}

uint64_t sub_2461878BC()
{
  return MEMORY[0x24BEAE4F8]();
}

uint64_t sub_2461878C8()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_2461878D4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2461878E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2461878EC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2461878F8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_246187904()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_246187910()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24618791C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_246187928()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_246187934()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_246187940()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24618794C()
{
  return MEMORY[0x24BE91B18]();
}

uint64_t sub_246187958()
{
  return MEMORY[0x24BE91B20]();
}

uint64_t sub_246187964()
{
  return MEMORY[0x24BEAE638]();
}

uint64_t sub_246187970()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24618797C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246187988()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246187994()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2461879A0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2461879AC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2461879B8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2461879C4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2461879D0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2461879DC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2461879E8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2461879F4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246187A00()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246187A0C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246187A18()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246187A24()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246187A30()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t CUIKStringForRecurrenceRule()
{
  return MEMORY[0x24BE147E0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

