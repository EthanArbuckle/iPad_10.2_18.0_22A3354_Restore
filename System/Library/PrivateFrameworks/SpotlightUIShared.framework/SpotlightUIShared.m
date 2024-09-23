uint64_t sub_2217D6B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_2217DF02C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF038();
  __swift_allocate_value_buffer(v4, qword_25570ADC8);
  __swift_project_value_buffer(v4, (uint64_t)qword_25570ADC8);
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v5 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  sub_2217DF050();
  return sub_2217DF044();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2217D6D40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v12 = sub_2217DF02C();
  v2 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_2217DF038();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v7 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v12);
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, 1, 1, v5);
  v8 = v14;
  sub_2217DEEF4();
  v9 = sub_2217DEEE8();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227672234]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2217D6FC0()
{
  unint64_t result;

  result = qword_255709668;
  if (!qword_255709668)
  {
    result = MEMORY[0x22767224C](&unk_2217DF9C0, &type metadata for SearchSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709668);
  }
  return result;
}

uint64_t sub_2217D7004()
{
  return sub_2217DEDC8();
}

uint64_t sub_2217D7024@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2217DEDC8();
  *a1 = result;
  return result;
}

uint64_t sub_2217D704C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255709750);
  v0 = sub_2217DEF00();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2217DF900;
  result = (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v1 + 104))(v3 + v2, *MEMORY[0x24BDB5890], v0);
  qword_25570ADE8 = v3;
  return result;
}

uint64_t sub_2217D70E0()
{
  return sub_2217DEDB0();
}

uint64_t sub_2217D7100(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2217DEF3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_2217DEDBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t sub_2217D7198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  v5 = sub_2217DEF3C();
  v4[9] = v5;
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  sub_2217DF0E0();
  v4[12] = sub_2217DF0D4();
  v4[13] = sub_2217DF0C8();
  v4[14] = v6;
  return swift_task_switch();
}

uint64_t sub_2217D7230()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t (*v9)(id, _QWORD, _QWORD);

  sub_2217DECB4();
  v1 = objc_msgSend(*(id *)(v0 + 16), sel_spotlightIsVisible);
  swift_unknownObjectRelease();
  if (v1)
  {
    sub_2217DECB4();
    objc_msgSend(*(id *)(v0 + 32), sel_presentSpotlight);
    swift_unknownObjectRelease();
  }
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE85038]), sel_init);
  *(_QWORD *)(v0 + 120) = v5;
  sub_2217DEDB0();
  sub_2217DEF30();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = (void *)sub_2217DF098();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setSearchString_, v6);

  sub_2217DECB4();
  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 24);
  v9 = (uint64_t (*)(id, _QWORD, _QWORD))((int)*MEMORY[0x24BE85200] + MEMORY[0x24BE85200]);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v7;
  *v7 = v0;
  v7[1] = sub_2217D73A4;
  return v9(v5, 0, 0);
}

uint64_t sub_2217D73A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_2217D7410()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();
  sub_2217DED74();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217D7468()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217D74C0@<X0>(_QWORD *a1@<X8>)
{
  if (qword_255709B48 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = qword_25570ADE8;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2217D7534()
{
  return sub_2217DEDB0();
}

uint64_t sub_2217D7554(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2217DEF3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_2217DEDBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_2217D75EC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2217DEDA4();
  return sub_2217D7634;
}

void sub_2217D7638(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_2217D7668@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255709B40 != -1)
    swift_once();
  v2 = sub_2217DF038();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25570ADC8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2217D7700()
{
  swift_beginAccess();
  return byte_25570ADE0;
}

uint64_t sub_2217D7748()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709658);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709660);
  MEMORY[0x24BDAC7A8]();
  sub_2217DEFC0();
  sub_2217DEFB4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255709670);
  sub_2217DEFA8();
  swift_release();
  sub_2217DEFB4();
  sub_2217DEFD8();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  return sub_2217DEF9C();
}

uint64_t sub_2217D78B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *v1;
  v5 = v1[1];
  v6 = v1[2];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2217D7924;
  return sub_2217D7198(a1, v4, v5, v6);
}

uint64_t sub_2217D7924()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2217D796C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_2217D79BC();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_2217D7994()
{
  sub_2217D6FC0();
  return sub_2217DED44();
}

uint64_t sub_2217D79BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v0 = sub_2217DEFE4();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709680);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_2217DF02C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v20 = sub_2217DF038();
  v19 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8]();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709688);
  sub_2217DF080();
  v9 = sub_2217D9CF0();
  swift_beginAccess();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, v9, v5);
  sub_2217DF050();
  sub_2217DF044();
  sub_2217DF080();
  sub_2217D9D38();
  swift_beginAccess();
  v10(v8, v9, v5);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v4, 0, 1, v20);
  v11 = sub_2217DED68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v22, 1, 1, v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x24BDB6090], v25);
  v12 = sub_2217DEDE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709690);
  sub_2217DECF0();
  sub_2217DECE4();
  sub_2217DECCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557096F8);
  v13 = objc_msgSend((id)objc_opt_self(), sel_presentationHelperKey);
  v14 = sub_2217DF0A4();
  v16 = v15;

  v26 = v14;
  v27 = v16;
  sub_2217DF11C();
  sub_2217DECE4();
  sub_2217DECC0();
  return v12;
}

unint64_t sub_2217D7DD0()
{
  unint64_t result;

  result = qword_255709708;
  if (!qword_255709708)
  {
    result = MEMORY[0x22767224C](&unk_2217DF998, &type metadata for SearchSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709708);
  }
  return result;
}

unint64_t sub_2217D7E18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255709710;
  if (!qword_255709710)
  {
    v1 = sub_2217DEF3C();
    result = MEMORY[0x22767224C](MEMORY[0x24BDB5CE8], v1);
    atomic_store(result, (unint64_t *)&qword_255709710);
  }
  return result;
}

unint64_t sub_2217D7E68()
{
  unint64_t result;

  result = qword_255709718;
  if (!qword_255709718)
  {
    result = MEMORY[0x22767224C](&unk_2217DFA50, &type metadata for SearchSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709718);
  }
  return result;
}

unint64_t sub_2217D7EB0()
{
  unint64_t result;

  result = qword_255709720;
  if (!qword_255709720)
  {
    result = MEMORY[0x22767224C](&unk_2217DFA78, &type metadata for SearchSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709720);
  }
  return result;
}

uint64_t sub_2217D7EF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2217D7F04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SearchSpotlightIntent()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s17SpotlightUIShared21SearchSpotlightIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_2217DEDEC();
  sub_2217DEDEC();
  sub_2217DEDEC();
  return a1;
}

_QWORD *assignWithCopy for SearchSpotlightIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_2217DEDEC();
  swift_release();
  a1[1] = a2[1];
  sub_2217DEDEC();
  swift_release();
  a1[2] = a2[2];
  sub_2217DEDEC();
  swift_release();
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

uint64_t assignWithTake for SearchSpotlightIntent(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchSpotlightIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchSpotlightIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchSpotlightIntent()
{
  return &type metadata for SearchSpotlightIntent;
}

uint64_t sub_2217D8100()
{
  return sub_2217D819C(&qword_255709730, &qword_255709738, MEMORY[0x24BDB5F68]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227672240](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2217D8170()
{
  return sub_2217D819C((unint64_t *)&unk_255709740, &qword_255709AB0, MEMORY[0x24BDB5E58]);
}

uint64_t sub_2217D819C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22767224C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2217D821C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254124FE8);
  return sub_2217DF0B0();
}

uint64_t sub_2217D8258()
{
  id v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709820);
  v0 = objc_msgSend((id)objc_opt_self(), sel_queryHelperKey);
  sub_2217DF0A4();

  sub_2217DF11C();
  sub_2217DECF0();
  sub_2217DECE4();
  result = sub_2217DECC0();
  qword_25570ADF0 = result;
  return result;
}

uint64_t sub_2217D830C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;
  char *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v10 = sub_2217DF02C();
  v1 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF038();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = sub_2217DF014();
  __swift_allocate_value_buffer(v6, qword_25570ADF8);
  v9[1] = __swift_project_value_buffer(v6, (uint64_t)qword_25570ADF8);
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v7 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v10);
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v4);
  return sub_2217DF008();
}

uint64_t sub_2217D8544(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_2217D8560()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_2217DECB4();
  v1 = (_QWORD *)v0[2];
  v0[5] = v1;
  v0[6] = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58);
  sub_2217DF0E0();
  v0[7] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217D85F8()
{
  _QWORD *v0;
  uint64_t (*v1)(uint64_t);
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (uint64_t (*)(uint64_t))v0[6];
  v2 = (void *)v0[5];
  v3 = swift_release();
  v4 = v1(v3);
  v6 = v5;

  v0[8] = v4;
  v0[9] = v6;
  return swift_task_switch();
}

uint64_t sub_2217D8654()
{
  uint64_t v0;
  uint64_t *v1;

  v1 = *(uint64_t **)(v0 + 24);
  *v1 = sub_2217D8C14(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217D8690(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  sub_2217D9088();
  *v2 = v1;
  v2[1] = sub_2217D86F8;
  return sub_2217DEF0C();
}

uint64_t sub_2217D86F8(uint64_t a1)
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
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2217D8758@<X0>(uint64_t *a1@<X8>)
{
  id v2;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709820);
  v2 = objc_msgSend((id)objc_opt_self(), sel_queryHelperKey);
  sub_2217DF0A4();

  sub_2217DF11C();
  sub_2217DECF0();
  sub_2217DECE4();
  result = sub_2217DECC0();
  *a1 = result;
  return result;
}

uint64_t sub_2217D8814()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2217D9088();
  *v1 = v0;
  v1[1] = sub_2217D8880;
  return sub_2217DEF24();
}

uint64_t sub_2217D8880(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_2217D88D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  sub_2217D9088();
  *v2 = v1;
  v2[1] = sub_2217D934C;
  return sub_2217DEF18();
}

uint64_t sub_2217D893C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2217D8E70();
  *v1 = v0;
  v1[1] = sub_2217D7924;
  return sub_2217DED5C();
}

uint64_t sub_2217D89A8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2217D7924;
  return sub_2217DEF84();
}

uint64_t sub_2217D8A1C@<X0>(_QWORD *a1@<X8>)
{
  if (qword_255709DE0 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = qword_25570ADF0;
  return sub_2217DEDEC();
}

uint64_t sub_2217D8A90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254124FE8);
  result = sub_2217DF0B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2217D8AD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255709DE8 != -1)
    swift_once();
  v2 = sub_2217DF014();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25570ADF8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2217D8B6C()
{
  sub_2217D8F48();
  return sub_2217DED14();
}

void sub_2217D8BA4()
{
  sub_2217D8E28();
  JUMPOUT(0x227671A18);
}

uint64_t sub_2217D8BDC()
{
  sub_2217D9244();
  return sub_2217DF020();
}

uint64_t sub_2217D8C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];

  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF02C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  sub_2217DF038();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709828);
  sub_2217DF080();
  v10 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
  sub_2217DF050();
  sub_2217DF044();
  v11 = MEMORY[0x227671A30](v9);
  v13[0] = a1;
  v13[1] = a2;
  sub_2217DEDEC();
  sub_2217DED8C();
  swift_release();
  return v11;
}

unint64_t sub_2217D8DE0()
{
  unint64_t result;

  result = qword_255709830;
  if (!qword_255709830)
  {
    result = MEMORY[0x22767224C](&unk_2217DFB20, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, (unint64_t *)&qword_255709830);
  }
  return result;
}

unint64_t sub_2217D8E28()
{
  unint64_t result;

  result = qword_255709838;
  if (!qword_255709838)
  {
    result = MEMORY[0x22767224C](&unk_2217DFC54, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_255709838);
  }
  return result;
}

unint64_t sub_2217D8E70()
{
  unint64_t result;

  result = qword_255709848;
  if (!qword_255709848)
  {
    result = MEMORY[0x22767224C](&unk_2217DFB58, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, (unint64_t *)&qword_255709848);
  }
  return result;
}

unint64_t sub_2217D8EB8()
{
  unint64_t result;

  result = qword_255709858;
  if (!qword_255709858)
  {
    result = MEMORY[0x22767224C](&unk_2217DFBB0, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, (unint64_t *)&qword_255709858);
  }
  return result;
}

unint64_t sub_2217D8F00()
{
  unint64_t result;

  result = qword_255709860[0];
  if (!qword_255709860[0])
  {
    result = MEMORY[0x22767224C](&unk_2217DFC10, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, qword_255709860);
  }
  return result;
}

unint64_t sub_2217D8F48()
{
  unint64_t result;

  result = qword_254125010;
  if (!qword_254125010)
  {
    result = MEMORY[0x22767224C](&unk_2217DFC84, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125010);
  }
  return result;
}

unint64_t sub_2217D8F90()
{
  unint64_t result;

  result = qword_255709878;
  if (!qword_255709878)
  {
    result = MEMORY[0x22767224C](&unk_2217DFC38, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, (unint64_t *)&qword_255709878);
  }
  return result;
}

unint64_t sub_2217D8FD8()
{
  unint64_t result;

  result = qword_254125018;
  if (!qword_254125018)
  {
    result = MEMORY[0x22767224C](&unk_2217DFDCC, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125018);
  }
  return result;
}

unint64_t sub_2217D9020()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255709880;
  if (!qword_255709880)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_255709888);
    v2 = sub_2217D8FD8();
    result = MEMORY[0x22767224C](MEMORY[0x24BDB6638], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255709880);
  }
  return result;
}

unint64_t sub_2217D9088()
{
  unint64_t result;

  result = qword_2557098A0;
  if (!qword_2557098A0)
  {
    result = MEMORY[0x22767224C](&unk_2217DFAE0, &type metadata for SearchFieldEntity.Query);
    atomic_store(result, (unint64_t *)&qword_2557098A0);
  }
  return result;
}

unint64_t sub_2217D90D0()
{
  unint64_t result;

  result = qword_254125008;
  if (!qword_254125008)
  {
    result = MEMORY[0x22767224C](&unk_2217DFCDC, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125008);
  }
  return result;
}

unint64_t sub_2217D9118()
{
  unint64_t result;

  result = qword_254125020;
  if (!qword_254125020)
  {
    result = MEMORY[0x22767224C](&unk_2217DFD14, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125020);
  }
  return result;
}

unint64_t sub_2217D9160()
{
  unint64_t result;

  result = qword_254125048;
  if (!qword_254125048)
  {
    result = MEMORY[0x22767224C](&unk_2217DFD44, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125048);
  }
  return result;
}

uint64_t sub_2217D91A4()
{
  return MEMORY[0x24BDB6618];
}

unint64_t sub_2217D91B4()
{
  unint64_t result;

  result = qword_254125028;
  if (!qword_254125028)
  {
    result = MEMORY[0x22767224C](&unk_2217DFD7C, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125028);
  }
  return result;
}

unint64_t sub_2217D91FC()
{
  unint64_t result;

  result = qword_254125030;
  if (!qword_254125030)
  {
    result = MEMORY[0x22767224C](&unk_2217DFDA4, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125030);
  }
  return result;
}

unint64_t sub_2217D9244()
{
  unint64_t result;

  result = qword_254125038;
  if (!qword_254125038)
  {
    result = MEMORY[0x22767224C](&unk_2217DFE24, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125038);
  }
  return result;
}

uint64_t sub_2217D9288()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_2217D9298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557098A8;
  if (!qword_2557098A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557098B0);
    result = MEMORY[0x22767224C](MEMORY[0x24BDB6250], v1);
    atomic_store(result, (unint64_t *)&qword_2557098A8);
  }
  return result;
}

unint64_t sub_2217D92E8()
{
  unint64_t result;

  result = qword_254125040;
  if (!qword_254125040)
  {
    result = MEMORY[0x22767224C](&unk_2217DFE54, &type metadata for SearchFieldEntity);
    atomic_store(result, (unint64_t *)&qword_254125040);
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchFieldEntity()
{
  return &type metadata for SearchFieldEntity;
}

ValueMetadata *type metadata accessor for SearchFieldEntity.Query()
{
  return &type metadata for SearchFieldEntity.Query;
}

uint64_t sub_2217D9350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_2217DF02C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF038();
  __swift_allocate_value_buffer(v4, qword_25570AE10);
  __swift_project_value_buffer(v4, (uint64_t)qword_25570AE10);
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v5 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  sub_2217DF050();
  return sub_2217DF044();
}

uint64_t sub_2217D94E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v12 = sub_2217DF02C();
  v2 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_2217DF038();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v7 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v12);
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, 1, 1, v5);
  v8 = v14;
  sub_2217DEEF4();
  v9 = sub_2217DEEE8();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

unint64_t sub_2217D9728()
{
  unint64_t result;

  result = qword_2557098C0;
  if (!qword_2557098C0)
  {
    result = MEMORY[0x22767224C](&unk_2217DFEA0, &type metadata for ClearSpotlightIntent);
    atomic_store(result, &qword_2557098C0);
  }
  return result;
}

uint64_t sub_2217D976C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_2217D9784()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;
  uint64_t (*v4)(id, _QWORD, _QWORD);

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE85038]), sel_init);
  v0[5] = v1;
  objc_msgSend(v1, sel_setSearchString_, 0);
  sub_2217DECB4();
  v0[6] = v0[2];
  v4 = (uint64_t (*)(id, _QWORD, _QWORD))((int)*MEMORY[0x24BE85200] + MEMORY[0x24BE85200]);
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_2217D9838;
  return v4(v1, 0, 0);
}

uint64_t sub_2217D9838()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_2217D98A4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);
  sub_2217DED74();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217D98E0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217D9918()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709690);
  sub_2217DECF0();
  sub_2217DECE4();
  return sub_2217DECCC();
}

unint64_t sub_2217D995C()
{
  unint64_t result;

  result = qword_2557098D0;
  if (!qword_2557098D0)
  {
    result = MEMORY[0x22767224C](&unk_2217DFF30, &type metadata for ClearSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_2557098D0);
  }
  return result;
}

unint64_t sub_2217D99A4()
{
  unint64_t result;

  result = qword_2557098D8;
  if (!qword_2557098D8)
  {
    result = MEMORY[0x22767224C](&unk_2217DFF58, &type metadata for ClearSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_2557098D8);
  }
  return result;
}

uint64_t sub_2217D99E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2217D99F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2217D9A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25570A170 != -1)
    swift_once();
  v2 = sub_2217DF038();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25570AE10);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2217D9AA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557098B8);
  MEMORY[0x24BDAC7A8]();
  sub_2217DEFCC();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  return sub_2217DEF9C();
}

uint64_t sub_2217D9B6C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2217D7924;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_2217D9BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709690);
  sub_2217DECF0();
  sub_2217DECE4();
  result = sub_2217DECCC();
  *a1 = result;
  return result;
}

uint64_t sub_2217D9C20()
{
  sub_2217D9728();
  return sub_2217DED44();
}

ValueMetadata *type metadata accessor for ClearSpotlightIntent()
{
  return &type metadata for ClearSpotlightIntent;
}

uint64_t sub_2217D9C58()
{
  return sub_2217D819C(&qword_2557098E8, &qword_2557098F0, MEMORY[0x24BDB5F68]);
}

uint64_t sub_2217D9C84()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = sub_2217DF02C();
  __swift_allocate_value_buffer(v0, qword_25570AE28);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_25570AE28);
  *v1 = sub_2217DA094();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDCD338], v0);
}

uint64_t sub_2217D9CF0()
{
  uint64_t v0;

  if (qword_25570A300 != -1)
    swift_once();
  v0 = sub_2217DF02C();
  return __swift_project_value_buffer(v0, (uint64_t)qword_25570AE28);
}

const char *sub_2217D9D38()
{
  return "AppIntents";
}

uint64_t sub_2217D9D44()
{
  return 1;
}

uint64_t sub_2217D9D4C()
{
  sub_2217DF17C();
  sub_2217DF188();
  return sub_2217DF194();
}

uint64_t sub_2217D9D8C()
{
  return sub_2217DF188();
}

uint64_t sub_2217D9DB0()
{
  sub_2217DF17C();
  sub_2217DF188();
  return sub_2217DF194();
}

unint64_t sub_2217D9DF0()
{
  unint64_t result;

  result = qword_2557098F8;
  if (!qword_2557098F8)
  {
    result = MEMORY[0x22767224C](&unk_2217DFFC0, &type metadata for SUIAppIntentError);
    atomic_store(result, (unint64_t *)&qword_2557098F8);
  }
  return result;
}

uint64_t sub_2217D9E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_2217DF02C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  sub_2217DF080();
  sub_2217DF050();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD328], v0);
  return sub_2217DF044();
}

ValueMetadata *type metadata accessor for LocalizedStringResourceTable()
{
  return &type metadata for LocalizedStringResourceTable;
}

uint64_t getEnumTagSinglePayload for SUIAppIntentError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SUIAppIntentError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2217DA02C + 4 * asc_2217DFFA0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2217DA04C + 4 * byte_2217DFFA5[v4]))();
}

_BYTE *sub_2217DA02C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2217DA04C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2217DA054(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2217DA05C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2217DA064(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2217DA06C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2217DA078()
{
  return 0;
}

ValueMetadata *type metadata accessor for SUIAppIntentError()
{
  return &type metadata for SUIAppIntentError;
}

unint64_t sub_2217DA094()
{
  unint64_t result;

  result = qword_255709900;
  if (!qword_255709900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255709900);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpotlightUISharedPackage()
{
  return &type metadata for SpotlightUISharedPackage;
}

uint64_t sub_2217DA0E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2217DA138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

id AppIntentsQueryHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AppIntentsQueryHelper.init()()
{
  char *v0;
  char *v1;
  objc_super v3;

  v1 = &v0[OBJC_IVAR___SUIAppIntentsQueryHelper_searchString];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0xE000000000000000;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for AppIntentsQueryHelper()
{
  return objc_opt_self();
}

uint64_t sub_2217DA268(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  sub_2217DF0E0();
  v3[8] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217DA2D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  swift_release();
  v4 = (_QWORD *)(v1 + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217DA480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v3[8] = sub_2217DF0E0();
  v3[9] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217DA4F4()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = (const void *)v0[6];
  v2 = (void *)v0[7];
  swift_release();
  v0[10] = _Block_copy(v1);
  v0[11] = sub_2217DF0A4();
  v0[12] = v3;
  v4 = v2;
  v0[13] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217DA584()
{
  uint64_t v0;
  uint64_t v1;
  void (**v2)(_QWORD);
  uint64_t v3;
  char *v4;
  char *v5;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void (***)(_QWORD))(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(char **)(v0 + 56);
  swift_release();
  v5 = &v4[OBJC_IVAR___SUIAppIntentsQueryHelper_searchString];
  swift_beginAccess();
  *(_QWORD *)v5 = v3;
  *((_QWORD *)v5 + 1) = v1;
  swift_bridgeObjectRelease();

  v2[2](v2);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id AppIntentsQueryHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AppIntentsQueryHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppIntentsQueryHelper.update(with:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x70);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2217D7924;
  return v9(a1, a2);
}

uint64_t sub_2217DA6E4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2217DA718()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2217DAC24;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_255709920 + dword_255709920))(v2, v3, v4);
}

uint64_t sub_2217DA784(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2217DAC24;
  return v6();
}

uint64_t sub_2217DA7DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2217DAC24;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255709930 + dword_255709930))(v2, v3, v4);
}

uint64_t sub_2217DA854(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2217DAC24;
  return v7();
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2217DA8D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2217DAC24;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255709940 + dword_255709940))(a1, v4, v5, v6);
}

uint64_t sub_2217DA95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2217DF0F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2217DF0EC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2217DAAA0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2217DF0C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2217DAAA0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254124FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2217DAAE0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2217DAB44;
  return v6(a1);
}

uint64_t sub_2217DAB44()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2217DAB90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2217DABB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2217D7924;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255709950 + dword_255709950))(a1, v4);
}

uint64_t sub_2217DAC28()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  unsigned int v17;
  void (*v18)(char *);
  uint64_t v19;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557099B8);
  v0 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2217DEDF8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557099C0);
  MEMORY[0x24BDAC7A8]();
  sub_2217DBB88();
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  v17 = *MEMORY[0x24BDB56D0];
  v18 = *(void (**)(char *))(v4 + 104);
  v18(v6);
  sub_2217DEE7C();
  v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v6, v3);
  sub_2217DEE94();
  sub_2217DEEAC();
  v19 = sub_2217DEE10();
  v7 = *(void (**)(char *, uint64_t))(v0 + 8);
  v8 = v15;
  v7(v2, v15);
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  sub_2217DEEAC();
  v14 = sub_2217DEE10();
  v7(v2, v8);
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  ((void (*)(char *, _QWORD, uint64_t))v18)(v6, v17, v3);
  sub_2217DEE7C();
  v16(v6, v3);
  sub_2217DEE94();
  sub_2217DEEAC();
  v9 = sub_2217DEE10();
  v7(v2, v8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557099C8);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2217E0150;
  v11 = v14;
  *(_QWORD *)(v10 + 32) = v19;
  *(_QWORD *)(v10 + 40) = v11;
  *(_QWORD *)(v10 + 48) = v9;
  v12 = sub_2217DEE04();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2217DAFD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2217DD0D4();
  *a1 = result;
  return result;
}

uint64_t sub_2217DB000()
{
  return sub_2217DD104();
}

uint64_t sub_2217DB010(uint64_t a1)
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
  void (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  void (*v19)(char *, uint64_t);
  unsigned int v20;
  void (*v21)(char *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v26 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557099A0);
  v22 = *(_QWORD *)(v1 - 8);
  v23 = v1;
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2217DEDF8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557099A8);
  MEMORY[0x24BDAC7A8]();
  sub_2217D6FC0();
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  v25 = sub_2217DBBCC();
  sub_2217DEDEC();
  swift_release();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  v20 = *MEMORY[0x24BDB56D0];
  v21 = *(void (**)(char *))(v5 + 104);
  v21(v7);
  sub_2217DEE7C();
  v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v7, v4);
  sub_2217DEE94();
  sub_2217DEEAC();
  v24 = sub_2217DEE10();
  v8 = v23;
  v18 = *(void (**)(char *, uint64_t))(v22 + 8);
  v18(v3, v23);
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  sub_2217DEDEC();
  swift_release();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  ((void (*)(char *, _QWORD, uint64_t))v21)(v7, v20, v4);
  sub_2217DEE7C();
  v19(v7, v4);
  sub_2217DEE94();
  sub_2217DEEAC();
  v22 = sub_2217DEE10();
  v9 = v8;
  v10 = v8;
  v11 = v18;
  v18(v3, v10);
  sub_2217DEEA0();
  sub_2217DEE94();
  swift_getKeyPath();
  sub_2217DEDEC();
  swift_release();
  sub_2217DEE88();
  swift_release();
  sub_2217DEE94();
  sub_2217DEEAC();
  v12 = sub_2217DEE10();
  v11(v3, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557099B0);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2217E0150;
  v14 = v22;
  *(_QWORD *)(v13 + 32) = v24;
  *(_QWORD *)(v13 + 40) = v14;
  *(_QWORD *)(v13 + 48) = v12;
  v15 = sub_2217DEE04();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2217DB470()
{
  return sub_2217D70E0();
}

uint64_t sub_2217DB480(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  sub_2217DEF3C();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return sub_2217D7100((uint64_t)v3);
}

uint64_t sub_2217DB504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_2217DEE64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_2217DBBCC();
  sub_2217DEDEC();
  swift_release();
  sub_2217D6FC0();
  sub_2217DEE58();
  v4 = sub_2217DEE4C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709990);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2217DF900;
  *(_QWORD *)(v5 + 32) = v4;
  v6 = sub_2217DEE40();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2217DB614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_2217DEE28();
  v1 = sub_2217DEE28();
  v2 = sub_2217DEE28();
  v3 = sub_2217DEE28();
  v4 = sub_2217DEE28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709998);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2217E0160;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  *(_QWORD *)(v5 + 64) = v4;
  v6 = sub_2217DEE1C();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2217DB724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709970);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2217DEDF8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709978);
  MEMORY[0x24BDAC7A8]();
  sub_2217D9728();
  sub_2217DEEA0();
  sub_2217DEE94();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDB56D0], v4);
  sub_2217DEE7C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2217DEE94();
  sub_2217DEEAC();
  v8 = sub_2217DEE10();
  v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  sub_2217DEE70();
  v10 = sub_2217DEE10();
  v9(v3, v0);
  sub_2217DEE70();
  v11 = sub_2217DEE10();
  v9(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709980);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2217E0150;
  *(_QWORD *)(v12 + 32) = v8;
  *(_QWORD *)(v12 + 40) = v10;
  *(_QWORD *)(v12 + 48) = v11;
  v13 = sub_2217DEE04();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_2217DB9BC()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2217DB9C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v0 = sub_2217DEED0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2217DD278(v2);
  v17 = v5;
  sub_2217DBB88();
  sub_2217DEEDC();
  v6 = sub_2217DEEC4();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  v16 = sub_2217D74BC();
  v17 = v8;
  v18 = v9;
  sub_2217D6FC0();
  sub_2217DEEDC();
  v10 = sub_2217DEEC4();
  v7(v4, v0);
  v16 = sub_2217D9918();
  sub_2217D9728();
  sub_2217DEEDC();
  v11 = sub_2217DEEC4();
  v7(v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709968);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2217E0150;
  *(_QWORD *)(v12 + 32) = v6;
  *(_QWORD *)(v12 + 40) = v10;
  *(_QWORD *)(v12 + 48) = v11;
  v13 = sub_2217DEEB8();
  swift_bridgeObjectRelease();
  return v13;
}

ValueMetadata *type metadata accessor for SpotlightUIAssistantIntents()
{
  return &type metadata for SpotlightUIAssistantIntents;
}

unint64_t sub_2217DBB88()
{
  unint64_t result;

  result = qword_255709960;
  if (!qword_255709960)
  {
    result = MEMORY[0x22767224C](&unk_2217E0510, &type metadata for ToggleSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709960);
  }
  return result;
}

unint64_t sub_2217DBBCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255709988;
  if (!qword_255709988)
  {
    v1 = sub_2217DEF3C();
    result = MEMORY[0x22767224C](MEMORY[0x24BDB5CF0], v1);
    atomic_store(result, (unint64_t *)&qword_255709988);
  }
  return result;
}

uint64_t sub_2217DBC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  uint64_t v10;
  char *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v10 = sub_2217DF02C();
  v1 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF038();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = sub_2217DF014();
  __swift_allocate_value_buffer(v6, qword_25570AE40);
  v9[1] = __swift_project_value_buffer(v6, (uint64_t)qword_25570AE40);
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v7 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v10);
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v11, 1, 1, v4);
  return sub_2217DF008();
}

unint64_t sub_2217DBE50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  unint64_t result;
  _QWORD v32[2];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  const char *v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255709AB8);
  MEMORY[0x24BDAC7A8]();
  v54 = (char *)v32 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v53 = (char *)v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_2217DF02C();
  v4 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v46 = sub_2217DF038();
  v47 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709AC0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709AC8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = v9;
  v51 = v9;
  v38 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v39 = 2 * v38;
  v13 = swift_allocObject();
  v40 = v13;
  *(_OWORD *)(v13 + 16) = xmmword_2217E0150;
  v49 = v13 + v12;
  v37 = v13 + v12 + *(int *)(v11 + 48);
  *(_BYTE *)(v13 + v12) = 0;
  sub_2217DF080();
  v14 = sub_2217D9D38();
  swift_bridgeObjectRetain();
  v15 = sub_2217D9CF0();
  v42 = v15;
  swift_beginAccess();
  v55 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v16 = v43;
  v55(v6, v15, v43);
  v41 = v3;
  sub_2217DF050();
  v17 = v6;
  sub_2217DF044();
  v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56);
  v18 = v53;
  v19 = v46;
  v50(v53, 1, 1, v46);
  v45 = sub_2217DEF48();
  v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56);
  v20 = v54;
  v48(v54, 1, 1, v45);
  v44 = v8;
  sub_2217DEF60();
  v21 = (_BYTE *)(v49 + v38);
  v38 += v49 + *(int *)(v51 + 48);
  *v21 = 1;
  sub_2217DF080();
  v52 = v14;
  v22 = v42;
  swift_beginAccess();
  v55(v17, v22, v16);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  v50(v18, 1, 1, v19);
  v48(v20, 1, 1, v45);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709AD0);
  v23 = *(_QWORD *)(v47 + 72);
  v24 = *(unsigned __int8 *)(v47 + 80);
  v47 = ((v24 + 32) & ~v24) + 2 * v23;
  v34 = (v24 + 32) & ~v24;
  v35 = v23;
  v36 = v24 | 7;
  v25 = swift_allocObject();
  v33 = xmmword_2217E0230;
  v32[1] = v25;
  *(_OWORD *)(v25 + 16) = xmmword_2217E0230;
  sub_2217DF080();
  v26 = v42;
  swift_beginAccess();
  v27 = v55;
  v55(v17, v26, v16);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  sub_2217DF080();
  swift_beginAccess();
  v27(v17, v26, v16);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  v28 = v53;
  v29 = v54;
  sub_2217DEF54();
  v51 = v49 + v39 + *(int *)(v51 + 48);
  *(_BYTE *)(v49 + v39) = 2;
  sub_2217DF080();
  swift_beginAccess();
  v55(v17, v26, v16);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  v50(v28, 1, 1, v46);
  v48(v29, 1, 1, v45);
  *(_OWORD *)(swift_allocObject() + 16) = v33;
  sub_2217DF080();
  swift_beginAccess();
  v30 = v55;
  v55(v17, v26, v16);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  sub_2217DF080();
  swift_beginAccess();
  v30(v17, v26, v43);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  sub_2217DF044();
  sub_2217DEF54();
  result = sub_2217DC74C(v40);
  qword_25570AE58 = result;
  return result;
}

unint64_t sub_2217DC74C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709AC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709AD8);
  v6 = sub_2217DF128();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  sub_2217DEDEC();
  while (1)
  {
    sub_2217DE3F8(v12, (uint64_t)v5);
    v14 = *v5;
    result = sub_2217DD550(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_2217DEF6C();
    result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
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

uint64_t sub_2217DC8DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2217DC8E8(*a1, *a2);
}

uint64_t sub_2217DC8E8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 1852141679;
    else
      v3 = 0x65736F6C63;
    if (v2 == 1)
      v4 = 0xE400000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 1852141679;
      else
        v6 = 0x65736F6C63;
      if (v5 == 1)
        v7 = 0xE400000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x656C67676F74;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x656C67676F74)
  {
LABEL_21:
    v8 = sub_2217DF140();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2217DC9E0()
{
  sub_2217DF17C();
  sub_2217DF0BC();
  swift_bridgeObjectRelease();
  return sub_2217DF194();
}

uint64_t sub_2217DCA70()
{
  sub_2217DF0BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2217DCADC()
{
  sub_2217DF17C();
  sub_2217DF0BC();
  swift_bridgeObjectRelease();
  return sub_2217DF194();
}

uint64_t sub_2217DCB68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2217DD774();
  *a1 = result;
  return result;
}

void sub_2217DCB94(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE400000000000000;
  v5 = 1852141679;
  if (v2 != 1)
  {
    v5 = 0x65736F6C63;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x656C67676F74;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2217DCBE4@<X0>(uint64_t a1@<X8>)
{
  return sub_2217DD2A0(&qword_25570A620, (uint64_t (*)(_QWORD))MEMORY[0x24BDB6200], (uint64_t)qword_25570AE40, a1);
}

uint64_t sub_2217DCC08()
{
  sub_2217DD7BC();
  return sub_2217DED08();
}

uint64_t sub_2217DCC40()
{
  if (qword_25570A628 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2217DCCAC()
{
  sub_2217DDE58();
  return sub_2217DEFF0();
}

void sub_2217DCCE4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E7434F0;
}

uint64_t sub_2217DCCF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v0 = sub_2217DF02C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_2217DF038();
  __swift_allocate_value_buffer(v4, qword_25570AE60);
  __swift_project_value_buffer(v4, (uint64_t)qword_25570AE60);
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v5 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  sub_2217DF050();
  return sub_2217DF044();
}

uint64_t sub_2217DCE94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v14 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF05C();
  MEMORY[0x24BDAC7A8]();
  v12 = sub_2217DF02C();
  v2 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2217DF08C();
  MEMORY[0x24BDAC7A8]();
  v5 = sub_2217DF038();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_2217DF080();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  v7 = sub_2217D9CF0();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v12);
  sub_2217DF050();
  sub_2217DF044();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, 1, 1, v5);
  v8 = v14;
  sub_2217DEEF4();
  v9 = sub_2217DEEE8();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

uint64_t sub_2217DD0D4()
{
  unsigned __int8 v1;

  sub_2217DEDB0();
  return v1;
}

uint64_t sub_2217DD104()
{
  return sub_2217DEDBC();
}

uint64_t sub_2217DD134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  sub_2217DF0E0();
  v3[6] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217DD1A4()
{
  uint64_t v0;
  char **v1;
  unsigned int v2;

  swift_release();
  sub_2217DEDB0();
  sub_2217DEDB0();
  if (!*(_BYTE *)(v0 + 16))
  {
    sub_2217DECB4();
    v2 = objc_msgSend(*(id *)(v0 + 16), sel_spotlightIsVisible);
    swift_unknownObjectRelease();
    if (!v2)
      goto LABEL_3;
LABEL_5:
    v1 = &selRef_dismissSpotlight;
    goto LABEL_6;
  }
  if (*(_BYTE *)(v0 + 16) != 1)
    goto LABEL_5;
LABEL_3:
  v1 = &selRef_presentSpotlight;
LABEL_6:
  sub_2217DECB4();
  objc_msgSend(*(id *)(v0 + 16), *v1);
  swift_unknownObjectRelease();
  sub_2217DED74();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217DD27C@<X0>(uint64_t a1@<X8>)
{
  return sub_2217DD2A0(qword_25570A630, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_25570AE60, a1);
}

uint64_t sub_2217DD2A0@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_2217DD330()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557099D8);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557099E0);
  MEMORY[0x24BDAC7A8]();
  sub_2217DEFC0();
  sub_2217DEFB4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557099F0);
  sub_2217DEFA8();
  swift_release();
  sub_2217DEFB4();
  sub_2217DEFD8();
  sub_2217D9D38();
  swift_bridgeObjectRetain();
  return sub_2217DEF9C();
}

uint64_t sub_2217DD4A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2217D7924;
  return sub_2217DD134(a1, v5, v4);
}

uint64_t sub_2217DD504@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2217DD800();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2217DD528()
{
  sub_2217DBB88();
  return sub_2217DED44();
}

unint64_t sub_2217DD550(unsigned __int8 a1)
{
  uint64_t v2;

  sub_2217DF17C();
  sub_2217DF0BC();
  swift_bridgeObjectRelease();
  v2 = sub_2217DF194();
  return sub_2217DD5F4(a1, v2);
}

unint64_t sub_2217DD5F4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  char v12;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    while (1)
    {
      if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4))
      {
        if (*(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) == 1)
        {
          v7 = 0xE400000000000000;
          v8 = 1852141679;
          v9 = a1;
          if (!a1)
            goto LABEL_17;
        }
        else
        {
          v7 = 0xE500000000000000;
          v8 = 0x65736F6C63;
          v9 = a1;
          if (!a1)
          {
LABEL_17:
            v11 = 0xE600000000000000;
            if (v8 != 0x656C67676F74)
              goto LABEL_19;
            goto LABEL_18;
          }
        }
      }
      else
      {
        v7 = 0xE600000000000000;
        v8 = 0x656C67676F74;
        v9 = a1;
        if (!a1)
          goto LABEL_17;
      }
      if (v9 == 1)
        v10 = 1852141679;
      else
        v10 = 0x65736F6C63;
      if (v9 == 1)
        v11 = 0xE400000000000000;
      else
        v11 = 0xE500000000000000;
      if (v8 != v10)
        goto LABEL_19;
LABEL_18:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      v12 = sub_2217DF140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v4 = (v4 + 1) & v6;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_2217DD774()
{
  unint64_t v0;

  v0 = sub_2217DF134();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_2217DD7BC()
{
  unint64_t result;

  result = qword_255709A00;
  if (!qword_255709A00)
  {
    result = MEMORY[0x22767224C](&unk_2217E0320, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A00);
  }
  return result;
}

uint64_t sub_2217DD800()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v0 = sub_2217DEFE4();
  v30 = *(_QWORD *)(v0 - 8);
  v31 = v0;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v29 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255709680);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v28 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)v25 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709650);
  MEMORY[0x24BDAC7A8](v5);
  v26 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2217DF05C();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_2217DF02C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2217DF08C();
  MEMORY[0x24BDAC7A8](v12);
  v25[0] = sub_2217DF038();
  v13 = *(_QWORD *)(v25[0] - 8);
  MEMORY[0x24BDAC7A8](v25[0]);
  v25[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2557099F8);
  sub_2217DF080();
  v14 = sub_2217D9CF0();
  swift_beginAccess();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15(v11, v14, v8);
  sub_2217DF050();
  sub_2217DF044();
  sub_2217DF080();
  sub_2217D9D38();
  swift_beginAccess();
  v15(v11, v14, v8);
  swift_bridgeObjectRetain();
  sub_2217DF050();
  v16 = v26;
  sub_2217DF044();
  (*(void (**)(char *, _QWORD, uint64_t, _QWORD))(v13 + 56))(v16, 0, 1, v25[0]);
  v34 = 3;
  v17 = sub_2217DED68();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v27, 1, 1, v17);
  v18(v28, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, *MEMORY[0x24BDB6090], v31);
  sub_2217DD7BC();
  v19 = sub_2217DEDD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557096F8);
  v20 = objc_msgSend((id)objc_opt_self(), sel_presentationHelperKey);
  v21 = sub_2217DF0A4();
  v23 = v22;

  v32 = v21;
  v33 = v23;
  sub_2217DF11C();
  sub_2217DECF0();
  sub_2217DECE4();
  sub_2217DECC0();
  return v19;
}

unint64_t sub_2217DDC54()
{
  unint64_t result;

  result = qword_255709A18;
  if (!qword_255709A18)
  {
    result = MEMORY[0x22767224C](&unk_2217E0280, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A18);
  }
  return result;
}

unint64_t sub_2217DDC9C()
{
  unint64_t result;

  result = qword_255709A20;
  if (!qword_255709A20)
  {
    result = MEMORY[0x22767224C](&unk_2217E0360, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A20);
  }
  return result;
}

unint64_t sub_2217DDCE4()
{
  unint64_t result;

  result = qword_255709A28;
  if (!qword_255709A28)
  {
    result = MEMORY[0x22767224C](&unk_2217E0398, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A28);
  }
  return result;
}

unint64_t sub_2217DDD2C()
{
  unint64_t result;

  result = qword_255709A30;
  if (!qword_255709A30)
  {
    result = MEMORY[0x22767224C](&unk_2217E02E8, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A30);
  }
  return result;
}

uint64_t sub_2217DDD70()
{
  return MEMORY[0x24BEE0D78];
}

unint64_t sub_2217DDD80()
{
  unint64_t result;

  result = qword_255709A38;
  if (!qword_255709A38)
  {
    result = MEMORY[0x22767224C](&unk_2217E03C8, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A38);
  }
  return result;
}

unint64_t sub_2217DDDC8()
{
  unint64_t result;

  result = qword_255709A40;
  if (!qword_255709A40)
  {
    result = MEMORY[0x22767224C](&unk_2217E03F0, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A40);
  }
  return result;
}

unint64_t sub_2217DDE10()
{
  unint64_t result;

  result = qword_255709A48;
  if (!qword_255709A48)
  {
    result = MEMORY[0x22767224C](&unk_2217E0418, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A48);
  }
  return result;
}

unint64_t sub_2217DDE58()
{
  unint64_t result;

  result = qword_255709A50;
  if (!qword_255709A50)
  {
    result = MEMORY[0x22767224C](&unk_2217E0470, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A50);
  }
  return result;
}

uint64_t sub_2217DDE9C()
{
  sub_2217DD7BC();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2217DDEE0()
{
  unint64_t result;

  result = qword_255709A58;
  if (!qword_255709A58)
  {
    result = MEMORY[0x22767224C](&unk_2217E04B0, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A58);
  }
  return result;
}

unint64_t sub_2217DDF28()
{
  unint64_t result;

  result = qword_255709A60;
  if (!qword_255709A60)
  {
    result = MEMORY[0x22767224C](&unk_2217E04D8, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A60);
  }
  return result;
}

unint64_t sub_2217DDF70()
{
  unint64_t result;

  result = qword_255709A68;
  if (!qword_255709A68)
  {
    result = MEMORY[0x22767224C](&unk_2217E02A8, &type metadata for ToggleSpotlightIntent.Action);
    atomic_store(result, (unint64_t *)&qword_255709A68);
  }
  return result;
}

uint64_t sub_2217DDFB4()
{
  return sub_2217D819C(&qword_255709A70, &qword_255709A78, MEMORY[0x24BEE12E0]);
}

unint64_t sub_2217DDFE4()
{
  unint64_t result;

  result = qword_255709A80;
  if (!qword_255709A80)
  {
    result = MEMORY[0x22767224C](&unk_2217E05A0, &type metadata for ToggleSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709A80);
  }
  return result;
}

unint64_t sub_2217DE02C()
{
  unint64_t result;

  result = qword_255709A88;
  if (!qword_255709A88)
  {
    result = MEMORY[0x22767224C](&unk_2217E05C8, &type metadata for ToggleSpotlightIntent);
    atomic_store(result, (unint64_t *)&qword_255709A88);
  }
  return result;
}

uint64_t sub_2217DE070()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2217DE080()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ToggleSpotlightIntent()
{
  swift_release();
  return swift_release();
}

_QWORD *_s17SpotlightUIShared21ToggleSpotlightIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_2217DEDEC();
  sub_2217DEDEC();
  return a1;
}

_QWORD *assignWithCopy for ToggleSpotlightIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_2217DEDEC();
  swift_release();
  a1[1] = a2[1];
  sub_2217DEDEC();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ToggleSpotlightIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ToggleSpotlightIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ToggleSpotlightIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ToggleSpotlightIntent()
{
  return &type metadata for ToggleSpotlightIntent;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ToggleSpotlightIntent.Action(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ToggleSpotlightIntent.Action(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2217DE310 + 4 * byte_2217E0245[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2217DE344 + 4 * byte_2217E0240[v4]))();
}

uint64_t sub_2217DE344(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217DE34C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2217DE354);
  return result;
}

uint64_t sub_2217DE360(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2217DE368);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2217DE36C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217DE374(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2217DE380(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2217DE388(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToggleSpotlightIntent.Action()
{
  return &type metadata for ToggleSpotlightIntent.Action;
}

uint64_t sub_2217DE3A0()
{
  return sub_2217D819C(&qword_255709A98, (uint64_t *)&unk_255709AA0, MEMORY[0x24BDB5F68]);
}

uint64_t sub_2217DE3CC()
{
  return sub_2217D819C((unint64_t *)&unk_255709740, &qword_255709AB0, MEMORY[0x24BDB5E58]);
}

uint64_t sub_2217DE3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255709AC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2217DE4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  sub_2217DF0E0();
  v6[12] = sub_2217DF0D4();
  sub_2217DF0C8();
  return swift_task_switch();
}

uint64_t sub_2217DE530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  swift_release();
  sub_2217DECF0();
  sub_2217DECE4();
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v0 + 64) = v2;
  swift_bridgeObjectRetain();
  sub_2217DF11C();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254124FF8);
  sub_2217DECD8();
  swift_release();
  swift_release();
  sub_2217DEBD8(v0 + 16, (uint64_t *)&unk_254125060);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2217DE624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2217DF0F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2217DF0EC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2217DEBD8(a1, &qword_254124FF0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2217DF0C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

SUIAppIntentsAnnotator __swiftcall SUIAppIntentsAnnotator.init()()
{
  return (SUIAppIntentsAnnotator)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SUIAppIntentsAnnotator.init()()
{
  objc_super v1;

  v1.super_class = (Class)SUIAppIntentsAnnotator;
  return objc_msgSendSuper2(&v1, sel_init);
}

void sub_2217DE91C()
{
  uint64_t v0;
  id v1;
  void *v2;

  v0 = sub_2217DECFC();
  MEMORY[0x24BDAC7A8](v0);
  if (objc_msgSend((id)objc_opt_self(), sel_isAppIntentsSupportEnabled))
  {
    sub_2217D821C();
    sub_2217DEC14();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254125050);
    sub_2217DEC5C();
    sub_2217DF110();
    v1 = objc_allocWithZone((Class)sub_2217DF074());
    sub_2217D8F48();
    v2 = (void *)sub_2217DF068();
    sub_2217DF104();

  }
}

unint64_t type metadata accessor for SUIAppIntentsAnnotator()
{
  unint64_t result;

  result = qword_25570ADC0;
  if (!qword_25570ADC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25570ADC0);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2217DEAB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2217D7924;
  return sub_2217DE4C0((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_2217DEB14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2217DEB38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2217D7924;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255709AF0 + dword_255709AF0))(a1, v4);
}

uint64_t sub_2217DEBA8()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2217DEBCC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_2217DEBD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2217DEC14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254125000;
  if (!qword_254125000)
  {
    v1 = sub_2217DECFC();
    result = MEMORY[0x22767224C](MEMORY[0x24BDB4CE8], v1);
    atomic_store(result, (unint64_t *)&qword_254125000);
  }
  return result;
}

unint64_t sub_2217DEC5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254125058;
  if (!qword_254125058)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254125050);
    result = MEMORY[0x22767224C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254125058);
  }
  return result;
}

uint64_t sub_2217DECA8()
{
  return MEMORY[0x24BDB4AF0]();
}

uint64_t sub_2217DECB4()
{
  return MEMORY[0x24BDB4B80]();
}

uint64_t sub_2217DECC0()
{
  return MEMORY[0x24BDB4B98]();
}

uint64_t sub_2217DECCC()
{
  return MEMORY[0x24BE851D8]();
}

uint64_t sub_2217DECD8()
{
  return MEMORY[0x24BDB4CB0]();
}

uint64_t sub_2217DECE4()
{
  return MEMORY[0x24BDB4CB8]();
}

uint64_t sub_2217DECF0()
{
  return MEMORY[0x24BDB4CC0]();
}

uint64_t sub_2217DECFC()
{
  return MEMORY[0x24BDB4CD8]();
}

uint64_t sub_2217DED08()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_2217DED14()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_2217DED20()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_2217DED2C()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_2217DED38()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_2217DED44()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_2217DED50()
{
  return MEMORY[0x24BDB4EE0]();
}

uint64_t sub_2217DED5C()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_2217DED68()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_2217DED74()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_2217DED80()
{
  return MEMORY[0x24BDB52A8]();
}

uint64_t sub_2217DED8C()
{
  return MEMORY[0x24BDB52D8]();
}

uint64_t sub_2217DED98()
{
  return MEMORY[0x24BDB5328]();
}

uint64_t sub_2217DEDA4()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_2217DEDB0()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_2217DEDBC()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_2217DEDC8()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_2217DEDD4()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_2217DEDE0()
{
  return MEMORY[0x24BDB5548]();
}

uint64_t sub_2217DEDEC()
{
  return MEMORY[0x24BDB56C8]();
}

uint64_t sub_2217DEDF8()
{
  return MEMORY[0x24BDB56D8]();
}

uint64_t sub_2217DEE04()
{
  return MEMORY[0x24BDB56E0]();
}

uint64_t sub_2217DEE10()
{
  return MEMORY[0x24BDB56E8]();
}

uint64_t sub_2217DEE1C()
{
  return MEMORY[0x24BDB56F0]();
}

uint64_t sub_2217DEE28()
{
  return MEMORY[0x24BDB56F8]();
}

uint64_t sub_2217DEE34()
{
  return MEMORY[0x24BDB5700]();
}

uint64_t sub_2217DEE40()
{
  return MEMORY[0x24BDB5708]();
}

uint64_t sub_2217DEE4C()
{
  return MEMORY[0x24BDB5710]();
}

uint64_t sub_2217DEE58()
{
  return MEMORY[0x24BDB5718]();
}

uint64_t sub_2217DEE64()
{
  return MEMORY[0x24BDB5720]();
}

uint64_t sub_2217DEE70()
{
  return MEMORY[0x24BDB5730]();
}

uint64_t sub_2217DEE7C()
{
  return MEMORY[0x24BDB5738]();
}

uint64_t sub_2217DEE88()
{
  return MEMORY[0x24BDB5740]();
}

uint64_t sub_2217DEE94()
{
  return MEMORY[0x24BDB5748]();
}

uint64_t sub_2217DEEA0()
{
  return MEMORY[0x24BDB5750]();
}

uint64_t sub_2217DEEAC()
{
  return MEMORY[0x24BDB5760]();
}

uint64_t sub_2217DEEB8()
{
  return MEMORY[0x24BDB5770]();
}

uint64_t sub_2217DEEC4()
{
  return MEMORY[0x24BDB5778]();
}

uint64_t sub_2217DEED0()
{
  return MEMORY[0x24BDB5780]();
}

uint64_t sub_2217DEEDC()
{
  return MEMORY[0x24BDB5790]();
}

uint64_t sub_2217DEEE8()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_2217DEEF4()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_2217DEF00()
{
  return MEMORY[0x24BDB58A0]();
}

uint64_t sub_2217DEF0C()
{
  return MEMORY[0x24BDB5A18]();
}

uint64_t sub_2217DEF18()
{
  return MEMORY[0x24BDB5A28]();
}

uint64_t sub_2217DEF24()
{
  return MEMORY[0x24BDB5A38]();
}

uint64_t sub_2217DEF30()
{
  return MEMORY[0x24BDB5CE0]();
}

uint64_t sub_2217DEF3C()
{
  return MEMORY[0x24BDB5CF8]();
}

uint64_t sub_2217DEF48()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_2217DEF54()
{
  return MEMORY[0x24BDB5DD0]();
}

uint64_t sub_2217DEF60()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_2217DEF6C()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_2217DEF78()
{
  return MEMORY[0x24BDB5E20]();
}

uint64_t sub_2217DEF84()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_2217DEF90()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_2217DEF9C()
{
  return MEMORY[0x24BDB5F50]();
}

uint64_t sub_2217DEFA8()
{
  return MEMORY[0x24BDB5FF0]();
}

uint64_t sub_2217DEFB4()
{
  return MEMORY[0x24BDB5FF8]();
}

uint64_t sub_2217DEFC0()
{
  return MEMORY[0x24BDB6000]();
}

uint64_t sub_2217DEFCC()
{
  return MEMORY[0x24BDB6010]();
}

uint64_t sub_2217DEFD8()
{
  return MEMORY[0x24BDB6018]();
}

uint64_t sub_2217DEFE4()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_2217DEFF0()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_2217DEFFC()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_2217DF008()
{
  return MEMORY[0x24BDB61F8]();
}

uint64_t sub_2217DF014()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_2217DF020()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_2217DF02C()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_2217DF038()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2217DF044()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_2217DF050()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2217DF05C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2217DF068()
{
  return MEMORY[0x24BDFBBA0]();
}

uint64_t sub_2217DF074()
{
  return MEMORY[0x24BDFBBA8]();
}

uint64_t sub_2217DF080()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2217DF08C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2217DF098()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2217DF0A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2217DF0B0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2217DF0BC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2217DF0C8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2217DF0D4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2217DF0E0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2217DF0EC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2217DF0F8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2217DF104()
{
  return MEMORY[0x24BDFBBC0]();
}

uint64_t sub_2217DF110()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2217DF11C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2217DF128()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2217DF134()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2217DF140()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2217DF14C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2217DF158()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2217DF164()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2217DF170()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2217DF17C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2217DF188()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2217DF194()
{
  return MEMORY[0x24BEE4328]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SSDefaultsGetResources()
{
  return MEMORY[0x24BEB0560]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t isMacOS()
{
  return MEMORY[0x24BEB0760]();
}

uint64_t json_writer_add_key()
{
  return MEMORY[0x24BEB0778]();
}

uint64_t json_writer_add_string()
{
  return MEMORY[0x24BEB0788]();
}

uint64_t json_writer_begin_array()
{
  return MEMORY[0x24BEB0798]();
}

uint64_t json_writer_begin_dictionary()
{
  return MEMORY[0x24BEB07A0]();
}

uint64_t json_writer_create_with_path()
{
  return MEMORY[0x24BEB07A8]();
}

uint64_t json_writer_dispose()
{
  return MEMORY[0x24BEB07B0]();
}

uint64_t json_writer_end_array()
{
  return MEMORY[0x24BEB07B8]();
}

uint64_t json_writer_end_dictionary()
{
  return MEMORY[0x24BEB07C0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

