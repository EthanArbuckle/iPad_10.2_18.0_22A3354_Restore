uint64_t sub_1DBE39D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  if (qword_1EDB03E68 != -1)
    swift_once();
  type metadata accessor for WidgetTimelineTelemetryManager.SerialActor();
  sub_1DBDCC378(&qword_1EDB03E70, (uint64_t (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor, (uint64_t)&unk_1DBE5AFF0);
  sub_1DBE4A994();
  return swift_task_switch();
}

uint64_t sub_1DBE39DD4()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_1DBE39E28;
  return sub_1DBE3A888(v0[3], v0[4]);
}

uint64_t sub_1DBE39E28()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_2_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t WidgetTimelineTelemetryManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t WidgetTimelineTelemetryManager.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_1DBE39E94()
{
  WidgetTimelineTelemetryManager.start()();
}

uint64_t sub_1DBE39EB4(uint64_t a1, uint64_t a2)
{
  return WidgetTimelineTelemetryManager.finish(_:)(a1, a2);
}

uint64_t sub_1DBE39ED4(__int128 *a1, __int128 *a2, double a3)
{
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v4 = v3;
  v6 = sub_1DBE4AA30();
  v25 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_16();
  v9 = v8 - v7;
  sub_1DBE4AA24();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_16();
  sub_1DBE4A88C();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_16();
  v12 = sub_1DBE49AE8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_16();
  v16 = v15 - v14;
  swift_defaultActor_initialize();
  sub_1DBE49ADC();
  v17 = sub_1DBE49AD0();
  v19 = v18;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  *(_QWORD *)(v4 + 112) = v17;
  *(_QWORD *)(v4 + 120) = v19;
  sub_1DBDCC340(0, (unint64_t *)&qword_1EDB05278);
  sub_1DBE4A874();
  sub_1DBDCC378((unint64_t *)&qword_1EDB04AF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  OUTLINED_FUNCTION_57();
  sub_1DBDCC46C((unint64_t *)&qword_1EDB04AD0, &qword_1EDB04AC8);
  sub_1DBE4AB38();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v25 + 104))(v9, *MEMORY[0x1E0DEF8D0], v26);
  *(_QWORD *)(v4 + 216) = sub_1DBE4AA54();
  v20 = v4 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  v21 = OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_31_1(v20, v22, v23, v21);
  *(_QWORD *)(v4 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = 0;
  sub_1DBDC9658(a1, v4 + 128);
  sub_1DBDC9658(a2, v4 + 168);
  *(double *)(v4 + 208) = a3;
  return v4;
}

uint64_t type metadata accessor for WidgetTimelineTelemetryManager.SerialActor()
{
  return objc_opt_self();
}

uint64_t sub_1DBE3A14C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DBE3A178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  v4 = OUTLINED_FUNCTION_42(v3);
  return sub_1DBE39AFC(v4, v5, v6, v2);
}

uint64_t sub_1DBE3A1D4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_2_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DBE3A208()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DBE3A244()
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

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  v6 = OUTLINED_FUNCTION_42(v5);
  return sub_1DBE39D2C(v6, v7, v8, v2, v3, v4);
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManagerType.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManagerType.finish(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for WidgetTimelineTelemetryManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for WidgetTimelineTelemetryManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WidgetTimelineTelemetryManager.__allocating_init(flushManager:coordinator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1DBE3A2F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1[14] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04800);
  v1[15] = OUTLINED_FUNCTION_15_15();
  v1[16] = OUTLINED_FUNCTION_17_12();
  v1[17] = OUTLINED_FUNCTION_17_12();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_14_16();
}

uint64_t sub_1DBE3A350()
{
  _QWORD *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_20_5();
  v21 = v2;
  v22 = v3;
  v20 = v0;
  if (qword_1EDB05238 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_59();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDB051E0);
  v0[18] = v5;
  OUTLINED_FUNCTION_3_14();
  v6 = v5;
  sub_1DBE4A7A8();
  v7 = OUTLINED_FUNCTION_18_0();
  v8 = OUTLINED_FUNCTION_38(v7);
  v9 = v0[14];
  if (v8)
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_54();
    *(_DWORD *)v10 = 136446210;
    v11 = *(_QWORD *)(v9 + 112);
    OUTLINED_FUNCTION_22_6();
    v0[13] = OUTLINED_FUNCTION_26_0(v11, v12, &v19);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v6, v1, "Attempting proactive flush - %{public}s", v10);
    OUTLINED_FUNCTION_2_37();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_13_0();

  v13 = (_QWORD *)v0[14];
  v14 = v13[25];
  __swift_project_boxed_opaque_existential_1(v13 + 21, v13[24]);
  v18 = (uint64_t (*)(uint64_t))(**(int **)(v14 + 8) + *(_QWORD *)(v14 + 8));
  v15 = (_QWORD *)swift_task_alloc();
  v0[19] = v15;
  v16 = OUTLINED_FUNCTION_51(v15, (uint64_t)sub_1DBE3A4E4);
  return v18(v16);
}

uint64_t sub_1DBE3A4E4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  OUTLINED_FUNCTION_25();
  *(_BYTE *)(v2 + 72) = v1;
  *(_QWORD *)(v2 + 64) = v0;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1DBE3A524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_20_5();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  v25 = *(_QWORD *)(v22 + 136);
  v26 = *(_QWORD *)(v22 + 112) + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  OUTLINED_FUNCTION_27_2();
  sub_1DBE3C674(v26, v25);
  v27 = OUTLINED_FUNCTION_29();
  if (__swift_getEnumTagSinglePayload(v25, 1, v27) != 1)
  {
    v29 = *(NSObject **)(v22 + 144);
    sub_1DBE3C740(*(_QWORD *)(v22 + 136), &qword_1EDB04800);
    swift_retain();
    sub_1DBE4A7A8();
    v37 = OUTLINED_FUNCTION_18_0();
    v38 = OUTLINED_FUNCTION_38(v37);
    v39 = *(_QWORD *)(v22 + 112);
    if (v38)
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_6();
      a11 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v40 = 136446210;
      v41 = *(_QWORD *)(v39 + 112);
      OUTLINED_FUNCTION_22_6();
      *(_QWORD *)(v22 + 96) = OUTLINED_FUNCTION_26_0(v41, v42, &a11);
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_6_18();
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v29, (os_log_type_t)v27, "Cannot start proactive flush, still performing a previous flush - %{public}s", v40);
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_1_1();
    }
    goto LABEL_11;
  }
  v28 = *(unsigned __int8 *)(v22 + 72);
  v29 = *(NSObject **)(v22 + 144);
  v31 = *(_QWORD *)(v22 + 120);
  v30 = *(_QWORD *)(v22 + 128);
  sub_1DBE3C740(*(_QWORD *)(v22 + 136), &qword_1EDB04800);
  sub_1DBE49AAC();
  __swift_storeEnumTagSinglePayload(v30, 0, 1, v27);
  sub_1DBDEA5AC(v30, v31);
  swift_beginAccess();
  sub_1DBE3C6F8(v31, v26);
  swift_endAccess();
  swift_retain();
  sub_1DBE4A7A8();
  v32 = OUTLINED_FUNCTION_18_0();
  v33 = OUTLINED_FUNCTION_18_7(v32);
  if (v28 != 1)
  {
    if (v33)
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_54();
      v44 = OUTLINED_FUNCTION_23_4(4.8751e-34);
      *(_QWORD *)(v22 + 80) = OUTLINED_FUNCTION_21_5(v44, v45);
      OUTLINED_FUNCTION_7_15();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v29, v32, "Skipping proactive flush - %{public}s", v43);
      OUTLINED_FUNCTION_2_37();
      OUTLINED_FUNCTION_1_1();
    }
LABEL_11:
    swift_release();

    goto LABEL_12;
  }
  if (v33)
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_6();
    a11 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v34 = 136446210;
    v35 = OUTLINED_FUNCTION_40();
    *(_QWORD *)(v22 + 88) = OUTLINED_FUNCTION_28_1(v35, v36, &a11);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_4_11();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v29, v32, "Starting proactive flush - %{public}s", v34);
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_13_0();

  sub_1DBE3B1CC();
LABEL_12:
  swift_task_dealloc();
  OUTLINED_FUNCTION_32_0();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13_16(*(uint64_t (**)(void))(v22 + 8));
}

uint64_t sub_1DBE3A888(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  v4 = OUTLINED_FUNCTION_29();
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = OUTLINED_FUNCTION_6_21();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1DBE3A8D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v6)(uint64_t);

  v1 = *(_QWORD **)(v0 + 88);
  v2 = v1[25];
  __swift_project_boxed_opaque_existential_1(v1 + 21, v1[24]);
  v6 = (uint64_t (*)(uint64_t))(**(int **)(v2 + 16) + *(_QWORD *)(v2 + 16));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v3;
  v4 = OUTLINED_FUNCTION_51(v3, (uint64_t)sub_1DBE3A940);
  return v6(v4);
}

uint64_t sub_1DBE3A940(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 160) = a1;
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1DBE3A990()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_20_5();
  v15 = v1;
  v16 = v2;
  v14 = v0;
  if (qword_1EDB05238 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_59();
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDB051E0);
  v0[16] = v4;
  OUTLINED_FUNCTION_3_14();
  v5 = v4;
  sub_1DBE4A7A8();
  v6 = OUTLINED_FUNCTION_18_0();
  if (os_log_type_enabled(v4, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_6();
    v13 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v7 = 136446210;
    v8 = OUTLINED_FUNCTION_56();
    v0[8] = OUTLINED_FUNCTION_62(v8, v9, &v13);
    OUTLINED_FUNCTION_7_15();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19_6();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v5, v6, "Attempting to wait for proactive flush - %{public}s", v7);
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_19_6();

  sub_1DBE49AAC();
  v10 = (_QWORD *)swift_task_alloc();
  v0[17] = v10;
  v11 = OUTLINED_FUNCTION_44(v10, (uint64_t)sub_1DBE3AB0C);
  return sub_1DBE3B2AC(v11);
}

uint64_t sub_1DBE3AB0C(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 104);
  v3 = *(_QWORD *)(*v1 + 112);
  v5 = *(_QWORD *)(*v1 + 96);
  *(_BYTE *)(*v1 + 161) = a1;
  OUTLINED_FUNCTION_64();
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v2 + 144) = v6;
  v6(v3, v5);
  return swift_task_switch();
}

uint64_t sub_1DBE3AB90()
{
  uint64_t v0;
  int v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  const char *v13;
  int v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(unsigned __int8 *)(v0 + 161);
  v2 = *(NSObject **)(v0 + 128);
  OUTLINED_FUNCTION_50();
  sub_1DBE4A7A8();
  v3 = OUTLINED_FUNCTION_18_0();
  v4 = OUTLINED_FUNCTION_18_7(v3);
  v5 = *(_QWORD *)(v0 + 88);
  if (v1 != 1)
  {
    if (v4)
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_6();
      v24 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v9 = 136446210;
      v11 = *(_QWORD *)(v5 + 112);
      v10 = *(_QWORD *)(v5 + 120);
      OUTLINED_FUNCTION_40();
      *(_QWORD *)(v0 + 16) = sub_1DBDCC9A0(v11, v10, &v24);
      OUTLINED_FUNCTION_7_15();
      OUTLINED_FUNCTION_4_11();
      OUTLINED_FUNCTION_13_0();
      v12 = v3;
      v13 = "Ran out of time waiting for the preemtive flush - %{public}s";
      goto LABEL_11;
    }
LABEL_12:
    OUTLINED_FUNCTION_13_0();

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_32_0();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v4)
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_6();
    v24 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v6 = 136446210;
    v7 = OUTLINED_FUNCTION_40();
    *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_28_1(v7, v8, &v24);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_4_11();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v2, v3, "Proactive flush finished - %{public}s", v6);
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_13_0();

  v2 = *(NSObject **)(v0 + 128);
  v14 = *(unsigned __int8 *)(v0 + 160);
  OUTLINED_FUNCTION_50();
  sub_1DBE4A7A8();
  v15 = OUTLINED_FUNCTION_18_0();
  v16 = OUTLINED_FUNCTION_18_7(v15);
  v17 = *(_QWORD *)(v0 + 88);
  if (v14 != 1)
  {
    if (v16)
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_6();
      v24 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v9 = 136446210;
      v19 = *(_QWORD *)(v17 + 112);
      OUTLINED_FUNCTION_22_6();
      *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_26_0(v19, v20, &v24);
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_13_0();
      v12 = v15;
      v13 = "Skipping reactive flush - %{public}s";
LABEL_11:
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v2, v12, v13, v9);
      OUTLINED_FUNCTION_2_37();
      OUTLINED_FUNCTION_1_1();
    }
    goto LABEL_12;
  }
  if (v16)
  {
    v18 = (uint8_t *)OUTLINED_FUNCTION_6();
    v24 = OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_23_4(4.8751e-34);
    *(_QWORD *)(v0 + 48) = sub_1DBDCC9A0(v0 + 56, 0xCuLL, &v24);
    OUTLINED_FUNCTION_7_15();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v2, v15, "Starting reactive flush - %{public}s", v18);
    OUTLINED_FUNCTION_2_37();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_13_0();

  sub_1DBE3B1CC();
  sub_1DBE49AAC();
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v22;
  v23 = OUTLINED_FUNCTION_44(v22, (uint64_t)sub_1DBE3AF24);
  return sub_1DBE3B2AC(v23);
}

uint64_t sub_1DBE3AF24(char a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 144);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  *(_BYTE *)(*(_QWORD *)v1 + 162) = a1;
  OUTLINED_FUNCTION_64();
  v2(v3, v4);
  return OUTLINED_FUNCTION_14_16();
}

uint64_t sub_1DBE3AF94()
{
  uint64_t v0;
  int v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_5();
  v1 = *(unsigned __int8 *)(v0 + 162);
  v2 = *(NSObject **)(v0 + 128);
  OUTLINED_FUNCTION_50();
  sub_1DBE4A7A8();
  v3 = OUTLINED_FUNCTION_18_0();
  v4 = OUTLINED_FUNCTION_18_7(v3);
  if (v1 == 1)
  {
    if (v4)
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_54();
      v6 = OUTLINED_FUNCTION_24_2(4.8751e-34);
      *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_21_5(v6, v7);
      OUTLINED_FUNCTION_7_15();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_19_6();
      v8 = v3;
      v9 = "Reactive flush finished - %{public}s";
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_54();
    v10 = OUTLINED_FUNCTION_24_2(4.8751e-34);
    *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_21_5(v10, v11);
    OUTLINED_FUNCTION_7_15();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_19_6();
    v8 = v3;
    v9 = "Ran out of time waiting for the reactive flush - %{public}s";
LABEL_6:
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v2, v8, v9, v5);
    OUTLINED_FUNCTION_2_37();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_19_6();

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_32_0();
  return OUTLINED_FUNCTION_13_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DBE3B0EC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04800);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DBE49AC4();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = a1 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  swift_beginAccess();
  sub_1DBE3C6F8((uint64_t)v6, v8);
  swift_endAccess();
  *(_QWORD *)(a1 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = 0;
  result = swift_release();
  if (a2)
    return a2(result);
  return result;
}

void sub_1DBE3B1CC()
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

  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_16();
  v4 = v3 - v2;
  v5 = (uint64_t)v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  OUTLINED_FUNCTION_27_2();
  sub_1DBE3C674(v5, v4);
  v6 = OUTLINED_FUNCTION_29();
  LODWORD(v5) = __swift_getEnumTagSinglePayload(v4, 1, v6);
  sub_1DBE3C740(v4, &qword_1EDB04800);
  if ((_DWORD)v5 != 1)
  {
    v7 = v0[19];
    v8 = v0[20];
    __swift_project_boxed_opaque_existential_1(v0 + 16, v7);
    *(_QWORD *)((char *)v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task) = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
    swift_release();
  }
}

uint64_t sub_1DBE3B2AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[22] = a1;
  v2[23] = v1;
  v3 = sub_1DBE4A85C();
  v2[24] = v3;
  v2[25] = *(_QWORD *)(v3 - 8);
  v2[26] = OUTLINED_FUNCTION_6_21();
  v4 = sub_1DBE4A88C();
  v2[27] = v4;
  v2[28] = *(_QWORD *)(v4 - 8);
  v2[29] = OUTLINED_FUNCTION_6_21();
  v5 = sub_1DBE4A850();
  v2[30] = v5;
  v2[31] = *(_QWORD *)(v5 - 8);
  v2[32] = OUTLINED_FUNCTION_15_15();
  v2[33] = OUTLINED_FUNCTION_17_12();
  v6 = sub_1DBE4A8A4();
  v2[34] = v6;
  v2[35] = *(_QWORD *)(v6 - 8);
  v2[36] = OUTLINED_FUNCTION_15_15();
  v2[37] = OUTLINED_FUNCTION_17_12();
  v7 = sub_1DBE4AA60();
  v2[38] = v7;
  v2[39] = *(_QWORD *)(v7 - 8);
  v2[40] = OUTLINED_FUNCTION_6_21();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04800);
  v2[41] = OUTLINED_FUNCTION_6_21();
  v8 = OUTLINED_FUNCTION_29();
  v2[42] = v8;
  v2[43] = *(_QWORD *)(v8 - 8);
  v2[44] = OUTLINED_FUNCTION_6_21();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_14_16();
}

uint64_t sub_1DBE3B3A8()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t ObjectType;
  uint64_t result;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  void *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;

  if (qword_1EDB05238 != -1)
    swift_once();
  v2 = *(NSObject **)(v0 + 184);
  v3 = OUTLINED_FUNCTION_59();
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDB051E0);
  *(_QWORD *)(v0 + 360) = v4;
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_53();
  v5 = OUTLINED_FUNCTION_18_0();
  if (OUTLINED_FUNCTION_45(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_6();
    v67 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v6 = 136446210;
    v7 = OUTLINED_FUNCTION_40();
    *(_QWORD *)(v0 + 168) = OUTLINED_FUNCTION_28_1(v7, v8, &v67);
    sub_1DBE4AB08();
    OUTLINED_FUNCTION_4_11();
    OUTLINED_FUNCTION_6_18();
    OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v2, v1, "Attempting to finish flush - %{public}s", v6);
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_6_18();

  v9 = *(_QWORD *)(v0 + 328);
  v10 = *(NSObject **)(v0 + 336);
  v11 = *(_QWORD *)(v0 + 184) + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime;
  OUTLINED_FUNCTION_27_2();
  sub_1DBE3C674(v11, v9);
  if (__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10) == 1)
  {
    sub_1DBE3C740(*(_QWORD *)(v0 + 328), &qword_1EDB04800);
LABEL_12:
    swift_retain();
    OUTLINED_FUNCTION_53();
    v23 = OUTLINED_FUNCTION_18_0();
    if (os_log_type_enabled(v10, v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_6();
      v67 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v24 = 136446210;
      v25 = OUTLINED_FUNCTION_56();
      *(_QWORD *)(v0 + 104) = OUTLINED_FUNCTION_62(v25, v26, &v67);
      OUTLINED_FUNCTION_7_15();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_6();
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v10, v23, "Not flushing - no need to wait - %{public}s", v24);
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_1_1();
    }
    OUTLINED_FUNCTION_19_6();

    v27 = 1;
LABEL_23:
    swift_task_dealloc();
    OUTLINED_FUNCTION_32_0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v27);
  }
  v10 = *(NSObject **)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 32))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336));
  v12 = *(uint64_t *)((char *)&v10->isa + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_task);
  *(_QWORD *)(v0 + 368) = v12;
  if (!v12)
  {
    OUTLINED_FUNCTION_55(*(_QWORD *)(v0 + 344));
    goto LABEL_12;
  }
  v13 = *(_QWORD *)(v0 + 184);
  swift_retain();
  sub_1DBE49A7C();
  *(double *)(v0 + 376) = v14;
  v15 = *(double *)(v13 + 208);
  *(double *)(v0 + 384) = v15;
  v16 = v15 - v14;
  if (v15 - v14 <= 0.0)
  {
    swift_retain_n();
    v28 = OUTLINED_FUNCTION_53();
    v29 = sub_1DBE4AA0C();
    v30 = os_log_type_enabled(v28, v29);
    v32 = *(_QWORD *)(v0 + 344);
    v31 = *(_QWORD *)(v0 + 352);
    v33 = *(_QWORD *)(v0 + 336);
    v34 = *(_QWORD *)(v0 + 184);
    if (v30)
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_6();
      v67 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v35 = 136446210;
      v37 = *(_QWORD *)(v34 + 112);
      v36 = *(_QWORD *)(v34 + 120);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 88) = sub_1DBDCC9A0(v37, v36, &v67);
      sub_1DBE4AB08();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v28, v29, "No time left to wait on the flush - %{public}s", v35);
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_1_1();
    }

    swift_release();
    OUTLINED_FUNCTION_61();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    v27 = 0;
    goto LABEL_23;
  }
  v64 = v12;
  v17 = *(_QWORD *)(v0 + 320);
  v61 = *(_QWORD *)(v0 + 312);
  v18 = *(_QWORD *)(v0 + 304);
  v19 = *(_QWORD *)(v0 + 184);
  v63 = *(_QWORD *)(v19 + 112);
  *(_QWORD *)(v0 + 392) = v63;
  v20 = *(_QWORD *)(v19 + 120);
  *(_QWORD *)(v0 + 400) = v20;
  sub_1DBDCC340(0, &qword_1EDB03EA8);
  *(_QWORD *)(v0 + 96) = MEMORY[0x1E0DEE9D8];
  sub_1DBDCC378(&qword_1EDB03EA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF938], MEMORY[0x1E0DEF948]);
  v66 = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_57();
  sub_1DBDCC46C(&qword_1EDB03E80, &qword_1EDB03E78);
  sub_1DBE4AB38();
  *(_QWORD *)(v0 + 408) = sub_1DBE4AA6C();
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v17, v18);
  swift_retain();
  sub_1DBE4A7A8();
  v21 = OUTLINED_FUNCTION_18_0();
  v60 = v20;
  if (os_log_type_enabled(v4, v21))
  {
    v22 = OUTLINED_FUNCTION_6();
    v67 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v22 = 134218242;
    *(double *)(v0 + 152) = v16;
    sub_1DBE4AB08();
    *(_WORD *)(v22 + 12) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 160) = sub_1DBDCC9A0(v63, v20, &v67);
    sub_1DBE4AB08();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_48(&dword_1DBDC1000, v4, v21, "Starting a timer for %fs - %{public}s");
    OUTLINED_FUNCTION_5_19();
    OUTLINED_FUNCTION_1_1();
  }
  swift_release();

  ObjectType = swift_getObjectType();
  *(_QWORD *)(v0 + 416) = ObjectType;
  result = sub_1DBE4A898();
  v40 = v16 * 1000.0;
  if ((~COERCE__INT64(v16 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v40 <= -9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v40 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  v41 = *(_QWORD *)(v0 + 288);
  v42 = *(_QWORD *)(v0 + 296);
  v43 = *(_QWORD *)(v0 + 272);
  v44 = *(_QWORD *)(v0 + 280);
  v45 = *(_QWORD **)(v0 + 256);
  v46 = *(_QWORD **)(v0 + 264);
  v47 = *(_QWORD *)(v0 + 240);
  v48 = *(_QWORD *)(v0 + 248);
  v56 = *(_QWORD *)(v0 + 232);
  v62 = *(_QWORD *)(v0 + 224);
  v65 = *(_QWORD *)(v0 + 216);
  v57 = *(_QWORD *)(v0 + 208);
  v58 = *(_QWORD *)(v0 + 200);
  v59 = *(_QWORD *)(v0 + 192);
  *v46 = (uint64_t)v40;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v48 + 104))(v46, *MEMORY[0x1E0DEF490], v47);
  MEMORY[0x1DF0BB6B0](v41, v46);
  OUTLINED_FUNCTION_49((uint64_t)v46);
  v49 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  v49(v41, v43);
  sub_1DBE3C170((uint64_t)v46);
  sub_1DBE3C1B4(v45);
  MEMORY[0x1DF0BB8C0](v42, v46, v45, ObjectType);
  OUTLINED_FUNCTION_49((uint64_t)v45);
  OUTLINED_FUNCTION_49((uint64_t)v46);
  v49(v42, v43);
  v50 = OUTLINED_FUNCTION_0_14();
  *(double *)(v50 + 16) = v16;
  *(_QWORD *)(v50 + 24) = v63;
  *(_QWORD *)(v50 + 32) = v60;
  *(_QWORD *)(v50 + 40) = v64;
  *(_QWORD *)(v0 + 48) = sub_1DBE3C6E8;
  *(_QWORD *)(v0 + 56) = v50;
  *(_QWORD *)(v0 + 16) = MEMORY[0x1E0C809B0];
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_1DBDC9054;
  *(_QWORD *)(v0 + 40) = &block_descriptor_3;
  v51 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  OUTLINED_FUNCTION_22_6();
  sub_1DBE4A868();
  sub_1DBE3C3F0();
  sub_1DBE4AA78();
  _Block_release(v51);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v56, v65);
  swift_release();
  sub_1DBE4AA90();
  swift_bridgeObjectRetain_n();
  sub_1DBE4A7A8();
  v52 = OUTLINED_FUNCTION_18_0();
  if (OUTLINED_FUNCTION_45(v52))
  {
    v53 = OUTLINED_FUNCTION_6();
    v67 = OUTLINED_FUNCTION_6();
    *(_DWORD *)v53 = 134218242;
    *(double *)(v0 + 136) = v16;
    sub_1DBE4AB08();
    *(_WORD *)(v53 + 12) = 2082;
    OUTLINED_FUNCTION_22_6();
    *(_QWORD *)(v0 + 144) = OUTLINED_FUNCTION_26_0(v63, v54, &v67);
    sub_1DBE4AB08();
    OUTLINED_FUNCTION_35();
    _os_log_impl(&dword_1DBDC1000, v66, (os_log_type_t)v57, "Waiting for the flush to finish for %fs - %{public}s", (uint8_t *)v53, 0x16u);
    OUTLINED_FUNCTION_2_37();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_36();

  v55 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v55;
  *v55 = v0;
  v55[1] = sub_1DBE3BDD8;
  return sub_1DBE4A9DC();
}

uint64_t sub_1DBE3BDD8()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_4_10();
}

uint64_t sub_1DBE3BE10()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char isCancelled;
  uint64_t v22;

  isCancelled = swift_task_isCancelled();
  if ((isCancelled & 1) != 0)
  {
    v2 = *(NSObject **)(v0 + 360);
    swift_bridgeObjectRetain();
    sub_1DBE4A7A8();
    v3 = OUTLINED_FUNCTION_18_0();
    if (OUTLINED_FUNCTION_43(v3))
    {
      v20 = *(_QWORD *)(v0 + 392);
      v4 = *(double *)(v0 + 384) - *(double *)(v0 + 376);
      v5 = OUTLINED_FUNCTION_6();
      v22 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v5 = 134218242;
      *(double *)(v0 + 120) = v4;
      sub_1DBE4AB08();
      *(_WORD *)(v5 + 12) = 2082;
      OUTLINED_FUNCTION_22_6();
      *(_QWORD *)(v0 + 128) = OUTLINED_FUNCTION_26_0(v20, v6, &v22);
      sub_1DBE4AB08();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_48(&dword_1DBDC1000, v2, v1, "Timed out while waiting on the flush to finish after waiting %fs - %{public}s");
      OUTLINED_FUNCTION_2_37();
      OUTLINED_FUNCTION_1_1();
    }
    v13 = *(_QWORD *)(v0 + 344);
    v14 = *(_QWORD *)(v0 + 352);
    v15 = *(_QWORD *)(v0 + 336);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_36();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  else
  {
    v7 = *(NSObject **)(v0 + 360);
    sub_1DBE4AA84();
    swift_bridgeObjectRetain();
    v8 = v7;
    sub_1DBE4A7A8();
    v9 = OUTLINED_FUNCTION_18_0();
    if (OUTLINED_FUNCTION_43(v9))
    {
      v10 = *(_QWORD *)(v0 + 392);
      v11 = (uint8_t *)OUTLINED_FUNCTION_6();
      v22 = OUTLINED_FUNCTION_6();
      *(_DWORD *)v11 = 136446210;
      OUTLINED_FUNCTION_22_6();
      *(_QWORD *)(v0 + 112) = OUTLINED_FUNCTION_26_0(v10, v12, &v22);
      sub_1DBE4AB08();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_8_21(&dword_1DBDC1000, v7, v1, "Flush finished without timing out - %{public}s", v11);
      OUTLINED_FUNCTION_5_19();
      OUTLINED_FUNCTION_1_1();
    }
    v17 = *(_QWORD *)(v0 + 344);
    v16 = *(_QWORD *)(v0 + 352);
    v18 = *(_QWORD *)(v0 + 336);

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_36();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_32_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(BOOL))(v0 + 8))((isCancelled & 1) == 0);
}

uint64_t sub_1DBE3C170@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DEF498];
  v3 = sub_1DBE4A850();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1DBE3C1B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 0;
  v2 = *MEMORY[0x1E0DEF480];
  v3 = sub_1DBE4A850();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1DBE3C1FC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (qword_1EDB05238 != -1)
    swift_once();
  v4 = sub_1DBE4A7C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EDB051E0);
  swift_bridgeObjectRetain_n();
  v5 = sub_1DBE4A7A8();
  v6 = sub_1DBE4AA00();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 134218242;
    sub_1DBE4AB08();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1DBDCC9A0(a1, a2, &v10);
    sub_1DBE4AB08();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DBDC1000, v5, v6, "Timer is cancelling the task after waiting %fs - %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0BBFEC](v8, -1, -1);
    MEMORY[0x1DF0BBFEC](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_1DBE4A9D0();
}

uint64_t sub_1DBE3C3F0()
{
  sub_1DBE4A85C();
  sub_1DBDCC378((unint64_t *)&qword_1EDB05240, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05268);
  sub_1DBDCC46C((unint64_t *)&qword_1EDB05270, &qword_1EDB05268);
  return sub_1DBE4AB38();
}

uint64_t sub_1DBE3C49C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  __swift_destroy_boxed_opaque_existential_1(v0 + 168);

  sub_1DBE3C740(v0 + OBJC_IVAR____TtCC16WeatherAnalytics30WidgetTimelineTelemetryManager5Actor_startTime, &qword_1EDB04800);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1DBE3C500()
{
  sub_1DBE3C49C();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1DBE3C518()
{
  return type metadata accessor for WidgetTimelineTelemetryManager.Actor();
}

void sub_1DBE3C520()
{
  unint64_t v0;

  sub_1DBE3C5D0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1DBE3C5D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDB03150)
  {
    sub_1DBE49AC4();
    v0 = sub_1DBE4AAFC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDB03150);
  }
}

uint64_t sub_1DBE3C624()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DBE3C630()
{
  return sub_1DBE3C624();
}

void sub_1DBE3C648()
{
  sub_1DBDCC378(&qword_1EDB03E70, (uint64_t (*)(uint64_t))type metadata accessor for WidgetTimelineTelemetryManager.SerialActor, (uint64_t)&unk_1DBE5AFF0);
}

uint64_t sub_1DBE3C674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE3C6BC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DBE3C6E8()
{
  uint64_t v0;

  return sub_1DBE3C1FC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1DBE3C6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1DBE3C740(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_55(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_19();
}

uint64_t sub_1DBE3C770()
{
  swift_release();
  return swift_deallocObject();
}

BOOL OUTLINED_FUNCTION_18_7(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_4(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_1DBDCC9A0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_28_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_1DBDCC9A0(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease_n();
}

BOOL OUTLINED_FUNCTION_38(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_42(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

BOOL OUTLINED_FUNCTION_43(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 112);
}

BOOL OUTLINED_FUNCTION_45(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;

  return sub_1DBE3B0EC(*(_QWORD *)(v0 + 88), *(uint64_t (**)(uint64_t))(v0 + 72));
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_1DBE4AB08();
}

void OUTLINED_FUNCTION_48(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x16u);
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_51@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_1DBE4A7A8();
}

uint64_t OUTLINED_FUNCTION_55@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_1DBE4AB08();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_1DBE4A7C0();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_1DBE4A9B8();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_1DBDCC9A0(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_task_dealloc();
}

WeatherAnalytics::WidgetRefreshEventData __swiftcall WidgetRefreshEventData.init(widget:)(WeatherAnalytics::WidgetRefreshEventData widget)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(widget.widget.name._countAndFlagsBits + 8);
  v3 = *(_BYTE *)(widget.widget.name._countAndFlagsBits + 16);
  *(_QWORD *)v1 = *(_QWORD *)widget.widget.name._countAndFlagsBits;
  *(_QWORD *)(v1 + 8) = v2;
  *(_BYTE *)(v1 + 16) = v3;
  return widget;
}

uint64_t WidgetRefreshEventData.widget.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DBE3C990(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x746567646977 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1DBE4ACF4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1DBE3CA0C()
{
  return 0x746567646977;
}

uint64_t sub_1DBE3CA24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE3C990(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1DBE3CA4C()
{
  sub_1DBE3CB98();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE3CA74()
{
  sub_1DBE3CB98();
  return sub_1DBE4ADCC();
}

void WidgetRefreshEventData.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD v9[3];
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316118);
  v9[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v6 = v1[1];
  v8 = *((_BYTE *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE3CB98();
  sub_1DBE4ADB4();
  v9[1] = v7;
  v9[2] = v6;
  v10 = v8;
  sub_1DBDFF4B0();
  sub_1DBE4ACB8();
  (*(void (**)(char *, uint64_t))(v9[0] + 8))(v5, v3);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE3CB98()
{
  unint64_t result;

  result = qword_1F0316120;
  if (!qword_1F0316120)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B19C, &type metadata for WidgetRefreshEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316120);
  }
  return result;
}

void WidgetRefreshEventData.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316128);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE3CB98();
  sub_1DBE4AD9C();
  if (!v2)
  {
    sub_1DBDFF68C();
    sub_1DBE4AC28();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v11[2];
    v10 = v12;
    *(_QWORD *)a2 = v11[1];
    *(_QWORD *)(a2 + 8) = v9;
    *(_BYTE *)(a2 + 16) = v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0();
}

void sub_1DBE3CCF0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  WidgetRefreshEventData.init(from:)(a1, a2);
}

void sub_1DBE3CD04(_QWORD *a1)
{
  WidgetRefreshEventData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for WidgetRefreshEventData()
{
  return &type metadata for WidgetRefreshEventData;
}

uint64_t storeEnumTagSinglePayload for WidgetRefreshEventData.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1DBE3CD68 + 4 * byte_1DBE5B020[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DBE3CD88 + 4 * byte_1DBE5B025[v4]))();
}

_BYTE *sub_1DBE3CD68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DBE3CD88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DBE3CD90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DBE3CD98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DBE3CDA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DBE3CDA8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WidgetRefreshEventData.CodingKeys()
{
  return &type metadata for WidgetRefreshEventData.CodingKeys;
}

unint64_t sub_1DBE3CDC8()
{
  unint64_t result;

  result = qword_1F0316130;
  if (!qword_1F0316130)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B174, &type metadata for WidgetRefreshEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316130);
  }
  return result;
}

unint64_t sub_1DBE3CE08()
{
  unint64_t result;

  result = qword_1F0316138;
  if (!qword_1F0316138)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B0E4, &type metadata for WidgetRefreshEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316138);
  }
  return result;
}

unint64_t sub_1DBE3CE48()
{
  unint64_t result;

  result = qword_1F0316140;
  if (!qword_1F0316140)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B10C, &type metadata for WidgetRefreshEventData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316140);
  }
  return result;
}

uint64_t dispatch thunk of WidgetAnalyticsCoordinatorType.enter()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_1_38();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_8_22(v1, (uint64_t)sub_1DBE3D3E8);
  return OUTLINED_FUNCTION_0_37(v2, v3, v4);
}

uint64_t dispatch thunk of WidgetAnalyticsCoordinatorType.leave()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_1_38();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_8_22(v1, (uint64_t)sub_1DBE3D3E8);
  return OUTLINED_FUNCTION_0_37(v2, v3, v4);
}

_QWORD *sub_1DBE3CF04(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  type metadata accessor for WidgetAnalyticsCoordinator.Actor();
  v6 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v6 + 112) = 0;
  v3[3] = a2;
  v3[4] = v6;
  v3[2] = a1;
  v7 = *(_QWORD *)(a2 + 16);
  if (v7)
  {
    v8 = a2 + 32;
    swift_retain();
    swift_bridgeObjectRetain();
    do
    {
      sub_1DBDC9614(v8, (uint64_t)v12);
      v9 = v13;
      v10 = v14;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      v8 += 40;
      --v7;
    }
    while (v7);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1DBE3CFF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_3_27();
}

uint64_t sub_1DBE3D004()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 32);
  return OUTLINED_FUNCTION_3_27();
}

uint64_t sub_1DBE3D01C()
{
  uint64_t v0;
  BOOL v1;

  v1 = sub_1DBE3D210();
  return OUTLINED_FUNCTION_2_38(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1DBE3D048()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_3_27();
}

uint64_t sub_1DBE3D05C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  *v2 = v0;
  v2[1] = sub_1DBE3D0AC;
  return sub_1DBE3D230(v1);
}

uint64_t sub_1DBE3D0AC(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_2_38(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1DBE3D0E0()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1DBE3D10C()
{
  sub_1DBE3D0E0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WidgetAnalyticsCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_1DBE3D14C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DBE3D194;
  return sub_1DBE3CFF0();
}

uint64_t sub_1DBE3D194(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1();
  return OUTLINED_FUNCTION_2_38(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_1DBE3D1C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DBE3D3E8;
  return sub_1DBE3D048();
}

BOOL sub_1DBE3D210()
{
  uint64_t v0;
  uint64_t v1;
  _BOOL8 result;

  v1 = *(_QWORD *)(v0 + 112);
  if (__OFADD__(v1, 1))
  {
    __break(1u);
  }
  else
  {
    result = v1 == 0;
    *(_QWORD *)(v0 + 112) = v1 + 1;
  }
  return result;
}

uint64_t sub_1DBE3D230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1DBE3D248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 + 112);
  v3 = v2 == 1;
  v4 = v2 < 1;
  v5 = v2 - 1;
  if (v4 || (*(_QWORD *)(v1 + 112) = v5, !v3))
  {
    v6 = 0;
    return OUTLINED_FUNCTION_4_22(v6, *(uint64_t (**)(void))(v0 + 8));
  }
  v8 = *(_QWORD **)(v0 + 16);
  v9 = v8[2];
  *(_QWORD *)(v0 + 32) = v9;
  if (!v9)
  {
    v6 = 1;
    return OUTLINED_FUNCTION_4_22(v6, *(uint64_t (**)(void))(v0 + 8));
  }
  *(_QWORD *)(v0 + 40) = 0;
  v10 = v8 + 4;
  v11 = v8[7];
  swift_bridgeObjectRetain();
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v12 = (_QWORD *)OUTLINED_FUNCTION_1_38();
  *(_QWORD *)(v0 + 48) = v12;
  v13 = OUTLINED_FUNCTION_7_16(v12, (uint64_t)sub_1DBE3D2E0);
  return OUTLINED_FUNCTION_0_37(v13, v14, v15);
}

uint64_t sub_1DBE3D2E0()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1();
  return swift_task_switch();
}

uint64_t sub_1DBE3D324()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = *(_QWORD *)(v0 + 40) + 1;
  if (v1 == *(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_4_22(1, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    *(_QWORD *)(v0 + 40) = v1;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 40 * v1 + 32), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40 * v1 + 56));
    v3 = (_QWORD *)OUTLINED_FUNCTION_1_38();
    *(_QWORD *)(v0 + 48) = v3;
    v4 = OUTLINED_FUNCTION_7_16(v3, (uint64_t)sub_1DBE3D2E0);
    return OUTLINED_FUNCTION_0_37(v4, v5, v6);
  }
}

uint64_t sub_1DBE3D3A8()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for WidgetAnalyticsCoordinator.Actor()
{
  return objc_opt_self();
}

uint64_t sub_1DBE3D3EC()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1DBE4A010();
  __swift_allocate_value_buffer(v0, qword_1F0316180);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F0316180);
  *(_QWORD *)v1 = 0xD000000000000020;
  *(_QWORD *)(v1 + 8) = 0x80000001DBE5FB10;
  *(_QWORD *)(v1 + 16) = 4;
  *(_BYTE *)(v1 + 24) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

uint64_t static ReportWeatherEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F0313190, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], (uint64_t)qword_1F0316180, a1);
}

uint64_t sub_1DBE3D490()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1DBE4A1C0();
  __swift_allocate_value_buffer(v0, qword_1F0316198);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F0316198);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x1E0CF8388], v0);
}

uint64_t static ReportWeatherEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F0313198, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], (uint64_t)qword_1F0316198, a1);
}

uint64_t ReportWeatherEvent.eventData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.locationData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for ReportWeatherEvent(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, (uint64_t *)&unk_1F0316270);
}

uint64_t ReportWeatherEvent.feedbackUserData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.conditionsFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.temperatureFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.locationConditionData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.forecastAgeData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.windFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.aqiFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.otherConditionsFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.descriptionFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.weatherJSONData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ReportWeatherEvent.init()@<X0>(uint64_t a1@<X8>)
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

  v2 = *MEMORY[0x1E0CF8128];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
  v4 = type metadata accessor for ReportWeatherEvent(0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  OUTLINED_FUNCTION_8_0(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  OUTLINED_FUNCTION_8_0(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  OUTLINED_FUNCTION_8_0(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  OUTLINED_FUNCTION_8_0(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  OUTLINED_FUNCTION_6_22(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  OUTLINED_FUNCTION_6_22(v10);
  v11 = a1 + *(int *)(v4 + 44);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v11, v2, v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  OUTLINED_FUNCTION_6_22(v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  OUTLINED_FUNCTION_6_22(v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  OUTLINED_FUNCTION_6_22(v15);
  v16 = a1 + *(int *)(v4 + 60);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v16, v2, v17);
}

uint64_t ReportWeatherEvent.Model.eventData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_0();
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

void ReportWeatherEvent.Model.locationData.getter()
{
  _OWORD *v0;
  uint64_t v1;

  *v0 = *(_OWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 20));
  OUTLINED_FUNCTION_19();
}

uint64_t type metadata accessor for ReportWeatherEvent.Model(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, qword_1F0316368);
}

uint64_t ReportWeatherEvent.Model.feedbackUserData.getter()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 24));
  v3 = v2[1];
  *v0 = *v2;
  v0[1] = v3;
  return OUTLINED_FUNCTION_11();
}

void ReportWeatherEvent.Model.conditionsFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 28);
  *(_BYTE *)v0 = *(_BYTE *)v2;
  *(_DWORD *)(v0 + 1) = *(_DWORD *)(v2 + 1);
  OUTLINED_FUNCTION_19();
}

void ReportWeatherEvent.Model.temperatureFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char v3;

  v2 = (char *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 32));
  v3 = *v2;
  LODWORD(v2) = *((_DWORD *)v2 + 1);
  *(_BYTE *)v0 = v3;
  *(_DWORD *)(v0 + 4) = (_DWORD)v2;
  OUTLINED_FUNCTION_19();
}

void ReportWeatherEvent.Model.locationConditionData.getter()
{
  _OWORD *v0;
  uint64_t v1;

  *v0 = *(_OWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 36));
  OUTLINED_FUNCTION_19();
}

void ReportWeatherEvent.Model.forecastAgeData.getter()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  int v3;

  v2 = (int *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 40));
  v3 = *v2;
  LOBYTE(v2) = *((_BYTE *)v2 + 4);
  *(_DWORD *)v0 = v3;
  *(_BYTE *)(v0 + 4) = (_BYTE)v2;
  OUTLINED_FUNCTION_19();
}

void ReportWeatherEvent.Model.windFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 44);
  v3 = *(_BYTE *)(v2 + 12);
  *(_BYTE *)v0 = *(_BYTE *)v2;
  *(_QWORD *)(v0 + 4) = *(_QWORD *)(v2 + 4);
  *(_BYTE *)(v0 + 12) = v3;
  OUTLINED_FUNCTION_19();
}

uint64_t ReportWeatherEvent.Model.aqiFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 48);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  v5 = *(_BYTE *)(v2 + 32);
  *(_OWORD *)v0 = *(_OWORD *)v2;
  *(_QWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 24) = v3;
  *(_BYTE *)(v0 + 32) = v5;
  return OUTLINED_FUNCTION_11();
}

void ReportWeatherEvent.Model.otherConditionsFeedbackData.getter()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  int v3;

  v2 = (int *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 52));
  v3 = *v2;
  *(_WORD *)(v0 + 4) = *((_WORD *)v2 + 2);
  *(_DWORD *)v0 = v3;
  OUTLINED_FUNCTION_19();
}

void ReportWeatherEvent.Model.descriptionFeedbackData.getter()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 56));
  OUTLINED_FUNCTION_19();
}

uint64_t ReportWeatherEvent.Model.weatherJSONData.getter()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_7_17() + 60));
  v3 = v2[1];
  *v0 = *v2;
  v0[1] = v3;
  return OUTLINED_FUNCTION_11();
}

__n128 ReportWeatherEvent.Model.init(eventData:locationData:feedbackUserData:conditionsFeedbackData:temperatureFeedbackData:locationConditionData:forecastAgeData:windFeedbackData:aqiFeedbackData:otherConditionsFeedbackData:descriptionFeedbackData:weatherJSONData:)@<Q0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, char *a4@<X3>, char *a5@<X4>, uint64_t *a6@<X5>, int *a7@<X6>, _BYTE *a8@<X7>, uint64_t a9@<X8>, __n128 *a10, int *a11, uint64_t *a12, uint64_t *a13)
{
  _BYTE *v13;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  __n128 *v35;
  __n128 result;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  int v41;
  char v42;
  char v43;
  unsigned __int8 v44;
  unint64_t v45;
  unint64_t v46;
  __n128 v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;

  v13 = a8;
  v17 = *a2;
  v18 = a2[1];
  v20 = *a3;
  v19 = a3[1];
  v21 = *a4;
  v22 = *a5;
  v23 = *((_DWORD *)a5 + 1);
  v24 = *a6;
  v39 = a6[1];
  v40 = *((_BYTE *)a7 + 4);
  v41 = *a7;
  v42 = *a8;
  v43 = a8[12];
  v47 = *a10;
  v45 = a10[1].n128_u64[1];
  v46 = a10[1].n128_u64[0];
  v44 = a10[2].n128_u8[0];
  v48 = *((_WORD *)a11 + 2);
  v49 = *a12;
  v51 = *a13;
  v52 = *a11;
  v50 = a13[1];
  v25 = OUTLINED_FUNCTION_9_0();
  v26 = *(_QWORD *)(v13 + 4);
  LODWORD(v13) = *(_DWORD *)(a4 + 1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(a9, a1, v25);
  v27 = (int *)type metadata accessor for ReportWeatherEvent.Model(0);
  v28 = (_QWORD *)(a9 + v27[5]);
  *v28 = v17;
  v28[1] = v18;
  v29 = (_QWORD *)(a9 + v27[6]);
  *v29 = v20;
  v29[1] = v19;
  v30 = a9 + v27[7];
  *(_BYTE *)v30 = v21;
  *(_DWORD *)(v30 + 1) = (_DWORD)v13;
  v31 = a9 + v27[8];
  *(_BYTE *)v31 = v22;
  *(_DWORD *)(v31 + 4) = v23;
  v32 = (_QWORD *)(a9 + v27[9]);
  *v32 = v24;
  v32[1] = v39;
  v33 = a9 + v27[10];
  *(_DWORD *)v33 = v41;
  *(_BYTE *)(v33 + 4) = v40;
  v34 = a9 + v27[11];
  *(_BYTE *)v34 = v42;
  *(_QWORD *)(v34 + 4) = v26;
  *(_BYTE *)(v34 + 12) = v43;
  v35 = (__n128 *)(a9 + v27[12]);
  result = v47;
  *v35 = v47;
  v35[1].n128_u64[0] = v46;
  v35[1].n128_u64[1] = v45;
  v35[2].n128_u8[0] = v44;
  v37 = a9 + v27[13];
  *(_WORD *)(v37 + 4) = v48;
  *(_DWORD *)v37 = v52;
  *(_QWORD *)(a9 + v27[14]) = v49;
  v38 = (_QWORD *)(a9 + v27[15]);
  *v38 = v51;
  v38[1] = v50;
  return result;
}

uint64_t sub_1DBE3DCF0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v3 = a1 == 0x746144746E657665 && a2 == 0xE900000000000061;
  if (v3 || (sub_1DBE4ACF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E6F697461636F6CLL && a2 == 0xEC00000061746144;
    if (v6 || (sub_1DBE4ACF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001DBE5FA50 || (sub_1DBE4ACF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x80000001DBE5FA70 || (sub_1DBE4ACF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x80000001DBE5FA90 || (sub_1DBE4ACF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x80000001DBE5DF20 || (sub_1DBE4ACF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      v7 = a1 == 0x7473616365726F66 && a2 == 0xEF61746144656741;
      if (v7 || (sub_1DBE4ACF4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000001DBE5FAB0 || (sub_1DBE4ACF4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 7;
      }
      else
      {
        v8 = a1 == 0x6264656546697161 && a2 == 0xEF617461446B6361;
        if (v8 || (sub_1DBE4ACF4() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 8;
        }
        else if (a1 == 0xD00000000000001BLL && a2 == 0x80000001DBE5FAD0 || (sub_1DBE4ACF4() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 9;
        }
        else if (a1 == 0xD000000000000017 && a2 == 0x80000001DBE5FAF0 || (sub_1DBE4ACF4() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 10;
        }
        else if (a1 == 0x4A72656874616577 && a2 == 0xEF617461444E4F53)
        {
          swift_bridgeObjectRelease();
          return 11;
        }
        else
        {
          v10 = sub_1DBE4ACF4();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 11;
          else
            return 12;
        }
      }
    }
  }
}

uint64_t sub_1DBE3E1A0()
{
  return 12;
}

uint64_t sub_1DBE3E1A8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DBE3E1E0 + 4 * byte_1DBE5B2A0[a1]))(0xD000000000000010, 0x80000001DBE5FA50);
}

uint64_t sub_1DBE3E1E0()
{
  return 0x746144746E657665;
}

uint64_t sub_1DBE3E1FC()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_1DBE3E21C(uint64_t a1)
{
  return a1 + 6;
}

uint64_t sub_1DBE3E2C8()
{
  return 0x4A72656874616577;
}

uint64_t sub_1DBE3E2EC()
{
  unsigned __int8 *v0;

  return sub_1DBE3E1A8(*v0);
}

uint64_t sub_1DBE3E2F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE3DCF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DBE3E318@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DBE3E1A0();
  *a1 = result;
  return result;
}

uint64_t sub_1DBE3E33C()
{
  sub_1DBE3E70C();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE3E364()
{
  sub_1DBE3E70C();
  return sub_1DBE4ADCC();
}

uint64_t ReportWeatherEvent.Model.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_16();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE3E70C();
  sub_1DBE4ADB4();
  sub_1DBE4A37C();
  sub_1DBDD2450(&qword_1EDB02088, MEMORY[0x1E0CF8680]);
  sub_1DBE4ACB8();
  if (!v1)
  {
    type metadata accessor for ReportWeatherEvent.Model(0);
    sub_1DBDD1394();
    OUTLINED_FUNCTION_2_22();
    sub_1DBDD0B4C();
    OUTLINED_FUNCTION_2_22();
    sub_1DBDD76EC();
    OUTLINED_FUNCTION_2_22();
    sub_1DBE18254();
    OUTLINED_FUNCTION_2_22();
    sub_1DBDCE72C();
    OUTLINED_FUNCTION_5_20();
    sub_1DBE3E748();
    OUTLINED_FUNCTION_5_20();
    sub_1DBE1AAB0();
    OUTLINED_FUNCTION_2_22();
    sub_1DBE18A68();
    OUTLINED_FUNCTION_5_20();
    sub_1DBDE78A0();
    OUTLINED_FUNCTION_5_20();
    sub_1DBE13170();
    OUTLINED_FUNCTION_5_20();
    sub_1DBDD320C();
    OUTLINED_FUNCTION_2_22();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_1DBE3E70C()
{
  unint64_t result;

  result = qword_1F03161F8;
  if (!qword_1F03161F8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B5D4, &type metadata for ReportWeatherEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03161F8);
  }
  return result;
}

unint64_t sub_1DBE3E748()
{
  unint64_t result;

  result = qword_1F0316200;
  if (!qword_1F0316200)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for ForecastAgeData, &type metadata for ForecastAgeData);
    atomic_store(result, (unint64_t *)&qword_1F0316200);
  }
  return result;
}

uint64_t ReportWeatherEvent.Model.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  char v24;

  v5 = sub_1DBE4A37C();
  v19 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_16();
  v8 = v7 - v6;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316208);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_16();
  v20 = (int *)type metadata accessor for ReportWeatherEvent.Model(0);
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_16();
  v21 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE3E70C();
  sub_1DBE4AD9C();
  if (v2)
    return OUTLINED_FUNCTION_21_6();
  LOBYTE(v22) = 0;
  sub_1DBDD2450(&qword_1EDB01F10, MEMORY[0x1E0CF8688]);
  OUTLINED_FUNCTION_5_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v21, v8, v5);
  sub_1DBDD1358();
  OUTLINED_FUNCTION_3_28();
  *(_OWORD *)(v21 + v20[5]) = v22;
  sub_1DBDD0B10();
  OUTLINED_FUNCTION_3_28();
  *(_OWORD *)(v21 + v20[6]) = v22;
  sub_1DBDD76AC();
  OUTLINED_FUNCTION_3_28();
  v11 = v21 + v20[7];
  *(_BYTE *)v11 = 0;
  *(_DWORD *)(v11 + 1) = *(_DWORD *)((char *)&v22 + 1);
  sub_1DBE18214();
  OUTLINED_FUNCTION_3_28();
  v12 = v21 + v20[8];
  *(_BYTE *)v12 = 0;
  *(_DWORD *)(v12 + 4) = DWORD1(v22);
  sub_1DBDCE6F0();
  OUTLINED_FUNCTION_10_25();
  *(_OWORD *)(v21 + v20[9]) = v22;
  sub_1DBE3ECCC();
  OUTLINED_FUNCTION_10_25();
  v13 = v21 + v20[10];
  *(_DWORD *)v13 = v22;
  *(_BYTE *)(v13 + 4) = BYTE4(v22);
  sub_1DBE1AA70();
  OUTLINED_FUNCTION_3_28();
  v14 = v21 + v20[11];
  *(_BYTE *)v14 = 0;
  *(_QWORD *)(v14 + 4) = *(_QWORD *)((char *)&v22 + 4);
  *(_BYTE *)(v14 + 12) = BYTE12(v22);
  sub_1DBE18A28();
  OUTLINED_FUNCTION_10_25();
  v15 = v21 + v20[12];
  *(_OWORD *)v15 = v22;
  *(_OWORD *)(v15 + 16) = v23;
  *(_BYTE *)(v15 + 32) = v24;
  sub_1DBDE7860();
  OUTLINED_FUNCTION_10_25();
  v16 = v21 + v20[13];
  *(_WORD *)(v16 + 4) = WORD2(v22);
  *(_DWORD *)v16 = v22;
  sub_1DBE13130();
  sub_1DBE4ABD4();
  *(_QWORD *)(v21 + v20[14]) = v22;
  sub_1DBDD31CC();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_20_6();
  *(_OWORD *)(v21 + v20[15]) = v22;
  sub_1DBE3ED08(v21, a2);
  OUTLINED_FUNCTION_21_6();
  return sub_1DBE3ED4C(v21);
}

unint64_t sub_1DBE3ECCC()
{
  unint64_t result;

  result = qword_1F0316210;
  if (!qword_1F0316210)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for ForecastAgeData, &type metadata for ForecastAgeData);
    atomic_store(result, (unint64_t *)&qword_1F0316210);
  }
  return result;
}

uint64_t sub_1DBE3ED08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReportWeatherEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE3ED4C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ReportWeatherEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DBE3ED88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ReportWeatherEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_1DBE3ED9C(_QWORD *a1)
{
  return ReportWeatherEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherEvent(uint64_t *a1, uint64_t *a2, int *a3)
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
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v52 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v52 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    v20 = a3[8];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    v24 = a3[9];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    v28 = a3[10];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    v32 = a3[11];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
    v36 = a3[12];
    v37 = (char *)a1 + v36;
    v38 = (char *)a2 + v36;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
    v40 = a3[13];
    v41 = (char *)a1 + v40;
    v42 = (char *)a2 + v40;
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v41, v42, v43);
    v44 = a3[14];
    v45 = (char *)a1 + v44;
    v46 = (char *)a2 + v44;
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v46, v47);
    v48 = a3[15];
    v49 = (char *)a1 + v48;
    v50 = (char *)a2 + v48;
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(v49, v50, v51);
  }
  return a1;
}

uint64_t destroy for ReportWeatherEvent(uint64_t a1, int *a2)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = a1 + a2[8];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = a1 + a2[9];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = a1 + a2[10];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = a1 + a2[11];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  v19 = a1 + a2[12];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  v21 = a1 + a2[13];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
  v23 = a1 + a2[14];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
  v25 = a1 + a2[15];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v25, v26);
}

uint64_t initializeWithCopy for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  v27 = a3[10];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
  v31 = a3[11];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
  v35 = a3[12];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
  v39 = a3[13];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v40, v41, v42);
  v43 = a3[14];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(v44, v45, v46);
  v47 = a3[15];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
  return a1;
}

uint64_t assignWithCopy for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  v27 = a3[10];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v28, v29, v30);
  v31 = a3[11];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v32, v33, v34);
  v35 = a3[12];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 24))(v36, v37, v38);
  v39 = a3[13];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 24))(v40, v41, v42);
  v43 = a3[14];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 24))(v44, v45, v46);
  v47 = a3[15];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  return a1;
}

uint64_t initializeWithTake for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  v27 = a3[10];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v28, v29, v30);
  v31 = a3[11];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
  v35 = a3[12];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
  v39 = a3[13];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v40, v41, v42);
  v43 = a3[14];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(v44, v45, v46);
  v47 = a3[15];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v48, v49, v50);
  return a1;
}

uint64_t assignWithTake for ReportWeatherEvent(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v24, v25, v26);
  v27 = a3[10];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(v28, v29, v30);
  v31 = a3[11];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 40))(v32, v33, v34);
  v35 = a3[12];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 40))(v36, v37, v38);
  v39 = a3[13];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 40))(v40, v41, v42);
  v43 = a3[14];
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 40))(v44, v45, v46);
  v47 = a3[15];
  v48 = a1 + v47;
  v49 = a2 + v47;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 40))(v48, v49, v50);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE3FC0C(uint64_t a1, uint64_t a2, int *a3)
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
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  OUTLINED_FUNCTION_2_0();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
    OUTLINED_FUNCTION_2_0();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
      OUTLINED_FUNCTION_2_0();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
        OUTLINED_FUNCTION_2_0();
        if (v14)
        {
          v7 = v15;
          v11 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
          OUTLINED_FUNCTION_2_0();
          if (v16)
          {
            v7 = v17;
            v11 = a3[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
            OUTLINED_FUNCTION_2_0();
            if (v18)
            {
              v7 = v19;
              v11 = a3[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
              OUTLINED_FUNCTION_2_0();
              if (v20)
              {
                v7 = v21;
                v11 = a3[10];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
                OUTLINED_FUNCTION_2_0();
                if (v22)
                {
                  v7 = v23;
                  v11 = a3[11];
                }
                else
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
                  OUTLINED_FUNCTION_2_0();
                  if (v24)
                  {
                    v7 = v25;
                    v11 = a3[12];
                  }
                  else
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
                    OUTLINED_FUNCTION_2_0();
                    if (v26)
                    {
                      v7 = v27;
                      v11 = a3[13];
                    }
                    else
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
                      OUTLINED_FUNCTION_2_0();
                      if (v28)
                      {
                        v7 = v29;
                        v11 = a3[14];
                      }
                      else
                      {
                        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
                        v11 = a3[15];
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
    v8 = a1 + v11;
  }
  return OUTLINED_FUNCTION_8(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE3FDB8()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  OUTLINED_FUNCTION_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  OUTLINED_FUNCTION_3_3();
  if (v6)
  {
    v4 = v3;
    v5 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
    OUTLINED_FUNCTION_3_3();
    if (v6)
    {
      v4 = v7;
      v8 = v2[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
      OUTLINED_FUNCTION_3_3();
      if (v9)
      {
        v4 = v10;
        v8 = v2[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B0);
        OUTLINED_FUNCTION_3_3();
        if (v11)
        {
          v4 = v12;
          v8 = v2[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161B8);
          OUTLINED_FUNCTION_3_3();
          if (v13)
          {
            v4 = v14;
            v8 = v2[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02028);
            OUTLINED_FUNCTION_3_3();
            if (v15)
            {
              v4 = v16;
              v8 = v2[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C0);
              OUTLINED_FUNCTION_3_3();
              if (v17)
              {
                v4 = v18;
                v8 = v2[10];
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161C8);
                OUTLINED_FUNCTION_3_3();
                if (v19)
                {
                  v4 = v20;
                  v8 = v2[11];
                }
                else
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D0);
                  OUTLINED_FUNCTION_3_3();
                  if (v21)
                  {
                    v4 = v22;
                    v8 = v2[12];
                  }
                  else
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161D8);
                    OUTLINED_FUNCTION_3_3();
                    if (v23)
                    {
                      v4 = v24;
                      v8 = v2[13];
                    }
                    else
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E0);
                      OUTLINED_FUNCTION_3_3();
                      if (v25)
                      {
                        v4 = v26;
                        v8 = v2[14];
                      }
                      else
                      {
                        v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03161E8);
                        v8 = v2[15];
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
    v5 = v1 + v8;
  }
  return OUTLINED_FUNCTION_9(v5, v0, v0, v4);
}

void sub_1DBE3FF54()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  sub_1DBDD26C4();
  if (v0 <= 0x3F)
  {
    sub_1DBDC4388(319, &qword_1EDB01FC0, (void (*)(void))sub_1DBDD1358, (void (*)(void))sub_1DBDD1394);
    if (v1 <= 0x3F)
    {
      sub_1DBDC4388(319, (unint64_t *)&qword_1EDB01FF0, (void (*)(void))sub_1DBDD0B10, (void (*)(void))sub_1DBDD0B4C);
      if (v2 <= 0x3F)
      {
        sub_1DBDC4388(319, &qword_1F0316280, (void (*)(void))sub_1DBDD76AC, (void (*)(void))sub_1DBDD76EC);
        if (v3 <= 0x3F)
        {
          sub_1DBDC4388(319, &qword_1F0316288, (void (*)(void))sub_1DBE18214, (void (*)(void))sub_1DBE18254);
          if (v4 <= 0x3F)
          {
            sub_1DBDC4388(319, &qword_1EDB02030, (void (*)(void))sub_1DBDCE6F0, (void (*)(void))sub_1DBDCE72C);
            if (v5 <= 0x3F)
            {
              sub_1DBDC4388(319, &qword_1F0316290, (void (*)(void))sub_1DBE3ECCC, (void (*)(void))sub_1DBE3E748);
              if (v6 <= 0x3F)
              {
                sub_1DBDC4388(319, &qword_1F0316298, (void (*)(void))sub_1DBE1AA70, (void (*)(void))sub_1DBE1AAB0);
                if (v7 <= 0x3F)
                {
                  sub_1DBDC4388(319, &qword_1F03162A0, (void (*)(void))sub_1DBE18A28, (void (*)(void))sub_1DBE18A68);
                  if (v8 <= 0x3F)
                  {
                    sub_1DBDC4388(319, &qword_1F03162A8, (void (*)(void))sub_1DBDE7860, (void (*)(void))sub_1DBDE78A0);
                    if (v9 <= 0x3F)
                    {
                      sub_1DBDC4388(319, &qword_1F03162B0, (void (*)(void))sub_1DBE13130, (void (*)(void))sub_1DBE13170);
                      if (v10 <= 0x3F)
                      {
                        sub_1DBDC4388(319, qword_1F03162B8, (void (*)(void))sub_1DBDD31CC, (void (*)(void))sub_1DBDD320C);
                        if (v11 <= 0x3F)
                          swift_initStructMetadata();
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

uint64_t *initializeBufferWithCopyOfBuffer for ReportWeatherEvent.Model(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v34 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DBE4A37C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = a3[8];
    v14 = (char *)a1 + v12;
    v15 = (char *)a2 + v12;
    v14[4] = v15[4];
    *(_DWORD *)v14 = *(_DWORD *)v15;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    v16 = a3[10];
    *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    *(_DWORD *)v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    v19 = a3[11];
    v20 = a3[12];
    v21 = (uint64_t *)((char *)a1 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    *v21 = *v22;
    *(_QWORD *)((char *)v21 + 5) = *(_QWORD *)((char *)v22 + 5);
    v23 = (char *)a1 + v20;
    v24 = (char *)a2 + v20;
    *v23 = *v24;
    *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
    v25 = *((_QWORD *)v24 + 3);
    *((_QWORD *)v23 + 2) = *((_QWORD *)v24 + 2);
    *((_QWORD *)v23 + 3) = v25;
    v23[32] = v24[32];
    v26 = a3[13];
    v27 = a3[14];
    v28 = (char *)a1 + v26;
    v29 = (char *)a2 + v26;
    *(_DWORD *)v28 = *(_DWORD *)v29;
    *((_WORD *)v28 + 2) = *((_WORD *)v29 + 2);
    *(uint64_t *)((char *)a1 + v27) = *(uint64_t *)((char *)a2 + v27);
    v30 = a3[15];
    v31 = (uint64_t *)((char *)a1 + v30);
    v32 = (uint64_t *)((char *)a2 + v30);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ReportWeatherEvent.Model(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DBE4A37C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v6 = sub_1DBE4A37C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_BYTE *)(v13 + 4) = *(_BYTE *)(v14 + 4);
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v15 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_DWORD *)v16 = *(_DWORD *)v17;
  *(_BYTE *)(v16 + 4) = *(_BYTE *)(v17 + 4);
  v18 = a3[11];
  v19 = a3[12];
  v20 = (_QWORD *)(a1 + v18);
  v21 = (_QWORD *)(a2 + v18);
  *v20 = *v21;
  *(_QWORD *)((char *)v20 + 5) = *(_QWORD *)((char *)v21 + 5);
  v22 = a1 + v19;
  v23 = a2 + v19;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  v24 = *(_QWORD *)(v23 + 24);
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(v22 + 24) = v24;
  *(_BYTE *)(v22 + 32) = *(_BYTE *)(v23 + 32);
  v25 = a3[13];
  v26 = a3[14];
  v27 = a1 + v25;
  v28 = a2 + v25;
  *(_DWORD *)v27 = *(_DWORD *)v28;
  *(_WORD *)(v27 + 4) = *(_WORD *)(v28 + 4);
  *(_QWORD *)(a1 + v26) = *(_QWORD *)(a2 + v26);
  v29 = a3[15];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;

  v6 = sub_1DBE4A37C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_BYTE *)(a1 + v13);
  v15 = (_BYTE *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  v14[2] = v15[2];
  v14[3] = v15[3];
  v14[4] = v15[4];
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_DWORD *)(v17 + 4) = *(_DWORD *)(v18 + 4);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v19 = a3[10];
  v20 = a1 + v19;
  v21 = (int *)(a2 + v19);
  v22 = *v21;
  *(_BYTE *)(v20 + 4) = *((_BYTE *)v21 + 4);
  *(_DWORD *)v20 = v22;
  v23 = a3[11];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_DWORD *)(v24 + 4) = *(_DWORD *)(v25 + 4);
  v26 = *(_DWORD *)(v25 + 8);
  *(_BYTE *)(v24 + 12) = *(_BYTE *)(v25 + 12);
  *(_DWORD *)(v24 + 8) = v26;
  v27 = a3[12];
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_BYTE *)v28 = *(_BYTE *)(a2 + v27);
  *(_DWORD *)(v28 + 8) = *(_DWORD *)(a2 + v27 + 8);
  *(_DWORD *)(v28 + 12) = *(_DWORD *)(a2 + v27 + 12);
  *(_QWORD *)(v28 + 16) = *(_QWORD *)(a2 + v27 + 16);
  *(_QWORD *)(v28 + 24) = *(_QWORD *)(a2 + v27 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v28 + 32) = *(_BYTE *)(v29 + 32);
  v30 = a3[13];
  v31 = a1 + v30;
  v32 = a2 + v30;
  v33 = *(_WORD *)(v32 + 4);
  *(_DWORD *)v31 = *(_DWORD *)v32;
  *(_WORD *)(v31 + 4) = v33;
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  v34 = a3[15];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_1DBE4A37C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_DWORD *)v10 = *(_DWORD *)v11;
  *(_BYTE *)(v10 + 4) = *(_BYTE *)(v11 + 4);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_BYTE *)(v13 + 4) = *(_BYTE *)(v14 + 4);
  v15 = a3[11];
  v16 = a3[12];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  *v17 = *v18;
  *(_QWORD *)((char *)v17 + 5) = *(_QWORD *)((char *)v18 + 5);
  v19 = a1 + v16;
  v20 = a2 + v16;
  v21 = *(_OWORD *)(v20 + 16);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *(_OWORD *)(v19 + 16) = v21;
  *(_BYTE *)(v19 + 32) = *(_BYTE *)(v20 + 32);
  v22 = a3[13];
  v23 = a3[14];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_WORD *)(v24 + 4) = *(_WORD *)(v25 + 4);
  *(_DWORD *)v24 = *(_DWORD *)v25;
  *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for ReportWeatherEvent.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
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
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = sub_1DBE4A37C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = a3[8];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  *(_DWORD *)(v14 + 1) = *(_DWORD *)(v15 + 1);
  v16 = a1 + v13;
  v17 = a2 + v13;
  *(_BYTE *)v16 = *(_BYTE *)v17;
  *(_DWORD *)(v16 + 4) = *(_DWORD *)(v17 + 4);
  v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_DWORD *)v19 = *(_DWORD *)v20;
  *(_BYTE *)(v19 + 4) = *(_BYTE *)(v20 + 4);
  v21 = a3[11];
  v22 = a3[12];
  v23 = a1 + v21;
  v24 = a2 + v21;
  *(_BYTE *)v23 = *(_BYTE *)v24;
  v25 = *(_DWORD *)(v24 + 8);
  *(_DWORD *)(v23 + 4) = *(_DWORD *)(v24 + 4);
  *(_DWORD *)(v23 + 8) = v25;
  *(_BYTE *)(v23 + 12) = *(_BYTE *)(v24 + 12);
  v26 = a1 + v22;
  v27 = a2 + v22;
  *(_BYTE *)v26 = *(_BYTE *)(a2 + v22);
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(a2 + v22 + 8);
  v28 = *(_QWORD *)(a2 + v22 + 16);
  v29 = *(_QWORD *)(a2 + v22 + 24);
  *(_QWORD *)(v26 + 16) = v28;
  *(_QWORD *)(v26 + 24) = v29;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v26 + 32) = *(_BYTE *)(v27 + 32);
  v30 = a3[13];
  v31 = a3[14];
  v32 = a1 + v30;
  v33 = a2 + v30;
  *(_WORD *)(v32 + 4) = *(_WORD *)(v33 + 4);
  *(_DWORD *)v32 = *(_DWORD *)v33;
  *(_QWORD *)(a1 + v31) = *(_QWORD *)(a2 + v31);
  v34 = a3[15];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (uint64_t *)(a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE409D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_9_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return OUTLINED_FUNCTION_8(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ReportWeatherEvent.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1DBE40A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_3();
  if (v4)
    OUTLINED_FUNCTION_9(v1, v0, v0, v3);
  else
    *(_QWORD *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
}

uint64_t sub_1DBE40AA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DBE4A37C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReportWeatherEvent.Model.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ReportWeatherEvent.Model.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE40C48 + 4 * byte_1DBE5B2B1[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1DBE40C7C + 4 * byte_1DBE5B2AC[v4]))();
}

uint64_t sub_1DBE40C7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE40C84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE40C8CLL);
  return result;
}

uint64_t sub_1DBE40C98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE40CA0);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1DBE40CA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE40CAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReportWeatherEvent.Model.CodingKeys()
{
  return &type metadata for ReportWeatherEvent.Model.CodingKeys;
}

unint64_t sub_1DBE40CCC()
{
  unint64_t result;

  result = qword_1F03163C8;
  if (!qword_1F03163C8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B5AC, &type metadata for ReportWeatherEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03163C8);
  }
  return result;
}

unint64_t sub_1DBE40D0C()
{
  unint64_t result;

  result = qword_1F03163D0;
  if (!qword_1F03163D0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B51C, &type metadata for ReportWeatherEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03163D0);
  }
  return result;
}

unint64_t sub_1DBE40D4C()
{
  unint64_t result;

  result = qword_1F03163D8;
  if (!qword_1F03163D8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B544, &type metadata for ReportWeatherEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03163D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 176) + 8))(v0, *(_QWORD *)(v1 - 168));
}

WeatherAnalytics::TemperatureScaleData __swiftcall TemperatureScaleData.init(temperatureScale:)(WeatherAnalytics::TemperatureScaleData temperatureScale)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)temperatureScale.temperatureScale;
  return temperatureScale;
}

void TemperatureScaleData.temperatureScale.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1DBE40DB0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x80000001DBE5FB40)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1DBE4ACF4();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_1DBE40E34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE40DB0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1DBE40E5C()
{
  sub_1DBDCE974();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE40E84()
{
  sub_1DBDCE974();
  return sub_1DBE4ADCC();
}

void TemperatureScaleData.init(from:)(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03108);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBDCE974();
  sub_1DBE4AD9C();
  if (!v2)
  {
    sub_1DBE40F9C();
    sub_1DBE4AC28();
    OUTLINED_FUNCTION_1_4(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    *a2 = v7;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE40F9C()
{
  unint64_t result;

  result = qword_1EDB02E20;
  if (!qword_1EDB02E20)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for TemperatureScale, &type metadata for TemperatureScale);
    atomic_store(result, (unint64_t *)&qword_1EDB02E20);
  }
  return result;
}

void sub_1DBE40FD8(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  TemperatureScaleData.init(from:)(a1, a2);
}

uint64_t storeEnumTagSinglePayload for TemperatureScaleData(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE41038 + 4 * byte_1DBE5B635[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DBE4106C + 4 * byte_1DBE5B630[v4]))();
}

uint64_t sub_1DBE4106C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE41074(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE4107CLL);
  return result;
}

uint64_t sub_1DBE41088(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE41090);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DBE41094(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE4109C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

unint64_t sub_1DBE410AC()
{
  unint64_t result;

  result = qword_1F03163E0;
  if (!qword_1F03163E0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5B790, &type metadata for TemperatureScaleData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03163E0);
  }
  return result;
}

uint64_t sub_1DBE410E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_2_39
                                                                     + 4 * byte_1DBE5B810[a1]))(0xD000000000000015, 0x80000001DBE5FB90);
}

uint64_t sub_1DBE4112C()
{
  return OUTLINED_FUNCTION_3_29();
}

uint64_t sub_1DBE4113C()
{
  return sub_1DBE49D40();
}

uint64_t sub_1DBE4115C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DBE49DDC();
  *a1 = v3;
  return result;
}

uint64_t WidgetAssembly.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t WidgetAssembly.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t WidgetAssembly.load(in:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[4];

  v9 = sub_1DBE4A484();
  v0 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v2 = (char *)&v10[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DBE4A520();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05210);
  OUTLINED_FUNCTION_0_31();
  swift_release();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_2();
  sub_1DBE4A0B8();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_4();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DB4A08], v3);
  sub_1DBE4A3F4();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04C30);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_6_23();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_4_23();
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04A28);
  OUTLINED_FUNCTION_1_3();
  swift_release();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03E58);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_6_23();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_4_23();
  sub_1DBE4A4B4();
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03178);
  v7 = v9;
  (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E0DB36E0], v9);
  sub_1DBE4A508();
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_1DBE4A4A8();
  sub_1DBE4A4CC();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_1DBE41438(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05200);
  result = sub_1DBE4A478();
  if (v4)
  {
    type metadata accessor for WidgetDynamicEndpoint();
    v2 = swift_allocObject();
    *(_BYTE *)(v2 + 16) = 7;
    sub_1DBDC9658(&v3, v2 + 24);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DBE414CC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_1DBE49FBC();
  MEMORY[0x1E0C80A78](v0);
  sub_1DBDCF41C(&qword_1EDB05208, v1, MEMORY[0x1E0CF7FF0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05248);
  sub_1DBE41DFC();
  sub_1DBE4AB38();
  sub_1DBE4A0B8();
  swift_allocObject();
  return sub_1DBE4A0AC();
}

uint64_t sub_1DBE415AC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _BYTE v17[24];
  uint64_t v18;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05120);
  result = sub_1DBE4A478();
  if (v18)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
    MEMORY[0x1E0C80A78](v4);
    v6 = (_QWORD *)((char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = *v6;
    v9 = type metadata accessor for DiagnosticSubmissionAuthority();
    v16[3] = v9;
    v16[4] = &off_1EA411DC8;
    v16[0] = v8;
    type metadata accessor for WidgetPrivacyValidationProvider();
    v10 = (_QWORD *)swift_allocObject();
    v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v9);
    MEMORY[0x1E0C80A78](v11);
    v13 = (_QWORD *)((char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v14 + 16))(v13);
    v15 = *v13;
    v10[5] = v9;
    v10[6] = &off_1EA411DC8;
    v10[2] = v15;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    result = sub_1DBDCF41C(&qword_1EDB039F0, (uint64_t (*)(uint64_t))type metadata accessor for WidgetPrivacyValidationProvider, (uint64_t)&unk_1DBE4EA40);
    *a2 = v10;
    a2[1] = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DBE41744@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB05200);
  result = sub_1DBE4A478();
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB052B0);
    result = sub_1DBE4A478();
    if (v8)
    {
      v5 = type metadata accessor for WidgetTelemetryPrivacySampler();
      v6 = swift_allocObject();
      type metadata accessor for AppConfigTelemetryPrivacySampler();
      swift_allocObject();
      result = sub_1DBDCD25C(&v9, &v7);
      *(_QWORD *)(v6 + 16) = result;
      a2[3] = v5;
      a2[4] = (uint64_t)&off_1EA410BD0;
      *a2 = v6;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DBE4184C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  _BYTE v19[24];
  uint64_t v20;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03E50);
  result = sub_1DBE4A478();
  if (v20)
  {
    v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    MEMORY[0x1E0C80A78](v4);
    v6 = (_QWORD *)((char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    v8 = *v6;
    v9 = type metadata accessor for AppAnalyticsFlushManager();
    v18[3] = v9;
    v18[4] = &off_1EA40A6C8;
    v18[0] = v8;
    v10 = type metadata accessor for WidgetFlushManager();
    v11 = (_QWORD *)swift_allocObject();
    v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v9);
    MEMORY[0x1E0C80A78](v12);
    v14 = (_QWORD *)((char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1EA40A6C8;
    v11[2] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03EC0);
    v17 = swift_allocObject();
    *(_DWORD *)(v17 + 24) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    v11[7] = v17;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    a2[3] = v10;
    a2[4] = &off_1EA406D30;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DBE419F8(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9[2];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[40];

  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB052C0);
  result = sub_1DBE4A478();
  if (v14)
  {
    sub_1DBDC9658(&v13, (uint64_t)v15);
    __swift_project_boxed_opaque_existential_1(a2, a2[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03180);
    result = sub_1DBE4A478();
    if (v11)
    {
      sub_1DBDC9658(&v10, (uint64_t)&v13);
      sub_1DBDC9614((uint64_t)v15, (uint64_t)&v10);
      sub_1DBDC9614((uint64_t)&v13, (uint64_t)v9);
      v5 = type metadata accessor for GeocodeTelemetry();
      swift_allocObject();
      v6 = GeocodeTelemetry.init(backend:clock:)(&v10, v9);
      v7 = a1[3];
      v8 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v7);
      v11 = v5;
      v12 = sub_1DBDCF41C(qword_1EDB03378, (uint64_t (*)(uint64_t))type metadata accessor for GeocodeTelemetry, (uint64_t)&protocol conformance descriptor for GeocodeTelemetry);
      *(_QWORD *)&v10 = v6;
      MEMORY[0x1DF0BAB64](&v10, v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DBE41B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1DBE4A520();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03180);
  sub_1DBE4A4E4();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03E50);
  sub_1DBE4A4E4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DB4A18], v0);
  sub_1DBE4A3F4();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB052B0);
  sub_1DBE4A4E4();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB052B8);
  sub_1DBE4A4E4();
  return swift_release();
}

uint64_t sub_1DBE41CD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1DBE49CD4();
  v3 = MEMORY[0x1E0DC8C08];
  a1[3] = v2;
  a1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_1DBE49CC8();
}

uint64_t sub_1DBE41D18@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE49FF8();
  result = sub_1DBE4A46C();
  if (result)
  {
    v4 = result;
    v5 = type metadata accessor for AppAnalyticsFlushManager();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    a2[3] = v5;
    a2[4] = (uint64_t)&off_1EA40A6C8;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t WidgetAssembly.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t WidgetAssembly.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DBE41DB4()
{
  return WidgetAssembly.load(in:)();
}

uint64_t type metadata accessor for WidgetAssembly()
{
  return objc_opt_self();
}

uint64_t method lookup function for WidgetAssembly()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WidgetAssembly.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_1DBE41DFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDB05250;
  if (!qword_1EDB05250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB05248);
    result = MEMORY[0x1DF0BBF5C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDB05250);
  }
  return result;
}

WeatherAnalytics::DisplayModeType_optional __swiftcall DisplayModeType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::DisplayModeType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t DisplayModeType.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aUnknown_52[8 * *v0];
}

void sub_1DBE41EB8()
{
  sub_1DBDF59CC();
}

unint64_t sub_1DBE41EC8()
{
  unint64_t result;

  result = qword_1F03163E8;
  if (!qword_1F03163E8)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for DisplayModeType, &type metadata for DisplayModeType);
    atomic_store(result, (unint64_t *)&qword_1F03163E8);
  }
  return result;
}

void sub_1DBE41F04()
{
  sub_1DBE48500();
}

uint64_t sub_1DBE41F0C()
{
  return sub_1DBE48BAC();
}

void sub_1DBE41F14()
{
  sub_1DBE49480();
}

WeatherAnalytics::DisplayModeType_optional sub_1DBE41F1C(Swift::String *a1)
{
  return DisplayModeType.init(rawValue:)(*a1);
}

uint64_t sub_1DBE41F28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DisplayModeType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DBE41F4C()
{
  sub_1DBE420C0();
  return sub_1DBE4A97C();
}

uint64_t sub_1DBE41FA8()
{
  sub_1DBE420C0();
  return sub_1DBE4A970();
}

uint64_t storeEnumTagSinglePayload for DisplayModeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE42040 + 4 * byte_1DBE5B915[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1DBE42074 + 4 * byte_1DBE5B910[v4]))();
}

uint64_t sub_1DBE42074(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE4207C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE42084);
  return result;
}

uint64_t sub_1DBE42090(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE42098);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1DBE4209C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE420A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisplayModeType()
{
  return &type metadata for DisplayModeType;
}

unint64_t sub_1DBE420C0()
{
  unint64_t result;

  result = qword_1F03163F0;
  if (!qword_1F03163F0)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for DisplayModeType, &type metadata for DisplayModeType);
    atomic_store(result, (unint64_t *)&qword_1F03163F0);
  }
  return result;
}

uint64_t sub_1DBE420FC(char a1)
{
  uint64_t v1;
  char v2;
  char v4;

  if ((a1 & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    sub_1DBE49C44();
    sub_1DBE49C38();
    if (qword_1EDB03E48 != -1)
      swift_once();
    sub_1DBE49C2C();
    swift_release();
    v2 = v4;
  }
  *(_BYTE *)(v1 + 16) = v2;
  return v1;
}

void sub_1DBE4218C(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned __int8 *a4)
{
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int v25;
  uint64_t (*v26)(_QWORD);
  uint64_t (*v27)(void);
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(void);
  _BYTE *v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v60 = a4;
  v63 = a2;
  v58 = a1;
  v5 = OUTLINED_FUNCTION_7_18();
  v53 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v53 + 64);
  v7 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v56 = (uint64_t)&v52 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8);
  v54 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v54 + 64);
  v12 = MEMORY[0x1E0C80A78](v10);
  v55 = (uint64_t)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v57 = (uint64_t)&v52 - v13;
  v14 = OUTLINED_FUNCTION_6_24();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  v17 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v52 - v19;
  v21 = sub_1DBE4A670();
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a3[1];
  v61 = *a3;
  v62 = v24;
  LODWORD(v60) = *v60;
  v25 = *(unsigned __int8 *)(v59 + 16);
  sub_1DBDF7D80(v58, (uint64_t)v23, v26);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = MEMORY[0x1E0DCA7C8];
    v28 = v56;
    sub_1DBDF7E50((uint64_t)v23, v56, (uint64_t (*)(_QWORD))MEMORY[0x1E0DCA7C8]);
    sub_1DBDF7D80(v28, (uint64_t)v8, (uint64_t (*)(_QWORD))v27);
    v29 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    v30 = swift_allocObject();
    v31 = ((v29 + v6) & 0xFFFFFFFFFFFFFFF8) + v30;
    sub_1DBDF7E50((uint64_t)v8, v30 + v29, (uint64_t (*)(_QWORD))v27);
    *(_BYTE *)(v30 + v29 + v6) = (_BYTE)v60;
    v32 = v62;
    *(_QWORD *)(v31 + 8) = v61;
    *(_QWORD *)(v31 + 16) = v32;
    v33 = (_QWORD *)OUTLINED_FUNCTION_14_1();
    v33[2] = v63;
    v33[3] = sub_1DBE4308C;
    v33[4] = v30;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_1DBE4A334();
    swift_release();
    swift_release();
    v34 = v28;
    v35 = v27;
  }
  else
  {
    v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F70) + 48);
    LODWORD(v59) = v25;
    v37 = (uint64_t)&v23[v36];
    v38 = (uint64_t)v23;
    v39 = MEMORY[0x1E0DCA5F0];
    sub_1DBDF7E50(v38, (uint64_t)v20, (uint64_t (*)(_QWORD))MEMORY[0x1E0DCA5F0]);
    v40 = v57;
    sub_1DBE430D8(v37, v57);
    sub_1DBDF7D80((uint64_t)v20, (uint64_t)v18, (uint64_t (*)(_QWORD))v39);
    v41 = v55;
    sub_1DBE43120(v40, v55);
    v42 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v43 = v42 + v16;
    v44 = (*(unsigned __int8 *)(v54 + 80) + v43 + 2) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    v45 = (v11 + v44 + 7) & 0xFFFFFFFFFFFFFFF8;
    v46 = swift_allocObject();
    v47 = MEMORY[0x1E0DCA5F0];
    sub_1DBDF7E50((uint64_t)v18, v46 + v42, (uint64_t (*)(_QWORD))MEMORY[0x1E0DCA5F0]);
    v48 = (_BYTE *)(v46 + v43);
    *v48 = (_BYTE)v60;
    v48[1] = v59;
    sub_1DBE430D8(v41, v46 + v44);
    v49 = (_QWORD *)(v46 + v45);
    v50 = v62;
    *v49 = v61;
    v49[1] = v50;
    v51 = (_QWORD *)OUTLINED_FUNCTION_14_1();
    v51[2] = v63;
    v51[3] = sub_1DBE432C0;
    v51[4] = v46;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_1DBE4A334();
    swift_release();
    swift_release();
    sub_1DBDF4310(v40, &qword_1F03163F8);
    v34 = (uint64_t)v20;
    v35 = v47;
  }
  sub_1DBE4334C(v34, (uint64_t (*)(_QWORD))v35);
}

void sub_1DBE425A8(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  uint64_t v34;
  char v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(unint64_t, _QWORD, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  _OWORD v62[9];
  _QWORD v63[18];
  char *v64;
  unsigned __int8 v65;

  *(_QWORD *)&v60 = a6;
  *((_QWORD *)&v60 + 1) = a7;
  LODWORD(v59) = a3;
  v61 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v45 - v13;
  v15 = sub_1DBE49AC4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBE4A730();
  sub_1DBE49A94();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  *(_QWORD *)&v58 = sub_1DBE0A8D0(v20);
  sub_1DBE4A694();
  v57 = sub_1DBE0A8D0(v21);
  sub_1DBE4A6C4();
  v56 = sub_1DBE0A8D0(v22);
  sub_1DBE4A6D0();
  v55 = sub_1DBE0A8D0(v23);
  sub_1DBE4A6DC();
  v54 = sub_1DBE0A8D0(v24);
  sub_1DBE4A6AC();
  v53 = sub_1DBE0A8D0(v25);
  v52 = sub_1DBE4A6A0();
  v51 = sub_1DBE4A6B8();
  v50 = sub_1DBE4A724();
  sub_1DBE21498();
  v49 = v65;
  v48 = sub_1DBE4A6E8();
  v26 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v46 = sub_1DBDC4604(v26);
  v28 = v27;
  sub_1DBE21588(&v64);
  v47 = v64;
  if ((a4 & 1) != 0)
  {
    v45 = sub_1DBE4A718();
    v30 = v29;
  }
  else
  {
    v45 = 0;
    v30 = 0;
  }
  v31 = a5;
  sub_1DBE43120(a5, (uint64_t)v14);
  v32 = sub_1DBE4A70C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v32);
  if (EnumTagSinglePayload == 1)
  {
    sub_1DBDF4310((uint64_t)v14, &qword_1F03163F8);
    v34 = 0;
  }
  else
  {
    v34 = sub_1DBE4A6F4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v14, v32);
  }
  sub_1DBE43120(v31, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v32) == 1)
  {
    sub_1DBDF4310((uint64_t)v12, &qword_1F03163F8);
    v35 = 2;
  }
  else
  {
    v36 = sub_1DBE4A700();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v12, v32);
    v35 = v36 & 1;
  }
  v63[0] = v58;
  v63[1] = v57;
  v37 = 0x80000001DBE5EB10;
  v63[2] = v56;
  v63[3] = v55;
  v38 = 0xD000000000000011;
  if (v28)
  {
    v37 = v28;
    v38 = v46;
  }
  v63[4] = v54;
  v63[5] = v53;
  LOBYTE(v63[6]) = 0;
  v63[7] = v52;
  v63[8] = v51;
  v63[9] = v50;
  LOBYTE(v63[10]) = v49;
  BYTE1(v63[10]) = v59;
  BYTE2(v63[10]) = v48 & 1;
  v63[11] = v38;
  v63[12] = v37;
  v63[13] = v47;
  v63[14] = v45;
  v63[15] = v30;
  v63[16] = v34;
  LOBYTE(v63[17]) = EnumTagSinglePayload == 1;
  BYTE1(v63[17]) = v35;
  memcpy(v62, v63, 0x8AuLL);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04B38);
  v39 = sub_1DBE4A0A0();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  v42 = swift_allocObject();
  v58 = xmmword_1DBE4E290;
  *(_OWORD *)(v42 + 16) = xmmword_1DBE4E290;
  v43 = *(void (**)(unint64_t, _QWORD, uint64_t))(v40 + 104);
  v43(v42 + v41, *MEMORY[0x1E0CF8170], v39);
  sub_1DBE43374();
  sub_1DBE4A04C();
  swift_bridgeObjectRelease();
  sub_1DBDFA668((uint64_t)v63);
  v62[0] = v60;
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v58;
  v43(v44 + v41, *MEMORY[0x1E0CF8168], v39);
  sub_1DBDF42D4();
  sub_1DBE4A04C();
  swift_bridgeObjectRelease();
  type metadata accessor for TelemetryEvent();
  sub_1DBDCC378(&qword_1EDB022A8, (uint64_t (*)(uint64_t))type metadata accessor for TelemetryEvent, (uint64_t)&protocol conformance descriptor for TelemetryEvent);
  memset(v62, 0, 32);
  sub_1DBE4A058();
  sub_1DBDF4310((uint64_t)v62, qword_1EDB03ED0);
}

void sub_1DBE42AC8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (*v40)(unint64_t, _QWORD, uint64_t);
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  unint64_t v51;

  *(_QWORD *)&v45 = a4;
  *((_QWORD *)&v45 + 1) = a5;
  v7 = sub_1DBE49AE8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DBE4A778();
  if ((*(_BYTE *)(a2 + *(int *)(v11 + 24) + 9) & 1) != 0)
  {
    v12 = sub_1DBE4A76C();
    v13 = sub_1DBE0A8D0(*(double *)(a2 + *(int *)(v11 + 20)));
    v14 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v15 = sub_1DBDC4604(v14);
    v17 = 0xD000000000000011;
    if (v16)
      v17 = v15;
    *(_QWORD *)&v46 = v12;
    *((_QWORD *)&v46 + 1) = v13;
    LOBYTE(v47) = a3;
    if (v16)
      v18 = v16;
    else
      v18 = 0x80000001DBE5EB10;
    *((_QWORD *)&v47 + 1) = v17;
    v48 = v18;
    sub_1DBE433B0();
    sub_1DBE4A04C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04B38);
    v19 = sub_1DBE4A0A0();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1DBE4E290;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v20 + 104))(v22 + v21, *MEMORY[0x1E0CF8168], v19);
    sub_1DBDF42D4();
    sub_1DBE4A04C();
    swift_bridgeObjectRelease();
    sub_1DBE49ADC();
    sub_1DBE49AD0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_1DBE4A01C();
    swift_bridgeObjectRelease();
    type metadata accessor for NetworkOperationFailedEvent();
    sub_1DBDCC378(&qword_1EDB04690, (uint64_t (*)(uint64_t))type metadata accessor for NetworkOperationFailedEvent, (uint64_t)&protocol conformance descriptor for NetworkOperationFailedEvent);
    v46 = 0u;
    v47 = 0u;
    sub_1DBE4A058();
    sub_1DBDF4310((uint64_t)&v46, qword_1EDB03ED0);
    sub_1DBE4A028();
  }
  else
  {
    sub_1DBE49A94();
    v24 = sub_1DBE0A8D0(v23);
    v25 = sub_1DBE0A8D0(*(double *)(a2 + *(int *)(v11 + 20)));
    v26 = sub_1DBE4A754();
    v28 = v27;
    v29 = sub_1DBE4A760();
    v30 = sub_1DBE4A76C();
    v44 = v30;
    v31 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v32 = sub_1DBDC4604(v31);
    v34 = 0xD000000000000011;
    *(_QWORD *)&v46 = v24;
    *((_QWORD *)&v46 + 1) = v25;
    *(_QWORD *)&v47 = v26;
    if (v33)
      v34 = v32;
    BYTE8(v47) = v28 & 1;
    BYTE9(v47) = v29;
    if (v33)
      v35 = v33;
    else
      v35 = 0x80000001DBE5EB10;
    v48 = v30;
    v49 = a3;
    v50 = v34;
    v51 = v35;
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04B38);
    v36 = sub_1DBE4A0A0();
    v37 = *(_QWORD *)(v36 - 8);
    v38 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v39 = swift_allocObject();
    v42 = xmmword_1DBE4E290;
    *(_OWORD *)(v39 + 16) = xmmword_1DBE4E290;
    v40 = *(void (**)(unint64_t, _QWORD, uint64_t))(v37 + 104);
    v40(v39 + v38, *MEMORY[0x1E0CF8170], v36);
    sub_1DBE433EC();
    sub_1DBE4A04C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v45;
    v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = v42;
    v40(v41 + v38, *MEMORY[0x1E0CF8168], v36);
    sub_1DBDF42D4();
    sub_1DBE4A04C();
    swift_bridgeObjectRelease();
    type metadata accessor for NetworkOperationEvent();
    sub_1DBDCC378(&qword_1EDB045B0, (uint64_t (*)(uint64_t))type metadata accessor for NetworkOperationEvent, (uint64_t)&protocol conformance descriptor for NetworkOperationEvent);
    v46 = 0u;
    v47 = 0u;
    sub_1DBE4A058();
    sub_1DBDF4310((uint64_t)&v46, qword_1EDB03ED0);
  }
}

uint64_t sub_1DBE42FE0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DBE42FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_7_18();
  OUTLINED_FUNCTION_3_30();
  v4 = v0 + (v3 & ~v2);
  v5 = sub_1DBE49AC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_1DBDCB2FC(*(id *)(v4 + *(int *)(v1 + 24)), *(unsigned __int8 *)(v4 + *(int *)(v1 + 24) + 8), *(_BYTE *)(v4 + *(int *)(v1 + 24) + 9));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1DBE4308C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_18();
  OUTLINED_FUNCTION_3_30();
  sub_1DBE42AC8(a1, v1 + (v4 & ~v3), *(_BYTE *)(v1 + (v4 & ~v3) + *(_QWORD *)(v5 + 64)), *(_QWORD *)((((v4 & ~v3) + *(_QWORD *)(v5 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(_QWORD *)((((v4 & ~v3) + *(_QWORD *)(v5 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 16));
}

uint64_t sub_1DBE430D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE43120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE43168()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_6_24() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8);
  v3 = v0 + v2;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
      v4 = sub_1DBE4A4C0();
      v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
      v6 = v3;
      goto LABEL_3;
    case 0x12u:
      v11 = sub_1DBE4A4C0();
      OUTLINED_FUNCTION_17(v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB020A8);
      swift_bridgeObjectRelease();
      v12 = sub_1DBE4A5D4();
      if (!OUTLINED_FUNCTION_2_40(v12))
      {
        v6 = OUTLINED_FUNCTION_8_24();
LABEL_3:
        v5(v6, v4);
      }
      break;
    default:
      break;
  }
  v7 = sub_1DBE4A70C();
  if (!OUTLINED_FUNCTION_2_40(v7))
  {
    v8 = OUTLINED_FUNCTION_8_24();
    v9(v8);
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1DBE432C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;

  OUTLINED_FUNCTION_6_24();
  OUTLINED_FUNCTION_3_30();
  v5 = v4 & ~v3;
  v7 = v5 + *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F03163F8) - 8);
  v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = (uint64_t *)(v1 + ((*(_QWORD *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1DBE425A8(a1, v1 + v5, *(unsigned __int8 *)(v1 + v7), *(_BYTE *)(v1 + v7 + 1), v1 + v9, *v10, v10[1]);
}

void sub_1DBE4334C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_17(v2);
  OUTLINED_FUNCTION_19();
}

unint64_t sub_1DBE43374()
{
  unint64_t result;

  result = qword_1EDB02448;
  if (!qword_1EDB02448)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for NetworkEventData, &type metadata for NetworkEventData);
    atomic_store(result, (unint64_t *)&qword_1EDB02448);
  }
  return result;
}

unint64_t sub_1DBE433B0()
{
  unint64_t result;

  result = qword_1EDB046F8;
  if (!qword_1EDB046F8)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for NetworkOperationFailedEventData, &type metadata for NetworkOperationFailedEventData);
    atomic_store(result, (unint64_t *)&qword_1EDB046F8);
  }
  return result;
}

unint64_t sub_1DBE433EC()
{
  unint64_t result;

  result = qword_1EDB04620;
  if (!qword_1EDB04620)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for NetworkOperationEventData, &type metadata for NetworkOperationEventData);
    atomic_store(result, (unint64_t *)&qword_1EDB04620);
  }
  return result;
}

WeatherAnalytics::CurrentLocationUpdateFailureReason_optional __swiftcall CurrentLocationUpdateFailureReason.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::CurrentLocationUpdateFailureReason_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CurrentLocationUpdateFailureReason.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DBE434B4 + 4 * byte_1DBE5BB70[*v0]))(0xD000000000000011, 0x80000001DBE5DCF0);
}

uint64_t sub_1DBE434B4()
{
  return 0x74754F656D6974;
}

uint64_t sub_1DBE434CC()
{
  return 0x73696D7265506F6ELL;
}

uint64_t sub_1DBE434EC()
{
  return 0x726568746FLL;
}

void sub_1DBE43500()
{
  sub_1DBDF503C();
}

unint64_t sub_1DBE43510()
{
  unint64_t result;

  result = qword_1F0316400;
  if (!qword_1F0316400)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for CurrentLocationUpdateFailureReason, &type metadata for CurrentLocationUpdateFailureReason);
    atomic_store(result, (unint64_t *)&qword_1F0316400);
  }
  return result;
}

void sub_1DBE4354C()
{
  sub_1DBE4850C();
}

void sub_1DBE43554()
{
  sub_1DBE48630();
}

void sub_1DBE4355C()
{
  sub_1DBE49714();
}

WeatherAnalytics::CurrentLocationUpdateFailureReason_optional sub_1DBE43564(Swift::String *a1)
{
  return CurrentLocationUpdateFailureReason.init(rawValue:)(*a1);
}

uint64_t sub_1DBE43570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CurrentLocationUpdateFailureReason.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DBE43594()
{
  sub_1DBE43708();
  return sub_1DBE4A97C();
}

uint64_t sub_1DBE435F0()
{
  sub_1DBE43708();
  return sub_1DBE4A970();
}

uint64_t storeEnumTagSinglePayload for CurrentLocationUpdateFailureReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE43688 + 4 * byte_1DBE5BB79[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DBE436BC + 4 * byte_1DBE5BB74[v4]))();
}

uint64_t sub_1DBE436BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE436C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE436CCLL);
  return result;
}

uint64_t sub_1DBE436D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE436E0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DBE436E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE436EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CurrentLocationUpdateFailureReason()
{
  return &type metadata for CurrentLocationUpdateFailureReason;
}

unint64_t sub_1DBE43708()
{
  unint64_t result;

  result = qword_1F0316408;
  if (!qword_1F0316408)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for CurrentLocationUpdateFailureReason, &type metadata for CurrentLocationUpdateFailureReason);
    atomic_store(result, (unint64_t *)&qword_1F0316408);
  }
  return result;
}

uint64_t sub_1DBE43744(uint64_t a1)
{
  return sub_1DBDCD8E8(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], qword_1EDB044A8, MEMORY[0x1E0CF8078]);
}

uint64_t static WeatherDataLoadEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1EDB040C0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], (uint64_t)qword_1EDB044A8, a1);
}

uint64_t sub_1DBE43784(uint64_t a1)
{
  return sub_1DBDCD8E8(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], qword_1F0316410, MEMORY[0x1E0CF8380]);
}

uint64_t static WeatherDataLoadEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1EDB040C8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], (uint64_t)qword_1F0316410, a1);
}

uint64_t WeatherDataLoadEvent.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t WeatherDataLoadEvent.timedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_12_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for WeatherDataLoadEvent(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, (uint64_t *)&unk_1EDB044C8);
}

uint64_t WeatherDataLoadEvent.privateUserData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_12_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t WeatherDataLoadEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *MEMORY[0x1E0CF8128];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
  v4 = OUTLINED_FUNCTION_12_17();
  v5 = a1 + *(int *)(v4 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v5, v2, v6);
  v7 = a1 + *(int *)(v4 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  return OUTLINED_FUNCTION_6_3(v7, v2, v8, *(uint64_t (**)(void))(*(_QWORD *)(v8 - 8) + 104));
}

void WeatherDataLoadEvent.Model.data.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  char v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

uint64_t WeatherDataLoadEvent.Model.timedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_13_17();
  OUTLINED_FUNCTION_20();
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for WeatherDataLoadEvent.Model(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, qword_1F0316498);
}

uint64_t WeatherDataLoadEvent.Model.privateUserData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_13_17() + 24));
  v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t WeatherDataLoadEvent.Model.init(data:timedData:privateUserData:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _BYTE *a4@<X8>)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;

  v6 = a1[1];
  v7 = *a3;
  v8 = a3[1];
  *a4 = *a1;
  a4[1] = v6;
  v9 = OUTLINED_FUNCTION_13_17();
  v10 = &a4[*(int *)(v9 + 20)];
  v11 = OUTLINED_FUNCTION_20();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  v13 = &a4[*(int *)(v9 + 24)];
  *v13 = v7;
  v13[1] = v8;
  return result;
}

uint64_t sub_1DBE43A10(char a1)
{
  return *(_QWORD *)&aData_13[8 * a1];
}

uint64_t sub_1DBE43A30()
{
  char *v0;

  return sub_1DBE43A10(*v0);
}

uint64_t sub_1DBE43A38()
{
  sub_1DBE43C08();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE43A60()
{
  sub_1DBE43C08();
  return sub_1DBE4ADCC();
}

uint64_t WeatherDataLoadEvent.Model.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316428);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_17_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE43C08();
  sub_1DBE4ADB4();
  sub_1DBE15C70();
  OUTLINED_FUNCTION_2_2();
  if (!v1)
  {
    type metadata accessor for WeatherDataLoadEvent.Model(0);
    sub_1DBE4A394();
    sub_1DBDEECC4(&qword_1EDB02090, MEMORY[0x1E0CF86D0]);
    sub_1DBE4ACB8();
    sub_1DBDD0B4C();
    OUTLINED_FUNCTION_2_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_1DBE43C08()
{
  unint64_t result;

  result = qword_1F0316430;
  if (!qword_1F0316430)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5BE94, &type metadata for WeatherDataLoadEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316430);
  }
  return result;
}

uint64_t WeatherDataLoadEvent.Model.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v21 = a2;
  v4 = sub_1DBE4A394();
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_17_0();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316438);
  MEMORY[0x1E0C80A78](v25);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE43C08();
  v24 = v6;
  v10 = (uint64_t)v26;
  sub_1DBE4AD9C();
  if (v10)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = v7;
  v26 = a1;
  v11 = v9;
  v12 = v22;
  v13 = v23;
  v29 = 0;
  sub_1DBE15C30();
  OUTLINED_FUNCTION_11_0();
  v14 = BYTE1(v27);
  *v11 = v27;
  v11[1] = v14;
  LOBYTE(v27) = 1;
  sub_1DBDEECC4(&qword_1EDB02098, MEMORY[0x1E0CF86D8]);
  sub_1DBE4AC28();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 32))(&v11[*(int *)(v20 + 20)], v2, v13);
  v29 = 2;
  sub_1DBDD0B10();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_23();
  v15 = v28;
  v16 = v21;
  v17 = &v11[*(int *)(v20 + 24)];
  *v17 = v27;
  v17[1] = v15;
  sub_1DBE43EC8((uint64_t)v11, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_1DBE43F0C((uint64_t)v11);
}

uint64_t sub_1DBE43EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE43F0C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WeatherDataLoadEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DBE43F48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WeatherDataLoadEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_1DBE43F5C(_QWORD *a1)
{
  return WeatherDataLoadEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherDataLoadEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for WeatherDataLoadEvent(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataLoadEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE443F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  OUTLINED_FUNCTION_2_0();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
    OUTLINED_FUNCTION_2_0();
    if (v9)
    {
      v7 = v10;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
      v11 = *(int *)(a3 + 24);
    }
    v8 = a1 + v11;
  }
  return OUTLINED_FUNCTION_8(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for WeatherDataLoadEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE44480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB04498);
  OUTLINED_FUNCTION_3_3();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
    OUTLINED_FUNCTION_3_3();
    if (v10)
    {
      v8 = v11;
      v12 = *(int *)(a4 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
      v12 = *(int *)(a4 + 24);
    }
    v9 = a1 + v12;
  }
  return OUTLINED_FUNCTION_9(v9, a2, a2, v8);
}

void sub_1DBE44508()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1DBDC4388(319, &qword_1EDB044A0, (void (*)(void))sub_1DBE15C30, (void (*)(void))sub_1DBE15C70);
  if (v0 <= 0x3F)
  {
    sub_1DBDD2620();
    if (v1 <= 0x3F)
    {
      sub_1DBDC4388(319, (unint64_t *)&qword_1EDB01FF0, (void (*)(void))sub_1DBDD0B10, (void (*)(void))sub_1DBDD0B4C);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for WeatherDataLoadEvent.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1DBE4A394();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = *(int *)(a3 + 24);
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

_WORD *initializeWithCopy for WeatherDataLoadEvent.Model(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DBE4A394();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for WeatherDataLoadEvent.Model(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1DBE4A394();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = &a1[v10];
  v12 = &a2[v10];
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_WORD *initializeWithTake for WeatherDataLoadEvent.Model(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DBE4A394();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_BYTE *assignWithTake for WeatherDataLoadEvent.Model(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1DBE4A394();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = &a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherDataLoadEvent.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE448D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  unint64_t v9;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_0();
  if (v7)
    return OUTLINED_FUNCTION_8(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherDataLoadEvent.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1DBE44948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char v8;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_3_3();
  if (v8)
    OUTLINED_FUNCTION_9(a1 + *(int *)(a4 + 20), a2, a2, v7);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
}

uint64_t sub_1DBE449B0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DBE4A394();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WeatherDataLoadEvent.Model.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE44A78 + 4 * byte_1DBE5BCC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DBE44AAC + 4 * byte_1DBE5BCC0[v4]))();
}

uint64_t sub_1DBE44AAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE44AB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE44ABCLL);
  return result;
}

uint64_t sub_1DBE44AC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE44AD0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DBE44AD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE44ADC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WeatherDataLoadEvent.Model.CodingKeys()
{
  return &type metadata for WeatherDataLoadEvent.Model.CodingKeys;
}

unint64_t sub_1DBE44AFC()
{
  unint64_t result;

  result = qword_1F03164D8;
  if (!qword_1F03164D8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5BE6C, &type metadata for WeatherDataLoadEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03164D8);
  }
  return result;
}

unint64_t sub_1DBE44B3C()
{
  unint64_t result;

  result = qword_1F03164E0;
  if (!qword_1F03164E0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5BDDC, &type metadata for WeatherDataLoadEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03164E0);
  }
  return result;
}

unint64_t sub_1DBE44B7C()
{
  unint64_t result;

  result = qword_1F03164E8;
  if (!qword_1F03164E8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5BE04, &type metadata for WeatherDataLoadEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03164E8);
  }
  return result;
}

WeatherAnalytics::StartMethod_optional __swiftcall StartMethod.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::StartMethod_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1DBE44C10()
{
  sub_1DBDF5E60();
}

unint64_t sub_1DBE44C20()
{
  unint64_t result;

  result = qword_1F03164F0;
  if (!qword_1F03164F0)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for StartMethod, &type metadata for StartMethod);
    atomic_store(result, (unint64_t *)&qword_1F03164F0);
  }
  return result;
}

void sub_1DBE44C5C()
{
  sub_1DBE48518();
}

void sub_1DBE44C64()
{
  sub_1DBE48E30();
}

void sub_1DBE44C6C()
{
  sub_1DBE493B4();
}

WeatherAnalytics::StartMethod_optional sub_1DBE44C74(Swift::String *a1)
{
  return StartMethod.init(rawValue:)(*a1);
}

uint64_t sub_1DBE44C80()
{
  sub_1DBDD1880();
  return sub_1DBE4A97C();
}

uint64_t sub_1DBE44CDC(uint64_t a1)
{
  return sub_1DBDD3EFC(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], qword_1F03164F8, MEMORY[0x1E0CF8078]);
}

uint64_t static ViewEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F03131A0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], (uint64_t)qword_1F03164F8, a1);
}

uint64_t sub_1DBE44D1C(uint64_t a1)
{
  return sub_1DBDD3EFC(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], qword_1F0316510, MEMORY[0x1E0CF8380]);
}

uint64_t static ViewEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F03131A8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], (uint64_t)qword_1F0316510, a1);
}

uint64_t ViewEvent.viewData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ViewEvent.privateUserData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for ViewEvent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for ViewEvent()
{
  uint64_t result;

  result = qword_1F0316598;
  if (!qword_1F0316598)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ViewEvent.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *MEMORY[0x1E0CF8128];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
  v4 = a1 + *(int *)(type metadata accessor for ViewEvent() + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v4, v2, v5);
}

uint64_t ViewEvent.Model.viewData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int16 v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_WORD *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ViewEvent.Model.privateUserData.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 32);
  *a1 = *(_QWORD *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void __swiftcall ViewEvent.Model.init(viewData:privateUserData:)(WeatherAnalytics::ViewEvent::Model *__return_ptr retstr, WeatherAnalytics::ViewData viewData, WeatherAnalytics::PrivateUserData privateUserData)
{
  void *v3;
  __int16 v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(viewData.viewSessionID._countAndFlagsBits + 8);
  v4 = *(_WORD *)(viewData.viewSessionID._countAndFlagsBits + 16);
  v5 = *(_QWORD *)viewData.viewSessionID._object;
  v6 = (void *)*((_QWORD *)viewData.viewSessionID._object + 1);
  retstr->viewData.viewSessionID._countAndFlagsBits = *(_QWORD *)viewData.viewSessionID._countAndFlagsBits;
  retstr->viewData.viewSessionID._object = v3;
  *(_WORD *)&retstr->viewData.viewType = v4;
  retstr->privateUserData.privateUserID._countAndFlagsBits = v5;
  retstr->privateUserData.privateUserID._object = v6;
}

uint64_t sub_1DBE44EAC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x6174614477656976 && a2 == 0xE800000000000000;
  if (v3 || (sub_1DBE4ACF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5565746176697270 && a2 == 0xEF61746144726573)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1DBE4ACF4();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DBE44FA8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x5565746176697270;
  else
    return 0x6174614477656976;
}

uint64_t sub_1DBE44FEC()
{
  char *v0;

  return sub_1DBE44FA8(*v0);
}

uint64_t sub_1DBE44FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE44EAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DBE45018()
{
  sub_1DBE451A4();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE45040()
{
  sub_1DBE451A4();
  return sub_1DBE4ADCC();
}

void ViewEvent.Model.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316528);
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v6 = v1[1];
  v8 = *((_WORD *)v1 + 8);
  v9 = v1[3];
  v12 = v1[4];
  v13 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE451A4();
  sub_1DBE4ADB4();
  v16 = v7;
  v17 = v6;
  v18 = v8;
  v19 = 0;
  sub_1DBDCCBAC();
  OUTLINED_FUNCTION_2_17();
  v10 = v14;
  sub_1DBE4ACB8();
  if (!v10)
  {
    v16 = v13;
    v17 = v12;
    v19 = 1;
    sub_1DBDD0B4C();
    OUTLINED_FUNCTION_2_17();
    sub_1DBE4ACB8();
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE451A4()
{
  unint64_t result;

  result = qword_1F0316530;
  if (!qword_1F0316530)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C1E4, &type metadata for ViewEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316530);
  }
  return result;
}

void ViewEvent.Model.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316538);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE451A4();
  sub_1DBE4AD9C();
  if (v2)
  {
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    sub_1DBDCCB70();
    OUTLINED_FUNCTION_3_16();
    OUTLINED_FUNCTION_3_11();
    v6 = sub_1DBDD0B10();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_16();
    OUTLINED_FUNCTION_3_11();
    OUTLINED_FUNCTION_0_17();
    if (v6)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_3();
    }
    else
    {
      *(_QWORD *)a2 = v7;
      *(_QWORD *)(a2 + 8) = v8;
      *(_BYTE *)(a2 + 16) = v9;
      *(_BYTE *)(a2 + 17) = v10;
      *(_QWORD *)(a2 + 24) = v7;
      *(_QWORD *)(a2 + 32) = v8;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_4_3();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_1DBE45360(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ViewEvent.Model.init(from:)(a1, a2);
}

void sub_1DBE45374(_QWORD *a1)
{
  ViewEvent.Model.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ViewEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ViewEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ViewEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE456C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ViewEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE45740(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_1DBE457B8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DBDC4388(319, &qword_1EDB02070, (void (*)(void))sub_1DBDCCB70, (void (*)(void))sub_1DBDCCBAC);
  if (v0 <= 0x3F)
  {
    sub_1DBDC4388(319, (unint64_t *)&qword_1EDB01FF0, (void (*)(void))sub_1DBDD0B10, (void (*)(void))sub_1DBDD0B4C);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t destroy for ViewEvent.Model()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ViewEvent.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewEvent.Model(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for ViewEvent.Model(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewEvent.Model()
{
  return &type metadata for ViewEvent.Model;
}

uint64_t storeEnumTagSinglePayload for ViewEvent.Model.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE45A94 + 4 * byte_1DBE5C065[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DBE45AC8 + 4 * byte_1DBE5C060[v4]))();
}

uint64_t sub_1DBE45AC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE45AD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE45AD8);
  return result;
}

uint64_t sub_1DBE45AE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE45AECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DBE45AF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE45AF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ViewEvent.Model.CodingKeys()
{
  return &type metadata for ViewEvent.Model.CodingKeys;
}

unint64_t sub_1DBE45B18()
{
  unint64_t result;

  result = qword_1F03165D0;
  if (!qword_1F03165D0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C1BC, &type metadata for ViewEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03165D0);
  }
  return result;
}

unint64_t sub_1DBE45B58()
{
  unint64_t result;

  result = qword_1F03165D8;
  if (!qword_1F03165D8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C12C, &type metadata for ViewEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03165D8);
  }
  return result;
}

unint64_t sub_1DBE45B98()
{
  unint64_t result;

  result = qword_1F03165E0;
  if (!qword_1F03165E0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C154, &type metadata for ViewEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03165E0);
  }
  return result;
}

uint64_t ForecastAgeData.fetchDate.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ForecastAgeData.init(fetchDate:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1DBE45BE4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7461446863746566 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1DBE4ACF4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1DBE45C70()
{
  return 0x7461446863746566;
}

uint64_t sub_1DBE45C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE45BE4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1DBE45CB8()
{
  sub_1DBE45DB4();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE45CE0()
{
  sub_1DBE45DB4();
  return sub_1DBE4ADCC();
}

void ForecastAgeData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03165E8);
  OUTLINED_FUNCTION_3_15();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE45DB4();
  sub_1DBE4ADB4();
  sub_1DBE4ACC4();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE45DB4()
{
  unint64_t result;

  result = qword_1F03165F0;
  if (!qword_1F03165F0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C3B4, &type metadata for ForecastAgeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03165F0);
  }
  return result;
}

void ForecastAgeData.init(from:)(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  int v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03165F8);
  OUTLINED_FUNCTION_3_15();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE45DB4();
  sub_1DBE4AD9C();
  if (!v2)
  {
    v6 = sub_1DBE4AC34();
    OUTLINED_FUNCTION_1_10();
    *a2 = v6;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0();
}

void sub_1DBE45EC0(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  ForecastAgeData.init(from:)(a1, a2);
}

void sub_1DBE45ED4(_QWORD *a1)
{
  ForecastAgeData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ForecastAgeData()
{
  return &type metadata for ForecastAgeData;
}

uint64_t storeEnumTagSinglePayload for ForecastAgeData.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1DBE45F38 + 4 * byte_1DBE5C240[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DBE45F58 + 4 * byte_1DBE5C245[v4]))();
}

_BYTE *sub_1DBE45F38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DBE45F58(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DBE45F60(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DBE45F68(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DBE45F70(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DBE45F78(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ForecastAgeData.CodingKeys()
{
  return &type metadata for ForecastAgeData.CodingKeys;
}

unint64_t sub_1DBE45F98()
{
  unint64_t result;

  result = qword_1F0316600;
  if (!qword_1F0316600)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C38C, &type metadata for ForecastAgeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316600);
  }
  return result;
}

unint64_t sub_1DBE45FD8()
{
  unint64_t result;

  result = qword_1F0316608;
  if (!qword_1F0316608)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C2FC, &type metadata for ForecastAgeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316608);
  }
  return result;
}

unint64_t sub_1DBE46018()
{
  unint64_t result;

  result = qword_1F0316610;
  if (!qword_1F0316610)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C324, &type metadata for ForecastAgeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316610);
  }
  return result;
}

uint64_t sub_1DBE46054(uint64_t a1)
{
  return sub_1DBDCD8E8(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], qword_1F0316618, MEMORY[0x1E0CF8078]);
}

uint64_t static ComponentEngagementEvent.sessionGroup.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F03131B0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8080], (uint64_t)qword_1F0316618, a1);
}

uint64_t sub_1DBE46094(uint64_t a1)
{
  return sub_1DBDCD8E8(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], qword_1F0316630, MEMORY[0x1E0CF8380]);
}

uint64_t static ComponentEngagementEvent.timestampGranularity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DBDCD954(&qword_1F03131B8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CF8398], (uint64_t)qword_1F0316630, a1);
}

uint64_t ComponentEngagementEvent.eventData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.timedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for ComponentEngagementEvent(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, qword_1F03166B8);
}

uint64_t ComponentEngagementEvent.orientationData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FD8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.locationData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.hostViewData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.privateUserData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.componentData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F88);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.componentPositionData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F98);
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.init()@<X0>(uint64_t a1@<X8>)
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

  v2 = *MEMORY[0x1E0CF8128];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
  v4 = type metadata accessor for ComponentEngagementEvent(0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
  OUTLINED_FUNCTION_8_0(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FD8);
  OUTLINED_FUNCTION_8_0(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
  OUTLINED_FUNCTION_8_0(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
  OUTLINED_FUNCTION_8_0(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
  OUTLINED_FUNCTION_8_0(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F88);
  OUTLINED_FUNCTION_8_0(v10);
  v11 = a1 + *(int *)(v4 + 44);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F98);
  return OUTLINED_FUNCTION_6_3(v11, v2, v12, *(uint64_t (**)(void))(*(_QWORD *)(v12 - 8) + 104));
}

uint64_t ComponentEngagementEvent.Model.eventData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_1DBE4A37C();
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t ComponentEngagementEvent.Model.timedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_10_26();
  OUTLINED_FUNCTION_20();
  v0 = OUTLINED_FUNCTION_1_5();
  return OUTLINED_FUNCTION_0_0(v0, v1, v2, v3);
}

uint64_t type metadata accessor for ComponentEngagementEvent.Model(uint64_t a1)
{
  return sub_1DBDCD7B4(a1, qword_1F0316760);
}

void ComponentEngagementEvent.Model.orientationData.getter()
{
  _WORD *v0;
  uint64_t v1;

  *v0 = *(_WORD *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 24));
  OUTLINED_FUNCTION_19();
}

void ComponentEngagementEvent.Model.locationData.getter()
{
  _OWORD *v0;
  uint64_t v1;

  *v0 = *(_OWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 28));
  OUTLINED_FUNCTION_19();
}

uint64_t ComponentEngagementEvent.Model.hostViewData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 32));
  v4 = *v2;
  v3 = v2[1];
  LOWORD(v2) = *((_WORD *)v2 + 8);
  *(_QWORD *)v0 = v4;
  *(_QWORD *)(v0 + 8) = v3;
  *(_WORD *)(v0 + 16) = (_WORD)v2;
  return OUTLINED_FUNCTION_11();
}

uint64_t ComponentEngagementEvent.Model.privateUserData.getter()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 36));
  v3 = v2[1];
  *v0 = *v2;
  v0[1] = v3;
  return OUTLINED_FUNCTION_11();
}

void ComponentEngagementEvent.Model.componentData.getter()
{
  _BYTE *v0;
  uint64_t v1;

  *v0 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 40));
  OUTLINED_FUNCTION_19();
}

void ComponentEngagementEvent.Model.componentPositionData.getter()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = *(_QWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_10_26() + 44));
  OUTLINED_FUNCTION_19();
}

uint64_t ComponentEngagementEvent.Model.init(eventData:timedData:orientationData:locationData:hostViewData:privateUserData:componentData:componentPositionData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, char *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>)
{
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;

  v13 = *a3;
  v14 = *a4;
  v15 = a4[1];
  v16 = *a5;
  v17 = a5[1];
  v18 = *((_WORD *)a5 + 8);
  v19 = *a6;
  v20 = a6[1];
  v30 = *a7;
  v21 = sub_1DBE4A37C();
  v22 = *a8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(a9, a1, v21);
  v23 = (int *)type metadata accessor for ComponentEngagementEvent.Model(0);
  v24 = a9 + v23[5];
  v25 = OUTLINED_FUNCTION_20();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24, a2, v25);
  *(_WORD *)(a9 + v23[6]) = v13;
  v27 = (_QWORD *)(a9 + v23[7]);
  *v27 = v14;
  v27[1] = v15;
  v28 = a9 + v23[8];
  *(_QWORD *)v28 = v16;
  *(_QWORD *)(v28 + 8) = v17;
  *(_WORD *)(v28 + 16) = v18;
  v29 = (_QWORD *)(a9 + v23[9]);
  *v29 = v19;
  v29[1] = v20;
  *(_BYTE *)(a9 + v23[10]) = v30;
  *(_QWORD *)(a9 + v23[11]) = v22;
  return result;
}

uint64_t sub_1DBE465CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1DBE46604 + 4 * byte_1DBE5C410[a1]))(0xD000000000000015, 0x80000001DBE5DEE0);
}

uint64_t sub_1DBE46604()
{
  return 0x746144746E657665;
}

uint64_t sub_1DBE46630()
{
  return 0x7461746E6569726FLL;
}

uint64_t sub_1DBE46654()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_1DBE46688()
{
  return 0x5565746176697270;
}

uint64_t sub_1DBE466AC()
{
  return 0x6E656E6F706D6F63;
}

uint64_t sub_1DBE466D0()
{
  unsigned __int8 *v0;

  return sub_1DBE465CC(*v0);
}

uint64_t sub_1DBE466D8()
{
  sub_1DBE469C8();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE46700()
{
  sub_1DBE469C8();
  return sub_1DBE4ADCC();
}

uint64_t ComponentEngagementEvent.Model.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316648);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_16();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE469C8();
  sub_1DBE4ADB4();
  sub_1DBE4A37C();
  sub_1DBDCF41C(&qword_1EDB02088, (uint64_t (*)(uint64_t))MEMORY[0x1E0CF8670], MEMORY[0x1E0CF8680]);
  OUTLINED_FUNCTION_13();
  if (!v1)
  {
    type metadata accessor for ComponentEngagementEvent.Model(0);
    sub_1DBE4A394();
    sub_1DBDCF41C(&qword_1EDB02090, (uint64_t (*)(uint64_t))MEMORY[0x1E0CF86C0], MEMORY[0x1E0CF86D0]);
    OUTLINED_FUNCTION_13();
    sub_1DBDD0D98();
    OUTLINED_FUNCTION_4_1();
    sub_1DBDD1394();
    OUTLINED_FUNCTION_4_1();
    sub_1DBDCCBAC();
    OUTLINED_FUNCTION_4_1();
    sub_1DBDD0B4C();
    OUTLINED_FUNCTION_4_1();
    sub_1DBDDF55C();
    OUTLINED_FUNCTION_4_1();
    sub_1DBDDF598();
    OUTLINED_FUNCTION_4_1();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_1DBE469C8()
{
  unint64_t result;

  result = qword_1F0316650;
  if (!qword_1F0316650)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C6A4, &type metadata for ComponentEngagementEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316650);
  }
  return result;
}

uint64_t ComponentEngagementEvent.Model.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  __int128 v24;
  __int16 v25;

  v3 = sub_1DBE4A394();
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_16();
  v6 = v5 - v4;
  v7 = sub_1DBE4A37C();
  v21 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_16();
  v10 = v9 - v8;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0316658);
  v11 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_16();
  v22 = (int *)type metadata accessor for ComponentEngagementEvent.Model(0);
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_16();
  v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE469C8();
  sub_1DBE4AD9C();
  if (v23)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_1DBDCF41C(&qword_1EDB01F10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CF8670], MEMORY[0x1E0CF8688]);
  OUTLINED_FUNCTION_8_4();
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v14, v10);
  LOBYTE(v24) = 1;
  sub_1DBDCF41C(&qword_1EDB02098, (uint64_t (*)(uint64_t))MEMORY[0x1E0CF86C0], MEMORY[0x1E0CF86D8]);
  OUTLINED_FUNCTION_8_4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v14 + v22[5], v6, v20);
  sub_1DBDD0D5C();
  OUTLINED_FUNCTION_2_3();
  *(_WORD *)(v14 + v22[6]) = v24;
  sub_1DBDD1358();
  OUTLINED_FUNCTION_2_3();
  *(_OWORD *)(v14 + v22[7]) = v24;
  sub_1DBDCCB70();
  OUTLINED_FUNCTION_2_3();
  v15 = v14 + v22[8];
  *(_OWORD *)v15 = v24;
  *(_WORD *)(v15 + 16) = v25;
  sub_1DBDD0B10();
  OUTLINED_FUNCTION_2_3();
  *(_OWORD *)(v14 + v22[9]) = v24;
  sub_1DBDDFA68();
  OUTLINED_FUNCTION_2_3();
  *(_BYTE *)(v14 + v22[10]) = 1;
  sub_1DBDDFAA4();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_11_3(*(uint64_t (**)(_QWORD, uint64_t))(v11 + 8));
  *(_QWORD *)(v14 + v22[11]) = v24;
  sub_1DBE46E98(v14, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1DBE46EDC(v14);
}

uint64_t sub_1DBE46E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ComponentEngagementEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DBE46EDC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ComponentEngagementEvent.Model(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DBE46F18@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ComponentEngagementEvent.Model.init(from:)(a1, a2);
}

uint64_t sub_1DBE46F2C(_QWORD *a1)
{
  return ComponentEngagementEvent.Model.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for ComponentEngagementEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE46F58(uint64_t a1, uint64_t a2, int *a3)
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
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  OUTLINED_FUNCTION_2_0();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
    OUTLINED_FUNCTION_2_0();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FD8);
      OUTLINED_FUNCTION_2_0();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
        OUTLINED_FUNCTION_2_0();
        if (v14)
        {
          v7 = v15;
          v11 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
          OUTLINED_FUNCTION_2_0();
          if (v16)
          {
            v7 = v17;
            v11 = a3[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
            OUTLINED_FUNCTION_2_0();
            if (v18)
            {
              v7 = v19;
              v11 = a3[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F88);
              OUTLINED_FUNCTION_2_0();
              if (v20)
              {
                v7 = v21;
                v11 = a3[10];
              }
              else
              {
                v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F98);
                v11 = a3[11];
              }
            }
          }
        }
      }
    }
    v8 = a1 + v11;
  }
  return OUTLINED_FUNCTION_8(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for ComponentEngagementEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE47084(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
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
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F68);
  OUTLINED_FUNCTION_3_3();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01F70);
    OUTLINED_FUNCTION_3_3();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FD8);
      OUTLINED_FUNCTION_3_3();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FB8);
        OUTLINED_FUNCTION_3_3();
        if (v15)
        {
          v8 = v16;
          v12 = a4[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB02068);
          OUTLINED_FUNCTION_3_3();
          if (v17)
          {
            v8 = v18;
            v12 = a4[8];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB01FE8);
            OUTLINED_FUNCTION_3_3();
            if (v19)
            {
              v8 = v20;
              v12 = a4[9];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F88);
              OUTLINED_FUNCTION_3_3();
              if (v21)
              {
                v8 = v22;
                v12 = a4[10];
              }
              else
              {
                v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB03F98);
                v12 = a4[11];
              }
            }
          }
        }
      }
    }
    v9 = a1 + v12;
  }
  return OUTLINED_FUNCTION_9(v9, a2, a2, v8);
}

uint64_t getEnumTagSinglePayload for ComponentEngagementEvent.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DBE471B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v12;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_2_0();
  if (v9)
  {
    v7 = v6;
    v8 = v4;
    return OUTLINED_FUNCTION_8(v8, v3, v7);
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_0();
  if (v9)
  {
    v7 = v10;
    v8 = v4 + *(int *)(a3 + 20);
    return OUTLINED_FUNCTION_8(v8, v3, v7);
  }
  v12 = *(_QWORD *)(v4 + *(int *)(a3 + 32) + 8);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentEngagementEvent.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1DBE47240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_3_3();
  if (v10)
  {
    v8 = v7;
    v9 = v5;
  }
  else
  {
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_3_3();
    if (!v10)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 32) + 8) = (v4 - 1);
      return;
    }
    v8 = v11;
    v9 = v5 + *(int *)(a4 + 20);
  }
  OUTLINED_FUNCTION_9(v9, v4, v4, v8);
}

uint64_t sub_1DBE472B8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1DBE4A37C();
  if (v1 <= 0x3F)
  {
    result = sub_1DBE4A394();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ComponentEngagementEvent.Model.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE473C4 + 4 * byte_1DBE5C41D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1DBE473F8 + 4 * byte_1DBE5C418[v4]))();
}

uint64_t sub_1DBE473F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47400(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE47408);
  return result;
}

uint64_t sub_1DBE47414(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE4741CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1DBE47420(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47428(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentEngagementEvent.Model.CodingKeys()
{
  return &type metadata for ComponentEngagementEvent.Model.CodingKeys;
}

unint64_t sub_1DBE47448()
{
  unint64_t result;

  result = qword_1F03167B0;
  if (!qword_1F03167B0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C67C, &type metadata for ComponentEngagementEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167B0);
  }
  return result;
}

unint64_t sub_1DBE47488()
{
  unint64_t result;

  result = qword_1F03167B8;
  if (!qword_1F03167B8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C5EC, &type metadata for ComponentEngagementEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167B8);
  }
  return result;
}

unint64_t sub_1DBE474C8()
{
  unint64_t result;

  result = qword_1F03167C0;
  if (!qword_1F03167C0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C614, &type metadata for ComponentEngagementEvent.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167C0);
  }
  return result;
}

uint64_t URLData.url.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void URLData.linkType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

WeatherAnalytics::URLData __swiftcall URLData.init(url:linkType:)(Swift::String url, WeatherAnalytics::LinkType linkType)
{
  uint64_t v2;
  char v3;
  WeatherAnalytics::URLData result;

  v3 = *(_BYTE *)linkType;
  *(Swift::String *)v2 = url;
  *(_BYTE *)(v2 + 16) = v3;
  result.url = url;
  result.linkType = linkType;
  return result;
}

uint64_t sub_1DBE4754C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 7107189 && a2 == 0xE300000000000000;
  if (v3 || (sub_1DBE4ACF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657079546B6E696CLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1DBE4ACF4();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DBE47620(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657079546B6E696CLL;
  else
    return 7107189;
}

uint64_t sub_1DBE47650()
{
  char *v0;

  return sub_1DBE47620(*v0);
}

uint64_t sub_1DBE47658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DBE4754C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DBE4767C()
{
  sub_1DBE47800();
  return sub_1DBE4ADC0();
}

uint64_t sub_1DBE476A4()
{
  sub_1DBE47800();
  return sub_1DBE4ADCC();
}

void URLData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03167C8);
  v8 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE47800();
  sub_1DBE4ADB4();
  v12 = 0;
  sub_1DBE4AC88();
  if (!v2)
  {
    v11 = v9;
    v10 = 1;
    sub_1DBE4783C();
    sub_1DBE4ACB8();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v4);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE47800()
{
  unint64_t result;

  result = qword_1F03167D0;
  if (!qword_1F03167D0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C87C, &type metadata for URLData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167D0);
  }
  return result;
}

unint64_t sub_1DBE4783C()
{
  unint64_t result;

  result = qword_1F03167D8;
  if (!qword_1F03167D8)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for LinkType, &type metadata for LinkType);
    atomic_store(result, (unint64_t *)&qword_1F03167D8);
  }
  return result;
}

void URLData.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03167E0);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DBE47800();
  sub_1DBE4AD9C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v6 = sub_1DBE4ABF8();
    v8 = v7;
    sub_1DBE479E0();
    swift_bridgeObjectRetain();
    sub_1DBE4AC28();
    OUTLINED_FUNCTION_0_17();
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 16) = v9;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1DBE479E0()
{
  unint64_t result;

  result = qword_1F03167E8;
  if (!qword_1F03167E8)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for LinkType, &type metadata for LinkType);
    atomic_store(result, (unint64_t *)&qword_1F03167E8);
  }
  return result;
}

void sub_1DBE47A24(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  URLData.init(from:)(a1, a2);
}

void sub_1DBE47A38(_QWORD *a1)
{
  URLData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for URLData()
{
  return &type metadata for URLData;
}

uint64_t storeEnumTagSinglePayload for URLData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE47AA8 + 4 * byte_1DBE5C705[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DBE47ADC + 4 * byte_1DBE5C700[v4]))();
}

uint64_t sub_1DBE47ADC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47AE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE47AECLL);
  return result;
}

uint64_t sub_1DBE47AF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE47B00);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DBE47B04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47B0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for URLData.CodingKeys()
{
  return &type metadata for URLData.CodingKeys;
}

unint64_t sub_1DBE47B2C()
{
  unint64_t result;

  result = qword_1F03167F0;
  if (!qword_1F03167F0)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C854, &type metadata for URLData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167F0);
  }
  return result;
}

unint64_t sub_1DBE47B6C()
{
  unint64_t result;

  result = qword_1F03167F8;
  if (!qword_1F03167F8)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C7C4, &type metadata for URLData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F03167F8);
  }
  return result;
}

unint64_t sub_1DBE47BAC()
{
  unint64_t result;

  result = qword_1F0316800;
  if (!qword_1F0316800)
  {
    result = MEMORY[0x1DF0BBF5C](&unk_1DBE5C7EC, &type metadata for URLData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F0316800);
  }
  return result;
}

WeatherAnalytics::EndReason_optional __swiftcall EndReason.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::EndReason_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t EndReason.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aUnknown_53[8 * *v0];
}

void sub_1DBE47C60()
{
  sub_1DBDF4F28();
}

unint64_t sub_1DBE47C70()
{
  unint64_t result;

  result = qword_1F0316808;
  if (!qword_1F0316808)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for EndReason, &type metadata for EndReason);
    atomic_store(result, (unint64_t *)&qword_1F0316808);
  }
  return result;
}

void sub_1DBE47CAC()
{
  sub_1DBE48524();
}

uint64_t sub_1DBE47CB4()
{
  return sub_1DBE4857C();
}

void sub_1DBE47CBC()
{
  sub_1DBE497CC();
}

WeatherAnalytics::EndReason_optional sub_1DBE47CC4(Swift::String *a1)
{
  return EndReason.init(rawValue:)(*a1);
}

uint64_t sub_1DBE47CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = EndReason.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DBE47CF4()
{
  sub_1DBE47E58();
  return sub_1DBE4A97C();
}

uint64_t sub_1DBE47D50()
{
  sub_1DBE47E58();
  return sub_1DBE4A970();
}

uint64_t storeEnumTagSinglePayload for EndReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE47DE8 + 4 * byte_1DBE5C8D5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1DBE47E1C + 4 * byte_1DBE5C8D0[v4]))();
}

uint64_t sub_1DBE47E1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47E24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE47E2CLL);
  return result;
}

uint64_t sub_1DBE47E38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE47E40);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1DBE47E44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE47E4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

unint64_t sub_1DBE47E58()
{
  unint64_t result;

  result = qword_1EDB02A18;
  if (!qword_1EDB02A18)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for EndReason, &type metadata for EndReason);
    atomic_store(result, (unint64_t *)&qword_1EDB02A18);
  }
  return result;
}

WeatherAnalytics::MapOverlay_optional __swiftcall MapOverlay.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::MapOverlay_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t MapOverlay.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aPrecipittemper_0[8 * *v0];
}

void sub_1DBE47F0C()
{
  sub_1DBDF62E8();
}

unint64_t sub_1DBE47F1C()
{
  unint64_t result;

  result = qword_1F0316810;
  if (!qword_1F0316810)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for MapOverlay, &type metadata for MapOverlay);
    atomic_store(result, (unint64_t *)&qword_1F0316810);
  }
  return result;
}

void sub_1DBE47F58()
{
  sub_1DBE48530();
}

uint64_t sub_1DBE47F60()
{
  return sub_1DBE490A8();
}

void sub_1DBE47F68()
{
  sub_1DBE49300();
}

WeatherAnalytics::MapOverlay_optional sub_1DBE47F70(Swift::String *a1)
{
  return MapOverlay.init(rawValue:)(*a1);
}

uint64_t sub_1DBE47F7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MapOverlay.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DBE47FA0()
{
  sub_1DBE48114();
  return sub_1DBE4A97C();
}

uint64_t sub_1DBE47FFC()
{
  sub_1DBE48114();
  return sub_1DBE4A970();
}

uint64_t storeEnumTagSinglePayload for MapOverlay(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE48094 + 4 * byte_1DBE5CA55[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DBE480C8 + 4 * byte_1DBE5CA50[v4]))();
}

uint64_t sub_1DBE480C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE480D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE480D8);
  return result;
}

uint64_t sub_1DBE480E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE480ECLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DBE480F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE480F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MapOverlay()
{
  return &type metadata for MapOverlay;
}

unint64_t sub_1DBE48114()
{
  unint64_t result;

  result = qword_1F0316818;
  if (!qword_1F0316818)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for MapOverlay, &type metadata for MapOverlay);
    atomic_store(result, (unint64_t *)&qword_1F0316818);
  }
  return result;
}

_BYTE *Configuration.init(enablement:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t getEnumTagSinglePayload for Configuration.Enablement(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1DBE481AC + 4 * byte_1DBE5CBBA[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for Configuration.Enablement(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1DBE48264 + 4 * byte_1DBE5CBC4[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DBE48298 + 4 * byte_1DBE5CBBF[v5]))();
}

uint64_t sub_1DBE48298(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE482A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE482A8);
  return result;
}

uint64_t sub_1DBE482B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE482BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DBE482C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE482C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE482D4(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_1DBE482F0(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for Configuration.Enablement()
{
  return &type metadata for Configuration.Enablement;
}

void sub_1DBE48318(uint64_t a1)
{
  OUTLINED_FUNCTION_12_18(a1, a1, (void (*)(uint64_t))LocationCondition.rawValue.getter);
}

void sub_1DBE48338()
{
  sub_1DBE4853C();
}

void sub_1DBE48344()
{
  sub_1DBE493CC();
}

void sub_1DBE48350()
{
  sub_1DBE4853C();
}

void sub_1DBE4835C()
{
  sub_1DBE4853C();
}

void sub_1DBE48368()
{
  sub_1DBE4853C();
}

void sub_1DBE48374(uint64_t a1)
{
  OUTLINED_FUNCTION_12_18(a1, a1, (void (*)(uint64_t))DetailType.rawValue.getter);
}

void sub_1DBE48394()
{
  sub_1DBE4853C();
}

void sub_1DBE483A0()
{
  sub_1DBE4853C();
}

void sub_1DBE483AC()
{
  sub_1DBE4853C();
}

void sub_1DBE483B8()
{
  sub_1DBE49420();
}

void sub_1DBE483C4()
{
  sub_1DBE4923C();
}

void sub_1DBE483D0()
{
  sub_1DBE4929C();
}

void sub_1DBE483DC()
{
  sub_1DBE4853C();
}

void sub_1DBE483E8()
{
  sub_1DBE496B4();
}

void sub_1DBE483F4()
{
  sub_1DBE49574();
}

void sub_1DBE48400()
{
  sub_1DBE4948C();
}

void sub_1DBE4840C()
{
  sub_1DBE4853C();
}

void sub_1DBE48418()
{
  sub_1DBE4853C();
}

void sub_1DBE48424()
{
  sub_1DBE49360();
}

void sub_1DBE48430()
{
  sub_1DBE4853C();
}

void sub_1DBE4843C()
{
  sub_1DBE49610();
}

void sub_1DBE48448()
{
  sub_1DBE4853C();
}

void sub_1DBE48454(uint64_t a1)
{
  OUTLINED_FUNCTION_12_18(a1, a1, (void (*)(uint64_t))ComponentType.rawValue.getter);
}

void sub_1DBE48474()
{
  sub_1DBE49318();
}

void sub_1DBE48480()
{
  sub_1DBE49720();
}

void sub_1DBE4848C()
{
  sub_1DBE4853C();
}

void sub_1DBE48498()
{
  sub_1DBE4853C();
}

void sub_1DBE484A4()
{
  sub_1DBE4853C();
}

void sub_1DBE484B0(uint64_t a1)
{
  OUTLINED_FUNCTION_12_18(a1, a1, (void (*)(uint64_t))Condition.rawValue.getter);
}

void sub_1DBE484D0()
{
  sub_1DBE4853C();
}

void sub_1DBE484DC()
{
  sub_1DBE49670();
}

void sub_1DBE484E8()
{
  sub_1DBE495BC();
}

void sub_1DBE484F4()
{
  sub_1DBE4853C();
}

void sub_1DBE48500()
{
  sub_1DBE4853C();
}

void sub_1DBE4850C()
{
  sub_1DBE4853C();
}

void sub_1DBE48518()
{
  sub_1DBE4853C();
}

void sub_1DBE48524()
{
  sub_1DBE4853C();
}

void sub_1DBE48530()
{
  sub_1DBE4853C();
}

void sub_1DBE4853C()
{
  uint64_t v0;

  v0 = sub_1DBE4AD6C();
  OUTLINED_FUNCTION_16_8(v0);
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

uint64_t sub_1DBE48570()
{
  return sub_1DBE494E0();
}

uint64_t sub_1DBE4857C()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE485B4(uint64_t a1, uint64_t a2)
{
  return sub_1DBE4913C(a1, a2, (void (*)(void))Condition.rawValue.getter);
}

uint64_t sub_1DBE485C0()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE485F8()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE48630()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48670()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE486C8()
{
  OUTLINED_FUNCTION_11_22();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48704()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48768()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE487A0()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE487D8()
{
  sub_1DBE4A910();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DBE48804()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE4883C()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48874()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE488AC()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE488EC()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE4891C()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48954()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE4898C()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE489C4(uint64_t a1, uint64_t a2)
{
  return sub_1DBE4913C(a1, a2, (void (*)(void))LocationCondition.rawValue.getter);
}

void sub_1DBE489D0()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48A10()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48A6C()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48AA4()
{
  sub_1DBE4A910();
  return swift_bridgeObjectRelease();
}

void sub_1DBE48AE4()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48B24()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48B74()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48BAC()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE48BE4()
{
  OUTLINED_FUNCTION_11_22();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48C20()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48C84()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48CBC()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE48CF4(uint64_t a1, uint64_t a2)
{
  return sub_1DBE4913C(a1, a2, (void (*)(void))ComponentType.rawValue.getter);
}

uint64_t sub_1DBE48D00()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE48D38()
{
  OUTLINED_FUNCTION_11_22();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48D74()
{
  OUTLINED_FUNCTION_9_23();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE48E30()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48E70()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE48ED4()
{
  OUTLINED_FUNCTION_8_25();
  __asm { BR              X10 }
}

uint64_t sub_1DBE48F14()
{
  OUTLINED_FUNCTION_3_31();
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE49000()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE49038()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE49070()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE490A8()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE490E0()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE49130(uint64_t a1, uint64_t a2)
{
  return sub_1DBE4913C(a1, a2, (void (*)(void))DetailType.rawValue.getter);
}

uint64_t sub_1DBE4913C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_1DBE4A910();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DBE49188()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE491C0()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_1DBE491F8()
{
  OUTLINED_FUNCTION_1_40();
  return OUTLINED_FUNCTION_0_39();
}

void sub_1DBE49230()
{
  sub_1DBE497D8();
}

void sub_1DBE4923C()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49284()
{
  sub_1DBE497D8();
}

void sub_1DBE49290(uint64_t a1, uint64_t a2)
{
  sub_1DBE49780(a1, a2, (void (*)(uint64_t))DetailType.rawValue.getter);
}

void sub_1DBE4929C()
{
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49300()
{
  sub_1DBE497D8();
}

void sub_1DBE4930C()
{
  sub_1DBE497D8();
}

void sub_1DBE49318()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49360()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE493A8()
{
  sub_1DBE497D8();
}

void sub_1DBE493B4()
{
  sub_1DBE497D8();
}

void sub_1DBE493C0()
{
  sub_1DBE497D8();
}

void sub_1DBE493CC()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49414(uint64_t a1, uint64_t a2)
{
  sub_1DBE49780(a1, a2, (void (*)(uint64_t))ComponentType.rawValue.getter);
}

void sub_1DBE49420()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49468()
{
  sub_1DBE497D8();
}

void sub_1DBE49474()
{
  sub_1DBE497D8();
}

void sub_1DBE49480()
{
  sub_1DBE497D8();
}

void sub_1DBE4948C()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE494D4()
{
  sub_1DBE497D8();
}

uint64_t sub_1DBE494E0()
{
  sub_1DBE4AD6C();
  sub_1DBE4A910();
  swift_bridgeObjectRelease();
  return sub_1DBE4AD84();
}

void sub_1DBE49544()
{
  sub_1DBE497D8();
}

void sub_1DBE49550()
{
  sub_1DBE497D8();
}

void sub_1DBE4955C(uint64_t a1, uint64_t a2)
{
  sub_1DBE49780(a1, a2, (void (*)(uint64_t))LocationCondition.rawValue.getter);
}

void sub_1DBE49568()
{
  sub_1DBE497D8();
}

void sub_1DBE49574()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE495BC()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49604()
{
  sub_1DBE497D8();
}

void sub_1DBE49610()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49658()
{
  sub_1DBE497D8();
}

void sub_1DBE49664()
{
  sub_1DBE497D8();
}

void sub_1DBE49670()
{
  OUTLINED_FUNCTION_4_24();
  sub_1DBE4A910();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE496B4()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE496FC()
{
  sub_1DBE497D8();
}

void sub_1DBE49708()
{
  sub_1DBE497D8();
}

void sub_1DBE49714()
{
  sub_1DBE497D8();
}

void sub_1DBE49720()
{
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE49768()
{
  sub_1DBE497D8();
}

void sub_1DBE49774(uint64_t a1, uint64_t a2)
{
  sub_1DBE49780(a1, a2, (void (*)(uint64_t))Condition.rawValue.getter);
}

void sub_1DBE49780(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6_25();
  a3(v4);
  OUTLINED_FUNCTION_1_40();
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

void sub_1DBE497CC()
{
  sub_1DBE497D8();
}

void sub_1DBE497D8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_16_8(v0);
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_2_41();
}

WeatherAnalytics::OsInstallVariant_optional __swiftcall OsInstallVariant.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  WeatherAnalytics::OsInstallVariant_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DBE4ABB0();
  result.value = OUTLINED_FUNCTION_4_11();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1DBE49858()
{
  sub_1DBDF580C();
}

unint64_t sub_1DBE49868()
{
  unint64_t result;

  result = qword_1F0316820;
  if (!qword_1F0316820)
  {
    result = MEMORY[0x1DF0BBF5C](&protocol conformance descriptor for OsInstallVariant, &type metadata for OsInstallVariant);
    atomic_store(result, (unint64_t *)&qword_1F0316820);
  }
  return result;
}

uint64_t sub_1DBE498A4()
{
  return sub_1DBE48570();
}

uint64_t sub_1DBE498AC()
{
  return sub_1DBE48AA4();
}

uint64_t sub_1DBE498B4()
{
  return sub_1DBE494E0();
}

WeatherAnalytics::OsInstallVariant_optional sub_1DBE498BC(Swift::String *a1)
{
  return OsInstallVariant.init(rawValue:)(*a1);
}

uint64_t sub_1DBE498C8()
{
  sub_1DBDC4A28();
  return sub_1DBE4A97C();
}

uint64_t storeEnumTagSinglePayload for OsInstallVariant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DBE49970 + 4 * byte_1DBE5CC3E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DBE499A4 + 4 * byte_1DBE5CC39[v4]))();
}

uint64_t sub_1DBE499A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE499AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DBE499B4);
  return result;
}

uint64_t sub_1DBE499C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DBE499C8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DBE499CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE499D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DBE499E0()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_1DBE499EC()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_1DBE499F8()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1DBE49A04()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1DBE49A10()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1DBE49A1C()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1DBE49A28()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1DBE49A34()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t sub_1DBE49A40()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1DBE49A4C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DBE49A58()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DBE49A64()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DBE49A70()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DBE49A7C()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1DBE49A88()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1DBE49A94()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1DBE49AA0()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1DBE49AAC()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1DBE49AB8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1DBE49AC4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DBE49AD0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DBE49ADC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DBE49AE8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DBE49AF4()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1DBE49B00()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1DBE49B0C()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1DBE49B18()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1DBE49B24()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DBE49B30()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1DBE49B3C()
{
  return MEMORY[0x1E0CB0DA8]();
}

uint64_t sub_1DBE49B48()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1DBE49B54()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1DBE49B60()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DBE49B6C()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1DBE49B78()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1DBE49B84()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1DBE49B90()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1DBE49B9C()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1DBE49BA8()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1DBE49BB4()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1DBE49BC0()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1DBE49BCC()
{
  return MEMORY[0x1E0CB1430]();
}

uint64_t sub_1DBE49BD8()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1DBE49BE4()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1DBE49BF0()
{
  return MEMORY[0x1E0DC8AE0]();
}

uint64_t sub_1DBE49BFC()
{
  return MEMORY[0x1E0DB54B0]();
}

uint64_t sub_1DBE49C08()
{
  return MEMORY[0x1E0DB54B8]();
}

uint64_t sub_1DBE49C14()
{
  return MEMORY[0x1E0DB54C0]();
}

uint64_t sub_1DBE49C20()
{
  return MEMORY[0x1E0DB54C8]();
}

uint64_t sub_1DBE49C2C()
{
  return MEMORY[0x1E0DB55D0]();
}

uint64_t sub_1DBE49C38()
{
  return MEMORY[0x1E0DB55D8]();
}

uint64_t sub_1DBE49C44()
{
  return MEMORY[0x1E0DB55E8]();
}

uint64_t sub_1DBE49C50()
{
  return MEMORY[0x1E0DB57F0]();
}

uint64_t sub_1DBE49C5C()
{
  return MEMORY[0x1E0DC8AF8]();
}

uint64_t sub_1DBE49C68()
{
  return MEMORY[0x1E0DB5808]();
}

uint64_t sub_1DBE49C74()
{
  return MEMORY[0x1E0DB5818]();
}

uint64_t sub_1DBE49C80()
{
  return MEMORY[0x1E0DB5858]();
}

uint64_t sub_1DBE49C8C()
{
  return MEMORY[0x1E0DB5870]();
}

uint64_t sub_1DBE49C98()
{
  return MEMORY[0x1E0DB5890]();
}

uint64_t sub_1DBE49CA4()
{
  return MEMORY[0x1E0DB58A0]();
}

uint64_t sub_1DBE49CB0()
{
  return MEMORY[0x1E0DC9410]();
}

uint64_t sub_1DBE49CBC()
{
  return MEMORY[0x1E0DB58C0]();
}

uint64_t sub_1DBE49CC8()
{
  return MEMORY[0x1E0DC8C10]();
}

uint64_t sub_1DBE49CD4()
{
  return MEMORY[0x1E0DC8C18]();
}

uint64_t sub_1DBE49CE0()
{
  return MEMORY[0x1E0DC8CA8]();
}

uint64_t sub_1DBE49CEC()
{
  return MEMORY[0x1E0DC8CB0]();
}

uint64_t sub_1DBE49CF8()
{
  return MEMORY[0x1E0DC8CB8]();
}

uint64_t sub_1DBE49D04()
{
  return MEMORY[0x1E0DC8CC0]();
}

uint64_t sub_1DBE49D10()
{
  return MEMORY[0x1E0DC8D68]();
}

uint64_t sub_1DBE49D1C()
{
  return MEMORY[0x1E0DC8D70]();
}

uint64_t sub_1DBE49D28()
{
  return MEMORY[0x1E0DC8D78]();
}

uint64_t sub_1DBE49D34()
{
  return MEMORY[0x1E0DC8D80]();
}

uint64_t sub_1DBE49D40()
{
  return MEMORY[0x1E0DC8D98]();
}

uint64_t sub_1DBE49D4C()
{
  return MEMORY[0x1E0DC8DA0]();
}

uint64_t sub_1DBE49D58()
{
  return MEMORY[0x1E0DC8F40]();
}

uint64_t sub_1DBE49D64()
{
  return MEMORY[0x1E0DC8F60]();
}

uint64_t sub_1DBE49D70()
{
  return MEMORY[0x1E0DC8F70]();
}

uint64_t sub_1DBE49D7C()
{
  return MEMORY[0x1E0DC8F78]();
}

uint64_t sub_1DBE49D88()
{
  return MEMORY[0x1E0DC8F80]();
}

uint64_t sub_1DBE49D94()
{
  return MEMORY[0x1E0DC8F88]();
}

uint64_t sub_1DBE49DA0()
{
  return MEMORY[0x1E0DC8F98]();
}

uint64_t sub_1DBE49DAC()
{
  return MEMORY[0x1E0DC8FA0]();
}

uint64_t sub_1DBE49DB8()
{
  return MEMORY[0x1E0DC8FB0]();
}

uint64_t sub_1DBE49DC4()
{
  return MEMORY[0x1E0DC8FD0]();
}

uint64_t sub_1DBE49DD0()
{
  return MEMORY[0x1E0DC8FD8]();
}

uint64_t sub_1DBE49DDC()
{
  return MEMORY[0x1E0DC8FE0]();
}

uint64_t sub_1DBE49DE8()
{
  return MEMORY[0x1E0DC8FE8]();
}

uint64_t sub_1DBE49DF4()
{
  return MEMORY[0x1E0DC8FF0]();
}

uint64_t sub_1DBE49E00()
{
  return MEMORY[0x1E0DC9018]();
}

uint64_t sub_1DBE49E0C()
{
  return MEMORY[0x1E0DC9020]();
}

uint64_t sub_1DBE49E18()
{
  return MEMORY[0x1E0DC9028]();
}

uint64_t sub_1DBE49E24()
{
  return MEMORY[0x1E0DC9030]();
}

uint64_t sub_1DBE49E30()
{
  return MEMORY[0x1E0DC9038]();
}

uint64_t sub_1DBE49E3C()
{
  return MEMORY[0x1E0DC9070]();
}

uint64_t sub_1DBE49E48()
{
  return MEMORY[0x1E0DC9078]();
}

uint64_t sub_1DBE49E54()
{
  return MEMORY[0x1E0DC9080]();
}

uint64_t sub_1DBE49E60()
{
  return MEMORY[0x1E0DC9098]();
}

uint64_t sub_1DBE49E6C()
{
  return MEMORY[0x1E0DC90A0]();
}

uint64_t sub_1DBE49E78()
{
  return MEMORY[0x1E0DC90A8]();
}

uint64_t sub_1DBE49E84()
{
  return MEMORY[0x1E0DC90B0]();
}

uint64_t sub_1DBE49E90()
{
  return MEMORY[0x1E0DC90B8]();
}

uint64_t sub_1DBE49E9C()
{
  return MEMORY[0x1E0DC90D0]();
}

uint64_t sub_1DBE49EA8()
{
  return MEMORY[0x1E0DC90D8]();
}

uint64_t sub_1DBE49EB4()
{
  return MEMORY[0x1E0DC90E8]();
}

uint64_t sub_1DBE49EC0()
{
  return MEMORY[0x1E0DC9168]();
}

uint64_t sub_1DBE49ECC()
{
  return MEMORY[0x1E0DC9180]();
}

uint64_t sub_1DBE49ED8()
{
  return MEMORY[0x1E0DC91E8]();
}

uint64_t sub_1DBE49EE4()
{
  return MEMORY[0x1E0DC9200]();
}

uint64_t sub_1DBE49EF0()
{
  return MEMORY[0x1E0DC9210]();
}

uint64_t sub_1DBE49EFC()
{
  return MEMORY[0x1E0DC9220]();
}

uint64_t sub_1DBE49F08()
{
  return MEMORY[0x1E0CF7F08]();
}

uint64_t sub_1DBE49F14()
{
  return MEMORY[0x1E0CF7F20]();
}

uint64_t sub_1DBE49F20()
{
  return MEMORY[0x1E0CF7F30]();
}

uint64_t sub_1DBE49F2C()
{
  return MEMORY[0x1E0CF7F40]();
}

uint64_t sub_1DBE49F38()
{
  return MEMORY[0x1E0CF7F48]();
}

uint64_t sub_1DBE49F44()
{
  return MEMORY[0x1E0CF7F68]();
}

uint64_t sub_1DBE49F50()
{
  return MEMORY[0x1E0CF7F70]();
}

uint64_t sub_1DBE49F5C()
{
  return MEMORY[0x1E0CF7F78]();
}

uint64_t sub_1DBE49F68()
{
  return MEMORY[0x1E0CF7F80]();
}

uint64_t sub_1DBE49F74()
{
  return MEMORY[0x1E0CF7F88]();
}

uint64_t sub_1DBE49F80()
{
  return MEMORY[0x1E0CF7FA0]();
}

uint64_t sub_1DBE49F8C()
{
  return MEMORY[0x1E0CF7FB0]();
}

uint64_t sub_1DBE49F98()
{
  return MEMORY[0x1E0CF7FC8]();
}

uint64_t sub_1DBE49FA4()
{
  return MEMORY[0x1E0CF7FD0]();
}

uint64_t sub_1DBE49FB0()
{
  return MEMORY[0x1E0CF7FD8]();
}

uint64_t sub_1DBE49FBC()
{
  return MEMORY[0x1E0CF7FE0]();
}

uint64_t sub_1DBE49FC8()
{
  return MEMORY[0x1E0CF7FF8]();
}

uint64_t sub_1DBE49FD4()
{
  return MEMORY[0x1E0CF8010]();
}

uint64_t sub_1DBE49FE0()
{
  return MEMORY[0x1E0CF8018]();
}

uint64_t sub_1DBE49FEC()
{
  return MEMORY[0x1E0CF8020]();
}

uint64_t sub_1DBE49FF8()
{
  return MEMORY[0x1E0CF8028]();
}

uint64_t sub_1DBE4A004()
{
  return MEMORY[0x1E0CF8040]();
}

uint64_t sub_1DBE4A010()
{
  return MEMORY[0x1E0CF8080]();
}

uint64_t sub_1DBE4A01C()
{
  return MEMORY[0x1E0CF8090]();
}

uint64_t sub_1DBE4A028()
{
  return MEMORY[0x1E0CF80A0]();
}

uint64_t sub_1DBE4A034()
{
  return MEMORY[0x1E0CF80A8]();
}

uint64_t sub_1DBE4A040()
{
  return MEMORY[0x1E0CF80B0]();
}

uint64_t sub_1DBE4A04C()
{
  return MEMORY[0x1E0CF80D0]();
}

uint64_t sub_1DBE4A058()
{
  return MEMORY[0x1E0CF80E0]();
}

uint64_t sub_1DBE4A064()
{
  return MEMORY[0x1E0CF80F0]();
}

uint64_t sub_1DBE4A070()
{
  return MEMORY[0x1E0CF8100]();
}

uint64_t sub_1DBE4A07C()
{
  return MEMORY[0x1E0CF8110]();
}

uint64_t sub_1DBE4A088()
{
  return MEMORY[0x1E0CF8118]();
}

uint64_t sub_1DBE4A094()
{
  return MEMORY[0x1E0CF8130]();
}

uint64_t sub_1DBE4A0A0()
{
  return MEMORY[0x1E0CF8178]();
}

uint64_t sub_1DBE4A0AC()
{
  return MEMORY[0x1E0CF81A0]();
}

uint64_t sub_1DBE4A0B8()
{
  return MEMORY[0x1E0CF81A8]();
}

uint64_t sub_1DBE4A0C4()
{
  return MEMORY[0x1E0CF81B0]();
}

uint64_t sub_1DBE4A0D0()
{
  return MEMORY[0x1E0CF81C0]();
}

uint64_t sub_1DBE4A0DC()
{
  return MEMORY[0x1E0CF81C8]();
}

uint64_t sub_1DBE4A0E8()
{
  return MEMORY[0x1E0CF81D0]();
}

uint64_t sub_1DBE4A0F4()
{
  return MEMORY[0x1E0CF81D8]();
}

uint64_t sub_1DBE4A100()
{
  return MEMORY[0x1E0CF81E0]();
}

uint64_t sub_1DBE4A10C()
{
  return MEMORY[0x1E0CF81E8]();
}

uint64_t sub_1DBE4A118()
{
  return MEMORY[0x1E0CF81F0]();
}

uint64_t sub_1DBE4A124()
{
  return MEMORY[0x1E0CF8208]();
}

uint64_t sub_1DBE4A130()
{
  return MEMORY[0x1E0CF8210]();
}

uint64_t sub_1DBE4A13C()
{
  return MEMORY[0x1E0CF8250]();
}

uint64_t sub_1DBE4A148()
{
  return MEMORY[0x1E0CF8278]();
}

uint64_t sub_1DBE4A154()
{
  return MEMORY[0x1E0CF8280]();
}

uint64_t sub_1DBE4A160()
{
  return MEMORY[0x1E0CF8288]();
}

uint64_t sub_1DBE4A16C()
{
  return MEMORY[0x1E0CF8298]();
}

uint64_t sub_1DBE4A178()
{
  return MEMORY[0x1E0CF82C0]();
}

uint64_t sub_1DBE4A184()
{
  return MEMORY[0x1E0CF82D8]();
}

uint64_t sub_1DBE4A190()
{
  return MEMORY[0x1E0CF82E0]();
}

uint64_t sub_1DBE4A19C()
{
  return MEMORY[0x1E0CF8340]();
}

uint64_t sub_1DBE4A1A8()
{
  return MEMORY[0x1E0CF8358]();
}

uint64_t sub_1DBE4A1B4()
{
  return MEMORY[0x1E0CF8370]();
}

uint64_t sub_1DBE4A1C0()
{
  return MEMORY[0x1E0CF8398]();
}

uint64_t sub_1DBE4A1CC()
{
  return MEMORY[0x1E0CF83C0]();
}

uint64_t sub_1DBE4A1D8()
{
  return MEMORY[0x1E0CF83C8]();
}

uint64_t sub_1DBE4A1E4()
{
  return MEMORY[0x1E0CF83D8]();
}

uint64_t sub_1DBE4A1F0()
{
  return MEMORY[0x1E0CF83F0]();
}

uint64_t sub_1DBE4A1FC()
{
  return MEMORY[0x1E0CF83F8]();
}

uint64_t sub_1DBE4A208()
{
  return MEMORY[0x1E0CF8400]();
}

uint64_t sub_1DBE4A214()
{
  return MEMORY[0x1E0CF8408]();
}

uint64_t sub_1DBE4A220()
{
  return MEMORY[0x1E0CF8410]();
}

uint64_t sub_1DBE4A22C()
{
  return MEMORY[0x1E0CF8418]();
}

uint64_t sub_1DBE4A238()
{
  return MEMORY[0x1E0CF8428]();
}

uint64_t sub_1DBE4A244()
{
  return MEMORY[0x1E0CF8440]();
}

uint64_t sub_1DBE4A250()
{
  return MEMORY[0x1E0CF8450]();
}

uint64_t sub_1DBE4A25C()
{
  return MEMORY[0x1E0CF8458]();
}

uint64_t sub_1DBE4A268()
{
  return MEMORY[0x1E0CF8478]();
}

uint64_t sub_1DBE4A274()
{
  return MEMORY[0x1E0CF8480]();
}

uint64_t sub_1DBE4A280()
{
  return MEMORY[0x1E0CF8490]();
}

uint64_t sub_1DBE4A28C()
{
  return MEMORY[0x1E0CF8498]();
}

uint64_t sub_1DBE4A298()
{
  return MEMORY[0x1E0CF84B0]();
}

uint64_t sub_1DBE4A2A4()
{
  return MEMORY[0x1E0CF84B8]();
}

uint64_t sub_1DBE4A2B0()
{
  return MEMORY[0x1E0CF84C0]();
}

uint64_t sub_1DBE4A2BC()
{
  return MEMORY[0x1E0CF84C8]();
}

uint64_t sub_1DBE4A2C8()
{
  return MEMORY[0x1E0CF84D0]();
}

uint64_t sub_1DBE4A2D4()
{
  return MEMORY[0x1E0CF84D8]();
}

uint64_t sub_1DBE4A2E0()
{
  return MEMORY[0x1E0CF84E0]();
}

uint64_t sub_1DBE4A2EC()
{
  return MEMORY[0x1E0CF84E8]();
}

uint64_t sub_1DBE4A2F8()
{
  return MEMORY[0x1E0CF8520]();
}

uint64_t sub_1DBE4A304()
{
  return MEMORY[0x1E0CF8528]();
}

uint64_t sub_1DBE4A310()
{
  return MEMORY[0x1E0CF8530]();
}

uint64_t sub_1DBE4A31C()
{
  return MEMORY[0x1E0CF8538]();
}

uint64_t sub_1DBE4A328()
{
  return MEMORY[0x1E0CF8568]();
}

uint64_t sub_1DBE4A334()
{
  return MEMORY[0x1E0CF85A8]();
}

uint64_t sub_1DBE4A340()
{
  return MEMORY[0x1E0CF85F8]();
}

uint64_t sub_1DBE4A34C()
{
  return MEMORY[0x1E0CF8620]();
}

uint64_t sub_1DBE4A358()
{
  return MEMORY[0x1E0CF8638]();
}

uint64_t sub_1DBE4A364()
{
  return MEMORY[0x1E0CF8650]();
}

uint64_t sub_1DBE4A370()
{
  return MEMORY[0x1E0CF8658]();
}

uint64_t sub_1DBE4A37C()
{
  return MEMORY[0x1E0CF8670]();
}

uint64_t sub_1DBE4A388()
{
  return MEMORY[0x1E0CF86A0]();
}

uint64_t sub_1DBE4A394()
{
  return MEMORY[0x1E0CF86C0]();
}

uint64_t sub_1DBE4A3A0()
{
  return MEMORY[0x1E0DB3010]();
}

uint64_t sub_1DBE4A3AC()
{
  return MEMORY[0x1E0DB3018]();
}

uint64_t sub_1DBE4A3B8()
{
  return MEMORY[0x1E0DB3020]();
}

uint64_t sub_1DBE4A3C4()
{
  return MEMORY[0x1E0DB3030]();
}

uint64_t sub_1DBE4A3D0()
{
  return MEMORY[0x1E0DB3038]();
}

uint64_t sub_1DBE4A3DC()
{
  return MEMORY[0x1E0DB3050]();
}

uint64_t sub_1DBE4A3E8()
{
  return MEMORY[0x1E0DB3068]();
}

uint64_t sub_1DBE4A3F4()
{
  return MEMORY[0x1E0DB3070]();
}

uint64_t sub_1DBE4A400()
{
  return MEMORY[0x1E0DB3160]();
}

uint64_t sub_1DBE4A40C()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1DBE4A418()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1DBE4A424()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1DBE4A430()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1DBE4A43C()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1DBE4A448()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1DBE4A454()
{
  return MEMORY[0x1E0DB35C8]();
}

uint64_t sub_1DBE4A460()
{
  return MEMORY[0x1E0DB35D0]();
}

uint64_t sub_1DBE4A46C()
{
  return MEMORY[0x1E0DB35E8]();
}

uint64_t sub_1DBE4A478()
{
  return MEMORY[0x1E0DB35F0]();
}

uint64_t sub_1DBE4A484()
{
  return MEMORY[0x1E0DB36F0]();
}

uint64_t sub_1DBE4A490()
{
  return MEMORY[0x1E0DB3828]();
}

uint64_t sub_1DBE4A49C()
{
  return MEMORY[0x1E0DB38A8]();
}

uint64_t sub_1DBE4A4A8()
{
  return MEMORY[0x1E0DB38B0]();
}

uint64_t sub_1DBE4A4B4()
{
  return MEMORY[0x1E0DB38B8]();
}

uint64_t sub_1DBE4A4C0()
{
  return MEMORY[0x1E0DB4348]();
}

uint64_t sub_1DBE4A4CC()
{
  return MEMORY[0x1E0DB43A8]();
}

uint64_t sub_1DBE4A4D8()
{
  return MEMORY[0x1E0DB43B0]();
}

uint64_t sub_1DBE4A4E4()
{
  return MEMORY[0x1E0DB43B8]();
}

uint64_t sub_1DBE4A4F0()
{
  return MEMORY[0x1E0DB43C8]();
}

uint64_t sub_1DBE4A4FC()
{
  return MEMORY[0x1E0DB45C8]();
}

uint64_t sub_1DBE4A508()
{
  return MEMORY[0x1E0DB45D0]();
}

uint64_t sub_1DBE4A514()
{
  return MEMORY[0x1E0DB4650]();
}

uint64_t sub_1DBE4A520()
{
  return MEMORY[0x1E0DB4A20]();
}

uint64_t sub_1DBE4A52C()
{
  return MEMORY[0x1E0DB4AC8]();
}

uint64_t sub_1DBE4A538()
{
  return MEMORY[0x1E0DB4AD8]();
}

uint64_t sub_1DBE4A544()
{
  return MEMORY[0x1E0DB4AE0]();
}

uint64_t sub_1DBE4A550()
{
  return MEMORY[0x1E0DB5038]();
}

uint64_t sub_1DBE4A55C()
{
  return MEMORY[0x1E0DB50E8]();
}

uint64_t sub_1DBE4A568()
{
  return MEMORY[0x1E0DC9610]();
}

uint64_t sub_1DBE4A574()
{
  return MEMORY[0x1E0DC9630]();
}

uint64_t sub_1DBE4A580()
{
  return MEMORY[0x1E0DC9688]();
}

uint64_t sub_1DBE4A58C()
{
  return MEMORY[0x1E0DC96A0]();
}

uint64_t sub_1DBE4A598()
{
  return MEMORY[0x1E0DC96A8]();
}

uint64_t sub_1DBE4A5A4()
{
  return MEMORY[0x1E0DC96B0]();
}

uint64_t sub_1DBE4A5B0()
{
  return MEMORY[0x1E0DC96B8]();
}

uint64_t sub_1DBE4A5BC()
{
  return MEMORY[0x1E0DC96C0]();
}

uint64_t sub_1DBE4A5C8()
{
  return MEMORY[0x1E0DC96C8]();
}

uint64_t sub_1DBE4A5D4()
{
  return MEMORY[0x1E0DC96D0]();
}

uint64_t sub_1DBE4A5E0()
{
  return MEMORY[0x1E0DC99F8]();
}

uint64_t sub_1DBE4A5EC()
{
  return MEMORY[0x1E0DC9A00]();
}

uint64_t sub_1DBE4A5F8()
{
  return MEMORY[0x1E0DC9A20]();
}

uint64_t sub_1DBE4A604()
{
  return MEMORY[0x1E0DC9A28]();
}

uint64_t sub_1DBE4A610()
{
  return MEMORY[0x1E0DC9A70]();
}

uint64_t sub_1DBE4A61C()
{
  return MEMORY[0x1E0DC9A78]();
}

uint64_t sub_1DBE4A628()
{
  return MEMORY[0x1E0DC9B10]();
}

uint64_t sub_1DBE4A634()
{
  return MEMORY[0x1E0DC9B18]();
}

uint64_t sub_1DBE4A640()
{
  return MEMORY[0x1E0DC9FC8]();
}

uint64_t sub_1DBE4A64C()
{
  return MEMORY[0x1E0DC9FD0]();
}

uint64_t sub_1DBE4A658()
{
  return MEMORY[0x1E0DCA0E8]();
}

uint64_t sub_1DBE4A664()
{
  return MEMORY[0x1E0DCA0F0]();
}

uint64_t sub_1DBE4A670()
{
  return MEMORY[0x1E0DCA388]();
}

uint64_t sub_1DBE4A67C()
{
  return MEMORY[0x1E0DCA3C0]();
}

uint64_t sub_1DBE4A688()
{
  return MEMORY[0x1E0DCA3D0]();
}

uint64_t sub_1DBE4A694()
{
  return MEMORY[0x1E0DCA570]();
}

uint64_t sub_1DBE4A6A0()
{
  return MEMORY[0x1E0DCA578]();
}

uint64_t sub_1DBE4A6AC()
{
  return MEMORY[0x1E0DCA580]();
}

uint64_t sub_1DBE4A6B8()
{
  return MEMORY[0x1E0DCA588]();
}

uint64_t sub_1DBE4A6C4()
{
  return MEMORY[0x1E0DCA590]();
}

uint64_t sub_1DBE4A6D0()
{
  return MEMORY[0x1E0DCA598]();
}

uint64_t sub_1DBE4A6DC()
{
  return MEMORY[0x1E0DCA5A0]();
}

uint64_t sub_1DBE4A6E8()
{
  return MEMORY[0x1E0DCA5A8]();
}

uint64_t sub_1DBE4A6F4()
{
  return MEMORY[0x1E0DCA5B8]();
}

uint64_t sub_1DBE4A700()
{
  return MEMORY[0x1E0DCA5C0]();
}

uint64_t sub_1DBE4A70C()
{
  return MEMORY[0x1E0DCA5C8]();
}

uint64_t sub_1DBE4A718()
{
  return MEMORY[0x1E0DCA5D8]();
}

uint64_t sub_1DBE4A724()
{
  return MEMORY[0x1E0DCA5E0]();
}

uint64_t sub_1DBE4A730()
{
  return MEMORY[0x1E0DCA5E8]();
}

uint64_t sub_1DBE4A73C()
{
  return MEMORY[0x1E0DCA5F0]();
}

uint64_t sub_1DBE4A748()
{
  return MEMORY[0x1E0DCA628]();
}

uint64_t sub_1DBE4A754()
{
  return MEMORY[0x1E0DCA7B0]();
}

uint64_t sub_1DBE4A760()
{
  return MEMORY[0x1E0DCA7B8]();
}

uint64_t sub_1DBE4A76C()
{
  return MEMORY[0x1E0DCA7C0]();
}

uint64_t sub_1DBE4A778()
{
  return MEMORY[0x1E0DCA7C8]();
}

uint64_t sub_1DBE4A784()
{
  return MEMORY[0x1E0DCA9F0]();
}

uint64_t sub_1DBE4A790()
{
  return MEMORY[0x1E0DCAA40]();
}

uint64_t sub_1DBE4A79C()
{
  return MEMORY[0x1E0DC92D8]();
}

uint64_t sub_1DBE4A7A8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DBE4A7B4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DBE4A7C0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DBE4A7CC()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1DBE4A7D8()
{
  return MEMORY[0x1E0CCE388]();
}

uint64_t sub_1DBE4A7E4()
{
  return MEMORY[0x1E0CCE3B0]();
}

uint64_t sub_1DBE4A7F0()
{
  return MEMORY[0x1E0CCE3C0]();
}

uint64_t sub_1DBE4A7FC()
{
  return MEMORY[0x1E0CCE6E0]();
}

uint64_t sub_1DBE4A808()
{
  return MEMORY[0x1E0CCE6F8]();
}

uint64_t sub_1DBE4A814()
{
  return MEMORY[0x1E0CCE700]();
}

uint64_t sub_1DBE4A820()
{
  return MEMORY[0x1E0CCE728]();
}

uint64_t sub_1DBE4A82C()
{
  return MEMORY[0x1E0CCE730]();
}

uint64_t sub_1DBE4A838()
{
  return MEMORY[0x1E0CCEA90]();
}

uint64_t sub_1DBE4A844()
{
  return MEMORY[0x1E0CCEAD8]();
}

uint64_t sub_1DBE4A850()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1DBE4A85C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DBE4A868()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DBE4A874()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1DBE4A880()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1DBE4A88C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DBE4A898()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1DBE4A8A4()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1DBE4A8B0()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1DBE4A8BC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DBE4A8C8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DBE4A8D4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1DBE4A8E0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DBE4A8EC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DBE4A8F8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DBE4A904()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DBE4A910()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DBE4A91C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DBE4A928()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1DBE4A934()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DBE4A940()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1DBE4A94C()
{
  return MEMORY[0x1E0DB5960]();
}

uint64_t sub_1DBE4A958()
{
  return MEMORY[0x1E0DB5968]();
}

uint64_t sub_1DBE4A964()
{
  return MEMORY[0x1E0DB5970]();
}

uint64_t sub_1DBE4A970()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1DBE4A97C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1DBE4A988()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DBE4A994()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DBE4A9A0()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1DBE4A9AC()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DBE4A9B8()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DBE4A9C4()
{
  return MEMORY[0x1E0DF0850]();
}

uint64_t sub_1DBE4A9D0()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1DBE4A9DC()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1DBE4A9E8()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1DBE4A9F4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DBE4AA00()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DBE4AA0C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DBE4AA18()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1DBE4AA24()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1DBE4AA30()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DBE4AA3C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DBE4AA48()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1DBE4AA54()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1DBE4AA60()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1DBE4AA6C()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1DBE4AA78()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1DBE4AA84()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1DBE4AA90()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1DBE4AA9C()
{
  return MEMORY[0x1E0DC9340]();
}

uint64_t sub_1DBE4AAA8()
{
  return MEMORY[0x1E0DEFA78]();
}

uint64_t sub_1DBE4AAB4()
{
  return MEMORY[0x1E0DEFA90]();
}

uint64_t sub_1DBE4AAC0()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1DBE4AACC()
{
  return MEMORY[0x1E0DEFAB8]();
}

uint64_t sub_1DBE4AAD8()
{
  return MEMORY[0x1E0DCAC30]();
}

uint64_t sub_1DBE4AAE4()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1DBE4AAF0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DBE4AAFC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DBE4AB08()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DBE4AB14()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DBE4AB20()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1DBE4AB2C()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_1DBE4AB38()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DBE4AB44()
{
  return MEMORY[0x1E0DF0B00]();
}

uint64_t sub_1DBE4AB50()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DBE4AB5C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DBE4AB68()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DBE4AB74()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DBE4AB80()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1DBE4AB8C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1DBE4AB98()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DBE4ABA4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DBE4ABB0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DBE4ABBC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1DBE4ABC8()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1DBE4ABD4()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1DBE4ABE0()
{
  return MEMORY[0x1E0DECF98]();
}

uint64_t sub_1DBE4ABEC()
{
  return MEMORY[0x1E0DECFA0]();
}

uint64_t sub_1DBE4ABF8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1DBE4AC04()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1DBE4AC10()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1DBE4AC1C()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1DBE4AC28()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1DBE4AC34()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1DBE4AC40()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1DBE4AC4C()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1DBE4AC58()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1DBE4AC64()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1DBE4AC70()
{
  return MEMORY[0x1E0DED0C8]();
}

uint64_t sub_1DBE4AC7C()
{
  return MEMORY[0x1E0DED0D0]();
}

uint64_t sub_1DBE4AC88()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1DBE4AC94()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1DBE4ACA0()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1DBE4ACAC()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1DBE4ACB8()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1DBE4ACC4()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1DBE4ACD0()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1DBE4ACDC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DBE4ACE8()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1DBE4ACF4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DBE4AD00()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_1DBE4AD0C()
{
  return MEMORY[0x1E0DED670]();
}

uint64_t sub_1DBE4AD18()
{
  return MEMORY[0x1E0DED718]();
}

uint64_t sub_1DBE4AD24()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1DBE4AD30()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DBE4AD3C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DBE4AD48()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DBE4AD54()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DBE4AD60()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DBE4AD6C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DBE4AD78()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DBE4AD84()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DBE4AD90()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1DBE4AD9C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1DBE4ADA8()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1DBE4ADB4()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1DBE4ADC0()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1DBE4ADCC()
{
  return MEMORY[0x1E0DEE8E8]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

