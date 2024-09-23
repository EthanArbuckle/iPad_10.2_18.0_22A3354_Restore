void SiriSuggestionsXPCClient.__allocating_init()()
{
  swift_allocObject();
  SiriSuggestionsXPCClient.init()();
  OUTLINED_FUNCTION_7();
}

uint64_t SiriSuggestionsXPCClient.init()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, char *, uint64_t);
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCB20);
  MEMORY[0x1E0C80A78]();
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = OUTLINED_FUNCTION_1();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03E37DC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_1C03A7DC8((uint64_t)v2);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v7 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v7(v6, v2, v3);
    v7((char *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport24SiriSuggestionsXPCClient_bridge), v6, v3);
  }
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B99E90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1C03A7DC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCB20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SiriSuggestionsXPCClient.__allocating_init(connection:xpcInterface:)(void *a1, void *a2)
{
  uint64_t v4;

  swift_allocObject();
  v4 = SiriSuggestionsXPCClient.init()();

  return v4;
}

uint64_t SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return OUTLINED_FUNCTION_6();
}

uint64_t SiriSuggestionsXPCClient.getNextSuggestions(requestId:)()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_4();
  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return OUTLINED_FUNCTION_6();
}

uint64_t SiriSuggestionsXPCClient.logEngagement(for:intent:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_0(v0);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  OUTLINED_FUNCTION_2((uint64_t)sub_1C03A8AF8);
  return sub_1C03E34E8();
}

uint64_t SiriSuggestionsXPCClient.getSuggestionsForApp(for:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A80E8;
  return sub_1C03E34B8();
}

uint64_t sub_1C03A80E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriSuggestionsXPCClient.logShown(for:deliveryVehicle:generationId:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_0(v0);
  sub_1C03A858C(&qword_1EF5FCB60, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5338]);
  OUTLINED_FUNCTION_2((uint64_t)sub_1C03A8AF8);
  return sub_1C03E37D0();
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E34DC();
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:properties:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4();
  v0 = swift_task_alloc();
  OUTLINED_FUNCTION_0(v0);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  OUTLINED_FUNCTION_2((uint64_t)sub_1C03A8AF8);
  return sub_1C03E34D0();
}

uint64_t SiriSuggestionsXPCClient.submitEngagement(for:with:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E3500();
}

uint64_t SiriSuggestionsXPCClient.refreshService()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E34F4();
}

uint64_t SiriSuggestionsXPCClient.warmup()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  OUTLINED_FUNCTION_0((uint64_t)v1);
  sub_1C03A858C(&qword_1EF5FCB38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5348], MEMORY[0x1E0DA5330]);
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E350C();
}

void SiriSuggestionsXPCClient.deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_7();
}

uint64_t SiriSuggestionsXPCClient.__deallocating_deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(v0);
  return swift_deallocClassInstance();
}

void sub_1C03A84FC()
{
  sub_1C03A858C(&qword_1EF5FCB90, (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsXPCClient, (uint64_t)&protocol conformance descriptor for SiriSuggestionsXPCClient);
}

uint64_t type metadata accessor for SiriSuggestionsXPCClient()
{
  uint64_t result;

  result = qword_1EF5FCC20;
  if (!qword_1EF5FCC20)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C03A8560()
{
  sub_1C03A858C(qword_1EF5FCB98, (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsXPCClient, (uint64_t)&protocol conformance descriptor for SiriSuggestionsXPCClient);
}

void sub_1C03A858C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1C3B99EA8](a3, v5), a1);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03A85C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.getNextSuggestions(requestId:)();
}

uint64_t sub_1C03A8634()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)();
}

uint64_t sub_1C03A86B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A80E8;
  return SiriSuggestionsXPCClient.refreshService()();
}

uint64_t sub_1C03A8708()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E3728();
}

uint64_t sub_1C03A87A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)();
}

uint64_t sub_1C03A8818()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.submitAsync(for:properties:)();
}

uint64_t sub_1C03A8880()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return sub_1C03E3734();
}

uint64_t sub_1C03A88F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.logShown(for:deliveryVehicle:generationId:)();
}

uint64_t sub_1C03A8960()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.logEngagement(for:intent:)();
}

uint64_t sub_1C03A89C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.warmup()();
}

uint64_t sub_1C03A8A10()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A8AF8;
  return SiriSuggestionsXPCClient.submitEngagement(for:with:)();
}

uint64_t sub_1C03A8A70()
{
  return type metadata accessor for SiriSuggestionsXPCClient();
}

uint64_t sub_1C03A8A78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E37E8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriSuggestionsXPCClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSuggestionsXPCClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_1C03E37E8();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_1C03E37E8();
}

uint64_t OUTLINED_FUNCTION_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_1C03E34C4();
}

uint64_t sub_1C03A8B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_1C03ABCF4;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_1C03A8C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  v5 = sub_1C03E3680();
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03A8C50()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t (*v27)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = v0[15];
  v2 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  if ((sub_1C03E3DA0() & 1) != 0)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_45(v3, (uint64_t)qword_1ED738B48);
    v4 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_17(v4))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_9(&dword_1C03A5000, v5, v6, "Using SiriHelp with SMART");
      OUTLINED_FUNCTION_5_0();
    }
    v7 = v0[15];

    v8 = v7 + 136;
LABEL_13:
    sub_1C03ABB30(v8, (uint64_t)(v0 + 2));
    goto LABEL_19;
  }
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  v9 = sub_1C03E3B54();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5C08];
  v0[10] = v9;
  sub_1C03A858C(&qword_1EF5FD018, v10, MEMORY[0x1E0DA5BE8]);
  v0[11] = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x1E0DA5BF8], v9);
  v13 = sub_1C03E3DB8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  if ((v13 & 1) != 0)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_45(v14, (uint64_t)qword_1ED738B48);
    v15 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_17(v15))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_9(&dword_1C03A5000, v16, v17, "Using ResponseFramework 2.0");
      OUTLINED_FUNCTION_5_0();
    }
    v18 = v0[15];

    v8 = v18 + 96;
    goto LABEL_13;
  }
  sub_1C03ABB30(v0[15] + 56, (uint64_t)(v0 + 2));
  if (qword_1ED738B40 != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v19, (uint64_t)qword_1ED738B48);
  v20 = OUTLINED_FUNCTION_46();
  if (OUTLINED_FUNCTION_17(v20))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_9(&dword_1C03A5000, v21, v22, "Using ResponseFramework 1.0");
    OUTLINED_FUNCTION_5_0();
  }

LABEL_19:
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[17] + 16))(v0[18], v0[13], v0[16]);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  sub_1C03E3D94();
  sub_1C03E3638();
  v23 = v0[5];
  v24 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v23);
  v25 = (_QWORD *)OUTLINED_FUNCTION_32();
  v0[19] = v25;
  *v25 = v0;
  v25[1] = sub_1C03A8F68;
  return v27(v0[12], v0[18], v0[14], v23, v24);
}

uint64_t sub_1C03A8F68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03A8FC0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 136));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_30();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_13(v1);
}

uint64_t sub_1C03A9000()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 136));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_30();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03A9044()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  return v0;
}

uint64_t sub_1C03A9078()
{
  sub_1C03A9044();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriHelpResponseVersionInvoker()
{
  return objc_opt_self();
}

uint64_t sub_1C03A90B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03A9124;
  return sub_1C03A8C04(a1, a2, a3);
}

uint64_t sub_1C03A9124()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03A9148(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;

  v11 = v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_templatesUrl;
  v12 = OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a1, v12);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals) = a2;
  sub_1C03ABB70(a3, v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider);
  if (a4)
  {
    v13 = OUTLINED_FUNCTION_36();
    *(_QWORD *)(v13 + 16) = a4;
    *(_QWORD *)(v13 + 24) = a5;
    v14 = &unk_1EF5FD040;
  }
  else
  {
    v13 = 0;
    v14 = &unk_1EF5FD020;
  }
  v15 = OUTLINED_FUNCTION_36();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = (_QWORD *)(v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternExecutor);
  *v16 = &unk_1EF5FD030;
  v16[1] = v15;
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1C03A9228(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int *a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v5 + 16) = a1;
  v7 = *a3;
  v8 = *a4;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v9;
  *v9 = v5;
  v9[1] = sub_1C03A92A4;
  return v11(a2, v7, v8);
}

uint64_t sub_1C03A92A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *v2;
  v7 = *v2;
  v5 = *v2;
  OUTLINED_FUNCTION_18(&v7);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1C03A92FC(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[7] = a1;
  v4[8] = a2;
  v7 = sub_1C03E34AC();
  v4[9] = v7;
  v4[10] = *(_QWORD *)(v7 - 8);
  v8 = swift_task_alloc();
  v9 = *a3;
  v4[11] = v8;
  v4[12] = v9;
  v4[13] = *a4;
  return swift_task_switch();
}

uint64_t sub_1C03A9370()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1C03E347C();
  OUTLINED_FUNCTION_14();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A93FC;
  OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 64));
  return sub_1C03E3470();
}

uint64_t sub_1C03A93FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 120) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 80);
  if (!v1)
    *(_QWORD *)(v4 + 128) = a1;
  OUTLINED_FUNCTION_28(v5);
  sub_1C03ABAE4(v4 + 16, &qword_1EF5FCFD8);
  OUTLINED_FUNCTION_11();
  return swift_task_switch();
}

uint64_t sub_1C03A94A0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  **(_QWORD **)(v0 + 56) = *(_QWORD *)(v0 + 128);
  swift_task_dealloc();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v1);
}

uint64_t sub_1C03A94D4()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03A9500(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  int *v8;

  v4[2] = a2;
  v4[3] = a3;
  v8 = (int *)((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[5] = v6;
  *v6 = v4;
  v6[1] = sub_1C03A9590;
  return ((uint64_t (*)(_QWORD *, uint64_t, _QWORD *, _QWORD *))v8)(v4 + 4, a1, v4 + 2, v4 + 3);
}

uint64_t sub_1C03A9590()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *v1;
  v5 = *v1;
  v3 = *v1;
  OUTLINED_FUNCTION_18(&v5);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return OUTLINED_FUNCTION_21(*(_QWORD *)(v2 + 32), *(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_1C03A95E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = OUTLINED_FUNCTION_15();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03A9630()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);

  v2 = v0[7];
  v1 = v0[8];
  v4 = v0[5];
  v3 = v0[6];
  v5 = sub_1C03E362C();
  v0[9] = v5;
  v6 = *(int **)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternExecutor);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_templatesUrl, v3);
  v7 = *(void **)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals);
  if (v7)
  {
    v8 = *(_QWORD *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_catGlobals);
  }
  else
  {
    OUTLINED_FUNCTION_50();
    v8 = sub_1C03E3434();
    v7 = 0;
  }
  v0[10] = v8;
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v6 + *v6);
  v9 = v7;
  v10 = (_QWORD *)swift_task_alloc();
  v0[11] = v10;
  *v10 = v0;
  v10[1] = sub_1C03A9728;
  v11 = OUTLINED_FUNCTION_43(v0[8]);
  return v13(v11, v5, v8);
}

uint64_t sub_1C03A9728(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 96) = v1;
  swift_task_dealloc();
  v5 = (void *)v4[10];
  v6 = v4[7];
  if (!v1)
    v4[13] = a1;
  OUTLINED_FUNCTION_28(v6);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1C03A97BC()
{
  _QWORD *v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (void *)v0[13];
  v2 = (uint64_t *)v0[2];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[5] + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider), *(_QWORD *)(v0[5]+ OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider+ 24));
  v3 = sub_1C03E3080();
  v4 = sub_1C03E3074();
  v5 = MEMORY[0x1E0D9ACC0];
  v2[3] = v4;
  v2[4] = v5;

  *v2 = v3;
  OUTLINED_FUNCTION_48();
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_13(v6);
}

uint64_t sub_1C03A9858()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03A9884()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5(v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework1Invoker_patternFlowProvider);
  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03A98E4()
{
  return sub_1C03AB750(sub_1C03A9884);
}

uint64_t sub_1C03A98F0()
{
  return type metadata accessor for SiriHelpResponseFramework1Invoker(0);
}

uint64_t type metadata accessor for SiriHelpResponseFramework1Invoker(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1EF5FCDC0);
}

uint64_t sub_1C03A990C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E2FC0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1C03A9998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03ABCF4;
  return sub_1C03A95E8(a1, a2, a3);
}

uint64_t sub_1C03A9A04(uint64_t a1, uint64_t a2, __int128 *a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId;
  strcpy((char *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId), "com.apple.siri");
  *(_BYTE *)(v9 + 15) = -18;
  v10 = v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_templatesUrl;
  v11 = OUTLINED_FUNCTION_15();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a1, v11);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals) = a2;
  sub_1C03ABB70(a3, v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet) = a4;
  return v4;
}

void sub_1C03A9AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11[2];

  v6 = OUTLINED_FUNCTION_15();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_38();
  v10 = v9 - v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9 - v8, a1, v6);
  sub_1C03ABB30(a3, (uint64_t)v11);
  type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  OUTLINED_FUNCTION_19();
  sub_1C03A9A04(v10, a2, v11, 0);
  __swift_destroy_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1C03A9B88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
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
  _QWORD **v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  unint64_t v67;
  char v68;
  uint64_t v69;
  _BOOL8 v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  char v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t result;
  char *v86;
  unint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unsigned int v90;
  const char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  _OWORD v109[2];
  uint64_t v110;

  v105 = a4;
  v106 = a5;
  v101 = a2;
  v102 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFF8);
  OUTLINED_FUNCTION_26();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_37(v5);
  v6 = sub_1C03E35CC();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA4E90];
  v104 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_26();
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v92 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v103 = (char *)&v86 - v11;
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_37((uint64_t)&v86 - v12);
  v100 = sub_1C03E3110();
  v94 = *(_QWORD *)(v100 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_22();
  v99 = v14;
  v96 = sub_1C03E317C();
  v98 = *(char **)(v96 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_38();
  v18 = v17 - v16;
  v97 = sub_1C03E3158();
  v89 = *(_QWORD *)(v97 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_37(v20);
  v21 = sub_1C03E34AC();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_38();
  v25 = v24 - v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD000);
  OUTLINED_FUNCTION_26();
  v27 = MEMORY[0x1E0C80A78](v26);
  v29 = (_QWORD **)((char *)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v86 - v30;
  sub_1C03A858C(&qword_1EF5FD008, v7, MEMORY[0x1E0DA4EA0]);
  v107 = v6;
  v32 = (_QWORD *)sub_1C03E404C();
  sub_1C03E3458();
  v110 = 0;
  memset(v109, 0, sizeof(v109));
  sub_1C03E34A0();
  sub_1C03E344C();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v25, v21);
  sub_1C03ABAE4((uint64_t)v109, &qword_1EF5FCFD8);
  sub_1C03ABA9C((uint64_t)v31, (uint64_t)v29);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v33 = *v29;
    if (qword_1ED738B40 != -1)
LABEL_51:
      swift_once();
    v34 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v34, (uint64_t)qword_1ED738B48);
    v35 = v33;
    v36 = v33;
    v37 = sub_1C03E4010();
    v38 = sub_1C03E41FC();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_QWORD *)&v109[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v39 = 136315138;
      swift_getErrorValue();
      v40 = sub_1C03E4424();
      v108 = sub_1C03B934C(v40, v41, (uint64_t *)v109);
      sub_1C03E4238();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      _os_log_impl(&dword_1C03A5000, v37, v38, "Error: %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    goto LABEL_47;
  }
  v42 = v89;
  v33 = v88;
  (*(void (**)(_QWORD *, _QWORD **, uint64_t))(v89 + 32))(v88, v29, v97);
  v43 = sub_1C03E314C();
  v44 = v43;
  v105 = *(_QWORD *)(v43 + 16);
  if (!v105)
  {
    v84 = v42;
    OUTLINED_FUNCTION_10();
LABEL_46:
    OUTLINED_FUNCTION_47((uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t))(v84 + 8));
LABEL_47:
    sub_1C03ABAE4((uint64_t)v31, &qword_1EF5FD000);
    return (uint64_t)v32;
  }
  v86 = v31;
  v45 = 0;
  v31 = v98;
  v102 = v43 + ((v31[80] + 32) & ~(unint64_t)v31[80]);
  v90 = *MEMORY[0x1E0DA4E80];
  v91 = "suggestionsDialog";
  v87 = 0x80000001C03E69A0;
  v101 = v43;
  while (1)
  {
    if (v45 >= *(_QWORD *)(v44 + 16))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    OUTLINED_FUNCTION_53(v18, v102 + *((_QWORD *)v31 + 9) * v45, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))v31 + 2));
    v46 = sub_1C03E3164();
    OUTLINED_FUNCTION_35(v46, v47);
    sub_1C03ABA60();
    v33 = (_QWORD *)OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    if (v33[2])
      break;
    OUTLINED_FUNCTION_31();
LABEL_29:
    v44 = v101;
    ++v45;
    OUTLINED_FUNCTION_41(*((uint64_t (**)(uint64_t, uint64_t))v31 + 1));
    if (v45 == v105)
    {
      OUTLINED_FUNCTION_10();
      v31 = v86;
      v84 = v89;
      v33 = v88;
      goto LABEL_46;
    }
  }
  v106 = v32;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
  v48 = v99;
  sub_1C03E3170();
  v31 = (char *)sub_1C03E3104();
  v50 = v49;
  v51 = *(void (**)(uint64_t, uint64_t))(v94 + 8);
  v51(v48, v100);
  v52 = v95;
  v53 = v107;
  sub_1C03E35C0();
  if (__swift_getEnumTagSinglePayload(v52, 1, v53) != 1)
  {
    v64 = v104;
    v65 = v93;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v93, v52, v53);
    v66 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
    v66(v103, v65, v53);
    v33 = (_QWORD *)OUTLINED_FUNCTION_51();
    *(_QWORD *)&v109[0] = v53;
    sub_1C03B9AC4();
    v69 = *(_QWORD *)(v53 + 16);
    v70 = (v68 & 1) == 0;
    v32 = (_QWORD *)(v69 + v70);
    if (__OFADD__(v69, v70))
      goto LABEL_49;
    v71 = v67;
    v72 = v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD010);
    if ((sub_1C03E4310() & 1) != 0)
    {
      sub_1C03B9AC4();
      if ((v72 & 1) != (v74 & 1))
        goto LABEL_53;
      v71 = v73;
    }
    v32 = *(_QWORD **)&v109[0];
    if ((v72 & 1) != 0)
    {
      v75 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)&v109[0] + 56) + 16 * v71);
      swift_bridgeObjectRelease();
      *v75 = v31;
      v75[1] = v50;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)&v109[0] + 8 * (v71 >> 6) + 64) |= 1 << v71;
      v66((char *)(v32[6] + *(_QWORD *)(v104 + 72) * v71), (uint64_t)v103, v107);
      v76 = (_QWORD *)(v32[7] + 16 * v71);
      *v76 = v31;
      v76[1] = v50;
      v77 = v32[2];
      v78 = __OFADD__(v77, 1);
      v79 = v77 + 1;
      if (v78)
        goto LABEL_50;
      v32[2] = v79;
    }
    swift_bridgeObjectRelease();
    v33 = *(_QWORD **)(v104 + 8);
    v80 = v107;
    ((void (*)(char *, uint64_t))v33)(v103, v107);
    ((void (*)(uint64_t, uint64_t))v33)(v93, v80);
    goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  sub_1C03ABAE4(v52, &qword_1EF5FCFF8);
  v54 = sub_1C03E3164();
  OUTLINED_FUNCTION_35(v54, v55);
  v56 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_31();
  v33 = *(_QWORD **)(v56 + 16);
  if (!v33)
    goto LABEL_27;
  OUTLINED_FUNCTION_40();
  if (v58 && v57 == v87 || (OUTLINED_FUNCTION_6_0() & 1) != 0)
    goto LABEL_15;
  if (v33 == (_QWORD *)1)
    goto LABEL_27;
  OUTLINED_FUNCTION_40();
  if (v58 && (OUTLINED_FUNCTION_52(), v58) || (OUTLINED_FUNCTION_6_0() & 1) != 0)
  {
LABEL_15:
    OUTLINED_FUNCTION_10();
    v59 = v104;
    v60 = (uint64_t)v92;
    (*(void (**)(char *, _QWORD, uint64_t))(v104 + 104))(v92, v90, v107);
    v61 = v99;
    sub_1C03E3170();
    v33 = (_QWORD *)sub_1C03E3104();
    v63 = v62;
    v51(v61, v100);
    OUTLINED_FUNCTION_51();
    *(_QWORD *)&v109[0] = v61;
    sub_1C03C4078((uint64_t)v33, v63, v60);
    v32 = *(_QWORD **)&v109[0];
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47(v60, *(uint64_t (**)(uint64_t, uint64_t))(v59 + 8));
LABEL_28:
    OUTLINED_FUNCTION_49();
    v31 = v98;
    goto LABEL_29;
  }
  if (v33 == (_QWORD *)2)
  {
LABEL_27:
    OUTLINED_FUNCTION_10();
    v32 = v106;
    goto LABEL_28;
  }
  v81 = v56 + 72;
  v82 = 2;
  while (1)
  {
    v83 = (_QWORD *)(v82 + 1);
    if (__OFADD__(v82, 1))
      break;
    OUTLINED_FUNCTION_40();
    if (v58)
    {
      OUTLINED_FUNCTION_52();
      if (v58)
        goto LABEL_15;
    }
    if ((OUTLINED_FUNCTION_6_0() & 1) != 0)
      goto LABEL_15;
    v81 += 16;
    ++v82;
    v31 = v98;
    if (v83 == v33)
    {
      OUTLINED_FUNCTION_10();
      v32 = v106;
      OUTLINED_FUNCTION_49();
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_53:
  result = sub_1C03E4418();
  __break(1u);
  return result;
}

uint64_t sub_1C03AA4C4(uint64_t a1)
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

uint64_t sub_1C03AA508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[13] = a5;
  v6[14] = v5;
  v6[11] = a3;
  v6[12] = a4;
  v6[9] = a1;
  v6[10] = a2;
  v7 = OUTLINED_FUNCTION_15();
  v6[15] = v7;
  v6[16] = *(_QWORD *)(v7 - 8);
  v6[17] = OUTLINED_FUNCTION_3_0();
  v8 = sub_1C03E34AC();
  v6[18] = v8;
  v6[19] = *(_QWORD *)(v8 - 8);
  v6[20] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AA570()
{
  uint64_t v0;
  _QWORD *v1;

  *(_BYTE *)(v0 + 192) = *(_BYTE *)(*(_QWORD *)(v0 + 112)
                                  + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet);
  sub_1C03E3494();
  OUTLINED_FUNCTION_14();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AA5FC;
  OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 72));
  return sub_1C03E3488();
}

uint64_t sub_1C03AA5FC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)v2 + 16;
  *(_QWORD *)(*(_QWORD *)v2 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    v7 = v4[19];
    v6 = v4[20];
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_47(v6, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    sub_1C03ABAE4(v5, &qword_1EF5FCFD8);
  }
  else
  {
    v8 = v4[19];
    v4[23] = a1;
    OUTLINED_FUNCTION_28(v8);
    sub_1C03ABAE4((uint64_t)(v4 + 2), &qword_1EF5FCFD8);
  }
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1C03AA6DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  unint64_t v5;
  void *v6;

  if (*(_BYTE *)(v0 + 192))
    v1 = 0xD000000000000011;
  else
    v1 = 0x6974736567677573;
  if (*(_BYTE *)(v0 + 192))
    v2 = 0x80000001C03E6980;
  else
    v2 = 0xEB00000000736E6FLL;
  v3 = *(id *)(v0 + 184);
  v4 = objc_msgSend(v3, sel_dialog);
  sub_1C03ABA24();
  v5 = sub_1C03E4118();

  sub_1C03AAB54(v5, v1, v2);
  v6 = (void *)sub_1C03E410C();
  OUTLINED_FUNCTION_31();
  objc_msgSend(v3, sel_setDialog_, v6);

  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t sub_1C03AA7F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  os_log_type_t type;
  uint64_t v16;

  if (qword_1ED738B40 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED738B48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  swift_bridgeObjectRetain_n();
  v6 = sub_1C03E4010();
  v7 = sub_1C03E41FC();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 88);
  if (v8)
  {
    v14 = *(_QWORD *)(v0 + 80);
    type = v7;
    v10 = OUTLINED_FUNCTION_16();
    v16 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v10 = 136315394;
    sub_1C03A858C(&qword_1EF5FCFE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v11 = sub_1C03E43E8();
    *(_QWORD *)(v0 + 56) = sub_1C03B934C(v11, v12, &v16);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_39();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 64) = sub_1C03B934C(v14, v9, &v16);
    sub_1C03E4238();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C03A5000, v6, type, "Error loading siri help snippet dialog, dir: %s, cat id: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_39();
  swift_bridgeObjectRelease_n();

  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1C03AAA40(id *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v5 = objc_msgSend(*a1, sel_id);
  sub_1C03E4094();

  sub_1C03ABA60();
  v6 = sub_1C03E4250();
  swift_bridgeObjectRelease();
  v7 = sub_1C03AA4C4(v6);
  v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    if (v7 == a2 && v9 == a3)
      v11 = 1;
    else
      v11 = sub_1C03E43F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_1C03AAB54(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v4 = v3;
  v18 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_18;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v8)
  {
    while (1)
    {
      v9 = 0;
      v16 = a2;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v10 = (id)MEMORY[0x1C3B998FC](v9, a1);
LABEL_7:
        v11 = v10;
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_17;
        v17 = v10;
        v13 = sub_1C03AAA40(&v17, a2, a3);
        if (v4)
        {
          swift_bridgeObjectRelease();

          v14 = v18;
          swift_bridgeObjectRelease();
          swift_release();
          return v14;
        }
        if ((v13 & 1) != 0)
        {
          sub_1C03E42D4();
          sub_1C03E42F8();
          v4 = 0;
          sub_1C03E4304();
          sub_1C03E42E0();
          a2 = v16;
        }
        else
        {

        }
        ++v9;
        if (v12 == v8)
        {
          v14 = v18;
          goto LABEL_20;
        }
      }
      if (v9 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v8 = sub_1C03E4340();
      if (!v8)
        goto LABEL_19;
    }
    v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_7;
  }
LABEL_19:
  v14 = MEMORY[0x1E0DEE9D8];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C03AAD1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[36] = a3;
  v4[37] = v3;
  v4[34] = a1;
  v4[35] = a2;
  v5 = sub_1C03E36E0();
  v4[38] = v5;
  v4[39] = *(_QWORD *)(v5 - 8);
  v4[40] = OUTLINED_FUNCTION_3_0();
  v6 = OUTLINED_FUNCTION_15();
  v4[41] = v6;
  v4[42] = *(_QWORD *)(v6 - 8);
  v4[43] = OUTLINED_FUNCTION_27();
  v4[44] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFA8);
  v4[45] = OUTLINED_FUNCTION_3_0();
  v7 = sub_1C03E3680();
  v4[46] = v7;
  v4[47] = *(_QWORD *)(v7 - 8);
  v4[48] = OUTLINED_FUNCTION_27();
  v4[49] = swift_task_alloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AADCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  __int128 v50;
  __int128 v51;

  v1 = *(_QWORD *)(v0 + 296);
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 376) + 16);
  v49(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 368));
  v2 = sub_1C03E362C();
  *(_QWORD *)(v0 + 248) = v2;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_isSmartSnippet) != 1)
    goto LABEL_18;
  v3 = v2;
  v4 = *(_QWORD *)(v0 + 360);
  v5 = *(_QWORD *)(v0 + 328);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88500]), sel_init);
  sub_1C03AB9BC(0x6C7070612E6D6F63, 0xEE00737069742E65, v6);
  sub_1C03E2FB4();
  if (__swift_getEnumTagSinglePayload(v4, 1, v5) == 1)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 360);
    v10 = *(_QWORD *)(v0 + 328);
    v9 = *(_QWORD *)(v0 + 336);
    v7 = (void *)sub_1C03E2F90();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v11 = *(_QWORD *)(v0 + 296);
  objc_msgSend(v6, sel_setPunchOutUri_, v7);

  sub_1C03E4214();
  sub_1C03E3644();
  if (sub_1C03E3608() == *(_QWORD *)(v11
                                    + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId)
    && v12 == *(_QWORD *)(v11
                        + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_siriAppBundleId
                        + 8))
  {
    OUTLINED_FUNCTION_10();
    goto LABEL_12;
  }
  v14 = sub_1C03E43F4();
  OUTLINED_FUNCTION_10();
  if ((v14 & 1) != 0)
  {
LABEL_12:
    v50 = 0u;
    v51 = 0u;
    sub_1C03BAC1C((uint64_t)&v50);
    v3 = *(_QWORD *)(v0 + 248);
  }
  sub_1C03C52AC(0xD000000000000010, 0x80000001C03E6960, v3, (_OWORD *)(v0 + 216));
  if (*(_QWORD *)(v0 + 240))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738338);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = sub_1C03C6DA4(3, *(_QWORD *)(v0 + 264));
      sub_1C03D11A4(v16, v17, v18, v19);
      *((_QWORD *)&v51 + 1) = v15;
      *(_QWORD *)&v50 = v20;
      sub_1C03BAC1C((uint64_t)&v50);
    }

  }
  else
  {

    sub_1C03ABAE4(v0 + 216, qword_1ED737E30);
  }
LABEL_18:
  v21 = *(_QWORD *)(v0 + 296);
  v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 336) + 16);
  v48 = v21 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_templatesUrl;
  ((void (*)(_QWORD))v47)(*(_QWORD *)(v0 + 352));
  v22 = *(_QWORD *)(v0 + 248);
  v23 = *(void **)(v21 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_catGlobals);
  if (v23)
  {
    swift_bridgeObjectRetain();
    v24 = v23;
    v25 = v23;
  }
  else
  {
    OUTLINED_FUNCTION_50();
    swift_bridgeObjectRetain();
    v25 = (_QWORD *)sub_1C03E3434();
    v24 = 0;
  }
  v26 = *(_QWORD *)(v0 + 384);
  v41 = *(_QWORD *)(v0 + 368);
  v42 = *(_QWORD *)(v0 + 392);
  v27 = *(_QWORD *)(v0 + 352);
  v29 = *(_QWORD *)(v0 + 328);
  v28 = *(_QWORD *)(v0 + 336);
  v30 = *(_QWORD *)(v0 + 320);
  v43 = *(_QWORD *)(v0 + 312);
  v44 = *(_QWORD *)(v0 + 304);
  v45 = *(_QWORD *)(v0 + 344);
  v46 = v24;
  sub_1C03A9B88(v27, 0xD000000000000021, 0x80000001C03E6900, v22, v25);
  swift_bridgeObjectRelease();

  v31 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  *(_QWORD *)(v0 + 400) = v31;
  v31(v27, v29);
  v49(v26, v42, v41);
  sub_1C03E36D4();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 104))(v30, *MEMORY[0x1E0DA4FE0], v44);
  OUTLINED_FUNCTION_53(v45, v48, v47);
  v32 = *(_QWORD *)(v0 + 248);
  *(_QWORD *)(v0 + 408) = v32;
  if (v23)
  {
    swift_bridgeObjectRetain();
    v33 = v46;
    v34 = (uint64_t)v46;
  }
  else
  {
    OUTLINED_FUNCTION_50();
    swift_bridgeObjectRetain();
    v34 = sub_1C03E3434();
    v33 = v46;
  }
  *(_QWORD *)(v0 + 416) = v34;
  v35 = v33;
  v36 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v36;
  *v36 = v0;
  v36[1] = sub_1C03AB224;
  v37 = OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 344));
  return sub_1C03AA508(v37, v38, v39, v32, v34);
}

uint64_t sub_1C03AB224(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)v1 + 416);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 400);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 344);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 328);
  *(_QWORD *)(*(_QWORD *)v1 + 432) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10();

  v3(v4, v5);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_1C03AB29C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v21;
  uint64_t v22;

  v1 = *(void **)(v0 + 432);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 312);
    v2 = *(_QWORD *)(v0 + 320);
    v4 = *(_QWORD *)(v0 + 304);
    sub_1C03E3140();
    OUTLINED_FUNCTION_19();
    *(_QWORD *)(v0 + 440) = sub_1C03E3134();
    *(_QWORD *)(v0 + 40) = v4;
    sub_1C03A858C(&qword_1EF5FCFB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA4FE8], MEMORY[0x1E0DA4FD0]);
    *(_QWORD *)(v0 + 48) = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    OUTLINED_FUNCTION_53((uint64_t)boxed_opaque_existential_1, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFC0);
    v7 = OUTLINED_FUNCTION_36();
    *(_OWORD *)(v7 + 16) = xmmword_1C03E4BF0;
    *(_QWORD *)(v7 + 32) = v1;
    v22 = v7;
    sub_1C03E4130();
    *(_QWORD *)(v0 + 448) = v22;
    v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))((int)*MEMORY[0x1E0D9BB90] + MEMORY[0x1E0D9BB90]);
    v8 = v1;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 456) = v9;
    *v9 = v0;
    v9[1] = sub_1C03AB4C0;
    return v20(v0 + 96, v0 + 16, v22, *(_QWORD *)(v0 + 288));
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 376);
    v19 = *(_QWORD *)(v0 + 368);
    v21 = *(_QWORD *)(v0 + 392);
    v12 = *(_QWORD *)(v0 + 312);
    v13 = *(_QWORD *)(v0 + 320);
    v14 = *(_QWORD *)(v0 + 304);
    v15 = *(uint64_t **)(v0 + 272);
    OUTLINED_FUNCTION_42(*(_QWORD *)(v0 + 296));
    sub_1C03E3068();
    OUTLINED_FUNCTION_19();
    *(_QWORD *)(v0 + 256) = sub_1C03E305C();
    v16 = sub_1C03E308C();
    swift_release();
    v17 = sub_1C03E3074();
    v18 = MEMORY[0x1E0D9ACC0];
    v15[3] = v17;
    v15[4] = v18;
    *v15 = v16;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v19);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1C03AB4C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = v3 + 16;
  OUTLINED_FUNCTION_18(&v3);
  swift_release();
  OUTLINED_FUNCTION_31();
  __swift_destroy_boxed_opaque_existential_1(v1);
  OUTLINED_FUNCTION_11();
  return swift_task_switch();
}

uint64_t sub_1C03AB530()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)(v0 + 432);
  v9 = *(_QWORD *)(v0 + 376);
  v10 = *(_QWORD *)(v0 + 368);
  v11 = *(_QWORD *)(v0 + 392);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(uint64_t **)(v0 + 272);
  OUTLINED_FUNCTION_42(*(_QWORD *)(v0 + 296));
  sub_1C03ABB30(v0 + 96, v0 + 136);
  v4 = OUTLINED_FUNCTION_36();
  sub_1C03ABB70((__int128 *)(v0 + 136), v4 + 16);
  v5 = sub_1C03E3068();
  OUTLINED_FUNCTION_19();
  v6 = sub_1C03E305C();
  v7 = MEMORY[0x1E0D9AA90];
  v3[3] = v5;
  v3[4] = v7;

  *v3 = v6;
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_41(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03AB654(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1C03AB66C()
{
  uint64_t (*v0)(void);

  sub_1C03E30F8();
  sub_1C03E30EC();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v0);
}

uint64_t sub_1C03AB6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_1C03AB6BC()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_1C03ABB30(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v1);
}

void sub_1C03AB6E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5(v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport33SiriHelpResponseFramework2Invoker_outputPublisher);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03AB744()
{
  return sub_1C03AB750(sub_1C03AB6E4);
}

uint64_t sub_1C03AB750(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03AB774()
{
  return type metadata accessor for SiriHelpResponseFramework2Invoker(0);
}

uint64_t type metadata accessor for SiriHelpResponseFramework2Invoker(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1EF5FCEC0);
}

uint64_t sub_1C03AB790(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C03AB7C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E2FC0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1C03AB854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AB8C0;
  return sub_1C03AAD1C(a1, a2, a3);
}

uint64_t sub_1C03AB8C0()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_3();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v0);
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1C03AB940()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1C03AB964(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1C03ABCF4;
  return sub_1C03AB6A4(a1, v1 + 16);
}

void sub_1C03AB9BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C03E4088();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setBundleId_, v4);

}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1C03ABA24()
{
  unint64_t result;

  result = qword_1EF5FCFE8;
  if (!qword_1EF5FCFE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF5FCFE8);
  }
  return result;
}

unint64_t sub_1C03ABA60()
{
  unint64_t result;

  result = qword_1EF5FCFF0;
  if (!qword_1EF5FCFF0)
  {
    result = MEMORY[0x1C3B99EA8](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF5FCFF0);
  }
  return result;
}

uint64_t sub_1C03ABA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C03ABAE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_7();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1C03ABB30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03ABB70(__int128 *a1, uint64_t a2)
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

uint64_t sub_1C03ABB88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03ABBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;

  v8 = *(int **)(v3 + 16);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03ABC30;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF5FD028 + dword_1EF5FD028))(a1, a2, a3, v8);
}

uint64_t sub_1C03ABC30(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_21(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1C03ABC5C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v10;
  _QWORD *v11;

  v10 = *(int **)(v4 + 16);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_1C03A9124;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t *, int *))((char *)&dword_1EF5FD038
                                                                                + dword_1EF5FD038))(a1, a2, a3, a4, v10);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_5_0()
{
  JUMPOUT(0x1C3B99F38);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_1C03E43F4();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return sub_1C03E34A0();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_1C03E2FC0();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_17(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_23()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_1C03E4028();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_1C03E4250();
}

uint64_t OUTLINED_FUNCTION_35(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = result;
  *(_QWORD *)(v2 - 120) = a2;
  *(_QWORD *)(v2 - 176) = 35;
  *(_QWORD *)(v2 - 168) = 0xE100000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_37@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_41@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_42(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_1C03ABB30(a1 + v1, v2);
}

uint64_t OUTLINED_FUNCTION_43@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_1C03E41E4();
}

uint64_t OUTLINED_FUNCTION_47@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_1C03E3440();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_53@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t NoOpFlow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NoOpFlow.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t NoOpFlow.on(input:)()
{
  return 0;
}

uint64_t NoOpFlow.execute(completion:)(void (*a1)(char *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v2 = sub_1C03E3128();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF5FCB10 != -1)
    swift_once();
  v6 = sub_1C03E4028();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EF5FD918);
  v7 = sub_1C03E4010();
  v8 = sub_1C03E41FC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C03A5000, v7, v8, "This method should never be called.", v9, 2u);
    MEMORY[0x1C3B99F38](v9, -1, -1);
  }

  sub_1C03E311C();
  a1(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t NoOpFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NoOpFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C03AC148()
{
  return 0;
}

uint64_t sub_1C03AC150()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AC1B8;
  return sub_1C03E30B0();
}

uint64_t sub_1C03AC1B8(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_1C03AC1EC(void (*a1)(char *))
{
  return NoOpFlow.execute(completion:)(a1);
}

uint64_t sub_1C03AC200()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03A80E8;
  return sub_1C03E30A4();
}

uint64_t sub_1C03AC274(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t type metadata accessor for NoOpFlow()
{
  return objc_opt_self();
}

uint64_t method lookup function for NoOpFlow()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NoOpFlow.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_1C03AC2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v4 = sub_1C03E3CF8();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = OUTLINED_FUNCTION_3_0();
  v5 = OUTLINED_FUNCTION_7_1();
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  v3[16] = OUTLINED_FUNCTION_3_0();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AC338()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_1ED738B40 != -1)
    swift_once();
  v1 = sub_1C03E4028();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B48);
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16_0();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C03A5000, v2, v3, "Submiting suggestion to event dispatcher", v4, 2u);
    OUTLINED_FUNCTION_5_0();
  }
  v5 = *(_QWORD *)(v0 + 128);

  sub_1C03E3908();
  v6 = sub_1C03E302C();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_1C03AD900(*(_QWORD *)(v0 + 128));
    v7 = sub_1C03E4010();
    v8 = sub_1C03E41FC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C03A5000, v7, v8, "No requestId set. Unable to dispatch suggestions", v9, 2u);
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_12_0();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD **)(v0 + 72);
    v15 = *(_QWORD *)(v0 + 80);
    v26 = *(_QWORD *)(v0 + 56);
    sub_1C03E3008();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v11, v6);
    sub_1C03E3B3C();
    sub_1C03E3CE0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
    sub_1C03AC728();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v24, *MEMORY[0x1E0DA62D8], v25);
    __swift_project_boxed_opaque_existential_1(v16 + 2, v16[5]);
    __swift_project_boxed_opaque_existential_1(v16 + 7, v16[10]);
    sub_1C03E3E84();
    v18 = v17;
    v19 = OUTLINED_FUNCTION_13_0();
    *(_QWORD *)(v0 + 40) = v19;
    *(_QWORD *)(v0 + 48) = sub_1C03AD940(&qword_1EF5FD158, (uint64_t (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent, (uint64_t)&protocol conformance descriptor for PreFetchedSuggestionEvent);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    v21 = (char *)boxed_opaque_existential_1 + *(int *)(v19 + 24);
    v22 = OUTLINED_FUNCTION_8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v21, v26, v22);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 16))(boxed_opaque_existential_1, v24, v25);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + *(int *)(v19 + 20)) = v18;
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v23;
    *v23 = v0;
    v23[1] = sub_1C03AC68C;
    return sub_1C03E3CBC();
  }
}

uint64_t sub_1C03AC68C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 16;
  OUTLINED_FUNCTION_6_1();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AC6D8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  OUTLINED_FUNCTION_12_0();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03AC728()
{
  sub_1C03E40D0();
  swift_bridgeObjectRelease();
  return sub_1C03E3CD4();
}

uint64_t _s22SiriSuggestionsSupport32DispatchSuggestionServiceFactoryCfD_0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_1C03AC7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AC840;
  return sub_1C03AC2B8(a1, a2);
}

uint64_t sub_1C03AC840()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreFetchedSuggestionEvent.deliveryVehicle.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_7_1();
  v0 = OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

double PreFetchedSuggestionEvent.receivedTS.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(OUTLINED_FUNCTION_13_0() + 20));
}

uint64_t type metadata accessor for PreFetchedSuggestionEvent()
{
  uint64_t result;

  result = qword_1ED7382D8;
  if (!qword_1ED7382D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PreFetchedSuggestionEvent.preFetchedSuggestions.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8();
  v0 = OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

BOOL sub_1C03AC91C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C03AC92C()
{
  return sub_1C03E446C();
}

uint64_t sub_1C03AC950(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v7;

  v3 = a1 == 0x79726576696C6564 && a2 == 0xEF656C6369686556;
  if (v3 || (sub_1C03E43F4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6465766965636572 && a2 == 0xEA00000000005354;
    if (v6 || (sub_1C03E43F4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x80000001C03E6A70)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = sub_1C03E43F4();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1C03ACAAC()
{
  return 3;
}

uint64_t sub_1C03ACAB4()
{
  sub_1C03E4460();
  sub_1C03E446C();
  return sub_1C03E4478();
}

uint64_t sub_1C03ACAF8()
{
  return 0;
}

uint64_t sub_1C03ACB04(char a1)
{
  if (!a1)
    return 0x79726576696C6564;
  if (a1 == 1)
    return 0x6465766965636572;
  return 0xD000000000000015;
}

BOOL sub_1C03ACB70(char *a1, char *a2)
{
  return sub_1C03AC91C(*a1, *a2);
}

uint64_t sub_1C03ACB7C()
{
  return sub_1C03ACAB4();
}

uint64_t sub_1C03ACB84()
{
  return sub_1C03AC92C();
}

uint64_t sub_1C03ACB8C()
{
  sub_1C03E4460();
  sub_1C03E446C();
  return sub_1C03E4478();
}

uint64_t sub_1C03ACBCC()
{
  char *v0;

  return sub_1C03ACB04(*v0);
}

uint64_t sub_1C03ACBD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C03AC950(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C03ACBF8()
{
  return sub_1C03ACAF8();
}

uint64_t sub_1C03ACC14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C03ACAAC();
  *a1 = result;
  return result;
}

uint64_t sub_1C03ACC38()
{
  sub_1C03ACE1C();
  return sub_1C03E449C();
}

uint64_t sub_1C03ACC60()
{
  sub_1C03ACE1C();
  return sub_1C03E44A8();
}

uint64_t PreFetchedSuggestionEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD0F0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C03ACE1C();
  sub_1C03E4490();
  sub_1C03E3CA4();
  sub_1C03AD940(&qword_1EF5FD100, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6310]);
  OUTLINED_FUNCTION_11_0();
  if (!v1)
  {
    type metadata accessor for PreFetchedSuggestionEvent();
    sub_1C03E43B8();
    sub_1C03E3AD0();
    sub_1C03AD940(&qword_1ED738230, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57B8]);
    OUTLINED_FUNCTION_11_0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_1C03ACE1C()
{
  unint64_t result;

  result = qword_1EF5FD0F8;
  if (!qword_1EF5FD0F8)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E5018, &type metadata for PreFetchedSuggestionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD0F8);
  }
  return result;
}

uint64_t PreFetchedSuggestionEvent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v17 = a2;
  v18 = sub_1C03E3AD0();
  v16 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_22();
  v19 = v4;
  v20 = sub_1C03E3CA4();
  v5 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_22();
  v22 = v6;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD108);
  MEMORY[0x1E0C80A78](v21);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreFetchedSuggestionEvent();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_4_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C03ACE1C();
  v23 = v8;
  v10 = v24;
  sub_1C03E4484();
  if (v10)
    return OUTLINED_FUNCTION_14_0();
  v27 = 0;
  sub_1C03AD940(&qword_1EF5FD110, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6330]);
  v11 = v20;
  OUTLINED_FUNCTION_10_0();
  v24 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v22, v11);
  v26 = 1;
  sub_1C03E43A0();
  v22 = v9;
  *(_QWORD *)(v2 + *(int *)(v9 + 20)) = v12;
  v25 = 2;
  sub_1C03AD940(&qword_1EF5FD118, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57C0]);
  v13 = v18;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v2 + *(int *)(v22 + 24), v19, v13);
  sub_1C03AD104(v2, v17);
  OUTLINED_FUNCTION_14_0();
  return sub_1C03AD148(v2);
}

uint64_t sub_1C03AD104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03AD148(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C03AD184()
{
  return sub_1C03AD940(&qword_1EF5FD120, (uint64_t (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent, (uint64_t)&protocol conformance descriptor for PreFetchedSuggestionEvent);
}

uint64_t sub_1C03AD1B0()
{
  return sub_1C03AD940(&qword_1EF5FD128, (uint64_t (*)(uint64_t))type metadata accessor for PreFetchedSuggestionEvent, (uint64_t)&protocol conformance descriptor for PreFetchedSuggestionEvent);
}

uint64_t sub_1C03AD1E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PreFetchedSuggestionEvent.init(from:)(a1, a2);
}

uint64_t sub_1C03AD1F8(_QWORD *a1)
{
  return PreFetchedSuggestionEvent.encode(to:)(a1);
}

uint64_t type metadata accessor for InAppEventDispatcher()
{
  return objc_opt_self();
}

uint64_t *initializeBufferWithCopyOfBuffer for PreFetchedSuggestionEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_1C03E3CA4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1C03E3AD0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1C03E3CA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_1C03E3AD0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1C03E3CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1C03E3AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1C03E3CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1C03E3AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1C03E3CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1C03E3AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for PreFetchedSuggestionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1C03E3CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1C03E3AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreFetchedSuggestionEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C03AD558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_7_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_8();
    v8 = a1 + *(int *)(a3 + 24);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for PreFetchedSuggestionEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C03AD5C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_7_1();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_8();
    v10 = a1 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1C03AD638()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1C03E3CA4();
  if (v1 <= 0x3F)
  {
    result = sub_1C03E3AD0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreFetchedSuggestionEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreFetchedSuggestionEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C03AD7AC + 4 * byte_1C03E4E05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C03AD7E0 + 4 * byte_1C03E4E00[v4]))();
}

uint64_t sub_1C03AD7E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03AD7E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03AD7F0);
  return result;
}

uint64_t sub_1C03AD7FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03AD804);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C03AD808(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03AD810(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03AD81C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C03AD828(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreFetchedSuggestionEvent.CodingKeys()
{
  return &type metadata for PreFetchedSuggestionEvent.CodingKeys;
}

unint64_t sub_1C03AD844()
{
  unint64_t result;

  result = qword_1EF5FD130;
  if (!qword_1EF5FD130)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E4FC8, &type metadata for PreFetchedSuggestionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD130);
  }
  return result;
}

unint64_t sub_1C03AD884()
{
  unint64_t result;

  result = qword_1EF5FD140;
  if (!qword_1EF5FD140)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E4F38, &type metadata for PreFetchedSuggestionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD140);
  }
  return result;
}

unint64_t sub_1C03AD8C4()
{
  unint64_t result;

  result = qword_1EF5FD148;
  if (!qword_1EF5FD148)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E4F60, &type metadata for PreFetchedSuggestionEvent.CodingKeys);
    atomic_store(result, &qword_1EF5FD148);
  }
  return result;
}

uint64_t sub_1C03AD900(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C03AD940(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3B99EA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 8))(*(_QWORD *)(v2 - 96), v0);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_1C03E3CA4();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_1C03E3AD0();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_1C03E43AC();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_1C03E43C4();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return type metadata accessor for PreFetchedSuggestionEvent();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_slowAlloc();
}

uint64_t sub_1C03ADA28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v4 = sub_1C03E3A7C();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  v3[10] = OUTLINED_FUNCTION_3_0();
  sub_1C03E3C68();
  v3[11] = OUTLINED_FUNCTION_3_0();
  v5 = sub_1C03E3914();
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03ADABC()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_9_0(*(_QWORD *)(v0 + 48));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *v1 = v0;
  v1[1] = sub_1C03ADB24;
  return sub_1C03E33A4();
}

uint64_t sub_1C03ADB24()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03ADB58()
{
  uint64_t *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;

  sub_1C03E3A34();
  sub_1C03E3A70();
  sub_1C03E2FFC();
  swift_bridgeObjectRelease();
  sub_1C03E38D8();
  if (qword_1ED738B40 != -1)
    swift_once();
  v1 = sub_1C03E4028();
  v0[16] = __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B48);
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41E4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C03A5000, v2, v3, "dispatching to sirisuggestion dispatcher", v4, 2u);
    OUTLINED_FUNCTION_5_0();
  }
  v5 = v0[6];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 56), *(_QWORD *)(v5 + 80));
  v6 = (_QWORD *)swift_task_alloc();
  v0[17] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_1C03ADCB4;
  OUTLINED_FUNCTION_18_0(v0[4]);
  return sub_1C03E36B0();
}

uint64_t sub_1C03ADCB4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 144) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03ADD04()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  OUTLINED_FUNCTION_24_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03ADD60()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 16))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  v1 = sub_1C03E4010();
  v2 = sub_1C03E41FC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(void **)(v0 + 144);
    v4 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 64);
    v19 = *(_QWORD *)(v0 + 56);
    v5 = OUTLINED_FUNCTION_16();
    v6 = (_QWORD *)OUTLINED_FUNCTION_16();
    v20 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v5 = 136315394;
    v7 = sub_1C03E3A70();
    *(_QWORD *)(v0 + 16) = sub_1C03B934C(v7, v8, &v20);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v19);
    *(_WORD *)(v5 + 12) = 2112;
    v9 = v3;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v10;
    sub_1C03E4238();
    *v6 = v10;
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_30_0();
    _os_log_impl(&dword_1C03A5000, v1, v2, "Unable to dispatch suggestions for event: %s: %@", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  v12 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 96);
  v15 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD *)(v0 + 72);
  v16 = *(_QWORD *)(v0 + 56);

  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_32_0();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  OUTLINED_FUNCTION_32_0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  OUTLINED_FUNCTION_24_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03ADFB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03ADFD0()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_9_0(v0[7]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_1C03AE030;
  OUTLINED_FUNCTION_34_0(v0[3]);
  return sub_1C03E33B0();
}

uint64_t sub_1C03AE030()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  v2 = *v1;
  *v3 = v2;
  *(_QWORD *)(v4 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v2 + 8));
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AE080()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;

  if (qword_1ED738B40 != -1)
    swift_once();
  v1 = *(void **)(v0 + 72);
  v2 = sub_1C03E4028();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED738B48);
  v3 = v1;
  v4 = v1;
  v5 = sub_1C03E4010();
  v6 = sub_1C03E41FC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_16();
    v8 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v7 = 138412290;
    OUTLINED_FUNCTION_33();
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_1C03E4238();
    *v8 = v9;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    _os_log_impl(&dword_1C03A5000, v5, v6, "Unable to dispatch suggestions for event: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03AE218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE234()
{
  uint64_t *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_9_0(v0[6]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_1C03AE294;
  OUTLINED_FUNCTION_34_0(v0[2]);
  return sub_1C03E33BC();
}

uint64_t sub_1C03AE294()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03AE2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE2D8()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_9_0(*(_QWORD *)(v0 + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AE344;
  return sub_1C03E33C8();
}

uint64_t sub_1C03AE344()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03AE374(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AE3D8;
  return sub_1C03ADA28(a1, a2);
}

uint64_t sub_1C03AE3D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03AE40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03AE3D8;
  return sub_1C03ADFB4(a1, a2, a3, a4);
}

uint64_t sub_1C03AE484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03AF788;
  return sub_1C03AE218(a1, a2, a3, a4);
}

uint64_t sub_1C03AE4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return sub_1C03AE2C0(a1, a2, a3);
}

uint64_t DispatchSuggestionServiceFactory.create(refreshableService:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE57C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 120) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 120) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AE600;
  return sub_1C03E33D4();
}

uint64_t sub_1C03AE600()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AE634()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 96);
  sub_1C03AE6B0(*(_QWORD *)(v0 + 120) + 56, v0 + 56);
  type metadata accessor for DispatcherSuggestionService();
  v3 = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_20_0(v3);
  v2[4] = sub_1C03AF1B8(&qword_1ED7382F0, type metadata accessor for DispatcherSuggestionService, (uint64_t)&unk_1C03E5390);
  *v2 = v1;
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03AE6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for DispatcherSuggestionService()
{
  return objc_opt_self();
}

uint64_t DispatchSuggestionServiceFactory.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t sub_1C03AE73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return DispatchSuggestionServiceFactory.create(refreshableService:)(a1, a2, a3);
}

uint64_t DispatchedServiceAPIProvider.allEntities.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE7BC()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_22_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_11_1(v1, (uint64_t)sub_1C03AE818);
  return sub_1C03E3E00();
}

uint64_t sub_1C03AE818()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  v0 = OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_4_2(v0, v1);
}

uint64_t DispatchedServiceAPIProvider.entities.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE858()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  OUTLINED_FUNCTION_11_1(v1, (uint64_t)sub_1C03AE8B0);
  return sub_1C03E3E48();
}

uint64_t sub_1C03AE8B0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  v0 = OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_4_2(v0, v1);
}

uint64_t DispatchedServiceAPIProvider.siriRemembersEntityExtractor.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE8F0()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  OUTLINED_FUNCTION_21_0(v1);
  return sub_1C03E3344();
}

uint64_t DispatchedServiceAPIProvider.getSystemEnvironmentService()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AE964()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  OUTLINED_FUNCTION_21_0(v1);
  return sub_1C03E33F8();
}

uint64_t sub_1C03AE9C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

void DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_31_0();
  v3 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v3 + 112) = v2;
  *(_QWORD *)(v3 + 120) = v1;
  sub_1C03ABB70(v0, v3 + 128);
  OUTLINED_FUNCTION_28_0();
}

void DispatchedServiceAPIProvider.init(provider:dispatcher:)()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_31_0();
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = v3;
  *(_QWORD *)(v1 + 120) = v2;
  sub_1C03ABB70(v0, v1 + 128);
  OUTLINED_FUNCTION_28_0();
}

uint64_t DispatchedServiceAPIProvider.getEntity<A>(entityType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AEA88()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AEAE8;
  OUTLINED_FUNCTION_18_0(*(_QWORD *)(v0 + 16));
  return sub_1C03E3E54();
}

uint64_t sub_1C03AEAE8()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  v0 = OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_4_2(v0, v1);
}

uint64_t DispatchedServiceAPIProvider.addToLifeCycle(owner:localEntities:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AEB2C()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AE9C4;
  OUTLINED_FUNCTION_18_0(*(_QWORD *)(v0 + 16));
  return sub_1C03E3E30();
}

uint64_t DispatchedServiceAPIProvider.getService()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = v1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AEBA0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0[14] + 112);
  swift_getObjectType();
  v0[12] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[15] = v2;
  *v2 = v0;
  v2[1] = sub_1C03AEC2C;
  return sub_1C03E33EC();
}

uint64_t sub_1C03AEC2C()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03AEC64()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 104);
  sub_1C03AE6B0(*(_QWORD *)(v0 + 112) + 128, v0 + 56);
  type metadata accessor for DispatcherSuggestionService();
  v3 = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_20_0(v3);
  v2[4] = sub_1C03AF1B8(&qword_1ED7382F0, type metadata accessor for DispatcherSuggestionService, (uint64_t)&unk_1C03E5390);
  *v2 = v1;
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DispatchedServiceAPIProvider.refresh(owner:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AECF0()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_19_0(v1, (uint64_t)sub_1C03AF784);
  return sub_1C03E3398();
}

uint64_t DispatchedServiceAPIProvider.destroy(owner:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AED60()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_19_0(v1, (uint64_t)sub_1C03AEDB8);
  return sub_1C03E3E3C();
}

uint64_t sub_1C03AEDB8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DispatchedServiceAPIProvider.destroy()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AEE00()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_22_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_11_1(v1, (uint64_t)sub_1C03AEDB8);
  return sub_1C03E3B90();
}

uint64_t DispatchedServiceAPIProvider.refreshAsync()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_1C03AEE70()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_8_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  OUTLINED_FUNCTION_11_1(v1, (uint64_t)sub_1C03AEED0);
  return sub_1C03E3974();
}

uint64_t sub_1C03AEED0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DispatchedServiceAPIProvider.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DispatchedServiceAPIProvider.__deallocating_deinit()
{
  DispatchedServiceAPIProvider.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t DispatchedServiceAPIProvider.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C03AEF54()
{
  return DispatchedServiceAPIProvider.unownedExecutor.getter();
}

uint64_t sub_1C03AEF6C()
{
  return sub_1C03AF1B8(&qword_1ED738888, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t type metadata accessor for DispatchedServiceAPIProvider()
{
  return objc_opt_self();
}

uint64_t sub_1C03AEFB8()
{
  return sub_1C03AF1B8(&qword_1ED738880, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AEFE4()
{
  return sub_1C03AF1B8(&qword_1ED7388B0, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AF010()
{
  return sub_1C03AF1B8(&qword_1ED738898, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AF03C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.refresh(owner:)(a1);
}

uint64_t sub_1C03AF088()
{
  return sub_1C03AF1B8(&qword_1ED738890, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AF0B4()
{
  return sub_1C03AF1B8(&qword_1ED7382F8, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AF0E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.getService()(a1);
}

uint64_t sub_1C03AF134()
{
  return sub_1C03AF1B8(&qword_1ED7388A8, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)"A\v]'h;");
}

uint64_t sub_1C03AF160()
{
  return sub_1C03AF1B8(&qword_1ED7388A0, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)")\v]'@;");
}

uint64_t sub_1C03AF18C()
{
  return sub_1C03AF1B8(&qword_1ED7388B8, type metadata accessor for DispatchedServiceAPIProvider, (uint64_t)&protocol conformance descriptor for DispatchedServiceAPIProvider);
}

uint64_t sub_1C03AF1B8(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x1C3B99EA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C03AF1F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF78C;
  return DispatchedServiceAPIProvider.entities.getter();
}

uint64_t sub_1C03AF238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.addToLifeCycle(owner:localEntities:)(a1, a2);
}

uint64_t sub_1C03AF294()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E3E60();
}

uint64_t sub_1C03AF314()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E3E78();
}

uint64_t sub_1C03AF394()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E3E6C();
}

uint64_t sub_1C03AF3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AF78C;
  return DispatchedServiceAPIProvider.getEntity<A>(entityType:)(a1, a2);
}

uint64_t sub_1C03AF458(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.destroy(owner:)(a1);
}

uint64_t sub_1C03AF4A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.refreshAsync()();
}

uint64_t sub_1C03AF4E8()
{
  return sub_1C03E3980();
}

uint64_t sub_1C03AF4F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.siriRemembersEntityExtractor.getter(a1);
}

uint64_t sub_1C03AF544(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.getSystemEnvironmentService()(a1);
}

uint64_t sub_1C03AF598()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF5E0;
  return DispatchedServiceAPIProvider.allEntities.getter();
}

uint64_t sub_1C03AF5E0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  v0 = OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_4_2(v0, v1);
}

uint64_t sub_1C03AF60C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return DispatchedServiceAPIProvider.destroy()();
}

uint64_t type metadata accessor for DispatchSuggestionServiceFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for DispatchSuggestionServiceFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for DispatchedServiceAPIProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1C03AF694(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_1C03AF6B4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1C03AF6D4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_1C03E4238();
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

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_6_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_getObjectType();
}

_QWORD *OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>)
{
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

void OUTLINED_FUNCTION_12_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_18_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_19_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  sub_1C03ABB70(v2, a1 + 16);
  result = sub_1C03ABB70(v1, a1 + 56);
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 24);
}

void OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_30_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_32_0()
{
  void *v0;

}

id OUTLINED_FUNCTION_33()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t SiriInvocationDispatcherFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SiriInvocationDispatcherFactory.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C03AF970@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for ExecutionDispatcher();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  a2[3] = v4;
  a2[4] = sub_1C03AFA1C();
  *a2 = v5;
  return swift_retain();
}

uint64_t SiriInvocationDispatcherFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriInvocationDispatcherFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C03AF9E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1C03AF970(a2, a1);
  return sub_1C03AFA9C(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_1C03AFA1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF5FD328;
  if (!qword_1EF5FD328)
  {
    v1 = type metadata accessor for ExecutionDispatcher();
    result = MEMORY[0x1C3B99EA8]("I\t]'L9", v1);
    atomic_store(result, (unint64_t *)&qword_1EF5FD328);
  }
  return result;
}

uint64_t type metadata accessor for SiriInvocationDispatcherFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriInvocationDispatcherFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriInvocationDispatcherFactory.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of SiriInvocationDispatcherFactory.createDispatcher(sink:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_1C03AFA9C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1C03AFAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[10] = a5;
  v6[11] = v5;
  v6[8] = a3;
  v6[9] = a4;
  v6[6] = a1;
  v6[7] = a2;
  v7 = sub_1C03E4028();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1C03AFB04()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _OWORD *v24;
  uint64_t v26;
  uint64_t v27;

  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = __swift_project_value_buffer(v0[12], (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_11_2();
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41F0();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[10];
  if (v4)
  {
    v7 = v0[8];
    v6 = v0[9];
    v26 = v0[7];
    v8 = OUTLINED_FUNCTION_16();
    v27 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[4] = sub_1C03B934C(v6, v5, &v27);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_1C03B934C(v26, v7, &v27);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v2, v3, "Retrieving property: %s for requestId: %s", (uint8_t *)v8);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();

  v9 = v0[11];
  v10 = *(_QWORD *)(v9 + 144);
  if (!v10 || (*(_QWORD *)(v9 + 136) == v0[7] ? (v11 = v10 == v0[8]) : (v11 = 0), !v11 && (sub_1C03E43F4() & 1) == 0))
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[13] + 16))(v0[14], v1, v0[12]);
    OUTLINED_FUNCTION_11_2();
    swift_retain_n();
    v12 = sub_1C03E4010();
    v13 = sub_1C03E41FC();
    if (OUTLINED_FUNCTION_18_1(v13))
    {
      v14 = OUTLINED_FUNCTION_16();
      v27 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v14 = 136315394;
      if (*(_QWORD *)(v9 + 144))
      {
        v15 = *(_QWORD *)(v9 + 136);
        v16 = *(_QWORD *)(v9 + 144);
      }
      else
      {
        v16 = 0xE600000000000000;
        v15 = 0x7465735F6F6ELL;
      }
      v22 = v0[7];
      v23 = v0[8];
      swift_bridgeObjectRetain();
      v0[2] = sub_1C03B934C(v15, v16, &v27);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_1();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[3] = sub_1C03B934C(v22, v23, &v27);
      sub_1C03E4238();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v12, v13, "Current state store request id %s != %s. Properties not in state store ", (uint8_t *)v14);
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_5_0();
    }
    v20 = v0[13];
    v19 = v0[14];
    v21 = v0[12];
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_14_2();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    v24 = (_OWORD *)v0[6];
    v24[1] = 0u;
    v24[2] = 0u;
    *v24 = 0u;
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_3();
    __asm { BR              X0 }
  }
  OUTLINED_FUNCTION_12_2();
  v17 = (_QWORD *)swift_task_alloc();
  v0[15] = v17;
  *v17 = v0;
  v17[1] = sub_1C03AFF68;
  OUTLINED_FUNCTION_6_3();
  __asm { BR              X7 }
}

uint64_t sub_1C03AFF68()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1C03AFFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v4 = sub_1C03E4028();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03B0010()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v1 = v0[6];
  v2 = *(_QWORD *)(v1 + 144);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 136) == v0[4] && v2 == v0[5];
    if (v3 || (sub_1C03E43F4() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_task_dealloc();
      OUTLINED_FUNCTION_6_3();
      __asm { BR              X2 }
    }
  }
  if (qword_1ED738B60 != -1)
    swift_once();
  v6 = v0[8];
  v5 = v0[9];
  v7 = v0[7];
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED738B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  swift_retain_n();
  OUTLINED_FUNCTION_11_2();
  v9 = sub_1C03E4010();
  v10 = sub_1C03E41FC();
  if (OUTLINED_FUNCTION_18_1(v10))
  {
    v11 = OUTLINED_FUNCTION_16();
    v24 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 136315394;
    v12 = *(_QWORD *)(v1 + 144);
    if (v12)
    {
      v13 = *(_QWORD *)(v1 + 136);
      v14 = v12;
    }
    else
    {
      v14 = 0xE600000000000000;
      v13 = 0x7465735F6F6ELL;
    }
    v23 = v0[4];
    v18 = v0[5];
    swift_bridgeObjectRetain();
    v0[2] = sub_1C03B934C(v13, v14, &v24);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_1();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[3] = sub_1C03B934C(v23, v18, &v24);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v9, v10, "Request ids (%s != %s dont match. Clearing store", (uint8_t *)v11);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }
  v16 = v0[8];
  v15 = v0[9];
  v17 = v0[7];
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_14_2();

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  v19 = (_QWORD *)swift_task_alloc();
  v0[10] = v19;
  *v19 = v0;
  v19[1] = sub_1C03B02F4;
  OUTLINED_FUNCTION_6_3();
  return sub_1C03B0394(v20, v21);
}

uint64_t sub_1C03B02F4()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03B0330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 136) = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 144) = v2;
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_11_2();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v3, v2);
}

uint64_t sub_1C03B0394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_1C03B03A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 136) = 0;
  *(_QWORD *)(v1 + 144) = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_2();
  v2 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v0 + 40) = v2;
  v3 = OUTLINED_FUNCTION_9_1(v2, (uint64_t)sub_1C03AE9C4);
  return OUTLINED_FUNCTION_7_2(v3, v4, v5, v6, v7);
}

uint64_t sub_1C03B0400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v9;

  v6[4] = a5;
  v6[5] = v5;
  v6[2] = a3;
  v6[3] = a4;
  v9 = (_QWORD *)swift_task_alloc();
  v6[6] = v9;
  *v9 = v6;
  v9[1] = sub_1C03B0464;
  return sub_1C03AFFAC(a1, a2);
}

uint64_t sub_1C03B0464(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  *(_QWORD *)(v3 + 64) = a2;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03B04B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0[5] + 120);
  v2 = OUTLINED_FUNCTION_12_2();
  v3 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  v0[9] = v3;
  *v3 = v0;
  v3[1] = sub_1C03B052C;
  return v5(v0[7], v0[8], v0[2], v0[3], v0[4], v2, v1);
}

uint64_t sub_1C03B052C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B0560(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_1C03B0574()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_12_2();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v0 + 40) = v1;
  v2 = OUTLINED_FUNCTION_9_1(v1, (uint64_t)sub_1C03B05C0);
  return OUTLINED_FUNCTION_7_2(v2, v3, v4, v5, v6);
}

uint64_t sub_1C03B05C0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_4_2(v0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1C03B05F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return OUTLINED_FUNCTION_4_3();
}

uint64_t sub_1C03B0608()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0[6] + 128);
  v2 = OUTLINED_FUNCTION_12_2();
  v3 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_1C03AE294;
  return v5(v0[2], v0[3], v0[4], v0[5], v2, v1);
}

uint64_t sub_1C03B067C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1C03B06A8()
{
  sub_1C03B067C();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for TurnProtectedHintsStateStore()
{
  return objc_opt_self();
}

uint64_t sub_1C03B06E0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C03B06EC()
{
  return sub_1C03B06E0();
}

uint64_t sub_1C03B0704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_1C03AE3D8;
  return sub_1C03B0400(a1, a2, a3, a4, a5);
}

uint64_t sub_1C03B0780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_1C03AF788;
  return sub_1C03AFAA4(a1, a2, a3, a4, a5);
}

uint64_t sub_1C03B0800(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AF788;
  return sub_1C03B0394(a1, a2);
}

uint64_t sub_1C03B085C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03B08B8;
  return sub_1C03B0560(a1, a2);
}

uint64_t sub_1C03B08B8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_4_2(v0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1C03B08E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03AF788;
  return sub_1C03B05F0(a1, a2, a3, a4);
}

unint64_t sub_1C03B095C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED738A28;
  if (!qword_1ED738A28)
  {
    v1 = type metadata accessor for TurnProtectedHintsStateStore();
    result = MEMORY[0x1C3B99EA8]("y\t]'h9", v1);
    atomic_store(result, (unint64_t *)&qword_1ED738A28);
  }
  return result;
}

unint64_t sub_1C03B0998(uint64_t a1)
{
  unint64_t result;

  result = sub_1C03B095C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_18_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_19_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t ExecutionDispatcher.__allocating_init(aceSink:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t ExecutionDispatcher.init(aceSink:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t ExecutionDispatcher.dispatch(suggestion:presentationContext:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = v1;
  v3 = sub_1C03E3B0C();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = OUTLINED_FUNCTION_3_0();
  v4 = sub_1C03E3D58();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_3_0();
  return swift_task_switch();
}

uint64_t sub_1C03B0B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  type metadata accessor for InvocationContextHolder();
  sub_1C03E39EC();
  sub_1C03E3AF4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_1C03B0EA0();
  swift_bridgeObjectRelease();
  sub_1C03E3A10();
  if (*(_QWORD *)(v0 + 40))
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v4 = (void *)sub_1C03E3D04();
    *(_QWORD *)(v0 + 128) = v4;
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFC0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1C03E4BF0;
    *(_QWORD *)(v5 + 32) = v4;
    v13 = v5;
    sub_1C03E4130();
    *(_QWORD *)(v0 + 136) = v13;
    *(_QWORD *)(v0 + 56) = v13;
    v6 = v4;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v7;
    *v7 = v0;
    v7[1] = sub_1C03B0D78;
    return sub_1C03E3944();
  }
  else
  {
    sub_1C03B0F30(v0 + 16);
    if (qword_1ED738B40 != -1)
      swift_once();
    v9 = sub_1C03E4028();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B48);
    v10 = sub_1C03E4010();
    v11 = sub_1C03E41FC();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C03A5000, v10, v11, "Could not get invocation command from suggestion", v12, 2u);
      MEMORY[0x1C3B99F38](v12, -1, -1);
    }

    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_44();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1C03B0D78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1C03B0DE4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_44();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B0E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  OUTLINED_FUNCTION_44();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for InvocationContextHolder()
{
  return objc_opt_self();
}

uint64_t sub_1C03B0EA0()
{
  _QWORD v1[4];

  sub_1C03E31F4();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_1C03E30C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  swift_bridgeObjectRetain();
  return sub_1C03E3D4C();
}

uint64_t sub_1C03B0F30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD438);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ExecutionDispatcher.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ExecutionDispatcher.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B0FB0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03B1000;
  return ExecutionDispatcher.dispatch(suggestion:presentationContext:)(a1);
}

uint64_t sub_1C03B1000()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1C03B1048()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1C03B113C(&qword_1EF5FD588, (uint64_t)"a\t]'|9");
  *v1 = v0;
  v1[1] = sub_1C03B1178;
  return sub_1C03E3920();
}

uint64_t sub_1C03B10D4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B10E4()
{
  return sub_1C03B113C((unint64_t *)&qword_1EF5FD328, (uint64_t)"I\t]'L9");
}

uint64_t type metadata accessor for ExecutionDispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for ExecutionDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExecutionDispatcher.__allocating_init(aceSink:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1C03B113C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ExecutionDispatcher();
    result = MEMORY[0x1C3B99EA8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[14] + 8))(v0[15], v0[13]);
}

uint64_t SiriHelpSuggestionsDispatcherFactory.__allocating_init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 *a8, void *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14 = OUTLINED_FUNCTION_36();
  v15 = OUTLINED_FUNCTION_6_4();
  SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(v15, v16, v17, v18, v19, a6, a7, a8, a9, a10, a11);
  return v14;
}

_QWORD *SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 *a8, void *a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33[2];
  __int128 v34[2];
  __int128 v35[2];
  __int128 v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v29[2] = a7;
  v29[1] = a6;
  v29[3] = a5;
  v32 = a11;
  v31 = a10;
  v30 = a9;
  v17 = OUTLINED_FUNCTION_15();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[2] = a1;
  if (a3)
  {
    v21 = (char *)OUTLINED_FUNCTION_36();
    *((_QWORD *)v21 + 2) = a3;
    *((_QWORD *)v21 + 3) = a4;
    swift_retain();
    sub_1C03B18D4(v31);

    OUTLINED_FUNCTION_11_3((uint64_t)&v39);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
    OUTLINED_FUNCTION_11_3((uint64_t)&v38);
    OUTLINED_FUNCTION_11_3((uint64_t)&v37);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a8);
    v22 = &unk_1EF5FD5B8;
  }
  else
  {
    sub_1C03ABB70(a8, (uint64_t)v36);
    OUTLINED_FUNCTION_12_3((uint64_t)v35, (uint64_t)&v37);
    OUTLINED_FUNCTION_12_3((uint64_t)v34, (uint64_t)&v38);
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 32);
    v23((char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v17);
    OUTLINED_FUNCTION_12_3((uint64_t)v33, (uint64_t)&v39);
    v24 = (*(unsigned __int8 *)(v18 + 80) + 160) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v25 = (v19 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    v21 = (char *)swift_allocObject();
    sub_1C03ABB70(v36, (uint64_t)(v21 + 16));
    *((_QWORD *)v21 + 7) = v30;
    sub_1C03ABB70(v35, (uint64_t)(v21 + 64));
    v26 = v32;
    *((_QWORD *)v21 + 13) = v31;
    *((_QWORD *)v21 + 14) = v26;
    sub_1C03ABB70(v34, (uint64_t)(v21 + 120));
    v23(&v21[v24], (uint64_t)v20, v17);
    sub_1C03ABB70(v33, (uint64_t)&v21[v25]);
    swift_retain();
    v22 = &unk_1EF5FD598;
  }
  v27 = OUTLINED_FUNCTION_36();
  *(_QWORD *)(v27 + 16) = v22;
  *(_QWORD *)(v27 + 24) = v21;
  v11[3] = &unk_1EF5FD5A8;
  v11[4] = v27;
  swift_release();
  return v11;
}

uint64_t sub_1C03B147C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = *a2;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1C03B1CC8;
  return v8(a1, v5);
}

uint64_t sub_1C03B14EC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v8[8] = a8;
  v8[9] = v11;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[2] = a1;
  v8[3] = a3;
  v9 = *a2;
  v8[10] = v12;
  v8[11] = v9;
  return swift_task_switch();
}

uint64_t sub_1C03B1520()
{
  uint64_t v0;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD **)(v0 + 16);
  v4 = type metadata accessor for SiriHelpDispatcher();
  v5 = OUTLINED_FUNCTION_6_4();
  sub_1C03C6FC4(v5, v6, v7, v8, v9, v2, v14, v13, v1, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  v11 = v10;
  v3[3] = v4;
  v3[4] = sub_1C03B1C88();
  *v3 = v11;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03B15B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_15();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  if (*(_QWORD *)(v0 + 104))
    swift_release();
  v5 = (v3 + 160) & ~v3;
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v5, v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  return swift_deallocObject();
}

uint64_t sub_1C03B166C(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  OUTLINED_FUNCTION_15();
  v5 = v2[7];
  v6 = v2[13];
  v7 = v2[14];
  v8 = swift_task_alloc();
  v9 = (_QWORD *)OUTLINED_FUNCTION_13_2(v8);
  *v9 = v3;
  v9[1] = sub_1C03B1CC8;
  return sub_1C03B14EC(a1, a2, (uint64_t)(v2 + 2), v5, (uint64_t)(v2 + 8), v6, v7, (uint64_t)(v2 + 15));
}

uint64_t sub_1C03B173C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = a2;
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_1C03B17B0;
  return v7(a1, v3 + 16);
}

uint64_t sub_1C03B17B0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B17DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03B1800()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_13_2(v0);
  v2 = OUTLINED_FUNCTION_2_2(v1);
  return OUTLINED_FUNCTION_1_0(v2, v3, v4, v5, v6);
}

uint64_t FlowSuggestionsDispatcherFactory.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C03B1858()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_13_2(v0);
  v2 = OUTLINED_FUNCTION_2_2(v1);
  return OUTLINED_FUNCTION_1_0(v2, v3, v4, v5, v6);
}

uint64_t sub_1C03B18A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B18D4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t SiriHelpSuggestionsDispatcherFactory.createDispatcher(sink:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_5_2();
}

uint64_t sub_1C03B18F8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v1 = v0[4];
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD5C8);
  v2 = OUTLINED_FUNCTION_36();
  v0[5] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_1C03E55D0;
  v3 = v2 + 32;
  v6 = (uint64_t (*)(void))(**(int **)(v1 + 24) + *(_QWORD *)(v1 + 24));
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_1C03B1980;
  return OUTLINED_FUNCTION_4_4(v3, v0[3], v6);
}

uint64_t sub_1C03B1980()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  return swift_task_switch();
}

uint64_t sub_1C03B19C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)(v0 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16);
  v3 = sub_1C03E38CC();
  v4 = MEMORY[0x1E0DA5558];
  v1[12] = v3;
  v1[13] = v4;
  v1[9] = v2;
  swift_retain();
  sub_1C03E36C8();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void SiriHelpSuggestionsDispatcherFactory.__allocating_init()()
{
  OUTLINED_FUNCTION_7_3();
  __break(1u);
}

void SiriHelpSuggestionsDispatcherFactory.init()()
{
  OUTLINED_FUNCTION_7_3();
  __break(1u);
}

uint64_t sub_1C03B1A70()
{
  swift_release();
  return swift_release();
}

uint64_t SiriHelpSuggestionsDispatcherFactory.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t FlowSuggestionsDispatcherFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriHelpSuggestionsDispatcherFactory.__deallocating_deinit()
{
  SiriHelpSuggestionsDispatcherFactory.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B1AD8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_5_2();
}

uint64_t sub_1C03B1AE8()
{
  uint64_t v0;

  sub_1C03E36BC();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t FlowSuggestionsDispatcherFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FlowSuggestionsDispatcherFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B1B30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(**(_QWORD **)v2 + 80)
                                                + *(_QWORD *)(**(_QWORD **)v2 + 80));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1C03B1CC8;
  return v8(a1, a2);
}

uint64_t type metadata accessor for SiriHelpSuggestionsDispatcherFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriHelpSuggestionsDispatcherFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriHelpSuggestionsDispatcherFactory.__allocating_init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for FlowSuggestionsDispatcherFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for FlowSuggestionsDispatcherFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FlowSuggestionsDispatcherFactory.createDispatcher(sink:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  v9 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v2 + 80) + *(_QWORD *)(*(_QWORD *)v2 + 80));
  v6 = swift_task_alloc();
  v7 = (_QWORD *)OUTLINED_FUNCTION_13_2(v6);
  *v7 = v3;
  v7[1] = sub_1C03B1CC8;
  return OUTLINED_FUNCTION_4_4(a1, a2, v9);
}

uint64_t dispatch thunk of FlowSuggestionsDispatcherFactory.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t sub_1C03B1C88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF5FD740;
  if (!qword_1EF5FD740)
  {
    v1 = type metadata accessor for SiriHelpDispatcher();
    result = MEMORY[0x1C3B99EA8](&unk_1C03E5FD0, v1);
    atomic_store(result, (unint64_t *)&qword_1EF5FD740);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_2_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_11_3@<X0>(uint64_t a1@<X8>)
{
  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(a1 - 256));
}

uint64_t OUTLINED_FUNCTION_12_3@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_1C03ABB70(*(__int128 **)(a2 - 256), a1);
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t static Transformer<>.parseToProperties.getter()
{
  return sub_1C03B22C8((void (*)(_QWORD))MEMORY[0x1E0D9C698]);
}

uint64_t sub_1C03B1D78@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  void (*v22)(char *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint8_t *v25;
  void (*v26)(uint64_t *__return_ptr, char *);
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t *__return_ptr, char *);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v55 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD790);
  v52 = *(_QWORD *)(v3 - 8);
  v53 = (uint8_t *)v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C03E31DC();
  v54 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD798);
  v45 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1C03E320C();
  v48 = *(_QWORD *)(v12 - 8);
  v49 = v12;
  MEMORY[0x1E0C80A78](v12);
  v47 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1C03E31E8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v44 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v51 = (char *)&v44 - v19;
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v44 - v20;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v50 = a1;
  v22((char *)&v44 - v20, a1, v14);
  v23 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v21, v14);
  if (v23 == *MEMORY[0x1E0D9C658])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v21, v14);
    v24 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v8, v21, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD748);
    sub_1C03E3320();
    v25 = v53;
    v26 = (void (*)(uint64_t *__return_ptr, char *))sub_1C03E332C();
    (*(void (**)(char *, uint8_t *))(v52 + 8))(v5, v25);
    v27 = v56;
    v26(&v58, v8);
    if (v27)
    {
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, v6);
    }
    swift_release();
    result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, v6);
LABEL_15:
    *v55 = v58;
    return result;
  }
  if (v23 == *MEMORY[0x1E0D9C678])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v21, v14);
    v30 = v47;
    v29 = v48;
    v31 = v49;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v47, v21, v49);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD748);
    sub_1C03E3320();
    v32 = v46;
    v33 = (void (*)(uint64_t *__return_ptr, char *))sub_1C03E332C();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v32);
    v34 = v56;
    v33(&v58, v30);
    if (v34)
    {
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    }
    swift_release();
    result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    goto LABEL_15;
  }
  if (qword_1ED738B60 != -1)
    swift_once();
  v35 = sub_1C03E4028();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED738B68);
  v36 = v51;
  v22(v51, v50, v14);
  v37 = sub_1C03E4010();
  v38 = sub_1C03E41E4();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v58 = v54;
    *(_DWORD *)v39 = 136315138;
    v53 = v39 + 4;
    v22(v44, (uint64_t)v36, v14);
    v40 = sub_1C03E40A0();
    v57 = sub_1C03B934C(v40, v41, &v58);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    v42 = *(void (**)(char *, uint64_t))(v15 + 8);
    v42(v51, v14);
    _os_log_impl(&dword_1C03A5000, v37, v38, "Directly unsupported parse result: %s", v39, 0xCu);
    v43 = v54;
    swift_arrayDestroy();
    MEMORY[0x1C3B99F38](v43, -1, -1);
    MEMORY[0x1C3B99F38](v39, -1, -1);
  }
  else
  {
    v42 = *(void (**)(char *, uint64_t))(v15 + 8);
    v42(v36, v14);
  }

  *v55 = 0;
  return ((uint64_t (*)(char *, uint64_t))v42)(v21, v14);
}

uint64_t static Transformer<>.usoToProperties.getter()
{
  return sub_1C03B22C8((void (*)(_QWORD))MEMORY[0x1E0D9C708]);
}

uint64_t sub_1C03B22C8(void (*a1)(_QWORD))
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD748);
  return sub_1C03E3320();
}

void sub_1C03B2320(uint64_t *a1@<X8>)
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (**v47)(char *, char *, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  os_log_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;
  char v90;
  char *v91;
  void (*v92)(char *, uint64_t);
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  char v98;
  char *v99;
  void (*v100)(unint64_t, char *, uint64_t);
  uint64_t v101;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  int64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  void (*v110)(char *, unint64_t, uint64_t);
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  void (*v126)(char *, unint64_t, uint64_t);
  char *v127;
  char *v128;
  char *v129;
  char v130;
  void (*v131)(char *, uint64_t);
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  char v137;
  void (*v138)(char *, uint64_t);
  void (*v139)(char *, char *, uint64_t);
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  void (*v145)(char *, unint64_t, uint64_t);
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSObject *v155;
  os_log_type_t v156;
  uint8_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  void *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  id v168;
  NSObject *v169;
  os_log_type_t v170;
  uint8_t *v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  void (*v177)(char *, _QWORD, uint64_t);
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char v184;
  char *v185;
  uint64_t v186;
  char v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int EnumTagSinglePayload;
  uint64_t v200;
  int v201;
  char *v202;
  void (*v203)(char *, uint64_t);
  uint64_t inited;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  NSObject *v215;
  os_log_type_t v216;
  uint8_t *v217;
  const char *v218;
  uint8_t *v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  void (*v223)(char *, uint64_t);
  uint64_t v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  char *v232;
  uint64_t v233;
  char *v234;
  uint64_t v235;
  char *v236;
  char *v237;
  uint64_t v238;
  char *v239;
  os_log_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  uint64_t v245;
  uint64_t *v246;
  char *v247;
  char *v248;
  char *v249;
  char *v250;
  char *v251;
  char *v252;
  char *v253;
  char *v254;
  char *v255;
  uint64_t v256;
  char *v257;
  char *v258;
  char *v259;
  uint64_t v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  uint64_t v264;
  __int128 v265;
  uint64_t v266;
  uint64_t v267[4];
  uint64_t v268;
  uint64_t v269;

  v246 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E08);
  MEMORY[0x1E0C80A78](v1);
  v235 = (uint64_t)&v219 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  MEMORY[0x1E0C80A78](v3);
  v233 = (uint64_t)&v219 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD750);
  MEMORY[0x1E0C80A78](v5);
  v234 = (char *)&v219 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v229 = sub_1C03E32E4();
  v231 = *(_QWORD *)(v229 - 8);
  MEMORY[0x1E0C80A78](v229);
  v225 = (char *)&v219 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD758);
  MEMORY[0x1E0C80A78](v227);
  v228 = (uint64_t)&v219 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD760);
  v10 = MEMORY[0x1E0C80A78](v9);
  v226 = (uint64_t)&v219 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v230 = (uint64_t)&v219 - v13;
  MEMORY[0x1E0C80A78](v12);
  v242 = (uint64_t)&v219 - v14;
  v238 = sub_1C03E3C68();
  v243 = *(_QWORD *)(v238 - 8);
  v15 = MEMORY[0x1E0C80A78](v238);
  v232 = (char *)&v219 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v237 = (char *)&v219 - v17;
  v261 = sub_1C03E3FF8();
  v260 = *(_QWORD *)(v261 - 8);
  v18 = MEMORY[0x1E0C80A78](v261);
  v250 = (char *)&v219 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v249 = (char *)&v219 - v21;
  MEMORY[0x1E0C80A78](v20);
  v254 = (char *)&v219 - v22;
  v263 = sub_1C03E329C();
  v264 = *(_QWORD *)(v263 - 8);
  v23 = MEMORY[0x1E0C80A78](v263);
  v251 = (char *)&v219 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v23);
  v247 = (char *)&v219 - v26;
  v27 = MEMORY[0x1E0C80A78](v25);
  v248 = (char *)&v219 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v253 = (char *)&v219 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v258 = (char *)&v219 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v262 = (unint64_t)&v219 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v257 = (char *)&v219 - v36;
  MEMORY[0x1E0C80A78](v35);
  v259 = (char *)&v219 - v37;
  v241 = sub_1C03E326C();
  v240 = *(os_log_t *)(v241 - 8);
  MEMORY[0x1E0C80A78](v241);
  v239 = (char *)&v219 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v245 = sub_1C03E3224();
  v256 = *(_QWORD *)(v245 - 8);
  v39 = MEMORY[0x1E0C80A78](v245);
  v255 = (char *)&v219 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v39);
  v42 = (char *)&v219 - v41;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD768);
  MEMORY[0x1E0C80A78](v43);
  v45 = (char *)&v219 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1C03E3254();
  v47 = *(void (***)(char *, char *, uint64_t))(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v49 = (char *)&v219 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1C03E323C();
  v51 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  v53 = (char *)&v219 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03E3200();
  v54 = sub_1C03E3230();
  v55 = *(void (**)(char *, uint64_t))(v51 + 8);
  v56 = v46;
  v55(v53, v50);
  sub_1C03C71D8(v54, (uint64_t)v45);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46) == 1)
  {
    sub_1C03B579C((uint64_t)v45, &qword_1EF5FD768);
    if (qword_1EF5FCB10 != -1)
      goto LABEL_110;
    goto LABEL_3;
  }
  v47[4](v49, v45, v46);
  v61 = v239;
  sub_1C03E3248();
  sub_1C03E3260();
  ((void (*)(char *, uint64_t))v240[1].isa)(v61, v241);
  v236 = v49;
  v239 = (char *)v47;
  if (qword_1EF5FCB10 != -1)
    swift_once();
  v62 = sub_1C03E4028();
  v63 = __swift_project_value_buffer(v62, (uint64_t)qword_1EF5FD918);
  v64 = v256;
  v65 = v255;
  v66 = v245;
  (*(void (**)(char *, char *, uint64_t))(v256 + 16))(v255, v42, v245);
  v241 = v63;
  v67 = sub_1C03E4010();
  v68 = sub_1C03E41F0();
  v240 = v67;
  v221 = v68;
  v69 = os_log_type_enabled(v67, v68);
  v70 = v263;
  v224 = v56;
  v222 = v62;
  if (v69)
  {
    v71 = (uint8_t *)swift_slowAlloc();
    v220 = swift_slowAlloc();
    v267[0] = v220;
    v219 = v71;
    *(_DWORD *)v71 = 136315138;
    v223 = (void (*)(char *, uint64_t))(v71 + 4);
    sub_1C03E3218();
    v72 = v66;
    v73 = MEMORY[0x1C3B99770]();
    v75 = v74;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v265 = sub_1C03B934C(v73, v75, v267);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    v223 = *(void (**)(char *, uint64_t))(v64 + 8);
    v223(v65, v72);
    v76 = v240;
    v77 = v219;
    _os_log_impl(&dword_1C03A5000, v240, (os_log_type_t)v221, "Got identifiers: %s", v219, 0xCu);
    v78 = v220;
    swift_arrayDestroy();
    MEMORY[0x1C3B99F38](v78, -1, -1);
    MEMORY[0x1C3B99F38](v77, -1, -1);

  }
  else
  {
    v223 = *(void (**)(char *, uint64_t))(v64 + 8);
    v223(v65, v66);

  }
  v252 = v42;
  v79 = sub_1C03E3218();
  v80 = (char *)v79;
  v81 = MEMORY[0x1E0DEE9D8];
  v267[0] = MEMORY[0x1E0DEE9D8];
  v82 = v259;
  v256 = *(_QWORD *)(v79 + 16);
  if (!v256)
  {
    v105 = MEMORY[0x1E0DEE9D8];
    v84 = v264;
LABEL_36:
    swift_bridgeObjectRelease();
    v106 = *(_QWORD *)(v105 + 16);
    if (v106)
    {
      v267[0] = v81;
      sub_1C03CDE40(0, v106, 0);
      v107 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
      v262 = v105;
      v108 = v105 + v107;
      v109 = *(_QWORD *)(v84 + 72);
      v110 = *(void (**)(char *, unint64_t, uint64_t))(v84 + 16);
      do
      {
        v111 = v258;
        v112 = v263;
        v110(v258, v108, v263);
        v113 = sub_1C03E3284();
        v115 = v114;
        (*(void (**)(char *, uint64_t))(v264 + 8))(v111, v112);
        v81 = v267[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C03CDE40(0, *(_QWORD *)(v81 + 16) + 1, 1);
          v81 = v267[0];
        }
        v117 = *(_QWORD *)(v81 + 16);
        v116 = *(_QWORD *)(v81 + 24);
        if (v117 >= v116 >> 1)
        {
          sub_1C03CDE40((char *)(v116 > 1), v117 + 1, 1);
          v81 = v267[0];
        }
        *(_QWORD *)(v81 + 16) = v117 + 1;
        v118 = v81 + 16 * v117;
        *(_QWORD *)(v118 + 32) = v113;
        *(_QWORD *)(v118 + 40) = v115;
        v108 += v109;
        --v106;
      }
      while (v106);
      swift_release();
      v84 = v264;
    }
    else
    {
      swift_release();
    }
    v269 = v81;
    v119 = v252;
    v120 = v263;
    if (!*(_QWORD *)(v81 + 16))
    {
      v121 = sub_1C03E3218();
      v122 = MEMORY[0x1E0DEE9D8];
      v268 = MEMORY[0x1E0DEE9D8];
      v258 = *(char **)(v121 + 16);
      if (v258)
      {
        v123 = 0;
        v257 = (char *)v121;
        while (1)
        {
          if ((unint64_t)v123 >= *(_QWORD *)(v121 + 16))
            goto LABEL_109;
          v124 = v120;
          v125 = *(char **)(v84 + 72);
          v262 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
          v259 = v125;
          v126 = *(void (**)(char *, unint64_t, uint64_t))(v84 + 16);
          v127 = v253;
          v126(v253, v121 + v262 + (_QWORD)v125 * (_QWORD)v123, v124);
          v128 = v249;
          sub_1C03E3290();
          v129 = v250;
          sub_1C03E3FD4();
          v130 = sub_1C03E3FE0();
          v131 = *(void (**)(char *, uint64_t))(v260 + 8);
          v132 = v129;
          v133 = v261;
          v131(v132, v261);
          v134 = v128;
          v135 = v248;
          v131(v134, v133);
          v126(v135, (unint64_t)v127, v124);
          if ((v130 & 1) != 0)
          {
            v267[0] = sub_1C03E3284();
            v267[1] = v136;
            *(_QWORD *)&v265 = 46;
            *((_QWORD *)&v265 + 1) = 0xE100000000000000;
            sub_1C03ABA60();
            v137 = sub_1C03E4268();
            swift_bridgeObjectRelease();
            v138 = *(void (**)(char *, uint64_t))(v84 + 8);
            v138(v135, v124);
            if ((v137 & 1) != 0)
            {
              v139 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
              v139(v247, v253, v124);
              v140 = v268;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_1C03CDE5C();
                v140 = v268;
              }
              v141 = *(_QWORD *)(v140 + 16);
              if (v141 >= *(_QWORD *)(v140 + 24) >> 1)
              {
                sub_1C03CDE5C();
                v140 = v268;
              }
              *(_QWORD *)(v140 + 16) = v141 + 1;
              v142 = v140 + v262 + v141 * (_QWORD)v259;
              v120 = v263;
              v139((char *)v142, v247, v263);
              v268 = v140;
              v84 = v264;
              goto LABEL_58;
            }
          }
          else
          {
            v138 = *(void (**)(char *, uint64_t))(v84 + 8);
            v138(v135, v124);
          }
          v138(v253, v124);
          v120 = v124;
LABEL_58:
          ++v123;
          v121 = (uint64_t)v257;
          if (v258 == v123)
          {
            v122 = v268;
            break;
          }
        }
      }
      swift_bridgeObjectRelease();
      v143 = *(_QWORD *)(v122 + 16);
      v119 = v252;
      if (v143)
      {
        v144 = v122 + ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80));
        v262 = *(_QWORD *)(v84 + 72);
        v145 = *(void (**)(char *, unint64_t, uint64_t))(v84 + 16);
        v261 = v122;
        swift_retain();
        v146 = MEMORY[0x1E0DEE9D8];
        do
        {
          v147 = v251;
          v145(v251, v144, v120);
          v148 = sub_1C03E3284();
          v150 = v149;
          (*(void (**)(char *, uint64_t))(v84 + 8))(v147, v120);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1C03B8874();
            v146 = v153;
          }
          v151 = *(_QWORD *)(v146 + 16);
          if (v151 >= *(_QWORD *)(v146 + 24) >> 1)
          {
            sub_1C03B8874();
            v146 = v154;
          }
          *(_QWORD *)(v146 + 16) = v151 + 1;
          v152 = v146 + 16 * v151;
          *(_QWORD *)(v152 + 32) = v148;
          *(_QWORD *)(v152 + 40) = v150;
          v144 += v262;
          --v143;
          v119 = v252;
          v120 = v263;
          v84 = v264;
        }
        while (v143);
        swift_release_n();
      }
      else
      {
        swift_release();
        v146 = MEMORY[0x1E0DEE9D8];
      }
      swift_bridgeObjectRelease();
      v269 = v146;
    }
    v155 = sub_1C03E4010();
    v156 = sub_1C03E41F0();
    if (os_log_type_enabled(v155, v156))
    {
      v157 = (uint8_t *)swift_slowAlloc();
      v158 = swift_slowAlloc();
      v267[0] = v158;
      *(_DWORD *)v157 = 136315138;
      swift_beginAccess();
      v159 = swift_bridgeObjectRetain();
      v160 = MEMORY[0x1C3B99770](v159, MEMORY[0x1E0DEA968]);
      v162 = v161;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v265 = sub_1C03B934C(v160, v162, v267);
      v119 = v252;
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C03A5000, v155, v156, "Found mentioned app ids: %s", v157, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B99F38](v158, -1, -1);
      MEMORY[0x1C3B99F38](v157, -1, -1);
    }

    v163 = v244;
    v164 = v236;
    v165 = v242;
    v166 = sub_1C03E32A8();
    if (v163)
    {
      if (qword_1ED738B60 != -1)
        swift_once();
      __swift_project_value_buffer(v222, (uint64_t)qword_1ED738B68);
      v167 = v163;
      v168 = v163;
      v169 = sub_1C03E4010();
      v170 = sub_1C03E41FC();
      if (os_log_type_enabled(v169, v170))
      {
        v171 = (uint8_t *)swift_slowAlloc();
        v172 = swift_slowAlloc();
        v267[0] = v172;
        *(_DWORD *)v171 = 136315138;
        *(_QWORD *)&v265 = v163;
        v173 = v163;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
        v174 = sub_1C03E40A0();
        *(_QWORD *)&v265 = sub_1C03B934C(v174, v175, v267);
        sub_1C03E4238();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1C03A5000, v169, v170, "Could not convert user dialog act to tasks: %s. Cant be a direct flow request", v171, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3B99F38](v172, -1, -1);
        MEMORY[0x1C3B99F38](v171, -1, -1);

        v223(v252, v245);
        (*((void (**)(char *, uint64_t))v239 + 1))(v236, v224);
      }
      else
      {

        v223(v119, v245);
        (*((void (**)(char *, uint64_t))v239 + 1))(v164, v224);
      }
      swift_bridgeObjectRelease();
      goto LABEL_125;
    }
    v176 = v166;
    v177 = *(void (**)(char *, _QWORD, uint64_t))(v243 + 104);
    v177(v237, *MEMORY[0x1E0DA6198], v238);
    if (v176 >> 62)
    {
      swift_bridgeObjectRetain();
      v178 = sub_1C03E4340();
      if (v178)
      {
LABEL_79:
        sub_1C03CDAFC(0, (v176 & 0xC000000000000001) == 0, v176);
        if ((v176 & 0xC000000000000001) != 0)
          MEMORY[0x1C3B998FC](0, v176);
        else
          swift_retain();
        swift_bridgeObjectRelease();
        v179 = sub_1C03E32FC();
        v181 = v180;
        sub_1C03E3368();
        if (v179 == sub_1C03E335C() && v181 == v182)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v184 = sub_1C03E43F4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v184 & 1) == 0)
          {
LABEL_91:
            swift_retain();
            sub_1C03E32C0();
            swift_release();
            if (v267[3])
            {
              sub_1C03E32F0();
              v187 = swift_dynamicCast();
              v188 = v236;
              if ((v187 & 1) == 0)
              {
                swift_release();
                v119 = v252;
                goto LABEL_114;
              }
              v189 = v265;
              swift_retain();
              sub_1C03E32CC();
              v263 = v189;
              swift_release();
              v264 = v178;
              if (v267[0] && (v190 = sub_1C03E32B4(), swift_release(), v190))
              {
                sub_1C03E32D8();
                swift_release();
                v191 = v229;
              }
              else
              {
                v191 = v229;
                __swift_storeEnumTagSinglePayload(v165, 1, 1, v229);
              }
              v194 = v165;
              v195 = v230;
              (*(void (**)(uint64_t, _QWORD, uint64_t))(v231 + 104))(v230, *MEMORY[0x1E0DA16B8], v191);
              __swift_storeEnumTagSinglePayload(v195, 0, 1, v191);
              v196 = v228;
              v197 = v228 + *(int *)(v227 + 48);
              sub_1C03B575C(v194, v228, &qword_1EF5FD760);
              v198 = v196;
              sub_1C03B575C(v195, v197, &qword_1EF5FD760);
              if (__swift_getEnumTagSinglePayload(v196, 1, v191) == 1)
              {
                swift_release();
                swift_release();
                sub_1C03B579C(v195, &qword_1EF5FD760);
                sub_1C03B579C(v194, &qword_1EF5FD760);
                EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v197, 1, v191);
                v178 = v264;
                if (EnumTagSinglePayload == 1)
                {
                  sub_1C03B579C(v196, &qword_1EF5FD760);
LABEL_106:
                  v119 = v252;
LABEL_113:
                  v188 = v236;
LABEL_114:
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD778);
                  inited = swift_initStackObject();
                  *(_OWORD *)(inited + 16) = xmmword_1C03E56C0;
                  *(_QWORD *)(inited + 32) = sub_1C03E3DDC();
                  *(_QWORD *)(inited + 40) = v205;
                  swift_beginAccess();
                  *(_QWORD *)(inited + 48) = v269;
                  swift_bridgeObjectRetain();
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738338);
                  v206 = sub_1C03E404C();
                  if (v178)
                  {
                    sub_1C03CDAFC(0, (v176 & 0xC000000000000001) == 0, v176);
                    if ((v176 & 0xC000000000000001) != 0)
                      MEMORY[0x1C3B998FC](0, v176);
                    else
                      swift_retain();
                    swift_bridgeObjectRelease();
                    sub_1C03E32FC();
                    swift_release();
                    sub_1C03E3374();
                    if (v266)
                    {
                      sub_1C03ABB70(&v265, (uint64_t)v267);
                      sub_1C03BAD0C(v206);
                      v264 = v207;
                      swift_bridgeObjectRelease();
                      sub_1C03AE6B0((uint64_t)v267, (uint64_t)&v265);
                      v208 = v237;
                      v209 = v238;
                      (*(void (**)(char *, char *, uint64_t))(v243 + 16))(v232, v237, v238);
                      v210 = sub_1C03E302C();
                      __swift_storeEnumTagSinglePayload(v233, 1, 1, v210);
                      v211 = (uint64_t)v234;
                      sub_1C03E38D8();
                      v212 = sub_1C03E3914();
                      __swift_storeEnumTagSinglePayload(v211, 0, 1, v212);
                      v213 = sub_1C03E3AD0();
                      __swift_storeEnumTagSinglePayload(v235, 1, 1, v213);
                      sub_1C03E38B4();
                      swift_allocObject();
                      v214 = sub_1C03E3878();
                      __swift_destroy_boxed_opaque_existential_1((uint64_t)v267);
                      (*(void (**)(char *, uint64_t))(v243 + 8))(v208, v209);
                      v223(v119, v245);
                      (*((void (**)(char *, uint64_t))v239 + 1))(v236, v224);
                      swift_bridgeObjectRelease();
                      *v246 = v214;
                      return;
                    }
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    sub_1C03B579C((uint64_t)&v265, &qword_1EF5FD780);
                    v215 = sub_1C03E4010();
                    v216 = sub_1C03E41E4();
                    if (os_log_type_enabled(v215, v216))
                    {
                      v217 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)v217 = 0;
                      v218 = "This is not a verb SiriSuggestions directly supports";
                      goto LABEL_123;
                    }
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    v215 = sub_1C03E4010();
                    v216 = sub_1C03E41E4();
                    if (os_log_type_enabled(v215, v216))
                    {
                      v217 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)v217 = 0;
                      v218 = "No verb attached to parse. Cant be a direct flow request";
LABEL_123:
                      _os_log_impl(&dword_1C03A5000, v215, v216, v218, v217, 2u);
                      MEMORY[0x1C3B99F38](v217, -1, -1);
                    }
                  }

                  (*(void (**)(char *, uint64_t))(v243 + 8))(v237, v238);
                  v223(v119, v245);
                  (*((void (**)(char *, uint64_t))v239 + 1))(v188, v224);
                  swift_bridgeObjectRelease();
                  goto LABEL_125;
                }
              }
              else
              {
                v200 = v226;
                sub_1C03B575C(v196, v226, &qword_1EF5FD760);
                v201 = __swift_getEnumTagSinglePayload(v197, 1, v191);
                v178 = v264;
                if (v201 != 1)
                {
                  v202 = v225;
                  (*(void (**)(char *, uint64_t, uint64_t))(v231 + 32))(v225, v197, v191);
                  sub_1C03A858C(&qword_1EF5FD788, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA16D0], MEMORY[0x1E0DA16E0]);
                  sub_1C03E407C();
                  swift_release();
                  swift_release();
                  v203 = *(void (**)(char *, uint64_t))(v231 + 8);
                  v203(v202, v191);
                  sub_1C03B579C(v230, &qword_1EF5FD760);
                  sub_1C03B579C(v242, &qword_1EF5FD760);
                  v203((char *)v200, v191);
                  sub_1C03B579C(v198, &qword_1EF5FD760);
                  goto LABEL_106;
                }
                swift_release();
                swift_release();
                sub_1C03B579C(v230, &qword_1EF5FD760);
                sub_1C03B579C(v242, &qword_1EF5FD760);
                (*(void (**)(uint64_t, uint64_t))(v231 + 8))(v200, v191);
              }
              v192 = &qword_1EF5FD758;
              v193 = (uint64_t *)v196;
            }
            else
            {
              swift_release();
              v192 = qword_1ED737E30;
              v193 = v267;
            }
            sub_1C03B579C((uint64_t)v193, v192);
            goto LABEL_106;
          }
        }
        v185 = v237;
        v186 = v238;
        (*(void (**)(char *, uint64_t))(v243 + 8))(v237, v238);
        v177(v185, *MEMORY[0x1E0DA61A0], v186);
        goto LABEL_91;
      }
    }
    else
    {
      v178 = *(_QWORD *)((v176 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v178)
        goto LABEL_79;
    }
    swift_bridgeObjectRelease();
    goto LABEL_113;
  }
  v83 = 0;
  v84 = v264;
  v255 = (char *)v79;
  while (v83 < *((_QWORD *)v80 + 2))
  {
    v85 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    v86 = *(_QWORD *)(v84 + 72);
    v87 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
    v87(v82, &v80[v85 + v86 * v83], v70);
    if (sub_1C03E3278() == 0x746163696C707041 && v88 == 0xEC000000736E6F69)
    {
      swift_bridgeObjectRelease();
      v91 = v257;
      v87(v257, v82, v70);
    }
    else
    {
      v90 = sub_1C03E43F4();
      swift_bridgeObjectRelease();
      v91 = v257;
      v87(v257, v82, v70);
      if ((v90 & 1) == 0)
      {
        v84 = v264;
        v92 = *(void (**)(char *, uint64_t))(v264 + 8);
        v92(v91, v70);
        goto LABEL_26;
      }
    }
    v93 = v254;
    sub_1C03E3290();
    v94 = sub_1C03E3FEC();
    v96 = v95;
    (*(void (**)(char *, uint64_t))(v260 + 8))(v93, v261);
    v97 = v94 == 0x64695F6D657469 && v96 == 0xE700000000000000;
    v84 = v264;
    if (v97)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v91, v70);
LABEL_28:
      v100 = *(void (**)(unint64_t, char *, uint64_t))(v84 + 32);
      v82 = v259;
      v100(v262, v259, v70);
      v101 = v267[0];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v80 = v255;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C03CDE5C();
        v101 = v267[0];
      }
      v103 = *(_QWORD *)(v101 + 16);
      if (v103 >= *(_QWORD *)(v101 + 24) >> 1)
      {
        sub_1C03CDE5C();
        v101 = v267[0];
      }
      *(_QWORD *)(v101 + 16) = v103 + 1;
      v104 = v101 + v85 + v103 * v86;
      v70 = v263;
      v100(v104, (char *)v262, v263);
      v267[0] = v101;
      v84 = v264;
      goto LABEL_33;
    }
    v98 = sub_1C03E43F4();
    swift_bridgeObjectRelease();
    v92 = *(void (**)(char *, uint64_t))(v84 + 8);
    v92(v91, v70);
    if ((v98 & 1) != 0)
      goto LABEL_28;
LABEL_26:
    v99 = v259;
    v92(v259, v70);
    v82 = v99;
    v80 = v255;
LABEL_33:
    if (v256 == ++v83)
    {
      v105 = v267[0];
      v81 = MEMORY[0x1E0DEE9D8];
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_109:
  __break(1u);
LABEL_110:
  swift_once();
LABEL_3:
  v57 = sub_1C03E4028();
  __swift_project_value_buffer(v57, (uint64_t)qword_1EF5FD918);
  v58 = sub_1C03E4010();
  v59 = sub_1C03E41E4();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v60 = 0;
    _os_log_impl(&dword_1C03A5000, v58, v59, "No user dialog acts attached to parse. Cant be a direct flow request", v60, 2u);
    MEMORY[0x1C3B99F38](v60, -1, -1);
  }

LABEL_125:
  *v246 = 0;
}

void sub_1C03B410C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void *object;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint8_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  os_log_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int EnumTagSinglePayload;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  os_log_t v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t countAndFlagsBits;
  void *v152;
  Swift::String v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;

  countAndFlagsBits = sub_1C03E4028();
  v143 = *(_QWORD *)(countAndFlagsBits - 8);
  MEMORY[0x1E0C80A78](countAndFlagsBits);
  v147 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  MEMORY[0x1E0C80A78](v5);
  v136 = (uint64_t)&v128 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD7A0);
  MEMORY[0x1E0C80A78](v7);
  v139 = (uint64_t)&v128 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_1C03E3C68();
  v138 = *(_QWORD *)(v140 - 8);
  v9 = MEMORY[0x1E0C80A78](v140);
  v135 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v137 = (char *)&v128 - v11;
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E08);
  v12 = MEMORY[0x1E0C80A78](v141);
  v145 = (uint64_t)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v148 = (uint64_t)&v128 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v146 = (char *)&v128 - v17;
  MEMORY[0x1E0C80A78](v16);
  v149 = (char *)&v128 - v18;
  v19 = sub_1C03E31DC();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v128 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD750);
  v24 = MEMORY[0x1E0C80A78](v23);
  v142 = (uint64_t)&v128 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v24);
  v144 = (uint64_t)&v128 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v150 = (uint64_t)&v128 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v32 = (char *)&v128 - v31;
  MEMORY[0x1E0C80A78](v30);
  v157 = (uint64_t)&v128 - v33;
  if (sub_1C03E31C4() == 0xD00000000000002FLL && v34 == 0x80000001C03E6DD0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = sub_1C03E43F4();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
    {
      if (qword_1EF5FCB10 != -1)
        swift_once();
      __swift_project_value_buffer(countAndFlagsBits, (uint64_t)qword_1EF5FD918);
      v53 = sub_1C03E4010();
      v54 = sub_1C03E41E4();
      if (os_log_type_enabled(v53, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_1C03A5000, v53, v54, "direct invocation is not of a known id", v55, 2u);
        MEMORY[0x1C3B99F38](v55, -1, -1);
      }

      goto LABEL_33;
    }
  }
  v36 = sub_1C03E31D0();
  if (!v36)
  {
    v154 = 0u;
    v155 = 0u;
    v37 = v157;
    goto LABEL_11;
  }
  sub_1C03C52AC(0xD000000000000013, 0x80000001C03E6640, v36, &v154);
  swift_bridgeObjectRelease();
  v37 = v157;
  if (!*((_QWORD *)&v155 + 1))
  {
LABEL_11:
    sub_1C03B579C((uint64_t)&v154, qword_1ED737E30);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v41 = sub_1C03E3914();
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v41);
    goto LABEL_13;
  }
  object = v153._object;
  v133 = sub_1C03E2FCC();
  if (v39 >> 60 == 15)
  {
    v40 = sub_1C03E3914();
    v37 = v157;
    __swift_storeEnumTagSinglePayload(v157, 1, 1, v40);
    swift_bridgeObjectRelease();
  }
  else
  {
    v57 = v39;
    v132 = (uint64_t)object;
    v134 = a2;
    sub_1C03E2F30();
    swift_allocObject();
    sub_1C03E2F24();
    v58 = sub_1C03E3914();
    sub_1C03A858C(&qword_1EF5FD7C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA55B8], MEMORY[0x1E0DA55D0]);
    v59 = v152;
    sub_1C03E2F18();
    if (v59)
    {

      swift_release();
      sub_1C03B57D4(v133, v57);
      v37 = v157;
      __swift_storeEnumTagSinglePayload(v157, 1, 1, v58);
      swift_bridgeObjectRelease();
      v152 = 0;
    }
    else
    {
      v152 = 0;
      swift_release();
      sub_1C03B57D4(v133, v57);
      v37 = v157;
      __swift_storeEnumTagSinglePayload(v157, 0, 1, v58);
      swift_bridgeObjectRelease();
    }
    a2 = v134;
  }
LABEL_13:
  v42 = sub_1C03E31D0();
  if (v42)
  {
    sub_1C03C52AC(0x6E6F69746361, 0xE600000000000000, v42, &v154);
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v155 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v134 = a2;
        v43 = v153;
        swift_bridgeObjectRetain();
        DirectInvocationAction.init(rawValue:)(v43);
        if (v154 == 4)
        {
          v44 = countAndFlagsBits;
          if (qword_1EF5FCB10 != -1)
            swift_once();
          __swift_project_value_buffer(v44, (uint64_t)qword_1EF5FD918);
          swift_bridgeObjectRetain();
          v45 = sub_1C03E4010();
          v46 = sub_1C03E41E4();
          if (os_log_type_enabled(v45, v46))
          {
            v47 = (uint8_t *)swift_slowAlloc();
            v48 = swift_slowAlloc();
            *(_QWORD *)&v154 = v48;
            *(_DWORD *)v47 = 136315138;
            swift_bridgeObjectRetain();
            v153._countAndFlagsBits = sub_1C03B934C(v43._countAndFlagsBits, (unint64_t)v43._object, (uint64_t *)&v154);
            sub_1C03E4238();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C03A5000, v45, v46, "direct invocation is not set with a valid action field. Set with %s", v47, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C3B99F38](v48, -1, -1);
            MEMORY[0x1C3B99F38](v47, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          goto LABEL_70;
        }
        LODWORD(v133) = v154;
        swift_bridgeObjectRelease();
        v60 = countAndFlagsBits;
        if (qword_1EF5FCB10 != -1)
          swift_once();
        v61 = __swift_project_value_buffer(v60, (uint64_t)qword_1EF5FD918);
        v62 = v157;
        sub_1C03B575C(v157, (uint64_t)v32, &qword_1EF5FD750);
        (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, a1, v19);
        v132 = v61;
        v63 = sub_1C03E4010();
        v64 = sub_1C03E41F0();
        v131 = v64;
        if (os_log_type_enabled(v63, v64))
        {
          v65 = swift_slowAlloc();
          v130 = swift_slowAlloc();
          *(_QWORD *)&v154 = v130;
          *(_DWORD *)v65 = 136315650;
          v129 = v63;
          sub_1C03B575C((uint64_t)v32, v150, &qword_1EF5FD750);
          v66 = sub_1C03E40A0();
          v153._countAndFlagsBits = sub_1C03B934C(v66, v67, (uint64_t *)&v154);
          sub_1C03E4238();
          swift_bridgeObjectRelease();
          sub_1C03B579C((uint64_t)v32, &qword_1EF5FD750);
          *(_WORD *)(v65 + 12) = 2080;
          v68 = v133;
          LOBYTE(v153._countAndFlagsBits) = v133;
          v69 = sub_1C03E40A0();
          v153._countAndFlagsBits = sub_1C03B934C(v69, v70, (uint64_t *)&v154);
          sub_1C03E4238();
          swift_bridgeObjectRelease();
          *(_WORD *)(v65 + 22) = 2080;
          v153._countAndFlagsBits = sub_1C03E31D0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD7B8);
          v71 = sub_1C03E40A0();
          v153._countAndFlagsBits = sub_1C03B934C(v71, v72, (uint64_t *)&v154);
          sub_1C03E4238();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
          v73 = v129;
          _os_log_impl(&dword_1C03A5000, v129, (os_log_type_t)v131, "Got direct invocation properties: presentationContext: %s, action: %s, userData: %s", (uint8_t *)v65, 0x20u);
          v74 = v130;
          swift_arrayDestroy();
          MEMORY[0x1C3B99F38](v74, -1, -1);
          v75 = v65;
          v62 = v157;
          MEMORY[0x1C3B99F38](v75, -1, -1);

        }
        else
        {
          sub_1C03B579C((uint64_t)v32, &qword_1EF5FD750);
          (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);

          v68 = v133;
        }
        v76 = (uint64_t)v149;
        if (v68 != 1)
        {
          if (v68 != 2)
          {
            v97 = v143;
            v98 = v147;
            v99 = countAndFlagsBits;
            (*(void (**)(char *, uint64_t, uint64_t))(v143 + 16))(v147, v132, countAndFlagsBits);
            v100 = sub_1C03E4010();
            v101 = sub_1C03E41E4();
            if (os_log_type_enabled(v100, v101))
            {
              v102 = (uint8_t *)swift_slowAlloc();
              v103 = swift_slowAlloc();
              *(_QWORD *)&v154 = v103;
              *(_DWORD *)v102 = 136315138;
              if ((_DWORD)v133)
                v104 = 0xD00000000000001ALL;
              else
                v104 = 0xD000000000000011;
              if ((_DWORD)v133)
                v105 = 0x80000001C03E6610;
              else
                v105 = 0x80000001C03E65D0;
              v153._countAndFlagsBits = sub_1C03B934C(v104, v105, (uint64_t *)&v154);
              sub_1C03E4238();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1C03A5000, v100, v101, "Unknown direct invocation action: %s", v102, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1C3B99F38](v103, -1, -1);
              MEMORY[0x1C3B99F38](v102, -1, -1);

              (*(void (**)(char *, uint64_t))(v97 + 8))(v147, v99);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v97 + 8))(v98, v99);
            }
LABEL_70:
            sub_1C03B579C(v157, &qword_1EF5FD750);
            v56 = 0;
LABEL_86:
            a2 = v134;
            goto LABEL_34;
          }
          v77 = sub_1C03E31D0();
          if (v77)
          {
            sub_1C03C52AC(0xD000000000000016, 0x80000001C03E6660, v77, &v154);
            swift_bridgeObjectRelease();
            v78 = (uint64_t)v146;
            if (*((_QWORD *)&v155 + 1))
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v79 = sub_1C03E2FCC();
                if (v80 >> 60 == 15)
                {
                  v81 = sub_1C03E3AD0();
                  v82 = v76;
                  v83 = 1;
                }
                else
                {
                  v124 = v79;
                  v125 = v80;
                  sub_1C03E2F30();
                  swift_allocObject();
                  sub_1C03E2F24();
                  v126 = sub_1C03E3AD0();
                  sub_1C03A858C(&qword_1EF5FD118, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57C0]);
                  v127 = v152;
                  sub_1C03E2F18();
                  if (v127)
                  {

                    swift_release();
                    sub_1C03B57D4(v124, v125);
                    __swift_storeEnumTagSinglePayload(v76, 1, 1, v126);
                    swift_bridgeObjectRelease();
                    v152 = 0;
LABEL_94:
                    v78 = (uint64_t)v146;
                    goto LABEL_74;
                  }
                  v152 = 0;
                  swift_release();
                  sub_1C03B57D4(v124, v125);
                  v82 = v76;
                  v83 = 0;
                  v81 = v126;
                }
                __swift_storeEnumTagSinglePayload(v82, v83, 1, v81);
                swift_bridgeObjectRelease();
                goto LABEL_94;
              }
LABEL_73:
              v106 = sub_1C03E3AD0();
              __swift_storeEnumTagSinglePayload(v76, 1, 1, v106);
LABEL_74:
              sub_1C03B575C(v76, v78, &qword_1ED737E08);
              v107 = sub_1C03E4010();
              v108 = sub_1C03E41F0();
              if (os_log_type_enabled(v107, v108))
              {
                v109 = (uint8_t *)swift_slowAlloc();
                v110 = swift_slowAlloc();
                *(_QWORD *)&v154 = v110;
                *(_DWORD *)v109 = 136315138;
                sub_1C03B575C(v78, v148, &qword_1ED737E08);
                v111 = sub_1C03E40A0();
                v153._countAndFlagsBits = sub_1C03B934C(v111, v112, (uint64_t *)&v154);
                sub_1C03E4238();
                v76 = (uint64_t)v149;
                swift_bridgeObjectRelease();
                sub_1C03B579C(v78, &qword_1ED737E08);
                _os_log_impl(&dword_1C03A5000, v107, v108, "Got direct invocation properties: preComputedSuggestions: %s", v109, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x1C3B99F38](v110, -1, -1);
                MEMORY[0x1C3B99F38](v109, -1, -1);
              }
              else
              {
                sub_1C03B579C(v78, &qword_1ED737E08);
              }

              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
              countAndFlagsBits = sub_1C03E404C();
              sub_1C03E3368();
              sub_1C03E335C();
              v113 = v145;
              sub_1C03B575C(v76, v145, &qword_1ED737E08);
              v114 = sub_1C03E3AD0();
              if (__swift_getEnumTagSinglePayload(v113, 1, v114) == 1)
              {
                sub_1C03B579C(v113, &qword_1ED737E08);
                v115 = sub_1C03E3F5C();
                *((_QWORD *)&v155 + 1) = sub_1C03E3BC0();
                sub_1C03A858C(&qword_1EF5FD7B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5F30], MEMORY[0x1E0DA5F28]);
                v156 = v116;
                *(_QWORD *)&v154 = v115;
              }
              else
              {
                sub_1C03E3A94();
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v114 - 8) + 8))(v113, v114);
                sub_1C03ABB70((__int128 *)&v153._countAndFlagsBits, (uint64_t)&v154);
              }
              v117 = v157;
              sub_1C03B575C(v157, v150, &qword_1EF5FD750);
              sub_1C03B575C(v76, v148, &qword_1ED737E08);
              sub_1C03E38B4();
              swift_allocObject();
              v56 = sub_1C03E3878();
              sub_1C03B579C(v76, &qword_1ED737E08);
              v118 = v117;
              goto LABEL_85;
            }
          }
          else
          {
            v154 = 0u;
            v155 = 0u;
            v78 = (uint64_t)v146;
          }
          sub_1C03B579C((uint64_t)&v154, qword_1ED737E30);
          goto LABEL_73;
        }
        v84 = v144;
        sub_1C03B575C(v62, v144, &qword_1EF5FD750);
        v85 = v142;
        sub_1C03B575C(v84, v142, &qword_1EF5FD750);
        v86 = sub_1C03E3914();
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v85, 1, v86);
        sub_1C03B579C(v85, &qword_1EF5FD750);
        if (EnumTagSinglePayload != 1)
        {
LABEL_84:
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
          sub_1C03E404C();
          sub_1C03E3368();
          sub_1C03E335C();
          v119 = sub_1C03E395C();
          v120 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5A48];
          v121 = sub_1C03E3950();
          *((_QWORD *)&v155 + 1) = v119;
          sub_1C03A858C(&qword_1EF5FD7A8, v120, MEMORY[0x1E0DA5A40]);
          v156 = v122;
          *(_QWORD *)&v154 = v121;
          sub_1C03B575C(v84, v150, &qword_1EF5FD750);
          v123 = sub_1C03E3AD0();
          __swift_storeEnumTagSinglePayload(v148, 1, 1, v123);
          sub_1C03E38B4();
          swift_allocObject();
          v56 = sub_1C03E3878();
          sub_1C03B579C(v84, &qword_1EF5FD750);
          v118 = v157;
LABEL_85:
          sub_1C03B579C(v118, &qword_1EF5FD750);
          goto LABEL_86;
        }
        v88 = sub_1C03E31D0();
        if (v88)
        {
          sub_1C03C52AC(0x697461636F766E69, 0xEE00657079546E6FLL, v88, &v154);
          swift_bridgeObjectRelease();
          v89 = v140;
          if (*((_QWORD *)&v155 + 1))
          {
            v90 = v139;
            v91 = swift_dynamicCast();
            __swift_storeEnumTagSinglePayload(v90, v91 ^ 1u, 1, v89);
            if (__swift_getEnumTagSinglePayload(v90, 1, v89) != 1)
            {
              v92 = v138;
              v93 = v137;
              (*(void (**)(char *, uint64_t, uint64_t))(v138 + 32))(v137, v90, v89);
              v94 = sub_1C03E31D0();
              if (v94)
              {
                sub_1C03C52AC(0x6F43676F6C616964, 0xEF6449747865746ELL, v94, &v154);
                swift_bridgeObjectRelease();
                if (*((_QWORD *)&v155 + 1))
                {
                  if ((swift_dynamicCast() & 1) != 0)
                  {
                    countAndFlagsBits = v153._countAndFlagsBits;
                    (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v135, v93, v89);
                    v95 = sub_1C03E302C();
                    __swift_storeEnumTagSinglePayload(v136, 1, 1, v95);
                    v96 = v150;
                    sub_1C03E38D8();
                    (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v89);
                    sub_1C03B579C(v84, &qword_1EF5FD750);
                    __swift_storeEnumTagSinglePayload(v96, 0, 1, v86);
                    sub_1C03B5714(v96, v84);
                    goto LABEL_84;
                  }
LABEL_91:
                  (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v89);
                  goto LABEL_84;
                }
              }
              else
              {
                v154 = 0u;
                v155 = 0u;
              }
              sub_1C03B579C((uint64_t)&v154, qword_1ED737E30);
              goto LABEL_91;
            }
LABEL_83:
            sub_1C03B579C(v90, &qword_1EF5FD7A0);
            goto LABEL_84;
          }
        }
        else
        {
          v154 = 0u;
          v155 = 0u;
          v89 = v140;
        }
        sub_1C03B579C((uint64_t)&v154, qword_1ED737E30);
        v90 = v139;
        __swift_storeEnumTagSinglePayload(v139, 1, 1, v89);
        goto LABEL_83;
      }
      goto LABEL_23;
    }
  }
  else
  {
    v154 = 0u;
    v155 = 0u;
  }
  sub_1C03B579C((uint64_t)&v154, qword_1ED737E30);
LABEL_23:
  if (qword_1EF5FCB10 != -1)
    swift_once();
  __swift_project_value_buffer(countAndFlagsBits, (uint64_t)qword_1EF5FD918);
  v49 = sub_1C03E4010();
  v50 = sub_1C03E41E4();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v51 = 0;
    _os_log_impl(&dword_1C03A5000, v49, v50, "direct invocation is not set with an action field", v51, 2u);
    v52 = v51;
    v37 = v157;
    MEMORY[0x1C3B99F38](v52, -1, -1);
  }

  sub_1C03B579C(v37, &qword_1EF5FD750);
LABEL_33:
  v56 = 0;
LABEL_34:
  *a2 = v56;
}

uint64_t sub_1C03B5714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1C03B575C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_7();
}

void sub_1C03B579C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03B57D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1C03B57E8(a1, a2);
  return a1;
}

uint64_t sub_1C03B57E8(uint64_t a1, unint64_t a2)
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

void sub_1C03B582C(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
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
  NSObject *v24;
  os_log_type_t v25;
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
  uint64_t v39;
  uint64_t v40[3];
  uint64_t v41;

  v5 = v4;
  if (qword_1ED738B60 != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_29();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_11_2();
  v11 = sub_1C03E4010();
  v12 = sub_1C03E41F0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = OUTLINED_FUNCTION_16();
    v40[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v13 = 136315394;
    OUTLINED_FUNCTION_6_5();
    v41 = OUTLINED_FUNCTION_10_1(a2, v14, v40);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v13 + 12) = 2080;
    v15 = OUTLINED_FUNCTION_13_3();
    v41 = OUTLINED_FUNCTION_12_4(v15, v16, v40, v17, v18, v19, v20, v21, v5, v10, a1);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_9_2(&dword_1C03A5000, v11, v22, "Getting in memory property: %s for requestId: %s");
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_3_2();
  v23 = *(_QWORD *)(v5 + 112);
  OUTLINED_FUNCTION_6_5();
  swift_bridgeObjectRetain();
  sub_1C03C5330(a2, a3, v23, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C03B69D0((uint64_t)a4, (uint64_t)v40);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_11_2();
  v24 = sub_1C03E4010();
  v25 = sub_1C03E41F0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = a2;
    v27 = OUTLINED_FUNCTION_16();
    v39 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v27 = 67109634;
    sub_1C03B67CC((uint64_t)v40);
    sub_1C03E4238();
    *(_WORD *)(v27 + 8) = 2080;
    OUTLINED_FUNCTION_6_5();
    OUTLINED_FUNCTION_10_1(v26, v28, &v39);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v27 + 18) = 2080;
    v29 = OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_12_4(v29, v30, &v39, v31, v32, v33, v34, v35, v36, v37, a1);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    _os_log_impl(&dword_1C03A5000, v24, v25, "Found = %{BOOL}d for property: %s for requestId: %s", (uint8_t *)v27, 0x1Cu);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }
  sub_1C03B67CC((uint64_t)v40);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_2();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_1C03B5BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_1ED738B60 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED738B68);
  v3 = sub_1C03E4010();
  v4 = sub_1C03E41E4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C03A5000, v3, v4, "Clearing suggestions state store", v5, 2u);
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_3_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738320);
  sub_1C03E4058();
  swift_endAccess();
  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v1 + 120) = MEMORY[0x1E0DEE9D8];
  return swift_bridgeObjectRelease();
}

void sub_1C03B5CD4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26[3];
  uint64_t v27[6];

  v6 = v5;
  if (qword_1ED738B60 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_11_2();
  v13 = sub_1C03E4010();
  v14 = sub_1C03E41F0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = OUTLINED_FUNCTION_16();
    v27[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v15 = 136315394;
    OUTLINED_FUNCTION_6_5();
    OUTLINED_FUNCTION_10_1(a3, v16, v27);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    v26[0] = sub_1C03B934C(a1, a2, v27);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_9_2(&dword_1C03A5000, v13, v17, "Setting propertyKey: %s for requestId: %s");
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();
  sub_1C03B698C(a5, (uint64_t)v27);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_6_5();
  sub_1C03BAC94((uint64_t)v27);
  swift_endAccess();
  OUTLINED_FUNCTION_3_2();
  v18 = *(_QWORD *)(v6 + 120);
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    OUTLINED_FUNCTION_11_2();
    sub_1C03ABA60();
    v20 = v18 + 56;
    while (1)
    {
      v21 = *(void (**)(uint64_t))(v20 - 8);
      v26[0] = a3;
      v26[1] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      if ((sub_1C03E4268() & 1) != 0)
        break;
      swift_release();
      swift_bridgeObjectRelease();
      v20 += 32;
      if (!--v19)
      {
        OUTLINED_FUNCTION_14_2();
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_11_2();
    v22 = sub_1C03E4010();
    v23 = sub_1C03E41E4();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_16();
      v26[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v24 = 136315138;
      OUTLINED_FUNCTION_6_5();
      OUTLINED_FUNCTION_10_1(a3, v25, v26);
      sub_1C03E4238();
      OUTLINED_FUNCTION_16_1();
      _os_log_impl(&dword_1C03A5000, v22, v23, "Invoking late arrival of property: %s to listener", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_14_2();
    v21(a5);
    swift_release();
  }
LABEL_13:
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_1C03B6090()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_3();
  swift_bridgeObjectRetain();
  return sub_1C03B60F0();
}

uint64_t sub_1C03B60F0()
{
  uint64_t result;
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  _QWORD v21[5];
  uint64_t v22;

  result = (uint64_t)sub_1C03CFC44(v21);
  v1 = v21[0];
  v2 = v21[3];
  v3 = v21[4];
  v19 = v21[1];
  v20 = (unint64_t)(v21[2] + 64) >> 6;
  v18 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v3)
    {
      v4 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      v5 = v4 | (v2 << 6);
      goto LABEL_20;
    }
    v6 = v2 + 1;
    if (__OFADD__(v2, 1))
      break;
    if (v6 >= v20)
      goto LABEL_27;
    v7 = *(_QWORD *)(v19 + 8 * v6);
    v8 = v2 + 1;
    if (!v7)
    {
      v8 = v2 + 2;
      if (v2 + 2 >= v20)
        goto LABEL_27;
      v7 = *(_QWORD *)(v19 + 8 * v8);
      if (!v7)
      {
        v8 = v2 + 3;
        if (v2 + 3 >= v20)
          goto LABEL_27;
        v7 = *(_QWORD *)(v19 + 8 * v8);
        if (!v7)
        {
          v8 = v2 + 4;
          if (v2 + 4 >= v20)
            goto LABEL_27;
          v7 = *(_QWORD *)(v19 + 8 * v8);
          if (!v7)
          {
            v8 = v2 + 5;
            if (v2 + 5 >= v20)
              goto LABEL_27;
            v7 = *(_QWORD *)(v19 + 8 * v8);
            if (!v7)
            {
              v9 = v2 + 6;
              while (v9 < v20)
              {
                v7 = *(_QWORD *)(v19 + 8 * v9++);
                if (v7)
                {
                  v8 = v9 - 1;
                  goto LABEL_19;
                }
              }
LABEL_27:
              swift_bridgeObjectRelease();
              swift_release();
              return v18;
            }
          }
        }
      }
    }
LABEL_19:
    v3 = (v7 - 1) & v7;
    v5 = __clz(__rbit64(v7)) + (v8 << 6);
    v2 = v8;
LABEL_20:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v5);
    v11 = *v10;
    v12 = v10[1];
    sub_1C03B6914();
    sub_1C03B6950();
    swift_bridgeObjectRetain();
    if ((sub_1C03E4070() & 1) != 0)
    {
      v13 = v18;
      result = swift_isUniquelyReferenced_nonNull_native();
      v22 = v18;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1C03CDE40(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v13 = v22;
      }
      v15 = *(_QWORD *)(v13 + 16);
      v14 = *(_QWORD *)(v13 + 24);
      v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        result = (uint64_t)sub_1C03CDE40((char *)(v14 > 1), v15 + 1, 1);
        v16 = v15 + 1;
        v13 = v22;
      }
      *(_QWORD *)(v13 + 16) = v16;
      v18 = v13;
      v17 = v13 + 16 * v15;
      *(_QWORD *)(v17 + 32) = v11;
      *(_QWORD *)(v17 + 40) = v12;
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C03B634C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[20] = a4;
  v5[21] = v4;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  return swift_task_switch();
}

uint64_t sub_1C03B636C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  OUTLINED_FUNCTION_3_2();
  v4 = *(_QWORD *)(v1 + 112);
  OUTLINED_FUNCTION_6_5();
  swift_bridgeObjectRetain();
  sub_1C03C5330(v3, v2, v4, (_OWORD *)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 88))
  {
    v5 = *(void (**)(uint64_t))(v0 + 152);
    sub_1C03B68B0((__int128 *)(v0 + 64), (_OWORD *)(v0 + 16));
    v5(v0 + 16);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 160);
    v7 = *(_QWORD *)(v0 + 168);
    v9 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 136);
    sub_1C03B67CC(v0 + 64);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v8;
    *(_QWORD *)(v11 + 24) = v6;
    OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_6_5();
    swift_retain();
    sub_1C03B685C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C03B87D8);
    v12 = *(_QWORD *)(*(_QWORD *)(v7 + 120) + 16);
    sub_1C03B68D4(v12, (uint64_t (*)(BOOL))sub_1C03B87D8);
    v13 = *(_QWORD *)(v7 + 120);
    *(_QWORD *)(v13 + 16) = v12 + 1;
    v14 = (_QWORD *)(v13 + 32 * v12);
    v14[4] = v10;
    v14[5] = v9;
    v14[6] = sub_1C03B6830;
    v14[7] = v11;
    swift_endAccess();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03B64C8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1C03B64F4()
{
  sub_1C03B64C8();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for InMemoryHintsStateStore()
{
  return objc_opt_self();
}

uint64_t sub_1C03B652C()
{
  uint64_t v0;
  uint64_t v1;

  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  v1 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 112) = sub_1C03E404C();
  *(_QWORD *)(v0 + 120) = v1;
  return v0;
}

uint64_t sub_1C03B6584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1C03B65A4()
{
  uint64_t v0;

  sub_1C03B5CD4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B65D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1C03B65F4()
{
  uint64_t v0;

  sub_1C03B582C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_OWORD **)(v0 + 16));
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B6624(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1C03B6640()
{
  uint64_t v0;

  sub_1C03B5BB4();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03B6668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1C03B6684()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1C03B6090();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_1C03B66B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03B672C;
  return sub_1C03B634C(a1, a2, a3, a4);
}

uint64_t sub_1C03B672C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_1C03B676C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED738760;
  if (!qword_1ED738760)
  {
    v1 = type metadata accessor for InMemoryHintsStateStore();
    result = MEMORY[0x1C3B99EA8]("a\b]'h8", v1);
    atomic_store(result, (unint64_t *)&qword_1ED738760);
  }
  return result;
}

unint64_t sub_1C03B67A8(uint64_t a1)
{
  unint64_t result;

  result = sub_1C03B676C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1C03B67CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738380);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C03B680C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03B6830()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C03B6850()
{
  return sub_1C03B685C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1C03B89AC);
}

uint64_t sub_1C03B685C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

_OWORD *sub_1C03B68B0(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1C03B68C8(uint64_t a1)
{
  return sub_1C03B68D4(a1, (uint64_t (*)(BOOL))sub_1C03B89AC);
}

uint64_t sub_1C03B68D4(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

unint64_t sub_1C03B6914()
{
  unint64_t result;

  result = qword_1EF5FD7F8;
  if (!qword_1EF5FD7F8)
  {
    result = MEMORY[0x1C3B99EA8](MEMORY[0x1E0DEA980], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF5FD7F8);
  }
  return result;
}

unint64_t sub_1C03B6950()
{
  unint64_t result;

  result = qword_1EF5FD800;
  if (!qword_1EF5FD800)
  {
    result = MEMORY[0x1C3B99EA8](MEMORY[0x1E0DEFF48], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF5FD800);
  }
  return result;
}

uint64_t sub_1C03B698C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C03B69D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_9_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C03B934C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_12_4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unint64_t v11;

  return sub_1C03B934C(a11, v11, a3);
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t InternalXPCSuggestionsLoggerFactory.__allocating_init(internalXPCServicesClient:)(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_1C03ABB70(a1, v2 + 16);
  return v2;
}

uint64_t InternalXPCSuggestionsLoggerFactory.init(internalXPCServicesClient:)(__int128 *a1)
{
  uint64_t v1;

  sub_1C03ABB70(a1, v1 + 16);
  return v1;
}

uint64_t InternalXPCSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *boxed_opaque_existential_1;

  v3 = v1[5];
  v4 = v1[6];
  v5 = __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  a1[3] = v3;
  a1[4] = *(_QWORD *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  return (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
}

uint64_t InternalXPCSuggestionsLoggerFactory.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t InternalXPCSuggestionsLoggerFactory.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B6B6C@<X0>(uint64_t *a1@<X8>)
{
  return InternalXPCSuggestionsLoggerFactory.create(featureService:)(a1);
}

uint64_t type metadata accessor for InternalXPCSuggestionsLoggerFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for InternalXPCSuggestionsLoggerFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InternalXPCSuggestionsLoggerFactory.__allocating_init(internalXPCServicesClient:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t InServiceSuggestionsDispatcher.dispatch(suggestions:presentationContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[26] = a2;
  v3[27] = v2;
  v3[25] = a1;
  sub_1C03E302C();
  v3[28] = OUTLINED_FUNCTION_3_0();
  v4 = sub_1C03E3AD0();
  v3[29] = v4;
  v3[30] = *(_QWORD *)(v4 - 8);
  v3[31] = OUTLINED_FUNCTION_3_0();
  v3[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B0);
  v3[33] = OUTLINED_FUNCTION_3_3();
  v3[34] = OUTLINED_FUNCTION_3_3();
  v3[35] = OUTLINED_FUNCTION_3_3();
  v3[36] = OUTLINED_FUNCTION_3_3();
  v3[37] = OUTLINED_FUNCTION_3_3();
  v3[38] = OUTLINED_FUNCTION_3_3();
  v3[39] = OUTLINED_FUNCTION_3_3();
  v3[40] = OUTLINED_FUNCTION_3_3();
  v3[41] = OUTLINED_FUNCTION_3_3();
  v3[42] = OUTLINED_FUNCTION_3_3();
  v3[43] = OUTLINED_FUNCTION_3_3();
  v3[44] = OUTLINED_FUNCTION_3_3();
  v5 = sub_1C03E3CA4();
  v3[45] = v5;
  v3[46] = *(_QWORD *)(v5 - 8);
  v3[47] = OUTLINED_FUNCTION_3_0();
  v6 = OUTLINED_FUNCTION_65();
  v3[48] = v6;
  v3[49] = *(_QWORD *)(v6 - 8);
  v3[50] = OUTLINED_FUNCTION_3_3();
  v3[51] = OUTLINED_FUNCTION_3_3();
  return swift_task_switch();
}

uint64_t sub_1C03B6CF4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t, uint64_t);
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(uint64_t, uint64_t, uint64_t);
  __int128 *v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137[6];

  v2 = *(_QWORD *)(v0 + 200);
  v3 = sub_1C03E3A88();
  v137[0] = MEMORY[0x1E0DEE9E0];
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 392);
    v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v7 = v3 + v6;
    v131 = v6;
    v133 = *(_QWORD *)(v0 + 368);
    v129 = v6 + *(_QWORD *)(v5 + 72);
    v8 = MEMORY[0x1E0DEE9E0];
    v135 = v5;
    v136 = *(_QWORD *)(v5 + 16);
    v130 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      v9 = *(_QWORD *)(v0 + 376);
      ((void (*)(_QWORD, unint64_t, _QWORD))v136)(*(_QWORD *)(v0 + 408), v7, *(_QWORD *)(v0 + 384));
      sub_1C03E3A04();
      v2 = sub_1C03B9BF0(v9);
      v11 = *(_QWORD *)(v8 + 16);
      v12 = (v10 & 1) == 0;
      v13 = v11 + v12;
      if (__OFADD__(v11, v12))
        break;
      v14 = v10;
      if (*(_QWORD *)(v8 + 24) < v13)
      {
        v15 = *(_QWORD *)(v0 + 376);
        sub_1C03B9D5C(v13, 1);
        v8 = v137[0];
        v16 = sub_1C03B9BF0(v15);
        if ((v14 & 1) != (v17 & 1))
        {
          OUTLINED_FUNCTION_35_0();
          return sub_1C03E4418();
        }
        v2 = v16;
      }
      v18 = *(_QWORD *)(v0 + 408);
      if ((v14 & 1) != 0)
      {
        v19 = *(_QWORD *)(v0 + 400);
        v20 = *(_QWORD *)(v0 + 384);
        (*(void (**)(_QWORD, _QWORD))(v133 + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 360));
        v8 = v137[0];
        v21 = *(_QWORD *)(v137[0] + 56);
        v1 = *(_QWORD *)(v135 + 32);
        ((void (*)(uint64_t, uint64_t, uint64_t))v1)(v19, v18, v20);
        v22 = *(_QWORD *)(v21 + 8 * v2);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v21 + 8 * v2) = v22;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v22 = OUTLINED_FUNCTION_49_0();
          *(_QWORD *)(v21 + 8 * v2) = v22;
        }
        v24 = *(_QWORD *)(v22 + 16);
        if (v24 >= *(_QWORD *)(v22 + 24) >> 1)
        {
          v22 = OUTLINED_FUNCTION_49_0();
          *(_QWORD *)(v21 + 8 * v2) = v22;
        }
        v25 = *(_QWORD *)(v0 + 400);
        v26 = *(_QWORD *)(v0 + 384);
        *(_QWORD *)(v22 + 16) = v24 + 1;
        v27 = v22 + v131 + v24 * v130;
        v28 = v130;
        ((void (*)(uint64_t, uint64_t, uint64_t))v1)(v27, v25, v26);
      }
      else
      {
        v30 = *(_QWORD *)(v0 + 376);
        v29 = *(_QWORD *)(v0 + 384);
        v31 = *(_QWORD *)(v0 + 360);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B8);
        v1 = swift_allocObject();
        *(_OWORD *)(v1 + 16) = xmmword_1C03E56C0;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v135 + 32))(v1 + v131, v18, v29);
        *(_QWORD *)(v8 + 8 * (v2 >> 6) + 64) |= 1 << v2;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v133 + 32))(*(_QWORD *)(v8 + 48) + *(_QWORD *)(v133 + 72) * v2, v30, v31);
        *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v2) = v1;
        v32 = *(_QWORD *)(v8 + 16);
        v33 = __OFADD__(v32, 1);
        v34 = v32 + 1;
        if (v33)
          goto LABEL_53;
        *(_QWORD *)(v8 + 16) = v34;
        v28 = v130;
      }
      v7 += v28;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    swift_once();
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x1E0DEE9E0];
LABEL_18:
    v35 = 0;
    v126 = (__int128 *)(v0 + 56);
    v129 = v0 + 96;
    v130 = v0 + 16;
    v124 = v0 + 136;
    *(_QWORD *)(v0 + 416) = v8;
    v36 = *(_BYTE *)(v8 + 32);
    *(_BYTE *)(v0 + 456) = v36;
    v37 = 1 << v36;
    if (v37 < 64)
      v38 = ~(-1 << v37);
    else
      v38 = -1;
    if ((v38 & *(_QWORD *)(v8 + 64)) == 0)
      goto LABEL_23;
LABEL_22:
    OUTLINED_FUNCTION_42_0();
    v42 = v41 | (v39 << 6);
    v2 = *(_QWORD *)(v0 + 416);
    while (1)
    {
      *(_QWORD *)(v0 + 424) = v39;
      *(_QWORD *)(v0 + 432) = v40;
      v51 = *(_QWORD *)(v0 + 360);
      v52 = *(_QWORD *)(v0 + 368);
      v54 = *(_QWORD *)(v0 + 344);
      v53 = *(_QWORD *)(v0 + 352);
      v55 = *(_QWORD *)(v0 + 336);
      v56 = *(_QWORD *)(v0 + 256);
      v136 = *(_QWORD *)(v0 + 216);
      v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16);
      v57(v53, *(_QWORD *)(v2 + 48) + *(_QWORD *)(v52 + 72) * v42, v51);
      v1 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v42);
      *(_QWORD *)(v53 + *(int *)(v56 + 48)) = v1;
      v58 = *(int *)(v56 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v54, v53, v51);
      *(_QWORD *)(v54 + v58) = v1;
      v59 = *(_QWORD *)(v136 + 16);
      v60 = *(int *)(v56 + 48);
      v57(v55, v54, v51);
      *(_QWORD *)(v55 + v60) = v1;
      v61 = *(_QWORD *)(v59 + 16);
      OUTLINED_FUNCTION_11_2();
      if (v61)
      {
        v62 = sub_1C03B9BF0(*(_QWORD *)(v0 + 336));
        if ((v63 & 1) != 0)
          break;
      }
      OUTLINED_FUNCTION_18_2();
      if (qword_1ED738B40 != -1)
        swift_once();
      v64 = *(_QWORD *)(v0 + 360);
      v65 = *(_QWORD *)(v0 + 344);
      v67 = *(_QWORD *)(v0 + 264);
      v66 = *(_QWORD *)(v0 + 272);
      v68 = *(_QWORD *)(v0 + 256);
      v69 = OUTLINED_FUNCTION_29();
      __swift_project_value_buffer(v69, (uint64_t)qword_1ED738B48);
      v70 = *(int *)(v68 + 48);
      v57(v66, v65, v64);
      *(_QWORD *)(v66 + v70) = v1;
      sub_1C03B9C8C(v66, v67);
      v71 = v57;
      v72 = sub_1C03E4010();
      v73 = sub_1C03E41FC();
      if (os_log_type_enabled(v72, v73))
      {
        v74 = *(_QWORD *)(v0 + 360);
        v75 = *(_QWORD *)(v0 + 280);
        v76 = *(_QWORD *)(v0 + 256);
        v77 = *(_QWORD *)(v0 + 264);
        v78 = OUTLINED_FUNCTION_16();
        v137[0] = OUTLINED_FUNCTION_16();
        *(_DWORD *)v78 = 136315138;
        v79 = *(int *)(v76 + 48);
        v71(v75, v77, v74);
        *(_QWORD *)(v75 + v79) = *(_QWORD *)(v77 + v79);
        sub_1C03BA674((unint64_t *)&unk_1EF5FD8C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6338]);
        v80 = sub_1C03E43E8();
        OUTLINED_FUNCTION_25_1();
        *(_QWORD *)(v78 + 4) = OUTLINED_FUNCTION_54(v80, v81, v137);
        OUTLINED_FUNCTION_57();
        sub_1C03B9CD4(v77);
        _os_log_impl(&dword_1C03A5000, v72, v73, "Unknown vehicle of %s", (uint8_t *)v78, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_0();
      }
      v2 = *(_QWORD *)(v0 + 344);

      OUTLINED_FUNCTION_46_0();
      sub_1C03B9CD4(v2);
      v35 = *(_QWORD *)(v0 + 424);
      if (*(_QWORD *)(v0 + 432))
        goto LABEL_22;
LABEL_23:
      if (__OFADD__(v35, 1))
        goto LABEL_52;
      OUTLINED_FUNCTION_17_1();
      if (v45 == v33)
      {
LABEL_45:
        OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_56();
        OUTLINED_FUNCTION_55();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_60();
        OUTLINED_FUNCTION_51_0();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_35_0();
        __asm { BR              X0 }
      }
      v46 = v2 + 64;
      if (!*(_QWORD *)(v2 + 64 + 8 * v44))
      {
        v47 = v43 >> 6;
        if (v44 + 1 >= v47)
          goto LABEL_45;
        if (!*(_QWORD *)(v46 + 8 * (v44 + 1)))
        {
          if (v44 + 2 >= v47)
            goto LABEL_45;
          if (!*(_QWORD *)(v46 + 8 * (v44 + 2)))
          {
            v48 = v44 + 3;
            if (v48 >= v47)
              goto LABEL_45;
            if (!*(_QWORD *)(v46 + 8 * v48))
            {
              do
              {
                v49 = v48 + 1;
                if (__OFADD__(v48, 1))
                  goto LABEL_54;
                if (v49 >= v47)
                  goto LABEL_45;
                ++v48;
              }
              while (!*(_QWORD *)(v46 + 8 * v49));
            }
          }
        }
      }
      OUTLINED_FUNCTION_63();
      v42 = v50 + (v39 << 6);
    }
    v125 = v57;
    v84 = *(_QWORD *)(v0 + 360);
    v83 = *(_QWORD *)(v0 + 368);
    v85 = OUTLINED_FUNCTION_52_0(v62);
    sub_1C03AE6B0(v85, (uint64_t)v126);
    sub_1C03ABB70(v126, v130);
    v136 = *(_QWORD *)(v83 + 8);
    ((void (*)(uint64_t, uint64_t))v136)(v51, v84);
    if (qword_1ED738B40 != -1)
      goto LABEL_55;
  }
  v86 = *(_QWORD *)(v0 + 360);
  v87 = *(_QWORD *)(v0 + 344);
  v89 = *(_QWORD *)(v0 + 320);
  v88 = *(_QWORD *)(v0 + 328);
  v91 = *(_QWORD *)(v0 + 304);
  v90 = *(_QWORD *)(v0 + 312);
  v127 = *(_QWORD *)(v0 + 296);
  v132 = *(_QWORD *)(v0 + 288);
  v92 = *(_QWORD *)(v0 + 256);
  v93 = OUTLINED_FUNCTION_29();
  v134 = __swift_project_value_buffer(v93, (uint64_t)qword_1ED738B48);
  v94 = *(int *)(v92 + 48);
  v125(v88, v87, v86);
  *(_QWORD *)(v88 + v94) = v1;
  OUTLINED_FUNCTION_40_0();
  sub_1C03B9C8C(v88, v90);
  v95 = *(int *)(v92 + 48);
  OUTLINED_FUNCTION_50_0(v91, v87);
  *(_QWORD *)(v91 + v95) = v1;
  sub_1C03B9D14(v91, v127);
  sub_1C03B9C8C(v91, v132);
  sub_1C03AE6B0(v130, v129);
  OUTLINED_FUNCTION_11_2();
  v96 = sub_1C03E4010();
  v97 = sub_1C03E41F0();
  if (OUTLINED_FUNCTION_28_1(v97))
  {
    v98 = *(_QWORD *)(v0 + 360);
    v99 = *(_QWORD *)(v0 + 320);
    v121 = *(_QWORD *)(v0 + 296);
    v122 = *(_QWORD *)(v0 + 384);
    v123 = *(_QWORD *)(v0 + 288);
    v100 = *(_QWORD *)(v0 + 280);
    v101 = *(_QWORD *)(v0 + 256);
    v119 = v101;
    v120 = *(_QWORD *)(v0 + 312);
    v102 = OUTLINED_FUNCTION_16();
    v137[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v102 = 136315650;
    v128 = v96;
    v103 = *(int *)(v101 + 48);
    v125(v100, v99, v98);
    *(_QWORD *)(v100 + v103) = *(_QWORD *)(v99 + v103);
    sub_1C03BA674((unint64_t *)&unk_1EF5FD8C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6338]);
    v104 = sub_1C03E43E8();
    ((void (*)(uint64_t, uint64_t))v136)(v100, v98);
    *(_QWORD *)(v0 + 184) = OUTLINED_FUNCTION_54(v104, v105, v137);
    sub_1C03E4238();
    OUTLINED_FUNCTION_57();
    sub_1C03B9CD4(v120);
    sub_1C03B9CD4(v99);
    *(_WORD *)(v102 + 12) = 2080;
    v106 = *(int *)(v119 + 48);
    v125(v100, v121, v98);
    v107 = *(_QWORD *)(v121 + v106);
    *(_QWORD *)(v100 + v106) = v107;
    swift_bridgeObjectRetain();
    ((void (*)(uint64_t, uint64_t))v136)(v100, v98);
    v108 = MEMORY[0x1C3B99770](v107, v122);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 176) = OUTLINED_FUNCTION_54(v108, v109, v137);
    sub_1C03E4238();
    OUTLINED_FUNCTION_57();
    sub_1C03B9CD4(v123);
    OUTLINED_FUNCTION_41_0();
    *(_WORD *)(v102 + 22) = 2080;
    sub_1C03AE6B0(v129, v124);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E00);
    v110 = OUTLINED_FUNCTION_47_0();
    *(_QWORD *)(v0 + 192) = OUTLINED_FUNCTION_62(v110, v111);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v129);
    OUTLINED_FUNCTION_43_0(&dword_1C03A5000, v128, (os_log_type_t)v134, "Dispatching %s of %s to %s");
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_27_1();
  sub_1C03B9CD4(v134);
  sub_1C03B9CD4(v89);
  OUTLINED_FUNCTION_41_0();
  __swift_destroy_boxed_opaque_existential_1(v129);

  v113 = *((_QWORD *)v125 + 45);
  v114 = *((_QWORD *)v125 + 43);
  v115 = *((_QWORD *)v125 + 35);
  v116 = *((_QWORD *)v125 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)v130, *((_QWORD *)v125 + 5));
  v117 = *(int *)(v116 + 48);
  v125(v115, v114, v113);
  *(_QWORD *)(v115 + v117) = v1;
  sub_1C03E3A94();
  sub_1C03E3AB8();
  sub_1C03E3AC4();
  sub_1C03E3AA0();
  OUTLINED_FUNCTION_25_1();
  v118 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v125 + 55) = v118;
  OUTLINED_FUNCTION_31_1(v118, (uint64_t)sub_1C03B783C);
  OUTLINED_FUNCTION_35_0();
  return sub_1C03E36B0();
}

uint64_t sub_1C03B783C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 448) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[30] + 8))(v2[31], v2[29]);
  return swift_task_switch();
}

uint64_t sub_1C03B78B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
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
  os_log_type_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t, uint64_t);
  __int128 *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  os_log_type_t v100;
  uint64_t v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104[6];

  v2 = v0 + 16;
  v97 = v0 + 96;
  v98 = (_QWORD *)(v0 + 16);
  v95 = (__int128 *)(v0 + 56);
  sub_1C03B9CD4(*(_QWORD *)(v0 + 344));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  while (1)
  {
    if (*(_QWORD *)(v0 + 432))
    {
      OUTLINED_FUNCTION_42_0();
      v6 = v5 | (v3 << 6);
      v2 = *(_QWORD *)(v0 + 416);
    }
    else
    {
      if (__OFADD__(*(_QWORD *)(v0 + 424), 1))
      {
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      OUTLINED_FUNCTION_17_1();
      if (v9 == v10)
        goto LABEL_25;
      v11 = v2 + 64;
      if (!*(_QWORD *)(v2 + 64 + 8 * v8))
      {
        v12 = v7 >> 6;
        if (v8 + 1 >= v12)
          goto LABEL_25;
        if (!*(_QWORD *)(v11 + 8 * (v8 + 1)))
        {
          if (v8 + 2 >= v12)
            goto LABEL_25;
          if (!*(_QWORD *)(v11 + 8 * (v8 + 2)))
          {
            v13 = v8 + 3;
            if (v13 >= v12)
            {
LABEL_25:
              OUTLINED_FUNCTION_21_1();
              OUTLINED_FUNCTION_20_1();
              OUTLINED_FUNCTION_56();
              OUTLINED_FUNCTION_55();
              swift_task_dealloc();
              swift_task_dealloc();
              OUTLINED_FUNCTION_30();
              OUTLINED_FUNCTION_48();
              OUTLINED_FUNCTION_60();
              OUTLINED_FUNCTION_51_0();
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
            if (!*(_QWORD *)(v11 + 8 * v13))
            {
              do
              {
                v14 = v13 + 1;
                if (__OFADD__(v13, 1))
                  goto LABEL_31;
                if (v14 >= v12)
                  goto LABEL_25;
                ++v13;
              }
              while (!*(_QWORD *)(v11 + 8 * v14));
            }
          }
        }
      }
      OUTLINED_FUNCTION_63();
      v6 = v15 + (v3 << 6);
    }
    *(_QWORD *)(v0 + 424) = v3;
    *(_QWORD *)(v0 + 432) = v4;
    v16 = *(_QWORD *)(v0 + 360);
    v17 = *(_QWORD *)(v0 + 368);
    v19 = *(_QWORD *)(v0 + 344);
    v18 = *(_QWORD *)(v0 + 352);
    v20 = *(_QWORD *)(v0 + 336);
    v21 = *(_QWORD *)(v0 + 256);
    v103 = *(_QWORD *)(v0 + 216);
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    v22(v18, *(_QWORD *)(v2 + 48) + *(_QWORD *)(v17 + 72) * v6, v16);
    v1 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v6);
    *(_QWORD *)(v18 + *(int *)(v21 + 48)) = v1;
    v23 = *(int *)(v21 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v19, v18, v16);
    *(_QWORD *)(v19 + v23) = v1;
    v24 = *(_QWORD *)(v103 + 16);
    v25 = *(int *)(v21 + 48);
    v26 = (void (*)(uint64_t))v22;
    v22(v20, v19, v16);
    *(_QWORD *)(v20 + v25) = v1;
    v27 = *(_QWORD *)(v24 + 16);
    OUTLINED_FUNCTION_11_2();
    if (v27)
    {
      v28 = sub_1C03B9BF0(*(_QWORD *)(v0 + 336));
      if ((v29 & 1) != 0)
        break;
    }
    OUTLINED_FUNCTION_18_2();
    if (qword_1ED738B40 != -1)
      swift_once();
    v30 = *(_QWORD *)(v0 + 360);
    v31 = *(_QWORD *)(v0 + 344);
    v33 = *(_QWORD *)(v0 + 264);
    v32 = *(_QWORD *)(v0 + 272);
    v34 = *(_QWORD *)(v0 + 256);
    v35 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v35, (uint64_t)qword_1ED738B48);
    v36 = *(int *)(v34 + 48);
    v22(v32, v31, v30);
    *(_QWORD *)(v32 + v36) = v1;
    sub_1C03B9C8C(v32, v33);
    v37 = sub_1C03E4010();
    v38 = sub_1C03E41FC();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = *(_QWORD *)(v0 + 280);
      v41 = *(_QWORD *)(v0 + 256);
      v40 = *(_QWORD *)(v0 + 264);
      v42 = OUTLINED_FUNCTION_16();
      v104[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v42 = 136315138;
      v43 = *(int *)(v41 + 48);
      v44 = OUTLINED_FUNCTION_61();
      v26(v44);
      *(_QWORD *)(v39 + v43) = *(_QWORD *)(v40 + v43);
      sub_1C03BA674((unint64_t *)&unk_1EF5FD8C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6338]);
      v45 = sub_1C03E43E8();
      v47 = v46;
      OUTLINED_FUNCTION_25_1();
      *(_QWORD *)(v42 + 4) = sub_1C03B934C(v45, v47, v104);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46_0();
      _os_log_impl(&dword_1C03A5000, v37, v38, "Unknown vehicle of %s", (uint8_t *)v42, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
    }
    v2 = *(_QWORD *)(v0 + 344);

    OUTLINED_FUNCTION_46_0();
    sub_1C03B9CD4(v2);
  }
  v94 = v22;
  v49 = *(_QWORD *)(v0 + 360);
  v50 = *(_QWORD *)(v0 + 368);
  v51 = OUTLINED_FUNCTION_52_0(v28);
  sub_1C03AE6B0(v51, (uint64_t)v95);
  sub_1C03ABB70(v95, (uint64_t)v98);
  v103 = *(_QWORD *)(v50 + 8);
  ((void (*)(uint64_t, uint64_t))v103)(v25, v49);
  if (qword_1ED738B40 == -1)
    goto LABEL_27;
LABEL_32:
  swift_once();
LABEL_27:
  v52 = *(_QWORD *)(v0 + 360);
  v53 = *(_QWORD *)(v0 + 344);
  v55 = *(_QWORD *)(v0 + 320);
  v54 = *(_QWORD *)(v0 + 328);
  v57 = *(_QWORD *)(v0 + 304);
  v56 = *(_QWORD *)(v0 + 312);
  v96 = *(_QWORD *)(v0 + 296);
  v99 = *(_QWORD *)(v0 + 288);
  v58 = *(_QWORD *)(v0 + 256);
  v59 = OUTLINED_FUNCTION_29();
  v101 = __swift_project_value_buffer(v59, (uint64_t)qword_1ED738B48);
  v60 = *(int *)(v58 + 48);
  v94(v54, v53, v52);
  *(_QWORD *)(v54 + v60) = v1;
  OUTLINED_FUNCTION_40_0();
  sub_1C03B9C8C(v54, v56);
  v61 = *(int *)(v58 + 48);
  OUTLINED_FUNCTION_50_0(v57, v53);
  *(_QWORD *)(v57 + v61) = v1;
  sub_1C03B9D14(v57, v96);
  sub_1C03B9C8C(v57, v99);
  sub_1C03AE6B0((uint64_t)v98, v97);
  OUTLINED_FUNCTION_11_2();
  v62 = v101;
  v63 = sub_1C03E4010();
  v64 = sub_1C03E41F0();
  if (OUTLINED_FUNCTION_28_1(v64))
  {
    v102 = v63;
    v65 = *(_QWORD *)(v0 + 360);
    v66 = *(_QWORD *)(v0 + 320);
    v91 = *(_QWORD *)(v0 + 296);
    v92 = *(_QWORD *)(v0 + 384);
    v100 = v62;
    v67 = *(_QWORD *)(v0 + 280);
    v93 = *(_QWORD *)(v0 + 288);
    v68 = *(_QWORD *)(v0 + 256);
    v89 = v68;
    v90 = *(_QWORD *)(v0 + 312);
    v69 = OUTLINED_FUNCTION_16();
    v104[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v69 = 136315650;
    v70 = *(int *)(v68 + 48);
    v94(v67, v66, v65);
    *(_QWORD *)(v67 + v70) = *(_QWORD *)(v66 + v70);
    sub_1C03BA674((unint64_t *)&unk_1EF5FD8C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6338]);
    v71 = sub_1C03E43E8();
    v73 = v72;
    v74 = OUTLINED_FUNCTION_61();
    ((void (*)(uint64_t))v103)(v74);
    *(_QWORD *)(v0 + 184) = sub_1C03B934C(v71, v73, v104);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    sub_1C03B9CD4(v90);
    sub_1C03B9CD4(v66);
    *(_WORD *)(v69 + 12) = 2080;
    v75 = *(int *)(v89 + 48);
    v94(v67, v91, v65);
    v76 = *(_QWORD *)(v91 + v75);
    *(_QWORD *)(v67 + v75) = v76;
    swift_bridgeObjectRetain();
    v77 = OUTLINED_FUNCTION_61();
    ((void (*)(uint64_t))v103)(v77);
    MEMORY[0x1C3B99770](v76, v92);
    swift_bridgeObjectRelease();
    v78 = OUTLINED_FUNCTION_61();
    *(_QWORD *)(v0 + 176) = sub_1C03B934C(v78, v79, v80);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    sub_1C03B9CD4(v93);
    sub_1C03B9CD4(v91);
    *(_WORD *)(v69 + 22) = 2080;
    sub_1C03AE6B0(v97, v0 + 136);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E00);
    v81 = OUTLINED_FUNCTION_47_0();
    *(_QWORD *)(v0 + 192) = OUTLINED_FUNCTION_62(v81, v82);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v97);
    OUTLINED_FUNCTION_43_0(&dword_1C03A5000, v102, v100, "Dispatching %s of %s to %s");
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_27_1();
  sub_1C03B9CD4(v101);
  sub_1C03B9CD4(v55);
  OUTLINED_FUNCTION_41_0();
  __swift_destroy_boxed_opaque_existential_1(v97);

  v83 = *((_QWORD *)v94 + 45);
  v84 = *((_QWORD *)v94 + 43);
  v85 = *((_QWORD *)v94 + 35);
  v86 = *((_QWORD *)v94 + 32);
  __swift_project_boxed_opaque_existential_1(v98, *((_QWORD *)v94 + 5));
  v87 = *(int *)(v86 + 48);
  v94(v85, v84, v83);
  *(_QWORD *)(v85 + v87) = v1;
  sub_1C03E3A94();
  sub_1C03E3AB8();
  sub_1C03E3AC4();
  sub_1C03E3AA0();
  OUTLINED_FUNCTION_25_1();
  v88 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v94 + 55) = v88;
  OUTLINED_FUNCTION_31_1(v88, (uint64_t)sub_1C03B783C);
  return sub_1C03E36B0();
}

uint64_t sub_1C03B8158()
{
  uint64_t v0;

  sub_1C03B9CD4(*(_QWORD *)(v0 + 344));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
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

void static InServiceSuggestionsDispatcher.create(eventDispatcher:clock:selfLogger:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
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
  void (*v31)(void);
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(unint64_t, uint64_t, uint64_t);
  void (*v48)(void);
  uint64_t v50;
  uint64_t v52;
  void (*v53)(unint64_t, uint64_t, uint64_t);
  void (*v54)(uint64_t, _QWORD, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72[3];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E28);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383E0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = v6;
  v55 = v6;
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = *(_QWORD *)(v7 + 72);
  v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_1C03E5820;
  v11 = v60 + v9;
  v12 = (uint64_t *)(v60 + v9 + *(int *)(v8 + 48));
  v13 = *MEMORY[0x1E0DA5A58];
  v14 = sub_1C03E3968();
  v53 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104);
  v53(v60 + v9, v13, v14);
  v15 = *MEMORY[0x1E0DA62F8];
  v16 = sub_1C03E3CA4();
  v47 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104);
  v47(v60 + v9, v15, v16);
  sub_1C03AE6B0(a1, (uint64_t)v72);
  sub_1C03AE6B0(a2, (uint64_t)&v68);
  v17 = type metadata accessor for InAppEventDispatcher();
  v18 = OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_59(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v47, a1, a2, (uint64_t)v53, v55, a3, v60, v62, a4, v68, *((uint64_t *)&v68 + 1),
    v69,
    v70,
    v71,
    v72[0]);
  sub_1C03ABB70(&v68, v18 + 56);
  v12[3] = v17;
  v26 = sub_1C03BA674(&qword_1ED7386B0, 255, (uint64_t (*)(uint64_t))type metadata accessor for InAppEventDispatcher, (uint64_t)&unk_1C03E4FF0);
  v12[4] = v26;
  *v12 = v18;
  v27 = v10;
  v28 = v11 + v10;
  v29 = v56;
  v30 = (uint64_t *)(v28 + *(int *)(v56 + 48));
  v54(v28, *MEMORY[0x1E0DA5A50], v14);
  v31 = v48;
  ((void (*)(uint64_t, uint64_t, uint64_t))v48)(v28, v15, v16);
  sub_1C03AE6B0(v50, (uint64_t)v72);
  sub_1C03AE6B0(v52, (uint64_t)&v68);
  v32 = OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_59(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)v48, v50, v52, (uint64_t)v54, v56, v58, v61, v63, v66, v68, *((uint64_t *)&v68 + 1),
    v69,
    v70,
    v71,
    v72[0]);
  sub_1C03ABB70(&v68, v32 + 56);
  v30[3] = v17;
  v30[4] = v26;
  *v30 = v32;
  v40 = (uint64_t *)(v11 + 2 * v27 + *(int *)(v29 + 48));
  v31();
  sub_1C03AE6B0(v59, (uint64_t)v72);
  v41 = sub_1C03E38CC();
  swift_allocObject();
  v42 = sub_1C03E38C0();
  v43 = MEMORY[0x1E0DA5558];
  v40[3] = v41;
  v40[4] = v43;
  *v40 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E00);
  sub_1C03BA674(&qword_1ED7383D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6318]);
  v44 = sub_1C03E404C();
  v45 = OUTLINED_FUNCTION_36();
  *(_QWORD *)(v45 + 16) = v44;
  v67[3] = v64;
  v67[4] = sub_1C03BA674(&qword_1ED7384C8, v46, (uint64_t (*)(uint64_t))type metadata accessor for InServiceSuggestionsDispatcher, (uint64_t)&protocol conformance descriptor for InServiceSuggestionsDispatcher);
  *v67 = v45;
  OUTLINED_FUNCTION_13_4();
}

uint64_t InServiceSuggestionsDispatcher.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InServiceSuggestionsDispatcher.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03B85B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03B1000;
  return InServiceSuggestionsDispatcher.dispatch(suggestions:presentationContext:)(a1, a2);
}

uint64_t sub_1C03B8614(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C03B8648()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  size_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;

  OUTLINED_FUNCTION_23_0();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v5 != v6)
    {
      OUTLINED_FUNCTION_22_1();
      if (v5)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  else
  {
    v4 = v2;
  }
  v7 = *(_QWORD *)(v0 + 16);
  if (v4 <= v7)
    v8 = *(_QWORD *)(v0 + 16);
  else
    v8 = v4;
  if (!v8)
  {
    v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B8);
  v9 = *(_QWORD *)(OUTLINED_FUNCTION_65() - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = (_QWORD *)swift_allocObject();
  v13 = _swift_stdlib_malloc_size(v12);
  if (!v10 || (v13 - v11 == 0x8000000000000000 ? (v14 = v10 == -1) : (v14 = 0), v14))
  {
LABEL_23:
    OUTLINED_FUNCTION_2_3();
    result = sub_1C03E4334();
    __break(1u);
    return result;
  }
  v12[2] = v7;
  v12[3] = 2 * ((uint64_t)(v13 - v11) / v10);
LABEL_18:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_65() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v1 & 1) != 0)
  {
    sub_1C03B90DC(v0 + v16, v7);
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    v17 = OUTLINED_FUNCTION_9_3();
    sub_1C03B8A60(v17, v18, v19, v20);
  }
  return (uint64_t)v12;
}

void sub_1C03B87D8()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23_0();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_22_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_16_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8E8);
    v5 = (const void *)OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_30_1(v5);
    OUTLINED_FUNCTION_33_0(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_53_0();
    sub_1C03B904C(v7, v8, v9);
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_9_3();
    sub_1C03B8B80(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_28_0();
}

void sub_1C03B8874()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23_0();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_22_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_16_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD910);
    v5 = (const void *)OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_30_1(v5);
    OUTLINED_FUNCTION_33_0(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_53_0();
    sub_1C03B8FF4(v7, v8, v9);
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_9_3();
    sub_1C03B8C94(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_28_0();
}

void sub_1C03B8910()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_23_0();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_22_1();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_16_2();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383C0);
    v5 = (const void *)OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_30_1(v5);
    OUTLINED_FUNCTION_33_0(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_53_0();
    sub_1C03B9164(v7, v8, v9);
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_9_3();
    sub_1C03B8D88(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_28_0();
}

void sub_1C03B89AC()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_23_0();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_7_4();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_22_1();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_6_6();
    }
  }
  OUTLINED_FUNCTION_16_2();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383B8);
    v6 = (const void *)OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_30_1(v6);
    *(_QWORD *)(v2 + 16) = v1;
    *(_QWORD *)(v2 + 24) = 2 * (v7 / 40);
  }
  if ((v0 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_53_0();
    sub_1C03B91E8(v8, v9, v10);
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_9_3();
    sub_1C03B8E9C(v11, v12, v13, v14);
  }
}

uint64_t sub_1C03B8A60(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1C03E3A28() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_1C03E437C();
  __break(1u);
  return result;
}

uint64_t sub_1C03B8B80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8F0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C03E437C();
  __break(1u);
  return result;
}

uint64_t sub_1C03B8C94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C03E437C();
  __break(1u);
  return result;
}

uint64_t sub_1C03B8D88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C03E437C();
  __break(1u);
  return result;
}

uint64_t sub_1C03B8E9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738298);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C03E437C();
  __break(1u);
  return result;
}

void sub_1C03B8FB8(uint64_t a1, uint64_t a2)
{
  sub_1C03B90DC(a1, a2);
}

void sub_1C03B8FC4(uint64_t a1, uint64_t a2)
{
  sub_1C03B9254(a1, a2);
}

void sub_1C03B8FD0(uint64_t a1, uint64_t a2)
{
  sub_1C03B90DC(a1, a2);
}

void sub_1C03B8FDC(uint64_t a1, uint64_t a2)
{
  sub_1C03B90DC(a1, a2);
}

void sub_1C03B8FE8(uint64_t a1, uint64_t a2)
{
  sub_1C03B90DC(a1, a2);
}

char *sub_1C03B8FF4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    result = (char *)OUTLINED_FUNCTION_0_4();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_12_5(a3, result);
  }
  return result;
}

char *sub_1C03B904C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C03E437C();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

void sub_1C03B90D0(uint64_t a1, uint64_t a2)
{
  sub_1C03B90DC(a1, a2);
}

void sub_1C03B90DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_0_4();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_26_1();
    if (v5 && (v4(0), OUTLINED_FUNCTION_64(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_24_1();
      }
      else
      {
        OUTLINED_FUNCTION_4_5();
        OUTLINED_FUNCTION_10_2();
      }
    }
    else
    {
      v4(0);
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_11_4();
    }
  }
}

char *sub_1C03B9164(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C03E437C();
    __break(1u);
  }
  else if (__dst != __src || &__src[64 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, a2 << 6);
  }
  return __src;
}

char *sub_1C03B91E8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    result = (char *)OUTLINED_FUNCTION_0_4();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_12_5(a3, result);
  }
  return result;
}

void sub_1C03B9248(uint64_t a1, uint64_t a2)
{
  sub_1C03B9254(a1, a2);
}

void sub_1C03B9254(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_0_4();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_26_1();
    if (v5 && (__swift_instantiateConcreteTypeFromMangledName(v4), OUTLINED_FUNCTION_64(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_24_1();
      }
      else
      {
        OUTLINED_FUNCTION_4_5();
        OUTLINED_FUNCTION_10_2();
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v4);
      OUTLINED_FUNCTION_4_5();
      OUTLINED_FUNCTION_11_4();
    }
  }
}

uint64_t sub_1C03B92DC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1C03B934C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1C03E4238();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1C03B934C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1C03B941C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C03BA638((uint64_t)v12, *a3);
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
      sub_1C03BA638((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C03B941C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C03B9570((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C03E4244();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C03B9634(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C03E42C8();
    if (!v8)
    {
      result = sub_1C03E4334();
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

void *sub_1C03B9570(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C03E437C();
  __break(1u);
  return result;
}

uint64_t sub_1C03B9634(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C03B96C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C03B989C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C03B989C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C03B96C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C03E40DC();
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
  v3 = sub_1C03B9838(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C03E4298();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1C03E437C();
  __break(1u);
LABEL_14:
  result = sub_1C03E4334();
  __break(1u);
  return result;
}

_QWORD *sub_1C03B9838(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383C8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C03B989C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383C8);
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
    sub_1C03B9A34(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C03B9970(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C03B9970(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C03E437C();
  __break(1u);
  return result;
}

char *sub_1C03B9A34(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C03E437C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_1C03B9AB4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_1C03B9AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_58();
  sub_1C03E35CC();
  OUTLINED_FUNCTION_48_0(&qword_1EF5FD008, v0, v1, MEMORY[0x1E0DA4EA0]);
  v2 = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_36_0(v2, v2, v3, &qword_1EF5FD8F8, MEMORY[0x1E0DA4EA8]);
  OUTLINED_FUNCTION_29_1();
}

unint64_t sub_1C03B9B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C03E4460();
  sub_1C03E40C4();
  v4 = sub_1C03E4478();
  return sub_1C03BA408(a1, a2, v4);
}

void sub_1C03B9B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_58();
  sub_1C03E3CF8();
  OUTLINED_FUNCTION_48_0(&qword_1ED7383E8, v0, v1, MEMORY[0x1E0DA63B8]);
  v2 = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_36_0(v2, v2, v3, &qword_1ED738260, MEMORY[0x1E0DA63C0]);
  OUTLINED_FUNCTION_29_1();
}

unint64_t sub_1C03B9BF0(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_1C03E3CA4();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300];
  sub_1C03BA674(&qword_1ED7383D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6318]);
  v3 = sub_1C03E4064();
  return sub_1C03BA4EC(a1, v3, v2, &qword_1EF5FD908, MEMORY[0x1E0DA6320]);
}

uint64_t sub_1C03B9C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03B9CD4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C03B9D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03B9D5C(uint64_t a1, int a2)
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
  unint64_t i;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
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
  uint64_t v41;
  int v42;

  v3 = v2;
  v5 = sub_1C03E3CA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD900);
  v42 = a2;
  v10 = sub_1C03E4364();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_40;
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
  v41 = v9;
  if (!v15)
    goto LABEL_7;
LABEL_6:
  v19 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v23)) + (v18 << 6))
  {
    v25 = *(_QWORD *)(v6 + 72);
    v26 = *(_QWORD *)(v9 + 48) + v25 * i;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v26, v5);
      v27 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * i);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v26, v5);
      v27 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * i);
      swift_bridgeObjectRetain();
    }
    sub_1C03BA674(&qword_1ED7383D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6318]);
    result = sub_1C03E4064();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) == 0)
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v28) >> 6;
      while (++v30 != v33 || (v32 & 1) == 0)
      {
        v34 = v30 == v33;
        if (v30 == v33)
          v30 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v30);
        if (v35 != -1)
        {
          v31 = __clz(__rbit64(~v35)) + (v30 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    v31 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v16 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v25 * v31, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v31) = v27;
    ++*(_QWORD *)(v11 + 16);
    v9 = v41;
    if (v15)
      goto LABEL_6;
LABEL_7:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
      goto LABEL_42;
    if (v21 >= v39)
    {
      swift_release();
      v3 = v38;
      v22 = v40;
      goto LABEL_35;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v18;
    if (!v23)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_33;
      v23 = v40[v18];
      if (!v23)
        break;
    }
LABEL_18:
    v15 = (v23 - 1) & v23;
  }
  v24 = v21 + 2;
  if (v24 < v39)
  {
    v23 = v40[v24];
    if (!v23)
    {
      while (1)
      {
        v18 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v18 >= v39)
          goto LABEL_33;
        v23 = v40[v18];
        ++v24;
        if (v23)
          goto LABEL_18;
      }
    }
    v18 = v24;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  v3 = v38;
LABEL_35:
  if ((v42 & 1) != 0)
  {
    v36 = 1 << *(_BYTE *)(v9 + 32);
    if (v36 >= 64)
      sub_1C03BA61C(0, (unint64_t)(v36 + 63) >> 6, v22);
    else
      *v22 = -1 << v36;
    *(_QWORD *)(v9 + 16) = 0;
  }
LABEL_40:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t type metadata accessor for InServiceSuggestionsDispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for InServiceSuggestionsDispatcher()
{
  return swift_lookUpClassMethod();
}

void sub_1C03BA114(uint64_t a1, char a2)
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
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  _QWORD *v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[3];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D8);
  v37 = a2;
  v6 = sub_1C03E4364();
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
  swift_retain();
  v12 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v17)) + (v12 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v21 = *v19;
    v20 = v19[1];
    v22 = (__int128 *)(*(_QWORD *)(v5 + 56) + 48 * i);
    if ((v37 & 1) != 0)
    {
      sub_1C03B68B0(v22, v38);
    }
    else
    {
      sub_1C03B698C((uint64_t)v22, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1C03E4460();
    sub_1C03E40C4();
    v23 = sub_1C03E4478();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = v23 & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v21;
    v32[1] = v20;
    sub_1C03B68B0(v38, (_OWORD *)(*(_QWORD *)(v7 + 56) + 48 * v27));
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_42;
    if (v15 >= v35)
    {
      OUTLINED_FUNCTION_39_0();
      v3 = v34;
      v16 = (_QWORD *)(v5 + 64);
      goto LABEL_35;
    }
    v16 = (_QWORD *)(v5 + 64);
    v17 = *(_QWORD *)(v36 + 8 * v15);
    ++v12;
    if (!v17)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v35)
        goto LABEL_33;
      v17 = *(_QWORD *)(v36 + 8 * v12);
      if (!v17)
        break;
    }
LABEL_18:
    v10 = (v17 - 1) & v17;
  }
  v18 = v15 + 2;
  if (v18 < v35)
  {
    v17 = *(_QWORD *)(v36 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        v12 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_43;
        if (v12 >= v35)
          goto LABEL_33;
        v17 = *(_QWORD *)(v36 + 8 * v12);
        ++v18;
        if (v17)
          goto LABEL_18;
      }
    }
    v12 = v18;
    goto LABEL_18;
  }
LABEL_33:
  OUTLINED_FUNCTION_39_0();
  v3 = v34;
LABEL_35:
  if ((v37 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_1C03BA61C(0, (unint64_t)(v33 + 63) >> 6, v16);
    else
      *v16 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_40:
  OUTLINED_FUNCTION_39_0();
  *v3 = v7;
  OUTLINED_FUNCTION_13_4();
}

unint64_t sub_1C03BA408(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C03E43F4() & 1) == 0)
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
      while (!v14 && (sub_1C03E43F4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C03BA4EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  unint64_t *v20;
  uint64_t v21;

  v20 = a4;
  v21 = a5;
  v6 = v5;
  v18 = a1;
  v19 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v18 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    do
    {
      OUTLINED_FUNCTION_50_0((uint64_t)v11, *(_QWORD *)(v6 + 48) + v15 * v13);
      sub_1C03BA674(v20, 255, v19, v21);
      v16 = sub_1C03E407C();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v16 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

uint64_t sub_1C03BA61C(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_1C03BA638(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C03BA674(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1C3B99EA8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_1C03E437C();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_arrayInitWithTakeFrontToBack();
}

void *OUTLINED_FUNCTION_12_5@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = v0[45];
  v3 = v0[42];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0[46] + 8);
  *(_QWORD *)(v1 - 128) = v4;
  return v4(v3, v2);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v1 - 136) = *(_QWORD *)(v0 + 248);
  *(_QWORD *)(v1 - 128) = v2;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 128))();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  uint64_t v0;

  return sub_1C03B9CD4(*(_QWORD *)(*(_QWORD *)(v0 - 136) + 312));
}

BOOL OUTLINED_FUNCTION_28_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

size_t OUTLINED_FUNCTION_30_1(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_31_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 248);
}

void OUTLINED_FUNCTION_33_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_1C03E4064();
}

unint64_t OUTLINED_FUNCTION_36_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  return sub_1C03BA4EC(v5, a2, v6, a4, a5);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C03B9D14(v0, v1);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;

  return sub_1C03B9CD4(v0);
}

void OUTLINED_FUNCTION_43_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x20u);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  uint64_t v0;

  return sub_1C03B9CD4(v0);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_1C03E40A0();
}

uint64_t OUTLINED_FUNCTION_48_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  return sub_1C03BA674(a1, 255, v4, a4);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return sub_1C03B8648();
}

uint64_t OUTLINED_FUNCTION_50_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52_0(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + 56) + 40 * a1;
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1C03B934C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 a23)
{
  return sub_1C03ABB70(&a23, a1 + 16);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_61()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C03B934C(a1, a2, (uint64_t *)(v2 - 120));
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_1C03E3A28();
}

uint64_t sub_1C03BAA1C(uint64_t a1)
{
  return sub_1C03BAB4C(a1, qword_1ED738B20);
}

uint64_t static Logger.xpcCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C03BAA8C(&qword_1ED738B38, (uint64_t)qword_1ED738B20, a1);
}

uint64_t sub_1C03BAA50(uint64_t a1)
{
  return sub_1C03BAB4C(a1, qword_1ED738B68);
}

uint64_t static Logger.siriSuggestionsSupportCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C03BAA8C(&qword_1ED738B60, (uint64_t)qword_1ED738B68, a1);
}

uint64_t sub_1C03BAA8C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1C03E4028();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1C03BAAF4(uint64_t a1)
{
  return sub_1C03BAB4C(a1, qword_1EF5FD918);
}

uint64_t static Logger.flowCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C03BAA8C(&qword_1EF5FCB10, (uint64_t)qword_1EF5FD918, a1);
}

uint64_t sub_1C03BAB28(uint64_t a1)
{
  return sub_1C03BAB4C(a1, qword_1ED738B48);
}

uint64_t sub_1C03BAB4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1C03E4028();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1C03E401C();
}

uint64_t static Logger.dispatcherCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C03BAA8C(&qword_1ED738B40, (uint64_t)qword_1ED738B48, a1);
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

void sub_1C03BAC1C(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD v4[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C03C3A0C((_OWORD *)a1, v4);
    OUTLINED_FUNCTION_132();
    sub_1C03C3F18(v1, v2, v3);
    OUTLINED_FUNCTION_31();
  }
  else
  {
    OUTLINED_FUNCTION_124(a1);
    OUTLINED_FUNCTION_122();
    sub_1C03D59B0();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_124((uint64_t)v4);
  }
}

void sub_1C03BAC94(uint64_t a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD v4[3];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C03B68B0((__int128 *)a1, v4);
    OUTLINED_FUNCTION_132();
    sub_1C03C3FFC(v1, v2, v3);
    OUTLINED_FUNCTION_31();
  }
  else
  {
    OUTLINED_FUNCTION_124(a1);
    OUTLINED_FUNCTION_122();
    sub_1C03D5B84();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_124((uint64_t)v4);
  }
}

void sub_1C03BAD0C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34[3];
  __int128 v35;
  __int128 v36[3];
  __int128 v37[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D8);
    v2 = (_QWORD *)OUTLINED_FUNCTION_118();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v30 = a1 + 64;
  OUTLINED_FUNCTION_64_0();
  v5 = v4 & v3;
  v29 = (unint64_t)(63 - v6) >> 6;
  OUTLINED_FUNCTION_13_3();
  v31 = 0;
  v7 = &qword_1ED738338;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v9 = v8 | (v31 << 6);
      }
      else
      {
        v10 = v31 + 1;
        if (__OFADD__(v31, 1))
          goto LABEL_35;
        if (v10 >= v29)
        {
LABEL_32:
          sub_1C03C3A1C();
          return;
        }
        v11 = *(_QWORD *)(v30 + 8 * v10);
        v12 = v31 + 1;
        if (!v11)
        {
          OUTLINED_FUNCTION_160();
          if (v13 == v14)
            goto LABEL_32;
          OUTLINED_FUNCTION_158();
          if (!v11)
          {
            OUTLINED_FUNCTION_160();
            if (v13 == v14)
              goto LABEL_32;
            OUTLINED_FUNCTION_158();
            if (!v11)
            {
              OUTLINED_FUNCTION_160();
              if (v13 == v14)
                goto LABEL_32;
              OUTLINED_FUNCTION_158();
              if (!v11)
              {
                v16 = v15 + 4;
                if (v16 >= v29)
                  goto LABEL_32;
                v11 = *(_QWORD *)(v30 + 8 * v16);
                if (!v11)
                {
                  while (!__OFADD__(v16, 1))
                  {
                    OUTLINED_FUNCTION_160();
                    if (v13 == v14)
                      goto LABEL_32;
                    OUTLINED_FUNCTION_158();
                    v16 = v17 + 1;
                    if (v11)
                      goto LABEL_26;
                  }
                  goto LABEL_36;
                }
                v12 = v16;
              }
            }
          }
        }
LABEL_26:
        v5 = (v11 - 1) & v11;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
        v31 = v12;
      }
      v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
      v32 = *v18;
      v33 = v18[1];
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_150();
      __swift_instantiateConcreteTypeFromMangledName(v7);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
      swift_dynamicCast();
      sub_1C03B68B0(v34, v36);
      sub_1C03B68B0(v36, v37);
      sub_1C03B68B0(v37, &v35);
      v19 = sub_1C03B9B28(v32, v33);
      v20 = v19;
      if ((v21 & 1) == 0)
        break;
      v22 = v7;
      v23 = (uint64_t *)(v2[6] + 16 * v19);
      swift_bridgeObjectRelease();
      *v23 = v32;
      v23[1] = v33;
      v7 = v22;
      v24 = (_OWORD *)(v2[7] + 48 * v20);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      sub_1C03B68B0(&v35, v24);
    }
    if (v2[2] >= v2[3])
      break;
    OUTLINED_FUNCTION_143((v19 >> 3) & 0x1FFFFFFFFFFFFFF8);
    v26 = (uint64_t *)(v25 + 16 * v20);
    *v26 = v32;
    v26[1] = v33;
    sub_1C03B68B0(&v35, (_OWORD *)(v2[7] + 48 * v20));
    v27 = v2[2];
    v14 = __OFADD__(v27, 1);
    v28 = v27 + 1;
    if (v14)
      goto LABEL_34;
    v2[2] = v28;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

unint64_t sub_1C03BAFEC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  _OWORD *v26;
  _OWORD *v27;
  uint64_t *v28;
  _OWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[3];
  _OWORD v45[2];
  __int128 v46;
  _OWORD v47[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383A8);
    v2 = (_QWORD *)sub_1C03E4370();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v35 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v34 = (unint64_t)(63 - v3) >> 6;
  v6 = v47;
  v7 = v45;
  v8 = &v41;
  v9 = &v43;
  result = swift_bridgeObjectRetain();
  v36 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v37 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v36 << 6);
      }
      else
      {
        v12 = v36 + 1;
        if (__OFADD__(v36, 1))
          goto LABEL_34;
        if (v12 >= v34)
        {
LABEL_31:
          sub_1C03C3A1C();
          return (unint64_t)v2;
        }
        v13 = *(_QWORD *)(v35 + 8 * v12);
        v14 = v36 + 1;
        if (!v13)
        {
          v14 = v36 + 2;
          if (v36 + 2 >= v34)
            goto LABEL_31;
          v13 = *(_QWORD *)(v35 + 8 * v14);
          if (!v13)
          {
            v14 = v36 + 3;
            if (v36 + 3 >= v34)
              goto LABEL_31;
            v13 = *(_QWORD *)(v35 + 8 * v14);
            if (!v13)
            {
              v14 = v36 + 4;
              if (v36 + 4 >= v34)
                goto LABEL_31;
              v13 = *(_QWORD *)(v35 + 8 * v14);
              if (!v13)
              {
                v15 = v36 + 5;
                if (v36 + 5 >= v34)
                  goto LABEL_31;
                v13 = *(_QWORD *)(v35 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_35;
                    if (v14 >= v34)
                      goto LABEL_31;
                    v13 = *(_QWORD *)(v35 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_25;
                  }
                }
                v14 = v36 + 5;
              }
            }
          }
        }
LABEL_25:
        v36 = v14;
        v37 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1C03BA638(*(_QWORD *)(v1 + 56) + 32 * v11, (uint64_t)v6);
      *(_QWORD *)&v46 = v18;
      *((_QWORD *)&v46 + 1) = v17;
      v44[2] = v46;
      v45[0] = v47[0];
      v45[1] = v47[1];
      v39 = v18;
      v40 = v17;
      sub_1C03C3A0C(v7, &v38);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383D0);
      swift_dynamicCast();
      v20 = v39;
      v19 = v40;
      sub_1C03C3A0C(v8, v9);
      sub_1C03C3A0C(v9, v44);
      sub_1C03C3A0C(v44, &v42);
      result = sub_1C03B9B28(v20, v19);
      v21 = result;
      if ((v22 & 1) == 0)
        break;
      v23 = v9;
      v24 = v8;
      v25 = v1;
      v26 = v7;
      v27 = v6;
      v28 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v28 = v20;
      v28[1] = v19;
      v6 = v27;
      v7 = v26;
      v1 = v25;
      v8 = v24;
      v9 = v23;
      v29 = (_OWORD *)(v2[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
      result = (unint64_t)sub_1C03C3A0C(&v42, v29);
      v5 = v37;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    *v30 = v20;
    v30[1] = v19;
    result = (unint64_t)sub_1C03C3A0C(&v42, (_OWORD *)(v2[7] + 32 * result));
    v31 = v2[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_33;
    v2[2] = v33;
    v5 = v37;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

unint64_t sub_1C03BB38C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  _OWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  char v29[40];
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];
  _OWORD v35[3];
  __int128 v36[2];
  uint64_t v37;
  __int128 v38;
  _OWORD v39[2];
  uint64_t v40;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB90);
    v2 = (_QWORD *)sub_1C03E4370();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v9 = v8 | (v7 << 6);
      }
      else
      {
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_34;
        if (v10 >= v27)
        {
LABEL_31:
          sub_1C03C3A1C();
          return (unint64_t)v2;
        }
        v11 = *(_QWORD *)(v28 + 8 * v10);
        v12 = v7 + 1;
        if (!v11)
        {
          v12 = v7 + 2;
          if (v7 + 2 >= v27)
            goto LABEL_31;
          v11 = *(_QWORD *)(v28 + 8 * v12);
          if (!v11)
          {
            v12 = v7 + 3;
            if (v7 + 3 >= v27)
              goto LABEL_31;
            v11 = *(_QWORD *)(v28 + 8 * v12);
            if (!v11)
            {
              v12 = v7 + 4;
              if (v7 + 4 >= v27)
                goto LABEL_31;
              v11 = *(_QWORD *)(v28 + 8 * v12);
              if (!v11)
              {
                v13 = v7 + 5;
                if (v7 + 5 >= v27)
                  goto LABEL_31;
                v11 = *(_QWORD *)(v28 + 8 * v13);
                if (!v11)
                {
                  while (1)
                  {
                    v12 = v13 + 1;
                    if (__OFADD__(v13, 1))
                      goto LABEL_35;
                    if (v12 >= v27)
                      goto LABEL_31;
                    v11 = *(_QWORD *)(v28 + 8 * v12);
                    ++v13;
                    if (v11)
                      goto LABEL_25;
                  }
                }
                v12 = v7 + 5;
              }
            }
          }
        }
LABEL_25:
        v5 = (v11 - 1) & v11;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
        v7 = v12;
      }
      v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
      v16 = *v14;
      v15 = v14[1];
      sub_1C03C4A04(*(_QWORD *)(a1 + 56) + 40 * v9, (uint64_t)v39);
      *(_QWORD *)&v38 = v16;
      *((_QWORD *)&v38 + 1) = v15;
      v35[2] = v38;
      v36[0] = v39[0];
      v36[1] = v39[1];
      v37 = v40;
      v30 = v16;
      v31 = v15;
      sub_1C03ABB70(v36, (uint64_t)v29);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB98);
      swift_dynamicCast();
      v18 = v30;
      v17 = v31;
      sub_1C03C3A0C(&v32, v34);
      sub_1C03C3A0C(v34, v35);
      sub_1C03C3A0C(v35, &v33);
      result = sub_1C03B9B28(v18, v17);
      v19 = result;
      if ((v20 & 1) == 0)
        break;
      v21 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v21 = v18;
      v21[1] = v17;
      v22 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      result = (unint64_t)sub_1C03C3A0C(&v33, v22);
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v23 = (uint64_t *)(v2[6] + 16 * result);
    *v23 = v18;
    v23[1] = v17;
    result = (unint64_t)sub_1C03C3A0C(&v33, (_OWORD *)(v2[7] + 32 * result));
    v24 = v2[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_33;
    v2[2] = v26;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_1C03BB6F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  uint64_t *v9;
  __int128 *v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  __int128 *v28;
  uint64_t *v29;
  uint64_t v30;
  __int128 *v31;
  _OWORD *v32;
  uint64_t *v33;
  _OWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  __int128 v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49[4];
  _OWORD v50[3];
  __int128 v51;
  _OWORD v52[3];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D8);
    v2 = (_QWORD *)OUTLINED_FUNCTION_118();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v40 = v1 + 64;
  OUTLINED_FUNCTION_64_0();
  v5 = v4 & v3;
  v39 = (unint64_t)(63 - v6) >> 6;
  v7 = v52;
  v8 = v50;
  v9 = &v46;
  v10 = (__int128 *)&v48;
  OUTLINED_FUNCTION_13_3();
  v41 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v42 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v41 << 6);
      }
      else
      {
        v12 = v41 + 1;
        if (__OFADD__(v41, 1))
          goto LABEL_35;
        if (v12 >= v39)
        {
LABEL_32:
          sub_1C03C3A1C();
          return;
        }
        v13 = *(_QWORD *)(v40 + 8 * v12);
        v14 = v41 + 1;
        if (!v13)
        {
          OUTLINED_FUNCTION_140();
          if (v15 == v16)
            goto LABEL_32;
          OUTLINED_FUNCTION_161();
          if (!v13)
          {
            OUTLINED_FUNCTION_140();
            if (v15 == v16)
              goto LABEL_32;
            OUTLINED_FUNCTION_161();
            if (!v13)
            {
              OUTLINED_FUNCTION_140();
              if (v15 == v16)
                goto LABEL_32;
              OUTLINED_FUNCTION_161();
              if (!v13)
              {
                v18 = v17 + 4;
                if (v18 >= v39)
                  goto LABEL_32;
                v13 = *(_QWORD *)(v40 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    OUTLINED_FUNCTION_140();
                    if (v15 == v16)
                      goto LABEL_32;
                    OUTLINED_FUNCTION_161();
                    v18 = v19 + 1;
                    if (v13)
                      goto LABEL_26;
                  }
                  goto LABEL_36;
                }
                v14 = v18;
              }
            }
          }
        }
LABEL_26:
        v41 = v14;
        v42 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v22 = *v20;
      v21 = v20[1];
      sub_1C03C4A2C(*(_QWORD *)(v1 + 56) + 48 * v11, (uint64_t)v7);
      *(_QWORD *)&v51 = v22;
      *((_QWORD *)&v51 + 1) = v21;
      v49[3] = v51;
      v50[0] = v52[0];
      v50[1] = v52[1];
      v50[2] = v52[2];
      v44 = v22;
      v45 = v21;
      sub_1C03B68B0(v8, v43);
      OUTLINED_FUNCTION_6_5();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738378);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
      swift_dynamicCast();
      v23 = v44;
      v24 = v45;
      OUTLINED_FUNCTION_149();
      sub_1C03B68B0(v10, v49);
      sub_1C03B68B0(v49, &v47);
      v25 = sub_1C03B9B28(v23, v24);
      v26 = v25;
      if ((v27 & 1) == 0)
        break;
      v28 = v10;
      v29 = v9;
      v30 = v1;
      v31 = v8;
      v32 = v7;
      v33 = (uint64_t *)(v2[6] + 16 * v25);
      swift_bridgeObjectRelease();
      *v33 = v23;
      v33[1] = v24;
      v7 = v32;
      v8 = v31;
      v1 = v30;
      v9 = v29;
      v10 = v28;
      v34 = (_OWORD *)(v2[7] + 48 * v26);
      OUTLINED_FUNCTION_120();
      sub_1C03B68B0(&v47, v34);
      v5 = v42;
    }
    if (v2[2] >= v2[3])
      break;
    OUTLINED_FUNCTION_143((v25 >> 3) & 0x1FFFFFFFFFFFFFF8);
    v36 = (uint64_t *)(v35 + 16 * v26);
    *v36 = v23;
    v36[1] = v24;
    sub_1C03B68B0(&v47, (_OWORD *)(v2[7] + 48 * v26));
    v37 = v2[2];
    v16 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v16)
      goto LABEL_34;
    v2[2] = v38;
    v5 = v42;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void EventDrivenInteractionBuilder.__allocating_init(event:inAppIdentifier:deviceState:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 *v4;
  uint64_t v5;

  swift_allocObject();
  v4 = (__int128 *)OUTLINED_FUNCTION_107();
  EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(v4, v5, a3);
  OUTLINED_FUNCTION_28_0();
}

void EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(__int128 *a1, uint64_t a2, __int128 *a3)
{
  uint64_t v3;
  uint64_t v5;
  void (*v6)(uint64_t);

  sub_1C03ABB70(a1, v3 + 16);
  sub_1C03E3CF8();
  v5 = OUTLINED_FUNCTION_107();
  v6(v5);
  sub_1C03ABB70(a3, v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState);
  OUTLINED_FUNCTION_28_0();
}

uint64_t EventDrivenInteractionBuilder.build(requestId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4[27] = a3;
  v4[28] = v3;
  v4[25] = a1;
  v4[26] = a2;
  v5 = sub_1C03E3C68();
  v4[29] = v5;
  v4[30] = *(_QWORD *)(v5 - 8);
  v4[31] = OUTLINED_FUNCTION_3_0();
  v6 = sub_1C03E3D64();
  v4[32] = v6;
  v4[33] = *(_QWORD *)(v6 - 8);
  v4[34] = OUTLINED_FUNCTION_3_0();
  sub_1C03E302C();
  v4[35] = OUTLINED_FUNCTION_3_0();
  v7 = sub_1C03E3C20();
  v4[36] = v7;
  v4[37] = *(_QWORD *)(v7 - 8);
  v4[38] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7382A0);
  v4[39] = OUTLINED_FUNCTION_3_0();
  v8 = sub_1C03E3F20();
  v4[40] = v8;
  v4[41] = *(_QWORD *)(v8 - 8);
  v4[42] = OUTLINED_FUNCTION_27();
  v4[43] = OUTLINED_FUNCTION_3_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738278);
  v4[44] = OUTLINED_FUNCTION_27();
  v4[45] = OUTLINED_FUNCTION_3_3();
  v9 = sub_1C03E3C14();
  v4[46] = v9;
  v4[47] = *(_QWORD *)(v9 - 8);
  v4[48] = OUTLINED_FUNCTION_3_0();
  v10 = OUTLINED_FUNCTION_29();
  v4[49] = v10;
  v4[50] = *(_QWORD *)(v10 - 8);
  v4[51] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738290);
  v4[52] = OUTLINED_FUNCTION_27();
  v4[53] = OUTLINED_FUNCTION_3_3();
  v4[54] = OUTLINED_FUNCTION_3_3();
  v4[55] = OUTLINED_FUNCTION_3_3();
  v11 = sub_1C03E3050();
  v4[56] = v11;
  v4[57] = *(_QWORD *)(v11 - 8);
  v4[58] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BBC54()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t inited;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(void);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77[3];
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v1 = v0[57];
  v2 = v0[55];
  v3 = v0[28];
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState + 24);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState + 32);
  v76 = v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState), v4);
  MEMORY[0x1C3B99194](v4, v5);
  sub_1C03BC424();
  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  v75 = (_QWORD *)(v3 + 16);
  sub_1C03C4A04(v3 + 16, (uint64_t)(v0 + 14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738298);
  v6 = sub_1C03E3E24();
  OUTLINED_FUNCTION_33_1();
  v7 = OUTLINED_FUNCTION_47_1();
  __swift_storeEnumTagSinglePayload(v2, v7 ^ 1u, 1, v6);
  if (qword_1ED738B60 != -1)
    swift_once();
  v8 = v0[55];
  v10 = v0[50];
  v9 = v0[51];
  v11 = v0[49];
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1ED738B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
  OUTLINED_FUNCTION_88(v8, v13, &qword_1ED738290);
  v14 = OUTLINED_FUNCTION_101();
  v15 = sub_1C03E41F0();
  v16 = os_log_type_enabled(v14, v15);
  v17 = v0[54];
  if (v16)
  {
    v18 = v0[53];
    v19 = (uint8_t *)OUTLINED_FUNCTION_16();
    v77[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v19 = 136315138;
    sub_1C03C4960(v17, v18, &qword_1ED738290);
    v20 = OUTLINED_FUNCTION_75(v18);
    if ((_DWORD)v20 == 1)
    {
      OUTLINED_FUNCTION_26_2(v20, &qword_1ED738290);
      v21 = 0xE300000000000000;
      v22 = 7104878;
    }
    else
    {
      v26 = v0[48];
      v72 = v0[47];
      v73 = v0[46];
      sub_1C03E3E0C();
      OUTLINED_FUNCTION_35_1();
      v22 = sub_1C03E3BE4();
      v21 = v27;
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v26, v73);
    }
    v0[24] = sub_1C03B934C(v22, v21, v77);
    sub_1C03E4238();
    v28 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26_2(v28, &qword_1ED738290);
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v14, v15, "Building Interaction for OnInAppConnectionEvent with InAppDetails: %s", v19);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  v24 = v0[50];
  v23 = v0[51];
  v25 = v0[49];
  OUTLINED_FUNCTION_26_2(v16, &qword_1ED738290);

  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  v29 = v0[55];
  v30 = v0[52];
  v31 = v0[45];
  sub_1C03E3D40();
  OUTLINED_FUNCTION_54_0(v31, 1);
  sub_1C03C4960(v29, v30, &qword_1ED738290);
  v32 = OUTLINED_FUNCTION_75(v30);
  if ((_DWORD)v32 == 1)
  {
    v33 = v0[39];
    OUTLINED_FUNCTION_26_2(v32, &qword_1ED738290);
    OUTLINED_FUNCTION_54_0(v33, 1);
LABEL_13:
    sub_1C03ABAE4(v0[39], &qword_1ED7382A0);
    goto LABEL_14;
  }
  v34 = v0[47];
  v36 = v0[39];
  v35 = v0[40];
  sub_1C03E3E0C();
  OUTLINED_FUNCTION_35_1();
  sub_1C03E3BF0();
  OUTLINED_FUNCTION_172(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
  OUTLINED_FUNCTION_98(v36, 1, v35);
  if (v37)
    goto LABEL_13;
  v38 = v0[44];
  v74 = v0[45];
  v39 = v0[43];
  v40 = v0[40];
  v41 = v0[41];
  v42 = v0[38];
  v44 = v0[36];
  v43 = v0[37];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v41 + 32))(v39, v0[39], v40);
  OUTLINED_FUNCTION_109(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 16));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 104))(v42, *MEMORY[0x1E0DA5FB8], v44);
  sub_1C03E3D34();
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
  OUTLINED_FUNCTION_148(v74);
  OUTLINED_FUNCTION_54_0(v38, 0);
  sub_1C03C3EEC(v38, v74, &qword_1ED738278);
LABEL_14:
  v70 = v0[45];
  v71 = v0[44];
  v64 = v0[33];
  v65 = v0[34];
  v66 = v0[32];
  v67 = v0[30];
  v68 = v0[31];
  v45 = v0[28];
  v69 = v0[29];
  swift_bridgeObjectRetain();
  sub_1C03E3020();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  v46 = MEMORY[0x1E0DEA968];
  OUTLINED_FUNCTION_100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C03E56C0;
  *(_QWORD *)(inited + 32) = 0x746E657665;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v48 = *(_QWORD *)(v45 + 40);
  v49 = *(_QWORD *)(v45 + 48);
  v50 = __swift_project_boxed_opaque_existential_1(v75, v48);
  *(_QWORD *)(inited + 72) = v48;
  *(_QWORD *)(inited + 80) = *(_QWORD *)(v49 + 8);
  *(_QWORD *)(inited + 88) = *(_QWORD *)(v49 + 16);
  __swift_allocate_boxed_opaque_existential_2Tm((uint64_t *)(inited + 48));
  OUTLINED_FUNCTION_137(v51, (uint64_t)v50, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 16));
  OUTLINED_FUNCTION_100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383B0);
  sub_1C03E3C38();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1C03E56C0;
  v52 = sub_1C03E3CE0();
  v78 = v46;
  v79 = MEMORY[0x1E0DEA9A0];
  v80 = MEMORY[0x1E0DEA970];
  v77[0] = v52;
  v77[1] = v53;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104))(v65, *MEMORY[0x1E0DA6760], v66);
  sub_1C03E3C2C();
  sub_1C03C4A04(v76, (uint64_t)(v0 + 19));
  v54 = sub_1C03E3CE0();
  v56 = v55;
  v57 = sub_1C03E3FA4();
  v58 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA7648];
  OUTLINED_FUNCTION_19();
  v59 = MEMORY[0x1C3B995E4](v54, v56);
  v78 = v57;
  sub_1C03A858C(&qword_1ED7382A8, v58, MEMORY[0x1E0DA7640]);
  v79 = v60;
  v77[0] = v59;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v67 + 104))(v68, *MEMORY[0x1E0DA6190], v69);
  sub_1C03C4960(v70, v71, &qword_1ED738278);
  sub_1C03E3A64();
  sub_1C03ABAE4(v70, &qword_1ED738278);
  OUTLINED_FUNCTION_26_2(v61, &qword_1ED738290);
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_48();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_30();
  v62 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return v62();
}

unint64_t sub_1C03BC424()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;

  sub_1C03E3038();
  sub_1C03E3428();
  sub_1C03E3410();
  v0 = (void *)sub_1C03E341C();
  swift_release();
  v1 = sub_1C03E3404();

  v2 = sub_1C03BAFEC(v1);
  swift_bridgeObjectRelease();
  return v2;
}

void EventDrivenInteractionBuilder.deinit()
{
  uint64_t v0;
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = sub_1C03E3CF8();
  OUTLINED_FUNCTION_5(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport29EventDrivenInteractionBuilder_deviceState);
  OUTLINED_FUNCTION_7();
}

uint64_t EventDrivenInteractionBuilder.__deallocating_deinit()
{
  EventDrivenInteractionBuilder.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03BC510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return EventDrivenInteractionBuilder.build(requestId:)(a1, a2, a3);
}

BOOL static CatPropertyKeys.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CatPropertyKeys.hash(into:)()
{
  return sub_1C03E446C();
}

SiriSuggestionsSupport::CatPropertyKeys_optional __swiftcall CatPropertyKeys.init(stringValue:)(Swift::String stringValue)
{
  char *v1;
  void *object;
  char *v3;
  BOOL v4;
  uint64_t countAndFlagsBits;
  SiriSuggestionsSupport::CatPropertyKeys_optional result;
  char v7;
  char v9;

  object = stringValue._object;
  v3 = v1;
  v4 = stringValue._countAndFlagsBits == 0x69747265706F7270 && stringValue._object == (void *)0xEA00000000007365;
  if (v4 || (countAndFlagsBits = stringValue._countAndFlagsBits, (OUTLINED_FUNCTION_94() & 1) != 0))
  {
    result.value = OUTLINED_FUNCTION_10();
    v7 = 0;
  }
  else if (countAndFlagsBits == 0x614E656369766564 && object == (void *)0xEA0000000000656DLL)
  {
    result.value = OUTLINED_FUNCTION_10();
    v7 = 1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_94();
    result.value = OUTLINED_FUNCTION_10();
    if ((v9 & 1) != 0)
      v7 = 1;
    else
      v7 = 2;
  }
  *v3 = v7;
  return result;
}

SiriSuggestionsSupport::CatPropertyKeys_optional __swiftcall CatPropertyKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 2;
  return (SiriSuggestionsSupport::CatPropertyKeys_optional)intValue;
}

void CatPropertyKeys.hashValue.getter()
{
  OUTLINED_FUNCTION_139();
  sub_1C03E446C();
  sub_1C03E4478();
  OUTLINED_FUNCTION_138();
}

uint64_t CatPropertyKeys.intValue.getter()
{
  return 0;
}

uint64_t CatPropertyKeys.stringValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x614E656369766564;
  else
    return 0x69747265706F7270;
}

uint64_t sub_1C03BC734()
{
  sub_1C03C4A54();
  return sub_1C03E449C();
}

uint64_t sub_1C03BC75C()
{
  sub_1C03C4A54();
  return sub_1C03E44A8();
}

uint64_t sub_1C03BC784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[43] = a3;
  v4[44] = v3;
  v4[41] = a1;
  v4[42] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E08);
  v4[45] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD750);
  v4[46] = swift_task_alloc();
  v5 = sub_1C03E37C4();
  v4[47] = v5;
  v4[48] = *(_QWORD *)(v5 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  v4[50] = swift_task_alloc();
  v6 = sub_1C03E3914();
  v4[51] = v6;
  v4[52] = *(_QWORD *)(v6 - 8);
  v4[53] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738280);
  v4[54] = swift_task_alloc();
  v7 = sub_1C03E3D7C();
  v4[55] = v7;
  v4[56] = *(_QWORD *)(v7 - 8);
  v4[57] = swift_task_alloc();
  v8 = sub_1C03E3D70();
  v4[58] = v8;
  v4[59] = *(_QWORD *)(v8 - 8);
  v4[60] = swift_task_alloc();
  v4[61] = swift_task_alloc();
  v4[62] = swift_task_alloc();
  v9 = sub_1C03E3314();
  v4[63] = v9;
  v4[64] = *(_QWORD *)(v9 - 8);
  v4[65] = swift_task_alloc();
  v4[66] = swift_task_alloc();
  v4[67] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737DF8);
  v4[68] = swift_task_alloc();
  v4[69] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738218);
  v4[70] = swift_task_alloc();
  v4[71] = swift_task_alloc();
  v4[72] = swift_task_alloc();
  v4[73] = swift_task_alloc();
  v4[74] = swift_task_alloc();
  v4[75] = swift_task_alloc();
  v10 = sub_1C03E3C68();
  v4[76] = v10;
  v4[77] = *(_QWORD *)(v10 - 8);
  v4[78] = swift_task_alloc();
  v4[79] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738220);
  v4[80] = swift_task_alloc();
  v4[81] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03BCA4C()
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
  uint64_t (*v11)(void);

  v1 = v0[44];
  v0[82] = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  v0[83] = v2;
  v0[84] = swift_getObjectType();
  v0[85] = *(_QWORD *)(v2 + 16);
  v3 = (_QWORD *)OUTLINED_FUNCTION_32();
  v0[86] = v3;
  *v3 = v0;
  v3[1] = sub_1C03BCAE0;
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_11_5(v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_1C03BCAE0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BCB14(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v14;
  os_log_type_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  int *isa;
  objc_class *v20;
  uint64_t (*v21)(NSObject *, Class, Class, unint64_t, unint64_t, Class, Class);
  uint64_t v22;

  v3 = v1 + 8;
  v4 = v1 + 36;
  if (!v1[11].isa)
  {
    OUTLINED_FUNCTION_26_2(a1, &qword_1ED738380);
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  sub_1C03E38B4();
  OUTLINED_FUNCTION_174();
  if ((OUTLINED_FUNCTION_47_1() & 1) == 0)
  {
LABEL_10:
    v4->isa = 0;
    goto LABEL_11;
  }
  if (v4->isa)
  {
    if (qword_1ED738B60 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_45(v5, (uint64_t)qword_1ED738B68);
    v6 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_17(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_16();
      v8 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v7 = 136315138;
      v22 = v8;
      OUTLINED_FUNCTION_15_2();
      v1[38].isa = v4->isa;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD748);
      v9 = sub_1C03E40A0();
      v1[37].isa = (Class)sub_1C03B934C(v9, v10, &v22);
      OUTLINED_FUNCTION_84();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v1 + 8, v2, "using intent properties as: %s", v7);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_15_2();
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_102();
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
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_154();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v11 = OUTLINED_FUNCTION_112();
    return v12(v11);
  }
LABEL_11:
  if (qword_1ED738B60 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_29();
  v1[87].isa = (Class)__swift_project_value_buffer(v14, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_21_2();
  v15 = OUTLINED_FUNCTION_46();
  if (OUTLINED_FUNCTION_8_2(v15))
  {
    v16 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v16);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v17, v18, "No explicit intent properties set. Checking if there is anything from the flow");
    OUTLINED_FUNCTION_5_0();
  }
  isa = (int *)v1[85].isa;

  v21 = (uint64_t (*)(NSObject *, Class, Class, unint64_t, unint64_t, Class, Class))((char *)isa + *isa);
  v20 = (objc_class *)swift_task_alloc();
  v1[88].isa = v20;
  *(_QWORD *)v20 = v1;
  *((_QWORD *)v20 + 1) = sub_1C03BCEF8;
  return v21(v1 + 2, v1[41].isa, v1[42].isa, 0xD000000000000014, 0x80000001C03E66D0, v1[84].isa, v1[83].isa);
}

uint64_t sub_1C03BCEF8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BCF2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t *);
  uint64_t v15;
  char v16;
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
  int v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD, _QWORD);
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
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
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int EnumTagSinglePayload;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  os_log_type_t v120;
  uint8_t *v121;
  uint64_t v122;
  unint64_t v123;
  void (*v125)(uint64_t, _QWORD, uint64_t);
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;
  uint64_t v129;

  v2 = *(_QWORD *)(v1 + 648);
  if (*(_QWORD *)(v1 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    OUTLINED_FUNCTION_105();
    v3 = OUTLINED_FUNCTION_47_1() ^ 1;
    v4 = v2;
  }
  else
  {
    OUTLINED_FUNCTION_151(a1, &qword_1ED738380);
    v4 = v2;
    v3 = 1;
  }
  OUTLINED_FUNCTION_145(v4, v3);
  v5 = *(_QWORD *)(v1 + 344);
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v1 + 616) + 104);
  v6(*(_QWORD *)(v1 + 632), *MEMORY[0x1E0DA6198], *(_QWORD *)(v1 + 608));
  sub_1C03C4960(v5, v1 + 152, &qword_1ED738228);
  if (!*(_QWORD *)(v1 + 176))
  {
    sub_1C03ABAE4(v1 + 152, &qword_1ED738228);
    goto LABEL_42;
  }
  v125 = v6;
  v7 = *(_QWORD *)(v1 + 600);
  v8 = *(_QWORD *)(v1 + 592);
  v9 = *(_QWORD *)(v1 + 552);
  v10 = *(_QWORD *)(v1 + 536);
  v12 = *(uint64_t **)(v1 + 504);
  v11 = *(_QWORD *)(v1 + 512);
  sub_1C03ABB70((__int128 *)(v1 + 152), v1 + 112);
  v127 = (_QWORD *)(v1 + 112);
  v13 = v10;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 136));
  sub_1C03E39B0();
  v14 = *(void (**)(uint64_t, _QWORD, uint64_t *))(v11 + 104);
  v14(v8, *MEMORY[0x1E0DA7D10], v12);
  __swift_storeEnumTagSinglePayload(v8, 0, 1, (uint64_t)v12);
  v15 = v9 + *(int *)(v10 + 48);
  OUTLINED_FUNCTION_97(v7, v9);
  OUTLINED_FUNCTION_97(v8, v15);
  OUTLINED_FUNCTION_98(v9, 1, (uint64_t)v12);
  if (v16)
  {
    v17 = *(_QWORD *)(v1 + 504);
    sub_1C03ABAE4(*(_QWORD *)(v1 + 592), &qword_1ED738218);
    OUTLINED_FUNCTION_98(v15, 1, v17);
    if (!v16)
      goto LABEL_13;
    sub_1C03ABAE4(*(_QWORD *)(v1 + 552), &qword_1ED738218);
  }
  else
  {
    sub_1C03C4960(*(_QWORD *)(v1 + 552), *(_QWORD *)(v1 + 584), &qword_1ED738218);
    v18 = OUTLINED_FUNCTION_76(v15);
    v19 = *(_QWORD *)(v1 + 592);
    v20 = *(_QWORD *)(v1 + 584);
    if ((_DWORD)v18 == 1)
    {
      v21 = *(_QWORD *)(v1 + 512);
      OUTLINED_FUNCTION_151(v18, &qword_1ED738218);
      OUTLINED_FUNCTION_128(v20, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
LABEL_13:
      sub_1C03ABAE4(*(_QWORD *)(v1 + 552), &qword_1ED737DF8);
      goto LABEL_14;
    }
    v42 = *(_QWORD *)(v1 + 552);
    v43 = *(_QWORD *)(v1 + 528);
    v44 = *(_QWORD *)(v1 + 504);
    v45 = *(_QWORD *)(v1 + 512);
    OUTLINED_FUNCTION_133(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 32));
    sub_1C03A858C(&qword_1EF5FDB60, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA7D50], MEMORY[0x1E0DA7D60]);
    v46 = OUTLINED_FUNCTION_61_0();
    v47 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v47(v43, v44);
    v12 = &qword_1ED738218;
    OUTLINED_FUNCTION_110(v19);
    v47(v20, v44);
    OUTLINED_FUNCTION_110(v42);
    if ((v46 & 1) == 0)
    {
LABEL_14:
      v22 = *(_QWORD *)(v1 + 600);
      v23 = *(_QWORD *)(v1 + 576);
      v24 = *(_QWORD *)(v1 + 544);
      v25 = *(_QWORD *)(v1 + 504);
      v14(v23, *MEMORY[0x1E0DA7D08], (uint64_t *)v25);
      __swift_storeEnumTagSinglePayload(v23, 0, 1, v25);
      v26 = v24 + *(int *)(v13 + 48);
      OUTLINED_FUNCTION_97(v22, v24);
      OUTLINED_FUNCTION_97(v23, v26);
      OUTLINED_FUNCTION_98(v24, 1, v25);
      if (v16)
      {
        v27 = *(_QWORD *)(v1 + 504);
        sub_1C03ABAE4(*(_QWORD *)(v1 + 576), &qword_1ED738218);
        OUTLINED_FUNCTION_98(v26, 1, v27);
        if (!v16)
          goto LABEL_21;
        sub_1C03ABAE4(*(_QWORD *)(v1 + 544), &qword_1ED738218);
      }
      else
      {
        sub_1C03C4960(*(_QWORD *)(v1 + 544), *(_QWORD *)(v1 + 568), &qword_1ED738218);
        v28 = OUTLINED_FUNCTION_76(v26);
        v29 = *(_QWORD *)(v1 + 576);
        v30 = *(_QWORD *)(v1 + 568);
        if ((_DWORD)v28 == 1)
        {
          v31 = *(_QWORD *)(v1 + 512);
          OUTLINED_FUNCTION_151(v28, &qword_1ED738218);
          OUTLINED_FUNCTION_128(v30, *(uint64_t (**)(uint64_t, uint64_t))(v31 + 8));
LABEL_21:
          sub_1C03ABAE4(*(_QWORD *)(v1 + 544), &qword_1ED737DF8);
LABEL_22:
          v32 = *(_QWORD *)(v1 + 464);
          v33 = *(_QWORD *)(v1 + 432);
          __swift_project_boxed_opaque_existential_1(v127, *(_QWORD *)(v1 + 136));
          sub_1C03E39A4();
          v34 = OUTLINED_FUNCTION_76(v33);
          v35 = *(NSObject **)(v1 + 696);
          if (v34 == 1)
          {
            sub_1C03ABAE4(*(_QWORD *)(v1 + 432), &qword_1ED738280);
            sub_1C03E4010();
            v36 = OUTLINED_FUNCTION_55_0();
            if (OUTLINED_FUNCTION_17(v36))
            {
              v37 = (uint8_t *)OUTLINED_FUNCTION_16();
              *(_WORD *)v37 = 0;
              OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v35, (os_log_type_t)v32, "No explicit turnState is provided. Assuming taskComplete initated from the user", v37);
              OUTLINED_FUNCTION_5_0();
            }
            v38 = *(_QWORD *)(v1 + 496);
            v40 = *(_QWORD *)(v1 + 464);
            v39 = *(_QWORD *)(v1 + 472);

            v41 = OUTLINED_FUNCTION_169();
            OUTLINED_FUNCTION_30_2(v41);
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v39 + 104))(v38, *MEMORY[0x1E0DA67D0], v40);
          }
          else
          {
            v40 = *(_QWORD *)(v1 + 488);
            v50 = *(_QWORD *)(v1 + 472);
            v51 = *(void (**)(uint64_t, _QWORD, _QWORD))(v50 + 32);
            v51(v40, *(_QWORD *)(v1 + 432), *(_QWORD *)(v1 + 464));
            OUTLINED_FUNCTION_109(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 16));
            v52 = sub_1C03E4010();
            v53 = sub_1C03E41F0();
            if (OUTLINED_FUNCTION_178(v52))
            {
              v54 = (uint8_t *)OUTLINED_FUNCTION_16();
              OUTLINED_FUNCTION_16();
              *(_DWORD *)v54 = 136315138;
              sub_1C03A858C(&qword_1EF5FDB58, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA67E0], MEMORY[0x1E0DA67F0]);
              v55 = sub_1C03E43E8();
              *(_QWORD *)(v1 + 320) = OUTLINED_FUNCTION_173(v55, v56);
              sub_1C03E4238();
              OUTLINED_FUNCTION_31();
              OUTLINED_FUNCTION_123();
              OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v52, v53, "Using explicit turnState from requestState: %s", v54);
              OUTLINED_FUNCTION_27_0();
              OUTLINED_FUNCTION_5_0();
            }
            OUTLINED_FUNCTION_123();

            v51(*(_QWORD *)(v1 + 496), *(_QWORD *)(v1 + 488), *(_QWORD *)(v1 + 464));
          }
          v71 = *(_QWORD *)(v1 + 560);
          v72 = *(_QWORD *)(v1 + 504);
          sub_1C03C4960(*(_QWORD *)(v1 + 600), v71, &qword_1ED738218);
          OUTLINED_FUNCTION_98(v71, 1, v72);
          if (v16)
          {
            v73 = *(NSObject **)(v1 + 696);
            sub_1C03ABAE4(*(_QWORD *)(v1 + 560), &qword_1ED738218);
            sub_1C03E4010();
            v74 = OUTLINED_FUNCTION_55_0();
            if (OUTLINED_FUNCTION_17(v74))
            {
              v75 = (uint8_t *)OUTLINED_FUNCTION_16();
              *(_WORD *)v75 = 0;
              OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v73, (os_log_type_t)v40, "No explicit requestInputOrigin is provided. Assuming modality is voice", v75);
              OUTLINED_FUNCTION_5_0();
            }
            v77 = *(_QWORD *)(v1 + 448);
            v76 = *(_QWORD *)(v1 + 456);
            v78 = *(_QWORD *)(v1 + 440);

            (*(void (**)(uint64_t, _QWORD, uint64_t))(v77 + 104))(v76, *MEMORY[0x1E0DA6840], v78);
          }
          else
          {
            v79 = *(_QWORD *)(v1 + 512);
            OUTLINED_FUNCTION_165(*(_QWORD *)(v1 + 560), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 32));
            sub_1C03BDD3C();
            OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
          }
          goto LABEL_38;
        }
        v57 = *(_QWORD *)(v1 + 544);
        v58 = *(_QWORD *)(v1 + 528);
        v60 = *(_QWORD *)(v1 + 504);
        v59 = *(_QWORD *)(v1 + 512);
        OUTLINED_FUNCTION_133(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 32));
        sub_1C03A858C(&qword_1EF5FDB60, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA7D50], MEMORY[0x1E0DA7D60]);
        v61 = OUTLINED_FUNCTION_61_0();
        v62 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
        v62(v58, v60);
        OUTLINED_FUNCTION_110(v29);
        v62(v30, v60);
        OUTLINED_FUNCTION_110(v57);
        if ((v61 & 1) == 0)
          goto LABEL_22;
      }
      v63 = *(_QWORD *)(v1 + 496);
      v65 = *(_QWORD *)(v1 + 464);
      v64 = *(_QWORD *)(v1 + 472);
      v66 = *(_QWORD *)(v1 + 448);
      v67 = *(_QWORD *)(v1 + 456);
      v68 = *(_QWORD *)(v1 + 440);
      v69 = *MEMORY[0x1E0DA68D8];
      v70 = OUTLINED_FUNCTION_169();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 104))(v63, v69, v70);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104))(v63, *MEMORY[0x1E0DA67D0], v65);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v66 + 104))(v67, *MEMORY[0x1E0DA6840], v68);
LABEL_38:
      v80 = *(_QWORD *)(v1 + 632);
      v81 = *(_QWORD *)(v1 + 608);
      v82 = *(_QWORD *)(v1 + 472);
      v84 = *(_QWORD *)(v1 + 448);
      v83 = *(_QWORD *)(v1 + 456);
      v12 = *(uint64_t **)(v1 + 440);
      OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 616) + 8));
      v85 = v80 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB48) + 48);
      OUTLINED_FUNCTION_79(v80, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 32));
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(v84 + 32))(v85, v83, v12);
      v125(v80, *MEMORY[0x1E0DA6180], v81);
      goto LABEL_39;
    }
  }
  v48 = *(_QWORD *)(v1 + 632);
  v49 = *(_QWORD *)(v1 + 616);
  sub_1C03E3C5C();
  OUTLINED_FUNCTION_79(v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 40));
LABEL_39:
  v86 = sub_1C03E4010();
  v87 = sub_1C03E41E4();
  if (OUTLINED_FUNCTION_115(v87))
  {
    v88 = (uint8_t *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();
    *(_DWORD *)v88 = 136315138;
    OUTLINED_FUNCTION_174();
    OUTLINED_FUNCTION_15_2();
    sub_1C03A858C(&qword_1EF5FDB50, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA61A8], MEMORY[0x1E0DA61C8]);
    v89 = sub_1C03E43E8();
    *(_QWORD *)(v1 + 312) = OUTLINED_FUNCTION_173(v89, v90);
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v86, (os_log_type_t)v12, "Inferred invocationType as: %s", v88);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  v91 = *(_QWORD *)(v1 + 600);

  sub_1C03ABAE4(v91, &qword_1ED738218);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v127);
LABEL_42:
  v92 = *(_QWORD *)(v1 + 640);
  v93 = *(_QWORD *)(v1 + 632);
  v94 = *(_QWORD *)(v1 + 624);
  v95 = *(_QWORD *)(v1 + 616);
  v96 = *(_QWORD *)(v1 + 608);
  v126 = *(_QWORD *)(v1 + 648);
  v128 = *(_QWORD *)(v1 + 376);
  OUTLINED_FUNCTION_15_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16))(v94, v93, v96);
  sub_1C03E2FFC();
  sub_1C03E38D8();
  OUTLINED_FUNCTION_88(v126, v97, &qword_1ED738220);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v92, 1, v128);
  v100 = *(_QWORD *)(v1 + 416);
  v99 = *(_QWORD *)(v1 + 424);
  if (EnumTagSinglePayload == 1)
  {
    v102 = *(_QWORD *)(v1 + 360);
    v101 = *(_QWORD *)(v1 + 368);
    sub_1C03ABAE4(*(_QWORD *)(v1 + 640), &qword_1ED738220);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    sub_1C03E404C();
    sub_1C03E3F5C();
    sub_1C03E3BC0();
    sub_1C03A858C(&qword_1EF5FD7B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5F30], MEMORY[0x1E0DA5F28]);
    OUTLINED_FUNCTION_137(v101, v99, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v100 + 16));
    v103 = OUTLINED_FUNCTION_131(v101);
    OUTLINED_FUNCTION_142(v102, v104, v105, v103);
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_11();
    v106 = sub_1C03E3878();
  }
  else
  {
    v108 = *(_QWORD *)(v1 + 384);
    v107 = *(_QWORD *)(v1 + 392);
    v109 = *(_QWORD *)(v1 + 368);
    v110 = *(_QWORD *)(v1 + 360);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v108 + 32))(v107, *(_QWORD *)(v1 + 640), *(_QWORD *)(v1 + 376));
    sub_1C03BDF98(v107);
    sub_1C03E37AC();
    sub_1C03E37B8();
    OUTLINED_FUNCTION_137(v109, v99, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v100 + 16));
    v111 = OUTLINED_FUNCTION_131(v109);
    OUTLINED_FUNCTION_142(v110, v112, v113, v111);
    OUTLINED_FUNCTION_19();
    v106 = sub_1C03E3878();
    OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v108 + 8));
  }
  v114 = OUTLINED_FUNCTION_33_1();
  v115(v114);
  v116 = *(_QWORD *)(v1 + 616);
  v117 = *(_QWORD *)(v1 + 608);
  *(_QWORD *)(v1 + 288) = v106;
  swift_release();
  v118 = OUTLINED_FUNCTION_172(*(uint64_t (**)(uint64_t, uint64_t))(v116 + 8));
  OUTLINED_FUNCTION_41_1(v118, &qword_1ED738220);
  if (qword_1ED738B60 != -1)
    swift_once();
  v119 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v119, (uint64_t)qword_1ED738B68);
  v120 = OUTLINED_FUNCTION_46();
  if (OUTLINED_FUNCTION_17(v120))
  {
    v121 = (uint8_t *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();
    *(_DWORD *)v121 = 136315138;
    OUTLINED_FUNCTION_15_2();
    *(_QWORD *)(v1 + 304) = *(_QWORD *)(v1 + 288);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD748);
    v122 = OUTLINED_FUNCTION_166();
    *(_QWORD *)(v1 + 296) = OUTLINED_FUNCTION_173(v122, v123);
    OUTLINED_FUNCTION_114();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v106, (os_log_type_t)v117, "using intent properties as: %s", v121);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_15_2();
  v129 = *(_QWORD *)(v1 + 288);
  OUTLINED_FUNCTION_102();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
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
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_154();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v129);
}

void sub_1C03BDD3C()
{
  os_log_type_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  int v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_1C03E3314();
  v2 = *(void (**)(uint64_t))(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_176((uint64_t)&v21 - v6);
  v7 = OUTLINED_FUNCTION_107();
  v9 = v8(v7);
  if (v9 == *MEMORY[0x1E0DA7D28]
    || v9 == *MEMORY[0x1E0DA7CD0]
    || (v9 != *MEMORY[0x1E0DA7CE0] ? (v10 = v9 == *MEMORY[0x1E0DA7CE8]) : (v10 = 1),
        !v10 ? (v11 = v9 == *MEMORY[0x1E0DA7CF8]) : (v11 = 1),
        v11))
  {
    v12 = sub_1C03E3D7C();
    OUTLINED_FUNCTION_30_2(v12);
  }
  else
  {
    if (qword_1ED738B60 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED738B68);
    OUTLINED_FUNCTION_176((uint64_t)v5);
    v14 = sub_1C03E4010();
    v15 = sub_1C03E41FC();
    if (OUTLINED_FUNCTION_115(v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_16();
      v22 = OUTLINED_FUNCTION_16();
      v24 = v22;
      *(_DWORD *)v16 = 136315138;
      v21 = v16 + 4;
      v17 = sub_1C03E3308();
      v23 = sub_1C03B934C(v17, v18, &v24);
      OUTLINED_FUNCTION_84();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_95();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v14, v0, "Unknown input origin of %s. Defaulting to voiced input", v16);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_95();

    v19 = sub_1C03E3D7C();
    OUTLINED_FUNCTION_30_2(v19);
    v20 = OUTLINED_FUNCTION_107();
    v2(v20);
  }
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03BDF98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint8_t *v59;
  uint8_t *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[6];
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738238);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C03E3C80();
  v66 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C03E37C4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = a1;
  v12 = sub_1C03E37A0();
  v77 = v12;
  swift_bridgeObjectRetain();
  v13 = sub_1C03E3A4C();
  sub_1C03C5330(v13, v14, v12, &v70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v71)
  {
    sub_1C03B68B0(&v70, &v73);
    if (qword_1ED738B60 != -1)
      swift_once();
    v15 = sub_1C03E4028();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED738B68);
    sub_1C03C4A2C((uint64_t)&v73, (uint64_t)&v70);
    v16 = sub_1C03E4010();
    v17 = sub_1C03E41E4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v69 = v19;
      *(_DWORD *)v18 = 136315138;
      sub_1C03C4A2C((uint64_t)&v70, (uint64_t)v68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
      v20 = sub_1C03E40A0();
      v68[0] = sub_1C03B934C(v20, v21, &v69);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
      _os_log_impl(&dword_1C03A5000, v16, v17, "Conversational continuer intent property of: %s already detected", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B99F38](v19, -1, -1);
      MEMORY[0x1C3B99F38](v18, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v73);
  }
  else
  {
    v63 = v4;
    v64 = v7;
    sub_1C03ABAE4((uint64_t)&v70, &qword_1ED738380);
    if (qword_1ED738B60 != -1)
      swift_once();
    v22 = sub_1C03E4028();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED738B68);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v67, v8);
    v23 = sub_1C03E4010();
    v24 = sub_1C03E41E4();
    v25 = os_log_type_enabled(v23, v24);
    v65 = v5;
    if (v25)
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      *(_QWORD *)&v70 = v62;
      *(_DWORD *)v26 = 136315138;
      v61 = v26 + 4;
      sub_1C03E37B8();
      v27 = v74;
      v28 = v75;
      __swift_project_boxed_opaque_existential_1(&v73, v74);
      v29 = MEMORY[0x1C3B9950C](v27, v28);
      v31 = v30;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v73);
      *(_QWORD *)&v73 = sub_1C03B934C(v29, v31, (uint64_t *)&v70);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      _os_log_impl(&dword_1C03A5000, v23, v24, "Adding conversational continuer intent property of: %s", v26, 0xCu);
      v32 = v62;
      swift_arrayDestroy();
      MEMORY[0x1C3B99F38](v32, -1, -1);
      MEMORY[0x1C3B99F38](v26, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }

    sub_1C03E3A4C();
    sub_1C03E37B8();
    v33 = v71;
    v34 = v72;
    __swift_project_boxed_opaque_existential_1(&v70, v71);
    v35 = MEMORY[0x1C3B9950C](v33, v34);
    v74 = MEMORY[0x1E0DEA968];
    v75 = MEMORY[0x1E0DEA9A0];
    v76 = MEMORY[0x1E0DEA970];
    *(_QWORD *)&v73 = v35;
    *((_QWORD *)&v73 + 1) = v36;
    sub_1C03BAC94((uint64_t)&v73);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    v5 = v65;
    v7 = v64;
    v4 = v63;
  }
  v37 = sub_1C03E3A40();
  sub_1C03C5330(v37, v38, v77, &v70);
  swift_bridgeObjectRelease();
  if (v71)
  {
    sub_1C03B68B0(&v70, &v73);
    if (qword_1ED738B60 != -1)
      swift_once();
    v39 = sub_1C03E4028();
    __swift_project_value_buffer(v39, (uint64_t)qword_1ED738B68);
    sub_1C03C4A2C((uint64_t)&v73, (uint64_t)&v70);
    v40 = sub_1C03E4010();
    v41 = sub_1C03E41E4();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v69 = v43;
      *(_DWORD *)v42 = 136315138;
      sub_1C03C4A2C((uint64_t)&v70, (uint64_t)v68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
      v44 = sub_1C03E40A0();
      v68[0] = sub_1C03B934C(v44, v45, &v69);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
      _os_log_impl(&dword_1C03A5000, v40, v41, "ExecutedAppIntentBundleId property of: %s already detected", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B99F38](v43, -1, -1);
      MEMORY[0x1C3B99F38](v42, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v73);
  }
  else
  {
    sub_1C03ABAE4((uint64_t)&v70, &qword_1ED738380);
    sub_1C03E3794();
    v46 = sub_1C03E3B84();
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v46) == 1)
    {
      sub_1C03ABAE4((uint64_t)v4, &qword_1ED738238);
    }
    else
    {
      v47 = *(_QWORD *)(v46 - 8);
      if ((*(unsigned int (**)(char *, uint64_t))(v47 + 88))(v4, v46) == *MEMORY[0x1E0DA5D10])
      {
        (*(void (**)(char *, uint64_t))(v47 + 96))(v4, v46);
        v48 = v66;
        (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v7, v4, v5);
        v49 = sub_1C03E3C74();
        v51 = v5;
        if (v50)
        {
          v52 = v49;
          v53 = v50;
          v65 = v51;
          if (qword_1ED738B60 != -1)
            swift_once();
          v54 = sub_1C03E4028();
          __swift_project_value_buffer(v54, (uint64_t)qword_1ED738B68);
          swift_bridgeObjectRetain_n();
          v55 = sub_1C03E4010();
          v56 = sub_1C03E41E4();
          if (os_log_type_enabled(v55, v56))
          {
            v57 = (uint8_t *)swift_slowAlloc();
            v58 = swift_slowAlloc();
            *(_QWORD *)&v73 = v58;
            *(_DWORD *)v57 = 136315138;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v70 = sub_1C03B934C(v52, v53, (uint64_t *)&v73);
            sub_1C03E4238();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C03A5000, v55, v56, "Adding ExecutedAppIntentBundleId property of: %s", v57, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C3B99F38](v58, -1, -1);
            v59 = v57;
            v48 = v66;
            MEMORY[0x1C3B99F38](v59, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_1C03E3A40();
          v74 = MEMORY[0x1E0DEA968];
          v75 = MEMORY[0x1E0DEA9A0];
          v76 = MEMORY[0x1E0DEA970];
          *(_QWORD *)&v73 = v52;
          *((_QWORD *)&v73 + 1) = v53;
          sub_1C03BAC94((uint64_t)&v73);
          (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v65);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v5);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v4, v46);
      }
    }
  }
  return v77;
}

uint64_t sub_1C03BE934(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB18);
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03BE994()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_74();
  sub_1C03E3770();
  *(_QWORD *)(v0 + 176) = v1;
  v2 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v0 + 184) = v2;
  *v2 = v0;
  v2[1] = sub_1C03BEA08;
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_90();
  return v7(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C03BEA08()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_70();
  *(_QWORD *)(v1 + 192) = v0;
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BEA48()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = v0[20];
  v2 = v0[21];
  v4 = v0[18];
  v3 = v0[19];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB20);
  OUTLINED_FUNCTION_53_1(v2, v6, v7, v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_36();
  v0[25] = v8;
  v8[2] = v1;
  v8[3] = v4;
  v8[4] = v3;
  swift_retain();
  OUTLINED_FUNCTION_6_5();
  v9 = (_QWORD *)OUTLINED_FUNCTION_103();
  v0[26] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAD0);
  *v9 = v0;
  v9[1] = sub_1C03BEB14;
  return sub_1C03E3C8C();
}

uint64_t sub_1C03BEB14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_58_0();
  v2 = *(_QWORD *)(v1 + 168);
  OUTLINED_FUNCTION_70();
  *(_QWORD *)(v4 + 216) = v3;
  *(_QWORD *)(v4 + 224) = v0;
  OUTLINED_FUNCTION_82();
  swift_release();
  OUTLINED_FUNCTION_71();
  sub_1C03ABAE4(v2, &qword_1EF5FDB18);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_9_4();
}

uint64_t sub_1C03BEB80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1E0DEE9D8];
    do
    {
      sub_1C03C4960(v3, v0 + 16, &qword_1EF5FDAD0);
      v5 = OUTLINED_FUNCTION_33_1();
      sub_1C03C3EEC(v5, v6, &qword_1EF5FDAD0);
      if (*(_QWORD *)(v0 + 88))
      {
        v13 = *(_OWORD *)(v0 + 80);
        v14 = *(_OWORD *)(v0 + 96);
        v15 = *(_OWORD *)(v0 + 112);
        v16 = *(_OWORD *)(v0 + 128);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_144();
          v4 = v9;
        }
        v7 = *(_QWORD *)(v4 + 16);
        if (v7 >= *(_QWORD *)(v4 + 24) >> 1)
        {
          OUTLINED_FUNCTION_144();
          v4 = v10;
        }
        *(_QWORD *)(v4 + 16) = v7 + 1;
        v8 = (_OWORD *)(v4 + (v7 << 6));
        v8[4] = v15;
        v8[5] = v16;
        v8[2] = v13;
        v8[3] = v14;
      }
      else
      {
        sub_1C03ABAE4(v0 + 80, &qword_1EF5FDAD0);
      }
      v3 += 64;
      --v2;
    }
    while (v2);
    OUTLINED_FUNCTION_14_2();
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x1E0DEE9D8];
  }
  v11 = sub_1C03BEFA0(v4);
  OUTLINED_FUNCTION_30();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
}

uint64_t sub_1C03BECE0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[22] = a2;
  v4[23] = a3;
  v5 = *a1;
  v6 = a1[1];
  v4[24] = a4;
  v4[25] = v5;
  v4[26] = v6;
  return swift_task_switch();
}

uint64_t sub_1C03BED04()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
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
  uint64_t v15;
  uint64_t (*v17)(uint64_t);

  sub_1C03E3770();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_132();
  v4 = sub_1C03BEF54(v1, v2, v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_31();
  v11 = MEMORY[0x1C3B99704](v4, v6, v8, v10);
  v13 = v12;
  v0[20] = v11;
  v0[21] = v12;
  OUTLINED_FUNCTION_57();
  v0[27] = v13;
  swift_getObjectType();
  v14 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  v0[28] = v14;
  *v14 = v0;
  v14[1] = sub_1C03BEE1C;
  v15 = OUTLINED_FUNCTION_117();
  return v17(v15);
}

uint64_t sub_1C03BEE1C()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BEE50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_88(v0 + 16, v1, &qword_1ED738380);
  v2 = *(_QWORD *)(v0 + 216);
  if (*(_QWORD *)(v0 + 136))
  {
    v3 = *(_QWORD *)(v0 + 160);
    sub_1C03B68B0((__int128 *)(v0 + 112), (_OWORD *)(v0 + 64));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB40);
    v4 = OUTLINED_FUNCTION_36();
    *(_OWORD *)(v4 + 16) = xmmword_1C03E56C0;
    *(_QWORD *)(v4 + 32) = v3;
    *(_QWORD *)(v4 + 40) = v2;
    sub_1C03C4A2C(v0 + 64, v4 + 48);
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  }
  else
  {
    OUTLINED_FUNCTION_71();
    v5 = OUTLINED_FUNCTION_33_1();
    sub_1C03ABAE4(v5, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB40);
    v7 = (_OWORD *)OUTLINED_FUNCTION_36();
    v7[1] = xmmword_1C03E56C0;
    v7[2] = 0u;
    v7[3] = 0u;
    v7[4] = 0u;
    v7[5] = 0u;
  }
  sub_1C03ABAE4(v0 + 16, &qword_1ED738380);
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_90();
  return v9(v8, v9, v10, v11, v12, v13, v14, v15);
}

unint64_t sub_1C03BEF54(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_1C03E40E8();
  __break(1u);
  return result;
}

uint64_t sub_1C03BEFA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D8);
    v3 = sub_1C03E4370();
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9E0];
  }
  v6 = v3;
  sub_1C03C4748(a1, 1, &v6);
  v4 = v6;
  if (v1)
    swift_release();
  return v4;
}

uint64_t sub_1C03BF02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return swift_task_switch();
}

uint64_t sub_1C03BF048()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_80();
  v1 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_1C03BF0C4;
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_11_5(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1C03BF0C4()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BF0F8(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;
  os_log_type_t v11;
  _WORD *v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  objc_class *v16;

  if (v2[5].isa)
  {
    v1 = v2 + 8;
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDBA0);
    if ((OUTLINED_FUNCTION_19_2() & 1) != 0)
    {
      if (qword_1ED738B60 != -1)
        swift_once();
      v4 = OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_45(v4, (uint64_t)qword_1ED738B68);
      v5 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_23_1(v5))
      {
        v6 = (uint8_t *)OUTLINED_FUNCTION_16();
        *(_WORD *)v6 = 0;
        OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v2 + 8, v3, "Using salient entities from client", v6);
        OUTLINED_FUNCTION_5_0();
      }

      v7 = OUTLINED_FUNCTION_112();
      return OUTLINED_FUNCTION_38_0(v7, v8);
    }
  }
  else
  {
    OUTLINED_FUNCTION_41_1(a1, &qword_1ED738380);
  }
  if (qword_1ED738B60 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v10, (uint64_t)qword_1ED738B68);
  v11 = OUTLINED_FUNCTION_85();
  if (OUTLINED_FUNCTION_8_2(v11))
  {
    v12 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v12);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v13, v14, "No salient entities sent from client. Computing directly");
    OUTLINED_FUNCTION_5_0();
  }
  isa = v2[11].isa;

  __swift_project_boxed_opaque_existential_1((_QWORD *)isa + 4, *((_QWORD *)isa + 7));
  v16 = (objc_class *)swift_task_alloc();
  v2[13].isa = v16;
  *(_QWORD *)v16 = v2;
  *((_QWORD *)v16 + 1) = sub_1C03BF2AC;
  OUTLINED_FUNCTION_33_1();
  return sub_1C03E3938();
}

uint64_t sub_1C03BF2AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_6_2();
  v4 = OUTLINED_FUNCTION_6_1();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_38_0(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1C03BF2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v4 = sub_1C03E3854();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03BF34C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_80();
  v1 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_1C03BF3C0;
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_11_5(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1C03BF3C0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BF3F4(uint64_t a1)
{
  os_log_type_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  os_log_type_t v9;
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;

  v3 = (void *)(v2 + 16);
  if (*(_QWORD *)(v2 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    OUTLINED_FUNCTION_174();
    if ((OUTLINED_FUNCTION_47_1() & 1) != 0)
    {
      if (qword_1ED738B60 != -1)
        swift_once();
      v4 = OUTLINED_FUNCTION_29();
      v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED738B68);
      OUTLINED_FUNCTION_21_2();
      v6 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_23_1(v6))
      {
        v7 = (uint8_t *)OUTLINED_FUNCTION_16();
        *(_WORD *)v7 = 0;
        OUTLINED_FUNCTION_22_2(&dword_1C03A5000, (v2 + 16), v1, "Deserialising catglobals from statestore", v7);
        OUTLINED_FUNCTION_5_0();
      }

      sub_1C03E2F30();
      OUTLINED_FUNCTION_19();
      sub_1C03E2F24();
      sub_1C03A858C(&qword_1EF5FDB78, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA54E0], MEMORY[0x1E0DA54E8]);
      sub_1C03E2F18();
      v15 = sub_1C03E3848();
      v16 = sub_1C03BB38C(v15);
      OUTLINED_FUNCTION_71();
      v29 = v16;
      v17 = sub_1C03E383C();
      if (v18)
      {
        v19 = v17;
        v20 = v18;
        OUTLINED_FUNCTION_11_2();
        sub_1C03E4010();
        v21 = OUTLINED_FUNCTION_46();
        if (os_log_type_enabled(v5, v21))
        {
          v28 = v19;
          v22 = (uint8_t *)OUTLINED_FUNCTION_16();
          *(_QWORD *)&v30 = OUTLINED_FUNCTION_16();
          *(_DWORD *)v22 = 136315138;
          OUTLINED_FUNCTION_6_5();
          *(_QWORD *)(v2 + 80) = sub_1C03B934C(v28, v20, (uint64_t *)&v30);
          sub_1C03E4238();
          OUTLINED_FUNCTION_16_1();
          OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v5, v21, "Assigning deviceName: %s to GlobalProperties", v22);
          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_5_0();
        }
        OUTLINED_FUNCTION_14_2();

        v23 = sub_1C03E40AC();
        OUTLINED_FUNCTION_71();
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), sel_initWithUTF8String_, v23 + 32);
        swift_release();
        if (v24)
        {
          *((_QWORD *)&v31 + 1) = sub_1C03C49C8();
          *(_QWORD *)&v30 = v24;
        }
        else
        {
          v30 = 0u;
          v31 = 0u;
        }
        v26 = *(_QWORD *)(v2 + 120);
        v25 = *(_QWORD *)(v2 + 128);
        v27 = *(_QWORD *)(v2 + 112);
        sub_1C03BAC1C((uint64_t)&v30);
        OUTLINED_FUNCTION_152();
        OUTLINED_FUNCTION_78();
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
        v16 = v29;
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 120) + 8))(*(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 112));
        OUTLINED_FUNCTION_152();
        OUTLINED_FUNCTION_78();
      }
      swift_task_dealloc();
      return (*(uint64_t (**)(unint64_t))(v2 + 8))(v16);
    }
  }
  else
  {
    OUTLINED_FUNCTION_26_2(a1, &qword_1ED738380);
  }
  if (qword_1ED738B60 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v8, (uint64_t)qword_1ED738B68);
  v9 = OUTLINED_FUNCTION_85();
  if (OUTLINED_FUNCTION_8_2(v9))
  {
    v10 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v10);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v11, v12, "No CAT globals set in state store");
    OUTLINED_FUNCTION_5_0();
  }

  sub_1C03C498C();
  OUTLINED_FUNCTION_159();
  *v13 = 0;
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1C03BF830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  return swift_task_switch();
}

uint64_t sub_1C03BF84C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(void);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + 24);
  ObjectType = swift_getObjectType();
  v3 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 184) = v3;
  *v3 = v0;
  v3[1] = sub_1C03BF8D8;
  v4 = OUTLINED_FUNCTION_117();
  return OUTLINED_FUNCTION_11_5(v4, v5, v6, 0x7453656369766564, 0xEB00000000657461, ObjectType, v1, v8);
}

uint64_t sub_1C03BF8D8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BF90C(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  _WORD *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)(void);
  uint64_t v19;

  v2 = (_OWORD *)(v1 + 64);
  if (*(_QWORD *)(v1 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB70);
    v3 = OUTLINED_FUNCTION_19_2();
    if ((v3 & 1) != 0)
    {
      if (*(_QWORD *)(v1 + 88))
      {
        sub_1C03ABB70((__int128 *)(v1 + 64), *(_QWORD *)(v1 + 152));
        if (qword_1ED738B60 != -1)
          swift_once();
        v4 = *(_QWORD *)(v1 + 152);
        v5 = OUTLINED_FUNCTION_29();
        __swift_project_value_buffer(v5, (uint64_t)qword_1ED738B68);
        sub_1C03C4A04(v4, v1 + 104);
        v6 = OUTLINED_FUNCTION_101();
        v7 = sub_1C03E4208();
        if (OUTLINED_FUNCTION_178(v6))
        {
          v8 = (uint8_t *)OUTLINED_FUNCTION_16();
          v19 = OUTLINED_FUNCTION_16();
          *(_DWORD *)v8 = 136315138;
          v9 = OUTLINED_FUNCTION_108((_QWORD *)(v1 + 104));
          *(_QWORD *)(v1 + 144) = sub_1C03B934C(v9, v10, &v19);
          OUTLINED_FUNCTION_84();
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_127();
          OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v6, v7, "Got deviceState as: %s", v8);
          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_5_0();
        }
        OUTLINED_FUNCTION_127();

        v17 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
        return v17();
      }
    }
    else
    {
      *(_QWORD *)(v1 + 96) = 0;
      *v2 = 0u;
      *(_OWORD *)(v1 + 80) = 0u;
    }
  }
  else
  {
    OUTLINED_FUNCTION_41_1(a1, &qword_1ED738380);
    *v2 = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_QWORD *)(v1 + 96) = 0;
  }
  OUTLINED_FUNCTION_26_2(v3, &qword_1EF5FDA80);
  if (qword_1ED738B60 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v11, (uint64_t)qword_1ED738B68);
  v12 = OUTLINED_FUNCTION_85();
  if (OUTLINED_FUNCTION_8_2(v12))
  {
    v13 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v13);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v14, v15, "No DeviceState set in state store");
    OUTLINED_FUNCTION_5_0();
  }

  sub_1C03C498C();
  OUTLINED_FUNCTION_159();
  *v16 = 2;
  swift_willThrow();
  v17 = *(uint64_t (**)(void))(v1 + 8);
  return v17();
}

uint64_t sub_1C03BFBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[26] = a3;
  v4[27] = v3;
  v4[24] = a1;
  v4[25] = a2;
  v5 = sub_1C03E3788();
  v4[28] = v5;
  v4[29] = *(_QWORD *)(v5 - 8);
  v4[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03BFC04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD *, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = v0[29];
  v1 = v0[30];
  v3 = v0[28];
  v4 = *(_QWORD *)(v0[27] + 24);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x1E0DA5288], v3);
  v6 = sub_1C03E377C();
  v8 = v7;
  v0[31] = v7;
  OUTLINED_FUNCTION_163(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v9 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  v0[32] = v9;
  *v9 = v0;
  v9[1] = sub_1C03BFCD8;
  return v11(v0 + 2, v0[25], v0[26], v6, v8, ObjectType, v4);
}

uint64_t sub_1C03BFCD8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BFD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  _WORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_28_2();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  v25 = (_OWORD *)(v22 + 104);
  if (*(_QWORD *)(v22 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDBA8);
    v26 = OUTLINED_FUNCTION_19_2();
    if ((v26 & 1) != 0)
    {
      if (*(_QWORD *)(v22 + 128))
      {
        sub_1C03ABB70((__int128 *)(v22 + 104), v22 + 64);
        if (qword_1ED738B60 != -1)
          swift_once();
        v27 = OUTLINED_FUNCTION_29();
        __swift_project_value_buffer(v27, (uint64_t)qword_1ED738B68);
        v28 = OUTLINED_FUNCTION_33_1();
        sub_1C03C4A04(v28, v29);
        v30 = sub_1C03E4010();
        v31 = sub_1C03E4208();
        if (OUTLINED_FUNCTION_178(v30))
        {
          v32 = (uint8_t *)OUTLINED_FUNCTION_16();
          a11 = OUTLINED_FUNCTION_16();
          *(_DWORD *)v32 = 136315138;
          v33 = OUTLINED_FUNCTION_108((_QWORD *)(v22 + 144));
          *(_QWORD *)(v22 + 184) = sub_1C03B934C(v33, v34, &a11);
          OUTLINED_FUNCTION_84();
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_120();
          OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v30, v31, "Got siriRequestState as: %s", v32);
          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_5_0();
        }
        OUTLINED_FUNCTION_120();

        sub_1C03ABB70((__int128 *)(v22 + 64), *(_QWORD *)(v22 + 192));
        goto LABEL_15;
      }
    }
    else
    {
      *(_QWORD *)(v22 + 136) = 0;
      *v25 = 0u;
      *(_OWORD *)(v22 + 120) = 0u;
    }
  }
  else
  {
    OUTLINED_FUNCTION_41_1(v24, &qword_1ED738380);
    *v25 = 0u;
    *(_OWORD *)(v22 + 120) = 0u;
    *(_QWORD *)(v22 + 136) = 0;
  }
  OUTLINED_FUNCTION_26_2(v26, &qword_1ED738228);
  if (qword_1ED738B60 != -1)
    swift_once();
  v35 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v35, (uint64_t)qword_1ED738B68);
  v36 = OUTLINED_FUNCTION_55_0();
  if (OUTLINED_FUNCTION_8_2(v36))
  {
    v37 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v37);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v38, v39, "No SiriRequestState set in state store");
    OUTLINED_FUNCTION_5_0();
  }
  v40 = *(_QWORD *)(v22 + 192);

  *(_QWORD *)(v40 + 32) = 0;
  *(_OWORD *)v40 = 0u;
  *(_OWORD *)(v40 + 16) = 0u;
LABEL_15:
  swift_task_dealloc();
  OUTLINED_FUNCTION_25_2();
  return v41(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1C03BFF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[46] = a3;
  v4[47] = v3;
  v4[44] = a1;
  v4[45] = a2;
  sub_1C03E3050();
  v4[48] = OUTLINED_FUNCTION_3_0();
  sub_1C03E3DD0();
  v4[49] = OUTLINED_FUNCTION_3_0();
  v5 = sub_1C03E3CB0();
  v4[50] = v5;
  v4[51] = *(_QWORD *)(v5 - 8);
  v4[52] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03BFFF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  OUTLINED_FUNCTION_80();
  v1 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 424) = v1;
  *v1 = v0;
  v1[1] = sub_1C03C0068;
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_11_5(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1C03C0068()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C009C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (!v1[5])
  {
    OUTLINED_FUNCTION_41_1(a1, &qword_1ED738380);
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738338);
  if (!OUTLINED_FUNCTION_19_2())
  {
LABEL_5:
    v2 = MEMORY[0x1E0DEE9D8];
    goto LABEL_6;
  }
  v2 = v1[43];
LABEL_6:
  v1[54] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v1[55] = v3;
  v4 = OUTLINED_FUNCTION_51_1(v3);
  return sub_1C03BFBA0(v4, v5, v6);
}

uint64_t sub_1C03C0140()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_48_1();
  v2 = *v1;
  *v3 = *v1;
  swift_task_dealloc();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v4;
  *v4 = v2;
  v4[1] = sub_1C03C01A0;
  v5 = OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 360));
  return sub_1C03BF02C(v5, v6);
}

uint64_t sub_1C03C01A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_18(v3);
  if (v1)

  else
    *(_QWORD *)(v2 + 456) = v0;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C01F8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v0[58] = v0[57];
  v0[59] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383D0);
  v0[39] = sub_1C03E404C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[60] = v1;
  *v1 = v0;
  v1[1] = sub_1C03C0278;
  v2 = OUTLINED_FUNCTION_43(v0[45]);
  return OUTLINED_FUNCTION_63_0(v2, v3);
}

uint64_t sub_1C03C0278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_171(v3);
  *(_QWORD *)(v2 + 488) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v2 + 496) = v0;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C02CC()
{
  _QWORD *v0;
  NSObject *v1;
  unint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_28_2();
  v1 = v0[62];
  v2 = sub_1C03BAFEC((uint64_t)v1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_179();
  v0[39] = v2;
  if (qword_1ED738B60 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v3, (uint64_t)qword_1ED738B68);
  v4 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_8_2(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();
    *(_DWORD *)v5 = 136315138;
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_135();
    sub_1C03E4040();
    v6 = OUTLINED_FUNCTION_57();
    v0[42] = OUTLINED_FUNCTION_56_0(v6, v7);
    OUTLINED_FUNCTION_84();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v1, (os_log_type_t)v2, "CatGlobals computed as: %s", v5);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_153();
  v8 = (_QWORD *)swift_task_alloc();
  v0[63] = v8;
  OUTLINED_FUNCTION_51_1(v8);
  OUTLINED_FUNCTION_25_2();
  return sub_1C03BF830(v9, v10, v11);
}

uint64_t sub_1C03C0464()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 512) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1C03C04B4()
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

  sub_1C03ABAE4((uint64_t)(v0 + 18), &qword_1EF5FDA80);
  v1 = OUTLINED_FUNCTION_33_1();
  sub_1C03C3EEC(v1, v2, &qword_1EF5FDA80);
  OUTLINED_FUNCTION_15_2();
  v3 = v0[39];
  v0[65] = v3;
  sub_1C03C4960((uint64_t)(v0 + 18), (uint64_t)(v0 + 13), &qword_1EF5FDA80);
  if (v0[16])
  {
    OUTLINED_FUNCTION_13_3();
    v4 = (_QWORD *)OUTLINED_FUNCTION_103();
    v0[66] = v4;
    v5 = OUTLINED_FUNCTION_92(v4);
    sub_1C03C0AF8(v5, v6, v7, v8, v3, v9, (uint64_t)(v0 + 13), (uint64_t)(v0 + 8));
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C03C0588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _QWORD *a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  OUTLINED_FUNCTION_168();
  a15 = v18;
  a16 = v19;
  a14 = v17;
  a14 = (_QWORD *)*v17;
  v20 = a14;
  OUTLINED_FUNCTION_171(&a14);
  v20[67] = v16;
  swift_task_dealloc();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_71();
  if (!v16)
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v20 + 13));
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_90();
  return swift_task_switch();
}

uint64_t sub_1C03C060C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_1C03ABAE4(v0 + 144, &qword_1EF5FDA80);
  OUTLINED_FUNCTION_26_2(v1, &qword_1ED738228);
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_13(v2);
}

uint64_t sub_1C03C0670()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v0[58] = 0;
  v0[59] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383D0);
  v0[39] = sub_1C03E404C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[60] = v1;
  *v1 = v0;
  v1[1] = sub_1C03C0278;
  v2 = OUTLINED_FUNCTION_43(v0[45]);
  return OUTLINED_FUNCTION_63_0(v2, v3);
}

uint64_t sub_1C03C06EC()
{
  _QWORD *v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  if (qword_1ED738B60 != -1)
    swift_once();
  v2 = v0[61];
  v3 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_130();
  v4 = OUTLINED_FUNCTION_55_0();
  v5 = OUTLINED_FUNCTION_17(v4);
  v6 = v0[61];
  if (v5)
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_16();
    v15 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v7 = 136315138;
    v0[40] = v6;
    OUTLINED_FUNCTION_33();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v8 = OUTLINED_FUNCTION_166();
    v0[41] = sub_1C03B934C(v8, v9, &v15);
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, v1, "Unable to obtain Cat global properties from state store.\n%s. Attempting to use Device.current.\nIf this crashes, please ensure for each request a\nCatGlobalProperties dictionary is set to the statestore", v7);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_153();
  v10 = (_QWORD *)swift_task_alloc();
  v0[63] = v10;
  v11 = OUTLINED_FUNCTION_51_1(v10);
  return sub_1C03BF830(v11, v12, v13);
}

void sub_1C03C0890()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_28_2();
  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  v2 = OUTLINED_FUNCTION_45(v1, (uint64_t)qword_1ED738B68);
  v3 = sub_1C03E41FC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v4 = 0;
    OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v2, v3, "Unable to obtain DeviceState from state store. Assuming restrictive state", v4);
    OUTLINED_FUNCTION_5_0();
  }
  v5 = (void *)v0[64];
  v6 = v0[51];
  v7 = v0[52];
  v8 = v0[50];

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v7, *MEMORY[0x1E0DA6340], v8);
  sub_1C03E3DC4();
  sub_1C03E3044();
  v9 = sub_1C03E39D4();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5B68];
  v0[31] = v9;
  sub_1C03A858C(&qword_1EF5FDA78, v10, MEMORY[0x1E0DA5B60]);
  v0[32] = v11;
  __swift_allocate_boxed_opaque_existential_2Tm(v0 + 28);
  sub_1C03E39C8();

  sub_1C03ABAE4((uint64_t)(v0 + 18), &qword_1EF5FDA80);
  sub_1C03C3EEC((uint64_t)(v0 + 28), (uint64_t)(v0 + 18), &qword_1EF5FDA80);
  OUTLINED_FUNCTION_15_2();
  v0[65] = v0[39];
  sub_1C03C4960((uint64_t)(v0 + 18), (uint64_t)(v0 + 13), &qword_1EF5FDA80);
  if (v0[16])
  {
    OUTLINED_FUNCTION_150();
    v12 = (_QWORD *)OUTLINED_FUNCTION_103();
    v0[66] = v12;
    OUTLINED_FUNCTION_92(v12);
    OUTLINED_FUNCTION_25_2();
    sub_1C03C0AF8(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C03C0A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_168();
  sub_1C03ABAE4(v0 + 144, &qword_1EF5FDA80);
  OUTLINED_FUNCTION_26_2(v1, &qword_1ED738228);
  OUTLINED_FUNCTION_127();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_90();
  return v2(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1C03C0AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v9[39] = a8;
  v9[40] = v8;
  v9[37] = a6;
  v9[38] = a7;
  v9[35] = a4;
  v9[36] = a5;
  v9[33] = a2;
  v9[34] = a3;
  v9[32] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738278);
  v9[41] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD750);
  v9[42] = swift_task_alloc();
  v10 = sub_1C03E3C68();
  v9[43] = v10;
  v9[44] = *(_QWORD *)(v10 - 8);
  v9[45] = swift_task_alloc();
  v9[46] = swift_task_alloc();
  sub_1C03E302C();
  v9[47] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738280);
  v9[48] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03C0C04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  _WORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_168();
  sub_1C03C4960(v1[39], (uint64_t)(v1 + 2), &qword_1ED738228);
  v2 = v1[48];
  if (!v1[5])
  {
    sub_1C03ABAE4((uint64_t)(v1 + 2), &qword_1ED738228);
    v9 = sub_1C03E3D70();
    OUTLINED_FUNCTION_53_1(v2, v10, v11, v9);
    goto LABEL_7;
  }
  __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
  OUTLINED_FUNCTION_105();
  sub_1C03E39A4();
  OUTLINED_FUNCTION_120();
  v0 = (_QWORD *)sub_1C03E3D70();
  OUTLINED_FUNCTION_98(v2, 1, (uint64_t)v0);
  if (v3)
  {
LABEL_7:
    sub_1C03ABAE4(v1[48], &qword_1ED738280);
    goto LABEL_8;
  }
  v4 = *(v0 - 1);
  if ((*(unsigned int (**)(_QWORD, _QWORD *))(v4 + 88))(v1[48], v0) == *MEMORY[0x1E0DA67D0])
  {
    v5 = v1[40];
    OUTLINED_FUNCTION_128(v1[48], *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96));
    v6 = OUTLINED_FUNCTION_169();
    OUTLINED_FUNCTION_5(v6);
    v0 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 136));
    OUTLINED_FUNCTION_33_1();
    if ((sub_1C03E3DAC() & 1) != 0)
    {
      v7 = (_QWORD *)swift_task_alloc();
      v1[49] = v7;
      *v7 = v1;
      v7[1] = sub_1C03C0E10;
      OUTLINED_FUNCTION_90();
      return sub_1C03C16D8();
    }
  }
  else
  {
    OUTLINED_FUNCTION_128(v1[48], *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  }
LABEL_8:
  if (qword_1ED738B60 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v12, (uint64_t)qword_1ED738B68);
  v13 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_8_2(v13))
  {
    v14 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v14);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v15, v16, "Do not need to wait for incoming data as the requestState.assistantTurnState is not taskComplete or SAE is disabled");
    OUTLINED_FUNCTION_5_0();
  }

  v17 = (_QWORD *)swift_task_alloc();
  v1[51] = v17;
  *v17 = v1;
  v17[1] = sub_1C03C0FE4;
  OUTLINED_FUNCTION_43(v1[33]);
  OUTLINED_FUNCTION_90();
  return sub_1C03BC784(v18, v19, v20);
}

uint64_t sub_1C03C0E10()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_70();
  *(_QWORD *)(v1 + 400) = v0;
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C0E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  os_log_type_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_28_2();
  a21 = v24;
  a22 = v25;
  a20 = v23;
  if (qword_1ED738B60 != -1)
    swift_once();
  v26 = v23[50];
  v27 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v27, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_130();
  v28 = OUTLINED_FUNCTION_46();
  v29 = OUTLINED_FUNCTION_23_1(v28);
  v30 = v23[50];
  if (v29)
  {
    v31 = (uint8_t *)OUTLINED_FUNCTION_16();
    a11 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v31 = 136315138;
    OUTLINED_FUNCTION_104();
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
    v33 = MEMORY[0x1C3B99770](v30, v32);
    v35 = v34;
    OUTLINED_FUNCTION_106();
    v23[31] = sub_1C03B934C(v33, v35, &a11);
    sub_1C03E4238();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v26, v22, "Got all incoming data to finish the interaction building: %s", v31);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();

  v36 = (_QWORD *)swift_task_alloc();
  v23[51] = v36;
  *v36 = v23;
  v36[1] = sub_1C03C0FE4;
  OUTLINED_FUNCTION_43(v23[33]);
  OUTLINED_FUNCTION_25_2();
  return sub_1C03BC784(v37, v38, v39);
}

uint64_t sub_1C03C0FE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 416) = a1;
  OUTLINED_FUNCTION_82();
  if (v1)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v3 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_11();
    return OUTLINED_FUNCTION_9_4();
  }
}

uint64_t sub_1C03C1084()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[52];
  if (!v1)
  {
    sub_1C03E38B4();
    v1 = sub_1C03E3860();
  }
  v0[53] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[54] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1C03C10E8;
  v3 = OUTLINED_FUNCTION_43(v0[33]);
  return sub_1C03BE934(v3, v4);
}

uint64_t sub_1C03C10E8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_70();
  *(_QWORD *)(v1 + 440) = v0;
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C1124()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
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
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *log;
  os_log_type_t type;
  uint64_t (*typea)(uint64_t);
  uint64_t v29;

  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_11_2();
  swift_retain_n();
  OUTLINED_FUNCTION_11_2();
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41F0();
  if (os_log_type_enabled((os_log_t)v2, v3))
  {
    type = v3;
    v4 = OUTLINED_FUNCTION_16();
    v29 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v4 = 136315906;
    log = v2;
    v5 = OUTLINED_FUNCTION_135();
    v0[27] = OUTLINED_FUNCTION_119(v5, v6, v7, v8, v9, v10);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v4 + 12) = 2080;
    v11 = OUTLINED_FUNCTION_96();
    MEMORY[0x1C3B99770](v11, MEMORY[0x1E0DEA968]);
    v12 = swift_bridgeObjectRelease();
    v0[28] = OUTLINED_FUNCTION_119(v12, v13, v14, v15, v16, v17);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_14_2();
    *(_WORD *)(v4 + 22) = 2080;
    v18 = sub_1C03E386C();
    v0[29] = sub_1C03B934C(v18, v19, &v29);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_164();
    *(_WORD *)(v4 + 32) = 2080;
    OUTLINED_FUNCTION_6_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    v20 = sub_1C03E4040();
    v22 = v21;
    OUTLINED_FUNCTION_71();
    v0[30] = sub_1C03B934C(v20, v22, &v29);
    sub_1C03E4238();
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_14_2();
    _os_log_impl(&dword_1C03A5000, log, type, "Creating suggestions interaction for requestId: %s with dialogId: %s, intent: %s, executionParameters %s", (uint8_t *)v4, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_164();
  OUTLINED_FUNCTION_14_2();

  OUTLINED_FUNCTION_74();
  typea = (uint64_t (*)(uint64_t))(**(int **)(v2 + 24) + *(_QWORD *)(v2 + 24));
  v23 = (_QWORD *)swift_task_alloc();
  v0[56] = v23;
  *v23 = v0;
  v23[1] = sub_1C03C1438;
  v24 = OUTLINED_FUNCTION_43(v0[33]);
  return typea(v24);
}

uint64_t sub_1C03C1438()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C146C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)(void);

  v1 = v0[42];
  v2 = v0[38];
  sub_1C03E38A8();
  sub_1C03E3020();
  sub_1C03E3884();
  sub_1C03C4A04(v2, (uint64_t)(v0 + 12));
  sub_1C03C4A04((uint64_t)(v0 + 7), (uint64_t)(v0 + 17));
  OUTLINED_FUNCTION_96();
  sub_1C03E389C();
  sub_1C03E3890();
  sub_1C03E3914();
  v3 = OUTLINED_FUNCTION_75(v1);
  v4 = v0[46];
  if (v3 == 1)
  {
    v6 = v0[43];
    v5 = v0[44];
    sub_1C03ABAE4(v0[42], &qword_1EF5FD750);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, *MEMORY[0x1E0DA6198], v6);
  }
  else
  {
    v7 = v0[44];
    v8 = v0[45];
    v9 = v0[43];
    sub_1C03E38FC();
    OUTLINED_FUNCTION_35_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v4, v8, v9);
  }
  v10 = v0[41];
  v11 = v0[39];
  v12 = sub_1C03E3D40();
  OUTLINED_FUNCTION_53_1(v10, v13, v14, v12);
  OUTLINED_FUNCTION_88(v11, v15, &qword_1ED738228);
  if (v0[25])
  {
    v17 = (_QWORD *)OUTLINED_FUNCTION_33_1();
    __swift_project_boxed_opaque_existential_1(v17, v18);
    sub_1C03E39BC();
    OUTLINED_FUNCTION_127();
  }
  else
  {
    OUTLINED_FUNCTION_41_1(v16, &qword_1ED738228);
  }
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_96();
  sub_1C03E3A58();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_154();
  OUTLINED_FUNCTION_44();
  v19 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return v19();
}

uint64_t sub_1C03C16D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = sub_1C03E4004();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03C1738()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(void **)(v0 + 48);
  v2 = (void *)sub_1C03E3F44();
  sub_1C03E3F2C();

  sub_1C03E3B60();
  v3 = (void *)sub_1C03E3F44();
  sub_1C03E3F50();

  if (qword_1ED738B60 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v4, (uint64_t)qword_1ED738B68);
  v5 = OUTLINED_FUNCTION_46();
  if (OUTLINED_FUNCTION_8_2(v5))
  {
    v6 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v6);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v7, v8, "Adding listeners for flowIntentProperties and executionParamPrefix");
    OUTLINED_FUNCTION_5_0();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAA8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v9;
  *v9 = v0;
  v9[1] = sub_1C03C1898;
  OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_90();
  return sub_1C03E4394();
}

uint64_t sub_1C03C1898()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C18CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  sub_1C03E3B60();
  v3 = (void *)sub_1C03E3F44();
  sub_1C03E3F38();

  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_44();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_1C03C1960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v5;

  v3[43] = a2;
  v3[44] = a3;
  v3[42] = a1;
  v5 = (_QWORD *)swift_task_alloc();
  v3[45] = v5;
  *v5 = v3;
  v5[1] = sub_1C03C19D0;
  return sub_1C03C1ECC(0xD000000000000014, 0x80000001C03E66D0, a2);
}

uint64_t sub_1C03C19D0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C1A04()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1C03E3770();
  *(_QWORD *)(v0 + 368) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v2;
  *v2 = v0;
  v2[1] = sub_1C03C1A68;
  v3 = OUTLINED_FUNCTION_122();
  return sub_1C03C1ECC(v3, v4, v5);
}

uint64_t sub_1C03C1A68()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_31();
  *(_QWORD *)(v1 + 384) = MEMORY[0x1E0DEE9D8];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 392) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAC8);
  *v3 = v2;
  v3[1] = sub_1C03C1B00;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_37_0();
}

uint64_t sub_1C03C1B00()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_18(v2);
  if (v1)
    *(_QWORD *)(v0 + 408) = v1;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_9_4();
}

uint64_t sub_1C03C1B50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  _QWORD *v15;
  uint64_t (*v16)(void);

  OUTLINED_FUNCTION_88(v2 + 16, a2, &qword_1EF5FDAD0);
  v3 = *(_QWORD *)(v2 + 152);
  v4 = *(_QWORD *)(v2 + 384);
  if (v3)
  {
    v5 = *(_QWORD *)(v2 + 144);
    *(_QWORD *)(v2 + 80) = v5;
    *(_QWORD *)(v2 + 88) = v3;
    sub_1C03B68B0((__int128 *)(v2 + 160), (_OWORD *)(v2 + 96));
    *(_QWORD *)(v2 + 208) = v5;
    *(_QWORD *)(v2 + 216) = v3;
    sub_1C03C4A2C(v2 + 96, v2 + 224);
    *(_QWORD *)(v2 + 272) = v5;
    *(_QWORD *)(v2 + 280) = v3;
    OUTLINED_FUNCTION_149();
    OUTLINED_FUNCTION_104();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v7 = *(_QWORD *)(v2 + 384);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      OUTLINED_FUNCTION_146();
      v7 = isUniquelyReferenced_nonNull_native;
    }
    v8 = *(_QWORD *)(v7 + 16);
    if (v8 >= *(_QWORD *)(v7 + 24) >> 1)
    {
      OUTLINED_FUNCTION_146();
      v7 = isUniquelyReferenced_nonNull_native;
    }
    *(_QWORD *)(v7 + 16) = v8 + 1;
    v9 = (_OWORD *)(v7 + (v8 << 6));
    v10 = *(_OWORD *)(v2 + 272);
    v11 = *(_OWORD *)(v2 + 288);
    v12 = *(_OWORD *)(v2 + 320);
    v9[4] = *(_OWORD *)(v2 + 304);
    v9[5] = v12;
    v9[2] = v10;
    v9[3] = v11;
    OUTLINED_FUNCTION_41_1(isUniquelyReferenced_nonNull_native, &qword_1EF5FD8D0);
    sub_1C03ABAE4(v2 + 16, &qword_1EF5FDAD0);
    *(_QWORD *)(v2 + 384) = v7;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 392) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAC8);
    *v13 = v2;
    v13[1] = sub_1C03C1B00;
    OUTLINED_FUNCTION_11();
    return OUTLINED_FUNCTION_37_0();
  }
  else
  {
    v15 = *(_QWORD **)(v2 + 336);
    OUTLINED_FUNCTION_148(v2 + 16);
    OUTLINED_FUNCTION_148(v2 + 144);
    *v15 = v4;
    v16 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
    return OUTLINED_FUNCTION_13(v16);
  }
}

uint64_t sub_1C03C1CF8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_18(v2);
  if (v1)
    *(_QWORD *)(v0 + 408) = v1;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_9_4();
}

uint64_t sub_1C03C1D48()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 408);
  v2 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_101();
  v3 = OUTLINED_FUNCTION_55_0();
  if (os_log_type_enabled(v1, v3))
  {
    v4 = OUTLINED_FUNCTION_16();
    v5 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v4 = 138412290;
    OUTLINED_FUNCTION_121();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v4 + 4) = v6;
    *v5 = v6;
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v1, v3, "Caught error when waiting for interaction components: %@", (uint8_t *)v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_32_1();

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 400) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAC8);
  *v7 = v0;
  v7[1] = sub_1C03C1CF8;
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_37_0();
}

uint64_t sub_1C03C1ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  v4[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03C1F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = sub_1C03E4190();
  OUTLINED_FUNCTION_53_1(v1, v6, v7, v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_36();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v2;
  v8[5] = v4;
  v8[6] = v3;
  swift_retain();
  OUTLINED_FUNCTION_104();
  v9 = sub_1C03C3258(v1, (uint64_t)&unk_1EF5FDAE0, (uint64_t)v8);
  OUTLINED_FUNCTION_41_1(v9, &qword_1ED738340);
  OUTLINED_FUNCTION_30();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03C1FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[61] = a5;
  v6[62] = a6;
  v6[59] = a1;
  v6[60] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  v6[63] = v7;
  v6[64] = *(_QWORD *)(v7 - 8);
  v6[65] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAE8);
  v6[66] = swift_task_alloc();
  v8 = sub_1C03E3764();
  v6[67] = v8;
  v6[68] = *(_QWORD *)(v8 - 8);
  v6[69] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03C2088()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v1 = *((_QWORD *)v0 + 60);
  type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(0);
  v2 = OUTLINED_FUNCTION_19();
  *((_QWORD *)v0 + 70) = v2;
  swift_defaultActor_initialize();
  v3 = OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation;
  *((_QWORD *)v0 + 71) = OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation;
  OUTLINED_FUNCTION_145(v2 + v3, 1);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 96));
  OUTLINED_FUNCTION_105();
  v4 = sub_1C03E3350();
  v5 = *((_QWORD *)v0 + 69);
  v6 = *((_QWORD *)v0 + 68);
  v7 = *((_QWORD *)v0 + 67);
  v8 = MEMORY[0x1C3B98DA4](v4);
  OUTLINED_FUNCTION_163(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  if (qword_1ED738B60 != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_29();
  *((_QWORD *)v0 + 72) = __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_21_2();
  v10 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_23_1(v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v11 = 134217984;
    v0[58] = v8;
    sub_1C03E4238();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v5, (os_log_type_t)v7, "Using wait timeout of: %f", v11);
    OUTLINED_FUNCTION_5_0();
  }

  v13 = *((_QWORD *)v0 + 61);
  v12 = *((_QWORD *)v0 + 62);
  v14 = *((_QWORD *)v0 + 60);
  v15 = (_QWORD *)OUTLINED_FUNCTION_36();
  *((_QWORD *)v0 + 73) = v15;
  v15[2] = v2;
  v15[3] = v13;
  v15[4] = v12;
  v15[5] = v14;
  swift_retain();
  OUTLINED_FUNCTION_6_5();
  swift_retain();
  v16 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v0 + 74) = v16;
  *((_QWORD *)v0 + 75) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
  *v16 = v0;
  v16[1] = sub_1C03C2444;
  return sub_1C03E3338();
}

uint64_t sub_1C03C2444()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v2);
  *(_QWORD *)(v0 + 608) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_9_4();
}

uint64_t sub_1C03C249C()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  os_log_type_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;

  v1 = *(NSObject **)(v0 + 576);
  v2 = *(_QWORD *)(v0 + 280);
  *(_QWORD *)(v0 + 336) = *(_QWORD *)(v0 + 272);
  *(_QWORD *)(v0 + 344) = v2;
  sub_1C03C4A2C(v0 + 288, v0 + 352);
  sub_1C03C4960(v0 + 336, v0 + 16, &qword_1EF5FD8D0);
  v3 = *(_OWORD *)(v0 + 352);
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 336);
  *(_OWORD *)(v0 + 224) = v3;
  v4 = *(_OWORD *)(v0 + 384);
  *(_OWORD *)(v0 + 240) = *(_OWORD *)(v0 + 368);
  *(_OWORD *)(v0 + 256) = v4;
  OUTLINED_FUNCTION_11_2();
  swift_bridgeObjectRetain();
  sub_1C03E4010();
  v5 = OUTLINED_FUNCTION_66();
  if (os_log_type_enabled(v1, v5))
  {
    v6 = *(_QWORD *)(v0 + 488);
    v7 = *(_QWORD *)(v0 + 496);
    v8 = OUTLINED_FUNCTION_16();
    v17 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v8 = 136315394;
    OUTLINED_FUNCTION_96();
    *(_QWORD *)(v0 + 432) = sub_1C03B934C(v6, v7, &v17);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v8 + 12) = 2080;
    v9 = *(_QWORD *)(v0 + 16);
    v10 = *(_QWORD *)(v0 + 24);
    sub_1C03C4A2C(v0 + 32, v0 + 160);
    *(_QWORD *)(v0 + 80) = v9;
    *(_QWORD *)(v0 + 88) = v10;
    sub_1C03B68B0((__int128 *)(v0 + 160), (_OWORD *)(v0 + 96));
    swift_bridgeObjectRetain();
    v11 = sub_1C03E40A0();
    *(_QWORD *)(v0 + 456) = sub_1C03B934C(v11, v12, &v17);
    sub_1C03E4238();
    OUTLINED_FUNCTION_31();
    sub_1C03ABAE4(v0 + 208, &qword_1EF5FD8D0);
    sub_1C03ABAE4(v0 + 16, &qword_1EF5FD8D0);
    OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v1, v5, "Got results fopr %s: %s", (uint8_t *)v8);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();
  sub_1C03ABAE4(v0 + 208, &qword_1EF5FD8D0);
  sub_1C03ABAE4(v0 + 16, &qword_1EF5FD8D0);
  swift_release();

  v13 = *(_QWORD *)(v0 + 472);
  v14 = *(_QWORD *)(v0 + 280);
  *(_QWORD *)v13 = *(_QWORD *)(v0 + 272);
  *(_QWORD *)(v13 + 8) = v14;
  sub_1C03B68B0((__int128 *)(v0 + 288), (_OWORD *)(v13 + 16));
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  v15 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return v15();
}

uint64_t sub_1C03C2738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_174();
  sub_1C03C4960(v0, v1, v2);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_9_4();
}

uint64_t sub_1C03C2790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t EnumTagSinglePayload;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 528);
  v2 = *(_QWORD *)(v0 + 504);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  if ((_DWORD)EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_26_2(EnumTagSinglePayload, &qword_1EF5FDAE8);
  }
  else
  {
    v4 = *(void **)(v0 + 616);
    v5 = *(_QWORD *)(v0 + 520);
    v6 = *(_QWORD *)(v0 + 512);
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v1, v2);
    OUTLINED_FUNCTION_26_2(v7, &qword_1EF5FDAE8);
    *(_QWORD *)(v0 + 448) = v4;
    v8 = v4;
    OUTLINED_FUNCTION_122();
    sub_1C03E416C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v2);
  }
  swift_willThrow();
  swift_release();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03C2884()
{
  _QWORD *v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_28_2();
  swift_release();
  v0[77] = v0[76];
  if (qword_1ED738B60 != -1)
    swift_once();
  v2 = v0[62];
  v3 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_101();
  v4 = OUTLINED_FUNCTION_55_0();
  if (OUTLINED_FUNCTION_17(v4))
  {
    v5 = OUTLINED_FUNCTION_16();
    v6 = (_QWORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();
    *(_DWORD *)v5 = 136315394;
    v7 = swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_56_0(v7, v8);
    OUTLINED_FUNCTION_81(v9);
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v5 + 12) = 2112;
    OUTLINED_FUNCTION_33();
    v10 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_83(v10);
    *v6 = v10;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v2, v1, "Error waiting for: %s. %@", (uint8_t *)v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_25_2();
  return swift_task_switch();
}

uint64_t sub_1C03C2A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1C03C2A64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
  *v5 = v0;
  v5[1] = sub_1C03C2B14;
  OUTLINED_FUNCTION_11();
  return sub_1C03E440C();
}

uint64_t sub_1C03C2B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v3);
  *(_QWORD *)(v0 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_11();
    return OUTLINED_FUNCTION_9_4();
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_1C03C2B70()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03C2B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v22 = a3;
  v23 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1C03E4190();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = 0;
  *((_QWORD *)v18 + 3) = 0;
  *((_QWORD *)v18 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v18[v16], v11, v8);
  v19 = &v18[v17];
  v20 = v23;
  *(_QWORD *)v19 = v22;
  *((_QWORD *)v19 + 1) = a4;
  *(_QWORD *)&v18[(v17 + 23) & 0xFFFFFFFFFFFFFFF8] = v20;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C03DED74((uint64_t)v14, (uint64_t)&unk_1EF5FDB08, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_1C03C2D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  v8[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[12] = v10;
  v8[13] = *(_QWORD *)(v10 + 64);
  v8[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAE8);
  v8[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03C2DB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  v1 = v0[15];
  v2 = v0[7];
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0[12] + 16);
  v0[16] = v3;
  OUTLINED_FUNCTION_165(v2, v3);
  OUTLINED_FUNCTION_54_0(v1, 0);
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C2E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v0 = OUTLINED_FUNCTION_33_1();
  sub_1C03C3D14(v0, v1);
  v2 = swift_endAccess();
  OUTLINED_FUNCTION_41_1(v2, &qword_1EF5FDAE8);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C2E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  os_log_type_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  _BOOL4 v30;
  unint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  OUTLINED_FUNCTION_28_2();
  a21 = v24;
  a22 = v25;
  a20 = v23;
  if (qword_1ED738B40 != -1)
    swift_once();
  v26 = v23[9];
  v27 = OUTLINED_FUNCTION_29();
  v23[17] = v27;
  v28 = __swift_project_value_buffer(v27, (uint64_t)qword_1ED738B48);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_130();
  v29 = OUTLINED_FUNCTION_66();
  v30 = OUTLINED_FUNCTION_23_1(v29);
  v31 = v23[9];
  if (v30)
  {
    v32 = v23[8];
    v33 = (uint8_t *)OUTLINED_FUNCTION_16();
    a11 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v33 = 136315138;
    OUTLINED_FUNCTION_104();
    v23[5] = sub_1C03B934C(v32, v31, &a11);
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v26, v22, "Starting listener task for %s", v33);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();

  v34 = (void (*)(uint64_t, uint64_t, uint64_t))v23[16];
  v36 = v23[13];
  v35 = v23[14];
  v38 = v23[11];
  v37 = v23[12];
  v39 = v23[9];
  v40 = v23[7];
  v54 = v23[8];
  v56 = OUTLINED_FUNCTION_74();
  v34(v35, v40, v38);
  v41 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v42 = swift_allocObject();
  v23[18] = v42;
  OUTLINED_FUNCTION_79(v42 + v41, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 32));
  v43 = (_QWORD *)(v42 + ((v36 + v41 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v43 = v54;
  v43[1] = v39;
  v55 = **(int **)(v28 + 40) + *(_QWORD *)(v28 + 40);
  OUTLINED_FUNCTION_135();
  v44 = (_QWORD *)OUTLINED_FUNCTION_103();
  v23[19] = v44;
  *v44 = v23;
  v44[1] = sub_1C03C3090;
  OUTLINED_FUNCTION_43(v23[8]);
  OUTLINED_FUNCTION_25_2();
  return v51(v45, v46, v47, v48, v49, v50, v51, v52, v55, v56, a11, a12, a13, a14);
}

uint64_t sub_1C03C3090()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  swift_release();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C30CC()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_1ED738B60 != -1)
    swift_once();
  OUTLINED_FUNCTION_45(*(_QWORD *)(v1 + 136), (uint64_t)qword_1ED738B68);
  v2 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_8_2(v2))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_52_1(v3);
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v4, v5, "Finished creating listener");
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_1C03C3178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v4[2];
  _BYTE v5[56];

  v4[0] = a3;
  v4[1] = a4;
  sub_1C03C4A2C(a1, (uint64_t)v5);
  v5[48] = 0;
  swift_bridgeObjectRetain();
  sub_1C03C31D4((uint64_t)v4);
  sub_1C03ABAE4((uint64_t)v4, &qword_1EF5FDB10);
}

uint64_t sub_1C03C31D4(uint64_t a1)
{
  __int128 v2;
  char v3;

  sub_1C03C4960(a1, (uint64_t)&v2, &qword_1EF5FDB10);
  if ((v3 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
    return sub_1C03E416C();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
    return sub_1C03E4178();
  }
}

uint64_t sub_1C03C3258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[4];
  _QWORD v18[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03C4960(a1, (uint64_t)v9, &qword_1ED738340);
  v10 = sub_1C03E4190();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    sub_1C03ABAE4((uint64_t)v9, &qword_1ED738340);
  }
  else
  {
    sub_1C03E4184();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    v11 = sub_1C03E4160();
    v13 = v12;
    swift_unknownObjectRelease();
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8D0);
  v15 = (_QWORD *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    v15 = v18;
    v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t sub_1C03C33E4()
{
  uint64_t v0;

  sub_1C03ABAE4(v0 + OBJC_IVAR____TtCC22SiriSuggestionsSupport28StateStoreInteractionBuilder19ContinuationCapture_continuation, &qword_1EF5FDAE8);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

void sub_1C03C3418()
{
  OUTLINED_FUNCTION_162();
}

void sub_1C03C3420()
{
  OUTLINED_FUNCTION_139();
  sub_1C03E446C();
  sub_1C03E4478();
  OUTLINED_FUNCTION_138();
}

void sub_1C03C3454()
{
  sub_1C03C3418();
}

void sub_1C03C346C()
{
  sub_1C03C3420();
}

uint64_t sub_1C03C3484()
{
  uint64_t v0;

  OUTLINED_FUNCTION_141();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  return v0;
}

uint64_t sub_1C03C34B4()
{
  sub_1C03C3484();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03C34D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AE3D8;
  return sub_1C03BFF7C(a1, a2, a3);
}

unint64_t sub_1C03C3544()
{
  unint64_t result;

  result = qword_1EF5FD940;
  if (!qword_1EF5FD940)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for CatPropertyKeys, &type metadata for CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD940);
  }
  return result;
}

unint64_t sub_1C03C3584()
{
  unint64_t result;

  result = qword_1EF5FD948;
  if (!qword_1EF5FD948)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for CatPropertyKeys, &type metadata for CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD948);
  }
  return result;
}

unint64_t sub_1C03C35C4()
{
  unint64_t result;

  result = qword_1EF5FD950;
  if (!qword_1EF5FD950)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for CatPropertyKeys, &type metadata for CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FD950);
  }
  return result;
}

uint64_t dispatch thunk of InteractionBuilder.build(requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = OUTLINED_FUNCTION_32();
  v12 = (_QWORD *)OUTLINED_FUNCTION_13_2(v11);
  *v12 = v5;
  v12[1] = sub_1C03AE3D8;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t sub_1C03C3680()
{
  return type metadata accessor for EventDrivenInteractionBuilder(0);
}

uint64_t type metadata accessor for EventDrivenInteractionBuilder(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1ED738310);
}

uint64_t sub_1C03C369C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E3CF8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for EventDrivenInteractionBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EventDrivenInteractionBuilder.__allocating_init(event:inAppIdentifier:deviceState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for CatPropertyKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CatPropertyKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C03C37FC + 4 * byte_1C03E58C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C03C3830 + 4 * byte_1C03E58C0[v4]))();
}

uint64_t sub_1C03C3830(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C3838(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03C3840);
  return result;
}

uint64_t sub_1C03C384C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03C3854);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C03C3858(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C3860(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1C03C386C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for CatPropertyKeys()
{
  OUTLINED_FUNCTION_162();
}

uint64_t type metadata accessor for StateStoreInteractionBuilder()
{
  return objc_opt_self();
}

uint64_t sub_1C03C38A4()
{
  return type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(0);
}

uint64_t type metadata accessor for StateStoreInteractionBuilder.ContinuationCapture(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1EF5FD988);
}

void sub_1C03C38C0()
{
  unint64_t v0;

  sub_1C03C3938();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1C03C3938()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF5FD998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EF5FD9A0);
    v0 = sub_1C03E422C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF5FD998);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B99E9C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void __swift_allocate_boxed_opaque_existential_2Tm(uint64_t *a1)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
    *a1 = swift_allocBox();
  OUTLINED_FUNCTION_7();
}

_OWORD *sub_1C03C3A0C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C03C3A1C()
{
  return swift_release();
}

uint64_t sub_1C03C3A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = swift_task_alloc();
  v7 = (_QWORD *)OUTLINED_FUNCTION_13_2(v6);
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return sub_1C03C1960(a1, a2, v2);
}

uint64_t sub_1C03C3A84()
{
  OUTLINED_FUNCTION_141();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C03C3AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)OUTLINED_FUNCTION_13_2(v2);
  v4 = OUTLINED_FUNCTION_72(v3);
  return sub_1C03C1FD4(v4, v5, v6, v7, v8, v1);
}

uint64_t sub_1C03C3B18()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03C3B4C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_168();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_90();
  return sub_1C03C2A44(v3, v4, v5, v6, v7);
}

uint64_t sub_1C03C3BB8(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C03C2B9C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1C03C3BC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  OUTLINED_FUNCTION_141();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03C3C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  OUTLINED_FUNCTION_125();
  v2 = (v1 + 23) & 0xFFFFFFFFFFFFF8;
  v3 = (uint64_t *)(v0 + v1);
  v4 = *v3;
  v5 = v3[1];
  v6 = *(_QWORD *)(v0 + v2);
  v7 = swift_task_alloc();
  v8 = (_QWORD *)OUTLINED_FUNCTION_13_2(v7);
  v9 = OUTLINED_FUNCTION_72(v8);
  return sub_1C03C2D24(v9, v10, v11, v12, v13, v4, v5, v6);
}

uint64_t sub_1C03C3D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDAE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03C3D5C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_132();
  return swift_deallocObject();
}

void sub_1C03C3DD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(qword_1EF5FD9A0);
  OUTLINED_FUNCTION_125();
  sub_1C03C3178(a1, v1 + v3, *(_QWORD *)(v1 + v4), *(_QWORD *)(v1 + v4 + 8));
}

uint64_t sub_1C03C3E1C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C03C3E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1C03C3EAC;
  v5 = (uint64_t *)OUTLINED_FUNCTION_33_1();
  return sub_1C03BECE0(v5, v6, v2, v3);
}

uint64_t sub_1C03C3EAC(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_38_0(a1, *(uint64_t (**)(void))(v1 + 8));
}

void sub_1C03C3EEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_113(a1, a2, a3);
  OUTLINED_FUNCTION_175(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03C3F18(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1C03C41BC(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C03C3F94()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  swift_isUniquelyReferenced_nonNull_native();
  v4 = *v0;
  *v0 = 0x8000000000000000;
  v1 = OUTLINED_FUNCTION_107();
  sub_1C03C42D8(v1, v2);
  *v0 = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C03C3FFC(__int128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1C03C441C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_1C03C4078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = (_QWORD **)v3;
  v22 = a2;
  v7 = sub_1C03E35CC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  sub_1C03B9AC4();
  if (__OFADD__(v11[2], (v13 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v14 = v12;
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD010);
  if ((sub_1C03E4310() & 1) != 0)
  {
    sub_1C03B9AC4();
    if ((v15 & 1) == (v17 & 1))
    {
      v14 = v16;
      goto LABEL_5;
    }
LABEL_10:
    sub_1C03E4418();
    __break(1u);
    return;
  }
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) != 0)
  {
    v19 = (uint64_t *)(v18[7] + 16 * v14);
    swift_bridgeObjectRelease();
    v20 = v22;
    *v19 = a1;
    v19[1] = v20;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
    sub_1C03C453C(v14, (uint64_t)v10, a1, v22, v18);
  }
  OUTLINED_FUNCTION_69();
}

_OWORD *sub_1C03C41BC(_OWORD *a1, uint64_t a2, uint64_t a3)
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
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1C03B9B28(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB88);
  if ((sub_1C03E4310() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C03B9B28(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_1C03E4418();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_1C03C3A0C(a1, v16);
  }
  else
  {
    sub_1C03C45DC(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C03C42D8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  v3 = (_QWORD **)v2;
  v6 = sub_1C03E3CF8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v2;
  sub_1C03B9B8C();
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738398);
  if ((sub_1C03E4310() & 1) == 0)
    goto LABEL_5;
  sub_1C03B9B8C();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    result = sub_1C03E4418();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v3;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    result = swift_release();
    *(_QWORD *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1C03C4644(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

_OWORD *sub_1C03C441C(__int128 *a1, uint64_t a2, uint64_t a3)
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
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1C03B9B28(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB38);
  if ((sub_1C03E4310() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C03B9B28(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_1C03E4418();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 48 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_1C03B68B0(a1, v16);
  }
  else
  {
    sub_1C03C46DC(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C03C453C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = sub_1C03E35CC();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = (_QWORD *)(a5[7] + 16 * a1);
  *v13 = a3;
  v13[1] = a4;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

_OWORD *sub_1C03C45DC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1C03C3A0C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_1C03C4644(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1C03E3CF8();
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

_OWORD *sub_1C03C46DC(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
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
  result = sub_1C03B68B0(a4, (_OWORD *)(a5[7] + 48 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_1C03C4748(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _OWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  _BYTE v25[48];
  __int128 v26[3];
  __int128 v27[3];
  _QWORD v28[2];
  uint64_t v29;
  __int128 *v30;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return swift_bridgeObjectRelease();
  v30 = (__int128 *)&v29;
  v6 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1C03C4960(v6, (uint64_t)v28, &qword_1EF5FD8D0);
    v7 = v28[0];
    v8 = v28[1];
    sub_1C03B68B0(v30, v27);
    v9 = *a3;
    v11 = sub_1C03B9B28(v7, v8);
    v12 = *(_QWORD *)(v9 + 16);
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      break;
    v15 = v10;
    if (*(_QWORD *)(v9 + 24) >= v14)
    {
      if ((a2 & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_10;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB38);
        sub_1C03E431C();
        if ((v15 & 1) != 0)
          goto LABEL_10;
      }
    }
    else
    {
      sub_1C03BA114(v14, a2 & 1);
      v16 = sub_1C03B9B28(v7, v8);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_20;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_10:
        sub_1C03C4A2C(*(_QWORD *)(*a3 + 56) + 48 * v11, (uint64_t)v25);
        sub_1C03C4A2C((uint64_t)v25, (uint64_t)v26);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
        swift_bridgeObjectRelease();
        v18 = (_OWORD *)(*(_QWORD *)(*a3 + 56) + 48 * v11);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        sub_1C03B68B0(v26, v18);
        goto LABEL_14;
      }
    }
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v20 = (uint64_t *)(v19[6] + 16 * v11);
    *v20 = v7;
    v20[1] = v8;
    sub_1C03B68B0(v27, (_OWORD *)(v19[7] + 48 * v11));
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_19;
    v19[2] = v23;
LABEL_14:
    v6 += 64;
    a2 = 1;
    if (!--v3)
      return swift_bridgeObjectRelease_n();
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = sub_1C03E4418();
  __break(1u);
  return result;
}

void sub_1C03C4960(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_113(a1, a2, a3);
  OUTLINED_FUNCTION_175(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_7();
}

unint64_t sub_1C03C498C()
{
  unint64_t result;

  result = qword_1EF5FDB68;
  if (!qword_1EF5FDB68)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E5BA8, &unk_1E79B61C0);
    atomic_store(result, (unint64_t *)&qword_1EF5FDB68);
  }
  return result;
}

unint64_t sub_1C03C49C8()
{
  unint64_t result;

  result = qword_1EF5FDB80;
  if (!qword_1EF5FDB80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF5FDB80);
  }
  return result;
}

void sub_1C03C4A04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_157(a1, a2);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v3 + 32);
  OUTLINED_FUNCTION_111(v3, v4, v5);
  OUTLINED_FUNCTION_7();
}

void sub_1C03C4A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_157(a1, a2);
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(v3 + 32);
  OUTLINED_FUNCTION_111(v3, v4, v5);
  OUTLINED_FUNCTION_7();
}

unint64_t sub_1C03C4A54()
{
  unint64_t result;

  result = qword_1EF5FDBB0;
  if (!qword_1EF5FDBB0)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for CatPropertyKeys, &type metadata for CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5FDBB0);
  }
  return result;
}

uint64_t sub_1C03C4A90(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C03C4ADC + 4 * byte_1C03E58CF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C03C4B10 + 4 * byte_1C03E58CA[v4]))();
}

uint64_t sub_1C03C4B10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C4B18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03C4B20);
  return result;
}

uint64_t sub_1C03C4B2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03C4B34);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C03C4B38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C4B40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for StateStoreInteractionBuilder.Errors()
{
  OUTLINED_FUNCTION_162();
}

unint64_t sub_1C03C4B5C()
{
  unint64_t result;

  result = qword_1EF5FDBB8;
  if (!qword_1EF5FDBB8)
  {
    result = MEMORY[0x1C3B99EA8](&unk_1C03E5B80, &unk_1E79B61C0);
    atomic_store(result, (unint64_t *)&qword_1EF5FDBB8);
  }
  return result;
}

void OUTLINED_FUNCTION_6_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_8_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_11_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  return a8();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_20_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return sub_1C03E4010();
}

void OUTLINED_FUNCTION_22_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

BOOL OUTLINED_FUNCTION_23_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_26_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C03ABAE4(v2, a2);
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

void OUTLINED_FUNCTION_32_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_33_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_1C03E419C();
}

uint64_t OUTLINED_FUNCTION_38_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C03ABAE4(v2, a2);
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_48_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_51_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

_WORD *OUTLINED_FUNCTION_52_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_53_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_1C03E41FC();
}

uint64_t OUTLINED_FUNCTION_56_0(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  unint64_t v3;
  va_list va;

  va_start(va, a2);
  return sub_1C03B934C(v2, v3, (uint64_t *)va);
}

void OUTLINED_FUNCTION_58_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return sub_1C03E407C();
}

uint64_t OUTLINED_FUNCTION_63_0(uint64_t a1, uint64_t a2)
{
  return sub_1C03BF2E8(a1, a2);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_1C03E41F0();
}

void OUTLINED_FUNCTION_70()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_72(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_75(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_76(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_78()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C03B57E8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_79@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_81(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 440) = a1;
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_83(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 424) = a1;
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return sub_1C03E4208();
}

uint64_t OUTLINED_FUNCTION_86@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_1C03C4960(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_92(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 352);
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_1C03E43F4();
}

uint64_t OUTLINED_FUNCTION_95()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_97(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1C03C4960(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_100()
{
  return sub_1C03E404C();
}

uint64_t OUTLINED_FUNCTION_101()
{
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_103()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_104()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_105()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_107()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_108(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return sub_1C03E43E8();
}

uint64_t OUTLINED_FUNCTION_109@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

void OUTLINED_FUNCTION_110(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03ABAE4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_111(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (**(uint64_t (***)(uint64_t))(a3 - 8))(v3);
}

uint64_t OUTLINED_FUNCTION_112()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_113(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_114()
{
  return sub_1C03E4238();
}

BOOL OUTLINED_FUNCTION_115(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_116()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_117()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_118()
{
  return sub_1C03E4370();
}

uint64_t OUTLINED_FUNCTION_119(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  unint64_t v7;
  va_list va;

  va_start(va, a6);
  return sub_1C03B934C(v6, v7, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_120()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

id OUTLINED_FUNCTION_121()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_122()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_123()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void OUTLINED_FUNCTION_124(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03ABAE4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_127()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_128@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_130()
{
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_131(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
  return sub_1C03E3AD0();
}

uint64_t OUTLINED_FUNCTION_133@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_137@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_139()
{
  return sub_1C03E4460();
}

uint64_t OUTLINED_FUNCTION_141()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_142(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return sub_1C03E38B4();
}

void OUTLINED_FUNCTION_143(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + a1) |= v1;
}

void OUTLINED_FUNCTION_144()
{
  sub_1C03B8910();
}

uint64_t OUTLINED_FUNCTION_145(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_146()
{
  sub_1C03B8910();
}

uint64_t OUTLINED_FUNCTION_147@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_148(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03ABAE4(a1, v1);
}

_OWORD *OUTLINED_FUNCTION_149()
{
  __int128 *v0;
  _OWORD *v1;

  return sub_1C03B68B0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_150()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_151(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C03ABAE4(v2, a2);
}

uint64_t OUTLINED_FUNCTION_152()
{
  return swift_release();
}

double OUTLINED_FUNCTION_153()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 + 176) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_155()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_156()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_157(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_163@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_164()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_165@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_166()
{
  return sub_1C03E40A0();
}

void OUTLINED_FUNCTION_167()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_169()
{
  return sub_1C03E3D88();
}

void OUTLINED_FUNCTION_171(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t OUTLINED_FUNCTION_172@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_173(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C03B934C(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_174()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_175@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_176(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

BOOL OUTLINED_FUNCTION_178(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_179()
{
  return swift_bridgeObjectRelease();
}

void sub_1C03C52AC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_18_3(a1, a2), (v7 & 1) != 0))
  {
    sub_1C03BA638(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    *a4 = 0u;
    a4[1] = 0u;
    OUTLINED_FUNCTION_7();
  }
}

void sub_1C03C52F4(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_1C03B9B8C();
    if ((v2 & 1) != 0)
      swift_retain();
  }
  OUTLINED_FUNCTION_7();
}

void sub_1C03C5330(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_18_3(a1, a2), (v7 & 1) != 0))
  {
    sub_1C03B698C(*(_QWORD *)(v4 + 56) + 48 * v6, (uint64_t)a4);
  }
  else
  {
    a4[1] = 0u;
    a4[2] = 0u;
    *a4 = 0u;
    OUTLINED_FUNCTION_7();
  }
}

void sub_1C03C5380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_18_3(a1, a2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_7();
}

uint64_t DirectInvocationUserDataKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C03C53EC + 4 * byte_1C03E5BF0[*v0]))(0xD000000000000013, 0x80000001C03E6640);
}

uint64_t sub_1C03C53EC()
{
  return 0x6E6F69746361;
}

uint64_t sub_1C03C5400(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_1C03C5418()
{
  return 0x697461636F766E69;
}

uint64_t sub_1C03C543C()
{
  return 0x6F43676F6C616964;
}

uint64_t sub_1C03C5460()
{
  return 0x6974736567677573;
}

SiriSuggestionsSupport::DirectInvocationAction_optional __swiftcall DirectInvocationAction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  SiriSuggestionsSupport::DirectInvocationAction_optional result;

  v3 = v1;
  sub_1C03E4388();
  OUTLINED_FUNCTION_12_6();
  v4 = 4;
  if (v2 < 4)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_28_0();
  return result;
}

uint64_t DirectInvocationAction.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C03C54F8 + 4 * byte_1C03E5BF6[*v0]))(0xD000000000000011, 0x80000001C03E65D0);
}

uint64_t sub_1C03C54F8()
{
  return 0x69726953776F6873;
}

uint64_t sub_1C03C5518(uint64_t a1)
{
  return a1 + 2;
}

SiriSuggestionsSupport::DirectInvocationUserDataKey_optional __swiftcall DirectInvocationUserDataKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  SiriSuggestionsSupport::DirectInvocationUserDataKey_optional result;

  v3 = v1;
  sub_1C03E4388();
  OUTLINED_FUNCTION_12_6();
  v4 = 6;
  if (v2 < 6)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_28_0();
  return result;
}

void sub_1C03C5588(char *a1)
{
  sub_1C03DEEB0(*a1);
}

void sub_1C03C5594()
{
  sub_1C03DF334();
}

void sub_1C03C559C(uint64_t a1)
{
  char *v1;

  sub_1C03DF388(a1, *v1);
}

void sub_1C03C55A4()
{
  sub_1C03DF5E8();
}

SiriSuggestionsSupport::DirectInvocationUserDataKey_optional sub_1C03C55AC(Swift::String *a1)
{
  return DirectInvocationUserDataKey.init(rawValue:)(*a1);
}

void sub_1C03C55B8(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = DirectInvocationUserDataKey.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_7();
}

void sub_1C03C55D8(char *a1)
{
  sub_1C03DF03C(*a1);
}

void sub_1C03C55E4()
{
  sub_1C03DF340();
}

void sub_1C03C55EC(uint64_t a1)
{
  char *v1;

  sub_1C03DF450(a1, *v1);
}

void sub_1C03C55F4()
{
  sub_1C03DF5DC();
}

SiriSuggestionsSupport::DirectInvocationAction_optional sub_1C03C55FC(Swift::String *a1)
{
  return DirectInvocationAction.init(rawValue:)(*a1);
}

void sub_1C03C5608(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = DirectInvocationAction.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_7();
}

id static DirectInvocationFactory.createExecute(suggestion:)()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  __n128 *inited;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  unint64_t v16;
  void *v17;

  sub_1C03E3A10();
  v0 = v17;
  sub_1C03B0F30((uint64_t)&v15);
  if (v0)
  {
    sub_1C03E2F60();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_22_3();
    sub_1C03E3A28();
    sub_1C03A858C(&qword_1EF5FDBC0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA56E0], MEMORY[0x1E0DA56F0]);
    v1 = sub_1C03E2F48();
    sub_1C03C5F08(v1, v2);
    v3 = sub_1C03E2FE4();
    v5 = v4;
    OUTLINED_FUNCTION_11_6();
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_11_6();
    sub_1C03C5F4C();
    v6 = OUTLINED_FUNCTION_15_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDBD0);
    inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_4_6(inited, (__n128)xmmword_1C03E55D0);
    v15 = v8;
    v16 = v9;
    v10 = MEMORY[0x1E0DEA968];
    OUTLINED_FUNCTION_8_3();
    inited[6].n128_u64[0] = v10;
    inited[4].n128_u64[1] = 0xD000000000000011;
    inited[5].n128_u64[0] = 0x80000001C03E65D0;
    v15 = 0x6974736567677573;
    v16 = 0xEA00000000006E6FLL;
    OUTLINED_FUNCTION_8_3();
    inited[10].n128_u64[1] = v10;
    inited[9].n128_u64[0] = v3;
    inited[9].n128_u64[1] = v5;
    v11 = sub_1C03E404C();
    sub_1C03C5F88(v11, v6);
    v12 = (void *)objc_opt_self();
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9C800]), sel_init);
    v0 = objc_msgSend(v12, sel_runSiriKitExecutorCommandWithContext_payload_, v13, v6);

  }
  return v0;
}

id sub_1C03C58D4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1C03E4088();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

id static DirectInvocationFactory.createShowMore(suggestions:)()
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
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  __n128 *inited;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_38();
  v3 = v2 - v1;
  v4 = sub_1C03E3C68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_38();
  v8 = v7 - v6;
  v9 = sub_1C03E3914();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA55B8];
  v33 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_38();
  v13 = v12 - v11;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E0DA61A0], v4);
  v14 = sub_1C03E302C();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v14);
  sub_1C03E38D8();
  sub_1C03E2F60();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_22_3();
  sub_1C03A858C(&qword_1EF5FDBD8, v10, MEMORY[0x1E0DA55C8]);
  v15 = sub_1C03E2F48();
  sub_1C03C5F08(v15, v16);
  v32 = sub_1C03E2FE4();
  v18 = v17;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_14_3();
  swift_allocObject();
  OUTLINED_FUNCTION_22_3();
  sub_1C03E3AD0();
  sub_1C03A858C(&qword_1ED738230, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57B8]);
  v19 = sub_1C03E2F48();
  sub_1C03C5F08(v19, v21);
  v31 = sub_1C03E2FE4();
  v23 = v22;
  OUTLINED_FUNCTION_13_5();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_13_5();
  sub_1C03C5F4C();
  v24 = OUTLINED_FUNCTION_15_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDBD0);
  inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_4_6(inited, (__n128)xmmword_1C03E5820);
  v26 = MEMORY[0x1E0DEA968];
  OUTLINED_FUNCTION_0_5();
  inited[6].n128_u64[0] = v26;
  inited[4].n128_u64[1] = 0xD000000000000013;
  inited[5].n128_u64[0] = 0x80000001C03E65F0;
  OUTLINED_FUNCTION_0_5();
  inited[10].n128_u64[1] = v26;
  inited[9].n128_u64[0] = v32;
  inited[9].n128_u64[1] = v18;
  OUTLINED_FUNCTION_0_5();
  inited[15].n128_u64[0] = v26;
  inited[13].n128_u64[1] = v31;
  inited[14].n128_u64[0] = v23;
  v27 = sub_1C03E404C();
  sub_1C03C5F88(v27, v24);
  v28 = (void *)objc_opt_self();
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9C800]), sel_init);
  v30 = objc_msgSend(v28, sel_runSiriKitExecutorCommandWithContext_payload_, v29, v24);

  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v13, v9);
  return v30;
}

void Parse.DirectInvocation.getUserData(for:)(unsigned __int8 *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  if (sub_1C03E31D0())
    __asm { BR              X9 }
  *a2 = 0u;
  a2[1] = 0u;
  OUTLINED_FUNCTION_28_0();
}

uint64_t sub_1C03C5E68(uint64_t a1)
{
  uint64_t v1;

  sub_1C03C52AC(a1 + 3, 0x80000001C03E6660, v1);
  swift_bridgeObjectRelease(0x80000001C03E6660);
  return swift_bridgeObjectRelease(v1);
}

uint64_t sub_1C03C5E80()
{
  uint64_t v0;

  sub_1C03C52AC(0x697461636F766E69, 0xEE00657079546E6FLL, v0);
  swift_bridgeObjectRelease(0xEE00657079546E6FLL);
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1C03C5F08(uint64_t a1, unint64_t a2)
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

unint64_t sub_1C03C5F4C()
{
  unint64_t result;

  result = qword_1EF5FDBC8;
  if (!qword_1EF5FDBC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF5FDBC8);
  }
  return result;
}

void sub_1C03C5F88(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_1C03E4034();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);

}

unint64_t sub_1C03C5FF8()
{
  unint64_t result;

  result = qword_1EF5FDBE0;
  if (!qword_1EF5FDBE0)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for DirectInvocationUserDataKey, &type metadata for DirectInvocationUserDataKey);
    atomic_store(result, (unint64_t *)&qword_1EF5FDBE0);
  }
  return result;
}

unint64_t sub_1C03C6038()
{
  unint64_t result;

  result = qword_1EF5FDBE8;
  if (!qword_1EF5FDBE8)
  {
    result = MEMORY[0x1C3B99EA8]("-\a]'H5", &type metadata for DirectInvocationAction);
    atomic_store(result, (unint64_t *)&qword_1EF5FDBE8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DirectInvocationUserDataKey(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DirectInvocationUserDataKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C03C6148 + 4 * byte_1C03E5C05[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1C03C617C + 4 * byte_1C03E5C00[v4]))();
}

uint64_t sub_1C03C617C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C6184(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03C618CLL);
  return result;
}

uint64_t sub_1C03C6198(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03C61A0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1C03C61A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C61AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DirectInvocationUserDataKey()
{
  OUTLINED_FUNCTION_162();
}

uint64_t getEnumTagSinglePayload for DirectInvocationAction(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DirectInvocationAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1C03C6298 + 4 * byte_1C03E5C0F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C03C62CC + 4 * byte_1C03E5C0A[v4]))();
}

uint64_t sub_1C03C62CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C62D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03C62DCLL);
  return result;
}

uint64_t sub_1C03C62E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03C62F0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C03C62F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03C62FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DirectInvocationAction()
{
  OUTLINED_FUNCTION_162();
}

void type metadata accessor for DirectInvocationFactory()
{
  OUTLINED_FUNCTION_162();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_1C03E428C();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_release();
}

__n128 *OUTLINED_FUNCTION_4_6(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_1C03E428C();
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1C03B57E8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1C03B57E8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C03B57E8(v1, v0);
}

id OUTLINED_FUNCTION_15_3()
{
  return sub_1C03C58D4();
}

unint64_t OUTLINED_FUNCTION_18_3(uint64_t a1, uint64_t a2)
{
  return sub_1C03B9B28(a1, a2);
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return sub_1C03E2F54();
}

id SiriSuggestionsServiceDelegate.__allocating_init(with:eventDrivenClient:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)(a1, a2);
}

id SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  id v4;
  objc_super v6;

  *(_QWORD *)&v2[OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_client] = a1;
  sub_1C03AE6B0(a2, (uint64_t)&v2[OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient]);
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SiriSuggestionsServiceDelegate();
  v4 = objc_msgSendSuper2(&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v4;
}

uint64_t type metadata accessor for SiriSuggestionsServiceDelegate()
{
  return objc_opt_self();
}

uint64_t sub_1C03C6484(int a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;

  v3 = v2;
  objc_msgSend(a2, sel_processIdentifier);
  sub_1C03E3710();
  sub_1C03E3704();
  v5 = (void *)sub_1C03E4088();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(a2, sel_valueForEntitlement_, v5);

  if (v6)
  {
    sub_1C03E4274();
    v7 = swift_unknownObjectRelease();
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  OUTLINED_FUNCTION_2_4(v7, v8, v9);
  if (v39)
  {
    if ((OUTLINED_FUNCTION_1_2() & 1) != 0 && (v36 & 1) != 0)
    {
      sub_1C03E36F8();
      v10 = (void *)sub_1C03E4088();
      swift_bridgeObjectRelease();
      v11 = objc_msgSend(a2, sel_valueForEntitlement_, v10);

      if (v11)
      {
        sub_1C03E4274();
        v12 = swift_unknownObjectRelease();
      }
      else
      {
        v40 = 0u;
        v41 = 0u;
      }
      OUTLINED_FUNCTION_2_4(v12, v13, v14);
      v21 = OUTLINED_FUNCTION_1_2();
      if (v21)
        v22 = v36;
      else
        v22 = 0;
      if (v21)
        v23 = v37;
      else
        v23 = 0;
      v24 = (void *)objc_opt_self();
      v25 = objc_msgSend(v24, sel_interfaceWithProtocol_, &unk_1EF6014C0);
      v26 = objc_msgSend(v24, sel_interfaceWithProtocol_, &unk_1EF601838);
      -[NSObject setInterface:forSelector:argumentIndex:ofReply:](v25, sel_setInterface_forSelector_argumentIndex_ofReply_, v26, sel_getSuggestionsForAppWithAppBundleId_placementId_entities_intentToSuggest_bridge_completionHandler_, 4, 0);
      objc_msgSend(a2, sel_setExportedInterface_, v25);
      v27 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_client);
      sub_1C03AE6B0(v3 + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient, (uint64_t)&v38);
      v28 = qword_1ED737FC0;
      swift_retain();
      if (v28 != -1)
        swift_once();
      v29 = qword_1ED7382D0;
      type metadata accessor for XPCAccessList();
      v30 = swift_allocObject();
      *(_QWORD *)(v30 + 16) = v29;
      type metadata accessor for SiriSuggestionsXPCService();
      swift_allocObject();
      v31 = sub_1C03D7D78(v27, &v38, v22, v23, v30);
      swift_bridgeObjectRetain();
      objc_msgSend(a2, sel_setExportedObject_, v31);
      swift_release();
      objc_msgSend(a2, sel_resume);
      if (qword_1ED738B38 != -1)
        swift_once();
      v32 = sub_1C03E4028();
      __swift_project_value_buffer(v32, (uint64_t)qword_1ED738B20);
      v33 = sub_1C03E4010();
      v34 = sub_1C03E41E4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)OUTLINED_FUNCTION_4_7();
        *(_DWORD *)v35 = 67240192;
        OUTLINED_FUNCTION_0_6();
        _os_log_impl(&dword_1C03A5000, v33, v34, "process [%{public}d] is connected to siri suggestions xpc service", v35, 8u);
        OUTLINED_FUNCTION_5_0();
      }

      v19 = 1;
      v16 = v25;
      goto LABEL_15;
    }
  }
  else
  {
    sub_1C03C6954((uint64_t)&v38);
  }
  if (qword_1ED738B38 != -1)
    swift_once();
  v15 = sub_1C03E4028();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED738B20);
  v16 = sub_1C03E4010();
  v17 = sub_1C03E41FC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)OUTLINED_FUNCTION_4_7();
    *(_DWORD *)v18 = 67240192;
    OUTLINED_FUNCTION_0_6();
    _os_log_impl(&dword_1C03A5000, v16, v17, "process [%{public}d] is not entitled to call the Siri Suggestions service.\nAdd the proper entitlements and try again.", v18, 8u);
    OUTLINED_FUNCTION_5_0();
  }
  v19 = 0;
LABEL_15:

  return v19;
}

uint64_t sub_1C03C690C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED737E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03C6954(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED737E30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SiriSuggestionsServiceDelegate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SiriSuggestionsServiceDelegate.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SiriSuggestionsServiceDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriSuggestionsServiceDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C03C6AB0()
{
  return sub_1C03E4238();
}

uint64_t sub_1C03C6AD4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t method lookup function for SiriSuggestionsServiceDelegate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSuggestionsServiceDelegate.__allocating_init(with:eventDrivenClient:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SiriSuggestionsServiceDelegate.listener(_:shouldAcceptNewConnection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  return sub_1C03C690C((uint64_t)va1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_slowAlloc();
}

uint64_t sub_1C03C6B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a2;
  v29 = a4;
  v24 = sub_1C03E3A28();
  v7 = *(_QWORD *)(v24 - 8);
  v8 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v30 = MEMORY[0x1E0DEE9D8];
  v26 = *(_QWORD *)(a1 + 16);
  if (v26)
  {
    v14 = 0;
    v22 = a1;
    v23 = a3;
    v15 = v24;
    while (v14 < *(_QWORD *)(a1 + 16))
    {
      v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v17 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a1 + v16 + v17 * v14, v15);
      v18 = sub_1C03CA79C((uint64_t)v12, v28, a3);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v15);
        swift_bridgeObjectRelease();
        v13 = v30;
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if ((v18 & 1) != 0)
      {
        v25 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v25(v27, v12, v15);
        v19 = v30;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C03CDDD8();
          v19 = v30;
        }
        v20 = *(_QWORD *)(v19 + 16);
        if (v20 >= *(_QWORD *)(v19 + 24) >> 1)
        {
          sub_1C03CDDD8();
          v19 = v30;
        }
        *(_QWORD *)(v19 + 16) = v20 + 1;
        v21 = v24;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(v19 + v16 + v20 * v17, v27, v24);
        v30 = v19;
        v15 = v21;
        a1 = v22;
        a3 = v23;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v15);
      }
      if (v26 == ++v14)
      {
        v13 = v30;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_1C03C6DA4(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_1C03CFBF8(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v3 >= v5)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C03C6E10(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = a1;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_1C03E4340();
  swift_bridgeObjectRelease();
LABEL_4:
  result = sub_1C03CFBF8(0, v3, v5);
  if ((v7 & 1) != 0)
    v8 = v5;
  else
    v8 = result;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1C03E4340();
    result = swift_bridgeObjectRelease();
    if (v10 < 0)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v9 = sub_1C03E4340();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    sub_1C03D002C(0, &qword_1EF5FDE40);
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      sub_1C03E42A4();
      v11 = v12;
    }
    while (v8 != v12);
  }
  if (!v4)
    return v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v13 = sub_1C03E434C();
  swift_bridgeObjectRelease_n();
  return v13;
}

void sub_1C03C6FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  __int128 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[40];
  _BYTE v66[40];

  OUTLINED_FUNCTION_10_3();
  v64 = v22;
  v24 = v23;
  v59 = v23;
  v60 = v25;
  v27 = v26;
  v62 = v28;
  v30 = v29;
  v32 = v31;
  v33 = OUTLINED_FUNCTION_15();
  v63 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_23_2();
  v36 = v34 - v35;
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_88_0();
  sub_1C03C77FC();
  type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  OUTLINED_FUNCTION_18_4();
  sub_1C03ABB30(v24, (uint64_t)v66);
  v38 = v30;
  v39 = OUTLINED_FUNCTION_84_0();
  sub_1C03A9AC4(v39, v40, v41);
  v61 = v42;
  OUTLINED_FUNCTION_18_4();
  sub_1C03ABB30(v32, (uint64_t)v66);
  type metadata accessor for SiriHelpResponseFramework1Invoker(0);
  OUTLINED_FUNCTION_19();
  v43 = v38;
  sub_1C03D0164(v27);
  v44 = OUTLINED_FUNCTION_84_0();
  sub_1C03A9148(v44, v45, v46, v27, v60);
  v48 = v47;
  OUTLINED_FUNCTION_18_4();
  sub_1C03ABB30(v59, (uint64_t)v66);
  swift_allocObject();
  v49 = OUTLINED_FUNCTION_84_0();
  v52 = sub_1C03A9A04(v49, v50, v51, 1);
  sub_1C03E3DF4();
  v53 = v43;
  v54 = sub_1C03E3DE8();
  type metadata accessor for SiriHelpResponseVersionInvoker();
  v55 = (_QWORD *)OUTLINED_FUNCTION_36();
  v56 = sub_1C03D02A8(v54, v48, v61, v52, v55);
  sub_1C03ABB30(v62, (uint64_t)v66);
  OUTLINED_FUNCTION_18_4();
  sub_1C03ABB30(a21, (uint64_t)v65);
  v57 = OUTLINED_FUNCTION_19();
  v58 = v53;
  swift_retain();
  sub_1C03D0174((uint64_t)v56, (uint64_t)v30, (uint64_t)v66, v64, v36, (uint64_t)v65, v57);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v21, v33);
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03C71D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C03C71E4(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9F4B0], a2);
}

uint64_t sub_1C03C71E4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = a2(0);
  v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v7);
}

void sub_1C03C725C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;

  v31 = a5;
  v9 = sub_1C03E35B4();
  v29 = *(_QWORD *)(v9 - 8);
  v30 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a4 >> 1;
  v33 = a3;
  v12 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_19;
  if (v12)
  {
    v34 = MEMORY[0x1E0DEE9D8];
    sub_1C03CDE0C();
    if (v12 < 0)
    {
LABEL_20:
      __break(1u);
      return;
    }
    v25[1] = v5;
    v13 = v34;
    v14 = (void *)objc_opt_self();
    v15 = 0;
    v26 = a2 + 8 * v33;
    v27 = v14;
    v28 = v12;
    while (1)
    {
      v16 = v15 + 1;
      if (__OFADD__(v15, 1))
        break;
      if (v33 + v15 >= v32 || v15 >= v12)
        goto LABEL_18;
      v18 = *(id *)(v26 + 8 * v15);
      v19 = objc_msgSend(v18, sel_fullPrint);
      sub_1C03E4094();

      sub_1C03E3548();
      v20 = objc_msgSend(v18, sel_fullPrint);
      if (!v20)
      {
        sub_1C03E4094();
        v20 = (id)sub_1C03E4088();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      v21 = (void *)sub_1C03E4088();
      swift_bridgeObjectRelease();
      v22 = objc_msgSend(v27, sel_quote_forLocale_, v20, v21);

      sub_1C03E4094();
      sub_1C03E3590();
      v23 = objc_msgSend(v18, sel_dialogId);
      sub_1C03E4094();

      sub_1C03E3554();
      v34 = v13;
      v24 = *(_QWORD *)(v13 + 16);
      if (v24 >= *(_QWORD *)(v13 + 24) >> 1)
      {
        sub_1C03CDE0C();
        v13 = v34;
      }
      *(_QWORD *)(v13 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v13+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v24, v11, v30);
      ++v15;
      v12 = v28;
      if (v16 == v28)
        return;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
}

uint64_t sub_1C03C7528(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v17;

  v4 = v2;
  v15 = sub_1C03E35B4();
  v6 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_24_2();
  v7 = *(_QWORD *)(a1 + 16);
  v8 = MEMORY[0x1E0DEE9D8];
  if (v7)
  {
    v17 = MEMORY[0x1E0DEE9D8];
    sub_1C03CDE0C();
    v8 = v17;
    v9 = *(_QWORD *)(sub_1C03E3A28() - 8);
    v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      sub_1C03CACE4(v10, a2);
      if (v4)
        break;
      v4 = 0;
      v12 = *(_QWORD *)(v17 + 16);
      if (v12 >= *(_QWORD *)(v17 + 24) >> 1)
        sub_1C03CDE0C();
      *(_QWORD *)(v17 + 16) = v12 + 1;
      OUTLINED_FUNCTION_99();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v17 + v13 + *(_QWORD *)(v6 + 72) * v12, v3, v15);
      v10 += v11;
      if (!--v7)
        return v8;
    }
    swift_release();
  }
  return v8;
}

uint64_t sub_1C03C7684(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_1C03E4340())
  {
    v7 = 4;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x1C3B998FC](v7 - 4, a3);
      }
      else
      {
        v8 = *(_QWORD *)(a3 + 8 * v7);
        swift_retain();
      }
      v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v12 = v8;
      v10 = a1(&v12);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return v8;
      }
      if ((v10 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
      swift_release();
      ++v7;
      if (v9 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1C03C77B0()
{
  return 0xD000000000000011;
}

void sub_1C03C77CC()
{
  strcpy((char *)&qword_1EF5FDCC0, "com.apple.siri");
  algn_1EF5FDCC8[7] = -18;
}

void sub_1C03C77FC()
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_10_3();
  v35 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFA8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_38();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_15();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_38_1();
  v10 = v9;
  OUTLINED_FUNCTION_129_0();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v34 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v34 - v16;
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_94_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_88_0();
  sub_1C03E2FA8();
  sub_1C03E2F78();
  OUTLINED_FUNCTION_10();
  v37 = v1;
  OUTLINED_FUNCTION_93(v0, v1);
  sub_1C03E2F9C();
  sub_1C03D002C(0, &qword_1EF5FDE68);
  OUTLINED_FUNCTION_93((uint64_t)v17, v0);
  v19 = sub_1C03C7BAC((uint64_t)v17);
  v20 = (void *)objc_opt_self();
  v36 = v19;
  v21 = objc_msgSend(v20, sel_bundleTemplateDir_, v19);
  if (v21)
  {
    v22 = v21;
    sub_1C03E4094();

    sub_1C03E2F84();
    OUTLINED_FUNCTION_54_0(v6, 0);
    OUTLINED_FUNCTION_55_1();
  }
  else
  {
    OUTLINED_FUNCTION_54_0(v6, 1);
  }
  OUTLINED_FUNCTION_93((uint64_t)v14, v37);
  OUTLINED_FUNCTION_98(v6, 1, v7);
  v23 = v10;
  if (v24)
  {
    v25 = v35;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v35, v14, v7);
    sub_1C03ABAE4(v6, &qword_1EF5FCFA8);
  }
  else
  {
    OUTLINED_FUNCTION_48_2((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    v25 = v35;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v35, v6, v7);
  }
  if (qword_1ED738B40 != -1)
    swift_once();
  v26 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v26, (uint64_t)qword_1ED738B48);
  OUTLINED_FUNCTION_93(v23, v25);
  v27 = sub_1C03E4010();
  v28 = sub_1C03E41E4();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)OUTLINED_FUNCTION_16();
    v30 = OUTLINED_FUNCTION_16();
    v35 = v8;
    v38 = v30;
    *(_DWORD *)v29 = 136315138;
    sub_1C03A858C(&qword_1EF5FCFE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v31 = sub_1C03E43E8();
    v33 = sub_1C03B934C(v31, v32, &v38);
    OUTLINED_FUNCTION_119_0(v33);
    sub_1C03E4238();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_80_0(v23);
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v27, v28, "Creating platform safe URL: %s", v29);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_80_0(v23);
  OUTLINED_FUNCTION_80_0(v0);
  OUTLINED_FUNCTION_80_0(v37);
  OUTLINED_FUNCTION_69();
}

id sub_1C03C7BAC(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1C03E2F90();
  v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  v5 = sub_1C03E2FC0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

uint64_t sub_1C03C7C28(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  _QWORD *v16;

  v3[62] = a2;
  v3[63] = v2;
  v3[61] = a1;
  v3[64] = *v2;
  v6 = OUTLINED_FUNCTION_8();
  v3[65] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[66] = v7;
  v3[67] = *(_QWORD *)(v7 + 64);
  v3[68] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  v3[69] = OUTLINED_FUNCTION_3_0();
  v8 = sub_1C03E31B8();
  v3[70] = v8;
  v3[71] = *(_QWORD *)(v8 - 8);
  v3[72] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFA8);
  v3[73] = OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE00);
  v3[74] = OUTLINED_FUNCTION_3_0();
  v9 = sub_1C03E3B0C();
  v3[75] = v9;
  v3[76] = *(_QWORD *)(v9 - 8);
  v3[77] = OUTLINED_FUNCTION_3_0();
  v10 = sub_1C03E3B18();
  v3[78] = v10;
  v3[79] = *(_QWORD *)(v10 - 8);
  v3[80] = OUTLINED_FUNCTION_103();
  v3[81] = OUTLINED_FUNCTION_103();
  v11 = sub_1C03E3B30();
  v3[82] = v11;
  v3[83] = *(_QWORD *)(v11 - 8);
  v3[84] = OUTLINED_FUNCTION_3_0();
  v12 = sub_1C03E3A28();
  v3[85] = v12;
  v3[86] = *(_QWORD *)(v12 - 8);
  v3[87] = OUTLINED_FUNCTION_103();
  v3[88] = OUTLINED_FUNCTION_103();
  v3[89] = OUTLINED_FUNCTION_103();
  v3[90] = OUTLINED_FUNCTION_103();
  v3[91] = OUTLINED_FUNCTION_103();
  v13 = sub_1C03E34AC();
  v3[92] = v13;
  v3[93] = *(_QWORD *)(v13 - 8);
  v3[94] = OUTLINED_FUNCTION_3_0();
  v14 = OUTLINED_FUNCTION_15();
  v3[95] = v14;
  v3[96] = *(_QWORD *)(v14 - 8);
  v3[97] = OUTLINED_FUNCTION_103();
  v3[98] = OUTLINED_FUNCTION_103();
  v3[99] = OUTLINED_FUNCTION_103();
  v15 = sub_1C03E3680();
  v3[100] = v15;
  v3[101] = *(_QWORD *)(v15 - 8);
  v3[102] = OUTLINED_FUNCTION_3_0();
  v16 = (_QWORD *)swift_task_alloc();
  v3[103] = v16;
  *v16 = v3;
  v16[1] = sub_1C03C7E3C;
  return sub_1C03C98F8(a1, a2);
}

uint64_t sub_1C03C7E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = (_QWORD *)*v4;
  v5[42] = v4;
  v5[43] = a1;
  v5[44] = a2;
  v5[45] = a3;
  v5[46] = a4;
  v5[104] = a1;
  v5[105] = a2;
  v5[106] = a4;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C7EA0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  id v4;
  uint64_t v5;
  unint64_t p_superclass;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  os_log_t v32;
  os_log_type_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  void (*v43)(unint64_t, uint64_t, uint64_t);
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void (*v72)(unint64_t, uint64_t, uint64_t);
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t, _QWORD);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95[2];

  v1 = *(_QWORD *)(v0 + 504);
  swift_bridgeObjectRetain();
  sub_1C03E3674();
  v2 = *(void **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  if (v2)
  {
    v3 = *(char **)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  }
  else
  {
    sub_1C03E3440();
    v3 = (char *)sub_1C03E3434();
    v2 = 0;
  }
  *(_QWORD *)(v0 + 856) = v3;
  *(_QWORD *)(v0 + 408) = 0;
  *(_QWORD *)(v0 + 416) = 0xE000000000000000;
  v4 = v2;
  v5 = sub_1C03E3404();
  sub_1C03C52AC(0x656C61636F6CLL, 0xE600000000000000, v5, (_OWORD *)(v0 + 376));
  OUTLINED_FUNCTION_10();
  p_superclass = (unint64_t)&OBJC_METACLASS____TtC22SiriSuggestionsSupport13XPCAccessList.superclass;
  if (!*(_QWORD *)(v0 + 400))
  {
    sub_1C03ABAE4(v0 + 376, qword_1ED737E30);
LABEL_8:
    if (qword_1ED738B40 == -1)
      goto LABEL_9;
    goto LABEL_70;
  }
  if (!OUTLINED_FUNCTION_47_1())
    goto LABEL_8;
  v8 = *(_QWORD *)(v0 + 424);
  v7 = *(_QWORD *)(v0 + 432);
  OUTLINED_FUNCTION_95_0();
  *(_QWORD *)(v0 + 408) = v8;
  *(_QWORD *)(v0 + 416) = v7;
  while (1)
  {
    v92 = *(char **)(*(_QWORD *)(v0 + 832) + 16);
    if (!v92)
      break;
    v89 = *(_QWORD *)(v0 + 832);
    v3 = (char *)(v0 + 96);
    sub_1C03E3A94();
    if (qword_1EF5FCB18 != -1)
      swift_once();
    v17 = *(_QWORD *)(v0 + 832);
    v18 = *(_QWORD *)(v0 + 512);
    v19 = qword_1EF5FDCC0;
    OUTLINED_FUNCTION_100_0();
    v20 = sub_1C03CA390(v0 + 96, v19);
    p_superclass = v21;
    OUTLINED_FUNCTION_76_0();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
    v80 = sub_1C03E38E4();
    sub_1C03E3A94();
    v22 = v20;
    sub_1C03CA66C(v0 + 136);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_111_0();
    v23 = sub_1C03C6B70(v17, v20, p_superclass, v18);
    v24 = v22 == qword_1EF5FDCC0 && p_superclass == *(_QWORD *)algn_1EF5FDCC8;
    v78 = v22;
    v79 = p_superclass;
    if (v24 || (sub_1C03E43F4() & 1) != 0 || !*(_QWORD *)(v23 + 16))
    {
      OUTLINED_FUNCTION_118_0();
      v23 = *(_QWORD *)(v0 + 832);
LABEL_26:
      v95[0] = v23;
      swift_bridgeObjectRetain();
      v76 = swift_bridgeObjectRetain();
      sub_1C03CC29C(v76);
      v35 = v23;
      v77 = v23;
      if ((v80 & 1) == 0)
        goto LABEL_47;
      v36 = MEMORY[0x1E0DEE9D8];
      v95[0] = MEMORY[0x1E0DEE9D8];
      v87 = *(_QWORD *)(v35 + 16);
      if (!v87)
      {
LABEL_46:
        OUTLINED_FUNCTION_106();
        v35 = v36;
LABEL_47:
        v83 = (uint64_t *)(v0 + 408);
        sub_1C03E35D8();
        v55 = *(_QWORD *)(v35 + 16);
        if (v55)
        {
          v56 = *(_QWORD *)(v0 + 688);
          v91 = *(_QWORD *)(v0 + 608);
          v95[0] = MEMORY[0x1E0DEE9D8];
          sub_1C03CDE40(0, v55, 0);
          OUTLINED_FUNCTION_99();
          v58 = v35 + v57;
          v88 = *(_QWORD *)(v56 + 72);
          v94 = v56;
          v86 = *(void (**)(uint64_t, uint64_t, _QWORD))(v56 + 16);
          do
          {
            v59 = *(_QWORD *)(v0 + 696);
            v60 = *(_QWORD *)(v0 + 616);
            v86(v59, v58, *(_QWORD *)(v0 + 680));
            sub_1C03E39EC();
            v61 = sub_1C03E3ADC();
            v63 = v62;
            OUTLINED_FUNCTION_102_0(v60, *(uint64_t (**)(uint64_t, uint64_t))(v91 + 8));
            OUTLINED_FUNCTION_89(v59, *(uint64_t (**)(uint64_t, uint64_t))(v94 + 8));
            v64 = v95[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              OUTLINED_FUNCTION_104_0(0, *(_QWORD *)(v95[0] + 16) + 1);
              v64 = v95[0];
            }
            v66 = *(_QWORD *)(v64 + 16);
            v65 = *(_QWORD *)(v64 + 24);
            if (v66 >= v65 >> 1)
            {
              OUTLINED_FUNCTION_104_0((char *)(v65 > 1), v66 + 1);
              v64 = v95[0];
            }
            *(_QWORD *)(v64 + 16) = v66 + 1;
            v67 = v64 + 16 * v66;
            *(_QWORD *)(v67 + 32) = v61;
            *(_QWORD *)(v67 + 40) = v63;
            v58 += v88;
            --v55;
          }
          while (v55);
          swift_bridgeObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_106();
        }
        sub_1C03E35FC();
        sub_1C03C7528(v77, v83);
        swift_bridgeObjectRelease();
        sub_1C03E3620();
        sub_1C03C7528(v76, v83);
        OUTLINED_FUNCTION_55_1();
        sub_1C03E35F0();
        sub_1C03E365C();
        *(_QWORD *)(v0 + 920) = v79;
        *(_QWORD *)(v0 + 912) = v78;
        *(_BYTE *)(v0 + 976) = v80 & 1;
        __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 504) + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils), *(_QWORD *)(*(_QWORD *)(v0 + 504) + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils + 24));
        sub_1C03E3FB0();
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
        v68 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 928) = v68;
        *v68 = v0;
        v68[1] = sub_1C03C8F44;
        OUTLINED_FUNCTION_25_3();
        return sub_1C03E3D28();
      }
      v37 = 0;
      p_superclass = *(_QWORD *)(v0 + 688);
      v85 = *(_QWORD *)(v0 + 664);
      v82 = *(_QWORD *)(v0 + 632);
      v81 = *MEMORY[0x1E0DA5828];
      v84 = v35;
      while (v37 < *(_QWORD *)(v35 + 16))
      {
        v38 = *(_QWORD *)(v0 + 672);
        v39 = *(_QWORD *)(v0 + 648);
        v40 = *(_QWORD *)(v0 + 640);
        v3 = *(char **)(v0 + 624);
        OUTLINED_FUNCTION_99();
        v90 = v41;
        v93 = *(_QWORD *)(p_superclass + 72);
        OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t))(p_superclass + 16));
        sub_1C03E3A1C();
        sub_1C03E3B24();
        OUTLINED_FUNCTION_48_2(v38, *(uint64_t (**)(uint64_t, uint64_t))(v85 + 8));
        (*(void (**)(uint64_t, _QWORD, char *))(v82 + 104))(v40, v81, v3);
        sub_1C03A858C(&qword_1EF5FDE38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5848], MEMORY[0x1E0DA5858]);
        v42 = sub_1C03E407C();
        OUTLINED_FUNCTION_42_1(v40);
        OUTLINED_FUNCTION_42_1(v39);
        if ((v42 & 1) != 0)
        {
          OUTLINED_FUNCTION_78_0(*(_QWORD *)(v0 + 712));
          v35 = v84;
        }
        else
        {
          v43 = *(void (**)(unint64_t, uint64_t, uint64_t))(p_superclass + 32);
          v43(*(_QWORD *)(v0 + 704), *(_QWORD *)(v0 + 712), *(_QWORD *)(v0 + 680));
          if ((OUTLINED_FUNCTION_117_0() & 1) == 0)
          {
            OUTLINED_FUNCTION_5_4();
            v36 = v95[0];
          }
          v35 = v84;
          v44 = *(_QWORD *)(v36 + 16);
          v3 = (char *)(v44 + 1);
          if (v44 >= *(_QWORD *)(v36 + 24) >> 1)
          {
            sub_1C03CDDD8();
            v36 = v95[0];
          }
          v45 = *(_QWORD *)(v0 + 704);
          v46 = *(_QWORD *)(v0 + 680);
          *(_QWORD *)(v36 + 16) = v3;
          v43(v36 + v90 + v44 * v93, v45, v46);
          v95[0] = v36;
        }
        if (v87 == ++v37)
          goto LABEL_46;
      }
      __break(1u);
    }
    else
    {
      if (qword_1ED738B40 != -1)
        swift_once();
      v25 = OUTLINED_FUNCTION_29();
      __swift_project_value_buffer(v25, (uint64_t)qword_1ED738B48);
      swift_bridgeObjectRetain_n();
      v26 = (void *)sub_1C03E4010();
      v27 = sub_1C03E41F0();
      if (OUTLINED_FUNCTION_17(v27))
      {
        v28 = OUTLINED_FUNCTION_16();
        v95[0] = OUTLINED_FUNCTION_16();
        *(_DWORD *)v28 = 136315394;
        OUTLINED_FUNCTION_100_0();
        *(_QWORD *)(v0 + 440) = sub_1C03B934C(v78, p_superclass, v95);
        sub_1C03E4238();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 2080;
        v29 = qword_1EF5FDCC0;
        v30 = *(_QWORD *)algn_1EF5FDCC8;
        OUTLINED_FUNCTION_100_0();
        *(_QWORD *)(v0 + 448) = sub_1C03B934C(v29, v30, v95);
        sub_1C03E4238();
        OUTLINED_FUNCTION_76_0();
        OUTLINED_FUNCTION_127_0();
        _os_log_impl(v31, v32, v33, v34, (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_5_0();
      }
      OUTLINED_FUNCTION_14_2();

      v3 = 0;
      v69 = *(_QWORD *)(v0 + 688);
      v70 = MEMORY[0x1E0DEE9D8];
      v95[0] = MEMORY[0x1E0DEE9D8];
      while ((unint64_t)v3 < *(_QWORD *)(v89 + 16))
      {
        v71 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
        p_superclass = *(_QWORD *)(v69 + 72);
        OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t))(v69 + 16));
        if ((sub_1C03CA894() & 1) != 0)
        {
          v72 = *(void (**)(unint64_t, uint64_t, uint64_t))(v69 + 32);
          v72(*(_QWORD *)(v0 + 720), *(_QWORD *)(v0 + 728), *(_QWORD *)(v0 + 680));
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_5_4();
            v70 = v95[0];
          }
          v73 = *(_QWORD *)(v70 + 16);
          if (v73 >= *(_QWORD *)(v70 + 24) >> 1)
          {
            OUTLINED_FUNCTION_4_8();
            v70 = v95[0];
          }
          v74 = *(_QWORD *)(v0 + 720);
          v75 = *(_QWORD *)(v0 + 680);
          *(_QWORD *)(v70 + 16) = v73 + 1;
          v72(v70 + v71 + v73 * p_superclass, v74, v75);
          v95[0] = v70;
        }
        else
        {
          OUTLINED_FUNCTION_78_0(*(_QWORD *)(v0 + 728));
        }
        if (v92 == ++v3)
        {
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
      }
    }
    __break(1u);
LABEL_70:
    swift_once();
LABEL_9:
    v9 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B48);
    v10 = v3;
    v11 = sub_1C03E4010();
    v12 = sub_1C03E41FC();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_16();
      v95[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v13 = 136315138;
      sub_1C03E3404();
      v14 = sub_1C03E4040();
      v16 = v15;
      OUTLINED_FUNCTION_31();
      *(_QWORD *)(v0 + 472) = sub_1C03B934C(v14, v16, v95);
      sub_1C03E4238();
      OUTLINED_FUNCTION_10();

      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v11, v12, "Missing locale in %s, setting to empty", v13);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
    }

  }
  swift_bridgeObjectRelease();
  if (qword_1EF5FCB18 != -1)
    swift_once();
  v47 = *(_QWORD *)algn_1EF5FDCC8;
  *(_QWORD *)(v0 + 864) = qword_1EF5FDCC0;
  *(_QWORD *)(v0 + 872) = v47;
  v48 = *(_QWORD *)(p_superclass + 2880);
  swift_bridgeObjectRetain();
  if (v48 != -1)
    swift_once();
  v49 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v49, (uint64_t)qword_1ED738B48);
  v50 = OUTLINED_FUNCTION_21_2();
  v51 = sub_1C03E41FC();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v52 = 0;
    OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v50, v51, "Not enough suggestions returned, falling back to static suggestions", v52);
    OUTLINED_FUNCTION_5_0();
  }

  sub_1C03E347C();
  sub_1C03C77FC();
  *(_QWORD *)(v0 + 880) = sub_1C03E404C();
  *(_OWORD *)(v0 + 192) = 0u;
  *(_QWORD *)(v0 + 208) = 0;
  *(_OWORD *)(v0 + 176) = 0u;
  sub_1C03E34A0();
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 888) = v53;
  *v53 = v0;
  v53[1] = sub_1C03C8B40;
  OUTLINED_FUNCTION_25_3();
  return sub_1C03E3464();
}

uint64_t sub_1C03C8B40(uint64_t a1)
{
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
  uint64_t v15;
  uint64_t v16;

  v3 = (_QWORD *)*v2;
  v3[112] = a1;
  v3[113] = v1;
  swift_task_dealloc();
  if (v1)
  {
    v4 = v3[96];
    v15 = v3[95];
    v16 = v3[99];
    v5 = v3[94];
    v6 = v3[93];
    v7 = v3[92];
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_55_1();
    OUTLINED_FUNCTION_106();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10();
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    OUTLINED_FUNCTION_41_1(v8, &qword_1EF5FCFD8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  }
  else
  {
    v9 = v3[99];
    v10 = v3[96];
    v11 = v3[94];
    v12 = v3[93];
    swift_bridgeObjectRelease();
    v13 = OUTLINED_FUNCTION_41_2(v11, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    OUTLINED_FUNCTION_41_1(v13, &qword_1EF5FCFD8);
    OUTLINED_FUNCTION_52_2(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  }
  OUTLINED_FUNCTION_11();
  return swift_task_switch();
}

uint64_t sub_1C03C8C80()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v1 = objc_msgSend(*(id *)(v0 + 896), sel_dialog);
  sub_1C03D002C(0, &qword_1EF5FDE40);
  v2 = sub_1C03E4118();

  if (v2 < 0 || (v2 & 0x4000000000000000) != 0)
    goto LABEL_13;
  v3 = v2 & 0xFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_13_3();
  while (1)
  {
    sub_1C03CE288();
    OUTLINED_FUNCTION_31();
    v4 = sub_1C03C6E10(3, v3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    result = sub_1C03E35D8();
    v28 = v10;
    v12 = v10 >> 1;
    v13 = __OFSUB__(v10 >> 1, v8);
    v14 = (v10 >> 1) - v8;
    if (v13)
      break;
    v27 = v8;
    if (!v14)
    {
LABEL_11:
      v23 = *(void **)(v0 + 896);
      sub_1C03E35FC();
      sub_1C03C725C(v4, v6, v27, v28, v0 + 408);
      sub_1C03E3620();
      sub_1C03E35F0();
      swift_unknownObjectRelease();

      v24 = *(_QWORD *)(v0 + 864);
      *(_QWORD *)(v0 + 920) = *(_QWORD *)(v0 + 872);
      *(_QWORD *)(v0 + 912) = v24;
      *(_BYTE *)(v0 + 976) = 1;
      OUTLINED_FUNCTION_101_0((_QWORD *)(*(_QWORD *)(v0 + 504)
                                       + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils));
      sub_1C03E3FB0();
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      v25 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 928) = v25;
      *v25 = v0;
      v25[1] = sub_1C03C8F44;
      return sub_1C03E3D28();
    }
    v29 = MEMORY[0x1E0DEE9D8];
    result = (uint64_t)sub_1C03CDE40(0, v14 & ~(v14 >> 63), 0);
    if (v14 < 0)
      goto LABEL_15;
    while (v8 < v12)
    {
      v15 = *(id *)(v6 + 8 * v8);
      v16 = objc_msgSend(v15, sel_fullSpeak);
      v17 = sub_1C03E4094();
      v19 = v18;

      v21 = *(_QWORD *)(v29 + 16);
      v20 = *(_QWORD *)(v29 + 24);
      if (v21 >= v20 >> 1)
        OUTLINED_FUNCTION_104_0((char *)(v20 > 1), v21 + 1);
      *(_QWORD *)(v29 + 16) = v21 + 1;
      v22 = v29 + 16 * v21;
      *(_QWORD *)(v22 + 32) = v17;
      *(_QWORD *)(v22 + 40) = v19;
      if (v12 == ++v8)
        goto LABEL_11;
    }
    __break(1u);
LABEL_13:
    v26 = OUTLINED_FUNCTION_13_3();
    v3 = (unint64_t)sub_1C03CDBD0(v26);
    OUTLINED_FUNCTION_31();
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1C03C8F44()
{
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03C8F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t (*v30)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 320);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 328);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 320));
    MEMORY[0x1C3B991C4](v1, v2);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 296);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    sub_1C03ABAE4(v0 + 296, &qword_1EF5FDE10);
    *(_OWORD *)(v0 + 256) = 0u;
    *(_OWORD *)(v0 + 272) = 0u;
    *(_QWORD *)(v0 + 288) = 0;
  }
  sub_1C03E3614();
  sub_1C03B575C(v0 + 256, v0 + 56, &qword_1EF5FDE18);
  v4 = *(_QWORD *)(v0 + 592);
  if (*(_QWORD *)(v0 + 80))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE30);
    v5 = sub_1C03E338C();
    v6 = OUTLINED_FUNCTION_47_1();
    __swift_storeEnumTagSinglePayload(v4, v6 ^ 1u, 1, v5);
    OUTLINED_FUNCTION_98(v4, 1, v5);
    if (!v7)
    {
      sub_1C03E3380();
      v8 = OUTLINED_FUNCTION_108_0();
      OUTLINED_FUNCTION_52_2(v8, v9);
      goto LABEL_9;
    }
  }
  else
  {
    OUTLINED_FUNCTION_41_1(v3, &qword_1EF5FDE18);
    v10 = sub_1C03E338C();
    OUTLINED_FUNCTION_53_1(v4, v11, v12, v10);
  }
  sub_1C03ABAE4(*(_QWORD *)(v0 + 592), &qword_1EF5FDE00);
LABEL_9:
  v13 = *(_BYTE *)(v0 + 976);
  sub_1C03E3668();
  sub_1C03E38F0();
  sub_1C03E3650();
  if ((v13 & 1) != 0)
  {
    v14 = *(_QWORD *)(v0 + 776);
    v15 = *(_QWORD *)(v0 + 768);
    v16 = *(_QWORD *)(v0 + 760);
    v17 = *(_QWORD *)(v0 + 584);
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D88500]), sel_init);
    sub_1C03C77FC();
    sub_1C03CAD48();
    v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v19(v14, v16);
    OUTLINED_FUNCTION_98(v17, 1, v16);
    if (v7)
    {
      v20 = *(_QWORD *)(v0 + 584);

      sub_1C03ABAE4(v20, &qword_1EF5FCFA8);
    }
    else
    {
      v23 = *(_QWORD *)(v0 + 784);
      v24 = *(_QWORD *)(v0 + 760);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 768) + 32))(v23, *(_QWORD *)(v0 + 584), v24);
      v25 = (void *)sub_1C03E2F90();
      objc_msgSend(v18, sel_setPunchOutUri_, v25);

      sub_1C03E4214();
      sub_1C03E3644();

      v19(v23, v24);
    }
  }
  else
  {
    v21 = static DirectInvocationFactory.createShowMore(suggestions:)();
    if (v21)
    {
      v22 = v21;
      sub_1C03E4214();
      sub_1C03E35E4();

    }
  }
  v26 = *(_QWORD *)(v0 + 576);
  v27 = *(_QWORD *)(v0 + 504);
  sub_1C03E368C();
  sub_1C03CB334();
  OUTLINED_FUNCTION_101_0((_QWORD *)(v27
                                   + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker));
  v30 = (uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v27 + 8) + *(_QWORD *)(v27 + 8));
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 936) = v28;
  *v28 = v0;
  v28[1] = sub_1C03C9308;
  return v30(v0 + 216, *(_QWORD *)(v0 + 816), *(_QWORD *)(v0 + 576), v26, v27);
}

uint64_t sub_1C03C9308()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 944) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_87_0();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C9370()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 952) = v1;
  *v1 = v0;
  v1[1] = sub_1C03C93C8;
  return sub_1C03E3944();
}

uint64_t sub_1C03C93C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 960) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_87_0();
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    *(_QWORD *)(v2 + 968) = *(_QWORD *)(v2 + 360);
  }
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_17_2();
}

uint64_t sub_1C03C9438()
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
  unint64_t v12;
  uint64_t v13;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v16 = *(_QWORD *)(v0 + 968);
  v20 = *(void **)(v0 + 856);
  v1 = *(_QWORD *)(v0 + 848);
  v21 = *(_QWORD *)(v0 + 808);
  v22 = *(_QWORD *)(v0 + 800);
  v23 = *(_QWORD *)(v0 + 816);
  v17 = *(_QWORD *)(v0 + 568);
  v18 = *(_QWORD *)(v0 + 560);
  v19 = *(_QWORD *)(v0 + 576);
  v2 = *(_QWORD *)(v0 + 552);
  v3 = *(_QWORD *)(v0 + 544);
  v4 = *(_QWORD *)(v0 + 528);
  v5 = *(_QWORD *)(v0 + 520);
  v6 = *(_QWORD *)(v0 + 504);
  v7 = *(_QWORD *)(v0 + 488);
  v8 = sub_1C03E4190();
  v15 = *(_OWORD *)(v0 + 832);
  OUTLINED_FUNCTION_53_1(v2, v9, v10, v8);
  v11 = v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v7, v5);
  v12 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 32) = v6;
  *(_OWORD *)(v13 + 40) = v15;
  *(_QWORD *)(v13 + 56) = v16;
  *(_QWORD *)(v13 + 64) = v1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v13 + v12, v11, v5);
  swift_retain();
  sub_1C03DED74(v2, (uint64_t)&unk_1EF5FDE28, v13);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 216);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  sub_1C03ABAE4(v0 + 256, &qword_1EF5FDE18);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_60();
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
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03C96C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_82_0();
  v1 = *(_QWORD *)(v0 + 816);
  v2 = *(_QWORD *)(v0 + 808);

  OUTLINED_FUNCTION_48_2(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_115_0();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_97_0();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_66_0();
  return OUTLINED_FUNCTION_8_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03C975C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_82_0();
  v1 = *(_QWORD *)(v0 + 816);
  v2 = *(_QWORD *)(v0 + 808);
  v3 = *(_QWORD *)(v0 + 576);
  v4 = *(_QWORD *)(v0 + 568);

  OUTLINED_FUNCTION_41_2(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_1C03ABAE4(v0 + 256, &qword_1EF5FDE18);
  OUTLINED_FUNCTION_52_2(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_115_0();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_97_0();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_66_0();
  return OUTLINED_FUNCTION_8_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03C9824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_82_0();
  v1 = *(_QWORD *)(v0 + 816);
  v2 = *(_QWORD *)(v0 + 808);
  v3 = *(_QWORD *)(v0 + 576);
  v4 = *(_QWORD *)(v0 + 568);
  v5 = *(_QWORD *)(v0 + 560);

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 216);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  OUTLINED_FUNCTION_41_1(v6, &qword_1EF5FDE18);
  OUTLINED_FUNCTION_47(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_72_0();
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_115_0();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_97_0();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_66_0();
  return OUTLINED_FUNCTION_8_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03C98F8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[6] = a1;
  v2[7] = a2;
  v3 = sub_1C03E3B0C();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v4 = sub_1C03E302C();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v5 = sub_1C03E3B18();
  v2[15] = v5;
  v2[16] = *(_QWORD *)(v5 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v6 = sub_1C03E3B30();
  v2[21] = v6;
  v2[22] = *(_QWORD *)(v6 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v7 = sub_1C03E3A28();
  v2[25] = v7;
  v2[26] = *(_QWORD *)(v7 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  return swift_task_switch();
}

void sub_1C03C9AA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  char v34;
  void (*v35)(uint64_t, uint64_t);
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
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  char v58;
  void (*v59)(uint64_t, uint64_t);
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, unint64_t, uint64_t);
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
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
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(unint64_t, uint64_t, uint64_t);
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
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
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v2 = sub_1C03E3AAC();
  v3 = MEMORY[0x1E0DEE9D8];
  v142 = MEMORY[0x1E0DEE9D8];
  v109 = MEMORY[0x1E0DEE9D8];
  v127 = *(_QWORD *)(v2 + 16);
  if (v127)
  {
    v4 = 0;
    v118 = (uint64_t)(v0 + 4);
    v123 = (uint64_t)(v0 + 2);
    v5 = v0[26];
    v114 = v0[22];
    v6 = v0[16];
    LODWORD(v112) = *MEMORY[0x1E0DA5828];
    v111 = v2;
    while (1)
    {
      if (v4 >= *(_QWORD *)(v2 + 16))
      {
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v139 = v3;
      v7 = v0[19];
      OUTLINED_FUNCTION_91();
      v131 = v8;
      v135 = v9;
      OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t))(v5 + 16));
      OUTLINED_FUNCTION_123_0();
      OUTLINED_FUNCTION_130_0();
      v10 = OUTLINED_FUNCTION_108_0();
      OUTLINED_FUNCTION_41_2(v10, v11);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v7, v112, v1);
      sub_1C03A858C(&qword_1EF5FDEE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5848], MEMORY[0x1E0DA5860]);
      OUTLINED_FUNCTION_107_0();
      OUTLINED_FUNCTION_107_0();
      v13 = v0[19];
      v12 = v0[20];
      if (v0[2] == v0[4] && v0[3] == v0[5])
        break;
      v1 = sub_1C03E43F4();
      OUTLINED_FUNCTION_55_1();
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_83_0(v13);
      OUTLINED_FUNCTION_83_0(v12);
      if ((v1 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(_QWORD, _QWORD))(v5 + 8))(v0[35], v0[25]);
      v3 = v139;
LABEL_16:
      v2 = v111;
      if (v127 == ++v4)
        goto LABEL_17;
    }
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_83_0(v13);
    OUTLINED_FUNCTION_83_0(v12);
LABEL_11:
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 32))(v0[34], v0[35], v0[25]);
    v3 = v139;
    if ((OUTLINED_FUNCTION_117_0() & 1) == 0)
    {
      OUTLINED_FUNCTION_5_4();
      v3 = v142;
    }
    OUTLINED_FUNCTION_122_0();
    if (v22)
    {
      OUTLINED_FUNCTION_4_8();
      v3 = v142;
    }
    OUTLINED_FUNCTION_40_1(v15, v0[34], v16, v17, v18, v19, v20, v21, v104, v105, v106, v107, v108, v109, v111, v112, v114, v118, v123,
      v127,
      v131,
      v135);
    v142 = v3;
    goto LABEL_16;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  if ((sub_1C03E38E4() & 1) == 0)
  {
    v44 = v0[13];
    v43 = v0[14];
    swift_retain();
    sub_1C03E3AB8();
    sub_1C03E3008();
    OUTLINED_FUNCTION_47(v43, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
    OUTLINED_FUNCTION_95_0();
    sub_1C03E40D0();
    OUTLINED_FUNCTION_112_0();
    v45 = v3;
    v24 = MEMORY[0x1E0DEE9D8];
LABEL_44:
    v145 = v24;
    v117 = *(_QWORD *)(v45 + 16);
    if (!v117)
    {
LABEL_63:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_102();
      OUTLINED_FUNCTION_85_0();
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_72_0();
      OUTLINED_FUNCTION_71_0();
      OUTLINED_FUNCTION_70_0();
      OUTLINED_FUNCTION_69_0();
      OUTLINED_FUNCTION_68();
      OUTLINED_FUNCTION_66_0();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_25_3();
      __asm { BR              X4 }
    }
    v65 = 0;
    v66 = v0[26];
    v113 = v0[9];
    v110 = MEMORY[0x1E0DEE9D8];
    v130 = v66;
    v134 = v45;
    while (1)
    {
      if (v65 >= *(_QWORD *)(v45 + 16))
        goto LABEL_65;
      v67 = v0[29];
      v138 = v0[28];
      v68 = v0[25];
      OUTLINED_FUNCTION_116_0();
      v121 = v70;
      v125 = v69;
      v72 = *(void (**)(uint64_t, unint64_t, uint64_t))(v66 + 16);
      v72(v67, v71 + v69 + v70 * v65, v68);
      sub_1C03E39EC();
      v73 = sub_1C03E3AF4();
      v75 = v74;
      v66 = *(_QWORD *)(v113 + 8);
      OUTLINED_FUNCTION_49_1();
      OUTLINED_FUNCTION_118_0();
      if ((v75 & 0x2000000000000000) != 0)
        v76 = HIBYTE(v75) & 0xF;
      else
        v76 = v73 & 0xFFFFFFFFFFFFLL;
      v77 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v72)(v138, v67, v68);
      if (v76)
      {
        v85 = v0[10];
        v86 = v0[8];
        sub_1C03E39EC();
        v76 = sub_1C03E3ADC();
        v88 = v87;
        ((void (*)(uint64_t, uint64_t))v66)(v85, v86);
        v89 = OUTLINED_FUNCTION_76_0();
        if ((v88 & 0x2000000000000000) != 0)
          v97 = HIBYTE(v88) & 0xF;
        else
          v97 = v76 & 0xFFFFFFFFFFFFLL;
        OUTLINED_FUNCTION_46_1(v89, v90, v91, v92, v93, v94, v95, v96, v104, v105, v106, v107, v108, v110, v111, v113, v117, v121, v125,
          v130);
        if (v97)
        {
          v98 = *(void (**)(unint64_t, uint64_t, uint64_t))(v66 + 32);
          v98(v0[27], v0[29], v0[25]);
          v99 = v110;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_5_4();
            v99 = v145;
          }
          v100 = *(_QWORD *)(v99 + 16);
          if (v100 >= *(_QWORD *)(v99 + 24) >> 1)
          {
            OUTLINED_FUNCTION_4_8();
            v99 = v145;
          }
          v101 = v0[27];
          v102 = v0[25];
          *(_QWORD *)(v99 + 16) = v100 + 1;
          v98(v99 + v126 + v100 * v122, v101, v102);
          v110 = v99;
          v145 = v99;
          v66 = v130;
          v45 = v134;
          goto LABEL_62;
        }
      }
      else
      {
        OUTLINED_FUNCTION_46_1(v77, v78, v79, v80, v81, v82, v83, v84, v104, v105, v106, v107, v108, v110, v111, v113, v117, v121, v125,
          v130);
      }
      ((void (*)(_QWORD, _QWORD))v76)(v0[29], v0[25]);
      v45 = v134;
LABEL_62:
      if (v117 == ++v65)
        goto LABEL_63;
    }
  }
  v23 = sub_1C03E3AAC();
  v24 = MEMORY[0x1E0DEE9D8];
  v128 = *(_QWORD *)(v23 + 16);
  v140 = v3;
  v143 = MEMORY[0x1E0DEE9D8];
  if (!v128)
  {
    v27 = MEMORY[0x1E0DEE9D8];
LABEL_32:
    swift_bridgeObjectRelease();
    sub_1C03CC29C(v27);
    v144 = v24;
    v46 = *(_QWORD *)(v140 + 16);
    v133 = v140;
    swift_bridgeObjectRetain();
    v129 = v46;
    if (v46)
    {
      v47 = 0;
      v48 = v0[26];
      v120 = v0[16];
      v116 = *MEMORY[0x1E0DA5828];
      v49 = MEMORY[0x1E0DEE9D8];
      v50 = v140;
      while (v47 < *(_QWORD *)(v50 + 16))
      {
        v51 = v49;
        v52 = v0[17];
        v53 = v0[18];
        OUTLINED_FUNCTION_91();
        v141 = v54;
        v137 = v55;
        OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t))(v48 + 16));
        OUTLINED_FUNCTION_123_0();
        OUTLINED_FUNCTION_130_0();
        v56 = OUTLINED_FUNCTION_108_0();
        OUTLINED_FUNCTION_102_0(v56, v57);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v120 + 104))(v52, v116, v1);
        sub_1C03A858C(&qword_1EF5FDE38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5848], MEMORY[0x1E0DA5858]);
        v58 = sub_1C03E407C();
        v59 = *(void (**)(uint64_t, uint64_t))(v120 + 8);
        v59(v52, v1);
        v59(v53, v1);
        if ((v58 & 1) != 0)
        {
          OUTLINED_FUNCTION_78_0(v0[31]);
          v49 = v51;
        }
        else
        {
          v1 = *(_QWORD *)(v48 + 32);
          ((void (*)(_QWORD, _QWORD, _QWORD))v1)(v0[30], v0[31], v0[25]);
          v49 = v51;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_5_4();
            v49 = v144;
          }
          v60 = *(_QWORD *)(v49 + 16);
          if (v60 >= *(_QWORD *)(v49 + 24) >> 1)
          {
            OUTLINED_FUNCTION_4_8();
            v49 = v144;
          }
          v61 = v0[30];
          v62 = v0[25];
          *(_QWORD *)(v49 + 16) = v60 + 1;
          ((void (*)(unint64_t, uint64_t, uint64_t))v1)(v49 + v141 + v60 * v137, v61, v62);
          v144 = v49;
        }
        ++v47;
        v50 = v133;
        v24 = MEMORY[0x1E0DEE9D8];
        if (v129 == v47)
          goto LABEL_43;
      }
      goto LABEL_67;
    }
LABEL_43:
    v64 = v0[13];
    v63 = v0[14];
    swift_bridgeObjectRelease();
    sub_1C03E3AB8();
    sub_1C03E3008();
    OUTLINED_FUNCTION_41_2(v63, *(uint64_t (**)(uint64_t, uint64_t))(v64 + 8));
    OUTLINED_FUNCTION_95_0();
    sub_1C03E40D0();
    OUTLINED_FUNCTION_112_0();
    goto LABEL_44;
  }
  v25 = 0;
  v26 = v0[26];
  v115 = v0[16];
  v119 = v0[22];
  LODWORD(v112) = *MEMORY[0x1E0DA5828];
  v27 = MEMORY[0x1E0DEE9D8];
  v124 = v23;
  while (v25 < *(_QWORD *)(v23 + 16))
  {
    v28 = v0[17];
    v1 = v0[18];
    v29 = v0[15];
    OUTLINED_FUNCTION_116_0();
    v132 = v30;
    v136 = v31;
    OUTLINED_FUNCTION_56_1(*(uint64_t (**)(uint64_t))(v26 + 16));
    OUTLINED_FUNCTION_123_0();
    OUTLINED_FUNCTION_130_0();
    v32 = OUTLINED_FUNCTION_108_0();
    OUTLINED_FUNCTION_89(v32, v33);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v115 + 104))(v28, v112, v29);
    sub_1C03A858C(&qword_1EF5FDE38, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5848], MEMORY[0x1E0DA5858]);
    v34 = sub_1C03E407C();
    v35 = *(void (**)(uint64_t, uint64_t))(v115 + 8);
    v35(v28, v29);
    v35(v1, v29);
    if ((v34 & 1) != 0)
    {
      OUTLINED_FUNCTION_78_0(v0[33]);
      v24 = MEMORY[0x1E0DEE9D8];
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v26 + 32))(v0[32], v0[33], v0[25]);
      if ((OUTLINED_FUNCTION_117_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_5_4();
        v27 = v143;
      }
      v24 = MEMORY[0x1E0DEE9D8];
      OUTLINED_FUNCTION_122_0();
      if (v22)
      {
        OUTLINED_FUNCTION_4_8();
        v27 = v143;
      }
      OUTLINED_FUNCTION_40_1(v36, v0[32], v37, v38, v39, v40, v41, v42, v104, v105, v106, v107, v108, v109, v111, v112, v115, v119, v124,
        v128,
        v132,
        v136);
      v143 = v27;
    }
    ++v25;
    v23 = v124;
    if (v128 == v25)
      goto LABEL_32;
  }
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
}

uint64_t sub_1C03CA390(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[64];
  _BYTE v28[72];

  v25 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDED0);
  MEMORY[0x1E0C80A78](v2);
  v24 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C03E3CF8();
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v22 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1C03E3C50();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C03E3C98();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0DA6288], v10);
  sub_1C03CBC38();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (!v15)
    goto LABEL_8;
  sub_1C03E3F68();
  sub_1C03E3C44();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1C03D0104((uint64_t)v28, (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDED8);
  if (!swift_dynamicCast())
  {
    sub_1C03D0104((uint64_t)v28, (uint64_t)v27);
    v17 = (uint64_t)v24;
    if (swift_dynamicCast())
    {
      __swift_storeEnumTagSinglePayload(v17, 0, 1, v4);
      v18 = v23;
      v19 = v22;
      (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(v22, v17, v4);
      v16 = sub_1C03E3CE0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v4);
      goto LABEL_6;
    }
    __swift_storeEnumTagSinglePayload(v17, 1, 1, v4);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    sub_1C03ABAE4(v17, &qword_1EF5FDED0);
LABEL_8:
    swift_bridgeObjectRetain();
    return v25;
  }
  swift_release();
  v16 = v26;
LABEL_6:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return v16;
}

uint64_t sub_1C03CA66C(uint64_t a1)
{
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _BYTE v7[40];

  sub_1C03ABB30(a1, (uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDEC8);
  sub_1C03E3830();
  if (swift_dynamicCast())
  {
    v1 = sub_1C03E3824();
    swift_release();
  }
  else
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v2 = sub_1C03E4028();
    __swift_project_value_buffer(v2, (uint64_t)qword_1ED738B48);
    v3 = sub_1C03E4010();
    v4 = sub_1C03E41FC();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C03A5000, v3, v4, "Owner is not a signalled siri help owner! Cant determine if this is a conversational continuer so assuming not", v5, 2u);
      MEMORY[0x1C3B99F38](v5, -1, -1);
    }

    v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_1C03CA79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  _BYTE v12[40];

  sub_1C03E39E0();
  if (qword_1EF5FCB18 != -1)
    swift_once();
  v5 = qword_1EF5FDCC0;
  swift_bridgeObjectRetain();
  v6 = sub_1C03CA390((uint64_t)v12, v5);
  v8 = v7;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  if (v6 == a2 && v8 == a3)
    v10 = 1;
  else
    v10 = sub_1C03E43F4();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_1C03CA894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BYTE v7[40];

  sub_1C03E39E0();
  if (qword_1EF5FCB18 != -1)
    swift_once();
  v0 = qword_1EF5FDCC0;
  swift_bridgeObjectRetain();
  v1 = sub_1C03CA390((uint64_t)v7, v0);
  v3 = v2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  if (v1 == qword_1EF5FDCC0 && v3 == *(_QWORD *)algn_1EF5FDCC8)
    v5 = 1;
  else
    v5 = sub_1C03E43F4();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C03CA97C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v36 = a3;
  v35 = a2;
  v3 = sub_1C03E3EF0();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x1E0C80A78](v3);
  v37 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C03E2F00();
  v33 = *(_QWORD *)(v5 - 8);
  v34 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C03E3B0C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v33 - v13;
  sub_1C03E39EC();
  sub_1C03E3AF4();
  v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  v15(v14, v8);
  sub_1C03E3548();
  v16 = (void *)objc_opt_self();
  sub_1C03E39EC();
  sub_1C03E3AF4();
  v15(v14, v8);
  v17 = (void *)sub_1C03E4088();
  swift_bridgeObjectRelease();
  v18 = (void *)sub_1C03E4088();
  v19 = objc_msgSend(v16, sel_quote_forLocale_, v17, v18);

  sub_1C03E4094();
  sub_1C03E3590();
  sub_1C03E39EC();
  v20 = sub_1C03E3AE8();
  v22 = v21;
  v15(v12, v8);
  if (!v22)
    goto LABEL_6;
  v40 = v20;
  v41 = v22;
  sub_1C03E2EF4();
  sub_1C03ABA60();
  v23 = sub_1C03E425C();
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v34);
  swift_bridgeObjectRelease();
  if (!v23 && v25 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v26 = sub_1C03E43F4();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
LABEL_6:
    sub_1C03E39EC();
    sub_1C03E3AE8();
    v28 = v27;
    v15(v14, v8);
    if (v28)
      sub_1C03E353C();
  }
LABEL_8:
  sub_1C03CC54C();
  v29 = static DirectInvocationFactory.createExecute(suggestion:)();
  if (v29)
  {
    v30 = v29;
    sub_1C03E4214();
    sub_1C03E356C();

  }
  v31 = v37;
  sub_1C03E39F8();
  sub_1C03E3EE4();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v39);
  return sub_1C03E3554();
}

uint64_t sub_1C03CACE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  swift_bridgeObjectRetain();
  sub_1C03CA97C(a1, v3, v4);
  return swift_bridgeObjectRelease();
}

void sub_1C03CAD48()
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
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[6];

  OUTLINED_FUNCTION_10_3();
  v62 = v2;
  v63 = v3;
  v61 = v4;
  v64 = v5;
  v6 = sub_1C03E3110();
  v55 = *(_QWORD *)(v6 - 8);
  v56 = v6;
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_22();
  v54[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE60);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_22();
  v58 = v10;
  OUTLINED_FUNCTION_65_0();
  v11 = sub_1C03E3158();
  v59 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_38_1();
  v54[0] = v13;
  OUTLINED_FUNCTION_129_0();
  MEMORY[0x1E0C80A78](v14);
  v57 = (char *)v54 - v15;
  OUTLINED_FUNCTION_129_0();
  MEMORY[0x1E0C80A78](v16);
  v60 = (char *)v54 - v17;
  OUTLINED_FUNCTION_65_0();
  v18 = sub_1C03E34AC();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_24_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD000);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_23_2();
  v23 = v21 - v22;
  MEMORY[0x1E0C80A78](v24);
  v65 = (uint64_t)v54 - v25;
  v26 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  if (v26)
  {
    v27 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals);
  }
  else
  {
    sub_1C03E3440();
    v27 = (void *)sub_1C03E3434();
  }
  sub_1C03E3458();
  memset(v67, 0, 40);
  v28 = v26;
  sub_1C03E404C();
  sub_1C03E34A0();
  v29 = v65;
  sub_1C03E344C();

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_102_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
  sub_1C03ABAE4((uint64_t)v67, &qword_1EF5FCFD8);
  sub_1C03B575C(v29, v23, &qword_1EF5FD000);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v30, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_33();
    v31 = sub_1C03E4010();
    v32 = sub_1C03E41FC();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_16();
      v67[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v33 = 136315138;
      swift_getErrorValue();
      v34 = sub_1C03E4424();
      v66 = sub_1C03B934C(v34, v35, v67);
      OUTLINED_FUNCTION_58_1();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v31, v32, "Error: %s", v33);
      OUTLINED_FUNCTION_28_3();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    goto LABEL_17;
  }
  v36 = v59;
  v37 = v60;
  v38 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v60, v23, v11);
  if (qword_1ED738B40 != -1)
    swift_once();
  v39 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v39, (uint64_t)qword_1ED738B48);
  v40 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v41 = v57;
  v40(v57, v37, v38);
  v42 = sub_1C03E4010();
  v43 = sub_1C03E41E4();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)OUTLINED_FUNCTION_16();
    v67[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v44 = 136315138;
    v40((char *)v54[0], v41, v38);
    v45 = sub_1C03E40A0();
    v66 = sub_1C03B934C(v45, v46, v67);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_120_0();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v42, v43, "Extracting learn more URL from templating result: %s", v44);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_120_0();

  v47 = v58;
  v48 = sub_1C03E314C();
  sub_1C03C71E4(v48, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9BD50], v47);
  OUTLINED_FUNCTION_31();
  v49 = sub_1C03E317C();
  OUTLINED_FUNCTION_98(v47, 1, v49);
  if (v50)
  {
    sub_1C03ABAE4(v47, &qword_1EF5FDE60);
    OUTLINED_FUNCTION_49_1();
LABEL_17:
    sub_1C03ABAE4(v65, &qword_1EF5FD000);
    v51 = OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_53_1(v64, v52, v53, v51);
    goto LABEL_18;
  }
  sub_1C03E3170();
  OUTLINED_FUNCTION_48_2(v47, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 8));
  sub_1C03E3104();
  OUTLINED_FUNCTION_109_0(v55);
  sub_1C03E2FB4();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_49_1();
  sub_1C03ABAE4(v65, &qword_1EF5FD000);
LABEL_18:
  OUTLINED_FUNCTION_69();
}

void sub_1C03CB334()
{
  char v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  sub_1C03E30E0();
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_38();
  v5 = sub_1C03E31B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_38();
  v9 = v8 - v7;
  sub_1C03E30D4();
  sub_1C03E3188();
  sub_1C03E31AC();
  if ((v1 & 1) != 0)
  {
    sub_1C03E31AC();
    if (qword_1ED738B40 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v10, (uint64_t)qword_1ED738B48);
    v11 = (void *)OUTLINED_FUNCTION_21_2();
    v12 = sub_1C03E41F0();
    if (OUTLINED_FUNCTION_17(v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v13 = 0;
      OUTLINED_FUNCTION_127_0();
      OUTLINED_FUNCTION_22_2(v14, v15, v16, v17, v13);
      OUTLINED_FUNCTION_5_0();
    }

  }
  if (qword_1ED738B40 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v18, (uint64_t)qword_1ED738B48);
  v19 = OUTLINED_FUNCTION_21_2();
  v20 = sub_1C03E41F0();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v21 = 67109120;
    swift_beginAccess();
    sub_1C03E31A0();
    swift_endAccess();
    sub_1C03E4238();
    _os_log_impl(&dword_1C03A5000, v19, v20, "setting listenAfterSpeaking as %{BOOL}d in manifest", v21, 8u);
    OUTLINED_FUNCTION_5_0();
  }

  swift_beginAccess();
  sub_1C03E3194();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v9, v5);
  OUTLINED_FUNCTION_52_2(v9, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03CB5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6[5] = a6;
  v6[6] = v10;
  v6[4] = a4;
  v7 = sub_1C03E302C();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  v8 = sub_1C03E3CA4();
  v6[10] = v8;
  v6[11] = *(_QWORD *)(v8 - 8);
  v6[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03CB650()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_1ED738B40 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B48);
  v2 = OUTLINED_FUNCTION_21_2();
  v3 = sub_1C03E41F0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v4 = 0;
    OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v2, v3, "Donating interaction event", v4);
    OUTLINED_FUNCTION_5_0();
  }
  v6 = v0[11];
  v5 = v0[12];
  v7 = v0[10];
  v8 = v0[4];

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 40));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E0DA62F0], v7);
  sub_1C03E3AB8();
  v9 = (_QWORD *)swift_task_alloc();
  v0[14] = v9;
  *v9 = v0;
  v9[1] = sub_1C03CB7AC;
  return sub_1C03E36EC();
}

uint64_t sub_1C03CB7AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(*v1 + 88);
  v2 = *(_QWORD *)(*v1 + 96);
  v4 = *(_QWORD *)(*v1 + 72);
  v5 = *(_QWORD *)(*v1 + 64);
  v6 = *v1;
  *(_QWORD *)(v6 + 120) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_41_2(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_52_2(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v0)
  {
    OUTLINED_FUNCTION_11();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    return (*(uint64_t (**)(void))(v6 + 8))();
  }
}

uint64_t sub_1C03CB86C()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  uint64_t v13;

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  v1 = (void *)sub_1C03E4010();
  v2 = sub_1C03E41FC();
  if (OUTLINED_FUNCTION_17(v2))
  {
    v3 = *(_QWORD *)(v0 + 120);
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    v5 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v4 = 136315138;
    v13 = v5;
    *(_QWORD *)(v0 + 16) = v3;
    OUTLINED_FUNCTION_33();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v6 = sub_1C03E40A0();
    *(_QWORD *)(v0 + 24) = sub_1C03B934C(v6, v7, &v13);
    OUTLINED_FUNCTION_58_1();
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_127_0();
    OUTLINED_FUNCTION_20_2(v8, v9, v10, v11, v4);
    OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03CB9C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23[5];

  sub_1C03ABB30(a1, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDEC8);
  sub_1C03E3830();
  if (OUTLINED_FUNCTION_47_1())
  {
    v4 = a3();
    if (qword_1ED738B40 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED738B48);
    swift_bridgeObjectRetain_n();
    v6 = (void *)sub_1C03E4010();
    v7 = sub_1C03E41E4();
    if (OUTLINED_FUNCTION_17(v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_16();
      v23[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v8 = 136315138;
      v9 = sub_1C03E3BB4();
      v10 = OUTLINED_FUNCTION_13_3();
      v11 = MEMORY[0x1C3B99770](v10, v9);
      v13 = v12;
      OUTLINED_FUNCTION_31();
      sub_1C03B934C(v11, v13, v23);
      OUTLINED_FUNCTION_58_1();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_118_0();
      OUTLINED_FUNCTION_127_0();
      OUTLINED_FUNCTION_20_2(v14, v15, v16, v17, v8);
      OUTLINED_FUNCTION_28_3();
      OUTLINED_FUNCTION_5_0();
    }

    swift_release();
    OUTLINED_FUNCTION_14_2();
  }
  else
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED738B48);
    v19 = OUTLINED_FUNCTION_21_2();
    v20 = sub_1C03E41FC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_16();
      *(_WORD *)v21 = 0;
      OUTLINED_FUNCTION_22_2(&dword_1C03A5000, v19, v20, "Owner is not a signalled siri help owner!", v21);
      OUTLINED_FUNCTION_5_0();
    }

    return MEMORY[0x1E0DEE9D8];
  }
  return v4;
}

void sub_1C03CBC38()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t *);
  uint64_t (*v2)(uint64_t *);
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
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
  void (*v18)(uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t (*v24)(uint64_t *);
  uint64_t v25;

  OUTLINED_FUNCTION_10_3();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = sub_1C03E3BB4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_24_2();
  v25 = sub_1C03CB9C8(v10, v6, v4);
  swift_bridgeObjectRetain();
  sub_1C03CE420(&v25);
  OUTLINED_FUNCTION_10();
  v13 = v25;
  v14 = *(_QWORD *)(v25 + 16);
  if (v14)
  {
    v22[6] = 0;
    v22[7] = v6;
    v23 = v8;
    v24 = v2;
    v25 = MEMORY[0x1E0DEE9D8];
    sub_1C03E42EC();
    OUTLINED_FUNCTION_99();
    v22[5] = v13;
    v16 = v13 + v15;
    v17 = *(_QWORD *)(v12 + 72);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    do
    {
      v18(v0, v16, v11);
      sub_1C03E3BA8();
      OUTLINED_FUNCTION_41_2(v0, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
      sub_1C03E42D4();
      sub_1C03E42F8();
      sub_1C03E4304();
      sub_1C03E42E0();
      v16 += v17;
      --v14;
    }
    while (v14);
    v19 = v25;
    swift_release();
    v8 = v23;
    v2 = v24;
  }
  else
  {
    swift_release();
    v19 = MEMORY[0x1E0DEE9D8];
  }
  v20 = sub_1C03CBDF0(v19);
  v21 = OUTLINED_FUNCTION_55_1();
  MEMORY[0x1E0C80A78](v21);
  v22[2] = v8;
  sub_1C03C7684(v2, (uint64_t)v22, v20);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03CBDF0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v7 = MEMORY[0x1E0DEE9D8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  result = sub_1C03E4340();
  v2 = result;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x1C3B998FC](v4, a1);
      else
        swift_retain();
      v5 = swift_retain();
      MEMORY[0x1C3B9974C](v5);
      if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C03E413C();
      ++v4;
      sub_1C03E4154();
      sub_1C03E4130();
      sub_1C03E3F80();
      v6 = sub_1C03CBDF0();
      swift_bridgeObjectRelease();
      sub_1C03CC398(v6);
      swift_release();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_1C03CBF7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  int EnumTagSinglePayload;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a2;
  v2 = sub_1C03E3C98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v26 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE88);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE90);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v26 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v26 - v15;
  sub_1C03E3F74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE98);
  v17 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, v17 ^ 1u, 1, v2);
  v27 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v14, v28, v2);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v2);
  v18 = (uint64_t)&v7[*(int *)(v5 + 48)];
  sub_1C03B575C((uint64_t)v16, (uint64_t)v7, &qword_1EF5FDE90);
  sub_1C03B575C((uint64_t)v14, v18, &qword_1EF5FDE90);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v2) == 1)
  {
    sub_1C03ABAE4((uint64_t)v14, &qword_1EF5FDE90);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v18, 1, v2);
    if (EnumTagSinglePayload == 1)
      v20 = &qword_1EF5FDE90;
    else
      v20 = &qword_1EF5FDE88;
    if (EnumTagSinglePayload == 1)
      v21 = -1;
    else
      v21 = 0;
  }
  else
  {
    sub_1C03B575C((uint64_t)v7, (uint64_t)v11, &qword_1EF5FDE90);
    if (__swift_getEnumTagSinglePayload(v18, 1, v2) == 1)
    {
      sub_1C03ABAE4((uint64_t)v14, &qword_1EF5FDE90);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v2);
      v21 = 0;
      v20 = &qword_1EF5FDE88;
    }
    else
    {
      v23 = v26;
      v22 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v26, v18, v2);
      sub_1C03A858C(&qword_1EF5FDEA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA62A0], MEMORY[0x1E0DA62B0]);
      v21 = sub_1C03E407C();
      v24 = *(void (**)(char *, uint64_t))(v22 + 8);
      v24(v23, v2);
      v20 = &qword_1EF5FDE90;
      sub_1C03ABAE4((uint64_t)v14, &qword_1EF5FDE90);
      v24(v11, v2);
    }
  }
  sub_1C03ABAE4((uint64_t)v7, v20);
  sub_1C03ABAE4((uint64_t)v16, &qword_1EF5FDE90);
  return v21 & 1;
}

uint64_t sub_1C03CC29C(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v5 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v4 + v2 > *(_QWORD *)(v3 + 24) >> 1)
  {
    result = sub_1C03B8648();
    v3 = result;
  }
  if (!*(_QWORD *)(v5 + 16))
  {
    if (!v2)
      goto LABEL_11;
    goto LABEL_13;
  }
  v6 = (*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16);
  result = sub_1C03E3A28();
  if (v6 < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = sub_1C03CD918(v5+ ((*(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80)), v2);
  if (!v2)
  {
LABEL_11:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1C03CC398(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1C03E4340();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1C03E4340();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1C3B99908](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_1C03CF718(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1C03E4340();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1C03E4130();
  }
  __break(1u);
  return result;
}

void sub_1C03CC54C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint8_t *v5;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t (**v41)(uint64_t, uint64_t);
  int v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;

  OUTLINED_FUNCTION_10_3();
  v3 = v2;
  v5 = v4;
  v6 = sub_1C03E3F14();
  v66 = *(_QWORD *)(v6 - 8);
  v67 = v6;
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_22();
  v65 = v8;
  OUTLINED_FUNCTION_65_0();
  v9 = sub_1C03E3B0C();
  v63 = *(_QWORD *)(v9 - 8);
  v64 = v9;
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_22();
  v62 = v11;
  OUTLINED_FUNCTION_65_0();
  v68 = sub_1C03E3A28();
  v70 = *(_QWORD *)(v68 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_22();
  v14 = v13;
  OUTLINED_FUNCTION_65_0();
  v60 = sub_1C03E3E90();
  v57 = *(_QWORD *)(v60 - 8);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_38_1();
  v58 = v16;
  OUTLINED_FUNCTION_129_0();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v55 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE70);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_94_0();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_88_0();
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE78);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_23_2();
  v24 = MEMORY[0x1E0C80A78](v23);
  v26 = (uint64_t *)((char *)&v55 - v25);
  MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v55 - v27;
  sub_1C03CCBFC(v3, (uint64_t)&v55 - v27);
  v29 = sub_1C03E3EB4();
  OUTLINED_FUNCTION_98((uint64_t)v28, 1, v29);
  if (v30)
  {
LABEL_3:
    v69 = v28;
    if (qword_1ED738B40 != -1)
      swift_once();
    v31 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v31, (uint64_t)qword_1ED738B48);
    v32 = v70;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v14, v3, v68);
    v33 = sub_1C03E4010();
    v34 = sub_1C03E41FC();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_16();
      v60 = OUTLINED_FUNCTION_16();
      v71 = v60;
      v56 = v14;
      *(_DWORD *)v35 = 136315138;
      v59 = v35 + 4;
      v36 = v62;
      sub_1C03E39EC();
      v37 = v65;
      sub_1C03E3B00();
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v36, v64);
      sub_1C03E3EFC();
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v37, v67);
      v38 = sub_1C03E40A0();
      v40 = sub_1C03B934C(v38, v39, &v71);
      OUTLINED_FUNCTION_119_0(v40);
      sub_1C03E4238();
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_89(v56, *(uint64_t (**)(uint64_t, uint64_t))(v70 + 8));
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v33, v34, "Unknown icon asset: %s", v35);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_89(v14, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));

    sub_1C03E35A8();
    sub_1C03ABAE4((uint64_t)v69, &qword_1EF5FDE78);
    v70 = 0;
    goto LABEL_10;
  }
  v59 = v5;
  sub_1C03B575C((uint64_t)v28, (uint64_t)v26, &qword_1EF5FDE78);
  v41 = *(uint64_t (***)(uint64_t, uint64_t))(v29 - 8);
  v42 = v41[11]((uint64_t)v26, v29);
  if (v42 == *MEMORY[0x1E0DA7298])
  {
    OUTLINED_FUNCTION_29_2(v41[12]);
    v43 = *v26;
    v44 = v26[1];
    OUTLINED_FUNCTION_53_2();
    v70 = sub_1C03E2FE4();
    sub_1C03B57E8(v43, v44);
    sub_1C03ABAE4((uint64_t)v28, &qword_1EF5FDE78);
LABEL_10:
    OUTLINED_FUNCTION_62_0();
    goto LABEL_11;
  }
  v69 = v28;
  if (v42 != *MEMORY[0x1E0DA72A0])
  {
    if (v42 == *MEMORY[0x1E0DA72A8])
    {
      OUTLINED_FUNCTION_29_2(v41[12]);
      OUTLINED_FUNCTION_53_2();
      sub_1C03ABAE4((uint64_t)v69, &qword_1EF5FDE78);
      v70 = 0;
      OUTLINED_FUNCTION_62_0();
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_29_2(v41[1]);
    v28 = v69;
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_29_2(v41[12]);
  v45 = *v26;
  v46 = v26[1];
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE80);
  sub_1C03D0064((uint64_t)v26 + *(int *)(v47 + 48), v1);
  OUTLINED_FUNCTION_53_2();
  sub_1C03B575C(v1, v0, &qword_1EF5FDE70);
  v48 = v60;
  OUTLINED_FUNCTION_98(v0, 1, v60);
  v67 = v46;
  v68 = v45;
  if (v30)
  {
    sub_1C03ABAE4(v1, &qword_1EF5FDE70);
    sub_1C03ABAE4(v0, &qword_1EF5FDE70);
    v66 = 0;
  }
  else
  {
    v49 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v19, v0, v48);
    v50 = v58;
    (*(void (**)(uint64_t, char *, uint64_t))(v49 + 16))(v58, v19, v48);
    v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 88))(v50, v48);
    if (v51 == *MEMORY[0x1E0DA7260])
    {
      OUTLINED_FUNCTION_47((uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
      sub_1C03ABAE4(v1, &qword_1EF5FDE70);
      OUTLINED_FUNCTION_47(v50, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 96));
      v66 = 0;
    }
    else
    {
      v52 = v51;
      v53 = *MEMORY[0x1E0DA7258];
      v54 = *(void (**)(char *, uint64_t))(v49 + 8);
      v54(v19, v48);
      sub_1C03ABAE4(v1, &qword_1EF5FDE70);
      if (v52 == v53)
      {
        OUTLINED_FUNCTION_47(v50, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 96));
        v66 = *(_QWORD *)(v50 + 8);
      }
      else
      {
        v54((char *)v50, v48);
        v66 = 0;
      }
    }
  }
  sub_1C03ABAE4((uint64_t)v69, &qword_1EF5FDE78);
  v70 = 0;
LABEL_11:
  sub_1C03E3560();
  sub_1C03E359C();
  sub_1C03E3530();
  sub_1C03E3584();
  sub_1C03E3578();
  OUTLINED_FUNCTION_69();
}

void sub_1C03CCBFC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41[40];

  v36 = a2;
  v3 = sub_1C03E3A28();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x1E0C80A78](v3);
  v33 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE78);
  MEMORY[0x1E0C80A78](v5);
  v38 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_1C03E3F14();
  v37 = *(_QWORD *)(v40 - 8);
  v7 = MEMORY[0x1E0C80A78](v40);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v33 - v10;
  v39 = sub_1C03E3B0C();
  v12 = *(_QWORD *)(v39 - 8);
  v13 = MEMORY[0x1E0C80A78](v39);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v33 - v16;
  v18 = sub_1C03E3C98();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1;
  sub_1C03E39E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x1E0DA6288], v18);
  sub_1C03CBC38();
  v24 = v23;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  swift_release();
  if (v24)
  {
    sub_1C03E39EC();
    sub_1C03E3B00();
    v25 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25(v17, v39);
    v26 = v38;
    sub_1C03E3F08();
    v27 = *(void (**)(char *, uint64_t))(v37 + 8);
    v27(v11, v40);
    v28 = v33;
    v29 = v34;
    v30 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, v22, v35);
    v31 = sub_1C03E3EB4();
    if (__swift_getEnumTagSinglePayload(v26, 1, v31) == 1)
    {
      sub_1C03E39EC();
      sub_1C03E3B00();
      v25(v15, v39);
      sub_1C03E3EFC();
      v27(v9, v40);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
      sub_1C03ABAE4(v38, &qword_1EF5FDE78);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
      v32 = v36;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v36, v38, v31);
      __swift_storeEnumTagSinglePayload(v32, 0, 1, v31);
    }
  }
  else
  {
    sub_1C03E39EC();
    sub_1C03E3B00();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v39);
    sub_1C03E3EFC();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v40);
  }
}

void sub_1C03CCF88()
{
  uint64_t v0;
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  v1 = OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_5(v1);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03CD004()
{
  sub_1C03CCF88();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03CD028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03A80E8;
  return sub_1C03C7C28(a1, a2);
}

void SiriSuggestions.Suggestion.toIntentSuggestion()()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[5];

  OUTLINED_FUNCTION_10_3();
  v1 = sub_1C03E302C();
  v47 = *(_QWORD *)(v1 - 8);
  v48 = v1;
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_38();
  v3 = sub_1C03E3EF0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_23_2();
  v6 = v4 - v5;
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_94_0();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v43 - v9;
  v49 = sub_1C03E3FBC();
  sub_1C03E39F8();
  v11 = sub_1C03E3EE4();
  v46 = v12;
  OUTLINED_FUNCTION_42_1((uint64_t)v10);
  OUTLINED_FUNCTION_121_0();
  sub_1C03E3EE4();
  OUTLINED_FUNCTION_42_1(v0);
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v14 = sub_1C03CD544(v11, v46);
  OUTLINED_FUNCTION_121_0();
  v15 = sub_1C03E3ED8();
  v17 = v16;
  OUTLINED_FUNCTION_42_1((uint64_t)v10);
  v44 = v14;
  sub_1C03CF5E0(v15, v17, v14);
  OUTLINED_FUNCTION_121_0();
  v18 = sub_1C03E3ECC();
  OUTLINED_FUNCTION_42_1(v6);
  v50 = MEMORY[0x1E0DEE9D8];
  sub_1C03CFC48(v18, v51);
  v19 = v51[0];
  v49 = v51[3];
  v20 = v51[4];
  v45 = v51[1];
  v46 = (unint64_t)(v51[2] + 64) >> 6;
  v43[1] = v18;
  swift_bridgeObjectRetain();
  if (!v20)
    goto LABEL_3;
LABEL_2:
  v21 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  v22 = v21 | (v49 << 6);
  while (1)
  {
    v30 = (uint64_t *)(*(_QWORD *)(v19 + 48) + 16 * v22);
    v31 = *v30;
    v32 = v30[1];
    v33 = (uint64_t *)(*(_QWORD *)(v19 + 56) + 16 * v22);
    v35 = *v33;
    v34 = v33[1];
    OUTLINED_FUNCTION_111_0();
    swift_bridgeObjectRetain();
    sub_1C03E3020();
    v36 = sub_1C03E3008();
    v38 = v37;
    OUTLINED_FUNCTION_109_0(v47);
    sub_1C03E3FC8();
    v39 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    swift_bridgeObjectRetain();
    v40 = sub_1C03CD544(v36, v38);
    OUTLINED_FUNCTION_111_0();
    sub_1C03CF690(v31, v32, v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1C03CF6D4(v35, v34, v40);
    swift_bridgeObjectRelease();
    v41 = OUTLINED_FUNCTION_14_2();
    MEMORY[0x1C3B9974C](v41);
    if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1C03E413C();
    sub_1C03E4154();
    sub_1C03E4130();
    if (v20)
      goto LABEL_2;
LABEL_3:
    v23 = v49 + 1;
    if (__OFADD__(v49, 1))
      break;
    if (v23 >= v46)
      goto LABEL_29;
    v24 = *(_QWORD *)(v45 + 8 * v23);
    v25 = v49 + 1;
    if (!v24)
    {
      OUTLINED_FUNCTION_106_0();
      if (v26 == v27)
        goto LABEL_29;
      OUTLINED_FUNCTION_105_0();
      if (!v24)
      {
        OUTLINED_FUNCTION_106_0();
        if (v26 == v27)
          goto LABEL_29;
        OUTLINED_FUNCTION_105_0();
        if (!v24)
        {
          OUTLINED_FUNCTION_106_0();
          if (v26 == v27)
            goto LABEL_29;
          OUTLINED_FUNCTION_105_0();
          if (!v24)
          {
            OUTLINED_FUNCTION_106_0();
            if (v26 == v27)
              goto LABEL_29;
            OUTLINED_FUNCTION_105_0();
            if (!v24)
            {
              v25 = v28 + 5;
              if (v28 + 5 >= v46)
                goto LABEL_29;
              v24 = *(_QWORD *)(v45 + 8 * v25);
              if (!v24)
              {
                v29 = v49 + 7;
                while (v29 < v46)
                {
                  v24 = *(_QWORD *)(v45 + 8 * v29++);
                  if (v24)
                  {
                    v25 = v29 - 1;
                    goto LABEL_24;
                  }
                }
LABEL_29:
                swift_release();
                v42 = v50;
                swift_bridgeObjectRelease();
                sub_1C03CF630(v42, v44);
                OUTLINED_FUNCTION_69();
                return;
              }
            }
          }
        }
      }
    }
LABEL_24:
    v20 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v25 << 6);
    v49 = v25;
  }
  __break(1u);
}

uint64_t static SiriHelpDispatcherErrors.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriHelpDispatcherErrors.hash(into:)()
{
  return sub_1C03E446C();
}

uint64_t SiriHelpDispatcherErrors.hashValue.getter()
{
  sub_1C03E4460();
  sub_1C03E446C();
  return sub_1C03E4478();
}

uint64_t sub_1C03CD4D8()
{
  return 1;
}

uint64_t sub_1C03CD4E0()
{
  return SiriHelpDispatcherErrors.hashValue.getter();
}

uint64_t sub_1C03CD4F4()
{
  return SiriHelpDispatcherErrors.hash(into:)();
}

uint64_t sub_1C03CD508()
{
  sub_1C03E4460();
  sub_1C03E446C();
  return sub_1C03E4478();
}

id sub_1C03CD544(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = (void *)sub_1C03E4088();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)sub_1C03E4088();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithIdentifier_displayString_, v3, v4);

  return v5;
}

uint64_t sub_1C03CD5D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_1C03E4334();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_1C03E3BB4();
      v2 = sub_1C03E4148();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x1E0DEE9D8];
    }
    sub_1C03E3BB4();
    return v2;
  }
  return result;
}

uint64_t sub_1C03CD690(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy();
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_32_2();
  }
  result = OUTLINED_FUNCTION_26_3();
  __break(1u);
  return result;
}

uint64_t sub_1C03CD72C(uint64_t a1, uint64_t a2)
{
  return sub_1C03CD918(a1, a2);
}

uint64_t sub_1C03CD738(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1C03E437C();
    __break(1u);
  }
  else
  {
    sub_1C03E3F8C();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C03CD820(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1C03E437C();
    __break(1u);
  }
  else
  {
    sub_1C03D002C(0, &qword_1EF5FDE40);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C03CD918(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  void (*v3)(_QWORD);
  unint64_t v4;
  char v5;
  char v6;
  BOOL v7;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    OUTLINED_FUNCTION_74_0();
    v3(0);
    OUTLINED_FUNCTION_44_2();
    if (!v6 & v5)
      v7 = v4 > v2;
    else
      v7 = 0;
    if (!v7)
    {
      OUTLINED_FUNCTION_36_1();
      return OUTLINED_FUNCTION_11_7();
    }
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_32_2();
  }
  result = OUTLINED_FUNCTION_26_3();
  __break(1u);
  return result;
}

uint64_t sub_1C03CD9A8(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    OUTLINED_FUNCTION_74_0();
    if (v4 + 40 * v3 <= v2 || v2 + 40 * v3 <= v4)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738298);
      OUTLINED_FUNCTION_36_1();
      return OUTLINED_FUNCTION_11_7();
    }
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_32_2();
  }
  result = OUTLINED_FUNCTION_26_3();
  __break(1u);
  return result;
}

uint64_t sub_1C03CDA48(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  char v5;
  char v6;
  BOOL v7;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_33_2();
  }
  else
  {
    OUTLINED_FUNCTION_74_0();
    __swift_instantiateConcreteTypeFromMangledName(v3);
    OUTLINED_FUNCTION_44_2();
    if (!v6 & v5)
      v7 = v4 > v2;
    else
      v7 = 0;
    if (!v7)
    {
      OUTLINED_FUNCTION_36_1();
      return OUTLINED_FUNCTION_11_7();
    }
    OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_32_2();
  }
  result = OUTLINED_FUNCTION_26_3();
  __break(1u);
  return result;
}

uint64_t sub_1C03CDAD8(uint64_t (*a1)(void))
{
  return a1() & 1;
}

unint64_t sub_1C03CDB00(unint64_t result, char a2, uint64_t a3)
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

void sub_1C03CDB24(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    if (!v5)
      goto LABEL_9;
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD910);
      v8 = (_QWORD *)OUTLINED_FUNCTION_36();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_1C03CD690(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
LABEL_9:
      OUTLINED_FUNCTION_29_1();
      return;
    }
  }
  __break(1u);
}

_QWORD *sub_1C03CDBD0(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  size_t v4;
  unint64_t v5;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_8;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FCFC0);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v3[2] = v2;
      v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1C03CF8A8((uint64_t)(v3 + 4), v2, v1);
    v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    v2 = sub_1C03E4340();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1C03CDCC0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    if (!v5)
      goto LABEL_8;
    if (v5 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383B8);
      v8 = (_QWORD *)OUTLINED_FUNCTION_36();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 40);
    }
    if (v4 != a3)
    {
      sub_1C03CD9A8(a2 + 40 * a3, v5);
LABEL_8:
      OUTLINED_FUNCTION_29_1();
      return;
    }
  }
  __break(1u);
}

void sub_1C03CDD70()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CDEE0();
  *v0 = v1;
}

void sub_1C03CDDA4()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CE198();
  *v0 = v1;
}

void sub_1C03CDDD8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CDEE0();
  *v0 = v1;
}

void sub_1C03CDE0C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CDEE0();
  *v0 = v1;
}

char *sub_1C03CDE40(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C03CDFD0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_1C03CDE5C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CDEE0();
  *v0 = v1;
}

uint64_t sub_1C03CDE90(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1C03CE0B0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

void sub_1C03CDEAC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1C03CE198();
  *v0 = v1;
}

void sub_1C03CDEE0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(_QWORD);
  char v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t *v7;
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_124_0();
  if ((v8 & 1) != 0)
  {
    v9 = *(_QWORD *)(v0 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < v6)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_24:
        __break(1u);
        return;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= v6)
        v10 = v6;
    }
  }
  else
  {
    v10 = v6;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v10;
  if (!v12)
    goto LABEL_18;
  __swift_instantiateConcreteTypeFromMangledName(v7);
  v2(0);
  v13 = (_QWORD *)OUTLINED_FUNCTION_21_3();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v4)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v14 - v5 == 0x8000000000000000 && v4 == -1)
    goto LABEL_23;
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v5) / v4);
LABEL_18:
  v16 = ((uint64_t (*)(_QWORD))v2)(0);
  v17 = OUTLINED_FUNCTION_34_2(v16);
  if ((v3 & 1) != 0)
  {
    v1(v17);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1C03CD918(v17, v18);
  }
  swift_release();
  OUTLINED_FUNCTION_69();
}

char *sub_1C03CDFD0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD910);
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
    sub_1C03B8FF4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C03CD690((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1C03CE0B0(uint64_t result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383B8);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  v12 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C03B91E8(v12, v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C03CD9A8((uint64_t)v12, v8);
  }
  swift_release();
  return v10;
}

void sub_1C03CE198()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t *v7;
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_124_0();
  if ((v8 & 1) != 0)
  {
    v9 = *(_QWORD *)(v0 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < v6)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_24:
        __break(1u);
        return;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= v6)
        v10 = v6;
    }
  }
  else
  {
    v10 = v6;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v10;
  if (!v12)
    goto LABEL_18;
  __swift_instantiateConcreteTypeFromMangledName(v7);
  __swift_instantiateConcreteTypeFromMangledName(v2);
  v13 = (_QWORD *)OUTLINED_FUNCTION_21_3();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v4)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v14 - v5 == 0x8000000000000000 && v4 == -1)
    goto LABEL_23;
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v5) / v4);
LABEL_18:
  v16 = __swift_instantiateConcreteTypeFromMangledName(v2);
  v17 = OUTLINED_FUNCTION_34_2(v16);
  if ((v3 & 1) != 0)
  {
    v1(v17);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_1C03CDA48(v17, v18);
  }
  swift_release();
  OUTLINED_FUNCTION_69();
}

void sub_1C03CE288()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  unint64_t v20;

  v1 = *(_QWORD *)(*v0 + 16);
  v2 = v1 - 2;
  if (v1 >= 2)
  {
    v3 = 0;
    while (1)
    {
      v20 = 0;
      MEMORY[0x1C3B99F50](&v20, 8);
      v4 = (v20 * (unsigned __int128)v1) >> 64;
      if (v1 > v20 * v1)
      {
        v5 = -(uint64_t)v1 % v1;
        if (v5 > v20 * v1)
        {
          do
          {
            v20 = 0;
            MEMORY[0x1C3B99F50](&v20, 8);
          }
          while (v5 > v20 * v1);
          v4 = (v20 * (unsigned __int128)v1) >> 64;
        }
      }
      v6 = v3 + v4;
      if (__OFADD__(v3, v4))
        break;
      if (v3 != v6)
      {
        v7 = *v0;
        v8 = *(_QWORD *)(*v0 + 16);
        if (v3 >= v8)
          goto LABEL_22;
        if (v6 >= v8)
          goto LABEL_23;
        v9 = *(void **)(v7 + 32 + 8 * v6);
        v10 = *(id *)(v7 + 32 + 8 * v3);
        v11 = v9;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v0 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_1C03D0018();
        if (v3 >= *(_QWORD *)(v7 + 16))
          goto LABEL_24;
        v13 = v7 + 8 * v3;
        v14 = *(void **)(v13 + 32);
        *(_QWORD *)(v13 + 32) = v11;

        sub_1C03E42E0();
        v15 = *v0;
        v16 = swift_isUniquelyReferenced_nonNull_native();
        *v0 = v15;
        if ((v16 & 1) == 0)
          sub_1C03D0018();
        if (v6 >= *(_QWORD *)(v15 + 16))
          goto LABEL_25;
        v17 = v15 + 8 * v6;
        v18 = *(void **)(v17 + 32);
        *(_QWORD *)(v17 + 32) = v10;

        sub_1C03E42E0();
      }
      --v1;
      if (v3++ == v2)
        return;
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
}

void sub_1C03CE420(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_1C03E3BB4() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1C03CFFDC();
    v3 = v4;
  }
  v5 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_1C03CE4A0(v6);
  *a1 = v3;
}

void sub_1C03CE4A0(uint64_t *a1)
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
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
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
  unint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  char v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  char *v130;
  char *v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t *v138;
  char *v139;
  uint64_t v140;
  char *v141;
  void (*v142)(char *, uint64_t, uint64_t);
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;

  v2 = v1;
  v4 = sub_1C03E3BB4();
  v145 = *(_QWORD **)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v130 = (char *)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v141 = (char *)&v124 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v136 = (char *)&v124 - v10;
  MEMORY[0x1E0C80A78](v9);
  v137 = (char *)&v124 - v11;
  v12 = a1[1];
  v13 = sub_1C03E43DC();
  if (v13 >= v12)
  {
    if ((v12 & 0x8000000000000000) == 0)
    {
      if (v12)
        sub_1C03CEE50(0, v12, 1, a1);
      return;
    }
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
    goto LABEL_144;
  }
  v14 = v13;
  v126 = sub_1C03CD5D4(v12 / 2);
  v127 = v12;
  v132 = v15;
  if (v12 <= 0)
  {
    v17 = (char *)MEMORY[0x1E0DEE9D8];
    v68 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_102:
    if (v68 < 2)
      goto LABEL_116;
    v118 = *a1;
    while (1)
    {
      v119 = v68 - 2;
      if (v68 < 2)
        break;
      if (!v118)
        goto LABEL_148;
      v120 = *(_QWORD *)&v17[16 * v119 + 32];
      v121 = *(_QWORD *)&v17[16 * v68 + 24];
      sub_1C03CF0A8(v118 + v145[9] * v120, v118 + v145[9] * *(_QWORD *)&v17[16 * v68 + 16], v118 + v145[9] * v121, v132);
      if (v2)
        goto LABEL_114;
      if (v121 < v120)
        goto LABEL_135;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_1C03CF5CC((uint64_t)v17);
      if (v119 >= *((_QWORD *)v17 + 2))
        goto LABEL_136;
      v122 = &v17[16 * v119 + 32];
      *(_QWORD *)v122 = v120;
      *((_QWORD *)v122 + 1) = v121;
      v123 = *((_QWORD *)v17 + 2);
      if (v68 > v123)
        goto LABEL_137;
      memmove(&v17[16 * v68 + 16], &v17[16 * v68 + 32], 16 * (v123 - v68));
      *((_QWORD *)v17 + 2) = v123 - 1;
      v68 = v123 - 1;
      if (v123 <= 2)
        goto LABEL_116;
    }
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  v125 = v14;
  v16 = 0;
  v17 = (char *)MEMORY[0x1E0DEE9D8];
  v18 = v12;
  v138 = a1;
  v140 = v4;
  while (1)
  {
    v19 = (uint64_t)v16;
    v20 = v16 + 1;
    v128 = v17;
    v131 = v16;
    if ((uint64_t)(v16 + 1) >= v18)
    {
      v27 = (uint64_t)(v16 + 1);
    }
    else
    {
      v129 = *a1;
      v21 = v129;
      v22 = v145[9];
      v143 = v18;
      v144 = v22;
      v23 = (char *)v145[2];
      ((void (*)(char *, uint64_t, uint64_t))v23)(v137, v129 + v22 * (_QWORD)v20, v4);
      v24 = v21 + v22 * v19;
      v25 = v136;
      v139 = v23;
      ((void (*)(char *, uint64_t, uint64_t))v23)(v136, v24, v4);
      v142 = (void (*)(char *, uint64_t, uint64_t))sub_1C03E3B9C();
      v135 = sub_1C03E3B9C();
      v26 = (void (*)(char *, uint64_t))v145[1];
      v26(v25, v4);
      v26(v137, v4);
      v27 = v19 + 2;
      if (v19 + 2 < v143)
      {
        v124 = v2;
        v28 = v129;
        v133 = v144 * v27;
        v134 = v144 * (_QWORD)v20;
        while (1)
        {
          v29 = v27;
          v30 = v135 < (uint64_t)v142;
          v31 = v137;
          v32 = v139;
          v33 = v140;
          ((void (*)(char *, uint64_t, uint64_t))v139)(v137, v28 + v133, v140);
          v34 = v136;
          ((void (*)(char *, uint64_t, uint64_t))v32)(v136, v28 + v134, v33);
          v35 = sub_1C03E3B9C();
          LODWORD(v32) = sub_1C03E3B9C() >= v35;
          v26(v34, v33);
          v26(v31, v33);
          if (v30 == (_DWORD)v32)
            break;
          v27 = v29 + 1;
          v28 += v144;
          if (v29 + 1 >= v143)
          {
            v18 = v143;
            v27 = v143;
            v17 = v128;
            a1 = v138;
            v4 = v140;
            v2 = v124;
            v19 = (uint64_t)v131;
            goto LABEL_13;
          }
        }
        v17 = v128;
        a1 = v138;
        v4 = v140;
        v2 = v124;
        v27 = v29;
        v19 = (uint64_t)v131;
      }
      v18 = v143;
LABEL_13:
      if (v135 < (uint64_t)v142)
      {
        if (v27 < v19)
          goto LABEL_141;
        if (v19 < v27)
        {
          v36 = v19;
          v37 = 0;
          v38 = v144;
          v39 = v144 * (v27 - 1);
          v40 = v27 * v144;
          v41 = v36;
          v42 = v36 * v144;
          v139 = (char *)v27;
          do
          {
            if (v41 != v27 + v37 - 1)
            {
              v43 = v2;
              v44 = v129;
              if (!v129)
                goto LABEL_147;
              v45 = v129 + v42;
              v135 = v129 + v39;
              v46 = v140;
              v142 = (void (*)(char *, uint64_t, uint64_t))v145[4];
              v142(v130, v129 + v42, v140);
              if (v42 < v39 || v45 >= v44 + v40)
              {
                v48 = v135;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                v48 = v135;
                if (v42 != v39)
                  swift_arrayInitWithTakeBackToFront();
              }
              v142((char *)v48, (uint64_t)v130, v46);
              v17 = v128;
              v2 = v43;
              v27 = (uint64_t)v139;
              v38 = v144;
            }
            ++v41;
            --v37;
            v39 -= v38;
            v40 -= v38;
            v42 += v38;
          }
          while (v41 < v27 + v37);
          a1 = v138;
          v4 = v140;
          v19 = (uint64_t)v131;
          v18 = v143;
        }
      }
    }
    if (v27 < v18)
    {
      if (__OFSUB__(v27, v19))
        goto LABEL_139;
      if (v27 - v19 < v125)
      {
        if (__OFADD__(v19, v125))
          goto LABEL_142;
        if (v19 + v125 >= v18)
          v49 = v18;
        else
          v49 = v19 + v125;
        if (v49 < v19)
          goto LABEL_143;
        if (v27 != v49)
        {
          v124 = v2;
          v50 = v145[9];
          v133 = v145[2];
          v134 = v50;
          v144 = v50 * (v27 - 1);
          v51 = v27 * v50;
          v129 = v49;
          do
          {
            v52 = 0;
            v139 = (char *)v27;
            v135 = v51;
            while (1)
            {
              v142 = (void (*)(char *, uint64_t, uint64_t))v19;
              v53 = v138;
              v54 = *v138;
              v55 = v51 + v52 + *v138;
              v56 = v137;
              v57 = (void (*)(char *, uint64_t, uint64_t))v133;
              ((void (*)(char *, uint64_t, uint64_t))v133)(v137, v55, v4);
              v58 = v136;
              v57(v136, v144 + v52 + v54, v4);
              v143 = sub_1C03E3B9C();
              v59 = sub_1C03E3B9C();
              v60 = (void (*)(char *, uint64_t))v145[1];
              v60(v58, v4);
              v60(v56, v4);
              if (v59 >= v143)
                break;
              v61 = *v53;
              if (!*v53)
                goto LABEL_145;
              v51 = v135;
              v62 = (char *)(v61 + v144 + v52);
              v63 = (void (*)(char *, uint64_t, uint64_t))v145[4];
              v4 = v140;
              v63(v141, v61 + v135 + v52, v140);
              swift_arrayInitWithTakeFrontToBack();
              v63(v62, (uint64_t)v141, v4);
              v52 -= v134;
              v19 = (uint64_t)v142 + 1;
              v64 = v139;
              if (v139 == (char *)v142 + 1)
                goto LABEL_46;
            }
            v64 = v139;
            v4 = v140;
            v51 = v135;
LABEL_46:
            v27 = (uint64_t)(v64 + 1);
            v144 += v134;
            v51 += v134;
            v19 = (uint64_t)v131;
          }
          while (v27 != v129);
          v27 = v129;
          v2 = v124;
          v17 = v128;
          a1 = v138;
        }
      }
    }
    if (v27 < v19)
      goto LABEL_138;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v139 = (char *)v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_1C03CF4D8(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v67 = *((_QWORD *)v17 + 2);
    v66 = *((_QWORD *)v17 + 3);
    v68 = v67 + 1;
    if (v67 >= v66 >> 1)
      v17 = sub_1C03CF4D8((char *)(v66 > 1), v67 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v68;
    v69 = v17 + 32;
    v70 = &v17[16 * v67 + 32];
    v71 = v139;
    *(_QWORD *)v70 = v131;
    *((_QWORD *)v70 + 1) = v71;
    if (v67)
      break;
    v68 = 1;
LABEL_96:
    v18 = a1[1];
    v16 = v139;
    if ((uint64_t)v139 >= v18)
      goto LABEL_102;
  }
  while (1)
  {
    v72 = v68 - 1;
    if (v68 >= 4)
    {
      v77 = &v69[16 * v68];
      v78 = *((_QWORD *)v77 - 8);
      v79 = *((_QWORD *)v77 - 7);
      v83 = __OFSUB__(v79, v78);
      v80 = v79 - v78;
      if (v83)
        goto LABEL_123;
      v82 = *((_QWORD *)v77 - 6);
      v81 = *((_QWORD *)v77 - 5);
      v83 = __OFSUB__(v81, v82);
      v75 = v81 - v82;
      v76 = v83;
      if (v83)
        goto LABEL_124;
      v84 = v68 - 2;
      v85 = &v69[16 * v68 - 32];
      v87 = *(_QWORD *)v85;
      v86 = *((_QWORD *)v85 + 1);
      v83 = __OFSUB__(v86, v87);
      v88 = v86 - v87;
      if (v83)
        goto LABEL_125;
      v83 = __OFADD__(v75, v88);
      v89 = v75 + v88;
      if (v83)
        goto LABEL_127;
      if (v89 >= v80)
      {
        v107 = &v69[16 * v72];
        v109 = *(_QWORD *)v107;
        v108 = *((_QWORD *)v107 + 1);
        v83 = __OFSUB__(v108, v109);
        v110 = v108 - v109;
        if (v83)
          goto LABEL_133;
        v100 = v75 < v110;
        goto LABEL_85;
      }
    }
    else
    {
      if (v68 != 3)
      {
        v101 = *((_QWORD *)v17 + 4);
        v102 = *((_QWORD *)v17 + 5);
        v83 = __OFSUB__(v102, v101);
        v94 = v102 - v101;
        v95 = v83;
        goto LABEL_79;
      }
      v74 = *((_QWORD *)v17 + 4);
      v73 = *((_QWORD *)v17 + 5);
      v83 = __OFSUB__(v73, v74);
      v75 = v73 - v74;
      v76 = v83;
    }
    if ((v76 & 1) != 0)
      goto LABEL_126;
    v84 = v68 - 2;
    v90 = &v69[16 * v68 - 32];
    v92 = *(_QWORD *)v90;
    v91 = *((_QWORD *)v90 + 1);
    v93 = __OFSUB__(v91, v92);
    v94 = v91 - v92;
    v95 = v93;
    if (v93)
      goto LABEL_128;
    v96 = &v69[16 * v72];
    v98 = *(_QWORD *)v96;
    v97 = *((_QWORD *)v96 + 1);
    v83 = __OFSUB__(v97, v98);
    v99 = v97 - v98;
    if (v83)
      goto LABEL_130;
    if (__OFADD__(v94, v99))
      goto LABEL_132;
    if (v94 + v99 >= v75)
    {
      v100 = v75 < v99;
LABEL_85:
      if (v100)
        v72 = v84;
      goto LABEL_87;
    }
LABEL_79:
    if ((v95 & 1) != 0)
      goto LABEL_129;
    v103 = &v69[16 * v72];
    v105 = *(_QWORD *)v103;
    v104 = *((_QWORD *)v103 + 1);
    v83 = __OFSUB__(v104, v105);
    v106 = v104 - v105;
    if (v83)
      goto LABEL_131;
    if (v106 < v94)
      goto LABEL_96;
LABEL_87:
    v111 = v72 - 1;
    if (v72 - 1 >= v68)
    {
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
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
      goto LABEL_134;
    }
    v112 = *a1;
    if (!*a1)
      goto LABEL_146;
    v113 = &v69[16 * v111];
    v114 = *(_QWORD *)v113;
    v115 = &v69[16 * v72];
    v116 = *((_QWORD *)v115 + 1);
    sub_1C03CF0A8(v112 + v145[9] * *(_QWORD *)v113, v112 + v145[9] * *(_QWORD *)v115, v112 + v145[9] * v116, v132);
    if (v2)
      break;
    if (v116 < v114)
      goto LABEL_120;
    if (v72 > *((_QWORD *)v17 + 2))
      goto LABEL_121;
    *(_QWORD *)v113 = v114;
    *(_QWORD *)&v69[16 * v111 + 8] = v116;
    v117 = *((_QWORD *)v17 + 2);
    if (v72 >= v117)
      goto LABEL_122;
    v68 = v117 - 1;
    memmove(&v69[16 * v72], v115 + 16, 16 * (v117 - 1 - v72));
    *((_QWORD *)v17 + 2) = v117 - 1;
    a1 = v138;
    v4 = v140;
    if (v117 <= 2)
      goto LABEL_96;
  }
LABEL_114:
  swift_bridgeObjectRelease();
  if (v127 >= -1)
    goto LABEL_117;
  __break(1u);
LABEL_116:
  swift_bridgeObjectRelease();
  if (v127 >= -1)
  {
LABEL_117:
    *(_QWORD *)(v126 + 16) = 0;
    swift_bridgeObjectRelease();
    return;
  }
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
}

uint64_t sub_1C03CEE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;

  v33 = a1;
  v7 = sub_1C03E3BB4();
  v41 = *(_QWORD **)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v40 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v36 = (char *)&v31 - v11;
  result = MEMORY[0x1E0C80A78](v10);
  v35 = (char *)&v31 - v13;
  v39 = a3;
  v32 = a2;
  if (a3 != a2)
  {
    v14 = v41[9];
    v34 = (void (*)(char *, uint64_t, uint64_t))v41[2];
    v44 = v14 * (v39 - 1);
    v37 = v14;
    v15 = v14 * v39;
    v43 = a4;
    while (2)
    {
      v16 = 0;
      v17 = v33;
      v38 = v15;
      do
      {
        v18 = *v43;
        v19 = v15 + v16 + *v43;
        v21 = v34;
        v20 = v35;
        v34(v35, v19, v7);
        v22 = v7;
        v23 = v36;
        v21(v36, v44 + v16 + v18, v22);
        v42 = sub_1C03E3B9C();
        v24 = sub_1C03E3B9C();
        v25 = (void (*)(char *, uint64_t))v41[1];
        v26 = v23;
        v7 = v22;
        v25(v26, v22);
        v27 = v20;
        v15 = v38;
        result = ((uint64_t (*)(char *, uint64_t))v25)(v27, v22);
        if (v24 >= v42)
          break;
        v28 = *v43;
        if (!*v43)
        {
          __break(1u);
          return result;
        }
        v29 = v28 + v44 + v16;
        v30 = (void (*)(char *, uint64_t, uint64_t))v41[4];
        v30(v40, v28 + v15 + v16, v22);
        swift_arrayInitWithTakeFrontToBack();
        result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(v29, v40, v22);
        v16 -= v37;
        ++v17;
      }
      while (v39 != v17);
      v44 += v37;
      v15 += v37;
      if (++v39 != v32)
        continue;
      break;
    }
  }
  return result;
}

void sub_1C03CF0A8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  BOOL v14;
  int64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  unint64_t v30;
  BOOL v31;
  unint64_t v33;
  BOOL v34;
  void (*v36)(char *);
  char *v37;
  unint64_t v38;
  uint64_t v39;
  void (*v40)(char *);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  unint64_t v48;
  char *v50;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(char *);
  uint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;

  v64 = sub_1C03E3BB4();
  v8 = MEMORY[0x1E0C80A78](v64);
  v61 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v60 = (char *)&v52 - v10;
  v62 = v11;
  v12 = *(_QWORD *)(v11 + 72);
  if (!v12)
  {
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v13 = a2 - a1;
  v14 = a2 - a1 == 0x8000000000000000 && v12 == -1;
  if (v14)
    goto LABEL_78;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v12 == -1)
    goto LABEL_79;
  v17 = v13 / v12;
  v18 = v15 / v12;
  if (v13 / v12 >= v15 / v12)
  {
    sub_1C03B8FDC(a2, v15 / v12);
    v19 = (char *)(a4 + v18 * v12);
    if (v18 * v12 < 1 || a1 >= a2)
      goto LABEL_72;
    v56 = -v12;
    v36 = *(void (**)(char *))(v62 + 16);
    v54 = a1;
    v55 = v36;
    v53 = a4;
    v59 = v12;
    v37 = v60;
    while (1)
    {
      v38 = a3;
      v40 = v55;
      v39 = v56;
      v63 = a3 + v56;
      v58 = &v19[v56];
      v41 = v64;
      v55(v37);
      v42 = v61;
      v57 = a2 + v39;
      v40(v61);
      v43 = sub_1C03E3B9C();
      v44 = sub_1C03E3B9C();
      v45 = *(void (**)(char *, uint64_t))(v62 + 8);
      v45(v42, v41);
      v45(v37, v41);
      if (v44 >= v43)
      {
        a3 = v63;
        if (v38 >= (unint64_t)v19 && v63 < (unint64_t)v19)
        {
          v14 = v38 == (_QWORD)v19;
          v12 = v59;
          v48 = v54;
          v19 = v58;
          if (!v14)
            swift_arrayInitWithTakeBackToFront();
          a4 = v53;
          goto LABEL_68;
        }
        v19 = v58;
      }
      else
      {
        a3 = v63;
        if (v38 >= a2 && v63 < a2)
        {
          v48 = v54;
          if (v38 == a2)
          {
            a2 = v57;
          }
          else
          {
            a2 = v57;
            swift_arrayInitWithTakeBackToFront();
          }
          a4 = v53;
          goto LABEL_66;
        }
        a2 = v57;
      }
      swift_arrayInitWithTakeFrontToBack();
      a4 = v53;
      v48 = v54;
LABEL_66:
      v12 = v59;
LABEL_68:
      if ((unint64_t)v19 <= a4 || a2 <= v48)
        goto LABEL_72;
    }
  }
  sub_1C03B8FDC(a1, v13 / v12);
  v19 = (char *)(a4 + v17 * v12);
  if (v17 * v12 >= 1 && a2 < a3)
  {
    v21 = a2;
    v22 = v61;
    v58 = *(char **)(v62 + 16);
    v59 = v12;
    v63 = a3;
    v57 = (unint64_t)v19;
    do
    {
      v23 = v60;
      v24 = v64;
      v25 = v58;
      ((void (*)(char *, unint64_t, uint64_t))v58)(v60, v21, v64);
      ((void (*)(char *, unint64_t, uint64_t))v25)(v22, a4, v24);
      v26 = sub_1C03E3B9C();
      v27 = sub_1C03E3B9C();
      v28 = a4;
      v29 = *(void (**)(char *, uint64_t))(v62 + 8);
      v29(v22, v24);
      v29(v23, v24);
      if (v27 >= v26)
      {
        v12 = v59;
        a4 = v28 + v59;
        if (a1 >= v28 && a1 < a4)
        {
          v33 = v63;
          if (a1 != v28)
            swift_arrayInitWithTakeBackToFront();
          v30 = v21;
          goto LABEL_35;
        }
        swift_arrayInitWithTakeFrontToBack();
        v30 = v21;
      }
      else
      {
        v12 = v59;
        v30 = v21 + v59;
        v31 = a1 < v21 || a1 >= v30;
        a4 = v28;
        if (!v31)
        {
          v33 = v63;
          if (a1 != v21)
            swift_arrayInitWithTakeBackToFront();
          goto LABEL_35;
        }
        swift_arrayInitWithTakeFrontToBack();
      }
      v33 = v63;
LABEL_35:
      v19 = (char *)v57;
      a1 += v12;
      v34 = a4 >= v57 || v30 >= v33;
      v21 = v30;
    }
    while (!v34);
  }
LABEL_72:
  v50 = &v19[-a4];
  if (v12 != -1 || v50 != (char *)0x8000000000000000)
  {
    sub_1C03B8FDC(a4, (uint64_t)v50 / v12);
    return;
  }
LABEL_80:
  __break(1u);
}

char *sub_1C03CF4D8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDEB8);
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

char *sub_1C03CF5CC(uint64_t a1)
{
  return sub_1C03CF4D8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_1C03CF5E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C03E4088();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setActionIdentifier_, v4);

}

void sub_1C03CF630(uint64_t a1, void *a2)
{
  id v3;

  sub_1C03E3FC8();
  v3 = (id)sub_1C03E410C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setParameters_, v3);

}

void sub_1C03CF690(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C03E4088();
  objc_msgSend(a3, sel_setKey_, v4);

}

void sub_1C03CF6D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C03E4088();
  objc_msgSend(a3, sel_setValue_, v4);

}

uint64_t sub_1C03CF718(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C03E4340();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1C03E4340();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C03D00C8(&qword_1EF5FDEB0, &qword_1EF5FDEA8);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDEA8);
            v10 = sub_1C03CFA38(v13, i, a3);
            v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C03CD738((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C03CF8A8(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C03E4340();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1C03E4340();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C03D00C8(&qword_1EF5FDE50, &qword_1EF5FDE48);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE48);
            v10 = sub_1C03CFA90(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C03CD820((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1C03CFA38(uint64_t **a1, unint64_t a2, uint64_t a3))()
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_1C03CFB10(v6, a2, a3);
  return sub_1C03CFA8C;
}

uint64_t (*sub_1C03CFA90(_QWORD *a1, unint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C03CFB80(v6, a2, a3);
  return sub_1C03CFA8C;
}

void sub_1C03CFAE4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1C03CFB10(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  sub_1C03CDB00(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = MEMORY[0x1C3B998FC](a2, a3);
  else
    v7 = swift_retain();
  *a1 = v7;
  return j__OUTLINED_FUNCTION_54_1;
}

void (*sub_1C03CFB80(_QWORD *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_1C03CDB00(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x1C3B998FC](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_1C03CFBEC;
}

void sub_1C03CFBEC(id *a1)
{

}

uint64_t sub_1C03CFBF8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t sub_1C03CFC48@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

unint64_t sub_1C03CFC84()
{
  unint64_t result;

  result = qword_1EF5FDCD0;
  if (!qword_1EF5FDCD0)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for SiriHelpDispatcherErrors, &type metadata for SiriHelpDispatcherErrors);
    atomic_store(result, (unint64_t *)&qword_1EF5FDCD0);
  }
  return result;
}

uint64_t sub_1C03CFCC0()
{
  return type metadata accessor for SiriHelpDispatcher();
}

uint64_t type metadata accessor for SiriHelpDispatcher()
{
  uint64_t result;

  result = qword_1EF5FDD30;
  if (!qword_1EF5FDD30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C03CFD00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E2FC0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriHelpDispatcherErrors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriHelpDispatcherErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C03CFE3C + 4 * byte_1C03E5E70[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C03CFE5C + 4 * byte_1C03E5E75[v4]))();
}

_BYTE *sub_1C03CFE3C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C03CFE5C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C03CFE64(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C03CFE6C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C03CFE74(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C03CFE7C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriHelpDispatcherErrors()
{
  return &type metadata for SiriHelpDispatcherErrors;
}

uint64_t sub_1C03CFE98()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_8() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_48_2(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

uint64_t sub_1C03CFF24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  OUTLINED_FUNCTION_8();
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1C03A80E8;
  return sub_1C03CB5C0(a1, v4, v5, v6, v7, v8);
}

void sub_1C03CFFDC()
{
  sub_1C03CDEE0();
}

void sub_1C03D0018()
{
  JUMPOUT(0x1C3B99A1CLL);
}

uint64_t sub_1C03D002C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C03D0064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDE70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03D00AC(uint64_t a1)
{
  uint64_t v1;

  return sub_1C03CBF7C(a1, *(_QWORD *)(v1 + 16)) & 1;
}

void sub_1C03D00C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1C3B99EA8](MEMORY[0x1E0DEAF50], v3), a1);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03D0104(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return OUTLINED_FUNCTION_54_1();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1C03D0164(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1C03D0174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  _UNKNOWN **v21;

  v20 = type metadata accessor for SiriHelpResponseVersionInvoker();
  v21 = &off_1E79B5A48;
  *(_QWORD *)(a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_staticSuggestionsCount) = 3;
  *(_QWORD *)&v19 = a1;
  *(_QWORD *)(a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_catGlobals) = a2;
  sub_1C03ABB30(a3, a7 + 16);
  *(_QWORD *)(a7 + 56) = a4;
  v14 = a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_templatesUrl;
  v15 = sub_1C03E2FC0();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, a5, v15);
  sub_1C03ABB30(a6, a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_appUtils);
  sub_1C03E36A4();
  v17 = sub_1C03E3698();
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a5, v15);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  *(_QWORD *)(a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_siriFeatureSupportPolicyProvider) = v17;
  sub_1C03ABB70(&v19, a7 + OBJC_IVAR____TtC22SiriSuggestionsSupport18SiriHelpDispatcher_responseFrameworkInvoker);
  return a7;
}

_QWORD *sub_1C03D02A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = sub_1C03E3DF4();
  v11 = MEMORY[0x1E0DA6C88];
  a5[5] = v10;
  a5[6] = v11;
  a5[2] = a1;
  a5[10] = type metadata accessor for SiriHelpResponseFramework1Invoker(0);
  a5[11] = &off_1E79B5A38;
  a5[7] = a2;
  v12 = type metadata accessor for SiriHelpResponseFramework2Invoker(0);
  a5[15] = v12;
  a5[16] = &off_1E79B5A28;
  a5[12] = a3;
  a5[20] = v12;
  a5[21] = &off_1E79B5A28;
  a5[17] = a4;
  return a5;
}

uint64_t sub_1C03D0338(uint64_t a1)
{
  return sub_1C03D00AC(a1) & 1;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_4_8()
{
  sub_1C03CDDD8();
}

void OUTLINED_FUNCTION_5_4()
{
  sub_1C03CDDD8();
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_1C03E437C();
}

uint64_t OUTLINED_FUNCTION_28_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_29_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_34_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 32) & ~v2);
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *(_QWORD *)(v23 + 200);
  *(_QWORD *)(v27 + 16) = v22;
  return v24(v27 + v26 + v25 * a22, a2, v28);
}

uint64_t OUTLINED_FUNCTION_41_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_42_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_46_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a20 + 8))(v20, v21);
}

uint64_t OUTLINED_FUNCTION_48_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_52_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  return sub_1C03E35A8();
}

uint64_t OUTLINED_FUNCTION_54_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56_1@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_78_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t);

  return v1(a1);
}

uint64_t OUTLINED_FUNCTION_80_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_83_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_85_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_89@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_93(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_97_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_98_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_101_0(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_102_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

char *OUTLINED_FUNCTION_104_0(char *a1, int64_t a2)
{
  return sub_1C03CDE40(a1, a2, 1);
}

uint64_t OUTLINED_FUNCTION_107_0()
{
  return sub_1C03E40F4();
}

uint64_t OUTLINED_FUNCTION_108_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_109_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_111_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_115_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_117_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_118_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_119_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_120_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_121_0()
{
  return sub_1C03E39F8();
}

uint64_t OUTLINED_FUNCTION_123_0()
{
  return sub_1C03E3A1C();
}

uint64_t OUTLINED_FUNCTION_130_0()
{
  return sub_1C03E3B24();
}

uint64_t sub_1C03D0838(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = OUTLINED_FUNCTION_14_4();
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
    if (v12 || (OUTLINED_FUNCTION_14_4() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C03D08EC()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738338);
  result = sub_1C03E404C();
  qword_1ED7382D0 = result;
  return result;
}

uint64_t sub_1C03D0930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  char v26;
  uint64_t v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (a4)
  {
    v9 = a3 == a1 && a2 == a4;
    if (v9 || (OUTLINED_FUNCTION_14_4() & 1) != 0)
    {
      v10 = qword_1ED738B38;
      OUTLINED_FUNCTION_6_5();
      if (v10 != -1)
        swift_once();
      v11 = OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_1_3(v11, (uint64_t)qword_1ED738B20);
      OUTLINED_FUNCTION_6_5();
      v12 = (void *)sub_1C03E4010();
      v13 = sub_1C03E41E4();
      if (OUTLINED_FUNCTION_10_4(v13))
      {
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_16();
        v14 = OUTLINED_FUNCTION_8_5(4.8151e-34);
        OUTLINED_FUNCTION_3_4(v14);
        OUTLINED_FUNCTION_0_8();
        OUTLINED_FUNCTION_9_5();
        v15 = OUTLINED_FUNCTION_5_5();
        OUTLINED_FUNCTION_11_8(v15);
        OUTLINED_FUNCTION_2_5();
        OUTLINED_FUNCTION_16_1();
        v18 = "Access to %s is allowed for %s as it is the same process";
        goto LABEL_11;
      }
LABEL_23:

      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_14_2();
      return 1;
    }
    v24 = *(_QWORD *)(v4 + 16);
    OUTLINED_FUNCTION_6_5();
    sub_1C03C5380(a3, a4, v24);
    if (v25)
    {
      v26 = sub_1C03D0838(a1, a2, v25);
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
      {
        if (qword_1ED738B38 != -1)
          swift_once();
        v27 = OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_1_3(v27, (uint64_t)qword_1ED738B20);
        OUTLINED_FUNCTION_6_5();
        v12 = (void *)sub_1C03E4010();
        v28 = sub_1C03E41E4();
        if (OUTLINED_FUNCTION_10_4(v28))
        {
          OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_16();
          v29 = OUTLINED_FUNCTION_8_5(4.8151e-34);
          OUTLINED_FUNCTION_3_4(v29);
          OUTLINED_FUNCTION_0_8();
          OUTLINED_FUNCTION_9_5();
          v30 = OUTLINED_FUNCTION_5_5();
          OUTLINED_FUNCTION_11_8(v30);
          OUTLINED_FUNCTION_2_5();
          OUTLINED_FUNCTION_16_1();
          v18 = "Access to %s is allowed for %s";
LABEL_11:
          OUTLINED_FUNCTION_13_6(&dword_1C03A5000, v16, v17, v18);
          OUTLINED_FUNCTION_16_3();
          OUTLINED_FUNCTION_5_0();
        }
        goto LABEL_23;
      }
    }
    if (qword_1ED738B38 != -1)
      swift_once();
    v32 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_1_3(v32, (uint64_t)qword_1ED738B20);
    OUTLINED_FUNCTION_6_5();
    v33 = (void *)sub_1C03E4010();
    v34 = sub_1C03E41FC();
    if (OUTLINED_FUNCTION_10_4(v34))
    {
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_16();
      v35 = OUTLINED_FUNCTION_8_5(4.8151e-34);
      OUTLINED_FUNCTION_3_4(v35);
      OUTLINED_FUNCTION_0_8();
      OUTLINED_FUNCTION_9_5();
      v36 = OUTLINED_FUNCTION_5_5();
      OUTLINED_FUNCTION_11_8(v36);
      OUTLINED_FUNCTION_2_5();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_13_6(&dword_1C03A5000, v37, v38, "Access to %s for %s is not allowed");
      OUTLINED_FUNCTION_16_3();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_14_2();
  }
  else
  {
    if (qword_1ED738B38 != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_1_3(v19, (uint64_t)qword_1ED738B20);
    v20 = sub_1C03E4010();
    v21 = sub_1C03E41FC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_16();
      *(_DWORD *)v22 = 136315138;
      v23 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_3_4(v23);
      sub_1C03E4238();
      OUTLINED_FUNCTION_9_5();
      _os_log_impl(&dword_1C03A5000, v20, v21, "No remote application Id set. Refusing access to %s", v22, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_0();
    }

  }
  OUTLINED_FUNCTION_14_2();
  return 0;
}

uint64_t sub_1C03D0D74()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCAccessList()
{
  return objc_opt_self();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, ...)
{
  unint64_t v1;
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return sub_1C03B934C(v2, v1, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_5(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_10_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11_8(uint64_t a1, ...)
{
  unint64_t v1;
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return sub_1C03B934C(v2, v1, (uint64_t *)va);
}

void OUTLINED_FUNCTION_13_6(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  return sub_1C03E43F4();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return swift_arrayDestroy();
}

uint64_t sub_1C03D0E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 16)
                                                                                              + *(_QWORD *)(a7 + 16));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_1C03A8AF8;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C03D0F48()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_4_9();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_5(v1, (uint64_t)sub_1C03A8AF8);
  return OUTLINED_FUNCTION_1_0(v2, v3, v4, v5, v6);
}

uint64_t sub_1C03D0F88()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_4_9();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_5(v1, (uint64_t)sub_1C03AC1B8);
  return OUTLINED_FUNCTION_1_0(v2, v3, v4, v5, v6);
}

uint64_t sub_1C03D0FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_1C03A80E8;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_3_5@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t dispatch thunk of HintsStateStore.submit(for:propertyKey:propertyValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a7 + 16)
                                                                                              + *(_QWORD *)(a7 + 16));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_1C03B1000;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

INInteraction __swiftcall INInteraction.init(intent:response:donatedBySiri:)(INIntent intent, INIntentResponse response, Swift::Bool donatedBySiri)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIntent_response_, intent.super.isa, response.super.isa);
  objc_msgSend(v6, sel__setDonatedBySiri_, donatedBySiri);

  return (INInteraction)v6;
}

void sub_1C03D11A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_1C03D11B0(a1, a2, a3, a4, (void (*)(uint64_t))sub_1C03CDB24);
}

void sub_1C03D11B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_1C03E4400();
  swift_unknownObjectRetain_n();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    OUTLINED_FUNCTION_125_0();
    v9 = MEMORY[0x1E0DEE9D8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v10 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    v8 = OUTLINED_FUNCTION_124_1();
    a5(v8);
    goto LABEL_9;
  }
  if (!swift_dynamicCastClass())
    OUTLINED_FUNCTION_125_0();
LABEL_9:
  OUTLINED_FUNCTION_125_0();
  OUTLINED_FUNCTION_24();
}

void static EventDrivenSuggestionsClient.getInteractionBuilder@Sendable (event:inAppIdentifier:deviceState:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14[2];
  __int128 v15[2];

  v8 = OUTLINED_FUNCTION_17_3();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03ABB30(a1, (uint64_t)v15);
  OUTLINED_FUNCTION_111_1((uint64_t)v11, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  sub_1C03ABB30(a3, (uint64_t)v14);
  v12 = type metadata accessor for EventDrivenInteractionBuilder(0);
  OUTLINED_FUNCTION_19();
  EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)(v15, (uint64_t)v11, v14);
  a4[3] = v12;
  a4[4] = &protocol witness table for EventDrivenInteractionBuilder;
  *a4 = v13;
}

uint64_t EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 *v3;
  __int128 *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_78_1();
  v5 = swift_allocObject();
  EventDrivenSuggestionsClient.init(clock:suggestionService:interactionBuilder:requestIdProvider:)(v4, v3, v2, v1, v0);
  return v5;
}

_QWORD *EventDrivenSuggestionsClient.init(clock:suggestionService:interactionBuilder:requestIdProvider:)(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  __int128 *v14;
  uint64_t v15;
  uint64_t v17;
  __int128 *v18;

  v17 = a4;
  v18 = a5;
  v9 = OUTLINED_FUNCTION_69_1();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  OUTLINED_FUNCTION_17_3();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8];
  type metadata accessor for Connection(0);
  sub_1C03A858C(&qword_1ED7383E8, v13, MEMORY[0x1E0DA63B8]);
  v5[14] = sub_1C03E404C();
  sub_1C03E37F4();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_eventConfig, v12, v9);
  sub_1C03ABB70(a1, (uint64_t)(v5 + 15));
  sub_1C03ABB70(a2, (uint64_t)(v5 + 20));
  v15 = v17;
  v14 = v18;
  v5[25] = a3;
  v5[26] = v15;
  sub_1C03ABB70(v14, (uint64_t)v5 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider);
  return v5;
}

uint64_t type metadata accessor for Connection(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1ED738578);
}

uint64_t sub_1C03D1508(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = OUTLINED_FUNCTION_17_3();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = OUTLINED_FUNCTION_7_5();
  v3[11] = OUTLINED_FUNCTION_8_6();
  v3[12] = OUTLINED_FUNCTION_8_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738390);
  v3[13] = OUTLINED_FUNCTION_3_0();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738388);
  v3[14] = v5;
  v3[15] = *(_QWORD *)(v5 - 8);
  v3[16] = OUTLINED_FUNCTION_7_5();
  v3[17] = OUTLINED_FUNCTION_8_6();
  v3[18] = OUTLINED_FUNCTION_8_6();
  v3[19] = OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D15B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void (*v37)(_QWORD, unint64_t, uint64_t);
  void *v38;
  uint64_t v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
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
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;

  v1 = v0;
  v3 = (_QWORD *)v0[13];
  v2 = v0[14];
  v4 = v0[6];
  v5 = v0[5];
  OUTLINED_FUNCTION_3_2();
  swift_bridgeObjectRetain();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_1C03D5C28(v6, v5, v4);
  swift_bridgeObjectRelease();
  v8 = MEMORY[0x1E0DEE9D8];
  v64 = MEMORY[0x1E0DEE9D8];
  sub_1C03D64E8(v7, &v65);
  sub_1C03D6524(v3);
  v59 = v8;
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v2) != 1)
  {
    v25 = v0[15];
    v59 = MEMORY[0x1E0DEE9D8];
    do
    {
      v26 = (uint64_t *)v0[19];
      OUTLINED_FUNCTION_117_1(v0[13], (uint64_t)v26);
      v27 = v0[19];
      if (*v26 <= 1)
      {
        OUTLINED_FUNCTION_57_0(v27);
      }
      else
      {
        OUTLINED_FUNCTION_117_1(v27, v0[18]);
        v28 = v59;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C03CDDA4();
          v28 = v64;
        }
        v29 = *(_QWORD *)(v28 + 16);
        if (v29 >= *(_QWORD *)(v28 + 24) >> 1)
        {
          sub_1C03CDDA4();
          v28 = v64;
        }
        v30 = v0[18];
        *(_QWORD *)(v28 + 16) = v29 + 1;
        v59 = v28;
        OUTLINED_FUNCTION_117_1(v30, v28+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v29);
      }
      v32 = (_QWORD *)v0[13];
      v31 = v0[14];
      sub_1C03D6524(v32);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v31) != 1);
  }
  v9 = v0[13];
  sub_1C03C3A1C();
  sub_1C03ABAE4(v9, &qword_1ED738390);
  v10 = *(_QWORD *)(v59 + 16);
  v63 = v0;
  if (v10)
  {
    v11 = v0[15];
    v62 = v0[14];
    v12 = v0[9];
    v65 = v8;
    sub_1C03CDD70();
    v13 = v59 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v60 = v12;
    v61 = *(_QWORD *)(v11 + 72);
    v14 = v65;
    do
    {
      v15 = v1[16];
      v16 = v1[17];
      v17 = v1[12];
      v18 = v1[8];
      sub_1C03D771C(v13, v16, &qword_1ED738388);
      v19 = *(int *)(v62 + 48);
      v20 = v15 + v19;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15 + v19, v16 + v19, v18);
      v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
      v21(v17, v20, v18);
      sub_1C03ABAE4(v16, &qword_1ED738388);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C03CDD70();
        v14 = v65;
      }
      v22 = *(_QWORD *)(v14 + 16);
      v1 = v63;
      v12 = v60;
      if (v22 >= *(_QWORD *)(v14 + 24) >> 1)
      {
        sub_1C03CDD70();
        v14 = v65;
      }
      v23 = v63[12];
      v24 = v63[8];
      *(_QWORD *)(v14 + 16) = v22 + 1;
      v21(v14+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(_QWORD *)(v60 + 72) * v22, v23, v24);
      v65 = v14;
      v13 += v61;
      --v10;
    }
    while (v10);
    swift_release();
  }
  else
  {
    swift_release();
    v14 = MEMORY[0x1E0DEE9D8];
  }
  v1[20] = v14;
  v33 = *(_QWORD *)(v14 + 16);
  v1[21] = v33;
  if (v33)
  {
    v34 = v1[8];
    v35 = v1[9];
    v36 = *(_DWORD *)(v35 + 80);
    *((_DWORD *)v1 + 54) = v36;
    v1[22] = *(_QWORD *)(v35 + 72);
    v37 = *(void (**)(_QWORD, unint64_t, uint64_t))(v35 + 16);
    v1[23] = v37;
    v1[24] = 0;
    v37(v1[11], v14 + ((v36 + 32) & ~(unint64_t)v36), v34);
    if (qword_1ED738B40 != -1)
      swift_once();
    v38 = (void *)v1[10];
    v39 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v39, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_68_0();
    OUTLINED_FUNCTION_121_1();
    OUTLINED_FUNCTION_106_1();
    v40 = OUTLINED_FUNCTION_71_1();
    v41 = OUTLINED_FUNCTION_22_4(v40);
    v42 = v1[7];
    if (v41)
    {
      v43 = OUTLINED_FUNCTION_16();
      v65 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v43 = 136315394;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v44 = OUTLINED_FUNCTION_28_4();
      v52 = OUTLINED_FUNCTION_100_1(v44, v45, v46, v47, v48, v49, v50, v51);
      OUTLINED_FUNCTION_99_0(v52);
      OUTLINED_FUNCTION_21_4();
      *(_WORD *)(v43 + 12) = 2048;
      v53 = *(_QWORD *)(*(_QWORD *)(v42 + 112) + 16);
      OUTLINED_FUNCTION_152();
      *(_QWORD *)(v43 + 14) = v53;
      OUTLINED_FUNCTION_152();
      OUTLINED_FUNCTION_76_1(&dword_1C03A5000, v54, v55, "Disconnecting expired connection: %s. # Remaining connections: %ld");
      OUTLINED_FUNCTION_15_4();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_152();
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_152();

    v63[25] = v1;
    v57 = (_QWORD *)swift_task_alloc();
    v63[26] = v57;
    *v57 = v63;
    v57[1] = sub_1C03D1AE8;
    v58 = OUTLINED_FUNCTION_43(v63[11]);
    return sub_1C03D2464(v58);
  }
  else
  {
    OUTLINED_FUNCTION_10();
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_55();
    return OUTLINED_FUNCTION_26_4((uint64_t (*)(void))v1[1]);
  }
}

uint64_t sub_1C03D1AE8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D1B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v27)(_QWORD, unint64_t, _QWORD);
  uint64_t v28;
  void *v29;
  uint64_t v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;

  OUTLINED_FUNCTION_39_1();
  a19 = v22;
  a20 = v23;
  a18 = v20;
  v24 = *(_QWORD *)(v20 + 168);
  v25 = *(_QWORD *)(v20 + 192) + 1;
  (*(void (**)(_QWORD, _QWORD))(v20 + 200))(*(_QWORD *)(v20 + 88), *(_QWORD *)(v20 + 64));
  if (v25 == v24)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_55();
    return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v20 + 8));
  }
  else
  {
    v27 = *(void (**)(_QWORD, unint64_t, _QWORD))(v20 + 184);
    v28 = *(_QWORD *)(v20 + 192) + 1;
    *(_QWORD *)(v20 + 192) = v28;
    v27(*(_QWORD *)(v20 + 88), *(_QWORD *)(v20 + 160)+ ((*(unsigned __int8 *)(v20 + 216) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 216))+ *(_QWORD *)(v20 + 176) * v28, *(_QWORD *)(v20 + 64));
    if (qword_1ED738B40 != -1)
      swift_once();
    v29 = *(void **)(v20 + 80);
    v30 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v30, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_68_0();
    OUTLINED_FUNCTION_121_1();
    OUTLINED_FUNCTION_106_1();
    v31 = OUTLINED_FUNCTION_71_1();
    v32 = OUTLINED_FUNCTION_22_4(v31);
    v33 = *(_QWORD *)(v20 + 56);
    if (v32)
    {
      v34 = OUTLINED_FUNCTION_16();
      a9 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v34 = 136315394;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v35 = OUTLINED_FUNCTION_28_4();
      v37 = sub_1C03B934C(v35, v36, &a9);
      OUTLINED_FUNCTION_99_0(v37);
      OUTLINED_FUNCTION_21_4();
      *(_WORD *)(v34 + 12) = 2048;
      v38 = *(_QWORD *)(*(_QWORD *)(v33 + 112) + 16);
      OUTLINED_FUNCTION_152();
      *(_QWORD *)(v34 + 14) = v38;
      OUTLINED_FUNCTION_152();
      OUTLINED_FUNCTION_76_1(&dword_1C03A5000, v39, v40, "Disconnecting expired connection: %s. # Remaining connections: %ld");
      OUTLINED_FUNCTION_15_4();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_152();
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_152();

    *(_QWORD *)(v20 + 200) = v21;
    v41 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v20 + 208) = v41;
    *v41 = v20;
    v41[1] = sub_1C03D1AE8;
    OUTLINED_FUNCTION_43(*(_QWORD *)(v20 + 88));
    OUTLINED_FUNCTION_80_1();
    return sub_1C03D2464(v42);
  }
}

uint64_t sub_1C03D1D44(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[7] = a1;
  v2[8] = v1;
  v3 = OUTLINED_FUNCTION_17_3();
  v2[9] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 + 64);
  v2[12] = OUTLINED_FUNCTION_8_6();
  v2[13] = OUTLINED_FUNCTION_8_6();
  v5 = OUTLINED_FUNCTION_69_1();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D1DB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_1C03E3CE0();
  v3 = v2;
  *(_QWORD *)(v0 + 136) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v4;
  *v4 = v0;
  v4[1] = sub_1C03D1E24;
  return sub_1C03D1508(v1, v3);
}

uint64_t sub_1C03D1E24()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D1E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  OUTLINED_FUNCTION_39_1();
  v13 = v12[13];
  v14 = v12[12];
  v29 = v12[11];
  v15 = v12[9];
  v16 = v12[10];
  v17 = v12[8];
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v12[15] + 16))(v12[16], v17 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_eventConfig, v12[14]);
  OUTLINED_FUNCTION_128_0(v13);
  sub_1C03ABB30(v17 + 120, (uint64_t)(v12 + 2));
  OUTLINED_FUNCTION_128_0(v14);
  v18 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18, v14, v15);
  type metadata accessor for Connection(0);
  OUTLINED_FUNCTION_19();
  swift_retain();
  sub_1C03D403C();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_80_1();
  return v21(v20, v21, v22, v23, v24, v25, v26, v27, v29, a10, a11, a12);
}

uint64_t sub_1C03D1F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_1C03AF788;
  return sub_1C03D3954(a1, a2, a4);
}

uint64_t sub_1C03D1FE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[10] = a1;
  v2[11] = v1;
  v3 = OUTLINED_FUNCTION_17_3();
  v2[12] = v3;
  v2[13] = *(_QWORD *)(v3 - 8);
  v2[14] = OUTLINED_FUNCTION_7_5();
  v2[15] = OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D202C()
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
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v20;

  v1 = v0[10];
  v2 = v0[11];
  OUTLINED_FUNCTION_3_2();
  v3 = *(_QWORD *)(v2 + 112);
  swift_bridgeObjectRetain();
  sub_1C03C52F4(v1, v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v6 = v0[15];
    v7 = v0[13];
    v8 = v0[10];
    v9 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_111_1(v6, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    v10 = OUTLINED_FUNCTION_123_1();
    v11 = sub_1C03E41E4();
    if (OUTLINED_FUNCTION_62_1(v10))
    {
      v19 = v0[13];
      v12 = (uint8_t *)OUTLINED_FUNCTION_16();
      v20 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v12 = 136315138;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v13 = OUTLINED_FUNCTION_28_4();
      v0[9] = sub_1C03B934C(v13, v14, &v20);
      sub_1C03E4238();
      OUTLINED_FUNCTION_118_0();
      OUTLINED_FUNCTION_82_1(v19);
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v10, v11, "Getting existing connection for: %s", v12);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_82_1(v0[13]);

    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_79_0();
    __asm { BR              X1 }
  }
  v15 = (_QWORD *)swift_task_alloc();
  v0[16] = v15;
  *v15 = v0;
  v15[1] = sub_1C03D2254;
  OUTLINED_FUNCTION_43(v0[10]);
  OUTLINED_FUNCTION_79_0();
  return sub_1C03D1D44(v16);
}

uint64_t sub_1C03D2254(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1C03D22A8()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = qword_1ED738B40;
  swift_retain();
  if (v1 != -1)
    swift_once();
  v2 = v0[12];
  v3 = v0[10];
  v4 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED738B48);
  OUTLINED_FUNCTION_48_3();
  OUTLINED_FUNCTION_102_1();
  v5 = OUTLINED_FUNCTION_71_1();
  if (OUTLINED_FUNCTION_22_4(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_16();
    v10 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v6 = 136315138;
    sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
    v7 = OUTLINED_FUNCTION_101_1();
    v0[8] = sub_1C03B934C(v7, v8, &v10);
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_95_1();
    OUTLINED_FUNCTION_16_4();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, (os_log_type_t)v3, "Created new connection for: %s", v6);
    OUTLINED_FUNCTION_15_4();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_16_4();

  OUTLINED_FUNCTION_3_2();
  sub_1C03C3F94();
  swift_endAccess();
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_25_2();
  __asm { BR              X1 }
}

uint64_t sub_1C03D2464(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[10] = a1;
  v2[11] = v1;
  v3 = OUTLINED_FUNCTION_17_3();
  v2[12] = v3;
  v2[13] = *(_QWORD *)(v3 - 8);
  v2[14] = OUTLINED_FUNCTION_7_5();
  v2[15] = OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D24B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
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
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;

  OUTLINED_FUNCTION_40_2();
  v1 = *(_QWORD *)(v0 + 80);
  v2 = (uint64_t *)(*(_QWORD *)(v0 + 88) + 112);
  OUTLINED_FUNCTION_3_2();
  v3 = *v2;
  swift_bridgeObjectRetain();
  sub_1C03C52F4(v1, v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 80);
    v9 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_137(v6, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    v10 = sub_1C03E4010();
    v11 = sub_1C03E41F0();
    if (os_log_type_enabled(v10, v11))
    {
      v37 = *(_QWORD *)(v0 + 104);
      v12 = (uint8_t *)swift_slowAlloc();
      OUTLINED_FUNCTION_16();
      *(_DWORD *)v12 = 136315138;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v13 = sub_1C03E43E8();
      *(_QWORD *)(v0 + 72) = OUTLINED_FUNCTION_100_1(v13, v14, v15, v16, v17, v18, v19, v20);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_83_1(v37);
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v10, v11, "Disconnecting: %s", v12);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_83_1(*(_QWORD *)(v0 + 104));

    sub_1C03D4C34();
    OUTLINED_FUNCTION_3_2();
    sub_1C03D5A48();
    swift_endAccess();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v22 = *(_QWORD *)(v0 + 104);
    v21 = *(_QWORD *)(v0 + 112);
    v23 = *(_QWORD *)(v0 + 80);
    v24 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_137(v21, v23, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16));
    v25 = OUTLINED_FUNCTION_106_1();
    v26 = sub_1C03E41E4();
    if (OUTLINED_FUNCTION_62_1(v25))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_16();
      *(_DWORD *)v27 = 136315138;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v28 = sub_1C03E43E8();
      *(_QWORD *)(v0 + 64) = OUTLINED_FUNCTION_100_1(v28, v29, v30, v31, v32, v33, v34, v35);
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_118_0();
      OUTLINED_FUNCTION_81_0();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v25, v26, "no connection for %s found. Unable to disconnect", v27);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_81_0();

  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return OUTLINED_FUNCTION_5_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03D2858(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738350);
  v3[16] = v4;
  v3[17] = *(_QWORD *)(v4 - 8);
  v3[18] = OUTLINED_FUNCTION_3_0();
  v5 = sub_1C03E3CA4();
  v3[19] = v5;
  v3[20] = *(_QWORD *)(v5 - 8);
  v3[21] = OUTLINED_FUNCTION_3_0();
  v6 = sub_1C03E3E24();
  v3[22] = v6;
  v3[23] = *(_QWORD *)(v6 - 8);
  v3[24] = OUTLINED_FUNCTION_3_0();
  v7 = sub_1C03E3C14();
  v3[25] = v7;
  v3[26] = *(_QWORD *)(v7 - 8);
  v3[27] = OUTLINED_FUNCTION_7_5();
  v3[28] = OUTLINED_FUNCTION_8_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738210);
  v3[29] = OUTLINED_FUNCTION_3_0();
  v8 = sub_1C03E302C();
  v3[30] = v8;
  v3[31] = *(_QWORD *)(v8 - 8);
  v3[32] = OUTLINED_FUNCTION_3_0();
  v9 = OUTLINED_FUNCTION_17_3();
  v3[33] = v9;
  v3[34] = *(_QWORD *)(v9 - 8);
  v3[35] = OUTLINED_FUNCTION_7_5();
  v3[36] = OUTLINED_FUNCTION_8_6();
  v3[37] = OUTLINED_FUNCTION_8_6();
  v10 = sub_1C03E3CC8();
  v3[38] = v10;
  v3[39] = *(_QWORD *)(v10 - 8);
  v3[40] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D297C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(v0 + 272);
  sub_1C03E3BFC();
  sub_1C03E3BD8();
  sub_1C03E3B3C();
  v2 = sub_1C03E3CEC();
  v3 = *(void (**)(uint64_t))(v1 + 8);
  *(_QWORD *)(v0 + 328) = v3;
  v4 = OUTLINED_FUNCTION_127_1();
  v3(v4);
  v5 = OUTLINED_FUNCTION_124_1();
  v6 = ((uint64_t (*)(uint64_t))v3)(v5);
  if ((v2 & 1) != 0)
  {
    v7 = MEMORY[0x1C3B99254](v6);
    sub_1C03C5330(0x4974736575716572, 0xE900000000000064, v7, (_OWORD *)(v0 + 16));
    OUTLINED_FUNCTION_10();
    v9 = *(_QWORD *)(v0 + 232);
    v8 = *(_QWORD *)(v0 + 240);
    if (*(_QWORD *)(v0 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
      v10 = swift_dynamicCast();
      OUTLINED_FUNCTION_122_1(v9, v10 ^ 1u);
      if (__swift_getEnumTagSinglePayload(v9, 1, v8) != 1)
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 32))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
        if (qword_1ED738B40 != -1)
          swift_once();
        v11 = OUTLINED_FUNCTION_29();
        v12 = OUTLINED_FUNCTION_45(v11, (uint64_t)qword_1ED738B48);
        v13 = sub_1C03E41E4();
        if (os_log_type_enabled(v12, v13))
        {
          *(_WORD *)OUTLINED_FUNCTION_16() = 0;
          OUTLINED_FUNCTION_38_2(&dword_1C03A5000, v12, v14, "Mapping siri hints identifier");
          OUTLINED_FUNCTION_5_0();
        }
        v15 = *(_QWORD *)(v0 + 288);
        v16 = *(_QWORD *)(v0 + 280);
        v31 = *(_QWORD *)(v0 + 272);
        v32 = *(_QWORD *)(v0 + 296);
        v18 = *(_QWORD *)(v0 + 256);
        v17 = *(_QWORD *)(v0 + 264);
        v19 = *(_QWORD *)(v0 + 248);
        v30 = *(_QWORD *)(v0 + 240);

        sub_1C03E3BD8();
        sub_1C03E3CE0();
        ((void (*)(uint64_t, uint64_t))v3)(v16, v17);
        sub_1C03E3008();
        sub_1C03AC728();
        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v30);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v32, v15, v17);
        goto LABEL_16;
      }
    }
    else
    {
      sub_1C03ABAE4(v0 + 16, &qword_1ED738380);
      OUTLINED_FUNCTION_122_1(v9, 1);
    }
    sub_1C03ABAE4(*(_QWORD *)(v0 + 232), &qword_1ED738210);
  }
  if (qword_1ED738B40 != -1)
    swift_once();
  v20 = *(NSObject **)(v0 + 200);
  v21 = *(_QWORD *)(v0 + 112);
  v22 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v22, (uint64_t)qword_1ED738B48);
  OUTLINED_FUNCTION_48_3();
  OUTLINED_FUNCTION_102_1();
  v23 = OUTLINED_FUNCTION_71_1();
  if (OUTLINED_FUNCTION_22_4(v23))
  {
    v24 = (uint8_t *)OUTLINED_FUNCTION_16();
    v33 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v24 = 136315138;
    sub_1C03A858C(&qword_1ED738240, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5FA0], MEMORY[0x1E0DA5FB0]);
    v25 = OUTLINED_FUNCTION_101_1();
    *(_QWORD *)(v0 + 96) = sub_1C03B934C(v25, v26, &v33);
    OUTLINED_FUNCTION_114();
    OUTLINED_FUNCTION_95_1();
    OUTLINED_FUNCTION_16_4();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v20, (os_log_type_t)v21, "using identifier for inapp as is. %s", v24);
    OUTLINED_FUNCTION_15_4();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_16_4();

  sub_1C03E3BD8();
LABEL_16:
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v27;
  *v27 = v0;
  v27[1] = sub_1C03D2D48;
  OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 296));
  OUTLINED_FUNCTION_79_0();
  return sub_1C03D1FE0(v28);
}

uint64_t sub_1C03D2D48(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 344) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D2D9C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
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
  uint64_t v28;
  _QWORD *v30;
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
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  uint64_t v58;

  v1 = *(void (**)(uint64_t))(v0 + 328);
  sub_1C03E3BD8();
  sub_1C03E3B3C();
  sub_1C03A858C(&qword_1ED738260, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C0]);
  v2 = sub_1C03E407C();
  v3 = OUTLINED_FUNCTION_127_1();
  v1(v3);
  v4 = OUTLINED_FUNCTION_124_1();
  v1(v4);
  if ((v2 & 1) != 0)
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_29();
    v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED738B48);
    OUTLINED_FUNCTION_121_1();
    sub_1C03E4010();
    v7 = OUTLINED_FUNCTION_46();
    v8 = OUTLINED_FUNCTION_8_2(v7);
    v9 = *(_QWORD *)(v0 + 344);
    if (v8)
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_16();
      v58 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v10 = 136315138;
      OUTLINED_FUNCTION_3_2();
      v11 = *(_QWORD *)(v9 + 16);
      swift_bridgeObjectRetain();
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738298);
      v13 = MEMORY[0x1C3B99770](v11, v12);
      v15 = v14;
      OUTLINED_FUNCTION_95_1();
      *(_QWORD *)(v0 + 88) = sub_1C03B934C(v13, v15, &v58);
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_118_0();
      OUTLINED_FUNCTION_126();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v6, (os_log_type_t)v6, "SiriHints UI event fetch. Buffer = %s", v10);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_126();

    OUTLINED_FUNCTION_9_6();
    v30 = (_QWORD *)OUTLINED_FUNCTION_67();
    v31 = OUTLINED_FUNCTION_65_1(v30);
    OUTLINED_FUNCTION_88_1(v31, *MEMORY[0x1E0DF0A50]);
    OUTLINED_FUNCTION_49_2();
    v32 = OUTLINED_FUNCTION_152();
    v40 = OUTLINED_FUNCTION_94_1(v32, v33, v34, v35, v36, v37, v38, v39, v48, v50, v52, v54);
    OUTLINED_FUNCTION_66_1(v40, v41, v42, v43, v44, v45, v46, v47, v49, v51, v53, v55, v56);
    OUTLINED_FUNCTION_85_0();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_30();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_45(v16, (uint64_t)qword_1ED738B48);
    v17 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_8_2(v17))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_38_2(&dword_1C03A5000, v2, v18, "No event in buffer. Adding on generation event");
      OUTLINED_FUNCTION_5_0();
    }
    v20 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 216);
    v22 = *(_QWORD *)(v0 + 160);
    v21 = *(_QWORD *)(v0 + 168);
    v23 = *(_QWORD *)(v0 + 152);
    v25 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 120);

    sub_1C03E3BD8();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v21, *MEMORY[0x1E0DA62D8], v23);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v24 + 120), *(_QWORD *)(v24 + 144));
    sub_1C03E3E84();
    OUTLINED_FUNCTION_137(v19, v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16));
    sub_1C03E3E18();
    v57 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1EF5FDF48 + dword_1EF5FDF48);
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 352) = v26;
    *v26 = v0;
    v26[1] = sub_1C03D3194;
    v27 = OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 192));
    return v57(v27, v28);
  }
}

uint64_t sub_1C03D3194()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  v1 = *(_QWORD *)(v0 + 184);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_task_switch();
}

uint64_t sub_1C03D31F0()
{
  uint64_t v0;
  _QWORD *v1;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_9_6();
  v1 = (_QWORD *)OUTLINED_FUNCTION_67();
  v2 = OUTLINED_FUNCTION_65_1(v1);
  OUTLINED_FUNCTION_88_1(v2, *MEMORY[0x1E0DF0A50]);
  OUTLINED_FUNCTION_49_2();
  v3 = OUTLINED_FUNCTION_152();
  v11 = OUTLINED_FUNCTION_94_1(v3, v4, v5, v6, v7, v8, v9, v10, v20, v22, v24, v26);
  OUTLINED_FUNCTION_66_1(v11, v12, v13, v14, v15, v16, v17, v18, v21, v23, v25, v27, v28);
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return OUTLINED_FUNCTION_26_4(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03D32AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18[3];

  v6 = sub_1C03E3CC8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03D4FA8();
  swift_beginAccess();
  swift_retain();
  sub_1C03C3F94();
  swift_endAccess();
  if (qword_1ED738B40 != -1)
    swift_once();
  v10 = sub_1C03E4028();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED738B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a5, v6);
  v11 = sub_1C03E4010();
  v12 = sub_1C03E41E4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18[0] = v14;
    *(_DWORD *)v13 = 136315138;
    sub_1C03A858C(&qword_1ED738248, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6380], MEMORY[0x1E0DA6388]);
    v15 = sub_1C03E43E8();
    v17 = sub_1C03B934C(v15, v16, v18);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_1C03A5000, v11, v12, "Finished setting up connection for %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B99F38](v14, -1, -1);
    MEMORY[0x1C3B99F38](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

}

uint64_t sub_1C03D3504(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = v1;
  v3 = OUTLINED_FUNCTION_17_3();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = OUTLINED_FUNCTION_3_0();
  v4 = sub_1C03E3CA4();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_7_5();
  v2[16] = OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D356C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_40_2();
  v26 = v1;
  v27 = v2;
  v25 = v0;
  OUTLINED_FUNCTION_110_0(*(_QWORD **)(v0 + 64));
  sub_1C03E3EA8();
  v3 = OUTLINED_FUNCTION_127_1();
  if (v4(v3) == *MEMORY[0x1E0DA62D8])
  {
    v5 = *(_QWORD *)(v0 + 128);
    v7 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 96);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 112) + 96))(v5, *(_QWORD *)(v0 + 104));
    OUTLINED_FUNCTION_137(v6, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v8;
    *v8 = v0;
    v8[1] = sub_1C03D3830;
    v9 = OUTLINED_FUNCTION_43(*(_QWORD *)(v0 + 96));
    return sub_1C03D1FE0(v9);
  }
  else
  {
    if (qword_1ED738B40 != -1)
      swift_once();
    v11 = *(_QWORD *)(v0 + 64);
    v12 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED738B48);
    sub_1C03ABB30(v11, v0 + 16);
    v13 = sub_1C03E4010();
    v14 = sub_1C03E41FC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = *(_QWORD *)(v0 + 120);
      v22 = *(_QWORD *)(v0 + 112);
      v16 = *(_QWORD *)(v0 + 104);
      v23 = v14;
      v17 = (uint8_t *)OUTLINED_FUNCTION_16();
      v24 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v17 = 136315138;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      sub_1C03E3EA8();
      sub_1C03A858C((unint64_t *)&unk_1EF5FD8C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6300], MEMORY[0x1E0DA6338]);
      v18 = sub_1C03E43E8();
      v20 = v19;
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v15, v16);
      *(_QWORD *)(v0 + 56) = sub_1C03B934C(v18, v20, &v24);
      sub_1C03E4238();
      OUTLINED_FUNCTION_95_1();
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v13, v23, "We should not have a delivery vehicle of %s in EventDrivenSuggestionsClient. Ignoring suggestions", v17);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    v21 = *(_QWORD *)(v0 + 112);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);

    (*(void (**)(_QWORD, _QWORD))(v21 + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    return OUTLINED_FUNCTION_5_6(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1C03D3830(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v3 = *(_QWORD **)(*v1 + 64);
  v10 = *v1;
  *(_QWORD *)(v10 + 144) = a1;
  swift_task_dealloc();
  v4 = v3[3];
  v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  *(_QWORD *)(v10 + 152) = v7;
  *v7 = v10;
  v7[1] = sub_1C03D38D4;
  return v9(v6, a1, v4, v5);
}

uint64_t sub_1C03D38D4()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D390C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  return OUTLINED_FUNCTION_33_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03D3954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[24] = a3;
  v4[25] = v3;
  v4[22] = a1;
  v4[23] = a2;
  sub_1C03E302C();
  v4[26] = OUTLINED_FUNCTION_3_0();
  v5 = sub_1C03E3A7C();
  v4[27] = v5;
  v4[28] = *(_QWORD *)(v5 - 8);
  v4[29] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D39B4()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 200) + 160), *(_QWORD *)(*(_QWORD *)(v0 + 200) + 184));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v1;
  *v1 = v0;
  v1[1] = sub_1C03D3A34;
  return sub_1C03E33EC();
}

uint64_t sub_1C03D3A34()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D3A6C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 200) + 160), *(_QWORD *)(*(_QWORD *)(v0 + 200) + 184));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v1;
  *v1 = v0;
  v1[1] = sub_1C03D3AF0;
  return sub_1C03E33F8();
}

uint64_t sub_1C03D3AF0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D3B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_39_1();
  v13 = v12[24];
  v14 = v12[25];
  v15 = v12[23];
  __swift_project_boxed_opaque_existential_1(v12 + 12, v12[15]);
  sub_1C03E33E0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v12 + 12));
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v14 + 200))(v15, v13, v12 + 7);
  __swift_project_boxed_opaque_existential_1(v12 + 17, v12[20]);
  OUTLINED_FUNCTION_110_0((_QWORD *)(v14
                                   + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v15);
  v12[32] = v16;
  v17 = (_QWORD *)OUTLINED_FUNCTION_2_1();
  v12[33] = v17;
  *v17 = v12;
  v17[1] = sub_1C03D3C34;
  OUTLINED_FUNCTION_80_1();
  return v23(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12);
}

uint64_t sub_1C03D3C34()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1C03D3CB8()
{
  _QWORD *v0;
  _QWORD *v1;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[35] = v1;
  *v1 = v0;
  v1[1] = sub_1C03D3D3C;
  return sub_1C03E33A4();
}

uint64_t sub_1C03D3D3C()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D3D74()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  OUTLINED_FUNCTION_127();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_33_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03D3DCC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  OUTLINED_FUNCTION_127();
  sub_1C03E3F5C();
  sub_1C03E3BC0();
  sub_1C03A858C(&qword_1EF5FD7B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5F30], MEMORY[0x1E0DA5F28]);
  sub_1C03E3020();
  sub_1C03E3AA0();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v0 + 8));
}

void EventDrivenSuggestionsClient.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  swift_release();
  v1 = OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_5(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport28EventDrivenSuggestionsClient_requestIdProvider);
  swift_defaultActor_destroy();
  OUTLINED_FUNCTION_7();
}

uint64_t EventDrivenSuggestionsClient.__deallocating_deinit()
{
  EventDrivenSuggestionsClient.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t EventDrivenSuggestionsClient.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1C03D3F20()
{
  return EventDrivenSuggestionsClient.unownedExecutor.getter();
}

uint64_t sub_1C03D3F38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C03AF788;
  return sub_1C03D2858(a1, a2);
}

uint64_t sub_1C03D3F9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return sub_1C03D2464(a1);
}

uint64_t sub_1C03D3FEC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C03AF788;
  return sub_1C03D3504(a1);
}

void sub_1C03D403C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;

  OUTLINED_FUNCTION_78_1();
  *(_QWORD *)(v1 + 16) = MEMORY[0x1E0DEE9D8];
  v6 = v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  OUTLINED_FUNCTION_53_1(v6, v8, v9, v7);
  v10 = OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_lock;
  *(_QWORD *)(v1 + v10) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  v11 = v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_config;
  OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_92_0();
  v12(v11, v5);
  v13 = v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_key;
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_92_0();
  v14(v13, v4);
  sub_1C03ABB70(v3, v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock);
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_getSuggestions);
  *v15 = v2;
  v15[1] = v0;
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1C03D411C(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35[8];

  v34 = a3;
  v33 = a4;
  v6 = sub_1C03E3CF8();
  v31 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a1;
  v16 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  sub_1C03D771C(v16, (uint64_t)v11, &qword_1ED738358);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_1C03ABAE4((uint64_t)v11, &qword_1ED738358);
    if (qword_1ED738B40 != -1)
      swift_once();
    v17 = sub_1C03E4028();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED738B48);
    v18 = v31;
    (*(void (**)(char *, uint8_t *, uint64_t))(v31 + 16))(v8, v34, v6);
    v19 = sub_1C03E4010();
    v20 = sub_1C03E41E4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v35[0] = v22;
      *(_DWORD *)v21 = 136315138;
      v34 = v21 + 4;
      sub_1C03A858C(&qword_1ED738268, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63C8]);
      v23 = sub_1C03E43E8();
      v35[7] = sub_1C03B934C(v23, v24, v35);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
      _os_log_impl(&dword_1C03A5000, v19, v20, "No connection for %s created yet. Adding to buffer", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B99F38](v22, -1, -1);
      MEMORY[0x1C3B99F38](v21, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
    }

    v27 = v32;
    sub_1C03D48EC();
    swift_beginAccess();
    sub_1C03B6850();
    v28 = *(_QWORD *)(*(_QWORD *)(v27 + 16) + 16);
    sub_1C03B68C8(v28);
    v29 = *(_QWORD *)(v27 + 16);
    *(_QWORD *)(v29 + 16) = v28 + 1;
    sub_1C03ABB30(v33, v29 + 40 * v28 + 32);
    return swift_endAccess();
  }
  else
  {
    v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v15, v11, v12);
    sub_1C03ABAE4(a2, &qword_1ED738358);
    v25((char *)a2, v15, v12);
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, v12);
  }
}

id sub_1C03D44C4(void (*a1)(id))
{
  void *v1;

  a1(objc_msgSend(v1, sel_lock));
  return objc_msgSend(v1, sel_unlock);
}

uint64_t sub_1C03D4534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7382E8);
  v3[21] = OUTLINED_FUNCTION_3_0();
  v3[22] = type metadata accessor for PreFetchedSuggestionEvent();
  v3[23] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

void sub_1C03D4594()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v21;

  sub_1C03ABB30(v0[19], (uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738298);
  if (swift_dynamicCast())
  {
    v3 = v0[23];
    v4 = v0[21];
    __swift_storeEnumTagSinglePayload(v4, 0, 1, v0[22]);
    sub_1C03D7614(v4, (uint64_t)v3);
    if (qword_1ED738B40 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_45(v5, (uint64_t)qword_1ED738B48);
    v6 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_8_2(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_38_2(&dword_1C03A5000, v3, v7, "Got a pre fetched event. Returning suggestions");
      OUTLINED_FUNCTION_5_0();
    }
    v8 = v0[23];
    v9 = v0[18];

    v10 = sub_1C03E3AD0();
    OUTLINED_FUNCTION_128(v9, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
    sub_1C03AD148(v8);
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_25_2();
    __asm { BR              X0 }
  }
  v12 = v0[21];
  OUTLINED_FUNCTION_53_1(v12, v1, v2, v0[22]);
  sub_1C03ABAE4(v12, &qword_1ED7382E8);
  if (qword_1ED738B40 != -1)
    swift_once();
  v13 = v0[19];
  v14 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v14, (uint64_t)qword_1ED738B48);
  sub_1C03ABB30((uint64_t)v13, (uint64_t)(v0 + 7));
  OUTLINED_FUNCTION_102_1();
  v15 = OUTLINED_FUNCTION_46();
  if (OUTLINED_FUNCTION_62_1(v13))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_16();
    v21 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v16 = 136315138;
    sub_1C03ABB30((uint64_t)(v0 + 7), (uint64_t)(v0 + 12));
    v17 = sub_1C03E40A0();
    v0[17] = sub_1C03B934C(v17, v18, &v21);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_127();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v13, v15, "Got event of type: %s. Generating suggestions", v16);
    OUTLINED_FUNCTION_15_4();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_127();

  v19 = (_QWORD *)swift_task_alloc();
  v0[24] = v19;
  *v19 = v0;
  v19[1] = sub_1C03D48A0;
  OUTLINED_FUNCTION_25_2();
  __asm { BR              X2 }
}

uint64_t sub_1C03D48A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v2 + 8));
}

void sub_1C03D48EC()
{
  uint64_t v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock), *(_QWORD *)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock + 24));
  sub_1C03E3E84();
  v2 = v1;
  v3 = v0 + 16;
  OUTLINED_FUNCTION_3_2();
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16);
  v5 = v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_config;
  v6 = sub_1C03E3800();
  v7 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    v8 = *(_QWORD *)v3;
    v9 = MEMORY[0x1E0DEE9D8];
    v32 = MEMORY[0x1E0DEE9D8];
    v10 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRetain();
    if (!v10)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      v18 = sub_1C03D4BCC(v7, v9);
      sub_1C03D11B0(v18, v19, v20, v21, (void (*)(uint64_t))sub_1C03CDCC0);
      *(_QWORD *)v3 = v22;
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(*(_QWORD *)v3 + 16);
      if (qword_1ED738B40 == -1)
        goto LABEL_15;
      goto LABEL_20;
    }
    v26 = v7;
    v27 = v3;
    v28 = v4;
    v11 = 0;
    v4 = v8 + 32;
    v12 = MEMORY[0x1E0DEE9D8];
    v3 = 40;
    while (v11 < *(_QWORD *)(v8 + 16))
    {
      sub_1C03ABB30(v4, (uint64_t)&v30);
      __swift_project_boxed_opaque_existential_1(&v30, v31);
      sub_1C03E3E9C();
      v14 = v2 - v13;
      sub_1C03E380C();
      if (v14 >= v15)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
      }
      else
      {
        sub_1C03ABB70(&v30, (uint64_t)v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1C03CDE90(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v32;
        v17 = *(_QWORD *)(v32 + 16);
        v16 = *(_QWORD *)(v32 + 24);
        if (v17 >= v16 >> 1)
        {
          sub_1C03CDE90(v16 > 1, v17 + 1, 1);
          v12 = v32;
        }
        *(_QWORD *)(v12 + 16) = v17 + 1;
        sub_1C03ABB70(v29, v12 + 40 * v17 + 32);
      }
      ++v11;
      v4 += 40;
      if (v10 == v11)
      {
        v9 = v32;
        v3 = v27;
        v4 = v28;
        v7 = v26;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  swift_once();
LABEL_15:
  v23 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_45(v23, (uint64_t)qword_1ED738B48);
  v24 = OUTLINED_FUNCTION_71_1();
  if (os_log_type_enabled((os_log_t)v3, v24))
  {
    v25 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v25 = 134218240;
    *(_QWORD *)&v30 = v4;
    OUTLINED_FUNCTION_108_1();
    *(_WORD *)(v25 + 12) = 2048;
    *(_QWORD *)&v30 = v5;
    OUTLINED_FUNCTION_108_1();
    _os_log_impl(&dword_1C03A5000, (os_log_t)v3, v24, "before purging %ld elements, after purging %ld", (uint8_t *)v25, 0x16u);
    OUTLINED_FUNCTION_5_0();
  }

}

uint64_t sub_1C03D4BCC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_1C03CFBF4(v3, -result, 0, a2);
  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = result;
  if (v3 < v5)
    goto LABEL_9;
  if ((v5 & 0x8000000000000000) == 0)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C03D4C34()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_lock);
  swift_retain();
  objc_msgSend(v1, sel_lock);
  sub_1C03D4CA0(v0);
  objc_msgSend(v1, sel_unlock);
  return swift_release();
}

uint64_t sub_1C03D4CA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v21[5];
  uint64_t v22;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v21 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  v22 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED738B40 != -1)
    swift_once();
  v11 = sub_1C03E4028();
  v21[1] = __swift_project_value_buffer(v11, (uint64_t)qword_1ED738B48);
  v12 = sub_1C03E4010();
  v13 = sub_1C03E41F0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1C03A5000, v12, v13, "Disconnecting connection", v14, 2u);
    MEMORY[0x1C3B99F38](v14, -1, -1);
  }

  v15 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  sub_1C03D771C(v15, (uint64_t)v7, &qword_1ED738358);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_1C03ABAE4((uint64_t)v7, &qword_1ED738358);
  }
  else
  {
    v16 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v10, v7, v8);
    v17 = sub_1C03E4010();
    v18 = sub_1C03E41F0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1C03A5000, v17, v18, "Notifying downstream subscribers of events that connection is disconnected", v19, 2u);
      MEMORY[0x1C3B99F38](v19, -1, -1);
    }

    v21[2] = 0;
    sub_1C03E41B4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v8);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v8);
  swift_beginAccess();
  sub_1C03D75CC((uint64_t)v5, v15);
  return swift_endAccess();
}

id sub_1C03D4FA8()
{
  return OUTLINED_FUNCTION_107_1((void (*)(id))sub_1C03D7414);
}

void sub_1C03D4FF4(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  __int128 v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  int EnumTagSinglePayload;
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
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66[3];
  _BYTE v67[40];
  uint64_t v68;

  v68 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  v58 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v56 = v4;
  v55 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  v9 = MEMORY[0x1E0C80A78](v8);
  v50 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v48 = (char *)&v47 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v47 - v13;
  v57 = a1;
  v15 = a1 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection;
  swift_beginAccess();
  v49 = v15;
  sub_1C03D771C(v15, (uint64_t)v14, &qword_1ED738358);
  v59 = v3;
  LODWORD(a1) = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v3);
  sub_1C03ABAE4((uint64_t)v14, &qword_1ED738358);
  if ((_DWORD)a1 == 1
    && (v16 = v57,
        sub_1C03D48EC(),
        v17 = (uint64_t *)(v16 + 16),
        swift_beginAccess(),
        *(_QWORD *)(*(_QWORD *)(v16 + 16) + 16)))
  {
    *(_QWORD *)&v18 = 136315138;
    v52 = v18;
    v51 = MEMORY[0x1E0DEE9B8] + 8;
    v53 = MEMORY[0x1E0DEE9C0] + 8;
    v54 = (uint64_t *)(v16 + 16);
    v19 = v55;
    v20 = v59;
    while (1)
    {
      swift_beginAccess();
      v21 = *v17;
      if (!*(_QWORD *)(*v17 + 16))
        break;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v17 = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1C03D742C();
        v21 = v42;
        *v17 = v42;
      }
      v23 = *(_QWORD *)(v21 + 16);
      if (!v23)
        goto LABEL_24;
      v24 = v23 - 1;
      sub_1C03ABB70((__int128 *)(v21 + 40 * (v23 - 1) + 32), (uint64_t)&v64);
      *(_QWORD *)(v21 + 16) = v24;
      *v17 = v21;
      sub_1C03ABB70(&v64, (uint64_t)v67);
      swift_endAccess();
      if (qword_1ED738B40 != -1)
        swift_once();
      v25 = sub_1C03E4028();
      __swift_project_value_buffer(v25, (uint64_t)qword_1ED738B48);
      sub_1C03ABB30((uint64_t)v67, (uint64_t)&v64);
      v26 = sub_1C03E4010();
      v27 = sub_1C03E41E4();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        v66[0] = v29;
        *(_DWORD *)v28 = v52;
        __swift_project_boxed_opaque_existential_1(&v64, v65);
        swift_getDynamicType();
        v30 = sub_1C03E44B4();
        *(_QWORD *)(v28 + 4) = sub_1C03B934C(v30, v31, v66);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
        _os_log_impl(&dword_1C03A5000, v26, v27, "sending event %s from buffer to new connection", (uint8_t *)v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3B99F38](v29, -1, -1);
        MEMORY[0x1C3B99F38](v28, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
      }

      v32 = sub_1C03E4190();
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v32);
      sub_1C03ABB30((uint64_t)v67, (uint64_t)&v64);
      v33 = v58;
      (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v19, v68, v20);
      v34 = (*(unsigned __int8 *)(v33 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
      v35 = (char *)swift_allocObject();
      *((_QWORD *)v35 + 2) = 0;
      v36 = v57;
      *((_QWORD *)v35 + 3) = 0;
      *((_QWORD *)v35 + 4) = v36;
      sub_1C03ABB70(&v64, (uint64_t)(v35 + 40));
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v35[v34], v19, v20);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v32);
      swift_retain();
      if (EnumTagSinglePayload == 1)
      {
        sub_1C03ABAE4((uint64_t)v7, &qword_1ED738340);
      }
      else
      {
        sub_1C03E4184();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v7, v32);
      }
      v17 = v54;
      if (*((_QWORD *)v35 + 2))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v38 = sub_1C03E4160();
        v40 = v39;
        swift_unknownObjectRelease();
      }
      else
      {
        v38 = 0;
        v40 = 0;
      }
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = &unk_1EF5FDFB8;
      *(_QWORD *)(v41 + 24) = v35;
      if (v40 | v38)
      {
        v61 = 0;
        v60 = 0;
        v62 = v38;
        v63 = v40;
      }
      swift_task_create();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
      if (!*(_QWORD *)(*v17 + 16))
        goto LABEL_22;
    }
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_22:
    v43 = (uint64_t)v48;
    v44 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v48, v68, v59);
    __swift_storeEnumTagSinglePayload(v43, 0, 1, v44);
    v45 = v50;
    sub_1C03D774C(v43, v50, &qword_1ED738358);
    v46 = v49;
    swift_beginAccess();
    sub_1C03D75CC(v45, v46);
    swift_endAccess();
  }
}

uint64_t sub_1C03D5684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6[2] = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738348);
  v6[3] = v8;
  v6[4] = *(_QWORD *)(v8 - 8);
  v6[5] = swift_task_alloc();
  v9 = sub_1C03E3AD0();
  v6[6] = v9;
  v6[7] = *(_QWORD *)(v9 - 8);
  v6[8] = swift_task_alloc();
  v10 = swift_task_alloc();
  v6[9] = v10;
  v11 = (_QWORD *)swift_task_alloc();
  v6[10] = v11;
  *v11 = v6;
  v11[1] = sub_1C03D5750;
  return sub_1C03D4534(v10, a5);
}

uint64_t sub_1C03D5750()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D5784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_111_1(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 56) + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  sub_1C03E41A8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = OUTLINED_FUNCTION_124_1();
  v5(v4);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_51_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1C03D5828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  sub_1C03ABAE4(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_connection, &qword_1ED738358);
  v1 = OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_5(v1);
  v2 = OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_5(v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC22SiriSuggestionsSupport10Connection_clock);

  swift_release();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03D58BC()
{
  sub_1C03D5828();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03D58E0(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = swift_task_alloc();
  v5 = (_QWORD *)OUTLINED_FUNCTION_13_2(v4);
  *v5 = v2;
  v5[1] = sub_1C03D5940;
  return v7(a1);
}

uint64_t sub_1C03D5940()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03D5978(uint64_t a1)
{
  uint64_t v2;

  sub_1C03B698C(a1, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  return sub_1C03E40A0();
}

void sub_1C03D59B0()
{
  _QWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_84_1();
  OUTLINED_FUNCTION_85_1();
  if ((v1 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_60_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB88);
    OUTLINED_FUNCTION_70_1();
    OUTLINED_FUNCTION_59_0();
    sub_1C03C3A0C((_OWORD *)(*(_QWORD *)(v1 + 56) + 32 * v3), v2);
    OUTLINED_FUNCTION_113_0();
    *v0 = v1;
    OUTLINED_FUNCTION_32_3();
  }
  else
  {
    *v2 = 0u;
    v2[1] = 0u;
    OUTLINED_FUNCTION_63_1();
  }
}

uint64_t sub_1C03D5A48()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  swift_bridgeObjectRetain();
  sub_1C03B9B8C();
  v3 = v2;
  v5 = v4;
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v11 = *v1;
  *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738398);
  sub_1C03E4310();
  v6 = *(_QWORD *)(v11 + 48);
  v7 = sub_1C03E3CF8();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8];
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6 + *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72) * v3, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v3);
  type metadata accessor for Connection(0);
  sub_1C03A858C(&qword_1ED7383E8, v8, MEMORY[0x1E0DA63B8]);
  sub_1C03E4328();
  *v1 = v11;
  swift_bridgeObjectRelease();
  return v9;
}

void sub_1C03D5B84()
{
  _QWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_37_1();
  OUTLINED_FUNCTION_84_1();
  OUTLINED_FUNCTION_85_1();
  if ((v1 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_60_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB38);
    OUTLINED_FUNCTION_70_1();
    OUTLINED_FUNCTION_59_0();
    sub_1C03B68B0((__int128 *)(*(_QWORD *)(v1 + 56) + 48 * v3), v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    OUTLINED_FUNCTION_113_0();
    *v0 = v1;
    OUTLINED_FUNCTION_32_3();
  }
  else
  {
    v2[1] = 0u;
    v2[2] = 0u;
    *v2 = 0u;
    OUTLINED_FUNCTION_63_1();
  }
}

uint64_t sub_1C03D5C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t isStackAllocationSafe;
  unint64_t *v11;
  uint64_t v12;
  unint64_t *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(a1 + 32);
  v8 = v7 & 0x3F;
  v9 = (unint64_t)((1 << v7) + 63) >> 6;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    v11 = (_QWORD *)((char *)v15 - ((8 * v9 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1C03BA61C(0, v9, v11);
    swift_bridgeObjectRetain();
    v12 = sub_1C03D5DF8(v11, v9, a1, a2, a3);
    if (v3)
      swift_willThrow();
    else
      a2 = v12;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = (unint64_t *)swift_slowAlloc();
    sub_1C03BA61C(0, v9, v13);
    swift_bridgeObjectRetain();
    a2 = sub_1C03D5DF8(v13, v9, a1, a2, a3);
    MEMORY[0x1C3B99F38](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_1C03D5DF8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  char *v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void (*v27)(char *, unint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  char v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  int64_t v54;

  v41 = a2;
  v51 = a5;
  v49 = a4;
  v42 = a1;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738250);
  v6 = MEMORY[0x1E0C80A78](v48);
  v46 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v41 - v8;
  v10 = sub_1C03E3CF8();
  v47 = *(_QWORD **)(v10 - 8);
  result = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = 0;
  v50 = (_QWORD *)a3;
  v15 = *(_QWORD *)(a3 + 64);
  v43 = 0;
  v44 = a3 + 64;
  v16 = 1 << *(_BYTE *)(a3 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v45 = (unint64_t)(v16 + 63) >> 6;
  v20 = v46;
  v19 = v47;
  while (v18)
  {
    v53 = (v18 - 1) & v18;
    v54 = v14;
    v21 = __clz(__rbit64(v18)) | (v14 << 6);
LABEL_20:
    v26 = v50;
    v27 = (void (*)(char *, unint64_t, uint64_t))v19[2];
    v27(v13, v50[6] + v19[9] * v21, v10);
    v28 = v26[7];
    v52 = v21;
    v29 = *(_QWORD *)(v28 + 8 * v21);
    v27(v9, (unint64_t)v13, v10);
    v30 = *(int *)(v48 + 48);
    *(_QWORD *)&v9[v30] = v29;
    v31 = v13;
    v27(v20, (unint64_t)v9, v10);
    *(_QWORD *)&v20[v30] = v29;
    swift_retain_n();
    v32 = sub_1C03E3CE0();
    v33 = (uint64_t)v9;
    v35 = v34;
    v36 = (void (*)(char *, uint64_t))v19[1];
    v36(v20, v10);
    if (v32 == v49 && v35 == v51)
    {
      swift_bridgeObjectRelease();
      sub_1C03ABAE4(v33, &qword_1ED738250);
      swift_release();
      result = ((uint64_t (*)(char *, uint64_t))v36)(v31, v10);
      v9 = (char *)v33;
      v13 = v31;
      v14 = v54;
      v18 = v53;
LABEL_27:
      *(unint64_t *)((char *)v42 + ((v52 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v52;
      if (__OFADD__(v43++, 1))
      {
        __break(1u);
LABEL_30:
        v40 = sub_1C03D61A4(v42, v41, v43, v50);
        swift_bridgeObjectRelease();
        return v40;
      }
    }
    else
    {
      v38 = sub_1C03E43F4();
      swift_bridgeObjectRelease();
      sub_1C03ABAE4(v33, &qword_1ED738250);
      swift_release();
      result = ((uint64_t (*)(char *, uint64_t))v36)(v31, v10);
      v9 = (char *)v33;
      v13 = v31;
      v14 = v54;
      v18 = v53;
      if ((v38 & 1) != 0)
        goto LABEL_27;
    }
  }
  v22 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v22 >= v45)
    goto LABEL_30;
  v23 = *(_QWORD *)(v44 + 8 * v22);
  v24 = v14 + 1;
  if (v23)
    goto LABEL_19;
  v24 = v14 + 2;
  if (v14 + 2 >= v45)
    goto LABEL_30;
  v23 = *(_QWORD *)(v44 + 8 * v24);
  if (v23)
    goto LABEL_19;
  v24 = v14 + 3;
  if (v14 + 3 >= v45)
    goto LABEL_30;
  v23 = *(_QWORD *)(v44 + 8 * v24);
  if (v23)
  {
LABEL_19:
    v53 = (v23 - 1) & v23;
    v54 = v24;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
    goto LABEL_20;
  }
  v25 = v14 + 4;
  if (v14 + 4 >= v45)
    goto LABEL_30;
  v23 = *(_QWORD *)(v44 + 8 * v25);
  if (v23)
  {
    v24 = v14 + 4;
    goto LABEL_19;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v45)
      goto LABEL_30;
    v23 = *(_QWORD *)(v44 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_19;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C03D61A4(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;

  v45 = sub_1C03E3CF8();
  v41 = *(_QWORD *)(v45 - 8);
  v8 = MEMORY[0x1E0C80A78](v45);
  v44 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v40 = (char *)&v36 - v10;
  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDFE0);
  result = sub_1C03E4370();
  v12 = result;
  v37 = a1;
  v38 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *a1;
  v14 = 0;
  v15 = result + 64;
  v39 = a4;
  v16 = v45;
  while (1)
  {
    if (v13)
    {
      v42 = (v13 - 1) & v13;
      v43 = v14;
      v17 = __clz(__rbit64(v13)) | (v14 << 6);
    }
    else
    {
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v18 >= v38)
        return v12;
      v19 = v37[v18];
      v20 = v14 + 1;
      if (!v19)
      {
        v20 = v14 + 2;
        if (v14 + 2 >= v38)
          return v12;
        v19 = v37[v20];
        if (!v19)
        {
          v20 = v14 + 3;
          if (v14 + 3 >= v38)
            return v12;
          v19 = v37[v20];
          if (!v19)
          {
            v21 = v14 + 4;
            if (v14 + 4 >= v38)
              return v12;
            v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                v20 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_41;
                if (v20 >= v38)
                  return v12;
                v19 = v37[v20];
                ++v21;
                if (v19)
                  goto LABEL_24;
              }
            }
            v20 = v14 + 4;
          }
        }
      }
LABEL_24:
      v42 = (v19 - 1) & v19;
      v43 = v20;
      v17 = __clz(__rbit64(v19)) + (v20 << 6);
    }
    v22 = v40;
    v23 = v41;
    v24 = *(_QWORD *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v40, a4[6] + v24 * v17, v16);
    v25 = *(_QWORD *)(a4[7] + 8 * v17);
    v26 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v26(v44, v22, v16);
    sub_1C03A858C(&qword_1ED7383E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA63A8], MEMORY[0x1E0DA63B8]);
    swift_retain();
    result = sub_1C03E4064();
    v27 = -1 << *(_BYTE *)(v12 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6))) == 0)
      break;
    v30 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v15 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v12 + 48) + v30 * v24, v44, v45);
    *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v30) = v25;
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      goto LABEL_39;
    a4 = v39;
    v13 = v42;
    v14 = v43;
    if (!a3)
      return v12;
  }
  v31 = 0;
  v32 = (unint64_t)(63 - v27) >> 6;
  while (++v29 != v32 || (v31 & 1) == 0)
  {
    v33 = v29 == v32;
    if (v29 == v32)
      v29 = 0;
    v31 |= v33;
    v34 = *(_QWORD *)(v15 + 8 * v29);
    if (v34 != -1)
    {
      v30 = __clz(__rbit64(~v34)) + (v29 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C03D64E8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a1 + 32);
  v3 = -1;
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  v7 = -1 << v2;
  if (-v7 < 64)
    v3 = ~(-1 << -(char)v7);
  a2[1] = result;
  a2[2] = ~v7;
  a2[3] = 0;
  a2[4] = v3 & v5;
  a2[5] = 0;
  return result;
}

void sub_1C03D6524(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
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
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  int64_t v33;
  int64_t v34;
  unint64_t v35;
  uint64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;

  v50 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738388);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C03E3CF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738258);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738250);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v1;
  v16 = v1[1];
  v18 = v1[2];
  v17 = v1[3];
  v19 = v17;
  v20 = v1[4];
  v46 = v14;
  v47 = v4;
  v51 = v18;
  if (!v20)
  {
    v33 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_30;
    v34 = (unint64_t)(v18 + 64) >> 6;
    if (v33 < v34)
    {
      v35 = *(_QWORD *)(v16 + 8 * v33);
      if (v35)
      {
        v36 = v5;
LABEL_8:
        v22 = v12;
        v23 = v6;
        v24 = v8;
        v48 = v2;
        v49 = v16;
        v25 = v36;
        v26 = (v35 - 1) & v35;
        v27 = __clz(__rbit64(v35)) + (v33 << 6);
        v19 = v33;
        goto LABEL_3;
      }
      v37 = v17 + 2;
      v19 = v17 + 1;
      if (v17 + 2 < v34)
      {
        v35 = *(_QWORD *)(v16 + 8 * v37);
        if (v35)
        {
LABEL_11:
          v36 = v5;
          v33 = v37;
          goto LABEL_8;
        }
        v19 = v17 + 2;
        if (v17 + 3 < v34)
        {
          v35 = *(_QWORD *)(v16 + 8 * (v17 + 3));
          if (v35)
          {
            v36 = v5;
            v33 = v17 + 3;
            goto LABEL_8;
          }
          v37 = v17 + 4;
          v19 = v17 + 3;
          if (v17 + 4 < v34)
          {
            v35 = *(_QWORD *)(v16 + 8 * v37);
            if (v35)
              goto LABEL_11;
            v33 = v17 + 5;
            v19 = v17 + 4;
            if (v17 + 5 < v34)
            {
              v36 = v5;
              v35 = *(_QWORD *)(v16 + 8 * v33);
              if (v35)
                goto LABEL_8;
              v19 = v34 - 1;
              v38 = v17 + 6;
              while (v38 < v34)
              {
                v35 = *(_QWORD *)(v16 + 8 * v38++);
                if (v35)
                {
                  v33 = v38 - 1;
                  goto LABEL_8;
                }
              }
            }
          }
        }
      }
    }
    v28 = v15;
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
    v26 = 0;
    goto LABEL_24;
  }
  v21 = v5;
  v22 = v12;
  v23 = v6;
  v24 = v8;
  v48 = v2;
  v49 = v16;
  v25 = v21;
  v26 = (v20 - 1) & v20;
  v27 = __clz(__rbit64(v20)) | (v17 << 6);
LABEL_3:
  v28 = v15;
  (*(void (**)(char *, unint64_t, uint64_t))(v23 + 16))(v24, *(_QWORD *)(v15 + 48) + *(_QWORD *)(v23 + 72) * v27, v25);
  v29 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v27);
  v30 = v22;
  v31 = *(int *)(v22 + 48);
  v32 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  v12 = v30;
  v32(v11, v24, v25);
  *(_QWORD *)&v11[v31] = v29;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v12);
  swift_retain();
  v2 = v48;
  v16 = v49;
LABEL_24:
  *v1 = v28;
  v1[1] = v16;
  v1[2] = v51;
  v1[3] = v19;
  v1[4] = v26;
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_1C03ABAE4((uint64_t)v11, &qword_1ED738258);
    v39 = (uint64_t)v50;
    v40 = 1;
LABEL_28:
    __swift_storeEnumTagSinglePayload(v39, v40, 1, v2);
    return;
  }
  v41 = (uint64_t)v46;
  sub_1C03D774C((uint64_t)v11, (uint64_t)v46, &qword_1ED738250);
  v42 = (uint64_t)&v47[*(int *)(v2 + 48)];
  v43 = v1[5];
  sub_1C03D774C(v41, v42, &qword_1ED738250);
  if (!__OFADD__(v43, 1))
  {
    v1[5] = v43 + 1;
    v44 = v50;
    v45 = (uint64_t)v50 + *(int *)(v2 + 48);
    *v50 = v43;
    sub_1C03D774C(v42, v45, &qword_1ED738250);
    v39 = (uint64_t)v44;
    v40 = 0;
    goto LABEL_28;
  }
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_1C03D68E0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;

  v2[8] = a2;
  sub_1C03E3AD0();
  v2[9] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738348);
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  v2[13] = v5;
  v2[14] = *(_QWORD *)(v5 - 8);
  v2[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v6 = sub_1C03E3CF8();
  v2[18] = v6;
  v2[19] = *(_QWORD *)(v6 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v7 = sub_1C03E3E24();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6D30];
  v2[5] = v7;
  sub_1C03A858C(&qword_1ED738288, v8, MEMORY[0x1E0DA6D28]);
  v2[6] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1, v7);
  return swift_task_switch();
}

#error "1C03D6B48: call analysis failed (funcsize=122)"

uint64_t sub_1C03D6C74()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D6CB0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_39_1();
  v1 = *(void (**)(uint64_t))(v0 + 176);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  sub_1C03E41A8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  OUTLINED_FUNCTION_16_4();
  v5 = OUTLINED_FUNCTION_127_1();
  v1(v5);
  sub_1C03ABAE4(*(_QWORD *)(v0 + 136), &qword_1ED738358);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03D6D74(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03D32AC(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1C03D6D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;

  v4[8] = a2;
  sub_1C03E3AD0();
  v4[9] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738348);
  v4[10] = v8;
  v4[11] = *(_QWORD *)(v8 - 8);
  v4[12] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  v4[13] = v9;
  v4[14] = *(_QWORD *)(v9 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v10 = sub_1C03E3CF8();
  v4[18] = v10;
  v4[19] = *(_QWORD *)(v10 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v4[5] = a3;
  v4[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v4 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  return swift_task_switch();
}

#error "1C03D6FCC: call analysis failed (funcsize=122)"

uint64_t sub_1C03D70F8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D7134()
{
  return type metadata accessor for EventDrivenSuggestionsClient(0);
}

uint64_t type metadata accessor for EventDrivenSuggestionsClient(uint64_t a1)
{
  return sub_1C03AB790(a1, (uint64_t *)&unk_1ED737E10);
}

uint64_t sub_1C03D7150()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C03E3818();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for EventDrivenSuggestionsClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.disconnect(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_103_0(v1, (uint64_t)sub_1C03AF788);
  return OUTLINED_FUNCTION_45_0(v2, v3);
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.getSuggestionsForApp(for:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = OUTLINED_FUNCTION_2_1();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AE3D8;
  OUTLINED_FUNCTION_120_1();
  return v4();
}

uint64_t dispatch thunk of EventDrivenSuggestionsClient.submit(event:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_32();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_103_0(v1, (uint64_t)sub_1C03AF788);
  return OUTLINED_FUNCTION_45_0(v2, v3);
}

uint64_t sub_1C03D72E0()
{
  return type metadata accessor for Connection(0);
}

void sub_1C03D72E8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1C03D73BC();
  if (v0 <= 0x3F)
  {
    sub_1C03E3818();
    if (v1 <= 0x3F)
    {
      sub_1C03E3CF8();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_1C03D73BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED738360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED737E20);
    v0 = sub_1C03E422C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED738360);
  }
}

void sub_1C03D7414()
{
  uint64_t v0;

  sub_1C03D4FF4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1C03D742C()
{
  sub_1C03B89AC();
}

uint64_t sub_1C03D7440()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20);
  OUTLINED_FUNCTION_89_0();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  OUTLINED_FUNCTION_86_0();
  return OUTLINED_FUNCTION_35_2();
}

uint64_t sub_1C03D74A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E20) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)(v1 + 5);
  v9 = (uint64_t)v1 + ((v4 + 80) & ~v4);
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_13_2(v10);
  *v11 = v2;
  v11[1] = sub_1C03AF788;
  return sub_1C03D5684(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_1C03D753C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03D7560(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(int **)(v1 + 16);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_13_2(v5);
  *v6 = v2;
  v6[1] = sub_1C03AE3D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF5FDFC0 + dword_1EF5FDFC0))(a1, v4);
}

uint64_t sub_1C03D75CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03D7614(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreFetchedSuggestionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03D7658()
{
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_89_0();
  swift_release();
  OUTLINED_FUNCTION_86_0();
  return OUTLINED_FUNCTION_35_2();
}

uint64_t sub_1C03D76A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_17_3() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = v0 + ((v2 + 24) & ~v2);
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_13_2(v5);
  *v6 = v1;
  v6[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_120_1();
  return sub_1C03D1F70(v7, v8, v3, v4);
}

void sub_1C03D771C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_113(a1, a2, a3);
  OUTLINED_FUNCTION_128(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  OUTLINED_FUNCTION_7();
}

void sub_1C03D774C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_113(a1, a2, a3);
  OUTLINED_FUNCTION_92_0();
  OUTLINED_FUNCTION_128(v3, v4);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1C03D7774()
{
  uint64_t v0;

  return sub_1C03D411C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint8_t **)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1C03D7790()
{
  return sub_1C03D7774();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return sub_1C03E3CF8();
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

BOOL OUTLINED_FUNCTION_22_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23_3(uint64_t a1, uint64_t a2)
{
  return sub_1C03D4534(a1, a2);
}

uint64_t OUTLINED_FUNCTION_26_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_1C03E43E8();
}

void OUTLINED_FUNCTION_31_2()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1C03ABAE4(*(_QWORD *)(v1 + 136), v0);
}

uint64_t OUTLINED_FUNCTION_32_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_38_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_42_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  return a13(v14, v13, v15);
}

uint64_t OUTLINED_FUNCTION_45_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_48_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_49_2()
{
  return sub_1C03E41D8();
}

uint64_t OUTLINED_FUNCTION_51_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  *a11 = a1;
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[14] + 32))(v0[15], v0[16], v0[13]);
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[19] + 8))(v0[21], v0[18]);
}

uint64_t OUTLINED_FUNCTION_55_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(v2, v3 + v1);
}

void OUTLINED_FUNCTION_57_0(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03ABAE4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_60_0()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

BOOL OUTLINED_FUNCTION_62_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_65_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v1;
  a1[5] = v2;
  return sub_1C03E3AD0();
}

uint64_t OUTLINED_FUNCTION_66_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v13, a13);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_69_1()
{
  return sub_1C03E3818();
}

uint64_t OUTLINED_FUNCTION_70_1()
{
  return sub_1C03E4310();
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return sub_1C03E41E4();
}

void OUTLINED_FUNCTION_76_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_82_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_83_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

unint64_t OUTLINED_FUNCTION_84_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C03B9B28(v1, v0);
}

uint64_t OUTLINED_FUNCTION_85_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t OUTLINED_FUNCTION_88_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 104))(v2, a2, v4);
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_94_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t))
{
  uint64_t v12;

  return a12(v12, a10);
}

uint64_t OUTLINED_FUNCTION_95_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_99_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 4) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_100_1(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_1C03B934C(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_101_1()
{
  return sub_1C03E43E8();
}

uint64_t OUTLINED_FUNCTION_102_1()
{
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_103_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_104_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_106_1()
{
  return sub_1C03E4010();
}

id OUTLINED_FUNCTION_107_1(void (*a1)(id))
{
  return sub_1C03D44C4(a1);
}

uint64_t OUTLINED_FUNCTION_108_1()
{
  return sub_1C03E4238();
}

_QWORD *OUTLINED_FUNCTION_110_0(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_111_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_112_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_1C03D771C(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_113_0()
{
  return sub_1C03E4328();
}

uint64_t OUTLINED_FUNCTION_114_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_1C03B934C(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_115_1(float a1)
{
  float *v1;

  *v1 = a1;
}

void OUTLINED_FUNCTION_117_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1C03D774C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_121_1()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_122_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_123_1()
{
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_124_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_125_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_126()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_127_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_128_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

_QWORD *sub_1C03D7D78(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a1;
  sub_1C03ABB70(a2, (uint64_t)(v5 + 3));
  v5[8] = a3;
  v5[9] = a4;
  v5[10] = a5;
  return v5;
}

void sub_1C03D7DC4()
{
  _QWORD *v0;
  uint64_t v1;
  os_log_type_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_10_3();
  v3 = v0;
  v26 = v5;
  v27 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_51_3();
  if (qword_1ED738B38 != -1)
    swift_once();
  v16 = OUTLINED_FUNCTION_29();
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_11_2();
  sub_1C03E4010();
  v18 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_10_4(v18))
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_16();
    v28 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v19 = 136315138;
    OUTLINED_FUNCTION_150();
    v20 = sub_1C03B934C(v13, v11, &v28);
    OUTLINED_FUNCTION_119_0(v20);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v17, v2, "executing SiriSuggestionsXPCService suggestNext on request: %s", v19);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_14_2();
  v21 = v3[2];
  v22 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1(v1, v23, v24, v22);
  v25 = (_QWORD *)OUTLINED_FUNCTION_36();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = v13;
  v25[5] = v11;
  v25[6] = v9;
  v25[7] = v7;
  v25[8] = v21;
  v25[9] = v27;
  v25[10] = v26;
  v25[11] = v14;
  OUTLINED_FUNCTION_150();
  sub_1C03C5F08(v9, v7);
  OUTLINED_FUNCTION_48_4();
  swift_retain();
  sub_1C03DED74(v1, (uint64_t)&unk_1EF5FE0B0, (uint64_t)v25);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03D7FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 88) = v13;
  *(_OWORD *)(v8 + 72) = v12;
  *(_QWORD *)(v8 + 56) = a7;
  *(_QWORD *)(v8 + 64) = a8;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 32) = a4;
  v9 = sub_1C03E3AD0();
  *(_QWORD *)(v8 + 96) = v9;
  *(_QWORD *)(v8 + 104) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 112) = swift_task_alloc();
  v10 = sub_1C03E4004();
  *(_QWORD *)(v8 + 120) = v10;
  *(_QWORD *)(v8 + 128) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03D806C()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  _QWORD *v3;

  v1 = (void *)sub_1C03E3F44();
  sub_1C03E3F2C();

  sub_1C03E3B6C();
  v2 = (void *)sub_1C03E3F44();
  sub_1C03E3F50();

  v3 = (_QWORD *)swift_task_alloc();
  v0[18] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_1C03D8124;
  return sub_1C03D8560(v0[4], v0[5], v0[6], v0[7], v0[8]);
}

uint64_t sub_1C03D8124()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v3);
  v0[19] = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_11();
    return OUTLINED_FUNCTION_4_10();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc();
    v0[20] = (uint64_t)v5;
    *v5 = v2;
    v5[1] = sub_1C03D81A8;
    return StatefulSuggestionsClient.suggestNext(requestId:)(v0[14], v0[4], v0[5]);
  }
}

uint64_t sub_1C03D81A8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03D81DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(_QWORD, unint64_t, uint64_t);
  uint64_t (*v40)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_28_2();
  a21 = v24;
  a22 = v25;
  a20 = v22;
  v26 = v22[19];
  sub_1C03E2F60();
  OUTLINED_FUNCTION_19();
  sub_1C03E2F54();
  sub_1C03E2F3C();
  sub_1C03A858C(&qword_1ED738230, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57B8]);
  OUTLINED_FUNCTION_105();
  sub_1C03E2F48();
  v29 = v22[13];
  v28 = v22[14];
  if (v26)
  {
    OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
    OUTLINED_FUNCTION_77();
    if (qword_1ED738B38 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_29();
    v31 = __swift_project_value_buffer(v30, (uint64_t)qword_1ED738B20);
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_121();
    sub_1C03E4010();
    v32 = OUTLINED_FUNCTION_55_0();
    if (OUTLINED_FUNCTION_17(v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_16();
      a10 = OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_115_2(4.8149e-34);
      v22[2] = v26;
      OUTLINED_FUNCTION_121();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
      v34 = OUTLINED_FUNCTION_166();
      v36 = sub_1C03B934C(v34, v35, &a10);
      OUTLINED_FUNCTION_34_3(v36);
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v31, (os_log_type_t)v28, "could not suggest next turn info because of: %s", v33);
      OUTLINED_FUNCTION_28_3();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_32_1();

    v39 = (void (*)(_QWORD, unint64_t, uint64_t))v22[9];
    OUTLINED_FUNCTION_121();
    v39(0, 0xC000000000000000, v26);
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_32_1();
  }
  else
  {
    v23 = v27;
    ((void (*)(void))v22[9])();
    v37 = OUTLINED_FUNCTION_112_2();
    sub_1C03B57E8(v37, v38);
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
  }
  OUTLINED_FUNCTION_146_0();
  OUTLINED_FUNCTION_108_2();
  OUTLINED_FUNCTION_49_3();

  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_25_2();
  return v40(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12, a13, a14);
}

#error "1C03D849C: call analysis failed (funcsize=83)"

uint64_t sub_1C03D8560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8E0);
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FE048);
  v6[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03D8630()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
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
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;

  v1 = sub_1C03DACEC();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v46 = v0[8];
    v53 = MEMORY[0x1E0DEE9D8];
    sub_1C03CDEAC();
    result = sub_1C03DE1E4(v1);
    if ((result & 0x8000000000000000) == 0)
    {
      v5 = result;
      if (result < 1 << *(_BYTE *)(v1 + 32))
      {
        v6 = v1 + 64;
        v42 = v0[14];
        v43 = v0[15];
        v40 = v0[12];
        v41 = v0[13];
        v38 = v0[9];
        v39 = v0[11];
        v44 = v1;
        v45 = v0;
        v37 = v1 + 64;
        while ((*(_QWORD *)(v6 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
        {
          if (v4 != *(_DWORD *)(v1 + 36))
            goto LABEL_22;
          v47 = v2;
          v48 = v4;
          v7 = (_QWORD *)v0[14];
          v50 = (_QWORD *)v0[15];
          v8 = (char *)v7 + *(int *)(v46 + 48);
          v9 = (_QWORD *)v0[13];
          v52 = (uint64_t *)v0[12];
          v49 = (uint64_t *)v0[11];
          v51 = v0[10];
          v10 = *(_QWORD *)(v1 + 56);
          v11 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v5);
          v12 = *v11;
          v13 = v11[1];
          v14 = sub_1C03E3D1C();
          v15 = *(_QWORD *)(v14 - 8);
          (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v8, v10 + *(_QWORD *)(v15 + 72) * v5, v14);
          *v7 = v12;
          *(_QWORD *)(v42 + 8) = v13;
          *v9 = v12;
          *(_QWORD *)(v41 + 8) = v13;
          OUTLINED_FUNCTION_80_2((uint64_t)v9 + *(int *)(v46 + 48));
          sub_1C03DE264((uint64_t)v9, (uint64_t)v52);
          OUTLINED_FUNCTION_11_2();
          sub_1C03B579C((uint64_t)v7, &qword_1EF5FD8E0);
          v16 = *(int *)(v46 + 48);
          v17 = (uint64_t)v50 + v16;
          v18 = (char *)v49 + v16;
          v19 = *v52;
          v20 = *(_QWORD *)(v40 + 8);
          *v49 = *v52;
          *(_QWORD *)(v39 + 8) = v20;
          OUTLINED_FUNCTION_80_2((uint64_t)v49 + v16);
          *v50 = v19;
          *(_QWORD *)(v43 + 8) = v20;
          v21 = v51 + *(int *)(v46 + 48);
          OUTLINED_FUNCTION_80_2(v21);
          OUTLINED_FUNCTION_92_1(v17, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
          v22 = *(void (**)(char *, uint64_t))(v15 + 8);
          OUTLINED_FUNCTION_96();
          v22(v18, v14);
          sub_1C03B579C((uint64_t)v52, &qword_1EF5FD8E0);
          v23 = v53;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1C03CDEAC();
            v23 = v53;
          }
          v24 = *(_QWORD *)(v23 + 16);
          v0 = v45;
          if (v24 >= *(_QWORD *)(v23 + 24) >> 1)
          {
            sub_1C03CDEAC();
            v23 = v53;
          }
          v25 = v45[15];
          *(_QWORD *)(v23 + 16) = v24 + 1;
          result = sub_1C03DE264(v25, v23+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(_QWORD *)(v38 + 72) * v24);
          v1 = v44;
          if ((uint64_t)v5 >= -(-1 << *(_BYTE *)(v44 + 32)))
            goto LABEL_23;
          v6 = v37;
          if ((*(_QWORD *)(v37 + 8 * (v5 >> 6)) & (1 << v5)) == 0)
            goto LABEL_24;
          if (v48 != *(_DWORD *)(v44 + 36))
            goto LABEL_26;
          OUTLINED_FUNCTION_157_0();
          result = sub_1C03E4280();
          v2 = v47 - 1;
          if (v47 == 1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_20;
          }
          v5 = result;
          if ((result & 0x8000000000000000) == 0)
          {
            v4 = *(_DWORD *)(v44 + 36);
            if (result < 1 << *(_BYTE *)(v44 + 32))
              continue;
          }
          goto LABEL_25;
        }
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
    }
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v23 = MEMORY[0x1E0DEE9D8];
LABEL_20:
    v0[17] = v23;
    v26 = v0[16];
    v27 = v0[6];
    v28 = v0;
    v31 = v0 + 2;
    v29 = v0[2];
    v30 = v31[1];
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FE050);
    OUTLINED_FUNCTION_53_1(v26, v33, v34, v32);
    v35 = (_QWORD *)OUTLINED_FUNCTION_36();
    v28[18] = v35;
    v35[2] = v27;
    v35[3] = v29;
    v35[4] = v30;
    swift_retain();
    OUTLINED_FUNCTION_104();
    v36 = (_QWORD *)swift_task_alloc();
    v28[19] = v36;
    *v36 = v28;
    v36[1] = sub_1C03D8AA8;
    return sub_1C03E3C8C();
  }
  return result;
}

uint64_t sub_1C03D8AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_6_2();
  v2 = *(_QWORD *)(v1 + 128);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_10();
  sub_1C03B579C(v2, &qword_1EF5FE048);
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_85_0();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03D8B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = (void *)sub_1C03E2FD8();
  if (a3)
    v7 = sub_1C03E2F6C();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);

}

void sub_1C03D8BC8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
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
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  OUTLINED_FUNCTION_10_3();
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_51_3();
  if (qword_1ED738B38 != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_29();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_11_2();
  sub_1C03E4010();
  v19 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_10_4(v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();
    *(_DWORD *)v20 = 136315138;
    OUTLINED_FUNCTION_150();
    v21 = OUTLINED_FUNCTION_157_0();
    v24 = sub_1C03B934C(v21, v22, v23);
    OUTLINED_FUNCTION_119_0(v24);
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v18, v2, "Executing SiriSuggestionsXPCService logIntent on request: %s", v20);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }

  OUTLINED_FUNCTION_14_2();
  v25 = *(_QWORD *)(v3 + 16);
  v26 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1(v1, v27, v28, v26);
  v29 = (_QWORD *)OUTLINED_FUNCTION_36();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = v11;
  v29[5] = v9;
  v29[6] = v25;
  v29[7] = v15;
  v29[8] = v13;
  v29[9] = v7;
  v29[10] = v5;
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_48_4();
  swift_retain();
  sub_1C03D9280(v1, (uint64_t)&unk_1EF5FE0A0, (uint64_t)v29);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03D8DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v8[21] = v12;
  v8[22] = v13;
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  v9 = sub_1C03E4004();
  v8[23] = v9;
  v8[24] = *(_QWORD *)(v9 - 8);
  v8[25] = swift_task_alloc();
  v10 = sub_1C03E3D1C();
  v8[26] = v10;
  v8[27] = *(_QWORD *)(v10 - 8);
  v8[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03D8E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  _QWORD *v11;
  __int128 v12;

  v1 = *(_QWORD *)(v0 + 208);
  OUTLINED_FUNCTION_142_0();
  OUTLINED_FUNCTION_19();
  *(_QWORD *)(v0 + 232) = OUTLINED_FUNCTION_137_0();
  sub_1C03A858C(&qword_1ED738270, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6638], MEMORY[0x1E0DA6650]);
  OUTLINED_FUNCTION_157_0();
  OUTLINED_FUNCTION_133_0();
  if (v1)
  {
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_60();
    return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 216);
    v3 = *(_QWORD *)(v0 + 224);
    sub_1C03E3D10();
    OUTLINED_FUNCTION_47(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v5 = (void *)sub_1C03E3F44();
    sub_1C03E3F2C();

    sub_1C03E3B6C();
    v6 = (void *)sub_1C03E3F44();
    sub_1C03E3F50();

    v7 = *(_QWORD *)(v0 + 56);
    v12 = *(_OWORD *)(v0 + 40);
    v8 = *(_QWORD *)(v0 + 40);
    v9 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v8);
    *(_OWORD *)(v0 + 88) = v12;
    *(_QWORD *)(v0 + 104) = v7;
    v10 = OUTLINED_FUNCTION_130_1();
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v10, v9, v8);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v11;
    *v11 = v0;
    v11[1] = sub_1C03D9010;
    return StatefulSuggestionsClient.logEngagement(for:intent:)(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160), v0 + 64);
  }
}

uint64_t sub_1C03D9010()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v2);
  *(_QWORD *)(v0 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03D9064()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v1 + 168));
  OUTLINED_FUNCTION_102_2();
  OUTLINED_FUNCTION_110_1();
  OUTLINED_FUNCTION_52_3();

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1C03D90D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  os_log_type_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  BOOL v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  uint64_t (*v38)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_28_2();
  a21 = v25;
  a22 = v26;
  a20 = v23;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v23 + 8));
  if (qword_1ED738B38 != -1)
    swift_once();
  v27 = v23[31];
  v28 = OUTLINED_FUNCTION_29();
  v29 = __swift_project_value_buffer(v28, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_130();
  v30 = OUTLINED_FUNCTION_55_0();
  v31 = OUTLINED_FUNCTION_23_1(v30);
  v32 = v23[31];
  if (v31)
  {
    v33 = (uint8_t *)OUTLINED_FUNCTION_16();
    a11 = OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_115_2(4.8149e-34);
    v23[14] = v32;
    OUTLINED_FUNCTION_127_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v34 = OUTLINED_FUNCTION_166();
    v23[15] = sub_1C03B934C(v34, v35, &a11);
    OUTLINED_FUNCTION_46_2();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v27, v22, "Could not logIntent info because of: %s", v33);
    OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_27_3();

  v36 = v23[31];
  v37 = (void (*)(uint64_t))v23[21];
  OUTLINED_FUNCTION_121();
  v37(v36);
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_102_2();
  OUTLINED_FUNCTION_110_1();
  OUTLINED_FUNCTION_52_3();

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v23 + 2));
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_25_2();
  return v38(v38, v39, v40, v41, v42, v43, v44, v45, a9, v23 + 2, a11, a12, a13, a14);
}

uint64_t sub_1C03D9280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1C03E4190();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1C03B579C(a1, &qword_1ED738340);
  }
  else
  {
    sub_1C03E4184();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C03E4160();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_1C03D93C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(void))
{
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
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
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  __int128 v61[2];
  uint64_t v62;
  _BYTE v63[40];

  OUTLINED_FUNCTION_10_3();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v60 = v37;
  v38 = *v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_38();
  v42 = v41 - v40;
  sub_1C03AE6B0((uint64_t)(v22 + 3), (uint64_t)v63);
  if ((sub_1C03D0930(v36, v34, v22[8], v22[9]) & 1) != 0)
  {
    v43 = OUTLINED_FUNCTION_50_1();
    OUTLINED_FUNCTION_53_1(v42, v44, v45, v43);
    sub_1C03AE6B0((uint64_t)v63, (uint64_t)v61);
    v46 = (_QWORD *)OUTLINED_FUNCTION_36();
    v47 = v36;
    v48 = v38;
    v49 = (uint64_t)v46;
    v46[2] = 0;
    v46[3] = 0;
    v46[4] = v30;
    v46[5] = v28;
    v46[6] = v26;
    v46[7] = v24;
    v46[8] = v47;
    v46[9] = v34;
    v46[10] = v60;
    v46[11] = v32;
    sub_1C03ABB70(v61, (uint64_t)(v46 + 12));
    *(_QWORD *)(v49 + 136) = a21;
    *(_QWORD *)(v49 + 144) = v48;
    sub_1C03C5F08(v30, v28);
    sub_1C03DE65C(v26, v24);
    OUTLINED_FUNCTION_104();
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_6_5();
    sub_1C03DED74(v42, (uint64_t)&unk_1EF5FE090, v49);
    swift_release();
    if (qword_1ED738B38 != -1)
      swift_once();
    v50 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v50, (uint64_t)qword_1ED738B20);
    v51 = OUTLINED_FUNCTION_21_2();
    v52 = sub_1C03E41F0();
    if (os_log_type_enabled(v51, v52))
    {
      *(_WORD *)OUTLINED_FUNCTION_16() = 0;
      OUTLINED_FUNCTION_78_2(&dword_1C03A5000, v51, v52, "Finished in app request setup. Events will flow when ready through the bridge");
      OUTLINED_FUNCTION_5_0();
    }

    ((void (*)(_QWORD))a22)(0);
  }
  else
  {
    if (qword_1ED738B38 != -1)
      swift_once();
    v53 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v53, (uint64_t)qword_1ED738B20);
    OUTLINED_FUNCTION_11_2();
    sub_1C03E4010();
    v54 = OUTLINED_FUNCTION_107_2();
    if (os_log_type_enabled(v32, v54))
    {
      v55 = OUTLINED_FUNCTION_16();
      *(_QWORD *)&v61[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v55 = 136315394;
      OUTLINED_FUNCTION_6_5();
      v62 = OUTLINED_FUNCTION_10_1(v36, v56, (uint64_t *)v61);
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_16_1();
      *(_WORD *)(v55 + 12) = 2080;
      sub_1C03E3710();
      v57 = sub_1C03E36F8();
      v62 = sub_1C03B934C(v57, v58, (uint64_t *)v61);
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v32, v54, "Unauthorised access to query %s suggestions. Check entitlement of %s is set correctly", (uint8_t *)v55);
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_5_0();
    }

    OUTLINED_FUNCTION_14_2();
    sub_1C03DDE18();
    OUTLINED_FUNCTION_159();
    *v59 = 0;
    v59[1] = 0;
    a22();
    OUTLINED_FUNCTION_23();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03D9734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v8 + 272) = v18;
  *(_QWORD *)(v8 + 280) = v19;
  *(_OWORD *)(v8 + 240) = v16;
  *(_OWORD *)(v8 + 256) = v17;
  *(_QWORD *)(v8 + 224) = a7;
  *(_QWORD *)(v8 + 232) = a8;
  *(_QWORD *)(v8 + 208) = a5;
  *(_QWORD *)(v8 + 216) = a6;
  *(_QWORD *)(v8 + 200) = a4;
  v9 = sub_1C03E3AD0();
  *(_QWORD *)(v8 + 288) = v9;
  *(_QWORD *)(v8 + 296) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737E08);
  *(_QWORD *)(v8 + 312) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738368);
  *(_QWORD *)(v8 + 320) = v10;
  *(_QWORD *)(v8 + 328) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 336) = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738370);
  *(_QWORD *)(v8 + 344) = v11;
  *(_QWORD *)(v8 + 352) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 360) = swift_task_alloc();
  sub_1C03E3CF8();
  *(_QWORD *)(v8 + 368) = swift_task_alloc();
  v12 = sub_1C03E3C14();
  *(_QWORD *)(v8 + 376) = v12;
  *(_QWORD *)(v8 + 384) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 392) = swift_task_alloc();
  v13 = sub_1C03E4028();
  *(_QWORD *)(v8 + 400) = v13;
  *(_QWORD *)(v8 + 408) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 416) = swift_task_alloc();
  *(_QWORD *)(v8 + 424) = swift_task_alloc();
  *(_QWORD *)(v8 + 432) = swift_task_alloc();
  v14 = sub_1C03E3D1C();
  *(_QWORD *)(v8 + 440) = v14;
  *(_QWORD *)(v8 + 448) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7382A0);
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  *(_QWORD *)(v8 + 488) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03D9920()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41[2];

  v1 = sub_1C03DACEC();
  v2 = v0[61];
  v3 = v0[28];
  v4 = sub_1C03DDF74(v1);
  v0[62] = v4;
  OUTLINED_FUNCTION_10();
  sub_1C03E3F20();
  OUTLINED_FUNCTION_126_0(v2, 1);
  v40 = v4;
  if (v3 >> 60 != 15)
  {
    sub_1C03C5F08(v0[27], v0[28]);
    sub_1C03DADA4();
    v5 = v0[61];
    v6 = v0[60];
    v7 = v0[56];
    v8 = v0[57];
    v9 = v0[55];
    sub_1C03E3D10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738378);
    v10 = OUTLINED_FUNCTION_47_1();
    OUTLINED_FUNCTION_126_0(v6, v10 ^ 1u);
    sub_1C03DE670(v6, v5);
    if (qword_1ED738B38 != -1)
      swift_once();
    __swift_project_value_buffer(v0[50], (uint64_t)qword_1ED738B20);
    v11 = OUTLINED_FUNCTION_21_2();
    v12 = sub_1C03E41E4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_16();
      v41[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v13 = 136315138;
      OUTLINED_FUNCTION_15_2();
      v14 = sub_1C03E4220();
      v0[24] = sub_1C03B934C(v14, v15, v41);
      sub_1C03E4238();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v11, v12, "Decoded intentToSuggest: %s", v13);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    sub_1C03B57D4(v0[27], v0[28]);

  }
  if (qword_1ED738B38 != -1)
    swift_once();
  v16 = v0[54];
  v18 = v0[50];
  v17 = v0[51];
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1ED738B20);
  v0[63] = v19;
  v20 = *(void (**)(NSObject *, uint64_t, uint64_t))(v17 + 16);
  v0[64] = v20;
  v20(v16, v19, v18);
  OUTLINED_FUNCTION_11_2();
  swift_retain_n();
  OUTLINED_FUNCTION_11_2();
  sub_1C03E4010();
  v21 = OUTLINED_FUNCTION_46();
  v22 = os_log_type_enabled(v16, v21);
  v23 = v0[54];
  v25 = v0[50];
  v24 = v0[51];
  if (v22)
  {
    v27 = v0[29];
    v26 = v0[30];
    v28 = OUTLINED_FUNCTION_16();
    v41[0] = OUTLINED_FUNCTION_16();
    *(_DWORD *)v28 = 136315650;
    OUTLINED_FUNCTION_13_3();
    v0[19] = sub_1C03B934C(v27, v26, v41);
    OUTLINED_FUNCTION_112_2();
    sub_1C03E4238();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v28 + 12) = 2080;
    v29 = OUTLINED_FUNCTION_6_5();
    v0[20] = OUTLINED_FUNCTION_129_1(v29, v30, v41);
    sub_1C03E4238();
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_14_2();
    *(_WORD *)(v28 + 22) = 2080;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738378);
    v31 = sub_1C03E4040();
    v33 = v32;
    swift_release();
    v0[21] = sub_1C03B934C(v31, v33, v41);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_15_1();
    _os_log_impl(&dword_1C03A5000, v16, v21, "XPC Stream for appBundleId: %s, placementId: %s, entities: %s opened.", (uint8_t *)v28, 0x20u);
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_15_1();

  v34 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v34(v23, v25);
  v0[65] = v34;
  v35 = v0[61];
  v36 = (_QWORD *)v0[33];
  OUTLINED_FUNCTION_6_5();
  swift_bridgeObjectRetain();
  sub_1C03E3CD4();
  sub_1C03BB6F8(v40);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_143_0(v35, v37, &qword_1ED7382A0);
  sub_1C03E3BCC();
  __swift_project_boxed_opaque_existential_1(v36, v36[3]);
  v38 = (_QWORD *)swift_task_alloc();
  v0[66] = v38;
  *v38 = v0;
  v38[1] = sub_1C03DA0E4;
  return sub_1C03E3518();
}

uint64_t sub_1C03DA0E4()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DA118()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1C03E41C0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 536) = v1;
  OUTLINED_FUNCTION_68_1(v1);
  return sub_1C03E41CC();
}

uint64_t sub_1C03DA170()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_120_2(v2);
  if (v1)
  {
    swift_release();
  }
  else
  {
    v0[69] = v0[65];
    v0[68] = 0;
  }
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03DA1C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void (*v10)(uint64_t);
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59[2];

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 288);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 504);
    v4 = *(_QWORD *)(v0 + 512);
    v5 = *(NSObject **)(v0 + 424);
    v6 = *(_QWORD *)(v0 + 400);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 328) + 8))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 320));
    ((void (*)(NSObject *, uint64_t, uint64_t))v4)(v5, v3, v6);
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_48_4();
    v7 = v5;
    sub_1C03E4010();
    v8 = OUTLINED_FUNCTION_46();
    v9 = OUTLINED_FUNCTION_90_0(v8);
    v10 = *(void (**)(uint64_t))(v0 + 520);
    if (v9)
    {
      v11 = *(_QWORD *)(v0 + 240);
      v12 = *(_QWORD *)(v0 + 232);
      type = v4;
      v13 = OUTLINED_FUNCTION_16();
      v59[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v13 = 136315650;
      OUTLINED_FUNCTION_96();
      *(_QWORD *)(v0 + 120) = sub_1C03B934C(v12, v11, v59);
      sub_1C03E4238();
      OUTLINED_FUNCTION_16_1();
      *(_WORD *)(v13 + 12) = 2080;
      OUTLINED_FUNCTION_13_3();
      v14 = OUTLINED_FUNCTION_105();
      *(_QWORD *)(v0 + 128) = sub_1C03B934C(v14, v15, v16);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_14_2();
      *(_WORD *)(v13 + 22) = 2080;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738378);
      v17 = sub_1C03E4040();
      v19 = v18;
      OUTLINED_FUNCTION_113_1();
      *(_QWORD *)(v0 + 136) = sub_1C03B934C(v17, v19, v59);
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_106();
      OUTLINED_FUNCTION_15_1();
      _os_log_impl(&dword_1C03A5000, v7, type, "XPC Stream for appBundleId: %s, placementId: %s, entities: %s closed.", (uint8_t *)v13, 0x20u);
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_15_1();

    OUTLINED_FUNCTION_14_2();
    v34 = OUTLINED_FUNCTION_105();
    v10(v34);
    OUTLINED_FUNCTION_145_0();
    objc_msgSend(*(id *)(v0 + 272), sel_finalise);
    OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    v35 = OUTLINED_FUNCTION_105_1();
    OUTLINED_FUNCTION_154_0(v35, &qword_1ED7382A0);
    goto LABEL_13;
  }
  v20 = *(_QWORD *)(v0 + 544);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0 + 296) + 32))(*(_QWORD *)(v0 + 304), v1, v2);
  sub_1C03E2F60();
  OUTLINED_FUNCTION_19();
  sub_1C03E2F54();
  sub_1C03E2F3C();
  sub_1C03A858C(&qword_1ED738230, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA57A8], MEMORY[0x1E0DA57B8]);
  sub_1C03E2F48();
  if (v20)
  {
    v56 = *(_QWORD *)(v0 + 392);
    v57 = *(_QWORD *)(v0 + 488);
    v53 = *(_QWORD *)(v0 + 384);
    *(_QWORD *)typea = *(_QWORD *)(v0 + 376);
    v22 = *(_QWORD *)(v0 + 352);
    v23 = *(_QWORD *)(v0 + 336);
    v51 = *(_QWORD *)(v0 + 344);
    v52 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 320);
    v25 = *(_QWORD *)(v0 + 328);
    v27 = *(_QWORD *)(v0 + 296);
    v26 = *(_QWORD *)(v0 + 304);
    v28 = *(_QWORD *)(v0 + 288);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    OUTLINED_FUNCTION_47(v23, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v52, v51);
    (*(void (**)(uint64_t, os_log_type_t *))(v53 + 8))(v56, *(os_log_type_t **)typea);
    sub_1C03B579C(v57, &qword_1ED7382A0);
    if (qword_1ED738B38 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(*(_QWORD *)(v0 + 400), (uint64_t)qword_1ED738B20);
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_121();
    sub_1C03E4010();
    v30 = OUTLINED_FUNCTION_55_0();
    if (OUTLINED_FUNCTION_17(v30))
    {
      v31 = (uint8_t *)OUTLINED_FUNCTION_16();
      v59[0] = OUTLINED_FUNCTION_16();
      *(_DWORD *)v31 = 136315138;
      *(_QWORD *)(v0 + 184) = v20;
      OUTLINED_FUNCTION_121();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
      v32 = OUTLINED_FUNCTION_153_0();
      *(_QWORD *)(v0 + 176) = sub_1C03B934C(v32, v33, v59);
      OUTLINED_FUNCTION_112_2();
      sub_1C03E4238();
      OUTLINED_FUNCTION_118_0();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v29, (os_log_type_t)v24, "could not suggest next turn info because of: %s", v31);
      OUTLINED_FUNCTION_28_3();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_32_1();

    v40 = (void *)OUTLINED_FUNCTION_156_0();
    OUTLINED_FUNCTION_155_0((uint64_t)v40, sel_connectionErrorWithError_);

    OUTLINED_FUNCTION_32_1();
LABEL_13:
    OUTLINED_FUNCTION_19_4();
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_85_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_109_1();
    __asm { BR              X0 }
  }
  v36 = v21;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 512))(*(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 504), *(_QWORD *)(v0 + 400));
  OUTLINED_FUNCTION_111_0();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_151_0();
  OUTLINED_FUNCTION_111_0();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_151_0();
  v37 = OUTLINED_FUNCTION_130();
  v38 = sub_1C03E41E4();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = OUTLINED_FUNCTION_16();
    *(_QWORD *)(v0 + 144) = OUTLINED_FUNCTION_16();
    *(_DWORD *)v39 = 136315906;
    OUTLINED_FUNCTION_100_0();
    *(_QWORD *)(v39 + 4) = OUTLINED_FUNCTION_58_3();
    OUTLINED_FUNCTION_16_1();
    *(_WORD *)(v39 + 12) = 2080;
    OUTLINED_FUNCTION_96();
    *(_QWORD *)(v39 + 14) = OUTLINED_FUNCTION_58_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_2();
    *(_WORD *)(v39 + 22) = 2080;
    OUTLINED_FUNCTION_48_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738378);
    sub_1C03E4040();
    OUTLINED_FUNCTION_77();
    *(_QWORD *)(v39 + 24) = OUTLINED_FUNCTION_58_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_1();
    *(_WORD *)(v39 + 32) = 2048;
    __asm { BR              X9 }
  }
  v58 = *(void (**)(uint64_t, uint64_t))(v0 + 552);
  v42 = *(_QWORD *)(v0 + 416);
  v43 = *(_QWORD *)(v0 + 400);
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_21_5();

  v58(v42, v43);
  *(_QWORD *)(v0 + 560) = *(_QWORD *)(v0 + 552);
  v45 = *(_QWORD *)(v0 + 296);
  v44 = *(_QWORD *)(v0 + 304);
  v46 = *(_QWORD *)(v0 + 288);
  v47 = *(void **)(v0 + 272);
  v48 = (void *)sub_1C03E2FD8();
  objc_msgSend(v47, sel_sendSuggestionsWithSuggestions_, v48);

  swift_release();
  OUTLINED_FUNCTION_21_5();
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
  v49 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 568) = v49;
  OUTLINED_FUNCTION_68_1(v49);
  OUTLINED_FUNCTION_109_1();
  return sub_1C03E41CC();
}

uint64_t sub_1C03DAA80()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_120_2(v2);
  if (v1)
  {
    swift_release();
  }
  else
  {
    v0[69] = v0[70];
    v0[68] = 0;
  }
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03DAAD8()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  OUTLINED_FUNCTION_145_0();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 328) + 8))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 320));
  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v3 = OUTLINED_FUNCTION_105_1();
  OUTLINED_FUNCTION_154_0(v3, &qword_1ED7382A0);
  v4 = *(_QWORD *)(v0 + 112);
  if (qword_1ED738B38 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(*(_QWORD *)(v0 + 400), (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  sub_1C03E4010();
  v6 = OUTLINED_FUNCTION_55_0();
  if (OUTLINED_FUNCTION_17(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_16();
    v8 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v7 = 136315138;
    v14 = v8;
    *(_QWORD *)(v0 + 184) = v4;
    OUTLINED_FUNCTION_33();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v9 = OUTLINED_FUNCTION_153_0();
    *(_QWORD *)(v0 + 176) = sub_1C03B934C(v9, v10, &v14);
    OUTLINED_FUNCTION_112_2();
    sub_1C03E4238();
    OUTLINED_FUNCTION_118_0();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v5, v1, "could not suggest next turn info because of: %s", v7);
    OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  v11 = *(void **)(v0 + 272);
  v12 = (void *)sub_1C03E2F6C();
  objc_msgSend(v11, sel_connectionErrorWithError_, v12);

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19_4();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_85_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03DACEC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  sub_1C03E2F30();
  swift_allocObject();
  sub_1C03E2F24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738328);
  sub_1C03DE384();
  sub_1C03E2F0C();
  result = swift_release();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_1C03DADA4()
{
  sub_1C03E2F30();
  swift_allocObject();
  sub_1C03E2F24();
  sub_1C03E3D1C();
  sub_1C03A858C(&qword_1ED738270, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6638], MEMORY[0x1E0DA6650]);
  sub_1C03E2F0C();
  return swift_release();
}

void sub_1C03DAFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1C03E2F6C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_1C03DB02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;

  OUTLINED_FUNCTION_10_3();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v35);
  v37 = (char *)&a9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1((uint64_t)v37, v39, v40, v38);
  v41 = (_QWORD *)OUTLINED_FUNCTION_36();
  v41[2] = 0;
  v41[3] = 0;
  v41[4] = v20;
  v41[5] = v34;
  v41[6] = v32;
  v41[7] = v30;
  v41[8] = v28;
  v41[9] = v26;
  v41[10] = v24;
  OUTLINED_FUNCTION_104();
  swift_retain();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_13_3();
  sub_1C03DED74((uint64_t)v37, (uint64_t)&unk_1EF5FE080, (uint64_t)v41);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03DB0F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v8[7] = v11;
  v8[8] = v12;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  v9 = sub_1C03E3CF8();
  v8[9] = v9;
  v8[10] = *(_QWORD *)(v9 - 8);
  v8[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03DB168()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48));
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_104();
  sub_1C03E3CD4();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_1C03DB220;
  return sub_1C03E3524();
}

uint64_t sub_1C03DB220()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  v1 = *(_QWORD *)(v0 + 80);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_11();
  return swift_task_switch();
}

uint64_t sub_1C03DB270()
{
  uint64_t v0;

  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v0 + 56));
  OUTLINED_FUNCTION_30();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

#error "1C03DB344: call analysis failed (funcsize=51)"

uint64_t sub_1C03DB37C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_38();
  v8 = v7 - v6;
  v9 = *(_QWORD *)(v2 + 16);
  v10 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1(v8, v11, v12, v10);
  v13 = (_QWORD *)OUTLINED_FUNCTION_36();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v9;
  v13[5] = a1;
  v13[6] = a2;
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_48_4();
  sub_1C03DED74(v8, (uint64_t)&unk_1EF5FE070, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_1C03DB42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[4] = a5;
  v6[5] = a6;
  v7 = (_QWORD *)swift_task_alloc();
  v6[6] = v7;
  *v7 = v6;
  v7[1] = sub_1C03DB47C;
  return StatefulSuggestionsClient.refreshService()();
}

uint64_t sub_1C03DB47C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DB4CC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v0 + 32));
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

#error "1C03DB59C: call analysis failed (funcsize=72)"

uint64_t sub_1C03DB6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[21] = a3;
  v4[22] = a4;
  v4[19] = a1;
  v4[20] = a2;
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8E0);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03DB764()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  __int128 v19;

  OUTLINED_FUNCTION_28_2();
  v1 = *(_QWORD **)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(uint64_t **)(v0 + 152);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 160);
  v4 = *v3;
  v5 = v3[1];
  v6 = *(int *)(v2 + 48);
  *(_DWORD *)(v0 + 296) = v6;
  v7 = (uint64_t)v1 + v6;
  v8 = (uint64_t)v3 + v6;
  *v1 = v4;
  v1[1] = v5;
  v9 = sub_1C03E3D1C();
  *(_QWORD *)(v0 + 256) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  *(_QWORD *)(v0 + 264) = v11;
  OUTLINED_FUNCTION_92_1(v7, v8, v11);
  sub_1C03E3D10();
  v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  *(_QWORD *)(v0 + 272) = v12;
  v12(v7, v9);
  v13 = *(_QWORD *)(v0 + 104);
  v19 = *(_OWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 88);
  v15 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v14);
  *(_OWORD *)(v0 + 40) = v19;
  *(_QWORD *)(v0 + 56) = v13;
  v16 = OUTLINED_FUNCTION_130_1();
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v16, v15, v14);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 280) = v17;
  type metadata accessor for StatefulSuggestionsClient();
  sub_1C03A858C(&qword_1EF5FE028, (uint64_t (*)(uint64_t))type metadata accessor for StatefulSuggestionsClient, (uint64_t)&protocol conformance descriptor for StatefulSuggestionsClient);
  *v17 = v0;
  v17[1] = sub_1C03DB8B8;
  OUTLINED_FUNCTION_25_2();
  return sub_1C03E3728();
}

uint64_t sub_1C03DB8B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v2);
  *(_QWORD *)(v0 + 288) = v1;
  swift_task_dealloc();
  if (!v1)
    OUTLINED_FUNCTION_132_0(v0 + 16);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

#error "1C03DBA4C: call analysis failed (funcsize=145)"

void sub_1C03DBB84()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(char *, char *, uint64_t);
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
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
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t (*v48)(void);
  uint64_t v49;
  os_log_type_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;

  OUTLINED_FUNCTION_132_0(v0 + 16);
  if (qword_1ED738B38 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(void (**)(char *, char *, uint64_t))(v0 + 264);
  v3 = *(_QWORD **)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 184);
  v51 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD **)(v0 + 152);
  v6 = (char *)v5 + *(int *)(v0 + 296);
  v7 = OUTLINED_FUNCTION_29();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED738B20);
  v9 = (char *)v3 + *(int *)(v4 + 48);
  v10 = v5[1];
  *v3 = *v5;
  v3[1] = v10;
  v2(v9, v6, v1);
  OUTLINED_FUNCTION_143_0((uint64_t)v3, v11, &qword_1EF5FD8E0);
  sub_1C03DE264((uint64_t)v3, v51);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_100_0();
  sub_1C03E4010();
  v12 = OUTLINED_FUNCTION_55_0();
  v13 = OUTLINED_FUNCTION_23_1(v12);
  v14 = *(_QWORD *)(v0 + 288);
  if (v13)
  {
    v15 = *(_QWORD *)(v0 + 256);
    v46 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v48 = *(uint64_t (**)(void))(v0 + 272);
    v52 = v8;
    v16 = *(uint64_t **)(v0 + 216);
    v17 = *(uint64_t **)(v0 + 200);
    v49 = *(_QWORD *)(v0 + 192);
    v50 = v3;
    v18 = *(_QWORD *)(v0 + 184);
    v19 = OUTLINED_FUNCTION_16();
    v53 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v19 = 136315394;
    v20 = *(int *)(v18 + 48);
    v21 = (uint64_t)v16 + v20;
    v23 = *v17;
    v22 = v17[1];
    *v16 = *v17;
    v16[1] = v22;
    OUTLINED_FUNCTION_148_0((uint64_t)v16 + v20, (uint64_t)v17 + v20, v24, v25, v26, v27, v28, v29, v44, v46);
    OUTLINED_FUNCTION_6_5();
    OUTLINED_FUNCTION_88_2(v21, v15, v30, v31, v32, v33, v34, v35, v45, v47, v48);
    *(_QWORD *)(v0 + 120) = OUTLINED_FUNCTION_10_1(v23, v36, &v53);
    sub_1C03E4238();
    OUTLINED_FUNCTION_71();
    sub_1C03B579C(v49, &qword_1EF5FD8E0);
    sub_1C03B579C((uint64_t)v17, &qword_1EF5FD8E0);
    *(_WORD *)(v19 + 12) = 2080;
    *(_QWORD *)(v0 + 128) = v14;
    OUTLINED_FUNCTION_33();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v37 = sub_1C03E40A0();
    *(_QWORD *)(v0 + 136) = sub_1C03B934C(v37, v38, &v53);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_19_1(&dword_1C03A5000, v52, v50, "Unable to submit %s to state store: %s", (uint8_t *)v19);
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  v39 = OUTLINED_FUNCTION_105();
  sub_1C03B579C(v39, v40);
  v41 = OUTLINED_FUNCTION_157_0();
  sub_1C03B579C(v41, v42);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_81_1();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_109_1();
  __asm { BR              X1 }
}

void sub_1C03DBE68()
{
  NSObject *v0;
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
  os_log_type_t v15;
  uint8_t *v16;
  Class isa;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject v22;
  uint64_t v23;

  OUTLINED_FUNCTION_10_3();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v22.isa = v0->isa;
  v23 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_51_3();
  if (qword_1ED738B38 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v14, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_21_2();
  v15 = OUTLINED_FUNCTION_46();
  if (os_log_type_enabled(v0, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C03A5000, v0, v15, "Submitting all local state store properties", v16, 2u);
    OUTLINED_FUNCTION_5_0();
  }

  isa = v0[2].isa;
  v18 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1(v1, v19, v20, v18);
  v21 = (_QWORD *)OUTLINED_FUNCTION_36();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v11;
  v21[5] = v9;
  v21[6] = v7;
  v21[7] = v5;
  v21[8] = isa;
  v21[9] = v23;
  v21[10] = v3;
  v21[11] = v22.isa;
  OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_48_4();
  sub_1C03DED74(v1, (uint64_t)&unk_1EF5FE038, (uint64_t)v21);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03DBFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v8[3] = v16;
  v8[4] = v17;
  v14 = (_QWORD *)swift_task_alloc();
  v8[5] = v14;
  *v14 = v8;
  v14[1] = sub_1C03DC058;
  return sub_1C03D8560(a4, a5, a6, a7, a8);
}

uint64_t sub_1C03DC058()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DC0A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v0 + 24));
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03DC0D0()
{
  os_log_type_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_39_1();
  if (qword_1ED738B38 != -1)
    swift_once();
  v2 = *(NSObject **)(v1 + 48);
  v3 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_130();
  v4 = OUTLINED_FUNCTION_55_0();
  if (OUTLINED_FUNCTION_23_1(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    v6 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v5 = 138412290;
    OUTLINED_FUNCTION_127_2();
    v7 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v1 + 16) = v7;
    OUTLINED_FUNCTION_73_0();
    *v6 = v7;
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_27_3();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, v0, "Error when submitting to state store: %@", v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_11_9();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_27_3();
  OUTLINED_FUNCTION_27_3();

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_100_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_2_6(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1C03DC23C()
{
  void (*v0)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  void (*v1)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = _Block_copy(v6);
  v8 = sub_1C03E4094();
  v10 = v9;
  v11 = v5;
  OUTLINED_FUNCTION_66_2();
  v12 = sub_1C03E2FF0();
  v14 = v13;

  v15 = OUTLINED_FUNCTION_36();
  *(_QWORD *)(v15 + 16) = v7;
  v1(v8, v10, v12, v14, v3, v15);
  swift_release();
  sub_1C03B57E8(v12, v14);
  OUTLINED_FUNCTION_1_1();
  return swift_bridgeObjectRelease();
}

void sub_1C03DC30C()
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
  _QWORD *v24;
  uint64_t v25;

  OUTLINED_FUNCTION_10_3();
  v2 = v1;
  v25 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_38();
  v19 = v18 - v17;
  v20 = *(_QWORD *)(v0 + 16);
  v21 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1(v19, v22, v23, v21);
  v24 = (_QWORD *)OUTLINED_FUNCTION_36();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = v7;
  v24[5] = v5;
  v24[6] = v15;
  v24[7] = v13;
  v24[8] = v20;
  v24[9] = v11;
  v24[10] = v9;
  v24[11] = v25;
  v24[12] = v2;
  sub_1C03C5F08(v7, v5);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_111_0();
  OUTLINED_FUNCTION_48_4();
  sub_1C03DED74(v19, (uint64_t)&unk_1EF5FE020, (uint64_t)v24);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03DC3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 296) = v12;
  *(_QWORD *)(v8 + 304) = v13;
  *(_OWORD *)(v8 + 280) = v11;
  *(_QWORD *)(v8 + 264) = a7;
  *(_QWORD *)(v8 + 272) = a8;
  *(_QWORD *)(v8 + 248) = a5;
  *(_QWORD *)(v8 + 256) = a6;
  *(_QWORD *)(v8 + 240) = a4;
  v9 = sub_1C03E3D1C();
  *(_QWORD *)(v8 + 312) = v9;
  *(_QWORD *)(v8 + 320) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 328) = swift_task_alloc();
  return swift_task_switch();
}

#error "1C03DC708: call analysis failed (funcsize=251)"

uint64_t sub_1C03DC8B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v2);
  *(_QWORD *)(v0 + 352) = v1;
  swift_task_dealloc();
  if (!v1)
    __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03DC90C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v0 + 296));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_121_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03DC960()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_39_1();
  swift_release();
  OUTLINED_FUNCTION_132_0(v0 + 160);
  if (qword_1ED738B38 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B20);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41FC();
  if (OUTLINED_FUNCTION_67_0(v2))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    v5 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v4 = 138412290;
    OUTLINED_FUNCTION_33();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 224) = v6;
    OUTLINED_FUNCTION_73_0();
    *v5 = v6;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, v3, "Error when submitting to state store: %@", v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_11_9();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_100_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_121_2();
  return OUTLINED_FUNCTION_2_6(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C03DCBD4(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (qword_1ED738B38 != -1)
    swift_once();
  v3 = sub_1C03E4028();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED738B20);
  v4 = sub_1C03E4010();
  v5 = sub_1C03E41E4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C03A5000, v4, v5, "warm up started!", v6, 2u);
    MEMORY[0x1C3B99F38](v6, -1, -1);
  }

  a2[2](a2, 0);
  _Block_release(a2);
}

void sub_1C03DCD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
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
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
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

  OUTLINED_FUNCTION_10_3();
  v38 = v1;
  v39 = v0;
  v36 = v2;
  v37 = v3;
  v5 = v4;
  v34 = v6;
  v35 = v7;
  v33 = v8;
  v9 = OUTLINED_FUNCTION_141_0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_53_1((uint64_t)v15, v17, v18, v16);
  OUTLINED_FUNCTION_92_1((uint64_t)v12, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  v19 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = 0;
  *(_QWORD *)(v23 + 24) = 0;
  OUTLINED_FUNCTION_92_1(v23 + v19, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  v24 = (uint64_t *)(v23 + v20);
  v25 = v33;
  v26 = v34;
  *v24 = v33;
  v24[1] = v26;
  v27 = (_QWORD *)(v23 + v21);
  v28 = v37;
  *v27 = v36;
  v27[1] = v28;
  v29 = (_QWORD *)(v23 + v22);
  v31 = v38;
  v30 = v39;
  *v29 = v35;
  v29[1] = v31;
  *(_QWORD *)(v23 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) = v30;
  sub_1C03C5F08(v25, v26);
  swift_retain();
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_48_4();
  sub_1C03DED74((uint64_t)v15, (uint64_t)&unk_1EF5FDFF0, v23);
  swift_release();
  OUTLINED_FUNCTION_69();
}

uint64_t sub_1C03DCE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 208) = v14;
  *(_OWORD *)(v8 + 192) = v13;
  *(_QWORD *)(v8 + 176) = a7;
  *(_QWORD *)(v8 + 184) = a8;
  *(_QWORD *)(v8 + 160) = a5;
  *(_QWORD *)(v8 + 168) = a6;
  *(_QWORD *)(v8 + 152) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDFF8);
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  v9 = sub_1C03E3CA4();
  *(_QWORD *)(v8 + 224) = v9;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  v10 = sub_1C03E3D1C();
  *(_QWORD *)(v8 + 248) = v10;
  *(_QWORD *)(v8 + 256) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 264) = swift_task_alloc();
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  v11 = sub_1C03E302C();
  *(_QWORD *)(v8 + 280) = v11;
  *(_QWORD *)(v8 + 288) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  return swift_task_switch();
}

#error "1C03DD628: call analysis failed (funcsize=421)"

uint64_t sub_1C03DD69C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_48_1();
  OUTLINED_FUNCTION_171(v2);
  *(_QWORD *)(v0 + 344) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1C03DD6F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 232);
  v1 = *(_QWORD *)(v0 + 240);
  OUTLINED_FUNCTION_71_2(*(uint64_t (**)(_QWORD))(v0 + 176));
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_47(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03DD764()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_39_1();
  v1 = *(_QWORD *)(v0 + 232);
  swift_release();
  OUTLINED_FUNCTION_86(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41FC();
  if (OUTLINED_FUNCTION_67_0(v2))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_16();
    v5 = (_QWORD *)OUTLINED_FUNCTION_16();
    *(_DWORD *)v4 = 138412290;
    OUTLINED_FUNCTION_33();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v6;
    sub_1C03E4238();
    *v5 = v6;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, v3, "Error when submitting to state store: %@", v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD318);
    OUTLINED_FUNCTION_11_9();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_100_2();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_44_3();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  return OUTLINED_FUNCTION_2_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03DDA18()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_96_0();
  return v0;
}

uint64_t sub_1C03DDA48()
{
  sub_1C03DDA18();
  OUTLINED_FUNCTION_114_1();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriSuggestionsXPCService()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCErrors(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCErrors()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for XPCErrors(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
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

_QWORD *assignWithTake for XPCErrors(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCErrors(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for XPCErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
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

uint64_t sub_1C03DDBD4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1C03DDBEC(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCErrors()
{
  return &type metadata for XPCErrors;
}

uint64_t sub_1C03DDC1C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1C03DDC40(uint64_t a1)
{
  uint64_t v1;

  sub_1C03DAFE0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1C03DDC58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_10_3();
  v1 = OUTLINED_FUNCTION_141_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_141();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_1C03B57E8(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  swift_release();
  sub_1C03B57E8(*(_QWORD *)(v0 + ((((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03DDD1C()
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
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_141_0();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_80_1();
  return sub_1C03DCE70(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C03DDDF0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_1C03DDE18()
{
  unint64_t result;

  result = qword_1EF5FE008;
  if (!qword_1EF5FE008)
  {
    result = MEMORY[0x1C3B99EA8](&protocol conformance descriptor for XPCErrors, &type metadata for XPCErrors);
    atomic_store(result, (unint64_t *)&qword_1EF5FE008);
  }
  return result;
}

uint64_t sub_1C03DDE54()
{
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_117_2();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

#error "1C03DDEE8: call analysis failed (funcsize=27)"

uint64_t sub_1C03DDF0C()
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
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_93_0();
  OUTLINED_FUNCTION_62_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_2();
  return sub_1C03DBFCC(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C03DDF74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33[3];
  uint64_t v34;

  v2 = sub_1C03E3D1C();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x1E0C80A78](v2);
  v30 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7383A0);
  result = sub_1C03E4358();
  v5 = (_QWORD *)result;
  v6 = 0;
  v34 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v27 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v29 = result + 64;
  v11 = v30;
  v12 = v31;
  v13 = v32;
  if ((v9 & v7) == 0)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v6 << 6); ; i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v34 + 48) + 16 * i);
    v21 = *v19;
    v20 = v19[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v11, *(_QWORD *)(v34 + 56) + *(_QWORD *)(v12 + 72) * i, v13);
    swift_bridgeObjectRetain();
    sub_1C03E3D10();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v11, v13);
    *(_QWORD *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v22 = (_QWORD *)(v5[6] + 16 * i);
    *v22 = v21;
    v22[1] = v20;
    result = (uint64_t)sub_1C03B68B0(v33, (_OWORD *)(v5[7] + 48 * i));
    v23 = v5[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v5[2] = v25;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v16 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_24;
    if (v16 >= v28)
      return (uint64_t)v5;
    v17 = *(_QWORD *)(v27 + 8 * v16);
    ++v6;
    if (!v17)
    {
      v6 = v16 + 1;
      if (v16 + 1 >= v28)
        return (uint64_t)v5;
      v17 = *(_QWORD *)(v27 + 8 * v6);
      if (!v17)
      {
        v6 = v16 + 2;
        if (v16 + 2 >= v28)
          return (uint64_t)v5;
        v17 = *(_QWORD *)(v27 + 8 * v6);
        if (!v17)
          break;
      }
    }
LABEL_18:
    v10 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v28)
    return (uint64_t)v5;
  v17 = *(_QWORD *)(v27 + 8 * v18);
  if (v17)
  {
    v6 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    v6 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v6 >= v28)
      return (uint64_t)v5;
    v17 = *(_QWORD *)(v27 + 8 * v6);
    ++v18;
    if (v17)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C03DE1E4(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 64);
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
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1C03DE264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03DE2AC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C03DE2D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1C03DE340;
  return sub_1C03DB6A8(a1, v4, v5, v6);
}

uint64_t sub_1C03DE340(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_6_1();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

unint64_t sub_1C03DE384()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1ED738330;
  if (!qword_1ED738330)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED738328);
    sub_1C03A858C(&qword_1ED738270, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA6638], MEMORY[0x1E0DA6650]);
    v3[0] = MEMORY[0x1E0DEA9A0];
    v3[1] = v2;
    result = MEMORY[0x1C3B99EA8](MEMORY[0x1E0DEA0D8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1ED738330);
  }
  return result;
}

uint64_t sub_1C03DE408()
{
  OUTLINED_FUNCTION_141();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03DE438(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = swift_task_alloc();
  v10 = (_QWORD *)OUTLINED_FUNCTION_13_2(v9);
  *v10 = v2;
  v10[1] = sub_1C03AF788;
  return sub_1C03DB42C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1C03DE4B4()
{
  OUTLINED_FUNCTION_141();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_96_0();
  OUTLINED_FUNCTION_114_1();
  return swift_deallocObject();
}

uint64_t sub_1C03DE4E8()
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
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_69_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_80_1();
  return sub_1C03DB0F8(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1C03DE554()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_117_2();
  v1 = *(_QWORD *)(v0 + 56);
  if (v1 >> 60 != 15)
    sub_1C03B57E8(*(_QWORD *)(v0 + 48), v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C03DE5B0()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v19 = v0[3];
  v20 = v0[2];
  v5 = v0[5];
  v18 = v0[4];
  OUTLINED_FUNCTION_116_1();
  v6 = swift_task_alloc();
  v7 = (_QWORD *)OUTLINED_FUNCTION_13_2(v6);
  *v7 = v1;
  v7[1] = sub_1C03AE3D8;
  v15 = OUTLINED_FUNCTION_136((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14, v17);
  return sub_1C03D9734(v15, v20, v19, v18, v5, v2, v3, v4);
}

uint64_t sub_1C03DE65C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1C03C5F08(a1, a2);
  return a1;
}

uint64_t sub_1C03DE670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7382A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C03DE6B8()
{
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_117_2();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_96_0();
  OUTLINED_FUNCTION_114_1();
  return swift_deallocObject();
}

uint64_t sub_1C03DE6E8()
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
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_69_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AC840;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_80_1();
  return sub_1C03D8DCC(v3, v4, v5, v6, v7, v8, v9, v10);
}

void sub_1C03DE754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1C03D8B5C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t objectdestroy_21Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_141();
  swift_bridgeObjectRelease();
  sub_1C03B57E8(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  swift_release();
  OUTLINED_FUNCTION_96_0();
  return swift_deallocObject();
}

uint64_t sub_1C03DE79C()
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
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_93_0();
  OUTLINED_FUNCTION_62_2();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_13_2(v1);
  *v2 = v0;
  v2[1] = sub_1C03AF788;
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_25_2();
  return sub_1C03D7FCC(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t OUTLINED_FUNCTION_2_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_11_9()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 488);
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C03B57E8(v1, v0);
}

void OUTLINED_FUNCTION_27_3()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_34_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_40_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_48_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return sub_1C03E3F38();
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return sub_1C03E4190();
}

uint64_t OUTLINED_FUNCTION_52_3()
{
  return sub_1C03E3F38();
}

BOOL OUTLINED_FUNCTION_56_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  return sub_1C03B934C(v1, v2, v0);
}

__n128 OUTLINED_FUNCTION_62_2()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_66_2()
{
  return swift_retain();
}

BOOL OUTLINED_FUNCTION_67_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_68_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 312);
}

uint64_t OUTLINED_FUNCTION_71_2@<X0>(uint64_t (*a1)(_QWORD)@<X8>)
{
  return a1(0);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return sub_1C03E4238();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C03C5F08(v1, v0);
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_release();
}

void OUTLINED_FUNCTION_78_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_80_2(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_81_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_88_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(void))
{
  return a11();
}

uint64_t OUTLINED_FUNCTION_89_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

BOOL OUTLINED_FUNCTION_90_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_92_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_96_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_100_2()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

uint64_t OUTLINED_FUNCTION_102_2()
{
  return sub_1C03E3B6C();
}

uint64_t OUTLINED_FUNCTION_105_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_107_2()
{
  return sub_1C03E41FC();
}

uint64_t OUTLINED_FUNCTION_108_2()
{
  return sub_1C03E3F44();
}

uint64_t OUTLINED_FUNCTION_110_1()
{
  return sub_1C03E3F44();
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_113_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_114_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_115_2(float a1)
{
  float *v1;

  *v1 = a1;
}

__n128 OUTLINED_FUNCTION_116_1()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_117_2()
{
  uint64_t v0;

  return sub_1C03B57E8(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t OUTLINED_FUNCTION_120_2@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_121_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_122_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  return sub_1C03B934C(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_126_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

id OUTLINED_FUNCTION_127_2()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_129_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_1C03B934C(v3, v4, a3);
}

uint64_t *OUTLINED_FUNCTION_130_1()
{
  uint64_t *v0;

  return __swift_allocate_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_132_0(uint64_t a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t OUTLINED_FUNCTION_133_0()
{
  return sub_1C03E2F18();
}

uint64_t OUTLINED_FUNCTION_136(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)(v10 + 16) = a9;
  return v9;
}

uint64_t OUTLINED_FUNCTION_137_0()
{
  return sub_1C03E2F24();
}

uint64_t OUTLINED_FUNCTION_141_0()
{
  return sub_1C03E302C();
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  return sub_1C03E2F30();
}

void OUTLINED_FUNCTION_143_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_1C03B575C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_146_0()
{
  return sub_1C03E3B6C();
}

uint64_t OUTLINED_FUNCTION_148_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;

  return a10(a1, a2, v10);
}

uint64_t OUTLINED_FUNCTION_149_0()
{
  return sub_1C03E4010();
}

uint64_t OUTLINED_FUNCTION_150_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1C03B934C(a1, a2, &a9);
}

uint64_t OUTLINED_FUNCTION_151_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C03C5F08(v1, v0);
}

uint64_t OUTLINED_FUNCTION_152_0()
{
  return sub_1C03E43E8();
}

uint64_t OUTLINED_FUNCTION_153_0()
{
  return sub_1C03E40A0();
}

void OUTLINED_FUNCTION_154_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C03B579C(v2, a2);
}

id OUTLINED_FUNCTION_155_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_156_0()
{
  return sub_1C03E2F6C();
}

uint64_t OUTLINED_FUNCTION_157_0()
{
  uint64_t v0;

  return v0;
}

uint64_t StatefulSuggestionsClient.DefaultKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C03DECDC + 4 * byte_1C03E62F0[*v0]))(0xD000000000000010, 0x80000001C03E66B0);
}

uint64_t sub_1C03DECDC(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_1C03DED30()
{
  return 0x45746E65696C6173;
}

uint64_t sub_1C03DED54()
{
  return 0x7453656369766564;
}

void sub_1C03DED74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t EnumTagSinglePayload;
  uint64_t v8;

  v6 = sub_1C03E4190();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, v6);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_154_0(EnumTagSinglePayload, &qword_1ED738340);
  }
  else
  {
    sub_1C03E4184();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C03E4160();
    swift_unknownObjectRelease();
  }
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  swift_task_create();
  OUTLINED_FUNCTION_60_1();
}

void sub_1C03DEEB0(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1C03DEF04(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1C03DEF8C + 4 * byte_1C03E62FD[a2]))(0x6E6F69746361);
}

void sub_1C03DEF8C(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x6E6F69746361 || v1 != 0xE600000000000000)
    OUTLINED_FUNCTION_49_4();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_28_0();
}

void sub_1C03DF03C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1C03DF098(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1C03DF0F0 + 4 * byte_1C03E6307[a2]))(0x69726953776F6873);
}

void sub_1C03DF0F0(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x69726953776F6873 || v1 != 0xEC000000706C6548)
    OUTLINED_FUNCTION_49_4();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_28_0();
}

void sub_1C03DF15C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_1C03DF1C0(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1C03DF264 + 4 * byte_1C03E6312[a2]))(a3 + 4);
}

uint64_t sub_1C03DF264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v6;

  if (a1 == a3 + 4 && v4 == ((v3 - 32) | 0x8000000000000000))
    v6 = 1;
  else
    v6 = sub_1C03E43F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

void sub_1C03DF334()
{
  sub_1C03DF34C();
}

void sub_1C03DF340()
{
  sub_1C03DF34C();
}

void sub_1C03DF34C()
{
  uint64_t v0;

  v0 = sub_1C03E4460();
  OUTLINED_FUNCTION_62_3(v0);
  sub_1C03E4478();
  OUTLINED_FUNCTION_60_1();
}

void sub_1C03DF388(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C03DF3CC()
{
  sub_1C03E40C4();
  return OUTLINED_FUNCTION_35_3();
}

void sub_1C03DF450(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C03DF494()
{
  sub_1C03E40C4();
  return OUTLINED_FUNCTION_35_3();
}

void sub_1C03DF4EC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C03DF530()
{
  sub_1C03E40C4();
  return swift_bridgeObjectRelease();
}

void sub_1C03DF5DC()
{
  sub_1C03DF5F4();
}

void sub_1C03DF5E8()
{
  sub_1C03DF5F4();
}

void sub_1C03DF5F4()
{
  uint64_t v0;

  v0 = sub_1C03E4460();
  OUTLINED_FUNCTION_62_3(v0);
  sub_1C03E4478();
  OUTLINED_FUNCTION_60_1();
}

uint64_t StatefulSuggestionsClient.suggestNext(requestId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[13] = a3;
  v4[14] = v3;
  v4[11] = a1;
  v4[12] = a2;
  sub_1C03E302C();
  v4[15] = OUTLINED_FUNCTION_3_0();
  v5 = sub_1C03E3AD0();
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = OUTLINED_FUNCTION_27();
  v4[19] = OUTLINED_FUNCTION_3_3();
  v4[20] = OUTLINED_FUNCTION_3_3();
  v6 = sub_1C03E3A7C();
  v4[21] = v6;
  v4[22] = *(_QWORD *)(v6 - 8);
  v4[23] = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DF6B8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  _QWORD *v11;
  uint64_t (*v13)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  v0[24] = __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B68);
  v2 = (void *)OUTLINED_FUNCTION_21_2();
  v3 = sub_1C03E41E4();
  if (OUTLINED_FUNCTION_8_2(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v4, v5, "Start suggestNext.");
    OUTLINED_FUNCTION_5_0();
  }
  v6 = (_QWORD *)v0[14];

  v7 = v6 + 4;
  v8 = v6[7];
  v9 = v6[8];
  OUTLINED_FUNCTION_28_5(v7);
  OUTLINED_FUNCTION_43_2(*(_QWORD *)(v9 + 8));
  v13 = v10;
  v11 = (_QWORD *)swift_task_alloc();
  v0[25] = v11;
  *v11 = v0;
  v11[1] = sub_1C03DF7B0;
  return v13(v0[23], v0[12], v0[13], v8, v9);
}

uint64_t sub_1C03DF7B0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_59_1();
  *(_QWORD *)(v1 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DF7FC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_21_6();
  *(_QWORD *)(v1 + 72) = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 216) = v2;
  OUTLINED_FUNCTION_6_8(v2);
  return OUTLINED_FUNCTION_5_7();
}

uint64_t sub_1C03DF860()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DF894()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_28_5((_QWORD *)(v0 + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *v1 = v0;
  v1[1] = sub_1C03DF8F8;
  return OUTLINED_FUNCTION_17_4();
}

uint64_t sub_1C03DF8F8()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DF92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v46;

  OUTLINED_FUNCTION_40_2();
  a25 = v27;
  a26 = v28;
  a24 = v26;
  v29 = *(NSObject **)(v26 + 192);
  v31 = *(_QWORD *)(v26 + 152);
  v30 = *(_QWORD *)(v26 + 160);
  v32 = *(_QWORD *)(v26 + 128);
  v33 = *(_QWORD *)(v26 + 136);
  __swift_destroy_boxed_opaque_existential_1(v26 + 16);
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
  v34(v31, v30, v32);
  sub_1C03E4010();
  v35 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_17(v35))
  {
    v37 = *(_QWORD *)(v26 + 144);
    v36 = *(_QWORD *)(v26 + 152);
    v38 = *(_QWORD *)(v26 + 128);
    v46 = *(_QWORD *)(v26 + 136);
    v39 = (uint8_t *)OUTLINED_FUNCTION_16();
    a15 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v39 = 136315138;
    v34(v37, v36, v38);
    v40 = sub_1C03E40A0();
    *(_QWORD *)(v26 + 80) = sub_1C03B934C(v40, v41, &a15);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v36, v38);
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v29, (os_log_type_t)v32, "Determined suggestions: %s", v39);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  v42 = *(_QWORD *)(v26 + 136);

  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8));
  v43 = OUTLINED_FUNCTION_33_1();
  v44(v43);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v26 + 136) + 32))(*(_QWORD *)(v26 + 88), *(_QWORD *)(v26 + 160), *(_QWORD *)(v26 + 128));
  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_5_6(*(uint64_t (**)(void))(v26 + 8));
}

uint64_t sub_1C03DFAE4()
{
  os_log_type_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15[5];

  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_33();
  v2 = sub_1C03E4010();
  v3 = sub_1C03E41FC();
  if (OUTLINED_FUNCTION_23_1(v3))
  {
    v4 = *(void **)(v1 + 208);
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    v6 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v5 = 136315138;
    v15[0] = v6;
    *(_QWORD *)(v1 + 56) = v4;
    v7 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FD770);
    v8 = sub_1C03E40A0();
    *(_QWORD *)(v1 + 64) = sub_1C03B934C(v8, v9, v15);
    sub_1C03E4238();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v2, v0, "Unable to create suggestions: %s", v5);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  v10 = *(void **)(v1 + 208);
  v11 = sub_1C03E3F5C();
  v15[3] = sub_1C03E3BC0();
  OUTLINED_FUNCTION_54_3(&qword_1EF5FD7B0, v12, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA5F30], MEMORY[0x1E0DA5F28]);
  v15[4] = v13;
  v15[0] = v11;
  sub_1C03E3020();
  sub_1C03E3AA0();

  OUTLINED_FUNCTION_31_3();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t StatefulSuggestionsClient.logEngagement(for:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v5 = OUTLINED_FUNCTION_50_2();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = OUTLINED_FUNCTION_3_0();
  v4[22] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738238);
  v4[23] = OUTLINED_FUNCTION_27();
  v4[24] = OUTLINED_FUNCTION_3_3();
  v6 = sub_1C03E3B84();
  v4[25] = v6;
  v4[26] = *(_QWORD *)(v6 - 8);
  v4[27] = OUTLINED_FUNCTION_27();
  v4[28] = OUTLINED_FUNCTION_3_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738220);
  v4[29] = OUTLINED_FUNCTION_3_0();
  v7 = sub_1C03E37C4();
  v4[30] = v7;
  v4[31] = *(_QWORD *)(v7 - 8);
  v4[32] = OUTLINED_FUNCTION_27();
  v4[33] = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03DFD98()
{
  NSObject *v0;
  _QWORD *v1;
  os_log_type_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int EnumTagSinglePayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  if (qword_1ED738B60 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_21_2();
  v4 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_17(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_16();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C03A5000, v0, v2, "Calling SuggestionService to logIntent", v5, 2u);
    OUTLINED_FUNCTION_5_0();
  }
  v6 = v1[17];

  sub_1C03B698C(v6, (uint64_t)(v1 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v20 = v1[29];
    OUTLINED_FUNCTION_53_1(v20, v7, v8, v1[30]);
    v18 = &qword_1ED738220;
    v19 = v20;
    goto LABEL_9;
  }
  v9 = v1[33];
  v10 = v1[30];
  v11 = v1[31];
  v12 = v1[29];
  v14 = v1[24];
  v13 = v1[25];
  __swift_storeEnumTagSinglePayload(v12, 0, 1, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v12, v10);
  sub_1C03E3794();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v14, 1, v13);
  v16 = v1[33];
  if (EnumTagSinglePayload == 1)
  {
    v17 = v1[24];
    (*(void (**)(_QWORD, _QWORD))(v1[31] + 8))(v1[33], v1[30]);
    v18 = &qword_1ED738238;
    v19 = v17;
LABEL_9:
    sub_1C03B579C(v19, v18);
    OUTLINED_FUNCTION_22_6();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_55();
    v21 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
    return OUTLINED_FUNCTION_15_5(v21);
  }
  v24 = v1[31];
  v23 = v1[32];
  v25 = v1[30];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[26] + 32))(v1[28], v1[24], v1[25]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v16, v25);
  v26 = OUTLINED_FUNCTION_130();
  v27 = sub_1C03E41F0();
  if (os_log_type_enabled(v26, v27))
  {
    v34 = v1[31];
    v28 = v1[23];
    v29 = (uint8_t *)OUTLINED_FUNCTION_16();
    v35 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v29 = 136315138;
    sub_1C03E3794();
    v30 = sub_1C03E4220();
    v32 = v31;
    sub_1C03B579C(v28, &qword_1ED738238);
    v1[14] = sub_1C03B934C(v30, v32, &v35);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_80_3(v34);
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v26, v27, "logIntent for: %s", v29);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  OUTLINED_FUNCTION_80_3(v1[31]);

  v1[34] = v16;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[26] + 16))(v1[27], v1[28], v1[25]);
  sub_1C03E37AC();
  sub_1C03E37A0();
  sub_1C03E3998();
  swift_allocObject();
  OUTLINED_FUNCTION_33_1();
  v1[35] = sub_1C03E398C();
  v33 = (_QWORD *)swift_task_alloc();
  v1[36] = v33;
  *v33 = v1;
  v33[1] = sub_1C03E0154;
  return sub_1C03E0C30(v1[21], v1[15], v1[16]);
}

uint64_t sub_1C03E0154()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E0188()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_21_6();
  *(_QWORD *)(v1 + 104) = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 296) = v2;
  OUTLINED_FUNCTION_6_8(v2);
  return OUTLINED_FUNCTION_5_7();
}

uint64_t sub_1C03E01EC()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E0220()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_28_5((_QWORD *)(v0 + 64));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v1;
  *v1 = v0;
  v1[1] = sub_1C03E0294;
  return sub_1C03E33B0();
}

uint64_t sub_1C03E0294()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_59_1();
  *(_QWORD *)(v1 + 312) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E02E0()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = (void (*)(uint64_t))v0[34];
  v2 = v0[26];
  v3 = v0[20];
  v4 = v0[21];
  v5 = v0[19];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  OUTLINED_FUNCTION_147(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v6 = OUTLINED_FUNCTION_33_1();
  v1(v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 8));
  OUTLINED_FUNCTION_22_6();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return v7();
}

uint64_t sub_1C03E0398()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_40_2();
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 152);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  OUTLINED_FUNCTION_30();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_56();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t StatefulSuggestionsClient.refreshService()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_5_2();
}

uint64_t sub_1C03E048C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_1ED738B60 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED738B68);
  v2 = (void *)OUTLINED_FUNCTION_21_2();
  v3 = sub_1C03E41E4();
  if (OUTLINED_FUNCTION_8_2(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_16() = 0;
    OUTLINED_FUNCTION_6_7(&dword_1C03A5000, v4, v5, "Refreshing services");
    OUTLINED_FUNCTION_5_0();
  }

  swift_getObjectType();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v6;
  *v6 = v0;
  v6[1] = sub_1C03E0578;
  OUTLINED_FUNCTION_33_1();
  return sub_1C03E3974();
}

uint64_t sub_1C03E0578()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v0);
}

uint64_t StatefulSuggestionsClient.logShown(for:deliveryVehicle:generationId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  return OUTLINED_FUNCTION_5_2();
}

uint64_t sub_1C03E05B8()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_21_6();
  OUTLINED_FUNCTION_68_2();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  OUTLINED_FUNCTION_6_8(v1);
  return OUTLINED_FUNCTION_5_7();
}

uint64_t sub_1C03E0610()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E064C()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_28_5((_QWORD *)(v0 + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *v1 = v0;
  v1[1] = sub_1C03E06BC;
  return sub_1C03E33C8();
}

uint64_t sub_1C03E06BC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_59_1();
  *(_QWORD *)(v1 + 112) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E0708()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v1);
}

uint64_t sub_1C03E0730()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

SiriSuggestionsSupport::StatefulSuggestionsClient::DefaultKeys_optional __swiftcall StatefulSuggestionsClient.DefaultKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriSuggestionsSupport::StatefulSuggestionsClient::DefaultKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1C03E4388();
  result.value = OUTLINED_FUNCTION_31();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1C03E07B0(char *a1)
{
  sub_1C03DF15C(*a1);
}

void sub_1C03E07BC()
{
  sub_1C03DF34C();
}

void sub_1C03E07DC(uint64_t a1)
{
  char *v1;

  sub_1C03DF4EC(a1, *v1);
}

void sub_1C03E07E4()
{
  sub_1C03DF5F4();
}

SiriSuggestionsSupport::StatefulSuggestionsClient::DefaultKeys_optional sub_1C03E0804(Swift::String *a1)
{
  return StatefulSuggestionsClient.DefaultKeys.init(rawValue:)(*a1);
}

uint64_t sub_1C03E0810@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = StatefulSuggestionsClient.DefaultKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_QWORD *StatefulSuggestionsClient.__allocating_init(suggestionService:salientEntityService:runtimeConfigProvider:featureFlagProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE v22[40];
  _BYTE v23[40];
  _BYTE v24[40];

  type metadata accessor for InMemoryHintsStateStore();
  swift_allocObject();
  v10 = sub_1C03B652C();
  type metadata accessor for TurnProtectedHintsStateStore();
  v11 = (_QWORD *)swift_allocObject();
  OUTLINED_FUNCTION_77_0(&qword_1ED738768, v12, v13, (uint64_t)"5\b]'$8");
  v15 = v14;
  OUTLINED_FUNCTION_77_0(&qword_1ED738770, v16, v17, (uint64_t)"I\b]'@8");
  v19 = v18;
  swift_defaultActor_initialize();
  v11[17] = 0;
  v11[18] = 0;
  v11[14] = v10;
  v11[15] = v15;
  v11[16] = v19;
  sub_1C03ABB30(a3, (uint64_t)v24);
  sub_1C03ABB30(a4, (uint64_t)v23);
  sub_1C03ABB30(a5, (uint64_t)v22);
  v20 = sub_1C03E23CC(a1, a2, (uint64_t)v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1(a5);
  OUTLINED_FUNCTION_120();
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v20;
}

uint64_t StatefulSuggestionsClient.submit(for:propertyKey:propertyValue:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24[3];

  v8 = v7;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738340);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1C03E4190();
  OUTLINED_FUNCTION_53_1((uint64_t)v18, v20, v21, v19);
  sub_1C03B698C(a5, (uint64_t)v24);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = 0;
  *(_QWORD *)(v22 + 24) = 0;
  *(_QWORD *)(v22 + 32) = v8;
  *(_QWORD *)(v22 + 40) = a1;
  *(_QWORD *)(v22 + 48) = a2;
  *(_QWORD *)(v22 + 56) = a3;
  *(_QWORD *)(v22 + 64) = a4;
  sub_1C03B68B0(v24, (_OWORD *)(v22 + 72));
  *(_QWORD *)(v22 + 120) = a6;
  *(_QWORD *)(v22 + 128) = a7;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C03DED74((uint64_t)v18, (uint64_t)&unk_1EF5FE0E8, v22);
  return swift_release();
}

uint64_t sub_1C03E0A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v4[3] = v8;
  v4[4] = v9;
  v4[2] = a4;
  v5 = (_QWORD *)swift_task_alloc();
  v4[5] = v5;
  type metadata accessor for StatefulSuggestionsClient();
  sub_1C03E2858(&qword_1EF5FE028, v6, (uint64_t (*)(uint64_t))type metadata accessor for StatefulSuggestionsClient, (uint64_t)&protocol conformance descriptor for StatefulSuggestionsClient);
  *v5 = v4;
  v5[1] = sub_1C03E0B64;
  return sub_1C03E3728();
}

uint64_t sub_1C03E0B64()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_59_1();
  *(_QWORD *)(v1 + 48) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E0BB0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 24))(0, 0);
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03E0BE0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 24);
  OUTLINED_FUNCTION_33();
  v2(v1, 1);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C03E0C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v3[17] = a1;
  v6 = sub_1C03E3D70();
  v3[18] = v6;
  v3[19] = *(_QWORD *)(v6 - 8);
  v3[20] = swift_task_alloc();
  v7 = sub_1C03E3D7C();
  v3[21] = v7;
  v3[22] = *(_QWORD *)(v7 - 8);
  v3[23] = swift_task_alloc();
  v8 = sub_1C03E3314();
  v3[24] = v8;
  v3[25] = *(_QWORD *)(v8 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737DF8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v9 = sub_1C03E3D88();
  v3[30] = v9;
  v3[31] = *(_QWORD *)(v9 - 8);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738218);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738280);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v10 = (_QWORD *)swift_task_alloc();
  v3[43] = v10;
  *v10 = v3;
  v10[1] = sub_1C03E0E30;
  return sub_1C03E14BC((uint64_t)(v3 + 7), a2, a3);
}

uint64_t sub_1C03E0E30()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E0E64()
{
  uint64_t v0;
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t EnumTagSinglePayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  unsigned int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void (*v48)(uint64_t, uint64_t);
  unsigned int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t);
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  OUTLINED_FUNCTION_40_2();
  v1 = (__int128 *)(v0 + 56);
  if (*(_QWORD *)(v0 + 80))
  {
    v2 = *(_QWORD *)(v0 + 336);
    v3 = *(_QWORD *)(v0 + 144);
    sub_1C03ABB70(v1, v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    OUTLINED_FUNCTION_61_1();
    sub_1C03E39A4();
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v3);
    sub_1C03B579C(v2, &qword_1ED738280);
    v5 = OUTLINED_FUNCTION_33_1();
    sub_1C03ABB30(v5, v6);
    if ((_DWORD)EnumTagSinglePayload == 1)
    {
      v7 = *(_QWORD *)(v0 + 320);
      v8 = *(_QWORD *)(v0 + 192);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
      OUTLINED_FUNCTION_61_1();
      sub_1C03E39B0();
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v7, 1, v8);
      sub_1C03B579C(v7, &qword_1ED738218);
      OUTLINED_FUNCTION_120();
      if ((_DWORD)EnumTagSinglePayload == 1)
      {
        v9 = *MEMORY[0x1E0DA6198];
        OUTLINED_FUNCTION_50_2();
        v10 = OUTLINED_FUNCTION_69_3();
        v11(v10, v9);
        v12 = v0 + 16;
LABEL_29:
        __swift_destroy_boxed_opaque_existential_1(v12);
        goto LABEL_30;
      }
    }
    else
    {
      OUTLINED_FUNCTION_120();
    }
    v16 = *(_QWORD *)(v0 + 232);
    v17 = *(_QWORD *)(v0 + 192);
    v18 = OUTLINED_FUNCTION_34_4((_QWORD *)(v0 + 16));
    OUTLINED_FUNCTION_81_2(v18, *MEMORY[0x1E0DA7D08]);
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_56_3();
    OUTLINED_FUNCTION_83_2();
    if (__swift_getEnumTagSinglePayload(v16, 1, v17) == 1)
    {
      v19 = *(_QWORD *)(v0 + 312);
      v20 = *(_QWORD *)(v0 + 192);
      OUTLINED_FUNCTION_40_4(*(_QWORD *)(v0 + 304));
      OUTLINED_FUNCTION_40_4(v19);
      v21 = (_QWORD *)(v0 + 16);
      if (__swift_getEnumTagSinglePayload(EnumTagSinglePayload, 1, v20) == 1)
      {
        sub_1C03B579C(*(_QWORD *)(v0 + 232), &qword_1ED738218);
LABEL_14:
        v32 = (unsigned int *)MEMORY[0x1E0DA68D8];
        goto LABEL_16;
      }
    }
    else
    {
      sub_1C03E2810(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 296));
      v22 = OUTLINED_FUNCTION_47_2();
      v24 = *(_QWORD *)(v0 + 304);
      v23 = *(_QWORD *)(v0 + 312);
      v25 = *(_QWORD *)(v0 + 296);
      if (v22 != 1)
      {
        v26 = *(_QWORD *)(v0 + 232);
        v27 = *(_QWORD *)(v0 + 200);
        v28 = *(_QWORD *)(v0 + 208);
        v29 = *(_QWORD *)(v0 + 192);
        OUTLINED_FUNCTION_133(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
        OUTLINED_FUNCTION_54_3(&qword_1EF5FDB60, v30, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA7D50], MEMORY[0x1E0DA7D60]);
        EnumTagSinglePayload = OUTLINED_FUNCTION_26_5();
        v31 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
        v31(v28, v29);
        OUTLINED_FUNCTION_25_4(v24);
        OUTLINED_FUNCTION_25_4(v23);
        v31(v25, v29);
        OUTLINED_FUNCTION_25_4(v26);
        v21 = (_QWORD *)(v0 + 16);
        if ((EnumTagSinglePayload & 1) != 0)
          goto LABEL_14;
LABEL_15:
        v32 = (unsigned int *)MEMORY[0x1E0DA68D0];
LABEL_16:
        v33 = *(_QWORD *)(v0 + 224);
        v34 = *(_QWORD *)(v0 + 192);
        OUTLINED_FUNCTION_76_2(*(_QWORD *)(v0 + 264), v32);
        v35 = OUTLINED_FUNCTION_34_4(v21);
        OUTLINED_FUNCTION_81_2(v35, *MEMORY[0x1E0DA7CD0]);
        OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_56_3();
        OUTLINED_FUNCTION_83_2();
        if (__swift_getEnumTagSinglePayload(v33, 1, v34) == 1)
        {
          v36 = *(_QWORD *)(v0 + 288);
          v37 = *(_QWORD *)(v0 + 192);
          OUTLINED_FUNCTION_40_4(*(_QWORD *)(v0 + 280));
          OUTLINED_FUNCTION_40_4(v36);
          if (__swift_getEnumTagSinglePayload(EnumTagSinglePayload, 1, v37) == 1)
          {
            sub_1C03B579C(*(_QWORD *)(v0 + 224), &qword_1ED738218);
LABEL_23:
            v49 = (unsigned int *)MEMORY[0x1E0DA6838];
LABEL_25:
            v50 = *(_QWORD *)(v0 + 328);
            v52 = *(_QWORD *)(v0 + 256);
            v51 = *(_QWORD *)(v0 + 264);
            v54 = *(_QWORD *)(v0 + 240);
            v53 = *(_QWORD *)(v0 + 248);
            v55 = *(_QWORD *)(v0 + 144);
            OUTLINED_FUNCTION_76_2(*(_QWORD *)(v0 + 184), v49);
            __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
            sub_1C03E39A4();
            v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
            v56(v52, v51, v54);
            v57 = __swift_getEnumTagSinglePayload(v50, 1, v55);
            v58 = *(_QWORD *)(v0 + 328);
            v59 = *(_QWORD *)(v0 + 152);
            v60 = *(_QWORD *)(v0 + 160);
            v61 = *(_QWORD *)(v0 + 144);
            if (v57 == 1)
            {
              v56(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
              v62 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v59 + 104))(v60, *MEMORY[0x1E0DA67D0], v61);
              OUTLINED_FUNCTION_154_0(v62, &qword_1ED738280);
              v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32);
            }
            else
            {
              (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
              v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 32);
              v63(v60, v58, v61);
            }
            v64 = *(_QWORD *)(v0 + 176);
            v65 = *(_QWORD *)(v0 + 184);
            v67 = *(_QWORD *)(v0 + 160);
            v66 = *(_QWORD *)(v0 + 168);
            v69 = *(_QWORD *)(v0 + 136);
            v68 = *(_QWORD *)(v0 + 144);
            v70 = v69 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDB48) + 48);
            v63(v69, v67, v68);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v70, v65, v66);
            v71 = *MEMORY[0x1E0DA6180];
            v72 = OUTLINED_FUNCTION_50_2();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 104))(v69, v71, v72);
            v12 = v0 + 16;
            goto LABEL_29;
          }
        }
        else
        {
          sub_1C03E2810(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 272));
          v38 = OUTLINED_FUNCTION_47_2();
          v40 = *(_QWORD *)(v0 + 280);
          v39 = *(_QWORD *)(v0 + 288);
          v41 = *(_QWORD *)(v0 + 272);
          if (v38 != 1)
          {
            v42 = *(_QWORD *)(v0 + 224);
            v44 = *(_QWORD *)(v0 + 200);
            v43 = *(_QWORD *)(v0 + 208);
            v45 = *(_QWORD *)(v0 + 192);
            OUTLINED_FUNCTION_133(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 32));
            OUTLINED_FUNCTION_54_3(&qword_1EF5FDB60, v46, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA7D50], MEMORY[0x1E0DA7D60]);
            v47 = OUTLINED_FUNCTION_26_5();
            v48 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
            v48(v43, v45);
            OUTLINED_FUNCTION_25_4(v40);
            OUTLINED_FUNCTION_25_4(v39);
            v48(v41, v45);
            OUTLINED_FUNCTION_25_4(v42);
            if ((v47 & 1) != 0)
              goto LABEL_23;
LABEL_24:
            v49 = (unsigned int *)MEMORY[0x1E0DA6840];
            goto LABEL_25;
          }
          OUTLINED_FUNCTION_57_1(*(_QWORD *)(v0 + 280));
          OUTLINED_FUNCTION_57_1(v39);
          OUTLINED_FUNCTION_41_3();
        }
        sub_1C03B579C(*(_QWORD *)(v0 + 224), &qword_1ED737DF8);
        goto LABEL_24;
      }
      EnumTagSinglePayload = *(_QWORD *)(v0 + 192);
      OUTLINED_FUNCTION_57_1(*(_QWORD *)(v0 + 304));
      OUTLINED_FUNCTION_57_1(v23);
      OUTLINED_FUNCTION_41_3();
      v21 = (_QWORD *)(v0 + 16);
    }
    sub_1C03B579C(*(_QWORD *)(v0 + 232), &qword_1ED737DF8);
    goto LABEL_15;
  }
  sub_1C03B579C((uint64_t)v1, &qword_1ED738228);
  v13 = *MEMORY[0x1E0DA6198];
  OUTLINED_FUNCTION_50_2();
  v14 = OUTLINED_FUNCTION_69_3();
  v15(v14, v13);
LABEL_30:
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_55();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_30();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_5_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C03E14BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  v4[21] = *v3;
  v5 = sub_1C03E3788();
  v4[22] = v5;
  v4[23] = *(_QWORD *)(v5 - 8);
  v4[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1C03E1528()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v13;
  NSObject *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;

  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 160) + 72);
  *(_QWORD *)(v1 + 200) = v2;
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(v2))
  {
    v4 = v3;
    v6 = *(_QWORD *)(v1 + 184);
    v5 = *(_QWORD *)(v1 + 192);
    v7 = *(_QWORD *)(v1 + 176);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x1E0DA5288], v7);
    swift_unknownObjectRetain();
    v9 = sub_1C03E377C();
    v11 = v10;
    *(_QWORD *)(v1 + 208) = v10;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    OUTLINED_FUNCTION_43_2(*(_QWORD *)(v4 + 16));
    v22 = v12;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 216) = v13;
    *v13 = v1;
    v13[1] = sub_1C03E1790;
    return v22(v1 + 16, *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 152), v9, v11, ObjectType, v4);
  }
  else
  {
    if (qword_1ED738B60 != -1)
      swift_once();
    v15 = *(NSObject **)(v1 + 160);
    v16 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED738B68);
    OUTLINED_FUNCTION_52_4();
    OUTLINED_FUNCTION_130();
    v17 = OUTLINED_FUNCTION_66();
    if (OUTLINED_FUNCTION_8_2(v17))
    {
      v18 = *(_QWORD *)(v1 + 160);
      v19 = (uint8_t *)OUTLINED_FUNCTION_16();
      v23 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v19 = 136315138;
      *(_QWORD *)(v1 + 104) = v18;
      swift_retain();
      v20 = sub_1C03E40A0();
      *(_QWORD *)(v1 + 112) = sub_1C03B934C(v20, v21, &v23);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15_1();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v15, v0, "%s: Statestore is not of type HintsStateStoreConsumer", v19);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_15_1();

    OUTLINED_FUNCTION_84_2();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_1C03E1790()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E17C8()
{
  os_log_type_t v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v2 = (_OWORD *)(v1 + 64);
  if (*(_QWORD *)(v1 + 40))
  {
    v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED737FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5FDBA8);
    v3 = swift_dynamicCast();
    if ((v3 & 1) != 0)
    {
      if (*(_QWORD *)(v1 + 88))
      {
        v4 = *(_QWORD *)(v1 + 136);
        swift_unknownObjectRelease();
        sub_1C03ABB70((__int128 *)(v1 + 64), v4);
        goto LABEL_12;
      }
    }
    else
    {
      *(_QWORD *)(v1 + 96) = 0;
      *v2 = 0u;
      *(_OWORD *)(v1 + 80) = 0u;
    }
  }
  else
  {
    sub_1C03B579C(v1 + 16, &qword_1ED738380);
    *v2 = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_QWORD *)(v1 + 96) = 0;
  }
  OUTLINED_FUNCTION_154_0(v3, &qword_1ED738228);
  if (qword_1ED738B60 != -1)
    swift_once();
  v5 = *(NSObject **)(v1 + 160);
  v6 = OUTLINED_FUNCTION_29();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED738B68);
  OUTLINED_FUNCTION_52_4();
  OUTLINED_FUNCTION_130();
  v7 = OUTLINED_FUNCTION_66();
  if (OUTLINED_FUNCTION_23_1(v7))
  {
    v8 = *(_QWORD *)(v1 + 160);
    v9 = (uint8_t *)OUTLINED_FUNCTION_16();
    v13 = OUTLINED_FUNCTION_16();
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v1 + 120) = v8;
    swift_retain();
    v10 = sub_1C03E40A0();
    *(_QWORD *)(v1 + 128) = sub_1C03B934C(v10, v11, &v13);
    sub_1C03E4238();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v5, v0, "%s: No SiriRequestState in the stateStore", v9);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_5_0();
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_15_1();

  OUTLINED_FUNCTION_84_2();
LABEL_12:
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t StatefulSuggestionsClient.suggestNext(interaction:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return OUTLINED_FUNCTION_5_2();
}

uint64_t sub_1C03E1A0C()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_21_6();
  OUTLINED_FUNCTION_68_2();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  OUTLINED_FUNCTION_6_8(v1);
  return OUTLINED_FUNCTION_5_7();
}

uint64_t sub_1C03E1A64()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E1A98()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_28_5((_QWORD *)(v0 + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_1C03E1AF8;
  return OUTLINED_FUNCTION_17_4();
}

uint64_t sub_1C03E1AF8()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E1B34()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return OUTLINED_FUNCTION_0_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t StatefulSuggestionsClient.getNextSuggestions(requestId:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_13_2(v0);
  v2 = OUTLINED_FUNCTION_6_8(v1);
  return OUTLINED_FUNCTION_18_5(v2, v3, v4);
}

uint64_t StatefulSuggestionsClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_13_2(v0);
  v2 = OUTLINED_FUNCTION_6_8(v1);
  return OUTLINED_FUNCTION_18_5(v2, v3, v4);
}

uint64_t StatefulSuggestionsClient.warmup()()
{
  uint64_t v0;

  return sub_1C03E2620(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t StatefulSuggestionsClient.submitAsync(for:propertyKey:propertyValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  v6 = sub_1C03E392C();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = OUTLINED_FUNCTION_27();
  v5[11] = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E1C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t (*v11)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t (*v24)(void);
  uint64_t (*v25)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v26;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v4(v1, *(_QWORD *)(v0 + 24), v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2) == *MEMORY[0x1E0DA55E8])
  {
    v5 = *(uint64_t **)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 72) + 96))(v5, *(_QWORD *)(v0 + 64));
    v7 = *v5;
    v8 = v5[1];
    *(_QWORD *)(v0 + 96) = v8;
    v9 = *(_QWORD *)(v6 + 80);
    ObjectType = swift_getObjectType();
    OUTLINED_FUNCTION_43_2(*(_QWORD *)(v9 + 16));
    v25 = v11;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v12;
    *v12 = v0;
    v12[1] = sub_1C03E1EE0;
    return v25(v7, v8, *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), ObjectType, v9);
  }
  else
  {
    if (qword_1ED738B60 != -1)
      swift_once();
    v14 = *(_QWORD *)(v0 + 80);
    v15 = *(_QWORD *)(v0 + 64);
    v16 = *(_QWORD *)(v0 + 24);
    v17 = OUTLINED_FUNCTION_29();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED738B68);
    v4(v14, v16, v15);
    v18 = sub_1C03E4010();
    v19 = sub_1C03E41FC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_16();
      v26 = OUTLINED_FUNCTION_16();
      *(_DWORD *)v20 = 136315138;
      OUTLINED_FUNCTION_54_3(&qword_1EF5FE118, v21, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA55F0], MEMORY[0x1E0DA55F8]);
      v22 = sub_1C03E43E8();
      *(_QWORD *)(v0 + 16) = sub_1C03B934C(v22, v23, &v26);
      sub_1C03E4238();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_42_3();
      OUTLINED_FUNCTION_20_2(&dword_1C03A5000, v18, v19, "Unsupported interationId type of %s", v20);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_5_0();
    }
    OUTLINED_FUNCTION_42_3();

    ((void (*)(_QWORD, _QWORD))(v0 + 24))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
    swift_task_dealloc();
    OUTLINED_FUNCTION_44();
    v24 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
    return OUTLINED_FUNCTION_15_5(v24);
  }
}

uint64_t sub_1C03E1EE0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1C03E1F18()
{
  uint64_t (*v0)(void);

  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0(v0);
}

uint64_t StatefulSuggestionsClient.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_unknownObjectRelease();
  return v0;
}

uint64_t StatefulSuggestionsClient.__deallocating_deinit()
{
  StatefulSuggestionsClient.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03E1F90()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E3728();
}

uint64_t sub_1C03E2028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.submitAsync(for:propertyKey:propertyValue:)(a1, a2, a3, a4);
}

uint64_t sub_1C03E20A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E371C();
}

uint64_t sub_1C03E2120()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return sub_1C03E3734();
}

uint64_t sub_1C03E2198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.logShown(for:deliveryVehicle:generationId:)(a1, a2, a3);
}

uint64_t sub_1C03E2200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.logEngagement(for:intent:)(a1, a2, a3);
}

uint64_t sub_1C03E2268()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.warmup()();
}

uint64_t sub_1C03E22AC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.getNextSuggestions(requestId:)();
}

uint64_t sub_1C03E2318()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AF788;
  return StatefulSuggestionsClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)();
}

uint64_t sub_1C03E2384()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C03AE3D8;
  return StatefulSuggestionsClient.refreshService()();
}

_QWORD *sub_1C03E23CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *result;
  __int128 v19[2];
  __int128 v20[2];
  __int128 v21[2];

  sub_1C03E2858(&qword_1ED738A30, 255, (uint64_t (*)(uint64_t))type metadata accessor for TurnProtectedHintsStateStore, (uint64_t)&unk_1C03E54BC);
  v12 = v11;
  sub_1C03E2858(&qword_1ED738A38, 255, (uint64_t (*)(uint64_t))type metadata accessor for TurnProtectedHintsStateStore, (uint64_t)&unk_1C03E54A0);
  v14 = v13;
  sub_1C03ABB30(a4, (uint64_t)v21);
  sub_1C03ABB30(a5, (uint64_t)v20);
  sub_1C03ABB30(a6, (uint64_t)v19);
  v15 = type metadata accessor for StateStoreInteractionBuilder();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = v14;
  sub_1C03ABB70(v21, v16 + 32);
  sub_1C03ABB70(v20, v16 + 72);
  sub_1C03ABB70(v19, v16 + 112);
  swift_unknownObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(a6);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  result = (_QWORD *)swift_allocObject();
  result[7] = v15;
  result[8] = &off_1E79B6068;
  result[2] = a1;
  result[3] = a2;
  result[4] = v16;
  result[9] = a3;
  result[10] = v12;
  return result;
}

uint64_t sub_1C03E2524()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03E2570(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;

  v9 = v1[2];
  v4 = v1[4];
  v8 = v1[3];
  v5 = swift_task_alloc();
  v6 = (_QWORD *)OUTLINED_FUNCTION_13_2(v5);
  *v6 = v2;
  v6[1] = sub_1C03AF788;
  return sub_1C03E0A98(a1, v9, v8, v4);
}

uint64_t sub_1C03E2620(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_1C03E2630()
{
  unint64_t result;

  result = qword_1EF5FE120[0];
  if (!qword_1EF5FE120[0])
  {
    result = MEMORY[0x1C3B99EA8]("5\a]'L2", &type metadata for StatefulSuggestionsClient.DefaultKeys);
    atomic_store(result, qword_1EF5FE120);
  }
  return result;
}

uint64_t type metadata accessor for StatefulSuggestionsClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for StatefulSuggestionsClient()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for StatefulSuggestionsClient.DefaultKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatefulSuggestionsClient.DefaultKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1C03E276C + 4 * byte_1C03E632F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1C03E27A0 + 4 * byte_1C03E632A[v4]))();
}

uint64_t sub_1C03E27A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03E27A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C03E27B0);
  return result;
}

uint64_t sub_1C03E27BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C03E27C4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1C03E27C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C03E27D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StatefulSuggestionsClient.DefaultKeys()
{
  return &type metadata for StatefulSuggestionsClient.DefaultKeys;
}

uint64_t sub_1C03E27EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C03E2810(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED738218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C03E2858(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x1C3B99EA8](a4, v6), a1);
  }
  OUTLINED_FUNCTION_7();
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_1C03E33EC();
}

uint64_t OUTLINED_FUNCTION_6_8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = v1;
  return v3;
}

uint64_t OUTLINED_FUNCTION_15_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_1C03E33A4();
}

uint64_t OUTLINED_FUNCTION_18_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return StatefulSuggestionsClient.suggestNext(requestId:)(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_21_6()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_22_6()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_25_4(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03B579C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return sub_1C03E407C();
}

_QWORD *OUTLINED_FUNCTION_28_5(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34_4(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return sub_1C03E39B0();
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

void OUTLINED_FUNCTION_40_4(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03B579C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_41_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_43_2@<X0>(uint64_t a1@<X8>)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_49_4()
{
  return sub_1C03E43F4();
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return sub_1C03E3C68();
}

uint64_t OUTLINED_FUNCTION_52_4()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_54_3(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  sub_1C03E2858(a1, 255, a3, a4);
}

uint64_t OUTLINED_FUNCTION_56_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C03E2810(v0, v1);
}

void OUTLINED_FUNCTION_57_1(uint64_t a1)
{
  uint64_t *v1;

  sub_1C03B579C(a1, v1);
}

void OUTLINED_FUNCTION_59_1()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_62_3(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

void OUTLINED_FUNCTION_68_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_76_2@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 104))(a1, *a2);
}

void OUTLINED_FUNCTION_77_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_1C03E2858(a1, 255, v4, a4);
}

uint64_t OUTLINED_FUNCTION_80_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_81_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_83_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C03E2810(v1, v0);
}

double OUTLINED_FUNCTION_84_2()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

uint64_t NewUUIDRequestIdProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t sub_1C03E2B54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1C03E302C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C03E3020();
  v4 = sub_1C03E3008();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t NewUUIDRequestIdProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1C03E2BFC()
{
  return sub_1C03E2B54();
}

uint64_t StaticRequestIdProvider.requestId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StaticRequestIdProvider.__allocating_init(requestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t StaticRequestIdProvider.init(requestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return OUTLINED_FUNCTION_0_9();
}

uint64_t StaticRequestIdProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StaticRequestIdProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1C03E2CC0()
{
  return StaticRequestIdProvider.requestId.getter();
}

uint64_t dispatch thunk of RequestIdProvider.requestId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for NewUUIDRequestIdProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for NewUUIDRequestIdProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NewUUIDRequestIdProvider.requestId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
}

uint64_t dispatch thunk of NewUUIDRequestIdProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for StaticRequestIdProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for StaticRequestIdProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StaticRequestIdProvider.__allocating_init(requestId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  uint64_t v0;

  return v0;
}

uint64_t String.fromBase64String<A>()@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = sub_1C03E2FCC();
  if (v5 >> 60 == 15)
  {
    v6 = 1;
  }
  else
  {
    v7 = v4;
    v8 = v5;
    sub_1C03E2F30();
    OUTLINED_FUNCTION_19();
    sub_1C03E2F24();
    v6 = 0;
    sub_1C03E2F18();
    OUTLINED_FUNCTION_1_1();
    sub_1C03B57D4(v7, v8);
  }
  return __swift_storeEnumTagSinglePayload(a2, v6, 1, a1);
}

Swift::String_optional __swiftcall Encodable.toBase64String()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Swift::String_optional result;

  sub_1C03E2F60();
  OUTLINED_FUNCTION_19();
  sub_1C03E2F54();
  v0 = sub_1C03E2F48();
  sub_1C03C5F08(v0, v1);
  v2 = sub_1C03E2FE4();
  v4 = v3;
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_7();
  v5 = v2;
  v6 = v4;
  result.value._object = v6;
  result.value._countAndFlagsBits = v5;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1C03B57E8(v0, v1);
}

uint64_t sub_1C03E2EF4()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1C03E2F00()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1C03E2F0C()
{
  return MEMORY[0x1E0CAF5C0]();
}

uint64_t sub_1C03E2F18()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1C03E2F24()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1C03E2F30()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1C03E2F3C()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_1C03E2F48()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1C03E2F54()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1C03E2F60()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1C03E2F6C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1C03E2F78()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1C03E2F84()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1C03E2F90()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1C03E2F9C()
{
  return MEMORY[0x1E0CAFE98]();
}

uint64_t sub_1C03E2FA8()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1C03E2FB4()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1C03E2FC0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1C03E2FCC()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1C03E2FD8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C03E2FE4()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1C03E2FF0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C03E2FFC()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1C03E3008()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C03E3014()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1C03E3020()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C03E302C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C03E3038()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1C03E3044()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1C03E3050()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1C03E305C()
{
  return MEMORY[0x1E0D9AA88]();
}

uint64_t sub_1C03E3068()
{
  return MEMORY[0x1E0D9AA98]();
}

uint64_t sub_1C03E3074()
{
  return MEMORY[0x1E0D9ACC8]();
}

uint64_t sub_1C03E3080()
{
  return MEMORY[0x1E0D9AE30]();
}

uint64_t sub_1C03E308C()
{
  return MEMORY[0x1E0D9AF20]();
}

uint64_t sub_1C03E3098()
{
  return MEMORY[0x1E0D9AF48]();
}

uint64_t sub_1C03E30A4()
{
  return MEMORY[0x1E0D9AF50]();
}

uint64_t sub_1C03E30B0()
{
  return MEMORY[0x1E0D9AF68]();
}

uint64_t sub_1C03E30BC()
{
  return MEMORY[0x1E0D9AF78]();
}

uint64_t sub_1C03E30C8()
{
  return MEMORY[0x1E0D9B570]();
}

uint64_t sub_1C03E30D4()
{
  return MEMORY[0x1E0D9B580]();
}

uint64_t sub_1C03E30E0()
{
  return MEMORY[0x1E0D9B5C0]();
}

uint64_t sub_1C03E30EC()
{
  return MEMORY[0x1E0D9B5F0]();
}

uint64_t sub_1C03E30F8()
{
  return MEMORY[0x1E0D9B5F8]();
}

uint64_t sub_1C03E3104()
{
  return MEMORY[0x1E0D9B9D0]();
}

uint64_t sub_1C03E3110()
{
  return MEMORY[0x1E0D9B9D8]();
}

uint64_t sub_1C03E311C()
{
  return MEMORY[0x1E0D9BA60]();
}

uint64_t sub_1C03E3128()
{
  return MEMORY[0x1E0D9BA78]();
}

uint64_t sub_1C03E3134()
{
  return MEMORY[0x1E0D9BBA8]();
}

uint64_t sub_1C03E3140()
{
  return MEMORY[0x1E0D9BBB0]();
}

uint64_t sub_1C03E314C()
{
  return MEMORY[0x1E0D9BC78]();
}

uint64_t sub_1C03E3158()
{
  return MEMORY[0x1E0D9BC80]();
}

uint64_t sub_1C03E3164()
{
  return MEMORY[0x1E0D9BD40]();
}

uint64_t sub_1C03E3170()
{
  return MEMORY[0x1E0D9BD48]();
}

uint64_t sub_1C03E317C()
{
  return MEMORY[0x1E0D9BD50]();
}

uint64_t sub_1C03E3188()
{
  return MEMORY[0x1E0D9C298]();
}

uint64_t sub_1C03E3194()
{
  return MEMORY[0x1E0D9C2B0]();
}

uint64_t sub_1C03E31A0()
{
  return MEMORY[0x1E0D9C2D0]();
}

uint64_t sub_1C03E31AC()
{
  return MEMORY[0x1E0D9C2D8]();
}

uint64_t sub_1C03E31B8()
{
  return MEMORY[0x1E0D9C2F0]();
}

uint64_t sub_1C03E31C4()
{
  return MEMORY[0x1E0D9C608]();
}

uint64_t sub_1C03E31D0()
{
  return MEMORY[0x1E0D9C610]();
}

uint64_t sub_1C03E31DC()
{
  return MEMORY[0x1E0D9C618]();
}

uint64_t sub_1C03E31E8()
{
  return MEMORY[0x1E0D9C698]();
}

uint64_t sub_1C03E31F4()
{
  return MEMORY[0x1E0D9C6B0]();
}

uint64_t sub_1C03E3200()
{
  return MEMORY[0x1E0D9C6F0]();
}

uint64_t sub_1C03E320C()
{
  return MEMORY[0x1E0D9C708]();
}

uint64_t sub_1C03E3218()
{
  return MEMORY[0x1E0D9F230]();
}

uint64_t sub_1C03E3224()
{
  return MEMORY[0x1E0D9F270]();
}

uint64_t sub_1C03E3230()
{
  return MEMORY[0x1E0D9F2B8]();
}

uint64_t sub_1C03E323C()
{
  return MEMORY[0x1E0D9F340]();
}

uint64_t sub_1C03E3248()
{
  return MEMORY[0x1E0D9F448]();
}

uint64_t sub_1C03E3254()
{
  return MEMORY[0x1E0D9F4B0]();
}

uint64_t sub_1C03E3260()
{
  return MEMORY[0x1E0D9F5C8]();
}

uint64_t sub_1C03E326C()
{
  return MEMORY[0x1E0D9F5E8]();
}

uint64_t sub_1C03E3278()
{
  return MEMORY[0x1E0D9F870]();
}

uint64_t sub_1C03E3284()
{
  return MEMORY[0x1E0D9F880]();
}

uint64_t sub_1C03E3290()
{
  return MEMORY[0x1E0D9F888]();
}

uint64_t sub_1C03E329C()
{
  return MEMORY[0x1E0D9F890]();
}

uint64_t sub_1C03E32A8()
{
  return MEMORY[0x1E0D9F938]();
}

uint64_t sub_1C03E32B4()
{
  return MEMORY[0x1E0DA0D88]();
}

uint64_t sub_1C03E32C0()
{
  return MEMORY[0x1E0DA12F8]();
}

uint64_t sub_1C03E32CC()
{
  return MEMORY[0x1E0DA1620]();
}

uint64_t sub_1C03E32D8()
{
  return MEMORY[0x1E0DA16A8]();
}

uint64_t sub_1C03E32E4()
{
  return MEMORY[0x1E0DA16D0]();
}

uint64_t sub_1C03E32F0()
{
  return MEMORY[0x1E0DA2718]();
}

uint64_t sub_1C03E32FC()
{
  return MEMORY[0x1E0DA2A48]();
}

uint64_t sub_1C03E3308()
{
  return MEMORY[0x1E0DA7D48]();
}

uint64_t sub_1C03E3314()
{
  return MEMORY[0x1E0DA7D50]();
}

uint64_t sub_1C03E3320()
{
  return MEMORY[0x1E0DA7D78]();
}

uint64_t sub_1C03E332C()
{
  return MEMORY[0x1E0DA7D80]();
}

uint64_t sub_1C03E3338()
{
  return MEMORY[0x1E0DA7D98]();
}

uint64_t sub_1C03E3344()
{
  return MEMORY[0x1E0DA4B90]();
}

uint64_t sub_1C03E3350()
{
  return MEMORY[0x1E0DA4BA8]();
}

uint64_t sub_1C03E335C()
{
  return MEMORY[0x1E0DA4BB0]();
}

uint64_t sub_1C03E3368()
{
  return MEMORY[0x1E0DA4BB8]();
}

uint64_t sub_1C03E3374()
{
  return MEMORY[0x1E0DA4BC0]();
}

uint64_t sub_1C03E3380()
{
  return MEMORY[0x1E0DA4BC8]();
}

uint64_t sub_1C03E338C()
{
  return MEMORY[0x1E0DA4BD0]();
}

uint64_t sub_1C03E3398()
{
  return MEMORY[0x1E0DA4BE0]();
}

uint64_t sub_1C03E33A4()
{
  return MEMORY[0x1E0DA4BF8]();
}

uint64_t sub_1C03E33B0()
{
  return MEMORY[0x1E0DA4C08]();
}

uint64_t sub_1C03E33BC()
{
  return MEMORY[0x1E0DA4C18]();
}

uint64_t sub_1C03E33C8()
{
  return MEMORY[0x1E0DA4C28]();
}

uint64_t sub_1C03E33D4()
{
  return MEMORY[0x1E0DA4C40]();
}

uint64_t sub_1C03E33E0()
{
  return MEMORY[0x1E0DA4C50]();
}

uint64_t sub_1C03E33EC()
{
  return MEMORY[0x1E0DA4C60]();
}

uint64_t sub_1C03E33F8()
{
  return MEMORY[0x1E0DA4C70]();
}

uint64_t sub_1C03E3404()
{
  return MEMORY[0x1E0D97FB0]();
}

uint64_t sub_1C03E3410()
{
  return MEMORY[0x1E0D97FC0]();
}

uint64_t sub_1C03E341C()
{
  return MEMORY[0x1E0D97FC8]();
}

uint64_t sub_1C03E3428()
{
  return MEMORY[0x1E0D97FD0]();
}

uint64_t sub_1C03E3434()
{
  return MEMORY[0x1E0D97FD8]();
}

uint64_t sub_1C03E3440()
{
  return MEMORY[0x1E0D97FE0]();
}

uint64_t sub_1C03E344C()
{
  return MEMORY[0x1E0D98068]();
}

uint64_t sub_1C03E3458()
{
  return MEMORY[0x1E0D98070]();
}

uint64_t sub_1C03E3464()
{
  return MEMORY[0x1E0D98078]();
}

uint64_t sub_1C03E3470()
{
  return MEMORY[0x1E0D98088]();
}

uint64_t sub_1C03E347C()
{
  return MEMORY[0x1E0D98098]();
}

uint64_t sub_1C03E3488()
{
  return MEMORY[0x1E0D98168]();
}

uint64_t sub_1C03E3494()
{
  return MEMORY[0x1E0D98178]();
}

uint64_t sub_1C03E34A0()
{
  return MEMORY[0x1E0D98180]();
}

uint64_t sub_1C03E34AC()
{
  return MEMORY[0x1E0D98188]();
}

uint64_t sub_1C03E34B8()
{
  return MEMORY[0x1E0DA4C90]();
}

uint64_t sub_1C03E34C4()
{
  return MEMORY[0x1E0DA4CA0]();
}

uint64_t sub_1C03E34D0()
{
  return MEMORY[0x1E0DA4CB0]();
}

uint64_t sub_1C03E34DC()
{
  return MEMORY[0x1E0DA4CC0]();
}

uint64_t sub_1C03E34E8()
{
  return MEMORY[0x1E0DA4CD0]();
}

uint64_t sub_1C03E34F4()
{
  return MEMORY[0x1E0DA4CE0]();
}

uint64_t sub_1C03E3500()
{
  return MEMORY[0x1E0DA4CF0]();
}

uint64_t sub_1C03E350C()
{
  return MEMORY[0x1E0DA4D00]();
}

uint64_t sub_1C03E3518()
{
  return MEMORY[0x1E0DA4D68]();
}

uint64_t sub_1C03E3524()
{
  return MEMORY[0x1E0DA4D78]();
}

uint64_t sub_1C03E3530()
{
  return MEMORY[0x1E0DA4DB8]();
}

uint64_t sub_1C03E353C()
{
  return MEMORY[0x1E0DA4DC0]();
}

uint64_t sub_1C03E3548()
{
  return MEMORY[0x1E0DA4DC8]();
}

uint64_t sub_1C03E3554()
{
  return MEMORY[0x1E0DA4DD0]();
}

uint64_t sub_1C03E3560()
{
  return MEMORY[0x1E0DA4DD8]();
}

uint64_t sub_1C03E356C()
{
  return MEMORY[0x1E0DA4DE0]();
}

uint64_t sub_1C03E3578()
{
  return MEMORY[0x1E0DA4DE8]();
}

uint64_t sub_1C03E3584()
{
  return MEMORY[0x1E0DA4DF0]();
}

uint64_t sub_1C03E3590()
{
  return MEMORY[0x1E0DA4DF8]();
}

uint64_t sub_1C03E359C()
{
  return MEMORY[0x1E0DA4E00]();
}

uint64_t sub_1C03E35A8()
{
  return MEMORY[0x1E0DA4E08]();
}

uint64_t sub_1C03E35B4()
{
  return MEMORY[0x1E0DA4E10]();
}

uint64_t sub_1C03E35C0()
{
  return MEMORY[0x1E0DA4E88]();
}

uint64_t sub_1C03E35CC()
{
  return MEMORY[0x1E0DA4E90]();
}

uint64_t sub_1C03E35D8()
{
  return MEMORY[0x1E0DA4EC0]();
}

uint64_t sub_1C03E35E4()
{
  return MEMORY[0x1E0DA4EC8]();
}

uint64_t sub_1C03E35F0()
{
  return MEMORY[0x1E0DA4ED0]();
}

uint64_t sub_1C03E35FC()
{
  return MEMORY[0x1E0DA4ED8]();
}

uint64_t sub_1C03E3608()
{
  return MEMORY[0x1E0DA4EE0]();
}

uint64_t sub_1C03E3614()
{
  return MEMORY[0x1E0DA4EE8]();
}

uint64_t sub_1C03E3620()
{
  return MEMORY[0x1E0DA4EF0]();
}

uint64_t sub_1C03E362C()
{
  return MEMORY[0x1E0DA4EF8]();
}

uint64_t sub_1C03E3638()
{
  return MEMORY[0x1E0DA4F00]();
}

uint64_t sub_1C03E3644()
{
  return MEMORY[0x1E0DA4F08]();
}

uint64_t sub_1C03E3650()
{
  return MEMORY[0x1E0DA4F10]();
}

uint64_t sub_1C03E365C()
{
  return MEMORY[0x1E0DA4F18]();
}

uint64_t sub_1C03E3668()
{
  return MEMORY[0x1E0DA4F20]();
}

uint64_t sub_1C03E3674()
{
  return MEMORY[0x1E0DA4F28]();
}

uint64_t sub_1C03E3680()
{
  return MEMORY[0x1E0DA4F30]();
}

uint64_t sub_1C03E368C()
{
  return MEMORY[0x1E0DA4F88]();
}

uint64_t sub_1C03E3698()
{
  return MEMORY[0x1E0DA4F90]();
}

uint64_t sub_1C03E36A4()
{
  return MEMORY[0x1E0DA4F98]();
}

uint64_t sub_1C03E36B0()
{
  return MEMORY[0x1E0DA4FB0]();
}

uint64_t sub_1C03E36BC()
{
  return MEMORY[0x1E0DA4FC0]();
}

uint64_t sub_1C03E36C8()
{
  return MEMORY[0x1E0DA4FC8]();
}

uint64_t sub_1C03E36D4()
{
  return MEMORY[0x1E0DA4FD8]();
}

uint64_t sub_1C03E36E0()
{
  return MEMORY[0x1E0DA4FE8]();
}

uint64_t sub_1C03E36EC()
{
  return MEMORY[0x1E0DA5008]();
}

uint64_t sub_1C03E36F8()
{
  return MEMORY[0x1E0DA5028]();
}

uint64_t sub_1C03E3704()
{
  return MEMORY[0x1E0DA5030]();
}

uint64_t sub_1C03E3710()
{
  return MEMORY[0x1E0DA5038]();
}

uint64_t sub_1C03E371C()
{
  return MEMORY[0x1E0DA5040]();
}

uint64_t sub_1C03E3728()
{
  return MEMORY[0x1E0DA5050]();
}

uint64_t sub_1C03E3734()
{
  return MEMORY[0x1E0DA5070]();
}

uint64_t sub_1C03E3740()
{
  return MEMORY[0x1E0DA5080]();
}

uint64_t sub_1C03E374C()
{
  return MEMORY[0x1E0DA5088]();
}

uint64_t sub_1C03E3758()
{
  return MEMORY[0x1E0DA5250]();
}

uint64_t sub_1C03E3764()
{
  return MEMORY[0x1E0DA5270]();
}

uint64_t sub_1C03E3770()
{
  return MEMORY[0x1E0DA5280]();
}

uint64_t sub_1C03E377C()
{
  return MEMORY[0x1E0DA5290]();
}

uint64_t sub_1C03E3788()
{
  return MEMORY[0x1E0DA5298]();
}

uint64_t sub_1C03E3794()
{
  return MEMORY[0x1E0DA52A0]();
}

uint64_t sub_1C03E37A0()
{
  return MEMORY[0x1E0DA52A8]();
}

uint64_t sub_1C03E37AC()
{
  return MEMORY[0x1E0DA52B0]();
}

uint64_t sub_1C03E37B8()
{
  return MEMORY[0x1E0DA52B8]();
}

uint64_t sub_1C03E37C4()
{
  return MEMORY[0x1E0DA52C0]();
}

uint64_t sub_1C03E37D0()
{
  return MEMORY[0x1E0DA52D0]();
}

uint64_t sub_1C03E37DC()
{
  return MEMORY[0x1E0DA5340]();
}

uint64_t sub_1C03E37E8()
{
  return MEMORY[0x1E0DA5348]();
}

uint64_t sub_1C03E37F4()
{
  return MEMORY[0x1E0DA5378]();
}

uint64_t sub_1C03E3800()
{
  return MEMORY[0x1E0DA5380]();
}

uint64_t sub_1C03E380C()
{
  return MEMORY[0x1E0DA5388]();
}

uint64_t sub_1C03E3818()
{
  return MEMORY[0x1E0DA5390]();
}

uint64_t sub_1C03E3824()
{
  return MEMORY[0x1E0DA5490]();
}

uint64_t sub_1C03E3830()
{
  return MEMORY[0x1E0DA54A0]();
}

uint64_t sub_1C03E383C()
{
  return MEMORY[0x1E0DA54C8]();
}

uint64_t sub_1C03E3848()
{
  return MEMORY[0x1E0DA54D8]();
}

uint64_t sub_1C03E3854()
{
  return MEMORY[0x1E0DA54E0]();
}

uint64_t sub_1C03E3860()
{
  return MEMORY[0x1E0DA54F0]();
}

uint64_t sub_1C03E386C()
{
  return MEMORY[0x1E0DA54F8]();
}

uint64_t sub_1C03E3878()
{
  return MEMORY[0x1E0DA5500]();
}

uint64_t sub_1C03E3884()
{
  return MEMORY[0x1E0DA5508]();
}

uint64_t sub_1C03E3890()
{
  return MEMORY[0x1E0DA5510]();
}

uint64_t sub_1C03E389C()
{
  return MEMORY[0x1E0DA5518]();
}

uint64_t sub_1C03E38A8()
{
  return MEMORY[0x1E0DA5520]();
}

uint64_t sub_1C03E38B4()
{
  return MEMORY[0x1E0DA5528]();
}

uint64_t sub_1C03E38C0()
{
  return MEMORY[0x1E0DA5550]();
}

uint64_t sub_1C03E38CC()
{
  return MEMORY[0x1E0DA5560]();
}

uint64_t sub_1C03E38D8()
{
  return MEMORY[0x1E0DA5590]();
}

uint64_t sub_1C03E38E4()
{
  return MEMORY[0x1E0DA5598]();
}

uint64_t sub_1C03E38F0()
{
  return MEMORY[0x1E0DA55A0]();
}

uint64_t sub_1C03E38FC()
{
  return MEMORY[0x1E0DA55A8]();
}

uint64_t sub_1C03E3908()
{
  return MEMORY[0x1E0DA55B0]();
}

uint64_t sub_1C03E3914()
{
  return MEMORY[0x1E0DA55B8]();
}

uint64_t sub_1C03E3920()
{
  return MEMORY[0x1E0DA55D8]();
}

uint64_t sub_1C03E392C()
{
  return MEMORY[0x1E0DA55F0]();
}

uint64_t sub_1C03E3938()
{
  return MEMORY[0x1E0DA5628]();
}

uint64_t sub_1C03E3944()
{
  return MEMORY[0x1E0DA5680]();
}

uint64_t sub_1C03E3950()
{
  return MEMORY[0x1E0DA5A38]();
}

uint64_t sub_1C03E395C()
{
  return MEMORY[0x1E0DA5A48]();
}

uint64_t sub_1C03E3968()
{
  return MEMORY[0x1E0DA5A68]();
}

uint64_t sub_1C03E3974()
{
  return MEMORY[0x1E0DA5A78]();
}

uint64_t sub_1C03E3980()
{
  return MEMORY[0x1E0DA5A88]();
}

uint64_t sub_1C03E398C()
{
  return MEMORY[0x1E0DA5A90]();
}

uint64_t sub_1C03E3998()
{
  return MEMORY[0x1E0DA5AA8]();
}

uint64_t sub_1C03E39A4()
{
  return MEMORY[0x1E0DA5AE0]();
}

uint64_t sub_1C03E39B0()
{
  return MEMORY[0x1E0DA5AE8]();
}

uint64_t sub_1C03E39BC()
{
  return MEMORY[0x1E0DA5AF0]();
}

uint64_t sub_1C03E39C8()
{
  return MEMORY[0x1E0DA5B00]();
}

uint64_t sub_1C03E39D4()
{
  return MEMORY[0x1E0DA5B68]();
}

uint64_t sub_1C03E39E0()
{
  return MEMORY[0x1E0DA56A0]();
}

uint64_t sub_1C03E39EC()
{
  return MEMORY[0x1E0DA56A8]();
}

uint64_t sub_1C03E39F8()
{
  return MEMORY[0x1E0DA56B8]();
}

uint64_t sub_1C03E3A04()
{
  return MEMORY[0x1E0DA56C8]();
}

uint64_t sub_1C03E3A10()
{
  return MEMORY[0x1E0DA56D0]();
}

uint64_t sub_1C03E3A1C()
{
  return MEMORY[0x1E0DA56D8]();
}

uint64_t sub_1C03E3A28()
{
  return MEMORY[0x1E0DA56E0]();
}

uint64_t sub_1C03E3A34()
{
  return MEMORY[0x1E0DA5710]();
}

uint64_t sub_1C03E3A40()
{
  return MEMORY[0x1E0DA5730]();
}

uint64_t sub_1C03E3A4C()
{
  return MEMORY[0x1E0DA5738]();
}

uint64_t sub_1C03E3A58()
{
  return MEMORY[0x1E0DA5740]();
}

uint64_t sub_1C03E3A64()
{
  return MEMORY[0x1E0DA5748]();
}

uint64_t sub_1C03E3A70()
{
  return MEMORY[0x1E0DA5750]();
}

uint64_t sub_1C03E3A7C()
{
  return MEMORY[0x1E0DA5760]();
}

uint64_t sub_1C03E3A88()
{
  return MEMORY[0x1E0DA5770]();
}

uint64_t sub_1C03E3A94()
{
  return MEMORY[0x1E0DA5778]();
}

uint64_t sub_1C03E3AA0()
{
  return MEMORY[0x1E0DA5788]();
}

uint64_t sub_1C03E3AAC()
{
  return MEMORY[0x1E0DA5790]();
}

uint64_t sub_1C03E3AB8()
{
  return MEMORY[0x1E0DA5798]();
}

uint64_t sub_1C03E3AC4()
{
  return MEMORY[0x1E0DA57A0]();
}

uint64_t sub_1C03E3AD0()
{
  return MEMORY[0x1E0DA57A8]();
}

uint64_t sub_1C03E3ADC()
{
  return MEMORY[0x1E0DA57D0]();
}

uint64_t sub_1C03E3AE8()
{
  return MEMORY[0x1E0DA57D8]();
}

uint64_t sub_1C03E3AF4()
{
  return MEMORY[0x1E0DA57E0]();
}

uint64_t sub_1C03E3B00()
{
  return MEMORY[0x1E0DA57F0]();
}

uint64_t sub_1C03E3B0C()
{
  return MEMORY[0x1E0DA57F8]();
}

uint64_t sub_1C03E3B18()
{
  return MEMORY[0x1E0DA5848]();
}

uint64_t sub_1C03E3B24()
{
  return MEMORY[0x1E0DA5880]();
}

uint64_t sub_1C03E3B30()
{
  return MEMORY[0x1E0DA5898]();
}

uint64_t sub_1C03E3B3C()
{
  return MEMORY[0x1E0DA58B8]();
}

uint64_t sub_1C03E3B48()
{
  return MEMORY[0x1E0DA5BA0]();
}

uint64_t sub_1C03E3B54()
{
  return MEMORY[0x1E0DA5C08]();
}

uint64_t sub_1C03E3B60()
{
  return MEMORY[0x1E0DA5C38]();
}

uint64_t sub_1C03E3B6C()
{
  return MEMORY[0x1E0DA5C48]();
}

uint64_t sub_1C03E3B78()
{
  return MEMORY[0x1E0DA5C80]();
}

uint64_t sub_1C03E3B84()
{
  return MEMORY[0x1E0DA5D28]();
}

uint64_t sub_1C03E3B90()
{
  return MEMORY[0x1E0DA5DC0]();
}

uint64_t sub_1C03E3B9C()
{
  return MEMORY[0x1E0DA5E98]();
}

uint64_t sub_1C03E3BA8()
{
  return MEMORY[0x1E0DA5EA8]();
}

uint64_t sub_1C03E3BB4()
{
  return MEMORY[0x1E0DA5EB0]();
}

uint64_t sub_1C03E3BC0()
{
  return MEMORY[0x1E0DA5F30]();
}

uint64_t sub_1C03E3BCC()
{
  return MEMORY[0x1E0DA5F70]();
}

uint64_t sub_1C03E3BD8()
{
  return MEMORY[0x1E0DA5F78]();
}

uint64_t sub_1C03E3BE4()
{
  return MEMORY[0x1E0DA5F80]();
}

uint64_t sub_1C03E3BF0()
{
  return MEMORY[0x1E0DA5F88]();
}

uint64_t sub_1C03E3BFC()
{
  return MEMORY[0x1E0DA5F90]();
}

uint64_t sub_1C03E3C08()
{
  return MEMORY[0x1E0DA5F98]();
}

uint64_t sub_1C03E3C14()
{
  return MEMORY[0x1E0DA5FA0]();
}

uint64_t sub_1C03E3C20()
{
  return MEMORY[0x1E0DA5FC0]();
}

uint64_t sub_1C03E3C2C()
{
  return MEMORY[0x1E0DA6090]();
}

uint64_t sub_1C03E3C38()
{
  return MEMORY[0x1E0DA60A0]();
}

uint64_t sub_1C03E3C44()
{
  return MEMORY[0x1E0DA6100]();
}

uint64_t sub_1C03E3C50()
{
  return MEMORY[0x1E0DA6108]();
}

uint64_t sub_1C03E3C5C()
{
  return MEMORY[0x1E0DA6170]();
}

uint64_t sub_1C03E3C68()
{
  return MEMORY[0x1E0DA61A8]();
}

uint64_t sub_1C03E3C74()
{
  return MEMORY[0x1E0DA6208]();
}

uint64_t sub_1C03E3C80()
{
  return MEMORY[0x1E0DA6238]();
}

uint64_t sub_1C03E3C8C()
{
  return MEMORY[0x1E0DA6258]();
}

uint64_t sub_1C03E3C98()
{
  return MEMORY[0x1E0DA62A0]();
}

uint64_t sub_1C03E3CA4()
{
  return MEMORY[0x1E0DA6300]();
}

uint64_t sub_1C03E3CB0()
{
  return MEMORY[0x1E0DA6350]();
}

uint64_t sub_1C03E3CBC()
{
  return MEMORY[0x1E0DA6370]();
}

uint64_t sub_1C03E3CC8()
{
  return MEMORY[0x1E0DA6380]();
}

uint64_t sub_1C03E3CD4()
{
  return MEMORY[0x1E0DA6390]();
}

uint64_t sub_1C03E3CE0()
{
  return MEMORY[0x1E0DA6398]();
}

uint64_t sub_1C03E3CEC()
{
  return MEMORY[0x1E0DA63A0]();
}

uint64_t sub_1C03E3CF8()
{
  return MEMORY[0x1E0DA63A8]();
}

uint64_t sub_1C03E3D04()
{
  return MEMORY[0x1E0DA6570]();
}

uint64_t sub_1C03E3D10()
{
  return MEMORY[0x1E0DA6630]();
}

uint64_t sub_1C03E3D1C()
{
  return MEMORY[0x1E0DA6638]();
}

uint64_t sub_1C03E3D28()
{
  return MEMORY[0x1E0DA6658]();
}

uint64_t sub_1C03E3D34()
{
  return MEMORY[0x1E0DA6690]();
}

uint64_t sub_1C03E3D40()
{
  return MEMORY[0x1E0DA66A0]();
}

uint64_t sub_1C03E3D4C()
{
  return MEMORY[0x1E0DA66E0]();
}

uint64_t sub_1C03E3D58()
{
  return MEMORY[0x1E0DA66E8]();
}

uint64_t sub_1C03E3D64()
{
  return MEMORY[0x1E0DA6768]();
}

uint64_t sub_1C03E3D70()
{
  return MEMORY[0x1E0DA67E0]();
}

uint64_t sub_1C03E3D7C()
{
  return MEMORY[0x1E0DA6850]();
}

uint64_t sub_1C03E3D88()
{
  return MEMORY[0x1E0DA68E0]();
}

uint64_t sub_1C03E3D94()
{
  return MEMORY[0x1E0DA6A50]();
}

uint64_t sub_1C03E3DA0()
{
  return MEMORY[0x1E0DA6A58]();
}

uint64_t sub_1C03E3DAC()
{
  return MEMORY[0x1E0DA6A60]();
}

uint64_t sub_1C03E3DB8()
{
  return MEMORY[0x1E0DA6A78]();
}

uint64_t sub_1C03E3DC4()
{
  return MEMORY[0x1E0DA6AD0]();
}

uint64_t sub_1C03E3DD0()
{
  return MEMORY[0x1E0DA6AE0]();
}

uint64_t sub_1C03E3DDC()
{
  return MEMORY[0x1E0DA6BF8]();
}

uint64_t sub_1C03E3DE8()
{
  return MEMORY[0x1E0DA6C90]();
}

uint64_t sub_1C03E3DF4()
{
  return MEMORY[0x1E0DA6C98]();
}

uint64_t sub_1C03E3E00()
{
  return MEMORY[0x1E0DA6CD0]();
}

uint64_t sub_1C03E3E0C()
{
  return MEMORY[0x1E0DA6D18]();
}

uint64_t sub_1C03E3E18()
{
  return MEMORY[0x1E0DA6D20]();
}

uint64_t sub_1C03E3E24()
{
  return MEMORY[0x1E0DA6D30]();
}

uint64_t sub_1C03E3E30()
{
  return MEMORY[0x1E0DA6E78]();
}

uint64_t sub_1C03E3E3C()
{
  return MEMORY[0x1E0DA6E98]();
}

uint64_t sub_1C03E3E48()
{
  return MEMORY[0x1E0DA6EA8]();
}

uint64_t sub_1C03E3E54()
{
  return MEMORY[0x1E0DA6EB8]();
}

uint64_t sub_1C03E3E60()
{
  return MEMORY[0x1E0DA6EC8]();
}

uint64_t sub_1C03E3E6C()
{
  return MEMORY[0x1E0DA6ED8]();
}

uint64_t sub_1C03E3E78()
{
  return MEMORY[0x1E0DA6EE8]();
}

uint64_t sub_1C03E3E84()
{
  return MEMORY[0x1E0DA7250]();
}

uint64_t sub_1C03E3E90()
{
  return MEMORY[0x1E0DA7268]();
}

uint64_t sub_1C03E3E9C()
{
  return MEMORY[0x1E0DA7280]();
}

uint64_t sub_1C03E3EA8()
{
  return MEMORY[0x1E0DA7288]();
}

uint64_t sub_1C03E3EB4()
{
  return MEMORY[0x1E0DA72B0]();
}

uint64_t sub_1C03E3EC0()
{
  return MEMORY[0x1E0DA72D0]();
}

uint64_t sub_1C03E3ECC()
{
  return MEMORY[0x1E0DA7320]();
}

uint64_t sub_1C03E3ED8()
{
  return MEMORY[0x1E0DA7330]();
}

uint64_t sub_1C03E3EE4()
{
  return MEMORY[0x1E0DA7338]();
}

uint64_t sub_1C03E3EF0()
{
  return MEMORY[0x1E0DA7340]();
}

uint64_t sub_1C03E3EFC()
{
  return MEMORY[0x1E0DA7370]();
}

uint64_t sub_1C03E3F08()
{
  return MEMORY[0x1E0DA7380]();
}

uint64_t sub_1C03E3F14()
{
  return MEMORY[0x1E0DA7388]();
}

uint64_t sub_1C03E3F20()
{
  return MEMORY[0x1E0DA73D0]();
}

uint64_t sub_1C03E3F2C()
{
  return MEMORY[0x1E0DA7400]();
}

uint64_t sub_1C03E3F38()
{
  return MEMORY[0x1E0DA7420]();
}

uint64_t sub_1C03E3F44()
{
  return MEMORY[0x1E0DA7428]();
}

uint64_t sub_1C03E3F50()
{
  return MEMORY[0x1E0DA7430]();
}

uint64_t sub_1C03E3F5C()
{
  return MEMORY[0x1E0DA7448]();
}

uint64_t sub_1C03E3F68()
{
  return MEMORY[0x1E0DA7450]();
}

uint64_t sub_1C03E3F74()
{
  return MEMORY[0x1E0DA7470]();
}

uint64_t sub_1C03E3F80()
{
  return MEMORY[0x1E0DA7490]();
}

uint64_t sub_1C03E3F8C()
{
  return MEMORY[0x1E0DA74C8]();
}

uint64_t sub_1C03E3F98()
{
  return MEMORY[0x1E0DA7630]();
}

uint64_t sub_1C03E3FA4()
{
  return MEMORY[0x1E0DA7648]();
}

uint64_t sub_1C03E3FB0()
{
  return MEMORY[0x1E0DA7660]();
}

uint64_t sub_1C03E3FBC()
{
  return MEMORY[0x1E0D98868]();
}

uint64_t sub_1C03E3FC8()
{
  return MEMORY[0x1E0D98878]();
}

uint64_t sub_1C03E3FD4()
{
  return MEMORY[0x1E0D3E710]();
}

uint64_t sub_1C03E3FE0()
{
  return MEMORY[0x1E0D3E718]();
}

uint64_t sub_1C03E3FEC()
{
  return MEMORY[0x1E0D3E720]();
}

uint64_t sub_1C03E3FF8()
{
  return MEMORY[0x1E0D3E740]();
}

uint64_t sub_1C03E4004()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C03E4010()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C03E401C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C03E4028()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C03E4034()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C03E4040()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1C03E404C()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C03E4058()
{
  return MEMORY[0x1E0DE9FF8]();
}

uint64_t sub_1C03E4064()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1C03E4070()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t sub_1C03E407C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C03E4088()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C03E4094()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C03E40A0()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C03E40AC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1C03E40B8()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1C03E40C4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C03E40D0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C03E40DC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C03E40E8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C03E40F4()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1C03E4100()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C03E410C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C03E4118()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C03E4124()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C03E4130()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C03E413C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C03E4148()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1C03E4154()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C03E4160()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C03E416C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1C03E4178()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1C03E4184()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C03E4190()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C03E419C()
{
  return MEMORY[0x1E0DF0958]();
}

uint64_t sub_1C03E41A8()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_1C03E41B4()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_1C03E41C0()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_1C03E41CC()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_1C03E41D8()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_1C03E41E4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C03E41F0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C03E41FC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C03E4208()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C03E4214()
{
  return MEMORY[0x1E0D9C7F0]();
}

uint64_t sub_1C03E4220()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1C03E422C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C03E4238()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C03E4244()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C03E4250()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1C03E425C()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1C03E4268()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C03E4274()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C03E4280()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1C03E428C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1C03E4298()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C03E42A4()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1C03E42B0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C03E42BC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1C03E42C8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C03E42D4()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C03E42E0()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C03E42EC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C03E42F8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C03E4304()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C03E4310()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C03E431C()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1C03E4328()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1C03E4334()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C03E4340()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C03E434C()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1C03E4358()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C03E4364()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C03E4370()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C03E437C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C03E4388()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C03E4394()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1C03E43A0()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1C03E43AC()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C03E43B8()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1C03E43C4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C03E43D0()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1C03E43DC()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1C03E43E8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C03E43F4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C03E4400()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1C03E440C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1C03E4418()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C03E4424()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C03E4430()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C03E443C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C03E4448()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C03E4454()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C03E4460()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C03E446C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C03E4478()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C03E4484()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C03E4490()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C03E449C()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C03E44A8()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1C03E44B4()
{
  return MEMORY[0x1E0DEE978]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

