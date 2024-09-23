uint64_t sub_246360F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + qword_2544205F8);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t GestureBridge.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  __int128 v15[2];
  _BYTE v16[40];
  _BYTE v17[40];

  sub_2463636C8(a3, (uint64_t)v17);
  sub_2463636C8(a6, (uint64_t)v16);
  sub_2463636C8(a3, (uint64_t)v15);
  type metadata accessor for GestureOutputSubmitter();
  OUTLINED_FUNCTION_40();
  swift_unknownObjectRetain();
  v12 = sub_246372FC0(v15, a4);
  type metadata accessor for GestureBridge();
  OUTLINED_FUNCTION_40();
  v13 = sub_246361048(a1, a2, (uint64_t)v17, a4, a5, (uint64_t)v16, v12, 0, 0);
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  return v13;
}

uint64_t sub_246361048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char *a8, char *a9)
{
  uint64_t v9;
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
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char *v35;
  id v36;
  char **v37;
  void *v38;
  char *v43;
  uint64_t v44;
  char v45[40];
  char v46[48];

  sub_246378E0C();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_11();
  v14 = v13 - v12;
  v15 = OUTLINED_FUNCTION_23();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_11();
  v19 = v18 - v17;
  v20 = v9 + qword_254420420;
  *(_OWORD *)v20 = 0u;
  *(_OWORD *)(v20 + 16) = 0u;
  *(_QWORD *)(v20 + 32) = 0;
  v21 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_27(v21, v22, v23, v21);
  v24 = (_QWORD *)(v9 + qword_2544205F8);
  *v24 = 0;
  v24[1] = 0;
  v25 = OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_27(v25, v26, v27, v25);
  v28 = (_QWORD *)(v9 + qword_2544206D0);
  *v28 = 0;
  v28[1] = 0;
  v29 = v9 + qword_2544205F0;
  *(_QWORD *)v29 = 0;
  *(_BYTE *)(v29 + 8) = 1;
  *(_QWORD *)(v9 + qword_254420600) = 0;
  sub_2463636C8(a3, (uint64_t)v46);
  v44 = a6;
  sub_2463636C8(a6, (uint64_t)v45);
  v30 = qword_254420100;
  swift_unknownObjectRetain();
  v31 = a5;
  if (v30 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v15, (uint64_t)qword_254420618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v19, v32, v15);
  v33 = sub_246378DD0();
  *(_QWORD *)(v33 + qword_254420600) = a7;
  swift_retain();
  swift_retain();
  swift_release();
  v35 = a8;
  if (!a8)
  {
    v36 = objc_allocWithZone((Class)type metadata accessor for GestureController());
    swift_unknownObjectRetain();
    v35 = sub_246368FE0();
    a9 = (char *)&off_2517914A8;
  }
  v37 = (char **)(v33 + qword_2544206D0);
  v38 = *(void **)(v33 + qword_2544206D0);
  *v37 = v35;
  v37[1] = a9;
  v43 = a8;

  if (*v37)
  {
    *(_QWORD *)&(*v37)[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate + 8] = &off_251791988;
    swift_unknownObjectWeakAssign();
  }
  sub_24637877C();
  OUTLINED_FUNCTION_4();
  sub_246378E18();
  OUTLINED_FUNCTION_5();
  sub_2463788CC();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  sub_246378B84();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  sub_246378B18();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  sub_246378914();
  type metadata accessor for GestureRequestProcessor();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378A1C();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378794();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_2463788FC();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378920();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378980();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378950();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378AAC();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378968();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378A10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378AC4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(v14, *MEMORY[0x24BEA6150]);
  sub_2463788F0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(v14, *MEMORY[0x24BEA6158]);
  sub_24637895C();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(v14, *MEMORY[0x24BEA6160]);
  sub_24637892C();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(v14, *MEMORY[0x24BEA6168]);
  sub_246378770();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_2463788E4();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378B6C();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378B78();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378AB8();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378AF4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378A28();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378AD0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378ADC();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378B00();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378944();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_24637898C();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378854();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  sub_246378908();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_20();
  swift_unknownObjectRelease();

  swift_release();
  swift_release_n();
  __swift_destroy_boxed_opaque_existential_1Tm(v44);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  OUTLINED_FUNCTION_2();
  return v33;
}

uint64_t (*sub_246361810())()
{
  swift_retain();
  return sub_2463640BC;
}

uint64_t (*sub_246361844())()
{
  swift_retain();
  return sub_2463640B8;
}

uint64_t (*sub_246361878())()
{
  swift_retain();
  return sub_2463640B4;
}

uint64_t (*sub_2463618AC())()
{
  swift_retain();
  return sub_2463640B0;
}

uint64_t (*sub_2463618E0())()
{
  swift_retain();
  return sub_2463640AC;
}

uint64_t (*sub_246361914())()
{
  swift_retain();
  return sub_2463640A8;
}

uint64_t (*sub_246361948())()
{
  swift_retain();
  return sub_2463640A4;
}

uint64_t (*sub_24636197C())()
{
  swift_retain();
  return sub_2463640A0;
}

uint64_t (*sub_2463619B0())()
{
  swift_retain();
  return sub_24636409C;
}

uint64_t (*sub_2463619E4())()
{
  swift_retain();
  return sub_246364098;
}

uint64_t (*sub_246361A18())()
{
  swift_retain();
  return sub_246364094;
}

uint64_t (*sub_246361A4C())()
{
  swift_retain();
  return sub_246364090;
}

uint64_t (*sub_246361A80())()
{
  swift_retain();
  return sub_24636408C;
}

uint64_t (*sub_246361AB4())()
{
  swift_retain();
  return sub_246364088;
}

uint64_t (*sub_246361AE8())()
{
  swift_retain();
  return sub_246364084;
}

uint64_t (*sub_246361B1C())()
{
  swift_retain();
  return sub_246364080;
}

uint64_t (*sub_246361B50())()
{
  swift_retain();
  return sub_24636407C;
}

uint64_t (*sub_246361B84())()
{
  swift_retain();
  return sub_246364078;
}

uint64_t (*sub_246361BB8())()
{
  swift_retain();
  return sub_246364074;
}

uint64_t (*sub_246361BEC())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_246364070;
}

uint64_t (*sub_246361C20())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_24636406C;
}

uint64_t (*sub_246361C54())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_246364068;
}

uint64_t (*sub_246361C88())()
{
  swift_retain();
  return sub_246364064;
}

uint64_t (*sub_246361CBC())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_246364060;
}

uint64_t (*sub_246361CF0())()
{
  swift_retain();
  return sub_24636405C;
}

uint64_t (*sub_246361D24())()
{
  swift_retain();
  return sub_246364058;
}

uint64_t (*sub_246361D58())()
{
  swift_retain();
  return sub_246364054;
}

uint64_t (*sub_246361D8C())()
{
  swift_retain();
  return sub_246364050;
}

uint64_t (*sub_246361DC0())()
{
  swift_retain();
  return sub_24636404C;
}

uint64_t (*sub_246361DF4())()
{
  swift_retain();
  return sub_246364048;
}

uint64_t (*sub_246361E28())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_246364044;
}

uint64_t (*sub_246361E5C())(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  swift_retain();
  return sub_246364040;
}

void sub_246361E90(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
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
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[5];
  uint64_t v44[4];

  v2 = v1;
  v4 = OUTLINED_FUNCTION_43();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_48();
  v41 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254420530);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  v39 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v35 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  v40 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v35 - v10;
  if (qword_254420100 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_23();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_254420618);
  v14 = a1;
  sub_246378E90();
  v15 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_33(v15))
  {
    v37 = v11;
    v16 = (uint8_t *)OUTLINED_FUNCTION_10();
    v17 = OUTLINED_FUNCTION_10();
    v38 = v2;
    v36 = v17;
    v44[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = objc_msgSend(v14, sel_debugDescription, v16 + 4, v36);
    v19 = sub_246378F5C();
    v21 = v20;

    v43[0] = sub_2463635B4(v19, v21, v44);
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v13, (os_log_type_t)v13, "Handling SessionStartedMessage: %s", v16);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_34((uint64_t)v11);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_41((uint64_t)v11, v22, &qword_2544203B0);
  OUTLINED_FUNCTION_31();
  v23 = sub_246378B48();
  sub_246360F3C(v23, v24);
  OUTLINED_FUNCTION_39();
  v38 = OUTLINED_FUNCTION_42();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v38);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_41((uint64_t)v8, v25, (uint64_t *)&unk_254420530);
  OUTLINED_FUNCTION_31();
  sub_246378E3C();
  __swift_project_boxed_opaque_existential_1(v44, v44[3]);
  v26 = v41;
  OUTLINED_FUNCTION_50();
  sub_246378D70();
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v26, v4);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_41((uint64_t)v43, v27, (uint64_t *)&unk_2544203C8);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  v28 = qword_254420600;
  if (*(_QWORD *)(v2 + qword_254420600))
  {
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_34((uint64_t)v11);
    v29 = v40;
    sub_24636391C((uint64_t)v11, v40, &qword_2544203B0);
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_52(v29);
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_46();
    v30 = *(_QWORD *)(v2 + v28);
    if (v30)
    {
      OUTLINED_FUNCTION_47();
      v31 = sub_246378B48();
      v32 = (uint64_t *)(v30 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
      *v32 = v31;
      v32[1] = v33;
      OUTLINED_FUNCTION_46();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v2 + v28))
      {
        OUTLINED_FUNCTION_47();
        OUTLINED_FUNCTION_39();
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v38);
        v34 = v39;
        sub_24636391C((uint64_t)v8, v39, (uint64_t *)&unk_254420530);
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_52(v34);
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_46();
      }
    }
  }
  OUTLINED_FUNCTION_18();
}

void sub_24636232C(void *a1)
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
  NSObject *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38[3];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254420530);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_11();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_11();
  v11 = v10 - v9;
  if (qword_254420100 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_23();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_254420618);
  v14 = a1;
  v15 = v13;
  sub_246378E90();
  v16 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v13, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_10();
    v38[0] = OUTLINED_FUNCTION_10();
    *(_DWORD *)v17 = 136315138;
    v18 = objc_msgSend(v14, sel_debugDescription);
    v19 = sub_246378F5C();
    v21 = v20;

    sub_2463635B4(v19, v21, v38);
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v15, v16, "Handling SessionEndedMessage: %s", v17);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_21();
  v22 = v2 + qword_2544205E8;
  OUTLINED_FUNCTION_8();
  sub_2463638CC(v11, v22, &qword_2544203B0);
  OUTLINED_FUNCTION_28();
  sub_246360F3C(0, 0);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_25();
  v23 = v2 + qword_2544206C8;
  OUTLINED_FUNCTION_8();
  sub_2463638CC(v7, v23, (uint64_t *)&unk_254420530);
  OUTLINED_FUNCTION_28();
  v24 = qword_254420600;
  v25 = *(_QWORD *)(v2 + qword_254420600);
  if (v25)
  {
    OUTLINED_FUNCTION_21();
    v26 = v25 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
    OUTLINED_FUNCTION_8();
    swift_retain();
    sub_2463638CC(v11, v26, &qword_2544203B0);
    OUTLINED_FUNCTION_28();
    swift_release();
    v27 = *(_QWORD *)(v2 + v24);
    if (v27)
    {
      v28 = (_QWORD *)(v27 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
      *v28 = 0;
      v28[1] = 0;
      swift_bridgeObjectRelease();
      v29 = *(_QWORD *)(v2 + v24);
      if (v29)
      {
        OUTLINED_FUNCTION_25();
        v30 = v29 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
        OUTLINED_FUNCTION_8();
        swift_retain();
        sub_2463638CC(v7, v30, (uint64_t *)&unk_254420530);
        OUTLINED_FUNCTION_28();
        swift_release();
      }
    }
  }
  v31 = qword_2544206D0;
  v32 = *(void **)(v2 + qword_2544206D0);
  if (v32)
  {
    v33 = v32;
    sub_24636F194(6u);

    v34 = *(void **)(v2 + v31);
    if (v34)
    {
      v35 = v34;
      sub_24636EEE8();

      v36 = *(void **)(v2 + v31);
      if (v36)
      {
        v37 = v36;
        sub_24636EFD8();

      }
    }
  }
  OUTLINED_FUNCTION_18();
}

void sub_2463626C4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;

  v2 = v1;
  if (qword_254420100 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_23();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_254420618);
  v6 = a1;
  v7 = v5;
  sub_246378E90();
  v8 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v5, v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_10();
    v19 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v9 = 136315138;
    v10 = objc_msgSend(v6, sel_debugDescription);
    v11 = sub_246378F5C();
    v13 = v12;

    sub_2463635B4(v11, v13, &v19);
    OUTLINED_FUNCTION_51();
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v7, v8, "Handling SiriDismissedMessage: %s", v9);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  v14 = qword_2544206D0;
  v15 = *(void **)(v2 + qword_2544206D0);
  if (v15)
  {
    v16 = v15;
    sub_24636F194(5u);

    v17 = *(void **)(v2 + v14);
    if (v17)
    {
      v18 = v17;
      sub_24636EEE8();

    }
  }
  OUTLINED_FUNCTION_13();
}

void sub_246362888(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;

  v2 = v1;
  if (qword_254420100 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_23();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_254420618);
  v6 = a1;
  sub_246378E90();
  v7 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v5, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_10();
    v20 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v8 = 136315138;
    v9 = objc_msgSend(v6, sel_debugDescription);
    v10 = sub_246378F5C();
    v12 = v11;

    sub_2463635B4(v10, v12, &v20);
    OUTLINED_FUNCTION_51();
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v5, v7, "Handling AnnounceNotificationHandlingStateUpdatedMessage: %s", v8);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  v13 = sub_246378B0C();
  v14 = *(_BYTE *)(v2 + qword_2544205F0 + 8);
  if ((v15 & 1) != 0)
  {
    if ((*(_BYTE *)(v2 + qword_2544205F0 + 8) & 1) != 0)
    {
LABEL_9:
      v16 = sub_246378E90();
      v17 = sub_246378FE0();
      if (OUTLINED_FUNCTION_33(v17))
      {
        v18 = (uint8_t *)OUTLINED_FUNCTION_10();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_24635F000, v16, (os_log_type_t)v2, "External notification request handler state did not change", v18, 2u);
        OUTLINED_FUNCTION_7();
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (v13 != *(_QWORD *)(v2 + qword_2544205F0))
      v14 = 1;
    if ((v14 & 1) == 0)
      goto LABEL_9;
  }
  sub_246378B0C();
  v19 = *(void **)(v2 + qword_2544206D0);
  if (v19)
  {
    v16 = v19;
    sub_24636E2EC();
LABEL_14:

  }
  OUTLINED_FUNCTION_13();
}

uint64_t sub_246362AD0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(_QWORD, _QWORD, _QWORD);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  _BYTE *v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(_QWORD, _QWORD, _QWORD);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84[5];
  unint64_t v85;

  v75 = a4;
  v74 = a3;
  v85 = a2;
  v80 = a1;
  v7 = sub_24637862C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_48();
  v78 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544200D8);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_11();
  v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15();
  v76 = v16;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v73 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v73 - v21;
  v81 = v5;
  v23 = v5 + qword_2544205E8;
  OUTLINED_FUNCTION_45();
  v79 = v8;
  v24 = *(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16);
  v25 = v23;
  v73 = a5;
  v77 = v24;
  v24(v22, a5, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v7);
  v26 = v14 + *(int *)(v10 + 48);
  sub_246363684(v25, v14, &qword_2544203B0);
  sub_246363684((uint64_t)v22, v26, &qword_2544203B0);
  OUTLINED_FUNCTION_26(v14);
  if (v28)
  {
    sub_246363748((uint64_t)v22, &qword_2544203B0);
    OUTLINED_FUNCTION_26(v26);
    if (v28)
    {
      sub_246363748(v14, &qword_2544203B0);
      v27 = v81;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  sub_246363684(v14, (uint64_t)v20, &qword_2544203B0);
  OUTLINED_FUNCTION_26(v26);
  if (v28)
  {
    sub_246363748((uint64_t)v22, &qword_2544203B0);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v20, v7);
LABEL_9:
    sub_246363748(v14, &qword_2544200D8);
LABEL_21:
    if (qword_254420100 != -1)
      swift_once();
    v56 = OUTLINED_FUNCTION_23();
    __swift_project_value_buffer(v56, (uint64_t)qword_254420618);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v57 = sub_246378E90();
    v58 = sub_246378FE0();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = OUTLINED_FUNCTION_10();
      v84[0] = OUTLINED_FUNCTION_10();
      *(_DWORD *)v59 = 136315394;
      v60 = v76;
      sub_246363684(v25, v76, &qword_2544203B0);
      if (__swift_getEnumTagSinglePayload(v60, 1, v7))
      {
        sub_246363748(v60, &qword_2544203B0);
        v61 = 0xE300000000000000;
        v62 = 7104878;
      }
      else
      {
        v68 = v78;
        OUTLINED_FUNCTION_29(v78, v60);
        sub_246363748(v60, &qword_2544203B0);
        v62 = sub_246378614();
        v61 = v69;
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v68, v7);
      }
      *(_QWORD *)&v82 = sub_2463635B4(v62, v61, v84);
      sub_246379064();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      v70 = v85;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v82 = sub_2463635B4(v80, v70, v84);
      sub_246379064();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24635F000, v57, v58, "Request does not belong to current sessionId: %s for requestId: %s", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_7();
    }

    swift_bridgeObjectRelease_n();
    swift_release_n();
    v55 = 0;
    goto LABEL_34;
  }
  v29 = v79;
  v30 = v78;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 32))(v78, v26, v7);
  sub_246363708();
  v31 = sub_246378F44();
  v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v32(v30, v7);
  sub_246363748((uint64_t)v22, &qword_2544203B0);
  v32((uint64_t)v20, v7);
  sub_246363748(v14, &qword_2544203B0);
  v27 = v81;
  if ((v31 & 1) == 0)
    goto LABEL_21;
LABEL_11:
  v33 = v27 + qword_254420420;
  OUTLINED_FUNCTION_45();
  sub_246363684(v33, (uint64_t)&v82, (uint64_t *)&unk_2544203C8);
  if (!v83)
  {
    sub_246363748((uint64_t)&v82, (uint64_t *)&unk_2544203C8);
    if (qword_254420100 != -1)
      swift_once();
    v63 = OUTLINED_FUNCTION_23();
    __swift_project_value_buffer(v63, (uint64_t)qword_254420618);
    v64 = (void *)sub_246378E90();
    v65 = sub_246378FE0();
    if (OUTLINED_FUNCTION_38(v65))
    {
      *(_WORD *)OUTLINED_FUNCTION_10() = 0;
      OUTLINED_FUNCTION_22(&dword_24635F000, v66, v67, "‼️ Unable to find SessionState to pass to GestureProcessor.");
      OUTLINED_FUNCTION_7();
    }

    v55 = 1;
LABEL_34:
    sub_246363578();
    swift_allocError();
    *v71 = v55;
    swift_willThrow();
    return v55;
  }
  sub_2463636B0(&v82, (uint64_t)v84);
  if (qword_254420100 != -1)
    swift_once();
  v34 = OUTLINED_FUNCTION_23();
  __swift_project_value_buffer(v34, (uint64_t)qword_254420618);
  v35 = (void *)sub_246378E90();
  v36 = sub_246378FD4();
  v37 = OUTLINED_FUNCTION_38(v36);
  v38 = v80;
  if (v37)
  {
    *(_WORD *)OUTLINED_FUNCTION_10() = 0;
    OUTLINED_FUNCTION_22(&dword_24635F000, v39, v40, "Updating session state");
    OUTLINED_FUNCTION_7();
  }

  v41 = v27 + qword_2544206D0;
  v42 = *(void **)(v27 + qword_2544206D0);
  if (v42)
  {
    sub_2463636C8((uint64_t)v84, (uint64_t)&v82);
    v43 = (uint64_t)v42 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
    OUTLINED_FUNCTION_45();
    v44 = v42;
    sub_2463638CC((uint64_t)&v82, v43, (uint64_t *)&unk_2544203C8);
    swift_endAccess();

  }
  if (*(_QWORD *)(v27 + qword_254420600))
  {
    swift_retain();
    sub_246373320(v38, v85);
    swift_release();
  }
  v45 = v78;
  OUTLINED_FUNCTION_29(v78, v73);
  v46 = v75;
  swift_bridgeObjectRetain();
  v47 = v85;
  swift_bridgeObjectRetain();
  v48 = sub_246378E48();
  v50 = v49;
  sub_246378E30();
  v51 = sub_246378E24();
  v52 = *(void **)v41;
  v53 = *(_QWORD *)(v41 + 8);
  type metadata accessor for GestureRequestProcessor();
  swift_allocObject();
  v54 = v52;
  v55 = sub_246375AEC(v74, v46, v45, v80, v47, v48, v50, (uint64_t)&v82, v51, v52, v53);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
  return v55;
}

void GestureBridge.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  OUTLINED_FUNCTION_37();
  __break(1u);
}

void GestureBridge.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  OUTLINED_FUNCTION_37();
  __break(1u);
}

uint64_t sub_246363320()
{
  uint64_t v0;

  sub_246363748(v0 + qword_254420420, (uint64_t *)&unk_2544203C8);
  sub_246363748(v0 + qword_2544205E8, &qword_2544203B0);
  swift_bridgeObjectRelease();
  sub_246363748(v0 + qword_2544206C8, (uint64_t *)&unk_254420530);

  return swift_release();
}

void GestureBridge.deinit()
{
  uint64_t v0;

  v0 = sub_246378DDC();
  sub_246363748(v0 + qword_254420420, (uint64_t *)&unk_2544203C8);
  sub_246363748(v0 + qword_2544205E8, &qword_2544203B0);
  swift_bridgeObjectRelease();
  sub_246363748(v0 + qword_2544206C8, (uint64_t *)&unk_254420530);

  swift_release();
  OUTLINED_FUNCTION_16();
}

uint64_t GestureBridge.__deallocating_deinit()
{
  GestureBridge.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GestureBridge()
{
  uint64_t result;

  result = qword_2544200F0;
  if (!qword_2544200F0)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_24636349C(uint64_t *a1, uint64_t *a2)
{
  return sub_2463654DC(*a1, *a2);
}

void sub_2463634A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_16();
}

void sub_2463634D0(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_246363500();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249558784]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_246363578()
{
  unint64_t result;

  result = qword_25756D4A8;
  if (!qword_25756D4A8)
  {
    result = MEMORY[0x24955879C](&unk_2463798C4, &type metadata for GestureBridgeError);
    atomic_store(result, (unint64_t *)&qword_25756D4A8);
  }
  return result;
}

uint64_t sub_2463635B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_246363948(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_246363ABC((uint64_t)v12, *a3);
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
      sub_246363ABC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

void sub_246363684(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14(a1, a2, a3);
  OUTLINED_FUNCTION_24(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2463636B0(__int128 *a1, uint64_t a2)
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

void sub_2463636C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_246363708()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544203A0;
  if (!qword_2544203A0)
  {
    v1 = sub_24637862C();
    result = MEMORY[0x24955879C](MEMORY[0x24BDCEA98], v1);
    atomic_store(result, (unint64_t *)&qword_2544203A0);
  }
  return result;
}

void sub_246363748(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_16();
}

void sub_246363780()
{
  unint64_t v0;
  unint64_t v1;

  sub_246363868(319, &qword_2544203B8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  if (v0 <= 0x3F)
  {
    sub_246363868(319, &qword_2544204F0, (void (*)(uint64_t))MEMORY[0x24BE9B488]);
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t method lookup function for GestureBridge()
{
  return swift_lookUpClassMethod();
}

void sub_246363868(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_246379058();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t sub_2463638B0()
{
  return type metadata accessor for GestureBridge();
}

void type metadata accessor for AFExternalNotificationRequestHandlerState(uint64_t a1)
{
  sub_2463640D4(a1, (unint64_t *)&unk_25756D530);
}

void sub_2463638CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14(a1, a2, a3);
  OUTLINED_FUNCTION_24(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  OUTLINED_FUNCTION_16();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_24636391C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14(a1, a2, a3);
  OUTLINED_FUNCTION_24(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_16();
}

uint64_t sub_246363948(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_246363AF8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_246379070();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_246363BBC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2463790C4();
    if (!v8)
    {
      result = sub_2463790DC();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_246363ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_246363AF8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2463790E8();
  __break(1u);
  return result;
}

uint64_t sub_246363BBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246363C50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246363E24(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246363E24((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246363C50(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_246378F98();
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
  v3 = sub_246363DC0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2463790B8();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2463790E8();
  __break(1u);
LABEL_14:
  result = sub_2463790DC();
  __break(1u);
  return result;
}

_QWORD *sub_246363DC0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254420568);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246363E24(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420568);
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
    sub_246363FBC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246363EF8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_246363EF8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2463790E8();
  __break(1u);
  return result;
}

char *sub_246363FBC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2463790E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void type metadata accessor for AFSpeechEvent(uint64_t a1)
{
  sub_2463640D4(a1, (unint64_t *)&unk_25756D540);
}

void sub_2463640D4(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_246378DC4();
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v3, v0, v1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x249558838);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_246378E18();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_246378DC4();
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_246378E9C();
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 280))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_246378FD4();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_endAccess();
}

BOOL OUTLINED_FUNCTION_33(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_36(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

BOOL OUTLINED_FUNCTION_38(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_2463788C0();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_41(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_2463638CC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_246378D88();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_24637862C();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_246378B30();
}

void OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_2463638CC(a1, v2, v1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GestureBridgeError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GestureBridgeError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24636448C + 4 * byte_2463797F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2463644C0 + 4 * byte_2463797F0[v4]))();
}

uint64_t sub_2463644C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463644C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463644D0);
  return result;
}

uint64_t sub_2463644DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463644E4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2463644E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463644F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463644FC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246364504(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GestureBridgeError()
{
  return &type metadata for GestureBridgeError;
}

unint64_t sub_246364520(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000016;
  else
    return 0xD00000000000002ELL;
}

uint64_t sub_24636455C()
{
  return sub_246379154();
}

BOOL sub_246364580(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_246364590()
{
  sub_246379148();
  sub_246379154();
  return sub_246379160();
}

uint64_t sub_2463645D4()
{
  return sub_246364590();
}

uint64_t sub_2463645DC()
{
  return sub_24636455C();
}

uint64_t sub_2463645E4()
{
  sub_246379148();
  sub_246379154();
  return sub_246379160();
}

unint64_t sub_246364624()
{
  char *v0;

  return sub_246364520(*v0);
}

BOOL sub_246364638(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_246364580(*a1, *a2);
}

unint64_t sub_24636464C()
{
  unint64_t result;

  result = qword_25756D610;
  if (!qword_25756D610)
  {
    result = MEMORY[0x24955879C](&unk_246379814, &type metadata for GestureBridgeError);
    atomic_store(result, (unint64_t *)&qword_25756D610);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserIntent()
{
  return &type metadata for UserIntent;
}

uint64_t *sub_2463646A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246378C14();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_246364744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_246378C14();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t sub_2463647AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_246378C14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_24636481C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_246378C14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_24636488C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_246378C14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_2463648FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_246378C14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_24636496C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246364978(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_2463649A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2463649B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t type metadata accessor for GestureMapping(uint64_t a1)
{
  return sub_24636823C(a1, qword_254420408);
}

uint64_t sub_2463649FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246378C14();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246364A64(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246378F14();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_246378E9C();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_246364B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_246378F14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 28);
  v6 = sub_246378E9C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_246364BA8(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = sub_246378F14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_246378E9C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_246364C54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_246378F14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_246378E9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_246364D08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_246378F14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_246378E9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_246364D98(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_246378F14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_246378E9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_246364E38()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246364E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  OUTLINED_FUNCTION_66();
  sub_246378F14();
  OUTLINED_FUNCTION_40_0();
  if (v4)
  {
    v5 = v3;
    v6 = v1;
    return OUTLINED_FUNCTION_23_0(v6, v0, v5);
  }
  if ((_DWORD)v0 != 0x7FFFFFFF)
  {
    v5 = OUTLINED_FUNCTION_23();
    v6 = v1 + *(int *)(v2 + 28);
    return OUTLINED_FUNCTION_23_0(v6, v0, v5);
  }
  v7 = *(_QWORD *)(v1 + *(int *)(v2 + 24) + 8);
  if (v7 >= 0xFFFFFFFF)
    LODWORD(v7) = -1;
  return (v7 + 1);
}

uint64_t sub_246364EC4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246364ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_36_0();
  sub_246378F14();
  OUTLINED_FUNCTION_41_0();
  if (v5)
  {
    v6 = v4;
    v7 = v1;
  }
  else
  {
    if (v3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
      OUTLINED_FUNCTION_63();
      return;
    }
    v6 = OUTLINED_FUNCTION_23();
    v7 = v1 + *(int *)(v2 + 28);
  }
  OUTLINED_FUNCTION_24_0(v7, v0, v0, v6);
}

uint64_t type metadata accessor for EventDeduper(uint64_t a1)
{
  return sub_24636823C(a1, (uint64_t *)&unk_254420510);
}

uint64_t sub_246364F54()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_246378F14();
  if (v1 <= 0x3F)
  {
    result = sub_246378E9C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_246364FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_246365040(char a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;

  if ((a1 & 1) == 0)
  {
    v2 = (char *)MEMORY[0x24BEE4AF8];
    if ((a1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_246367984(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = OUTLINED_FUNCTION_11_0((char *)(v3 > 1), v4 + 1);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[16 * v4];
  *((_QWORD *)v5 + 4) = 0x747065636361;
  *((_QWORD *)v5 + 5) = 0xE600000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = OUTLINED_FUNCTION_11_0(0, *((_QWORD *)v2 + 2) + 1);
    v7 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    if (v7 >= v6 >> 1)
      v2 = OUTLINED_FUNCTION_11_0((char *)(v6 > 1), v7 + 1);
    *((_QWORD *)v2 + 2) = v7 + 1;
    v8 = &v2[16 * v7];
    *((_QWORD *)v8 + 4) = 0x7463656A6572;
    *((_QWORD *)v8 + 5) = 0xE600000000000000;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = OUTLINED_FUNCTION_11_0(0, *((_QWORD *)v2 + 2) + 1);
    v10 = *((_QWORD *)v2 + 2);
    v9 = *((_QWORD *)v2 + 3);
    if (v10 >= v9 >> 1)
      v2 = OUTLINED_FUNCTION_11_0((char *)(v9 > 1), v10 + 1);
    *((_QWORD *)v2 + 2) = v10 + 1;
    v11 = &v2[16 * v10];
    *((_QWORD *)v11 + 4) = 0x7373696D736964;
    *((_QWORD *)v11 + 5) = 0xE700000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D678);
  sub_2463681F4(&qword_25756D680, &qword_25756D678);
  v12 = sub_246378F38();
  OUTLINED_FUNCTION_8_0();
  return v12;
}

_QWORD *sub_246365218@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_246365224@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_246365248();
  *a1 = result;
  return result;
}

uint64_t sub_246365248()
{
  return 0;
}

uint64_t sub_246365250@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_24636527C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_24636527C(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_246365284@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;

  result = j__OUTLINED_FUNCTION_46_0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_2463652B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_2463652E0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_2463652E0(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_2463652E8(_QWORD *a1, uint64_t *a2)
{
  return sub_2463652F0(a1, *a2);
}

BOOL sub_2463652F0(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_24636531C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_24636534C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_24636534C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_246365370@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_2463653A0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_2463653A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_2463653B8(uint64_t *a1)
{
  return sub_2463653C0(*a1);
}

uint64_t sub_2463653C0(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_2463653D0(uint64_t *a1)
{
  return sub_2463653D8(*a1);
}

uint64_t sub_2463653D8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_2463653E8(uint64_t *a1)
{
  return sub_2463653F0(*a1);
}

uint64_t sub_2463653F0(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_246365400@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_24636542C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_24636542C(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_246365434(uint64_t *a1)
{
  uint64_t *v1;

  return sub_246365440(*a1, *v1);
}

BOOL sub_246365440(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_24636544C(uint64_t *a1)
{
  uint64_t *v1;

  return sub_246365458(*a1, *v1);
}

BOOL sub_246365458(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_246365464(uint64_t *a1)
{
  uint64_t *v1;

  return sub_246365470(*a1, *v1);
}

BOOL sub_246365470(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_24636547C()
{
  uint64_t *v0;

  return sub_246365484(*v0);
}

BOOL sub_246365484(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_246365490()
{
  return sub_246379094();
}

uint64_t sub_2463654A8(uint64_t *a1)
{
  return sub_2463654B0(*a1);
}

uint64_t sub_2463654B0(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

_QWORD *sub_2463654C0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2463654D0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2463654DC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_2463654E8(uint64_t a1, uint64_t a2)
{
  return sub_246365520(a1, a2, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
}

uint64_t sub_246365504(uint64_t a1, uint64_t a2)
{
  return sub_246365520(a1, a2, (void (*)(uint64_t))MEMORY[0x24BE9B428], &qword_254420528);
}

uint64_t sub_246365520(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), _QWORD *a4)
{
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  a3(0);
  sub_246368BFC(a4, a3);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_61();
  if (v11 == v9 && v12 == v10)
    v7 = 1;
  else
    v7 = sub_24637910C();
  OUTLINED_FUNCTION_8_0();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2463655E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_246364FF0(a1);
  *a2 = result;
  return result;
}

void sub_246365604(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD, uint64_t);
  os_log_type_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *oslog;

  if (a1)
  {
    v7 = a1;
    v8 = 0x1F3F9C000;
    if (objc_msgSend(v7, sel_acceptGesture) == (id)2 && OUTLINED_FUNCTION_50_0() == (id)1)
    {

      v9 = *MEMORY[0x24BE9AF80];
      v10 = OUTLINED_FUNCTION_5_0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(a2, v9, v10);
      OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_15_0();
      __asm { BR              X3 }
    }
    if (objc_msgSend(v7, sel_acceptGesture) == (id)1 && OUTLINED_FUNCTION_50_0() == (id)2)
    {

    }
    else
    {
      if (qword_254420100 != -1)
        swift_once();
      v18 = OUTLINED_FUNCTION_23();
      v8 = __swift_project_value_buffer(v18, (uint64_t)qword_254420618);
      v19 = v7;
      v20 = sub_246378E90();
      v21 = sub_246378FE0();
      if (OUTLINED_FUNCTION_43_0(v21))
      {
        v22 = (uint8_t *)OUTLINED_FUNCTION_10();
        v23 = (_QWORD *)OUTLINED_FUNCTION_10();
        *(_DWORD *)v22 = 138412290;
        v24 = v19;
        sub_246379064();
        *v23 = a1;

        OUTLINED_FUNCTION_36(&dword_24635F000, v20, v4, "Invalid configuration: %@, using default values", v22);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7C0);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

    }
    v25 = OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_16_0(v25);
    v26 = OUTLINED_FUNCTION_44();
    ((void (*)(uint64_t, _QWORD, void *))v8)(v26, *MEMORY[0x24BE9AF80], a1);
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    v12 = sub_246378C14();
    OUTLINED_FUNCTION_16_0(v12);
    v13 = OUTLINED_FUNCTION_44();
    v3(v13, *MEMORY[0x24BE9AF80], v2);
    if (qword_254420100 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_23();
    oslog = OUTLINED_FUNCTION_4_0(v14, (uint64_t)qword_254420618);
    v15 = sub_246378FE0();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_10();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_24635F000, oslog, v15, "Received nil gesture configuration, using default gesture mapping", v16, 2u);
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_15_0();

  }
}

uint64_t sub_24636592C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  OUTLINED_FUNCTION_39_0();
  v78 = v2;
  v79 = v3;
  v4 = v0;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_5_0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  v77 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  v71 = v9;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_38_0();
  v76 = v10;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_38_0();
  v74 = v11;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_38_0();
  v75 = v12;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_38_0();
  v73 = v13;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_38_0();
  v70 = v14;
  OUTLINED_FUNCTION_22_0();
  v15 = MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v70 - v16;
  v18 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v15);
  v20 = (char *)&v70 - v19;
  v21 = ((uint64_t (*)(uint64_t))MEMORY[0x24BDAC7A8])(v18);
  v23 = (char *)&v70 - v22;
  ((void (*)(uint64_t))MEMORY[0x24BDAC7A8])(v21);
  v25 = (char *)&v70 - v24;
  v26 = sub_2463682B4(v4, (uint64_t)&v70 - v24);
  v27 = v6;
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_0(v26, *MEMORY[0x24BE9AF78]);
    v31 = OUTLINED_FUNCTION_19_0((uint64_t)v25, v30, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
    v32 = v7;
    v33 = v31;
    v28 = v8;
    v34 = *(void (**)(uint64_t))(v8 + 8);
    v29 = v32;
    v34(v1);
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_60();
    if ((v33 & 1) != 0)
    {
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_17(v4);
      v72 = 1;
LABEL_9:
      v38 = v27;
      v39 = v74;
      goto LABEL_13;
    }
  }
  else
  {
    v28 = v8;
    v29 = v7;
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_60();
  }
  sub_2463682B4((uint64_t)v23, (uint64_t)v20);
  if ((v27 & 2) == 0)
  {
    sub_2463682F8((uint64_t)v20);
    OUTLINED_FUNCTION_69();
    OUTLINED_FUNCTION_17(v4);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_47_0();
  v36 = (uint64_t)&v20[v35];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v1, *MEMORY[0x24BE9AF78], v29);
  LOBYTE(v36) = OUTLINED_FUNCTION_19_0(v36, v37, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v1, v29);
  sub_2463682F8((uint64_t)v20);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_17(v4);
  if ((v36 & 1) != 0)
  {
    v72 = 1;
    goto LABEL_9;
  }
LABEL_10:
  v40 = v70;
  sub_2463682B4((uint64_t)v17, v70);
  v38 = v27;
  v39 = v74;
  if ((v27 & 4) != 0)
  {
    OUTLINED_FUNCTION_47_0();
    v42 = v40 + v41;
    OUTLINED_FUNCTION_2_0(v43, *MEMORY[0x24BE9AF78]);
    v72 = OUTLINED_FUNCTION_19_0(v42, v44, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_33_0();
  }
  else
  {
    OUTLINED_FUNCTION_33_0();
    v72 = 0;
  }
LABEL_13:
  OUTLINED_FUNCTION_13_0();
  v45 = v73;
  v46 = OUTLINED_FUNCTION_17(v4);
  v47 = (unsigned int *)MEMORY[0x24BE9AF80];
  if ((v38 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_0(v46, *MEMORY[0x24BE9AF80]);
    v50 = OUTLINED_FUNCTION_19_0(v45, v49, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_13_0();
    v48 = v75;
    OUTLINED_FUNCTION_17(v4);
    if ((v50 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_18_0();
      goto LABEL_20;
    }
  }
  else
  {
    OUTLINED_FUNCTION_13_0();
    v48 = v75;
    OUTLINED_FUNCTION_17(v4);
  }
  sub_2463682B4(v48, v39);
  if ((v38 & 2) == 0)
  {
    sub_2463682F8(v39);
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_18_0();
LABEL_22:
    v56 = v71;
    OUTLINED_FUNCTION_17(v4);
    if ((v38 & 4) == 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_59();
      if ((v72 & 1) != 0)
      {
        v55 = 0;
        goto LABEL_26;
      }
      return 0;
    }
    OUTLINED_FUNCTION_47_0();
    v50 = v56 + v57;
    OUTLINED_FUNCTION_2_0(v58, *v47);
    v55 = OUTLINED_FUNCTION_19_0(v50, v59, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_59();
    if ((v72 & 1) != 0)
      goto LABEL_26;
    if ((v55 & 1) == 0)
      return 0;
LABEL_34:
    v64 = 2;
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_47_0();
  v52 = v39 + v51;
  OUTLINED_FUNCTION_2_0(v53, *v47);
  v50 = OUTLINED_FUNCTION_19_0(v52, v54, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
  OUTLINED_FUNCTION_7_0();
  sub_2463682F8(v39);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_18_0();
  if ((v50 & 1) == 0)
    goto LABEL_22;
LABEL_20:
  OUTLINED_FUNCTION_59();
  if ((v72 & 1) == 0)
    goto LABEL_34;
  v55 = 1;
LABEL_26:
  if (qword_254420100 != -1)
    swift_once();
  v60 = OUTLINED_FUNCTION_23();
  v61 = OUTLINED_FUNCTION_4_0(v60, (uint64_t)qword_254420618);
  v62 = sub_246378FD4();
  v50 = v62;
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_WORD *)v63 = 0;
    _os_log_impl(&dword_24635F000, v61, (os_log_type_t)v50, "🙂‍↕️ Accepting nods", v63, 2u);
    OUTLINED_FUNCTION_7();
  }

  if ((v55 & 1) == 0)
    return 1;
  v64 = 3;
LABEL_35:
  if (qword_254420100 != -1)
    swift_once();
  v65 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v65, (uint64_t)qword_254420618);
  v66 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_42_0(v66))
  {
    *(_WORD *)OUTLINED_FUNCTION_10() = 0;
    OUTLINED_FUNCTION_26_0(&dword_24635F000, v67, v68, "🙂‍↔️ Accepting shakes");
    OUTLINED_FUNCTION_7();
  }

  return v64;
}

uint64_t sub_246365F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = type metadata accessor for GestureMapping(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_5_0();
  v4 = (void (*)(uint64_t))MEMORY[0x24BE9AF98];
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_64(v5, *MEMORY[0x24BE9AF80]);
  LOBYTE(v4) = sub_246365520(v1, v2, v4, &qword_25756D638);
  OUTLINED_FUNCTION_27_0();
  v6 = sub_2463682B4(v1, v0);
  if ((v4 & 1) != 0)
  {
    v7 = v0 + *(int *)(v3 + 20);
    OUTLINED_FUNCTION_64(v6, *MEMORY[0x24BE9AF78]);
    v8 = sub_246365520(v7, v2, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
    OUTLINED_FUNCTION_27_0();
  }
  else
  {
    v8 = 0;
  }
  sub_2463682F8(v0);
  return v8 & 1;
}

uint64_t sub_246366030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v2 = v0;
  v3 = 0x1000000000000011;
  v4 = OUTLINED_FUNCTION_5_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v2, v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v1, v4);
  if (v6 != *MEMORY[0x24BE9AF78])
  {
    if (v6 != *MEMORY[0x24BE9AF80])
    {
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
      return 0x55208FB8EFBC80E2;
    }
    v3 = 0x1000000000000013;
  }
  OUTLINED_FUNCTION_55();
  return v3;
}

void sub_24636612C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_246365520(a1, a2, (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638) & 1) != 0)
  {
    v4 = type metadata accessor for GestureMapping(0);
    sub_246365520(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638);
  }
  OUTLINED_FUNCTION_16();
}

unint64_t sub_2463661AC()
{
  unint64_t result;

  result = qword_25756D618;
  if (!qword_25756D618)
  {
    result = MEMORY[0x24955879C](&unk_2463799C0, &type metadata for UserIntent);
    atomic_store(result, (unint64_t *)&qword_25756D618);
  }
  return result;
}

unint64_t sub_2463661EC()
{
  unint64_t result;

  result = qword_25756D620;
  if (!qword_25756D620)
  {
    result = MEMORY[0x24955879C](&unk_246379990, &type metadata for UserIntent);
    atomic_store(result, (unint64_t *)&qword_25756D620);
  }
  return result;
}

unint64_t sub_24636622C()
{
  unint64_t result;

  result = qword_25756D628;
  if (!qword_25756D628)
  {
    result = MEMORY[0x24955879C](&unk_2463799E8, &type metadata for UserIntent);
    atomic_store(result, (unint64_t *)&qword_25756D628);
  }
  return result;
}

unint64_t sub_24636626C()
{
  unint64_t result;

  result = qword_25756D630;
  if (!qword_25756D630)
  {
    result = MEMORY[0x24955879C](&unk_246379A20, &type metadata for UserIntent);
    atomic_store(result, (unint64_t *)&qword_25756D630);
  }
  return result;
}

uint64_t sub_2463662A8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for GestureResponse(0);
  sub_24636826C((uint64_t)v1 + *(int *)(v5 + 28), (uint64_t)v4);
  v6 = sub_246378BF0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v6) == 1)
  {
    sub_246363748((uint64_t)v4, (uint64_t *)&unk_2544200E0);
  }
  else
  {
    sub_246378B9C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_2463790AC();
  sub_246378F8C();
  sub_2463785D8();
  sub_246378FBC();
  OUTLINED_FUNCTION_55();
  sub_246378F8C();
  OUTLINED_FUNCTION_5_0();
  sub_2463790D0();
  sub_246378F8C();
  sub_246365040(*v1);
  sub_246378F8C();
  OUTLINED_FUNCTION_8_0();
  sub_246378F8C();
  sub_246378F8C();
  OUTLINED_FUNCTION_32();
  return v8[0];
}

void sub_246366488()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
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
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_39_0();
  v3 = v2;
  v5 = v4;
  v6 = sub_246378BF0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D728);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_37_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v23 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v23 - v17;
  if (*v5 == *v3)
  {
    v24 = v7;
    v19 = type metadata accessor for GestureResponse(0);
    if ((sub_2463785E4() & 1) != 0
      && (sub_246365520((uint64_t)v5 + *(int *)(v19 + 24), (uint64_t)v3 + *(int *)(v19 + 24), (void (*)(uint64_t))MEMORY[0x24BE9AF98], &qword_25756D638) & 1) != 0)
    {
      sub_24636826C((uint64_t)v5 + *(int *)(v19 + 28), (uint64_t)v18);
      sub_24636826C((uint64_t)v3 + *(int *)(v19 + 28), (uint64_t)v16);
      v20 = v0 + *(int *)(v8 + 48);
      sub_24636826C((uint64_t)v18, v0);
      sub_24636826C((uint64_t)v16, v20);
      OUTLINED_FUNCTION_30_0(v0);
      if (!v21)
      {
        sub_24636826C(v0, (uint64_t)v13);
        OUTLINED_FUNCTION_30_0(v20);
        if (!v21)
        {
          v22 = v24;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v1, v20, v6);
          sub_246368BFC(qword_25756D730, (void (*)(uint64_t))MEMORY[0x24BE9AE28]);
          sub_246378F44();
          (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v1, v6);
          OUTLINED_FUNCTION_14_0((uint64_t)v16);
          OUTLINED_FUNCTION_14_0((uint64_t)v18);
          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_14_0(v0);
          goto LABEL_13;
        }
        OUTLINED_FUNCTION_14_0((uint64_t)v16);
        OUTLINED_FUNCTION_14_0((uint64_t)v18);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v6);
LABEL_12:
        sub_246363748(v0, &qword_25756D728);
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_14_0((uint64_t)v16);
      OUTLINED_FUNCTION_14_0((uint64_t)v18);
      OUTLINED_FUNCTION_30_0(v20);
      if (!v21)
        goto LABEL_12;
      sub_246363748(v0, (uint64_t *)&unk_2544200E0);
    }
  }
LABEL_13:
  OUTLINED_FUNCTION_18();
}

uint64_t sub_24636673C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_246366778 + 4 * byte_246379910[a1]))(0x6669636570736E75, 0xEB00000000646569);
}

void sub_246366778()
{
  OUTLINED_FUNCTION_55();
}

void sub_24636686C(uint64_t a1)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v9 = 0;
    v2 = 0;
    v3 = 0;
    v4 = swift_bridgeObjectRetain() + 40;
    v8 = v4;
LABEL_3:
    v5 = v4 + 16 * v3++;
    while (v3 - 1 < v1)
    {
      swift_bridgeObjectRetain();
      v6 = v2 | ((unint64_t)OUTLINED_FUNCTION_62() < 4);
      v7 = OUTLINED_FUNCTION_62();
      swift_bridgeObjectRelease();
      if (v7 < 6)
      {
        if ((v6 & 1) == 0)
        {
LABEL_12:
          if (v3 != v1)
          {
            v2 = v7 > 5;
            v9 = v7 < 6;
            v4 = v8;
            goto LABEL_3;
          }
        }
LABEL_15:
        OUTLINED_FUNCTION_8_0();
        goto LABEL_16;
      }
      if ((v6 & 1) != 0)
      {
        if (!v9)
          goto LABEL_12;
        goto LABEL_15;
      }
      v2 = 0;
      ++v3;
      v5 += 16;
      if (v3 - v1 == 1)
        goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
LABEL_16:
    OUTLINED_FUNCTION_15_0();
  }
}

uint64_t sub_24636699C@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(v1, sel_headGesture);
  if (v3 == (id)2)
  {
    v4 = (unsigned int *)MEMORY[0x24BE9AF80];
  }
  else if (v3 == (id)1)
  {
    v4 = (unsigned int *)MEMORY[0x24BE9AF78];
  }
  else
  {
    v4 = (unsigned int *)MEMORY[0x24BE9AF88];
  }
  v5 = *v4;
  v6 = OUTLINED_FUNCTION_5_0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(a1, v5, v6);
}

uint64_t sub_246366A14(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0x7055646F4ELL;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6E776F44646F4ELL;
      break;
    case 2:
      result = 0x66654C656B616853;
      break;
    case 3:
      result = 0x676952656B616853;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_246366AB0()
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
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_39_0();
  v28 = v0;
  v29 = v1;
  v3 = v2;
  v4 = sub_246378590();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_29_0();
  v9 = OUTLINED_FUNCTION_29_0();
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v11 = objc_msgSend(v10, sel__languageCodeWithFallback_, 1);

  v21 = v9;
  if (v11)
  {
    sub_246378F5C();

    v12 = sub_246378F74();
    v14 = v13;
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 28261;
    v14 = 0xE200000000000000;
  }
  v26 = v12;
  v27 = v14;
  v24 = 26746;
  v25 = 0xE200000000000000;
  sub_246367FB8();
  sub_246367FF4();
  v15 = &v26;
  if ((sub_246378F2C() & 1) == 0)
  {
    v26 = v12;
    v27 = v14;
    v24 = 45;
    v25 = 0xE100000000000000;
    v22 = 95;
    v23 = 0xE100000000000000;
    sub_246368030();
    v16 = sub_246379088();
    v18 = v17;
    swift_bridgeObjectRelease();
    v26 = v16;
    v27 = v18;
    v24 = (uint64_t)&unk_251791040;
    sub_246368BFC(&qword_25756D660, (void (*)(uint64_t))MEMORY[0x24BDCB750]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756D668);
    sub_2463681F4(&qword_25756D670, &qword_25756D668);
    sub_2463790A0();
    v15 = (_QWORD *)sub_24637907C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    if (v15[2])
    {
      v12 = v15[4];
      v14 = v15[5];
      swift_bridgeObjectRetain();
    }
    else
    {
      v14 = 0xE200000000000000;
      v12 = 28261;
    }
    swift_bridgeObjectRelease();
  }
  if (v3 == 1)
  {
    swift_bridgeObjectRelease();
    sub_246366DF4(v12, v14, v8);
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_32();
    if (v15)
      return v5;
    else
      return 7562585;
  }
  else
  {
    OUTLINED_FUNCTION_32();
    if (v3 == 2)
    {
      sub_246366DF4(v12, v14, v21);
      OUTLINED_FUNCTION_35_0();
      OUTLINED_FUNCTION_32();
      if (v15)
        return v5;
      else
        return 28494;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
  }
}

uint64_t sub_246366DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_2463680B0(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_246366E48()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  unsigned int v4;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = sub_246367924(0xD000000000000013, 0x800000024637A2E0);
  if (v1)
  {
    v2 = v1;
    OUTLINED_FUNCTION_55();
    v3 = (void *)sub_246378F50();
    v4 = -[NSObject BOOLForKey:](v2, sel_BOOLForKey_, v3);

    if (v4)
    {

      return 1;
    }
    if (qword_254420520 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v9, (uint64_t)qword_2544206D8);
    v10 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_42_0(v10))
    {
      *(_WORD *)OUTLINED_FUNCTION_10() = 0;
      OUTLINED_FUNCTION_26_0(&dword_24635F000, v11, v12, "isWaitingToneEnabled: false");
      OUTLINED_FUNCTION_7();
    }

  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_23();
    v2 = OUTLINED_FUNCTION_4_0(v6, (uint64_t)qword_2544206D8);
    v7 = sub_246378FE0();
    if (os_log_type_enabled(v2, v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_10();
      v13 = OUTLINED_FUNCTION_10();
      *(_DWORD *)v8 = 136315138;
      sub_2463635B4(0xD000000000000013, 0x800000024637A2E0, &v13);
      sub_246379064();
      OUTLINED_FUNCTION_36(&dword_24635F000, v2, v7, "UserDefault suite: %s noot found", v8);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }
  }

  return 0;
}

void sub_24636707C()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;
  char v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D640);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_3_0();
  sub_2463787AC();
  sub_246378C98();
  sub_2463787DC();
  sub_246378CC8();
  sub_2463787D0();
  sub_246378CBC();
  v1 = sub_2463787A0();
  OUTLINED_FUNCTION_49(v1);
  sub_246378C8C();
  v2 = sub_246378818();
  OUTLINED_FUNCTION_49(v2);
  sub_246378D04();
  v3 = sub_246378800();
  OUTLINED_FUNCTION_49(v3);
  sub_246378CEC();
  v4 = sub_24637880C();
  OUTLINED_FUNCTION_49(v4);
  sub_246378CF8();
  sub_2463787C4();
  sub_246378CB0();
  sub_246378848();
  sub_246378D34();
  sub_2463787E8();
  sub_246378CD4();
  sub_246378824();
  sub_246378D10();
  sub_2463787F4();
  sub_246378CE0();
  sub_246378830();
  sub_246378D1C();
  sub_24637883C();
  sub_246378D28();
  sub_2463787B8();
  sub_246378CA4();
  OUTLINED_FUNCTION_63();
}

void sub_2463671CC()
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
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD);
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;

  OUTLINED_FUNCTION_39_0();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v39 = OUTLINED_FUNCTION_23();
  v7 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_15();
  v34 = v8;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = ((char *)v31 - v10);
  v38 = sub_246378F14();
  v12 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_3_0();
  sub_246378F08();
  v13 = sub_246378EFC();
  v14 = sub_246378EFC();
  v15 = v13 - v14;
  if (v13 < v14)
  {
    __break(1u);
  }
  else
  {
    v37 = v1;
    v41 = 0;
    v42 = 0xE000000000000000;
    sub_2463790AC();
    swift_bridgeObjectRelease();
    v41 = 0x6465766965636552;
    v42 = 0xE900000000000020;
    v32 = v6;
    v33 = v4;
    sub_246378F8C();
    sub_246378F8C();
    v40 = v15 / 0xF4240;
    sub_246379100();
    sub_246378F8C();
    OUTLINED_FUNCTION_8_0();
    sub_246378F8C();
    v16 = (int *)type metadata accessor for EventDeduper(0);
    v17 = (uint64_t *)(v0 + v16[6]);
    v18 = *v17;
    OUTLINED_FUNCTION_28_0();
    sub_246378F8C();
    swift_bridgeObjectRelease();
    v31[2] = v41;
    v19 = v0 + v16[7];
    v20 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v7 + 16);
    v35 = *(_QWORD *)(v0 + v16[5]);
    v36 = v15;
    if (v15 < v35)
    {
      OUTLINED_FUNCTION_52_0((uint64_t)v11, v19, v20);
      OUTLINED_FUNCTION_28_0();
      sub_246378E90();
      v26 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_43_0(v26))
      {
        v27 = (uint8_t *)OUTLINED_FUNCTION_10();
        v28 = OUTLINED_FUNCTION_10();
        v34 = v7;
        v41 = v28;
        *(_DWORD *)v27 = 136315138;
        OUTLINED_FUNCTION_28_0();
        v29 = OUTLINED_FUNCTION_31_0();
        OUTLINED_FUNCTION_48_0(v29);
        sub_246379064();
        OUTLINED_FUNCTION_71();
        OUTLINED_FUNCTION_36(&dword_24635F000, v11, (os_log_type_t)v12, "%s, event is a dupe", v27);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }
      OUTLINED_FUNCTION_72();

      (*(void (**)(NSObject *, uint64_t))(v7 + 8))(v11, v18);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v37, v38);
    }
    else
    {
      v21 = v34;
      OUTLINED_FUNCTION_52_0((uint64_t)v34, v19, v20);
      OUTLINED_FUNCTION_28_0();
      sub_246378E90();
      v22 = OUTLINED_FUNCTION_30();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = OUTLINED_FUNCTION_10();
        v31[1] = v12;
        v24 = (uint8_t *)v23;
        v41 = OUTLINED_FUNCTION_10();
        *(_DWORD *)v24 = 136315138;
        OUTLINED_FUNCTION_28_0();
        v25 = OUTLINED_FUNCTION_31_0();
        OUTLINED_FUNCTION_48_0(v25);
        sub_246379064();
        OUTLINED_FUNCTION_71();
        OUTLINED_FUNCTION_36(&dword_24635F000, v21, v22, "%s, event isn't a dupe", v24);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

      OUTLINED_FUNCTION_72();
      (*(void (**)(NSObject *, uint64_t))(v7 + 8))(v21, v18);
      v30 = v33;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_8_0();
      *v17 = v32;
      v17[1] = v30;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v2, v37, v38);
    }
    OUTLINED_FUNCTION_18();
  }
}

void sub_2463675C8(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;

  v2 = sub_246378608();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_0();
  v3 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  OUTLINED_FUNCTION_55();
  v6 = sub_246367924(v4, v5);
  if (v6)
  {
    v22 = v6;
    if (a1 == (void *)4)
    {
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_55();
    }
    else
    {
      if (a1 != (void *)2)
      {
        if (a1 == (void *)1)
        {
          OUTLINED_FUNCTION_70();
          OUTLINED_FUNCTION_57();
          OUTLINED_FUNCTION_10_0();
          OUTLINED_FUNCTION_56();
          v7 = (void *)sub_246378F50();
          OUTLINED_FUNCTION_34_0((uint64_t)v7, sel_setValue_forKey_);

          OUTLINED_FUNCTION_53();
          return;
        }
        if (qword_254420520 != -1)
          swift_once();
        v15 = OUTLINED_FUNCTION_23();
        v16 = OUTLINED_FUNCTION_4_0(v15, (uint64_t)qword_2544206D8);
        v17 = sub_246378FE0();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = (uint8_t *)OUTLINED_FUNCTION_10();
          v23 = OUTLINED_FUNCTION_10();
          *(_DWORD *)v18 = 136315138;
          v19 = sub_246365040((char)a1);
          v21 = sub_2463635B4(v19, v20, &v23);
          OUTLINED_FUNCTION_65(v21);
          sub_246379064();
          OUTLINED_FUNCTION_8_0();
          OUTLINED_FUNCTION_36(&dword_24635F000, v16, v17, "Tried to log unhandled user intent usage date: %s", v18);
          OUTLINED_FUNCTION_35();
          OUTLINED_FUNCTION_7();
        }

        goto LABEL_18;
      }
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_56();
    }
    v14 = (void *)sub_246378F50();
    OUTLINED_FUNCTION_34_0((uint64_t)v14, sel_setValue_forKey_);
    OUTLINED_FUNCTION_53();

    return;
  }
  if (qword_254420520 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_23();
  v22 = OUTLINED_FUNCTION_4_0(v8, (uint64_t)qword_2544206D8);
  v9 = sub_246378FE0();
  if (os_log_type_enabled(v22, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_10();
    v23 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v10 = 136315138;
    OUTLINED_FUNCTION_55();
    v13 = sub_2463635B4(v11, v12, &v23);
    OUTLINED_FUNCTION_65(v13);
    sub_246379064();
    OUTLINED_FUNCTION_36(&dword_24635F000, v22, v9, "UserDefault suite: %s couldn't be opened.", v10);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }
LABEL_18:

}

id sub_246367924(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_246378F50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

char *sub_246367984(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25756D760);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_246367E38((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246367C24(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_246367A70(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25756D688);
  v10 = *(_QWORD *)(sub_246378764() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    OUTLINED_FUNCTION_54();
    result = sub_2463790DC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_246378764() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_246367EBC(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_8_0();
  }
  else
  {
    sub_246367D18(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_246367C24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2463790E8();
  __break(1u);
  return result;
}

uint64_t sub_246367D18(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_246378764() - 8);
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
  result = sub_2463790E8();
  __break(1u);
  return result;
}

char *sub_246367E38(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2463790E8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_246367EBC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2463790E8();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_246378764(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_246378764();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

unint64_t sub_246367FB8()
{
  unint64_t result;

  result = qword_25756D648;
  if (!qword_25756D648)
  {
    result = MEMORY[0x24955879C](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25756D648);
  }
  return result;
}

unint64_t sub_246367FF4()
{
  unint64_t result;

  result = qword_25756D650;
  if (!qword_25756D650)
  {
    result = MEMORY[0x24955879C](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25756D650);
  }
  return result;
}

unint64_t sub_246368030()
{
  unint64_t result;

  result = qword_25756D658;
  if (!qword_25756D658)
  {
    result = MEMORY[0x24955879C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25756D658);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249558790](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2463680B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_246379148();
  sub_246378F80();
  v4 = sub_246379160();
  return sub_246368114(a1, a2, v4);
}

unint64_t sub_246368114(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24637910C() & 1) == 0)
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
      while (!v14 && (sub_24637910C() & 1) == 0);
    }
  }
  return v6;
}

void sub_2463681F4(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_51_0();
  }
  OUTLINED_FUNCTION_16();
}

uint64_t type metadata accessor for GestureResponse(uint64_t a1)
{
  return sub_24636823C(a1, qword_25756D6E8);
}

uint64_t sub_24636823C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24636826C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463682B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463682F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_246368334(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_246378608();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_246378C14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[7];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_246378BF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
    }
  }
  return v4;
}

uint64_t sub_246368474(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v4 = a1 + a2[5];
  v5 = sub_246378608();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[6];
  v7 = sub_246378C14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[7];
  v9 = sub_246378BF0();
  result = __swift_getEnumTagSinglePayload(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return result;
}

_QWORD *sub_24636852C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246378608();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_246378C14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_246378BF0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *sub_246368640(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int EnumTagSinglePayload;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246378608();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_246378C14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_246378BF0();
  LODWORD(v12) = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!(_DWORD)v12)
  {
    v19 = *(_QWORD *)(v17 - 8);
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  return a1;
}

_QWORD *sub_24636879C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246378608();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_246378C14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_246378BF0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *sub_2463688B0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int EnumTagSinglePayload;
  uint64_t v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246378608();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_246378C14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_246378BF0();
  LODWORD(v12) = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!(_DWORD)v12)
  {
    v19 = *(_QWORD *)(v17 - 8);
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  return a1;
}

uint64_t sub_246368A0C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246368A18()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_66();
  sub_246378608();
  OUTLINED_FUNCTION_40_0();
  if (v6)
  {
    v4 = v3;
    v5 = v2[5];
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_40_0();
    if (v6)
    {
      v4 = v7;
      v5 = v2[6];
    }
    else
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
      v5 = v2[7];
    }
  }
  return OUTLINED_FUNCTION_23_0(v1 + v5, v0, v4);
}

uint64_t sub_246368A80()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246368A8C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_36_0();
  sub_246378608();
  OUTLINED_FUNCTION_41_0();
  if (v6)
  {
    v4 = v3;
    v5 = v2[5];
  }
  else
  {
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_41_0();
    if (v6)
    {
      v4 = v7;
      v5 = v2[6];
    }
    else
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
      v5 = v2[7];
    }
  }
  return OUTLINED_FUNCTION_24_0(v1 + v5, v0, v0, v4);
}

void sub_246368AF8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_246378608();
  if (v0 <= 0x3F)
  {
    sub_246378C14();
    if (v1 <= 0x3F)
    {
      sub_246368BA8();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_246368BA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544203C0)
  {
    sub_246378BF0();
    v0 = sub_246379058();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544203C0);
  }
}

void sub_246368BFC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_51_0();
  }
  OUTLINED_FUNCTION_16();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v3, a2, v4);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_246378E90();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_246378C14();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

char *OUTLINED_FUNCTION_11_0(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_246367984(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;

  return sub_2463682F8(v0);
}

void OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  uint64_t *v1;

  sub_246363748(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  uint64_t v1;

  return sub_2463682B4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463682B4(v0, *(_QWORD *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), _QWORD *a4)
{
  uint64_t v4;

  return sub_246365520(a1, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_26_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_246378F20();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2463635B4(*(_QWORD *)(v1 - 176), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  return sub_2463682F8(v0);
}

id OUTLINED_FUNCTION_34_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(*(id *)(v4 - 88), a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_42_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_43_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44()
{
  uint64_t v0;

  return v0 + *(int *)(type metadata accessor for GestureMapping(0) + 20);
}

uint64_t OUTLINED_FUNCTION_46_0(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t OUTLINED_FUNCTION_48_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_49(char a1)
{
  return a1 & 1;
}

id OUTLINED_FUNCTION_50_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 920));
}

void OUTLINED_FUNCTION_51_0()
{
  JUMPOUT(0x24955879CLL);
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 112));
}

void OUTLINED_FUNCTION_53()
{
  uint64_t v0;

}

unint64_t OUTLINED_FUNCTION_56()
{
  return 0xD000000000000019;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_2463785CC();
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;

  return sub_2463682F8(v0);
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463682B4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_246378FA4();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_2463790F4();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 80) = a1;
  return v1 - 80;
}

uint64_t OUTLINED_FUNCTION_66()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_69()
{
  uint64_t v0;

  return sub_2463682F8(v0);
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_2463785FC();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_bridgeObjectRelease_n();
}

void sub_246368FC8(uint64_t a1)
{
  OUTLINED_FUNCTION_79(a1, OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager);
}

void sub_246368FD4(uint64_t a1)
{
  OUTLINED_FUNCTION_79(a1, OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestContextData);
}

char *sub_246368FE0()
{
  char *v0;
  uint64_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  char *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t *v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  int *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  _WORD *v32;
  char *v33;
  void *v34;
  id v35;
  char *v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  void (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_super v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  OUTLINED_FUNCTION_39_0();
  v58 = v3;
  v59 = v4;
  v54 = v5;
  v47 = OUTLINED_FUNCTION_23();
  v51 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_48();
  v50 = v6;
  v46 = OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_37_1(v7, v43);
  v55 = sub_246378FF8();
  v52 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_95();
  sub_246378FEC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_94();
  sub_246378EE4();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_129();
  v44 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue;
  sub_2463723B0();
  v9 = v0;
  sub_246378ECC();
  v57 = MEMORY[0x24BEE4AF8];
  sub_24637279C(&qword_254420450, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254420438);
  sub_2463727D8((unint64_t *)&unk_254420440, &qword_254420438);
  sub_2463790A0();
  v48 = *MEMORY[0x24BEE5750];
  v49 = *(void (**)(uint64_t))(v52 + 104);
  v49(v1);
  v53 = v1;
  *(_QWORD *)&v0[v44] = sub_246379010();
  v10 = &v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState];
  *((_QWORD *)v10 + 4) = 0;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState] = 0;
  v11 = *MEMORY[0x24BE9AF78];
  v12 = OUTLINED_FUNCTION_5_0();
  v13 = *(uint8_t **)(*(_QWORD *)(v12 - 8) + 104);
  ((void (*)(uint64_t, NSObject *, uint64_t))v13)(v45, v11, v12);
  ((void (*)(uint64_t, _QWORD, uint64_t))v13)(v45 + *(int *)(v46 + 20), *MEMORY[0x24BE9AF80], v12);
  if (qword_254420100 != -1)
    swift_once();
  OUTLINED_FUNCTION_4_0(v47, (uint64_t)qword_254420618);
  v14 = OUTLINED_FUNCTION_67();
  if (OUTLINED_FUNCTION_105(v11))
  {
    v15 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_34_1(v15);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v11, v14, "Received nil gesture configuration, using default gesture mapping", v13);
    OUTLINED_FUNCTION_7();
  }

  v16 = (uint64_t)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping];
  sub_246372584(v45, (uint64_t)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping]);
  OUTLINED_FUNCTION_104(v16);
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver] = 0;
  v17 = (uint64_t)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureDeduper];
  if (qword_254420520 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v47, (uint64_t)qword_2544206D8);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  v19(v50, v18, v47);
  sub_246378EF0();
  v20 = (int *)type metadata accessor for EventDeduper(0);
  v21 = (_QWORD *)(v17 + v20[6]);
  *v21 = 1953066569;
  v21[1] = 0xE400000000000000;
  v22 = v17 + v20[7];
  v19(v22, v12, v47);
  *(_QWORD *)(v17 + v20[5]) = 1000000;
  OUTLINED_FUNCTION_140(v22, v50, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 40));
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestActive] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isListening] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager] = 0;
  v23 = OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_39_1(v17, v24, v25, v23);
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation] = 0;
  v26 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue;
  sub_246378ED8();
  v57 = MEMORY[0x24BEE4AF8];
  sub_2463790A0();
  ((void (*)(uint64_t, _QWORD, uint64_t))v49)(v53, v48, v55);
  OUTLINED_FUNCTION_150();
  *(_QWORD *)&v9[v26] = sub_246379010();
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation] = 0;
  v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation] = 0;
  v27 = &v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId];
  v28 = sub_24637862C();
  OUTLINED_FUNCTION_39_1((uint64_t)v27, v29, v30, v28);
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestContextData] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper] = v54;
  swift_unknownObjectRetain();

  sub_246378E90();
  v31 = OUTLINED_FUNCTION_21_0();
  if (OUTLINED_FUNCTION_38(v31))
  {
    v32 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_34_1(v32);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v27, (os_log_type_t)v18, "🫨 Initializing gesture controller", v2);
    OUTLINED_FUNCTION_7();
  }

  v56.receiver = v9;
  v56.super_class = (Class)OUTLINED_FUNCTION_131();
  v33 = (char *)objc_msgSendSuper2(&v56, sel_init);
  v34 = *(void **)&v33[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue];
  v35 = objc_allocWithZone(MEMORY[0x24BE09250]);
  v36 = v33;
  v37 = v34;
  v38 = OUTLINED_FUNCTION_150();
  v40 = sub_2463722BC(v38, v39, 1, v34, (uint64_t)v33);

  swift_unknownObjectRelease();
  v41 = *(void **)&v36[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver];
  *(_QWORD *)&v36[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserver] = v40;

  return v36;
}

void *sub_246369664(char a1)
{
  char *v1;
  os_log_type_t v2;
  uint8_t *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  os_log_type_t v8;
  os_log_type_t v9;
  _WORD *v10;
  uint8_t *v11;
  NSObject *v12;
  uint64_t v13;
  os_log_type_t v14;
  _WORD *v15;
  void *v16;
  NSObject *v17;
  id v18;

  v4 = v1;
  v5 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager;
  v6 = *(void **)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
  if (!v6 && (a1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_23();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2544206D8);
    OUTLINED_FUNCTION_7_1();
    v9 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v9))
    {
      v10 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_35_1(v10);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, 0, v2, "🫨 Initializing HGManager", v3);
      OUTLINED_FUNCTION_7();
    }

    sub_246378674();
    sub_246378650();
    v11 = (uint8_t *)objc_allocWithZone((Class)sub_2463786F8());
    v12 = v4;
    v13 = sub_2463786EC();
    sub_246368FC8(v13);
    if (AFIsInternalInstall())
    {
      OUTLINED_FUNCTION_97();
      v14 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_42_0(v14))
      {
        v15 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_35_1(v15);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v12, v8, "📝 Enabling raw data logging, device is using an internal install", v11);
        OUTLINED_FUNCTION_7();
      }

      v16 = *(Class *)((char *)&v12->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
      v17 = v12;
      sub_2463706CC(v16, (uint64_t)v17, v17);
    }
    sub_246369848();
    v6 = *(void **)&v4[v5];
  }
  v18 = v6;
  return v6;
}

void sub_2463697E4(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager);
  if (v1)
  {
    v2 = v1;
    v3 = (id)sub_2463786C8();

    AFIsInternalInstall();
    sub_246378668();

  }
}

void sub_246369848()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _WORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  _WORD *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;

  OUTLINED_FUNCTION_39_0();
  v4 = OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_128();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7C8);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_15();
  v27 = v6;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_161();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v26 - v7;
  if (qword_254420520 != -1)
    swift_once();
  v26 = v0;
  v9 = OUTLINED_FUNCTION_23();
  v10 = OUTLINED_FUNCTION_4_0(v9, (uint64_t)qword_2544206D8);
  v11 = sub_246378FD4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v12);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v10, v11, "Fetching gesture mapping", v2);
    OUTLINED_FUNCTION_7();
  }

  v13 = *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
  if (v13)
  {
    if ((objc_msgSend(*(id *)((char *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper), sel_respondsToSelector_, sel_headGestureConfiguration) & 1) != 0)v13 = objc_msgSend(v13, sel_headGestureConfiguration);
    else
      v13 = 0;
  }
  v14 = (uint64_t)v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping;
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_134(v14, (uint64_t)v8);
  v15 = v13;
  sub_246365604(v13, v3);
  OUTLINED_FUNCTION_84(v3, 0);
  OUTLINED_FUNCTION_45();
  sub_2463638CC(v3, v14, &qword_25756D7B0);
  swift_endAccess();
  v16 = v1 + *(int *)(v5 + 48);
  OUTLINED_FUNCTION_134(v14, v1);
  OUTLINED_FUNCTION_134((uint64_t)v8, v16);
  OUTLINED_FUNCTION_50_1(v1);
  if (v19)
  {
    OUTLINED_FUNCTION_50_1(v16);
    if (v19)
    {
      sub_246372774(v1, &qword_25756D7B0);
      goto LABEL_14;
    }
    v20 = (uint64_t)&qword_25756D7C8;
  }
  else
  {
    v18 = v27;
    sub_246363684(v1, v27, &qword_25756D7B0);
    OUTLINED_FUNCTION_50_1(v16);
    if (v19)
    {
      v20 = (uint64_t)&qword_25756D7C8;
    }
    else
    {
      v21 = (uint64_t)v26;
      sub_246372584(v16, (uint64_t)v26);
      v22 = sub_2463654E8(v18, v21);
      if ((v22 & 1) != 0)
      {
        v20 = sub_2463654E8(v18 + *(int *)(v4 + 20), v21 + *(int *)(v4 + 20));
        sub_24637274C(v21, type metadata accessor for GestureMapping);
        sub_24637274C(v18, type metadata accessor for GestureMapping);
        sub_246372774(v1, &qword_25756D7B0);
        if ((v20 & 1) == 0)
          goto LABEL_24;
LABEL_14:
        OUTLINED_FUNCTION_89(v17, &qword_25756D7B0);

        goto LABEL_27;
      }
      OUTLINED_FUNCTION_151(v22, type metadata accessor for GestureMapping);
      v20 = (uint64_t)&qword_25756D7B0;
    }
    sub_24637274C(v18, type metadata accessor for GestureMapping);
  }
  sub_246372774(v1, (uint64_t *)v20);
LABEL_24:
  sub_246378E90();
  v23 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_42_0(v23))
  {
    v24 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_34_1(v24);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v1, "Gesture mapping updated", (uint8_t *)v20);
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_89(v25, &qword_25756D7B0);
LABEL_27:
  OUTLINED_FUNCTION_18();
}

void sub_246369BD8(uint64_t a1)
{
  void *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  os_log_t v9;
  os_log_type_t v10;
  const char *v11;
  uint8_t *v12;
  uint32_t v13;
  uint64_t v14;
  os_log_type_t v15;
  _WORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  os_log_type_t v20;
  _WORD *v21;
  void *v22;
  os_log_type_t v23;
  _WORD *v24;
  os_log_type_t v25;
  _WORD *v26;
  NSObject *v27;

  if ((sub_246369F10(a1) & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_23();
    v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2544206D8);
    v6 = v1;
    OUTLINED_FUNCTION_41_1();
    v7 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v7))
    {
      *(_DWORD *)OUTLINED_FUNCTION_10() = 67109120;
      OUTLINED_FUNCTION_55_0();

      OUTLINED_FUNCTION_138();
      _os_log_impl(v8, v9, v10, v11, v12, v13);
      OUTLINED_FUNCTION_7();
    }

    v17 = sub_246369664(1);
    if (v17)
    {
      v18 = v17;
      sub_246369E94();
      sub_24636A3F0();
      v19 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing;
      if ((*((_BYTE *)&v6->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) & 1) == 0)
      {
        OUTLINED_FUNCTION_41_1();
        v20 = OUTLINED_FUNCTION_30();
        if (OUTLINED_FUNCTION_11_1(v20))
        {
          v21 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_31_1(v21);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v6, v2, "🫨 Starting gesture recognition", v3);
          OUTLINED_FUNCTION_7();
        }

        v22 = *(Class *)((char *)&v6->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
        v18 = v18;
        sub_246370FFC(v22, (uint64_t)v6, v18);
        *((_BYTE *)&v6->isa + v19) = 1;
        OUTLINED_FUNCTION_41_1();
        v23 = OUTLINED_FUNCTION_21_0();
        if (OUTLINED_FUNCTION_38(v23))
        {
          v24 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_26_1(v24);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v5, (os_log_type_t)v22, "🫨 Started gesture recognition", (uint8_t *)v6);
          OUTLINED_FUNCTION_7();
        }

      }
    }
    else
    {
      OUTLINED_FUNCTION_41_1();
      v25 = OUTLINED_FUNCTION_67();
      if (OUTLINED_FUNCTION_38(v25))
      {
        v26 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_26_1(v26);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v5, (os_log_type_t)v6, "HGManager is nil", (uint8_t *)v6);
        OUTLINED_FUNCTION_7();
      }

    }
    OUTLINED_FUNCTION_75();
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_23();
    v27 = OUTLINED_FUNCTION_4_0(v14, (uint64_t)qword_2544206D8);
    v15 = sub_246378FE0();
    if (OUTLINED_FUNCTION_45_0(v27))
    {
      v16 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v16);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v27, v15, "Bobble is not available", (uint8_t *)v1);
      OUTLINED_FUNCTION_7();
    }

  }
}

void sub_246369E94()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v1 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) == 1)
  {
    sub_24636C5D4();
    if ((v2 & 1) != 0)
    {
      v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
      v4 = 7;
      goto LABEL_8;
    }
    if (*(_BYTE *)(v0 + v1) == 1)
    {
      v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
      v4 = 4;
      goto LABEL_8;
    }
  }
  sub_24636C5D4();
  v3 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
  if ((v5 & 1) == 0)
  {
    *(_QWORD *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent) = 0;
    goto LABEL_10;
  }
  v4 = 3;
LABEL_8:
  *(_QWORD *)(v0 + v3) = v4;
LABEL_10:
  OUTLINED_FUNCTION_16();
}

id sub_246369F10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper)
    && (v2 = (uint64_t)OUTLINED_FUNCTION_121(a1, sel_respondsToSelector_), (v2 & 1) != 0))
  {
    return OUTLINED_FUNCTION_121(v2, sel_isBobbleAvailable);
  }
  else
  {
    return 0;
  }
}

void sub_246369F60(unsigned __int8 a1)
{
  NSObject *v1;
  os_log_type_t v2;
  NSObject *v3;
  uint64_t v5;
  os_log_type_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;

  v3 = v1;
  if (qword_254420520 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_23();
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_2544206D8);
  OUTLINED_FUNCTION_7_1();
  v7 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_43_0(v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_10();
    *(_DWORD *)v8 = 136315138;
    v9 = sub_24636673C(a1);
    OUTLINED_FUNCTION_65_0(v9, v10, v11, v12, v13);
    OUTLINED_FUNCTION_64_0();
    sub_246379064();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v1, v2, "Will stop gesture recognition for reason: %s", v8);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  *(Class *)((char *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent) = 0;
  sub_24636A87C();
  v14 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing;
  if (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) == 1)
  {
    if ((*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) & 1) == 0)
    {
      OUTLINED_FUNCTION_97();
      v15 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_43_0(v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_10();
        v56 = OUTLINED_FUNCTION_10();
        v24 = OUTLINED_FUNCTION_82(4.8149e-34, v56, v17, v18, v19, v20, v21, v22, v23, v14, v55, a1);
        OUTLINED_FUNCTION_65_0(v24, v25, v26, v27, v28);
        OUTLINED_FUNCTION_64_0();
        sub_246379064();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_36(&dword_24635F000, v1, v2, "🫨 Stopping gesture recognition for reason: %s", v16);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

      sub_24636A3F0();
      v29 = *(Class *)((char *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
      v30 = v3;
      sub_2463712DC(v29, (uint64_t)v30, v30);
      *((_BYTE *)&v3->isa + v14) = 0;
      OUTLINED_FUNCTION_97();
      v31 = OUTLINED_FUNCTION_21_0();
      if (OUTLINED_FUNCTION_29_1(v3))
      {
        v32 = (uint8_t *)OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_10();
        *(_DWORD *)v32 = 136315138;
        v33 = sub_24636673C(a1);
        OUTLINED_FUNCTION_65_0(v33, v34, v35, v36, v37);
        OUTLINED_FUNCTION_51();
        sub_246379064();
        OUTLINED_FUNCTION_145();
        OUTLINED_FUNCTION_36(&dword_24635F000, v3, v31, "🫨 Stopped gesture recognition for reason: %s", v32);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement))
  {
LABEL_13:
    OUTLINED_FUNCTION_97();
    v38 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_43_0(v38))
    {
      v39 = (uint8_t *)OUTLINED_FUNCTION_10();
      v57 = OUTLINED_FUNCTION_10();
      v47 = OUTLINED_FUNCTION_82(4.8149e-34, v57, v40, v41, v42, v43, v44, v45, v46, v14, v55, a1);
      OUTLINED_FUNCTION_65_0(v47, v48, v49, v50, v51);
      OUTLINED_FUNCTION_135();
      OUTLINED_FUNCTION_145();
      OUTLINED_FUNCTION_36(&dword_24635F000, v1, v2, "🫨 Not stopping gesture recognition for reason: %s as it's still needed for early dismissal, updating states", v39);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_49_0();
  }
  v52 = v1;
  OUTLINED_FUNCTION_97();
  v53 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_42_0(v53))
  {
    v54 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_78((float *)v54, 1.5047e-36);
    OUTLINED_FUNCTION_165();
    *(_WORD *)(v54 + 8) = 1024;
    OUTLINED_FUNCTION_165();

    _os_log_impl(&dword_24635F000, v1, v6, "🫨 recognizing: %{BOOL}d readingAnnouncement: %{BOOL}d", (uint8_t *)v54, 0xEu);
    OUTLINED_FUNCTION_7();
  }

LABEL_19:
  OUTLINED_FUNCTION_13();
}

void sub_24636A390(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager);
  if (v1)
  {
    v2 = v1;
    sub_2463786D4();

  }
}

void sub_24636A3F0()
{
  NSObject *v0;
  uint8_t *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  _WORD *v30;
  const char *v31;
  os_log_type_t v32;
  _WORD *v33;
  uint64_t v34;
  os_log_type_t v35;
  _WORD *v36;
  uint64_t v37;

  OUTLINED_FUNCTION_39_0();
  v4 = v0;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  v7 = OUTLINED_FUNCTION_36_1();
  v8 = (void *)type metadata accessor for GestureMapping(v7);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  if ((v6 & 1) != 0)
  {
    sub_246369848();
    OUTLINED_FUNCTION_73();
    if (!v23)
      swift_once();
    v9 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v9, (uint64_t)qword_2544206D8);
    v10 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_43_0(v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_1_0();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v4, (os_log_type_t)v3, "🔊 Updating the gesture mapping", v11);
      OUTLINED_FUNCTION_7();
    }

  }
  v12 = (uint64_t)v4 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping;
  OUTLINED_FUNCTION_45();
  sub_246363684(v12, v2, &qword_25756D7B0);
  OUTLINED_FUNCTION_57_0(v2, 1, (uint64_t)v8);
  if (!v23)
  {
    v16 = OUTLINED_FUNCTION_146();
    sub_246372584(v16, v17);
    v18 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent;
    sub_24636592C();
    v19 = *(uint64_t *)((char *)&v4->isa + v18);
    v20 = sub_246366E48();
    if ((v20 & 1) != 0)
    {
      v21 = v19 & 3;
      v22 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady;
      v23 = *((_BYTE *)&v4->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady) == 1 && v21 == 3;
      if (v23 && (*((_BYTE *)&v4->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) & 1) == 0)
      {
        OUTLINED_FUNCTION_73();
        if (!v23)
          swift_once();
        v34 = OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_4_0(v34, (uint64_t)qword_2544206D8);
        v35 = OUTLINED_FUNCTION_30();
        if (OUTLINED_FUNCTION_11_1(v35))
        {
          v36 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_31_1(v36);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v19, (os_log_type_t)v8, "🔊 Playing waiting tone", v3);
          OUTLINED_FUNCTION_7();
        }
      }
      else
      {
        OUTLINED_FUNCTION_73();
        if (!v23)
          swift_once();
        v24 = OUTLINED_FUNCTION_23();
        v8 = OUTLINED_FUNCTION_85(v24, (uint64_t)qword_2544206D8);
        v25 = sub_246378E90();
        v26 = sub_246378FD4();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_78((float *)v27, 1.5048e-36);
          OUTLINED_FUNCTION_158();
          *(_WORD *)(v27 + 8) = 1024;
          OUTLINED_FUNCTION_158();
          *(_WORD *)(v27 + 14) = 1024;
          sub_246379064();

          _os_log_impl(&dword_24635F000, v25, v26, "🔇 Not playing waiting tone, expectingConfirmation: %{BOOL}d, ttsActive: %{BOOL}d, isReady: %{BOOL}d", (uint8_t *)v27, 0x14u);
          OUTLINED_FUNCTION_7();
        }

        v3 = (uint8_t *)v8;
        if (v21 != 3
          || (*((_BYTE *)v8 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) & 1) != 0
          || (*((_BYTE *)&v4->isa + v22) & 1) != 0
          || *((_BYTE *)v8 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) != 1)
        {
          goto LABEL_42;
        }
        v19 = sub_246378E90();
        v32 = sub_246378FE0();
        if (OUTLINED_FUNCTION_11_1(v32))
        {
          v33 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_31_1(v33);
          v31 = "‼️ Not streaming motion data, disabling waiting tone playback";
LABEL_29:
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v19, (os_log_type_t)v8, v31, v3);
          OUTLINED_FUNCTION_7();
        }
      }
    }
    else
    {
      OUTLINED_FUNCTION_73();
      if (!v23)
        swift_once();
      v28 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v28, (uint64_t)qword_2544206D8);
      v29 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_11_1(v29))
      {
        v30 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_31_1(v30);
        v31 = "🔇 Not playing waiting tone as it is disabled in the user defaults";
        goto LABEL_29;
      }
    }

LABEL_42:
    sub_24636AA20();
    OUTLINED_FUNCTION_112(v37, type metadata accessor for GestureMapping);
    goto LABEL_43;
  }
  sub_246372774(v2, &qword_25756D7B0);
  OUTLINED_FUNCTION_73();
  if (!v23)
    swift_once();
  v13 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v13, (uint64_t)qword_2544206D8);
  v14 = OUTLINED_FUNCTION_67();
  if (OUTLINED_FUNCTION_38(v14))
  {
    v15 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_26_1(v15);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v4, (os_log_type_t)v12, "GestureMapping is nil", v1);
    OUTLINED_FUNCTION_7();
  }

LABEL_43:
  OUTLINED_FUNCTION_18();
}

void sub_24636A87C()
{
  os_log_type_t v0;
  uint8_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  os_log_type_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _WORD *v13;
  uint64_t v14;
  os_log_t oslog;
  NSObject *osloga;

  v2 = sub_246369664(0);
  if (v2)
  {
    v3 = *(void **)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
    oslog = v2;
    sub_246370A08(v3, (uint64_t)v1, oslog);
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_23();
    osloga = OUTLINED_FUNCTION_4_0(v4, (uint64_t)qword_2544206D8);
    v5 = sub_246378FE0();
    if (OUTLINED_FUNCTION_32_0(v5, v6, v7, v8, v9, v10, v11, v12, v14, osloga))
    {
      v13 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v13);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, oslog, v0, "HGManager is nil", v1);
      OUTLINED_FUNCTION_7();
    }
  }
  OUTLINED_FUNCTION_30_1(oslog);
}

void sub_24636A944()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)sub_2463786C8();
  v1 = (void *)sub_24637865C();

  sub_24637868C();
  v2 = (void *)sub_2463786C8();
  v3 = (void *)sub_24637865C();

  sub_24637868C();
  v4 = (void *)sub_2463786C8();
  v5 = (void *)sub_24637865C();

  sub_24637868C();
  v6 = (void *)sub_2463786C8();
  v7 = (id)sub_24637865C();

  sub_24637868C();
}

void sub_24636AA20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  _WORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _WORD *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  os_log_type_t v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  id v55[12];
  uint64_t v56;
  uint64_t v57;

  OUTLINED_FUNCTION_39_0();
  v56 = v1;
  v57 = v2;
  v4 = v3;
  v6 = v5;
  v55[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(OUTLINED_FUNCTION_38_1() - 8);
  v8 = *(NSObject **)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v50 - (((unint64_t)&v8[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_246369664(1);
  if (v10)
  {
    v52 = v10;
    if (qword_254420520 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_23();
    v12 = OUTLINED_FUNCTION_4_0(v11, (uint64_t)qword_2544206D8);
    v13 = sub_246378FD4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_1_0();
      *(_WORD *)v14 = 0;
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v12, v13, "Configuring fallback audio session", v14);
      OUTLINED_FUNCTION_7();
    }

    v15 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v55[0] = 0;
    v16 = objc_msgSend(v15, sel_setPrefersNoDucking_error_, 1, v55);
    v53 = v7;
    if (v16)
    {
      v17 = v55[0];
    }
    else
    {
      v21 = v55[0];
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_118();
    }
    v22 = *MEMORY[0x24BDB15A8];
    v23 = *MEMORY[0x24BDB1650];
    v55[0] = 0;
    if (objc_msgSend(v15, sel_setCategory_mode_options_error_, v22, v23, 2, v55))
    {
      v24 = v55[0];
    }
    else
    {
      v25 = v55[0];
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_118();
    }
    v55[0] = 0;
    if (objc_msgSend(v15, sel_setAudioHardwareControlFlags_error_, 0, v55))
    {
      v26 = v55[0];
    }
    else
    {
      v27 = v55[0];
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_110();
      OUTLINED_FUNCTION_118();
    }
    if (objc_msgSend(v15, sel_isActive) && !v6)
    {
      v28 = sub_246378E90();
      v29 = sub_246378FE0();
      if (OUTLINED_FUNCTION_105(v28))
      {
        v30 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_35_1(v30);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v28, v29, "Fallback audio session was used, deactivating it to resume interrupted media", (uint8_t *)v7);
        OUTLINED_FUNCTION_7();
      }

      v55[0] = 0;
      if (objc_msgSend(v15, sel_setActive_error_, 0, v55))
      {
        v31 = v55[0];
      }
      else
      {
        v32 = v55[0];
        OUTLINED_FUNCTION_58();
        OUTLINED_FUNCTION_120();
        OUTLINED_FUNCTION_110();
        OUTLINED_FUNCTION_118();
      }
    }
    v33 = *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper);
    v54 = v8;
    v51 = v15;
    if (v33)
    {
      v34 = (uint64_t)v0;
      v35 = v4;
      v36 = (uint64_t)v9;
      if ((objc_msgSend(v33, sel_respondsToSelector_, sel_audioSessionID) & 1) != 0)
        LODWORD(v33) = objc_msgSend(v33, sel_audioSessionID);
      else
        LODWORD(v33) = 0;
    }
    else
    {
      v34 = (uint64_t)v0;
      v35 = v4;
      v36 = (uint64_t)v9;
    }
    v37 = v6;
    v38 = v6 & 3;
    sub_246378E90();
    v39 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_105(v0))
    {
      v40 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_78((float *)v40, 1.5047e-36);
      LODWORD(v55[0]) = (_DWORD)v33;
      sub_246379064();
      *(_WORD *)(v40 + 8) = 2048;
      v55[0] = v37;
      sub_246379064();
      _os_log_impl(&dword_24635F000, v0, v39, "AudioSessionID: %u, audioFeedbackCategories: %ld", (uint8_t *)v40, 0x12u);
      OUTLINED_FUNCTION_7();
    }
    v41 = v38 != 0;

    v42 = *(void **)(v34 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue);
    v43 = v52;
    sub_246370CEC(v42, v34, v43, (int)v33);
    v44 = v36;
    sub_2463682B4(v35, v36);
    v45 = (*(unsigned __int8 *)(v53 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    v46 = (char *)v54 + v45;
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v43;
    sub_246372584(v44, v47 + v45);
    v48 = &v46[v47];
    *v48 = v37 & 1;
    v48[1] = (v37 & 2) != 0;
    v48[2] = v41;
    v48[3] = (v37 & 4) != 0;
    v49 = v43;
    sub_246371BE0();
    swift_release();

    OUTLINED_FUNCTION_18();
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_23();
    v54 = OUTLINED_FUNCTION_4_0(v18, (uint64_t)qword_2544206D8);
    v19 = sub_246378FE0();
    if (OUTLINED_FUNCTION_45_0(v54))
    {
      v20 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v20);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v54, v19, "HGManager is nil", (uint8_t *)v0);
      OUTLINED_FUNCTION_7();
    }

  }
}

void sub_24636AF80()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2463786C8();
  v1 = (id)sub_24637865C();

  sub_2463786A4();
}

void sub_24636AFCC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v0 = (void *)sub_2463786C8();
  v1 = (void *)sub_24637865C();

  sub_246365F04();
  sub_246378698();

  v2 = (void *)sub_2463786C8();
  v3 = (void *)sub_24637865C();

  sub_246378680();
  v4 = (void *)sub_2463786C8();
  v5 = (void *)sub_24637865C();

  sub_24637868C();
  v6 = (void *)sub_2463786C8();
  v7 = (void *)sub_24637865C();

  sub_24637868C();
  v8 = (void *)sub_2463786C8();
  v9 = (void *)sub_24637865C();

  sub_246378680();
  v10 = (void *)sub_2463786C8();
  v11 = (void *)sub_24637865C();

  sub_24637868C();
  v12 = (void *)sub_2463786C8();
  v13 = (void *)sub_24637865C();

  sub_24637868C();
  v14 = (void *)sub_2463786C8();
  sub_246378644();

  v15 = (void *)sub_2463786C8();
  v16 = (id)sub_24637865C();

  sub_2463786BC();
}

void sub_24636B194(uint64_t a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 1;
  sub_24636B1BC(a1);
  sub_24636EAD0(1);
}

void sub_24636B1BC(uint64_t a1)
{
  os_log_type_t v1;
  void *v2;
  uint64_t v3;
  os_log_type_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _WORD *v12;
  uint64_t v13;
  NSObject *osloga;
  NSObject *oslog;

  v1 = sub_246369F10(a1);
  v2 = sub_246369664(v1 & 1);

  if (!v2 && (v1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_23();
    osloga = OUTLINED_FUNCTION_4_0(v3, (uint64_t)qword_2544206D8);
    v4 = sub_246378FE0();
    if (OUTLINED_FUNCTION_32_0(v4, v5, v6, v7, v8, v9, v10, v11, v13, osloga))
    {
      v12 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v12);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, oslog, v1, "Failed to initialize HGManager", 0);
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_30_1(oslog);
  }
}

void sub_24636B280()
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
  id v24;
  NSObject *v25;
  uint8_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  char v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  uint8_t *v45;
  os_log_type_t v46;
  os_log_type_t v47;
  char v48;
  uint64_t v49;
  os_log_type_t v50;
  _WORD *v51;
  const char *v52;
  uint8_t *v53;
  uint64_t v54;
  char v55;
  os_log_type_t v56;
  _WORD *v57;
  char v58;
  os_log_type_t v59;
  _WORD *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t *v89;
  uint64_t v90[4];

  OUTLINED_FUNCTION_39_0();
  v84 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_48();
  v76 = v3;
  v80 = type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_48();
  v81 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v6);
  v7 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OUTLINED_FUNCTION_5_0();
  v86 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_15();
  v75 = v13;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_38_0();
  v78 = v15;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_38_0();
  v79 = v17;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_38_0();
  v82 = v19;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v72 - v21;
  if (qword_254420520 != -1)
    swift_once();
  v85 = v11;
  v23 = OUTLINED_FUNCTION_23();
  v24 = OUTLINED_FUNCTION_85(v23, (uint64_t)qword_2544206D8);
  v83 = v11;
  v25 = sub_246378E90();
  v26 = (uint8_t *)sub_246378FD4();
  if (OUTLINED_FUNCTION_29_1(v25))
  {
    v27 = OUTLINED_FUNCTION_10();
    v28 = (_QWORD *)OUTLINED_FUNCTION_10();
    v73 = OUTLINED_FUNCTION_10();
    v90[0] = v73;
    *(_DWORD *)v27 = 136315650;
    v77 = v10;
    sub_24636699C((uint64_t)v22);
    v29 = sub_246378C08();
    v74 = v7;
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v22, v85);
    v88 = sub_2463635B4(v29, v31, v90);
    sub_246379064();

    v32 = swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2112;
    v33 = OUTLINED_FUNCTION_88(v32, sel_avgConfidence);
    OUTLINED_FUNCTION_133((uint64_t)v33);
    sub_246379064();
    *v28 = v33;

    *(_WORD *)(v27 + 22) = 2080;
    v35 = OUTLINED_FUNCTION_88(v34, sel_headGesturePart);
    v36 = sub_246366A14((uint64_t)v35);
    v38 = sub_2463635B4(v36, v37, v90);
    OUTLINED_FUNCTION_133(v38);
    sub_246379064();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24635F000, v25, (os_log_type_t)v26, "HeadGesture: Type:%s, confidence: %@, partGesture: %s", (uint8_t *)v27, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7C0);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  v39 = v84;
  v40 = (v84 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping);
  OUTLINED_FUNCTION_45();
  sub_246363684((uint64_t)v40, v1, &qword_25756D7B0);
  OUTLINED_FUNCTION_57_0(v1, 1, v7);
  if (!v41)
  {
    sub_246372584(v1, (uint64_t)v10);
    v44 = v82;
    sub_24636699C(v82);
    v46 = v85;
    v45 = (uint8_t *)v86;
    OUTLINED_FUNCTION_144(*MEMORY[0x24BE9AF88], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v86 + 104));
    sub_24637279C(&qword_25756D7B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF98], MEMORY[0x24BE9AFA8]);
    v47 = v46;
    v48 = sub_246378F44();
    OUTLINED_FUNCTION_46_1((uint64_t)v22);
    if ((v48 & 1) != 0)
    {
      v49 = OUTLINED_FUNCTION_62_0();
      v50 = sub_246378FC8();
      if (OUTLINED_FUNCTION_38(v50))
      {
        v51 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_26_1(v51);
        v52 = "Ignoring partial gestures";
        goto LABEL_18;
      }
    }
    else
    {
      v88 = sub_246366030();
      v89 = v53;
      sub_246378F8C();
      v45 = v89;
      v47 = v39 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureDeduper;
      OUTLINED_FUNCTION_45();
      sub_2463671CC();
      v49 = v54;
      swift_endAccess();
      OUTLINED_FUNCTION_32();
      if ((v49 & 1) != 0)
      {
        OUTLINED_FUNCTION_130();
        sub_24636C060();
        if ((v55 & 1) != 0)
          OUTLINED_FUNCTION_163();
        OUTLINED_FUNCTION_130();
        sub_24636C104();
        if ((v58 & 1) != 0)
        {
          if (*(_BYTE *)(v39 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) == 1)
          {
            OUTLINED_FUNCTION_62_0();
            v59 = OUTLINED_FUNCTION_21_0();
            if (OUTLINED_FUNCTION_38(v59))
            {
              v60 = (_WORD *)OUTLINED_FUNCTION_1_0();
              OUTLINED_FUNCTION_26_1(v60);
              OUTLINED_FUNCTION_5_1(&dword_24635F000, v49, v47, "Creating a promptInfo for announced call", v45);
              OUTLINED_FUNCTION_7();
            }

            v61 = v76;
            sub_246378BC0();
            v62 = v39 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo;
            OUTLINED_FUNCTION_45();
            sub_2463638CC(v61, v62, (uint64_t *)&unk_2544200E0);
            swift_endAccess();
          }
          OUTLINED_FUNCTION_163();
        }
        OUTLINED_FUNCTION_130();
        sub_24636BFBC();
        if ((v63 & 1) != 0)
        {
          v77 = v10;
          v64 = *(_QWORD *)(v86 + 16);
          v65 = v75;
          OUTLINED_FUNCTION_141(v75);
          OUTLINED_FUNCTION_62_0();
          v66 = OUTLINED_FUNCTION_21_0();
          if (OUTLINED_FUNCTION_18_1(v49))
          {
            v67 = OUTLINED_FUNCTION_10();
            v86 = v64;
            v68 = v65;
            v69 = (uint8_t *)v67;
            v88 = OUTLINED_FUNCTION_10();
            *(_DWORD *)v69 = 136315138;
            v70 = sub_246366030();
            v87 = sub_2463635B4(v70, v71, &v88);
            sub_246379064();
            OUTLINED_FUNCTION_81();
            OUTLINED_FUNCTION_46_1(v68);
            OUTLINED_FUNCTION_36(&dword_24635F000, v49, v66, "%s detected: dismissing Siri", v69);
            OUTLINED_FUNCTION_35();
            OUTLINED_FUNCTION_7();
          }
          OUTLINED_FUNCTION_46_1(v65);

          sub_24636A87C();
          OUTLINED_FUNCTION_163();
        }
        goto LABEL_30;
      }
      OUTLINED_FUNCTION_62_0();
      v56 = OUTLINED_FUNCTION_67();
      if (OUTLINED_FUNCTION_38(v56))
      {
        v57 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_26_1(v57);
        v52 = "Head gesture might be a duplicate, ignoring";
LABEL_18:
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v49, v47, v52, v45);
        OUTLINED_FUNCTION_7();
      }
    }

LABEL_30:
    OUTLINED_FUNCTION_46_1(v44);
    sub_24637274C((uint64_t)v10, type metadata accessor for GestureMapping);
    goto LABEL_31;
  }
  sub_246372774(v1, &qword_25756D7B0);
  OUTLINED_FUNCTION_62_0();
  v42 = OUTLINED_FUNCTION_21_0();
  if (OUTLINED_FUNCTION_38(v42))
  {
    v43 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_26_1(v43);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v40, (os_log_type_t)v11, "GestureMapping is nil", v26);
    OUTLINED_FUNCTION_7();
  }

LABEL_31:
  OUTLINED_FUNCTION_18();
}

uint64_t sub_24636BE28()
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
  uint64_t v9;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D798);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246378620();
  v6 = *MEMORY[0x24BE9B4D0];
  v7 = sub_246378D94();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_246378BE4();
  v8 = *MEMORY[0x24BE9AE40];
  v9 = sub_246378BFC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_246378BCC();
}

void sub_24636BFBC()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_66_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_86();
  if ((v0 & 4) != 0 && (OUTLINED_FUNCTION_162() & 1) == 0)
    OUTLINED_FUNCTION_109();
  v5 = OUTLINED_FUNCTION_91(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_112(v5, type metadata accessor for GestureMapping);
  OUTLINED_FUNCTION_42_1();
}

void sub_24636C060()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_66_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_86();
  if ((v0 & 1) != 0 && (OUTLINED_FUNCTION_162() & 1) == 0)
    OUTLINED_FUNCTION_109();
  v5 = OUTLINED_FUNCTION_91(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_112(v5, type metadata accessor for GestureMapping);
  OUTLINED_FUNCTION_42_1();
}

void sub_24636C104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  Class isa;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, NSObject *);
  uint8_t *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  os_log_type_t v26;
  _WORD *v27;
  char v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_39_0();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_5_0();
  isa = v5[-1].isa;
  MEMORY[0x24BDAC7A8](v5);
  v29 = (uint8_t *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - v9;
  v11 = OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_9();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v29 - v16;
  v30 = v0;
  v18 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent);
  v32 = v2;
  sub_2463682B4(v2, (uint64_t)&v29 - v16);
  v19 = (void (*)(char *, uint64_t, NSObject *))*((_QWORD *)isa + 2);
  v31 = v4;
  v19(v10, v4, v5);
  if ((v18 & 2) != 0 && (sub_2463654E8((uint64_t)v10, (uint64_t)v17) & 1) == 0)
  {
    v28 = sub_2463654E8((uint64_t)v10, (uint64_t)&v17[*(int *)(v11 + 20)]);
    OUTLINED_FUNCTION_106();
    sub_24637274C((uint64_t)v17, type metadata accessor for GestureMapping);
    if ((v28 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    OUTLINED_FUNCTION_106();
    sub_24637274C((uint64_t)v17, type metadata accessor for GestureMapping);
  }
  v20 = v29;
  v21 = *(unsigned __int8 *)(v30 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall);
  v19((char *)v29, v31, v5);
  v22 = sub_2463682B4(v32, (uint64_t)v15);
  if (v21 == 1)
  {
    sub_24636BFBC();
    v24 = v23;
    OUTLINED_FUNCTION_151(v23, type metadata accessor for GestureMapping);
    OUTLINED_FUNCTION_148();
    if ((v24 & 1) != 0)
    {
      if (qword_254420520 != -1)
        swift_once();
      v25 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v25, (uint64_t)qword_2544206D8);
      v26 = OUTLINED_FUNCTION_21_0();
      if (OUTLINED_FUNCTION_38(v26))
      {
        v27 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_26_1(v27);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v5, v24, "Announcing an incoming call, treating early dismissal as early decline", v20);
        OUTLINED_FUNCTION_7();
      }

    }
  }
  else
  {
    OUTLINED_FUNCTION_151(v22, type metadata accessor for GestureMapping);
    OUTLINED_FUNCTION_148();
  }
LABEL_14:
  OUTLINED_FUNCTION_18();
}

void sub_24636C344()
{
  uint64_t v0;

  if (MEMORY[0x24955888C](v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate))
  {
    sub_24637327C();
    swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_16();
  }
}

void sub_24636C3B8(char a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  int *v8;
  const char *v9;
  uint64_t v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint32_t v15;
  uint64_t v16;
  os_log_type_t v17;
  _WORD *v18;

  if ((sub_24636E984() & 1) == 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v10, (uint64_t)qword_2544206D8);
    v11 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v11))
    {
      *(_DWORD *)OUTLINED_FUNCTION_10() = 67109120;
      OUTLINED_FUNCTION_55_0();
      OUTLINED_FUNCTION_138();
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if ((a1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v5, (uint64_t)qword_2544206D8);
    v6 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v6))
    {
      v7 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_35_1(v7);
      v8 = &dword_24635F000;
      v9 = "✅ HGManager started streaming for gesture recognition";
LABEL_16:
      v12 = v1;
      v13 = v2;
      v14 = v3;
      v15 = 2;
LABEL_17:
      _os_log_impl(v8, v12, v13, v9, v14, v15);
      OUTLINED_FUNCTION_7();
    }
    goto LABEL_18;
  }
  if (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) == 1)
  {
    if (qword_254420520 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v16, (uint64_t)qword_2544206D8);
    v17 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v17))
    {
      v18 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_35_1(v18);
      v8 = &dword_24635F000;
      v9 = "‼️ HGManager stopped streaming when gesture recognition was needed";
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_19:
  *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady) = a1 & 1;
  sub_24636A3F0();
}

void sub_24636C5D4()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _WORD *v12;
  uint64_t v13;
  os_log_type_t v14;
  _WORD *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  _WORD *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  _WORD *v31;
  void (*v32)(uint8_t *, NSObject *);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  _WORD *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  os_log_type_t v45;
  _WORD *v46;
  uint8_t v47[24];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_95();
  sub_24637862C();
  OUTLINED_FUNCTION_66_0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_93();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = &v47[-v6];
  OUTLINED_FUNCTION_103();
  if (!v16)
  {
    if (qword_254420520 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v13, (uint64_t)qword_2544206D8);
    v14 = OUTLINED_FUNCTION_21_0();
    if (OUTLINED_FUNCTION_38(v14))
    {
      v15 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_26_1(v15);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v1, "❓ Siri did not prompt for confirmation yet", v7);
      OUTLINED_FUNCTION_7();
    }

    goto LABEL_43;
  }
  sub_246378620();
  OUTLINED_FUNCTION_103();
  if (!v16)
  {
    OUTLINED_FUNCTION_103();
    if (v16)
    {
      MEMORY[0x24BDAC7A8](v17);
      OUTLINED_FUNCTION_70_0();
      OUTLINED_FUNCTION_100();
      v18 = (v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo);
      v19 = OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_40_1(v19, v20, (uint64_t *)&unk_2544200E0);
      OUTLINED_FUNCTION_139();
      if (qword_254420520 != -1)
        swift_once();
      v21 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v21, (uint64_t)qword_2544206D8);
      v22 = OUTLINED_FUNCTION_69_0();
      if (OUTLINED_FUNCTION_9_0(v22))
      {
        v23 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_35_1(v23);
        v24 = "Expecting confirmation for Siri X";
        goto LABEL_40;
      }
    }
    else
    {
      OUTLINED_FUNCTION_103();
      if (v33)
      {
        MEMORY[0x24BDAC7A8](v34);
        OUTLINED_FUNCTION_70_0();
        OUTLINED_FUNCTION_100();
        v18 = (v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo);
        v35 = OUTLINED_FUNCTION_45();
        OUTLINED_FUNCTION_40_1(v35, v36, (uint64_t *)&unk_2544200E0);
        OUTLINED_FUNCTION_139();
        if (qword_254420520 != -1)
          swift_once();
        v37 = OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_4_0(v37, (uint64_t)qword_2544206D8);
        v38 = OUTLINED_FUNCTION_69_0();
        if (OUTLINED_FUNCTION_9_0(v38))
        {
          v39 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_35_1(v39);
          v24 = "Expecting confirmation for Siri Classic";
          goto LABEL_40;
        }
      }
      else
      {
        OUTLINED_FUNCTION_103();
        if (!v40)
        {
LABEL_42:
          OUTLINED_FUNCTION_91((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
          goto LABEL_43;
        }
        MEMORY[0x24BDAC7A8](v41);
        OUTLINED_FUNCTION_70_0();
        OUTLINED_FUNCTION_100();
        v18 = (v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo);
        v42 = OUTLINED_FUNCTION_45();
        OUTLINED_FUNCTION_40_1(v42, v43, (uint64_t *)&unk_2544200E0);
        OUTLINED_FUNCTION_139();
        if (qword_254420520 != -1)
          swift_once();
        v44 = OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_4_0(v44, (uint64_t)qword_2544206D8);
        v45 = OUTLINED_FUNCTION_69_0();
        if (OUTLINED_FUNCTION_9_0(v45))
        {
          v46 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_35_1(v46);
          v24 = "Expecting confirmation for POMMES";
LABEL_40:
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v18, v2, v24, v47);
          OUTLINED_FUNCTION_7();
        }
      }
    }

    OUTLINED_FUNCTION_91((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    goto LABEL_43;
  }
  v8 = v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
  OUTLINED_FUNCTION_45();
  sub_246363684(v8, v4, &qword_2544203B0);
  OUTLINED_FUNCTION_57_0(v4, 1, (uint64_t)v0);
  if (v16)
  {
    sub_246372774(v4, &qword_2544203B0);
    if (qword_254420520 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_23();
    v10 = OUTLINED_FUNCTION_4_0(v9, (uint64_t)qword_2544206D8);
    v11 = sub_246378FE0();
    if (OUTLINED_FUNCTION_9_0(v11))
    {
      v12 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_35_1(v12);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v10, v2, "‼️ Expecting IE confirmation but lastActionEventId is nil", v3);
      OUTLINED_FUNCTION_7();
    }

    goto LABEL_42;
  }
  v25 = (*(uint64_t (**)(uint8_t *, uint64_t, NSObject *))(v5 + 32))(v3, v4, v0);
  MEMORY[0x24BDAC7A8](v25);
  *(_QWORD *)&v47[-16] = v3;
  OUTLINED_FUNCTION_100();
  v26 = (v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo);
  v27 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_40_1(v27, v28, (uint64_t *)&unk_2544200E0);
  swift_endAccess();
  if (qword_254420520 != -1)
    swift_once();
  v29 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v29, (uint64_t)qword_2544206D8);
  v30 = OUTLINED_FUNCTION_69_0();
  if (OUTLINED_FUNCTION_9_0(v30))
  {
    v31 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v31);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v26, v2, "Expecting confirmation for IntelligenceEngine", v47);
    OUTLINED_FUNCTION_7();
  }

  v32 = *(void (**)(uint8_t *, NSObject *))(v5 + 8);
  v32(v3, v0);
  v32(v7, v0);
LABEL_43:
  OUTLINED_FUNCTION_42_1();
}

uint64_t sub_24636CB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D798);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24637862C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a2, v9);
  v10 = *MEMORY[0x24BE9B4C8];
  v11 = sub_246378D94();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v8, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v11);
  sub_246378BE4();
  v12 = *MEMORY[0x24BE9AFF8];
  v13 = sub_246378C5C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v6, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v13);
  sub_246378BD8();
  v14 = *MEMORY[0x24BE9AE40];
  v15 = sub_246378BFC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v4, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v15);
  return sub_246378BCC();
}

void sub_24636CD5C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D798);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A8);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36_1();
  sub_24637862C();
  v3 = OUTLINED_FUNCTION_146();
  v4(v3);
  v5 = *MEMORY[0x24BE9B4D0];
  v6 = sub_246378D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v0, v5, v6);
  OUTLINED_FUNCTION_104(v0);
  sub_246378BE4();
  v7 = *MEMORY[0x24BE9AE40];
  v8 = sub_246378BFC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v2, v7, v8);
  OUTLINED_FUNCTION_155();
  sub_246378BCC();
  OUTLINED_FUNCTION_60_0();
}

void sub_24636CE64()
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
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  _BYTE *v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  void (*v32)(uint64_t, _BYTE *, uint64_t);
  os_log_type_t v33;
  int v34;
  _DWORD *v35;
  _DWORD *v36;
  char v37;
  int v38;
  int v39;
  int v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;
  uint64_t v59;
  _BYTE v60[12];
  int v61;
  NSObject *v62;
  uint64_t v63;
  void (*v64)(uint64_t, _BYTE *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;

  OUTLINED_FUNCTION_39_0();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D788);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_128();
  v5 = OUTLINED_FUNCTION_164();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v68 = &v60[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_38_0();
  v67 = v9;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_38_0();
  v66 = v11;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_38_0();
  v65 = v13;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_38_0();
  v69 = v15;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_161();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = &v60[-v19];
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = &v60[-v22];
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = &v60[-v25];
  MEMORY[0x24BDAC7A8](v24);
  v28 = &v60[-v27];
  sub_246363684(v3, v0, &qword_25756D788);
  OUTLINED_FUNCTION_57_0(v0, 1, v5);
  if (!v29)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 32))(v28, v0, v5);
    if (qword_254420520 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_23();
    v31 = __swift_project_value_buffer(v30, (uint64_t)qword_2544206D8);
    v32 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 16);
    OUTLINED_FUNCTION_83((uint64_t)v26);
    OUTLINED_FUNCTION_83((uint64_t)v23);
    OUTLINED_FUNCTION_83((uint64_t)v20);
    v64 = v32;
    v32(v1, v28, v5);
    sub_246378E90();
    v33 = OUTLINED_FUNCTION_30();
    v34 = v33;
    if (os_log_type_enabled(v31, v33))
    {
      v35 = (_DWORD *)OUTLINED_FUNCTION_10();
      v61 = v34;
      v36 = v35;
      *v35 = 67109888;
      v62 = v31;
      v37 = sub_24637871C();
      v63 = (uint64_t)v31;
      v38 = v37 & 1;
      OUTLINED_FUNCTION_19_1((uint64_t)v26);
      LODWORD(v70) = v38;
      OUTLINED_FUNCTION_52_1();
      *((_WORD *)v36 + 4) = 1024;
      v39 = sub_246378728() & 1;
      OUTLINED_FUNCTION_19_1((uint64_t)v23);
      LODWORD(v70) = v39;
      OUTLINED_FUNCTION_52_1();
      *((_WORD *)v36 + 7) = 1024;
      v40 = sub_246378704() & 1;
      OUTLINED_FUNCTION_19_1((uint64_t)v20);
      LODWORD(v70) = v40;
      OUTLINED_FUNCTION_52_1();
      *((_WORD *)v36 + 10) = 1024;
      v41 = sub_246378710() & 1;
      OUTLINED_FUNCTION_19_1(v1);
      LODWORD(v70) = v41;
      v42 = v62;
      sub_246379064();
      OUTLINED_FUNCTION_132(&dword_24635F000, v42, (os_log_type_t)v61, "hasStrictPrompt: %{BOOL}d hasDictationPrompt: %{BOOL}d strictPrompt: %{BOOL}d dictationPrompt: %{BOOL}d", (uint8_t *)v36);
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_19_1(v1);
    OUTLINED_FUNCTION_19_1((uint64_t)v20);
    OUTLINED_FUNCTION_19_1((uint64_t)v23);
    OUTLINED_FUNCTION_19_1((uint64_t)v26);

    v43 = v69;
    v64(v69, v28, v5);
    v44 = sub_246378E90();
    v45 = sub_246378FD4();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)OUTLINED_FUNCTION_10();
      v63 = OUTLINED_FUNCTION_10();
      v70 = v63;
      *(_DWORD *)v46 = 136315138;
      v62 = (v46 + 4);
      sub_246378734();
      v47 = MEMORY[0x2495582B0]();
      v49 = v48;
      OUTLINED_FUNCTION_81();
      v50 = sub_2463635B4(v47, v49, &v70);
      OUTLINED_FUNCTION_77(v50);
      OUTLINED_FUNCTION_135();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_1(v69);
      OUTLINED_FUNCTION_36(&dword_24635F000, v44, v45, "responseSemanticValues: %s", v46);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_19_1(v43);

    v51 = (uint64_t)v68;
    v53 = v65;
    v52 = v66;
    v54 = sub_24637871C();
    OUTLINED_FUNCTION_24_1(v53);
    v55 = v67;
    if ((v54 & 1) != 0)
    {
      v56 = sub_246378704();
      OUTLINED_FUNCTION_19_1(v53);
      OUTLINED_FUNCTION_24_1(v52);
      if ((v56 & 1) != 0)
      {
        v57 = sub_246378728();
        OUTLINED_FUNCTION_19_1(v52);
        OUTLINED_FUNCTION_24_1(v55);
        if ((v57 & 1) != 0)
        {
          v58 = sub_246378710();
          OUTLINED_FUNCTION_19_1(v55);
          OUTLINED_FUNCTION_24_1(v51);
          if ((v58 & 1) == 0)
          {
            v59 = sub_246378734();
            sub_24636686C(v59);
            OUTLINED_FUNCTION_32();
          }
          goto LABEL_18;
        }
LABEL_17:
        OUTLINED_FUNCTION_19_1(v55);
        OUTLINED_FUNCTION_24_1(v51);
LABEL_18:
        OUTLINED_FUNCTION_19_1(v51);
        OUTLINED_FUNCTION_19_1((uint64_t)v28);
        goto LABEL_19;
      }
    }
    else
    {
      OUTLINED_FUNCTION_19_1(v53);
      OUTLINED_FUNCTION_24_1(v52);
    }
    OUTLINED_FUNCTION_19_1(v52);
    OUTLINED_FUNCTION_24_1(v55);
    goto LABEL_17;
  }
  sub_246372774(v0, &qword_25756D788);
LABEL_19:
  OUTLINED_FUNCTION_18();
}

void sub_24636D3E4()
{
  NSObject *v0;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  os_log_type_t v30;
  _WORD *v31;
  uint64_t v32;
  os_log_type_t v33;
  _WORD *v34;
  uint64_t v35;
  NSObject *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];
  NSObject *v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;

  OUTLINED_FUNCTION_39_0();
  v39 = sub_246378D88();
  OUTLINED_FUNCTION_117();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_129();
  v4 = sub_246378D4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D788);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_15();
  v37 = (uint8_t *)v9;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v35 - v11;
  v13 = OUTLINED_FUNCTION_164();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_37_1(v15, v35);
  v16 = ((char *)v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState);
  v17 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_157(v17, (uint64_t)v42, (uint64_t *)&unk_2544203C8);
  if (!v42[3])
  {
    OUTLINED_FUNCTION_72_0(v18, (uint64_t *)&unk_2544203C8);
    v43 = 0u;
    v44 = 0u;
    goto LABEL_12;
  }
  v35 = v14;
  v36 = v0;
  v19 = OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_72_0(v19, (uint64_t *)&unk_2544203C8);
  v16 = v41;
  v0 = __swift_project_boxed_opaque_existential_1(v40, (uint64_t)v41);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE9B348], v4);
  sub_246378D7C();
  sub_246378D58();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v39);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v20 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  if (!*((_QWORD *)&v44 + 1))
  {
LABEL_12:
    OUTLINED_FUNCTION_149(v20, &qword_25756D770);
    OUTLINED_FUNCTION_84((uint64_t)v12, 1);
    goto LABEL_13;
  }
  v21 = OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_84((uint64_t)v12, v21 ^ 1u);
  OUTLINED_FUNCTION_50_1((uint64_t)v12);
  if (!v22)
  {
    v23 = v35;
    v24 = v38;
    OUTLINED_FUNCTION_111(v38, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 32));
    OUTLINED_FUNCTION_131();
    v25 = v37;
    OUTLINED_FUNCTION_111((uint64_t)v37, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16));
    OUTLINED_FUNCTION_155();
    sub_24636CE64();
    v27 = v26;
    OUTLINED_FUNCTION_89(v26, &qword_25756D788);
    v28 = v36;
    if ((v27 & 1) == 0)
    {
      if (qword_254420520 != -1)
        swift_once();
      v29 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v29, (uint64_t)qword_2544206D8);
      v30 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_11_1(v30))
      {
        v31 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_107(v31);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v1, "Not expecting Siri Classic confirmation", v25);
        OUTLINED_FUNCTION_7();
      }

    }
    OUTLINED_FUNCTION_68(v24, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    *((_BYTE *)&v28->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = v27 & 1;
    goto LABEL_18;
  }
LABEL_13:
  sub_246372774((uint64_t)v12, &qword_25756D788);
  if (qword_254420520 != -1)
    swift_once();
  v32 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v32, (uint64_t)qword_2544206D8);
  v33 = OUTLINED_FUNCTION_21_0();
  if (OUTLINED_FUNCTION_38(v33))
  {
    v34 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_26_1(v34);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v16, (os_log_type_t)v0, "No legacy context found, not expecting SiriClassic confirmation", (uint8_t *)v5);
    OUTLINED_FUNCTION_7();
  }

LABEL_18:
  OUTLINED_FUNCTION_18();
}

void sub_24636D778()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t *v2;
  uint8_t *v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  _WORD *v31;
  uint64_t v32;
  os_log_type_t v33;
  _WORD *v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  char *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  _QWORD v53[8];
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;

  OUTLINED_FUNCTION_39_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D788);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_15();
  v46 = v5;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v6);
  v49 = (char *)&v44 - v7;
  v50 = OUTLINED_FUNCTION_164();
  v47 = *(_QWORD *)(v50 - 8);
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_48();
  v48 = (uint8_t *)v9;
  v52 = OUTLINED_FUNCTION_160();
  v10 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_12();
  v11 = sub_246378D4C();
  OUTLINED_FUNCTION_119();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D790);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_246378DB8();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_37_1(v18, v44);
  v19 = v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState;
  OUTLINED_FUNCTION_45();
  sub_246363684(v19, (uint64_t)v54, (uint64_t *)&unk_2544203C8);
  if (!v54[3])
  {
    OUTLINED_FUNCTION_72_0(v20, (uint64_t *)&unk_2544203C8);
    v55 = 0u;
    v56 = 0u;
    goto LABEL_12;
  }
  v45 = v17;
  v44 = v1;
  v21 = OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_72_0(v21, (uint64_t *)&unk_2544203C8);
  LOBYTE(v1) = __swift_project_boxed_opaque_existential_1(v53, v53[3]);
  OUTLINED_FUNCTION_144(*MEMORY[0x24BE9B338], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 104));
  sub_246378D7C();
  OUTLINED_FUNCTION_146();
  sub_246378D58();
  (*(void (**)(uint8_t *, uint64_t))(v10 + 8))(v2, v52);
  (*(void (**)(uint8_t *, uint64_t))(v0 + 8))(v3, v11);
  v22 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  if (!*((_QWORD *)&v56 + 1))
  {
LABEL_12:
    OUTLINED_FUNCTION_149(v22, &qword_25756D770);
    OUTLINED_FUNCTION_142((uint64_t)v15, 1);
    goto LABEL_13;
  }
  v23 = OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_142((uint64_t)v15, v23 ^ 1u);
  OUTLINED_FUNCTION_57_0((uint64_t)v15, 1, v16);
  if (!v24)
  {
    v25 = v51;
    (*(void (**)(NSObject *, char *, uint64_t))(v45 + 32))(v51, v15, v16);
    v26 = (uint64_t)v49;
    sub_246378DAC();
    v27 = v50;
    v28 = OUTLINED_FUNCTION_57_0(v26, 1, v50);
    if (v24)
    {
      OUTLINED_FUNCTION_89(v28, &qword_25756D788);
      if (qword_254420520 != -1)
        swift_once();
      v29 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v29, (uint64_t)qword_2544206D8);
      v30 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_42_0(v30))
      {
        v31 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_34_1(v31);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v25, (os_log_type_t)v2, "No legacy context found in POMMES context, not expecting POMMES confirmation", v3);
        OUTLINED_FUNCTION_7();
      }

      OUTLINED_FUNCTION_115();
    }
    else
    {
      v35 = v47;
      v36 = v48;
      OUTLINED_FUNCTION_140((uint64_t)v48, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 32));
      OUTLINED_FUNCTION_131();
      v37 = v46;
      OUTLINED_FUNCTION_140(v46, (uint64_t)v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16));
      __swift_storeEnumTagSinglePayload(v37, 0, 1, v27);
      sub_24636CE64();
      v39 = v38;
      OUTLINED_FUNCTION_89(v38, &qword_25756D788);
      v40 = v44;
      if ((v39 & 1) == 0)
      {
        if (qword_254420520 != -1)
          swift_once();
        v41 = OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_4_0(v41, (uint64_t)qword_2544206D8);
        v42 = OUTLINED_FUNCTION_30();
        if (OUTLINED_FUNCTION_9_0(v42))
        {
          v43 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_35_1(v43);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v25, (os_log_type_t)v3, "Not expecting POMMES confirmation", v36);
          OUTLINED_FUNCTION_7();
        }

      }
      (*(void (**)(uint8_t *, uint64_t))(v35 + 8))(v36, v27);
      OUTLINED_FUNCTION_115();
      *(_BYTE *)(v40 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = v39 & 1;
    }
    goto LABEL_18;
  }
LABEL_13:
  sub_246372774((uint64_t)v15, &qword_25756D790);
  if (qword_254420520 != -1)
    swift_once();
  v32 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v32, (uint64_t)qword_2544206D8);
  v33 = OUTLINED_FUNCTION_21_0();
  if (OUTLINED_FUNCTION_38(v33))
  {
    v34 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_26_1(v34);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v1, "No legacy context found, not expecting SiriClassic confirmation", v2);
    OUTLINED_FUNCTION_7();
  }

LABEL_18:
  OUTLINED_FUNCTION_18();
}

void sub_24636DC6C()
{
  uint64_t v0;
  uint8_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __objc2_prop_list **p_base_props;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  os_log_type_t v38;
  os_log_type_t v39;
  _WORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t *v59;
  uint64_t v60[8];
  uint64_t v61[5];
  __int128 v62;
  __int128 v63;

  OUTLINED_FUNCTION_39_0();
  v4 = v1;
  v58 = sub_246378764();
  OUTLINED_FUNCTION_119();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (uint8_t *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v57 = (uint64_t)&v53 - v9;
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_117();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_94();
  v11 = sub_246378D4C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v1[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState];
  OUTLINED_FUNCTION_45();
  sub_246363684(v15, (uint64_t)v61, (uint64_t *)&unk_2544203C8);
  p_base_props = &GestureController.base_props;
  v59 = v4;
  if (!v61[3])
  {
    OUTLINED_FUNCTION_72_0(v16, (uint64_t *)&unk_2544203C8);
    v62 = 0u;
    v63 = 0u;
    goto LABEL_10;
  }
  v56 = v8;
  v18 = OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_72_0(v18, (uint64_t *)&unk_2544203C8);
  __swift_project_boxed_opaque_existential_1(v60, v60[3]);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE9B350], v11);
  sub_246378D7C();
  v4 = v59;
  sub_246378D58();
  p_base_props = (__objc2_prop_list **)(&GestureController + 64);
  OUTLINED_FUNCTION_68(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v19 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v60);
  if (!*((_QWORD *)&v63 + 1))
  {
LABEL_10:
    OUTLINED_FUNCTION_149(v19, &qword_25756D770);
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D778);
  if ((OUTLINED_FUNCTION_159() & 1) == 0)
  {
LABEL_11:
    v28 = 0;
    *(_QWORD *)(OUTLINED_FUNCTION_147() + 16) = MEMORY[0x24BEE4AF8];
    goto LABEL_12;
  }
  v20 = v61[0];
  v21 = OUTLINED_FUNCTION_147();
  v55 = v21;
  *(_QWORD *)(v21 + 16) = MEMORY[0x24BEE4AF8];
  v22 = v21 + 16;
  v23 = *(_QWORD *)(v20 + 16);
  if (v23)
  {
    v24 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
    v25 = v20 + v24;
    v26 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRetain();
    v27 = (uint64_t)v56;
    while ((sub_24637874C() & 1) == 0)
    {
      v25 += v26;
      if (!--v23)
      {
        OUTLINED_FUNCTION_80();
        v28 = 0;
        goto LABEL_28;
      }
    }
    sub_2463723EC();
    v41 = *(_QWORD *)(*(_QWORD *)v22 + 16);
    sub_246372434(v41);
    v42 = *(_QWORD *)v22;
    *(_QWORD *)(v42 + 16) = v41 + 1;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v0 + 16))(v42 + v24 + v41 * v26, v25, v58);
    *(_QWORD *)v22 = v42;
    if (qword_254420520 != -1)
      swift_once();
    v43 = OUTLINED_FUNCTION_23();
    __swift_project_value_buffer(v43, (uint64_t)qword_2544206D8);
    v44 = v57;
    OUTLINED_FUNCTION_137(v57);
    OUTLINED_FUNCTION_137(v27);
    v45 = sub_246378E90();
    v46 = v27;
    v47 = sub_246378FD4();
    if (OUTLINED_FUNCTION_105(v45))
    {
      v48 = v44;
      v49 = OUTLINED_FUNCTION_10();
      v54 = OUTLINED_FUNCTION_10();
      v61[0] = v54;
      *(_DWORD *)v49 = 134218242;
      v50 = sub_246378758();
      OUTLINED_FUNCTION_108(v48);
      v60[0] = v50;
      OUTLINED_FUNCTION_127();
      *(_WORD *)(v49 + 12) = 2080;
      sub_24637279C(&qword_25756D780, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CD70], MEMORY[0x24BE9CD18]);
      v51 = sub_246378DA0();
      v60[0] = sub_2463635B4(v51, v52, v61);
      OUTLINED_FUNCTION_127();
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_108(v46);
      _os_log_impl(&dword_24635F000, v45, v47, "Expecting confirmation for SDA %ld: %s", (uint8_t *)v49, 0x16u);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_108(v44);
    OUTLINED_FUNCTION_108(v27);
    OUTLINED_FUNCTION_80();

    v28 = 1;
LABEL_28:
    v4 = v59;
    p_base_props = (__objc2_prop_list **)(&GestureController + 64);
  }
  else
  {
    swift_bridgeObjectRelease();
    v28 = 0;
    v4 = v59;
  }
LABEL_12:
  v29 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation;
  v4[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation] = v28;
  if (p_base_props[164] != (__objc2_prop_list *)-1)
    swift_once();
  v30 = OUTLINED_FUNCTION_23();
  v57 = __swift_project_value_buffer(v30, (uint64_t)qword_2544206D8);
  v31 = OUTLINED_FUNCTION_7_1();
  v32 = sub_246378FD4();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)OUTLINED_FUNCTION_10();
    v60[0] = OUTLINED_FUNCTION_10();
    *(_DWORD *)v33 = 136315138;
    v56 = v33 + 4;
    OUTLINED_FUNCTION_45();
    v34 = swift_bridgeObjectRetain();
    v35 = MEMORY[0x2495582B0](v34, v58);
    v37 = v36;
    swift_retain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v62 = sub_2463635B4(v35, v37, v60);
    sub_246379064();
    swift_release();
    OUTLINED_FUNCTION_145();
    OUTLINED_FUNCTION_36(&dword_24635F000, v31, v32, "Confirmation SDAs: %s", v33);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if ((v4[v29] & 1) != 0)
  {
    swift_release();
  }
  else
  {
    v38 = v57;
    sub_246378E90();
    v39 = OUTLINED_FUNCTION_21_0();
    if (OUTLINED_FUNCTION_38(v39))
    {
      v40 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_26_1(v40);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v28, v38, "Not expecting SiriX confirmation", v4);
      OUTLINED_FUNCTION_7();
    }
    swift_release();

  }
  OUTLINED_FUNCTION_18();
}

void sub_24636E2EC()
{
  IMP *p_imp;
  char *v1;
  NSObject *v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  _BYTE *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t *v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  unsigned __int8 v35;
  char v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  os_log_type_t v40;
  _WORD *v41;
  char v42;
  os_log_type_t v43;
  _WORD *v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  IMP *v48;
  char *v49;
  char *v50;
  uint64_t v51;

  OUTLINED_FUNCTION_39_0();
  v3 = v1;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_119();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_93();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v45 - v9;
  v11 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState;
  v12 = sub_24636E924(*(_QWORD *)&v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState], (uint64_t)&unk_251790988);
  v13 = &loc_246379000;
  v50 = v5;
  if ((v12 & 1) != 0 && v5 == (char *)1)
  {
    OUTLINED_FUNCTION_73();
    if (!v14)
      swift_once();
    v15 = __swift_project_value_buffer(v6, (uint64_t)qword_2544206D8);
    OUTLINED_FUNCTION_111((uint64_t)v10, v15, (uint64_t (*)(uint64_t, uint64_t, uint64_t))p_imp[2]);
    v5 = v3;
    v16 = sub_246378E90();
    LODWORD(v47) = sub_246378FD4();
    if (os_log_type_enabled(v16, (os_log_type_t)v47))
    {
      v48 = p_imp;
      v17 = (uint8_t *)OUTLINED_FUNCTION_10();
      v46 = OUTLINED_FUNCTION_10();
      v51 = v46;
      *(_DWORD *)v17 = 136315138;
      v49 = v3;
      v18 = (id)AFExternalNotificationRequestHandlerStateGetName();
      if (v18)
      {
        v19 = v18;
        v45 = v17 + 4;
        v20 = sub_246378F5C();
        v22 = v21;

        v23 = sub_2463635B4(v20, v22, &v51);
        OUTLINED_FUNCTION_77(v23);
        sub_246379064();

        OUTLINED_FUNCTION_32();
        OUTLINED_FUNCTION_36(&dword_24635F000, v16, (os_log_type_t)v47, "Announcement state transitioned to idle from %s, resetting confirmation states", v17);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }
LABEL_38:

      __break(1u);
      return;
    }

    OUTLINED_FUNCTION_68((uint64_t)v10, (uint64_t (*)(uint64_t, uint64_t))p_imp[1]);
    sub_24636EEE8();
    sub_24636F194(7u);
    v5 = v50;
  }
  *(_QWORD *)&v3[v11] = v5;
  OUTLINED_FUNCTION_73();
  if (!v14)
    swift_once();
  v24 = __swift_project_value_buffer(v6, (uint64_t)qword_2544206D8);
  OUTLINED_FUNCTION_111((uint64_t)v2, v24, (uint64_t (*)(uint64_t, uint64_t, uint64_t))p_imp[2]);
  v25 = v2;
  sub_246378E90();
  v26 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v2, v26))
  {
    v47 = v24;
    v48 = p_imp;
    v49 = v3;
    v27 = (uint8_t *)OUTLINED_FUNCTION_10();
    v51 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v27 = 136315138;
    v28 = (id)AFExternalNotificationRequestHandlerStateGetName();
    if (v28)
    {
      v29 = v28;
      v30 = sub_246378F5C();
      v32 = v31;

      v33 = sub_2463635B4(v30, v32, &v51);
      OUTLINED_FUNCTION_77(v33);
      sub_246379064();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36(&dword_24635F000, v2, v26, "🔔 Announcement state updated to: %s", v27);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }
    __break(1u);
    goto LABEL_38;
  }

  OUTLINED_FUNCTION_68((uint64_t)v2, (uint64_t (*)(uint64_t, uint64_t))p_imp[1]);
  if (v5 != (char *)3 && (v5 != (char *)6 || v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive] != 1))
    goto LABEL_30;
  v34 = *(NSObject **)&v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper];
  if (!v34
    || (p_imp = &stru_251791FF0.imp,
        (objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper], sel_respondsToSelector_, sel_callState) & 1) == 0))
  {
    v35 = 0;
    goto LABEL_22;
  }
  v35 = -[NSObject callState](v34, sel_callState);
  if ((v35 & 4) == 0)
  {
LABEL_22:
    v36 = v35 & 1;
    goto LABEL_23;
  }
  v36 = 1;
LABEL_23:
  v13 = (_BYTE *)OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall;
  v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall] = v36;
  v37 = v3;
  OUTLINED_FUNCTION_152();
  v38 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v38))
  {
    v39 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_DWORD *)v39 = 67109120;
    LODWORD(v51) = v13[(_QWORD)v3];
    sub_246379064();

    _os_log_impl(&dword_24635F000, v34, (os_log_type_t)v2, "🔔 Announcing incoming call: %{BOOL}d", v39, 8u);
    OUTLINED_FUNCTION_7();
  }

  v25 = v37;
  if (v5 != (char *)6 || v13[(_QWORD)v3] != 1)
  {
    v42 = 1;
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_152();
  v40 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_9_0(v40))
  {
    v41 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_107(v41);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v37, (os_log_type_t)v37, "Not reading announcement, call is either ringing or active", (uint8_t *)p_imp);
    OUTLINED_FUNCTION_7();
  }

LABEL_30:
  v42 = 0;
LABEL_32:
  v3[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement] = v42;
  if ((sub_24636E924((uint64_t)v5, (uint64_t)&unk_251790988) & 1) != 0)
  {
    OUTLINED_FUNCTION_152();
    v43 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_42_0(v43))
    {
      v44 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_107(v44);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v25, (os_log_type_t)v13, "Updating gesture controller for announce state transition", (uint8_t *)p_imp);
      OUTLINED_FUNCTION_7();
    }

    sub_24636EAD0(0);
  }
  OUTLINED_FUNCTION_18();
}

uint64_t sub_24636E860(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_24637910C();
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
    if (v12 || (sub_24637910C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24636E924(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t i;
  uint64_t v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v5 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v3 = v6;
    v6 = v6 || v5 == v2;
    if (v6)
      return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_24636E984()
{
  uint64_t v0;
  char v1;

  sub_24636C5D4();
  if ((v1 & 1) != 0)
    return 1;
  else
    return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement);
}

void sub_24636E9B0(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12();
  if (qword_254420520 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v7, (uint64_t)qword_2544206D8);
  v8 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v8))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v9);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v1, v3, "Updating states for IE", v4);
    OUTLINED_FUNCTION_7();
  }

  *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation) = 1;
  sub_246363684(a1, v2, &qword_2544203B0);
  v10 = (uint64_t)v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
  OUTLINED_FUNCTION_45();
  sub_2463638CC(v2, v10, &qword_2544203B0);
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_60_0();
}

void sub_24636EAD0(char a1)
{
  NSObject *v1;
  void *v2;
  uint8_t *v3;
  uint64_t v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  uint8_t *v16;
  char *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  os_log_t v21;
  os_log_type_t v22;
  const char *v23;
  uint8_t *v24;
  uint64_t v25;
  char v26;
  os_log_type_t v27;
  _WORD *v28;
  uint64_t v29;
  void *v30;
  os_log_type_t v31;
  _WORD *v32;
  os_log_type_t v33;
  _WORD *v34;

  if ((a1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v4, (uint64_t)qword_2544206D8);
    v5 = OUTLINED_FUNCTION_21_0();
    if (OUTLINED_FUNCTION_38(v5))
    {
      v6 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_34_1(v6);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v1, (os_log_type_t)v2, "Updating states from session for SiriX, Siri Classic, and POMMES", v3);
      OUTLINED_FUNCTION_7();
    }

    sub_24636DC6C();
    sub_24636D3E4();
    sub_24636D778();
  }
  if (qword_254420520 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_23();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2544206D8);
  v9 = v2;
  OUTLINED_FUNCTION_41_1();
  v10 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_9_0(v10))
  {
    v11 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v11 = 67109888;
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v11 + 8) = 1024;
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v11 + 14) = 1024;
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v11 + 20) = 1024;
    OUTLINED_FUNCTION_25_0();

    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_132(v12, v13, v14, v15, v16);
    OUTLINED_FUNCTION_7();
  }

  v17 = (char *)v9;
  OUTLINED_FUNCTION_41_1();
  v18 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_9_0(v18))
  {
    v19 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v19 = 67109632;
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v19 + 8) = 1024;
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v19 + 14) = 1024;
    OUTLINED_FUNCTION_25_0();

    OUTLINED_FUNCTION_101();
    _os_log_impl(v20, v21, v22, v23, v24, 0x14u);
    OUTLINED_FUNCTION_7();
  }

  if ((sub_24636E984() & 1) != 0)
  {
    v25 = sub_246370518();
    if ((v25 & 1) != 0)
    {
      v17[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 0;
      sub_246369BD8(v25);
      sub_24636C5D4();
      if ((v26 & 1) != 0)
      {
        OUTLINED_FUNCTION_41_1();
        v27 = OUTLINED_FUNCTION_21_0();
        if (OUTLINED_FUNCTION_38(v27))
        {
          v28 = (_WORD *)OUTLINED_FUNCTION_1_0();
          OUTLINED_FUNCTION_34_1(v28);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v8, (os_log_type_t)v17, "Expecting confirmation, deferring audio session deactivation until UI Dismissal", v3);
          OUTLINED_FUNCTION_7();
        }

        v30 = *(void **)&v17[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper];
        if (v30 && (OUTLINED_FUNCTION_121(v29, sel_respondsToSelector_) & 1) != 0)
          objc_msgSend(v30, sel_deferAudioSessionDeactivationForAnnouncementRequest);
      }
    }
    else
    {
      OUTLINED_FUNCTION_41_1();
      v33 = OUTLINED_FUNCTION_67();
      if (OUTLINED_FUNCTION_38(v33))
      {
        v34 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_34_1(v34);
        OUTLINED_FUNCTION_5_1(&dword_24635F000, v8, (os_log_type_t)v17, "🔇 Expecting gesture response but audio session might not be active, waiting for TTS", v3);
        OUTLINED_FUNCTION_7();
      }

      v17[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS] = 1;
    }
  }
  else if (v17[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] == 1)
  {
    sub_24636A3F0();
    sub_24636F194(8);
    OUTLINED_FUNCTION_41_1();
    v31 = OUTLINED_FUNCTION_21_0();
    if (OUTLINED_FUNCTION_38(v31))
    {
      v32 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_26_1(v32);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v8, (os_log_type_t)v17, "Not expecting gesture response, will stop head gesture recognition", (uint8_t *)v17);
      OUTLINED_FUNCTION_7();
    }

  }
  OUTLINED_FUNCTION_75();
}

void sub_24636EEE8()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  os_log_type_t v4;
  _WORD *v5;

  if (qword_254420520 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v3, (uint64_t)qword_2544206D8);
  v4 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_42_0(v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_34_1(v5);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, v1, "Resetting states", v2);
    OUTLINED_FUNCTION_7();
  }

  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
}

void sub_24636EFD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  if (qword_254420520 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v5, (uint64_t)qword_2544206D8);
  v6 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v6))
  {
    v7 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v7);
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, v3, "SessionEnded, deallocating hgManager", v4);
    OUTLINED_FUNCTION_7();
  }

  sub_246368FC8(0);
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady) = 0;
  *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_userIntent) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured) = 0;
  v8 = sub_246378BF0();
  OUTLINED_FUNCTION_39_1(v2, v9, v10, v8);
  v11 = OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_40_1(v11, v12, (uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_166();
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = 0;
  *((_BYTE *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) = 0;
  v13 = sub_24637862C();
  OUTLINED_FUNCTION_39_1(v1, v14, v15, v13);
  v16 = (uint64_t)v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId;
  OUTLINED_FUNCTION_45();
  sub_2463638CC(v1, v16, &qword_2544203B0);
  OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_60_0();
}

void sub_24636F194(unsigned __int8 a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  if (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing) == 1)
  {
    if (qword_254420520 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v4, (uint64_t)qword_2544206D8);
    v5 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_11_1(v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_10();
      *(_DWORD *)v6 = 136315138;
      v7 = sub_24636673C(a1);
      OUTLINED_FUNCTION_65_0(v7, v8, v9, v10, v11);
      OUTLINED_FUNCTION_51();
      sub_246379064();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36(&dword_24635F000, v1, v2, "Will stop gesture recognition for reason: %s", v6);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }

    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation) = 0;
    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = 0;
    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = 0;
    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation) = 0;
    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
    sub_246369F60(a1);
    OUTLINED_FUNCTION_13();
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v12, (uint64_t)qword_2544206D8);
    v13 = OUTLINED_FUNCTION_87();
    if (OUTLINED_FUNCTION_29_1(v20))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_10();
      *(_DWORD *)v14 = 136315138;
      v15 = sub_24636673C(a1);
      OUTLINED_FUNCTION_65_0(v15, v16, v17, v18, v19);
      OUTLINED_FUNCTION_51();
      sub_246379064();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36(&dword_24635F000, v20, v13, "Not running gesture recognition, no need to stop gesture recognition for reason: %s", v14);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }

  }
}

void sub_24636F41C(os_log_type_t a1)
{
  NSObject *v1;
  uint8_t *v2;
  uint8_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  os_log_type_t v11;
  _WORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  _WORD *v22;
  const char *v23;
  uint64_t v24;
  _WORD *v25;
  char *v26;
  os_log_type_t v27;
  uint64_t v28;
  char v29;
  char v30;
  void *v31;
  char *v32;
  id v33;
  NSObject *v34;

  v5 = OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive;
  *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) = a1;
  if ((a1 & 1) != 0)
  {
    OUTLINED_FUNCTION_124();
    if (!v6)
      swift_once();
    v7 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v7, (uint64_t)qword_2544206D8);
    v8 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_9_0(v8))
    {
      v9 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_35_1(v9);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v1, (os_log_type_t)v2, "TTS started, assuming audio session is configured", v3);
      OUTLINED_FUNCTION_7();
    }

    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured) = 1;
  }
  if (*(Class *)((char *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcementState) == (Class)6
    && (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_announcingIncomingCall) & 1) == 0)
  {
    *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) = a1 & 1;
LABEL_17:
    OUTLINED_FUNCTION_49_0();
    goto LABEL_18;
  }
  if ((a1 & 1) != 0 && *((_BYTE *)&v1->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_waitingForTTS) == 1)
  {
    OUTLINED_FUNCTION_124();
    if (!v6)
      swift_once();
    v10 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v10, (uint64_t)qword_2544206D8);
    v11 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_42_0(v11))
    {
      v12 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_34_1(v12);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v1, a1, "🔊 Audio session is now ready for playback", v2);
      OUTLINED_FUNCTION_7();
    }

    goto LABEL_17;
  }
LABEL_18:
  if ((sub_246366E48() & 1) == 0)
  {
    OUTLINED_FUNCTION_124();
    if (!v6)
      swift_once();
    v20 = OUTLINED_FUNCTION_23();
    v34 = OUTLINED_FUNCTION_4_0(v20, (uint64_t)qword_2544206D8);
    v21 = sub_246378FD4();
    if (OUTLINED_FUNCTION_45_0(v34))
    {
      v22 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v22);
      v23 = "🔇 Not playing waiting tone, it's disabled in the user defaults";
      goto LABEL_32;
    }
LABEL_33:

    return;
  }
  OUTLINED_FUNCTION_49_0();
  v13 = sub_246369664(0);
  if (!v13)
  {
    OUTLINED_FUNCTION_124();
    if (!v6)
      swift_once();
    v24 = OUTLINED_FUNCTION_23();
    v34 = OUTLINED_FUNCTION_4_0(v24, (uint64_t)qword_2544206D8);
    v21 = sub_246378FD4();
    if (OUTLINED_FUNCTION_45_0(v34))
    {
      v25 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v25);
      v23 = "HGManager is nil";
LABEL_32:
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v34, v21, v23, (uint8_t *)v1);
      OUTLINED_FUNCTION_7();
    }
    goto LABEL_33;
  }
  v14 = v13;
  OUTLINED_FUNCTION_124();
  if (!v6)
    swift_once();
  v15 = OUTLINED_FUNCTION_23();
  v16 = OUTLINED_FUNCTION_85(v15, (uint64_t)qword_2544206D8);
  v17 = sub_246378E90();
  v18 = sub_246378FD4();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v19 = 67109888;
    OUTLINED_FUNCTION_122();
    OUTLINED_FUNCTION_54_0();
    *(_WORD *)(v19 + 8) = 1024;
    OUTLINED_FUNCTION_54_0();
    *(_WORD *)(v19 + 14) = 1024;
    OUTLINED_FUNCTION_54_0();
    *(_WORD *)(v19 + 20) = 1024;
    OUTLINED_FUNCTION_54_0();

    OUTLINED_FUNCTION_132(&dword_24635F000, v17, v18, "Expecting Confirmation: Siri X %{BOOL}d, Siri Classic: %{BOOL}d, POMMES: %{BOOL}d IntelligenceEngine: %{BOOL}d", (uint8_t *)v19);
    OUTLINED_FUNCTION_7();
  }

  v26 = (char *)v16;
  sub_246378E90();
  v27 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v27))
  {
    v28 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v28 = 67110144;
    OUTLINED_FUNCTION_122();
    sub_246379064();
    *(_WORD *)(v28 + 8) = 1024;
    OUTLINED_FUNCTION_33_1();
    *(_WORD *)(v28 + 14) = 1024;
    OUTLINED_FUNCTION_33_1();
    *(_WORD *)(v28 + 20) = 1024;
    OUTLINED_FUNCTION_33_1();
    *(_WORD *)(v28 + 26) = 1024;
    OUTLINED_FUNCTION_33_1();

    _os_log_impl(&dword_24635F000, v1, (os_log_type_t)v17, "ReadingAnnouncement: %{BOOL}d isReady: %{BOOL}d audioSessionConfigured: %{BOOL}d, ttsActive: %{BOOL}d recognizing: %{BOOL}d", (uint8_t *)v28, 0x20u);
    OUTLINED_FUNCTION_7();
  }

  if ((*((_BYTE *)&v1->isa + v5) & 1) == 0
    && v26[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_recognizing] == 1
    && (sub_24636C5D4(), (v29 & 1) != 0)
    && v26[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isReady] == 1)
  {
    v30 = sub_246370518();
  }
  else
  {
    v30 = 0;
  }
  v31 = *(void **)&v26[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
  v32 = v26;
  v33 = v14;
  sub_2463718F0(v31, (uint64_t)v32, v30 & 1, v33, v32);

}

void sub_24636F974(char a1, uint64_t a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a1 & 1;
  v6 = (void *)sub_2463786C8();
  v7 = (void *)sub_24637865C();

  LODWORD(v6) = sub_2463786B0() & 1;
  if ((_DWORD)v6 != v5)
  {
    if (qword_254420520 != -1)
      swift_once();
    v8 = sub_246378E9C();
    __swift_project_value_buffer(v8, (uint64_t)qword_2544206D8);
    v9 = a3;
    v10 = sub_246378E90();
    v11 = sub_246378FC8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      *(_DWORD *)v12 = 67109376;
      sub_246379064();

      *(_WORD *)(v12 + 8) = 1024;
      sub_246379064();
      _os_log_impl(&dword_24635F000, v10, v11, "TTS Active: %{BOOL}d shouldPlayWaitingTone: %{BOOL}d", (uint8_t *)v12, 0xEu);
      MEMORY[0x249558838](v12, -1, -1);

    }
    else
    {

    }
    v13 = v9;
    v14 = sub_246378E90();
    v15 = sub_246378FD4();
    v16 = os_log_type_enabled(v14, v15);
    if ((a1 & 1) != 0)
    {
      if (v16)
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v17 = 67109120;
        sub_246379064();

        _os_log_impl(&dword_24635F000, v14, v15, "🔊 Playing waiting tone, ttsActive: %{BOOL}d", v17, 8u);
        v18 = (uint64_t)v17;
LABEL_12:
        MEMORY[0x249558838](v18, -1, -1);
LABEL_14:

        v20 = (void *)sub_2463786C8();
        v21 = (void *)sub_24637865C();

        sub_2463786BC();
        return;
      }
    }
    else if (v16)
    {
      v19 = swift_slowAlloc();
      *(_DWORD *)v19 = 67109632;
      sub_246379064();
      *(_WORD *)(v19 + 8) = 1024;
      sub_24636C5D4();
      sub_246379064();
      *(_WORD *)(v19 + 14) = 1024;
      sub_246379064();

      _os_log_impl(&dword_24635F000, v14, v15, "🔇 Not playing waiting tone, ttsActive: %{BOOL}d, expectingConfirmation: %{BOOL}d, isReady: %{BOOL}d", (uint8_t *)v19, 0x14u);
      v18 = v19;
      goto LABEL_12;
    }

    v14 = v13;
    goto LABEL_14;
  }
}

void sub_24636FCBC(char a1)
{
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  os_log_type_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _WORD *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;

  *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestActive) = a1;
  if ((a1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v5, (uint64_t)qword_2544206D8);
    v6 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_42_0(v6))
    {
      v7 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_34_1(v7);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v2, v3, "Request is active", v4);
      OUTLINED_FUNCTION_7();
    }

    if ((*((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_readingAnnouncement) & 1) == 0)
    {
      *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriXConfirmation) = 0;
      *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriClassicConfirmation) = 0;
      *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriPommesConfirmation) = 0;
      *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_expectingSiriIEConfirmation) = 0;
      *((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_promptedForConfirmation) = 0;
    }
    OUTLINED_FUNCTION_125();
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v8, (uint64_t)qword_2544206D8);
    v9 = OUTLINED_FUNCTION_87();
    if (OUTLINED_FUNCTION_32_0(v9, v10, v11, v12, v13, v14, v15, v16, v18, v19))
    {
      v17 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v17);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v20, v1, "Request is inactive", (uint8_t *)v2);
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_59_0(v20);
  }
}

void sub_24636FE28(char a1)
{
  uint8_t *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _WORD *v12;
  const char *v13;
  uint64_t v14;
  os_log_type_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  _WORD *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;

  *(_BYTE *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_isListening) = a1;
  if ((a1 & 1) != 0)
  {
    if (qword_254420520 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v3, (uint64_t)qword_2544206D8);
    v4 = OUTLINED_FUNCTION_87();
    if (OUTLINED_FUNCTION_99(v4, v5, v6, v7, v8, v9, v10, v11, v24, v25))
    {
      v12 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_107(v12);
      v13 = "Siri is listening";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v14, (uint64_t)qword_2544206D8);
    v15 = OUTLINED_FUNCTION_87();
    if (OUTLINED_FUNCTION_99(v15, v16, v17, v18, v19, v20, v21, v22, v24, v25))
    {
      v23 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_107(v23);
      v13 = "Siri is not listening";
LABEL_10:
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v26, (os_log_type_t)v2, v13, v1);
      OUTLINED_FUNCTION_7();
    }
  }
  OUTLINED_FUNCTION_30_1(v26);
}

void sub_24636FF1C(uint64_t a1, int a2, int a3)
{
  sub_24636FF84(a2, a3);
}

void sub_24636FF84(int a1, int a2)
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;
  os_log_type_t v9;
  _WORD *v10;
  const char *v11;
  uint64_t v12;
  os_log_type_t v13;
  _WORD *v14;
  os_log_type_t v15;
  uint64_t v16;
  os_log_type_t v17;
  _WORD *v18;
  uint64_t v19;
  os_log_type_t v20;
  _WORD *v21;

  v5 = a2;
  v6 = a1;
  v7 = a2 ^ a1;
  if (((a2 ^ a1) & 8) == 0)
  {
    if ((a2 & 8) == 0)
    {
      if (!*((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive))
        goto LABEL_28;
      if (qword_254420520 != -1)
        swift_once();
      v8 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_4_0(v8, (uint64_t)qword_2544206D8);
      v9 = OUTLINED_FUNCTION_30();
      if (OUTLINED_FUNCTION_11_1(v9))
      {
        v10 = (_WORD *)OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_31_1(v10);
        v11 = "🗣️ Siri is not speaking";
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if ((*((_BYTE *)&v2->isa + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_ttsActive) & 1) != 0)
      goto LABEL_28;
    if (qword_254420520 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v16, (uint64_t)qword_2544206D8);
    v17 = OUTLINED_FUNCTION_30();
    if (!OUTLINED_FUNCTION_11_1(v17))
      goto LABEL_26;
    v18 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v18);
    v11 = "🗣️ Siri is speaking";
LABEL_25:
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v2, v3, v11, v4);
    OUTLINED_FUNCTION_7();
  }
  if ((a1 & 8) == 0)
  {
    if ((a2 & 8) == 0)
      goto LABEL_28;
    if (qword_254420520 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v12, (uint64_t)qword_2544206D8);
    v13 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_11_1(v13))
    {
      v14 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_31_1(v14);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v2, v3, "🗣️ Siri started speaking", v4);
      OUTLINED_FUNCTION_7();
    }

    v15 = OS_LOG_TYPE_INFO;
    goto LABEL_27;
  }
  if ((a2 & 8) != 0)
    goto LABEL_28;
  if (qword_254420520 != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v19, (uint64_t)qword_2544206D8);
  v20 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v20))
  {
    v21 = (_WORD *)OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_31_1(v21);
    v11 = "🗣️ Siri stopped speaking";
    goto LABEL_25;
  }
LABEL_26:

  v15 = OS_LOG_TYPE_DEFAULT;
LABEL_27:
  sub_24636F41C(v15);
LABEL_28:
  if ((v7 & 1) == 0)
    goto LABEL_34;
  if ((v6 & 1) != 0)
  {
    if ((v5 & 1) != 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  if ((v5 & 1) != 0)
LABEL_33:
    sub_24636FCBC((v6 & 1) == 0);
LABEL_34:
  if ((v7 & 4) == 0)
    return;
  if ((v6 & 4) == 0)
  {
    if ((v5 & 4) == 0)
      return;
    goto LABEL_37;
  }
  if ((v5 & 4) == 0)
LABEL_37:
    sub_24636FE28((v6 & 4) == 0);
}

uint64_t sub_246370204()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t *v2;
  uint8_t *v3;
  os_log_type_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  os_log_type_t v18;
  _WORD *v19;
  uint64_t v20;
  os_log_type_t v21;
  _WORD *v22;
  char v23;
  uint64_t inited;

  v5 = *(void **)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_requestContextData);
  if (!v5)
  {
    if (qword_254420520 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v17, (uint64_t)qword_2544206D8);
    v18 = OUTLINED_FUNCTION_67();
    if (OUTLINED_FUNCTION_38(v18))
    {
      v19 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_26_1(v19);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v1, "🗣️ RequestContextData is unavailable, assuming the request is no or supplemental dialog", v2);
      OUTLINED_FUNCTION_7();
    }
    goto LABEL_16;
  }
  v0 = v5;
  v6 = sub_246378C74();
  if (!v7)
  {
    if (qword_254420520 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v20, (uint64_t)qword_2544206D8);
    v21 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_42_0(v21))
    {
      v22 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_34_1(v22);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, (os_log_type_t)v2, "🗣️ RequestMode is unavailable, assuming the request is no or supplemental dialog", v3);
      OUTLINED_FUNCTION_7();
    }

LABEL_16:
    v23 = 0;
    return v23 & 1;
  }
  v8 = v6;
  v9 = v7;
  if (qword_254420520 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_23();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2544206D8);
  swift_bridgeObjectRetain_n();
  sub_246378E90();
  v12 = OUTLINED_FUNCTION_69_0();
  if (OUTLINED_FUNCTION_43_0(v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_10();
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v14 = OUTLINED_FUNCTION_146();
    sub_2463635B4(v14, v15, v16);
    OUTLINED_FUNCTION_135();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_36(&dword_24635F000, v11, v4, "🗣️ Response mode: %s", v13);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25756D760);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246379BC0;
  *(_QWORD *)(inited + 32) = 0x6C6E4F6563696F56;
  *(_QWORD *)(inited + 40) = 0xE900000000000079;
  strcpy((char *)(inited + 48), "VoiceForward");
  *(_BYTE *)(inited + 61) = 0;
  *(_WORD *)(inited + 62) = -5120;
  v23 = sub_24636E860(v8, v9, (_QWORD *)inited);

  swift_setDeallocating();
  sub_246372470();
  OUTLINED_FUNCTION_32();
  return v23 & 1;
}

uint64_t sub_246370518()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_246370204();
  if ((v1 & 1) != 0
    && (*(_BYTE *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_audioSessionConfigured) & 1) == 0)
  {
    return (uint64_t)sub_24637054C(v1);
  }
  else
  {
    return 1;
  }
}

id sub_24637054C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  os_log_t v11;
  os_log_type_t v12;
  const char *v13;
  uint8_t *v14;
  id v15;
  uint64_t v17;

  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_serviceHelper))
    return 0;
  v2 = (uint64_t)OUTLINED_FUNCTION_121(a1, sel_respondsToSelector_);
  if ((v2 & 1) == 0)
    return 0;
  v3 = OUTLINED_FUNCTION_121(v2, sel_audioSessionID);
  if (!(_DWORD)v3)
    return 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_retrieveSessionWithID_, v3);
  if (qword_254420520 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_23();
  v6 = OUTLINED_FUNCTION_85(v5, (uint64_t)qword_2544206D8);
  sub_246378E90();
  v7 = OUTLINED_FUNCTION_69_0();
  if (OUTLINED_FUNCTION_9_0(v7))
  {
    v8 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_78((float *)v8, 1.5047e-36);
    v9 = OUTLINED_FUNCTION_55_0();
    *(_WORD *)(v8 + 8) = 1024;
    OUTLINED_FUNCTION_121(v9, sel_isActive);
    sub_246379064();

    OUTLINED_FUNCTION_101();
    _os_log_impl(v10, v11, v12, v13, v14, 0xEu);
    OUTLINED_FUNCTION_7();
  }

  v15 = OUTLINED_FUNCTION_121(v17, sel_isActive);
  return v15;
}

void sub_2463706CC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v25 = a1;
  v4 = sub_246378EB4();
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_246378EE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  v12 = (void *)objc_opt_self();
  v24 = a3;
  v13 = objc_msgSend(v12, sel_currentQueue);
  v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_2463723B0(),
        v15 = v25,
        v16 = v14,
        v17 = sub_246379040(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    v18 = v24;
    v19 = *(void **)&v24[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
    if (v19)
    {
      v20 = v19;
      v25 = (id)sub_2463786C8();

      AFIsInternalInstall();
      sub_246378668();

      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_246372720;
    *(_QWORD *)(v21 + 24) = v11;
    aBlock[4] = sub_246372878;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_79;
    v22 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v26 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v10, v6, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    swift_release();
    swift_release();
  }
}

uint64_t sub_246370A08(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v24 = a1;
  v4 = sub_246378EB4();
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_246378EE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  v12 = (void *)objc_opt_self();
  v23 = a3;
  v13 = objc_msgSend(v12, sel_currentQueue);
  v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_2463723B0(),
        v15 = v24,
        v16 = v14,
        v17 = sub_246379040(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    v18 = v23;
    sub_24636A944();

    return swift_release();
  }
  else
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_2463726F4;
    *(_QWORD *)(v20 + 24) = v11;
    aBlock[4] = sub_246372878;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_49;
    v21 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v25 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v10, v6, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    swift_release();
    return swift_release();
  }
}

void sub_246370CEC(void *a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v27 = a1;
  v6 = sub_246378EB4();
  v25 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_246378EE4();
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_DWORD *)(v12 + 24) = a4;
  v13 = (void *)objc_opt_self();
  v26 = a3;
  v14 = objc_msgSend(v13, sel_currentQueue);
  v15 = objc_msgSend(v14, sel_underlyingQueue);

  if (v15
    && (sub_2463723B0(),
        v16 = v27,
        v17 = v15,
        v18 = sub_246379040(),
        v17,
        v17,
        v16,
        (v18 & 1) != 0))
  {
    v19 = v26;
    v20 = (void *)sub_2463786C8();
    v27 = (id)sub_24637865C();

    sub_2463786A4();
    swift_release();

  }
  else
  {
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_2463726C8;
    *(_QWORD *)(v21 + 24) = v12;
    aBlock[4] = sub_246372878;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_39;
    v22 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v28 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v11, v8, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);

    swift_release();
    swift_release();
  }
}

uint64_t sub_246370FFC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v24 = a1;
  v4 = sub_246378EB4();
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_246378EE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  v12 = (void *)objc_opt_self();
  v23 = a3;
  v13 = objc_msgSend(v12, sel_currentQueue);
  v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_2463723B0(),
        v15 = v24,
        v16 = v14,
        v17 = sub_246379040(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    v18 = v23;
    sub_2463786E0();

    return swift_release();
  }
  else
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_246372704;
    *(_QWORD *)(v20 + 24) = v11;
    aBlock[4] = sub_246372878;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_69;
    v21 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v25 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v10, v6, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    swift_release();
    return swift_release();
  }
}

void sub_2463712DC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v24 = a1;
  v4 = sub_246378EB4();
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_246378EE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  v12 = (void *)objc_opt_self();
  v23 = a3;
  v13 = objc_msgSend(v12, sel_currentQueue);
  v14 = objc_msgSend(v13, sel_underlyingQueue);

  if (v14
    && (sub_2463723B0(),
        v15 = v24,
        v16 = v14,
        v17 = sub_246379040(),
        v16,
        v16,
        v15,
        (v17 & 1) != 0))
  {
    v18 = v23;
    v19 = *(void **)&v23[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_hgManager];
    if (v19)
    {
      v24 = v19;
      sub_2463786D4();

      swift_release();
    }
    else
    {

      swift_release();
    }
  }
  else
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_2463726FC;
    *(_QWORD *)(v20 + 24) = v11;
    aBlock[4] = sub_246372878;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_59;
    v21 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v25 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v10, v6, v21);
    _Block_release(v21);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    swift_release();
    swift_release();
  }
}

void sub_246371614(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v28 = a1;
  v6 = sub_246378EB4();
  v26 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_246378EE4();
  v9 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  v13 = (void *)objc_opt_self();
  v27 = a3;
  v14 = a4;
  v15 = objc_msgSend(v13, sel_currentQueue);
  v16 = objc_msgSend(v15, sel_underlyingQueue);

  if (v16
    && (sub_2463723B0(),
        v17 = v28,
        v18 = v16,
        v19 = sub_246379040(),
        v18,
        v18,
        v17,
        (v19 & 1) != 0))
  {
    v20 = v14;
    v21 = v27;
    sub_246368FD4((uint64_t)v14);

  }
  else
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = sub_246372374;
    *(_QWORD *)(v22 + 24) = v12;
    aBlock[4] = sub_24637237C;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor;
    v23 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v29 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v11, v8, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v25);

    swift_release();
  }
  swift_release();

}

void sub_2463718F0(void *a1, uint64_t a2, char a3, void *a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v29 = a1;
  v8 = sub_246378EB4();
  v26 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_246378EE4();
  v11 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = a5;
  v15 = (void *)objc_opt_self();
  v27 = a4;
  v28 = a5;
  v16 = objc_msgSend(v15, sel_currentQueue);
  v17 = objc_msgSend(v16, sel_underlyingQueue);

  if (v17
    && (sub_2463723B0(),
        v18 = v29,
        v19 = v17,
        v20 = sub_246379040(),
        v19,
        v19,
        v18,
        (v20 & 1) != 0))
  {
    v22 = v27;
    v21 = v28;
    sub_24636F974(a3 & 1, (uint64_t)v27, v28);

    swift_release();
  }
  else
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_2463724CC;
    *(_QWORD *)(v23 + 24) = v14;
    aBlock[4] = sub_246372878;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246371E40;
    aBlock[3] = &block_descriptor_21;
    v24 = _Block_copy(aBlock);
    swift_retain();
    sub_246378EC0();
    v30 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v13, v10, v24);
    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);

    swift_release();
    swift_release();
    v21 = v28;
  }

}

void sub_246371BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  void (*v5)(void);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void (*v16)(void);
  id v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];

  OUTLINED_FUNCTION_39_0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  sub_246378EB4();
  OUTLINED_FUNCTION_117();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36_1();
  v8 = sub_246378EE4();
  v22 = *(_QWORD *)(v8 - 8);
  v23 = v8;
  OUTLINED_FUNCTION_13_1();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(), sel_currentQueue);
  v12 = objc_msgSend(v11, sel_underlyingQueue);

  if (!v12)
    goto LABEL_4;
  sub_2463723B0();
  v13 = v7;
  v21 = v1;
  v14 = v13;
  v15 = v3;
  v16 = v5;
  v17 = v12;
  v18 = sub_246379040();

  v5 = v16;
  v3 = v15;

  v1 = v21;
  if ((v18 & 1) != 0)
  {
    v5();
  }
  else
  {
LABEL_4:
    v19 = OUTLINED_FUNCTION_147();
    *(_QWORD *)(v19 + 16) = v5;
    *(_QWORD *)(v19 + 24) = v3;
    v25[4] = sub_246372878;
    v25[5] = v19;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 1107296256;
    v25[2] = sub_246371E40;
    v25[3] = &block_descriptor_11;
    v20 = _Block_copy(v25);
    swift_retain();
    sub_246378EC0();
    v24 = MEMORY[0x24BEE4AF8];
    sub_24637279C(&qword_254420540, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254420558);
    sub_2463727D8(&qword_254420560, &qword_254420558);
    sub_2463790A0();
    MEMORY[0x249558304](0, v10, v0, v20);
    _Block_release(v20);
    OUTLINED_FUNCTION_91(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v23);
    swift_release();
  }
  OUTLINED_FUNCTION_18();
}

uint64_t sub_246371E40(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_246371E6C(void *a1)
{
  os_log_type_t v1;
  char *v2;
  void *v4;
  char *v5;
  uint64_t v6;
  os_log_type_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  _WORD *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;

  if (a1)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureQueue];
    v5 = v2;
    sub_246371614(v4, (uint64_t)v5, v5, a1);
  }
  else
  {
    if (qword_254420520 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_4_0(v6, (uint64_t)qword_2544206D8);
    v7 = OUTLINED_FUNCTION_87();
    if (OUTLINED_FUNCTION_32_0(v7, v8, v9, v10, v11, v12, v13, v14, v16, v17))
    {
      v15 = (_WORD *)OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_56_0(v15);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v18, v1, "🗣️ RequestContextData is nil", (uint8_t *)v2);
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_59_0(v18);
  }
}

void sub_246371F44(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  sub_246368FD4((uint64_t)a2);
}

void sub_246371F70()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_246371FA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_131();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t OUTLINED_FUNCTION_131()
{
  return type metadata accessor for GestureController();
}

uint64_t type metadata accessor for GestureController()
{
  uint64_t result;

  result = qword_2544203D8;
  if (!qword_2544203D8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246372108()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_246372270(319, &qword_254420508, (void (*)(uint64_t))type metadata accessor for GestureMapping);
  if (v0 <= 0x3F)
  {
    type metadata accessor for EventDeduper(319);
    if (v1 <= 0x3F)
    {
      sub_246372270(319, (unint64_t *)&qword_2544203C0, (void (*)(uint64_t))MEMORY[0x24BE9AE28]);
      if (v2 <= 0x3F)
      {
        sub_246372270(319, &qword_2544203B8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

void sub_246372270(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_246379058();
    if (!v5)
      atomic_store(v4, a2);
  }
}

id sub_2463722BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  id v11;

  v6 = v5;
  if (a2)
  {
    v10 = (void *)sub_246378F50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v6, sel_initWithName_options_queue_delegate_, v10, a3, a4, a5);

  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_24637234C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_98();

  return swift_deallocObject();
}

void sub_246372374()
{
  uint64_t v0;

  sub_246371F44(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24637237C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_16();
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

unint64_t sub_2463723B0()
{
  unint64_t result;

  result = qword_254420458;
  if (!qword_254420458)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254420458);
  }
  return result;
}

uint64_t sub_2463723EC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_246367A70(0, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

uint64_t sub_246372434(uint64_t result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if (result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_246367A70(v2 > 1, result + 1, 1, *v1);
    *v1 = result;
  }
  return result;
}

uint64_t sub_246372470()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_2463724A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2463724CC()
{
  uint64_t v0;

  sub_24636F974(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2463724D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2463724FC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246372520(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_246372564()
{
  sub_24636CD5C();
}

uint64_t sub_24637257C(uint64_t a1)
{
  uint64_t v1;

  return sub_24636CB7C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_246372584(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GestureMapping(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463725C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_38_1();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  OUTLINED_FUNCTION_98();
  v4 = v0 + v3;
  v5 = OUTLINED_FUNCTION_5_0();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v4 + *(int *)(v1 + 20), v5);
  return swift_deallocObject();
}

void sub_246372660()
{
  OUTLINED_FUNCTION_38_1();
  sub_24636AFCC();
}

uint64_t sub_2463726A8()
{
  OUTLINED_FUNCTION_98();
  return swift_deallocObject();
}

void sub_2463726C8()
{
  sub_24636AF80();
}

uint64_t sub_2463726D4()
{
  OUTLINED_FUNCTION_98();
  return swift_deallocObject();
}

void sub_2463726F4()
{
  sub_24636A944();
}

void sub_2463726FC()
{
  uint64_t v0;

  sub_24636A390(*(_QWORD *)(v0 + 16));
}

void sub_246372704()
{
  sub_2463786E0();
  OUTLINED_FUNCTION_16();
}

void sub_246372720()
{
  uint64_t v0;

  sub_2463697E4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_246372728(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void sub_24637274C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_92(v2);
  OUTLINED_FUNCTION_16();
}

void sub_246372774(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_92(v2);
  OUTLINED_FUNCTION_16();
}

void sub_24637279C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24955879C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_16();
}

void sub_2463727D8(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24955879C](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_246378E90();
}

BOOL OUTLINED_FUNCTION_9_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_11_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_18_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_19_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_246378FD4();
}

uint64_t OUTLINED_FUNCTION_24_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_246379064();
}

_WORD *OUTLINED_FUNCTION_26_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return type metadata accessor for GestureMapping(0);
}

BOOL OUTLINED_FUNCTION_29_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

void OUTLINED_FUNCTION_30_1(id a1)
{

}

_WORD *OUTLINED_FUNCTION_31_1(_WORD *result)
{
  *result = 0;
  return result;
}

BOOL OUTLINED_FUNCTION_32_0(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return sub_246379064();
}

_WORD *OUTLINED_FUNCTION_34_1(_WORD *result)
{
  *result = 0;
  return result;
}

_WORD *OUTLINED_FUNCTION_35_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return 0;
}

void OUTLINED_FUNCTION_37_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return type metadata accessor for GestureMapping(0);
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void OUTLINED_FUNCTION_40_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_2463638CC(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return sub_246378E90();
}

BOOL OUTLINED_FUNCTION_45_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_46_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_47_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 152) = a1;
  return sub_246379064();
}

void OUTLINED_FUNCTION_49_0()
{
  sub_24636EAD0(0);
}

uint64_t OUTLINED_FUNCTION_50_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_53_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_246379064();
}

_WORD *OUTLINED_FUNCTION_56_0(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_57_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_2463785C0();
}

void OUTLINED_FUNCTION_59_0(id a1)
{

}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return sub_246378E90();
}

uint64_t OUTLINED_FUNCTION_65_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_2463635B4(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_246378FE0();
}

uint64_t OUTLINED_FUNCTION_68@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return sub_246378FC8();
}

void OUTLINED_FUNCTION_72_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246372774(v2 - 168, a2);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

float *OUTLINED_FUNCTION_78(float *result, float a2)
{
  *result = a2;
  return result;
}

void OUTLINED_FUNCTION_79(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_82(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  float *v12;

  *v12 = a1;
  return sub_24636673C(a12);
}

uint64_t OUTLINED_FUNCTION_83(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

id OUTLINED_FUNCTION_85(uint64_t a1, uint64_t a2)
{
  void *v2;

  __swift_project_value_buffer(a1, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_246378FD4();
}

id OUTLINED_FUNCTION_88(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_89(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246372774(v2, a2);
}

uint64_t OUTLINED_FUNCTION_90(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_246366030();
}

uint64_t OUTLINED_FUNCTION_91@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_92(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_94()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_95()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_96()
{
  uint64_t v0;

  return sub_246372520(v0 - 168, v0 - 232);
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_246378E90();
}

void OUTLINED_FUNCTION_98()
{
  uint64_t v0;

}

BOOL OUTLINED_FUNCTION_99(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t OUTLINED_FUNCTION_100()
{
  return sub_246378BC0();
}

uint64_t OUTLINED_FUNCTION_104(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

BOOL OUTLINED_FUNCTION_105(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_106()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

_WORD *OUTLINED_FUNCTION_107(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_108(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_109()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_2463654E8(v2, v0 + *(int *)(v1 + 20));
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_111@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_112(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_24637274C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_114()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463682B4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_115()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void OUTLINED_FUNCTION_116(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + a1) = 0;
  sub_24636EAD0(0);
}

void OUTLINED_FUNCTION_118()
{
  void *v0;

}

void OUTLINED_FUNCTION_120()
{
  void *v0;

}

id OUTLINED_FUNCTION_121(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_123(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_130()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_132(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x1Au);
}

uint64_t OUTLINED_FUNCTION_133(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return v1 - 136;
}

void OUTLINED_FUNCTION_134(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_246363684(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_135()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_139()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_141(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_142(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_143()
{
  return sub_246378BF0();
}

uint64_t OUTLINED_FUNCTION_144@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_145()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_146()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void OUTLINED_FUNCTION_149(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246372774(v2 - 128, a2);
}

unint64_t OUTLINED_FUNCTION_150()
{
  return 0xD000000000000023;
}

void OUTLINED_FUNCTION_151(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_24637274C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_152()
{
  return sub_246378E90();
}

uint64_t OUTLINED_FUNCTION_153(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2463635B4(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_155()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

void OUTLINED_FUNCTION_157(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_246363684(v3, a2, a3);
}

uint64_t OUTLINED_FUNCTION_158()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_160()
{
  return sub_246378D88();
}

uint64_t OUTLINED_FUNCTION_162()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463654E8(v1, v0);
}

void OUTLINED_FUNCTION_163()
{
  JUMPOUT(0x24955888CLL);
}

uint64_t OUTLINED_FUNCTION_164()
{
  return sub_246378740();
}

uint64_t OUTLINED_FUNCTION_165()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_166()
{
  return swift_endAccess();
}

uint64_t sub_246372FC0(__int128 *a1, uint64_t a2)
{
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;

  v4 = v2;
  v7 = sub_24637862C();
  OUTLINED_FUNCTION_19_2(v7);
  v8 = (_QWORD *)(v2 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentAssistantId);
  *v8 = 0;
  v8[1] = 0;
  v9 = (v2 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId);
  v10 = sub_246378D88();
  OUTLINED_FUNCTION_19_2(v10);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRC) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingIFGestureCandidate) = 0;
  if (qword_254420428 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v11, (uint64_t)qword_254420630);
  v12 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_WORD *)v13 = 0;
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v9, v3, "Initializing gesture output submitter", v13);
    OUTLINED_FUNCTION_7();
  }

  sub_2463636B0(a1, v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper) = a2;
  return v4;
}

void sub_2463730F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  type metadata accessor for GestureResponse(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_25_1();
  if (qword_254420428 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_23();
  __swift_project_value_buffer(v4, (uint64_t)qword_254420630);
  sub_2463758A4(a1, v1);
  v5 = sub_246378E90();
  v6 = sub_246378FD4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_10();
    v10 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v7 = 136315138;
    v8 = sub_2463662A8();
    sub_2463635B4(v8, v9, &v10);
    sub_246379064();
    swift_bridgeObjectRelease();
    sub_2463758E8(v1);
    OUTLINED_FUNCTION_36(&dword_24635F000, v5, v6, "Gesture response received: %s", v7);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }
  sub_2463758E8(v1);

  sub_2463734B0();
  OUTLINED_FUNCTION_18();
}

void sub_24637327C()
{
  os_log_type_t v0;
  uint64_t v1;
  os_log_type_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;

  if (qword_254420428 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_23();
  v12 = OUTLINED_FUNCTION_4_0(v1, (uint64_t)qword_254420630);
  v2 = sub_246378FE0();
  if (OUTLINED_FUNCTION_32_0(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_WORD *)v10 = 0;
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v13, v0, "‼️ Gesture controller error", v10);
    OUTLINED_FUNCTION_7();
  }

}

#error "246373468: call analysis failed (funcsize=91)"

void sub_2463734B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_30_2();
  v1 = v0;
  v2 = *v0;
  if (qword_254420428 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_23();
  v4 = OUTLINED_FUNCTION_4_0(v3, (uint64_t)qword_254420630);
  v5 = sub_246378FD4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_10();
    *(_DWORD *)v6 = 136315138;
    v7 = sub_246365040(v2);
    OUTLINED_FUNCTION_65_0(v7, v8, v9, v10, v11);
    OUTLINED_FUNCTION_51();
    sub_246379064();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v4, v5, "🫡 Handling user intent: %s", v6);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 == 4)
    {
      sub_2463736C8();
    }
    else
    {
      v12 = sub_246378E90();
      v13 = sub_246378FE0();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_10();
        *(_DWORD *)v14 = 136315138;
        v15 = sub_246365040(v2);
        OUTLINED_FUNCTION_65_0(v15, v16, v17, v18, v19);
        OUTLINED_FUNCTION_51();
        sub_246379064();
        OUTLINED_FUNCTION_8_0();
        OUTLINED_FUNCTION_36(&dword_24635F000, v12, v13, "‼️ Unsupported user intent: %s", v14);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

    }
  }
  else
  {
    sub_2463737BC(v1);
  }
  OUTLINED_FUNCTION_13();
}

id sub_2463736C8()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  id result;

  if (qword_254420428 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4_0(v1, (uint64_t)qword_254420630);
  v2 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v0, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_10();
    *(_WORD *)v3 = 0;
    OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, v2, "🙅‍♀️ Dismissing Siri", v3);
    OUTLINED_FUNCTION_7();
  }

  v4 = *(Class *)((char *)&v0->isa + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper);
  result = objc_msgSend(v4, sel_respondsToSelector_, sel_deactivateCurrentAnnouncementRequestForReason_);
  if ((result & 1) != 0)
    return objc_msgSend(v4, sel_deactivateCurrentAnnouncementRequestForReason_, 20);
  return result;
}

void sub_2463737BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint8_t *v18;
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
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  int EnumTagSinglePayload;
  uint8_t *v63;
  uint64_t v64;
  os_log_type_t v65;
  BOOL v66;
  void *v67;
  _WORD *v68;
  uint64_t v69;
  int v70;
  void *v71;
  os_log_type_t v72;
  _WORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, NSObject *);
  id v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  os_log_type_t v98;
  _WORD *v99;
  const char *v100;
  os_log_type_t v101;
  _WORD *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  unint64_t v112;
  id v113;
  uint8_t *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129[2];

  v3 = v1;
  v5 = sub_246378C5C();
  v120 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_48();
  v115 = v6;
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D840);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_48();
  v121 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A0);
  OUTLINED_FUNCTION_9();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v116 = (uint64_t)&v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v122 = (uint64_t)&v104 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v128 = ((char *)&v104 - v14);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_11();
  v18 = (uint8_t *)(v17 - v16);
  v19 = sub_246378BF0();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_25_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D848);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_11();
  v24 = v23 - v22;
  v25 = sub_246378C50();
  v126 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_11();
  v28 = v27 - v26;
  v125 = a1;
  v127 = *a1;
  if ((unint64_t)(v127 - 1) >= 2)
  {
    if (qword_254420428 != -1)
      swift_once();
    v50 = OUTLINED_FUNCTION_23();
    v128 = OUTLINED_FUNCTION_4_0(v50, (uint64_t)qword_254420630);
    v51 = sub_246378FE0();
    if (os_log_type_enabled(v128, v51))
    {
      v52 = (uint8_t *)OUTLINED_FUNCTION_10();
      v129[0] = OUTLINED_FUNCTION_10();
      *(_DWORD *)v52 = 136315138;
      v53 = sub_246365040(v127);
      v55 = sub_2463635B4(v53, v54, v129);
      OUTLINED_FUNCTION_48_0(v55);
      sub_246379064();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36(&dword_24635F000, v128, v51, "‼️ Can't produce payload for unsupported user intent: %s", v52);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }

  }
  else
  {
    v114 = v18;
    v106 = v5;
    v109 = v2;
    v107 = v20;
    v118 = v19;
    sub_246378638();
    sub_246375744();
    v29 = sub_24637431C();
    v30 = (void *)objc_opt_self();
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
    v32 = objc_msgSend(v30, sel_runSiriKitExecutorCommandWithContext_payload_, v31, v29);
    v123 = v3;
    v33 = v32;

    v113 = v33;
    v34 = v33;
    v35 = v123;
    v36 = objc_msgSend(v30, sel_wrapCommandInStartLocalRequest_, v34);
    v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09288]), sel_init);
    objc_msgSend(v37, sel_setActivationEvent_, 10);
    v124 = v37;
    objc_msgSend(v37, sel_setStartLocalRequest_, v36);
    v38 = *(void **)(v35 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_serviceHelper);
    if ((objc_msgSend(v38, sel_respondsToSelector_, sel_submitExternalActivationRequest_completion_) & 1) != 0)
      objc_msgSend(v38, sel_submitExternalActivationRequest_completion_, v124, 0);
    v39 = v36;
    v110 = sub_246375780(v39);
    if (v40)
    {
      v41 = v40;
      v111 = v39;
      v117 = v29;
      if (qword_254420428 != -1)
        swift_once();
      v42 = OUTLINED_FUNCTION_23();
      v43 = __swift_project_value_buffer(v42, (uint64_t)qword_254420630);
      OUTLINED_FUNCTION_35_2();
      v108 = v43;
      v44 = sub_246378E90();
      v45 = sub_246378FD4();
      v46 = os_log_type_enabled(v44, v45);
      v105 = v42;
      v112 = v41;
      if (v46)
      {
        v47 = OUTLINED_FUNCTION_10();
        v104 = v25;
        v48 = (uint8_t *)v47;
        v129[0] = OUTLINED_FUNCTION_10();
        *(_DWORD *)v48 = 136315138;
        swift_bridgeObjectRetain();
        v49 = sub_2463635B4(v110, v41, v129);
        OUTLINED_FUNCTION_48_0(v49);
        sub_246379064();
        OUTLINED_FUNCTION_45_1();
        OUTLINED_FUNCTION_36(&dword_24635F000, v44, v45, "Gesture requestId: %s", v48);
        OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_7();
      }

      v56 = OUTLINED_FUNCTION_36_2();
      v57 = v117;
      v58 = v118;
      v59 = v128;
      v60 = v125;
      MEMORY[0x24BDAC7A8](v56);
      v61 = v127;
      *(&v104 - 2) = (uint64_t)v60;
      *(&v104 - 1) = v61;
      sub_246378C20();
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v24, 1, v25);
      v63 = v114;
      if (EnumTagSinglePayload == 1)
      {
        v64 = swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_32_1(v64, &qword_25756D848);
        OUTLINED_FUNCTION_37_2();
        v65 = OUTLINED_FUNCTION_67();
        v66 = OUTLINED_FUNCTION_38(v65);
        v67 = v124;
        if (v66)
        {
          v68 = (_WORD *)OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_26_1(v68);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v59, (os_log_type_t)v60, "‼️ Unable to create gestureInput.", v63);
          OUTLINED_FUNCTION_7();
        }

        OUTLINED_FUNCTION_21_1();
        OUTLINED_FUNCTION_22_1();
        goto LABEL_49;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v126 + 32))(v28, v24, v25);
      v69 = type metadata accessor for GestureResponse(0);
      sub_246375860((uint64_t)v60 + *(int *)(v69 + 28), (uint64_t)v63, (uint64_t *)&unk_2544200E0);
      v70 = __swift_getEnumTagSinglePayload((uint64_t)v63, 1, v58);
      v71 = v124;
      if (v70 == 1)
      {
        swift_bridgeObjectRelease();
        sub_246375924((uint64_t)v63, (uint64_t *)&unk_2544200E0);
        OUTLINED_FUNCTION_37_2();
        v72 = OUTLINED_FUNCTION_67();
        if (OUTLINED_FUNCTION_38(v72))
        {
          v73 = (_WORD *)OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_26_1(v73);
          OUTLINED_FUNCTION_5_1(&dword_24635F000, v59, (os_log_type_t)v60, "‼️ Unable to find promptInfo associated with the gesture input.", v63);
          OUTLINED_FUNCTION_7();
        }
        OUTLINED_FUNCTION_31_2();

        goto LABEL_48;
      }
      (*(void (**)(uint64_t, uint8_t *, uint64_t))(v107 + 32))(v109, v63, v58);
      sub_246378BA8();
      v74 = v120;
      v75 = v122;
      v76 = (uint64_t)v59;
      v77 = v106;
      (*(void (**)(uint64_t, _QWORD, NSObject *))(v120 + 104))(v122, *MEMORY[0x24BE9AFF8], v106);
      __swift_storeEnumTagSinglePayload(v75, 0, 1, (uint64_t)v77);
      v78 = v121;
      v79 = v121 + *(int *)(v119 + 48);
      sub_246375860(v76, v121, &qword_25756D7A0);
      sub_246375860(v75, v79, &qword_25756D7A0);
      OUTLINED_FUNCTION_28_1(v78);
      if (v87)
      {
        OUTLINED_FUNCTION_18_2(v75);
        OUTLINED_FUNCTION_18_2(v76);
        v80 = OUTLINED_FUNCTION_28_1(v79);
        v81 = v117;
        v82 = v118;
        if (v87)
        {
          v83 = OUTLINED_FUNCTION_32_1(v80, &qword_25756D7A0);
          v84 = v124;
          goto LABEL_32;
        }
      }
      else
      {
        v86 = v116;
        sub_246375860(v78, v116, &qword_25756D7A0);
        OUTLINED_FUNCTION_28_1(v79);
        if (!v87)
        {
          v88 = v115;
          (*(void (**)(uint64_t, uint64_t, NSObject *))(v74 + 32))(v115, v79, v77);
          sub_246375820();
          v89 = sub_246378F44();
          v90 = v74;
          v91 = v78;
          v92 = *(void (**)(uint64_t, NSObject *))(v90 + 8);
          v92(v88, v77);
          OUTLINED_FUNCTION_18_2(v122);
          OUTLINED_FUNCTION_18_2((uint64_t)v128);
          v92(v86, v77);
          v83 = OUTLINED_FUNCTION_18_2(v91);
          v81 = v117;
          v82 = v118;
          v84 = v124;
          if ((v89 & 1) != 0)
          {
LABEL_32:
            MEMORY[0x24BDAC7A8](v83);
            OUTLINED_FUNCTION_6_0();
            v93 = objc_allocWithZone((Class)sub_246378A04());
            v94 = sub_246378998();
            OUTLINED_FUNCTION_8_0();
            if (v94)
            {

              OUTLINED_FUNCTION_21_1();
              OUTLINED_FUNCTION_22_1();
              v95 = OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingIFGestureCandidate;
LABEL_36:
              v97 = *(void **)(v35 + v95);
              *(_QWORD *)(v35 + v95) = v94;

LABEL_47:
              (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v109, v82);
LABEL_48:
              (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v28, v25);
LABEL_49:
              OUTLINED_FUNCTION_18();
              return;
            }
            if (qword_254420100 != -1)
              swift_once();
            OUTLINED_FUNCTION_4_0(v105, (uint64_t)qword_254420618);
            v101 = OUTLINED_FUNCTION_67();
            if (OUTLINED_FUNCTION_38(v101))
            {
              v102 = (_WORD *)OUTLINED_FUNCTION_10();
              OUTLINED_FUNCTION_26_1(v102);
              v100 = "IFGestureBasedCandidateMessage could not be created.";
LABEL_45:
              OUTLINED_FUNCTION_5_1(&dword_24635F000, v77, OS_LOG_TYPE_DEFAULT, v100, (uint8_t *)&v104);
              OUTLINED_FUNCTION_7();
            }
            goto LABEL_46;
          }
LABEL_34:
          MEMORY[0x24BDAC7A8](v83);
          OUTLINED_FUNCTION_6_0();
          v96 = objc_allocWithZone((Class)sub_246378AA0());
          v94 = sub_246378A34();
          OUTLINED_FUNCTION_8_0();
          if (v94)
          {

            OUTLINED_FUNCTION_21_1();
            OUTLINED_FUNCTION_22_1();
            v95 = OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRC;
            goto LABEL_36;
          }
          if (qword_254420100 != -1)
            swift_once();
          OUTLINED_FUNCTION_4_0(v105, (uint64_t)qword_254420618);
          v98 = OUTLINED_FUNCTION_67();
          if (OUTLINED_FUNCTION_38(v98))
          {
            v99 = (_WORD *)OUTLINED_FUNCTION_10();
            OUTLINED_FUNCTION_26_1(v99);
            v100 = "GestureBasedResultCandidateMessage could not be created.";
            goto LABEL_45;
          }
LABEL_46:
          OUTLINED_FUNCTION_31_2();

          goto LABEL_47;
        }
        sub_246375924(v122, &qword_25756D7A0);
        sub_246375924((uint64_t)v128, &qword_25756D7A0);
        v80 = (*(uint64_t (**)(uint64_t, NSObject *))(v74 + 8))(v86, v77);
        v81 = v117;
        v82 = v118;
      }
      v83 = OUTLINED_FUNCTION_32_1(v80, &qword_25756D840);
      v84 = v124;
      goto LABEL_34;
    }
    __break(1u);
  }
}

id sub_24637431C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_246378F50();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_24637438C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D868);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_25756D870);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a2 + *(int *)(type metadata accessor for GestureResponse(0) + 24);
  v12 = sub_246378C14();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  MEMORY[0x249557F2C](v10);
  if (a3 == 2)
  {
    v13 = (unsigned int *)MEMORY[0x24BE9B020];
  }
  else if (a3 == 1)
  {
    v13 = (unsigned int *)MEMORY[0x24BE9B018];
  }
  else
  {
    v13 = (unsigned int *)MEMORY[0x24BE9B028];
  }
  v14 = *v13;
  v15 = sub_246378C68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v7, v14, v15);
  sub_246378C68();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v15);
  sub_246378C38();
  sub_246366AB0();
  return sub_246378C44();
}

uint64_t sub_24637450C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a5;
  v35 = a6;
  v32[1] = a4;
  v32[2] = a3;
  v32[0] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254420530);
  MEMORY[0x24BDAC7A8](v9);
  v33 = (uint64_t)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D848);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24637862C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25756D830);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *MEMORY[0x24BE9AD88];
  v25 = sub_246378B54();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  sub_2463789C8();
  v26 = v32[0];
  swift_bridgeObjectRetain();
  sub_2463789BC();
  v27 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
  swift_beginAccess();
  sub_246375860(v27, (uint64_t)v20, &qword_2544203B0);
  sub_2463789F8();
  swift_bridgeObjectRetain();
  sub_2463789EC();
  sub_246378620();
  sub_246378614();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_2463789A4();
  v28 = sub_246378C50();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v13, v34, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v28);
  sub_2463789E0();
  v29 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
  swift_beginAccess();
  sub_246375860(v29, v33, (uint64_t *)&unk_254420530);
  sub_2463789D4();
  v30 = sub_246378BF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v8, v35, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v30);
  return sub_2463789B0();
}

uint64_t sub_24637488C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a5;
  v35 = a6;
  v32[1] = a4;
  v32[2] = a3;
  v32[0] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254420530);
  MEMORY[0x24BDAC7A8](v9);
  v33 = (uint64_t)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D848);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24637862C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25756D830);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *MEMORY[0x24BE9AD88];
  v25 = sub_246378B54();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  MEMORY[0x249557D64](v23);
  v26 = v32[0];
  swift_bridgeObjectRetain();
  sub_246378A58();
  v27 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId;
  swift_beginAccess();
  sub_246375860(v27, (uint64_t)v20, &qword_2544203B0);
  sub_246378A94();
  swift_bridgeObjectRetain();
  sub_246378A88();
  sub_246378620();
  sub_246378614();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_246378A40();
  v28 = sub_246378C50();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v13, v34, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v28);
  sub_246378A7C();
  v29 = v26 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId;
  swift_beginAccess();
  sub_246375860(v29, v33, (uint64_t *)&unk_254420530);
  sub_246378A70();
  v30 = sub_246378BF0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v8, v35, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v30);
  return sub_246378A4C();
}

void sub_246374C0C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246374C90(a1, a2, (int)&OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRC, (int)"Gesture activation request has begun, posting gesture RC", (int)sub_246374C30, (int)"No pending gesture response to post", a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_246374C30()
{
  uint64_t v0;
  void *v1;

  sub_246374C68();
  sub_246375018();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRC);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingGestureRC) = 0;

}

void sub_246374C6C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246374C90(a1, a2, (int)&OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingIFGestureCandidate, (int)"Gesture activation request has begun, posting gesture candidate for planner", (int)sub_246374FF4, (int)"No pending gesture response to post for planner", a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_246374C90(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  unint64_t v28;
  const char *v29;
  void (*v30);
  const char *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  void (*v35);
  const char *v36;
  unint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  char v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  os_log_type_t v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  uint8_t *v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  _WORD *v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  NSObject *v113;
  NSObject *v114;
  id v115;
  NSObject *v116;
  id v117;
  uint64_t v118[11];
  uint64_t v119;
  uint64_t v120;

  OUTLINED_FUNCTION_30_2();
  v119 = v26;
  v120 = v32;
  v34 = *(void **)(v25 + *v33);
  if (v34)
  {
    v35 = v30;
    v36 = v29;
    v37 = v28;
    v38 = v27;
    v112 = v34;
    v39 = sub_246378B24();
    v41 = v40;
    OUTLINED_FUNCTION_13_2(v39, v40, v42, v43, v44, v45, v46, v47, v108, v112);
    if ((uint8_t *)v39 == v38 && v41 == v37)
    {
      OUTLINED_FUNCTION_8_0();
    }
    else
    {
      v49 = sub_24637910C();
      swift_bridgeObjectRelease();
      if ((v49 & 1) == 0)
      {
        if (qword_254420428 != -1)
          swift_once();
        v50 = OUTLINED_FUNCTION_23();
        v51 = (void *)__swift_project_value_buffer(v50, (uint64_t)qword_254420630);
        v52 = v113;
        OUTLINED_FUNCTION_35_2();
        v114 = v52;
        sub_246378E90();
        v53 = OUTLINED_FUNCTION_69_0();
        if (OUTLINED_FUNCTION_11_1(v53))
        {
          v54 = OUTLINED_FUNCTION_10();
          v118[0] = OUTLINED_FUNCTION_10();
          *(_DWORD *)v54 = 136315394;
          swift_bridgeObjectRetain();
          sub_2463635B4((uint64_t)v38, v37, v118);
          sub_246379064();
          OUTLINED_FUNCTION_45_1();
          *(_WORD *)(v54 + 12) = 2080;
          v55 = -[NSObject description](v114, sel_description);
          v56 = sub_246378F5C();
          v58 = v57;

          sub_2463635B4(v56, v58, v118);
          v59 = sub_246379064();
          OUTLINED_FUNCTION_13_2(v59, v60, v61, v62, v63, v64, v65, v66, v109, v114);
          OUTLINED_FUNCTION_13_2(v67, v68, v69, v70, v71, v72, v73, v74, v110, v115);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_9_1(&dword_24635F000, v75, v76, "Incorrect requestId: %s to post %s");
          swift_arrayDestroy();
          OUTLINED_FUNCTION_7();
        }

        v92 = OUTLINED_FUNCTION_36_2();
        OUTLINED_FUNCTION_13_2(v92, v93, v94, v95, v96, v97, v98, v99, v109, v114);
        OUTLINED_FUNCTION_13_2(v100, v101, v102, v103, v104, v105, v106, v107, v111, v117);
        goto LABEL_21;
      }
    }
    if (qword_254420428 != -1)
      swift_once();
    v88 = OUTLINED_FUNCTION_23();
    v89 = OUTLINED_FUNCTION_4_0(v88, (uint64_t)qword_254420630);
    v90 = sub_246378FD4();
    if (OUTLINED_FUNCTION_38(v90))
    {
      v91 = (_WORD *)OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_26_1(v91);
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v89, (os_log_type_t)v41, v36, v38);
      OUTLINED_FUNCTION_7();
    }

    v35(v113);
  }
  else
  {
    v77 = v31;
    if (qword_254420428 != -1)
      swift_once();
    v78 = OUTLINED_FUNCTION_23();
    v116 = OUTLINED_FUNCTION_4_0(v78, (uint64_t)qword_254420630);
    v79 = sub_246378FC8();
    if (OUTLINED_FUNCTION_32_0(v79, v80, v81, v82, v83, v84, v85, v86, v108, v116))
    {
      v87 = (uint8_t *)OUTLINED_FUNCTION_10();
      *(_WORD *)v87 = 0;
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v113, v24, v77, v87);
      OUTLINED_FUNCTION_7();
    }
  }
LABEL_21:

}

void sub_246374FF4()
{
  uint64_t v0;
  void *v1;

  sub_246374C68();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingIFGestureCandidate);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_pendingIFGestureCandidate) = 0;

}

void sub_246375018()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;

  v1 = objc_allocWithZone((Class)sub_24637886C());
  v2 = sub_246378860();
  if (v2)
  {
    v3 = (void *)v2;
    if (qword_254420100 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_23();
    __swift_project_value_buffer(v4, (uint64_t)qword_254420618);
    v5 = v3;
    OUTLINED_FUNCTION_43_1();
    v6 = OUTLINED_FUNCTION_69_0();
    if (OUTLINED_FUNCTION_11_1(v6))
    {
      v7 = OUTLINED_FUNCTION_10();
      v18 = OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_27_2(4.8151e-34);
      v8 = sub_24637916C();
      sub_2463635B4(v8, v9, &v18);
      OUTLINED_FUNCTION_11_2();

      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      v10 = -[NSObject debugDescription](v0, sel_debugDescription);
      sub_246378F5C();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_34_2(v11, v12, &v18);
      OUTLINED_FUNCTION_11_2();

      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_9_1(&dword_24635F000, v13, v14, "Posting %s: %s");
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_12_0(OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  }
  else
  {
    if (qword_254420100 != -1)
      swift_once();
    v15 = OUTLINED_FUNCTION_23();
    v0 = OUTLINED_FUNCTION_4_0(v15, (uint64_t)qword_254420618);
    v16 = sub_246378FE0();
    if (os_log_type_enabled(v0, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_10();
      *(_WORD *)v17 = 0;
      OUTLINED_FUNCTION_5_1(&dword_24635F000, v0, v16, "‼️ ResultSelectedMessage could not be created.", v17);
      OUTLINED_FUNCTION_7();
    }
  }

}

uint64_t sub_246375288()
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
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25756D830);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246378974();
  sub_246378890();
  sub_246378B48();
  sub_246378878();
  sub_246378B30();
  v6 = sub_24637862C();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  sub_2463788B4();
  sub_246378B24();
  sub_2463788A8();
  sub_246378884();
  v7 = *MEMORY[0x24BE9AD88];
  v8 = sub_246378B54();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v2, v7, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v8);
  return sub_24637889C();
}

void sub_2463753E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_30_2();
  a23 = v25;
  a24 = v26;
  v28 = v27;
  if (qword_254420100 != -1)
    swift_once();
  v29 = OUTLINED_FUNCTION_23();
  __swift_project_value_buffer(v29, (uint64_t)qword_254420618);
  v30 = v28;
  OUTLINED_FUNCTION_43_1();
  v31 = OUTLINED_FUNCTION_69_0();
  if (OUTLINED_FUNCTION_11_1(v31))
  {
    v32 = OUTLINED_FUNCTION_10();
    a12 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_27_2(4.8151e-34);
    v33 = sub_24637916C();
    OUTLINED_FUNCTION_65_0(v33, v34, v35, v36, v37);
    OUTLINED_FUNCTION_11_2();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    v38 = objc_msgSend(v24, sel_debugDescription);
    sub_246378F5C();
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_34_2(v39, v40, &a12);
    OUTLINED_FUNCTION_11_2();

    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_9_1(&dword_24635F000, v41, v42, "Posting %s: %s");
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_12_0(OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  OUTLINED_FUNCTION_13();
}

uint64_t sub_246375574()
{
  uint64_t v0;

  sub_246375924(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_currentSessionId, &qword_2544203B0);
  swift_bridgeObjectRelease();
  sub_246375924(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_sessionUserId, (uint64_t *)&unk_254420530);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC17SiriGestureBridge22GestureOutputSubmitter_messagePublisher);
  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_24637560C()
{
  sub_246375574();
  return swift_deallocClassInstance();
}

uint64_t sub_246375630()
{
  return type metadata accessor for GestureOutputSubmitter();
}

uint64_t type metadata accessor for GestureOutputSubmitter()
{
  uint64_t result;

  result = qword_2544203E8;
  if (!qword_2544203E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246375670()
{
  unint64_t v0;
  unint64_t v1;

  sub_246372270(319, &qword_2544203B8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  if (v0 <= 0x3F)
  {
    sub_246372270(319, &qword_2544204F0, (void (*)(uint64_t))MEMORY[0x24BE9B488]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_24637573C()
{
  return sub_246375288();
}

unint64_t sub_246375744()
{
  unint64_t result;

  result = qword_25756D850;
  if (!qword_25756D850)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25756D850);
  }
  return result;
}

uint64_t sub_246375780(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_aceId);

  if (!v2)
    return 0;
  v3 = sub_246378F5C();

  return v3;
}

uint64_t sub_2463757EC(uint64_t a1)
{
  uint64_t v1;

  return sub_24637438C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2463757F4(uint64_t a1)
{
  return sub_24637580C(a1, sub_24637488C);
}

uint64_t sub_246375800(uint64_t a1)
{
  return sub_24637580C(a1, sub_24637450C);
}

uint64_t sub_24637580C(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

unint64_t sub_246375820()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25756D858;
  if (!qword_25756D858)
  {
    v1 = sub_246378C5C();
    result = MEMORY[0x24955879C](MEMORY[0x24BE9B010], v1);
    atomic_store(result, (unint64_t *)&qword_25756D858);
  }
  return result;
}

uint64_t sub_246375860(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2463758A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GestureResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463758E8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GestureResponse(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246375924(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return 0;
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
  return sub_246378B3C();
}

void OUTLINED_FUNCTION_13_2(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t OUTLINED_FUNCTION_18_2(uint64_t a1)
{
  uint64_t *v1;

  return sub_246375924(a1, v1);
}

uint64_t OUTLINED_FUNCTION_19_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_27_2(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_28_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_246375924(v2, a2);
}

uint64_t OUTLINED_FUNCTION_34_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_2463635B4(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return sub_246378E90();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return sub_246378E90();
}

void OUTLINED_FUNCTION_44_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_246375AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11)
{
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
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

  OUTLINED_FUNCTION_39_0();
  v58 = v13;
  v59 = v14;
  v54 = v15;
  v55 = v16;
  v53 = v17;
  v50 = v18;
  v51 = v19;
  v56 = v20;
  v47 = v21;
  v48 = v22;
  v44 = a11;
  v45 = a10;
  v46 = a9;
  v52 = sub_24637862C();
  v49 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_3_0();
  v23 = OUTLINED_FUNCTION_23();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v43 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = qword_2544206C0;
  v28 = qword_254420100;
  swift_retain();
  if (v28 != -1)
    swift_once();
  v29 = v11 + v27;
  __swift_project_value_buffer(v23, (uint64_t)qword_254420618);
  OUTLINED_FUNCTION_61_0((uint64_t)v26);
  sub_246378EF0();
  v30 = (int *)type metadata accessor for EventDeduper(0);
  v31 = (_QWORD *)(v11 + v27 + v30[6]);
  *v31 = 1953066569;
  v31[1] = 0xE400000000000000;
  v32 = v11 + v27 + v30[7];
  OUTLINED_FUNCTION_61_0(v32);
  *(_QWORD *)(v29 + v30[5]) = 1000000;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 40))(v32, v26, v23);
  v33 = (_QWORD *)(v11 + qword_2544204F8);
  v35 = v44;
  v34 = v45;
  *v33 = v45;
  v33[1] = v35;
  v36 = v34;
  swift_release();
  v37 = v49;
  v38 = v56;
  v39 = v52;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v12, v56, v52);
  v40 = v55;
  sub_246372520(v55, (uint64_t)&v57);
  v41 = sub_246378E00();

  __swift_destroy_boxed_opaque_existential_1Tm(v40);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
  return v41;
}

void sub_246375D08()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint8_t *v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int EnumTagSinglePayload;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
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
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  void (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
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

  OUTLINED_FUNCTION_39_0();
  v125 = v0;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544203B0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_48();
  v108 = v5;
  v121 = sub_246378BFC();
  v115 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  OUTLINED_FUNCTION_48();
  v107 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D898);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D798);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_15();
  v109 = v10;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_38_0();
  v116 = v12;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v13);
  v120 = (uint64_t)v103 - v14;
  v123 = sub_246378C5C();
  v15 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  OUTLINED_FUNCTION_48();
  v110 = v16;
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756D840);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756D7A0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_15();
  v113 = v21;
  OUTLINED_FUNCTION_22_0();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v103 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v122 = (uint64_t)v103 - v26;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_15();
  v106 = v28;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_38_0();
  v112 = v30;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_38_0();
  v124 = v32;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_38_0();
  v118 = v34;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_38_0();
  v126 = v36;
  OUTLINED_FUNCTION_22_0();
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)v103 - v38;
  if (qword_254420100 != -1)
    swift_once();
  v40 = OUTLINED_FUNCTION_23();
  v41 = __swift_project_value_buffer(v40, (uint64_t)qword_254420618);
  v42 = v3;
  v43 = v41;
  sub_246378E90();
  v44 = OUTLINED_FUNCTION_30();
  v45 = OUTLINED_FUNCTION_11_1(v44);
  v111 = v7;
  v117 = v25;
  if (v45)
  {
    v46 = OUTLINED_FUNCTION_1_1();
    v105 = v1;
    v104 = (int)v41;
    v47 = (uint8_t *)v46;
    v128 = OUTLINED_FUNCTION_10();
    v114 = v19;
    *(_DWORD *)v47 = 136315138;
    v103[1] = v47 + 4;
    v48 = objc_msgSend(v42, sel_debugDescription);
    v49 = OUTLINED_FUNCTION_30_3();
    v51 = v50;

    v127 = sub_2463635B4(v49, v51, &v128);
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v43, (os_log_type_t)v104, "❓ Handling SiriWillPromptMessage: %s", v47);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  sub_246378B60();
  v52 = sub_246378BF0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v39, 1, v52);
  v54 = v126;
  OUTLINED_FUNCTION_26_2((uint64_t)v39, v55, (uint64_t *)&unk_2544200E0);
  v57 = v124;
  if (EnumTagSinglePayload == 1)
  {
    v58 = (uint64_t *)&unk_2544200E0;
    v59 = v54;
LABEL_19:
    sub_246363748(v59, v58);
    OUTLINED_FUNCTION_59_1(v71, v72, (uint64_t *)&unk_2544200E0);
LABEL_20:
    v73 = (uint64_t *)&unk_2544200E0;
    v74 = v57;
LABEL_21:
    sub_246363748(v74, v73);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_26_2(v54, v56, (uint64_t *)&unk_2544200E0);
  v60 = OUTLINED_FUNCTION_20_1();
  if (v70)
  {
    OUTLINED_FUNCTION_48_1(v60, (uint64_t *)&unk_2544200E0);
    v61 = v122;
    v62 = v123;
    OUTLINED_FUNCTION_52_2(v122, 1);
  }
  else
  {
    v61 = v122;
    sub_246378BA8();
    OUTLINED_FUNCTION_14_1();
    v62 = v123;
  }
  v63 = (uint64_t)v117;
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v117, *MEMORY[0x24BE9AFF8], v62);
  OUTLINED_FUNCTION_52_2(v63, 0);
  v64 = (uint64_t)&v19[*(int *)(v119 + 48)];
  OUTLINED_FUNCTION_49_1(v61, (uint64_t)v19);
  v65 = v123;
  sub_246377C9C(v63, v64, &qword_25756D7A0);
  OUTLINED_FUNCTION_57_0((uint64_t)v19, 1, v65);
  if (v70)
  {
    OUTLINED_FUNCTION_11_3(v63);
    OUTLINED_FUNCTION_11_3(v61);
    sub_246363748(v126, (uint64_t *)&unk_2544200E0);
    OUTLINED_FUNCTION_57_0(v64, 1, v65);
    if (v70)
    {
      sub_246363748((uint64_t)v19, &qword_25756D7A0);
      OUTLINED_FUNCTION_59_1(v66, v67, (uint64_t *)&unk_2544200E0);
      goto LABEL_27;
    }
LABEL_18:
    v58 = &qword_25756D840;
    v59 = (uint64_t)v19;
    goto LABEL_19;
  }
  v69 = v113;
  sub_246377C9C((uint64_t)v19, v113, &qword_25756D7A0);
  OUTLINED_FUNCTION_57_0(v64, 1, v65);
  if (v70)
  {
    OUTLINED_FUNCTION_38_2(v63);
    OUTLINED_FUNCTION_38_2(v122);
    sub_246363748(v126, (uint64_t *)&unk_2544200E0);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v69, v65);
    goto LABEL_18;
  }
  v78 = v110;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v110, v64, v65);
  sub_24637279C((unint64_t *)&qword_25756D858, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B000], MEMORY[0x24BE9B010]);
  v114 = v19;
  LODWORD(v119) = sub_246378F44();
  v79 = v1;
  v80 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v80(v78, v65);
  OUTLINED_FUNCTION_11_3(v63);
  OUTLINED_FUNCTION_11_3(v122);
  sub_246363748(v126, (uint64_t *)&unk_2544200E0);
  v80(v69, v65);
  v1 = v79;
  v57 = v124;
  OUTLINED_FUNCTION_11_3((uint64_t)v114);
  sub_246377C9C((uint64_t)v39, v57, (uint64_t *)&unk_2544200E0);
  if ((v119 & 1) == 0)
    goto LABEL_20;
LABEL_27:
  OUTLINED_FUNCTION_26_2(v57, v68, (uint64_t *)&unk_2544200E0);
  v81 = OUTLINED_FUNCTION_20_1();
  if (v70)
  {
    OUTLINED_FUNCTION_48_1(v81, (uint64_t *)&unk_2544200E0);
    __swift_storeEnumTagSinglePayload(v120, 1, 1, v121);
  }
  else
  {
    sub_246378B90();
    OUTLINED_FUNCTION_14_1();
  }
  v82 = v111;
  v83 = v116;
  v84 = v121;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v115 + 104))(v116, *MEMORY[0x24BE9AE40], v121);
  __swift_storeEnumTagSinglePayload(v83, 0, 1, v84);
  v85 = v1 + *(int *)(v82 + 48);
  OUTLINED_FUNCTION_49_1(v120, v1);
  OUTLINED_FUNCTION_49_1(v83, v85);
  OUTLINED_FUNCTION_57_0(v1, 1, v84);
  if (v70)
  {
    OUTLINED_FUNCTION_11_3(v116);
    OUTLINED_FUNCTION_11_3(v120);
    OUTLINED_FUNCTION_46_2(v87, (uint64_t *)&unk_2544200E0);
    OUTLINED_FUNCTION_57_0(v85, 1, v121);
    if (v70)
    {
      sub_246363748(v1, &qword_25756D798);
      goto LABEL_40;
    }
LABEL_38:
    v73 = &qword_25756D898;
    v74 = v1;
    goto LABEL_21;
  }
  v89 = v109;
  OUTLINED_FUNCTION_26_2(v1, v86, &qword_25756D798);
  OUTLINED_FUNCTION_57_0(v85, 1, v121);
  if (v90)
  {
    OUTLINED_FUNCTION_38_2(v116);
    OUTLINED_FUNCTION_38_2(v120);
    OUTLINED_FUNCTION_46_2(v91, (uint64_t *)&unk_2544200E0);
    (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v89, v121);
    goto LABEL_38;
  }
  v92 = v115;
  v93 = v107;
  v94 = v121;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 32))(v107, v85, v121);
  sub_24637279C(&qword_25756D8A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AE48], MEMORY[0x24BE9AE58]);
  v95 = sub_246378F44();
  v96 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
  v96(v93, v94);
  OUTLINED_FUNCTION_11_3(v116);
  OUTLINED_FUNCTION_11_3(v120);
  OUTLINED_FUNCTION_46_2(v97, (uint64_t *)&unk_2544200E0);
  v96(v89, v94);
  OUTLINED_FUNCTION_11_3(v1);
  if ((v95 & 1) == 0)
  {
LABEL_22:
    OUTLINED_FUNCTION_32_2();
    sub_2463671CC();
    v76 = v75;
    v77 = swift_endAccess();
    if ((v76 & 1) != 0 && *(_QWORD *)(v125 + qword_2544204F8))
      sub_24636B194(v77);
    goto LABEL_25;
  }
LABEL_40:
  if (*(_QWORD *)(v125 + qword_2544204F8))
  {
    sub_24636B194(v88);
    OUTLINED_FUNCTION_26_2((uint64_t)v39, v98, (uint64_t *)&unk_2544200E0);
    v99 = OUTLINED_FUNCTION_20_1();
    if (v70)
    {
      OUTLINED_FUNCTION_48_1(v99, (uint64_t *)&unk_2544200E0);
      v100 = 1;
    }
    else
    {
      sub_246378BB4();
      OUTLINED_FUNCTION_14_1();
      v100 = 0;
    }
    v101 = sub_24637862C();
    v102 = v108;
    __swift_storeEnumTagSinglePayload(v108, v100, 1, v101);
    sub_24636E9B0(v102);
    sub_246363748(v102, &qword_2544203B0);
  }
LABEL_25:
  sub_246363748((uint64_t)v39, (uint64_t *)&unk_2544200E0);
  OUTLINED_FUNCTION_18();
}

void sub_246376730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  void *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;

  OUTLINED_FUNCTION_42_2();
  a25 = v29;
  a26 = v30;
  v31 = v26;
  v33 = v32;
  if (qword_254420100 != -1)
    swift_once();
  v34 = OUTLINED_FUNCTION_23();
  v35 = OUTLINED_FUNCTION_45_2(v34, (uint64_t)qword_254420618);
  OUTLINED_FUNCTION_43_1();
  v36 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v36))
  {
    v37 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    a12 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40_2(4.8149e-34);
    v39 = OUTLINED_FUNCTION_31_3(v38, sel_debugDescription);
    OUTLINED_FUNCTION_30_3();
    OUTLINED_FUNCTION_29_2();
    OUTLINED_FUNCTION_34_2(v40, v41, &a12);
    OUTLINED_FUNCTION_18_3();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v33, v28, "❓ Handling SiriWillAskForConfirmationMessage: %s", v37);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_32_2();
  sub_2463671CC();
  v43 = v42;
  v44 = swift_endAccess();
  if ((v43 & 1) != 0 && *(_QWORD *)(v31 + qword_2544204F8))
    sub_24636B194(v44);
  OUTLINED_FUNCTION_5_2();
}

void sub_2463768B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_13_3(a1, (uint64_t)"Handling SpeechPartialDeliveryStartedMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_2463768BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_13_3(a1, (uint64_t)"Handling StoppedListeningForSpeechContinuationForPlannerMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_2463768C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  _QWORD v23[2];
  uint8_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_39_0();
  v1 = v0;
  v3 = v2;
  v4 = sub_246378D64();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v23 - v9;
  if (qword_254420100 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_23();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_254420618);
  v13 = v3;
  v14 = v12;
  sub_246378E90();
  v15 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v12, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    v25 = OUTLINED_FUNCTION_10();
    v28 = v25;
    v26 = v10;
    *(_DWORD *)v16 = 136315138;
    v23[1] = v16 + 4;
    v24 = v16;
    v17 = objc_msgSend(v13, sel_debugDescription);
    v18 = OUTLINED_FUNCTION_51_1();
    v27 = v1;
    OUTLINED_FUNCTION_57_1();
    v20 = OUTLINED_FUNCTION_37_3(v18, v19, &v28);
    OUTLINED_FUNCTION_77(v20);
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v14, v15, "Handling StoppedListeningForSpeechContinuationMessage: %s", v24);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  sub_246378AE8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BE9B420], v4);
  v21 = sub_246365504((uint64_t)v10, (uint64_t)v8);
  v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v8, v4);
  v22(v10, v4);
  if ((v21 & 1) != 0 && *(_QWORD *)(v1 + qword_2544204F8))
    OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_18();
}

void sub_246376B24(void *a1)
{
  char *v1;
  os_log_type_t v2;
  char *v3;
  uint64_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v3 = v1;
  if (qword_254420100 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_23();
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_254420618);
  v7 = a1;
  v25 = v6;
  v8 = v6;
  sub_246378E90();
  v9 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_43_0(v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    v27 = (void *)OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_47_2(4.8149e-34);
    v12 = OUTLINED_FUNCTION_39_2(v11, sel_debugDescription);
    v13 = OUTLINED_FUNCTION_58_0();

    v26 = OUTLINED_FUNCTION_37_3(v13, v14, (uint64_t *)&v27);
    OUTLINED_FUNCTION_135();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v8, v2, "Handling TRPCandidateRequestMessage: %s", v10);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  v15 = sub_246378938();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v17 = v15 + 32;
    while (1)
    {
      sub_246377C9C(v17, (uint64_t)&v27, (uint64_t *)&unk_254420548);
      v18 = v27;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v28);
      if (objc_msgSend(v18, sel_speechEvent))
        break;

      v17 += 48;
      if (!--v16)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    v19 = v18;
    sub_246378E90();
    v20 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_11_1(v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_10();
      v22 = OUTLINED_FUNCTION_10();
      v26 = v22;
      *(_DWORD *)v21 = 136315138;
      OUTLINED_FUNCTION_39_2(v22, sel_speechEvent);
      type metadata accessor for AFSpeechEvent(0);
      v23 = sub_246378F68();
      sub_2463635B4(v23, v24, &v26);
      sub_246379064();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_36(&dword_24635F000, v25, (os_log_type_t)v17, "TCUPackage with speech event %s received, assuming that user replied with speech", v21);
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_7();
    }

    if (*(_QWORD *)&v3[qword_2544204F8])
      OUTLINED_FUNCTION_50_2();

  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
  }
}

void sub_246376E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_13_3(a1, (uint64_t)"Handling TRPCandidateForPlannerMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246376E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;

  OUTLINED_FUNCTION_30_2();
  a23 = v26;
  a24 = v27;
  v28 = v24;
  v30 = v29;
  if (qword_254420100 != -1)
    swift_once();
  v31 = OUTLINED_FUNCTION_23();
  v32 = __swift_project_value_buffer(v31, (uint64_t)qword_254420618);
  v33 = v30;
  v34 = sub_246378E90();
  v35 = sub_246378FD4();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    a12 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_47_2(4.8149e-34);
    v38 = OUTLINED_FUNCTION_39_2(v37, sel_debugDescription);
    v39 = OUTLINED_FUNCTION_58_0();
    v41 = v40;

    sub_2463635B4(v39, v41, &a12);
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_135();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v34, v35, "Handling NLResultCandidateMessage: %s", v36);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if ((AFDeviceSupportsMedoc() & 1) == 0)
  {
    sub_246378E90();
    v42 = OUTLINED_FUNCTION_30();
    if (os_log_type_enabled(v32, v42))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_10();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_24635F000, v32, v42, "Device doesn't support Medoc, assuming the NLResultCandidateMessage is for an LAS speech request", v43, 2u);
      OUTLINED_FUNCTION_7();
    }

    if (*(_QWORD *)(v28 + qword_2544204F8))
      OUTLINED_FUNCTION_50_2();
  }
  OUTLINED_FUNCTION_13();
}

void sub_246377024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_15_1(a1, (uint64_t)"Handling TextBasedResultCandidateMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377030(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246377884(a1, (int)"Handling StartUnderstandingOnServerRequestMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_24637703C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_15_1(a1, (uint64_t)"Handling StoppedListeningForTextContinuationMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_15_1(a1, (uint64_t)"Handling StoppedListeningForTextContinuationForPlannerMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;

  OUTLINED_FUNCTION_42_2();
  a25 = v28;
  a26 = v29;
  v31 = v30;
  v33 = v32;
  v34 = v26;
  v36 = v35;
  if (qword_254420100 != -1)
    swift_once();
  v37 = OUTLINED_FUNCTION_23();
  v38 = __swift_project_value_buffer(v37, (uint64_t)qword_254420618);
  v39 = v36;
  v40 = v38;
  sub_246378E90();
  v41 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_41_2(v41))
  {
    v42 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    a14 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_54_1(4.8149e-34);
    v43 = objc_msgSend(v39, sel_debugDescription);
    v46 = v33;
    v44 = OUTLINED_FUNCTION_51_1();
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_37_3(v44, v45, &a14);
    OUTLINED_FUNCTION_16_1();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v40, v27, v46, v42);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if (*(_QWORD *)(v34 + qword_2544204F8))
    sub_24636F194(v31);
  OUTLINED_FUNCTION_5_2();
}

void sub_2463771BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_2463771D4(a1, (uint64_t)"Handling StartLocalRequestMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_2463771C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_2463771D4(a1, (uint64_t)"Handling StartDirectActionRequestMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_2463771D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  os_log_type_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;

  OUTLINED_FUNCTION_30_2();
  a23 = v27;
  a24 = v28;
  v30 = v29;
  v31 = v24;
  v33 = v32;
  if (qword_254420100 != -1)
    swift_once();
  v34 = OUTLINED_FUNCTION_23();
  v35 = __swift_project_value_buffer(v34, (uint64_t)qword_254420618);
  v36 = v33;
  v37 = v35;
  sub_246378E90();
  v38 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_43_0(v38))
  {
    v39 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    v40 = OUTLINED_FUNCTION_10();
    a12 = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = OUTLINED_FUNCTION_31_3(v40, sel_debugDescription);
    v46 = v30;
    v42 = OUTLINED_FUNCTION_58_0();
    v44 = v43;

    sub_2463635B4(v42, v44, &a12);
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_135();

    OUTLINED_FUNCTION_55_1();
    OUTLINED_FUNCTION_36(&dword_24635F000, v37, v25, v46, v39);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if (*(_QWORD *)(v31 + qword_2544204F8))
  {
    sub_24636F194(4u);
    v45 = (void *)sub_246378788();
    OUTLINED_FUNCTION_44_1(v45);

  }
  OUTLINED_FUNCTION_13();
}

void sub_24637735C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartRequestMessageBase: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartTextRequestMessage: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartSpeechRequestMessage: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartCorrectedSpeechRequestMessage: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_2463773AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  void *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  OUTLINED_FUNCTION_30_2();
  a23 = v27;
  a24 = v28;
  v29 = v24;
  v31 = v30;
  if (qword_254420100 != -1)
    swift_once();
  v32 = OUTLINED_FUNCTION_23();
  v33 = OUTLINED_FUNCTION_45_2(v32, (uint64_t)qword_254420618);
  OUTLINED_FUNCTION_43_1();
  v34 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v34))
  {
    v35 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    a12 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40_2(4.8149e-34);
    v37 = OUTLINED_FUNCTION_31_3(v36, sel_debugDescription);
    OUTLINED_FUNCTION_30_3();
    OUTLINED_FUNCTION_29_2();
    OUTLINED_FUNCTION_34_2(v38, v39, &a12);
    OUTLINED_FUNCTION_18_3();

    OUTLINED_FUNCTION_55_1();
    OUTLINED_FUNCTION_36(&dword_24635F000, v31, v26, "Handling StartIFRequestMessage: %s", v35);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if (*(_QWORD *)(v29 + qword_2544204F8))
  {
    v40 = (void *)sub_2463788D8();
    OUTLINED_FUNCTION_44_1(v40);

  }
  OUTLINED_FUNCTION_13();
}

void sub_2463774F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartChildSpeechRequestMessage: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartRootSpeechRequestMessage: %s", MEMORY[0x24BE9A7F8], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_24637751C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartRootTextRequestMessage: %s", MEMORY[0x24BE9A6C8], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377544(a1, (uint64_t)"Handling StartChildTextRequestMessage: %s", (uint64_t)MEMORY[0x24BE99DE0], a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_246377544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  uint64_t (*v31)(void);
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;

  OUTLINED_FUNCTION_42_2();
  a25 = v28;
  a26 = v29;
  v31 = v30;
  v33 = v32;
  v34 = v26;
  v36 = v35;
  if (qword_254420100 != -1)
    swift_once();
  v37 = OUTLINED_FUNCTION_23();
  v38 = __swift_project_value_buffer(v37, (uint64_t)qword_254420618);
  v39 = v36;
  v40 = v38;
  sub_246378E90();
  v41 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_41_2(v41))
  {
    v42 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    a14 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_54_1(4.8149e-34);
    v44 = OUTLINED_FUNCTION_39_2(v43, sel_debugDescription);
    v48 = v33;
    v45 = OUTLINED_FUNCTION_51_1();
    OUTLINED_FUNCTION_57_1();
    OUTLINED_FUNCTION_37_3(v45, v46, &a14);
    OUTLINED_FUNCTION_16_1();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v40, v27, v48, v42);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if (*(_QWORD *)(v34 + qword_2544204F8))
  {
    v47 = (void *)v31();
    sub_246371E6C(v47);

  }
  OUTLINED_FUNCTION_5_2();
}

void sub_2463776B8()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_39_0();
  v3 = v0;
  v5 = v4;
  if (qword_254420100 != -1)
    swift_once();
  v6 = OUTLINED_FUNCTION_23();
  v7 = OUTLINED_FUNCTION_45_2(v6, (uint64_t)qword_254420618);
  OUTLINED_FUNCTION_43_1();
  v8 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_11_1(v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_1_1();
    v17 = OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_40_2(4.8149e-34);
    v11 = OUTLINED_FUNCTION_31_3(v10, sel_debugDescription);
    OUTLINED_FUNCTION_30_3();
    OUTLINED_FUNCTION_29_2();
    v14 = OUTLINED_FUNCTION_34_2(v12, v13, &v17);
    OUTLINED_FUNCTION_77(v14);
    sub_246379064();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v5, v2, "Handling RootRequestCompletedMessage: %s", v9);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  if (*(_QWORD *)(v3 + qword_2544204F8))
  {
    MEMORY[0x24BDAC7A8](v15);
    objc_allocWithZone((Class)sub_246378D40());
    v16 = (void *)sub_246378C80();
    OUTLINED_FUNCTION_44_1(v16);

  }
  OUTLINED_FUNCTION_18();
}

void sub_246377860(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246377884(a1, (int)"Handling RequestCompletedMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_24637786C(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246377884(a1, (int)"Handling StartCandidateRequestMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_246377878(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_246377884(a1, (int)"Handling EndCandidateRequestMessage: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_246377884(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  OUTLINED_FUNCTION_30_2();
  v69 = v24;
  v70 = v25;
  v27 = v26;
  v29 = v28;
  if (qword_254420100 != -1)
    swift_once();
  v30 = OUTLINED_FUNCTION_23();
  v31 = __swift_project_value_buffer(v30, (uint64_t)qword_254420618);
  v65 = v29;
  v32 = v31;
  sub_246378E90();
  v33 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v31, v33))
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_10();
    v68 = OUTLINED_FUNCTION_10();
    *(_DWORD *)v34 = 136315138;
    v35 = objc_msgSend(v65, sel_debugDescription);
    v36 = sub_246378F5C();
    v38 = v37;

    sub_2463635B4(v36, v38, &v68);
    OUTLINED_FUNCTION_51();
    v39 = sub_246379064();
    OUTLINED_FUNCTION_13_2(v39, v40, v41, v42, v43, v44, v45, v46, v63, v65);
    OUTLINED_FUNCTION_13_2(v47, v48, v49, v50, v51, v52, v53, v54, v64, v66);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_36(&dword_24635F000, v32, v33, v27, v34);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_7();
  }

  OUTLINED_FUNCTION_13_2(v55, v56, v57, v58, v59, v60, v61, v62, v63, v65);
}

void GestureRequestProcessor.__allocating_init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

void GestureRequestProcessor.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

void GestureRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

void GestureRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

void GestureRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

void GestureRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  OUTLINED_FUNCTION_24_2();
  __break(1u);
}

uint64_t sub_246377B00()
{
  uint64_t v0;

  return sub_246377B6C(v0 + qword_2544206C0);
}

void GestureRequestProcessor.deinit()
{
  uint64_t v0;

  v0 = sub_246378DF4();

  sub_246377B6C(v0 + qword_2544206C0);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_246377B6C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EventDeduper(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t GestureRequestProcessor.__deallocating_deinit()
{
  GestureRequestProcessor.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GestureRequestProcessor()
{
  uint64_t result;

  result = qword_2544203F8;
  if (!qword_2544203F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246377C00()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for EventDeduper(319);
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for GestureRequestProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_246377C8C()
{
  return type metadata accessor for GestureRequestProcessor();
}

void sub_246377C94()
{
  sub_24636707C();
}

void sub_246377C9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_16();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_11_3(uint64_t a1)
{
  uint64_t *v1;

  sub_246363748(a1, v1);
}

void OUTLINED_FUNCTION_13_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377054(a1, a2, 2, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_15_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_246377054(a1, a2, 3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_246379064();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

void OUTLINED_FUNCTION_26_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_246377C9C(a1, v3, a3);
}

void OUTLINED_FUNCTION_29_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_30_3()
{
  return sub_246378F5C();
}

id OUTLINED_FUNCTION_31_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_37_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_2463635B4(a1, v3, a3);
}

void OUTLINED_FUNCTION_38_2(uint64_t a1)
{
  uint64_t *v1;

  sub_246363748(a1, v1);
}

id OUTLINED_FUNCTION_39_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_40_2(float a1)
{
  float *v1;

  *v1 = a1;
}

BOOL OUTLINED_FUNCTION_41_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_44_1(void *a1)
{
  sub_246371E6C(a1);
}

id OUTLINED_FUNCTION_45_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  __swift_project_value_buffer(a1, a2);
  return v2;
}

void OUTLINED_FUNCTION_46_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246363748(v2, a2);
}

void OUTLINED_FUNCTION_47_2(float a1)
{
  float *v1;

  *v1 = a1;
}

void OUTLINED_FUNCTION_48_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246363748(v2, a2);
}

void OUTLINED_FUNCTION_49_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_246377C9C(a1, a2, v2);
}

void OUTLINED_FUNCTION_50_2()
{
  sub_24636F194(2u);
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return sub_246378F5C();
}

uint64_t OUTLINED_FUNCTION_52_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_54_1(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_57_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_246378F5C();
}

void OUTLINED_FUNCTION_59_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_246377C9C(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_61_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t sub_246377EC8(uint64_t a1)
{
  return sub_246377F18(a1, qword_254420618);
}

uint64_t sub_246377EF4(uint64_t a1)
{
  return sub_246377F18(a1, qword_254420630);
}

uint64_t sub_246377F18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_246378E9C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_246378524();
  sub_24637904C();
  return sub_246378EA8();
}

uint64_t sub_246377FA4()
{
  uint64_t v0;

  v0 = sub_246378E9C();
  __swift_allocate_value_buffer(v0, qword_2544206D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2544206D8);
  sub_246378524();
  sub_24637904C();
  return sub_246378EA8();
}

void sub_246378038(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  static SignpostLogger.begin(_:enableTelemetry:)(a1, a2, a3, a4, a5, a6);
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 1) != 0)
    sub_2463783A4(a1, a2, a3, a5, a6);
  else
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
}

void sub_2463780A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(a1, a2, a3, a4, a5, a6 & 0x1FF, a7, a8);
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_0_0();
  sub_246378E6C();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_246379028();
    v13 = (id)OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_2_1();
    sub_246378E60();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_246379028();
    v11 = (void *)OUTLINED_FUNCTION_0_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756D8A8);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_246379D60;
    *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v12 + 64) = sub_246378470();
    *(_QWORD *)(v12 + 32) = a7;
    *(_QWORD *)(v12 + 40) = a8;
    OUTLINED_FUNCTION_2_1();
    sub_246378E54();

    swift_bridgeObjectRelease();
  }
}

void sub_24637821C()
{
  static SignpostLogger.end(_:_:)();
}

void static SignpostLogger.end(_:_:)()
{
  id v0;

  sub_24637901C();
  v0 = (id)OUTLINED_FUNCTION_1_2();
  sub_246378E60();

}

uint64_t sub_2463782B8()
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

  v0 = sub_246378E84();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246379034();
  v4 = (void *)OUTLINED_FUNCTION_1_2();
  sub_246378E78();
  sub_246378E60();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_2463783A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(uint64_t, uint64_t);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_246378E6C();
  sub_246379028();
  v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_246378E54();

}

unint64_t sub_246378470()
{
  unint64_t result;

  result = qword_25756D8B0;
  if (!qword_25756D8B0)
  {
    result = MEMORY[0x24955879C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25756D8B0);
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

unint64_t sub_246378524()
{
  unint64_t result;

  result = qword_254420460;
  if (!qword_254420460)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254420460);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
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

uint64_t sub_246378590()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_24637859C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2463785A8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2463785B4()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2463785C0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2463785CC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2463785D8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2463785E4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2463785F0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2463785FC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_246378608()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_246378614()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246378620()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24637862C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246378638()
{
  return MEMORY[0x24BE97268]();
}

uint64_t sub_246378644()
{
  return MEMORY[0x24BE3F450]();
}

uint64_t sub_246378650()
{
  return MEMORY[0x24BE3F458]();
}

uint64_t sub_24637865C()
{
  return MEMORY[0x24BE3F460]();
}

uint64_t sub_246378668()
{
  return MEMORY[0x24BE3F468]();
}

uint64_t sub_246378674()
{
  return MEMORY[0x24BE3F470]();
}

uint64_t sub_246378680()
{
  return MEMORY[0x24BE3F478]();
}

uint64_t sub_24637868C()
{
  return MEMORY[0x24BE3F480]();
}

uint64_t sub_246378698()
{
  return MEMORY[0x24BE3F488]();
}

uint64_t sub_2463786A4()
{
  return MEMORY[0x24BE3F490]();
}

uint64_t sub_2463786B0()
{
  return MEMORY[0x24BE3F498]();
}

uint64_t sub_2463786BC()
{
  return MEMORY[0x24BE3F4A0]();
}

uint64_t sub_2463786C8()
{
  return MEMORY[0x24BE3F4A8]();
}

uint64_t sub_2463786D4()
{
  return MEMORY[0x24BE3F4B0]();
}

uint64_t sub_2463786E0()
{
  return MEMORY[0x24BE3F4B8]();
}

uint64_t sub_2463786EC()
{
  return MEMORY[0x24BE3F4C0]();
}

uint64_t sub_2463786F8()
{
  return MEMORY[0x24BE3F4C8]();
}

uint64_t sub_246378704()
{
  return MEMORY[0x24BE9CC08]();
}

uint64_t sub_246378710()
{
  return MEMORY[0x24BE9CC28]();
}

uint64_t sub_24637871C()
{
  return MEMORY[0x24BE9CC38]();
}

uint64_t sub_246378728()
{
  return MEMORY[0x24BE9CC40]();
}

uint64_t sub_246378734()
{
  return MEMORY[0x24BE9CC90]();
}

uint64_t sub_246378740()
{
  return MEMORY[0x24BE9CCA8]();
}

uint64_t sub_24637874C()
{
  return MEMORY[0x24BE9CD20]();
}

uint64_t sub_246378758()
{
  return MEMORY[0x24BE9CD60]();
}

uint64_t sub_246378764()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_246378770()
{
  return MEMORY[0x24BE99D48]();
}

uint64_t sub_24637877C()
{
  return MEMORY[0x24BE99DD0]();
}

uint64_t sub_246378788()
{
  return MEMORY[0x24BE99DE0]();
}

uint64_t sub_246378794()
{
  return MEMORY[0x24BE99DF0]();
}

uint64_t sub_2463787A0()
{
  return MEMORY[0x24BE99E68]();
}

uint64_t sub_2463787AC()
{
  return MEMORY[0x24BE99E70]();
}

uint64_t sub_2463787B8()
{
  return MEMORY[0x24BE99E78]();
}

uint64_t sub_2463787C4()
{
  return MEMORY[0x24BE99E80]();
}

uint64_t sub_2463787D0()
{
  return MEMORY[0x24BE99E88]();
}

uint64_t sub_2463787DC()
{
  return MEMORY[0x24BE99E90]();
}

uint64_t sub_2463787E8()
{
  return MEMORY[0x24BE99E98]();
}

uint64_t sub_2463787F4()
{
  return MEMORY[0x24BE99EA0]();
}

uint64_t sub_246378800()
{
  return MEMORY[0x24BE99EA8]();
}

uint64_t sub_24637880C()
{
  return MEMORY[0x24BE99EB0]();
}

uint64_t sub_246378818()
{
  return MEMORY[0x24BE99EB8]();
}

uint64_t sub_246378824()
{
  return MEMORY[0x24BE99EC0]();
}

uint64_t sub_246378830()
{
  return MEMORY[0x24BE99EC8]();
}

uint64_t sub_24637883C()
{
  return MEMORY[0x24BE99ED0]();
}

uint64_t sub_246378848()
{
  return MEMORY[0x24BE99ED8]();
}

uint64_t sub_246378854()
{
  return MEMORY[0x24BE99EE0]();
}

uint64_t sub_246378860()
{
  return MEMORY[0x24BE99EE8]();
}

uint64_t sub_24637886C()
{
  return MEMORY[0x24BE99EF0]();
}

uint64_t sub_246378878()
{
  return MEMORY[0x24BE99EF8]();
}

uint64_t sub_246378884()
{
  return MEMORY[0x24BE99F00]();
}

uint64_t sub_246378890()
{
  return MEMORY[0x24BE99F08]();
}

uint64_t sub_24637889C()
{
  return MEMORY[0x24BE99F10]();
}

uint64_t sub_2463788A8()
{
  return MEMORY[0x24BE99F18]();
}

uint64_t sub_2463788B4()
{
  return MEMORY[0x24BE99F20]();
}

uint64_t sub_2463788C0()
{
  return MEMORY[0x24BE99F48]();
}

uint64_t sub_2463788CC()
{
  return MEMORY[0x24BE99F50]();
}

uint64_t sub_2463788D8()
{
  return MEMORY[0x24BE99F60]();
}

uint64_t sub_2463788E4()
{
  return MEMORY[0x24BE99F68]();
}

uint64_t sub_2463788F0()
{
  return MEMORY[0x24BE99FF8]();
}

uint64_t sub_2463788FC()
{
  return MEMORY[0x24BE9A048]();
}

uint64_t sub_246378908()
{
  return MEMORY[0x24BE9A218]();
}

uint64_t sub_246378914()
{
  return MEMORY[0x24BE9A3B8]();
}

uint64_t sub_246378920()
{
  return MEMORY[0x24BE9A550]();
}

uint64_t sub_24637892C()
{
  return MEMORY[0x24BE9A5A8]();
}

uint64_t sub_246378938()
{
  return MEMORY[0x24BE9A600]();
}

uint64_t sub_246378944()
{
  return MEMORY[0x24BE9A648]();
}

uint64_t sub_246378950()
{
  return MEMORY[0x24BE9A6D8]();
}

uint64_t sub_24637895C()
{
  return MEMORY[0x24BE9A748]();
}

uint64_t sub_246378968()
{
  return MEMORY[0x24BE9A768]();
}

uint64_t sub_246378974()
{
  return MEMORY[0x24BE9A7C8]();
}

uint64_t sub_246378980()
{
  return MEMORY[0x24BE9A818]();
}

uint64_t sub_24637898C()
{
  return MEMORY[0x24BE9A8C8]();
}

uint64_t sub_246378998()
{
  return MEMORY[0x24BE9A8D0]();
}

uint64_t sub_2463789A4()
{
  return MEMORY[0x24BE9A8D8]();
}

uint64_t sub_2463789B0()
{
  return MEMORY[0x24BE9A8E0]();
}

uint64_t sub_2463789BC()
{
  return MEMORY[0x24BE9A8E8]();
}

uint64_t sub_2463789C8()
{
  return MEMORY[0x24BE9A8F0]();
}

uint64_t sub_2463789D4()
{
  return MEMORY[0x24BE9A8F8]();
}

uint64_t sub_2463789E0()
{
  return MEMORY[0x24BE9A900]();
}

uint64_t sub_2463789EC()
{
  return MEMORY[0x24BE9A908]();
}

uint64_t sub_2463789F8()
{
  return MEMORY[0x24BE9A910]();
}

uint64_t sub_246378A04()
{
  return MEMORY[0x24BE9A918]();
}

uint64_t sub_246378A10()
{
  return MEMORY[0x24BE9A950]();
}

uint64_t sub_246378A1C()
{
  return MEMORY[0x24BE9A970]();
}

uint64_t sub_246378A28()
{
  return MEMORY[0x24BE9A980]();
}

uint64_t sub_246378A34()
{
  return MEMORY[0x24BE9A9F8]();
}

uint64_t sub_246378A40()
{
  return MEMORY[0x24BE9AA00]();
}

uint64_t sub_246378A4C()
{
  return MEMORY[0x24BE9AA08]();
}

uint64_t sub_246378A58()
{
  return MEMORY[0x24BE9AA10]();
}

uint64_t sub_246378A64()
{
  return MEMORY[0x24BE9AA18]();
}

uint64_t sub_246378A70()
{
  return MEMORY[0x24BE9AA20]();
}

uint64_t sub_246378A7C()
{
  return MEMORY[0x24BE9AA28]();
}

uint64_t sub_246378A88()
{
  return MEMORY[0x24BE9AA30]();
}

uint64_t sub_246378A94()
{
  return MEMORY[0x24BE9AA38]();
}

uint64_t sub_246378AA0()
{
  return MEMORY[0x24BE9AA48]();
}

uint64_t sub_246378AAC()
{
  return MEMORY[0x24BE9AA80]();
}

uint64_t sub_246378AB8()
{
  return MEMORY[0x24BE9AB48]();
}

uint64_t sub_246378AC4()
{
  return MEMORY[0x24BE9ABC0]();
}

uint64_t sub_246378AD0()
{
  return MEMORY[0x24BE9ABE8]();
}

uint64_t sub_246378ADC()
{
  return MEMORY[0x24BE9ABF8]();
}

uint64_t sub_246378AE8()
{
  return MEMORY[0x24BE9AC20]();
}

uint64_t sub_246378AF4()
{
  return MEMORY[0x24BE9AC58]();
}

uint64_t sub_246378B00()
{
  return MEMORY[0x24BE9AC98]();
}

uint64_t sub_246378B0C()
{
  return MEMORY[0x24BE9ACA0]();
}

uint64_t sub_246378B18()
{
  return MEMORY[0x24BE9ACA8]();
}

uint64_t sub_246378B24()
{
  return MEMORY[0x24BE9AD18]();
}

uint64_t sub_246378B30()
{
  return MEMORY[0x24BE9AD48]();
}

uint64_t sub_246378B3C()
{
  return MEMORY[0x24BE9AD58]();
}

uint64_t sub_246378B48()
{
  return MEMORY[0x24BE9AD60]();
}

uint64_t sub_246378B54()
{
  return MEMORY[0x24BE9AD98]();
}

uint64_t sub_246378B60()
{
  return MEMORY[0x24BE9ADA8]();
}

uint64_t sub_246378B6C()
{
  return MEMORY[0x24BE9ADB0]();
}

uint64_t sub_246378B78()
{
  return MEMORY[0x24BE9ADC0]();
}

uint64_t sub_246378B84()
{
  return MEMORY[0x24BE9ADE0]();
}

uint64_t sub_246378B90()
{
  return MEMORY[0x24BE9ADE8]();
}

uint64_t sub_246378B9C()
{
  return MEMORY[0x24BE9ADF0]();
}

uint64_t sub_246378BA8()
{
  return MEMORY[0x24BE9ADF8]();
}

uint64_t sub_246378BB4()
{
  return MEMORY[0x24BE9AE00]();
}

uint64_t sub_246378BC0()
{
  return MEMORY[0x24BE9AE08]();
}

uint64_t sub_246378BCC()
{
  return MEMORY[0x24BE9AE10]();
}

uint64_t sub_246378BD8()
{
  return MEMORY[0x24BE9AE18]();
}

uint64_t sub_246378BE4()
{
  return MEMORY[0x24BE9AE20]();
}

uint64_t sub_246378BF0()
{
  return MEMORY[0x24BE9AE28]();
}

uint64_t sub_246378BFC()
{
  return MEMORY[0x24BE9AE48]();
}

uint64_t sub_246378C08()
{
  return MEMORY[0x24BE9AF90]();
}

uint64_t sub_246378C14()
{
  return MEMORY[0x24BE9AF98]();
}

uint64_t sub_246378C20()
{
  return MEMORY[0x24BE9AFC0]();
}

uint64_t sub_246378C2C()
{
  return MEMORY[0x24BE9AFC8]();
}

uint64_t sub_246378C38()
{
  return MEMORY[0x24BE9AFD0]();
}

uint64_t sub_246378C44()
{
  return MEMORY[0x24BE9AFD8]();
}

uint64_t sub_246378C50()
{
  return MEMORY[0x24BE9AFE0]();
}

uint64_t sub_246378C5C()
{
  return MEMORY[0x24BE9B000]();
}

uint64_t sub_246378C68()
{
  return MEMORY[0x24BE9B030]();
}

uint64_t sub_246378C74()
{
  return MEMORY[0x24BE9B1D8]();
}

uint64_t sub_246378C80()
{
  return MEMORY[0x24BE9B1E0]();
}

uint64_t sub_246378C8C()
{
  return MEMORY[0x24BE9B1E8]();
}

uint64_t sub_246378C98()
{
  return MEMORY[0x24BE9B1F0]();
}

uint64_t sub_246378CA4()
{
  return MEMORY[0x24BE9B1F8]();
}

uint64_t sub_246378CB0()
{
  return MEMORY[0x24BE9B200]();
}

uint64_t sub_246378CBC()
{
  return MEMORY[0x24BE9B208]();
}

uint64_t sub_246378CC8()
{
  return MEMORY[0x24BE9B210]();
}

uint64_t sub_246378CD4()
{
  return MEMORY[0x24BE9B218]();
}

uint64_t sub_246378CE0()
{
  return MEMORY[0x24BE9B220]();
}

uint64_t sub_246378CEC()
{
  return MEMORY[0x24BE9B228]();
}

uint64_t sub_246378CF8()
{
  return MEMORY[0x24BE9B230]();
}

uint64_t sub_246378D04()
{
  return MEMORY[0x24BE9B238]();
}

uint64_t sub_246378D10()
{
  return MEMORY[0x24BE9B240]();
}

uint64_t sub_246378D1C()
{
  return MEMORY[0x24BE9B248]();
}

uint64_t sub_246378D28()
{
  return MEMORY[0x24BE9B250]();
}

uint64_t sub_246378D34()
{
  return MEMORY[0x24BE9B258]();
}

uint64_t sub_246378D40()
{
  return MEMORY[0x24BE9B260]();
}

uint64_t sub_246378D4C()
{
  return MEMORY[0x24BE9B360]();
}

uint64_t sub_246378D58()
{
  return MEMORY[0x24BE9B410]();
}

uint64_t sub_246378D64()
{
  return MEMORY[0x24BE9B428]();
}

uint64_t sub_246378D70()
{
  return MEMORY[0x24BE9B438]();
}

uint64_t sub_246378D7C()
{
  return MEMORY[0x24BE9B478]();
}

uint64_t sub_246378D88()
{
  return MEMORY[0x24BE9B488]();
}

uint64_t sub_246378D94()
{
  return MEMORY[0x24BE9B4D8]();
}

uint64_t sub_246378DA0()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_246378DAC()
{
  return MEMORY[0x24BE94698]();
}

uint64_t sub_246378DB8()
{
  return MEMORY[0x24BE946C0]();
}

uint64_t sub_246378DC4()
{
  return MEMORY[0x24BEA6070]();
}

uint64_t sub_246378DD0()
{
  return MEMORY[0x24BEA6078]();
}

uint64_t sub_246378DDC()
{
  return MEMORY[0x24BEA6090]();
}

uint64_t sub_246378DE8()
{
  return MEMORY[0x24BEA60A8]();
}

uint64_t sub_246378DF4()
{
  return MEMORY[0x24BEA60F8]();
}

uint64_t sub_246378E00()
{
  return MEMORY[0x24BEA6100]();
}

uint64_t sub_246378E0C()
{
  return MEMORY[0x24BEA6178]();
}

uint64_t sub_246378E18()
{
  return MEMORY[0x24BEA61C8]();
}

uint64_t sub_246378E24()
{
  return MEMORY[0x24BEA61D0]();
}

uint64_t sub_246378E30()
{
  return MEMORY[0x24BEA61D8]();
}

uint64_t sub_246378E3C()
{
  return MEMORY[0x24BEA61E8]();
}

uint64_t sub_246378E48()
{
  return MEMORY[0x24BEA61F0]();
}

uint64_t sub_246378E54()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_246378E60()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_246378E6C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_246378E78()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_246378E84()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_246378E90()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246378E9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246378EA8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_246378EB4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_246378EC0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_246378ECC()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_246378ED8()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_246378EE4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_246378EF0()
{
  return MEMORY[0x24BEE5550]();
}

uint64_t sub_246378EFC()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t sub_246378F08()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_246378F14()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_246378F20()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_246378F2C()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_246378F38()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_246378F44()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_246378F50()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246378F5C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246378F68()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_246378F74()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_246378F80()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246378F8C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_246378F98()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246378FA4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_246378FB0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_246378FBC()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_246378FC8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_246378FD4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246378FE0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246378FEC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_246378FF8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_246379004()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_246379010()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24637901C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_246379028()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_246379034()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_246379040()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24637904C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_246379058()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246379064()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246379070()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24637907C()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_246379088()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_246379094()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2463790A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2463790AC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2463790B8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2463790C4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2463790D0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2463790DC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2463790E8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2463790F4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246379100()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24637910C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246379118()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_246379124()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246379130()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24637913C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246379148()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246379154()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246379160()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24637916C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x24BE08C98]();
}

uint64_t AFExternalNotificationRequestHandlerStateGetName()
{
  return MEMORY[0x24BE08D10]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

