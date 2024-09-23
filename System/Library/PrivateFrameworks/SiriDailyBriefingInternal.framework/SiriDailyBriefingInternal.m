unint64_t sub_223079518()
{
  sub_22307BF38();
  swift_bridgeObjectRelease();
  return 0xD000000000000028;
}

unint64_t sub_22307956C()
{
  return 0xD000000000000016;
}

BOOL sub_223079588(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_223079598()
{
  sub_22307BFD4();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2230795B8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x4974736163646F70 && a2 == 0xE900000000000064;
  if (v3 || (OUTLINED_FUNCTION_10() & 1) != 0)
  {
    OUTLINED_FUNCTION_9();
    return 0;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000)
  {
    OUTLINED_FUNCTION_9();
    return 1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_9();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void sub_223079670()
{
  sub_22307BFC8();
  sub_22307BFD4();
  sub_22307BFE0();
  OUTLINED_FUNCTION_19();
}

uint64_t sub_2230796AC(char a1)
{
  if ((a1 & 1) != 0)
    return 1701669236;
  else
    return 0x4974736163646F70;
}

BOOL sub_2230796E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_223079588(*a1, *a2);
}

void sub_2230796EC()
{
  sub_223079670();
}

void sub_2230796F4()
{
  sub_223079598();
}

void sub_2230796FC()
{
  sub_22307BFC8();
  sub_22307BFD4();
  sub_22307BFE0();
  OUTLINED_FUNCTION_19();
}

uint64_t sub_223079734()
{
  char *v0;

  return sub_2230796AC(*v0);
}

void sub_22307973C(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  *a3 = sub_2230795B8(a1, a2);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_22307975C()
{
  return 0;
}

void sub_223079768(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_223079774()
{
  sub_22307BA2C();
  return sub_22307C004();
}

uint64_t sub_22307979C()
{
  sub_22307BA2C();
  return sub_22307C010();
}

uint64_t sub_2230797C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255785A30);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_13();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22307BA2C();
  sub_22307BFF8();
  sub_22307BF8C();
  if (!v1)
    sub_22307BF98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

double sub_2230798E4(_QWORD *a1)
{
  uint64_t v1;
  double v2;
  double v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255785A38);
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22307BA2C();
  sub_22307BFEC();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    sub_22307BF74();
    swift_bridgeObjectRetain();
    sub_22307BF80();
    v2 = v5;
    OUTLINED_FUNCTION_2();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    OUTLINED_FUNCTION_18();
  }
  return v2;
}

void sub_223079A48(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  double v6;

  v6 = sub_2230798E4(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(double *)(a2 + 16) = v6;
  }
}

uint64_t sub_223079A74(_QWORD *a1)
{
  return sub_2230797C4(a1);
}

void sub_223079A90()
{
  strcpy((char *)&qword_255785A40, "DailyBriefing");
  *(_WORD *)&algn_255785A48[6] = -4864;
}

unint64_t sub_223079AC0()
{
  return 0xD00000000000002ELL;
}

void sub_223079ADC()
{
  uint64_t v0;

  type metadata accessor for DBKnowledgeStore();
  v0 = swift_allocObject();
  sub_22307A860();
  qword_255785E30 = v0;
  OUTLINED_FUNCTION_16();
}

uint64_t static DBKnowledgeStore.instance.getter()
{
  if (qword_255785E28 != -1)
    swift_once();
  return swift_retain();
}

void sub_223079B54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557859E8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_13();
  v6 = OUTLINED_FUNCTION_5();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - v11;
  sub_22307A780();
  v13 = sub_22307BED8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = (char *)swift_allocObject();
  *((_QWORD *)v15 + 2) = 0;
  *((_QWORD *)v15 + 3) = 0;
  *((_QWORD *)v15 + 4) = v2;
  *((_QWORD *)v15 + 5) = a1;
  *((_QWORD *)v15 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v15[v14], v10, v6);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22307A240(v3, (uint64_t)&unk_2557859F8, (uint64_t)v15);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_223079CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  return swift_task_switch();
}

uint64_t sub_223079CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  v4 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = sub_223079D74;
  return sub_22307BFB0();
}

uint64_t sub_223079D74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_223079DE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_223079DE8()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  swift_task_dealloc();
  swift_bridgeObjectRetain_n();
  v2 = sub_22307BE3C();
  v3 = sub_22307BEF0();
  if (OUTLINED_FUNCTION_11(v3))
  {
    v5 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    v6 = OUTLINED_FUNCTION_3();
    v8 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v6 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_22307A9CC(v5, v4, &v8);
    sub_22307BF20();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2080;
    *(_QWORD *)(v0 + 24) = sub_22307A9CC(0xD000000000000016, 0x800000022307C480, &v8);
    OUTLINED_FUNCTION_20();
    *(_WORD *)(v6 + 22) = 2080;
    *(_QWORD *)(v0 + 32) = sub_22307A9CC(0xD00000000000002ELL, 0x800000022307C540, &v8);
    sub_22307BF20();
    _os_log_impl(&dword_223078000, v2, v1, "Failed to set value %s for %s. Error: %s", (uint8_t *)v6, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_15();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_223079FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD aBlock[6];

  v19 = a2;
  v20 = a5;
  v23 = a4;
  v21 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255785A10);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = OUTLINED_FUNCTION_5();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(id *)(a2 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_knowledgeStore);
  v23 = sub_22307BE60();
  sub_223079518();
  v22 = sub_22307BE60();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v20, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v6);
  v13 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v14 = (v11 + *(unsigned __int8 *)(v7 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v13, v12, v9);
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v14, (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_22307B548;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22307A1EC;
  aBlock[3] = &block_descriptor;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v17 = (void *)v23;
  v18 = (void *)v22;
  objc_msgSend(v24, sel_setValue_forKey_completionHandler_, v23, v22, v16);
  _Block_release(v16);

  OUTLINED_FUNCTION_4();
}

void sub_22307A1EC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_22307A240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_22307BED8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22307B388(a1);
  }
  else
  {
    sub_22307BECC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22307BEA8();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22307A37C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = sub_22307BE84();
  MEMORY[0x24BDAC7A8](v0);
  sub_22307BDF4();
  swift_allocObject();
  sub_22307BDE8();
  sub_22307B7E0();
  v1 = sub_22307BDDC();
  v3 = v2;
  swift_release();
  sub_22307BE78();
  v4 = sub_22307BE6C();
  v6 = v5;
  result = sub_22307B81C(v1, v3);
  if (v6)
  {
    sub_223079B54(v4, v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22307A608(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  swift_bridgeObjectRetain_n();
  v4 = sub_22307BE3C();
  v5 = sub_22307BEE4();
  if (OUTLINED_FUNCTION_11(v5))
  {
    v6 = OUTLINED_FUNCTION_3();
    v9 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v6 = 136315394;
    swift_bridgeObjectRetain();
    sub_22307A9CC(a1, a2, &v9);
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2048;
    sub_22307BF20();
    OUTLINED_FUNCTION_12(&dword_223078000, v4, v7, "InternalKnowledgeStore: Setting PodcastLastInvocation for podcast: %s at time: %f");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_15();
  sub_22307A37C();
  return OUTLINED_FUNCTION_9();
}

uint64_t sub_22307A780()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_mainLog);
  sub_22307BE24();
  sub_22307BF08();
  return sub_22307BE18();
}

void DBKnowledgeStore.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_logger;
  v2 = sub_22307BE54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  OUTLINED_FUNCTION_16();
}

uint64_t DBKnowledgeStore.__deallocating_deinit()
{
  DBKnowledgeStore.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_22307A860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (_MergedGlobals != -1)
    swift_once();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7();
  sub_22307BE48();
  v1 = OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_mainLog;
  sub_22307B860();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7();
  *(_QWORD *)(v0 + v1) = sub_22307BF14();
  v2 = OBJC_IVAR____TtC25SiriDailyBriefingInternal16DBKnowledgeStore_knowledgeStore;
  sub_22307BE0C();
  *(_QWORD *)(v0 + v2) = sub_22307BE00();
  return v0;
}

uint64_t sub_22307A940(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22307A9A4;
  return v6(a1);
}

uint64_t sub_22307A9A4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22307A9CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_22307AA9C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22307B7A0((uint64_t)v12, *a3);
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
      sub_22307B7A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_22307AA9C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_22307ABF0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22307BF2C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_22307ACB4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_22307BF50();
    if (!v8)
    {
      result = sub_22307BF5C();
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

void *sub_22307ABF0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22307BF68();
  __break(1u);
  return result;
}

uint64_t sub_22307ACB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22307AD48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22307AF1C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22307AF1C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22307AD48(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_22307BE9C();
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
  v3 = sub_22307AEB8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_22307BF44();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_22307BF68();
  __break(1u);
LABEL_14:
  result = sub_22307BF5C();
  __break(1u);
  return result;
}

_QWORD *sub_22307AEB8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255785A18);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22307AF1C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255785A18);
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
    sub_22307B0B4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22307AFF0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22307AFF0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22307BF68();
  __break(1u);
  return result;
}

char *sub_22307B0B4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22307BF68();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_22307B134()
{
  return type metadata accessor for DBKnowledgeStore();
}

uint64_t type metadata accessor for DBKnowledgeStore()
{
  uint64_t result;

  result = qword_255785A60;
  if (!qword_255785A60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22307B174()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22307BE54();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DBKnowledgeStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DBKnowledgeStore.setLastInvocationFor(podcast:at:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227682694]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_22307B254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_5();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22307B2D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_5() - 8) + 80);
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  v6 = (uint64_t)v0 + ((v2 + 56) & ~v2);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_22307B350;
  return sub_223079CB0((uint64_t)v7, v8, v9, v3, v4, v5, v6);
}

uint64_t sub_22307B350()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_22307B388(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557859E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22307B3C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22307B3EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22307B45C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255785A00 + dword_255785A00))(a1, v4);
}

uint64_t sub_22307B45C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_6(*(uint64_t (**)(void))(v0 + 8));
}

void sub_22307B480(uint64_t a1)
{
  uint64_t *v1;

  sub_223079FE4(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_22307B48C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = OUTLINED_FUNCTION_5();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255785A10);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_22307B548(uint64_t a1)
{
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255785A10);
  sub_22307BEFC();
  sub_22307BE18();
  if (a1)
    OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255785A10);
  return sub_22307BEC0();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_22307B7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22307B7E0()
{
  unint64_t result;

  result = qword_255785A20;
  if (!qword_255785A20)
  {
    result = MEMORY[0x2276826A0](&unk_22307C360, &type metadata for PodcastLastInvocation);
    atomic_store(result, (unint64_t *)&qword_255785A20);
  }
  return result;
}

uint64_t sub_22307B81C(uint64_t a1, unint64_t a2)
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

unint64_t sub_22307B860()
{
  unint64_t result;

  result = qword_255785A28;
  if (!qword_255785A28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255785A28);
  }
  return result;
}

uint64_t destroy for PodcastLastInvocation()
{
  return swift_bridgeObjectRelease();
}

void _s25SiriDailyBriefingInternal21PodcastLastInvocationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16();
}

_QWORD *assignWithCopy for PodcastLastInvocation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

void assignWithTake for PodcastLastInvocation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  OUTLINED_FUNCTION_16();
}

uint64_t getEnumTagSinglePayload for PodcastLastInvocation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PodcastLastInvocation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PodcastLastInvocation()
{
  return &type metadata for PodcastLastInvocation;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_22307BA2C()
{
  unint64_t result;

  result = qword_255785B70[0];
  if (!qword_255785B70[0])
  {
    result = MEMORY[0x2276826A0](&unk_22307C44C, &type metadata for PodcastLastInvocation.CodingKeys);
    atomic_store(result, qword_255785B70);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PodcastLastInvocation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PodcastLastInvocation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22307BB6C + 4 * byte_22307C2C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22307BBA0 + 4 * byte_22307C2C0[v4]))();
}

uint64_t sub_22307BBA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22307BBA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22307BBB0);
  return result;
}

uint64_t sub_22307BBBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22307BBC4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22307BBC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22307BBD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22307BBDC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22307BBE8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PodcastLastInvocation.CodingKeys()
{
  return &type metadata for PodcastLastInvocation.CodingKeys;
}

unint64_t sub_22307BC08()
{
  unint64_t result;

  result = qword_255785C80[0];
  if (!qword_255785C80[0])
  {
    result = MEMORY[0x2276826A0](&unk_22307C424, &type metadata for PodcastLastInvocation.CodingKeys);
    atomic_store(result, qword_255785C80);
  }
  return result;
}

unint64_t sub_22307BC48()
{
  unint64_t result;

  result = qword_255785D90;
  if (!qword_255785D90)
  {
    result = MEMORY[0x2276826A0](&unk_22307C394, &type metadata for PodcastLastInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255785D90);
  }
  return result;
}

unint64_t sub_22307BC88()
{
  unint64_t result;

  result = qword_255785D98[0];
  if (!qword_255785D98[0])
  {
    result = MEMORY[0x2276826A0](&unk_22307C3BC, &type metadata for PodcastLastInvocation.CodingKeys);
    atomic_store(result, qword_255785D98);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x2276826F4);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_22307BE30();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t OUTLINED_FUNCTION_7()
{
  return 0xD00000000000001CLL;
}

void OUTLINED_FUNCTION_8()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_22307BFA4();
}

BOOL OUTLINED_FUNCTION_11(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0x16u);
}

void OUTLINED_FUNCTION_14()
{
  JUMPOUT(0x227682658);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_22307BF20();
}

uint64_t sub_22307BDDC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22307BDE8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22307BDF4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22307BE00()
{
  return MEMORY[0x24BE1E2B0]();
}

uint64_t sub_22307BE0C()
{
  return MEMORY[0x24BE1E2C0]();
}

uint64_t sub_22307BE18()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_22307BE24()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_22307BE30()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_22307BE3C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22307BE48()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22307BE54()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22307BE60()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22307BE6C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_22307BE78()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_22307BE84()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_22307BE90()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22307BE9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22307BEA8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22307BEB4()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22307BEC0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22307BECC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22307BED8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22307BEE4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22307BEF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22307BEFC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_22307BF08()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_22307BF14()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22307BF20()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22307BF2C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22307BF38()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22307BF44()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22307BF50()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22307BF5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22307BF68()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22307BF74()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22307BF80()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_22307BF8C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22307BF98()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_22307BFA4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22307BFB0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22307BFBC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22307BFC8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22307BFD4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22307BFE0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22307BFEC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22307BFF8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22307C004()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22307C010()
{
  return MEMORY[0x24BEE4A10]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

