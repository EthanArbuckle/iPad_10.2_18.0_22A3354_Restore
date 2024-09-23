uint64_t AsyncSequentialExecutor.__allocating_init(label:priority:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  AsyncSequentialExecutor.init(label:priority:logger:)(a1, a2, a3, a4);
  return v8;
}

uint64_t AsyncSequentialExecutor.init(label:priority:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v21;
  uint64_t v22;

  v5 = v4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0C78);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_9();
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0C80);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_8();
  v14 = v13 - v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CB8);
  v21 = *(_QWORD *)(v15 - 8);
  v22 = v15;
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_8();
  v18 = v17 - v16;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v4, *MEMORY[0x1E0DF07B8], v8);
  sub_1C2F24754();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v4 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_streamContinuation, v14, v10);
  sub_1C2F09278(a4, v4 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, qword_1ED7E0B50);
  v19 = sub_1C2F075AC(v18, a3, a1, a2, a4);
  swift_bridgeObjectRelease();
  sub_1C2F07770(a4, qword_1ED7E0B50);
  sub_1C2F07770(a3, &qword_1ED7E0C68);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v18, v22);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_task) = v19;
  return v5;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCD77C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C2F075AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a5;
  v23 = a1;
  v24 = a3;
  v25 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CB8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50) - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0C68);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F09278(a2, (uint64_t)v14, &qword_1ED7E0C68);
  sub_1C2F09278(v22, (uint64_t)v12, qword_1ED7E0B50);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v23, v6);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = (v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (*(unsigned __int8 *)(v7 + 80) + v16 + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  sub_1C2F093B8((uint64_t)v12, v18 + v15);
  v19 = (_QWORD *)(v18 + v16);
  v20 = v25;
  *v19 = v24;
  v19[1] = v20;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, v9, v6);
  sub_1C2F24598();
  return sub_1C2F0817C((uint64_t)v14, (uint64_t)&unk_1EF7D6178, v18);
}

uint64_t sub_1C2F07770(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C2F077AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50);
  v7[14] = swift_task_alloc();
  v7[15] = swift_task_alloc();
  v7[16] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0CA0);
  v7[17] = v8;
  v7[18] = *(_QWORD *)(v8 - 8);
  v7[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C2F07854()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CB8);
  sub_1C2F24784();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  OUTLINED_FUNCTION_1(v1);
  return sub_1C2F24790();
}

uint64_t sub_1C2F078C4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2F078FC()
{
  _QWORD *v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t EnumTagSinglePayload;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(void);
  uint64_t v17;

  v1 = (int *)v0[2];
  v3 = v0[4];
  v2 = v0[5];
  v0[21] = v0[3];
  v0[22] = v3;
  v0[23] = v2;
  if (v1)
  {
    v4 = v0[16];
    sub_1C2F09278(v0[10], v4, qword_1ED7E0B50);
    v5 = OUTLINED_FUNCTION_15();
    v0[24] = v5;
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v4, 1, v5);
    if ((_DWORD)EnumTagSinglePayload == 1)
    {
      OUTLINED_FUNCTION_12(EnumTagSinglePayload, qword_1ED7E0B50);
    }
    else
    {
      swift_retain_n();
      OUTLINED_FUNCTION_22();
      v11 = sub_1C2F244C0();
      v12 = sub_1C2F247E4();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = OUTLINED_FUNCTION_3();
        v17 = OUTLINED_FUNCTION_3();
        *(_DWORD *)v13 = 136315138;
        sub_1C2F24598();
        *(_QWORD *)(v13 + 4) = sub_1C2F08778(v3, v2, &v17);
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_13();
        OUTLINED_FUNCTION_19(&dword_1C2F05000, v11, v12, "#AsyncSequentialExecutor Starting async task: %s", (uint8_t *)v13);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_13();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_16(v0[16], *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8));
    }
    v16 = (uint64_t (*)(void))((char *)v1 + *v1);
    v14 = (_QWORD *)swift_task_alloc();
    v0[25] = v14;
    *v14 = v0;
    v14[1] = sub_1C2F07B30;
    v10 = v16;
  }
  else
  {
    v8 = v0[11];
    v7 = v0[12];
    v9 = v0[10];
    (*(void (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[19], v0[17]);
    sub_1C2F07F80(v9, v8, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_1C2F07B30()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_11();
  *v2 = *v1;
  *(_QWORD *)(v3 + 208) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2F07B84()
{
  uint64_t *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  sub_1C2F09278(v0[10], v0[15], qword_1ED7E0B50);
  if (OUTLINED_FUNCTION_14() == 1)
  {
    OUTLINED_FUNCTION_7();
    v1 = swift_release();
    OUTLINED_FUNCTION_12(v1, qword_1ED7E0B50);
  }
  else
  {
    swift_retain_n();
    OUTLINED_FUNCTION_22();
    v2 = sub_1C2F244C0();
    v3 = sub_1C2F247E4();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = v0[22];
      v5 = OUTLINED_FUNCTION_3();
      v9 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v5 = 136315138;
      OUTLINED_FUNCTION_4();
      *(_QWORD *)(v5 + 4) = OUTLINED_FUNCTION_21(v4, v6, &v9);
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v2, v3, "#AsyncSequentialExecutor Ending async task: %s", (uint8_t *)v5);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_2();
    swift_release_n();
    OUTLINED_FUNCTION_18(v0[15], v0[24]);
  }
  v7 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v7;
  OUTLINED_FUNCTION_1(v7);
  return sub_1C2F24790();
}

uint64_t sub_1C2F07D38()
{
  uint64_t *v0;
  int v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  sub_1C2F09278(v0[10], v0[14], qword_1ED7E0B50);
  v1 = OUTLINED_FUNCTION_14();
  v2 = (void *)v0[26];
  if (v1 == 1)
  {

    swift_release();
    v3 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_12(v3, qword_1ED7E0B50);
  }
  else
  {
    swift_retain();
    OUTLINED_FUNCTION_4();
    v4 = v2;
    swift_retain();
    OUTLINED_FUNCTION_4();
    v5 = v2;
    v6 = sub_1C2F244C0();
    v7 = sub_1C2F247F0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = v0[22];
      v9 = OUTLINED_FUNCTION_3();
      v15 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v9 = 136315394;
      OUTLINED_FUNCTION_4();
      *(_QWORD *)(v9 + 4) = OUTLINED_FUNCTION_21(v8, v10, &v15);
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_13();
      *(_WORD *)(v9 + 12) = 2080;
      swift_getErrorValue();
      v11 = sub_1C2F24A60();
      *(_QWORD *)(v9 + 14) = sub_1C2F08778(v11, v12, &v15);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      _os_log_impl(&dword_1C2F05000, v6, v7, "#AsyncSequentialExecutor async task \"%s\" threw an exception: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_6();

    swift_release_n();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_18(v0[14], v0[24]);
  }
  v13 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v13;
  OUTLINED_FUNCTION_1(v13);
  return sub_1C2F24790();
}

uint64_t sub_1C2F07F80(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F09278(a1, (uint64_t)v7, qword_1ED7E0B50);
  v8 = sub_1C2F244CC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
    return sub_1C2F07770((uint64_t)v7, qword_1ED7E0B50);
  swift_bridgeObjectRetain_n();
  v10 = sub_1C2F244C0();
  v11 = sub_1C2F247E4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v15 = v13;
    *(_DWORD *)v12 = 136315138;
    sub_1C2F24598();
    v14 = sub_1C2F08778(a2, a3, &v15);
    sub_1C2F248C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C2F05000, v10, v11, "#AsyncSequentialExecutor ending main task: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BCD824](v13, -1, -1);
    MEMORY[0x1C3BCD824](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_1C2F0817C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1C2F24748();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1C2F07770(a1, &qword_1ED7E0C68);
  }
  else
  {
    sub_1C2F2473C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2F24730();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1C2F082A4(uint64_t a1, uint64_t a2)
{
  return sub_1C2F082CC(0x6F6D796E6F6E613CLL, 0xEB000000003E7375, a1, a2);
}

uint64_t sub_1C2F082CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v22[4];

  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0C70) - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_9();
  sub_1C2F09278(v4 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, v4, qword_1ED7E0B50);
  v12 = OUTLINED_FUNCTION_15();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v4, 1, v12);
  OUTLINED_FUNCTION_4();
  if (EnumTagSinglePayload == 1)
  {
    v14 = OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_12(v14, qword_1ED7E0B50);
  }
  else
  {
    v20 = a1;
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_20();
    v15 = sub_1C2F244C0();
    v16 = sub_1C2F247E4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_3();
      v22[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v17 = 136315138;
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_21(v20, v18, v22);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v15, v16, "#AsyncSequentialExecutor Submitting async task: %s", v17);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v4, v12);
    a1 = v20;
  }
  v22[0] = a3;
  v22[1] = a4;
  v22[2] = a1;
  v22[3] = a2;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_20();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0C80);
  sub_1C2F24760();
  swift_release();
  OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_16(v11, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_1C2F08554()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0C80);
  sub_1C2F2476C();
  OUTLINED_FUNCTION_23();
}

uint64_t AsyncSequentialExecutor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_streamContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0C80);
  sub_1C2F2476C();
  OUTLINED_FUNCTION_16(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8));
  sub_1C2F07770(v1 + OBJC_IVAR____TtC21SiriRequestDispatcher23AsyncSequentialExecutor_logger, qword_1ED7E0B50);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t AsyncSequentialExecutor.__deallocating_deinit()
{
  AsyncSequentialExecutor.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AsyncSequentialExecutor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C2F08630()
{
  return AsyncSequentialExecutor.unownedExecutor.getter();
}

void sub_1C2F08648(uint64_t *a1@<X8>)
{
  *a1 = sub_1C2F10648();
  OUTLINED_FUNCTION_23();
}

BOOL sub_1C2F08668(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2F16CAC(*a1, *a2);
}

_QWORD *sub_1C2F08674@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C2F08680(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F086A4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1C2F086B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C2F086E8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C2F08708(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1C2F08778(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1C2F248C8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C2F08778(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1C2F08848(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C2F09238((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C2F09238((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_1C2F24598();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C2F08848(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C2F0899C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C2F248D4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C2F08A60(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C2F2494C();
    if (!v8)
    {
      result = sub_1C2F249E8();
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

void *sub_1C2F0899C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2F24A00();
  __break(1u);
  return result;
}

uint64_t sub_1C2F08A60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C2F08AF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C2F08C64(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C2F08C64((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C2F08AF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C2F24664();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1C2F23560(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C2F24928();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1C2F24A00();
  __break(1u);
LABEL_14:
  result = sub_1C2F249E8();
  __break(1u);
  return result;
}

char *sub_1C2F08C64(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0568);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C2F08DFC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2F08D38(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C2F08D38(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2F24A00();
  __break(1u);
  return result;
}

char *sub_1C2F08DFC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C2F24A00();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_1C2F08E7C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1C2F08E8C()
{
  return type metadata accessor for AsyncSequentialExecutor();
}

uint64_t type metadata accessor for AsyncSequentialExecutor()
{
  uint64_t result;

  result = qword_1ED7E0B40;
  if (!qword_1ED7E0B40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C2F08ECC()
{
  unint64_t v0;
  unint64_t v1;

  sub_1C2F08FA4();
  if (v0 <= 0x3F)
  {
    sub_1C2F08FEC();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AsyncSequentialExecutor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.__allocating_init(label:priority:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.submit(task:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.submit(taskName:task:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of AsyncSequentialExecutor.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

void sub_1C2F08FA4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7E0C90)
  {
    v0 = sub_1C2F24778();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7E0C90);
  }
}

void sub_1C2F08FEC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7E0C58)
  {
    sub_1C2F244CC();
    v0 = sub_1C2F248BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7E0C58);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AsyncSequentialExecutor.AsyncWork(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AsyncSequentialExecutor.AsyncWork()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AsyncSequentialExecutor.AsyncWork(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  sub_1C2F24598();
  return a1;
}

_QWORD *assignWithCopy for AsyncSequentialExecutor.AsyncWork(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_1C2F24598();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for AsyncSequentialExecutor.AsyncWork(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncSequentialExecutor.AsyncWork(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for AsyncSequentialExecutor.AsyncWork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncSequentialExecutor.AsyncWork()
{
  return &type metadata for AsyncSequentialExecutor.AsyncWork;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1C2F09238(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C2F09278(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C2F092BC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CB8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  swift_unknownObjectRelease();
  v7 = OUTLINED_FUNCTION_15();
  if (!__swift_getEnumTagSinglePayload(v0 + v2, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v0 + v2, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((((v3 + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6), v4);
  return swift_deallocObject();
}

uint64_t sub_1C2F093B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F09400(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_1ED7E0B50) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CB8) - 8) + 80);
  v8 = (v6 + v7 + 16) & ~v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + v6;
  v13 = *(_QWORD *)(v1 + v6);
  v14 = *(_QWORD *)(v12 + 8);
  v15 = v1 + v8;
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_1C2F094E0;
  return sub_1C2F077AC(a1, v9, v10, v11, v13, v14, v15);
}

uint64_t sub_1C2F094E0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x1C3BCD824);
}

uint64_t OUTLINED_FUNCTION_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_11()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_1C2F07770(v2, a2);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_1C2F244CC();
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 - 8) + 8))();
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C2F08778(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRetain_n();
}

void sub_1C2F0962C()
{
  strcpy((char *)&qword_1EF7D6D70, "SiriAssistant");
  *(_WORD *)&algn_1EF7D6D78[6] = -4864;
}

void sub_1C2F0965C()
{
  strcpy((char *)&qword_1EF7D6480, "orchestration");
  *(_WORD *)&algn_1EF7D6488[6] = -4864;
}

uint64_t static AutoBugCapture.ErrorType.orchestration.getter()
{
  uint64_t v0;

  if (qword_1EF7D6128 != -1)
    swift_once();
  v0 = qword_1EF7D6480;
  sub_1C2F24598();
  return v0;
}

unint64_t static AutoBugCapture.ErrorSubType.machineUtteranceFallback.getter()
{
  return 0xD000000000000021;
}

uint64_t static AutoBugCapture.ErrorContext.none.getter()
{
  return 0;
}

uint64_t static AutoBugCapture.generateSnapshot(type:subType:context:)()
{
  uint64_t result;

  result = AFIsInternalInstall();
  if ((_DWORD)result)
  {
    if (qword_1EF7D6120 != -1)
      swift_once();
    sub_1C2F243B8();
    swift_allocObject();
    sub_1C2F24598();
    sub_1C2F243AC();
    sub_1C2F243A0();
    return swift_release();
  }
  return result;
}

void sub_1C2F0981C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_1ED7E0638 != -1)
    swift_once();
  v0 = sub_1C2F244CC();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED7E0D30);
  oslog = sub_1C2F244C0();
  v1 = sub_1C2F24808();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v2 = 67109120;
    sub_1C2F248C8();
    _os_log_impl(&dword_1C2F05000, oslog, v1, "AutoBugCapture#generateSnapshot ABC result: %{BOOL}d", v2, 8u);
    MEMORY[0x1C3BCD824](v2, -1, -1);
  }

}

void type metadata accessor for AutoBugCapture()
{
  OUTLINED_FUNCTION_0_0();
}

void type metadata accessor for AutoBugCapture.ErrorType()
{
  OUTLINED_FUNCTION_0_0();
}

void type metadata accessor for AutoBugCapture.ErrorSubType()
{
  OUTLINED_FUNCTION_0_0();
}

void type metadata accessor for AutoBugCapture.ErrorContext()
{
  OUTLINED_FUNCTION_0_0();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t Bridge.defaultHandle(_:executionContextInfo:reply:)(void *a1, uint64_t a2, void (*a3)(id, id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t result;
  id v22;
  id v23;
  char *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v45 = a4;
  v10 = sub_1C2F24388();
  v42 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v41 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED7E0638 != -1)
    swift_once();
  v12 = sub_1C2F244CC();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED7E0D30);
  swift_unknownObjectRetain_n();
  v13 = a1;
  v14 = sub_1C2F244C0();
  v15 = sub_1C2F247E4();
  v16 = os_log_type_enabled(v14, v15);
  v43 = a5;
  v44 = a6;
  if (v16)
  {
    v17 = OUTLINED_FUNCTION_3();
    v38 = (_QWORD *)OUTLINED_FUNCTION_3();
    v39 = OUTLINED_FUNCTION_3();
    v48 = v39;
    *(_DWORD *)v17 = 136315394;
    v40 = v10;
    v18 = sub_1C2F24454();
    v46 = sub_1C2F08778(v18, v19, &v48);
    sub_1C2F248C8();
    OUTLINED_FUNCTION_3_0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2112;
    v46 = (uint64_t)v13;
    v20 = v13;
    sub_1C2F248C8();
    *v38 = v13;

    _os_log_impl(&dword_1C2F05000, v14, v15, "Bridge:%s received %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0();
  }

  result = OUTLINED_FUNCTION_3_0();
  if (a3)
  {
    v22 = objc_allocWithZone(MEMORY[0x1E0D87FF0]);
    swift_retain();
    v23 = objc_msgSend(v22, sel_init);
    v24 = v41;
    sub_1C2F2437C();
    sub_1C2F24358();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v24, v10);
    v25 = (void *)sub_1C2F245F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v23, sel_setAceId_, v25);

    v26 = v23;
    v27 = objc_msgSend(v13, sel_aceId);
    objc_msgSend(v26, sel_setRefId_, v27);

    v48 = 0;
    v49 = 0xE000000000000000;
    sub_1C2F2491C();
    swift_bridgeObjectRelease();
    v48 = 0x20656764697242;
    v49 = 0xE700000000000000;
    sub_1C2F24454();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_7();
    sub_1C2F24658();
    v28 = objc_msgSend(v13, sel_encodedClassName);
    if (v28)
    {
      v29 = v28;
      v30 = sub_1C2F24604();
      v32 = v31;

    }
    else
    {
      v30 = 0;
      v32 = 0;
    }
    v33 = (void *)objc_opt_self();
    v46 = v30;
    v47 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D6490);
    sub_1C2F24634();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_7();
    v34 = (void *)sub_1C2F245F8();
    OUTLINED_FUNCTION_7();
    v35 = objc_msgSend(v33, sel_errorWithCode_description_, 2000, v34);

    v36 = v26;
    v37 = v35;
    a3(v26, v35);

    return sub_1C2F09FE4((uint64_t)a3);
  }
  return result;
}

uint64_t Bridge.aceCommandsGroups()()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t Bridge.aceCommands(forGroup:)()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t XPCListeningBridge.init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  _BYTE v14[40];
  _BYTE v15[40];

  if (qword_1ED7E0638 != -1)
    swift_once();
  v8 = sub_1C2F244CC();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED7E0D30);
  v9 = sub_1C2F244C0();
  v10 = sub_1C2F247F0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C2F05000, v9, v10, "Attempting to initialize an XPCListeningBridge without an XPCListener, this is not supported. Please use a different implementation if an XPCListener is not required. ", v11, 2u);
    OUTLINED_FUNCTION_0();
  }

  sub_1C2F0A0A4(a3, (uint64_t)v15);
  sub_1C2F0A0A4(a6, (uint64_t)v14);
  type metadata accessor for EmptyBridgeConnectionListener();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B50]), sel_init);
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B50]), sel_init);
  sub_1C2F0EF20();
  v12 = sub_1C2F24448();
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(a3);
  return v12;
}

uint64_t sub_1C2F09FE4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_1C2F09FF4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_1C2F248C8();
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

uint64_t sub_1C2F0A0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_1C2F24658();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_arrayDestroy();
}

void sub_1C2F0A10C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  sub_1C2F244E4();
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  sub_1C2F0A1E0((uint64_t)v3);
}

void sub_1C2F0A18C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_1ED7E0D20;
  OUTLINED_FUNCTION_10_0();
  v4 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A1E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_1ED7E0D20;
  OUTLINED_FUNCTION_7_0();
  v4 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A238()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23();
}

void sub_1C2F0A270()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1C2F0A2D4(v0);
}

void sub_1C2F0A298()
{
  OUTLINED_FUNCTION_10_0();
  swift_retain();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A2D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + qword_1ED7E0D18);
  OUTLINED_FUNCTION_10_0();
  *v3 = a1;
  swift_release();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A318()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23();
}

void sub_1C2F0A350()
{
  uint64_t v0;

  v0 = sub_1C2F24598();
  sub_1C2F0A3B4(v0);
}

void sub_1C2F0A378()
{
  OUTLINED_FUNCTION_10_0();
  sub_1C2F24598();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A3B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + qword_1ED7E0D10);
  OUTLINED_FUNCTION_10_0();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F0A3F8()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23();
}

void CandidateRequestAwareBridgeBase.__allocating_init(_:_:_:_:_:)()
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

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = OUTLINED_FUNCTION_15();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_86();
  if (qword_1ED7E0638 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED7E0D30);
  OUTLINED_FUNCTION_76(v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(v0 + 440))(v13, v11, &v18, v7, v5, &v17, v1, 1);
  __swift_destroy_boxed_opaque_existential_0(v3);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_1();
}

void CandidateRequestAwareBridgeBase.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  OUTLINED_FUNCTION_5_1();
  swift_allocObject();
  CandidateRequestAwareBridgeBase.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)();
  OUTLINED_FUNCTION_3_1();
}

void CandidateRequestAwareBridgeBase.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  OUTLINED_FUNCTION_5_1();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v22 = v7;
  v23 = v8;
  v10 = v9;
  v20 = v11;
  v21 = v12;
  v13 = OUTLINED_FUNCTION_15();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78]();
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v0 + qword_1ED7E0D20;
  *(_QWORD *)(v0 + qword_1ED7E0D20) = 500;
  v18 = *MEMORY[0x1E0DEF490];
  v19 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  *(_QWORD *)(v0 + qword_1ED7E0D18) = 0;
  *(_QWORD *)(v0 + qword_1ED7E0D10) = MEMORY[0x1E0DEE9E0];
  *(_BYTE *)(v0 + qword_1ED7E0890) = v2;
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_86();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v4, v13);
  MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(v20, v21, &v25, v22, v23, &v24, (uint64_t)v16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v13);
  __swift_destroy_boxed_opaque_existential_0(v6);
  __swift_destroy_boxed_opaque_existential_0(v10);
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F0A6C8()
{
  sub_1C2F0A720();
}

uint64_t sub_1C2F0A6D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_1C2F10650(a1, a2), (v3 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

void sub_1C2F0A714()
{
  sub_1C2F0A720();
}

void sub_1C2F0A720()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t *);
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v30;
  uint64_t v31[3];
  _QWORD v32[3];

  OUTLINED_FUNCTION_5_1();
  v29 = v3;
  v30 = v2;
  v4 = v0;
  v27 = v6;
  v28 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *v0;
  v12 = *(_QWORD *)(OUTLINED_FUNCTION_15() - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_19_0();
  v26 = *v10;
  swift_getMetatypeMetadata();
  v13 = sub_1C2F24634();
  v15 = v14;
  v16 = sub_1C2F12D94();
  v31[0] = v13;
  v31[1] = v15;
  v17 = *(_QWORD *)(v11 + 328);
  v20 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(0, v17, v18, v19);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1C3BCCE94](v32, v31, v16, MEMORY[0x1E0DEA968], v20, MEMORY[0x1E0DEA978]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_20_0();
  v21 = v32[0];
  OUTLINED_FUNCTION_33();
  if (v21)
  {
    v22 = ((char *)v4 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_4();
    sub_1C2F244C0();
    v23 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_9_0(v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_3();
      v31[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v24 = 136315138;
      OUTLINED_FUNCTION_4();
      v32[0] = sub_1C2F08778(v13, v15, v31);
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v22, (os_log_type_t)v4, "Message type: %s is already registered. Ignoring this request", v24);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

  }
  else
  {
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler(0, v17, v27, v8);
    OUTLINED_FUNCTION_76((uint64_t)v4 + qword_1ED7E0D00, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
    LOBYTE(v31[0]) = v26;
    v25 = v29(v28, v30, v1, v31);
    v32[1] = v15;
    v32[2] = v25;
    v32[0] = v13;
    OUTLINED_FUNCTION_7_0();
    sub_1C2F245BC();
    OUTLINED_FUNCTION_20();
    sub_1C2F245D4();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F0A998(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  OUTLINED_FUNCTION_102();
  v5 = swift_dynamicCastClass();
  if (!v5
    || (v6 = (void *)v5,
        v2 = a1,
        sub_1C2F0B6D8(v6),
        LOBYTE(v6) = v7,
        v2,
        (v6 & 1) == 0))
  {
    sub_1C2F130E8(a1);
    v9 = v8;
    if (((*(uint64_t (**)(void))(*(_QWORD *)v8 + 120))() & 1) != 0)
    {
      v10 = (v1 + qword_1ED7E0D00);
      v11 = a1;
      OUTLINED_FUNCTION_39();
      v12 = OUTLINED_FUNCTION_24();
      if (OUTLINED_FUNCTION_9_0(v12))
      {
        v13 = (uint8_t *)OUTLINED_FUNCTION_3();
        v14 = OUTLINED_FUNCTION_3();
        v16 = v14;
        *(_DWORD *)v13 = 136315138;
        v15 = OUTLINED_FUNCTION_81(v14, sel_debugDescription);
        sub_1C2F24604();
        OUTLINED_FUNCTION_91();
        sub_1C2F08778(v3, 0xCuLL, &v16);
        OUTLINED_FUNCTION_54();

        OUTLINED_FUNCTION_51();
        OUTLINED_FUNCTION_19(&dword_1C2F05000, v10, (os_log_type_t)v2, "Could not find a handler for message: %s", v13);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_0();
      }

    }
    else
    {
      (*(void (**)(uint64_t, void *))(*(_QWORD *)v9 + 104))(v1, a1);
    }
    swift_release();
  }
}

uint64_t sub_1C2F0AB88(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  sub_1C2F0DF84();
  swift_allocError();
  *v4 = a1;
  v4[1] = a2;
  OUTLINED_FUNCTION_4();
  return swift_willThrow();
}

uint64_t sub_1C2F0ABE4()
{
  return OUTLINED_FUNCTION_85();
}

void sub_1C2F0ABF8()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(id, id);
  void (*v11)(id, id);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  os_log_type_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD *v60;
  _QWORD *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  char *v79;
  id v80;
  uint64_t v81;
  void (*v82)(id, id);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint8_t *v88;
  uint64_t v89;
  NSObject v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)();
  _QWORD *v94;
  uint64_t v95;

  OUTLINED_FUNCTION_5_1();
  v2 = v0;
  v4 = v3;
  v84 = v6;
  v85 = v5;
  v86 = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v90.isa = v0->isa;
  v16 = OUTLINED_FUNCTION_45();
  v88 = *(uint8_t **)(v16 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = OUTLINED_FUNCTION_46();
  v87 = *(_QWORD *)(v89 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_19_0();
  v21 = objc_msgSend(v15, sel_refId);
  if (v21)
  {
    v22 = v21;
    v81 = v16;
    v82 = v11;
    v83 = v9;
    v23 = sub_1C2F24604();
    v25 = v24;

    sub_1C2F0A298();
    if (v26)
    {
      v80 = v13;
      v27 = swift_dynamicCastClass();
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)(v27 + 64) == v23 && *(_QWORD *)(v27 + 72) == v25;
        if (v29 || (OUTLINED_FUNCTION_68() & 1) != 0)
        {
          v79 = v19;
          OUTLINED_FUNCTION_16_0();
          sub_1C2F244C0();
          v30 = OUTLINED_FUNCTION_44();
          if (OUTLINED_FUNCTION_67(v30))
          {
            *(_WORD *)OUTLINED_FUNCTION_3() = 0;
            OUTLINED_FUNCTION_43(&dword_1C2F05000, v31, v32, "Handling command through activeRequestProcessor");
            OUTLINED_FUNCTION_0();
          }

          v33 = *(void **)(v28 + 88);
          v77 = *(id *)(v28 + 80);
          v78 = v33;
          v34 = (_QWORD *)OUTLINED_FUNCTION_48();
          v35 = OUTLINED_FUNCTION_35(v34);
          v36 = v80;
          v35[8] = v15;
          v35[9] = v36;
          v35[10] = v82;
          v35[11] = v23;
          v93 = sub_1C2F0DFD0;
          v94 = v35;
          v91 = MEMORY[0x1E0C809B0];
          v92 = 1107296256;
          v37 = OUTLINED_FUNCTION_96((uint64_t)sub_1C2F0B2C8);
          v38 = v77;
          v39 = v33;
          OUTLINED_FUNCTION_49();
          OUTLINED_FUNCTION_20();
          v40 = v15;
          v41 = v36;
          OUTLINED_FUNCTION_95();
          sub_1C2F24508();
          OUTLINED_FUNCTION_93(MEMORY[0x1E0DEE9D8]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
          OUTLINED_FUNCTION_30();
          v42 = v79;
          v43 = v81;
          sub_1C2F248EC();
          MEMORY[0x1C3BCD11C](v78, v1, v42, v37);
          _Block_release(v37);
          OUTLINED_FUNCTION_33();

          (*((void (**)(char *, uint64_t))v88 + 1))(v42, v43);
          (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v1, v89);
          swift_release();
          goto LABEL_26;
        }
      }
      OUTLINED_FUNCTION_33();
      v13 = v80;
    }
    sub_1C2F0A378();
    v52 = OUTLINED_FUNCTION_56(v23, v25);
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_12_0();
    if (v52)
    {
      v53 = v13;
      v54 = swift_dynamicCastClass();
      if (v54)
      {
        v55 = v54;
        sub_1C2F244C0();
        v56 = OUTLINED_FUNCTION_44();
        if (OUTLINED_FUNCTION_67(v56))
        {
          *(_WORD *)OUTLINED_FUNCTION_3() = 0;
          OUTLINED_FUNCTION_43(&dword_1C2F05000, v57, v58, "Handling command through candidateRequestProcessor");
          OUTLINED_FUNCTION_0();
        }

        v59 = *(void **)(v55 + 88);
        v80 = *(id *)(v55 + 80);
        v60 = (_QWORD *)OUTLINED_FUNCTION_48();
        v61 = OUTLINED_FUNCTION_35(v60);
        v61[8] = v15;
        v61[9] = v53;
        v61[10] = v82;
        v61[11] = v23;
        v93 = sub_1C2F0DFD0;
        v94 = v61;
        v91 = MEMORY[0x1E0C809B0];
        v92 = 1107296256;
        OUTLINED_FUNCTION_96((uint64_t)sub_1C2F0B2C8);
        OUTLINED_FUNCTION_49();
        v62 = v15;
        v63 = v53;
        OUTLINED_FUNCTION_95();
        v64 = v80;
        v65 = v59;
        OUTLINED_FUNCTION_20();
        sub_1C2F24508();
        OUTLINED_FUNCTION_93(MEMORY[0x1E0DEE9D8]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
        OUTLINED_FUNCTION_30();
        sub_1C2F248EC();
        OUTLINED_FUNCTION_84();
      }
      OUTLINED_FUNCTION_33();
    }
    v70 = v15;
    OUTLINED_FUNCTION_39();
    v71 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_8_0(v71))
    {
      v72 = (uint8_t *)OUTLINED_FUNCTION_3();
      v91 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_50(4.8149e-34);
      v74 = OUTLINED_FUNCTION_81(v73, sel_debugDescription);
      sub_1C2F24604();

      v95 = OUTLINED_FUNCTION_79(v75, v76, &v91);
      OUTLINED_FUNCTION_17_0();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v2, (os_log_type_t)v52, "Could not find a RequestProcessor for this command: %s", v72);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

  }
  else
  {
    v44 = ((char *)v0 + qword_1ED7E0D00);
    v45 = v15;
    OUTLINED_FUNCTION_39();
    v46 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_9_0(v46))
    {
      v47 = OUTLINED_FUNCTION_3();
      v83 = v9;
      v48 = (uint8_t *)v47;
      v49 = OUTLINED_FUNCTION_3();
      v82 = v11;
      v89 = v49;
      v91 = v49;
      *(_DWORD *)v48 = 136315138;
      v88 = v48 + 4;
      v50 = OUTLINED_FUNCTION_81(v49, sel_debugDescription);
      sub_1C2F24604();
      OUTLINED_FUNCTION_91();
      v51 = sub_1C2F08778((uint64_t)v13, 0xCuLL, &v91);
      OUTLINED_FUNCTION_15_0(v51);
      OUTLINED_FUNCTION_54();

      OUTLINED_FUNCTION_51();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v44, (os_log_type_t)v16, "Could not find a refId on this command: %s", v48);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    v68 = type metadata accessor for CandidateRequestAwareBridgeBase(0, *((_QWORD *)v90.isa + 41), v66, v67);
    v69 = MEMORY[0x1C3BCD794](&protocol conformance descriptor for MessageDispatchingBridgeBase<A>, v68);
    Bridge.defaultHandle(_:executionContextInfo:reply:)(v4, (uint64_t)v13, v11, v9, v68, v69);
  }
LABEL_26:
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F0B2CC(void *a1, uint64_t a2, void (*a3)(id, id), uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v9 = *v4;
  sub_1C2F0ABF8();
  if ((v12 & 1) == 0)
  {
    v13 = type metadata accessor for CandidateRequestAwareBridgeBase(0, *(_QWORD *)(v9 + 328), v10, v11);
    v14 = MEMORY[0x1C3BCD794](&protocol conformance descriptor for MessageDispatchingBridgeBase<A>, v13);
    Bridge.defaultHandle(_:executionContextInfo:reply:)(a1, a2, a3, a4, v13, v14);
  }
}

void sub_1C2F0B35C()
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_5_1();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v24 = *(_QWORD *)(OUTLINED_FUNCTION_45() - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v15);
  v16 = OUTLINED_FUNCTION_25();
  v22 = *(_QWORD *)(v16 - 8);
  v23 = v16;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_55();
  v21 = *(_QWORD *)(v12 + 88);
  v18 = (_QWORD *)OUTLINED_FUNCTION_48();
  v18[2] = v6;
  v18[3] = v4;
  v18[4] = v10;
  v18[5] = v8;
  v18[6] = v14;
  v18[7] = v0;
  v19 = OUTLINED_FUNCTION_97((uint64_t)sub_1C2F0B2C8);
  swift_retain();
  v20 = v14;
  OUTLINED_FUNCTION_49();
  sub_1C2F24508();
  sub_1C2F0DFFC();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1C3BCD11C](v21, v2, v1, v19);
  _Block_release(v19);
  OUTLINED_FUNCTION_82(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v2, v23);
  swift_release();
  OUTLINED_FUNCTION_3_1();
}

uint64_t sub_1C2F0B4BC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void sub_1C2F0B6D8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  sub_1C2F130E8(a1);
  v4 = v3;
  v5 = (v1 + qword_1ED7E0D00);
  v6 = a1;
  OUTLINED_FUNCTION_64();
  v7 = v6;
  sub_1C2F244C0();
  v8 = OUTLINED_FUNCTION_24();
  if (os_log_type_enabled(v5, v8))
  {
    v9 = OUTLINED_FUNCTION_3();
    v10 = (_QWORD *)OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    *(_DWORD *)v9 = 138412546;
    v11 = v7;
    sub_1C2F248C8();
    *v10 = v7;

    *(_WORD *)(v9 + 12) = 2080;
    __asm { BR              X10 }
  }
  OUTLINED_FUNCTION_13();

  __asm { BR              X10 }
}

uint64_t sub_1C2F0B94C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31[14];

  sub_1C2F0A298();
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v1 + 64);
    v3 = *(_QWORD *)(v1 + 72);
    sub_1C2F24598();
    if (v4 == OUTLINED_FUNCTION_57() && v3 == v5)
    {
      OUTLINED_FUNCTION_63();
    }
    else
    {
      v7 = OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_12_0();
      if ((v7 & 1) == 0 && ((*(uint64_t (**)(void *))(*(_QWORD *)v2 + 224))(v0) & 1) == 0)
      {
        swift_release();
        goto LABEL_9;
      }
    }
    sub_1C2F0DAF4();
    v13 = v15;
    OUTLINED_FUNCTION_33();
    goto LABEL_11;
  }
LABEL_9:
  v8 = OUTLINED_FUNCTION_57();
  v10 = v9;
  sub_1C2F0A378();
  v11 = OUTLINED_FUNCTION_56(v8, v10);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_12_0();
  if (v11)
  {
    sub_1C2F0DAF4();
    v13 = v12;
    OUTLINED_FUNCTION_60();
LABEL_11:
    swift_release();
    return v13 & 1;
  }
  sub_1C2F0A378();
  v17 = v16;
  v18 = v0;
  sub_1C2F0BCB8(v17, v18);
  v20 = v19;
  OUTLINED_FUNCTION_7();
  if (v20)
  {
    sub_1C2F0DAF4();
    v13 = v21;
    OUTLINED_FUNCTION_60();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = v18;
    v23 = sub_1C2F244C0();
    v24 = sub_1C2F247F0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = OUTLINED_FUNCTION_3();
      v31[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v25 = 136315394;
      v26 = objc_msgSend(v22, sel_debugDescription);
      sub_1C2F24604();

      OUTLINED_FUNCTION_77(v27, v28, v31);
      OUTLINED_FUNCTION_47();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      v29 = sub_1C2F243E8();
      sub_1C2F08778(v29, v30, v31);
      OUTLINED_FUNCTION_47();

      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v23, v24, "Could not find a RequestProcessor for message: %s with requestId: %s", (uint8_t *)v25);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_60();
    v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1C2F0BCB8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *);
  _QWORD v17[5];

  sub_1C2F1CCCC(v17);
  v3 = v17[0];
  v4 = v17[1];
  v5 = v17[3];
  v6 = v17[4];
  v7 = (unint64_t)(v17[2] + 64) >> 6;
  result = sub_1C2F24598();
  if (!v6)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v5 << 6);
  while (1)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v16 = *(uint64_t (**)(void *))(**(_QWORD **)(*(_QWORD *)(v3 + 56) + 8 * v10) + 224);
    sub_1C2F24598();
    swift_retain();
    if ((v16(a2) & 1) != 0)
    {

      swift_release();
      return v15;
    }
    swift_release();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v11 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v11 >= v7)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    v13 = v5 + 1;
    if (!v12)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v7)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v13);
      if (!v12)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v7)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (!v12)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v7)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (!v12)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v7)
              goto LABEL_23;
            v12 = *(_QWORD *)(v4 + 8 * v13);
            if (!v12)
            {
              v14 = v5 + 6;
              while (v14 < v7)
              {
                v12 = *(_QWORD *)(v4 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
LABEL_23:

              swift_release();
              return 0;
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v5 = v13;
  }
  __break(1u);
  return result;
}

void sub_1C2F0BE64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  os_log_type_t v40;
  os_log_type_t v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void (*isa)(uint64_t, uint64_t);
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint8_t *v88;
  uint64_t v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  uint64_t (*v95)();
  uint64_t v96;
  uint64_t v97;

  OUTLINED_FUNCTION_5_1();
  v89 = v1;
  v3 = v2;
  v4 = sub_1C2F24538();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v73 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v74 = (char *)&v71 - v8;
  v9 = OUTLINED_FUNCTION_34();
  v77 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_4_0();
  v72 = v11;
  v81 = sub_1C2F24388();
  v80 = *(_QWORD *)(v81 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_4_0();
  v82 = v13;
  v14 = OUTLINED_FUNCTION_45();
  v15 = *(uint8_t **)(v14 - 8);
  v87 = v14;
  v88 = v15;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_4_0();
  v84 = v17;
  v18 = OUTLINED_FUNCTION_46();
  v85 = *(_QWORD *)(v18 - 8);
  v86 = v18;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_4_0();
  v83 = v20;
  v92 = v0;
  v21 = (v0 + qword_1ED7E0D00);
  v22 = v3;
  v91 = v21;
  sub_1C2F244C0();
  v23 = OUTLINED_FUNCTION_24();
  v24 = os_log_type_enabled(v21, v23);
  v76 = v4;
  v75 = v5;
  v79 = v9;
  if (v24)
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_QWORD *)&v93 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v25 = 136315138;
    swift_getObjectType();
    v26 = OUTLINED_FUNCTION_52();
    v28 = OUTLINED_FUNCTION_78(v26, v27);
    OUTLINED_FUNCTION_15_0(v28);
    sub_1C2F248C8();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v21, v23, "Starting active request with message: %s", v25);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  v29 = v92;
  v30 = sub_1C2F243E8();
  OUTLINED_FUNCTION_89();
  v32 = v31;
  OUTLINED_FUNCTION_42();
  v33 = sub_1C2F0A6D4(v30, v5, v32);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7();
  v90 = v22;
  if (v33)
  {
    swift_bridgeObjectRetain_n();
    OUTLINED_FUNCTION_38();
    v34 = OUTLINED_FUNCTION_24();
    v35 = OUTLINED_FUNCTION_9_0(v34);
    v78 = v30;
    if (v35)
    {
      v36 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_QWORD *)&v93 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v36 = 136315138;
      OUTLINED_FUNCTION_42();
      v37 = sub_1C2F08778(v30, v5, (uint64_t *)&v93);
      OUTLINED_FUNCTION_15_0(v37);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v22, (os_log_type_t)v4, "Found an existing candidate RequestProcessor for requestId: %s", v36);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

    v95 = sub_1C2F0E92C;
    v96 = v33;
    *(_QWORD *)&v93 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v93 + 1) = 1107296256;
    *(_QWORD *)&v94 = sub_1C2F0B2C8;
    *((_QWORD *)&v94 + 1) = &block_descriptor_35;
    _Block_copy(&v93);
    OUTLINED_FUNCTION_20();
    sub_1C2F24508();
    OUTLINED_FUNCTION_93(MEMORY[0x1E0DEE9D8]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
    OUTLINED_FUNCTION_30();
    sub_1C2F248EC();
    OUTLINED_FUNCTION_84();
  }
  v97 = (uint64_t)v22;
  OUTLINED_FUNCTION_102();
  v38 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0B38);
  if (OUTLINED_FUNCTION_101())
  {
    __swift_project_boxed_opaque_existential_1(&v93, *((uint64_t *)&v94 + 1));
    v39 = sub_1C2F2443C();
    v41 = v40;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v93);
  }
  else
  {
    v95 = 0;
    v93 = 0u;
    v94 = 0u;
    sub_1C2F0E72C((uint64_t)&v93);
    v39 = OUTLINED_FUNCTION_57();
    v41 = v51;
  }
  v52 = sub_1C2F2440C();
  v54 = v53;
  v55 = v82;
  sub_1C2F24400();
  v56 = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_59(v56, v57, v52, v54, (uint64_t)v55, 0, v39, v58);
  if (v38)
  {
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_38();
    v59 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_8_0(v59))
    {
      v60 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_QWORD *)&v93 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_50(4.8149e-34);
      v97 = (uint64_t)v38;
      OUTLINED_FUNCTION_31();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09C0);
      v61 = sub_1C2F24634();
      v97 = OUTLINED_FUNCTION_78(v61, v62);
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_51();
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v55, v41, "Could not create RequestProcessor because: %s", v60);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_11_0();

    OUTLINED_FUNCTION_11_0();
    OUTLINED_FUNCTION_11_0();
  }
  else
  {
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_36();
    v42 = v90;
    sub_1C2F0A298();
    if (v43)
    {
      v44 = v43;
      if (*(_BYTE *)(v29 + qword_1ED7E0890) != 1)
        goto LABEL_23;
      OUTLINED_FUNCTION_64();
      v45 = OUTLINED_FUNCTION_38();
      v46 = sub_1C2F247E4();
      if (OUTLINED_FUNCTION_66(v46))
      {
        v47 = (uint8_t *)OUTLINED_FUNCTION_3();
        *(_QWORD *)&v93 = OUTLINED_FUNCTION_3();
        *(_DWORD *)v47 = 136315138;
        v88 = v47 + 4;
        sub_1C2F0A18C(v72);
        v48 = sub_1C2F24634();
        v50 = OUTLINED_FUNCTION_78(v48, v49);
        OUTLINED_FUNCTION_15_0(v50);
        sub_1C2F248C8();
        OUTLINED_FUNCTION_13();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_19(&dword_1C2F05000, v45, v42, "Will wait up to %s for the current active request to finish", v47);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_13();

      OUTLINED_FUNCTION_22_0();
      v63 = v72;
      v64 = *(NSObject **)(v44 + 88);
      sub_1C2F2452C();
      v88 = (uint8_t *)v44;
      sub_1C2F0A18C(v63);
      MEMORY[0x1C3BCCE10](v52, v63);
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v63, v79);
      isa = (void (*)(uint64_t, uint64_t))v45[1].isa;
      isa(v52, v54);
      sub_1C2F24820();
      isa(v5, v54);
      if ((sub_1C2F244F0() & 1) != 0)
      {
        OUTLINED_FUNCTION_64();
        OUTLINED_FUNCTION_38();
        v66 = OUTLINED_FUNCTION_71();
        if (os_log_type_enabled(v64, v66))
        {
          v67 = (uint8_t *)OUTLINED_FUNCTION_3();
          *(_QWORD *)&v93 = OUTLINED_FUNCTION_3();
          *(_DWORD *)v67 = 136315138;
          v68 = sub_1C2F24598();
          v97 = OUTLINED_FUNCTION_77(v68, v69, (uint64_t *)&v93);
          sub_1C2F248C8();
          OUTLINED_FUNCTION_13();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_19(&dword_1C2F05000, v64, v66, "Timed out waiting for ActiveRequestProcessor with requestId: %s to finish processing.", v67);
          OUTLINED_FUNCTION_17();
          OUTLINED_FUNCTION_0();
        }
        swift_release_n();

      }
      else
      {
LABEL_23:
        swift_release();
      }
    }
    v70 = swift_retain();
    sub_1C2F0A2D4(v70);
    sub_1C2F0DAF4();
    OUTLINED_FUNCTION_60();
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F0C7D8()
{
  NSObject *v0;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  os_log_type_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47[6];
  uint64_t v48;

  OUTLINED_FUNCTION_5_1();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_45();
  v46 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_4_0();
  v45 = v9;
  v44 = *(_QWORD *)(OUTLINED_FUNCTION_46() - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_4_0();
  v11 = v6;
  OUTLINED_FUNCTION_87();
  v12 = OUTLINED_FUNCTION_24();
  if (OUTLINED_FUNCTION_9_0(v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_3();
    v47[0] = OUTLINED_FUNCTION_3();
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    v14 = OUTLINED_FUNCTION_52();
    v16 = sub_1C2F08778(v14, v15, v47);
    OUTLINED_FUNCTION_72(v16);
    sub_1C2F248C8();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v6, v1, "Ending active request with message: %s", v13);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  sub_1C2F0A298();
  if (!v17)
    goto LABEL_10;
  v18 = v17;
  if (OUTLINED_FUNCTION_75() == *(_QWORD *)(v17 + 64) && v19 == *(_QWORD *)(v18 + 72))
  {
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    v21 = OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_12_0();
    if ((v21 & 1) == 0)
    {
      OUTLINED_FUNCTION_83();
LABEL_10:
      v22 = v11;
      OUTLINED_FUNCTION_87();
      v23 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_53(v23))
      {
        v24 = (uint8_t *)OUTLINED_FUNCTION_3();
        v47[0] = OUTLINED_FUNCTION_3();
        *(_DWORD *)v24 = 136315138;
        v25 = OUTLINED_FUNCTION_57();
        v27 = OUTLINED_FUNCTION_69(v25, v26);
        OUTLINED_FUNCTION_72(v27);
        OUTLINED_FUNCTION_54();

        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_19(&dword_1C2F05000, v2, v1, "Active RequestProcessor for requestId: %s could not be found", v24);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_0();
      }

      goto LABEL_20;
    }
  }
  sub_1C2F0DAF4();
  v28 = OUTLINED_FUNCTION_75();
  v30 = v29;
  if (*((_BYTE *)&v2->isa + qword_1ED7E0890) == 1)
  {
    v31 = v28;
    v32 = (_QWORD *)OUTLINED_FUNCTION_48();
    v32[2] = v31;
    v32[3] = v30;
    v32[4] = v2;
    v32[5] = v11;
    v47[4] = (uint64_t)sub_1C2F0E920;
    v47[5] = (uint64_t)v32;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 1107296256;
    v47[2] = (uint64_t)sub_1C2F0B2C8;
    v47[3] = (uint64_t)&block_descriptor_32;
    v33 = _Block_copy(v47);
    v34 = v11;
    swift_retain();
    sub_1C2F24508();
    v48 = MEMORY[0x1E0DEE9D8];
    sub_1C2F0DFFC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
    OUTLINED_FUNCTION_30();
    sub_1C2F248EC();
    sub_1C2F2482C();
    _Block_release(v33);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v7);
    OUTLINED_FUNCTION_90(v44);
    OUTLINED_FUNCTION_83();
  }
  else
  {
    OUTLINED_FUNCTION_12_0();
    v35 = v11;
    OUTLINED_FUNCTION_64();
    v36 = v35;
    v37 = OUTLINED_FUNCTION_87();
    v38 = sub_1C2F247E4();
    if (OUTLINED_FUNCTION_66(v38))
    {
      v39 = OUTLINED_FUNCTION_3();
      v47[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v39 = 136315394;
      v40 = OUTLINED_FUNCTION_75();
      v48 = OUTLINED_FUNCTION_69(v40, v41);
      sub_1C2F248C8();

      OUTLINED_FUNCTION_12_0();
      *(_WORD *)(v39 + 12) = 2080;
      v42 = sub_1C2F24598();
      v48 = OUTLINED_FUNCTION_79(v42, v43, v47);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_13();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v37, v4, "Deiniting RequestProcessor with requestId %s for bridge %s", (uint8_t *)v39);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_13();

    sub_1C2F0A2D4(0);
  }
  swift_release();
LABEL_20:
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F0CD14(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  NSObject *oslog;
  uint64_t v27;

  sub_1C2F0A298();
  if (!v8)
    goto LABEL_7;
  v10 = *(_QWORD *)(v8 + 64);
  v9 = *(_QWORD *)(v8 + 72);
  sub_1C2F24598();
  swift_release();
  if (v10 == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
LABEL_7:
      swift_bridgeObjectRetain_n();
      oslog = sub_1C2F244C0();
      v13 = sub_1C2F247E4();
      if (os_log_type_enabled(oslog, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = swift_slowAlloc();
        v27 = v15;
        *(_DWORD *)v14 = 136315138;
        sub_1C2F24598();
        sub_1C2F08778(a1, a2, &v27);
        sub_1C2F248C8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C2F05000, oslog, v13, "RequestProcessor with requestId:%s has already been replaced or deinited", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BCD824](v15, -1, -1);
        MEMORY[0x1C3BCD824](v14, -1, -1);

      }
      else
      {
        swift_bridgeObjectRelease_n();

      }
      return;
    }
  }
  v16 = a4;
  swift_retain_n();
  v17 = v16;
  v18 = sub_1C2F244C0();
  v19 = sub_1C2F247E4();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v27 = v21;
    *(_DWORD *)v20 = 136315394;
    v22 = sub_1C2F243E8();
    sub_1C2F08778(v22, v23, &v27);
    sub_1C2F248C8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2080;
    v24 = *(_QWORD *)(a3 + 16);
    v25 = *(_QWORD *)(a3 + 24);
    sub_1C2F24598();
    sub_1C2F08778(v24, v25, &v27);
    sub_1C2F248C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F05000, v18, v19, "Deiniting RequestProcessor with requestId %s for bridge %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BCD824](v21, -1, -1);
    MEMORY[0x1C3BCD824](v20, -1, -1);
  }
  else
  {
    swift_release_n();

  }
  sub_1C2F0A2D4(0);
}

uint64_t sub_1C2F0D0B0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_49();
  v1(v2);
  return swift_release();
}

void sub_1C2F0D0D8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  os_log_type_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  OUTLINED_FUNCTION_5_1();
  v2 = v0;
  v4 = v3;
  sub_1C2F24388();
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_0();
  v37 = v6;
  v7 = (v2 + qword_1ED7E0D00);
  v8 = v4;
  sub_1C2F244C0();
  v9 = OUTLINED_FUNCTION_24();
  if (os_log_type_enabled(v7, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_QWORD *)&v38 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v10 = 136315138;
    swift_getObjectType();
    v11 = OUTLINED_FUNCTION_52();
    sub_1C2F08778(v11, v12, (uint64_t *)&v38);
    sub_1C2F248C8();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v7, v9, "Starting candidate request with message: %s", v10);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  v13 = sub_1C2F243E8();
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_42();
  v14 = OUTLINED_FUNCTION_56(v13, v1);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0();
  if (v14)
  {
    v15 = v8;
    OUTLINED_FUNCTION_42();
    sub_1C2F244C0();
    v16 = OUTLINED_FUNCTION_26();
    if (os_log_type_enabled(v7, v16))
    {
      v17 = OUTLINED_FUNCTION_3();
      v36 = (_QWORD *)OUTLINED_FUNCTION_3();
      *(_QWORD *)&v38 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v17 = 138412546;
      v35 = v13;
      v18 = v15;
      sub_1C2F248C8();
      *v36 = v15;

      *(_WORD *)(v17 + 12) = 2080;
      OUTLINED_FUNCTION_42();
      sub_1C2F08778(v35, v1, (uint64_t *)&v38);
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v7, v16, "Not creating a CandidateRequestProcessor for message: %@ because there is already a candidate request started with requestId: %s", (uint8_t *)v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

    sub_1C2F0DAF4();
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_102();
  v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0B38);
  v19 = v13;
  if (OUTLINED_FUNCTION_101())
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    v20 = sub_1C2F2443C();
    v22 = v21;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v38);
  }
  else
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    sub_1C2F0E72C((uint64_t)&v38);
    v20 = OUTLINED_FUNCTION_80();
    v22 = v23;
  }
  v24 = sub_1C2F2440C();
  v26 = v25;
  sub_1C2F24400();
  v27 = OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_59(v27, v28, v24, v26, (uint64_t)v37, 1, v20, v29);
  if (!v20)
  {
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_7_0();
    v34 = swift_retain();
    sub_1C2F0E6B0(v34, v19, v1);
    swift_endAccess();
    OUTLINED_FUNCTION_16_0();
    sub_1C2F0DAF4();
LABEL_9:
    swift_release();
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_38();
  v30 = OUTLINED_FUNCTION_26();
  if (OUTLINED_FUNCTION_8_0(v30))
  {
    v31 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_QWORD *)&v38 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_50(4.8149e-34);
    OUTLINED_FUNCTION_31();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09C0);
    v32 = sub_1C2F24634();
    sub_1C2F08778(v32, v33, (uint64_t *)&v38);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_11_0();
    OUTLINED_FUNCTION_11_0();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v37, v22, "Could not create RequestProcessor because: %s", v31);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_11_0();

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_11_0();
LABEL_16:
  OUTLINED_FUNCTION_3_1();
}

uint64_t sub_1C2F0D65C(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  id v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  os_log_type_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25[3];
  uint64_t v26;

  v2 = ((char *)v1 + qword_1ED7E0D00);
  v3 = a1;
  sub_1C2F244C0();
  v4 = OUTLINED_FUNCTION_24();
  if (os_log_type_enabled(v2, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_3();
    v25[0] = OUTLINED_FUNCTION_3();
    *(_DWORD *)v5 = 136315138;
    swift_getObjectType();
    v6 = OUTLINED_FUNCTION_52();
    sub_1C2F08778(v6, v7, v25);
    OUTLINED_FUNCTION_74();
    sub_1C2F248C8();

    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v2, v4, "Ending candidate request with message: %s", v5);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  v8 = OUTLINED_FUNCTION_80();
  v10 = v9;
  sub_1C2F0A378();
  v11 = OUTLINED_FUNCTION_56(v8, v10);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_0();
  if (v11)
  {
    sub_1C2F0DAF4();
    v13 = v12;
    v14 = OUTLINED_FUNCTION_80();
    v16 = v15;
    OUTLINED_FUNCTION_7_0();
    sub_1C2F0E5A8(v14, v16);
    swift_endAccess();
    swift_release();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_100();
  }
  else
  {
    v17 = v3;
    sub_1C2F244C0();
    v18 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_53(v18))
    {
      v19 = OUTLINED_FUNCTION_3();
      v20 = (_QWORD *)OUTLINED_FUNCTION_3();
      v25[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v19 = 138412546;
      v26 = (uint64_t)v17;
      v21 = v17;
      sub_1C2F248C8();
      *v20 = v17;

      *(_WORD *)(v19 + 12) = 2080;
      v22 = sub_1C2F243E8();
      v26 = sub_1C2F08778(v22, v23, v25);
      sub_1C2F248C8();

      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v1, (os_log_type_t)v3, "Received finisher message: %@ while there is no CandidateRequestProcessor for requestId: %s", (uint8_t *)v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1C2F0D9A4(void *a1, NSObject *a2)
{
  char v4;
  os_log_type_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;

  sub_1C2F0C7D8();
  if ((v4 & 1) != 0)
  {
    sub_1C2F244C0();
    v5 = OUTLINED_FUNCTION_44();
    if (os_log_type_enabled(a2, v5))
    {
      *(_WORD *)OUTLINED_FUNCTION_3() = 0;
      v6 = "Ended an active request";
      v7 = a2;
      v8 = v5;
LABEL_7:
      OUTLINED_FUNCTION_73(&dword_1C2F05000, v7, v8, v6);
      goto LABEL_11;
    }
LABEL_8:
    v12 = 1;
    goto LABEL_13;
  }
  v9 = sub_1C2F0D65C(a1);
  sub_1C2F244C0();
  v10 = OUTLINED_FUNCTION_44();
  v11 = os_log_type_enabled(a2, v10);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      *(_WORD *)OUTLINED_FUNCTION_3() = 0;
      v8 = v10;
      v6 = "Ended a candidate request";
      v7 = a2;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  if (v11)
  {
    *(_WORD *)OUTLINED_FUNCTION_3() = 0;
    OUTLINED_FUNCTION_73(&dword_1C2F05000, a2, v10, "Could not find a RequestProcessor to end the request");
LABEL_11:
    OUTLINED_FUNCTION_0();
  }
  v12 = 0;
LABEL_13:

  return v12;
}

void sub_1C2F0DAF4()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  Class isa;
  uint64_t v10;
  uint64_t v11;
  id v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  const char *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  os_log_type_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_45();
  isa = v8[-1].isa;
  MEMORY[0x1E0C80A78](v8);
  v10 = OUTLINED_FUNCTION_25();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_55();
  if (((*(uint64_t (**)(void))(*(_QWORD *)v7 + 120))() & 1) != 0)
  {
    v12 = v3;
    OUTLINED_FUNCTION_39();
    v13 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_8_0(v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_3();
      v15 = (_QWORD *)OUTLINED_FUNCTION_3();
      v16 = OUTLINED_FUNCTION_23_0(5.7779e-34);
      OUTLINED_FUNCTION_17_0();
      *v15 = v0;

      v17 = "Message %@ is not registered properly";
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (((*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v7 + 128))(v3, v5) & 1) == 0)
  {
    v21 = v3;
    OUTLINED_FUNCTION_39();
    v22 = OUTLINED_FUNCTION_44();
    if (OUTLINED_FUNCTION_8_0(v22))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_3();
      v23 = (_QWORD *)OUTLINED_FUNCTION_3();
      v24 = OUTLINED_FUNCTION_23_0(5.7779e-34);
      OUTLINED_FUNCTION_17_0();
      *v23 = v0;

      v17 = "RequestProcessor cannot handle message: %@";
LABEL_8:
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v8, (os_log_type_t)v10, v17, v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_9;
  }
  v25 = *(_QWORD *)(v5 + 88);
  v18 = (_QWORD *)OUTLINED_FUNCTION_48();
  v18[2] = v7;
  v18[3] = v5;
  v18[4] = v3;
  v19 = OUTLINED_FUNCTION_97((uint64_t)sub_1C2F0B2C8);
  OUTLINED_FUNCTION_49();
  swift_retain();
  v20 = v3;
  sub_1C2F24508();
  sub_1C2F0DFFC();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1C3BCD11C](v25, v1, v0, v19);
  _Block_release(v19);
  OUTLINED_FUNCTION_82(*((uint64_t (**)(uint64_t, uint64_t))isa + 1));
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v10);
  swift_release();
LABEL_10:
  OUTLINED_FUNCTION_3_1();
}

void CandidateRequestAwareBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  swift_allocObject();
  OUTLINED_FUNCTION_65();
  __break(1u);
}

void CandidateRequestAwareBridgeBase.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_65();
  __break(1u);
}

uint64_t sub_1C2F0DE10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_1ED7E0D20;
  v2 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t CandidateRequestAwareBridgeBase.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  MessageDispatchingBridgeBase.deinit();
  v1 = v0;
  v2 = v0 + qword_1ED7E0D20;
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t CandidateRequestAwareBridgeBase.__deallocating_deinit()
{
  CandidateRequestAwareBridgeBase.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F0DEF0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 464))();
}

uint64_t sub_1C2F0DF18()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 472))();
}

uint64_t static RequestProcessorCreationError.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1C2F24A3C();
}

unint64_t sub_1C2F0DF84()
{
  unint64_t result;

  result = qword_1EF7D6498;
  if (!qword_1EF7D6498)
  {
    result = MEMORY[0x1C3BCD794](&protocol conformance descriptor for RequestProcessorCreationError, &type metadata for RequestProcessorCreationError);
    atomic_store(result, (unint64_t *)&qword_1EF7D6498);
  }
  return result;
}

uint64_t type metadata accessor for CandidateRequestAwareBridgeBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CandidateRequestAwareBridgeBase);
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

uint64_t sub_1C2F0DFEC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_1C2F0DFFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E0510;
  if (!qword_1ED7E0510)
  {
    v1 = sub_1C2F244FC();
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E0510);
  }
  return result;
}

unint64_t sub_1C2F0E03C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E0530;
  if (!qword_1ED7E0530)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED7E0520);
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E0530);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCD788](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  swift_release();

  if (*(_QWORD *)(v0 + 80))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2F0E114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(uint64_t (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 56));
  v5(v1, v2, v3, v4);
  return swift_release();
}

uint64_t sub_1C2F0E174()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2F0E1A8()
{
  uint64_t v0;

  return sub_1C2F0B4BC(*(uint64_t (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_1C2F0E1B8(uint64_t a1@<X8>)
{
  sub_1C2F0A18C(a1);
  OUTLINED_FUNCTION_23();
}

_QWORD *sub_1C2F0E1DC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_1C2F0E1E8(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1C2F0A298();
  *a1 = v2;
  OUTLINED_FUNCTION_23();
}

void sub_1C2F0E214(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_1C2F0A378();
  *a1 = v2;
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F0E244()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244E4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CandidateRequestAwareBridgeBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.previousProcessorTimeout.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.registerMessageHandler<A, B>(_:messageHandlerType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:)()
{
  return OUTLINED_FUNCTION_85();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:rootRequestId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.tryToDispatchCommandToRequestProcessor<A, B>(_:executionContextInfo:reply:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.dispatchCommandToRequestProcessor<A, B>(_:executionContextInfo:reply:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.dispatchAsync<A, B>(message:toRequestProcessor:usingHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

_QWORD *initializeBufferWithCopyOfBuffer for RequestProcessorCreationError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1C2F24598();
  return a1;
}

uint64_t destroy for RequestProcessorCreationError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for RequestProcessorCreationError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_1C2F24598();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for RequestProcessorCreationError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestProcessorCreationError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RequestProcessorCreationError(uint64_t result, int a2, int a3)
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

uint64_t sub_1C2F0E4EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for RequestProcessorCreationError()
{
  return &type metadata for RequestProcessorCreationError;
}

uint64_t dispatch thunk of RequestProcessorFactory.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

uint64_t dispatch thunk of RequestProcessorFactory.createRequestProcessor(withRequestId:assistantId:sessionId:isCandidateRequest:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 16))(a1, a2);
}

uint64_t sub_1C2F0E548()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_1C2F0E57C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v0 + 16) + 104))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F0E5A8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  sub_1C2F24598();
  v6 = sub_1C2F10650(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D6500);
  sub_1C2F249D0();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v6);
  type metadata accessor for RequestProcessorBase();
  sub_1C2F249DC();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1C2F0E6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1C2F0E790(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2F0E72C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0C00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1C2F0E790(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1C2F10650(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D6500);
  if ((sub_1C2F249D0() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C2F10650(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1C2F24A54();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_release();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1C2F0E8A4(v11, a2, a3, a1, v15);
    return sub_1C2F24598();
  }
  return result;
}

unint64_t sub_1C2F0E8A4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_1C2F0E8EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

void sub_1C2F0E920()
{
  uint64_t v0;

  sub_1C2F0CD14(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1C2F0E92C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1C3BCD728](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_8_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_9_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_11_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_1C2F248EC();
}

id OUTLINED_FUNCTION_23_0(float a1)
{
  float *v1;
  void *v2;
  uint64_t v3;

  *v1 = a1;
  *(_QWORD *)(v3 - 128) = v2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_1C2F247E4();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_1C2F24520();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1C2F247F0();
}

unint64_t OUTLINED_FUNCTION_30()
{
  return sub_1C2F0E03C();
}

id OUTLINED_FUNCTION_31()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 264) + 8))(v0, *(_QWORD *)(v1 - 256));
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_1C2F244E4();
}

_QWORD *OUTLINED_FUNCTION_35(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v3 - 200);
  result[2] = *(_QWORD *)(*(_QWORD *)(v3 - 152) + 328);
  result[3] = v4;
  v5 = *(_QWORD *)(v3 - 192);
  v6 = *(_QWORD *)(v3 - 184);
  result[4] = v1;
  result[5] = v5;
  result[6] = v6;
  result[7] = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_37(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 168) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_1C2F24598();
}

void OUTLINED_FUNCTION_43(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_1C2F247E4();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_1C2F244FC();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_1C2F24520();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_50(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_1C2F24AF0();
}

BOOL OUTLINED_FUNCTION_53(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2F0A6D4(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_1C2F243E8();
}

uint64_t OUTLINED_FUNCTION_59@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v8;

  return a8(a1, a2, a3, a4, a5, a6, a7, v8);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

BOOL OUTLINED_FUNCTION_66(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_67(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_1C2F24A3C();
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_1C2F247F0();
}

uint64_t OUTLINED_FUNCTION_72(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

void OUTLINED_FUNCTION_73(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_1C2F243E8();
}

uint64_t OUTLINED_FUNCTION_76@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_1C2F08778(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 160));
}

uint64_t OUTLINED_FUNCTION_79(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_1C2F08778(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_1C2F243E8();
}

id OUTLINED_FUNCTION_81(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_82@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_release();
}

void OUTLINED_FUNCTION_84()
{
  JUMPOUT(0x1C3BCD11CLL);
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C2F0A0A4(v0, v1 - 160);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_88()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C2F0A0A4(v0, v1 - 120);
}

void OUTLINED_FUNCTION_89()
{
  sub_1C2F0A378();
}

uint64_t OUTLINED_FUNCTION_90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

void OUTLINED_FUNCTION_91()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_92()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_93@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2F0DFFC();
}

uint64_t OUTLINED_FUNCTION_95()
{
  uint64_t v0;

  return sub_1C2F0DFEC(v0);
}

void *OUTLINED_FUNCTION_96@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

void *OUTLINED_FUNCTION_97@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_100()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_101()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return sub_1C2F243F4();
}

uint64_t ComponentIdGenerator.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ComponentIdGenerator.init()()
{
  uint64_t v0;

  return v0;
}

void sub_1C2F0EE44(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_1C2F24364();
  v4 = objc_msgSend(v2, sel_derivedIdentifierForComponent_fromSourceIdentifier_, a1, v3);

  sub_1C2F24370();
}

uint64_t ComponentIdGenerator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ComponentIdGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ComponentIdGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for ComponentIdGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ComponentIdGenerator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of ComponentIdGenerator.derivedIdentifier(for:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

id sub_1C2F0EF20()
{
  void *v0;
  objc_class *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  SEL v8;
  id v9;

  OUTLINED_FUNCTION_0_1();
  v5 = v4;
  v6 = objc_allocWithZone(v1);
  sub_1C2F245F8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0();
  v9 = objc_msgSend(v7, v8);

  return v9;
}

id sub_1C2F0EFA8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super *v5;
  SEL v6;
  id v7;
  uint64_t v9;

  OUTLINED_FUNCTION_0_1();
  sub_1C2F245F8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_1();
  v9 = type metadata accessor for EmptyBridgeConnectionListener();
  OUTLINED_FUNCTION_1_0();
  v7 = objc_msgSendSuper2(v5, v6, v1, v9);

  return v7;
}

void sub_1C2F0F148()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1C2F0F180()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmptyBridgeConnectionListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmptyBridgeConnectionListener()
{
  return objc_opt_self();
}

uint64_t sub_1C2F0F1D0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_1C2F245F8();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t InsightRequestSummaryLogger.init()()
{
  sub_1C2F10940(0, (unint64_t *)&qword_1ED7E0640);
  sub_1C2F248B0();
  return sub_1C2F244D8();
}

void InsightRequestSummaryLogger.emitDebug(_:)(uint64_t (*a1)(void), uint64_t a2)
{
  sub_1C2F0F744(a1, a2, MEMORY[0x1E0DF2290]);
}

_QWORD *static InsightRequestSummaryLogger.constructLogJsonString(_:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *result;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C2F24628();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_19_0();
  v3 = (_QWORD *)sub_1C2F24580();
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    sub_1C2F24598();
    v33 = a1;
    v5 = (uint64_t *)(a1 + 56);
    while (1)
    {
      v7 = *(v5 - 3);
      v6 = *(v5 - 2);
      v8 = *v5;
      v34 = *(v5 - 1);
      OUTLINED_FUNCTION_14_1();
      sub_1C2F24598();
      swift_isUniquelyReferenced_nonNull_native();
      v35 = v3;
      v9 = OUTLINED_FUNCTION_11_1();
      if (__OFADD__(v3[2], (v10 & 1) == 0))
      {
        __break(1u);
LABEL_20:
        __break(1u);
      }
      v11 = v9;
      v12 = v10;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0600);
      if ((sub_1C2F249D0() & 1) != 0)
      {
        v13 = OUTLINED_FUNCTION_11_1();
        if ((v12 & 1) != (v14 & 1))
        {
          result = (_QWORD *)sub_1C2F24A54();
          __break(1u);
          return result;
        }
        v11 = v13;
      }
      v3 = v35;
      if ((v12 & 1) != 0)
      {
        v15 = (_QWORD *)(v35[7] + 16 * v11);
        swift_bridgeObjectRelease();
        *v15 = v34;
        v15[1] = v8;
      }
      else
      {
        v35[(v11 >> 6) + 8] |= 1 << v11;
        v16 = (_QWORD *)(v3[6] + 16 * v11);
        *v16 = v7;
        v16[1] = v6;
        v17 = (_QWORD *)(v3[7] + 16 * v11);
        *v17 = v34;
        v17[1] = v8;
        v18 = v3[2];
        v19 = __OFADD__(v18, 1);
        v20 = v18 + 1;
        if (v19)
          goto LABEL_20;
        v3[2] = v20;
        OUTLINED_FUNCTION_14_1();
      }
      v5 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v4)
      {
        a1 = v33;
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  v21 = (void *)objc_opt_self();
  sub_1C2F24598();
  v22 = (void *)sub_1C2F2455C();
  OUTLINED_FUNCTION_12_0();
  v35 = 0;
  v23 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v22, 0, &v35);

  v24 = v35;
  if (v23)
  {
    OUTLINED_FUNCTION_12_0();
    sub_1C2F24340();

    sub_1C2F2461C();
    v25 = sub_1C2F24610();
    if (v26)
    {
      v27 = (_QWORD *)v25;
      OUTLINED_FUNCTION_15_1();
    }
    else
    {
      v35 = 0;
      v36 = 0xE000000000000000;
      sub_1C2F2491C();
      sub_1C2F24658();
      MEMORY[0x1C3BCD20C](a1, &type metadata for InsightRequestSummaryKey, MEMORY[0x1E0DEA968]);
      sub_1C2F24658();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_15_1();
      return v35;
    }
  }
  else
  {
    v28 = v24;
    v29 = (void *)sub_1C2F24334();

    swift_willThrow();
    v38 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09C0);
    sub_1C2F10940(0, &qword_1EF7D6560);
    swift_dynamicCast();
    OUTLINED_FUNCTION_12_0();
    v30 = v37;
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_1C2F2491C();
    sub_1C2F24658();
    v31 = objc_msgSend(v30, sel_description);
    sub_1C2F24604();

    sub_1C2F24658();
    swift_bridgeObjectRelease();
    sub_1C2F24658();
    MEMORY[0x1C3BCD20C](a1, &type metadata for InsightRequestSummaryKey, MEMORY[0x1E0DEA968]);
    sub_1C2F24658();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_17_1();

    v27 = v35;
  }
  return v27;
}

void InsightRequestSummaryLogger.emitError(_:)(uint64_t (*a1)(void), uint64_t a2)
{
  sub_1C2F0F744(a1, a2, MEMORY[0x1E0DF2280]);
}

void sub_1C2F0F744(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = OUTLINED_FUNCTION_15();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, v6);
  swift_retain_n();
  v10 = sub_1C2F244C0();
  v11 = a3();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_3();
    v19 = OUTLINED_FUNCTION_3();
    v22 = v19;
    *(_DWORD *)v12 = 136315138;
    v18[1] = v12 + 4;
    v13 = a1();
    v14 = static InsightRequestSummaryLogger.constructLogJsonString(_:)(v13);
    v20 = v6;
    v15 = (uint64_t)v14;
    v17 = v16;
    OUTLINED_FUNCTION_12_0();
    v21 = sub_1C2F08778(v15, v17, &v22);
    sub_1C2F248C8();
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F05000, v10, v11, "%s", v12, 0xCu);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_13_0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  OUTLINED_FUNCTION_3_1();
}

void InsightRequestSummaryLogger.emitMarker(assistantId:sessionId:requestId:component:marker:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 *a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint8_t *v24;
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
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  _QWORD v46[2];
  uint64_t v47;
  int v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v52 = a4;
  v53 = a6;
  v51 = a1;
  v13 = OUTLINED_FUNCTION_15();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_19_0();
  v15 = sub_1C2F24388();
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = *a8;
  v55 = v18;
  v19 = a3;
  v21 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, v19, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v9, v8, v13);
  sub_1C2F24598();
  v56 = a5;
  sub_1C2F24598();
  OUTLINED_FUNCTION_14_1();
  v22 = sub_1C2F244C0();
  v23 = sub_1C2F24808();
  if (os_log_type_enabled(v22, (os_log_type_t)v23))
  {
    v48 = v23;
    v50 = v14;
    v24 = (uint8_t *)OUTLINED_FUNCTION_3();
    v47 = OUTLINED_FUNCTION_3();
    v60 = v47;
    v49 = v24;
    *(_DWORD *)v24 = 136315138;
    v46[1] = v24 + 4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0CC0);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1C2F25380;
    if (qword_1ED7E0620 != -1)
      swift_once();
    v26 = *(_QWORD *)algn_1ED7E0738;
    *(_QWORD *)(v25 + 32) = qword_1ED7E0730;
    *(_QWORD *)(v25 + 40) = v26;
    sub_1C2F24598();
    v58 = OUTLINED_FUNCTION_4_2();
    v59 = v27;
    OUTLINED_FUNCTION_2_2();
    sub_1C2F24658();
    OUTLINED_FUNCTION_2_2();
    v28 = v59;
    *(_QWORD *)(v25 + 48) = v58;
    *(_QWORD *)(v25 + 56) = v28;
    if (qword_1ED7E0808 != -1)
      swift_once();
    v29 = unk_1ED7E07F8;
    *(_QWORD *)(v25 + 64) = qword_1ED7E07F0;
    *(_QWORD *)(v25 + 72) = v29;
    sub_1C2F24598();
    v58 = OUTLINED_FUNCTION_4_2();
    v59 = v30;
    OUTLINED_FUNCTION_2_2();
    sub_1C2F10E30((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    sub_1C2F24A18();
    sub_1C2F24658();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_2_2();
    v31 = v59;
    *(_QWORD *)(v25 + 80) = v58;
    *(_QWORD *)(v25 + 88) = v31;
    if (qword_1ED7E07E8 != -1)
      swift_once();
    v32 = unk_1ED7E07E0;
    *(_QWORD *)(v25 + 96) = qword_1ED7E07D8;
    *(_QWORD *)(v25 + 104) = v32;
    sub_1C2F24598();
    v58 = OUTLINED_FUNCTION_4_2();
    v59 = v33;
    OUTLINED_FUNCTION_2_2();
    sub_1C2F24658();
    OUTLINED_FUNCTION_2_2();
    v34 = v59;
    *(_QWORD *)(v25 + 112) = v58;
    *(_QWORD *)(v25 + 120) = v34;
    if (qword_1ED7E0C30 != -1)
      swift_once();
    v35 = *(_QWORD *)algn_1ED7E0C28;
    *(_QWORD *)(v25 + 128) = qword_1ED7E0C20;
    *(_QWORD *)(v25 + 136) = v35;
    sub_1C2F24598();
    v58 = OUTLINED_FUNCTION_4_2();
    v59 = v36;
    OUTLINED_FUNCTION_2_2();
    sub_1C2F24658();
    OUTLINED_FUNCTION_2_2();
    v37 = v59;
    *(_QWORD *)(v25 + 144) = v58;
    *(_QWORD *)(v25 + 152) = v37;
    if (qword_1ED7E0C18 != -1)
      swift_once();
    v38 = unk_1ED7E0C10;
    *(_QWORD *)(v25 + 160) = qword_1ED7E0C08;
    *(_QWORD *)(v25 + 168) = v38;
    sub_1C2F24598();
    v58 = OUTLINED_FUNCTION_4_2();
    v59 = v39;
    OUTLINED_FUNCTION_2_2();
    v57 = v54;
    sub_1C2F249C4();
    OUTLINED_FUNCTION_2_2();
    v40 = v59;
    *(_QWORD *)(v25 + 176) = v58;
    *(_QWORD *)(v25 + 184) = v40;
    v41 = static InsightRequestSummaryLogger.constructLogJsonString(_:)(v25);
    v43 = v42;
    swift_bridgeObjectRelease();
    v44 = sub_1C2F08778((uint64_t)v41, v43, &v60);
    v45 = v49;
    v58 = v44;
    sub_1C2F248C8();
    OUTLINED_FUNCTION_12_0();
    _os_log_impl(&dword_1C2F05000, v22, (os_log_type_t)v48, "%s", v45, 0xCu);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v9, v13);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v17, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_1();
}

uint64_t InsightRequestSummaryKey.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1C2F24598();
  return v1;
}

void sub_1C2F0FDD4()
{
  qword_1ED7E0730 = 0x6E61747369737361;
  *(_QWORD *)algn_1ED7E0738 = 0xEB00000000644974;
}

SiriRequestDispatcher::InsightRequestSummaryKey __swiftcall InsightRequestSummaryKey.init(rawValue:)(SiriRequestDispatcher::InsightRequestSummaryKey rawValue)
{
  SiriRequestDispatcher::InsightRequestSummaryKey *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t static InsightRequestSummaryKey.assistantId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0620, &qword_1ED7E0730, a1);
}

void sub_1C2F0FE24()
{
  qword_1ED7E0720 = 0x614E656764697262;
  *(_QWORD *)algn_1ED7E0728 = 0xEA0000000000656DLL;
}

uint64_t static InsightRequestSummaryKey.bridgeName.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E05B8, &qword_1ED7E0720, a1);
}

void sub_1C2F0FE68()
{
  strcpy((char *)&qword_1ED7E0788, "cdmSetupStatus");
  unk_1ED7E0797 = -18;
}

uint64_t static InsightRequestSummaryKey.cdmSetupStatus.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E05E0, &qword_1ED7E0788, a1);
}

void sub_1C2F0FEB4()
{
  qword_1EF7D6530 = 0x4E646E616D6D6F63;
  *(_QWORD *)algn_1EF7D6538 = 0xEB00000000656D61;
}

uint64_t static InsightRequestSummaryKey.commandName.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1EF7D6138, &qword_1EF7D6530, a1);
}

void sub_1C2F0FEFC()
{
  qword_1ED7E0C20 = 0x6E656E6F706D6F63;
  *(_QWORD *)algn_1ED7E0C28 = 0xE900000000000074;
}

uint64_t static InsightRequestSummaryKey.component.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0C30, &qword_1ED7E0C20, a1);
}

void static InsightRequestSummaryKey.dismissUIForMitigation.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void sub_1C2F0FF54()
{
  strcpy((char *)qword_1ED7E0740, "endpointMode");
  unk_1ED7E074D = 0;
  unk_1ED7E074E = -5120;
}

uint64_t static InsightRequestSummaryKey.endpointMode.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0758, qword_1ED7E0740, a1);
}

void sub_1C2F0FF9C()
{
  qword_1ED7E07C8 = 0x646F43726F727265;
  unk_1ED7E07D0 = 0xE900000000000065;
}

uint64_t static InsightRequestSummaryKey.errorCode.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(qword_1ED7E05F0, &qword_1ED7E07C8, a1);
}

void sub_1C2F0FFE0()
{
  strcpy((char *)&qword_1ED7E0760, "failureReason");
  *(_WORD *)&algn_1ED7E0768[6] = -4864;
}

uint64_t static InsightRequestSummaryKey.failureReason.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E05D8, &qword_1ED7E0760, a1);
}

void sub_1C2F1002C()
{
  qword_1EF7D6540 = 0x61676974694D7369;
  *(_QWORD *)algn_1EF7D6548 = 0xEB00000000646574;
}

uint64_t static InsightRequestSummaryKey.isMitigated.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(qword_1EF7D6140, &qword_1EF7D6540, a1);
}

void sub_1C2F10074()
{
  qword_1ED7E0C08 = 0x72656B72616DLL;
  unk_1ED7E0C10 = 0xE600000000000000;
}

uint64_t static InsightRequestSummaryKey.marker.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0C18, &qword_1ED7E0C08, a1);
}

void static InsightRequestSummaryKey.messageDescription.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void sub_1C2F100C4()
{
  strcpy((char *)&qword_1EF7D6550, "mitigatedByURS");
  algn_1EF7D6558[7] = -18;
}

uint64_t static InsightRequestSummaryKey.mitigatedByURS.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(qword_1EF7D6150, &qword_1EF7D6550, a1);
}

void sub_1C2F10110()
{
  strcpy((char *)&qword_1ED7E0708, "nluRequestId");
  unk_1ED7E0715 = 0;
  unk_1ED7E0716 = -5120;
}

uint64_t static InsightRequestSummaryKey.nluRequestId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0718, &qword_1ED7E0708, a1);
}

void sub_1C2F10158()
{
  strcpy((char *)&qword_1ED7E0770, "postSucceeded");
  *(_WORD *)&algn_1ED7E0778[6] = -4864;
}

uint64_t static InsightRequestSummaryKey.postSucceeded.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0780, &qword_1ED7E0770, a1);
}

void static InsightRequestSummaryKey.preExecutionDecision.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void sub_1C2F101B8()
{
  qword_1ED7E07D8 = 0x4974736575716572;
  unk_1ED7E07E0 = 0xE900000000000064;
}

uint64_t static InsightRequestSummaryKey.requestId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E07E8, &qword_1ED7E07D8, a1);
}

void static InsightRequestSummaryKey.resultCandidateId.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void sub_1C2F10210()
{
  qword_1ED7E05C0 = 0x6F436E7275746572;
  unk_1ED7E05C8 = 0xEA00000000006564;
}

uint64_t static InsightRequestSummaryKey.returnCode.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(qword_1ED7E0610, &qword_1ED7E05C0, a1);
}

void static InsightRequestSummaryKey.serverFallbackReason.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void static InsightRequestSummaryKey.serverFallbackContextId.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

void sub_1C2F1027C()
{
  qword_1ED7E07F0 = 0x496E6F6973736573;
  unk_1ED7E07F8 = 0xE900000000000064;
}

uint64_t static InsightRequestSummaryKey.sessionId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0808, &qword_1ED7E07F0, a1);
}

void sub_1C2F102C0()
{
  qword_1ED7E0798 = 0x6449756374;
  unk_1ED7E07A0 = 0xE500000000000000;
}

uint64_t static InsightRequestSummaryKey.tcuId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E07B0, &qword_1ED7E0798, a1);
}

void sub_1C2F102FC()
{
  qword_1ED7E07B8 = 0x6449707274;
  unk_1ED7E07C0 = 0xE500000000000000;
}

uint64_t static InsightRequestSummaryKey.trpId.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E05E8, &qword_1ED7E07B8, a1);
}

void sub_1C2F10338()
{
  qword_1ED7E0810 = 0x636E617265747475;
  *(_QWORD *)algn_1ED7E0818 = 0xE900000000000065;
}

uint64_t static InsightRequestSummaryKey.utterance.getter@<X0>(_QWORD *a1@<X8>)
{
  return OUTLINED_FUNCTION_0_2(&qword_1ED7E0820, &qword_1ED7E0810, a1);
}

uint64_t sub_1C2F1037C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return sub_1C2F24598();
}

void static InsightRequestSummaryKey.languageDetected.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_1(a1);
}

uint64_t sub_1C2F103E0@<X0>(Swift::String *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = InsightRequestSummaryKey.init(rawValue:)(*a1).rawValue._countAndFlagsBits;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_1C2F1041C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = InsightRequestSummaryKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateReceived.getter()
{
  return OUTLINED_FUNCTION_3_3(26);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateReceivedFailure.getter()
{
  return OUTLINED_FUNCTION_3_3(33);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAccepted.getter()
{
  return OUTLINED_FUNCTION_3_3(26);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedFailure.getter()
{
  return OUTLINED_FUNCTION_3_3(33);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMUX.getter()
{
  return OUTLINED_FUNCTION_3_3(29);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMUXFailure.getter()
{
  return OUTLINED_FUNCTION_3_3(36);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMessagePosting.getter()
{
  return OUTLINED_FUNCTION_3_3(40);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateAcceptedMessagePostingFailure.getter()
{
  return OUTLINED_FUNCTION_3_3(47);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateWithEndpoint.getter()
{
  return OUTLINED_FUNCTION_3_3(30);
}

unint64_t static InsightRequestSummaryMessageDescription.asrResultCandidateWithEndpointFailure.getter()
{
  return OUTLINED_FUNCTION_3_3(37);
}

unint64_t static InsightRequestSummaryMessageDescription.executionMitigateRequest.getter()
{
  return OUTLINED_FUNCTION_3_3(24);
}

unint64_t static InsightRequestSummaryMessageDescription.executionPreExecutionDecision.getter()
{
  return OUTLINED_FUNCTION_3_3(29);
}

unint64_t static InsightRequestSummaryMessageDescription.executionServerFallbackInitiated.getter()
{
  return OUTLINED_FUNCTION_3_3(32);
}

BOOL static Marker.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Marker.hash(into:)()
{
  return sub_1C2F24AA8();
}

uint64_t Marker.hashValue.getter()
{
  sub_1C2F24A9C();
  sub_1C2F24AA8();
  return sub_1C2F24AB4();
}

uint64_t sub_1C2F10608()
{
  sub_1C2F24A9C();
  sub_1C2F24AA8();
  return sub_1C2F24AB4();
}

uint64_t sub_1C2F10648()
{
  return 0;
}

unint64_t sub_1C2F10650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C2F24A9C();
  sub_1C2F2464C();
  v4 = sub_1C2F24AB4();
  return sub_1C2F10720(a1, a2, v4);
}

unint64_t sub_1C2F106B4(uint64_t a1)
{
  uint64_t v2;

  sub_1C2F24478();
  sub_1C2F10E30(&qword_1EF7D6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
  v2 = sub_1C2F245E0();
  return sub_1C2F10800(a1, v2);
}

unint64_t sub_1C2F10720(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C2F24A3C() & 1) == 0)
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
      while (!v14 && (sub_1C2F24A3C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C2F10800(uint64_t a1, uint64_t a2)
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
  v5 = sub_1C2F24478();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
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
      sub_1C2F10E30(&qword_1EF7D65A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF98]);
      v14 = sub_1C2F245EC();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_1C2F10940(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C2F10978(uint64_t a1, unint64_t a2)
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

unint64_t sub_1C2F109C0()
{
  unint64_t result;

  result = qword_1EF7D6568[0];
  if (!qword_1EF7D6568[0])
  {
    result = MEMORY[0x1C3BCD794](&protocol conformance descriptor for Marker, &type metadata for Marker);
    atomic_store(result, qword_1EF7D6568);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C2F244CC();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for InsightRequestSummaryLogger(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C2F244CC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C2F244CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C2F244CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C2F244CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for InsightRequestSummaryLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C2F244CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsightRequestSummaryLogger()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2F10B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_15();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for InsightRequestSummaryLogger()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2F10BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_15();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for InsightRequestSummaryLogger()
{
  uint64_t result;

  result = qword_1ED7E0628;
  if (!qword_1ED7E0628)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2F10C3C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244CC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for InsightRequestSummaryKey()
{
  OUTLINED_FUNCTION_0_0();
}

void type metadata accessor for InsightRequestSummaryMessageDescription()
{
  OUTLINED_FUNCTION_0_0();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Marker(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Marker(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2F10DA0 + 4 * byte_1C2F25395[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C2F10DD4 + 4 * byte_1C2F25390[v4]))();
}

uint64_t sub_1C2F10DD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F10DDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2F10DE4);
  return result;
}

uint64_t sub_1C2F10DF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2F10DF8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C2F10DFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F10E04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F10E10(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C2F10E18(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for Marker()
{
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1C2F10E30(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3BCD794](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_1C2F1037C(a1, a2, a2 + 1, a3);
}

void OUTLINED_FUNCTION_1_1(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = (v2 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_1C2F24658();
}

unint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_1C2F24A24();
}

unint64_t OUTLINED_FUNCTION_11_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C2F10650(v1, v0);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C2F10978(v1, v0);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_1C2F24658();
}

uint64_t InstrumentationUtil.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t InstrumentationUtil.init()()
{
  uint64_t v0;

  return v0;
}

id sub_1C2F10EF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  id ru_maxrss;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  const char *v17;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  os_log_type_t v23;
  rusage v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = sub_1C2F11EFC(a1, a2, a3, a4);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99F00]), sel_init);
  objc_msgSend(v8, sel_setEventMetadata_, v7);
  if ((a5 & 1) != 0 && v8)
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0D99FF0]);
    v10 = v8;
    v11 = OUTLINED_FUNCTION_23_1();
    if (v11)
    {
      v12 = objc_allocWithZone(MEMORY[0x1E0D99F68]);
      ru_maxrss = v11;
      v9 = OUTLINED_FUNCTION_23_1();
      OUTLINED_FUNCTION_21_1(ru_maxrss, sel_setMemoryUsageMetadata_);

    }
    v24.ru_utime.tv_sec = 0;
    v24.ru_utime.tv_usec = 0;
    v24.ru_stime.tv_sec = 0;
    v24.ru_stime.tv_usec = 0;
    memset(&v24.ru_maxrss, 0, 112);
    v13 = getrusage(0, &v24);
    if ((_DWORD)v13)
    {
      if (qword_1ED7E0638 != -1)
        swift_once();
      v14 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_2_3(v14, (uint64_t)qword_1ED7E0D30);
      v15 = OUTLINED_FUNCTION_71();
      if (OUTLINED_FUNCTION_3_4(v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_3();
        *(_WORD *)v16 = 0;
        v17 = "Not logging maxRSS since getrusage() did not succeed";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    ru_maxrss = (id)v24.ru_maxrss;
    if (v24.ru_maxrss < 0)
    {
      if (qword_1ED7E0638 != -1)
        swift_once();
      v22 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_2_3(v22, (uint64_t)qword_1ED7E0D30);
      v23 = OUTLINED_FUNCTION_71();
      if (OUTLINED_FUNCTION_3_4(v23))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_3();
        *(_WORD *)v16 = 0;
        v17 = "Not logging maxRSS since it is negative";
LABEL_10:
        _os_log_impl(&dword_1C2F05000, v9, (os_log_type_t)ru_maxrss, v17, v16, 2u);
        OUTLINED_FUNCTION_0();
      }
      goto LABEL_11;
    }
    if (!v11)
      goto LABEL_12;
    v13 = (uint64_t)objc_msgSend(v11, sel_memoryUsageMetadata);
    if (!v13)
      goto LABEL_12;
    v9 = v13;
    v19 = ceil(log10((double)(unint64_t)ru_maxrss));
    if (v19 <= 2.0)
    {
LABEL_22:
      -[NSObject setMaxRSS:](v9, sel_setMaxRSS_, ru_maxrss);
LABEL_11:

LABEL_12:
      OUTLINED_FUNCTION_18_1(v13, sel_setResourceUtilizationMetadata_);

      goto LABEL_13;
    }
    v20 = __exp10(v19 + -2.0);
    v21 = v20 * rint((double)(unint64_t)ru_maxrss / v20);
    if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) != 0)
    {
      if (v21 > -1.0)
      {
        if (v21 < 1.84467441e19)
        {
          ru_maxrss = (id)v21;
          goto LABEL_22;
        }
LABEL_29:
        __break(1u);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
LABEL_13:

  return v8;
}

id sub_1C2F111FC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1C2F10EF8(a1, a2, 0, 0, a3);
}

NSObject *sub_1C2F1120C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;

  v9 = sub_1C2F24388();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A488]));
  if (!v13)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v22 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v22, (uint64_t)qword_1ED7E0D30);
    v23 = OUTLINED_FUNCTION_26();
    if (os_log_type_enabled(v4, v23))
    {
      v24 = OUTLINED_FUNCTION_3();
      v45 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v24 = 136315394;
      v25 = OUTLINED_FUNCTION_15_2();
      v44 = OUTLINED_FUNCTION_13_1(v25, v26);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_36();
      *(_WORD *)(v24 + 12) = 2080;
      v27 = sub_1C2F2488C();
      v44 = OUTLINED_FUNCTION_13_1(v27, v28);
      sub_1C2F248C8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_22_1(&dword_1C2F05000, v4, v23, "Failed to create RequestLink event for source component: %s and target component: %s");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_18;
  }
  v4 = v13;
  v43 = a3;
  v14 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v14)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v29 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v29, (uint64_t)qword_1ED7E0D30);
    v30 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_3();
      v45 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v31 = 136315138;
      v32 = OUTLINED_FUNCTION_15_2();
      v34 = OUTLINED_FUNCTION_13_1(v32, v33);
      OUTLINED_FUNCTION_15_0(v34);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, 0x1F34D2000, v5, "Failed to create source link event for source component: %s", v31);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

LABEL_18:
    return 0;
  }
  v15 = v14;
  v16 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v16)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v35 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v35, (uint64_t)qword_1ED7E0D30);
    v36 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_3_4(v36))
    {
      v37 = (uint8_t *)OUTLINED_FUNCTION_3();
      v45 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v37 = 136315138;
      v38 = sub_1C2F2488C();
      v40 = OUTLINED_FUNCTION_13_1(v38, v39);
      OUTLINED_FUNCTION_15_0(v40);
      OUTLINED_FUNCTION_24_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, 0x1F34D2000, (os_log_type_t)a4, "Failed to create target link event for target component: %s", v37);
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_0();
    }

    return 0;
  }
  v17 = v16;
  OUTLINED_FUNCTION_18_1((uint64_t)v16, sel_setComponent_);
  sub_1C2F12048();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18(v12, a2, v9);
  v19 = sub_1C2F1169C((uint64_t)v12);
  OUTLINED_FUNCTION_18_1((uint64_t)v19, sel_setUuid_);

  objc_msgSend(v17, sel_setComponent_, v43);
  v18(v12, a4, v9);
  v20 = sub_1C2F1169C((uint64_t)v12);
  OUTLINED_FUNCTION_21_1(v17, sel_setUuid_);

  OUTLINED_FUNCTION_25_0(v21, sel_setSource_);
  -[NSObject setTarget:](v4, sel_setTarget_, v17);

  return v4;
}

id sub_1C2F1169C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1C2F24364();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_1C2F24388();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

NSObject *sub_1C2F11718(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  void *v59;
  uint64_t v60;

  v13 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A488]));
  if (!v13)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v21, (uint64_t)qword_1ED7E0D30);
    v22 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_16_1(v22))
    {
      v23 = OUTLINED_FUNCTION_3();
      v60 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v23 = 136315394;
      v24 = sub_1C2F2488C();
      OUTLINED_FUNCTION_14_2(v24, v25, v26, v27, v28);
      OUTLINED_FUNCTION_11_2();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      v29 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_14_2(v29, v30, v31, v32, v33);
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_22_1(&dword_1C2F05000, v6, v7, "Failed to create RequestLink event for source component: %s and target component: %s during buildRequestLinkEvent");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_29;
  }
  v6 = v13;
  v14 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v14)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v34 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v34, (uint64_t)qword_1ED7E0D30);
    v35 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v35))
    {
      v36 = (uint8_t *)OUTLINED_FUNCTION_3();
      v60 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v36 = 136315138;
      v37 = sub_1C2F2488C();
      OUTLINED_FUNCTION_14_2(v37, v38, v39, v40, v41);
      OUTLINED_FUNCTION_5_2();
      sub_1C2F248C8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, 0x1F34D2000, OS_LOG_TYPE_DEFAULT, "Failed to create source link event for source component: %s during buildRequestLinkEvent", v36);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

LABEL_29:
    return 0;
  }
  v15 = v14;
  v16 = OUTLINED_FUNCTION_10_1(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v16)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v42 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v42, (uint64_t)qword_1ED7E0D30);
    v43 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_3_4(v43))
    {
      v44 = (uint8_t *)OUTLINED_FUNCTION_3();
      v60 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v44 = 136315138;
      v45 = OUTLINED_FUNCTION_15_2();
      OUTLINED_FUNCTION_14_2(v45, v46, v47, v48, v49);
      OUTLINED_FUNCTION_5_2();
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, 0x1F34D2000, (os_log_type_t)a2, "Failed to create target link event for target component: %s during buildRequestLinkEvent", v44);
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_0();
    }

    goto LABEL_33;
  }
  v17 = v16;
  v18 = sub_1C2F11DA8();
  if (!v18)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v50 = OUTLINED_FUNCTION_15();
    v51 = __swift_project_value_buffer(v50, (uint64_t)qword_1ED7E0D30);
    swift_bridgeObjectRetain_n();
    sub_1C2F244C0();
    v52 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)OUTLINED_FUNCTION_3();
      v60 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v53 = 136315138;
      sub_1C2F24598();
      sub_1C2F08778(a2, a3, &v60);
      OUTLINED_FUNCTION_5_2();
      sub_1C2F248C8();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v51, v52, "Invaid sourceUUID = %s during buildRequestLinkEvent ", v53);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
LABEL_33:

    return 0;
  }
  v59 = v18;
  v19 = sub_1C2F11DA8();
  if (!v19)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v54 = OUTLINED_FUNCTION_15();
    v55 = __swift_project_value_buffer(v54, (uint64_t)qword_1ED7E0D30);
    swift_bridgeObjectRetain_n();
    sub_1C2F244C0();
    v56 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_3_4(v56))
    {
      v57 = (uint8_t *)OUTLINED_FUNCTION_3();
      v60 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v57 = 136315138;
      sub_1C2F24598();
      sub_1C2F08778(a5, a6, &v60);
      OUTLINED_FUNCTION_5_2();
      sub_1C2F248C8();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v55, (os_log_type_t)a2, "Invaid targetUUID = %s during buildRequestLinkEvent ", v57);
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v20 = v19;
  objc_msgSend(v15, sel_setComponent_, a1);
  OUTLINED_FUNCTION_18_1((uint64_t)objc_msgSend(v15, sel_setUuid_, v59), sel_setComponent_);
  OUTLINED_FUNCTION_21_1(v17, sel_setUuid_);
  OUTLINED_FUNCTION_25_0((uint64_t)-[NSObject setSource:](v6, sel_setSource_, v15), sel_setTarget_);

  return v6;
}

id sub_1C2F11DA8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E00E8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1C2F24388();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - v8;
  sub_1C2F2434C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_1C2F12084((uint64_t)v2);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    sub_1C2F12048();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v10 = sub_1C2F1169C((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

void *sub_1C2F11EFC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v4;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;

  v6 = sub_1C2F11DA8();
  if (v6)
  {
    v4 = v6;
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99F10]), sel_init);
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, sel_setRequestId_, v4);
      v9 = v8;
      if (a4)
        a4 = (void *)sub_1C2F245F8();
      objc_msgSend(v8, sel_setResultCandidateId_, a4);

    }
  }
  else
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v10, (uint64_t)qword_1ED7E0D30);
    v11 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_16_1(v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C2F05000, v4, (os_log_type_t)a4, "The requestId is not a valid UUID. Will return a nil EventMetadata. We might still emit ORCHClientEvent for some events that are not in request grain", v12, 2u);
      OUTLINED_FUNCTION_0();
    }
    v8 = 0;
  }

  return v8;
}

uint64_t InstrumentationUtil.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t InstrumentationUtil.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1C2F12048()
{
  unint64_t result;

  result = qword_1ED7E09A8;
  if (!qword_1ED7E09A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7E09A8);
  }
  return result;
}

uint64_t sub_1C2F12084(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E00E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for InstrumentationUtil()
{
  return objc_opt_self();
}

uint64_t method lookup function for InstrumentationUtil()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InstrumentationUtil.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:_:logResourceUtilization:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:logResourceUtilization:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of InstrumentationUtil.buildRequestLinkEvent(sourceComponent:sourceUUID:targetComponent:targetUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InstrumentationUtil.powerLogger()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C2F244C0();
}

BOOL OUTLINED_FUNCTION_3_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_10_1(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_1C2F08778(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_1C2F2488C();
}

BOOL OUTLINED_FUNCTION_16_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_17_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_18_1(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_21_1(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void OUTLINED_FUNCTION_22_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

id OUTLINED_FUNCTION_23_1()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_1C2F248C8();
}

id OUTLINED_FUNCTION_25_0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void IntelligenceFlowFeatureFlags.domain.getter()
{
  OUTLINED_FUNCTION_0_3();
}

void IntelligenceFlowFeatureFlags.feature.getter()
{
  OUTLINED_FUNCTION_0_3();
}

uint64_t IntelligenceFlowFeatureFlags.isEnabled.getter()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for IntelligenceFlowFeatureFlags;
  v4 = sub_1C2F12280();
  v0 = sub_1C2F24394();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_1C2F12280()
{
  unint64_t result;

  result = qword_1ED7E0828;
  if (!qword_1ED7E0828)
  {
    result = MEMORY[0x1C3BCD794](&protocol conformance descriptor for IntelligenceFlowFeatureFlags, &type metadata for IntelligenceFlowFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1ED7E0828);
  }
  return result;
}

uint64_t static IntelligenceFlowFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t IntelligenceFlowFeatureFlags.hash(into:)()
{
  return sub_1C2F24AA8();
}

uint64_t IntelligenceFlowFeatureFlags.hashValue.getter()
{
  sub_1C2F24A9C();
  sub_1C2F24AA8();
  return sub_1C2F24AB4();
}

uint64_t sub_1C2F12328()
{
  return 1;
}

uint64_t sub_1C2F12330()
{
  return IntelligenceFlowFeatureFlags.hashValue.getter();
}

uint64_t sub_1C2F12344()
{
  return IntelligenceFlowFeatureFlags.hash(into:)();
}

uint64_t sub_1C2F12358()
{
  sub_1C2F24A9C();
  sub_1C2F24AA8();
  return sub_1C2F24AB4();
}

unint64_t sub_1C2F12398()
{
  unint64_t result;

  result = qword_1EF7D65A8;
  if (!qword_1EF7D65A8)
  {
    result = MEMORY[0x1C3BCD794](&protocol conformance descriptor for IntelligenceFlowFeatureFlags, &type metadata for IntelligenceFlowFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF7D65A8);
  }
  return result;
}

const char *sub_1C2F123D4()
{
  return "IntelligenceFlow";
}

uint64_t getEnumTagSinglePayload for IntelligenceFlowFeatureFlags(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntelligenceFlowFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C2F1247C + 4 * byte_1C2F25540[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C2F1249C + 4 * byte_1C2F25545[v4]))();
}

_BYTE *sub_1C2F1247C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C2F1249C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2F124A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2F124AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2F124B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2F124BC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceFlowFeatureFlags()
{
  return &type metadata for IntelligenceFlowFeatureFlags;
}

uint64_t sub_1C2F124E4()
{
  uint64_t v0;

  v0 = sub_1C2F244CC();
  __swift_allocate_value_buffer(v0, qword_1ED7E0D30);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED7E0D30);
  sub_1C2F12A60();
  sub_1C2F248B0();
  return sub_1C2F244D8();
}

void sub_1C2F12574(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  static SignpostLogger.begin(_:enableTelemetry:)(a1, a2, a3, a4, a5, a6);
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 1) != 0)
    sub_1C2F128E0(a1, a2, a3, a5, a6);
  else
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
}

void sub_1C2F125E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(a1, a2, a3, a4, a5, a6 & 0x1FF, a7, a8);
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_0_4();
  sub_1C2F2449C();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_1C2F24874();
    v13 = (id)OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_2_4();
    sub_1C2F24490();

  }
  else
  {
    sub_1C2F24598();
    sub_1C2F24874();
    v11 = (void *)OUTLINED_FUNCTION_0_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0570);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1C2F25640;
    *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v12 + 64) = sub_1C2F129AC();
    *(_QWORD *)(v12 + 32) = a7;
    *(_QWORD *)(v12 + 40) = a8;
    OUTLINED_FUNCTION_2_4();
    sub_1C2F24484();

    swift_bridgeObjectRelease();
  }
}

void sub_1C2F12758()
{
  static SignpostLogger.end(_:_:)();
}

void static SignpostLogger.end(_:_:)()
{
  id v0;

  sub_1C2F24868();
  v0 = (id)OUTLINED_FUNCTION_1_2();
  sub_1C2F24490();

}

uint64_t sub_1C2F127F4()
{
  return static SignpostLogger.event(_:)();
}

uint64_t static SignpostLogger.event(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_1C2F244B4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F24880();
  v4 = (void *)OUTLINED_FUNCTION_1_2();
  sub_1C2F244A8();
  sub_1C2F24490();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_1C2F128E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(uint64_t, uint64_t);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_1C2F2449C();
  sub_1C2F24874();
  v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_1C2F24484();

}

unint64_t sub_1C2F129AC()
{
  unint64_t result;

  result = qword_1ED7E0518;
  if (!qword_1ED7E0518)
  {
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED7E0518);
  }
  return result;
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
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

unint64_t sub_1C2F12A60()
{
  unint64_t result;

  result = qword_1ED7E0640;
  if (!qword_1ED7E0640)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7E0640);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0);
}

_QWORD *MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, __int128 *a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v11 = qword_1ED7E0D50;
  v12 = *(_QWORD *)(*v7 + 80);
  type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(255, v12, (uint64_t)a3, a4);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_75_0();
  *(_QWORD *)((char *)v7 + v11) = OUTLINED_FUNCTION_57_0();
  v13 = qword_1ED7E0D60;
  OUTLINED_FUNCTION_75_0();
  *(_QWORD *)((char *)v7 + v13) = OUTLINED_FUNCTION_57_0();
  v14 = qword_1ED7E0D58;
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(255, v12, v15, v16);
  v17 = sub_1C2F245BC();
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_41_0();
  *(_QWORD *)((char *)v7 + v14) = sub_1C2F24580();
  v7[2] = a1;
  v7[3] = a2;
  sub_1C2F15ADC(a3, (uint64_t)(v7 + 4));
  v7[9] = a4;
  v7[10] = a5;
  sub_1C2F15ADC(a6, (uint64_t)(v7 + 11));
  v18 = OUTLINED_FUNCTION_3_5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a7, v18);
  return v7;
}

uint64_t sub_1C2F12C24(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  return sub_1C2F12C34(a1, a2, a3, a4, 0);
}

uint64_t sub_1C2F12C2C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  return sub_1C2F12C34(a1, a2, a3, a4, 1);
}

uint64_t sub_1C2F12C34(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char a5)
{
  char v6;

  v6 = *a4;
  return sub_1C2F14D20(a1, a2, a5, a3, &v6);
}

uint64_t MessageHandlerType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C2F12CA0 + 4 * byte_1C2F25680[*v0]))(0xD000000000000014, 0x80000001C2F25E20);
}

uint64_t sub_1C2F12CA0()
{
  return 0x636972656E6567;
}

uint64_t sub_1C2F12CB8(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_1C2F12CF0()
{
  return 0x4674736575716572;
}

void MessageDispatchingBridgeBase.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 88);
  v1 = OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6_0(v1);
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_83_0();
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F12D88()
{
  return sub_1C2F12DAC();
}

uint64_t sub_1C2F12D94()
{
  return sub_1C2F12DAC();
}

uint64_t sub_1C2F12DA0()
{
  return sub_1C2F12DAC();
}

uint64_t sub_1C2F12DAC()
{
  swift_beginAccess();
  return sub_1C2F24598();
}

void sub_1C2F12DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1C2F12D94();
  OUTLINED_FUNCTION_77_0(v0, v1, v2, v3);
  OUTLINED_FUNCTION_74_0();
  sub_1C2F245B0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_74_0();
  sub_1C2F245A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0830);
  OUTLINED_FUNCTION_59_0();
}

uint64_t sub_1C2F12E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v10 = sub_1C2F145A8((void (*)(char *, char *))sub_1C2F15AF4, (uint64_t)&v12, v8, v9, MEMORY[0x1E0DEDCE8], a1, MEMORY[0x1E0DEDD18], a8);
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1C2F12EDC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_1C2F12DA0();
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(255, *(_QWORD *)(v1 + 80), v2, v3);
  OUTLINED_FUNCTION_76_0();
  sub_1C2F245BC();
  sub_1C2F24598();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_76_0();
  sub_1C2F2458C();
  OUTLINED_FUNCTION_59_0();
}

uint64_t sub_1C2F12F70()
{
  return sub_1C2F24724();
}

void sub_1C2F12F9C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;

  v5 = *v2;
  v6 = sub_1C2F12DA0();
  v13[0] = a1;
  v13[1] = a2;
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(255, *(_QWORD *)(v5 + 80), v7, v8);
  v9 = MEMORY[0x1E0DEA968];
  v10 = MEMORY[0x1E0DEA978];
  v11 = sub_1C2F245BC();
  sub_1C2F24598();
  MEMORY[0x1C3BCCE94](&v14, v13, v6, v9, v11, v10);
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_12_0();
  if (!v14)
  {
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_21_2();
    OUTLINED_FUNCTION_41_0();
    sub_1C2F24580();
  }
  v12 = sub_1C2F24598();
  OUTLINED_FUNCTION_12_0();
  v13[0] = v12;
  sub_1C2F2458C();
  OUTLINED_FUNCTION_59_0();
}

uint64_t sub_1C2F130BC()
{
  return sub_1C2F24724();
}

void sub_1C2F130E8(void *a1)
{
  uint64_t *v1;
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
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  uint64_t v18;

  v3 = *v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0578);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_8();
  v7 = v6 - v5;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0830);
  v8 = OUTLINED_FUNCTION_71_0();
  v10 = v9;
  v11 = sub_1C2F12D88();
  v17[0] = v8;
  v17[1] = v10;
  v14 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(0, *(_QWORD *)(v3 + 80), v12, v13);
  sub_1C2F24598();
  MEMORY[0x1C3BCCE94](&v18, v17, v11, MEMORY[0x1E0DEA968], v14, MEMORY[0x1E0DEA978]);
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_24_1();
  if (v18)
  {
    OUTLINED_FUNCTION_34_0();
  }
  else
  {
    v17[3] = sub_1C2F24424();
    v17[0] = a1;
    v15 = a1;
    sub_1C2F24ACC();
    v16 = sub_1C2F24AE4();
    __swift_storeEnumTagSinglePayload(v7, 0, 1, v16);
    sub_1C2F139E4();
    sub_1C2F16278(v7);
    swift_release();
    OUTLINED_FUNCTION_16_2();
    sub_1C2F245BC();
    swift_retain();
    sub_1C2F245D4();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_35_0();
}

uint64_t sub_1C2F13284(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v4;
  NSObject *v5;
  NSObject v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  os_log_type_t v39;
  uint8_t *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  os_log_type_t v62;
  uint8_t *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void (*v88)(id, id);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;

  v5 = v4;
  v10.isa = v4->isa;
  v11 = objc_msgSend(a1, sel_groupIdentifier);
  if (!v11)
  {
    v38 = OUTLINED_FUNCTION_38_0();
    sub_1C2F244C0();
    v39 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_12_1(v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_3();
      v94 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v40 = 136315138;
      v41 = objc_msgSend(v38, sel_debugDescription);
      v42 = OUTLINED_FUNCTION_37_0();
      v44 = v43;

      v96 = sub_1C2F08778(v42, v44, &v94);
      sub_1C2F248C8();

      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v4, (os_log_type_t)a1, "Commnad %s don't have group identifier, failed command", v40);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    type metadata accessor for MessageDispatchingBridgeBase(0, *((_QWORD *)v10.isa + 10), v59, v60);
    OUTLINED_FUNCTION_59_0();
  }
  v12 = v11;
  v92 = a2;
  v93 = a3;
  v13 = sub_1C2F24604();
  v15 = v14;

  v16 = sub_1C2F12DA0();
  v94 = v13;
  v95 = v15;
  v17 = *((_QWORD *)v10.isa + 10);
  v20 = type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(255, v17, v18, v19);
  v21 = MEMORY[0x1E0DEA968];
  v22 = (void *)MEMORY[0x1E0DEA978];
  v23 = sub_1C2F245BC();
  MEMORY[0x1C3BCCE94](&v96, &v94, v16, v21, v23, v22);
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_68_0();
  v24 = (void *)v96;
  if (!v96)
  {
    OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_58();
    v45 = v22;
    OUTLINED_FUNCTION_47_0();
    v46 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_15_3(v46))
    {
      v47 = OUTLINED_FUNCTION_3();
      v94 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v47 = 136315394;
      v48 = OUTLINED_FUNCTION_81_0();
      OUTLINED_FUNCTION_51_0(v48, v49, v50, v51, v52, v53, v54);
      OUTLINED_FUNCTION_10_2();
      OUTLINED_FUNCTION_40_0();
      v55 = OUTLINED_FUNCTION_36();
      *(_WORD *)(v47 + 12) = 2080;
      v56 = OUTLINED_FUNCTION_86_0(v55, sel_debugDescription);
      v57 = OUTLINED_FUNCTION_37_0();

      OUTLINED_FUNCTION_54_0(v57, v58, &v94);
      OUTLINED_FUNCTION_22_2();

      OUTLINED_FUNCTION_17_3();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v20, (os_log_type_t)v16, "%s was not able to handle: %s, group is not register. Falling back to super.handle()", (uint8_t *)v47);
      goto LABEL_16;
    }
LABEL_17:

    OUTLINED_FUNCTION_40_0();
    goto LABEL_20;
  }
  v25 = objc_msgSend(a1, sel_encodedClassName);
  if (!v25)
  {
    OUTLINED_FUNCTION_24_1();
    v61 = OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_47_0();
    v62 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_15_3(v62))
    {
      v63 = (uint8_t *)OUTLINED_FUNCTION_3();
      v91 = OUTLINED_FUNCTION_3();
      v94 = v91;
      *(_DWORD *)v63 = 136315138;
      v64 = OUTLINED_FUNCTION_86_0(v91, sel_debugDescription);
      v65 = OUTLINED_FUNCTION_37_0();

      OUTLINED_FUNCTION_70_0(v65, v66, &v94);
      OUTLINED_FUNCTION_14_3();

      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v20, (os_log_type_t)v16, "Commnad %s don't have encodedClassName, failed command", v63);
      goto LABEL_16;
    }

LABEL_20:
    v85 = type metadata accessor for MessageDispatchingBridgeBase(0, v17, v83, v84);
    MEMORY[0x1C3BCD794](&protocol conformance descriptor for MessageDispatchingBridgeBase<A>, v85);
    OUTLINED_FUNCTION_74_0();
    return Bridge.defaultHandle(_:executionContextInfo:reply:)(v86, v87, v88, v89, v85, v90);
  }
  v26 = v25;
  v27 = (void *)sub_1C2F24604();
  v29 = v28;

  v94 = (uint64_t)v27;
  v95 = v29;
  MEMORY[0x1C3BCCE94](&v96, &v94, v24, MEMORY[0x1E0DEA968], v20, MEMORY[0x1E0DEA978]);
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_24_1();
  v30 = v96;
  if (!v96)
  {
    OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_58();
    v67 = v27;
    OUTLINED_FUNCTION_47_0();
    v68 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v20, v68))
    {
      v69 = OUTLINED_FUNCTION_3();
      v94 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v69 = 136315394;
      v70 = OUTLINED_FUNCTION_81_0();
      OUTLINED_FUNCTION_51_0(v70, v71, v72, v73, v74, v75, v76);
      OUTLINED_FUNCTION_10_2();
      OUTLINED_FUNCTION_40_0();
      v77 = OUTLINED_FUNCTION_36();
      *(_WORD *)(v69 + 12) = 2080;
      v78 = OUTLINED_FUNCTION_86_0(v77, sel_debugDescription);
      v79 = OUTLINED_FUNCTION_37_0();
      v81 = v80;

      sub_1C2F08778(v79, v81, &v94);
      OUTLINED_FUNCTION_22_2();

      OUTLINED_FUNCTION_68_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v20, v68, "%s was not able to handle: %s, command is not register. Falling back to super.handle()", (uint8_t *)v69);
LABEL_16:
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_17;
  }
  v31 = OUTLINED_FUNCTION_38_0();
  v32 = sub_1C2F244C0();
  v33 = sub_1C2F247E4();
  if (OUTLINED_FUNCTION_15_3(v33))
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_3();
    v94 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v34 = 136315138;
    v35 = objc_msgSend(v31, sel_debugDescription);
    v36 = OUTLINED_FUNCTION_37_0();

    OUTLINED_FUNCTION_54_0(v36, v37, &v94);
    OUTLINED_FUNCTION_14_3();

    OUTLINED_FUNCTION_17_3();
    OUTLINED_FUNCTION_19(&dword_1C2F05000, v32, (os_log_type_t)v26, "dispatch command %s to the handle method", v34);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(NSObject *, id, uint64_t, uint64_t, void *))(*(_QWORD *)v30 + 88))(v5, v31, v92, v93, a4);
  return swift_release();
}

void sub_1C2F139E4()
{
  uint64_t v0;
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
  _QWORD v25[2];
  uint64_t v26;

  OUTLINED_FUNCTION_5_1();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0578);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v25[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v25[-1] - v5;
  v7 = sub_1C2F24AE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  sub_1C2F16230(v1, (uint64_t)v6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    v12 = sub_1C2F16278((uint64_t)v6);
    OUTLINED_FUNCTION_65_0(v12, v13, v14, v15);
    LOBYTE(v25[0]) = 0;
    sub_1C2F14C8C(v25);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    v25[0] = sub_1C2F24AD8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0580);
    v16 = OUTLINED_FUNCTION_71_0();
    v18 = v17;
    v19 = sub_1C2F12D94();
    v25[0] = v16;
    v25[1] = v18;
    v23 = OUTLINED_FUNCTION_65_0(v19, v20, v21, v22);
    MEMORY[0x1C3BCCE94](&v26, v25, v19, MEMORY[0x1E0DEA968], v23, MEMORY[0x1E0DEA978]);
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_12_0();
    if (!v26)
    {
      sub_1C2F24AC0();
      sub_1C2F139E4(v4);
      sub_1C2F16278((uint64_t)v4);
    }
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F13B98()
{
  sub_1C2F13BA8();
}

void sub_1C2F13BA0()
{
  sub_1C2F13BA8();
}

void sub_1C2F13BA8()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30[3];
  _QWORD v31[3];

  OUTLINED_FUNCTION_5_1();
  v28 = v2;
  v3 = v0;
  v5 = v4;
  v29 = v6;
  v27 = v7;
  v8 = *v0;
  v9 = OUTLINED_FUNCTION_15();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_19_0();
  swift_getMetatypeMetadata();
  v11 = sub_1C2F24634();
  v13 = v12;
  v14 = sub_1C2F12D94();
  v30[0] = v11;
  v30[1] = v13;
  v15 = *(_QWORD *)(v8 + 80);
  v19 = OUTLINED_FUNCTION_77_0(v14, v16, v17, v18);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1C3BCCE94](v31, v30, v14, MEMORY[0x1E0DEA968], v19, MEMORY[0x1E0DEA978]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_24_1();
  v20 = v31[0];
  swift_release();
  if (v20)
  {
    v21 = ((char *)v3 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_4();
    sub_1C2F244C0();
    v22 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_60_0(v21))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_3();
      v30[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v23 = 136315138;
      OUTLINED_FUNCTION_4();
      v31[0] = sub_1C2F08778(v11, v13, v30);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v21, v22, "Message type: %s is already registered so ignore this request", v23);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

  }
  else
  {
    v24 = OUTLINED_FUNCTION_76_0();
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler(v24, v25, v15, v5);
    OUTLINED_FUNCTION_76((uint64_t)v3 + qword_1ED7E0D00, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    LOBYTE(v30[0]) = 0;
    v26 = sub_1C2F12C34(v27, v29, v1, (char *)v30, v28);
    v31[1] = v13;
    v31[2] = v26;
    v31[0] = v11;
    OUTLINED_FUNCTION_16_2();
    sub_1C2F245BC();
    swift_retain();
    sub_1C2F245D4();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F13E10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  const char *v41;
  os_log_type_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  _QWORD v57[4];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  OUTLINED_FUNCTION_5_1();
  v59 = v2;
  v60 = v3;
  v4 = v0;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *v0;
  v12 = OUTLINED_FUNCTION_15();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_19_0();
  v54 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v14 = objc_msgSend(v54, sel_groupIdentifier);
  if (!v14)
  {
    v35 = ((char *)v0 + qword_1ED7E0D00);
    sub_1C2F244C0();
    v36 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v36))
    {
      v37 = (uint8_t *)OUTLINED_FUNCTION_3();
      v55 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_27_0(4.8149e-34);
      v38 = OUTLINED_FUNCTION_55_0();
      v40 = OUTLINED_FUNCTION_84_0(v38, v39);
      OUTLINED_FUNCTION_30_0(v40);
      OUTLINED_FUNCTION_7();
      v41 = "Cannot get command group identifier %s";
      goto LABEL_12;
    }
LABEL_13:

    return;
  }
  v15 = v14;
  v53 = v13;
  v16 = sub_1C2F24604();
  v13 = v17;

  v18 = objc_msgSend(v54, sel_encodedClassName);
  if (!v18)
  {
    OUTLINED_FUNCTION_20_0();
    v35 = ((char *)v4 + qword_1ED7E0D00);
    sub_1C2F244C0();
    v42 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v42))
    {
      v37 = (uint8_t *)OUTLINED_FUNCTION_3();
      v55 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_27_0(4.8149e-34);
      v43 = OUTLINED_FUNCTION_55_0();
      v45 = OUTLINED_FUNCTION_84_0(v43, v44);
      OUTLINED_FUNCTION_30_0(v45);
      OUTLINED_FUNCTION_7();
      v41 = "Cannot get command encode name %s";
LABEL_12:
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v35, (os_log_type_t)v13, v41, v37);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_13;
  }
  v19 = v18;
  v48 = v12;
  v49 = v10;
  v50 = v8;
  v51 = sub_1C2F24604();
  v21 = v20;

  v22 = sub_1C2F12DA0();
  v52 = v16;
  v55 = v16;
  v56 = v13;
  v47 = *(_QWORD *)(v11 + 80);
  v25 = type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(255, v47, v23, v24);
  v26 = MEMORY[0x1E0DEA968];
  v27 = MEMORY[0x1E0DEA978];
  v28 = sub_1C2F245BC();
  sub_1C2F24598();
  MEMORY[0x1C3BCCE94](v57, &v55, v22, v26, v28, v27);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_36();
  v29 = v57[0];
  if (!v57[0])
  {
    OUTLINED_FUNCTION_21_2();
    OUTLINED_FUNCTION_41_0();
    v29 = sub_1C2F24580();
  }
  v58 = v29;
  v55 = v51;
  v56 = v21;
  sub_1C2F24598();
  MEMORY[0x1C3BCCE94](v57, &v55, v29, MEMORY[0x1E0DEA968], v25, MEMORY[0x1E0DEA978]);
  OUTLINED_FUNCTION_17_3();
  v30 = v57[0];
  OUTLINED_FUNCTION_36_0();
  if (v30)
  {
    v31 = ((char *)v4 + qword_1ED7E0D00);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C2F244C0();
    v32 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = OUTLINED_FUNCTION_3();
      v55 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v33 = 136315394;
      sub_1C2F24598();
      v57[0] = sub_1C2F08778(v52, v13, &v55);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_70();
      *(_WORD *)(v33 + 12) = 2080;
      sub_1C2F24598();
      v57[0] = OUTLINED_FUNCTION_54_0(v51, v34, &v55);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v31, v32, "There is already a method register to handle command: %s:%s, replacing", (uint8_t *)v33);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_63();

  }
  type metadata accessor for MessageDispatchingBridgeBase.CommandHandler(0, v47, v47, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v1, (uint64_t)v4 + qword_1ED7E0D00, v48);
  sub_1C2F14CBC(v49, v50, v1);
  v57[3] = v46;
  v55 = v51;
  v56 = v21;
  swift_retain();
  sub_1C2F24574();
  OUTLINED_FUNCTION_17_3();
  swift_release();
  v57[1] = v13;
  v57[2] = v58;
  v57[0] = v52;
  OUTLINED_FUNCTION_16_2();
  sub_1C2F245BC();
  OUTLINED_FUNCTION_4();
  sub_1C2F24574();
  swift_endAccess();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_20_0();

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_3_1();
}

uint64_t MessageDispatchingBridgeBase.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_1C2F24598();
  return v1;
}

void MessageDispatchingBridgeBase.messagePublisher.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1C2F15B58(v1 + 32, a1);
}

uint64_t MessageDispatchingBridgeBase.serviceHelper.getter()
{
  return swift_unknownObjectRetain();
}

id MessageDispatchingBridgeBase.queue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

void MessageDispatchingBridgeBase.conversationSessionsManaging.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1C2F15B58(v1 + 88, a1);
}

uint64_t MessageDispatchingBridgeBase.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_1ED7E0D00;
  v4 = OUTLINED_FUNCTION_15();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:)()
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
  _BYTE v17[40];
  _BYTE v18[40];

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = OUTLINED_FUNCTION_15();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_19_0();
  sub_1C2F15B58(v9, (uint64_t)v18);
  sub_1C2F15B58(v3, (uint64_t)v17);
  if (qword_1ED7E0638 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED7E0D30);
  OUTLINED_FUNCTION_76(v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  (*(void (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, _BYTE *, uint64_t))(v0 + 240))(v13, v11, v18, v7, v5, v17, v1);
  __swift_destroy_boxed_opaque_existential_0(v3);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_1();
}

void MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, __int128 *a6, uint64_t a7)
{
  OUTLINED_FUNCTION_19_1();
  MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
  OUTLINED_FUNCTION_35_0();
}

uint64_t sub_1C2F145A8(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
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
  uint64_t AssociatedTypeWitness;
  void (*v45)(char *, char *);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[32];
  uint64_t v51;

  v37 = a5;
  v38 = a8;
  v45 = a1;
  v46 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)&v34 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v17 = MEMORY[0x1E0C80A78](v16);
  v35 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - v19;
  v21 = sub_1C2F247C0();
  if (!v21)
    return sub_1C2F2470C();
  v22 = v21;
  v51 = sub_1C2F249AC();
  v41 = sub_1C2F249B8();
  sub_1C2F24970();
  v43 = a6;
  result = sub_1C2F247B4();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v24 = v22;
    v42 = v15;
    while (v24)
    {
      v48 = v24;
      v25 = (void (*)(char *, _QWORD))sub_1C2F247D8();
      v26 = *(void (**)(char *))(v10 + 16);
      v27 = v10;
      v28 = AssociatedTypeWitness;
      v26(v13);
      v25(v50, 0);
      v29 = v20;
      v30 = v49;
      v45(v13, v47);
      if (v30)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v47, v37);
      }
      v49 = 0;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
      sub_1C2F249A0();
      result = sub_1C2F247CC();
      v24 = v48 - 1;
      v10 = v27;
      if (v48 == 1)
      {
        v32 = v39;
        v31 = v40;
        v33 = v35;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v29, v40);
        sub_1C2F248F8();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
        return v51;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1C2F148F8()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  v5 = v4;
  v6 = sub_1C2F24388();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  swift_retain_n();
  v11 = v5;
  v12 = OUTLINED_FUNCTION_63_0();
  v13 = sub_1C2F247E4();
  v31 = v6;
  v30 = v10;
  if (OUTLINED_FUNCTION_12_1(v13))
  {
    v14 = OUTLINED_FUNCTION_3();
    v15 = (_QWORD *)OUTLINED_FUNCTION_3();
    v32 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v14 = 136315394;
    v16 = *(_QWORD *)(v3 + 16);
    sub_1C2F24598();
    v18 = OUTLINED_FUNCTION_70_0(v16, v17, &v32);
    OUTLINED_FUNCTION_85_0(v18);
    OUTLINED_FUNCTION_23_2();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_16_0();
    *(_WORD *)(v14 + 12) = 2112;
    v19 = v1;
    sub_1C2F248C8();
    *v15 = v1;

    OUTLINED_FUNCTION_37(&dword_1C2F05000, v12, v2, "Bridge \"%s\" received message: %@", (uint8_t *)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_13_0();
  sub_1C2F130E8(v1);
  v21 = v20;
  if (((*(uint64_t (**)(void))(*(_QWORD *)v20 + 120))() & 1) != 0)
  {
    v22 = v1;
    v23 = OUTLINED_FUNCTION_63_0();
    v24 = sub_1C2F247F0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = OUTLINED_FUNCTION_3();
      v32 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v25 = 136315394;
      swift_getObjectType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0830);
      v26 = sub_1C2F24634();
      OUTLINED_FUNCTION_13_1(v26, v27);
      OUTLINED_FUNCTION_23_2();

      OUTLINED_FUNCTION_12_0();
      *(_WORD *)(v25 + 12) = 2080;
      sub_1C2F24418();
      sub_1C2F15B98();
      v28 = sub_1C2F24A18();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v30, v31);
      OUTLINED_FUNCTION_54_0(v28, v29, &v32);
      OUTLINED_FUNCTION_23_2();

      OUTLINED_FUNCTION_17_3();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v23, v24, "handleMessage got message type %s with message id: %s which is not registered with the bridge", (uint8_t *)v25);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

  }
  else
  {
    (*(void (**)(uint64_t, void *))(*(_QWORD *)v21 + 104))(v3, v1);
  }
  swift_release();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F14C84(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_1C2F14C8C(_BYTE *a1)
{
  *(_BYTE *)(swift_allocObject() + 16) = *a1;
  OUTLINED_FUNCTION_23();
}

void sub_1C2F14CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_19_1();
  sub_1C2F1540C(a1, a2, a3);
  OUTLINED_FUNCTION_44_0();
}

uint64_t sub_1C2F14CFC(_BYTE *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *a1;
  return OUTLINED_FUNCTION_52_0();
}

uint64_t sub_1C2F14D08()
{
  return sub_1C2F24424();
}

uint64_t sub_1C2F14D14()
{
  return OUTLINED_FUNCTION_46_0();
}

uint64_t sub_1C2F14D20(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char *a5)
{
  char v9;

  v9 = a3 & 1;
  OUTLINED_FUNCTION_19_1();
  return sub_1C2F14D7C(a1, a2, v9, a4, a5);
}

uint64_t sub_1C2F14D7C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char *a5)
{
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *a5;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 32) = a2;
  *(_BYTE *)(v5 + 40) = a3 & 1;
  v8 = v5 + qword_1ED7E0CF0;
  v9 = sub_1C2F244CC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a4, v9);
  *(_BYTE *)(v5 + 16) = v7;
  return v5;
}

void sub_1C2F14DE4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void (*v14)(uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  os_log_type_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_5_1();
  v2 = v1;
  v4 = v3;
  v5 = sub_1C2F24388();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_8();
  v9 = v8 - v7;
  v38 = v4;
  swift_unknownObjectRetain();
  if (OUTLINED_FUNCTION_73_0())
  {
    v10 = swift_dynamicCastClass();
    if (v10)
    {
      v11 = v10;
      v12 = *(unsigned __int8 *)(v0 + 40);
      v13 = v2;
      sub_1C2F16020();
      if (v12 == 1)
      {
        v14 = (void (*)(uint64_t))OUTLINED_FUNCTION_56_0();
        v14(v11);
        OUTLINED_FUNCTION_18_2();
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_39_0();

      }
      else
      {
        v36 = (void (*)(uint64_t))OUTLINED_FUNCTION_56_0();
        v36(v11);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_39_0();

        sub_1C2F16038();
      }
    }
    else
    {
      v23 = v2;
      v24 = sub_1C2F244C0();
      v25 = sub_1C2F247F0();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = OUTLINED_FUNCTION_3();
        v38 = OUTLINED_FUNCTION_3();
        *(_DWORD *)v26 = 136315650;
        v37 = v25;
        sub_1C2F24418();
        sub_1C2F15B98();
        v27 = sub_1C2F24A18();
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
        v29 = OUTLINED_FUNCTION_70_0(v27, v28, &v38);
        OUTLINED_FUNCTION_85_0(v29);
        OUTLINED_FUNCTION_48_0();

        OUTLINED_FUNCTION_16_0();
        *(_WORD *)(v26 + 12) = 2080;
        swift_getObjectType();
        v30 = OUTLINED_FUNCTION_52();
        v32 = OUTLINED_FUNCTION_13_1(v30, v31);
        OUTLINED_FUNCTION_45_0(v32);

        OUTLINED_FUNCTION_24_1();
        *(_WORD *)(v26 + 22) = 2080;
        v33 = OUTLINED_FUNCTION_52();
        v35 = OUTLINED_FUNCTION_13_1(v33, v34);
        OUTLINED_FUNCTION_45_0(v35);
        OUTLINED_FUNCTION_20_0();
        _os_log_impl(&dword_1C2F05000, v24, v37, "Input message %s of type %s is not of type %s", (uint8_t *)v26, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRetain_n();
    v15 = sub_1C2F244C0();
    v16 = sub_1C2F247F0();
    if (OUTLINED_FUNCTION_60_0(v15))
    {
      v17 = OUTLINED_FUNCTION_3();
      v38 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v17 = 136315394;
      swift_getObjectType();
      v18 = OUTLINED_FUNCTION_52();
      v20 = OUTLINED_FUNCTION_13_1(v18, v19);
      OUTLINED_FUNCTION_85_0(v20);
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_61();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      v21 = OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_13_1(v21, v22);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v15, v16, "Handler invoking object is of type %s and not of type %s", (uint8_t *)v17);
      OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_61();

  }
  OUTLINED_FUNCTION_3_1();
}

uint64_t sub_1C2F15318()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 152);
}

uint64_t sub_1C2F15324()
{
  uint64_t result;

  swift_unknownObjectRetain();
  result = OUTLINED_FUNCTION_73_0();
  if ((_DWORD)result)
  {
    swift_unknownObjectRelease();
    return swift_dynamicCastClass() != 0;
  }
  return result;
}

uint64_t sub_1C2F153A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_64_0();
  OUTLINED_FUNCTION_3_5();
  v0 = OUTLINED_FUNCTION_72_0();
  return OUTLINED_FUNCTION_43_0(v0, v1, v2);
}

void sub_1C2F153C8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_64_0();
  v0 = OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6_0(v0);
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F153F4()
{
  return sub_1C2F15874(sub_1C2F153C8);
}

uint64_t sub_1C2F15400()
{
  return OUTLINED_FUNCTION_46_0();
}

void sub_1C2F1540C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v5 = v3 + qword_1ED7E0CF8;
  v6 = OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a3, v6);
  OUTLINED_FUNCTION_44_0();
}

void sub_1C2F15458(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  id v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = a1;
  swift_unknownObjectRetain();
  if (OUTLINED_FUNCTION_73_0())
  {
    v10 = swift_dynamicCastUnknownClass();
    if (v10)
    {
      v11 = v10;
      v12 = *(uint64_t (**)())(v5 + 16);
      v13 = a2;
      v14 = (void (*)(uint64_t, void *, uint64_t, uint64_t))v12();
      v14(v11, a3, a4, a5);
      OUTLINED_FUNCTION_39_0();

      OUTLINED_FUNCTION_36_0();
    }
    else
    {
      v24 = (v5 + qword_1ED7E0CF8);
      v25 = a2;
      OUTLINED_FUNCTION_47_0();
      v26 = OUTLINED_FUNCTION_71();
      if (OUTLINED_FUNCTION_60_0(v24))
      {
        v27 = OUTLINED_FUNCTION_3();
        v40 = OUTLINED_FUNCTION_3();
        *(_DWORD *)v27 = 136315650;
        v28 = sub_1C2F161D0(a3);
        if (v29)
        {
          v30 = v29;
        }
        else
        {
          v28 = 0x6449656361206F6ELL;
          v30 = 0xE800000000000000;
        }
        v38 = sub_1C2F08778(v28, v30, &v40);
        sub_1C2F248C8();

        OUTLINED_FUNCTION_68_0();
        *(_WORD *)(v27 + 12) = 2080;
        swift_getObjectType();
        v31 = OUTLINED_FUNCTION_52();
        v39 = OUTLINED_FUNCTION_62(v31, v32, v33, v38, v40);
        sub_1C2F248C8();

        OUTLINED_FUNCTION_17_3();
        *(_WORD *)(v27 + 22) = 2080;
        v34 = OUTLINED_FUNCTION_52();
        OUTLINED_FUNCTION_62(v34, v35, v36, v39);
        OUTLINED_FUNCTION_48_0();
        OUTLINED_FUNCTION_34_0();
        _os_log_impl(&dword_1C2F05000, v24, v26, "Input command %s of type %s is not of type %s", (uint8_t *)v27, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_39_0();
    }
  }
  else
  {
    swift_unknownObjectRetain_n();
    v15 = sub_1C2F244C0();
    v16 = sub_1C2F247F0();
    if (OUTLINED_FUNCTION_60_0(v15))
    {
      v17 = OUTLINED_FUNCTION_3();
      v40 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v17 = 136315394;
      swift_getObjectType();
      v18 = OUTLINED_FUNCTION_52();
      v37 = OUTLINED_FUNCTION_62(v18, v19, v20);
      OUTLINED_FUNCTION_48_0();
      OUTLINED_FUNCTION_61();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      v21 = OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_62(v21, v22, v23, v37, v40);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v15, v16, "Handler invoking object is of type %s and not of type %s", (uint8_t *)v17);
      OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_61();

  }
}

uint64_t sub_1C2F15800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  swift_release();
  OUTLINED_FUNCTION_3_5();
  v0 = OUTLINED_FUNCTION_72_0();
  return OUTLINED_FUNCTION_43_0(v0, v1, v2);
}

void sub_1C2F1582C()
{
  uint64_t v0;

  swift_release();
  v0 = OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6_0(v0);
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F1585C()
{
  return sub_1C2F15874(sub_1C2F1582C);
}

uint64_t MessageDispatchingBridgeBase.__deallocating_deinit()
{
  return sub_1C2F15874(MessageDispatchingBridgeBase.deinit);
}

uint64_t sub_1C2F15874(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F15898()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t sub_1C2F158B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_1C2F158C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

SiriRequestDispatcher::MessageHandlerType_optional __swiftcall MessageHandlerType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriRequestDispatcher::MessageHandlerType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1C2F24A0C();
  result.value = OUTLINED_FUNCTION_7();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1C2F15920(char *a1)
{
  sub_1C2F16CB8(*a1);
}

uint64_t sub_1C2F1592C()
{
  char *v0;

  return sub_1C2F15934(*v0);
}

uint64_t sub_1C2F15934(char a1)
{
  _BYTE v3[72];

  sub_1C2F24A9C();
  sub_1C2F15980((uint64_t)v3, a1);
  return sub_1C2F24AB4();
}

void sub_1C2F15978(uint64_t a1)
{
  char *v1;

  sub_1C2F15980(a1, *v1);
}

void sub_1C2F15980(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C2F159C4()
{
  sub_1C2F2464C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2F15A4C(uint64_t a1)
{
  char *v1;

  return sub_1C2F15A54(a1, *v1);
}

uint64_t sub_1C2F15A54(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_1C2F24A9C();
  sub_1C2F15980((uint64_t)v4, a2);
  return sub_1C2F24AB4();
}

SiriRequestDispatcher::MessageHandlerType_optional sub_1C2F15A94(Swift::String *a1)
{
  return MessageHandlerType.init(rawValue:)(*a1);
}

uint64_t sub_1C2F15AA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MessageHandlerType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase.MessageHandlerBase);
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.CommandHandlerBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase.CommandHandlerBase);
}

uint64_t sub_1C2F15ADC(__int128 *a1, uint64_t a2)
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

uint64_t sub_1C2F15AF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase);
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.MessageHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase.MessageHandler);
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.CommandHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase.CommandHandler);
}

void sub_1C2F15B58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_23();
}

unint64_t sub_1C2F15B98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E00E0;
  if (!qword_1ED7E00E0)
  {
    v1 = sub_1C2F24388();
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E00E0);
  }
  return result;
}

void sub_1C2F15BD8()
{
  JUMPOUT(0x1C3BCD794);
}

unint64_t sub_1C2F15BEC()
{
  unint64_t result;

  result = qword_1EF7D65B8;
  if (!qword_1EF7D65B8)
  {
    result = MEMORY[0x1C3BCD794](&protocol conformance descriptor for MessageHandlerType, &type metadata for MessageHandlerType);
    atomic_store(result, (unint64_t *)&qword_1EF7D65B8);
  }
  return result;
}

uint64_t sub_1C2F15C28()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244CC();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MessageDispatchingBridgeBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.messageTypesForSubscription()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.aceCommandsGroups()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.aceCommands(forGroup:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.handleMessage(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.handle(_:executionContextInfo:reply:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerMessageHandler<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerCommandHandler<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t sub_1C2F15D50()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1C2F15D90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244CC();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1C2F15E08()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1C2F15E3C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244CC();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageHandlerType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageHandlerType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2F15F8C + 4 * byte_1C2F25691[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1C2F15FC0 + 4 * byte_1C2F2568C[v4]))();
}

uint64_t sub_1C2F15FC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F15FC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2F15FD0);
  return result;
}

uint64_t sub_1C2F15FDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2F15FE4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1C2F15FE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F15FF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1C2F15FFC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageHandlerType()
{
  return &type metadata for MessageHandlerType;
}

uint64_t sub_1C2F16014()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1C2F16020()
{
  return swift_retain();
}

uint64_t sub_1C2F16028()
{
  return sub_1C2F16038();
}

uint64_t sub_1C2F16038()
{
  return swift_release();
}

void sub_1C2F16040(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1C2F16020();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  OUTLINED_FUNCTION_44_0();
}

uint64_t sub_1C2F16080(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1C2F16020();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1C2F16038();
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

uint64_t sub_1C2F160E8(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1C2F16038();
  return a1;
}

uint64_t sub_1C2F1612C(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
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

uint64_t sub_1C2F1616C(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1C2F161B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1C2F161B8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for MessageDispatchingBridgeBase.Method(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingBridgeBase.Method);
}

uint64_t sub_1C2F161D0(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_aceId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C2F24604();

  return v3;
}

uint64_t sub_1C2F16230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F16278(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0578);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_1C2F244CC();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_1C2F248C8();
}

BOOL OUTLINED_FUNCTION_12_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_1C2F248C8();
}

BOOL OUTLINED_FUNCTION_15_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_1C2F16038();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27_0(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  *(_QWORD *)(v3 - 120) = v1;
  return swift_getMetatypeMetadata();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_1C2F24604();
}

id OUTLINED_FUNCTION_38_0()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_1C2F2470C();
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_45_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_deallocClassInstance();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_51_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  unint64_t v8;
  va_list va;

  va_start(va, a7);
  return sub_1C2F08778(v7, v8, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C2F08778(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_1C2F24634();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  return v0(*(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return sub_1C2F24580();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_59_0()
{
  JUMPOUT(0x1C3BCD794);
}

BOOL OUTLINED_FUNCTION_60_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1, unint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_1C2F08778(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return sub_1C2F16038();
}

uint64_t OUTLINED_FUNCTION_65_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(0, *(_QWORD *)(v4 + 80), a3, a4);
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_70_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C2F08778(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return sub_1C2F24634();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_1C2F2470C();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_77_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_84_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_85_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = result;
  return result;
}

id OUTLINED_FUNCTION_86_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[40];
  _BYTE v22[40];

  v20 = a7;
  OUTLINED_FUNCTION_5_3();
  v12 = OUTLINED_FUNCTION_15();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_3(v14, (uint64_t)v22);
  OUTLINED_FUNCTION_86();
  if (qword_1ED7E0638 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v12, (uint64_t)qword_1ED7E0D30);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v17, v12);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, _BYTE *, uint64_t, char *))(v7 + 352))(v10, v9, v22, v8, a5, v21, v20, v16);
  OUTLINED_FUNCTION_6_1(v18);
  OUTLINED_FUNCTION_3_1();
}

void MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_allocObject();
  MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_3_1();
}

void MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23[2];

  v20 = a4;
  v21 = a5;
  v15 = OUTLINED_FUNCTION_15();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v8 + qword_1ED7E0D28) = a7;
  OUTLINED_FUNCTION_4_3(v17, (uint64_t)v23);
  OUTLINED_FUNCTION_86();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, a8, v15);
  MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(a1, a2, v23, v20, v21, &v22, (uint64_t)v19);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a8, v15);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(a3);
  OUTLINED_FUNCTION_3_1();
}

uint64_t MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _BYTE v21[40];
  _BYTE v22[40];

  v10 = v6;
  OUTLINED_FUNCTION_5_3();
  if (qword_1ED7E0638 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_15();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED7E0D30);
  v13 = sub_1C2F244C0();
  v14 = sub_1C2F247F0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C2F05000, v13, v14, "Attempting to initialize an XPCListeningBridge without an XPCListener, this is not supported. Please use a different implementation if an XPCListener is not required. ", v15, 2u);
    MEMORY[0x1C3BCD824](v15, -1, -1);
  }

  OUTLINED_FUNCTION_4_3(v16, (uint64_t)v22);
  sub_1C2F0A0A4(a6, (uint64_t)v21);
  type metadata accessor for EmptyBridgeConnectionListener();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B50]), sel_init);
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B50]), sel_init);
  v17 = sub_1C2F0EF20();
  v18 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, _BYTE *, id))(v10 + 344))(v9, v8, v22, v7, a5, v21, v17);
  return OUTLINED_FUNCTION_6_1(v18);
}

void MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  swift_allocObject();
  OUTLINED_FUNCTION_1_3();
  __break(1u);
}

void MessageDispatchingXPCListeningBridgeBase.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_3();
  __break(1u);
}

void sub_1C2F169FC()
{
  uint64_t v0;

}

uint64_t MessageDispatchingXPCListeningBridgeBase.deinit()
{
  uint64_t v0;
  uint64_t v1;

  MessageDispatchingBridgeBase.deinit();
  v1 = v0;

  return v1;
}

uint64_t MessageDispatchingXPCListeningBridgeBase.__deallocating_deinit()
{
  MessageDispatchingXPCListeningBridgeBase.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F16A60()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

void sub_1C2F16A68()
{
  JUMPOUT(0x1C3BCD794);
}

uint64_t sub_1C2F16A78()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MessageDispatchingXPCListeningBridgeBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MessageDispatchingXPCListeningBridgeBase);
}

uint64_t method lookup function for MessageDispatchingXPCListeningBridgeBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of MessageDispatchingXPCListeningBridgeBase.__allocating_init(_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2F0A0A4(v2, a2);
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_0(v2);
  __swift_destroy_boxed_opaque_existential_0(v1);
  return a1;
}

uint64_t FeatureChecker.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FeatureChecker.init()();
  return v0;
}

uint64_t FeatureChecker.init()()
{
  uint64_t v0;
  char v1;
  _BYTE v3[24];
  ValueMetadata *v4;
  unint64_t v5;

  *(_BYTE *)(v0 + 16) = AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags();
  v4 = &type metadata for IntelligenceFlowFeatureFlags;
  v5 = sub_1C2F12280();
  v1 = sub_1C2F24394();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  *(_BYTE *)(v0 + 17) = v1 & 1;
  return v0;
}

uint64_t FeatureChecker.isSystemAssistantExperienceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FeatureChecker.isIntelligenceFlowFeatureEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t FeatureChecker.isSystemAssistantExperienceEnabled.getter()
{
  return AFDeviceSupportsSAE();
}

uint64_t FeatureChecker.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FeatureChecker.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F16C00()
{
  return FeatureChecker.isSystemAssistantExperienceSupported.getter() & 1;
}

uint64_t sub_1C2F16C24()
{
  return FeatureChecker.isSystemAssistantExperienceEnabled.getter() & 1;
}

uint64_t sub_1C2F16C3C()
{
  return FeatureChecker.isIntelligenceFlowFeatureEnabled.getter() & 1;
}

uint64_t dispatch thunk of FeatureChecking.isSystemAssistantExperienceSupported.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureChecking.isSystemAssistantExperienceEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FeatureChecking.isIntelligenceFlowFeatureEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for FeatureChecker()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeatureChecker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureChecker.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

BOOL sub_1C2F16CAC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1C2F16CB8(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_1C2F16D1C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1C2F16D9C + 4 * byte_1C2F25B46[a2]))(0x636972656E6567);
}

uint64_t sub_1C2F16D9C(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x636972656E6567 && v1 == 0xE700000000000000)
    v3 = 1;
  else
    v3 = OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12_0();
  return v3 & 1;
}

uint64_t sub_1C2F16E3C()
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1C2F24430();
  sub_1C2F1CF8C(&qword_1EF7D6798, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9E8C0], MEMORY[0x1E0D9E8D8]);
  sub_1C2F246C4();
  sub_1C2F246C4();
  if (v5 == v3 && v6 == v4)
    v1 = 1;
  else
    v1 = sub_1C2F24A3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t static MUXUtils.isUnknownUser(_:)(void *a1)
{
  return sub_1C2F17FB0(a1);
}

void static MUXUtils.isUnknownUser(withUserId:fromMUXContextMessage:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  id v4;

  v1 = OUTLINED_FUNCTION_71_1();
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_1C2F106B4(v0), (v3 & 1) != 0))
  {
    v4 = *(id *)(*(_QWORD *)(v1 + 56) + 8 * v2);
    OUTLINED_FUNCTION_12_0();
    static MUXUtils.isUnknownUser(_:)(v4);

  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  OUTLINED_FUNCTION_23();
}

void static MUXUtils.getAllUserIds(from:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  OUTLINED_FUNCTION_5_1();
  v1 = v0;
  v15[0] = *(_QWORD *)(OUTLINED_FUNCTION_2_5() - 8);
  OUTLINED_FUNCTION_14_0();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v15 - v6;
  sub_1C2F1CAC8(v1, (SEL *)&selRef_homeMembers, &qword_1EF7D67B8);
  v9 = v8;
  v15[1] = MEMORY[0x1E0DEE9E8];
  if (!v8)
    goto LABEL_16;
  if (!(v8 >> 62))
  {
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_1C2F24598();
    if (v10)
      goto LABEL_4;
LABEL_15:
    OUTLINED_FUNCTION_63();
LABEL_16:
    OUTLINED_FUNCTION_3_1();
    return;
  }
  sub_1C2F24598();
  v10 = sub_1C2F249F4();
  if (!v10)
    goto LABEL_15;
LABEL_4:
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x1C3BCD200](i, v9);
      else
        v12 = *(id *)(v9 + 8 * i + 32);
      v13 = v12;
      sub_1C2F1CBAC(v12, (SEL *)&selRef_sharedUserId);
      if (v14)
      {
        sub_1C2F24460();
        sub_1C2F1B9B0((uint64_t)v7, v5);

        OUTLINED_FUNCTION_78_0((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v15[0] + 8));
      }
      else
      {

      }
    }
    goto LABEL_15;
  }
  __break(1u);
}

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
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char *v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;

  OUTLINED_FUNCTION_5_1();
  v1 = OUTLINED_FUNCTION_2_5();
  v52 = *(_QWORD *)(v1 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_9_1();
  v49 = v3;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x1E0C80A78](v4);
  v48 = (char *)&v42 - v5;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_55_1();
  v47 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66A0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_34_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_55_1();
  v50 = v10;
  v11 = sub_1C2F243D0();
  v12 = *(_QWORD *)(v11 + 64);
  v44 = v11 + 64;
  v53 = MEMORY[0x1E0DEE9E8];
  v13 = 1 << *(_BYTE *)(v11 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v46 = v11;
  v43 = v45 - 1;
  sub_1C2F24598();
  v51 = 0;
  v16 = &unk_1EF7D66A8;
  v17 = v52;
  v18 = v47;
  v19 = (uint64_t)v48;
  if (!v15)
    goto LABEL_6;
LABEL_4:
  v20 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  v21 = v50;
  v22 = v20 | (v51 << 6);
  while (2)
  {
    v23 = v46;
    OUTLINED_FUNCTION_89_0(v0, *(_QWORD *)(v46 + 48) + *(_QWORD *)(v52 + 72) * v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v52 + 16));
    v24 = *(_QWORD *)(v23 + 56);
    v25 = OUTLINED_FUNCTION_91_0();
    v26 = *(void **)(v24 + 8 * v22);
    *(_QWORD *)(v0 + *(int *)(v25 + 48)) = v26;
    OUTLINED_FUNCTION_38_1(v0, 0, v27, v25);
    v28 = v26;
    while (1)
    {
      sub_1C2F1CA88(v0, v21, &qword_1EF7D66A0);
      v34 = OUTLINED_FUNCTION_91_0();
      OUTLINED_FUNCTION_87_0(v21, 1, v34);
      if (v35)
      {
        OUTLINED_FUNCTION_100();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_3_1();
        return;
      }
      v36 = *(void **)(v21 + *(int *)(v34 + 48));
      OUTLINED_FUNCTION_89_0(v18, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32));
      v37 = v0;
      v38 = v16;
      v39 = v49;
      OUTLINED_FUNCTION_89_0(v49, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
      v40 = (char *)v39;
      v16 = v38;
      v0 = v37;
      sub_1C2F1B9B0(v19, v40);

      v41 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v41(v19, v1);
      v41(v18, v1);
      if (v15)
        goto LABEL_4;
LABEL_6:
      v21 = v50;
      v29 = v51 + 1;
      if (__OFADD__(v51, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
      if (v29 < v45)
      {
        v30 = *(_QWORD *)(v44 + 8 * v29);
        if (v30)
          goto LABEL_9;
        v31 = v51 + 2;
        ++v51;
        if (v29 + 1 < v45)
        {
          v30 = *(_QWORD *)(v44 + 8 * v31);
          if (v30)
            goto LABEL_12;
          v51 = v29 + 1;
          if (v29 + 2 < v45)
          {
            v30 = *(_QWORD *)(v44 + 8 * (v29 + 2));
            if (v30)
            {
              v29 += 2;
              goto LABEL_9;
            }
            v51 = v29 + 2;
            if (v29 + 3 < v45)
            {
              v30 = *(_QWORD *)(v44 + 8 * (v29 + 3));
              if (v30)
              {
                v29 += 3;
                goto LABEL_9;
              }
              v31 = v29 + 4;
              v51 = v29 + 3;
              if (v29 + 4 < v45)
                break;
            }
          }
        }
      }
LABEL_26:
      v32 = OUTLINED_FUNCTION_91_0();
      OUTLINED_FUNCTION_38_1(v0, 1, v33, v32);
      v15 = 0;
    }
    v30 = *(_QWORD *)(v44 + 8 * v31);
    if (v30)
    {
LABEL_12:
      v29 = v31;
LABEL_9:
      v15 = (v30 - 1) & v30;
      v22 = __clz(__rbit64(v30)) + (v29 << 6);
      v51 = v29;
      continue;
    }
    break;
  }
  while (1)
  {
    v29 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v29 >= v45)
    {
      v51 = v43;
      goto LABEL_26;
    }
    v30 = *(_QWORD *)(v44 + 8 * v29);
    ++v31;
    if (v30)
      goto LABEL_9;
  }
LABEL_32:
  __break(1u);
}

void static MUXUtils.getUserIdToLoggableSharedUserIdDict(from:)()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  char v39;
  char v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  OUTLINED_FUNCTION_5_1();
  v5 = OUTLINED_FUNCTION_2_5();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_45_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66A0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_34_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_14_4();
  v9 = (_QWORD *)sub_1C2F24580();
  v10 = sub_1C2F243D0();
  v54 = 0;
  v47 = v10 + 64;
  v50 = v1;
  v51 = v10;
  OUTLINED_FUNCTION_13_2();
  v48 = v11 >> 6;
  v49 = v2;
  v46 = (v11 >> 6) - 1;
  v52 = v3;
  if (!v4)
    goto LABEL_4;
LABEL_2:
  OUTLINED_FUNCTION_66_0();
  v0 = v12 | (v54 << 6);
  while (2)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))(v2, *(_QWORD *)(v51 + 48) + *(_QWORD *)(v6 + 72) * v0, v5);
    v13 = *(_QWORD *)(v51 + 56);
    v14 = OUTLINED_FUNCTION_60_1();
    v15 = *(void **)(v13 + 8 * v0);
    *(_QWORD *)(v2 + *(int *)(v14 + 48)) = v15;
    __swift_storeEnumTagSinglePayload(v2, 0, 1, v14);
    v16 = v15;
    while (1)
    {
      sub_1C2F1CA88(v2, v3, &qword_1EF7D66A0);
      v23 = OUTLINED_FUNCTION_60_1();
      OUTLINED_FUNCTION_87_0(v3, 1, v23);
      if (v24)
      {
        swift_release();
        OUTLINED_FUNCTION_3_1();
        return;
      }
      v55 = v4;
      v25 = *(void **)(v3 + *(int *)(v23 + 48));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v3, v5);
      v26 = sub_1C2F2446C();
      v28 = v27;
      v29 = sub_1C2F1CBAC(v25, (SEL *)&selRef_loggableMultiUserSharedUserId);
      if (v30)
      {
        v31 = v30;
        v53 = v29;
        v0 = v6;
        swift_isUniquelyReferenced_nonNull_native();
        v32 = sub_1C2F10650(v26, v28);
        if (__OFADD__(v9[2], (v33 & 1) == 0))
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        v34 = v32;
        v35 = v33;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0600);
        if ((sub_1C2F249D0() & 1) != 0)
        {
          v36 = sub_1C2F10650(v26, v28);
          if ((v35 & 1) != (v37 & 1))
            goto LABEL_43;
          v34 = v36;
        }
        if ((v35 & 1) != 0)
        {
          v38 = (uint64_t *)(v9[7] + 16 * v34);
          swift_bridgeObjectRelease();
          *v38 = v53;
          v38[1] = v31;
        }
        else
        {
          OUTLINED_FUNCTION_47_1((uint64_t)&v9[v34 >> 6]);
          v41 = (uint64_t *)(v9[6] + 16 * v34);
          *v41 = v26;
          v41[1] = v28;
          v42 = (uint64_t *)(v9[7] + 16 * v34);
          *v42 = v53;
          v42[1] = v31;
          v43 = v9[2];
          v44 = __OFADD__(v43, 1);
          v45 = v43 + 1;
          if (v44)
            goto LABEL_41;
          v9[2] = v45;
          OUTLINED_FUNCTION_81_1();
        }
        OUTLINED_FUNCTION_62_0();
        OUTLINED_FUNCTION_17_3();
        OUTLINED_FUNCTION_39_1();
        v2 = v49;
        v1 = v50;
      }
      else
      {
        sub_1C2F24598();
        v0 = sub_1C2F10650(v26, v28);
        v40 = v39;
        OUTLINED_FUNCTION_24_1();
        if ((v40 & 1) != 0)
        {
          swift_isUniquelyReferenced_nonNull_native();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0600);
          v2 = v49;
          v1 = v50;
          sub_1C2F249D0();
          swift_bridgeObjectRelease();
          sub_1C2F249DC();
          OUTLINED_FUNCTION_62_0();
          OUTLINED_FUNCTION_12_0();
          OUTLINED_FUNCTION_51();
        }
        else
        {
          OUTLINED_FUNCTION_62_0();
        }
        swift_bridgeObjectRelease();
      }
      v3 = v52;
      v4 = v55;
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
      if (v55)
        goto LABEL_2;
LABEL_4:
      v17 = v54 + 1;
      if (__OFADD__(v54, 1))
        goto LABEL_40;
      if (v17 < v48)
      {
        if (*(_QWORD *)(v47 + 8 * v17))
          goto LABEL_7;
        v19 = v54 + 2;
        ++v54;
        if (v17 + 1 < v48)
        {
          if (*(_QWORD *)(v47 + 8 * v19))
            goto LABEL_7;
          v54 = v17 + 1;
          if (v17 + 2 < v48)
          {
            if (*(_QWORD *)(v47 + 8 * (v17 + 2)))
              goto LABEL_7;
            v20 = v17 + 3;
            v54 = v17 + 2;
            if (v17 + 3 < v48)
              break;
          }
        }
      }
LABEL_20:
      v22 = OUTLINED_FUNCTION_60_1();
      __swift_storeEnumTagSinglePayload(v2, 1, 1, v22);
      v4 = 0;
    }
    if (*(_QWORD *)(v47 + 8 * v20))
    {
LABEL_7:
      OUTLINED_FUNCTION_54_1();
      v54 = v18;
      continue;
    }
    break;
  }
  while (1)
  {
    v21 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v21 >= v48)
    {
      v54 = v46;
      goto LABEL_20;
    }
    ++v20;
    if (*(_QWORD *)(v47 + 8 * v21))
      goto LABEL_7;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  sub_1C2F24A54();
  __break(1u);
}

void static MUXUtils.getAllKnownUserIds(from:)()
{
  uint64_t v0;
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
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  char v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[6];

  OUTLINED_FUNCTION_5_1();
  v2 = OUTLINED_FUNCTION_2_5();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_9_1();
  v56 = (char *)v4;
  OUTLINED_FUNCTION_32_0();
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v48 - v7;
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66A0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_35_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_55_1();
  v59 = v11;
  v12 = sub_1C2F243D0();
  v65[4] = MEMORY[0x1E0DEE9E8];
  v13 = *(_QWORD *)(v12 + 64);
  v50 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v54 = (unint64_t)(v14 + 63) >> 6;
  v48 = v54 - 1;
  v17 = sub_1C2F24598();
  v18 = 0;
  v57 = v17;
  v49 = v17 + 112;
  v52 = v3;
  v53 = v2;
  v51 = v8;
  v55 = v1;
  v58 = v0;
  if (!v16)
    goto LABEL_6;
  while (2)
  {
    v60 = (v16 - 1) & v16;
    v61 = v18;
    v19 = __clz(__rbit64(v16)) | (v18 << 6);
LABEL_5:
    OUTLINED_FUNCTION_58_0(v0, *(_QWORD *)(v57 + 48) + *(_QWORD *)(v3 + 72) * v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
    v20 = OUTLINED_FUNCTION_93_0();
    OUTLINED_FUNCTION_16_3(v20);
LABEL_12:
    v29 = v59;
    sub_1C2F1CA88(v0, v59, &qword_1EF7D66A0);
    v30 = OUTLINED_FUNCTION_93_0();
    OUTLINED_FUNCTION_87_0(v29, 1, v30);
    if (v41)
    {
      OUTLINED_FUNCTION_100();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_3_1();
      return;
    }
    v31 = *(void **)(v29 + *(int *)(v30 + 48));
    OUTLINED_FUNCTION_58_0(v1, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
    v32 = sub_1C2F1C7A8(v31);
    if (!v32)
      goto LABEL_31;
    v33 = *(_QWORD *)(v32 + 16);
    if (!v33)
    {
LABEL_30:
      OUTLINED_FUNCTION_12_0();
      v1 = v55;
LABEL_31:
      v43 = v56;
      OUTLINED_FUNCTION_58_0((uint64_t)v56, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
      sub_1C2F1B9B0((uint64_t)v8, v43);

      v44 = *(void (**)(char *, uint64_t))(v3 + 8);
      v44(v8, v2);
      v44((char *)v1, v2);
      goto LABEL_32;
    }
    v34 = v32 + 32;
    v35 = OUTLINED_FUNCTION_19_2();
    while (1)
    {
      OUTLINED_FUNCTION_46_1(v35, (uint64_t)v65);
      sub_1C2F09238((uint64_t)v65, (uint64_t)&v64);
      v36 = OUTLINED_FUNCTION_73_0();
      v37 = v63;
      if (v36)
        v38 = v62;
      else
        v38 = 0;
      v39 = sub_1C2F24604();
      if (!v36 || !v37)
      {
        OUTLINED_FUNCTION_34_0();
        v35 = OUTLINED_FUNCTION_94();
        goto LABEL_28;
      }
      v41 = v38 == v39 && v37 == v40;
      if (v41)
        break;
      v42 = OUTLINED_FUNCTION_68();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_34_0();
      v35 = OUTLINED_FUNCTION_94();
      if ((v42 & 1) != 0)
        goto LABEL_35;
LABEL_28:
      v34 += 32;
      if (!--v33)
      {
        OUTLINED_FUNCTION_12_0();
        v3 = v52;
        v2 = v53;
        v8 = v51;
        goto LABEL_30;
      }
    }
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_94();
LABEL_35:
    OUTLINED_FUNCTION_63();
    v3 = v52;
    v2 = v53;
    v1 = v55;
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v53);

    v8 = v51;
LABEL_32:
    v0 = v58;
    v16 = v60;
    v18 = v61;
    if (v60)
      continue;
    break;
  }
LABEL_6:
  if (!__OFADD__(v18, 1))
  {
    if (v18 + 1 >= v54)
    {
      v26 = v18;
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_57_1();
    if (v22)
      goto LABEL_9;
    v26 = v21;
    if (v21 + 1 < v54)
    {
      if (*(_QWORD *)(v50 + 8 * (v21 + 1)))
        goto LABEL_9;
      v26 = v21 + 1;
      if (v21 + 2 < v54)
      {
        if (*(_QWORD *)(v50 + 8 * (v21 + 2)))
          goto LABEL_9;
        v26 = v21 + 2;
        if (v21 + 3 < v54)
        {
          if (!*(_QWORD *)(v50 + 8 * (v21 + 3)))
          {
            v26 = v21 + 3;
            if (v21 + 4 < v54)
            {
              OUTLINED_FUNCTION_57_1();
              if (v46)
                goto LABEL_9;
              while (v45 + 6 < v54)
              {
                if (*(_QWORD *)(v49 + 8 * v45++))
                  goto LABEL_9;
              }
              v26 = v48;
            }
            goto LABEL_11;
          }
LABEL_9:
          OUTLINED_FUNCTION_33_0();
          v60 = v24;
          v61 = v23;
          v19 = v25 + (v23 << 6);
          goto LABEL_5;
        }
      }
    }
LABEL_11:
    v27 = OUTLINED_FUNCTION_93_0();
    OUTLINED_FUNCTION_38_1(v0, 1, v28, v27);
    v60 = 0;
    v61 = v26;
    goto LABEL_12;
  }
  __break(1u);
}

void static MUXUtils.getUserIdForPrimaryUser(from:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
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
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  _BYTE v34[32];

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_19_2();
  for (; v2; v2 = OUTLINED_FUNCTION_76_1())
  {
    v3 = 0;
    v4 = v1 & 0xC000000000000001;
    v5 = v1 + 32;
    v31 = v2;
    v32 = v1;
    v29 = v1 + 32;
    v30 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v4)
        OUTLINED_FUNCTION_84_1();
      v6 = *(id *)(v5 + 8 * v3);
      v7 = v6;
      if (__OFADD__(v3++, 1))
        break;
      v9 = sub_1C2F1C7A8(v6);
      if (v9)
      {
        v10 = *(_QWORD *)(v9 + 16);
        if (v10)
        {
          v11 = OUTLINED_FUNCTION_18_3();
          do
          {
            v12 = OUTLINED_FUNCTION_46_1(v11, (uint64_t)v34);
            OUTLINED_FUNCTION_72_1(v12, v13, v14, v15, v16, v17, v18, v19);
            OUTLINED_FUNCTION_73_0();
            OUTLINED_FUNCTION_28();
            v20 = OUTLINED_FUNCTION_12_0();
            v11 = OUTLINED_FUNCTION_26_0(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
            v5 += 32;
            --v10;
          }
          while (v10);

          OUTLINED_FUNCTION_63();
          v2 = v31;
          v1 = v32;
          v5 = v29;
          v4 = v30;
        }
        else
        {

          OUTLINED_FUNCTION_51();
        }
      }
      else
      {

      }
      if (v3 == v2)
        goto LABEL_15;
    }
    __break(1u);
LABEL_17:
    OUTLINED_FUNCTION_19_2();
  }
LABEL_15:
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17_4();
}

uint64_t static MUXUtils.isOwner(_:)(void *a1)
{
  return sub_1C2F17FB0(a1);
}

uint64_t sub_1C2F17FB0(void *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
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
  _BYTE v30[32];
  _BYTE v31[32];

  result = sub_1C2F1C7A8(a1);
  if (!result)
    return result;
  v2 = *(_QWORD *)(result + 16);
  if (!v2)
  {
    OUTLINED_FUNCTION_7();
    return 0;
  }
  v3 = result + 32;
  OUTLINED_FUNCTION_4();
  while (1)
  {
    sub_1C2F09238(v3, (uint64_t)v31);
    sub_1C2F09238((uint64_t)v31, (uint64_t)v30);
    v4 = OUTLINED_FUNCTION_73_0();
    if (v4)
      v5 = v28;
    else
      v5 = 0;
    v6 = sub_1C2F24604();
    if (!v4 || !v29)
    {
      v16 = OUTLINED_FUNCTION_24_1();
      OUTLINED_FUNCTION_67_0(v16, v17, v18, v19, v20, v21);
      goto LABEL_16;
    }
    if (v5 == v6 && v29 == v7)
      break;
    v9 = OUTLINED_FUNCTION_68();
    swift_bridgeObjectRelease();
    v10 = OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_67_0(v10, v11, v12, v13, v14, v15);
    if ((v9 & 1) != 0)
      goto LABEL_21;
LABEL_16:
    v3 += 32;
    if (!--v2)
    {
      OUTLINED_FUNCTION_63();
      return 0;
    }
  }
  v22 = OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_67_0(v22, v23, v24, v25, v26, v27);
LABEL_21:
  OUTLINED_FUNCTION_63();
  return 1;
}

void static MUXUtils.getUserIdForUnknownUserAsString(from:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
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
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  _BYTE v34[32];

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_19_2();
  for (; v2; v2 = OUTLINED_FUNCTION_76_1())
  {
    v3 = 0;
    v4 = v1 & 0xC000000000000001;
    v5 = v1 + 32;
    v31 = v2;
    v32 = v1;
    v29 = v1 + 32;
    v30 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v4)
        OUTLINED_FUNCTION_84_1();
      v6 = *(id *)(v5 + 8 * v3);
      v7 = v6;
      if (__OFADD__(v3++, 1))
        break;
      v9 = sub_1C2F1C7A8(v6);
      if (v9)
      {
        v10 = *(_QWORD *)(v9 + 16);
        if (v10)
        {
          v11 = OUTLINED_FUNCTION_18_3();
          do
          {
            v12 = OUTLINED_FUNCTION_46_1(v11, (uint64_t)v34);
            OUTLINED_FUNCTION_72_1(v12, v13, v14, v15, v16, v17, v18, v19);
            OUTLINED_FUNCTION_73_0();
            OUTLINED_FUNCTION_28();
            v20 = OUTLINED_FUNCTION_12_0();
            v11 = OUTLINED_FUNCTION_26_0(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
            v5 += 32;
            --v10;
          }
          while (v10);

          OUTLINED_FUNCTION_63();
          v2 = v31;
          v1 = v32;
          v5 = v29;
          v4 = v30;
        }
        else
        {

          OUTLINED_FUNCTION_51();
        }
      }
      else
      {

      }
      if (v3 == v2)
        goto LABEL_15;
    }
    __break(1u);
LABEL_17:
    OUTLINED_FUNCTION_19_2();
  }
LABEL_15:
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17_4();
}

uint64_t static MUXUtils.getUserIdForUnknownUser(fromHomeMemberInfo:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  static MUXUtils.getUserIdForUnknownUserAsString(from:)(a1);
  if (v3)
  {
    sub_1C2F24460();
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  v5 = OUTLINED_FUNCTION_2_5();
  return __swift_storeEnumTagSinglePayload(a2, v4, 1, v5);
}

uint64_t static MUXUtils.getUserIdForUnknownUser(fromHomeMemberInfoDict:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_1C2F24598();
  v3 = sub_1C2F1C6C4(v2);
  OUTLINED_FUNCTION_34_0();
  static MUXUtils.getUserIdForUnknownUserAsString(from:)((unint64_t)v3);
  if (v4)
  {
    sub_1C2F24460();
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_38_1(a1, v5, v7, v6);
  return swift_release();
}

void static MUXUtils.homeMember(withUserId:from:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  id v4;

  v1 = OUTLINED_FUNCTION_71_1();
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = sub_1C2F106B4(v0);
    if ((v3 & 1) != 0)
      v4 = *(id *)(*(_QWORD *)(v1 + 56) + 8 * v2);
  }
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_23();
}

void static MUXUtils.singleKnownUserInHome(muxContextMessage:)()
{
  uint64_t v0;
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[120];
  uint64_t v49;
  uint64_t v50;

  OUTLINED_FUNCTION_5_1();
  v49 = v3;
  v50 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66A0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_35_1();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v34 - v7;
  v9 = sub_1C2F243D0();
  v42 = 0;
  v10 = 0;
  v37 = v9 + 64;
  OUTLINED_FUNCTION_13_2();
  v38 = v12 >> 6;
  v39 = v11;
  v35 = (v12 >> 6) - 1;
  v36 = v11 + 104;
  v40 = v8;
  v41 = v1;
  while (1)
  {
LABEL_2:
    if (v2)
    {
      OUTLINED_FUNCTION_66_0();
      v0 = v13 | (v10 << 6);
LABEL_4:
      v14 = *(_QWORD *)(v39 + 48);
      v15 = OUTLINED_FUNCTION_2_5();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v1, v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * v0, v15);
      v16 = OUTLINED_FUNCTION_90_0();
      OUTLINED_FUNCTION_16_3(v16);
      goto LABEL_11;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      return;
    }
    if (v17 >= v38)
    {
      v0 = v10;
    }
    else
    {
      if (*(_QWORD *)(v37 + 8 * v17))
        goto LABEL_8;
      v0 = v10 + 1;
      if (v10 + 2 < v38)
      {
        if (*(_QWORD *)(v37 + 8 * (v10 + 2)))
          goto LABEL_8;
        v0 = v10 + 2;
        if (v10 + 3 < v38)
        {
          if (*(_QWORD *)(v37 + 8 * (v10 + 3)))
            goto LABEL_8;
          v0 = v10 + 3;
          if (v10 + 4 < v38)
          {
            if (*(_QWORD *)(v37 + 8 * (v10 + 4)))
            {
LABEL_8:
              OUTLINED_FUNCTION_54_1();
              v10 = v18;
              goto LABEL_4;
            }
            while (v10 + 5 < v38)
            {
              if (*(_QWORD *)(v36 + 8 * v10++))
                goto LABEL_8;
            }
            v0 = v35;
          }
        }
      }
    }
    v19 = OUTLINED_FUNCTION_90_0();
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v19);
    v2 = 0;
    v10 = v0;
LABEL_11:
    sub_1C2F1CA88(v1, (uint64_t)v8, &qword_1EF7D66A0);
    v0 = OUTLINED_FUNCTION_90_0();
    OUTLINED_FUNCTION_87_0((uint64_t)v8, 1, v0);
    if (v28)
    {
      swift_release();
      return;
    }
    v43 = v2;
    v44 = v10;
    v20 = *(void **)&v8[*(int *)(v0 + 48)];
    v21 = sub_1C2F1C7A8(v20);
    if (!v21)
    {

      goto LABEL_30;
    }
    v22 = *(_QWORD *)(v21 + 16);
    if (!v22)
      break;
    v0 = v21 + 32;
    OUTLINED_FUNCTION_81_1();
    while (1)
    {
      sub_1C2F09238(v0, (uint64_t)v48);
      sub_1C2F09238((uint64_t)v48, (uint64_t)&v47);
      v23 = OUTLINED_FUNCTION_73_0();
      v24 = v46;
      if (v23)
        v25 = v45;
      else
        v25 = 0;
      v26 = sub_1C2F24604();
      if (!v23 || !v24)
      {
        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_77_1();
        goto LABEL_27;
      }
      v28 = v25 == v26 && v24 == v27;
      if (v28)
        break;
      v29 = OUTLINED_FUNCTION_68();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_77_1();
      if ((v29 & 1) != 0)
        goto LABEL_33;
LABEL_27:
      v0 += 32;
      if (!--v22)
      {

        OUTLINED_FUNCTION_63();
        v8 = v40;
        goto LABEL_29;
      }
    }
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_77_1();
LABEL_33:
    OUTLINED_FUNCTION_63();

    v31 = OUTLINED_FUNCTION_2_5();
    v8 = v40;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v40, v31);
    v1 = v41;
    v2 = v43;
    v10 = v44;
  }

  OUTLINED_FUNCTION_17_3();
LABEL_29:
  v1 = v41;
LABEL_30:
  v2 = v43;
  v10 = v44;
  if ((v42 & 1) == 0)
  {
    v30 = OUTLINED_FUNCTION_2_5();
    OUTLINED_FUNCTION_40_1(v30);
    v42 = 1;
    goto LABEL_2;
  }
  swift_release();
  v33 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_40_1(v33);
}

uint64_t static MUXUtils.isMUXEnabled()()
{
  return AFDeviceSupportsSiriMUX();
}

void static MUXUtils.convertToUserIDToSpeechPackageDict(sharedUserIdToSpeechRecognitionDict:)()
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
  _QWORD *v9;
  uint64_t v10;
  unint64_t i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  id v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
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

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v44 = OUTLINED_FUNCTION_2_5();
  v42 = *(_QWORD *)(v44 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_24_2(v5, v37);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_4();
  v38 = v3 + 64;
  OUTLINED_FUNCTION_4_4();
  v39 = v7;
  v41 = v3;
  OUTLINED_FUNCTION_4();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v40 = v1;
  if (!v0)
    goto LABEL_3;
LABEL_2:
  OUTLINED_FUNCTION_25_1();
  for (i = v10 | (v8 << 6); ; i = __clz(__rbit64(v13)) + (v8 << 6))
  {
    v15 = *(void **)(*(_QWORD *)(v41 + 56) + 8 * i);
    OUTLINED_FUNCTION_19_2();
    v16 = v15;
    sub_1C2F24460();
    sub_1C2F10940(0, &qword_1EF7D66B8);
    v17 = objc_allocWithZone(MEMORY[0x1E0CFEA20]);
    v18 = v16;
    v19 = sub_1C2F18B84(v16, v16, objc_msgSend(v17, sel_init), 1, 0.0);
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
    v20(v43, v1, v44);
    if (v19)
    {
      v21 = v19;
      OUTLINED_FUNCTION_82_0();
      OUTLINED_FUNCTION_73_1();
      OUTLINED_FUNCTION_50_0();
      if (v24)
      {
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      v25 = v22;
      v26 = v23;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D66C0);
      if ((sub_1C2F249D0() & 1) != 0)
      {
        v27 = sub_1C2F106B4(v43);
        if ((v26 & 1) != (v28 & 1))
          goto LABEL_38;
        v25 = v27;
      }
      if ((v26 & 1) != 0)
      {
        v29 = v9[7];

        *(_QWORD *)(v29 + 8 * v25) = v21;
        v30 = v43;
      }
      else
      {
        OUTLINED_FUNCTION_61_0((uint64_t)&v9[v25 >> 6]);
        v30 = v43;
        v20(v34 + *(_QWORD *)(v42 + 72) * v25, v43, v44);
        *(_QWORD *)(v9[7] + 8 * v25) = v21;
        v35 = v9[2];
        v24 = __OFADD__(v35, 1);
        v36 = v35 + 1;
        if (v24)
          goto LABEL_36;
        v9[2] = v36;
      }
      OUTLINED_FUNCTION_39_1();
    }
    else
    {
      OUTLINED_FUNCTION_81_1();
      v31 = OUTLINED_FUNCTION_73_1();
      v33 = v32;
      OUTLINED_FUNCTION_17_3();
      if ((v33 & 1) != 0)
      {
        OUTLINED_FUNCTION_82_0();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D66C0);
        sub_1C2F249D0();
        OUTLINED_FUNCTION_79_0(v9[6] + *(_QWORD *)(v42 + 72) * v31);
        v21 = *(id *)(v9[7] + 8 * v31);
        sub_1C2F1CF8C(&qword_1EF7D6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
        sub_1C2F249DC();
        OUTLINED_FUNCTION_39_1();
      }
      else
      {
        v21 = 0;
      }
      v30 = v43;
    }
    OUTLINED_FUNCTION_79_0(v30);

    v1 = v40;
    OUTLINED_FUNCTION_79_0(v40);
    if (v0)
      goto LABEL_2;
LABEL_3:
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_35;
    if (v12 >= v39)
      goto LABEL_33;
    v13 = *(_QWORD *)(v38 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v39)
        goto LABEL_33;
      v13 = *(_QWORD *)(v38 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v39)
          goto LABEL_33;
        v13 = *(_QWORD *)(v38 + 8 * v8);
        if (!v13)
          break;
      }
    }
LABEL_16:
    v0 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v39)
  {
LABEL_33:
    swift_release();
    OUTLINED_FUNCTION_3_1();
    return;
  }
  v13 = *(_QWORD *)(v38 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_16;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v39)
      goto LABEL_33;
    v13 = *(_QWORD *)(v38 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  sub_1C2F24A54();
  __break(1u);
}

id sub_1C2F18B84(void *a1, void *a2, void *a3, char a4, double a5)
{
  id v8;

  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4 & 1, a5);

  return v8;
}

void static MUXUtils.voiceIdentificationSignal(withRequestId:requestType:isPersonalRequest:isServerFallback:voiceIdClassification:voiceIdOverridden:selectedUserId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
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
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  const char *v48;
  char v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  _BOOL4 v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  char v73;

  OUTLINED_FUNCTION_5_1();
  v69 = v21;
  v73 = v22;
  v72 = v23;
  v25 = v24;
  v71 = v26;
  v70 = v27;
  v29 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66D0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_8();
  v33 = v32 - v31;
  v34 = sub_1C2F24388();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_8();
  v38 = v37 - v36;
  v39 = sub_1C2F24430();
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_8();
  v43 = v42 - v41;
  if ((v25 & 1) != 0)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v44 = OUTLINED_FUNCTION_15();
    v45 = OUTLINED_FUNCTION_2_3(v44, (uint64_t)qword_1ED7E0D30);
    v46 = sub_1C2F247E4();
    if (OUTLINED_FUNCTION_67(v46))
    {
      v47 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v47 = 0;
      v48 = "Not sending VoiceIdentificationSignal in case of server fallback";
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_30;
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v43, *MEMORY[0x1E0D9E8A0], v39);
  v49 = sub_1C2F16E3C();
  OUTLINED_FUNCTION_78_0(v43, *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
  if ((v49 & 1) == 0)
  {
    if (qword_1ED7E0638 != -1)
      swift_once();
    v60 = OUTLINED_FUNCTION_15();
    v45 = OUTLINED_FUNCTION_2_3(v60, (uint64_t)qword_1ED7E0D30);
    v61 = sub_1C2F247E4();
    if (OUTLINED_FUNCTION_67(v61))
    {
      v47 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v47 = 0;
      v48 = "Not sending VoiceIdentification since this is not a speech request";
LABEL_20:
      _os_log_impl(&dword_1C2F05000, v45, (os_log_type_t)v38, v48, v47, 2u);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_21;
  }
  v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88418]), sel_init);
  sub_1C2F2437C();
  v51 = sub_1C2F24358();
  v53 = v52;
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v38, v34);
  OUTLINED_FUNCTION_88_0(v51, v53, v54, (SEL *)&selRef_setAceId_);
  v55 = v50;
  sub_1C2F1C86C(v29, v70, v55);

  objc_msgSend(v55, sel_setRecordUserAudio_, (v71 & 1) == 0);
  v57 = (v73 & 1) == 0 && (unint64_t)(v72 - 3) < 2;
  sub_1C2F1C8B0(a21, v33);
  v58 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_87_0(v33, 1, v58);
  if (v59)
  {
    sub_1C2F1C8F8(v33);
  }
  else
  {
    v62 = sub_1C2F2446C();
    v64 = v63;
    OUTLINED_FUNCTION_92_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 8));
    if (v57 && (v69 & 1) == 0)
    {
      sub_1C2F1CC08(v62, v64, v55, (SEL *)&selRef_setSelectedSharedUserId_);
      goto LABEL_30;
    }
    OUTLINED_FUNCTION_7();
  }
  if (qword_1ED7E0638 != -1)
    swift_once();
  v65 = OUTLINED_FUNCTION_15();
  v66 = OUTLINED_FUNCTION_2_3(v65, (uint64_t)qword_1ED7E0D30);
  v67 = sub_1C2F247E4();
  if (os_log_type_enabled(v66, v67))
  {
    v68 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v68 = 67109376;
    sub_1C2F248C8();
    *(_WORD *)(v68 + 8) = 1024;
    OUTLINED_FUNCTION_8_1();
    _os_log_impl(&dword_1C2F05000, v66, v67, "Not updating selectedSharedUserId in VoiceIdentificationSignal because either selectedUserId is nil or isConfidentEnough: %{BOOL}d, voiceIDOverridden: %{BOOL}d", (uint8_t *)v68, 0xEu);
    OUTLINED_FUNCTION_0();
  }

LABEL_30:
  OUTLINED_FUNCTION_3_1();
}

void static MUXUtils.generateDefaultVoiceIdScoreCard(withRMVEnabled:_:_:_:)()
{
  uint64_t v0;
  char v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(void *);
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  BOOL v56;
  unint64_t v57;
  char v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  os_log_type_t v70;
  _QWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, NSObject *, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;

  OUTLINED_FUNCTION_5_1();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66D0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_8();
  v12 = (v11 - v10);
  v13 = OUTLINED_FUNCTION_2_5();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_14_4();
  if ((v8 & 1) == 0)
  {
    if ((v2 & 1) != 0
      && (static MUXUtils.getUserIdForPrimaryUser(from:)(v6), v12 = v24, swift_bridgeObjectRelease(), !v12))
    {
      static MUXUtils.getUserIdForUnknownUserAsString(from:)(v6);
      if (!v47)
      {
        if (qword_1ED7E0638 != -1)
          swift_once();
        v69 = OUTLINED_FUNCTION_15();
        OUTLINED_FUNCTION_2_3(v69, (uint64_t)qword_1ED7E0D30);
        v70 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_67(v70))
        {
          v22 = (uint8_t *)OUTLINED_FUNCTION_3();
          *(_DWORD *)v22 = 67109120;
          LODWORD(v79) = 0;
          OUTLINED_FUNCTION_8_1();
          v23 = "generateDefaultVoiceIdScoreCard: Unknown user missing from homemebers list when RMV=%{BOOL}d";
LABEL_29:
          _os_log_impl(&dword_1C2F05000, v12, (os_log_type_t)v4, v23, v22, 8u);
          OUTLINED_FUNCTION_0();
        }
        goto LABEL_30;
      }
      v48 = v46;
      v49 = v47;
      v29 = OUTLINED_FUNCTION_48();
      *(_QWORD *)(v29 + 16) = v48;
      *(_QWORD *)(v29 + 24) = v49;
      objc_allocWithZone(MEMORY[0x1E0CFEAB8]);
      v30 = sub_1C2F1C97C;
    }
    else
    {
      static MUXUtils.getUserIdForPrimaryUser(from:)(v6);
      if (!v26)
      {
        if (qword_1ED7E0638 == -1)
          goto LABEL_27;
        goto LABEL_63;
      }
      v27 = v25;
      v28 = v26;
      v29 = OUTLINED_FUNCTION_48();
      *(_QWORD *)(v29 + 16) = v27;
      *(_QWORD *)(v29 + 24) = v28;
      objc_allocWithZone(MEMORY[0x1E0CFEAB8]);
      v30 = sub_1C2F1C95C;
    }
    sub_1C2F1B5CC((uint64_t)v30, v29);
    goto LABEL_47;
  }
  v77 = v18;
  sub_1C2F1C8B0((uint64_t)v4, (uint64_t)v12);
  OUTLINED_FUNCTION_87_0((uint64_t)v12, 1, v13);
  if (v19)
  {
    sub_1C2F1C8F8((uint64_t)v12);
    if (qword_1ED7E0638 == -1)
      goto LABEL_5;
    goto LABEL_57;
  }
  v74 = *(void (**)(uint64_t, NSObject *, uint64_t))(v14 + 32);
  v75 = v17;
  v74(v0, v12, v13);
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v12 = v6;
    else
      v12 = (v6 & 0xFFFFFFFFFFFFFF8);
    sub_1C2F24598();
    v31 = OUTLINED_FUNCTION_76_1();
    OUTLINED_FUNCTION_24_1();
  }
  else
  {
    v31 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v76 = v0;
  if (!v31)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v42 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    if (v42)
    {
      v72 = v14;
      v73 = v13;
LABEL_35:
      v78 = sub_1C2F10940(0, &qword_1EF7D66D8);
      OUTLINED_FUNCTION_19_2();
      v71[1] = v4;
      v50 = v4 + 5;
      v51 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      while (1)
      {
        v52 = *(v50 - 1);
        v53 = *v50;
        OUTLINED_FUNCTION_43_1();
        v12 = sub_1C2F24898();
        OUTLINED_FUNCTION_82_0();
        v79 = v51;
        LOBYTE(v4) = (_BYTE)v51;
        sub_1C2F10650(v52, v53);
        OUTLINED_FUNCTION_50_0();
        if (v56)
          break;
        v57 = v54;
        v58 = v55;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66E0);
        v4 = &v79;
        if ((sub_1C2F249D0() & 1) != 0)
        {
          LOBYTE(v4) = (_BYTE)v79;
          v59 = sub_1C2F10650(v52, v53);
          if ((v58 & 1) != (v60 & 1))
            goto LABEL_65;
          v57 = v59;
        }
        v51 = v79;
        if ((v58 & 1) != 0)
        {
          v61 = v79[7];

          *(_QWORD *)(v61 + 8 * v57) = v12;
        }
        else
        {
          OUTLINED_FUNCTION_61_0((uint64_t)&v79[v57 >> 6]);
          v63 = (uint64_t *)(v62 + 16 * v57);
          *v63 = v52;
          v63[1] = v53;
          *(_QWORD *)(v51[7] + 8 * v57) = v12;
          v64 = v51[2];
          v56 = __OFADD__(v64, 1);
          v65 = v64 + 1;
          if (v56)
            goto LABEL_56;
          v51[2] = v65;
          OUTLINED_FUNCTION_43_1();
        }
        v50 += 2;
        OUTLINED_FUNCTION_20_0();
        OUTLINED_FUNCTION_39_1();
        if (!--v42)
        {
          OUTLINED_FUNCTION_12_0();
          v14 = v72;
          v13 = v73;
          goto LABEL_46;
        }
      }
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      swift_once();
LABEL_5:
      v20 = OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_2_3(v20, (uint64_t)qword_1ED7E0D30);
      v21 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_67(v21))
      {
        v22 = (uint8_t *)OUTLINED_FUNCTION_3();
        *(_DWORD *)v22 = 67109120;
        LODWORD(v79) = 1;
        OUTLINED_FUNCTION_8_1();
        v23 = "generateDefaultIdentityScoreCard: Unknown user id not available when RMV=%{BOOL}d";
        goto LABEL_29;
      }
LABEL_30:

LABEL_48:
      OUTLINED_FUNCTION_3_1();
      return;
    }
    v51 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_46:
    OUTLINED_FUNCTION_12_0();
    v66 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v75, v76, v13);
    v67 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v68 = swift_allocObject();
    *(_QWORD *)(v68 + 16) = v51;
    v74(v68 + v67, v66, v13);
    objc_allocWithZone(MEMORY[0x1E0CFEAB8]);
    sub_1C2F1B5CC((uint64_t)sub_1C2F1CA08, v68);
    OUTLINED_FUNCTION_92_0(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
LABEL_47:
    swift_release();
    goto LABEL_48;
  }
  v72 = v14;
  v73 = v13;
  v79 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v4 = &v79;
  sub_1C2F1B8B4(0, v31 & ~(v31 >> 63), 0);
  if (v31 < 0)
  {
    __break(1u);
LABEL_63:
    swift_once();
LABEL_27:
    v44 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_2_3(v44, (uint64_t)qword_1ED7E0D30);
    v45 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_67(v45))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_DWORD *)v22 = 67109120;
      LODWORD(v79) = 0;
      OUTLINED_FUNCTION_8_1();
      v23 = "generateDefaultVoiceIdScoreCard: Primary user is missing from homemebers list when RMV=%{BOOL}d";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v32 = 0;
  v4 = v79;
  v12 = &selRef_sharedUserId;
  while (1)
  {
    if (v31 == v32)
      goto LABEL_55;
    v33 = v4;
    v34 = (v6 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C3BCD200](v32, v6) : *(id *)(v6 + 8 * v32 + 32);
    v35 = v34;
    v36 = sub_1C2F1CBAC(v34, (SEL *)&selRef_sharedUserId);
    if (!v37)
      break;
    v38 = v36;
    v39 = v37;

    v4 = v33;
    v79 = v33;
    v41 = v33[2];
    v40 = v33[3];
    v42 = v41 + 1;
    if (v41 >= v40 >> 1)
    {
      sub_1C2F1B8B4((char *)(v40 > 1), v41 + 1, 1);
      v4 = v79;
    }
    ++v32;
    v4[2] = v42;
    v43 = &v4[2 * v41];
    v43[4] = v38;
    v43[5] = v39;
    if (v31 == v32)
      goto LABEL_35;
  }
  __break(1u);
LABEL_65:
  sub_1C2F24A54();
  __break(1u);
}

id sub_1C2F19690(id result)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    v1 = result;
    sub_1C2F10940(0, &qword_1EF7D66D8);
    v2 = (void *)sub_1C2F24898();
    objc_msgSend(v1, sel_setSpIdAudioProcessedDuration_, v2);

    v3 = (void *)sub_1C2F24898();
    objc_msgSend(v1, sel_setSpIdUnknownUserScore_, v3);

    v4 = (void *)sub_1C2F2455C();
    objc_msgSend(v1, sel_setSpIdKnownUserScores_, v4);

    v5 = (void *)sub_1C2F24898();
    objc_msgSend(v1, sel_setSpIdUserScoresVersion_, v5);

    objc_msgSend(v1, sel_setSpIdScoreThresholdingType_, 0);
    objc_msgSend(v1, sel_setSpIdAssetVersion_, 0);
    sub_1C2F2446C();
    v6 = (void *)sub_1C2F245F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setUserClassified_, v6);

    return objc_msgSend(v1, sel_setUserIdentityClassification_, 0);
  }
  return result;
}

id sub_1C2F197F8(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t inited;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;

  if (result)
  {
    v8 = result;
    sub_1C2F10940(0, &qword_1EF7D66D8);
    v9 = (void *)OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_86_1((uint64_t)v9, sel_setSpIdAudioProcessedDuration_);

    v10 = (void *)OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_86_1((uint64_t)v10, sel_setSpIdUnknownUserScore_);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D6730);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C2F25640;
    *(_QWORD *)(inited + 32) = a2;
    *(_QWORD *)(inited + 40) = a3;
    OUTLINED_FUNCTION_43_1();
    *(_QWORD *)(inited + 48) = sub_1C2F24898();
    sub_1C2F24580();
    v12 = (void *)sub_1C2F2455C();
    OUTLINED_FUNCTION_24_1();
    objc_msgSend(v8, sel_setSpIdKnownUserScores_, v12);

    v13 = (void *)OUTLINED_FUNCTION_59_1();
    OUTLINED_FUNCTION_85_1((uint64_t)v13, sel_setSpIdUserScoresVersion_);

    v15 = OUTLINED_FUNCTION_83_1(v14, sel_setSpIdScoreThresholdingType_);
    OUTLINED_FUNCTION_83_1((uint64_t)v15, sel_setSpIdAssetVersion_);
    v16 = (void *)sub_1C2F245F8();
    OUTLINED_FUNCTION_85_1((uint64_t)v16, sel_setUserClassified_);

    return objc_msgSend(v8, sel_setUserIdentityClassification_, a5);
  }
  return result;
}

void Dictionary<>.toEncodableDictionary()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  unint64_t v47;
  char v48;
  BOOL v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
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
  id v80[2];

  v80[1] = *(id *)MEMORY[0x1E0C80C00];
  v75 = *(_QWORD *)(a2 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_4_0();
  v72 = v8;
  v9 = OUTLINED_FUNCTION_95_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_24_2(v11, v63);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_14_4();
  v76 = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v14 = sub_1C2F248BC();
  v73 = *(_QWORD *)(v14 - 8);
  v74 = v14;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v63 - v17;
  v64 = a1 + 64;
  OUTLINED_FUNCTION_4_4();
  v65 = v19;
  v66 = a1;
  v63 = v19 - 1;
  OUTLINED_FUNCTION_4();
  v20 = 0;
  v21 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v70 = v4;
  v71 = v9;
  v68 = v3;
  v69 = TupleTypeMetadata2;
  v67 = v18;
  if (!v2)
    goto LABEL_4;
LABEL_2:
  OUTLINED_FUNCTION_25_1();
  v77 = v22;
  v78 = v2;
  v24 = v23 | (v22 << 6);
LABEL_3:
  v25 = v66;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v3, *(_QWORD *)(v66 + 48) + *(_QWORD *)(v10 + 72) * v24, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v75 + 16))(v3 + *(int *)(TupleTypeMetadata2 + 48), *(_QWORD *)(v25 + 56) + *(_QWORD *)(v75 + 72) * v24, v76);
  v26 = 0;
  while (1)
  {
    __swift_storeEnumTagSinglePayload(v3, v26, 1, TupleTypeMetadata2);
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 32))(v18, v3, v74);
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, TupleTypeMetadata2) == 1)
    {
      swift_release();
LABEL_37:
      OUTLINED_FUNCTION_29();
      return;
    }
    v31 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v4, v18, v9);
    v32 = (void *)objc_opt_self();
    v33 = v75;
    v34 = v72;
    v35 = v31;
    v36 = v76;
    (*(void (**)(uint64_t, char *, uint64_t))(v75 + 32))(v72, v35, v76);
    v37 = sub_1C2F24A30();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v36);
    v80[0] = 0;
    v38 = objc_msgSend(v32, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v37, 1, v80);
    swift_unknownObjectRelease();
    v39 = v80[0];
    if (!v38)
    {
      v62 = v39;
      swift_bridgeObjectRelease();
      sub_1C2F24334();

      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v9);
      swift_release();
      goto LABEL_37;
    }
    v40 = sub_1C2F24340();
    v41 = v4;
    v43 = v42;

    v44 = v10;
    v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    v46 = v79;
    v45(v79, v41, v9);
    sub_1C2F1CA44(v40, v43);
    swift_isUniquelyReferenced_nonNull_native();
    v80[0] = v21;
    sub_1C2F106B4(v46);
    OUTLINED_FUNCTION_50_0();
    if (v49)
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
    }
    v50 = v47;
    v51 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66E8);
    v10 = v44;
    if ((sub_1C2F249D0() & 1) != 0)
      break;
LABEL_17:
    v21 = v80[0];
    if ((v51 & 1) != 0)
    {
      v54 = *((_QWORD *)v80[0] + 7) + 16 * v50;
      sub_1C2F10978(*(_QWORD *)v54, *(_QWORD *)(v54 + 8));
      *(_QWORD *)v54 = v40;
      *(_QWORD *)(v54 + 8) = v43;
      v9 = v71;
    }
    else
    {
      OUTLINED_FUNCTION_47_1((uint64_t)v80[0] + 8 * (v50 >> 6));
      v9 = v71;
      v45(v21[6] + *(_QWORD *)(v44 + 72) * v50, v79, v71);
      v55 = (uint64_t *)(v21[7] + 16 * v50);
      *v55 = v40;
      v55[1] = v43;
      v56 = v21[2];
      v49 = __OFADD__(v56, 1);
      v57 = v56 + 1;
      if (v49)
        goto LABEL_39;
      v21[2] = v57;
    }
    swift_bridgeObjectRelease();
    v58 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v58(v79, v9);
    sub_1C2F10978(v40, v43);
    v4 = v70;
    v58(v70, v9);
    v3 = v68;
    TupleTypeMetadata2 = v69;
    v18 = v67;
    v20 = v77;
    v2 = v78;
    if (v78)
      goto LABEL_2;
LABEL_4:
    v27 = v20 + 1;
    if (__OFADD__(v20, 1))
      goto LABEL_40;
    if (v27 >= v65)
    {
      v77 = v20;
LABEL_9:
      v78 = 0;
      goto LABEL_10;
    }
    if (*(_QWORD *)(v64 + 8 * v27))
      goto LABEL_7;
    v59 = v20 + 2;
    if (v20 + 2 >= v65)
    {
      v77 = v20 + 1;
      v78 = 0;
LABEL_10:
      v26 = 1;
    }
    else
    {
      if (*(_QWORD *)(v64 + 8 * v59))
        goto LABEL_7;
      v60 = v20 + 3;
      if (v60 >= v65)
      {
        v77 = v59;
        goto LABEL_9;
      }
      if (*(_QWORD *)(v64 + 8 * v60))
      {
LABEL_7:
        OUTLINED_FUNCTION_33_0();
        v77 = v28;
        v78 = v29;
        v24 = v30 + (v28 << 6);
        goto LABEL_3;
      }
      while (1)
      {
        v61 = v60 + 1;
        if (__OFADD__(v60, 1))
          goto LABEL_41;
        if (v61 >= v65)
          break;
        ++v60;
        if (*(_QWORD *)(v64 + 8 * v61))
          goto LABEL_7;
      }
      v26 = 1;
      v77 = v63;
      v78 = 0;
    }
  }
  v52 = sub_1C2F106B4(v79);
  if ((v51 & 1) == (v53 & 1))
  {
    v50 = v52;
    goto LABEL_17;
  }
  sub_1C2F24A54();
  __break(1u);
}

void Dictionary<>.decodeWithValueAs<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  unint64_t v37;
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
  void (*v50)(uint64_t, uint64_t);
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
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v5 = v3;
  v8 = sub_1C2F248BC();
  v65 = *(_QWORD *)(v8 - 8);
  v66 = v8;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_9_1();
  v64 = v10;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_55_1();
  v74 = v12;
  v63 = *(_QWORD *)(a3 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_4_0();
  v62 = v14;
  v15 = OUTLINED_FUNCTION_95_0();
  v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80];
  v17 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_9_1();
  v60 = v18;
  OUTLINED_FUNCTION_32_0();
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v56 - v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66F0);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_36_1();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_55_1();
  v71 = v24;
  sub_1C2F1CF8C(&qword_1EF7D6598, v16, MEMORY[0x1E0D9EF90]);
  v59 = v25;
  v26 = sub_1C2F24550();
  v57 = a2 + 64;
  v75 = v26;
  OUTLINED_FUNCTION_4_4();
  v58 = v27;
  v56 = v27 - 1;
  v67 = a2;
  OUTLINED_FUNCTION_43_1();
  v28 = 0;
  v61 = v17;
  v69 = v4;
  v70 = v21;
  if (!v3)
    goto LABEL_4;
LABEL_2:
  OUTLINED_FUNCTION_25_1();
  v72 = v29;
  v73 = v3;
  v31 = v30 | (v29 << 6);
LABEL_3:
  v32 = v67;
  OUTLINED_FUNCTION_63_1(v4, *(_QWORD *)(v67 + 48) + *(_QWORD *)(v17 + 72) * v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
  v33 = (uint64_t *)(*(_QWORD *)(v32 + 56) + 16 * v31);
  v34 = OUTLINED_FUNCTION_80_0();
  v35 = (uint64_t *)(v4 + *(int *)(v34 + 48));
  v36 = *v33;
  v37 = v33[1];
  *v35 = v36;
  v35[1] = v37;
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v34);
  sub_1C2F1CA44(v36, v37);
  v38 = v71;
  while (1)
  {
    sub_1C2F1CA88(v4, v38, &qword_1EF7D66F0);
    v45 = OUTLINED_FUNCTION_80_0();
    if (__swift_getEnumTagSinglePayload(v38, 1, v45) == 1)
    {
      swift_release();
LABEL_35:
      OUTLINED_FUNCTION_29();
      return;
    }
    OUTLINED_FUNCTION_63_1((uint64_t)v21, v38, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 32));
    sub_1C2F10940(0, &qword_1EF7D6700);
    sub_1C2F24814();
    if (v5)
    {
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_53_0();
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D6708);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v46 = v74;
      OUTLINED_FUNCTION_37_1(v74, 0);
      v68 = 0;
      v48 = v62;
      v47 = v63;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 32))(v62, v46, a3);
      OUTLINED_FUNCTION_63_1(v60, (uint64_t)v70, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
      v49 = v64;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v64, v48, a3);
      OUTLINED_FUNCTION_37_1(v49, 0);
      sub_1C2F245BC();
      v17 = v61;
      sub_1C2F245D4();
      OUTLINED_FUNCTION_42_0();
      v50 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      v5 = v68;
      v51 = v48;
      v21 = v70;
      v50(v51, a3);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v15);
    }
    else
    {
      v52 = v74;
      OUTLINED_FUNCTION_37_1(v74, 1);
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_53_0();
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v52, v66);
    }
    v4 = v69;
    v28 = v72;
    v3 = v73;
    if (v73)
      goto LABEL_2;
LABEL_4:
    if (__OFADD__(v28, 1))
      break;
    if (v28 + 1 >= v58)
    {
      v72 = v28;
      v38 = v71;
    }
    else
    {
      OUTLINED_FUNCTION_57_1();
      v38 = v71;
      if (v40)
        goto LABEL_7;
      if (v39 + 1 >= v58)
      {
LABEL_32:
        v72 = v39;
      }
      else
      {
        if (*(_QWORD *)(v57 + 8 * (v39 + 1)))
          goto LABEL_7;
        if (v39 + 2 >= v58)
        {
          v72 = v39 + 1;
        }
        else
        {
          if (*(_QWORD *)(v57 + 8 * (v39 + 2)))
            goto LABEL_7;
          v53 = v39 + 3;
          if (v39 + 3 < v58)
          {
            if (*(_QWORD *)(v57 + 8 * v53))
            {
LABEL_7:
              OUTLINED_FUNCTION_33_0();
              v72 = v41;
              v73 = v42;
              v31 = v43 + (v41 << 6);
              goto LABEL_3;
            }
            while (!__OFADD__(v53, 1))
            {
              if (v53 + 1 >= v58)
              {
                v39 = v56;
                goto LABEL_32;
              }
              OUTLINED_FUNCTION_57_1();
              v53 = v54 + 1;
              if (v55)
                goto LABEL_7;
            }
            goto LABEL_37;
          }
          v72 = v39 + 2;
        }
      }
    }
    v44 = OUTLINED_FUNCTION_80_0();
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v44);
    v73 = 0;
  }
  __break(1u);
LABEL_37:
  __break(1u);
}

Swift::OpaquePointer_optional __swiftcall SAMultiUserInfo.toUserIdToHomeMemberDictionary()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  Swift::Bool v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::OpaquePointer_optional result;

  OUTLINED_FUNCTION_5_1();
  v2 = OUTLINED_FUNCTION_2_5();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_45_1();
  sub_1C2F1CAC8(v0, (SEL *)&selRef_homeMembers, &qword_1EF7D67B8);
  if (v4)
  {
    v5 = v4;
    if (v4 >> 62)
    {
LABEL_30:
      OUTLINED_FUNCTION_43_1();
      v6 = sub_1C2F249F4();
      OUTLINED_FUNCTION_20_0();
      if (v6)
        goto LABEL_4;
    }
    else
    {
      v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6)
      {
LABEL_4:
        v7 = (_QWORD *)MEMORY[0x1E0DEE9E0];
        v8 = 4;
        v32 = v6;
        do
        {
          if ((v5 & 0xC000000000000001) != 0)
            v9 = (id)MEMORY[0x1C3BCD200](v8 - 4, v5);
          else
            v9 = *(id *)(v5 + 8 * v8);
          v10 = v9;
          v11 = v8 - 3;
          if (__OFADD__(v8 - 4, 1))
          {
            __break(1u);
LABEL_28:
            __break(1u);
LABEL_29:
            __break(1u);
            goto LABEL_30;
          }
          sub_1C2F1CBAC(v9, (SEL *)&selRef_sharedUserId);
          if (v12)
          {
            sub_1C2F24460();
            v13 = v10;
            swift_isUniquelyReferenced_nonNull_native();
            v14 = sub_1C2F106B4(v1);
            if (__OFADD__(v7[2], (v15 & 1) == 0))
              goto LABEL_28;
            v16 = v14;
            v17 = v15;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D6718);
            if ((sub_1C2F249D0() & 1) != 0)
            {
              v18 = sub_1C2F106B4(v1);
              if ((v17 & 1) != (v19 & 1))
              {
                v30 = (void *)sub_1C2F24A54();
                __break(1u);
                goto _$sSo15SAMultiUserInfoC21SiriRequestDispatcherE02toB24IdToHomeMemberDictionarySDy0D12MessageTypes0B2IDVSo06SAHomekC0CGSgyF;
              }
              v16 = v18;
            }
            if ((v17 & 1) != 0)
            {
              v20 = v7[7];

              *(_QWORD *)(v20 + 8 * v16) = v13;
            }
            else
            {
              OUTLINED_FUNCTION_47_1((uint64_t)&v7[v16 >> 6]);
              (*(void (**)(unint64_t, uint64_t, uint64_t))(v33 + 16))(v7[6] + *(_QWORD *)(v33 + 72) * v16, v1, v34);
              *(_QWORD *)(v7[7] + 8 * v16) = v13;
              v27 = v7[2];
              v28 = __OFADD__(v27, 1);
              v29 = v27 + 1;
              if (v28)
                goto LABEL_29;
              v7[2] = v29;
            }
            OUTLINED_FUNCTION_39_1();
            (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v1, v34);
            v6 = v32;
          }
          else
          {
            if (qword_1ED7E0638 != -1)
              swift_once();
            v21 = OUTLINED_FUNCTION_15();
            __swift_project_value_buffer(v21, (uint64_t)qword_1ED7E0D30);
            v22 = v10;
            v23 = sub_1C2F244C0();
            v24 = sub_1C2F247F0();
            if (os_log_type_enabled(v23, v24))
            {
              v25 = OUTLINED_FUNCTION_3();
              v26 = (_QWORD *)OUTLINED_FUNCTION_3();
              *(_DWORD *)v25 = 138412290;
              *(_QWORD *)(v25 + 4) = v22;
              *v26 = v22;
              _os_log_impl(&dword_1C2F05000, v23, v24, "Ignoring HomeMemberInfo: %@ for lack of sharedUserId", (uint8_t *)v25, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_0();
            }

            v13 = v22;
          }

          ++v8;
        }
        while (v11 != v6);
      }
    }
    OUTLINED_FUNCTION_20_0();
  }
  OUTLINED_FUNCTION_3_1();
_$sSo15SAMultiUserInfoC21SiriRequestDispatcherE02toB24IdToHomeMemberDictionarySDy0D12MessageTypes0B2IDVSo06SAHomekC0CGSgyF:
  result.value._rawValue = v30;
  result.is_nil = v31;
  return result;
}

void MUXContextMessage.userIdOfPrimaryUser()(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
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
  char v61[32];
  _BYTE v62[32];
  _QWORD v63[6];

  v55 = a1;
  v1 = sub_1C2F243D0();
  sub_1C2F1CCD0(v1, v63);
  v2 = v63[0];
  v3 = v63[1];
  v4 = v63[3];
  v5 = v63[4];
  v6 = (unint64_t)(v63[2] + 64) >> 6;
  v56 = v1;
  OUTLINED_FUNCTION_4();
  v58 = v2;
  v53 = v6;
  v54 = v3;
  while (1)
  {
    while (1)
    {
LABEL_2:
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v4 << 6);
      }
      else
      {
        v9 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v9 >= v6)
        {
LABEL_44:
          OUTLINED_FUNCTION_48_1();
          swift_release();
          goto LABEL_45;
        }
        v10 = *(_QWORD *)(v3 + 8 * v9);
        v11 = v4 + 1;
        if (!v10)
        {
          v11 = v4 + 2;
          if (v4 + 2 >= v6)
            goto LABEL_44;
          v10 = *(_QWORD *)(v3 + 8 * v11);
          if (!v10)
          {
            v11 = v4 + 3;
            if (v4 + 3 >= v6)
              goto LABEL_44;
            v10 = *(_QWORD *)(v3 + 8 * v11);
            if (!v10)
            {
              v11 = v4 + 4;
              if (v4 + 4 >= v6)
                goto LABEL_44;
              v10 = *(_QWORD *)(v3 + 8 * v11);
              if (!v10)
              {
                v11 = v4 + 5;
                if (v4 + 5 >= v6)
                  goto LABEL_44;
                v10 = *(_QWORD *)(v3 + 8 * v11);
                if (!v10)
                {
                  v11 = v4 + 6;
                  if (v4 + 6 >= v6)
                    goto LABEL_44;
                  v10 = *(_QWORD *)(v3 + 8 * v11);
                  if (!v10)
                  {
                    v12 = v4 + 7;
                    do
                    {
                      if (v12 >= v6)
                        goto LABEL_44;
                      v10 = *(_QWORD *)(v3 + 8 * v12++);
                    }
                    while (!v10);
                    v11 = v12 - 1;
                  }
                }
              }
            }
          }
        }
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v4 = v11;
      }
      v13 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v8);
      v14 = sub_1C2F1C7A8(v13);
      if (v14)
        break;

    }
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
      break;

    OUTLINED_FUNCTION_51();
  }
  v16 = OUTLINED_FUNCTION_18_3();
  while (1)
  {
    OUTLINED_FUNCTION_46_1(v16, (uint64_t)v62);
    sub_1C2F09238((uint64_t)v62, (uint64_t)v61);
    v17 = OUTLINED_FUNCTION_73_0();
    if (v17)
      v18 = v59;
    else
      v18 = 0;
    v19 = sub_1C2F24604();
    if (!v17 || !v60)
    {
      v31 = OUTLINED_FUNCTION_7();
      v16 = OUTLINED_FUNCTION_96_0(v31, v32, v33, v34, v35, v36, v37, v38, v52, v53, v54, v55, v56, v57);
      goto LABEL_37;
    }
    if (v18 == v19 && v60 == v20)
      break;
    v22 = OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_17_3();
    v23 = OUTLINED_FUNCTION_7();
    v16 = OUTLINED_FUNCTION_96_0(v23, v24, v25, v26, v27, v28, v29, v30, v52, v53, v54, v55, v56, v57);
    if ((v22 & 1) != 0)
      goto LABEL_42;
LABEL_37:
    v6 += 32;
    if (!--v15)
    {

      OUTLINED_FUNCTION_63();
      v4 = v57;
      v2 = v58;
      v6 = v53;
      v3 = v54;
      goto LABEL_2;
    }
  }
  v39 = OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_96_0(v39, v40, v41, v42, v43, v44, v45, v46, v52, v53, v54, v55, v56, v57);
LABEL_42:
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_48_1();
  swift_release();
  sub_1C2F1C800(v13);
  if (v47)
  {
    v48 = v55;
    sub_1C2F24460();
    v49 = 0;
    goto LABEL_46;
  }
LABEL_45:
  v49 = 1;
  v48 = v55;
LABEL_46:
  v50 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_38_1(v48, v49, v51, v50);
}

Swift::String __swiftcall AFUserIdentityClassfication.toAceUserIdentityClassification()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = sub_1C2F24604();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

void SAConfidenceScores.toVoiceIdScoreCard()()
{
  void *v0;
  uint64_t v1;
  id v2;

  v1 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v1 + 16) = v0;
  objc_allocWithZone(MEMORY[0x1E0CFEAB8]);
  v2 = v0;
  sub_1C2F1B5CC((uint64_t)sub_1C2F1CD2C, v1);
  OUTLINED_FUNCTION_100();
  OUTLINED_FUNCTION_44_0();
}

id sub_1C2F1AA78(id result, id a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, sel_processedAudioDurationMilliseconds);
    v4 = (void *)sub_1C2F247A8();
    objc_msgSend(v3, sel_setSpIdAudioProcessedDuration_, v4);

    sub_1C2F10940(0, &qword_1EF7D66D8);
    v5 = (void *)sub_1C2F24898();
    objc_msgSend(v3, sel_setSpIdUnknownUserScore_, v5);

    sub_1C2F1AC88();
    v6 = (void *)sub_1C2F2455C();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setSpIdKnownUserScores_, v6);

    v7 = objc_msgSend(a2, sel_scoringSchemeVersion);
    objc_msgSend(v3, sel_setSpIdUserScoresVersion_, v7);

    sub_1C2F1CBAC(a2, (SEL *)&selRef_thresholdType);
    if (v8)
    {
      v9 = (void *)sub_1C2F245F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v3, sel_setSpIdScoreThresholdingType_, v9);

    sub_1C2F1CBAC(a2, (SEL *)&selRef_assetVersion);
    if (v10)
    {
      v11 = (void *)sub_1C2F245F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v3, sel_setSpIdAssetVersion_, v11);

    sub_1C2F1CBAC(a2, (SEL *)&selRef_classifiedUser);
    if (v12)
    {
      v13 = (void *)sub_1C2F245F8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v3, sel_setUserClassified_, v13);

    return objc_msgSend(v3, sel_setUserIdentityClassification_, sub_1C2F1AF28());
  }
  return result;
}

uint64_t sub_1C2F1AC88()
{
  void *v0;
  void *v1;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;

  v1 = v0;
  sub_1C2F10940(0, &qword_1EF7D66D8);
  v2 = (_QWORD *)sub_1C2F24580();
  sub_1C2F1CAC8(v1, (SEL *)&selRef_scores, (unint64_t *)&unk_1EF7D6720);
  if (!v3)
    return (uint64_t)v2;
  v4 = v3;
  if (v3 >> 62)
  {
LABEL_26:
    sub_1C2F24598();
    v5 = sub_1C2F249F4();
    swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_4;
    goto LABEL_21;
  }
  v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
LABEL_4:
  v28 = v4;
  v29 = v4 & 0xC000000000000001;
  v6 = 4;
  v27 = v5;
  while (1)
  {
    if (v29)
      v7 = (id)MEMORY[0x1C3BCD200](v6 - 4, v4);
    else
      v7 = *(id *)(v4 + 8 * v6);
    v8 = v7;
    v9 = v6 - 3;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v10 = sub_1C2F1CBAC(v7, (SEL *)&selRef_sharedUserId);
    if (!v11)
    {

      goto LABEL_20;
    }
    v12 = v10;
    v13 = v11;
    v30 = v8;
    objc_msgSend(v8, sel_confidenceScore);
    v14 = sub_1C2F247A8();
    swift_isUniquelyReferenced_nonNull_native();
    v15 = v12;
    v16 = sub_1C2F10650(v12, v13);
    if (__OFADD__(v2[2], (v17 & 1) == 0))
      goto LABEL_24;
    v18 = v16;
    v4 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66E0);
    if ((sub_1C2F249D0() & 1) != 0)
      break;
LABEL_14:
    if ((v4 & 1) != 0)
    {
      v21 = v2[7];

      *(_QWORD *)(v21 + 8 * v18) = v14;
    }
    else
    {
      v2[(v18 >> 6) + 8] |= 1 << v18;
      v22 = (uint64_t *)(v2[6] + 16 * v18);
      *v22 = v15;
      v22[1] = v13;
      *(_QWORD *)(v2[7] + 8 * v18) = v14;
      v23 = v2[2];
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_25;
      v2[2] = v25;
      sub_1C2F24598();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v5 = v27;
    v4 = v28;
LABEL_20:
    ++v6;
    if (v9 == v5)
      goto LABEL_21;
  }
  v19 = sub_1C2F10650(v15, v13);
  if ((v4 & 1) == (v20 & 1))
  {
    v18 = v19;
    goto LABEL_14;
  }
  result = sub_1C2F24A54();
  __break(1u);
  return result;
}

uint64_t sub_1C2F1AF28()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v9;
  char v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  char v17;
  uint64_t v18;

  v1 = sub_1C2F1CBAC(v0, (SEL *)&selRef_userIdentityClassification);
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    if (sub_1C2F24604() == v1 && v4 == v5)
    {
      swift_bridgeObjectRelease();
LABEL_9:
      swift_bridgeObjectRelease();
      return 4;
    }
    v7 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      goto LABEL_9;
    if (sub_1C2F24604() == v3 && v4 == v9)
    {
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      return 3;
    }
    v11 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      goto LABEL_17;
    if (sub_1C2F24604() == v3 && v4 == v12)
    {
      swift_bridgeObjectRelease();
LABEL_25:
      swift_bridgeObjectRelease();
      return 1;
    }
    v14 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      goto LABEL_25;
    if (sub_1C2F24604() == v3 && v4 == v15)
    {
      swift_bridgeObjectRelease();
LABEL_33:
      swift_bridgeObjectRelease();
      return 2;
    }
    v17 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_33;
    if (sub_1C2F24604() != v3 || v4 != v18)
      sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return 0;
}

void AFVoiceIdScoreCard.toSAConfidenceScores()()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88000]), sel_init);
  v2 = OUTLINED_FUNCTION_74_1((uint64_t)v1, sel_spIdAudioProcessedDuration);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_integerValue);

  }
  v4 = OUTLINED_FUNCTION_21_3((uint64_t)v2, sel_setProcessedAudioDurationMilliseconds_);
  v5 = OUTLINED_FUNCTION_74_1((uint64_t)v4, sel_spIdUserScoresVersion);
  OUTLINED_FUNCTION_21_3((uint64_t)v5, sel_setScoringSchemeVersion_);

  v6 = sub_1C2F1B290();
  OUTLINED_FUNCTION_88_0(v6, v7, v8, (SEL *)&selRef_setThresholdType_);
  v9 = sub_1C2F1CBAC(v0, (SEL *)&selRef_spIdAssetVersion);
  if (v10)
  {
    v11 = (void *)sub_1C2F245F8();
    v9 = OUTLINED_FUNCTION_20_0();
  }
  else
  {
    v11 = 0;
  }
  OUTLINED_FUNCTION_21_3(v9, sel_setAssetVersion_);

  v12 = sub_1C2F1CBAC(v0, (SEL *)&selRef_userClassified);
  if (v13)
  {
    v14 = (void *)sub_1C2F245F8();
    v12 = OUTLINED_FUNCTION_20_0();
  }
  else
  {
    v14 = 0;
  }
  OUTLINED_FUNCTION_21_3(v12, sel_setClassifiedUser_);

  OUTLINED_FUNCTION_74_1(v15, sel_userIdentityClassification);
  v16 = AFUserIdentityClassfication.toAceUserIdentityClassification()();
  OUTLINED_FUNCTION_88_0(v16._countAndFlagsBits, (uint64_t)v16._object, v17, (SEL *)&selRef_setUserIdentityClassification_);
  sub_1C2F1B390();
  sub_1C2F1CC5C(v18, v1);
  OUTLINED_FUNCTION_44_0();
}

uint64_t sub_1C2F1B290()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_1C2F1CBAC(v0, (SEL *)&selRef_spIdScoreThresholdingType);
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    if (v1 == 0xD000000000000025 && v2 == 0x80000001C2F26AD0
      || (sub_1C2F24A3C() & 1) != 0
      || v3 == 0xD000000000000028 && v4 == 0x80000001C2F26AA0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1C2F24A3C();
      swift_bridgeObjectRelease();
    }
  }
  return sub_1C2F24604();
}

void sub_1C2F1B390()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v22 = MEMORY[0x1E0DEE9D8];
  v1 = sub_1C2F1CB30(v0);
  if (!v1)
    return;
  v2 = v1;
  v3 = 0;
  v4 = v1 + 64;
  v5 = 1 << *(_BYTE *)(v1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  if (!v7)
    goto LABEL_6;
LABEL_5:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v9 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v3 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * i);
    v18 = objc_allocWithZone(MEMORY[0x1E0D885E8]);
    sub_1C2F24598();
    v19 = v17;
    v20 = objc_msgSend(v18, sel_init);
    objc_msgSend(v20, sel_setConfidenceScore_, objc_msgSend(v19, sel_integerValue));
    sub_1C2F1CC08(v15, v16, v20, (SEL *)&selRef_setSharedUserId_);
    v21 = v20;
    MEMORY[0x1C3BCCF9C]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1C2F24700();
    sub_1C2F24718();
    sub_1C2F246F4();

    if (v7)
      goto LABEL_5;
LABEL_6:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v8)
      goto LABEL_24;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_24;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_24;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
          break;
      }
    }
LABEL_19:
    v7 = (v12 - 1) & v12;
  }
  v13 = v11 + 3;
  if (v13 >= v8)
  {
LABEL_24:
    swift_release();
    return;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_24;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_19;
  }
LABEL_27:
  __break(1u);
}

id sub_1C2F1B5CC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];

  if (a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v9[4] = sub_1C2F1CD54;
    v9[5] = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 1107296256;
    v9[2] = sub_1C2F1B690;
    v9[3] = &block_descriptor_0;
    v6 = _Block_copy(v9);
    swift_release();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v2, sel_initWithBuilder_, v6);
  _Block_release(v6);
  return v7;
}

uint64_t sub_1C2F1B690(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

char *sub_1C2F1B6CC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C2F24A00();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1C2F1B750(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1C2F24A00();
  __break(1u);
  return result;
}

uint64_t sub_1C2F1B81C()
{
  return sub_1C2F248C8();
}

void sub_1C2F1B840(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_69_0(a1);
  OUTLINED_FUNCTION_23();
}

void sub_1C2F1B85C(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_69_0(a1);
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F1B874@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_69_0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1C2F1B898(uint64_t result, uint64_t a2, _QWORD *a3)
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

char *sub_1C2F1B8B4(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C2F1B8D0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1C2F1B8D0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B8);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C2F1B6CC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2F1B750((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1C2F1B9B0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1C2F24478();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1C2F1CF8C(&qword_1EF7D6598, v11, MEMORY[0x1E0D9EF90]);
  sub_1C2F24598();
  v31 = a2;
  v12 = sub_1C2F245E0();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1C2F1CF8C(&qword_1EF7D65A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF98]);
      v21 = sub_1C2F245EC();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1C2F1BF74((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1C2F1BC0C()
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
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
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
  v2 = sub_1C2F24478();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D67B0);
  v6 = sub_1C2F24910();
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
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = v5;
      v21 = *(_QWORD *)(v5 + 48);
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v23(v4, v21 + v22 * i, v2);
      sub_1C2F1CF8C(&qword_1EF7D6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
      result = sub_1C2F245E0();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
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
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(*(_QWORD *)(v7 + 48) + v27 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v20;
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_38;
      if (v17 >= v34)
        goto LABEL_32;
      v18 = v35[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v34)
          goto LABEL_32;
        v18 = v35[v14];
        if (!v18)
        {
          v14 = v17 + 2;
          if (v17 + 2 >= v34)
            goto LABEL_32;
          v18 = v35[v14];
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v34)
            {
LABEL_32:
              swift_release();
              v1 = v33;
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 > 63)
                sub_1C2F1B898(0, (unint64_t)(v32 + 63) >> 6, v35);
              else
                *v35 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v14 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_39;
                if (v14 >= v34)
                  goto LABEL_32;
                v18 = v35[v14];
                ++v19;
                if (v18)
                  goto LABEL_20;
              }
            }
            v14 = v19;
          }
        }
      }
LABEL_20:
      v11 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_1C2F1BF74(uint64_t a1, unint64_t a2, char a3)
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
  v6 = sub_1C2F24478();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1C2F1BC0C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1C2F1C178();
      goto LABEL_12;
    }
    sub_1C2F1C3A0();
  }
  v12 = *v3;
  sub_1C2F1CF8C(&qword_1EF7D6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
  v13 = sub_1C2F245E0();
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
      sub_1C2F1CF8C(&qword_1EF7D65A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF98]);
      v18 = sub_1C2F245EC();
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
  result = sub_1C2F24A48();
  __break(1u);
  return result;
}

void *sub_1C2F1C178()
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
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_1C2F24478();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D67B0);
  v6 = *v0;
  v7 = sub_1C2F24904();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C2F1C3A0()
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
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  v2 = sub_1C2F24478();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D67B0);
  v7 = sub_1C2F24910();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v21 * i, v2);
    sub_1C2F1CF8C(&qword_1EF7D6598, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
    result = sub_1C2F245E0();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v25 * v21, v5, v2);
    ++*(_QWORD *)(v8 + 16);
    if (v12)
      goto LABEL_6;
LABEL_7:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_36;
    if (v18 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v32 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v32 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v12 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v32 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

_QWORD *sub_1C2F1C6C4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D67A0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  v5 = sub_1C2F1CD8C(&v7, v3 + 4, v1, a1);
  sub_1C2F24598();
  sub_1C2F1CF84();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1C2F1C7A8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_attributes);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C2F246E8();

  return v3;
}

uint64_t sub_1C2F1C800(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_sharedUserId);

  if (!v2)
    return 0;
  v3 = sub_1C2F24604();

  return v3;
}

void sub_1C2F1C86C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C2F245F8();
  objc_msgSend(a3, sel_setRefId_, v4);

}

uint64_t sub_1C2F1C8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F1C8F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D66D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2F1C938()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_1C2F1C95C(void *a1)
{
  uint64_t v1;

  return sub_1C2F197F8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 100, 4);
}

id sub_1C2F1C97C(void *a1)
{
  uint64_t v1;

  return sub_1C2F197F8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 0, 0);
}

uint64_t sub_1C2F1C99C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_2_5() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_78_0(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

id sub_1C2F1CA08(void *a1)
{
  OUTLINED_FUNCTION_2_5();
  return sub_1C2F19690(a1);
}

uint64_t sub_1C2F1CA44(uint64_t a1, unint64_t a2)
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

void sub_1C2F1CA88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_23();
}

void sub_1C2F1CAC8(void *a1, SEL *a2, unint64_t *a3)
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a1, *a2);
  if (v4)
  {
    v5 = v4;
    sub_1C2F10940(0, a3);
    sub_1C2F246E8();

  }
  OUTLINED_FUNCTION_44_0();
}

uint64_t sub_1C2F1CB30(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_spIdKnownUserScores);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1C2F10940(0, &qword_1EF7D66D8);
  v3 = sub_1C2F24568();

  return v3;
}

uint64_t sub_1C2F1CBAC(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_1C2F24604();

  return v4;
}

void sub_1C2F1CC08(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_1C2F245F8();
  OUTLINED_FUNCTION_34_0();
  objc_msgSend(a3, *a4, v6);

}

void sub_1C2F1CC5C(uint64_t a1, void *a2)
{
  id v3;

  sub_1C2F10940(0, (unint64_t *)&unk_1EF7D6720);
  v3 = (id)sub_1C2F246DC();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setScores_, v3);

}

uint64_t sub_1C2F1CCD0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1C2F1CD08()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1C2F1CD2C(void *a1)
{
  uint64_t v1;

  return sub_1C2F1AA78(a1, *(id *)(v1 + 16));
}

ValueMetadata *type metadata accessor for MUXUtils()
{
  return &type metadata for MUXUtils;
}

uint64_t sub_1C2F1CD44()
{
  return swift_deallocObject();
}

uint64_t sub_1C2F1CD54()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

_QWORD *sub_1C2F1CD8C(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C2F1CF84()
{
  return swift_release();
}

void sub_1C2F1CF8C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1C3BCD794](a3, v5), a1);
  }
  OUTLINED_FUNCTION_23();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_1C2F24478();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_1C2F248C8();
}

id OUTLINED_FUNCTION_16_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v4 = *(void **)(v2 + 8 * v1);
  *(_QWORD *)(v3 + *(int *)(a1 + 48)) = v4;
  __swift_storeEnumTagSinglePayload(v3, 0, 1, a1);
  return v4;
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_1C2F24598();
}

id OUTLINED_FUNCTION_21_3(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_24_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1C2F24604();
}

uint64_t OUTLINED_FUNCTION_37_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_38_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, a4);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C2F10978(v1, v0);
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_46_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2F09238(v2, a2);
}

void OUTLINED_FUNCTION_47_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_58_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_59_1()
{
  return sub_1C2F24898();
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

void OUTLINED_FUNCTION_61_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

void OUTLINED_FUNCTION_62_0()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_63_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_67_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_69_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return sub_1C2F243D0();
}

uint64_t OUTLINED_FUNCTION_72_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  return sub_1C2F09238((uint64_t)va1, (uint64_t)va);
}

unint64_t OUTLINED_FUNCTION_73_1()
{
  uint64_t v0;

  return sub_1C2F106B4(v0);
}

id OUTLINED_FUNCTION_74_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_76_1()
{
  return sub_1C2F249F4();
}

uint64_t OUTLINED_FUNCTION_77_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_78_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_79_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_80_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_81_1()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

id OUTLINED_FUNCTION_83_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 0);
}

void OUTLINED_FUNCTION_84_1()
{
  JUMPOUT(0x1C3BCD200);
}

id OUTLINED_FUNCTION_85_1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_86_1(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_87_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_88_0(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  sub_1C2F1CC08(a1, a2, v4, a4);
}

uint64_t OUTLINED_FUNCTION_89_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_90_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_92_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_93_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_94()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return sub_1C2F24478();
}

uint64_t OUTLINED_FUNCTION_96_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)va);
}

void sub_1C2F1D3C8()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1C2F1D434(v0);
}

uint64_t sub_1C2F1D3F0()
{
  OUTLINED_FUNCTION_10_0();
  return swift_retain();
}

void sub_1C2F1D434(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_63_2(qword_1ED7E0CE0);
  OUTLINED_FUNCTION_10_0();
  *v1 = a1;
  swift_release();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F1D470()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23();
}

void sub_1C2F1D4A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_1C2F244E4();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_1C2F1D574((uint64_t)v4);
}

void sub_1C2F1D528(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_63_2(qword_1ED7E0CE8);
  OUTLINED_FUNCTION_10_0();
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
  OUTLINED_FUNCTION_27();
}

void sub_1C2F1D574(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_63_2(qword_1ED7E0CE8);
  OUTLINED_FUNCTION_7_0();
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_27();
}

void sub_1C2F1D5C4()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F1D5FC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + qword_1ED7E0920);
}

uint64_t sub_1C2F1D60C(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + qword_1ED7E0920) = result;
  return result;
}

void RequestAwareBridgeBase.__allocating_init(_:_:_:_:_:)()
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
  _BYTE v18[40];
  uint64_t v19;

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = OUTLINED_FUNCTION_15();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_79_1();
  OUTLINED_FUNCTION_78_1(v16, (uint64_t)v18);
  if (qword_1ED7E0638 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED7E0D30);
  OUTLINED_FUNCTION_76(v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(v0 + 464))(v13, v11, &v19, v7, v5, v18, 1, v1);
  __swift_destroy_boxed_opaque_existential_0(v3);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_1();
}

void RequestAwareBridgeBase.__allocating_init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_19_1();
  RequestAwareBridgeBase.init(_:_:_:_:_:_:)();
}

void RequestAwareBridgeBase.init(_:_:_:_:_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_5_1();
  v3 = v2;
  v5 = v4;
  v16 = v6;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_15();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_52_1();
  *(_QWORD *)(v0 + qword_1ED7E0CE0) = 0;
  OUTLINED_FUNCTION_1_1((_QWORD *)(v0 + qword_1ED7E0140));
  OUTLINED_FUNCTION_1_1((_QWORD *)(v0 + qword_1ED7E0148));
  v11 = (void *)(v0 + qword_1ED7E0CE8);
  *(_QWORD *)(v0 + qword_1ED7E0CE8) = 500;
  v12 = *MEMORY[0x1E0DEF490];
  v13 = OUTLINED_FUNCTION_34();
  (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
  v14 = qword_1ED7E0920;
  *(_BYTE *)(v0 + qword_1ED7E0920) = 0;
  *(_BYTE *)(v0 + qword_1ED7E0918) = 1;
  *(_BYTE *)(v0 + v14) = 1;
  OUTLINED_FUNCTION_79_1();
  OUTLINED_FUNCTION_78_1(v15, (uint64_t)&v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v1, v3, v9);
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_14_5((uint64_t)v16);
  swift_retain();
  sub_1C2F1DAE0();
  sub_1C2F1DCB4();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_81_2(v3, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  __swift_destroy_boxed_opaque_existential_0(v5);
  __swift_destroy_boxed_opaque_existential_0(v8);
  OUTLINED_FUNCTION_3_1();
}

void RequestAwareBridgeBase.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_19_1();
  RequestAwareBridgeBase.init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)();
  OUTLINED_FUNCTION_3_1();
}

void RequestAwareBridgeBase.init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  void *v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_5_1();
  v17 = v3;
  v18 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OUTLINED_FUNCTION_15();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_52_1();
  *(_QWORD *)(v0 + qword_1ED7E0CE0) = 0;
  OUTLINED_FUNCTION_1_1((_QWORD *)(v0 + qword_1ED7E0140));
  OUTLINED_FUNCTION_1_1((_QWORD *)(v0 + qword_1ED7E0148));
  v12 = v0 + qword_1ED7E0CE8;
  *(_QWORD *)(v0 + qword_1ED7E0CE8) = 500;
  v13 = *MEMORY[0x1E0DEF490];
  v14 = OUTLINED_FUNCTION_34();
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  v16 = qword_1ED7E0920;
  *(_BYTE *)(v0 + qword_1ED7E0920) = 0;
  *(_BYTE *)(v0 + qword_1ED7E0918) = (_BYTE)v5;
  *(_BYTE *)(v0 + v16) = (_BYTE)v5;
  OUTLINED_FUNCTION_78_1(v15, (uint64_t)&v20);
  sub_1C2F15B58(v7, (uint64_t)&v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v17, v10);
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_14_5((uint64_t)v18);
  swift_retain();
  sub_1C2F1DAE0();
  sub_1C2F1DCB4();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_81_2(v17, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  __swift_destroy_boxed_opaque_existential_0(v7);
  __swift_destroy_boxed_opaque_existential_0(v9);
  OUTLINED_FUNCTION_3_1();
}

uint64_t sub_1C2F1DAE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *v0;
  if (*((_BYTE *)v0 + qword_1ED7E0918) == 1)
  {
    v2 = OUTLINED_FUNCTION_48();
    v3 = *(_QWORD *)(v1 + 328);
    *(_QWORD *)(v2 + 16) = v3;
    v4 = *(_QWORD *)(v1 + 336);
    *(_QWORD *)(v2 + 24) = v4;
    v5 = (_QWORD *)OUTLINED_FUNCTION_48();
    v5[2] = v3;
    v5[3] = v4;
    v5[4] = sub_1C2F20D28;
    v5[5] = v2;
    OUTLINED_FUNCTION_90_1();
    sub_1C2F1DFA8();
    OUTLINED_FUNCTION_83();
  }
  v6 = OUTLINED_FUNCTION_48();
  v7 = *(_QWORD *)(v1 + 328);
  *(_QWORD *)(v6 + 16) = v7;
  v8 = *(_QWORD *)(v1 + 336);
  *(_QWORD *)(v6 + 24) = v8;
  v9 = (_QWORD *)OUTLINED_FUNCTION_48();
  v9[2] = v7;
  v9[3] = v8;
  v9[4] = sub_1C2F20CDC;
  v9[5] = v6;
  sub_1C2F243C4();
  sub_1C2F1DFA8();
  return swift_release();
}

void (*sub_1C2F1DBEC(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  return sub_1C2F20D50;
}

void (*sub_1C2F1DC50(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  return sub_1C2F20D74;
}

void sub_1C2F1DCB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v1 = OUTLINED_FUNCTION_34();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (uint64_t *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = v0 + qword_1ED7E0140;
  v6 = *(_QWORD *)(v0 + qword_1ED7E0140);
  v7 = *(_QWORD *)(v5 + 8);
  objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  sub_1C2F24598();
  v13 = sub_1C2F209A4(v6, v7);
  if (v13)
  {
    v8 = (void *)OUTLINED_FUNCTION_98();
    v9 = objc_msgSend(v13, sel_stringForKey_, v8);

    if (v9)
    {

      v10 = (void *)OUTLINED_FUNCTION_98();
      v11 = objc_msgSend(v13, sel_integerForKey_, v10);

      *v4 = v11;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF490], v1);
      sub_1C2F1D574((uint64_t)v4);

    }
    else
    {

    }
  }
}

void sub_1C2F1DE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C2F1DE38(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1C2F13B98);
}

void sub_1C2F1DE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C2F1DE38(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1C2F13BA0);
}

void sub_1C2F1DE38(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v12;
  uint64_t v13;

  sub_1C2F243F4();
  if (swift_dynamicCastMetatype())
  {
    v12 = OUTLINED_FUNCTION_100_0();
    v7 = sub_1C2F247F0();
    if (OUTLINED_FUNCTION_57_2(v12))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_3();
      v13 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v8 = 136315138;
      v9 = OUTLINED_FUNCTION_52();
      sub_1C2F08778(v9, v10, &v13);
      OUTLINED_FUNCTION_102_0();
      OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v12, v7, "Cannot register message of type %s type for handling on top level Bridge class. Consider registering it with an implementation of RequestProcessorBase", v8);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

  }
  else
  {
    a4(a1, a2, a3);
  }
}

void sub_1C2F1DFA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[3];
  _QWORD v28[3];

  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  v5 = v4;
  v24 = v6;
  v25 = v7;
  v8 = *v0;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_82_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_19_0();
  swift_getMetatypeMetadata();
  v10 = sub_1C2F24634();
  v12 = v11;
  v13 = sub_1C2F12D94();
  v26 = v10;
  v27[0] = v10;
  v27[1] = v12;
  v14 = *(_QWORD *)(v8 + 328);
  v17 = type metadata accessor for MessageDispatchingBridgeBase.MessageHandlerBase(0, v14, v15, v16);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1C3BCCE94](v28, v27, v13, MEMORY[0x1E0DEA968], v17, MEMORY[0x1E0DEA978]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_0();
  v18 = v28[0];
  OUTLINED_FUNCTION_86_2();
  if (v18)
  {
    v19 = ((char *)v3 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_4();
    sub_1C2F244C0();
    v20 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_3();
      v27[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v21 = 136315138;
      OUTLINED_FUNCTION_4();
      v28[0] = sub_1C2F08778(v26, v12, v27);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v19, v20, "Message type: %s is already registered. Ignoring this request", v21);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

  }
  else
  {
    v22 = qword_1ED7E0920;
    if ((*((_BYTE *)v3 + qword_1ED7E0920) & 1) == 0)
    {
      OUTLINED_FUNCTION_90_1();
      if (swift_dynamicCastMetatype())
        *((_BYTE *)v3 + v22) = 1;
    }
    type metadata accessor for MessageDispatchingBridgeBase.MessageHandler(0, v14, *(_QWORD *)(v8 + 336), v5);
    OUTLINED_FUNCTION_76((uint64_t)v3 + qword_1ED7E0D00, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
    sub_1C2F162B8(v27);
    v23 = sub_1C2F12C24(v24, v25, v2, (char *)v27);
    v28[1] = v12;
    v28[2] = v23;
    v28[0] = v26;
    OUTLINED_FUNCTION_7_0();
    sub_1C2F245BC();
    swift_retain();
    sub_1C2F245D4();
    swift_endAccess();
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F1E260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54[11];
  uint64_t v55;
  uint64_t v56;

  OUTLINED_FUNCTION_5_1();
  v55 = v1;
  v56 = v2;
  v51 = v3;
  v4 = OUTLINED_FUNCTION_59_2();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_36_2();
  sub_1C2F243F4();
  if (!OUTLINED_FUNCTION_41_1())
  {
    sub_1C2F148F8();
    return;
  }
  if ((*(_BYTE *)(v0 + qword_1ED7E0920) & 1) == 0)
  {
    v5 = (v0 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_28_0();
    v6 = OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_104((uint64_t)v6);
    v7 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_3();
      v54[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v8 = 136315138;
      v9 = OUTLINED_FUNCTION_46_2();
      v11 = OUTLINED_FUNCTION_77(v9, v10, v54);
      OUTLINED_FUNCTION_15_0(v11);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_68_0();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v5, (os_log_type_t)v4, "Bridge: %s did not register any start request message so not handling any RequestMessageBase messages", v8);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_40_0();

    goto LABEL_36;
  }
  OUTLINED_FUNCTION_90_1();
  if (OUTLINED_FUNCTION_41_1())
  {
    v52 = OUTLINED_FUNCTION_22_3();
    sub_1C2F1F7D4();
    OUTLINED_FUNCTION_4_5(v52);
    return;
  }
  sub_1C2F243C4();
  if (OUTLINED_FUNCTION_41_1())
  {
    v53 = OUTLINED_FUNCTION_22_3();
    sub_1C2F1FE10();
    OUTLINED_FUNCTION_4_5(v53);
    return;
  }
  v12 = OUTLINED_FUNCTION_88_1();
  if (v12)
  {
    v14 = *(_QWORD *)(v12 + 64);
    v13 = *(_QWORD *)(v12 + 72);
    OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_36_0();
  }
  else
  {
    OUTLINED_FUNCTION_22_3();
    v14 = 0;
    v13 = 0;
  }
  v15 = OUTLINED_FUNCTION_57();
  if (!v13)
  {
    OUTLINED_FUNCTION_12_0();
    goto LABEL_22;
  }
  if (v14 != v15 || v13 != v16)
  {
    v18 = OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_12_0();
    if ((v18 & 1) != 0)
      goto LABEL_28;
LABEL_22:
    if ((*(_BYTE *)(v0 + qword_1ED7E0918) & 1) != 0 || (v19 = OUTLINED_FUNCTION_88_1(), swift_release(), v19))
    {
      v20 = OUTLINED_FUNCTION_22_3();
      OUTLINED_FUNCTION_28_0();
      v21 = OUTLINED_FUNCTION_104((uint64_t)v20);
      v22 = sub_1C2F247F0();
      if (os_log_type_enabled(v21, v22))
      {
        v50 = v22;
        v23 = OUTLINED_FUNCTION_3();
        v54[0] = OUTLINED_FUNCTION_3();
        *(_DWORD *)v23 = 136315906;
        OUTLINED_FUNCTION_74_2();
        sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
        v24 = OUTLINED_FUNCTION_60_2();
        v26 = v25;
        OUTLINED_FUNCTION_44_1();
        v27 = sub_1C2F08778(v24, v26, v54);
        OUTLINED_FUNCTION_17_5(v27);
        OUTLINED_FUNCTION_94_0();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_68_0();
        *(_WORD *)(v23 + 12) = 2080;
        swift_getObjectType();
        v28 = OUTLINED_FUNCTION_52();
        OUTLINED_FUNCTION_31_0(v28, v29);
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_36();
        *(_WORD *)(v23 + 22) = 2080;
        v30 = OUTLINED_FUNCTION_57();
        v32 = OUTLINED_FUNCTION_80_1(v30, v31);
        OUTLINED_FUNCTION_7_2(v32);
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_12_0();
        *(_WORD *)(v23 + 32) = 2080;
        v33 = OUTLINED_FUNCTION_88_1();
        if (v33)
        {
          v35 = *(_QWORD *)(v33 + 64);
          v34 = *(_QWORD *)(v33 + 72);
          OUTLINED_FUNCTION_19_2();
          OUTLINED_FUNCTION_96_1();
        }
        else
        {
          v34 = 0xE700000000000000;
          v35 = 0x74657320746F4ELL;
        }
        v49 = sub_1C2F08778(v35, v34, v54);
        OUTLINED_FUNCTION_7_2(v49);
        OUTLINED_FUNCTION_40_0();
        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_83_2(&dword_1C2F05000, v21, v50, "Receiving message id: %s of type: %s for request Id: %s but current request id: %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_40_0();

    }
    else
    {
      v36 = OUTLINED_FUNCTION_22_3();
      v37 = OUTLINED_FUNCTION_104((uint64_t)v36);
      v38 = sub_1C2F247E4();
      if (OUTLINED_FUNCTION_105(v37))
      {
        v39 = OUTLINED_FUNCTION_3();
        v54[0] = OUTLINED_FUNCTION_3();
        *(_DWORD *)v39 = 136315650;
        OUTLINED_FUNCTION_74_2();
        sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
        v40 = OUTLINED_FUNCTION_60_2();
        v42 = v41;
        OUTLINED_FUNCTION_44_1();
        v43 = sub_1C2F08778(v40, v42, v54);
        OUTLINED_FUNCTION_17_5(v43);
        sub_1C2F248C8();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_17_3();
        *(_WORD *)(v39 + 12) = 2080;
        swift_getObjectType();
        v44 = OUTLINED_FUNCTION_52();
        OUTLINED_FUNCTION_31_0(v44, v45);
        OUTLINED_FUNCTION_10_3();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_36();
        *(_WORD *)(v39 + 22) = 2080;
        v46 = OUTLINED_FUNCTION_57();
        v48 = OUTLINED_FUNCTION_80_1(v46, v47);
        OUTLINED_FUNCTION_7_2(v48);
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_3_6();
        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_64_1(&dword_1C2F05000, v37, v38, "Receiving message id: %s of type: %s for request Id: %s but current request id not set", (uint8_t *)v39);
        OUTLINED_FUNCTION_62_1();
        OUTLINED_FUNCTION_0();
      }

    }
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_3_6();
    goto LABEL_36;
  }
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_12_0();
LABEL_28:
  sub_1C2F1F234();
LABEL_36:
  OUTLINED_FUNCTION_4_5(v51);
}

uint64_t sub_1C2F1E850()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;

  v0 = OUTLINED_FUNCTION_100_0();
  v1 = sub_1C2F247FC();
  if (OUTLINED_FUNCTION_57_2(v0))
  {
    v2 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v2 = 0;
    OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v0, v1, "createRequestProcessor() method from base class called. Please implement this method in your RequestProcessorBase implementation", v2);
    OUTLINED_FUNCTION_0();
  }

  return 0;
}

uint64_t sub_1C2F1E8D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
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
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  const void *v60;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76[6];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  OUTLINED_FUNCTION_5_1();
  v78 = v2;
  v79 = v3;
  v5 = v4;
  v71 = v6;
  v72 = v7;
  v74 = v8;
  v75 = v9;
  v73 = v10;
  v12 = v11;
  v13 = sub_1C2F244FC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1C2F24520();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_51_1();
  v19 = sub_1C2F1D3F0();
  if (v19)
  {
    v20 = v19;
    v68 = v18;
    v69 = v17;
    v70 = v16;
    v22 = *(_QWORD *)(v19 + 64);
    v21 = *(_QWORD *)(v19 + 72);
    sub_1C2F24598();
    v23 = objc_msgSend(v12, sel_refId);
    if (v23)
    {
      v24 = v23;
      v66 = v14;
      v67 = v13;
      v25 = v5;
      v26 = sub_1C2F24604();
      v28 = v27;

      if (v22 == v26 && v21 == v28)
      {
        OUTLINED_FUNCTION_63();
        v31 = v25;
LABEL_17:
        v50 = *(void **)(v20 + 80);
        v64 = *(void **)(v20 + 88);
        v49 = v64;
        v51 = (_QWORD *)OUTLINED_FUNCTION_48();
        v51[2] = v31;
        v51[3] = v0;
        v52 = v72;
        v51[4] = v71;
        v51[5] = v52;
        v51[6] = v20;
        v51[7] = v12;
        v54 = v73;
        v53 = v74;
        v51[8] = v73;
        v51[9] = v53;
        v51[10] = v75;
        v76[4] = (uint64_t)sub_1C2F20A7C;
        v76[5] = (uint64_t)v51;
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 1107296256;
        v76[2] = (uint64_t)sub_1C2F0B2C8;
        v76[3] = (uint64_t)&block_descriptor_1;
        v71 = _Block_copy(v76);
        v65 = v50;
        v55 = v49;
        swift_retain();
        swift_retain();
        swift_retain();
        v56 = v12;
        v57 = v54;
        sub_1C2F0DFEC(v53);
        sub_1C2F24508();
        v77 = MEMORY[0x1E0DEE9D8];
        sub_1C2F1CF8C((unint64_t *)&qword_1ED7E0510, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
        OUTLINED_FUNCTION_30();
        v58 = (uint64_t)v70;
        sub_1C2F248EC();
        v59 = v65;
        v60 = v71;
        MEMORY[0x1C3BCD11C](v64, v1, v58, v71);
        _Block_release(v60);
        OUTLINED_FUNCTION_100();

        OUTLINED_FUNCTION_81_2(v58, *(uint64_t (**)(uint64_t, uint64_t))(v66 + 8));
        OUTLINED_FUNCTION_90(v68);
        swift_release();
        return 1;
      }
      v30 = OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_34_0();
      OUTLINED_FUNCTION_17_3();
      v31 = v25;
      if ((v30 & 1) != 0)
        goto LABEL_17;
    }
    else
    {
      OUTLINED_FUNCTION_34_0();
    }
    v38 = (v0 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_28_0();
    v39 = v12;
    sub_1C2F244C0();
    v40 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v38, v40))
    {
      v41 = OUTLINED_FUNCTION_3();
      v42 = OUTLINED_FUNCTION_3();
      v76[0] = v42;
      *(_DWORD *)v41 = 136315650;
      v43 = OUTLINED_FUNCTION_52();
      v77 = sub_1C2F08778(v43, v44, v76);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_68_0();
      *(_WORD *)(v41 + 12) = 2080;
      v45 = objc_msgSend(v39, sel_refId);
      v75 = v42;
      if (v45)
      {
        v47 = v45;
        v48 = sub_1C2F24604();

      }
      else
      {
        v48 = 7104878;
      }
      v77 = OUTLINED_FUNCTION_49_1(v48, v46, v76);
      OUTLINED_FUNCTION_94_0();

      OUTLINED_FUNCTION_51();
      *(_WORD *)(v41 + 22) = 2080;
      v62 = OUTLINED_FUNCTION_46_2();
      v77 = OUTLINED_FUNCTION_77(v62, v63, v76);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_68_0();
      OUTLINED_FUNCTION_64_1(&dword_1C2F05000, v38, v40, "Received %s with refId: %s whereas current requestId is: %s .. ignoring this command", (uint8_t *)v41);
      OUTLINED_FUNCTION_62_1();
      OUTLINED_FUNCTION_0();
    }

    swift_release_n();
  }
  else
  {
    v32 = OUTLINED_FUNCTION_100_0();
    v33 = sub_1C2F247F0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_3();
      v76[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v34 = 136315138;
      v35 = OUTLINED_FUNCTION_52();
      v37 = sub_1C2F08778(v35, v36, v76);
      OUTLINED_FUNCTION_15_0(v37);
      OUTLINED_FUNCTION_102_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19(&dword_1C2F05000, v32, v33, "There is no request processor to serve command: %s", v34);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

  }
  return 0;
}

uint64_t sub_1C2F1EE38(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v14 = sub_1C2F244C0();
  v15 = sub_1C2F247E4();
  if (os_log_type_enabled(v14, v15))
  {
    v24 = a6;
    v16 = (uint8_t *)swift_slowAlloc();
    v25 = a8;
    v17 = swift_slowAlloc();
    v26 = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = sub_1C2F24AF0();
    sub_1C2F08778(v18, v19, &v26);
    sub_1C2F248C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F05000, v14, v15, "Dispatching %s", v16, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    a8 = v25;
    MEMORY[0x1C3BCD824](v20, -1, -1);
    v21 = v16;
    a6 = v24;
    MEMORY[0x1C3BCD824](v21, -1, -1);
  }

  v22 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))a2(a4);
  v22(a5, a6, a7, a8);
  return swift_release();
}

uint64_t sub_1C2F1F008(void *a1, uint64_t a2, void (*a3)(id, id), uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t result;
  NSObject *v12;
  id v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;

  v5 = v4;
  v10 = *v4;
  result = sub_1C2F1E8D8();
  if ((result & 1) == 0)
  {
    v12 = ((char *)v4 + qword_1ED7E0D00);
    OUTLINED_FUNCTION_28_0();
    v13 = a1;
    sub_1C2F244C0();
    v14 = OUTLINED_FUNCTION_71();
    if (os_log_type_enabled(v12, v14))
    {
      v15 = OUTLINED_FUNCTION_3();
      v27 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v15 = 136315394;
      v26 = v14;
      v16 = v5[2];
      sub_1C2F24598();
      OUTLINED_FUNCTION_49_1(v16, v17, &v27);
      OUTLINED_FUNCTION_94_0();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_51();
      *(_WORD *)(v15 + 12) = 2080;
      v18 = objc_msgSend(v13, sel_debugDescription);
      v19 = sub_1C2F24604();
      v25 = v12;
      v21 = v20;

      sub_1C2F08778(v19, v21, &v27);
      sub_1C2F248C8();

      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_37(&dword_1C2F05000, v25, v26, "%s bridge was not able to handle: %s.", (uint8_t *)v15);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_40_0();
    v23 = type metadata accessor for RequestAwareBridgeBase(0, *(_QWORD *)(v10 + 328), *(_QWORD *)(v10 + 336), v22);
    v24 = MEMORY[0x1C3BCD794](&protocol conformance descriptor for MessageDispatchingBridgeBase<A>, v23);
    return Bridge.defaultHandle(_:executionContextInfo:reply:)(v13, a2, a3, a4, v23, v24);
  }
  return result;
}

void sub_1C2F1F234()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[7];

  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  v5 = v4;
  v45 = *v0;
  v6 = OUTLINED_FUNCTION_59_2();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_36_2();
  v8 = sub_1C2F244FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_37_2();
  v10 = sub_1C2F24520();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_4_0();
  v47 = v12;
  v13 = sub_1C2F1D3F0();
  if (v13)
  {
    v14 = v13;
    v43 = v2;
    v44 = v9;
    swift_retain_n();
    v15 = v5;
    v16 = sub_1C2F244C0();
    v17 = sub_1C2F247E4();
    v42 = v6;
    v41 = v1;
    if (OUTLINED_FUNCTION_105(v16))
    {
      v18 = swift_slowAlloc();
      v19 = (_QWORD *)OUTLINED_FUNCTION_3();
      v50[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v18 = 136315394;
      v20 = v3[2];
      sub_1C2F24598();
      OUTLINED_FUNCTION_49_1(v20, v21, v50);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_51();
      *(_WORD *)(v18 + 12) = 2112;
      v22 = v15;
      sub_1C2F248C8();
      *v19 = v15;

      OUTLINED_FUNCTION_37(&dword_1C2F05000, v16, v17, "Bridge \"%s\" received message: %@", (uint8_t *)v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E09B0);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_13();
    sub_1C2F130E8(v15);
    v24 = v23;
    if (((*(uint64_t (**)(void))(*(_QWORD *)v23 + 120))() & 1) != 0)
    {
      v25 = v15;
      v26 = sub_1C2F244C0();
      v27 = sub_1C2F247F0();
      if (OUTLINED_FUNCTION_57_2(v26))
      {
        v28 = OUTLINED_FUNCTION_3();
        v50[0] = OUTLINED_FUNCTION_3();
        *(_DWORD *)v28 = 136315394;
        swift_getObjectType();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0CD0);
        v29 = sub_1C2F24634();
        OUTLINED_FUNCTION_71_2(v29, v30);
        sub_1C2F248C8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2080;
        sub_1C2F24418();
        sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
        sub_1C2F24A18();
        v32 = v31;
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v41, v42);
        v33 = OUTLINED_FUNCTION_72_2();
        sub_1C2F08778(v33, v32, v34);
        sub_1C2F248C8();

        OUTLINED_FUNCTION_17_3();
        OUTLINED_FUNCTION_37(&dword_1C2F05000, v26, v27, "handleMessage got message type %s with message id: %s that is not registered in the bridge", (uint8_t *)v28);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_77_2();
    }
    else
    {
      v36 = *(void **)(v14 + 80);
      v35 = *(void **)(v14 + 88);
      v37 = (_QWORD *)OUTLINED_FUNCTION_48();
      v37[2] = *(_QWORD *)(v45 + 336);
      v37[3] = v24;
      v37[4] = v14;
      v37[5] = v15;
      v50[4] = (uint64_t)sub_1C2F20CAC;
      v50[5] = (uint64_t)v37;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 1107296256;
      v38 = OUTLINED_FUNCTION_91_1((uint64_t)sub_1C2F0B2C8);
      v39 = v15;
      v40 = v36;
      v46 = v35;
      swift_retain();
      swift_retain();
      sub_1C2F24508();
      sub_1C2F1CF8C((unint64_t *)&qword_1ED7E0510, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
      OUTLINED_FUNCTION_30();
      sub_1C2F248EC();
      MEMORY[0x1C3BCD11C](v35, v47, v43, v38);
      _Block_release(v38);
      OUTLINED_FUNCTION_86_2();
      OUTLINED_FUNCTION_77_2();

      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v8);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    }
    swift_release();
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F1F7D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  id v34;
  void (*v35)(char *, uint64_t);
  char v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  const char *v41;
  id v42;
  unint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;

  OUTLINED_FUNCTION_5_1();
  v4 = v0;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_34();
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_51_1();
  sub_1C2F24538();
  OUTLINED_FUNCTION_82_1();
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v61 - v13;
  v15 = OUTLINED_FUNCTION_59_2();
  v68 = *(_QWORD *)(v15 - 8);
  v69 = v15;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_4_0();
  v67 = v17;
  v18 = sub_1C2F243E8();
  v20 = v19;
  v71 = v6;
  v66 = sub_1C2F2440C();
  v70 = v21;
  v72 = v4;
  v22 = sub_1C2F1D3F0();
  if (!v22)
    goto LABEL_7;
  v24 = *(_QWORD *)(v22 + 64);
  v23 = *(_QWORD *)(v22 + 72);
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_86_2();
  v25 = v24 == v18 && v23 == v20;
  v26 = v20;
  if (v25)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v27 = OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_12_0();
  if ((v27 & 1) != 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    v42 = v71;
    OUTLINED_FUNCTION_42();
    v72 = sub_1C2F244C0();
    v43 = v26;
    v44 = sub_1C2F247F0();
    if (os_log_type_enabled(v72, v44))
    {
      v45 = OUTLINED_FUNCTION_3();
      v74 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v45 = 136315650;
      sub_1C2F24598();
      v73 = sub_1C2F08778(v18, v43, &v74);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_70();
      *(_WORD *)(v45 + 12) = 2080;
      v46 = v67;
      sub_1C2F24418();
      sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v47 = v69;
      v48 = sub_1C2F24A18();
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v46, v47);
      v50 = OUTLINED_FUNCTION_49_1(v48, v49, &v74);
      OUTLINED_FUNCTION_7_2(v50);

      OUTLINED_FUNCTION_51();
      *(_WORD *)(v45 + 22) = 2080;
      swift_getObjectType();
      v51 = OUTLINED_FUNCTION_52();
      v73 = OUTLINED_FUNCTION_31_0(v51, v52);
      OUTLINED_FUNCTION_10_3();

      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_64_1(&dword_1C2F05000, v72, v44, "Got a duplicate start request message to requestId: %s messageId: %s type: %s ignoring the new start", (uint8_t *)v45);
      OUTLINED_FUNCTION_62_1();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_4_5(v72);
    return;
  }
LABEL_7:
  v62 = v18;
  v63 = v20;
  v28 = v72;
  v29 = sub_1C2F1D3F0();
  if (v29)
  {
    v30 = v29;
    v31 = ((char *)v28 + qword_1ED7E0D00);
    sub_1C2F244C0();
    v32 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_17_2(v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v33 = 0;
      OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v31, (os_log_type_t)v18, "We still have previous processor checking waiting for it to finish", v33);
      OUTLINED_FUNCTION_0();
    }

    v34 = *(id *)(v30 + 88);
    sub_1C2F2452C();
    sub_1C2F1D528(v2);
    MEMORY[0x1C3BCCE10](v12, v2);
    OUTLINED_FUNCTION_90(v64);
    v35 = *(void (**)(char *, uint64_t))(v1 + 8);
    v35(v12, v3);
    sub_1C2F24820();

    v35(v14, v3);
    v36 = sub_1C2F244F0();
    swift_retain();
    v37 = sub_1C2F244C0();
    if ((v36 & 1) != 0)
    {
      v38 = sub_1C2F247F0();
      if (OUTLINED_FUNCTION_17_2(v38))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_3();
        v74 = OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_16_4(4.8149e-34);
        v40 = OUTLINED_FUNCTION_55_2();
        OUTLINED_FUNCTION_18_4(v40);
        OUTLINED_FUNCTION_83();
        OUTLINED_FUNCTION_17_3();
        v41 = "Previous processor for requestId: %s didn't finish processing all pending messages, creating a new processor";
        goto LABEL_19;
      }
    }
    else
    {
      v53 = sub_1C2F247E4();
      if (OUTLINED_FUNCTION_17_2(v53))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_3();
        v74 = OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_16_4(4.8149e-34);
        v54 = OUTLINED_FUNCTION_55_2();
        OUTLINED_FUNCTION_18_4(v54);
        OUTLINED_FUNCTION_83();
        OUTLINED_FUNCTION_17_3();
        v41 = "Previous processor for requestId: %s finished processing all pending messages";
LABEL_19:
        OUTLINED_FUNCTION_19(&dword_1C2F05000, v37, (os_log_type_t)v34, v41, v39);
        OUTLINED_FUNCTION_17();
        OUTLINED_FUNCTION_0();
      }
    }
    OUTLINED_FUNCTION_13();

  }
  v55 = v67;
  sub_1C2F24400();
  v56 = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))v28->isa + 62))(v66, v70, v55, v62, v63);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v55, v69);
  if (v56)
  {
    v57 = swift_retain();
    sub_1C2F1D434(v57);
    sub_1C2F1F234();
    OUTLINED_FUNCTION_100();
  }
  else
  {
    v58 = sub_1C2F244C0();
    v59 = sub_1C2F247F0();
    if (OUTLINED_FUNCTION_57_2(v58))
    {
      v60 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v60 = 0;
      OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v58, v59, "Could not create an instance of RequestProcessor", v60);
      OUTLINED_FUNCTION_0();
    }

    sub_1C2F1D434(0);
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_1C2F1FE10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  char v18;
  uint64_t v19;
  id v20;
  id v21;
  os_log_type_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  void *v35;
  id v36;
  os_log_type_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;

  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  v5 = v4;
  v6 = sub_1C2F244FC();
  v51 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_19_0();
  v50 = sub_1C2F24520();
  v8 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  OUTLINED_FUNCTION_37_2();
  v9 = sub_1C2F24388();
  v48 = *(_QWORD *)(v9 - 8);
  v49 = v9;
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_4_0();
  v47 = v11;
  v53 = OUTLINED_FUNCTION_57();
  v13 = v12;
  v14 = OUTLINED_FUNCTION_95_1();
  if (!v14)
    goto LABEL_7;
  v15 = *(_QWORD *)(v14 + 64);
  v16 = *(_QWORD *)(v14 + 72);
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_96_1();
  if (v15 == v53 && v16 == v13)
  {
    OUTLINED_FUNCTION_68_0();
LABEL_13:
    sub_1C2F1F234();
    v32 = sub_1C2F1D3F0();
    if (v32)
    {
      v33 = *(id *)(v32 + 88);
      OUTLINED_FUNCTION_100();
      v34 = (_QWORD *)OUTLINED_FUNCTION_48();
      v34[2] = v53;
      v34[3] = v13;
      v34[4] = v3;
      v35 = OUTLINED_FUNCTION_91_1((uint64_t)sub_1C2F0B2C8);
      swift_retain();
      sub_1C2F24508();
      sub_1C2F1CF8C((unint64_t *)&qword_1ED7E0510, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E0520);
      OUTLINED_FUNCTION_30();
      sub_1C2F248EC();
      sub_1C2F2482C();
      _Block_release(v35);

      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v1, v6);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v50);
      swift_release();
      OUTLINED_FUNCTION_3_1();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return;
  }
  v18 = OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_12_0();
  if ((v18 & 1) != 0)
    goto LABEL_13;
LABEL_7:
  if ((*(_BYTE *)(v3 + qword_1ED7E0918) & 1) != 0 || (v19 = OUTLINED_FUNCTION_95_1(), swift_release(), v19))
  {
    v20 = v5;
    swift_retain_n();
    v21 = v20;
    OUTLINED_FUNCTION_46_2();
    v52 = sub_1C2F244C0();
    v22 = sub_1C2F247F0();
    if (os_log_type_enabled(v52, v22))
    {
      v23 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      *(_DWORD *)v23 = 136315906;
      sub_1C2F24418();
      sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      sub_1C2F24A18();
      v25 = v24;
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
      v26 = OUTLINED_FUNCTION_72_2();
      sub_1C2F08778(v26, v25, v27);
      OUTLINED_FUNCTION_23_3();

      OUTLINED_FUNCTION_36();
      *(_WORD *)(v23 + 12) = 2080;
      swift_getObjectType();
      v28 = OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_71_2(v28, v29);
      OUTLINED_FUNCTION_23_3();

      OUTLINED_FUNCTION_12_0();
      *(_WORD *)(v23 + 22) = 2080;
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_43_2();
      OUTLINED_FUNCTION_23_3();
      OUTLINED_FUNCTION_70();
      *(_WORD *)(v23 + 32) = 2080;
      v30 = OUTLINED_FUNCTION_95_1();
      if (v30)
      {
        v31 = *(_QWORD *)(v30 + 72);
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_96_1();
      }
      else
      {
        v31 = 0xE700000000000000;
      }
      v45 = OUTLINED_FUNCTION_72_2();
      sub_1C2F08778(v45, v31, v46);
      sub_1C2F248C8();
      OUTLINED_FUNCTION_13();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_83_2(&dword_1C2F05000, v52, v22, "Got end request message to non exists request, messageId: %s type: %s requestId: %s, current requestId: %s dropping the message");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_63();

  }
  else
  {
    v36 = v5;
    OUTLINED_FUNCTION_46_2();
    v52 = sub_1C2F244C0();
    v37 = sub_1C2F24808();
    if (OUTLINED_FUNCTION_105(v52))
    {
      v38 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      *(_DWORD *)v38 = 136315650;
      sub_1C2F24418();
      sub_1C2F1CF8C((unint64_t *)&qword_1ED7E00E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      sub_1C2F24A18();
      v40 = v39;
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
      v41 = OUTLINED_FUNCTION_72_2();
      sub_1C2F08778(v41, v40, v42);
      OUTLINED_FUNCTION_24_3();

      OUTLINED_FUNCTION_34_0();
      *(_WORD *)(v38 + 12) = 2080;
      swift_getObjectType();
      v43 = OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_71_2(v43, v44);
      OUTLINED_FUNCTION_24_3();

      OUTLINED_FUNCTION_34_0();
      *(_WORD *)(v38 + 22) = 2080;
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_43_2();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_64_1(&dword_1C2F05000, v52, v37, "Got end request message for non-existing request, messageId: %s type: %s requestId: %s, current requestId is not set. Dropping the message", (uint8_t *)v38);
      OUTLINED_FUNCTION_62_1();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_63();

  }
  OUTLINED_FUNCTION_4_5(v52);
}

void sub_1C2F204A8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *oslog;
  uint64_t v23;

  v6 = sub_1C2F1D3F0();
  if (!v6)
    goto LABEL_7;
  v8 = *(_QWORD *)(v6 + 64);
  v7 = *(_QWORD *)(v6 + 72);
  sub_1C2F24598();
  swift_release();
  if (v8 == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_1C2F24A3C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
LABEL_7:
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      oslog = sub_1C2F244C0();
      v11 = sub_1C2F247E4();
      if (os_log_type_enabled(oslog, v11))
      {
        v12 = swift_slowAlloc();
        v13 = swift_slowAlloc();
        v23 = v13;
        *(_DWORD *)v12 = 136315394;
        sub_1C2F24598();
        sub_1C2F08778(a1, a2, &v23);
        sub_1C2F248C8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v12 + 12) = 2080;
        v14 = *(_QWORD *)(a3 + 16);
        v15 = *(_QWORD *)(a3 + 24);
        sub_1C2F24598();
        sub_1C2F08778(v14, v15, &v23);
        sub_1C2F248C8();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C2F05000, oslog, v11, "Request %s for bridge %s was already changed, not setting processor to 'nil'", (uint8_t *)v12, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C3BCD824](v13, -1, -1);
        MEMORY[0x1C3BCD824](v12, -1, -1);

      }
      else
      {
        swift_release_n();
        swift_bridgeObjectRelease_n();

      }
      return;
    }
  }
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v16 = sub_1C2F244C0();
  v17 = sub_1C2F247E4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v23 = v19;
    *(_DWORD *)v18 = 136315394;
    sub_1C2F24598();
    sub_1C2F08778(a1, a2, &v23);
    sub_1C2F248C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    v20 = *(_QWORD *)(a3 + 16);
    v21 = *(_QWORD *)(a3 + 24);
    sub_1C2F24598();
    sub_1C2F08778(v20, v21, &v23);
    sub_1C2F248C8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F05000, v16, v17, "Setting request processor of requestId %s for bridge %s to 'nil'", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BCD824](v19, -1, -1);
    MEMORY[0x1C3BCD824](v18, -1, -1);
  }
  else
  {
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }

  sub_1C2F1D434(0);
}

uint64_t sub_1C2F208A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_54_2();
  v1 = v0 + qword_1ED7E0CE8;
  v2 = OUTLINED_FUNCTION_34();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

void RequestAwareBridgeBase.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  MessageDispatchingBridgeBase.deinit();
  v1 = v0;
  swift_release();
  OUTLINED_FUNCTION_54_2();
  OUTLINED_FUNCTION_54_2();
  v2 = v1 + qword_1ED7E0CE8;
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  OUTLINED_FUNCTION_23();
}

uint64_t RequestAwareBridgeBase.__deallocating_deinit()
{
  RequestAwareBridgeBase.deinit();
  return swift_deallocClassInstance();
}

id sub_1C2F209A4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_1C2F245F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1C2F20A04(void (*a1)(void))
{
  a1();
  return sub_1C2F24AF0();
}

uint64_t sub_1C2F20A28()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();

  if (*(_QWORD *)(v0 + 72))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2F20A7C()
{
  uint64_t v0;

  return sub_1C2F1EE38(*(_QWORD *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t type metadata accessor for RequestAwareBridgeBase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RequestAwareBridgeBase);
}

void sub_1C2F20AD4(uint64_t *a1@<X8>)
{
  *a1 = sub_1C2F1D3F0();
  OUTLINED_FUNCTION_23();
}

void sub_1C2F20B04(uint64_t a1@<X8>)
{
  sub_1C2F1D528(a1);
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F20B2C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F244E4();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for RequestAwareBridgeBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.currentRequestProcessor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.previousProcessorTimeout.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 464))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.registerMessageHandler<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.createRequestProcessor(_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.tryToDipatchCommandToProcessor<A>(_:executionContextInfo:reply:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of RequestAwareBridgeBase.dispatchCommandToProcessor<A>(_:executionContextInfo:reply:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t sub_1C2F20C48()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101_0();
  return swift_deallocObject();
}

void sub_1C2F20C70()
{
  uint64_t v0;

  sub_1C2F204A8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1C2F20C7C()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_101_0();

  return swift_deallocObject();
}

void sub_1C2F20CAC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v0 + 24) + 104))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_23();
}

void (*sub_1C2F20CDC(uint64_t a1))()
{
  uint64_t v1;

  return sub_1C2F1DC50(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1C2F20CE4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1C2F20D08()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 32))();
  OUTLINED_FUNCTION_23();
}

void (*sub_1C2F20D28(uint64_t a1))()
{
  uint64_t v1;

  return sub_1C2F1DBEC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1C2F20D30()
{
  OUTLINED_FUNCTION_101_0();
  return swift_deallocObject();
}

void sub_1C2F20D50()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)(v0 + 32) + 200))();
  OUTLINED_FUNCTION_23();
}

void sub_1C2F20D74()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)(v0 + 32) + 208))();
  OUTLINED_FUNCTION_23();
}

void OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_4_5(id a1)
{

}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_1C2F248C8();
}

_QWORD *OUTLINED_FUNCTION_14_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return MessageDispatchingBridgeBase.init(_:_:_:_:_:_:)(*(_QWORD *)(v3 - 176), *(_QWORD *)(v3 - 168), (__int128 *)(v3 - 120), v1, a1, (__int128 *)(v3 - 160), v2);
}

uint64_t OUTLINED_FUNCTION_16_4(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_17_5(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_18_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2F248C8();
}

id OUTLINED_FUNCTION_22_3()
{
  uint64_t v0;

  return *(id *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return swift_dynamicCastClass();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C2F08778(*(_QWORD *)(v1 - 144), v0, (uint64_t *)(v1 - 136));
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return sub_1C2F24598();
}

uint64_t OUTLINED_FUNCTION_49_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C2F08778(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55_2()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_1C2F08778(v0, v1, (uint64_t *)(v2 - 88));
}

BOOL OUTLINED_FUNCTION_57_2(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_59_2()
{
  return sub_1C2F24388();
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  return sub_1C2F24A18();
}

uint64_t OUTLINED_FUNCTION_62_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_63_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void OUTLINED_FUNCTION_64_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x20u);
}

__n128 OUTLINED_FUNCTION_69_1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_70_1()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_71_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_72_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  return sub_1C2F24418();
}

uint64_t OUTLINED_FUNCTION_77_2()
{
  return swift_release();
}

void OUTLINED_FUNCTION_78_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1C2F15B58(v2, a2);
}

void OUTLINED_FUNCTION_79_1()
{
  uint64_t v0;
  uint64_t v1;

  sub_1C2F15B58(v0, v1 - 120);
}

uint64_t OUTLINED_FUNCTION_80_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2F08778(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_81_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_83_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_86_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_88_1()
{
  return sub_1C2F1D3F0();
}

void OUTLINED_FUNCTION_89_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_90_1()
{
  return sub_1C2F243DC();
}

void *OUTLINED_FUNCTION_91_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return _Block_copy((const void *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_94_0()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_95_1()
{
  return sub_1C2F1D3F0();
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return sub_1C2F245F8();
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return sub_1C2F244C0();
}

uint64_t OUTLINED_FUNCTION_101_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_102_0()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_104(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_1C2F244C0();
}

BOOL OUTLINED_FUNCTION_105(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t RequestProcessorBase.serviceHelper.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t RequestProcessorBase.messagePublisher.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1C2F0A0A4(v1 + 24, a1);
}

void RequestProcessorBase.requestId.getter()
{
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_23();
}

id RequestProcessorBase.requestQueue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 80);
}

id RequestProcessorBase.requestDispatchGroup.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 88);
}

void RequestProcessorBase.assistantId.getter()
{
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_23();
}

uint64_t RequestProcessorBase.sessionId.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_59_2();
  v0 = OUTLINED_FUNCTION_24_4();
  return v1(v0);
}

void RequestProcessorBase.rootLevelRequestId.getter()
{
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_24_4();
  OUTLINED_FUNCTION_23();
}

uint64_t sub_1C2F2118C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1C2F24598();
  return sub_1C2F21218(v1, v2);
}

uint64_t sub_1C2F211C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  OUTLINED_FUNCTION_10_0();
  v2 = *v1;
  sub_1C2F24598();
  return v2;
}

uint64_t sub_1C2F21218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  OUTLINED_FUNCTION_10_0();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_1C2F21270()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_23();
}

uint64_t RequestProcessorBase.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_7_3();
  v9 = OUTLINED_FUNCTION_19_1();
  v10 = OUTLINED_FUNCTION_9_2();
  RequestProcessorBase.init(_:_:_:_:_:_:)(v10, v11, v12, v13, v14, v15, v16, a8);
  return v9;
}

void RequestProcessorBase.init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v9 = v8;
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v13);
  v14 = OUTLINED_FUNCTION_5_4();
  v15 = OUTLINED_FUNCTION_36_3(v14);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v16);
  v9[11] = dispatch_group_create();
  v17 = (_QWORD *)((char *)v9 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *v17 = 0;
  v17[1] = 0;
  v9[12] = a1;
  v9[13] = a2;
  v18 = OUTLINED_FUNCTION_59_2();
  v19 = OUTLINED_FUNCTION_19_3(v18);
  OUTLINED_FUNCTION_26_2(v19, a3, v20);
  OUTLINED_FUNCTION_16_5();
  v9[2] = v26;
  v21 = (_QWORD *)((char *)v9 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *v21 = 0;
  v21[1] = 0xE000000000000000;
  OUTLINED_FUNCTION_46_2();
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_21_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_68_0();
  sub_1C2F24514();
  OUTLINED_FUNCTION_12_2(v23);
  sub_1C2F21520();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0540);
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_32_1();
  __swift_destroy_boxed_opaque_existential_0(a8);
  OUTLINED_FUNCTION_13_3(a3, v25);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_3_1();
}

unint64_t sub_1C2F214E4()
{
  unint64_t result;

  result = qword_1ED7E0560;
  if (!qword_1ED7E0560)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7E0560);
  }
  return result;
}

unint64_t sub_1C2F21520()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E0558;
  if (!qword_1ED7E0558)
  {
    v1 = sub_1C2F24838();
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E0558);
  }
  return result;
}

unint64_t sub_1C2F21560()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E0548;
  if (!qword_1ED7E0548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED7E0540);
    result = MEMORY[0x1C3BCD794](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E0548);
  }
  return result;
}

uint64_t RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  return OUTLINED_FUNCTION_34_2(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9);
}

void RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
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
  unint64_t v38;
  unint64_t v39;

  v11 = v9;
  v28 = a8;
  v29 = a6;
  v30 = a7;
  v33 = a3;
  OUTLINED_FUNCTION_27_1();
  v26 = v16;
  v27 = v17;
  v37 = a9;
  v36 = sub_1C2F24838();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v18);
  v35 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1C2F24844();
  v31 = *(_QWORD *)(v20 - 8);
  v32 = v20;
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v21);
  v9[11] = OUTLINED_FUNCTION_8_2();
  v22 = (_QWORD *)((char *)v9 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *v22 = 0;
  v22[1] = 0;
  v9[12] = v10;
  v9[13] = v9;
  v23 = (uint64_t)v9 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_sessionId;
  v34 = *(_QWORD *)(OUTLINED_FUNCTION_59_2() - 8);
  OUTLINED_FUNCTION_26_2(v23, a3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16));
  v11[8] = a4;
  v11[9] = a5;
  sub_1C2F0A0A4(a8, (uint64_t)(v11 + 3));
  v11[2] = v37;
  OUTLINED_FUNCTION_10_0();
  v24 = v27;
  *v22 = v26;
  v22[1] = v24;
  OUTLINED_FUNCTION_46_2();
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)((char *)v11 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *v25 = 0;
  v25[1] = 0xE000000000000000;
  v38 = 0;
  v39 = 0xE000000000000000;
  OUTLINED_FUNCTION_21_4();
  swift_bridgeObjectRelease();
  v38 = 0xD000000000000014;
  v39 = 0x80000001C2F26C50;
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_68_0();
  sub_1C2F24514();
  OUTLINED_FUNCTION_12_2(v31);
  v38 = MEMORY[0x1E0DEE9D8];
  sub_1C2F21520();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0540);
  OUTLINED_FUNCTION_33_1();
  sub_1C2F248EC();
  OUTLINED_FUNCTION_3_7();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v28);
  OUTLINED_FUNCTION_13_3(v33, v34);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_3_1();
}

uint64_t RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10)
{
  return OUTLINED_FUNCTION_34_2(a1, a2, a3, a4, a5, a6, a7, a8, a10, a9);
}

uint64_t sub_1C2F2184C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t))
{
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_7_3();
  v12 = OUTLINED_FUNCTION_19_1();
  v13 = OUTLINED_FUNCTION_9_2();
  a12(v13);
  return v12;
}

void RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_27_1();
  v22 = v11;
  v23 = v12;
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v13);
  v14 = OUTLINED_FUNCTION_5_4();
  v15 = OUTLINED_FUNCTION_36_3(v14);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_6();
  MEMORY[0x1E0C80A78](v16);
  v8[11] = OUTLINED_FUNCTION_8_2();
  v17 = (_QWORD *)((char *)v8 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootRequestId);
  *v17 = 0;
  v17[1] = 0;
  v8[12] = v9;
  v8[13] = v8;
  v18 = OUTLINED_FUNCTION_59_2();
  v19 = OUTLINED_FUNCTION_19_3(v18);
  OUTLINED_FUNCTION_26_2(v19, a3, v20);
  OUTLINED_FUNCTION_16_5();
  v8[2] = v28;
  v21 = (_QWORD *)((char *)v8 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_rootLevelRequestId);
  *v21 = v22;
  v21[1] = v23;
  OUTLINED_FUNCTION_46_2();
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_21_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_68_0();
  sub_1C2F24514();
  OUTLINED_FUNCTION_12_2(v25);
  sub_1C2F21520();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0540);
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_32_1();
  __swift_destroy_boxed_opaque_existential_0(a8);
  OUTLINED_FUNCTION_13_3(a3, v27);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_3_1();
}

uint64_t sub_1C2F21A84()
{
  uint64_t v0;
  uint64_t v1;
  char v3;

  if (sub_1C2F243E8() == *(_QWORD *)(v0 + 64) && v1 == *(_QWORD *)(v0 + 72))
    v3 = 1;
  else
    v3 = sub_1C2F24A3C();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t RequestProcessorBase.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC21SiriRequestDispatcher20RequestProcessorBase_sessionId;
  v2 = OUTLINED_FUNCTION_59_2();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_35_2();
  return v0;
}

uint64_t RequestProcessorBase.__deallocating_deinit()
{
  RequestProcessorBase.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F21B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2F211C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2F21BC0()
{
  return type metadata accessor for RequestProcessorBase();
}

uint64_t type metadata accessor for RequestProcessorBase()
{
  uint64_t result;

  result = qword_1ED7E00F8;
  if (!qword_1ED7E00F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2F21C00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2F24388();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for RequestProcessorBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of RequestProcessorBase.rootRequestId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_10_4(a1, a2, a3);
}

uint64_t dispatch thunk of RequestProcessorBase.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_10_4(a1, a2, a3);
}

uint64_t dispatch thunk of RequestProcessorBase.handleStartRequest(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of RequestProcessorBase.handleEndRequest(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of RequestProcessorBase.transitionToActiveRequest()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of RequestProcessorBase.canHandleMessage(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_1C2F24520();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_1C2F2485C();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_1C2F248EC();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_1C2F24844();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_1C2F24658();
}

dispatch_group_t OUTLINED_FUNCTION_8_2()
{
  return dispatch_group_create();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 104))(v1);
}

uint64_t OUTLINED_FUNCTION_13_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, v2);
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 80) = v1;
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 64) = v1;
  *(_QWORD *)(v0 + 72) = v3;
  return sub_1C2F0A0A4(v2, v0 + 24);
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 + 16);
  return sub_1C2F24838();
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = *(_QWORD *)(a1 - 8);
  return v1;
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return sub_1C2F2491C();
}

unint64_t OUTLINED_FUNCTION_22_4()
{
  return sub_1C2F214E4();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return sub_1C2F24658();
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_1C2F24658();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_unknownObjectRelease();
}

unint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_1C2F21560();
}

uint64_t OUTLINED_FUNCTION_34_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10@<Q0>)
{
  void (*v10)(uint64_t);

  return sub_1C2F2184C(a1, a2, a3, a4, a5, a6, a7, a8, a10.n128_i64[0], a10.n128_i64[1], a9, v10);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_3(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = *(_QWORD *)(result - 8);
  *(_QWORD *)(v1 - 136) = result;
  return result;
}

void sub_1C2F21F14()
{
  qword_1EF7D67C0 = 12589;
  *(_QWORD *)algn_1EF7D67C8 = 0xE200000000000000;
}

uint64_t static ResultCandidateConstants.selectedResultCandidateId.getter()
{
  uint64_t v0;

  if (qword_1EF7D6160 != -1)
    swift_once();
  v0 = qword_1EF7D67C0;
  sub_1C2F24598();
  return v0;
}

ValueMetadata *type metadata accessor for ResultCandidateConstants()
{
  return &type metadata for ResultCandidateConstants;
}

id SASRecognition.toAFSpeechPackage(utteranceStart:processedAudioDuration:isFinal:)(char a1, double a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id result;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;

  v3 = v2;
  v6 = sub_1C2F22490(v2);
  if (!v6)
    goto LABEL_7;
  v7 = sub_1C2F221EC(v6);
  OUTLINED_FUNCTION_20_0();
  if (!v7)
    goto LABEL_7;
  v8 = sub_1C2F224E4(v3);
  if (!v8)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_1ED7E0638 != -1)
      swift_once();
    v22 = sub_1C2F244CC();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED7E0D30);
    v23 = sub_1C2F244C0();
    v24 = sub_1C2F247E4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1C2F05000, v23, v24, "Returning empty speech package as the recognition is empty.", v25, 2u);
      MEMORY[0x1C3BCD824](v25, -1, -1);
    }

    result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFEA48]), sel_init);
    v21 = result;
    if (result)
      return v21;
    __break(1u);
    goto LABEL_14;
  }
  v9 = v8;
  v10 = objc_allocWithZone(MEMORY[0x1E0CFEA58]);
  sub_1C2F22304(v7, v9);
  v12 = (void *)v11;
  OUTLINED_FUNCTION_0_6(v11, &qword_1EF7D66D8);
  v13 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_6(v13, &qword_1EF7D67D0);
  v14 = OUTLINED_FUNCTION_2_7();
  v15 = objc_allocWithZone(MEMORY[0x1E0CFEA20]);
  sub_1C2F223B8(v13, v14);
  v17 = (void *)v16;
  OUTLINED_FUNCTION_0_6(v16, &qword_1EF7D66B8);
  v18 = v17;
  v19 = v12;
  result = sub_1C2F18B84(v12, v12, v17, a1 & 1, a2);
  if (result)
  {
    v21 = result;

    return v21;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_1C2F221EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x1E0DEE9D8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_1C2F2497C();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_1C2F09238(i, (uint64_t)v5);
    sub_1C2F10940(0, (unint64_t *)&unk_1EF7D67E0);
    if (!swift_dynamicCast())
      break;
    sub_1C2F24958();
    sub_1C2F24988();
    sub_1C2F24994();
    sub_1C2F24964();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void sub_1C2F22304(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  void *v5;

  if (!a1)
  {
    v4 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_0_6(a1, (unint64_t *)&unk_1EF7D67E0);
  v4 = sub_1C2F246DC();
  a1 = OUTLINED_FUNCTION_20_0();
  if (!a2)
    goto LABEL_5;
LABEL_3:
  OUTLINED_FUNCTION_0_6(a1, &qword_1EF7D67D8);
  v5 = (void *)sub_1C2F246DC();
  swift_bridgeObjectRelease();
LABEL_6:
  OUTLINED_FUNCTION_3_8(v2, sel_initWithPhrases_utterances_processedAudioDuration_, v4);
  OUTLINED_FUNCTION_5_5();

  OUTLINED_FUNCTION_1_4();
}

void sub_1C2F223B8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  void *v5;

  if (!a1)
  {
    v4 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_0_6(a1, &qword_1EF7D66D8);
  v4 = (void *)sub_1C2F2455C();
  a1 = OUTLINED_FUNCTION_20_0();
  if (!a2)
    goto LABEL_5;
LABEL_3:
  OUTLINED_FUNCTION_0_6(a1, &qword_1EF7D67D0);
  v5 = (void *)sub_1C2F2455C();
  swift_bridgeObjectRelease();
LABEL_6:
  OUTLINED_FUNCTION_3_8(v2, sel_initWithSpeechRecognitionFeatures_acousticFeatures_snr_, (uint64_t)v4);

  OUTLINED_FUNCTION_1_4();
}

uint64_t sub_1C2F22490(void *a1)
{
  uint64_t v1;

  if (!objc_msgSend(a1, sel_af_speechPhrases))
    return 0;
  sub_1C2F246E8();
  OUTLINED_FUNCTION_5_5();
  return v1;
}

uint64_t sub_1C2F224E4(void *a1)
{
  uint64_t v1;
  id v2;

  v2 = objc_msgSend(a1, sel_af_speechUtterances);
  if (!v2)
    return 0;
  OUTLINED_FUNCTION_0_6((uint64_t)v2, &qword_1EF7D67D8);
  sub_1C2F246E8();
  OUTLINED_FUNCTION_5_5();
  return v1;
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t a1, unint64_t *a2)
{
  return sub_1C2F10940(0, a2);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_1C2F24580();
}

id OUTLINED_FUNCTION_3_8(id a1, SEL a2, uint64_t a3)
{
  uint64_t v3;
  double v4;

  return objc_msgSend(a1, a2, a3, v3, v4);
}

void OUTLINED_FUNCTION_5_5()
{
  void *v0;

}

uint64_t SASResultCandidate.toAFSpeechPackage(utteranceStart:processedAudioDuration:isFinal:)(uint64_t a1, double a2)
{
  NSObject *v2;
  NSObject *v3;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t result;
  unint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  char v42;
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  os_log_type_t v50;
  uint8_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 *v57;
  char v58;
  uint64_t v59;
  unsigned __int8 v60;
  char v61;
  char v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  uint64_t v68;
  os_log_type_t v69;
  uint8_t *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  char v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  char v81;
  char v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned __int8 v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  id v102;
  id v103;
  os_log_type_t v104;
  id v105;
  NSObject *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char v111;
  void *v112;
  void *v113;

  v3 = v2;
  OUTLINED_FUNCTION_0_6(a1, &qword_1EF7D66D8);
  v6 = MEMORY[0x1E0DEA978];
  v7 = sub_1C2F24580();
  OUTLINED_FUNCTION_0_6(v7, &qword_1EF7D67D0);
  v8 = sub_1C2F24580();
  v9 = objc_allocWithZone(MEMORY[0x1E0CFEA20]);
  sub_1C2F223B8(v7, v8);
  v11 = (void *)v10;
  v12 = OUTLINED_FUNCTION_10_5(v10, sel_recognition);
  if (!v12)
  {
LABEL_18:
    if (qword_1ED7E0638 != -1)
      swift_once();
    v43 = OUTLINED_FUNCTION_15();
    __swift_project_value_buffer(v43, (uint64_t)qword_1ED7E0D30);
    OUTLINED_FUNCTION_14_7();
    v44 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_5_6(v44))
    {
      v45 = (uint8_t *)OUTLINED_FUNCTION_1_5();
      *(_WORD *)v45 = 0;
      OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v9, v6, "Returning empty speech package as the recognition is empty.", v45);
      OUTLINED_FUNCTION_0();
    }

    result = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFEA48]), sel_init);
    if (result)
    {
      v46 = result;

      return v46;
    }
    goto LABEL_102;
  }
  v13 = v12;
  v14 = sub_1C2F22490(v12);
  if (!v14 || (v6 = v14, v9 = sub_1C2F221EC(v14), swift_bridgeObjectRelease(), !v9))
  {

    goto LABEL_18;
  }
  v15 = sub_1C2F224E4(v13);
  if (!v15)
  {

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v16 = v15;
  v17 = objc_allocWithZone(MEMORY[0x1E0CFEA58]);
  sub_1C2F22304((uint64_t)v9, v16);
  v113 = v18;
  v19 = v3;
  sub_1C2F22E60();
  v112 = (void *)v20;
  v21 = OUTLINED_FUNCTION_10_5(v20, sel_filteredRecognition);
  if (!v21)
  {
LABEL_27:
    if (qword_1ED7E0638 != -1)
      swift_once();
    v47 = (void *)a1;
    v48 = OUTLINED_FUNCTION_15();
    __swift_project_value_buffer(v48, (uint64_t)qword_1ED7E0D30);
    v49 = OUTLINED_FUNCTION_14_7();
    v50 = sub_1C2F247E4();
    if (os_log_type_enabled((os_log_t)v49, v50))
    {
      v51 = (uint8_t *)OUTLINED_FUNCTION_1_5();
      *(_WORD *)v51 = 0;
      OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v49, v50, "No filtered recognition was found in SASResulCandidate.", v51);
      OUTLINED_FUNCTION_0();
    }

    result = sub_1C2F1CBAC(v3, (SEL *)&selRef_resultId);
    if (!v52)
      goto LABEL_103;
    v53 = v52;
    v54 = HIBYTE(v52) & 0xF;
    v55 = result & 0xFFFFFFFFFFFFLL;
    if ((v53 & 0x2000000000000000) != 0)
      v56 = v54;
    else
      v56 = result & 0xFFFFFFFFFFFFLL;
    if (!v56)
    {
      swift_bridgeObjectRelease();
      v76 = (char)v47;
      goto LABEL_92;
    }
    if ((v53 & 0x1000000000000000) != 0)
    {
      v49 = (uint64_t)sub_1C2F2361C(result, v53, 10);
      v50 = v104;
      goto LABEL_75;
    }
    if ((v53 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v57 = (unsigned __int8 *)((v53 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v57 = (unsigned __int8 *)sub_1C2F2494C();
      v49 = (uint64_t)sub_1C2F23700(v57, v55, 10);
      v50 = v58 & 1;
LABEL_75:
      v75 = swift_bridgeObjectRelease();
      v76 = (char)v47;
      if ((v50 & 1) == 0)
      {
        v111 = (char)v47;
        v77 = OUTLINED_FUNCTION_10_5(v75, sel_speechProfileUsed);
        v78 = (void *)OUTLINED_FUNCTION_11_3();
        v79 = v78;
        if (v47)
        {
          v80 = v47;
          v81 = sub_1C2F248A4();

          v82 = v81 ^ 1;
        }
        else
        {

          v82 = 1;
        }
        v83 = objc_allocWithZone(MEMORY[0x1E0CFEA48]);
        v84 = v11;
        v85 = v113;
        v86 = v112;
        result = (uint64_t)OUTLINED_FUNCTION_3_9(v113, v113, v113, v87, v111 & 1, v88, v89, v82 & 1, v49);
        if (result)
        {
          v46 = result;

          return v46;
        }
        goto LABEL_104;
      }
LABEL_92:
      sub_1C2F244C0();
      v99 = OUTLINED_FUNCTION_71();
      if (OUTLINED_FUNCTION_5_6(v99))
      {
        v100 = (uint8_t *)OUTLINED_FUNCTION_1_5();
        *(_WORD *)v100 = 0;
        OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v19, (os_log_type_t)v49, "Missing or malformed resultId in SASResultCandidate.", v100);
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_0_6(v101, &qword_1EF7D66B8);
      v102 = v11;
      v103 = v113;
      result = (uint64_t)sub_1C2F18B84(v113, v113, v11, v76 & 1, a2);
      if (result)
      {
        v46 = result;

        goto LABEL_96;
      }
      goto LABEL_105;
    }
    if (result == 43)
    {
      if (v54)
      {
        if (v54 != 1)
        {
          OUTLINED_FUNCTION_16_6();
          if (!(!v62 & v61))
          {
            v49 = v66;
            if (v65 != 2)
            {
              while (1)
              {
                OUTLINED_FUNCTION_9_3();
                if (!v62 & v61)
                  goto LABEL_67;
                OUTLINED_FUNCTION_2_8();
                if (!v62)
                  goto LABEL_67;
                v49 = v68 + v67;
                if (__OFADD__(v68, v67))
                  goto LABEL_67;
                OUTLINED_FUNCTION_6_3();
                if (v62)
                  goto LABEL_75;
              }
            }
            goto LABEL_74;
          }
        }
        goto LABEL_67;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v54 && (result - 48) <= 9u)
        {
          v49 = (result - 48);
          if (v54 != 1)
          {
            while (1)
            {
              OUTLINED_FUNCTION_9_3();
              if (!v62 & v61)
                goto LABEL_67;
              OUTLINED_FUNCTION_2_8();
              if (!v62)
                goto LABEL_67;
              v49 = v91 + v90;
              if (__OFADD__(v91, v90))
                goto LABEL_67;
              OUTLINED_FUNCTION_6_3();
              if (v62)
                goto LABEL_75;
            }
          }
          goto LABEL_74;
        }
LABEL_67:
        v49 = 0;
        v50 = OS_LOG_TYPE_INFO;
        goto LABEL_75;
      }
      if (v54)
      {
        if (v54 != 1)
        {
          OUTLINED_FUNCTION_16_6();
          if (!(!v62 & v61))
          {
            v49 = -(uint64_t)v60;
            if (v59 != 2)
            {
              while (1)
              {
                OUTLINED_FUNCTION_9_3();
                if (!v62 & v61)
                  goto LABEL_67;
                OUTLINED_FUNCTION_2_8();
                if (!v62)
                  goto LABEL_67;
                v49 = v64 - v63;
                if (__OFSUB__(v64, v63))
                  goto LABEL_67;
                OUTLINED_FUNCTION_6_3();
                if (v62)
                  goto LABEL_75;
              }
            }
LABEL_74:
            v50 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_75;
          }
        }
        goto LABEL_67;
      }
      __break(1u);
    }
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  v22 = v21;
  v23 = sub_1C2F22490(v21);
  if (!v23 || (v19 = v23, v24 = sub_1C2F221EC(v23), swift_bridgeObjectRelease(), !v24))
  {

    goto LABEL_27;
  }
  v25 = sub_1C2F224E4(v22);
  if (!v25)
  {

    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  v108 = v25;
  if (qword_1ED7E0638 != -1)
    swift_once();
  v26 = OUTLINED_FUNCTION_15();
  v106 = __swift_project_value_buffer(v26, (uint64_t)qword_1ED7E0D30);
  v27 = OUTLINED_FUNCTION_14_7();
  v28 = sub_1C2F247E4();
  v110 = a1;
  if (OUTLINED_FUNCTION_8_3(v28))
  {
    v29 = (uint8_t *)OUTLINED_FUNCTION_1_5();
    *(_WORD *)v29 = 0;
    OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v27, (os_log_type_t)&unk_1ED7E0000, "Filtered recognition was found in SASResulCandidate.", v29);
    OUTLINED_FUNCTION_0();
  }

  v30 = objc_allocWithZone(MEMORY[0x1E0CFEA58]);
  sub_1C2F22304(v24, v108);
  v32 = v31;
  result = sub_1C2F1CBAC(v3, (SEL *)&selRef_resultId);
  if (!v34)
    goto LABEL_106;
  v35 = sub_1C2F23174(result, v34);
  if ((v36 & 1) != 0)
  {
    sub_1C2F244C0();
    v69 = OUTLINED_FUNCTION_71();
    if (OUTLINED_FUNCTION_8_3(v69))
    {
      v70 = (uint8_t *)OUTLINED_FUNCTION_1_5();
      *(_WORD *)v70 = 0;
      OUTLINED_FUNCTION_89_1(&dword_1C2F05000, v106, (os_log_type_t)&unk_1ED7E0000, "Missing or malformed resultId in SASResultCandidate.", v70);
      OUTLINED_FUNCTION_0();
    }

    v71 = objc_allocWithZone(MEMORY[0x1E0CFEA48]);
    v72 = v32;
    v73 = v113;
    v74 = v11;
    result = (uint64_t)sub_1C2F2345C(v32, v113, v113, v11, a1 & 1);
    if (result)
    {
      v46 = result;

LABEL_96:
      v98 = v112;
      goto LABEL_97;
    }
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v109 = v35;
  v37 = OUTLINED_FUNCTION_10_5(v35, sel_speechProfileUsed);
  v38 = (void *)OUTLINED_FUNCTION_11_3();
  v39 = v38;
  if (&unk_1ED7E0000)
  {
    v40 = &unk_1ED7E0000;
    v41 = sub_1C2F248A4();

    v42 = v41 ^ 1;
  }
  else
  {

    v42 = 1;
  }
  v92 = objc_allocWithZone(MEMORY[0x1E0CFEA48]);
  v107 = v32;
  v105 = v113;
  v93 = v112;
  v94 = v11;
  result = (uint64_t)OUTLINED_FUNCTION_3_9(v32, v113, v113, v95, v110 & 1, v96, v97, v42 & 1, v109);
  if (result)
  {
    v46 = result;

    v98 = v107;
LABEL_97:

    return v46;
  }
LABEL_108:
  __break(1u);
  return result;
}

void sub_1C2F22E60()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  double v24;
  float v25;
  double v26;
  float v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  v2 = sub_1C2F244CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C2F1CBAC(v1, (SEL *)&selRef_latticeRnnMitigatorModelId);
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = objc_msgSend(v1, sel_latticeRnnMitigatorCalibrationScale);
    if (v10)
    {
      v11 = v10;
      LODWORD(v34) = 0;
      BYTE4(v34) = 1;
      MEMORY[0x1C3BCD068](v10, &v34);

      if ((v34 & 0x100000000) == 0)
      {
        v12 = v34;
        v13 = objc_msgSend(v1, sel_latticeRnnMitigatorCalibrationOffset);
        if (v13)
        {
          v14 = v13;
          LODWORD(v34) = 0;
          BYTE4(v34) = 1;
          MEMORY[0x1C3BCD068](v13, &v34);

          if ((v34 & 0x100000000) == 0)
          {
            v23 = v34;
            objc_msgSend(v1, sel_latticeRnnMitigatorScore);
            v25 = v24;
            objc_msgSend(v1, sel_latticeRnnMitigatorThreshold);
            v27 = v26;
            v28 = objc_allocWithZone(MEMORY[0x1E0CFEA40]);
            *(float *)&v29 = v25;
            *(float *)&v30 = v27;
            LODWORD(v31) = v12;
            LODWORD(v32) = v23;
            sub_1C2F234D0(v29, v30, v31, v32, v8, v9);
            return;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1ED7E0638 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED7E0D30);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  v16 = v1;
  v17 = sub_1C2F244C0();
  v18 = sub_1C2F247E4();
  if (!os_log_type_enabled(v17, v18))
  {

    goto LABEL_13;
  }
  v19 = (uint8_t *)swift_slowAlloc();
  v20 = swift_slowAlloc();
  v34 = v20;
  *(_DWORD *)v19 = 136315138;
  v21 = sub_1C2F1CBAC(v16, (SEL *)&selRef_resultId);
  if (v22)
  {
    v33 = sub_1C2F08778(v21, v22, &v34);
    sub_1C2F248C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F05000, v17, v18, "Nil ModelId, CalibrationScale, or CalibrationOffset found in rc=%s.  Returning nil AFSpeechLatticeMitigatorResult.", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BCD824](v20, -1, -1);
    MEMORY[0x1C3BCD824](v19, -1, -1);

LABEL_13:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }

  __break(1u);
}

uint64_t sub_1C2F23174(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_1C2F2494C();
      v7 = (uint64_t)sub_1C2F23700(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_1C2F2361C(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

id sub_1C2F233C0(void *a1, void *a2, void *a3, void *a4, char a5, void *a6, char a7, char a8, uint64_t a9)
{
  void *v9;
  id v15;
  uint64_t v17;

  BYTE1(v17) = a8;
  LOBYTE(v17) = a7;
  v15 = objc_msgSend(v9, sel_initWithRecognition_unfilteredRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_latticeMitigatorResult_recognitionPaused_speechProfileUsed_resultCandidateId_, a1, a2, a3, a4, a5 & 1, a6, v17, a9);

  return v15;
}

id sub_1C2F2345C(void *a1, void *a2, void *a3, void *a4, char a5)
{
  void *v5;
  id v10;

  v10 = objc_msgSend(v5, sel_initWithRecognition_unfilteredRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4, a5 & 1);

  return v10;
}

id sub_1C2F234D0(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  id v12;

  v7 = LODWORD(a4);
  v8 = LODWORD(a3);
  v9 = LODWORD(a2);
  v10 = LODWORD(a1);
  if (a6)
  {
    v11 = (void *)sub_1C2F245F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  LODWORD(a1) = v10;
  LODWORD(a2) = v9;
  LODWORD(a3) = v8;
  LODWORD(a4) = v7;
  v12 = objc_msgSend(v6, sel_initWithResults_score_threshold_calibrationScale_calibrationOffset_, v11, a1, a2, a3, a4);

  return v12;
}

_QWORD *sub_1C2F23560(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E0568);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C2F235C4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_1C2F246A0();
    OUTLINED_FUNCTION_7_4(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x1C3BCCF48](15, a1 >> 16);
    OUTLINED_FUNCTION_7_4(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_1C2F2361C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  sub_1C2F24598();
  v5 = sub_1C2F246AC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1C2F2397C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1C2F2494C();
  }
LABEL_7:
  v11 = sub_1C2F23700(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1C2F23700(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v5 = a2 - 1;
      if (a2 != 1)
      {
        v6 = a3 + 48;
        v7 = a3 + 55;
        v8 = a3 + 87;
        if (a3 > 10)
        {
          v6 = 58;
        }
        else
        {
          v8 = 97;
          v7 = 65;
        }
        if (result)
        {
          v9 = 0;
          for (i = result + 1; ; ++i)
          {
            v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
                v12 = -87;
              }
              else
              {
                v12 = -55;
              }
            }
            else
            {
              v12 = -48;
            }
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
              return 0;
            if (!--v5)
              return (unsigned __int8 *)v9;
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2F2397C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1C2F239D8();
  v4 = sub_1C2F23A0C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1C2F239D8()
{
  return sub_1C2F246B8();
}

uint64_t sub_1C2F23A0C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1C2F23B50(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1C2F23560(v9, 0);
      v12 = sub_1C2F23C3C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      sub_1C2F24598();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1C3BCCF0C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1C3BCCF0CLL);
LABEL_9:
      sub_1C2F2494C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1C3BCCF0C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1C2F23B50(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1C2F235C4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1C2F235C4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_1C2F24688();
  }
  __break(1u);
  return result;
}

unint64_t sub_1C2F23C3C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_1C2F235C4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1C2F24694();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1C2F2494C();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_1C2F235C4(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_1C2F24670();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_3_9(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  void *v9;
  void *v10;

  return sub_1C2F233C0(a1, a2, a3, v9, a5, v10, 0, a8, a9);
}

BOOL OUTLINED_FUNCTION_5_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_7_4(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

BOOL OUTLINED_FUNCTION_8_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_10_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return sub_1C2F24898();
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  return sub_1C2F244C0();
}

uint64_t dispatch thunk of ServerFallbackDisabling.shouldDisableServerFallback(isDomainDirected:requestId:siriInputLocale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t ServerFallbackDisablingUtils.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_WORD *)(result + 16) = 514;
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t ServerFallbackDisablingUtils.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_WORD *)(v1 + 16) = 514;
  *(_QWORD *)(v1 + 24) = a1;
  return v1;
}

uint64_t sub_1C2F23F50(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  char **v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v27;

  if (a5)
    v8 = a4;
  else
    v8 = 0;
  if (a5)
    v9 = a5;
  else
    v9 = 0xE000000000000000;
  v10 = *(unsigned __int8 *)(v5 + 16);
  if (v10 == 2)
  {
    v11 = (void *)objc_opt_self();
    sub_1C2F24598();
    v12 = (void *)OUTLINED_FUNCTION_1_6();
    v13 = objc_msgSend(v11, sel_isNLServerFallbackDisabledForLocale_, v12);

  }
  else
  {
    v13 = v10 & 1;
    sub_1C2F24598();
  }
  v14 = *(unsigned __int8 *)(v5 + 17);
  if (v14 == 2)
  {
    v15 = (void *)objc_opt_self();
    v16 = (void *)OUTLINED_FUNCTION_1_6();
    v17 = objc_msgSend(v15, sel_isDomainServerFallbackDisabledForLocale_, v16);

  }
  else
  {
    v17 = v14 & 1;
  }
  if ((a1 & 1) != 0)
    v18 = v17;
  else
    v18 = v13;
  v19 = &selRef_shouldDisableServerFallbackDomain;
  if ((a1 & 1) == 0)
    v19 = &selRef_shouldDisableServerFallbackNL;
  v20 = objc_msgSend(*(id *)(v5 + 24), *v19);
  if (qword_1ED7E0638 != -1)
    swift_once();
  v21 = sub_1C2F244CC();
  __swift_project_value_buffer(v21, (uint64_t)qword_1ED7E0D30);
  swift_bridgeObjectRetain_n();
  sub_1C2F24598();
  v22 = sub_1C2F244C0();
  v23 = sub_1C2F24808();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    *(_DWORD *)v24 = 67110146;
    OUTLINED_FUNCTION_0_7();
    *(_WORD *)(v24 + 8) = 1024;
    OUTLINED_FUNCTION_0_7();
    *(_WORD *)(v24 + 14) = 1024;
    OUTLINED_FUNCTION_0_7();
    *(_WORD *)(v24 + 20) = 2080;
    sub_1C2F24598();
    sub_1C2F08778(a2, a3, &v27);
    sub_1C2F248C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 30) = 2082;
    sub_1C2F24598();
    sub_1C2F08778(v8, v9, &v27);
    sub_1C2F248C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C2F05000, v22, v23, "[ServerFallbackUtils] shouldDisableServerFallback returns %{BOOL}d with disabledByFeatureFlag = %{BOOL}d and disabledByABExperiment = %{BOOL}d for requestId: %s and locale %{public}s", (uint8_t *)v24, 0x28u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  return v18 & v20;
}

uint64_t ServerFallbackDisablingUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ServerFallbackDisablingUtils.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1C2F242B8(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_1C2F23F50(a1, a2, a3, a4, a5) & 1;
}

uint64_t type metadata accessor for ServerFallbackDisablingUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for ServerFallbackDisablingUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ServerFallbackDisablingUtils.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ServerFallbackDisablingUtils.shouldDisableServerFallback(isDomainDirected:requestId:siriInputLocale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return sub_1C2F248C8();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return sub_1C2F245F8();
}

uint64_t sub_1C2F24334()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C2F24340()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C2F2434C()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1C2F24358()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C2F24364()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1C2F24370()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1C2F2437C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C2F24388()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C2F24394()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1C2F243A0()
{
  return MEMORY[0x1E0DA81D8]();
}

uint64_t sub_1C2F243AC()
{
  return MEMORY[0x1E0DA81E0]();
}

uint64_t sub_1C2F243B8()
{
  return MEMORY[0x1E0DA81E8]();
}

uint64_t sub_1C2F243C4()
{
  return MEMORY[0x1E0D9C888]();
}

uint64_t sub_1C2F243D0()
{
  return MEMORY[0x1E0D9C930]();
}

uint64_t sub_1C2F243DC()
{
  return MEMORY[0x1E0D9CA68]();
}

uint64_t sub_1C2F243E8()
{
  return MEMORY[0x1E0D9E4F8]();
}

uint64_t sub_1C2F243F4()
{
  return MEMORY[0x1E0D9E500]();
}

uint64_t sub_1C2F24400()
{
  return MEMORY[0x1E0D9E528]();
}

uint64_t sub_1C2F2440C()
{
  return MEMORY[0x1E0D9E5F8]();
}

uint64_t sub_1C2F24418()
{
  return MEMORY[0x1E0D9E618]();
}

uint64_t sub_1C2F24424()
{
  return MEMORY[0x1E0D9E620]();
}

uint64_t sub_1C2F24430()
{
  return MEMORY[0x1E0D9E8C0]();
}

uint64_t sub_1C2F2443C()
{
  return MEMORY[0x1E0D9EBB0]();
}

uint64_t sub_1C2F24448()
{
  return MEMORY[0x1E0D9ECC8]();
}

uint64_t sub_1C2F24454()
{
  return MEMORY[0x1E0D9EF58]();
}

uint64_t sub_1C2F24460()
{
  return MEMORY[0x1E0D9EF68]();
}

uint64_t sub_1C2F2446C()
{
  return MEMORY[0x1E0D9EF70]();
}

uint64_t sub_1C2F24478()
{
  return MEMORY[0x1E0D9EF80]();
}

uint64_t sub_1C2F24484()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1C2F24490()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1C2F2449C()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1C2F244A8()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1C2F244B4()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C2F244C0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C2F244CC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C2F244D8()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1C2F244E4()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1C2F244F0()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1C2F244FC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C2F24508()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C2F24514()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1C2F24520()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C2F2452C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1C2F24538()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1C2F24544()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1C2F24550()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1C2F2455C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C2F24568()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C2F24574()
{
  return MEMORY[0x1E0DE9E48]();
}

uint64_t sub_1C2F24580()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C2F2458C()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1C2F24598()
{
  return MEMORY[0x1E0DE9EE8]();
}

uint64_t sub_1C2F245A4()
{
  return MEMORY[0x1E0DE9F78]();
}

uint64_t sub_1C2F245B0()
{
  return MEMORY[0x1E0DE9FC0]();
}

uint64_t sub_1C2F245BC()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1C2F245C8()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1C2F245D4()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1C2F245E0()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1C2F245EC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C2F245F8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C2F24604()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C2F24610()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1C2F2461C()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1C2F24628()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1C2F24634()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C2F24640()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1C2F2464C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C2F24658()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C2F24664()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C2F24670()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1C2F2467C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1C2F24688()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1C2F24694()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1C2F246A0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1C2F246AC()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1C2F246B8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C2F246C4()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1C2F246D0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C2F246DC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C2F246E8()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C2F246F4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C2F24700()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C2F2470C()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1C2F24718()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C2F24724()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1C2F24730()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C2F2473C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C2F24748()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C2F24754()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t sub_1C2F24760()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1C2F2476C()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1C2F24778()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1C2F24784()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1C2F24790()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1C2F2479C()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1C2F247A8()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1C2F247B4()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1C2F247C0()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1C2F247CC()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1C2F247D8()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1C2F247E4()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C2F247F0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C2F247FC()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1C2F24808()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C2F24814()
{
  return MEMORY[0x1E0CB1E98]();
}

uint64_t sub_1C2F24820()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1C2F2482C()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1C2F24838()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C2F24844()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C2F24850()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C2F2485C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C2F24868()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1C2F24874()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1C2F24880()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1C2F2488C()
{
  return MEMORY[0x1E0D99108]();
}

uint64_t sub_1C2F24898()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1C2F248A4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1C2F248B0()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1C2F248BC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C2F248C8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C2F248D4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C2F248E0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C2F248EC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C2F248F8()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1C2F24904()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C2F24910()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C2F2491C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C2F24928()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C2F24934()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C2F24940()
{
  return MEMORY[0x1E0DEC4F8]();
}

uint64_t sub_1C2F2494C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C2F24958()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C2F24964()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C2F24970()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1C2F2497C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C2F24988()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C2F24994()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C2F249A0()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1C2F249AC()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1C2F249B8()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1C2F249C4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C2F249D0()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C2F249DC()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1C2F249E8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C2F249F4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C2F24A00()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C2F24A0C()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C2F24A18()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C2F24A24()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1C2F24A30()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1C2F24A3C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C2F24A48()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C2F24A54()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C2F24A60()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C2F24A6C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C2F24A78()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C2F24A84()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C2F24A90()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C2F24A9C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C2F24AA8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C2F24AB4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C2F24AC0()
{
  return MEMORY[0x1E0DEDF78]();
}

uint64_t sub_1C2F24ACC()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1C2F24AD8()
{
  return MEMORY[0x1E0DEDF90]();
}

uint64_t sub_1C2F24AE4()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1C2F24AF0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

uint64_t AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags()
{
  return MEMORY[0x1E0CFE440]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1E0CFE448]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1E0C837C0](*(_QWORD *)&a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

