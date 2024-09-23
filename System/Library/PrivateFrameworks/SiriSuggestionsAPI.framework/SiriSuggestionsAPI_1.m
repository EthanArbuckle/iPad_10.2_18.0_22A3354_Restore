void sub_247264E74(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint8_t *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  void *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint8_t *v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint8_t *v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t aBlock[8];

  v78 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437D78);
  MEMORY[0x24BDAC7A8](v5, v6);
  v69 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_247278B50();
  v74 = *(_QWORD *)(v76 - 8);
  v9 = MEMORY[0x24BDAC7A8](v76, v8);
  v75 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v64 - v12;
  v14 = sub_2472789AC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v66 = v22;
  v23 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ContinuationBasedXPCBridge();
  v68 = v20;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v71 = a1;
  v72 = v19;
  v65 = v24;
  v24(v23, a1, v19);
  v67 = v23;
  sub_2472655B8((uint64_t)v23);
  v73 = v25;
  if (qword_25443A1C8 != -1)
    swift_once();
  v26 = sub_247279048();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_25443A330);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v77 = a2;
  v28(v18, a2, v14);
  v29 = sub_247279030();
  v30 = sub_2472793A8();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v70 = v27;
    v32 = (uint8_t *)v31;
    v33 = swift_slowAlloc();
    aBlock[0] = v33;
    *(_DWORD *)v32 = 136315138;
    v64 = v32 + 4;
    sub_2471FDEF8(&qword_254437D38, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7030], MEMORY[0x24BEA7040]);
    v34 = sub_247279708();
    v79 = sub_2472728FC(v34, v35, aBlock);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    _os_log_impl(&dword_2471ED000, v29, v30, "Making XPC request for in app suggestions for: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249575BC8](v33, -1, -1);
    v36 = v32;
    v27 = v70;
    MEMORY[0x249575BC8](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }

  v64 = *(uint8_t **)(v78 + 16);
  sub_247278988();
  sub_247278B2C();
  v37 = *(void (**)(char *, uint64_t))(v74 + 8);
  v38 = v76;
  v37(v13, v76);
  v39 = (void *)sub_247279198();
  swift_bridgeObjectRelease();
  v40 = v75;
  sub_247278988();
  sub_247278B38();
  v42 = v41;
  v43 = ((uint64_t (*)(char *, uint64_t))v37)(v40, v38);
  if (v42)
  {
    v44 = (void *)sub_247279198();
    v43 = swift_bridgeObjectRelease();
  }
  else
  {
    v44 = 0;
  }
  v45 = MEMORY[0x249574884](v43);
  sub_24726C1B8(v45);
  v46 = sub_247264CE0();
  v48 = v47;
  v70 = v27;
  swift_bridgeObjectRelease();
  swift_release();
  v49 = sub_2472782BC();
  sub_2471FD35C(v46, v48);
  v50 = (uint64_t)v69;
  sub_247278994();
  v51 = sub_247265648(v50);
  v53 = v52;
  sub_24726DA58(v50, &qword_254437D78);
  v54 = (void *)v49;
  if (v53 >> 60 == 15)
  {
    v55 = 0;
  }
  else
  {
    v55 = (void *)sub_2472782BC();
    sub_2471FD348((uint64_t)v51, v53);
  }
  v56 = v72;
  v58 = v67;
  v57 = v68;
  v59 = v64;
  v65(v67, v71, v72);
  v60 = (*(unsigned __int8 *)(v57 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  v61 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v57 + 32))(v61 + v60, v58, v56);
  aBlock[4] = (uint64_t)sub_24726D980;
  aBlock[5] = v61;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_247265ACC;
  aBlock[3] = (uint64_t)&block_descriptor_169;
  v62 = _Block_copy(aBlock);
  v63 = v73;
  swift_release();
  -[uint8_t getSuggestionsForAppWithAppBundleId:placementId:entities:intentToSuggest:bridge:completionHandler:](v59, sel_getSuggestionsForAppWithAppBundleId_placementId_entities_intentToSuggest_bridge_completionHandler_, v39, v44, v54, v55, v63, v62);

  _Block_release(v62);
}

void sub_2472655B8(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge_continuation];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v7.receiver = v3;
  v7.super_class = v1;
  objc_msgSendSuper2(&v7, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  OUTLINED_FUNCTION_32_1();
}

uint64_t (*sub_247265648(uint64_t a1))(uint64_t)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v22[6];
  uint64_t v23;

  v3 = sub_247278B8C();
  v23 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437D78);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_247278D48();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24722F1E4(a1, (uint64_t)v10, &qword_254437D78);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_24726DA58((uint64_t)v10, &qword_254437D78);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v11);
    sub_24727822C();
    swift_allocObject();
    sub_247278220();
    sub_247278208();
    v22[3] = v11;
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BEA76B8];
    sub_2471FDEF8(&qword_254437D70, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA76B8], MEMORY[0x24BEA76D0]);
    v22[4] = v17;
    sub_2471FDEF8(&qword_254437D68, 255, v16, MEMORY[0x24BEA76C8]);
    v22[5] = v18;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v22);
    (*(void (**)(uint64_t *, char *, uint64_t))(v12 + 16))(boxed_opaque_existential_1, v15, v11);
    sub_247278B80();
    sub_2471FDEF8(&qword_254438D50, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7310], MEMORY[0x24BEA7320]);
    v20 = sub_247278214();
    if (!v1)
      v16 = (uint64_t (*)(uint64_t))v20;
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  return v16;
}

void *sub_2472658DC(void *result)
{
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (result)
  {
    v1 = result;
    v2 = result;
    if (qword_25443A1C8 != -1)
      swift_once();
    v3 = sub_247279048();
    __swift_project_value_buffer(v3, (uint64_t)qword_25443A330);
    v4 = v1;
    v5 = v1;
    v6 = sub_247279030();
    v7 = sub_2472793B4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v13 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = v1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254438D68);
      v11 = sub_2472791E0();
      sub_2472728FC(v11, v12, &v13);
      sub_2472793D8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2471ED000, v6, v7, "Cannot provide in app suggestions because of %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249575BC8](v9, -1, -1);
      MEMORY[0x249575BC8](v8, -1, -1);
    }
    else
    {

    }
    v13 = (uint64_t)v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
    return (void *)sub_247279330();
  }
  return result;
}

uint64_t SiriSuggestionsXPCClient.disconnect(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = OUTLINED_FUNCTION_102_3();
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = *(_QWORD *)(v4 + 64);
  v2[7] = swift_task_alloc();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247265B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(void))
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  OUTLINED_FUNCTION_62_4();
  v10 = v9[7];
  v11 = v9[5];
  v12 = v9[3];
  OUTLINED_FUNCTION_138_2(v10, v9[2], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v13 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  v9[8] = v14;
  *(_QWORD *)(v14 + 16) = v12;
  OUTLINED_FUNCTION_138_2(v14 + v13, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  OUTLINED_FUNCTION_96_3();
  v15 = (_QWORD *)OUTLINED_FUNCTION_178_0();
  v9[9] = (uint64_t)v15;
  *v15 = v9;
  v15[1] = sub_247265BD4;
  return OUTLINED_FUNCTION_43_8(a9);
}

uint64_t sub_247265BD4()
{
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247265C0C()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247265C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v5 = sub_247278B50();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5, v8);
  v9 = *(void **)(a2 + 16);
  sub_247278B2C();
  v10 = (void *)sub_247279198();
  swift_bridgeObjectRelease();
  sub_247278B38();
  if (v11)
  {
    v12 = (void *)sub_247279198();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  aBlock[4] = sub_24726D84C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247265ACC;
  aBlock[3] = &block_descriptor_158;
  v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_disconnectForAppWithAppBundleId_placementId_completionHandler_, v10, v12, v15);
  _Block_release(v15);

  return sub_247262D04(&qword_2544387B0, (uint64_t)&unk_25187F370, (uint64_t)&unk_25767EB60);
}

void sub_247265DDC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_247278B50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v9 = a1;
    if (qword_25443A1C8 != -1)
      swift_once();
    v10 = sub_247279048();
    __swift_project_value_buffer(v10, (uint64_t)qword_25443A330);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
    v11 = a1;
    v12 = a1;
    v13 = sub_247279030();
    v14 = sub_2472793B4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v23 = v16;
      *(_DWORD *)v15 = 136315394;
      sub_2471FDEF8(&qword_25767EB70, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA72B8], MEMORY[0x24BEA72C8]);
      v17 = sub_247279708();
      v22 = sub_2472728FC(v17, v18, &v23);
      sub_2472793D8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      *(_WORD *)(v15 + 12) = 2080;
      v22 = (uint64_t)a1;
      v19 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254438D68);
      v20 = sub_2472791E0();
      v22 = sub_2472728FC(v20, v21, &v23);
      sub_2472793D8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2471ED000, v13, v14, "Unable to disconnect from %s. Remote Error: %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249575BC8](v16, -1, -1);
      MEMORY[0x249575BC8](v15, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
}

uint64_t SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[10] = a5;
  v6[11] = v5;
  v6[8] = a2;
  v6[9] = a3;
  v6[7] = a1;
  v7 = sub_247279504();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = OUTLINED_FUNCTION_50();
  v6[15] = OUTLINED_FUNCTION_21_3();
  v6[16] = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247266100()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (qword_25443A1C8 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_81_0();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_25443A330);
  v0[17] = v2;
  v3 = (void *)v2;
  sub_247279030();
  v4 = OUTLINED_FUNCTION_81_1();
  if (OUTLINED_FUNCTION_49(v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_60_1(v5);
    OUTLINED_FUNCTION_56(&dword_2471ED000, v6, v7, "Remote call to get next suggestions");
    OUTLINED_FUNCTION_24_0();
  }

  v8 = (_QWORD *)swift_task_alloc();
  v0[18] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_2472661D0;
  return sub_247264A54(v0[10]);
}

uint64_t sub_2472661D0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = a2;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247266220()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  __int128 v18;

  v1 = *(_QWORD *)(v0 + 160);
  if (v1 >> 60 == 15)
  {
    v2 = *(void **)(v0 + 136);
    sub_247279030();
    v3 = OUTLINED_FUNCTION_136();
    if (OUTLINED_FUNCTION_49(v3))
    {
      v4 = (_WORD *)OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_60_1(v4);
      OUTLINED_FUNCTION_56(&dword_2471ED000, v5, v6, "Unable to send required supporting data. Returning empty suggestions");
      OUTLINED_FUNCTION_24_0();
    }

    if (qword_25767C648 != -1)
      swift_once();
    v7 = *(_QWORD *)(v0 + 56);
    v8 = __swift_project_value_buffer(*(_QWORD *)(v0 + 120), (uint64_t)qword_25767E988);
    sub_2472302A0(v8, v7, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
    OUTLINED_FUNCTION_92_4();
    OUTLINED_FUNCTION_104();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_25767C648 != -1)
    {
      swift_once();
      v1 = *(_QWORD *)(v0 + 160);
    }
    v10 = *(_QWORD *)(v0 + 152);
    v11 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 88);
    v18 = *(_OWORD *)(v0 + 64);
    v13 = __swift_project_value_buffer(*(_QWORD *)(v0 + 120), (uint64_t)qword_25767E988);
    *(_QWORD *)(v0 + 168) = v13;
    OUTLINED_FUNCTION_165_0(v13, v14, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
    sub_2472794F8();
    v15 = swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v15;
    *(_QWORD *)(v15 + 16) = v11;
    *(_QWORD *)(v15 + 24) = v12;
    *(_OWORD *)(v15 + 32) = v18;
    *(_QWORD *)(v15 + 48) = v10;
    *(_QWORD *)(v15 + 56) = v1;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v16;
    OUTLINED_FUNCTION_34_6(&qword_25767E9D8, v17, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    *v16 = v0;
    v16[1] = sub_24726640C;
    return sub_247279774();
  }
}

uint64_t sub_24726640C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *v1;
  v2 = v5;
  OUTLINED_FUNCTION_61(&v5);
  *(_QWORD *)(v2 + 192) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 104);
  if (v0)
  {
    OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    OUTLINED_FUNCTION_128_0();
  }
  else
  {
    *(_OWORD *)(v2 + 200) = *(_OWORD *)(v2 + 16);
    OUTLINED_FUNCTION_128_0();
    OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  OUTLINED_FUNCTION_18();
  return swift_task_switch();
}

uint64_t sub_2472664A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  _QWORD *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t (*v31)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_52_0();
  a21 = v24;
  a22 = v25;
  a20 = v22;
  v26 = v22[17];
  sub_247279030();
  v27 = OUTLINED_FUNCTION_81_1();
  if (OUTLINED_FUNCTION_98_1(v27))
  {
    v28 = (uint8_t *)OUTLINED_FUNCTION_45();
    a11 = OUTLINED_FUNCTION_45();
    *(_DWORD *)v28 = 136315138;
    v29 = sub_247279828();
    v22[6] = sub_2472728FC(v29, v30, &a11);
    OUTLINED_FUNCTION_332();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47_2(&dword_2471ED000, v26, v23, "Obtaining suggestions took: %s", v28);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_24_0();
  }
  sub_2471FD348(v22[19], v22[20]);

  sub_24726B6A0(v22[16], v22[7]);
  OUTLINED_FUNCTION_92_4();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_66_0();
  return v31(v31, v32, v33, v34, v35, v36, v37, v38, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2472665D0()
{
  os_log_type_t v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v2 = *(void **)(v1 + 192);
  v3 = *(NSObject **)(v1 + 136);
  sub_247209A20(*(_QWORD *)(v1 + 128), (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
  v4 = v2;
  v5 = v2;
  sub_247279030();
  v6 = OUTLINED_FUNCTION_136();
  if (OUTLINED_FUNCTION_24_1(v6))
  {
    v7 = *(void **)(v1 + 192);
    v8 = (uint8_t *)OUTLINED_FUNCTION_45();
    v9 = OUTLINED_FUNCTION_45();
    *(_DWORD *)v8 = 136315138;
    v18 = v9;
    *(_QWORD *)(v1 + 32) = v7;
    v10 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D68);
    v11 = sub_2472791E0();
    *(_QWORD *)(v1 + 40) = sub_2472728FC(v11, v12, &v18);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_76_4();
    OUTLINED_FUNCTION_76_4();
    OUTLINED_FUNCTION_47_2(&dword_2471ED000, v3, v0, "Unable to get suggestions from remote service. %s", v8);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_24_0();
  }
  v13 = *(void **)(v1 + 192);

  v14 = *(void **)(v1 + 192);
  v15 = *(_QWORD *)(v1 + 160);
  v16 = *(_QWORD *)(v1 + 152);
  sub_2472302A0(*(_QWORD *)(v1 + 168), *(_QWORD *)(v1 + 56), (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);

  sub_2471FD348(v16, v15);
  OUTLINED_FUNCTION_92_4();
  OUTLINED_FUNCTION_104();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24726677C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  type metadata accessor for SiriSuggestions.SuggestionList();
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2472667DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v1 = v0[6];
  v2 = v0[7];
  v4 = v0[4];
  v3 = v0[5];
  v5 = v0[3];
  v6 = (_QWORD *)OUTLINED_FUNCTION_124();
  v0[9] = v6;
  v6[2] = v5;
  v6[3] = v4;
  v6[4] = v3;
  v6[5] = v1;
  v6[6] = v2;
  swift_retain();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_122_2(v1);
  v7 = (_QWORD *)swift_task_alloc();
  v0[10] = v7;
  *v7 = v0;
  v7[1] = sub_24726688C;
  return sub_247266BD8(v0[8], (uint64_t)sub_24726D0B4, (uint64_t)v6);
}

uint64_t sub_24726688C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_61(v2);
  *(_QWORD *)(v0 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_2472668E0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_24726D0C4(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16));
  OUTLINED_FUNCTION_104();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_5(v1);
}

uint64_t sub_247266914()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_104();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

void sub_247266944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v5 = *(void **)(a3 + 16);
  v6 = (void *)sub_247279198();
  v7 = (void *)sub_2472782BC();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v10[4] = sub_24726D634;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_247266B48;
  v10[3] = &block_descriptor_143;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_suggestNextWithRequestId_extraStateStoreProperties_completionHandler_, v6, v7, v9);
  _Block_release(v9);

}

uint64_t sub_247266A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  if (qword_25443A1C8 != -1)
    swift_once();
  v8 = sub_247279048();
  __swift_project_value_buffer(v8, (uint64_t)qword_25443A330);
  v9 = sub_247279030();
  v10 = sub_2472793A8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2471ED000, v9, v10, "xpc connection executing suggestNext() to get next suggestions", v11, 2u);
    MEMORY[0x249575BC8](v11, -1, -1);
  }

  return a4(a1, a2, a3);
}

uint64_t sub_247266B48(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(uint64_t, unint64_t, void *);
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v5 = *(void (**)(uint64_t, unint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a2;
  v7 = sub_2472782C8();
  v9 = v8;

  v10 = a3;
  v5(v7, v9, a3);

  sub_2471FD35C(v7, v9);
  return swift_release();
}

uint64_t sub_247266BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *v3;
  v4[7] = type metadata accessor for SiriSuggestions.SuggestionList();
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247266C40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_131();
  if (qword_25767C648 != -1)
    swift_once();
  v1 = v0[6];
  v3 = v0[3];
  v2 = v0[4];
  v4 = __swift_project_value_buffer(v0[7], (uint64_t)qword_25767E988);
  OUTLINED_FUNCTION_165_0(v4, v5, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
  v6 = (_QWORD *)OUTLINED_FUNCTION_124();
  v0[9] = v6;
  v6[2] = v3;
  v6[3] = v2;
  v6[4] = v1;
  OUTLINED_FUNCTION_96_3();
  v7 = (_QWORD *)swift_task_alloc();
  v0[10] = v7;
  *v7 = v0;
  v7[1] = sub_247266D28;
  OUTLINED_FUNCTION_201();
  return v12(v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t sub_247266D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_115();
  v1 = *(_QWORD *)(v0 + 64);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_58_0();
  sub_247209A20(v1, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
  OUTLINED_FUNCTION_80_2();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_211(v2);
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:properties:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = OUTLINED_FUNCTION_183();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247266DBC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD *v3;

  v1 = (void *)sub_247278D84();
  sub_247278D6C();

  v2 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_176_0();

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *v3 = v0;
  v3[1] = sub_247266E48;
  return sub_247264A54(*(_QWORD *)(v0 + 32));
}

uint64_t sub_247266E48(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = a2;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247266E98()
{
  void *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t (*v17)(void);

  OUTLINED_FUNCTION_62_4();
  v2 = v1[11];
  if (v2 >> 60 == 15)
  {
    if (qword_25443A1C8 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_81_0();
    OUTLINED_FUNCTION_19_1(v3, (uint64_t)qword_25443A330);
    v4 = OUTLINED_FUNCTION_136();
    if (OUTLINED_FUNCTION_49(v4))
    {
      v5 = (_WORD *)OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_60_1(v5);
      OUTLINED_FUNCTION_56(&dword_2471ED000, v6, v7, "Unable to send required supporting data.");
      OUTLINED_FUNCTION_24_0();
    }

    v8 = (void *)OUTLINED_FUNCTION_174_0();
    OUTLINED_FUNCTION_21_12();

    OUTLINED_FUNCTION_18_13();
    OUTLINED_FUNCTION_104();
    v9 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
    return OUTLINED_FUNCTION_43_8(v9);
  }
  else
  {
    v10 = v1[10];
    v11 = v1[5];
    v13 = v1[2];
    v12 = v1[3];
    v14 = (_QWORD *)OUTLINED_FUNCTION_124();
    v1[12] = v14;
    v14[2] = v11;
    v14[3] = v13;
    v14[4] = v12;
    v14[5] = v10;
    v14[6] = v2;
    OUTLINED_FUNCTION_104_4();
    OUTLINED_FUNCTION_25_0();
    sub_2471FD2F0(v10, v2);
    v17 = (uint64_t (*)(void))((char *)&dword_25767E9E8 + dword_25767E9E8);
    v15 = (_QWORD *)swift_task_alloc();
    v1[13] = v15;
    *v15 = v1;
    v15[1] = sub_247266FF4;
    return OUTLINED_FUNCTION_43_8(v17);
  }
}

uint64_t sub_247266FF4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_61(v2);
  *(_QWORD *)(v0 + 112) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_247267048()
{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);

  sub_2471FD348(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  v1 = (void *)OUTLINED_FUNCTION_174_0();
  OUTLINED_FUNCTION_21_12();

  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_104();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_2_15(v2);
}

uint64_t sub_24726709C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 56);
  sub_2471FD348(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_58_0();
  v2 = (void *)sub_247278D84();
  sub_247278D78();

  OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_80_2();
  return OUTLINED_FUNCTION_2_15(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247267114(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11, v14);
  sub_24722F1E4(a1, (uint64_t)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254438808);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = swift_allocObject();
  sub_24726DA24((uint64_t)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, &qword_254438808);
  sub_247267214(a3, a4, a5, a6, (uint64_t)sub_24726CE88, v16);
  return swift_release();
}

void sub_247267214(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t aBlock[6];

  v7 = v6;
  if (qword_25443A1C8 != -1)
    swift_once();
  v12 = sub_247279048();
  __swift_project_value_buffer(v12, (uint64_t)qword_25443A330);
  sub_24727912C();
  sub_2471FD304(a3, a4);
  sub_24727912C();
  sub_2471FD304(a3, a4);
  v13 = sub_247279030();
  v14 = sub_2472793A8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    aBlock[0] = v23;
    *(_DWORD *)v15 = 136315394;
    sub_24727912C();
    sub_2472728FC(a1, a2, aBlock);
    sub_2472793D8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    v16 = sub_2472782B0();
    sub_2472728FC(v16, v17, aBlock);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    sub_2471FD35C(a3, a4);
    sub_2471FD35C(a3, a4);
    _os_log_impl(&dword_2471ED000, v13, v14, "Calling Suggestions XPC service submit on request: %s, with stateStoreProperties: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249575BC8](v23, -1, -1);
    MEMORY[0x249575BC8](v15, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_2471FD35C(a3, a4);
    sub_2471FD35C(a3, a4);

  }
  v18 = *(void **)(v7 + 16);
  v19 = (void *)sub_247279198();
  v20 = (void *)sub_2472782BC();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a5;
  *(_QWORD *)(v21 + 24) = a6;
  aBlock[4] = (uint64_t)sub_24726D068;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_247265ACC;
  aBlock[3] = (uint64_t)&block_descriptor_113;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_submitFor_stateStoreProperties_completion_, v19, v20, v22);
  _Block_release(v22);

}

void sub_24726752C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_39_3(v4);
}

uint64_t sub_247267570(uint64_t a1, void (*a2)(void (*)(), uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAF0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7, v10);
  sub_24722F1E4(a1, (uint64_t)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25767EAF0);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  sub_24726DA24((uint64_t)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, &qword_25767EAF0);
  *(_QWORD *)(v12 + ((v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a4;
  a2(sub_24726D440, v12);
  return swift_release();
}

void sub_24726765C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD v41[9];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[3];

  v44 = a2;
  v45 = a5;
  v47 = a4;
  v43 = a1;
  v42 = sub_24727894C();
  v41[7] = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42, v6);
  v41[8] = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24727870C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2472786E8();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)v41 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)v41 - v24;
  v46 = type metadata accessor for SiriSuggestions.SuggestionList();
  MEMORY[0x24BDAC7A8](v46, v26);
  v28 = (char *)v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v29 = a3;
    if (qword_25443A1C8 != -1)
      swift_once();
    v30 = sub_247279048();
    __swift_project_value_buffer(v30, (uint64_t)qword_25443A330);
    v31 = a3;
    v32 = a3;
    v33 = sub_247279030();
    v34 = sub_2472793B4();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v48 = (uint64_t)a3;
      v49[0] = v36;
      *(_DWORD *)v35 = 136315138;
      v37 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254438D68);
      v38 = sub_2472791E0();
      v48 = sub_2472728FC(v38, v39, v49);
      sub_2472793D8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2471ED000, v33, v34, "Cannot provide next suggestions because of %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249575BC8](v36, -1, -1);
      MEMORY[0x249575BC8](v35, -1, -1);
    }
    else
    {

    }
    if (qword_25767C648 != -1)
      swift_once();
    v40 = __swift_project_value_buffer(v46, (uint64_t)qword_25767E988);
    sub_247262E10(v40);

  }
  else
  {
    v41[2] = v8;
    v41[3] = v18;
    v41[0] = v12;
    v41[1] = v9;
    v41[4] = v22;
    v41[5] = v14;
    v41[6] = v25;
    sub_247267E2C();
    sub_247262E10((uint64_t)v28);
    sub_247209A20((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestions.SuggestionList);
  }
}

uint64_t sub_247267E2C()
{
  sub_2472781FC();
  swift_allocObject();
  sub_2472781F0();
  type metadata accessor for SiriSuggestions.SuggestionList();
  sub_2471FDEF8(&qword_254437D10, 255, (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestions.SuggestionList, (uint64_t)&protocol conformance descriptor for SiriSuggestions.SuggestionList);
  sub_2472781E4();
  return swift_release();
}

uint64_t SiriSuggestionsXPCClient.warmup()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_23();
}

uint64_t sub_247267F04()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  if (qword_25443A1C8 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_81_0();
  OUTLINED_FUNCTION_19_1(v2, (uint64_t)qword_25443A330);
  v3 = OUTLINED_FUNCTION_81_1();
  if (OUTLINED_FUNCTION_49(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_60_1(v4);
    OUTLINED_FUNCTION_56(&dword_2471ED000, v5, v6, "Starting suggestions warmup process");
    OUTLINED_FUNCTION_24_0();
  }

  v9 = (uint64_t (*)(void))((char *)&dword_25767E9E8 + dword_25767E9E8);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v7;
  *v7 = v1;
  v7[1] = sub_247267FEC;
  return OUTLINED_FUNCTION_75_5(v9);
}

uint64_t sub_247267FEC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_52_10();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

void sub_247268030(void *a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  _QWORD *v8;

  if (a1)
  {
    v2 = a1;
    if (qword_25443A1C8 != -1)
      swift_once();
    v3 = sub_247279048();
    __swift_project_value_buffer(v3, (uint64_t)qword_25443A330);
    v4 = sub_247279030();
    v5 = sub_2472793B4();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2471ED000, v4, v5, "Got remote error when warming up suggestions service", v6, 2u);
      MEMORY[0x249575BC8](v6, -1, -1);
    }

    sub_24726BCE4();
    v7 = (void *)swift_allocError();
    *v8 = a1;
    sub_247263270(v7);

  }
  else
  {
    sub_247262D04(&qword_254438808, (uint64_t)&unk_25187EFB0, (uint64_t)&unk_25767EAA8);
  }
}

uint64_t SiriSuggestionsXPCClient.submitEngagement(for:with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  v3[13] = type metadata accessor for SiriSuggestionsIntentPropertiesTransport();
  v3[14] = OUTLINED_FUNCTION_50();
  v4 = OUTLINED_FUNCTION_11_3();
  v3[15] = v4;
  v3[16] = *(_QWORD *)(v4 - 8);
  v3[17] = OUTLINED_FUNCTION_50();
  v5 = sub_247278D18();
  v3[18] = v5;
  v3[19] = *(_QWORD *)(v5 - 8);
  v3[20] = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_2472681F4()
{
  uint64_t *v0;
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
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t *v30;
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
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v44;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;

  if (qword_25443A1C8 != -1)
    swift_once();
  v2 = v0 + 10;
  v1 = v0[10];
  v4 = v0[19];
  v3 = v0[20];
  v47 = v0;
  v5 = v0[17];
  v6 = v2[8];
  v8 = v2[5];
  v7 = v2[6];
  v9 = v2[1];
  v10 = OUTLINED_FUNCTION_81_0();
  __swift_project_value_buffer(v10, (uint64_t)qword_25443A330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v9, v8);
  v11 = sub_247279030();
  v12 = sub_2472793A8();
  v13 = OUTLINED_FUNCTION_42_11(v11);
  v14 = v2[7];
  v15 = v2[6];
  if (v13)
  {
    v46 = v2[6];
    v16 = OUTLINED_FUNCTION_45();
    v48 = OUTLINED_FUNCTION_45();
    *(_DWORD *)v16 = 136315394;
    v17 = sub_247278D0C();
    v47[8] = sub_2472728FC(v17, v18, &v48);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_124_3();
    *(_WORD *)(v16 + 12) = 2080;
    OUTLINED_FUNCTION_34_6(&qword_254438D48, v19, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v20 = sub_247279708();
    v47[9] = sub_2472728FC(v20, v21, &v48);
    OUTLINED_FUNCTION_175();
    sub_2472793D8();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_107_3(v14, *(uint64_t (**)(uint64_t, uint64_t))(v46 + 8));
    OUTLINED_FUNCTION_88_0(&dword_2471ED000, v11, v12, "Logging action: %s as intent for %s", (uint8_t *)v16);
    OUTLINED_FUNCTION_87_0();
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_124_3();
  OUTLINED_FUNCTION_107_3(v14, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));

  v23 = (int *)v47[13];
  v22 = (uint64_t *)v47[14];
  *v22 = sub_247278D00();
  v22[1] = v24;
  v25 = *MEMORY[0x24BEA6F28];
  v26 = sub_2472788EC();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v22, v25, v26);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v26);
  v27 = sub_2472788F8();
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x24BEA6F78];
  OUTLINED_FUNCTION_7_1();
  v29 = MEMORY[0x2495747E8](0x6E776F6E6B6E75, 0xE700000000000000);
  v30 = (uint64_t *)((char *)v22 + v23[5]);
  v30[3] = v27;
  sub_2471FDEF8(&qword_2544382B0, 255, v28, MEMORY[0x24BEA6F70]);
  v30[4] = v31;
  *v30 = v29;
  v32 = sub_247278CF4();
  sub_2471F4DF8(v32);
  v34 = v33;
  OUTLINED_FUNCTION_9_0();
  *(uint64_t *)((char *)v22 + v23[6]) = v34;
  *(_OWORD *)((char *)v22 + v23[7]) = xmmword_247280BE0;
  v35 = sub_2472782EC();
  v37 = v36;
  v47[21] = v36;
  v47[5] = (uint64_t)v23;
  OUTLINED_FUNCTION_154_1(&qword_254438238, v36, v38, (uint64_t)&protocol conformance descriptor for SiriSuggestionsIntentPropertiesTransport);
  v47[6] = v39;
  OUTLINED_FUNCTION_154_1(&qword_254438230, v40, v41, (uint64_t)&protocol conformance descriptor for SiriSuggestionsIntentPropertiesTransport);
  v47[7] = v42;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47 + 2);
  sub_2472302A0((uint64_t)v22, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestionsIntentPropertiesTransport);
  v44 = (_QWORD *)swift_task_alloc();
  v47[22] = (uint64_t)v44;
  *v44 = v47;
  v44[1] = sub_2472685C8;
  return SiriSuggestionsXPCClient.logEngagement(for:intent:)(v35, v37, (uint64_t)(v47 + 2));
}

uint64_t sub_2472685C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v1;
  v2 = v4;
  OUTLINED_FUNCTION_61(&v4);
  *(_QWORD *)(v2 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_28();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_2Tm(v2 + 16);
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_77();
}

uint64_t sub_24726862C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_247209A20(*(_QWORD *)(v0 + 112), (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestionsIntentPropertiesTransport);
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_80_2();
  OUTLINED_FUNCTION_125_0();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return v1();
}

uint64_t sub_247268684()
{
  uint64_t v0;

  sub_247209A20(*(_QWORD *)(v0 + 112), (uint64_t (*)(_QWORD))type metadata accessor for SiriSuggestionsIntentPropertiesTransport);
  __swift_destroy_boxed_opaque_existential_2Tm(v0 + 16);
  OUTLINED_FUNCTION_80_2();
  OUTLINED_FUNCTION_125_0();
  OUTLINED_FUNCTION_128_0();
  return OUTLINED_FUNCTION_2_15(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t SiriSuggestionsXPCClient.logEngagement(for:intent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v5 = OUTLINED_FUNCTION_183();
  v4[13] = v5;
  v4[14] = *(_QWORD *)(v5 - 8);
  v4[15] = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247268728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  unint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t (*v40)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v49;

  OUTLINED_FUNCTION_52_0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_25443A1C8 != -1)
    swift_once();
  v25 = OUTLINED_FUNCTION_81_0();
  v26 = __swift_project_value_buffer(v25, (uint64_t)qword_25443A330);
  swift_bridgeObjectRetain_n();
  sub_247279030();
  v27 = OUTLINED_FUNCTION_81_1();
  v28 = OUTLINED_FUNCTION_49(v27);
  v29 = *(_QWORD *)(v22 + 80);
  if (v28)
  {
    v30 = *(_QWORD *)(v22 + 72);
    v31 = (uint8_t *)OUTLINED_FUNCTION_45();
    a11 = OUTLINED_FUNCTION_45();
    *(_DWORD *)v31 = 136315138;
    OUTLINED_FUNCTION_25_0();
    *(_QWORD *)(v22 + 64) = sub_2472728FC(v30, v29, &a11);
    OUTLINED_FUNCTION_332();
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_47_2(&dword_2471ED000, v26, (os_log_type_t)v26, "Submitting current intent properties for %s", v31);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_44();

  v32 = *(_QWORD *)(v22 + 88);
  v33 = *(_QWORD *)(v22 + 96);
  v35 = *(_QWORD *)(v22 + 72);
  v34 = *(_QWORD *)(v22 + 80);
  v36 = (void *)sub_247278D84();
  sub_247278D6C();

  v37 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_176_0();

  sub_247203640(v32, v22 + 16);
  v38 = OUTLINED_FUNCTION_124();
  *(_QWORD *)(v22 + 128) = v38;
  *(_QWORD *)(v38 + 16) = v33;
  *(_QWORD *)(v38 + 24) = v35;
  *(_QWORD *)(v38 + 32) = v34;
  sub_2471F853C((__int128 *)(v22 + 16), (_OWORD *)(v38 + 40));
  v49 = (char *)&dword_25767E9E8 + dword_25767E9E8;
  OUTLINED_FUNCTION_97();
  swift_retain();
  v39 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v22 + 136) = v39;
  *v39 = v22;
  v39[1] = sub_247268958;
  OUTLINED_FUNCTION_66_0();
  return v40(v40, v41, v42, v43, v44, v45, v46, v47, a9, v49, a11, a12, a13, a14);
}

uint64_t sub_247268958()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_61(v2);
  *(_QWORD *)(v0 + 144) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_2472689AC()
{
  void *v0;
  uint64_t (*v1)(void);

  v0 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_19_11();

  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_104();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_2_15(v1);
}

uint64_t sub_2472689F8()
{
  uint64_t v0;
  void *v1;

  swift_release();
  v1 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_19_11();

  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_104();
  return OUTLINED_FUNCTION_2_15(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_247268A4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2, v5);
  sub_24722F1E4(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254438808);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_24726DA24((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, &qword_254438808);
  SiriSuggestionsXPCClient.logIntent(for:intent:completion:)();
  return swift_release();
}

void SiriSuggestionsXPCClient.logIntent(for:intent:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t (*)(void), uint64_t);
  void (*v4)(uint64_t (*)(void), uint64_t);
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  void (*v38)(uint64_t (*)(void), uint64_t);
  uint64_t v39;
  __int128 v40;
  uint64_t v41[3];
  __int128 v42;
  uint64_t v43;

  OUTLINED_FUNCTION_53();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v39 = v7;
  v8 = OUTLINED_FUNCTION_142_3();
  v9 = MEMORY[0x24BEA7310];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v11);
  OUTLINED_FUNCTION_65();
  v14 = v13 - v12;
  OUTLINED_FUNCTION_182_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_181();
  sub_247278208();
  v15 = v6[5];
  v40 = *(_OWORD *)(v6 + 3);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v42 = v40;
  v43 = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  OUTLINED_FUNCTION_100_2((uint64_t)boxed_opaque_existential_1);
  sub_247278B80();
  OUTLINED_FUNCTION_156_0(&qword_254438D50, v17, v18, MEMORY[0x24BEA7320]);
  OUTLINED_FUNCTION_108_3();
  if (v9)
  {
    OUTLINED_FUNCTION_111_1(v14, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    OUTLINED_FUNCTION_106_3();
    v4(v9, 1);
    OUTLINED_FUNCTION_39_10();
    OUTLINED_FUNCTION_39_10();
  }
  else
  {
    v38 = v4;
    OUTLINED_FUNCTION_111_1(v14, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    if (qword_25443A1C8 != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_81_0();
    v20 = __swift_project_value_buffer(v19, (uint64_t)qword_25443A330);
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_66_4();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_66_4();
    v37 = v20;
    v21 = sub_247279030();
    v22 = sub_2472793A8();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = OUTLINED_FUNCTION_45();
      v41[0] = OUTLINED_FUNCTION_45();
      *(_DWORD *)v23 = 136315394;
      OUTLINED_FUNCTION_15_10();
      OUTLINED_FUNCTION_146_2(v39, v24, v41);
      sub_2472793D8();
      OUTLINED_FUNCTION_102();
      *(_WORD *)(v23 + 12) = 2080;
      v25 = OUTLINED_FUNCTION_145_3();
      sub_2472728FC(v25, v26, v41);
      sub_2472793D8();
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_13_13();
      OUTLINED_FUNCTION_13_13();
      OUTLINED_FUNCTION_88_0(&dword_2471ED000, v21, v22, "Calling Suggestions XPC service on request: %s, with intent value: %s", (uint8_t *)v23);
      OUTLINED_FUNCTION_87_0();
      OUTLINED_FUNCTION_24_0();
    }
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_13_13();
    OUTLINED_FUNCTION_13_13();

    v27 = *(void **)(v0 + 16);
    v28 = (void *)sub_247279198();
    v29 = (void *)sub_2472782BC();
    v30 = OUTLINED_FUNCTION_124();
    *(_QWORD *)(v30 + 16) = v38;
    *(_QWORD *)(v30 + 24) = v2;
    *((_QWORD *)&v42 + 1) = sub_24726DAE8;
    v43 = v30;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 1107296256;
    v41[2] = (uint64_t)sub_247265ACC;
    *(_QWORD *)&v42 = &block_descriptor;
    v31 = _Block_copy(v41);
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_logIntentFor_intent_completion_, v28, v29, v31);
    _Block_release(v31);

    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_66_4();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_66_4();
    sub_247279030();
    v32 = OUTLINED_FUNCTION_81_1();
    if (OUTLINED_FUNCTION_116_3(v32))
    {
      v33 = OUTLINED_FUNCTION_45();
      v41[0] = OUTLINED_FUNCTION_45();
      *(_DWORD *)v33 = 136315394;
      OUTLINED_FUNCTION_15_10();
      OUTLINED_FUNCTION_146_2(v39, v34, v41);
      sub_2472793D8();
      OUTLINED_FUNCTION_102();
      *(_WORD *)(v33 + 12) = 2080;
      v35 = OUTLINED_FUNCTION_145_3();
      sub_2472728FC(v35, v36, v41);
      sub_2472793D8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_13_13();
      OUTLINED_FUNCTION_13_13();
      OUTLINED_FUNCTION_88_0(&dword_2471ED000, v37, (os_log_type_t)v29, "Suggestions XPC service on request: %s, with intent value: %s", (uint8_t *)v33);
      OUTLINED_FUNCTION_87_0();
      OUTLINED_FUNCTION_24_0();
    }
    OUTLINED_FUNCTION_13_13();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_13_13();
    OUTLINED_FUNCTION_13_13();

  }
  swift_release();
  OUTLINED_FUNCTION_34();
}

uint64_t SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(_QWORD *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 88) = v4;
  *(_QWORD *)(v5 + 64) = a2;
  *(_QWORD *)(v5 + 72) = a3;
  v7 = OUTLINED_FUNCTION_183();
  *(_QWORD *)(v5 + 96) = v7;
  *(_QWORD *)(v5 + 104) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 112) = OUTLINED_FUNCTION_50();
  *(_OWORD *)(v5 + 120) = *(_OWORD *)a1;
  *(_BYTE *)(v5 + 160) = *(_BYTE *)(a1 + 16);
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_247269088()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 64);
  v7 = (void *)sub_247278D84();
  sub_247278D6C();

  v8 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_176_0();

  sub_247203640(v5, v0 + 16);
  v9 = OUTLINED_FUNCTION_124();
  *(_QWORD *)(v0 + 136) = v9;
  *(_QWORD *)(v9 + 16) = v4;
  *(_QWORD *)(v9 + 24) = v3;
  *(_QWORD *)(v9 + 32) = v2;
  *(_BYTE *)(v9 + 40) = v1;
  *(_QWORD *)(v9 + 48) = v12;
  *(_QWORD *)(v9 + 56) = v6;
  sub_2471F853C((__int128 *)(v0 + 16), (_OWORD *)(v9 + 64));
  swift_retain();
  OUTLINED_FUNCTION_24();
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25767E9E8 + dword_25767E9E8);
  sub_24727912C();
  v10 = (_QWORD *)OUTLINED_FUNCTION_178_0();
  *(_QWORD *)(v0 + 144) = v10;
  *v10 = v0;
  v10[1] = sub_2472691CC;
  return v13((uint64_t)v13, (uint64_t)sub_24726B7C4, v9);
}

uint64_t sub_2472691CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_61(v2);
  *(_QWORD *)(v0 + 152) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_247269220()
{
  void *v0;
  uint64_t (*v1)(void);

  v0 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_19_11();

  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_104();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_2_15(v1);
}

uint64_t sub_24726926C()
{
  uint64_t v0;
  void *v1;

  swift_release();
  v1 = (void *)sub_247278D84();
  OUTLINED_FUNCTION_19_11();

  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_104();
  return OUTLINED_FUNCTION_2_15(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2472692C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  char v18;

  v17[1] = a7;
  v17[2] = a8;
  v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254438808) - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8]();
  v17[3] = a3;
  v17[4] = a4;
  v18 = a5 & 1;
  sub_24722F1E4(a1, (uint64_t)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254438808);
  v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v15 = swift_allocObject();
  sub_24726DA24((uint64_t)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, &qword_254438808);
  SiriSuggestionsXPCClient.submit(for:propertyKey:propertyValue:completion:)();
  return swift_release();
}

void sub_2472693D4(void *a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    sub_247263270(a1);
    sub_247223090(a1, 1);
  }
  else
  {
    sub_247262D04(&qword_254438808, (uint64_t)&unk_25187EFB0, (uint64_t)&unk_25767EAA8);
    OUTLINED_FUNCTION_30();
  }
}

void SiriSuggestionsXPCClient.submit(for:propertyKey:propertyValue:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t (*)(void), uint64_t);
  void (*v5)(uint64_t (*)(void), uint64_t);
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  __int128 v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)();
  __int128 v59;
  uint64_t v60;

  OUTLINED_FUNCTION_53();
  v48 = v0;
  v49 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v51 = v8;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_142_3();
  v12 = MEMORY[0x24BEA7310];
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_65();
  v16 = v15 - v14;
  v47 = *(_QWORD *)v10;
  v50 = *(_QWORD *)(v10 + 8);
  v52 = *(_BYTE *)(v10 + 16);
  OUTLINED_FUNCTION_182_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_181();
  sub_247278208();
  v17 = v7[5];
  v53 = *(_OWORD *)(v7 + 3);
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v59 = v53;
  v60 = v17;
  v18 = __swift_allocate_boxed_opaque_existential_1(&v56);
  OUTLINED_FUNCTION_100_2((uint64_t)v18);
  sub_247278B80();
  OUTLINED_FUNCTION_156_0(&qword_254438D50, v19, v20, MEMORY[0x24BEA7320]);
  v21 = OUTLINED_FUNCTION_108_3();
  v54 = v22;
  if (v12)
  {
    OUTLINED_FUNCTION_107_3(v16, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    OUTLINED_FUNCTION_106_3();
    v5(v12, 1);
    OUTLINED_FUNCTION_39_10();
    OUTLINED_FUNCTION_39_10();
    OUTLINED_FUNCTION_46_5();
  }
  else
  {
    v46 = v3;
    v23 = v21;
    OUTLINED_FUNCTION_107_3(v16, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    if (qword_25443A1C8 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_81_0();
    __swift_project_value_buffer(v24, (uint64_t)qword_25443A330);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_122_2(v23);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_15_10();
    OUTLINED_FUNCTION_122_2(v23);
    v25 = sub_247279030();
    v26 = sub_2472793A8();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = OUTLINED_FUNCTION_45();
      v55 = OUTLINED_FUNCTION_45();
      *(_DWORD *)v27 = 136315650;
      v56 = v47;
      v57 = v50;
      LOBYTE(v58) = v52;
      v28 = InteractionIdentifier.description.getter();
      v56 = OUTLINED_FUNCTION_149_2(v28, v29);
      sub_2472793D8();
      OUTLINED_FUNCTION_30_0();
      OUTLINED_FUNCTION_140_3();
      OUTLINED_FUNCTION_140_3();
      *(_WORD *)(v27 + 12) = 2080;
      sub_24727912C();
      v30 = sub_2472728FC(v49, v51, &v55);
      OUTLINED_FUNCTION_148_2(v30);
      sub_2472793D8();
      OUTLINED_FUNCTION_102();
      *(_WORD *)(v27 + 22) = 2080;
      v31 = OUTLINED_FUNCTION_145_3();
      v33 = OUTLINED_FUNCTION_149_2(v31, v32);
      OUTLINED_FUNCTION_148_2(v33);
      sub_2472793D8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_168_0();
      OUTLINED_FUNCTION_168_0();
      _os_log_impl(&dword_2471ED000, v25, v26, "Calling Suggestions XPC service submit on request: %s, for key: %s, with value: %s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_24_0();
    }
    OUTLINED_FUNCTION_143_2();
    OUTLINED_FUNCTION_143_2();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_162_0(v23);
    OUTLINED_FUNCTION_162_0(v23);

    if ((v52 & 1) != 0)
    {
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_41();
      v34 = sub_247279030();
      v35 = sub_2472793B4();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)OUTLINED_FUNCTION_45();
        v37 = OUTLINED_FUNCTION_45();
        *(_DWORD *)v36 = 136315138;
        v55 = v37;
        v56 = v47;
        v57 = v50;
        LOBYTE(v58) = 1;
        v38 = InteractionIdentifier.description.getter();
        v56 = OUTLINED_FUNCTION_149_2(v38, v39);
        OUTLINED_FUNCTION_332();
        OUTLINED_FUNCTION_9_0();
        OUTLINED_FUNCTION_67_8();
        OUTLINED_FUNCTION_67_8();
        OUTLINED_FUNCTION_47_2(&dword_2471ED000, v34, v35, "Unknown interaction id type: %s for XPC submission", v36);
        OUTLINED_FUNCTION_69_0();
        OUTLINED_FUNCTION_24_0();
      }
      OUTLINED_FUNCTION_166();
      OUTLINED_FUNCTION_46_5();
      OUTLINED_FUNCTION_67_8();
      OUTLINED_FUNCTION_67_8();

    }
    else
    {
      v40 = *(void **)(v48 + 16);
      v41 = (void *)sub_247279198();
      v42 = (void *)sub_247279198();
      v43 = (void *)sub_2472782BC();
      v44 = OUTLINED_FUNCTION_124();
      *(_QWORD *)(v44 + 16) = v5;
      *(_QWORD *)(v44 + 24) = v46;
      *((_QWORD *)&v59 + 1) = sub_24726DAE8;
      v60 = v44;
      v56 = MEMORY[0x24BDAC760];
      v57 = 1107296256;
      v58 = sub_247265ACC;
      *(_QWORD *)&v59 = &block_descriptor_33;
      v45 = _Block_copy(&v56);
      swift_retain();
      swift_release();
      objc_msgSend(v40, sel_submitFor_propertyKey_propertyValue_completion_, v41, v42, v43, v45);
      sub_2471FD35C(v23, v54);
      OUTLINED_FUNCTION_46_5();
      _Block_release(v45);

    }
  }
  OUTLINED_FUNCTION_34();
}

void sub_247269A0C(void *a1, void (*a2)(void *, uint64_t))
{
  id v4;

  if (a1)
  {
    v4 = a1;
    a2(a1, 1);

  }
  else
  {
    a2(0, 0);
    OUTLINED_FUNCTION_148();
  }
}

uint64_t SiriSuggestionsXPCClient.refreshService()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_23();
}

uint64_t sub_247269A70()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v3 = (uint64_t (*)(void))((char *)&dword_25767E9E8 + dword_25767E9E8);
  swift_retain();
  v1 = (_QWORD *)OUTLINED_FUNCTION_178_0();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_247269ADC;
  return OUTLINED_FUNCTION_75_5(v3);
}

uint64_t sub_247269ADC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_52_10();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_247269B20()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

void sub_247269B4C()
{
  SEL *v0;
  SEL *v1;
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
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];

  OUTLINED_FUNCTION_53();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10, v13);
  v14 = *(void **)(v7 + 16);
  sub_24722F1E4(v9, (uint64_t)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254438808);
  v15 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v16 = OUTLINED_FUNCTION_167();
  sub_24726DA24((uint64_t)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, &qword_254438808);
  v18[4] = v5;
  v18[5] = v16;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_247265ACC;
  v18[3] = v3;
  v17 = _Block_copy(v18);
  swift_release();
  objc_msgSend(v14, *v1, v17);
  _Block_release(v17);
  OUTLINED_FUNCTION_34();
}

uint64_t SiriSuggestionsXPCClient.log(from:deliveryVehicle:generationId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v5 = OUTLINED_FUNCTION_11_3();
  v4[13] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[14] = v6;
  v4[15] = *(_QWORD *)(v6 + 64);
  v4[16] = OUTLINED_FUNCTION_26_7();
  v4[17] = swift_task_alloc();
  v7 = OUTLINED_FUNCTION_142_3();
  v4[18] = v7;
  v4[19] = *(_QWORD *)(v7 - 8);
  v4[20] = OUTLINED_FUNCTION_26_7();
  v4[21] = swift_task_alloc();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_247269CD8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void (*v31)(void);
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  unint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52[7];

  if (qword_25443A1C8 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_81_0();
  v2 = (void *)__swift_project_value_buffer(v1, (uint64_t)qword_25443A330);
  sub_247279030();
  v3 = OUTLINED_FUNCTION_81_1();
  if (OUTLINED_FUNCTION_49(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_60_1(v4);
    OUTLINED_FUNCTION_56(&dword_2471ED000, v5, v6, "logging over XPC connection");
    OUTLINED_FUNCTION_24_0();
  }
  v7 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 144);

  OUTLINED_FUNCTION_182_0();
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)(v0 + 176) = OUTLINED_FUNCTION_181();
  sub_247278208();
  v52[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254438D28);
  sub_24726B814(&qword_254437DB0, &qword_254437CF8, (uint64_t)&protocol conformance descriptor for SiriSuggestions.Suggestion, MEMORY[0x24BEE12D0]);
  v52[4] = v9;
  sub_24726B814(&qword_254438680, &qword_2544385C8, (uint64_t)&protocol conformance descriptor for SiriSuggestions.Suggestion, MEMORY[0x24BEE12A0]);
  v52[5] = v10;
  v52[0] = v7;
  OUTLINED_FUNCTION_25_0();
  sub_247278B80();
  OUTLINED_FUNCTION_34_6(&qword_254438D50, v11, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7310], MEMORY[0x24BEA7320]);
  v13 = OUTLINED_FUNCTION_108_3();
  *(_QWORD *)(v0 + 184) = v13;
  *(_QWORD *)(v0 + 192) = v12;
  v14 = *(_QWORD *)(v0 + 168);
  if (v8)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(v14, *(_QWORD *)(v0 + 144));
LABEL_9:
    OUTLINED_FUNCTION_58_0();
    swift_task_dealloc();
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_80_2();
    OUTLINED_FUNCTION_128_0();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v49 = v13;
  v50 = v12;
  v15 = *(_QWORD *)(v0 + 80);
  v48 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 152) + 8);
  v48(v14, *(_QWORD *)(v0 + 144));
  v16 = sub_247278B08();
  *(_QWORD *)(v0 + 40) = v16;
  OUTLINED_FUNCTION_155_0(&qword_254438FB8, v17, v18, MEMORY[0x24BEA7270]);
  *(_QWORD *)(v0 + 48) = v19;
  OUTLINED_FUNCTION_155_0(&qword_254438628, v20, v21, MEMORY[0x24BEA7258]);
  *(_QWORD *)(v0 + 56) = v22;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  OUTLINED_FUNCTION_138_2((uint64_t)boxed_opaque_existential_1, v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16));
  sub_247278B80();
  v24 = OUTLINED_FUNCTION_108_3();
  v26 = v25;
  *(_QWORD *)(v0 + 200) = v24;
  *(_QWORD *)(v0 + 208) = v25;
  v27 = *(_QWORD *)(v0 + 160);
  v28 = *(_QWORD *)(v0 + 144);
  if (v0 != -16)
  {
    v48(v27, v28);
    sub_2471FD35C(v49, v50);
    goto LABEL_9;
  }
  v30 = MEMORY[0x60];
  v48(v27, v28);
  v31 = *(void (**)(void))(v30 + 16);
  OUTLINED_FUNCTION_175();
  v31();
  v32 = sub_247279030();
  v33 = sub_2472793A8();
  v34 = OUTLINED_FUNCTION_42_11(v32);
  v35 = MEMORY[0x78];
  if (v34)
  {
    v46 = MEMORY[0x60];
    v36 = (uint8_t *)swift_slowAlloc();
    v52[0] = OUTLINED_FUNCTION_45();
    *(_DWORD *)v36 = 136315138;
    OUTLINED_FUNCTION_34_6(&qword_254438D48, v37, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = sub_247279708();
    MEMORY[0x30] = sub_2472728FC(v38, v39, v52);
    sub_2472793D8();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_111_1(v35, *(uint64_t (**)(uint64_t, uint64_t))(v46 + 8));
    OUTLINED_FUNCTION_47_2(&dword_2471ED000, v32, v33, "Calling Suggestions XPC service log on request: %s", v36);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_111_1(MEMORY[0x78], *(uint64_t (**)(uint64_t, uint64_t))(MEMORY[0x60] + 8));

  v40 = MEMORY[0x58];
  v41 = MEMORY[0x60];
  v42 = MEMORY[0x50];
  v47 = MEMORY[0x70];
  v31();
  v43 = (*(unsigned __int8 *)(v41 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v44 = (char *)swift_allocObject();
  MEMORY[0xC8] = v44;
  *((_QWORD *)v44 + 2) = v42;
  *((_QWORD *)v44 + 3) = v49;
  *((_QWORD *)v44 + 4) = v50;
  *((_QWORD *)v44 + 5) = v24;
  *((_QWORD *)v44 + 6) = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(&v44[v43], v47, v40);
  swift_retain();
  sub_2471FD304(v49, v50);
  OUTLINED_FUNCTION_122_2(v24);
  v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25767E9E8 + dword_25767E9E8);
  v45 = (_QWORD *)swift_task_alloc();
  MEMORY[0xD0] = v45;
  *v45 = -16;
  v45[1] = sub_24726A1BC;
  return v51((uint64_t)v51, (uint64_t)sub_24726B8D8, (uint64_t)v44);
}

uint64_t sub_24726A1BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_61(v2);
  *(_QWORD *)(v0 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_24726A210()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_62_4();
  v1 = v0[25];
  sub_2471FD35C(v0[23], v0[24]);
  OUTLINED_FUNCTION_162_0(v1);
  swift_release();
  OUTLINED_FUNCTION_128_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_43_8(v2);
}

uint64_t sub_24726A278()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 200);
  sub_2471FD35C(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192));
  sub_2471FD35C(v2, v1);
  swift_release();
  OUTLINED_FUNCTION_58_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_80_2();
  OUTLINED_FUNCTION_125_0();
  OUTLINED_FUNCTION_128_0();
  return OUTLINED_FUNCTION_2_15(*(uint64_t (**)(void))(v0 + 8));
}

void sub_24726A2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4, v7);
  v8 = *(void **)(a2 + 16);
  v9 = (void *)sub_2472782BC();
  v10 = (void *)sub_2472782BC();
  v11 = (void *)sub_247278304();
  sub_24722F1E4(a1, (uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_254438808);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_24726DA24((uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, &qword_254438808);
  aBlock[4] = sub_24726BD24;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247265ACC;
  aBlock[3] = &block_descriptor_67;
  v14 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v8, sel_logWithSuggestions_deliveryVehicle_generationId_completion_, v9, v10, v11, v14);
  _Block_release(v14);

}

void sub_24726A46C(void *a1)
{
  id v2;

  if (a1)
  {
    v2 = a1;
    sub_247263270(a1);

  }
  else
  {
    sub_247262D04(&qword_254438808, (uint64_t)&unk_25187EFB0, (uint64_t)&unk_25767EAA8);
    OUTLINED_FUNCTION_30();
  }
}

uint64_t SiriSuggestionsXPCClient.logEngagement(for:with:invocationType:)()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return OUTLINED_FUNCTION_23();
}

void sub_24726A4D8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _WORD *v3;

  if (qword_25443A1C8 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_81_0();
  v1 = OUTLINED_FUNCTION_19_1(v0, (uint64_t)qword_25443A330);
  v2 = sub_2472793B4();
  if (OUTLINED_FUNCTION_42_11(v1))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_60_1(v3);
    OUTLINED_FUNCTION_25_11(&dword_2471ED000, v1, v2, "This should not be directly logging engagements from the client. Use logIntent instead.");
    OUTLINED_FUNCTION_24_0();
  }

  sub_24726A5B8(0xD000000000000057, 0x8000000247283C20);
}

void sub_24726A5B8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_25443A1C8 != -1)
    swift_once();
  v4 = sub_247279048();
  __swift_project_value_buffer(v4, (uint64_t)qword_25443A330);
  swift_bridgeObjectRetain_n();
  v5 = sub_247279030();
  v6 = sub_2472793B4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v7 = 136315650;
    v8 = sub_247279480();
    sub_2472728FC(v8, v9, &v11);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2048;
    sub_2472793D8();
    *(_WORD *)(v7 + 22) = 2080;
    sub_24727912C();
    sub_2472728FC(a1, a2, &v11);
    sub_2472793D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471ED000, v5, v6, "FatalError at %s:%lu - %s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x249575BC8](v10, -1, -1);
    MEMORY[0x249575BC8](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_247279570();
  __break(1u);
}

void sub_24726A804()
{
  sub_24726A848("Suggestions XPC connection interrupted");
}

uint64_t sub_24726A810(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_24726A83C()
{
  sub_24726A848("Suggestions XPC connection invalidated");
}

void sub_24726A848(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  _WORD *v4;
  NSObject *oslog;

  if (qword_25443A1C8 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_81_0();
  oslog = OUTLINED_FUNCTION_19_1(v2, (uint64_t)qword_25443A330);
  v3 = sub_2472793B4();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_60_1(v4);
    OUTLINED_FUNCTION_25_11(&dword_2471ED000, oslog, v3, a1);
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_39_3(oslog);
}

uint64_t sub_24726A8EC(void *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438D60);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24727930C();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = a1;
  swift_retain();
  sub_2471F1D60((uint64_t)v5, (uint64_t)&unk_25767EB80, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_24726A9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 24) = a4;
  *(_QWORD *)(v5 + 32) = a5;
  return swift_task_switch();
}

uint64_t sub_24726A9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  void *v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;

  OUTLINED_FUNCTION_52_0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_25443A1C8 != -1)
    swift_once();
  v25 = *(void **)(v22 + 24);
  v26 = OUTLINED_FUNCTION_81_0();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_25443A330);
  v28 = v25;
  v29 = v25;
  v30 = v27;
  sub_247279030();
  v31 = OUTLINED_FUNCTION_136();
  v32 = os_log_type_enabled(v27, v31);
  v33 = *(void **)(v22 + 24);
  if (v32)
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_45();
    v35 = OUTLINED_FUNCTION_45();
    *(_DWORD *)v34 = 136315138;
    a11 = v35;
    *(_QWORD *)(v22 + 16) = v33;
    v36 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D68);
    v37 = sub_2472791E0();
    *(_QWORD *)(v22 + 16) = sub_2472728FC(v37, v38, &a11);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_76_4();
    OUTLINED_FUNCTION_76_4();
    OUTLINED_FUNCTION_47_2(&dword_2471ED000, v30, v31, "XPC Service connection failure: %s", v34);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_24_0();
  }
  OUTLINED_FUNCTION_76_4();
  OUTLINED_FUNCTION_76_4();

  OUTLINED_FUNCTION_66_0();
  return swift_task_switch();
}

uint64_t sub_24726AB64()
{
  uint64_t v0;

  sub_2472371BC(*(_QWORD *)(v0 + 24));
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

void sub_24726AB8C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t SiriSuggestionsXPCClient.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_151_1();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriSuggestionsXPCClient.__deallocating_deinit()
{
  SiriSuggestionsXPCClient.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24726AC20()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472036C4;
  OUTLINED_FUNCTION_175();
  return SiriSuggestionsXPCClient.log(from:deliveryVehicle:generationId:)(v2, v3, v4);
}

uint64_t sub_24726AC84()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.logEngagement(for:with:invocationType:)();
}

uint64_t sub_24726ACCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.submitEngagement(for:with:)(a1, a2);
}

void sub_24726AD2C()
{
  SiriSuggestionsXPCClient.description.getter();
}

uint64_t sub_24726AD4C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_150_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472036C4;
  OUTLINED_FUNCTION_201();
  return SiriSuggestionsXPCClient.submitAsync(for:propertyKey:propertyValue:)(v2, v3, v4, v5);
}

uint64_t sub_24726ADB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.submitAsync(for:properties:)(a1, a2, a3);
}

uint64_t sub_24726AE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.logEngagement(for:intent:)(a1, a2, a3);
}

uint64_t sub_24726AE80()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.warmup()();
}

uint64_t sub_24726AEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.getSuggestionsForApp(for:)(a1, a2);
}

uint64_t sub_24726AF2C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2472036C4;
  return SiriSuggestionsXPCClient.disconnect(for:)(a1);
}

uint64_t sub_24726AF7C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_131();
  OUTLINED_FUNCTION_150_0();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = sub_2472036C4;
  OUTLINED_FUNCTION_201();
  return SiriSuggestionsXPCClient.getNextSuggestions(for:relatedIds:extraStateStoreProperties:)(v3, v4, v5, v6, v7);
}

uint64_t sub_24726AFE0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472012B0;
  return SiriSuggestionsXPCClient.refreshService()();
}

void sub_24726B028()
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

  OUTLINED_FUNCTION_53();
  v1 = OUTLINED_FUNCTION_21_3();
  MEMORY[0x24BDAC7A8](v1, v2);
  OUTLINED_FUNCTION_65();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  OUTLINED_FUNCTION_65();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437DC8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  OUTLINED_FUNCTION_65();
  v14 = v13 - v12;
  OUTLINED_FUNCTION_138_2(v8, v0 + OBJC_IVAR____TtC18SiriSuggestionsAPI26ContinuationBasedXPCBridge_continuation, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  type metadata accessor for SiriSuggestionsXPCClient();
  sub_247267E2C();
  sub_247279324();
  OUTLINED_FUNCTION_40_2(v8, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_111_1(v14, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  if ((sub_247279318() & 1) != 0)
    OUTLINED_FUNCTION_112_3();
  OUTLINED_FUNCTION_34();
}

uint64_t sub_24726B324(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  return OUTLINED_FUNCTION_159_0();
}

uint64_t sub_24726B3AC()
{
  NSObject *v0;
  os_log_type_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_25443A1C8 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_81_0();
  OUTLINED_FUNCTION_19_1(v2, (uint64_t)qword_25443A330);
  v3 = OUTLINED_FUNCTION_81_1();
  if (OUTLINED_FUNCTION_24_1(v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_45();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2471ED000, v0, v1, "ContinuationBasedXPCBridge continuation.finish()", v4, 2u);
    OUTLINED_FUNCTION_24_0();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_254437DD8);
  return OUTLINED_FUNCTION_159_0();
}

void sub_24726B4B0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_24726B4E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24726B55C()
{
  return 0;
}

uint64_t sub_24726B564(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_24726B56C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_24726B598(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_24726B5A8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

void sub_24726B5B8(uint64_t a1)
{
  uint64_t v1;

  sub_247264E74(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_24726B5C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_102_3();
  OUTLINED_FUNCTION_113_2();
  OUTLINED_FUNCTION_82_6();
  OUTLINED_FUNCTION_40_2(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_134_2();
  return OUTLINED_FUNCTION_38_3();
}

uint64_t sub_24726B5FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_102_3();
  OUTLINED_FUNCTION_169_0();
  return sub_247265C34(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_24726B634()
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

  v2 = *(_QWORD *)(v0 + 56);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2472012B0;
  OUTLINED_FUNCTION_79_5();
  return sub_24726677C(v4, v5, v6, v7, v8, v2);
}

uint64_t sub_24726B6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriSuggestions.SuggestionList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24726B6E8(uint64_t a1)
{
  uint64_t v1;

  return sub_247267114(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

void sub_24726B6F8()
{
  sub_247269B4C();
}

uint64_t sub_24726B730()
{
  uint64_t v0;

  OUTLINED_FUNCTION_91_5();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(v0 + 40);
  return swift_deallocObject();
}

uint64_t sub_24726B760(uint64_t a1)
{
  return sub_247268A4C(a1);
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

uint64_t sub_24726B788()
{
  uint64_t v0;

  OUTLINED_FUNCTION_91_5();
  sub_2471F2440();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(v0 + 64);
  return swift_deallocObject();
}

uint64_t sub_24726B7C4(uint64_t a1)
{
  uint64_t v1;

  return sub_2472692C4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_BYTE *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), v1 + 64);
}

void sub_24726B7DC()
{
  sub_247269B4C();
}

void sub_24726B814(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!*a1)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254438D28);
    sub_2471FDEF8(a2, 255, type metadata accessor for SiriSuggestions.Suggestion, a3);
    v10 = v9;
    atomic_store(MEMORY[0x249575B14](a4, v8, &v10), a1);
  }
  OUTLINED_FUNCTION_32_1();
}

uint64_t sub_24726B88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_113_2();
  OUTLINED_FUNCTION_82_6();
  sub_2471FD35C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  sub_2471FD35C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_40_2(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_134_2();
  return OUTLINED_FUNCTION_38_3();
}

void sub_24726B8D8(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_169_0();
  sub_24726A2E0(a1, *(_QWORD *)(v1 + 16));
}

void sub_24726B918(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_2471FDEF8(&qword_254438FE0, a2, (uint64_t (*)(uint64_t))type metadata accessor for SiriSuggestionsXPCClient, (uint64_t)&protocol conformance descriptor for SiriSuggestionsXPCClient);
  *(_QWORD *)(a1 + 32) = v3;
}

uint64_t type metadata accessor for SiriSuggestionsXPCClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriSuggestionsXPCClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSuggestionsXPCClient.__allocating_init(connection:xpcInterface:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

_QWORD *initializeBufferWithCopyOfBuffer for SuggestionsXPCError(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for SuggestionsXPCError(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for SuggestionsXPCError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
      v7 = v4;
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    v5 = v4;
    v6 = *a1;
    *a1 = v4;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for SuggestionsXPCError(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestionsXPCError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SuggestionsXPCError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_24726BB80(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_24726BB98(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SuggestionsXPCError()
{
  return &type metadata for SuggestionsXPCError;
}

uint64_t sub_24726BBC8()
{
  return type metadata accessor for ContinuationBasedXPCBridge();
}

uint64_t type metadata accessor for ContinuationBasedXPCBridge()
{
  uint64_t result;

  result = qword_254437CE8;
  if (!qword_254437CE8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24726BC08()
{
  unint64_t v0;

  sub_24726BC74();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_24726BC74()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254437DE0)
  {
    type metadata accessor for SiriSuggestions.SuggestionList();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254438D68);
    v0 = sub_24727933C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254437DE0);
  }
}

unint64_t sub_24726BCE4()
{
  unint64_t result;

  result = qword_25767EA80;
  if (!qword_25767EA80)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SuggestionsXPCError, &type metadata for SuggestionsXPCError);
    atomic_store(result, (unint64_t *)&qword_25767EA80);
  }
  return result;
}

uint64_t sub_24726BD28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = sub_247278B8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a4, v7);
  sub_24727912C();
  return a2;
}

void sub_24726BD88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_170_0(a1, a2, a3, a4);
  sub_247203640(v4, v5);
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_30();
}

void sub_24726BDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = OUTLINED_FUNCTION_170_0(a1, a2, a3, a4);
  sub_247203588(v4, v5);
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_30();
}

uint64_t sub_24726BDD8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25767EB18) + 48);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB20);
  result = sub_24726BD28((uint64_t)a2 + *(int *)(v5 + 48), *a1, a1[1], v4);
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_24726BE38(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
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
  uint64_t *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  char v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  char *v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  _QWORD *v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  _QWORD v47[2];
  char *v48;
  char *v49;
  _QWORD *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  char *v53;

  v10 = sub_247278B8C();
  v50 = *(_QWORD **)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v49 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v48 = (char *)v47 - v16;
  MEMORY[0x24BDAC7A8](v15, v17);
  v53 = (char *)v47 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB28);
  MEMORY[0x24BDAC7A8](v19, v20);
  v22 = (_QWORD *)((char *)v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24726C46C(a1, a2, a3, &v52);
  v47[1] = a1;
  sub_24727912C();
  v47[0] = a3;
  swift_retain();
  sub_24726C4A8((uint64_t)v22);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23) == 1)
  {
LABEL_2:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2471F847C();
    return swift_release();
  }
  else
  {
    v51 = (void (*)(char *, char *, uint64_t))v50[4];
    while (1)
    {
      v26 = *v22;
      v25 = v22[1];
      v51(v53, (char *)v22 + *(int *)(v23 + 48), v10);
      v27 = *(_QWORD **)a5;
      v29 = sub_2472015E8();
      v30 = v27[2];
      v31 = (v28 & 1) == 0;
      if (__OFADD__(v30, v31))
        break;
      v32 = v28;
      if (v27[3] >= v30 + v31)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB30);
          sub_247279534();
        }
      }
      else
      {
        sub_247274D18();
        v33 = sub_2472015E8();
        if ((v32 & 1) != (v34 & 1))
          goto LABEL_18;
        v29 = v33;
      }
      v35 = *(_QWORD **)a5;
      if ((v32 & 1) != 0)
      {
        v36 = v35[7];
        v37 = v50;
        v38 = v50[9] * v29;
        v39 = (void (*)(char *, unint64_t, uint64_t))v50[2];
        v40 = v49;
        v39(v49, v36 + v38, v10);
        v41 = v48;
        v39(v48, (unint64_t)v40, v10);
        v42 = (void (*)(char *, uint64_t))v37[1];
        v42(v40, v10);
        v42(v53, v10);
        swift_bridgeObjectRelease();
        ((void (*)(unint64_t, char *, uint64_t))v37[5])(*(_QWORD *)(*(_QWORD *)a5 + 56) + v38, v41, v10);
      }
      else
      {
        v35[(v29 >> 6) + 8] |= 1 << v29;
        v43 = (_QWORD *)(v35[6] + 16 * v29);
        *v43 = v26;
        v43[1] = v25;
        v51((char *)(v35[7] + v50[9] * v29), v53, v10);
        v44 = v35[2];
        v45 = __OFADD__(v44, 1);
        v46 = v44 + 1;
        if (v45)
          goto LABEL_17;
        v35[2] = v46;
      }
      sub_24726C4A8((uint64_t)v22);
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB20);
      a4 = 1;
      if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23) == 1)
        goto LABEL_2;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_247279768();
    __break(1u);
  }
  return result;
}

uint64_t sub_24726C1B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38[3];
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v2 = sub_247278B8C();
  v35 = *(_QWORD *)(v2 - 8);
  v36 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  OUTLINED_FUNCTION_65();
  v34 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254437E08);
  result = sub_247279594();
  v7 = (_QWORD *)result;
  v8 = 0;
  v44 = a1;
  v11 = *(_QWORD *)(a1 + 64);
  v10 = a1 + 64;
  v9 = v11;
  v12 = 1 << *(_BYTE *)(v10 - 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v9;
  v31 = v10;
  v32 = (unint64_t)(v12 + 63) >> 6;
  v33 = result + 64;
  if ((v13 & v9) == 0)
    goto LABEL_5;
LABEL_4:
  v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v18)) + (v8 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v44 + 48) + 16 * i);
    v21 = *v20;
    v22 = v20[1];
    sub_247203640(*(_QWORD *)(v44 + 56) + 48 * i, (uint64_t)v41);
    v23 = v43;
    v37 = v42;
    v24 = v42;
    v25 = __swift_project_boxed_opaque_existential_1(v41, v42);
    v39 = v37;
    v40 = v23;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(boxed_opaque_existential_1, v25, v24);
    sub_24727912C();
    sub_247278B80();
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v41);
    *(_QWORD *)(v33 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v27 = (_QWORD *)(v7[6] + 16 * i);
    *v27 = v21;
    v27[1] = v22;
    result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v35 + 32))(v7[7] + *(_QWORD *)(v35 + 72) * i, v34, v36);
    v28 = v7[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v7[2] = v30;
    if (v14)
      goto LABEL_4;
LABEL_5:
    v17 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_24;
    if (v17 >= v32)
      return (uint64_t)v7;
    v18 = *(_QWORD *)(v31 + 8 * v17);
    ++v8;
    if (!v18)
    {
      v8 = v17 + 1;
      if (v17 + 1 >= v32)
        return (uint64_t)v7;
      v18 = *(_QWORD *)(v31 + 8 * v8);
      if (!v18)
      {
        v8 = v17 + 2;
        if (v17 + 2 >= v32)
          return (uint64_t)v7;
        v18 = *(_QWORD *)(v31 + 8 * v8);
        if (!v18)
          break;
      }
    }
LABEL_18:
    v14 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v32)
    return (uint64_t)v7;
  v18 = *(_QWORD *)(v31 + 8 * v19);
  if (v18)
  {
    v8 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v8 >= v32)
      return (uint64_t)v7;
    v18 = *(_QWORD *)(v31 + 8 * v8);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24726C46C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_24726C4A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  int64_t v47;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB18);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB38);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)&v42 - v13;
  v15 = *v1;
  v16 = v1[1];
  v18 = v1[2];
  v17 = v1[3];
  v19 = v17;
  v20 = v1[4];
  v43 = v6;
  if (v20)
  {
    v46 = v11;
    v47 = v17;
    v44 = v18;
    v45 = v16;
    v21 = a1;
    v22 = (v20 - 1) & v20;
    v23 = __clz(__rbit64(v20)) | (v17 << 6);
LABEL_3:
    v24 = *(_QWORD *)(v15 + 56);
    v25 = (uint64_t *)(*(_QWORD *)(v15 + 48) + 16 * v23);
    v26 = v15;
    v27 = *v25;
    v28 = v25[1];
    v29 = sub_247278B8C();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(&v14[*(int *)(v3 + 48)], v24 + *(_QWORD *)(*(_QWORD *)(v29 - 8) + 72) * v23, v29);
    *(_QWORD *)v14 = v27;
    *((_QWORD *)v14 + 1) = v28;
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v3);
    v15 = v26;
    sub_24727912C();
    a1 = v21;
    v16 = v45;
    v11 = v46;
    v18 = v44;
    goto LABEL_25;
  }
  v30 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
LABEL_23:
    v19 = v13;
    goto LABEL_24;
  }
  v31 = (unint64_t)(v18 + 64) >> 6;
  if (v30 < v31)
  {
    v32 = *(_QWORD *)(v16 + 8 * v30);
    if (v32)
    {
LABEL_7:
      v44 = v18;
      v45 = v16;
      v46 = v11;
      v47 = v30;
      v21 = a1;
      v22 = (v32 - 1) & v32;
      v23 = __clz(__rbit64(v32)) + (v30 << 6);
      goto LABEL_3;
    }
    v33 = v17 + 2;
    v19 = v17 + 1;
    if (v17 + 2 < v31)
    {
      v32 = *(_QWORD *)(v16 + 8 * v33);
      if (v32)
      {
LABEL_10:
        v30 = v33;
        goto LABEL_7;
      }
      v19 = v17 + 2;
      if (v17 + 3 < v31)
      {
        v32 = *(_QWORD *)(v16 + 8 * (v17 + 3));
        if (v32)
        {
          v30 = v17 + 3;
          goto LABEL_7;
        }
        v33 = v17 + 4;
        v19 = v17 + 3;
        if (v17 + 4 < v31)
        {
          v32 = *(_QWORD *)(v16 + 8 * v33);
          if (v32)
            goto LABEL_10;
          v30 = v17 + 5;
          v19 = v17 + 4;
          if (v17 + 5 < v31)
          {
            v32 = *(_QWORD *)(v16 + 8 * v30);
            if (v32)
              goto LABEL_7;
            v13 = v31 - 1;
            v34 = v17 + 6;
            while (v34 < v31)
            {
              v32 = *(_QWORD *)(v16 + 8 * v34++);
              if (v32)
              {
                v30 = v34 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  v47 = v19;
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v3);
  v22 = 0;
LABEL_25:
  *v1 = v15;
  v1[1] = v16;
  v35 = v47;
  v1[2] = v18;
  v1[3] = v35;
  v1[4] = v22;
  v36 = (void (*)(uint64_t))v1[5];
  sub_24726DA24((uint64_t)v14, (uint64_t)v11, &qword_25767EB38);
  v37 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3) != 1)
  {
    v38 = (uint64_t)v11;
    v39 = (uint64_t)v43;
    sub_24726DA24(v38, (uint64_t)v43, &qword_25767EB18);
    v36(v39);
    sub_24726DA58(v39, &qword_25767EB18);
    v37 = 0;
  }
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EB20);
  return __swift_storeEnumTagSinglePayload(a1, v37, 1, v40);
}

void sub_24726C7B8()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];

  OUTLINED_FUNCTION_117_1();
  if (v5)
  {
    OUTLINED_FUNCTION_114_1();
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v9 = *v7;
    v8 = v7[1];
    sub_247203640(*(_QWORD *)(v1 + 56) + 48 * v6, (uint64_t)v29);
    *(_QWORD *)&v28 = v9;
    *((_QWORD *)&v28 + 1) = v8;
    OUTLINED_FUNCTION_41();
    goto LABEL_22;
  }
  v10 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  v11 = (unint64_t)(v3 + 64) >> 6;
  if (v10 < v11)
  {
    if (*(_QWORD *)(v2 + 8 * v10))
    {
LABEL_7:
      OUTLINED_FUNCTION_89_4();
      goto LABEL_3;
    }
    if (v4 + 2 < v11)
    {
      if (*(_QWORD *)(v2 + 8 * (v4 + 2)))
        goto LABEL_7;
      if (v4 + 3 < v11)
      {
        if (*(_QWORD *)(v2 + 8 * (v4 + 3)))
          goto LABEL_7;
        if (v4 + 4 < v11)
        {
          if (*(_QWORD *)(v2 + 8 * (v4 + 4)))
            goto LABEL_7;
          if (v4 + 5 < v11)
          {
            if (*(_QWORD *)(v2 + 8 * (v4 + 5)))
              goto LABEL_7;
            v12 = v4 + 6;
            while (v12 < v11)
            {
              if (*(_QWORD *)(v2 + 8 * v12++))
                goto LABEL_7;
            }
          }
        }
      }
    }
  }
  v28 = 0u;
  memset(v29, 0, sizeof(v29));
LABEL_22:
  OUTLINED_FUNCTION_144_3();
  sub_24726DA24((uint64_t)&v28, (uint64_t)&v23, &qword_25767C6C0);
  if (v24)
  {
    *((_QWORD *)&v22[0] + 1) = v24;
    v22[1] = v25;
    v22[2] = v26;
    v22[3] = v27;
    OUTLINED_FUNCTION_171(v14, v15, v16, v17, v18, v19, v20, v21, v23);
    sub_24726DA58((uint64_t)v22, &qword_254438848);
  }
  else
  {
    v0[2] = 0u;
    v0[3] = 0u;
    *v0 = 0u;
    v0[1] = 0u;
  }
}

void sub_24726C954()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];

  OUTLINED_FUNCTION_117_1();
  if (v5)
  {
    OUTLINED_FUNCTION_114_1();
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v9 = *v7;
    v8 = v7[1];
    sub_247203588(*(_QWORD *)(v1 + 56) + 32 * v6, (uint64_t)v28);
    *(_QWORD *)&v27 = v9;
    *((_QWORD *)&v27 + 1) = v8;
    OUTLINED_FUNCTION_41();
    goto LABEL_22;
  }
  v10 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  v11 = (unint64_t)(v3 + 64) >> 6;
  if (v10 < v11)
  {
    if (*(_QWORD *)(v2 + 8 * v10))
    {
LABEL_7:
      OUTLINED_FUNCTION_89_4();
      goto LABEL_3;
    }
    if (v4 + 2 < v11)
    {
      if (*(_QWORD *)(v2 + 8 * (v4 + 2)))
        goto LABEL_7;
      if (v4 + 3 < v11)
      {
        if (*(_QWORD *)(v2 + 8 * (v4 + 3)))
          goto LABEL_7;
        if (v4 + 4 < v11)
        {
          if (*(_QWORD *)(v2 + 8 * (v4 + 4)))
            goto LABEL_7;
          if (v4 + 5 < v11)
          {
            if (*(_QWORD *)(v2 + 8 * (v4 + 5)))
              goto LABEL_7;
            v12 = v4 + 6;
            while (v12 < v11)
            {
              if (*(_QWORD *)(v2 + 8 * v12++))
                goto LABEL_7;
            }
          }
        }
      }
    }
  }
  memset(v28, 0, sizeof(v28));
  v27 = 0u;
LABEL_22:
  OUTLINED_FUNCTION_144_3();
  sub_24726DA24((uint64_t)&v27, (uint64_t)&v23, &qword_2544382C8);
  if (v24)
  {
    *((_QWORD *)&v22[0] + 1) = v24;
    v22[1] = v25;
    v22[2] = v26;
    OUTLINED_FUNCTION_171(v14, v15, v16, v17, v18, v19, v20, v21, v23);
    sub_24726DA58((uint64_t)v22, &qword_2544382C0);
  }
  else
  {
    v0[1] = 0u;
    v0[2] = 0u;
    *v0 = 0u;
  }
}

uint64_t sub_24726CAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v16;

  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_2472036C4;
  return sub_2472639C0(a1, a2, a3, a4, a5, a7, a8);
}

uint64_t sub_24726CB84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2472036C4;
  return sub_247262FAC(a1, a2, a3, a4);
}

uint64_t sub_24726CBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2472036C4;
  return sub_247263078(a1, a2, a3, a4);
}

uint64_t sub_24726CC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;

  v10 = *a5;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_2472036C4;
  return sub_2472633B4(a1, a2, a3, a4, v10);
}

uint64_t sub_24726CCE4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v2 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  OUTLINED_FUNCTION_70();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544382D8);
  OUTLINED_FUNCTION_30_8(v3);
  OUTLINED_FUNCTION_88_4();
  OUTLINED_FUNCTION_58_5();

  OUTLINED_FUNCTION_136_2();
  return OUTLINED_FUNCTION_38_3();
}

uint64_t sub_24726CD64()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  OUTLINED_FUNCTION_98_4();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = sub_2472036C4;
  v3 = OUTLINED_FUNCTION_35_8();
  return v4(v3);
}

uint64_t sub_24726CDEC()
{
  return objectdestroy_74Tm(&qword_254438808, &qword_2544382D8);
}

uint64_t sub_24726CE00()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_131();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  OUTLINED_FUNCTION_97_3();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_33(v0);
  v2 = OUTLINED_FUNCTION_65_7(v1);
  return OUTLINED_FUNCTION_63(v2, v3, v4, v5, v6);
}

void sub_24726CE58()
{
  void *v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  v0 = (void *)OUTLINED_FUNCTION_22_9();
  sub_24726A46C(v0);
  OUTLINED_FUNCTION_30();
}

void sub_24726CE90(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  sub_2472693D4(a1, v3);
  OUTLINED_FUNCTION_148();
}

uint64_t sub_24726CEE0(uint64_t a1)
{
  return sub_24726CEF4(a1, &qword_254438808, (uint64_t (*)(uint64_t))sub_247268030);
}

uint64_t sub_24726CEF4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;

  OUTLINED_FUNCTION_147_2(a1, a2);
  v3 = OUTLINED_FUNCTION_22_9();
  return a3(v3);
}

uint64_t sub_24726CF24(uint64_t a1)
{
  uint64_t *v1;

  return sub_247264074(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24726CF30()
{
  return objectdestroy_99Tm(&qword_2544382D8);
}

uint64_t sub_24726CF3C()
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
  _QWORD *v15;

  OUTLINED_FUNCTION_62_4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544382D8);
  OUTLINED_FUNCTION_34_7();
  v7 = *(_QWORD *)(v0 + v6);
  v9 = v0 + v8;
  v11 = v0 + v10;
  v12 = *(_QWORD *)(v0 + v10);
  v13 = *(_QWORD *)(v11 + 8);
  v14 = swift_task_alloc();
  v15 = (_QWORD *)OUTLINED_FUNCTION_33(v14);
  *v15 = v2;
  v15[1] = sub_2472036C4;
  return sub_2472641F0(v5, v1, v3, v9, v7, v12, v13);
}

uint64_t sub_24726CFD0()
{
  return objectdestroy_103Tm(&qword_2544382D8);
}

uint64_t sub_24726CFDC(uint64_t a1)
{
  return sub_24726CEF4(a1, &qword_2544382D8, (uint64_t (*)(uint64_t))sub_2472643AC);
}

uint64_t objectdestroy_63Tm()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438808);
  OUTLINED_FUNCTION_90_4();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544382D8);
  OUTLINED_FUNCTION_30_8(v0);
  OUTLINED_FUNCTION_88_4();
  OUTLINED_FUNCTION_58_5();
  OUTLINED_FUNCTION_134_2();
  return OUTLINED_FUNCTION_38_3();
}

uint64_t sub_24726D048()
{
  OUTLINED_FUNCTION_151_1();
  return swift_deallocObject();
}

void sub_24726D068(void *a1)
{
  uint64_t v1;

  sub_247269A0C(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_91_5();
  swift_bridgeObjectRelease();
  sub_2471FD35C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

void sub_24726D0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247266944(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_24726D0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriSuggestions.SuggestionList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24726D108()
{
  OUTLINED_FUNCTION_151_1();
  return swift_deallocObject();
}

uint64_t sub_24726D128(uint64_t a1)
{
  uint64_t v1;

  return sub_247267570(a1, *(void (**)(void (*)(), uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_24726D134(uint64_t a1)
{
  uint64_t *v1;

  return sub_2472637D4(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24726D140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_53();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_141_2();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_40_2(v0 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  swift_release();
  OUTLINED_FUNCTION_126_1();
  __swift_destroy_boxed_opaque_existential_2Tm(v2);
  v5 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_1_0(v5);
  v6 = OUTLINED_FUNCTION_125_3();
  if (!OUTLINED_FUNCTION_47_8(v6))
    OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8));
  swift_release();
  OUTLINED_FUNCTION_133_1();
  return OUTLINED_FUNCTION_29();
}

uint64_t sub_24726D218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8);
  OUTLINED_FUNCTION_131_2();
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_98_4();
  v3 = v0 + v2;
  v5 = (uint64_t *)(v0 + v4);
  v6 = *v5;
  v7 = v5[1];
  v8 = swift_task_alloc();
  v9 = (_QWORD *)OUTLINED_FUNCTION_33(v8);
  *v9 = v1;
  v9[1] = sub_2472036C4;
  OUTLINED_FUNCTION_79_5();
  return sub_247263B7C(v10, v11, v12, v13, v14, v3, v6, v7);
}

uint64_t sub_24726D2D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_53();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_141_2();
  OUTLINED_FUNCTION_40_2(v0 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_126_1();
  __swift_destroy_boxed_opaque_existential_2Tm(v2);
  v5 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_1_0(v5);
  v6 = OUTLINED_FUNCTION_125_3();
  if (!OUTLINED_FUNCTION_47_8(v6))
    OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8));
  return OUTLINED_FUNCTION_29();
}

uint64_t sub_24726D37C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_169_0();
  return sub_247263EB4(a1, v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

uint64_t sub_24726D3E0()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAF0);
  OUTLINED_FUNCTION_90_4();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8);
  OUTLINED_FUNCTION_30_8(v0);
  OUTLINED_FUNCTION_88_4();
  OUTLINED_FUNCTION_58_5();
  OUTLINED_FUNCTION_136_2();
  return OUTLINED_FUNCTION_38_3();
}

void sub_24726D440()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAF0);
  OUTLINED_FUNCTION_175();
  sub_24726765C(v0, v1, v2, v3, v4);
}

uint64_t sub_24726D4A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAF0);
  OUTLINED_FUNCTION_141_2();
  v2 = (v1 + 32) & ~v1;
  v4 = *(_QWORD *)(v3 + 64);
  v5 = OUTLINED_FUNCTION_21_3();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAD8);
  OUTLINED_FUNCTION_121_1();
  v7(v0 + v2);
  swift_release();
  swift_bridgeObjectRelease();
  v8 = v0 + ((v2 + v4 + v6) & ~v6);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(v8 + 8);
  v9 = v8 + *(int *)(v5 + 24);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_121_1();
  v10(v9);
  v11 = sub_247278970();
  if (!OUTLINED_FUNCTION_47_8(v11))
    OUTLINED_FUNCTION_59_4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8));
  return OUTLINED_FUNCTION_58_3();
}

uint64_t sub_24726D5A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_131();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EAF0);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_169_0();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = sub_2472036C4;
  OUTLINED_FUNCTION_35_8();
  OUTLINED_FUNCTION_201();
  return sub_247263144(v3, v4, v5, v6, v7);
}

uint64_t sub_24726D634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_247266A44(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
}

unint64_t sub_24726D63C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254437D88;
  if (!qword_254437D88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254437D80);
    sub_2471FDEF8(&qword_254438D50, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7310], MEMORY[0x24BEA7320]);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x249575B14](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254437D88);
  }
  return result;
}

uint64_t sub_24726D6C4(uint64_t a1)
{
  uint64_t *v1;

  return sub_247263658(a1, v1[2], v1[4], v1[5]);
}

uint64_t sub_24726D6D0()
{
  return objectdestroy_99Tm(&qword_254437DC0);
}

uint64_t objectdestroy_99Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_113_2();
  v4 = (v3 + 32) & ~v3;
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_40_2(v1 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_136_2();
  return OUTLINED_FUNCTION_58_3();
}

uint64_t sub_24726D754()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v3)(void);

  __swift_instantiateConcreteTypeFromMangledName(&qword_254437DC0);
  OUTLINED_FUNCTION_34_7();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = sub_2472036C4;
  OUTLINED_FUNCTION_79_5();
  return v3();
}

uint64_t sub_24726D7F0()
{
  return objectdestroy_103Tm(&qword_254437DC0);
}

uint64_t sub_24726D7FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254437DC0);
  OUTLINED_FUNCTION_22_9();
  return sub_247263E84();
}

uint64_t sub_24726D828()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_102_3();
  OUTLINED_FUNCTION_28_10(v0);
  OUTLINED_FUNCTION_133_1();
  return OUTLINED_FUNCTION_78_5();
}

void sub_24726D84C()
{
  void *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_102_3();
  v0 = (void *)OUTLINED_FUNCTION_22_9();
  sub_247265DDC(v0, v1);
}

uint64_t sub_24726D870()
{
  return objectdestroy_74Tm(&qword_2544387B0, &qword_254437DC0);
}

uint64_t objectdestroy_74Tm(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v5)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_131_2();
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_121_1();
  v5(v2 + v3);
  swift_release();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_38_3();
}

uint64_t sub_24726D8FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_131();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544387B0);
  OUTLINED_FUNCTION_97_3();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_33(v0);
  v2 = OUTLINED_FUNCTION_65_7(v1);
  return OUTLINED_FUNCTION_63(v2, v3, v4, v5, v6);
}

uint64_t sub_24726D950()
{
  return objectdestroy_103Tm(&qword_254437DD8);
}

uint64_t objectdestroy_103Tm(uint64_t *a1)
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_28_10(v1);
  OUTLINED_FUNCTION_133_1();
  return OUTLINED_FUNCTION_78_5();
}

uint64_t sub_24726D980(uint64_t a1)
{
  return sub_24726CEF4(a1, &qword_254437DD8, (uint64_t (*)(uint64_t))sub_2472658DC);
}

uint64_t sub_24726D994(void *a1)
{
  uint64_t v1;

  return sub_24726A8EC(a1, v1);
}

uint64_t sub_24726D99C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_70();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24726D9CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_131();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = sub_2472012B0;
  OUTLINED_FUNCTION_35_8();
  OUTLINED_FUNCTION_201();
  return sub_24726A9B4(v3, v4, v5, v6, v7);
}

void sub_24726DA24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_121(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_30();
}

void sub_24726DA58(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_147_2(a1, a2);
  OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_30();
}

uint64_t OUTLINED_FUNCTION_2_15(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2471FD35C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return sub_247278D78();
}

uint64_t OUTLINED_FUNCTION_21_12()
{
  return sub_247278D78();
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_25_11(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_28_10(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80)), a1);
}

uint64_t OUTLINED_FUNCTION_31_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  *(_QWORD *)(v16 + *(int *)(v12 + 44)) = v14;
  v20 = (_QWORD *)(v16 + *(int *)(v12 + 48));
  *v20 = v18;
  v20[1] = v19;
  return v13(a12, v17, v15);
}

uint64_t OUTLINED_FUNCTION_32_3()
{
  return sub_247278328();
}

uint64_t OUTLINED_FUNCTION_35_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_39_10()
{
  void *v0;

}

BOOL OUTLINED_FUNCTION_42_11(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_43_8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_47_8(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_52_10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 32) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_54_8(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[3] = *(_QWORD *)(v1 + *(int *)(result + 44));
  v3 = (_QWORD *)(v1 + *(int *)(result + 48));
  v2[4] = *v3;
  v2[5] = v3[1];
  return result;
}

uint64_t OUTLINED_FUNCTION_55_6(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[5] = *(_QWORD *)(v1 + *(int *)(result + 44));
  v3 = (_QWORD *)(v1 + *(int *)(result + 48));
  v2[6] = *v3;
  v2[7] = v3[1];
  return result;
}

uint64_t OUTLINED_FUNCTION_58_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_59_5(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_60_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v12 + 120) = a1;
  *(_QWORD *)(v12 + 128) = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 8))(v11, a11);
}

uint64_t OUTLINED_FUNCTION_65_7(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_66_4()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2471FD304(v1, v0);
}

uint64_t OUTLINED_FUNCTION_67_8()
{
  return sub_2471F2440();
}

uint64_t OUTLINED_FUNCTION_70_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 136) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1 + v2, v1, v4);
}

uint64_t OUTLINED_FUNCTION_75_5(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_76_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_78_5()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_82_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_85_4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 32))(*(_QWORD *)(v0 + 88));
}

uint64_t OUTLINED_FUNCTION_88_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_91_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_92_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_96_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_100_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_102_3()
{
  return sub_247278B50();
}

uint64_t OUTLINED_FUNCTION_104_4()
{
  return swift_retain();
}

id OUTLINED_FUNCTION_106_3()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_107_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_108_3()
{
  return sub_247278214();
}

uint64_t OUTLINED_FUNCTION_112_3()
{
  return sub_247279330();
}

BOOL OUTLINED_FUNCTION_116_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_122_2(uint64_t a1)
{
  unint64_t v1;

  return sub_2471FD304(a1, v1);
}

uint64_t OUTLINED_FUNCTION_124_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_125_3()
{
  return sub_247278970();
}

uint64_t OUTLINED_FUNCTION_126_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_132_2()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_133_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_134_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_136_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_138_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_140_3()
{
  return sub_2471F2440();
}

uint64_t OUTLINED_FUNCTION_142_3()
{
  return sub_247278B8C();
}

uint64_t OUTLINED_FUNCTION_143_2()
{
  return sub_2471F2440();
}

void OUTLINED_FUNCTION_144_3()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *v0 = v1;
  v0[1] = v2;
  v0[2] = v3;
  v0[3] = v4;
  v0[4] = v5;
}

uint64_t OUTLINED_FUNCTION_145_3()
{
  return sub_2472782B0();
}

uint64_t OUTLINED_FUNCTION_146_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_2472728FC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_147_2(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

uint64_t OUTLINED_FUNCTION_148_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t OUTLINED_FUNCTION_149_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2472728FC(a1, a2, (uint64_t *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_151_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_152_1()
{
  return swift_task_alloc();
}

BOOL OUTLINED_FUNCTION_153_1()
{
  return sub_247237600();
}

void OUTLINED_FUNCTION_154_1(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_2471FDEF8(a1, 255, v4, a4);
}

void OUTLINED_FUNCTION_155_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_2471FDEF8(a1, 255, v4, a4);
}

void OUTLINED_FUNCTION_156_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_2471FDEF8(a1, 255, v4, a4);
}

uint64_t OUTLINED_FUNCTION_159_0()
{
  return sub_247279330();
}

uint64_t OUTLINED_FUNCTION_162_0(uint64_t a1)
{
  unint64_t v1;

  return sub_2471FD35C(a1, v1);
}

BOOL OUTLINED_FUNCTION_163_0()
{
  return sub_247237600();
}

void OUTLINED_FUNCTION_165_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_2472302A0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_166()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2471FD35C(v0, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_167()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_168_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2471FD35C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_170_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t OUTLINED_FUNCTION_171(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v9)(uint64_t *);

  return v9(&a9);
}

uint64_t OUTLINED_FUNCTION_174_0()
{
  return sub_247278D84();
}

uint64_t OUTLINED_FUNCTION_176_0()
{
  return sub_247278D90();
}

uint64_t OUTLINED_FUNCTION_178_0()
{
  return swift_task_alloc();
}

__n128 OUTLINED_FUNCTION_180_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  *(_QWORD *)(v2 + 48) = a1;
  result = *(__n128 *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_181()
{
  return sub_247278220();
}

uint64_t OUTLINED_FUNCTION_182_0()
{
  return sub_24727822C();
}

uint64_t OUTLINED_FUNCTION_183()
{
  return sub_247279018();
}

void OUTLINED_FUNCTION_184_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_24726DA58(v2, a2);
}

uint64_t dispatch thunk of SuggestionsLogger.log(from:deliveryVehicle:generationId:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_40();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2(v1, (uint64_t)sub_247203D8C);
  return OUTLINED_FUNCTION_9(v2, v3, v4, v5, v6, v7);
}

uint64_t dispatch thunk of SuggestionsLogger.logEngagement(for:with:invocationType:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_40();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2(v1, (uint64_t)sub_2471FAFD4);
  return OUTLINED_FUNCTION_9(v2, v3, v4, v5, v6, v7);
}

unint64_t static SiriSuggestions.Interaction.ConversationalContinuerIntentKey.getter()
{
  return 0xD000000000000017;
}

unint64_t static SiriSuggestions.Interaction.ExecutedAppIntentBundleId.getter()
{
  return 0xD000000000000019;
}

uint64_t SiriSuggestions.Interaction.dialogIdentifiers.getter()
{
  return sub_24727912C();
}

uint64_t SiriSuggestions.Interaction.executionParameters.getter()
{
  return sub_24727912C();
}

uint64_t SiriSuggestions.Interaction.intent.getter()
{
  return sub_24727912C();
}

void SiriSuggestions.Interaction.owner.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2471FD550(v1 + 24, a1);
}

uint64_t SiriSuggestions.Interaction.verb.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  OUTLINED_FUNCTION_74();
  return v1;
}

uint64_t SiriSuggestions.Interaction.requestId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  OUTLINED_FUNCTION_74();
  return v1;
}

uint64_t SiriSuggestions.Interaction.catGlobalProperties.getter()
{
  return sub_24727912C();
}

uint64_t SiriSuggestions.Interaction.salientEntities.getter()
{
  return sub_24727912C();
}

void SiriSuggestions.Interaction.deviceState.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2471FD550(v1 + 112, a1);
}

uint64_t SiriSuggestions.Interaction.generationId.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_11_3();
  v0 = OUTLINED_FUNCTION_22_7();
  return OUTLINED_FUNCTION_18_7(v0, v1, v2, v3);
}

uint64_t type metadata accessor for SiriSuggestions.Interaction()
{
  uint64_t result;

  result = qword_2544385E0;
  if (!qword_2544385E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SiriSuggestions.Interaction.invocationType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_5_11();
  v0 = OUTLINED_FUNCTION_22_7();
  return OUTLINED_FUNCTION_18_7(v0, v1, v2, v3);
}

void SiriSuggestions.Interaction.relatedIntent.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_12();
  sub_2471FD110(v1 + *(int *)(v3 + 60), a1, &qword_254438630);
}

uint64_t SiriSuggestions.Interaction.isFirstInvocationSinceOSInstalled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_3_12() + 64));
}

void SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:salientEntities:deviceState:owner:verb:invocationType:relatedIntent:isFirstInvocationSinceOSInstalled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_5_15(v31, v32, v33, v34, v35, v36);
  v27[8] = a23;
  v27[9] = a24;
  v27[12] = v29;
  v27[13] = v28;
  sub_2471F6814(v30, (uint64_t)(v27 + 14));
  v37 = OUTLINED_FUNCTION_3_12();
  v38 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_8_14(v38);
  v39 = OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_7_17(v39);
  OUTLINED_FUNCTION_16_11();
  *((_BYTE *)v27 + *(int *)(v37 + 64)) = a27;
  OUTLINED_FUNCTION_34();
}

uint64_t sub_24726E47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SiriSuggestions.Interaction.description.getter()
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  char *v53;
  uint64_t v54;
  uint64_t *v55;
  _QWORD *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  int *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;

  OUTLINED_FUNCTION_53();
  v81 = v1;
  v82 = v2;
  v3 = v0;
  v4 = sub_2472789B8();
  v71 = *(_QWORD *)(v4 - 8);
  v72 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  OUTLINED_FUNCTION_17_0();
  v70 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
  MEMORY[0x24BDAC7A8](v7, v8);
  OUTLINED_FUNCTION_38_4();
  v11 = v9 - v10;
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v67 - v14;
  v16 = sub_247278D48();
  v68 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  MEMORY[0x24BDAC7A8](v16, v17);
  OUTLINED_FUNCTION_17_0();
  v67 = v18;
  v76 = sub_247279048();
  v19 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76, v20);
  OUTLINED_FUNCTION_38_4();
  v77 = v21 - v22;
  v25 = MEMORY[0x24BDAC7A8](v23, v24);
  v75 = (char *)&v67 - v26;
  MEMORY[0x24BDAC7A8](v25, v27);
  v29 = (char *)&v67 - v28;
  v79 = 0;
  v80 = 0xE000000000000000;
  sub_247278D54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438880);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_247280DE0;
  *(_QWORD *)(v30 + 32) = 0x4974736575716572;
  *(_QWORD *)(v30 + 40) = 0xE900000000000064;
  v31 = v3[11];
  v32 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v30 + 48) = v3[10];
  *(_QWORD *)(v30 + 56) = v31;
  *(_QWORD *)(v30 + 72) = v32;
  strcpy((char *)(v30 + 80), "invocationType");
  *(_BYTE *)(v30 + 95) = -18;
  v78 = (int *)OUTLINED_FUNCTION_3_12();
  v33 = (char *)v3 + v78[14];
  v34 = OUTLINED_FUNCTION_5_11();
  *(_QWORD *)(v30 + 120) = v34;
  v35 = OUTLINED_FUNCTION_14_13();
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v35, v33, v34);
  *(_QWORD *)(v30 + 128) = 0x72656E776FLL;
  *(_QWORD *)(v30 + 136) = 0xE500000000000000;
  v36 = v3[6];
  v37 = __swift_project_boxed_opaque_existential_1(v3 + 3, v36);
  *(_QWORD *)(v30 + 168) = v36;
  v38 = OUTLINED_FUNCTION_14_13();
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v38, v37, v36);
  *(_QWORD *)(v30 + 176) = 1651664246;
  *(_QWORD *)(v30 + 184) = 0xE400000000000000;
  v39 = v3[9];
  v73 = v29;
  v74 = v19;
  if (v39)
  {
    v40 = v3[8];
    v41 = MEMORY[0x24BEE0D00];
    v42 = v39;
  }
  else
  {
    v40 = 0;
    v42 = 0;
    v41 = 0;
    *(_QWORD *)(v30 + 208) = 0;
  }
  *(_QWORD *)(v30 + 192) = v40;
  *(_QWORD *)(v30 + 200) = v42;
  *(_QWORD *)(v30 + 216) = v41;
  *(_QWORD *)(v30 + 224) = 0xD000000000000014;
  *(_QWORD *)(v30 + 232) = 0x8000000247283E60;
  v43 = (uint64_t)v3 + v78[15];
  sub_2471FD110(v43, (uint64_t)v15, &qword_254438630);
  v44 = OUTLINED_FUNCTION_27_11();
  v45 = OUTLINED_FUNCTION_32_4((uint64_t)v15);
  sub_24727912C();
  sub_24727912C();
  if (v45 == 1)
  {
    sub_2471F85E8((uint64_t)v15, &qword_254438630);
    *(_OWORD *)(v30 + 240) = 0u;
    *(_OWORD *)(v30 + 256) = 0u;
  }
  else
  {
    sub_247278BA4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v44 - 8) + 8))(v15, v44);
    *(_QWORD *)(v30 + 264) = v69;
    v46 = OUTLINED_FUNCTION_14_13();
    OUTLINED_FUNCTION_17_17((uint64_t)v46, v68);
  }
  *(_QWORD *)(v30 + 272) = 0xD00000000000001ALL;
  *(_QWORD *)(v30 + 280) = 0x8000000247283E80;
  sub_2471FD110(v43, v11, &qword_254438630);
  if (OUTLINED_FUNCTION_32_4(v11) == 1)
  {
    sub_2471F85E8(v11, &qword_254438630);
    *(_OWORD *)(v30 + 288) = 0u;
    *(_OWORD *)(v30 + 304) = 0u;
  }
  else
  {
    sub_247278B98();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 8))(v11, v44);
    *(_QWORD *)(v30 + 312) = v72;
    v47 = OUTLINED_FUNCTION_14_13();
    OUTLINED_FUNCTION_17_17((uint64_t)v47, v71);
  }
  v48 = (uint64_t)v75;
  v49 = (uint64_t)v73;
  *(_QWORD *)(v30 + 320) = 0x746E65746E69;
  *(_QWORD *)(v30 + 328) = 0xE600000000000000;
  v50 = v3[2];
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438840);
  *(_QWORD *)(v30 + 336) = v50;
  *(_QWORD *)(v30 + 360) = v51;
  strcpy((char *)(v30 + 368), "generationId");
  *(_BYTE *)(v30 + 381) = 0;
  *(_WORD *)(v30 + 382) = -5120;
  v52 = v78;
  v53 = (char *)v3 + v78[13];
  v54 = OUTLINED_FUNCTION_11_3();
  *(_QWORD *)(v30 + 408) = v54;
  v55 = OUTLINED_FUNCTION_14_13();
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(v55, v53, v54);
  v56 = (_QWORD *)(v30 + 432);
  *(_QWORD *)(v30 + 416) = 0xD000000000000016;
  *(_QWORD *)(v30 + 424) = 0x8000000247283EA0;
  v57 = *((unsigned __int8 *)v3 + v52[16]);
  if (v57 == 2)
  {
    v58 = 0;
    *v56 = 0;
    *(_QWORD *)(v30 + 440) = 0;
    *(_QWORD *)(v30 + 448) = 0;
  }
  else
  {
    *(_BYTE *)v56 = v57 & 1;
    v58 = MEMORY[0x24BEE1328];
  }
  *(_QWORD *)(v30 + 456) = v58;
  OUTLINED_FUNCTION_74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438858);
  OUTLINED_FUNCTION_26_10();
  v59 = OUTLINED_FUNCTION_23_8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_10(v49);
  OUTLINED_FUNCTION_21_13();
  OUTLINED_FUNCTION_36_0();
  sub_247279210();
  v60 = __swift_project_boxed_opaque_existential_1(v3 + 14, v3[17]);
  MEMORY[0x24BDAC7A8](v60, v60);
  OUTLINED_FUNCTION_2_10();
  (*(void (**)(uint64_t))(v61 + 16))(v59);
  sub_2472791EC();
  sub_247278B5C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21_13();
  OUTLINED_FUNCTION_36_0();
  sub_247279210();
  sub_247278D54();
  v62 = OUTLINED_FUNCTION_74();
  sub_24726F7C8(v62);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438848);
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_11_15();
  swift_release();
  OUTLINED_FUNCTION_22_10(v48);
  OUTLINED_FUNCTION_20_13();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_33_7();
  v63 = v77;
  sub_247278D54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25443A000);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_24727F200;
  *(_QWORD *)(v64 + 32) = 8224;
  *(_QWORD *)(v64 + 40) = 0xE200000000000000;
  *(_QWORD *)(v64 + 48) = 1701869940;
  *(_QWORD *)(v64 + 56) = 0xE400000000000000;
  *(_QWORD *)(v64 + 64) = 0x65756C6176;
  *(_QWORD *)(v64 + 72) = 0xE500000000000000;
  *(_QWORD *)(v64 + 80) = 0x65726F6373;
  *(_QWORD *)(v64 + 88) = 0xE500000000000000;
  sub_247278A18();
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_23_8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_10(v63);
  OUTLINED_FUNCTION_20_13();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_33_7();
  sub_247278D54();
  v65 = sub_24727912C();
  sub_24726F6E8(v65);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438850);
  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_11_15();
  swift_release();
  OUTLINED_FUNCTION_22_10(v48);
  sub_247279210();
  OUTLINED_FUNCTION_36_0();
  return v79;
}

uint64_t sub_24726EC90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438888);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24727D090;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  sub_2471FD110(a3, v6 + 64, qword_254438890);
  sub_24727912C();
  return v6;
}

uint64_t sub_24726ED14(uint64_t *a1)
{
  return sub_24726EC90(*a1, a1[1], (uint64_t)(a1 + 2));
}

uint64_t sub_24726ED24(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v11[48];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438888);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24727AD50;
  v3 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 8224;
  *(_QWORD *)(v2 + 40) = 0xE200000000000000;
  v4 = a1 + 2;
  v6 = *a1;
  v5 = a1[1];
  sub_247203640((uint64_t)(a1 + 2), (uint64_t)v11);
  *(_QWORD *)(v2 + 88) = v3;
  *(_QWORD *)(v2 + 64) = v6;
  *(_QWORD *)(v2 + 72) = v5;
  v7 = a1[5];
  v8 = __swift_project_boxed_opaque_existential_1(v4, v7);
  *(_QWORD *)(v2 + 120) = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 + 96));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, v8, v7);
  sub_24727912C();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v11);
  return v2;
}

uint64_t sub_24726EE14()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438888);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24727F200;
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 32) = 8224;
  *(_QWORD *)(v0 + 40) = 0xE200000000000000;
  *(_QWORD *)(v0 + 88) = sub_247278BC8();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 64));
  sub_2472789F4();
  sub_2472789E8();
  v1 = v7;
  if (v7)
  {
    v2 = __swift_project_boxed_opaque_existential_1(v6, v7);
    *(_QWORD *)(v0 + 120) = v1;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(boxed_opaque_existential_1, v2, v1);
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v6);
  }
  else
  {
    sub_2471F85E8((uint64_t)v6, &qword_2544382E0);
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  sub_247278A00();
  *(_QWORD *)(v0 + 152) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v0 + 128) = v4;
  return v0;
}

uint64_t sub_24726EF28(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v11[32];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254438888);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24727AD50;
  v3 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 8224;
  *(_QWORD *)(v2 + 40) = 0xE200000000000000;
  v4 = a1 + 2;
  v6 = *a1;
  v5 = a1[1];
  sub_247203588((uint64_t)(a1 + 2), (uint64_t)v11);
  *(_QWORD *)(v2 + 88) = v3;
  *(_QWORD *)(v2 + 64) = v6;
  *(_QWORD *)(v2 + 72) = v5;
  v7 = a1[5];
  v8 = __swift_project_boxed_opaque_existential_1(v4, v7);
  *(_QWORD *)(v2 + 120) = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v2 + 96));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, v8, v7);
  sub_24727912C();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v11);
  return v2;
}

void sub_24726F040()
{
  sub_247270734(&qword_2544385D8, (uint64_t)&protocol conformance descriptor for SiriSuggestions.Interaction);
  JUMPOUT(0x2495747F4);
}

#error "24726F168: call analysis failed (funcsize=61)"

#error "24726F24C: call analysis failed (funcsize=57)"

void SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:runningAppIds:deviceState:owner:verb:invocationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
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
  void (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  unint64_t v57;
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

  OUTLINED_FUNCTION_53();
  v27 = v26;
  v66 = v28;
  v67 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v65 = v38;
  v69 = sub_247278BC8();
  v39 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69, v40);
  OUTLINED_FUNCTION_2_10();
  v68 = sub_247278A18();
  v41 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68, v42);
  OUTLINED_FUNCTION_65();
  v45 = v44 - v43;
  v46 = OUTLINED_FUNCTION_11_3();
  MEMORY[0x24BDAC7A8](v46, v47);
  OUTLINED_FUNCTION_65();
  v61 = v48;
  v63 = v50 - v49;
  v64 = v37;
  v62 = v51;
  (*(void (**)(void))(v48 + 16))();
  v52 = *(_QWORD *)(v27 + 16);
  v53 = MEMORY[0x24BEE4AF8];
  if (v52)
  {
    v59 = v35;
    v60 = v31;
    sub_2472093D8();
    v54 = *MEMORY[0x24BEA7368];
    v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 104);
    v56 = v27 + 40;
    do
    {
      v55(v25, v54, v69);
      sub_24727912C();
      sub_247278A0C();
      v57 = *(_QWORD *)(v53 + 16);
      if (v57 >= *(_QWORD *)(v53 + 24) >> 1)
        sub_2472093D8();
      v56 += 16;
      *(_QWORD *)(v53 + 16) = v57 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v41 + 32))(v53+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v57, v45, v68);
      --v52;
    }
    while (v52);
    v58 = v67;
    v31 = v60;
    v35 = v59;
  }
  else
  {
    v58 = v67;
  }
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v64, v62);
  swift_bridgeObjectRelease();
  SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:salientEntities:deviceState:owner:verb:invocationType:)(v65, v66, v63, v35, v33, v31, v58, v53, a21, a22, a23, a24, a25);
  OUTLINED_FUNCTION_34();
}

void SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:runningAppIds:deviceState:owner:verb:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
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
  _BYTE v56[40];
  _BYTE v57[48];

  OUTLINED_FUNCTION_53();
  v54 = v24;
  v55 = v25;
  v52 = v26;
  v53 = v27;
  v50 = v28;
  v51 = v29;
  v31 = v30;
  v48 = v33;
  v49 = v32;
  v34 = OUTLINED_FUNCTION_5_11();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34, v36);
  OUTLINED_FUNCTION_65();
  v39 = v38 - v37;
  v40 = OUTLINED_FUNCTION_11_3();
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40, v42);
  OUTLINED_FUNCTION_65();
  v45 = v44 - v43;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v44 - v43, v31, v40);
  sub_2471FD550(a21, (uint64_t)v57);
  sub_2471FD550(a22, (uint64_t)v56);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v39, *MEMORY[0x24BEA7148], v34);
  SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:runningAppIds:deviceState:owner:verb:invocationType:)(v49, v50, v45, v51, v52, v53, v54, v55, (uint64_t)v57, (uint64_t)v56, a23, a24, v39, v46, v47, a24, a23, v48, v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55);
  __swift_destroy_boxed_opaque_existential_2Tm(a22);
  __swift_destroy_boxed_opaque_existential_2Tm(a21);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v31, v40);
  OUTLINED_FUNCTION_34();
}

void SiriSuggestions.Interaction.init(requestId:generationId:dialogIdentifiers:intent:executionParameters:catGlobalProperties:salientEntities:deviceState:owner:verb:invocationType:relatedIntent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_5_15(v28, v29, v30, v31, v32, v33);
  v24[8] = a23;
  v24[9] = a24;
  v24[12] = v26;
  v24[13] = v25;
  sub_2471F6814(v27, (uint64_t)(v24 + 14));
  v34 = OUTLINED_FUNCTION_3_12();
  v35 = OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_8_14(v35);
  v36 = OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_7_17(v36);
  OUTLINED_FUNCTION_16_11();
  *((_BYTE *)v24 + *(int *)(v34 + 64)) = 0;
  OUTLINED_FUNCTION_34();
}

uint64_t SiriSuggestions.Interaction.runningAppIds.getter()
{
  return sub_2472792A0();
}

uint64_t sub_24726F6E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438878);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 48);
  v5 = sub_247270770(&v7, (_OWORD *)(v3 + 32), v1, a1);
  sub_24727912C();
  sub_2471F847C();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_24726F7C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438870);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 64);
  v5 = sub_2472709BC(&v7, (_OWORD *)(v3 + 32), v1, a1);
  sub_24727912C();
  sub_2471F847C();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

size_t sub_24726F8A8()
{
  return sub_24726F8D0();
}

size_t sub_24726F8BC()
{
  return sub_24726F8D0();
}

size_t sub_24726F8D0()
{
  uint64_t *v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  size_t result;
  uint64_t v11;

  OUTLINED_FUNCTION_219();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return MEMORY[0x24BEE4AF8];
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName(v0);
  v5 = *(_QWORD *)(v4(0) - 8);
  v6 = *(_QWORD *)(v5 + 72);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v8);
  if (v6)
  {
    if (result - v7 != 0x8000000000000000 || v6 != -1)
    {
      v8[2] = v3;
      v8[3] = 2 * ((uint64_t)(result - v7) / v6);
      v11 = sub_247270C0C();
      OUTLINED_FUNCTION_74();
      sub_2471F847C();
      if (v11 == v3)
        return (size_t)v8;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_24726F9DC()
{
  sub_247270734(&qword_2544385D0, (uint64_t)&protocol conformance descriptor for SiriSuggestions.Interaction);
}

uint64_t _s11InteractionVwCP(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v8 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v8;
    v9 = a2 + 3;
    v10 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 48) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    sub_24727912C();
    sub_24727912C();
    sub_24727912C();
    v12(a1 + 24, v9, v11);
    v13 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v13;
    v14 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v14;
    v15 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v15;
    v16 = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 136) = v16;
    v17 = v16;
    v18 = **(void (***)(uint64_t, uint64_t, uint64_t))(v16 - 8);
    sub_24727912C();
    sub_24727912C();
    sub_24727912C();
    sub_24727912C();
    v18(a1 + 112, (uint64_t)(a2 + 14), v17);
    v19 = a3[13];
    v20 = a1 + v19;
    v21 = (uint64_t)a2 + v19;
    v22 = sub_247278334();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    v23 = a3[14];
    v24 = a1 + v23;
    v25 = (uint64_t)a2 + v23;
    v26 = sub_247278ACC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = a3[15];
    v28 = (void *)(a1 + v27);
    v29 = (char *)a2 + v27;
    v30 = sub_247278BB0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, v30))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
      __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v30);
    }
    *(_BYTE *)(a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  }
  return a1;
}

uint64_t _s11InteractionVwxx(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(a1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(a1 + 112);
  v4 = a1 + a2[13];
  v5 = sub_247278334();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[14];
  v7 = sub_247278ACC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[15];
  v9 = sub_247278BB0();
  result = __swift_getEnumTagSinglePayload(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return result;
}

uint64_t _s11InteractionVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
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
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = a2 + 24;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v8;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  sub_24727912C();
  sub_24727912C();
  sub_24727912C();
  v10(a1 + 24, v7, v9);
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v11;
  v12 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v12;
  v13 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v13;
  v14 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 136) = v14;
  v15 = v14;
  v16 = **(void (***)(uint64_t, uint64_t, uint64_t))(v14 - 8);
  sub_24727912C();
  sub_24727912C();
  sub_24727912C();
  sub_24727912C();
  v16(a1 + 112, a2 + 112, v15);
  v17 = a3[13];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_247278334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = a3[14];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = sub_247278ACC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = a3[15];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = sub_247278BB0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
  }
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  return a1;
}

_QWORD *_s11InteractionVwca(_QWORD *a1, _QWORD *a2, int *a3)
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
  int v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  sub_24727912C();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  a1[8] = a2[8];
  a1[9] = a2[9];
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[13] = a2[13];
  sub_24727912C();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 14, a2 + 14);
  v6 = a3[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_247278334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[14];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_247278ACC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[15];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_247278BB0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (!EnumTagSinglePayload)
  {
    v20 = *(_QWORD *)(v17 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
LABEL_7:
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  return a1;
}

uint64_t _s11InteractionVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  const void *v19;
  uint64_t v20;
  uint64_t v21;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v9 = a3[13];
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_OWORD *)(a1 + 96) = v8;
  v12 = sub_247278334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[14];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_247278ACC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = a3[15];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = sub_247278BB0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  return a1;
}

uint64_t _s11InteractionVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  int EnumTagSinglePayload;
  int v21;
  uint64_t v22;
  uint64_t v23;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_2Tm(a1 + 112);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v8 = a3[13];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_247278334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[14];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_247278ACC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[15];
  v17 = (void *)(a1 + v16);
  v18 = (const void *)(a2 + v16);
  v19 = sub_247278BB0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    v22 = *(_QWORD *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(v22 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
LABEL_7:
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  return a1;
}

uint64_t _s11InteractionVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247270488(uint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_11_3();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = a3[13];
    }
    else
    {
      v11 = OUTLINED_FUNCTION_5_11();
      if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == (_DWORD)a2)
      {
        v9 = v11;
        v10 = a3[14];
      }
      else
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
        v10 = a3[15];
      }
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v10, a2, v9);
  }
}

uint64_t _s11InteractionVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_24727054C(_QWORD *result, uint64_t a2, int a3, int *a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_11_3();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = a4[13];
    }
    else
    {
      v11 = OUTLINED_FUNCTION_5_11();
      if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
      {
        v9 = v11;
        v10 = a4[14];
      }
      else
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438630);
        v10 = a4[15];
      }
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

void sub_247270600()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_247278334();
  if (v0 <= 0x3F)
  {
    sub_247278ACC();
    if (v1 <= 0x3F)
    {
      sub_2472706E0();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_2472706E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254438638)
  {
    sub_247278BB0();
    v0 = sub_2472793CC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254438638);
  }
}

void sub_247270734(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for SiriSuggestions.Interaction();
    atomic_store(MEMORY[0x249575B14](a2, v4), a1);
  }
  OUTLINED_FUNCTION_30();
}

_QWORD *sub_247270770(_QWORD *result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v12 = 0;
LABEL_37:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v12;
  }
  if (!a3)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
    goto LABEL_39;
  v10 = a2;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  v24 = result;
  v11 = 0;
  v12 = 0;
  v25 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v14 = v13 | (v11 << 6);
  while (1)
  {
    ++v12;
    v18 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    sub_247203588(*(_QWORD *)(a4 + 56) + 32 * v14, (uint64_t)&v27);
    *(_QWORD *)&v26 = v20;
    *((_QWORD *)&v26 + 1) = v19;
    v22 = v27;
    v21 = v28;
    v30 = v27;
    v31 = v28;
    v29 = v26;
    *v10 = v26;
    v10[1] = v22;
    v10[2] = v21;
    if (v12 == a3)
    {
      sub_24727912C();
      v12 = a3;
      goto LABEL_36;
    }
    v10 += 3;
    result = (_QWORD *)sub_24727912C();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v15 >= v25)
      goto LABEL_35;
    v16 = *(_QWORD *)(v5 + 8 * v15);
    if (!v16)
    {
      v17 = v11 + 2;
      ++v11;
      if (v15 + 1 >= v25)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v11 = v15 + 1;
      if (v15 + 2 >= v25)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * (v15 + 2));
      if (v16)
      {
        v15 += 2;
      }
      else
      {
        v11 = v15 + 2;
        if (v15 + 3 >= v25)
          goto LABEL_35;
        v16 = *(_QWORD *)(v5 + 8 * (v15 + 3));
        if (!v16)
        {
          v17 = v15 + 4;
          v11 = v15 + 3;
          if (v15 + 4 < v25)
          {
            v16 = *(_QWORD *)(v5 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                v15 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_40;
                if (v15 >= v25)
                {
                  v11 = v25 - 1;
                  goto LABEL_35;
                }
                v16 = *(_QWORD *)(v5 + 8 * v15);
                ++v17;
                if (v16)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v15 = v17;
            goto LABEL_21;
          }
LABEL_35:
          v8 = 0;
LABEL_36:
          v6 = v23;
          result = v24;
          goto LABEL_37;
        }
        v15 += 3;
      }
    }
LABEL_21:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v15 << 6);
    v11 = v15;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

_QWORD *sub_2472709BC(_QWORD *result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  int64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v12 = 0;
LABEL_37:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v12;
  }
  if (!a3)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
    goto LABEL_39;
  v10 = a2;
  v24 = -1 << *(_BYTE *)(a4 + 32);
  v25 = result;
  v11 = 0;
  v12 = 0;
  v26 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v14 = v13 | (v11 << 6);
  while (1)
  {
    ++v12;
    v18 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    sub_247203640(*(_QWORD *)(a4 + 56) + 48 * v14, (uint64_t)&v28);
    *(_QWORD *)&v27 = v20;
    *((_QWORD *)&v27 + 1) = v19;
    v22 = v29;
    v21 = v30;
    v33 = v29;
    v34 = v30;
    v23 = v28;
    v31 = v27;
    v32 = v28;
    *v10 = v27;
    v10[1] = v23;
    v10[2] = v22;
    v10[3] = v21;
    if (v12 == a3)
    {
      sub_24727912C();
      v12 = a3;
      goto LABEL_36;
    }
    v10 += 4;
    result = (_QWORD *)sub_24727912C();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v15 >= v26)
      goto LABEL_35;
    v16 = *(_QWORD *)(v5 + 8 * v15);
    if (!v16)
    {
      v17 = v11 + 2;
      ++v11;
      if (v15 + 1 >= v26)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v11 = v15 + 1;
      if (v15 + 2 >= v26)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * (v15 + 2));
      if (v16)
      {
        v15 += 2;
      }
      else
      {
        v11 = v15 + 2;
        if (v15 + 3 >= v26)
          goto LABEL_35;
        v16 = *(_QWORD *)(v5 + 8 * (v15 + 3));
        if (!v16)
        {
          v17 = v15 + 4;
          v11 = v15 + 3;
          if (v15 + 4 < v26)
          {
            v16 = *(_QWORD *)(v5 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                v15 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_40;
                if (v15 >= v26)
                {
                  v11 = v26 - 1;
                  goto LABEL_35;
                }
                v16 = *(_QWORD *)(v5 + 8 * v15);
                ++v17;
                if (v16)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v15 = v17;
            goto LABEL_21;
          }
LABEL_35:
          v8 = 0;
LABEL_36:
          v6 = v24;
          result = v25;
          goto LABEL_37;
        }
        v15 += 3;
      }
    }
LABEL_21:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v15 << 6);
    v11 = v15;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_247270C0C()
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
  _QWORD *v9;
  uint64_t (*v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  _QWORD *v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_53();
  v46 = v0;
  v47 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  OUTLINED_FUNCTION_38_4();
  v16 = v14 - v15;
  result = MEMORY[0x24BDAC7A8](v17, v18);
  v21 = (char *)&v38 - v20;
  v45 = v3;
  v24 = *(_QWORD *)(v3 + 64);
  v23 = v3 + 64;
  v22 = v24;
  v43 = v23;
  v25 = -1 << *(_BYTE *)(v23 - 32);
  if (-v25 < 64)
    v26 = ~(-1 << -(char)v25);
  else
    v26 = -1;
  v27 = v26 & v22;
  if (!v7)
  {
    v28 = 0;
    v5 = 0;
LABEL_38:
    v37 = v43;
    *v9 = v45;
    v9[1] = v37;
    v9[2] = ~v25;
    v9[3] = v28;
    v9[4] = v27;
    return v5;
  }
  if (!v5)
  {
    v28 = 0;
    goto LABEL_38;
  }
  if (v5 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v40 = -1 << *(_BYTE *)(v23 - 32);
  v41 = v9;
  v28 = 0;
  v29 = 0;
  v42 = (unint64_t)(63 - v25) >> 6;
  v39 = v42 - 1;
  v44 = v5;
  if (!v27)
    goto LABEL_9;
LABEL_8:
  v30 = __clz(__rbit64(v27));
  v27 &= v27 - 1;
  v31 = v30 | (v28 << 6);
  while (1)
  {
    ++v29;
    v35 = *(_QWORD *)(v12 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16))(v16, *(_QWORD *)(v45 + 56) + v35 * v31, v11);
    v36 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 32);
    v36(v21, v16, v11);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v36)(v7, v21, v11);
    v5 = v44;
    if (v29 == v44)
      goto LABEL_37;
    v7 += v35;
    if (v27)
      goto LABEL_8;
LABEL_9:
    v32 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v32 >= v42)
      goto LABEL_32;
    v33 = *(_QWORD *)(v43 + 8 * v32);
    if (!v33)
      break;
LABEL_18:
    v27 = (v33 - 1) & v33;
    v31 = __clz(__rbit64(v33)) + (v32 << 6);
    v28 = v32;
  }
  v28 += 2;
  if (v32 + 1 >= v42)
  {
    v27 = 0;
    v28 = v32;
    goto LABEL_36;
  }
  v33 = *(_QWORD *)(v43 + 8 * v28);
  if (v33)
    goto LABEL_14;
  v34 = v32 + 2;
  if (v32 + 2 >= v42)
    goto LABEL_32;
  v33 = *(_QWORD *)(v43 + 8 * v34);
  if (v33)
    goto LABEL_17;
  v28 = v32 + 3;
  if (v32 + 3 >= v42)
  {
    v27 = 0;
    v28 = v32 + 2;
    goto LABEL_36;
  }
  v33 = *(_QWORD *)(v43 + 8 * v28);
  if (v33)
  {
LABEL_14:
    v32 = v28;
    goto LABEL_18;
  }
  v34 = v32 + 4;
  if (v32 + 4 >= v42)
  {
LABEL_32:
    v27 = 0;
LABEL_36:
    v5 = v29;
LABEL_37:
    v25 = v40;
    v9 = v41;
    goto LABEL_38;
  }
  v33 = *(_QWORD *)(v43 + 8 * v34);
  if (v33)
  {
LABEL_17:
    v32 = v34;
    goto LABEL_18;
  }
  while (1)
  {
    v32 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v32 >= v42)
    {
      v27 = 0;
      v28 = v39;
      goto LABEL_36;
    }
    v33 = *(_QWORD *)(v43 + 8 * v32);
    ++v34;
    if (v33)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return type metadata accessor for SiriSuggestions.Interaction();
}

uint64_t OUTLINED_FUNCTION_5_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  __int128 *v8;

  v8 = *(__int128 **)(v7 + 24);
  v6[10] = a1;
  v6[11] = a2;
  v6[1] = a6;
  v6[2] = a5;
  *v6 = a4;
  return sub_2471F6814(v8, (uint64_t)(v6 + 3));
}

uint64_t OUTLINED_FUNCTION_7_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_8_14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_9_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v14, a14, a1);
}

uint64_t OUTLINED_FUNCTION_11_15()
{
  return sub_247279024();
}

uint64_t *OUTLINED_FUNCTION_14_13()
{
  uint64_t *v0;

  return __swift_allocate_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_16_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_24726E47C(v1, v0 + *(int *)(v2 + 60));
}

uint64_t OUTLINED_FUNCTION_17_17@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_20_13()
{
  return sub_247279210();
}

uint64_t OUTLINED_FUNCTION_21_13()
{
  return sub_247279210();
}

uint64_t OUTLINED_FUNCTION_22_10(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_23_8()
{
  return sub_247279024();
}

uint64_t OUTLINED_FUNCTION_26_10()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27_11()
{
  return sub_247278BB0();
}

uint64_t OUTLINED_FUNCTION_32_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_33_7()
{
  return sub_247279210();
}

void sub_247270FE4()
{
  sub_247271098();
}

void sub_247270FF0()
{
  sub_2472714F8();
}

void sub_247270FFC()
{
  sub_24727104C();
}

void sub_247271014()
{
  sub_2472716A0();
}

void sub_247271020()
{
  sub_247271098();
}

void sub_24727102C()
{
  sub_24727155C();
}

void sub_247271038()
{
  sub_24727104C();
}

void sub_24727104C()
{
  OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_247271080()
{
  sub_247271098();
}

void sub_24727108C()
{
  sub_2472715D0();
}

void sub_247271098()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_142();
  OUTLINED_FUNCTION_8_15(v0);
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

uint64_t sub_2472710C4()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

uint64_t sub_2472710FC()
{
  return sub_247279204();
}

uint64_t sub_247271114()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

uint64_t sub_24727114C()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

uint64_t sub_247271184()
{
  return sub_247279204();
}

uint64_t sub_247271198()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

uint64_t sub_2472711E4()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

void sub_247271234(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_247271278()
{
  sub_247279204();
  return swift_bridgeObjectRelease();
}

void sub_247271330(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_247271374()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

void sub_2472713EC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_247271430()
{
  OUTLINED_FUNCTION_2_16();
  return OUTLINED_FUNCTION_0_16();
}

void sub_2472714E0()
{
  sub_247271628();
}

void sub_2472714EC()
{
  sub_247271628();
}

void sub_2472714F8()
{
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_24727155C()
{
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_2472715BC()
{
  sub_24727166C();
}

void sub_2472715D0()
{
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_24727161C()
{
  sub_247271628();
}

void sub_247271628()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_8_15(v0);
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_247271654()
{
  sub_24727166C();
}

void sub_24727166C()
{
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

void sub_2472716A0()
{
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_2_16();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_140();
}

uint64_t SiriSuggestionsStateStoreDefaultKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247271720 + 4 * byte_247280F94[*v0]))(0xD000000000000010, 0x8000000247281950);
}

uint64_t sub_247271720(uint64_t a1)
{
  return a1 + 4;
}

unint64_t static SiriSuggestionsXPCConstants.machServiceName.getter()
{
  return OUTLINED_FUNCTION_7_18(25);
}

unint64_t static SiriSuggestionsXPCConstants.allowedEntitlementName.getter()
{
  return OUTLINED_FUNCTION_7_18(31);
}

unint64_t static SiriSuggestionsXPCConstants.appIdEntitlementName.getter()
{
  return OUTLINED_FUNCTION_7_18(40);
}

uint64_t SiriSuggestionsXPCConstants.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriSuggestionsXPCConstants.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

SiriSuggestionsAPI::SiriSuggestionsStateStoreDefaultKeys_optional __swiftcall SiriSuggestionsStateStoreDefaultKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriSuggestionsAPI::SiriSuggestionsStateStoreDefaultKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2472795C4();
  result.value = OUTLINED_FUNCTION_28();
  v5 = 8;
  if (v3 < 8)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_247271878(char *a1)
{
  sub_24722EA2C(*a1);
}

unint64_t sub_247271888()
{
  unint64_t result;

  result = qword_25767EBA0;
  if (!qword_25767EBA0)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SiriSuggestionsStateStoreDefaultKeys, &type metadata for SiriSuggestionsStateStoreDefaultKeys);
    atomic_store(result, (unint64_t *)&qword_25767EBA0);
  }
  return result;
}

void sub_2472718C4()
{
  sub_247271098();
}

void sub_2472718E4(uint64_t a1)
{
  char *v1;

  sub_247271234(a1, *v1);
}

void sub_2472718EC()
{
  sub_247271628();
}

SiriSuggestionsAPI::SiriSuggestionsStateStoreDefaultKeys_optional sub_24727190C(Swift::String *a1)
{
  return SiriSuggestionsStateStoreDefaultKeys.init(rawValue:)(*a1);
}

uint64_t sub_247271918@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SiriSuggestionsStateStoreDefaultKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for SiriSuggestionsXPCConstants()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriSuggestionsXPCConstants()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for SiriSuggestionsStateStoreDefaultKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriSuggestionsStateStoreDefaultKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247271A3C + 4 * byte_247280FA1[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_247271A70 + 4 * byte_247280F9C[v4]))();
}

uint64_t sub_247271A70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247271A78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247271A80);
  return result;
}

uint64_t sub_247271A8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247271A94);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_247271A98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247271AA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSuggestionsStateStoreDefaultKeys()
{
  return &type metadata for SiriSuggestionsStateStoreDefaultKeys;
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_16()
{
  return sub_247279204();
}

unint64_t OUTLINED_FUNCTION_7_18(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_8_15(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

void *sub_247271AE0()
{
  return &unk_251879AC8;
}

unint64_t sub_247271AEC(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD00000000000001CLL;
  else
    return 0xD000000000000019;
}

uint64_t sub_247271B28(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247271B64 + 4 * byte_247281190[a1]))(0xD00000000000001CLL, 0x8000000247283940);
}

uint64_t sub_247271B64()
{
  uint64_t v0;

  return v0 - 7;
}

uint64_t type metadata accessor for FeatureAnnouncementCATsSimple()
{
  return objc_opt_self();
}

uint64_t static SiriSuggestions.Constants.isSiriRuntimeEnabled()()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  char v9;
  uint64_t v11;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_processName);

  sub_2472791A4();
  v2 = sub_2472791F8();
  v4 = v3;
  swift_bridgeObjectRelease();
  if (qword_254439B98 != -1)
    swift_once();
  v5 = sub_247279048();
  __swift_project_value_buffer(v5, (uint64_t)qword_254439B80);
  swift_bridgeObjectRetain_n();
  v6 = sub_247279030();
  v7 = sub_2472793A8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    sub_24727912C();
    sub_2472728FC(v2, v4, &v11);
    sub_2472793D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2471ED000, v6, v7, "Got running process as %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_24_0();
  }

  swift_bridgeObjectRelease_n();
  if (qword_254438F58 != -1)
    swift_once();
  v9 = sub_247272318(v2, v4, (_QWORD *)qword_254438FF0);
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_247271E24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  sub_2471FA5EC((uint64_t)(v0 + 7), (uint64_t)v13);
  v2 = v14;
  v3 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v1)
  {
    v8 = v6;
    v9 = v7;
    v10 = *(void (**)(ValueMetadata *, uint64_t, unint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(v3 + 8);
    v11 = sub_2472730C4();
    v10(&type metadata for SiriSuggestionsRuntimeConfig, v8, v9, &type metadata for SiriSuggestionsRuntimeConfig, v11, v2, v3);
    sub_2471FD35C(v8, v9);
  }
  return __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v13);
}

uint64_t static SiriSuggestions.Constants.loadRuntimeConfig(configUrl:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, char *, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t inited;
  _QWORD v42[2];
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  uint64_t v54;
  _UNKNOWN **v55;
  uint64_t v56;

  v45 = sub_247279048();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45, v3);
  v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_247278298();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v46 = (char *)v42 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)v42 - v17;
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)v42 - v20;
  sub_247278268();
  sub_247278D60();
  v47 = v7;
  v22 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v48 = v21;
  v43 = v22;
  v22(v18, v21, v6);
  v23 = sub_247279030();
  v24 = sub_2472793A8();
  v25 = os_log_type_enabled(v23, v24);
  v56 = a1;
  v49 = v11;
  if (v25)
  {
    v26 = swift_slowAlloc();
    v42[1] = v1;
    v27 = (uint8_t *)v26;
    *(_QWORD *)&v53 = swift_slowAlloc();
    *(_DWORD *)v27 = 136315138;
    v42[0] = v27 + 4;
    v28 = sub_247278244();
    *(_QWORD *)&v50 = sub_2472728FC(v28, v29, (uint64_t *)&v53);
    sub_2472793D8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_17();
    _os_log_impl(&dword_2471ED000, v23, v24, "loading runtime config from path: %s", v27, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_24_0();
  }
  v30 = v47;
  v31 = *(void (**)(char *, uint64_t))(v47 + 8);
  OUTLINED_FUNCTION_0_17();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v5, v45);
  v32 = v48;
  v33 = v46;
  v34 = v43;
  v43(v46, v48, v6);
  v35 = type metadata accessor for JsonSerializer();
  v36 = swift_allocObject();
  v54 = v35;
  v55 = &protocol witness table for JsonSerializer;
  *(_QWORD *)&v53 = v36;
  v37 = v49;
  v34(v49, v33, v6);
  v38 = type metadata accessor for FileBasedConfigBackingStore();
  v39 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v39 + OBJC_IVAR____TtC18SiriSuggestionsAPI27FileBasedConfigBackingStore_dataFileLocation, v37, v6);
  v51 = v38;
  v52 = sub_247273074();
  *(_QWORD *)&v50 = v39;
  OUTLINED_FUNCTION_0_17();
  __swift_instantiateConcreteTypeFromMangledName(qword_254439E98);
  inited = swift_initStackObject();
  sub_2471F6814(&v50, inited + 16);
  sub_2471F6814(&v53, inited + 56);
  sub_247271E24();
  v31(v32, v6);
  swift_setDeallocating();
  __swift_destroy_boxed_opaque_existential_2Tm(inited + 16);
  return __swift_destroy_boxed_opaque_existential_2Tm(inited + 56);
}

uint64_t sub_247272318(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_24727972C();
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
    if (v12 || (sub_24727972C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2472723DC()
{
  uint64_t v0;

  v0 = sub_247278B50();
  __swift_allocate_value_buffer(v0, qword_254438F38);
  OUTLINED_FUNCTION_1_11();
  return sub_247278B20();
}

uint64_t static SiriSuggestions.Constants.SiriUIInAppConversationIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247272598(&qword_254438E30, (uint64_t (*)(_QWORD))MEMORY[0x24BEA72B8], (uint64_t)qword_254438F38, a1);
}

uint64_t sub_24727247C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v8;

  v0 = sub_247278298();
  v1 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x24BDAC7A8](v0, v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v3, qword_25443A1D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25443A1D0);
  v6 = (id)MEMORY[0x24957573C]();
  sub_2472791A4();

  sub_247278250();
  swift_bridgeObjectRelease();
  sub_247278268();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v5, v0);
}

uint64_t static SiriSuggestions.Constants.baseURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247272598(&qword_25443A1E8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t)qword_25443A1D0, a1);
}

uint64_t sub_247272598@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_247272604()
{
  uint64_t v0;

  v0 = sub_247278298();
  __swift_allocate_value_buffer(v0, qword_25443A1F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25443A1F0);
  if (qword_25443A1E8 != -1)
    swift_once();
  __swift_project_value_buffer(v0, (uint64_t)qword_25443A1D0);
  return sub_247278268();
}

uint64_t static SiriSuggestions.Constants.configUrl.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247272598(&qword_25443A348, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t)qword_25443A1F0, a1);
}

uint64_t sub_2472726CC()
{
  uint64_t v0;

  v0 = sub_247278298();
  __swift_allocate_value_buffer(v0, qword_254439CE8);
  OUTLINED_FUNCTION_1_11();
  if (qword_25443A348 != -1)
    swift_once();
  __swift_project_value_buffer(v0, (uint64_t)qword_25443A1F0);
  return sub_247278268();
}

uint64_t static SiriSuggestions.Constants.defaultPlatformConfigPath.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247272598(&qword_254439D00, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t)qword_254439CE8, a1);
}

double sub_24727278C()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25443A000);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 2;
  *(_OWORD *)(v0 + 16) = xmmword_24727D090;
  *(_QWORD *)(v0 + 32) = 0xD000000000000011;
  *(_QWORD *)(v0 + 40) = 0x80000002472842A0;
  *(_QWORD *)(v0 + 48) = 0x747365746378;
  *(_QWORD *)(v0 + 56) = 0xE600000000000000;
  qword_254438FF0 = v0;
  return result;
}

uint64_t static SiriSuggestions.Constants.secondsInHour.getter()
{
  return 3600;
}

unint64_t static SiriSuggestions.Constants.engagementTipEventPrefix.getter()
{
  return 0xD000000000000015;
}

unint64_t static SiriSuggestions.Constants.educatedTipEventPrefix.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_247272838(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24727286C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24727288C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2472728FC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2472793D8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2472728FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2472729CC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247203588((uint64_t)v12, *a3);
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
      sub_247203588((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_24727912C();
  }
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2472729CC(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_247272B20((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2472793E4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_247272BE4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2472794B0();
    if (!v8)
    {
      result = sub_247279564();
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

void *sub_247272B20(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2472795B8();
  __break(1u);
  return result;
}

uint64_t sub_247272BE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247272C78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_247272E4C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_247272E4C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247272C78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_24727921C();
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
  v3 = sub_247272DE8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_247279474();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2472795B8();
  __break(1u);
LABEL_14:
  result = sub_247279564();
  __break(1u);
  return result;
}

_QWORD *sub_247272DE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25443A008);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_247272E4C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25443A008);
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
    sub_247272FE4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247272F20(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_247272F20(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2472795B8();
  __break(1u);
  return result;
}

char *sub_247272FE4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2472795B8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_247273064(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_247273074()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25443A278;
  if (!qword_25443A278)
  {
    v1 = type metadata accessor for FileBasedConfigBackingStore();
    result = MEMORY[0x249575B14](&protocol conformance descriptor for FileBasedConfigBackingStore, v1);
    atomic_store(result, (unint64_t *)&qword_25443A278);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriSuggestions.Constants()
{
  return &type metadata for SiriSuggestions.Constants;
}

unint64_t sub_2472730C4()
{
  unint64_t result;

  result = qword_254439E90;
  if (!qword_254439E90)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SiriSuggestionsRuntimeConfig, &type metadata for SiriSuggestionsRuntimeConfig);
    atomic_store(result, (unint64_t *)&qword_254439E90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_project_value_buffer(v0, v1);
}

void SignalledOwner.rootOwner.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2471FD550(v1 + 16, a1);
}

uint64_t SignalledOwner.isConversationalContinuer.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t SignalledOwner.matchedSignalDetails.getter()
{
  return sub_24727912C();
}

size_t SignalledOwner.matchedSignals.getter()
{
  return sub_2472737C0();
}

size_t sub_247273150(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  unint64_t v12;
  size_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767D168);
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v3);
  v5 = (uint64_t *)((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_24720940C();
    v7 = v17;
    v15 = sub_247278940();
    v8 = *(_QWORD *)(v15 - 8);
    v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v10 = *(_QWORD *)(v8 + 72);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    do
    {
      v11((char *)v5 + *(int *)(v16 + 48), v9, v15);
      *v5 = sub_247278934();
      v17 = v7;
      v12 = *(_QWORD *)(v7 + 16);
      if (v12 >= *(_QWORD *)(v7 + 24) >> 1)
      {
        sub_24720940C();
        v7 = v17;
      }
      *(_QWORD *)(v7 + 16) = v12 + 1;
      sub_247276F28((uint64_t)v5, v7+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v12);
      v9 += v10;
      --v6;
    }
    while (v6);
  }
  sub_247273728(v7);
  v13 = sub_24726F8A8();
  swift_bridgeObjectRelease();
  return v13;
}

void SignalledOwner.__allocating_init(rootOwner:matchedSignals:isConversationalContinuer:)(__int128 *a1, uint64_t a2, char a3)
{
  OUTLINED_FUNCTION_72_6();
  SignalledOwner.init(rootOwner:matchedSignals:isConversationalContinuer:)(a1, a2, a3);
  OUTLINED_FUNCTION_148();
}

void SignalledOwner.init(rootOwner:matchedSignals:isConversationalContinuer:)(__int128 *a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_2471F6814(a1, v3 + 16);
  *(_QWORD *)(v3 + 64) = a2;
  *(_BYTE *)(v3 + 56) = a3;
  OUTLINED_FUNCTION_148();
}

uint64_t SignalledOwner.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  __int128 v9[2];
  __int128 v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254437E20);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  OUTLINED_FUNCTION_11_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2472748F0();
  sub_247279804();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D58);
    LOBYTE(v9[0]) = 0;
    sub_247278A9C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D30);
    v11 = 1;
    sub_24727492C(&qword_254437DB8, &qword_254437D40, MEMORY[0x24BEA70E0], MEMORY[0x24BEE12D0]);
    sub_247279654();
    v6 = *(_QWORD *)&v9[0];
    LOBYTE(v9[0]) = 2;
    v8 = sub_247279624();
    OUTLINED_FUNCTION_36_6();
    sub_2471F6814(&v10, (uint64_t)v9);
    v4 = swift_allocObject();
    SignalledOwner.init(rootOwner:matchedSignals:isConversationalContinuer:)(v9, v6, v8 & 1);
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)a1);
  }
  return v4;
}

uint64_t SignalledOwner.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  uint64_t v17[5];
  char v18;

  v3 = v1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544386C0);
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v6);
  OUTLINED_FUNCTION_65();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2472748F0();
  sub_24727981C();
  v18 = 0;
  v10 = v3[5];
  v11 = v3[6];
  v12 = __swift_project_boxed_opaque_existential_1(v3 + 2, v10);
  v13 = *(_QWORD *)(v11 + 32);
  v17[3] = v10;
  v17[4] = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, v12, v10);
  sub_247278AA8();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v16);
    return OUTLINED_FUNCTION_53_6();
  }
  else
  {
    OUTLINED_FUNCTION_53_6();
    v17[0] = v3[8];
    v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D30);
    sub_24727492C(&qword_254438688, &qword_254438610, MEMORY[0x24BEA70D8], MEMORY[0x24BEE12A0]);
    sub_2472796E4();
    LOBYTE(v17[0]) = 2;
    sub_2472796B4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v16);
  }
}

uint64_t sub_247273728(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBC0);
    v3 = sub_2472795AC();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  v6 = v3;
  sub_2472749B4(a1, 1, (uint64_t)&v6);
  v4 = v6;
  if (v1)
    swift_release();
  return v4;
}

size_t SignalledOwner.activeSignals.getter()
{
  return sub_2472737C0();
}

size_t sub_2472737C0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
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
  size_t v19;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;

  OUTLINED_FUNCTION_53();
  v25 = v2;
  v3 = sub_247278A54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  OUTLINED_FUNCTION_65();
  v8 = v7 - v6;
  v24 = sub_247278940();
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24, v10);
  OUTLINED_FUNCTION_11_0();
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v11 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (v12)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_24727912C();
    sub_247209440();
    OUTLINED_FUNCTION_52_4();
    v15 = v11 + v14;
    v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v22 = *(_QWORD *)(v4 + 72);
    v23 = v4;
    do
    {
      v16 = v21(v8, v15, v3);
      v25(v16);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
      v13 = v26;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_247209440();
        v13 = v26;
      }
      v17 = *(_QWORD *)(v13 + 16);
      if (v17 >= *(_QWORD *)(v13 + 24) >> 1)
      {
        sub_247209440();
        v13 = v26;
      }
      *(_QWORD *)(v13 + 16) = v17 + 1;
      OUTLINED_FUNCTION_52_4();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v13 + v18 + *(_QWORD *)(v9 + 72) * v17, v1, v24);
      v26 = v13;
      v4 = v23;
      v15 += v22;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
  }
  v19 = sub_247273150(v13);
  OUTLINED_FUNCTION_28();
  return v19;
}

uint64_t SignalledOwner.getSuggestionGroup()()
{
  sub_2472787FC();
  sub_2472787F0();
  sub_2472787E4();
  return swift_release();
}

Swift::String __swiftcall SignalledOwner.getIdentifier()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v3 = MEMORY[0x249574BC0](v1, v2);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t SignalledOwner.description.getter()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  return sub_247279708();
}

uint64_t static SignalledOwner.create(owner:suggestions:isConversationalContinuer:)(uint64_t a1, uint64_t a2, int a3)
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
  char *v15;
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
  uint64_t v32;
  uint64_t v33;
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
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t v82;
  BOOL v83;
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
  void (*v95)(uint64_t, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  size_t v101;
  uint64_t v102;
  uint64_t result;
  uint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
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
  __int128 v138;

  v4 = v3;
  v106 = a3;
  v105 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438D10);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_17_0();
  v126 = v8;
  v123 = sub_247278940();
  v128 = *(_QWORD *)(v123 - 8);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x24BDAC7A8](v9, v10);
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_27_12();
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = (char *)&v104 - v14;
  MEMORY[0x24BDAC7A8](v13, v16);
  OUTLINED_FUNCTION_21_2();
  v125 = v17;
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v22 = (char *)&v104 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v131 = (uint64_t)&v104 - v24;
  v25 = sub_247278A54();
  v129 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x24BDAC7A8](v26, v27);
  OUTLINED_FUNCTION_31_1();
  v130 = v28;
  MEMORY[0x24BDAC7A8](v29, v30);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_27_12();
  MEMORY[0x24BDAC7A8](v31, v32);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_27_12();
  MEMORY[0x24BDAC7A8](v33, v34);
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_27_12();
  MEMORY[0x24BDAC7A8](v35, v36);
  v38 = (char *)&v104 - v37;
  v39 = type metadata accessor for SiriSuggestions.Suggestion(0);
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39, v41);
  OUTLINED_FUNCTION_65();
  v44 = v43 - v42;
  sub_247276750();
  v127 = v25;
  v136 = sub_247279120();
  v111 = *(_QWORD *)(a2 + 16);
  if (!v111)
    goto LABEL_29;
  v45 = v44 + *(int *)(v39 + 36);
  OUTLINED_FUNCTION_52_4();
  v47 = a2 + v46;
  v114 = *(_QWORD *)(v40 + 72);
  v104 = a2;
  sub_24727912C();
  v48 = 0;
  v49 = (uint64_t)v38;
  v50 = v47;
  v51 = v44;
  v52 = v45;
  v53 = v111;
  v110 = v4;
  v116 = v15;
  v122 = v22;
  v109 = v51;
  v108 = v45;
  v107 = v50;
  v124 = v49;
  while (1)
  {
    v115 = v48;
    sub_247208168(v50 + v114 * v48, v51);
    sub_2471FD550(v52, (uint64_t)&v138);
    sub_247222D80(v51);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254438D58);
    if ((swift_dynamicCast() & 1) != 0)
      break;
LABEL_27:
    v48 = v115 + 1;
    if (v115 + 1 == v53)
    {
      swift_bridgeObjectRelease();
LABEL_29:
      sub_2471FD550(v105, (uint64_t)&v138);
      sub_24727912C();
      v101 = sub_24726F8BC();
      swift_bridgeObjectRelease();
      v102 = OUTLINED_FUNCTION_72_6();
      SignalledOwner.init(rootOwner:matchedSignals:isConversationalContinuer:)(&v138, v101, v106 & 1);
      swift_bridgeObjectRelease();
      return v102;
    }
  }
  v54 = *(_QWORD *)(*(_QWORD *)(v137 + 64) + 16);
  if (!v54)
  {
    swift_release();
    goto LABEL_27;
  }
  v113 = v137;
  v55 = v129;
  OUTLINED_FUNCTION_52_4();
  v58 = v57 + v56;
  v112 = v57;
  sub_24727912C();
  v59 = *(_QWORD *)(v55 + 16);
  v134 = *(_QWORD *)(v55 + 72);
  v135 = v59;
  v60 = v123;
  v61 = v127;
  while (1)
  {
    v132 = v58;
    v133 = v54;
    OUTLINED_FUNCTION_18_14(v49, v58);
    v62 = v131;
    sub_247278A30();
    v63 = sub_247278934();
    OUTLINED_FUNCTION_14_14(v62);
    OUTLINED_FUNCTION_66_5();
    v64 = sub_247278934();
    OUTLINED_FUNCTION_14_14((uint64_t)v22);
    sub_247278A48();
    v66 = v65;
    v67 = v136;
    if (*(_QWORD *)(v136 + 16))
    {
      OUTLINED_FUNCTION_70_8();
      OUTLINED_FUNCTION_75_6();
      v68 = OUTLINED_FUNCTION_22_11();
      if ((v69 & 1) != 0)
      {
        v70 = v126;
        OUTLINED_FUNCTION_18_14(v126, *(_QWORD *)(v67 + 56) + v68 * v134);
        v71 = 0;
      }
      else
      {
        v71 = 1;
        v70 = v126;
      }
      OUTLINED_FUNCTION_144_2(v70, v71);
      swift_release();
      swift_release();
      if (__swift_getEnumTagSinglePayload(v70, 1, v61) != 1)
      {
        v85 = v120;
        (*(void (**)(uint64_t, uint64_t, unint64_t))(v129 + 32))(v120, v70, v61);
        OUTLINED_FUNCTION_65_8();
        sub_247278934();
        OUTLINED_FUNCTION_14_14((uint64_t)v22);
        v86 = v125;
        OUTLINED_FUNCTION_65_8();
        v87 = OUTLINED_FUNCTION_74_6();
        OUTLINED_FUNCTION_14_14(v86);
        v88 = (uint64_t)v116;
        sub_247278A30();
        v89 = OUTLINED_FUNCTION_74_6();
        OUTLINED_FUNCTION_14_14(v88);
        if (__OFADD__(v87, v89))
          goto LABEL_32;
        v90 = v131;
        sub_247278928();
        v91 = v125;
        sub_247278A3C();
        sub_247278934();
        OUTLINED_FUNCTION_14_14(v91);
        OUTLINED_FUNCTION_66_5();
        v121 = OUTLINED_FUNCTION_74_6();
        OUTLINED_FUNCTION_14_14(v88);
        v92 = v119;
        sub_247278A30();
        v93 = sub_24727891C();
        OUTLINED_FUNCTION_14_14(v92);
        if (__OFADD__(v121, v93))
          goto LABEL_33;
        v94 = (uint64_t)v122;
        sub_247278928();
        v95 = *(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 16);
        v95(v125, v90, v60);
        v95(v88, v94, v60);
        v96 = v124;
        sub_247278A48();
        v97 = v117;
        sub_247278A24();
        v98 = v118;
        v61 = v127;
        OUTLINED_FUNCTION_18_14(v118, v97);
        OUTLINED_FUNCTION_64_9();
        *(_QWORD *)&v138 = v96;
        sub_247276608(v98, v63, v64, v66);
        v136 = v138;
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_54_9(v97);
        v99 = (uint64_t)v122;
        OUTLINED_FUNCTION_14_14((uint64_t)v122);
        OUTLINED_FUNCTION_14_14(v131);
        OUTLINED_FUNCTION_54_9(v85);
        v22 = (char *)v99;
        v49 = v124;
        v77 = v133;
        goto LABEL_24;
      }
    }
    else
    {
      v70 = v126;
      OUTLINED_FUNCTION_144_2(v126, 1);
    }
    sub_24727678C(v70);
    OUTLINED_FUNCTION_18_14(v130, v49);
    OUTLINED_FUNCTION_70_8();
    OUTLINED_FUNCTION_75_6();
    OUTLINED_FUNCTION_64_9();
    *(_QWORD *)&v138 = v67;
    v72 = OUTLINED_FUNCTION_22_11();
    if (__OFADD__(*(_QWORD *)(v67 + 16), (v73 & 1) == 0))
      break;
    v61 = v72;
    v74 = v73;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBA8);
    v75 = sub_24727951C();
    v76 = v129;
    v77 = v133;
    if ((v75 & 1) != 0)
    {
      v78 = OUTLINED_FUNCTION_22_11();
      if ((v74 & 1) != (v79 & 1))
        goto LABEL_34;
      v61 = v78;
    }
    v80 = (_QWORD *)v138;
    if ((v74 & 1) != 0)
    {
      OUTLINED_FUNCTION_42_12(*(_QWORD *)(v138 + 56) + v61 * v134, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v76 + 40));
    }
    else
    {
      *(_QWORD *)(v138 + 8 * (v61 >> 6) + 64) |= 1 << v61;
      v81 = (uint64_t *)(v80[6] + 24 * v61);
      *v81 = v63;
      v81[1] = v64;
      *((double *)v81 + 2) = v66;
      OUTLINED_FUNCTION_42_12(v80[7] + v61 * v134, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v76 + 32));
      v82 = v80[2];
      v83 = __OFADD__(v82, 1);
      v84 = v82 + 1;
      if (v83)
        goto LABEL_31;
      v80[2] = v84;
      OUTLINED_FUNCTION_70_8();
      OUTLINED_FUNCTION_75_6();
    }
    v136 = v138;
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    v60 = v123;
LABEL_24:
    v100 = v132;
    OUTLINED_FUNCTION_54_9(v49);
    v58 = v100 + v134;
    v54 = v77 - 1;
    if (!v54)
    {
      swift_release();
      swift_bridgeObjectRelease();
      v51 = v109;
      v53 = v111;
      v52 = v108;
      v50 = v107;
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  result = sub_247279768();
  __break(1u);
  return result;
}

uint64_t sub_2472742D0()
{
  sub_247278DD8();
  sub_2471FDEF8(&qword_25767D0E0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7750], MEMORY[0x24BEA7760]);
  OUTLINED_FUNCTION_30_10();
  OUTLINED_FUNCTION_30_10();
  return sub_2472797E0();
}

uint64_t sub_247274368(double a1, double a2)
{
  sub_247278DD8();
  if ((sub_247278DCC() & 1) != 0)
    return sub_247278DCC() & (a1 == a2);
  else
    return 0;
}

uint64_t sub_2472743EC()
{
  sub_2472797B0();
  sub_2472742D0();
  return sub_2472797EC();
}

uint64_t sub_247274448(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656E774F746F6F72 && a2 == 0xE900000000000072;
  if (v3 || (OUTLINED_FUNCTION_46() & 1) != 0)
  {
    OUTLINED_FUNCTION_28();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000247284300 || (OUTLINED_FUNCTION_46() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000247283590)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_28();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_247274564(char a1)
{
  if (!a1)
    return 0x656E774F746F6F72;
  if (a1 == 1)
    return 0xD000000000000014;
  return 0xD000000000000019;
}

uint64_t sub_2472745C4()
{
  return sub_2472743EC();
}

uint64_t sub_2472745D0()
{
  return sub_2472742D0();
}

uint64_t sub_2472745DC()
{
  sub_2472797B0();
  sub_2472742D0();
  return sub_2472797EC();
}

uint64_t sub_247274638(uint64_t a1, uint64_t a2)
{
  return sub_247274368(*(double *)(a1 + 16), *(double *)(a2 + 16));
}

uint64_t sub_247274654()
{
  char *v0;

  return sub_247274564(*v0);
}

uint64_t sub_24727465C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247274448(a1, a2);
  *a3 = result;
  return result;
}

void sub_247274680(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24727468C()
{
  sub_2472748F0();
  return sub_247279834();
}

uint64_t sub_2472746B4()
{
  sub_2472748F0();
  return sub_247279840();
}

uint64_t SignalledOwner.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_2Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SignalledOwner.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_2Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24727472C()
{
  return SignalledOwner.getSuggestionGroup()();
}

uint64_t sub_247274740()
{
  return SignalledOwner.getIdentifier()()._countAndFlagsBits;
}

uint64_t sub_247274764()
{
  return SignalledOwner.description.getter();
}

uint64_t sub_247274784(uint64_t a1, uint64_t a2)
{
  sub_2471FDEF8(&qword_25767EBB8, a2, (uint64_t (*)(uint64_t))type metadata accessor for SignalledOwner, (uint64_t)&protocol conformance descriptor for SignalledOwner);
  return sub_247278CE8();
}

uint64_t sub_2472747D4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = SignalledOwner.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2472747FC(_QWORD *a1)
{
  return SignalledOwner.encode(to:)(a1);
}

unint64_t sub_24727481C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t result;
  uint64_t v7;

  sub_2472797B0();
  sub_2472797C8();
  if ((a1 & 0x100000000) == 0)
    sub_2472797D4();
  sub_2472797EC();
  result = sub_247279438();
  *(_QWORD *)((char *)a3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
  v7 = a3[6] + 8 * result;
  *(_DWORD *)v7 = a1;
  *(_BYTE *)(v7 + 4) = BYTE4(a1) & 1;
  *(_QWORD *)(a3[7] + 8 * result) = a2;
  ++a3[2];
  return result;
}

unint64_t sub_2472748F0()
{
  unint64_t result;

  result = qword_254438C58;
  if (!qword_254438C58)
  {
    result = MEMORY[0x249575B14](&unk_2472814D0, &type metadata for SignalledOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254438C58);
  }
  return result;
}

uint64_t sub_24727492C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254438D30);
    sub_2471FDEF8(a2, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA70C8], a3);
    v11 = v10;
    result = MEMORY[0x249575B14](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2472749B4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD *v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  _QWORD *v40;
  unint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t result;
  _QWORD v53[2];
  uint64_t *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v4 = v3;
  v62 = a3;
  v59 = sub_247278940();
  v7 = *(_QWORD *)(v59 - 8);
  v9 = MEMORY[0x24BDAC7A8](v59, v8);
  v11 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v56 = (char *)v53 - v14;
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (char *)v53 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767D168);
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v23 = (_QWORD *)((char *)v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
    return swift_bridgeObjectRelease();
  v55 = v11;
  v53[0] = a1;
  v53[1] = v4;
  v58 = (char *)v23 + *(int *)(v20 + 48);
  v25 = a1 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  v57 = *(_QWORD *)(v21 + 72);
  sub_24727912C();
  v26 = v59;
  v27 = v23;
  v54 = v23;
  while (1)
  {
    v60 = v25;
    v61 = v24;
    sub_247276F70(v25, (uint64_t)v27);
    v28 = *v27;
    v29 = v7;
    v30 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v30(v17, v58, v26);
    v31 = *(_QWORD **)v62;
    v33 = sub_24720186C(v28);
    v34 = v31[2];
    v35 = (v32 & 1) == 0;
    v36 = v34 + v35;
    if (__OFADD__(v34, v35))
      break;
    v37 = v32;
    if (v31[3] >= v36)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBC8);
        sub_247279534();
      }
    }
    else
    {
      sub_247275C80(v36, a2 & 1);
      v38 = sub_24720186C(v28);
      if ((v37 & 1) != (v39 & 1))
        goto LABEL_20;
      v33 = v38;
    }
    v40 = *(_QWORD **)v62;
    if ((v37 & 1) != 0)
    {
      v7 = v29;
      v41 = *(_QWORD *)(v29 + 72) * v33;
      v42 = *(void (**)(char *, unint64_t, uint64_t))(v29 + 16);
      v43 = v17;
      v44 = v55;
      v45 = v59;
      v42(v55, v40[7] + v41, v59);
      sub_247278934();
      v46 = sub_24727891C();
      if (__OFADD__(v46, sub_24727891C()))
        goto LABEL_18;
      v47 = v56;
      sub_247278928();
      v48 = *(void (**)(char *, uint64_t))(v7 + 8);
      v48(v44, v45);
      v48(v43, v45);
      swift_release();
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 40))(*(_QWORD *)(*(_QWORD *)v62 + 56) + v41, v47, v45);
      v26 = v45;
      v17 = v43;
      v27 = v54;
    }
    else
    {
      v40[(v33 >> 6) + 8] |= 1 << v33;
      *(_QWORD *)(v40[6] + 8 * v33) = v28;
      v7 = v29;
      v26 = v59;
      v30((char *)(v40[7] + *(_QWORD *)(v29 + 72) * v33), v17, v59);
      v49 = v40[2];
      v50 = __OFADD__(v49, 1);
      v51 = v49 + 1;
      if (v50)
        goto LABEL_19;
      v40[2] = v51;
    }
    v25 = v60 + v57;
    a2 = 1;
    v24 = v61 - 1;
    if (v61 == 1)
      return swift_bridgeObjectRelease_n();
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  sub_247278DD8();
  result = sub_247279768();
  __break(1u);
  return result;
}

void sub_247274D18()
{
  uint64_t *v0;
  uint64_t *v1;
  char v2;
  char v3;
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
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_53();
  v1 = v0;
  v3 = v2;
  v41 = sub_247278B8C();
  v4 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41, v5);
  OUTLINED_FUNCTION_17_0();
  v40 = v6;
  v7 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254437E08);
  v39 = v3;
  v8 = OUTLINED_FUNCTION_19_12();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v38 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v7 + 64);
    v37 = (unint64_t)(v10 + 63) >> 6;
    v13 = v8 + 64;
    swift_retain();
    v14 = 0;
    if (!v12)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = *(_QWORD *)(v7 + 56);
      v21 = v7;
      v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * i);
      v24 = *v22;
      v23 = v22[1];
      v25 = *(_QWORD *)(v4 + 72);
      v26 = v20 + v25 * i;
      if ((v39 & 1) != 0)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v40, v26, v41);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v40, v26, v41);
        sub_24727912C();
      }
      sub_2472797B0();
      sub_247279204();
      v27 = sub_2472797EC() & ~(-1 << *(_BYTE *)(v9 + 32));
      if (((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6))) == 0)
      {
        OUTLINED_FUNCTION_6_14();
        while (1)
        {
          OUTLINED_FUNCTION_31_9();
          if (v32)
          {
            if ((v29 & 1) != 0)
              break;
          }
          if (v30 == v31)
            v30 = 0;
          if (*(_QWORD *)(v13 + 8 * v30) != -1)
          {
            OUTLINED_FUNCTION_15_14();
            goto LABEL_32;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_16_12();
LABEL_32:
      *(_QWORD *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      v33 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v28);
      *v33 = v24;
      v33[1] = v23;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(*(_QWORD *)(v9 + 56) + v25 * v28, v40, v41);
      OUTLINED_FUNCTION_13_14();
      v7 = v21;
      if (v12)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_41;
      if (v17 >= v37)
        goto LABEL_34;
      v18 = v38[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v37)
          goto LABEL_34;
        v18 = v38[v14];
        if (!v18)
        {
          v19 = v17 + 2;
          if (v19 >= v37)
          {
LABEL_34:
            swift_release();
            v1 = v0;
            if ((v39 & 1) != 0)
            {
              v34 = 1 << *(_BYTE *)(v7 + 32);
              if (v34 >= 64)
              {
                v35 = OUTLINED_FUNCTION_38_10();
                sub_2472023B8(v35, v36, v38);
              }
              else
              {
                *v38 = -1 << v34;
              }
              *(_QWORD *)(v7 + 16) = 0;
            }
            break;
          }
          v18 = v38[v19];
          if (!v18)
          {
            while (1)
            {
              v14 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v14 >= v37)
                goto LABEL_34;
              v18 = v38[v14];
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          v14 = v19;
        }
      }
LABEL_18:
      v12 = (v18 - 1) & v18;
    }
  }
  swift_release();
  *v1 = v9;
  OUTLINED_FUNCTION_34();
}

void sub_247275014()
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
  char v10;
  char v11;
  __int128 *v12;
  char v13;
  char v14;
  unint64_t v15;
  char v16;
  __int128 *v17;
  _OWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];

  OUTLINED_FUNCTION_12_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767C950);
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_48_4();
  if (v4)
  {
    OUTLINED_FUNCTION_3_13();
    v5 = 0;
    if (!v3)
      goto LABEL_4;
LABEL_3:
    OUTLINED_FUNCTION_39_11();
    while (1)
    {
      v12 = (__int128 *)OUTLINED_FUNCTION_35_9(v6);
      if ((v13 & 1) != 0)
      {
        sub_2471F853C(v12, v23);
      }
      else
      {
        sub_247203640((uint64_t)v12, (uint64_t)v23);
        OUTLINED_FUNCTION_91_0();
      }
      OUTLINED_FUNCTION_73_5();
      OUTLINED_FUNCTION_34_8();
      sub_2472797EC();
      OUTLINED_FUNCTION_11_16();
      if (v14)
      {
        OUTLINED_FUNCTION_6_14();
        while (1)
        {
          OUTLINED_FUNCTION_31_9();
          if (v14)
          {
            if ((v16 & 1) != 0)
              break;
          }
          OUTLINED_FUNCTION_46_8();
          if (!v14)
          {
            OUTLINED_FUNCTION_15_14();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_16_12();
LABEL_28:
      OUTLINED_FUNCTION_10_20(v15);
      sub_2471F853C(v17, v18);
      OUTLINED_FUNCTION_13_14();
      if (v3)
        goto LABEL_3;
LABEL_4:
      v7 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_37;
      if (v7 >= v21)
        goto LABEL_30;
      ++v5;
      if (!*(_QWORD *)(v22 + 8 * v7))
      {
        v5 = v7 + 1;
        if (v7 + 1 >= v21)
          goto LABEL_30;
        if (!*(_QWORD *)(v22 + 8 * v5))
        {
          OUTLINED_FUNCTION_76_5();
          if (v10 == v11)
          {
LABEL_30:
            OUTLINED_FUNCTION_11_2();
            v0 = v20;
            if ((v2 & 1) != 0)
            {
              OUTLINED_FUNCTION_9_17();
              if (v10 != v11)
                OUTLINED_FUNCTION_26_11(v19);
              else
                OUTLINED_FUNCTION_7_19(v19);
              *(_QWORD *)(v1 + 16) = 0;
            }
            break;
          }
          if (!*(_QWORD *)(v22 + 8 * v8))
          {
            while (1)
            {
              v5 = v8 + 1;
              if (__OFADD__(v8, 1))
                goto LABEL_38;
              if (v5 >= v9)
                goto LABEL_30;
              ++v8;
              if (*(_QWORD *)(v22 + 8 * v5))
                goto LABEL_16;
            }
          }
          v5 = v8;
        }
      }
LABEL_16:
      OUTLINED_FUNCTION_50_8();
    }
  }
  OUTLINED_FUNCTION_11_2();
  *v0 = v2;
}

void sub_2472751D4(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v8 = sub_247278C10();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  OUTLINED_FUNCTION_37_4();
  v30 = v2;
  OUTLINED_FUNCTION_58_6();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767D328);
  sub_2472795A0();
  OUTLINED_FUNCTION_48_4();
  if (v12)
  {
    OUTLINED_FUNCTION_40_9();
    v32 = v13;
    OUTLINED_FUNCTION_24_11();
    v31 = v14;
    OUTLINED_FUNCTION_104_4();
    v15 = 0;
    v16 = 16;
    if ((a2 & 1) != 0)
      v16 = 32;
    v33 = v16;
    if (!v6)
      goto LABEL_6;
LABEL_5:
    OUTLINED_FUNCTION_47_9();
    while (1)
    {
      OUTLINED_FUNCTION_41_7(v5, v3[6] + *(_QWORD *)(v9 + 72) * v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + v33));
      v22 = *(_QWORD *)(v3[7] + 8 * v11);
      v11 = *(_QWORD *)(v4 + 40);
      sub_2471FDEF8(&qword_25767D0F0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA73D0], MEMORY[0x24BEA73E0]);
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_23_9();
      if (v23)
        break;
      OUTLINED_FUNCTION_68_6();
LABEL_29:
      v27 = OUTLINED_FUNCTION_17_18();
      OUTLINED_FUNCTION_41_7(v27, v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
      *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v11) = v22;
      OUTLINED_FUNCTION_13_14();
      if (v6)
        goto LABEL_5;
LABEL_6:
      v17 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_42;
      if (v17 >= v31)
      {
        OUTLINED_FUNCTION_11_2();
        v28 = v30;
        if ((a2 & 1) != 0)
        {
LABEL_35:
          OUTLINED_FUNCTION_9_17();
          if (v20 != v21)
            OUTLINED_FUNCTION_26_11(v29);
          else
            OUTLINED_FUNCTION_7_19(v29);
          v3[2] = 0;
        }
LABEL_39:
        OUTLINED_FUNCTION_11_2();
        goto LABEL_40;
      }
      v11 = v32;
      ++v15;
      if (!*(_QWORD *)(v32 + 8 * v17))
      {
        v15 = v17 + 1;
        if (v17 + 1 >= v31)
          goto LABEL_32;
        if (!*(_QWORD *)(v32 + 8 * v15))
        {
          OUTLINED_FUNCTION_76_5();
          if (v20 == v21)
          {
LABEL_32:
            OUTLINED_FUNCTION_11_2();
            v28 = v30;
            if ((a2 & 1) != 0)
              goto LABEL_35;
            goto LABEL_39;
          }
          if (!*(_QWORD *)(v32 + 8 * v18))
          {
            while (1)
            {
              v15 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_43;
              if (v15 >= v19)
                goto LABEL_32;
              ++v18;
              if (*(_QWORD *)(v32 + 8 * v15))
                goto LABEL_18;
            }
          }
          v15 = v18;
        }
      }
LABEL_18:
      OUTLINED_FUNCTION_49_9();
    }
    OUTLINED_FUNCTION_6_14();
    while (1)
    {
      OUTLINED_FUNCTION_31_9();
      if (v23)
      {
        if ((v24 & 1) != 0)
          break;
      }
      if (v25 == v26)
        v25 = 0;
      if (*(_QWORD *)(v4 + 64 + 8 * v25) != -1)
      {
        OUTLINED_FUNCTION_67_9();
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_11_2();
    v28 = v30;
LABEL_40:
    *v28 = v4;
  }
}

void sub_24727543C(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  char v21;
  unint64_t v22;
  char v23;
  _QWORD *v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int64_t v31;
  _QWORD *v32;
  _OWORD v33[2];

  v4 = v2;
  v6 = (_QWORD *)*v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438328);
  sub_2472795A0();
  OUTLINED_FUNCTION_48_4();
  if (v7)
  {
    OUTLINED_FUNCTION_57_6();
    v32 = v6 + 8;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6[8];
    v31 = (unint64_t)(v8 + 63) >> 6;
    OUTLINED_FUNCTION_104_4();
    v11 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(v6[6] + 16 * i);
      v19 = *v17;
      v18 = v17[1];
      v20 = (_OWORD *)(v6[7] + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_247222CA4(v20, v33);
      }
      else
      {
        sub_247203588((uint64_t)v20, (uint64_t)v33);
        OUTLINED_FUNCTION_91_0();
      }
      sub_2472797B0();
      OUTLINED_FUNCTION_34_8();
      sub_2472797EC();
      OUTLINED_FUNCTION_11_16();
      if (v21)
      {
        OUTLINED_FUNCTION_6_14();
        while (1)
        {
          OUTLINED_FUNCTION_31_9();
          if (v21)
          {
            if ((v23 & 1) != 0)
              break;
          }
          OUTLINED_FUNCTION_46_8();
          if (!v21)
          {
            OUTLINED_FUNCTION_15_14();
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_16_12();
LABEL_30:
      *(_QWORD *)(v3 + 64 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      v24 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v22);
      *v24 = v19;
      v24[1] = v18;
      sub_247222CA4(v33, (_OWORD *)(*(_QWORD *)(v3 + 56) + 32 * v22));
      OUTLINED_FUNCTION_13_14();
      if (v10)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_39;
      if (v14 >= v31)
        goto LABEL_32;
      v15 = v32[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v31)
          goto LABEL_32;
        v15 = v32[v11];
        if (!v15)
        {
          v16 = v14 + 2;
          if (v16 >= v31)
          {
LABEL_32:
            OUTLINED_FUNCTION_11_2();
            v4 = v30;
            if ((a2 & 1) != 0)
            {
              OUTLINED_FUNCTION_9_17();
              if (v26 != v27)
              {
                *v32 = -1 << v25;
              }
              else
              {
                v28 = OUTLINED_FUNCTION_38_10();
                sub_2472023B8(v28, v29, v32);
              }
              v6[2] = 0;
            }
            break;
          }
          v15 = v32[v16];
          if (!v15)
          {
            while (1)
            {
              v11 = v16 + 1;
              if (__OFADD__(v16, 1))
                goto LABEL_40;
              if (v11 >= v31)
                goto LABEL_32;
              v15 = v32[v11];
              ++v16;
              if (v15)
                goto LABEL_18;
            }
          }
          v11 = v16;
        }
      }
LABEL_18:
      v10 = (v15 - 1) & v15;
    }
  }
  OUTLINED_FUNCTION_11_2();
  *v4 = v3;
}

unint64_t sub_2472756A8()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unsigned int *v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  OUTLINED_FUNCTION_12_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBD0);
  v3 = (_QWORD *)OUTLINED_FUNCTION_19_12();
  if (*(_QWORD *)(v1 + 16))
  {
    OUTLINED_FUNCTION_57_6();
    v5 = (_QWORD *)(v1 + 64);
    v6 = -1;
    if (v4 < 64)
      v6 = ~(-1 << v4);
    v7 = v6 & *(_QWORD *)(v1 + 64);
    v8 = (unint64_t)(v4 + 63) >> 6;
    result = OUTLINED_FUNCTION_104_4();
    v10 = 0;
    if (!v7)
      goto LABEL_6;
LABEL_5:
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      v16 = (unsigned int *)(*(_QWORD *)(v1 + 48) + 8 * i);
      v17 = *v16;
      v18 = *((_BYTE *)v16 + 4);
      v19 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * i);
      if ((v2 & 1) == 0)
        sub_24727912C();
      result = sub_24727481C(v17 | ((unint64_t)v18 << 32), v19, v3);
      if (v7)
        goto LABEL_5;
LABEL_6:
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_29:
        __break(1u);
        return result;
      }
      if (v13 >= v8)
        goto LABEL_22;
      v14 = v5[v13];
      ++v10;
      if (!v14)
      {
        v10 = v13 + 1;
        if (v13 + 1 >= v8)
          goto LABEL_22;
        v14 = v5[v10];
        if (!v14)
        {
          v15 = v13 + 2;
          if (v15 >= v8)
          {
LABEL_22:
            OUTLINED_FUNCTION_11_2();
            v0 = v23;
            if ((v2 & 1) != 0)
            {
              v20 = 1 << *(_BYTE *)(v1 + 32);
              if (v20 > 63)
              {
                v21 = OUTLINED_FUNCTION_38_10();
                sub_2472023B8(v21, v22, (_QWORD *)(v1 + 64));
              }
              else
              {
                *v5 = -1 << v20;
              }
              *(_QWORD *)(v1 + 16) = 0;
            }
            break;
          }
          v14 = v5[v15];
          if (!v14)
          {
            while (1)
            {
              v10 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_29;
              if (v10 >= v8)
                goto LABEL_22;
              v14 = v5[v10];
              ++v15;
              if (v14)
                goto LABEL_17;
            }
          }
          v10 = v15;
        }
      }
LABEL_17:
      v7 = (v14 - 1) & v14;
    }
  }
  result = OUTLINED_FUNCTION_11_2();
  *v0 = v3;
  return result;
}

void sub_24727586C()
{
  _QWORD *v0;
  _QWORD *v1;
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
  uint64_t v17;
  char v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_53();
  v6 = v5;
  v34 = *(_QWORD *)(sub_247278ACC() - 8);
  OUTLINED_FUNCTION_22_5();
  MEMORY[0x24BDAC7A8](v7, v8);
  OUTLINED_FUNCTION_37_4();
  v30 = v0;
  OUTLINED_FUNCTION_58_6();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438860);
  sub_2472795A0();
  OUTLINED_FUNCTION_48_4();
  if (v10)
  {
    OUTLINED_FUNCTION_40_9();
    v32 = v11;
    OUTLINED_FUNCTION_24_11();
    v31 = v12;
    OUTLINED_FUNCTION_104_4();
    v13 = 0;
    v29 = v6;
    v14 = 16;
    if ((v6 & 1) != 0)
      v14 = 32;
    v33 = v14;
    if (!v4)
      goto LABEL_6;
LABEL_5:
    OUTLINED_FUNCTION_47_9();
    while (1)
    {
      OUTLINED_FUNCTION_41_7(v3, v1[6] + *(_QWORD *)(v34 + 72) * v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + v33));
      v20 = v1;
      v21 = *(_QWORD *)(v1[7] + 8 * v9);
      v9 = *(_QWORD *)(v2 + 40);
      sub_2471FDEF8(&qword_254438618, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7158], MEMORY[0x24BEA7170]);
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_23_9();
      if (v22)
        break;
      OUTLINED_FUNCTION_68_6();
LABEL_29:
      v26 = OUTLINED_FUNCTION_17_18();
      OUTLINED_FUNCTION_41_7(v26, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 32));
      *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v9) = v21;
      OUTLINED_FUNCTION_13_14();
      v1 = v20;
      if (v4)
        goto LABEL_5;
LABEL_6:
      v15 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_42;
      if (v15 >= v31)
      {
        OUTLINED_FUNCTION_11_2();
        v27 = v30;
        if ((v29 & 1) != 0)
        {
LABEL_35:
          OUTLINED_FUNCTION_9_17();
          if (v18 != v19)
            OUTLINED_FUNCTION_26_11(v28);
          else
            OUTLINED_FUNCTION_7_19(v28);
          v1[2] = 0;
        }
LABEL_39:
        OUTLINED_FUNCTION_11_2();
        goto LABEL_40;
      }
      v9 = v32;
      ++v13;
      if (!*(_QWORD *)(v32 + 8 * v15))
      {
        v13 = v15 + 1;
        if (v15 + 1 >= v31)
          goto LABEL_32;
        if (!*(_QWORD *)(v32 + 8 * v13))
        {
          OUTLINED_FUNCTION_76_5();
          if (v18 == v19)
          {
LABEL_32:
            OUTLINED_FUNCTION_11_2();
            v27 = v30;
            if ((v29 & 1) != 0)
              goto LABEL_35;
            goto LABEL_39;
          }
          if (!*(_QWORD *)(v32 + 8 * v16))
          {
            while (1)
            {
              v13 = v16 + 1;
              if (__OFADD__(v16, 1))
                goto LABEL_43;
              if (v13 >= v17)
                goto LABEL_32;
              ++v16;
              if (*(_QWORD *)(v32 + 8 * v13))
                goto LABEL_18;
            }
          }
          v13 = v16;
        }
      }
LABEL_18:
      OUTLINED_FUNCTION_49_9();
    }
    OUTLINED_FUNCTION_6_14();
    while (1)
    {
      OUTLINED_FUNCTION_31_9();
      if (v22)
      {
        if ((v23 & 1) != 0)
          break;
      }
      if (v24 == v25)
        v24 = 0;
      if (*(_QWORD *)(v2 + 64 + 8 * v24) != -1)
      {
        OUTLINED_FUNCTION_67_9();
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_11_2();
    v27 = v30;
LABEL_40:
    *v27 = v2;
    OUTLINED_FUNCTION_34();
  }
}

void sub_247275AC0()
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
  char v10;
  char v11;
  __int128 *v12;
  char v13;
  char v14;
  unint64_t v15;
  char v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[40];

  OUTLINED_FUNCTION_12_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767C948);
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_48_4();
  if (v4)
  {
    OUTLINED_FUNCTION_3_13();
    v5 = 0;
    if (!v3)
      goto LABEL_4;
LABEL_3:
    OUTLINED_FUNCTION_39_11();
    while (1)
    {
      v12 = (__int128 *)OUTLINED_FUNCTION_35_9(v6);
      if ((v13 & 1) != 0)
      {
        sub_2471F6814(v12, (uint64_t)v23);
      }
      else
      {
        sub_2471FD550((uint64_t)v12, (uint64_t)v23);
        OUTLINED_FUNCTION_91_0();
      }
      OUTLINED_FUNCTION_73_5();
      OUTLINED_FUNCTION_34_8();
      sub_2472797EC();
      OUTLINED_FUNCTION_11_16();
      if (v14)
      {
        OUTLINED_FUNCTION_6_14();
        while (1)
        {
          OUTLINED_FUNCTION_31_9();
          if (v14)
          {
            if ((v16 & 1) != 0)
              break;
          }
          OUTLINED_FUNCTION_46_8();
          if (!v14)
          {
            OUTLINED_FUNCTION_15_14();
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_16_12();
LABEL_28:
      OUTLINED_FUNCTION_10_20(v15);
      sub_2471F6814(v17, v18);
      OUTLINED_FUNCTION_13_14();
      if (v3)
        goto LABEL_3;
LABEL_4:
      v7 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_37;
      if (v7 >= v21)
        goto LABEL_30;
      ++v5;
      if (!*(_QWORD *)(v22 + 8 * v7))
      {
        v5 = v7 + 1;
        if (v7 + 1 >= v21)
          goto LABEL_30;
        if (!*(_QWORD *)(v22 + 8 * v5))
        {
          OUTLINED_FUNCTION_76_5();
          if (v10 == v11)
          {
LABEL_30:
            OUTLINED_FUNCTION_11_2();
            v0 = v20;
            if ((v2 & 1) != 0)
            {
              OUTLINED_FUNCTION_9_17();
              if (v10 != v11)
                OUTLINED_FUNCTION_26_11(v19);
              else
                OUTLINED_FUNCTION_7_19(v19);
              *(_QWORD *)(v1 + 16) = 0;
            }
            break;
          }
          if (!*(_QWORD *)(v22 + 8 * v8))
          {
            while (1)
            {
              v5 = v8 + 1;
              if (__OFADD__(v8, 1))
                goto LABEL_38;
              if (v5 >= v9)
                goto LABEL_30;
              ++v8;
              if (*(_QWORD *)(v22 + 8 * v5))
                goto LABEL_16;
            }
          }
          v5 = v8;
        }
      }
LABEL_16:
      OUTLINED_FUNCTION_50_8();
    }
  }
  OUTLINED_FUNCTION_11_2();
  *v0 = v2;
}

uint64_t sub_247275C80(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  unint64_t i;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;

  v3 = v2;
  v5 = sub_247278940();
  v44 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v45 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBC0);
  v43 = a2;
  v9 = sub_2472795A0();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_40;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v42 = v5;
  v18 = v44;
  if (!v14)
    goto LABEL_7;
LABEL_6:
  v19 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v19 | (v17 << 6); ; i = __clz(__rbit64(v23)) + (v17 << 6))
  {
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v8;
    v27 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * i);
    v28 = *(_QWORD *)(v18 + 72);
    v29 = v25 + v28 * i;
    if ((v43 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v45, v29, v5);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v45, v29, v5);
      swift_retain();
    }
    v46 = v27;
    sub_247278DD8();
    sub_2471FDEF8(&qword_25767D0E0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA7750], MEMORY[0x24BEA7760]);
    result = sub_247279168();
    v30 = -1 << *(_BYTE *)(v10 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) == 0)
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      v5 = v42;
      v18 = v44;
      while (++v32 != v35 || (v34 & 1) == 0)
      {
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v32);
        if (v37 != -1)
        {
          v33 = __clz(__rbit64(~v37)) + (v32 << 6);
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
    v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    v5 = v42;
    v18 = v44;
LABEL_31:
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v33) = v27;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(*(_QWORD *)(v10 + 56) + v28 * v33, v45, v5);
    ++*(_QWORD *)(v10 + 16);
    v8 = v26;
    if (v14)
      goto LABEL_6;
LABEL_7:
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_42;
    if (v21 >= v40)
    {
      swift_release();
      v3 = v39;
      v22 = v41;
      goto LABEL_35;
    }
    v22 = v41;
    v23 = v41[v21];
    ++v17;
    if (!v23)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v40)
        goto LABEL_33;
      v23 = v41[v17];
      if (!v23)
        break;
    }
LABEL_18:
    v14 = (v23 - 1) & v23;
  }
  v24 = v21 + 2;
  if (v24 < v40)
  {
    v23 = v41[v24];
    if (!v23)
    {
      while (1)
      {
        v17 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v17 >= v40)
          goto LABEL_33;
        v23 = v41[v17];
        ++v24;
        if (v23)
          goto LABEL_18;
      }
    }
    v17 = v24;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  v3 = v39;
LABEL_35:
  if ((v43 & 1) != 0)
  {
    v38 = 1 << *(_BYTE *)(v8 + 32);
    if (v38 >= 64)
      sub_2472023B8(0, (unint64_t)(v38 + 63) >> 6, v22);
    else
      *v22 = -1 << v38;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_40:
  result = swift_release();
  *v3 = v10;
  return result;
}

_OWORD *sub_247276030()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  __int128 *v8;
  _OWORD *v9;
  _OWORD *result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  _QWORD *v15;

  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_1_12();
  if (v3)
  {
    __break(1u);
LABEL_10:
    result = (_OWORD *)sub_247279768();
    __break(1u);
    return result;
  }
  v4 = v1;
  v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767D100);
  if ((OUTLINED_FUNCTION_8_16() & 1) != 0)
  {
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_25_12();
    if (!v7)
      goto LABEL_10;
    v4 = v6;
  }
  if ((v5 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_2Tm(*(_QWORD *)(*(_QWORD *)v0 + 56) + 48 * v4);
    OUTLINED_FUNCTION_37_0();
    return sub_2471F853C(v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_37_10();
    sub_2472767CC(v11, v12, v13, v14, v15);
    return (_OWORD *)OUTLINED_FUNCTION_0_18();
  }
}

void sub_2472760E4(uint64_t a1, char a2)
{
  uint64_t v2;
  char v4;
  unint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = a2 & 1;
  sub_247201628(a2 & 1);
  OUTLINED_FUNCTION_1_12();
  if (v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v5;
  v9 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBD8);
  if ((sub_24727951C() & 1) == 0)
    goto LABEL_5;
  v10 = sub_247201628(v4);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    sub_247279768();
    __break(1u);
    return;
  }
  v8 = v10;
LABEL_5:
  if ((v9 & 1) != 0)
  {
    v12 = *(_QWORD *)(*(_QWORD *)v2 + 56);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v12 + 8 * v8) = a1;
    OUTLINED_FUNCTION_37_0();
  }
  else
  {
    OUTLINED_FUNCTION_37_0();
    sub_247276838(v13, v14, v15, v16);
  }
}

void sub_2472761CC()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_53();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  sub_247201674(v3, v1, v7 & 1);
  OUTLINED_FUNCTION_1_12();
  if (v11)
  {
    __break(1u);
    goto LABEL_9;
  }
  v12 = v9;
  v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBE0);
  if ((OUTLINED_FUNCTION_32_5() & 1) == 0)
    goto LABEL_5;
  v14 = sub_247201674(v4, v2, v8);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    sub_247279768();
    __break(1u);
    return;
  }
  v12 = v14;
LABEL_5:
  v16 = *v0;
  if ((v13 & 1) != 0)
  {
    v17 = v16[7];
    swift_release();
    *(_QWORD *)(v17 + 8 * v12) = v6;
    OUTLINED_FUNCTION_34();
  }
  else
  {
    sub_247276880(v12, v4, v2, v8, v6, v16);
    OUTLINED_FUNCTION_24();
  }
}

uint64_t sub_2472762CC()
{
  char v0;
  char v1;
  char v2;
  char v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t result;

  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_1_12();
  if (v1)
  {
    __break(1u);
LABEL_9:
    result = sub_247279768();
    __break(1u);
    return result;
  }
  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544386A0);
  if ((OUTLINED_FUNCTION_8_16() & 1) != 0)
  {
    OUTLINED_FUNCTION_20_14();
    OUTLINED_FUNCTION_25_12();
    if (!v3)
      goto LABEL_9;
  }
  if ((v2 & 1) != 0)
  {
    sub_2472785D4();
    OUTLINED_FUNCTION_37_0();
    __asm { BR              X3 }
  }
  OUTLINED_FUNCTION_37_10();
  sub_2472768D4(v5, v6, v7, v8, v9);
  return OUTLINED_FUNCTION_0_18();
}

_QWORD *sub_247276388(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD **v3;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *result;

  sub_2472015E8();
  OUTLINED_FUNCTION_1_12();
  if (v9)
  {
    __break(1u);
LABEL_10:
    result = (_QWORD *)sub_247279768();
    __break(1u);
    return result;
  }
  v10 = v7;
  v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438318);
  if ((OUTLINED_FUNCTION_8_16() & 1) != 0)
  {
    sub_2472015E8();
    OUTLINED_FUNCTION_25_12();
    if (!v13)
      goto LABEL_10;
    v10 = v12;
  }
  if ((v11 & 1) != 0)
  {
    OUTLINED_FUNCTION_37_0();
    return sub_247276EEC(v14, v15);
  }
  else
  {
    sub_247276964(v10, a2, a3, a1, *v3);
    return (_QWORD *)OUTLINED_FUNCTION_0_18();
  }
}

void sub_247276464()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t *v17;

  OUTLINED_FUNCTION_53();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  sub_2472015E8();
  OUTLINED_FUNCTION_1_12();
  if (v11)
  {
    __break(1u);
LABEL_10:
    sub_247279768();
    __break(1u);
    return;
  }
  v12 = v9;
  v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254438F50);
  if ((OUTLINED_FUNCTION_32_5() & 1) != 0)
  {
    sub_2472015E8();
    OUTLINED_FUNCTION_25_12();
    if (!v15)
      goto LABEL_10;
    v12 = v14;
  }
  v16 = *v0;
  if ((v13 & 1) != 0)
  {
    v17 = (uint64_t *)(v16[7] + 16 * v12);
    swift_release();
    *v17 = v8;
    v17[1] = v6;
    OUTLINED_FUNCTION_34();
  }
  else
  {
    sub_2472769D4(v12, v4, v2, v8, v6, v16);
    sub_24727912C();
  }
}

_OWORD *sub_247276550()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  char v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  char v7;
  _OWORD *v8;
  _OWORD *v9;
  _OWORD *result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _QWORD *v15;

  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_1_12();
  if (v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = v1;
  v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767D6A0);
  if ((OUTLINED_FUNCTION_8_16() & 1) == 0)
    goto LABEL_5;
  v6 = OUTLINED_FUNCTION_20_14();
  if ((v5 & 1) != (v7 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_247279768();
    __break(1u);
    return result;
  }
  v4 = v6;
LABEL_5:
  if ((v5 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_2Tm(*(_QWORD *)(*(_QWORD *)v0 + 56) + 32 * v4);
    OUTLINED_FUNCTION_37_0();
    return sub_247222CA4(v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_37_10();
    sub_247276A20(v11, v12, v13, v14, v15);
    return (_OWORD *)OUTLINED_FUNCTION_0_18();
  }
}

uint64_t sub_247276608(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_247201900(a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBA8);
  if ((sub_24727951C() & 1) == 0)
    goto LABEL_5;
  v15 = sub_247201900(a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_247279768();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    v19 = sub_247278A54();
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v13, a1, v19);
  }
  else
  {
    sub_247276A88(v13, a2, a3, a1, v17, a4);
    swift_retain();
    return swift_retain();
  }
}

unint64_t sub_247276750()
{
  unint64_t result;

  result = qword_2544385B0;
  if (!qword_2544385B0)
  {
    result = MEMORY[0x249575B14](&unk_247281490, &type metadata for SignalledOwner.SignalKey);
    atomic_store(result, (unint64_t *)&qword_2544385B0);
  }
  return result;
}

uint64_t sub_24727678C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254438D10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_2472767CC(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
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
  result = sub_2471F853C(a4, (_OWORD *)(a5[7] + 48 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_247276838(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2 & 1;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t sub_247276880(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = a6[6] + 24 * result;
  *(_QWORD *)v6 = a2;
  *(_QWORD *)(v6 + 8) = a3;
  *(_BYTE *)(v6 + 16) = a4 & 1;
  *(_QWORD *)(a6[7] + 8 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

uint64_t sub_2472768D4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_2472785D4();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_247276964(unint64_t a1, uint64_t a2, uint64_t a3, void *__src, _QWORD *a5)
{
  _QWORD *v6;
  void *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = memcpy((void *)(a5[7] + 112 * a1), __src, 0x70uLL);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_2472769D4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

_OWORD *sub_247276A20(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_247222CA4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_247276A88(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, double a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v9 = a5[6] + 24 * a1;
  *(_QWORD *)v9 = a2;
  *(_QWORD *)(v9 + 8) = a3;
  *(double *)(v9 + 16) = a6;
  v10 = a5[7];
  v11 = sub_247278A54();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a4, v11);
  v13 = a5[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a5[2] = v15;
  return result;
}

void sub_247276B20(uint64_t a1, uint64_t a2)
{
  sub_2471FDEF8(&qword_254438C70, a2, (uint64_t (*)(uint64_t))type metadata accessor for SignalledOwner, (uint64_t)&protocol conformance descriptor for SignalledOwner);
}

uint64_t type metadata accessor for SignalledOwner()
{
  return objc_opt_self();
}

void sub_247276B6C(uint64_t a1, uint64_t a2)
{
  sub_2471FDEF8(&qword_254438C88, a2, (uint64_t (*)(uint64_t))type metadata accessor for SignalledOwner, (uint64_t)&protocol conformance descriptor for SignalledOwner);
}

void sub_247276B98(uint64_t a1, uint64_t a2)
{
  sub_2471FDEF8(&qword_254438C80, a2, (uint64_t (*)(uint64_t))type metadata accessor for SignalledOwner, (uint64_t)&protocol conformance descriptor for SignalledOwner);
}

void sub_247276BC4(uint64_t a1, uint64_t a2)
{
  sub_2471FDEF8(&qword_254438C78, a2, (uint64_t (*)(uint64_t))type metadata accessor for SignalledOwner, (uint64_t)&protocol conformance descriptor for SignalledOwner);
}

uint64_t method lookup function for SignalledOwner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SignalledOwner.__allocating_init(rootOwner:matchedSignals:isConversationalContinuer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t destroy for SignalledOwner.SignalKey()
{
  swift_release();
  return swift_release();
}

void _s18SiriSuggestionsAPI14SignalledOwnerC9SignalKeyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_30();
}

_QWORD *assignWithCopy for SignalledOwner.SignalKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for SignalledOwner.SignalKey(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for SignalledOwner.SignalKey()
{
  return &type metadata for SignalledOwner.SignalKey;
}

uint64_t storeEnumTagSinglePayload for SignalledOwner.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247276D6C + 4 * byte_247281215[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247276DA0 + 4 * asc_247281210[v4]))();
}

uint64_t sub_247276DA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247276DA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247276DB0);
  return result;
}

uint64_t sub_247276DBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247276DC4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247276DC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247276DD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignalledOwner.CodingKeys()
{
  return &type metadata for SignalledOwner.CodingKeys;
}

unint64_t sub_247276DF0()
{
  unint64_t result;

  result = qword_25767EBB0;
  if (!qword_25767EBB0)
  {
    result = MEMORY[0x249575B14](&unk_247281440, &type metadata for SignalledOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25767EBB0);
  }
  return result;
}

unint64_t sub_247276E30()
{
  unint64_t result;

  result = qword_2544385B8;
  if (!qword_2544385B8)
  {
    result = MEMORY[0x249575B14](&unk_247281468, &type metadata for SignalledOwner.SignalKey);
    atomic_store(result, (unint64_t *)&qword_2544385B8);
  }
  return result;
}

unint64_t sub_247276E70()
{
  unint64_t result;

  result = qword_254438C68;
  if (!qword_254438C68)
  {
    result = MEMORY[0x249575B14](&unk_2472813B0, &type metadata for SignalledOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254438C68);
  }
  return result;
}

unint64_t sub_247276EB0()
{
  unint64_t result;

  result = qword_254438C60;
  if (!qword_254438C60)
  {
    result = MEMORY[0x249575B14](&unk_2472813D8, &type metadata for SignalledOwner.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254438C60);
  }
  return result;
}

_QWORD *sub_247276EEC(_QWORD *a1, _QWORD *a2)
{
  sub_24722540C(a2, a1);
  return a2;
}

uint64_t sub_247276F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767D168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247276F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767D168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  return sub_24727912C();
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_4_15()
{
  return sub_2472015E8();
}

uint64_t OUTLINED_FUNCTION_7_19@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_2472023B8(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  return sub_24727951C();
}

void OUTLINED_FUNCTION_10_20(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  v5 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * a1);
  *v5 = v3;
  v5[1] = v2;
}

void OUTLINED_FUNCTION_13_14()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_14_14(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_17_18()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + ((v1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v1;
  return *(_QWORD *)(v2 + 48) + v3 * v1;
}

uint64_t OUTLINED_FUNCTION_18_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 168))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_19_12()
{
  return sub_2472795A0();
}

unint64_t OUTLINED_FUNCTION_20_14()
{
  return sub_2472015E8();
}

unint64_t OUTLINED_FUNCTION_22_11()
{
  double v0;

  return sub_247201900(v0);
}

void OUTLINED_FUNCTION_26_11(char a1@<W8>)
{
  _QWORD *v1;

  *v1 = -1 << a1;
}

void OUTLINED_FUNCTION_27_12()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_30_10()
{
  return sub_247279174();
}

uint64_t OUTLINED_FUNCTION_32_5()
{
  return sub_24727951C();
}

uint64_t OUTLINED_FUNCTION_33_8()
{
  return sub_247279168();
}

uint64_t OUTLINED_FUNCTION_34_8()
{
  return sub_247279204();
}

uint64_t OUTLINED_FUNCTION_35_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return *(_QWORD *)(v1 + 56) + a1 * v2;
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_38_10()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_41_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_42_12@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 208), *(_QWORD *)(v2 - 232));
}

uint64_t OUTLINED_FUNCTION_53_6()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_2Tm(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_54_9(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_64_9()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_65_8()
{
  return sub_247278A30();
}

uint64_t OUTLINED_FUNCTION_66_5()
{
  return sub_247278A3C();
}

uint64_t OUTLINED_FUNCTION_70_8()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_72_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_73_5()
{
  return sub_2472797B0();
}

uint64_t OUTLINED_FUNCTION_74_6()
{
  return sub_24727891C();
}

uint64_t OUTLINED_FUNCTION_75_6()
{
  return swift_retain();
}

SiriSuggestionsAPI::CatGlobalsHolder __swiftcall CatGlobalsHolder.init(properties:deviceName:)(Swift::OpaquePointer properties, Swift::String_optional deviceName)
{
  _QWORD *v2;
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SiriSuggestionsAPI::CatGlobalsHolder result;

  object = deviceName.value._object;
  countAndFlagsBits = deviceName.value._countAndFlagsBits;
  v5 = v2;
  sub_2471F50E8((uint64_t)properties._rawValue);
  v7 = v6;
  v8 = (void *)swift_bridgeObjectRelease();
  *v5 = v7;
  v5[1] = countAndFlagsBits;
  v5[2] = object;
  result.deviceName.value._object = v10;
  result.deviceName.value._countAndFlagsBits = v9;
  result.properties._rawValue = v8;
  return result;
}

uint64_t CatGlobalsHolder.properties.getter()
{
  return sub_24727912C();
}

uint64_t CatGlobalsHolder.deviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_24727912C();
  return v1;
}

void CatGlobalsHolder.init(from:)(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBE8);
  MEMORY[0x24BDAC7A8](v4, v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24727762C();
  sub_247279804();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254437D98);
    LOBYTE(v12) = 0;
    OUTLINED_FUNCTION_5_16();
    v6 = sub_247278A84();
    OUTLINED_FUNCTION_5_16();
    sub_247278A6C();
    sub_2471F5318(v6);
    v8 = v7;
    OUTLINED_FUNCTION_18_0();
    sub_2471F50E8(v8);
    v10 = v9;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_19();
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v13;
  }
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)a1);
  OUTLINED_FUNCTION_89();
}

unint64_t sub_24727762C()
{
  unint64_t result;

  result = qword_25767EBF0;
  if (!qword_25767EBF0)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for CatGlobalsHolder.CatPropertyKeys, &type metadata for CatGlobalsHolder.CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_25767EBF0);
  }
  return result;
}

void CatGlobalsHolder.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767EBF8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = *(_QWORD *)v1;
  v6 = *(_OWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24727762C();
  sub_24727981C();
  LOBYTE(v8) = 0;
  sub_2471F5318(v5);
  sub_247278A90();
  if (v7)
  {
    OUTLINED_FUNCTION_3_14();
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    OUTLINED_FUNCTION_18_0();
    v11 = 1;
    if (*((_QWORD *)&v6 + 1))
    {
      *((_QWORD *)&v9 + 1) = MEMORY[0x24BEE0D00];
      v10 = MEMORY[0x24BEE0D08];
      v8 = v6;
    }
    else
    {
      v10 = 0;
      v8 = 0u;
      v9 = 0u;
    }
    sub_24727912C();
    sub_247278A78();
    OUTLINED_FUNCTION_3_14();
    sub_2472777DC((uint64_t)&v8);
  }
  OUTLINED_FUNCTION_89();
}

uint64_t sub_2472777DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_254438DF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static CatGlobalsHolder.CatPropertyKeys.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CatGlobalsHolder.CatPropertyKeys.hash(into:)()
{
  return sub_2472797BC();
}

SiriSuggestionsAPI::CatGlobalsHolder::CatPropertyKeys_optional __swiftcall CatGlobalsHolder.CatPropertyKeys.init(stringValue:)(Swift::String stringValue)
{
  char *v1;
  void *object;
  char *v3;
  BOOL v4;
  uint64_t countAndFlagsBits;
  SiriSuggestionsAPI::CatGlobalsHolder::CatPropertyKeys_optional result;
  char v7;
  char v9;

  object = stringValue._object;
  v3 = v1;
  v4 = stringValue._countAndFlagsBits == 0x69747265706F7270 && stringValue._object == (void *)0xEA00000000007365;
  if (v4 || (countAndFlagsBits = stringValue._countAndFlagsBits, (OUTLINED_FUNCTION_4_16() & 1) != 0))
  {
    result.value = OUTLINED_FUNCTION_9_0();
    v7 = 0;
  }
  else if (countAndFlagsBits == 0x614E656369766564 && object == (void *)0xEA0000000000656DLL)
  {
    result.value = OUTLINED_FUNCTION_9_0();
    v7 = 1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_4_16();
    result.value = OUTLINED_FUNCTION_9_0();
    if ((v9 & 1) != 0)
      v7 = 1;
    else
      v7 = 2;
  }
  *v3 = v7;
  return result;
}

SiriSuggestionsAPI::CatGlobalsHolder::CatPropertyKeys_optional __swiftcall CatGlobalsHolder.CatPropertyKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 2;
  return (SiriSuggestionsAPI::CatGlobalsHolder::CatPropertyKeys_optional)intValue;
}

uint64_t CatGlobalsHolder.CatPropertyKeys.hashValue.getter()
{
  sub_2472797B0();
  sub_2472797BC();
  return sub_2472797EC();
}

uint64_t CatGlobalsHolder.CatPropertyKeys.intValue.getter()
{
  return 0;
}

uint64_t CatGlobalsHolder.CatPropertyKeys.stringValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x614E656369766564;
  else
    return 0x69747265706F7270;
}

unint64_t sub_2472779DC()
{
  unint64_t result;

  result = qword_25767EC00;
  if (!qword_25767EC00)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for CatGlobalsHolder.CatPropertyKeys, &type metadata for CatGlobalsHolder.CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_25767EC00);
  }
  return result;
}

unint64_t sub_247277A1C()
{
  unint64_t result;

  result = qword_25767EC08;
  if (!qword_25767EC08)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for CatGlobalsHolder.CatPropertyKeys, &type metadata for CatGlobalsHolder.CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_25767EC08);
  }
  return result;
}

unint64_t sub_247277A5C()
{
  unint64_t result;

  result = qword_25767EC10;
  if (!qword_25767EC10)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for CatGlobalsHolder.CatPropertyKeys, &type metadata for CatGlobalsHolder.CatPropertyKeys);
    atomic_store(result, (unint64_t *)&qword_25767EC10);
  }
  return result;
}

uint64_t sub_247277AA4()
{
  sub_24727762C();
  return sub_247279834();
}

uint64_t sub_247277ACC()
{
  sub_24727762C();
  return sub_247279840();
}

void sub_247277AF4(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  CatGlobalsHolder.init(from:)(a1, a2);
}

void sub_247277B08(_QWORD *a1)
{
  CatGlobalsHolder.encode(to:)(a1);
}

uint64_t destroy for CatGlobalsHolder()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18SiriSuggestionsAPI16CatGlobalsHolderVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_24727912C();
  sub_24727912C();
  return a1;
}

_QWORD *assignWithCopy for CatGlobalsHolder(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_24727912C();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  sub_24727912C();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for CatGlobalsHolder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CatGlobalsHolder()
{
  return &type metadata for CatGlobalsHolder;
}

uint64_t storeEnumTagSinglePayload for CatGlobalsHolder.CatPropertyKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247277C88 + 4 * byte_247281525[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247277CBC + 4 * byte_247281520[v4]))();
}

uint64_t sub_247277CBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247277CC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247277CCCLL);
  return result;
}

uint64_t sub_247277CD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247277CE0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247277CE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247277CEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CatGlobalsHolder.CatPropertyKeys()
{
  return &type metadata for CatGlobalsHolder.CatPropertyKeys;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_16()
{
  return sub_24727972C();
}

uint64_t sub_247277D4C(uint64_t a1)
{
  return sub_247277E80(a1, qword_25443A330);
}

uint64_t static Logger.clientCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247277DC0(&qword_25443A1C8, (uint64_t)qword_25443A330, a1);
}

uint64_t sub_247277D84(uint64_t a1)
{
  return sub_247277E80(a1, qword_254439B80);
}

uint64_t static Logger.runtimeCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247277DC0(&qword_254439B98, (uint64_t)qword_254439B80, a1);
}

uint64_t sub_247277DC0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_247279048();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_247277E28(uint64_t a1)
{
  return sub_247277E80(a1, qword_254438FC0);
}

uint64_t static Logger.dispatcherCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247277DC0(&qword_254438F88, (uint64_t)qword_254438FC0, a1);
}

uint64_t sub_247277E68(uint64_t a1)
{
  return sub_247277E80(a1, qword_254438658);
}

uint64_t sub_247277E80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_247279048();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_247278D9C();
  return sub_24727903C();
}

uint64_t static Logger.daoCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247277DC0(qword_254437AD8, (uint64_t)qword_254438658, a1);
}

void static SiriSuggestionsSignpost.facadeInApp.getter()
{
  OUTLINED_FUNCTION_0_20();
}

void static SiriSuggestionsSignpost.facadeSiriHints.getter()
{
  OUTLINED_FUNCTION_0_20();
}

void static SiriSuggestionsSignpost.xpcSubmission.getter()
{
  OUTLINED_FUNCTION_0_20();
}

void static SiriSuggestionsSignpost.localStorePropertiesXPCSubmission.getter()
{
  OUTLINED_FUNCTION_0_20();
}

uint64_t sub_247277F48()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 144));
  return sub_247279708();
}

uint64_t sub_247277F80()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return sub_247279708();
}

uint64_t SiriSuggestionsXPCBridge.delegate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2471FA5EC(v1, a1);
}

double SiriSuggestionsXPCBridge.init()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double result;

  v2 = type metadata accessor for SiriSuggestionsXPCClient();
  SiriSuggestionsXPCClient.__allocating_init()();
  if (v3)
  {
    v4 = v3;
    v5 = sub_24727801C();
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 24) = v2;
    *(_QWORD *)(a1 + 32) = v5;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

unint64_t sub_24727801C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254439578;
  if (!qword_254439578)
  {
    v1 = type metadata accessor for SiriSuggestionsXPCClient();
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SiriSuggestionsXPCClient, v1);
    atomic_store(result, (unint64_t *)&qword_254439578);
  }
  return result;
}

unint64_t sub_247278060(uint64_t a1)
{
  unint64_t result;

  result = sub_247278084();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247278084()
{
  unint64_t result;

  result = qword_25767EC18;
  if (!qword_25767EC18)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SiriSuggestionsXPCBridge, &type metadata for SiriSuggestionsXPCBridge);
    atomic_store(result, (unint64_t *)&qword_25767EC18);
  }
  return result;
}

unint64_t sub_2472780C0(uint64_t a1)
{
  unint64_t result;

  result = sub_2472780E4();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

unint64_t sub_2472780E4()
{
  unint64_t result;

  result = qword_25767EC20;
  if (!qword_25767EC20)
  {
    result = MEMORY[0x249575B14](&protocol conformance descriptor for SiriSuggestionsXPCBridge, &type metadata for SiriSuggestionsXPCBridge);
    atomic_store(result, (unint64_t *)&qword_25767EC20);
  }
  return result;
}

uint64_t initializeWithCopy for SiriSuggestionsXPCBridge(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for SiriSuggestionsXPCBridge(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t assignWithTake for SiriSuggestionsXPCBridge(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_2Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

ValueMetadata *type metadata accessor for SiriSuggestionsXPCBridge()
{
  return &type metadata for SiriSuggestionsXPCBridge;
}

uint64_t sub_2472781CC()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_2472781D8()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2472781E4()
{
  return MEMORY[0x24BDCCA18]();
}

uint64_t sub_2472781F0()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2472781FC()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_247278208()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_247278214()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_247278220()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_24727822C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_247278238()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_247278244()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_247278250()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_24727825C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_247278268()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_247278274()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_247278280()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24727828C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_247278298()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2472782A4()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_2472782B0()
{
  return MEMORY[0x24BDCDC90]();
}

uint64_t sub_2472782BC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2472782C8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2472782D4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2472782E0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2472782EC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2472782F8()
{
  return MEMORY[0x24BDCE9C0]();
}

uint64_t sub_247278304()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_247278310()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_24727831C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_247278328()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_247278334()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247278340()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_24727834C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_247278358()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_247278364()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_247278370()
{
  return MEMORY[0x24BEAA5E0]();
}

uint64_t sub_24727837C()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_247278388()
{
  return MEMORY[0x24BE97548]();
}

uint64_t sub_247278394()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2472783A0()
{
  return MEMORY[0x24BE975A0]();
}

uint64_t sub_2472783AC()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_2472783B8()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_2472783C4()
{
  return MEMORY[0x24BE975E0]();
}

uint64_t sub_2472783D0()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_2472783DC()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_2472783E8()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_2472783F4()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_247278400()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_24727840C()
{
  return MEMORY[0x24BE98638]();
}

uint64_t sub_247278418()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_247278424()
{
  return MEMORY[0x24BE9EDA8]();
}

uint64_t sub_247278430()
{
  return MEMORY[0x24BE9EDB0]();
}

uint64_t sub_24727843C()
{
  return MEMORY[0x24BE9F8E0]();
}

uint64_t sub_247278448()
{
  return MEMORY[0x24BE9F958]();
}

uint64_t sub_247278454()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_247278460()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_24727846C()
{
  return MEMORY[0x24BE9FA48]();
}

uint64_t sub_247278478()
{
  return MEMORY[0x24BE9FAA0]();
}

uint64_t sub_247278484()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_247278490()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_24727849C()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_2472784A8()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_2472784B4()
{
  return MEMORY[0x24BEA3738]();
}

uint64_t sub_2472784C0()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_2472784CC()
{
  return MEMORY[0x24BEA5B80]();
}

uint64_t sub_2472784D8()
{
  return MEMORY[0x24BEA5B88]();
}

uint64_t sub_2472784E4()
{
  return MEMORY[0x24BEA5B90]();
}

uint64_t sub_2472784F0()
{
  return MEMORY[0x24BEA5BA0]();
}

uint64_t sub_2472784FC()
{
  return MEMORY[0x24BEA5BB0]();
}

uint64_t sub_247278508()
{
  return MEMORY[0x24BEA5BD0]();
}

uint64_t sub_247278514()
{
  return MEMORY[0x24BEA5BF0]();
}

uint64_t sub_247278520()
{
  return MEMORY[0x24BEA5BF8]();
}

uint64_t sub_24727852C()
{
  return MEMORY[0x24BEA5DC8]();
}

uint64_t sub_247278538()
{
  return MEMORY[0x24BEA5DD0]();
}

uint64_t sub_247278544()
{
  return MEMORY[0x24BEA5DD8]();
}

uint64_t sub_247278550()
{
  return MEMORY[0x24BEA5E48]();
}

uint64_t sub_24727855C()
{
  return MEMORY[0x24BEA5E50]();
}

uint64_t sub_247278568()
{
  return MEMORY[0x24BEA5E68]();
}

uint64_t sub_247278574()
{
  return MEMORY[0x24BEA5E78]();
}

uint64_t sub_247278580()
{
  return MEMORY[0x24BEA5E80]();
}

uint64_t sub_24727858C()
{
  return MEMORY[0x24BEA5E90]();
}

uint64_t sub_247278598()
{
  return MEMORY[0x24BEA5E98]();
}

uint64_t sub_2472785A4()
{
  return MEMORY[0x24BEA5EA8]();
}

uint64_t sub_2472785B0()
{
  return MEMORY[0x24BEA5EB8]();
}

uint64_t sub_2472785BC()
{
  return MEMORY[0x24BEA5EC0]();
}

uint64_t sub_2472785C8()
{
  return MEMORY[0x24BEA5ED0]();
}

uint64_t sub_2472785D4()
{
  return MEMORY[0x24BEA5F50]();
}

uint64_t sub_2472785E0()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_2472785EC()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_2472785F8()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_247278604()
{
  return MEMORY[0x24BEA87F8]();
}

uint64_t sub_247278610()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_24727861C()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_247278628()
{
  return MEMORY[0x24BEA88D8]();
}

uint64_t sub_247278634()
{
  return MEMORY[0x24BEA88E0]();
}

uint64_t sub_247278640()
{
  return MEMORY[0x24BEA89C8]();
}

uint64_t sub_24727864C()
{
  return MEMORY[0x24BEA8A40]();
}

uint64_t sub_247278658()
{
  return MEMORY[0x24BEA8A48]();
}

uint64_t sub_247278664()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_247278670()
{
  return MEMORY[0x24BEA8A88]();
}

uint64_t sub_24727867C()
{
  return MEMORY[0x24BEA8A90]();
}

uint64_t sub_247278688()
{
  return MEMORY[0x24BEA8AA8]();
}

uint64_t sub_247278694()
{
  return MEMORY[0x24BEA8AB8]();
}

uint64_t sub_2472786A0()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_2472786AC()
{
  return MEMORY[0x24BEA8AC8]();
}

uint64_t sub_2472786B8()
{
  return MEMORY[0x24BEA8AE0]();
}

uint64_t sub_2472786C4()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_2472786D0()
{
  return MEMORY[0x24BEA8B20]();
}

uint64_t sub_2472786DC()
{
  return MEMORY[0x24BEA8BB0]();
}

uint64_t sub_2472786E8()
{
  return MEMORY[0x24BEA8C10]();
}

uint64_t sub_2472786F4()
{
  return MEMORY[0x24BEA8C70]();
}

uint64_t sub_247278700()
{
  return MEMORY[0x24BEA8C78]();
}

uint64_t sub_24727870C()
{
  return MEMORY[0x24BEA8C80]();
}

uint64_t sub_247278718()
{
  return MEMORY[0x24BEA8CB0]();
}

uint64_t sub_247278724()
{
  return MEMORY[0x24BEA8CB8]();
}

uint64_t sub_247278730()
{
  return MEMORY[0x24BEA8D70]();
}

uint64_t sub_24727873C()
{
  return MEMORY[0x24BEA8D80]();
}

uint64_t sub_247278748()
{
  return MEMORY[0x24BEA8D98]();
}

uint64_t sub_247278754()
{
  return MEMORY[0x24BEA8DA8]();
}

uint64_t sub_247278760()
{
  return MEMORY[0x24BE927D8]();
}

uint64_t sub_24727876C()
{
  return MEMORY[0x24BE927F0]();
}

uint64_t sub_247278778()
{
  return MEMORY[0x24BE92840]();
}

uint64_t sub_247278784()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_247278790()
{
  return MEMORY[0x24BE928F8]();
}

uint64_t sub_24727879C()
{
  return MEMORY[0x24BE929F0]();
}

uint64_t sub_2472787A8()
{
  return MEMORY[0x24BE92A18]();
}

uint64_t sub_2472787B4()
{
  return MEMORY[0x24BE92B10]();
}

uint64_t sub_2472787C0()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_2472787CC()
{
  return MEMORY[0x24BE92C00]();
}

uint64_t sub_2472787D8()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2472787E4()
{
  return MEMORY[0x24BEA6CB0]();
}

uint64_t sub_2472787F0()
{
  return MEMORY[0x24BEA6CB8]();
}

uint64_t sub_2472787FC()
{
  return MEMORY[0x24BEA6CC0]();
}

uint64_t sub_247278808()
{
  return MEMORY[0x24BEA6CD8]();
}

uint64_t sub_247278814()
{
  return MEMORY[0x24BEA6D08]();
}

uint64_t sub_247278820()
{
  return MEMORY[0x24BEA6D10]();
}

uint64_t sub_24727882C()
{
  return MEMORY[0x24BEA6D18]();
}

uint64_t sub_247278838()
{
  return MEMORY[0x24BEA6D88]();
}

uint64_t sub_247278844()
{
  return MEMORY[0x24BEA6D90]();
}

uint64_t sub_247278850()
{
  return MEMORY[0x24BEA6DC0]();
}

uint64_t sub_24727885C()
{
  return MEMORY[0x24BEA6DD0]();
}

uint64_t sub_247278868()
{
  return MEMORY[0x24BEA6DE0]();
}

uint64_t sub_247278874()
{
  return MEMORY[0x24BEA6DE8]();
}

uint64_t sub_247278880()
{
  return MEMORY[0x24BEA6DF8]();
}

uint64_t sub_24727888C()
{
  return MEMORY[0x24BEA6E28]();
}

uint64_t sub_247278898()
{
  return MEMORY[0x24BEA6E30]();
}

uint64_t sub_2472788A4()
{
  return MEMORY[0x24BEA6E38]();
}

uint64_t sub_2472788B0()
{
  return MEMORY[0x24BEA6E90]();
}

uint64_t sub_2472788BC()
{
  return MEMORY[0x24BEA6EE8]();
}

uint64_t sub_2472788C8()
{
  return MEMORY[0x24BEA6EF8]();
}

uint64_t sub_2472788D4()
{
  return MEMORY[0x24BEA6F00]();
}

uint64_t sub_2472788E0()
{
  return MEMORY[0x24BEA6F30]();
}

uint64_t sub_2472788EC()
{
  return MEMORY[0x24BEA6F38]();
}

uint64_t sub_2472788F8()
{
  return MEMORY[0x24BEA6F78]();
}

uint64_t sub_247278904()
{
  return MEMORY[0x24BEA6F80]();
}

uint64_t sub_247278910()
{
  return MEMORY[0x24BEA6F88]();
}

uint64_t sub_24727891C()
{
  return MEMORY[0x24BEA6F90]();
}

uint64_t sub_247278928()
{
  return MEMORY[0x24BEA6F98]();
}

uint64_t sub_247278934()
{
  return MEMORY[0x24BEA6FA0]();
}

uint64_t sub_247278940()
{
  return MEMORY[0x24BEA6FA8]();
}

uint64_t sub_24727894C()
{
  return MEMORY[0x24BEA6FC8]();
}

uint64_t sub_247278958()
{
  return MEMORY[0x24BEA6FE0]();
}

uint64_t sub_247278964()
{
  return MEMORY[0x24BEA6FE8]();
}

uint64_t sub_247278970()
{
  return MEMORY[0x24BEA6FF0]();
}

uint64_t sub_24727897C()
{
  return MEMORY[0x24BEA7010]();
}

uint64_t sub_247278988()
{
  return MEMORY[0x24BEA7018]();
}

uint64_t sub_247278994()
{
  return MEMORY[0x24BEA7020]();
}

uint64_t sub_2472789A0()
{
  return MEMORY[0x24BEA7028]();
}

uint64_t sub_2472789AC()
{
  return MEMORY[0x24BEA7030]();
}

uint64_t sub_2472789B8()
{
  return MEMORY[0x24BEA7048]();
}

uint64_t sub_2472789C4()
{
  return MEMORY[0x24BEA7050]();
}

uint64_t sub_2472789D0()
{
  return MEMORY[0x24BEA7058]();
}

uint64_t sub_2472789DC()
{
  return MEMORY[0x24BEA7060]();
}

uint64_t sub_2472789E8()
{
  return MEMORY[0x24BEA7068]();
}

uint64_t sub_2472789F4()
{
  return MEMORY[0x24BEA7070]();
}

uint64_t sub_247278A00()
{
  return MEMORY[0x24BEA7078]();
}

uint64_t sub_247278A0C()
{
  return MEMORY[0x24BEA7080]();
}

uint64_t sub_247278A18()
{
  return MEMORY[0x24BEA7088]();
}

uint64_t sub_247278A24()
{
  return MEMORY[0x24BEA70A8]();
}

uint64_t sub_247278A30()
{
  return MEMORY[0x24BEA70B0]();
}

uint64_t sub_247278A3C()
{
  return MEMORY[0x24BEA70B8]();
}

uint64_t sub_247278A48()
{
  return MEMORY[0x24BEA70C0]();
}

uint64_t sub_247278A54()
{
  return MEMORY[0x24BEA70C8]();
}

uint64_t sub_247278A60()
{
  return MEMORY[0x24BEA70E8]();
}

uint64_t sub_247278A6C()
{
  return MEMORY[0x24BEA70F0]();
}

uint64_t sub_247278A78()
{
  return MEMORY[0x24BEA70F8]();
}

uint64_t sub_247278A84()
{
  return MEMORY[0x24BEA7100]();
}

uint64_t sub_247278A90()
{
  return MEMORY[0x24BEA7108]();
}

uint64_t sub_247278A9C()
{
  return MEMORY[0x24BEA7110]();
}

uint64_t sub_247278AA8()
{
  return MEMORY[0x24BEA7118]();
}

uint64_t sub_247278AB4()
{
  return MEMORY[0x24BEA7120]();
}

uint64_t sub_247278AC0()
{
  return MEMORY[0x24BEA7138]();
}

uint64_t sub_247278ACC()
{
  return MEMORY[0x24BEA7158]();
}

uint64_t sub_247278AD8()
{
  return MEMORY[0x24BEA7190]();
}

uint64_t sub_247278AE4()
{
  return MEMORY[0x24BEA71D8]();
}

uint64_t sub_247278AF0()
{
  return MEMORY[0x24BEA71F0]();
}

uint64_t sub_247278AFC()
{
  return MEMORY[0x24BEA7200]();
}

uint64_t sub_247278B08()
{
  return MEMORY[0x24BEA7248]();
}

uint64_t sub_247278B14()
{
  return MEMORY[0x24BEA7290]();
}

uint64_t sub_247278B20()
{
  return MEMORY[0x24BEA7298]();
}

uint64_t sub_247278B2C()
{
  return MEMORY[0x24BEA72A0]();
}

uint64_t sub_247278B38()
{
  return MEMORY[0x24BEA72A8]();
}

uint64_t sub_247278B44()
{
  return MEMORY[0x24BEA72B0]();
}

uint64_t sub_247278B50()
{
  return MEMORY[0x24BEA72B8]();
}

uint64_t sub_247278B5C()
{
  return MEMORY[0x24BEA72D8]();
}

uint64_t sub_247278B68()
{
  return MEMORY[0x24BEA72E8]();
}

uint64_t sub_247278B74()
{
  return MEMORY[0x24BEA72F0]();
}

uint64_t sub_247278B80()
{
  return MEMORY[0x24BEA7308]();
}

uint64_t sub_247278B8C()
{
  return MEMORY[0x24BEA7310]();
}

uint64_t sub_247278B98()
{
  return MEMORY[0x24BEA7328]();
}

uint64_t sub_247278BA4()
{
  return MEMORY[0x24BEA7330]();
}

uint64_t sub_247278BB0()
{
  return MEMORY[0x24BEA7338]();
}

uint64_t sub_247278BBC()
{
  return MEMORY[0x24BEA7348]();
}

uint64_t sub_247278BC8()
{
  return MEMORY[0x24BEA7370]();
}

uint64_t sub_247278BD4()
{
  return MEMORY[0x24BEA7380]();
}

uint64_t sub_247278BE0()
{
  return MEMORY[0x24BEA7390]();
}

uint64_t sub_247278BEC()
{
  return MEMORY[0x24BEA73B0]();
}

uint64_t sub_247278BF8()
{
  return MEMORY[0x24BEA73C0]();
}

uint64_t sub_247278C04()
{
  return MEMORY[0x24BEA73C8]();
}

uint64_t sub_247278C10()
{
  return MEMORY[0x24BEA73D0]();
}

uint64_t sub_247278C1C()
{
  return MEMORY[0x24BEA7400]();
}

uint64_t sub_247278C28()
{
  return MEMORY[0x24BEA7460]();
}

uint64_t sub_247278C34()
{
  return MEMORY[0x24BEA74A8]();
}

uint64_t sub_247278C40()
{
  return MEMORY[0x24BEA74B0]();
}

uint64_t sub_247278C4C()
{
  return MEMORY[0x24BEA74B8]();
}

uint64_t sub_247278C58()
{
  return MEMORY[0x24BEA74C0]();
}

uint64_t sub_247278C64()
{
  return MEMORY[0x24BEA74C8]();
}

uint64_t sub_247278C70()
{
  return MEMORY[0x24BEA74D0]();
}

uint64_t sub_247278C7C()
{
  return MEMORY[0x24BEA74D8]();
}

uint64_t sub_247278C88()
{
  return MEMORY[0x24BEA74E0]();
}

uint64_t sub_247278C94()
{
  return MEMORY[0x24BEA7508]();
}

uint64_t sub_247278CA0()
{
  return MEMORY[0x24BEA7548]();
}

uint64_t sub_247278CAC()
{
  return MEMORY[0x24BEA7558]();
}

uint64_t sub_247278CB8()
{
  return MEMORY[0x24BEA7560]();
}

uint64_t sub_247278CC4()
{
  return MEMORY[0x24BEA7568]();
}

uint64_t sub_247278CD0()
{
  return MEMORY[0x24BEA75F0]();
}

uint64_t sub_247278CDC()
{
  return MEMORY[0x24BEA7618]();
}

uint64_t sub_247278CE8()
{
  return MEMORY[0x24BEA7620]();
}

uint64_t sub_247278CF4()
{
  return MEMORY[0x24BEA7628]();
}

uint64_t sub_247278D00()
{
  return MEMORY[0x24BEA7638]();
}

uint64_t sub_247278D0C()
{
  return MEMORY[0x24BEA7640]();
}

uint64_t sub_247278D18()
{
  return MEMORY[0x24BEA7648]();
}

uint64_t sub_247278D24()
{
  return MEMORY[0x24BEA7678]();
}

uint64_t sub_247278D30()
{
  return MEMORY[0x24BEA7680]();
}

uint64_t sub_247278D3C()
{
  return MEMORY[0x24BEA7688]();
}

uint64_t sub_247278D48()
{
  return MEMORY[0x24BEA76B8]();
}

uint64_t sub_247278D54()
{
  return MEMORY[0x24BEA76D8]();
}

uint64_t sub_247278D60()
{
  return MEMORY[0x24BEA76E0]();
}

uint64_t sub_247278D6C()
{
  return MEMORY[0x24BEA76E8]();
}

uint64_t sub_247278D78()
{
  return MEMORY[0x24BEA76F0]();
}

uint64_t sub_247278D84()
{
  return MEMORY[0x24BEA76F8]();
}

uint64_t sub_247278D90()
{
  return MEMORY[0x24BEA7700]();
}

uint64_t sub_247278D9C()
{
  return MEMORY[0x24BEA7708]();
}

uint64_t sub_247278DA8()
{
  return MEMORY[0x24BEA7710]();
}

uint64_t sub_247278DB4()
{
  return MEMORY[0x24BEA7728]();
}

uint64_t sub_247278DC0()
{
  return MEMORY[0x24BEA7730]();
}

uint64_t sub_247278DCC()
{
  return MEMORY[0x24BEA7740]();
}

uint64_t sub_247278DD8()
{
  return MEMORY[0x24BEA7750]();
}

uint64_t sub_247278DE4()
{
  return MEMORY[0x24BEA77A8]();
}

uint64_t sub_247278DF0()
{
  return MEMORY[0x24BEA77C0]();
}

uint64_t sub_247278DFC()
{
  return MEMORY[0x24BEA7800]();
}

uint64_t sub_247278E08()
{
  return MEMORY[0x24BEA7808]();
}

uint64_t sub_247278E14()
{
  return MEMORY[0x24BEA7838]();
}

uint64_t sub_247278E20()
{
  return MEMORY[0x24BEA7870]();
}

uint64_t sub_247278E2C()
{
  return MEMORY[0x24BE91810]();
}

uint64_t sub_247278E38()
{
  return MEMORY[0x24BE91818]();
}

uint64_t sub_247278E44()
{
  return MEMORY[0x24BE91820]();
}

uint64_t sub_247278E50()
{
  return MEMORY[0x24BE91830]();
}

uint64_t sub_247278E5C()
{
  return MEMORY[0x24BE91860]();
}

uint64_t sub_247278E68()
{
  return MEMORY[0x24BE918A0]();
}

uint64_t sub_247278E74()
{
  return MEMORY[0x24BE918B0]();
}

uint64_t sub_247278E80()
{
  return MEMORY[0x24BE91940]();
}

uint64_t sub_247278E8C()
{
  return MEMORY[0x24BE91958]();
}

uint64_t sub_247278E98()
{
  return MEMORY[0x24BE91968]();
}

uint64_t sub_247278EA4()
{
  return MEMORY[0x24BE91980]();
}

uint64_t sub_247278EB0()
{
  return MEMORY[0x24BE91990]();
}

uint64_t sub_247278EBC()
{
  return MEMORY[0x24BE919A8]();
}

uint64_t sub_247278EC8()
{
  return MEMORY[0x24BE919B0]();
}

uint64_t sub_247278ED4()
{
  return MEMORY[0x24BE919C0]();
}

uint64_t sub_247278EE0()
{
  return MEMORY[0x24BE919C8]();
}

uint64_t sub_247278EEC()
{
  return MEMORY[0x24BE919E0]();
}

uint64_t sub_247278EF8()
{
  return MEMORY[0x24BE91A30]();
}

uint64_t sub_247278F04()
{
  return MEMORY[0x24BE92EF0]();
}

uint64_t sub_247278F10()
{
  return MEMORY[0x24BE92EF8]();
}

uint64_t sub_247278F1C()
{
  return MEMORY[0x24BE92F00]();
}

uint64_t sub_247278F28()
{
  return MEMORY[0x24BE92F08]();
}

uint64_t sub_247278F34()
{
  return MEMORY[0x24BE92F38]();
}

uint64_t sub_247278F40()
{
  return MEMORY[0x24BE92F60]();
}

uint64_t sub_247278F4C()
{
  return MEMORY[0x24BE92F78]();
}

uint64_t sub_247278F58()
{
  return MEMORY[0x24BE57140]();
}

uint64_t sub_247278F64()
{
  return MEMORY[0x24BE57150]();
}

uint64_t sub_247278F70()
{
  return MEMORY[0x24BE57320]();
}

uint64_t sub_247278F7C()
{
  return MEMORY[0x24BE576C0]();
}

uint64_t sub_247278F88()
{
  return MEMORY[0x24BE576C8]();
}

uint64_t sub_247278F94()
{
  return MEMORY[0x24BE57778]();
}

uint64_t sub_247278FA0()
{
  return MEMORY[0x24BE57790]();
}

uint64_t sub_247278FAC()
{
  return MEMORY[0x24BE577A0]();
}

uint64_t sub_247278FB8()
{
  return MEMORY[0x24BE577A8]();
}

uint64_t sub_247278FC4()
{
  return MEMORY[0x24BE577B0]();
}

uint64_t sub_247278FD0()
{
  return MEMORY[0x24BE54030]();
}

uint64_t sub_247278FDC()
{
  return MEMORY[0x24BE54040]();
}

uint64_t sub_247278FE8()
{
  return MEMORY[0x24BE54048]();
}

uint64_t sub_247278FF4()
{
  return MEMORY[0x24BEA5478]();
}

uint64_t sub_247279000()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_24727900C()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_247279018()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_247279024()
{
  return MEMORY[0x24BEA7878]();
}

uint64_t sub_247279030()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24727903C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_247279048()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247279054()
{
  return MEMORY[0x24BEA5540]();
}

uint64_t sub_247279060()
{
  return MEMORY[0x24BEA5570]();
}

uint64_t sub_24727906C()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_247279078()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_247279084()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_247279090()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_24727909C()
{
  return MEMORY[0x24BEA5930]();
}

uint64_t sub_2472790A8()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_2472790B4()
{
  return MEMORY[0x24BEA5A60]();
}

uint64_t sub_2472790C0()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_2472790CC()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_2472790D8()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2472790E4()
{
  return MEMORY[0x24BEB9858]();
}

uint64_t sub_2472790F0()
{
  return MEMORY[0x24BEB9868]();
}

uint64_t sub_2472790FC()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_247279108()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_247279114()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_247279120()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_24727912C()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_247279138()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_247279144()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_247279150()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_24727915C()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_247279168()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_247279174()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_247279180()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24727918C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247279198()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2472791A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2472791B0()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2472791BC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2472791C8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2472791D4()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_2472791E0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2472791EC()
{
  return MEMORY[0x24BEE09F8]();
}

uint64_t sub_2472791F8()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_247279204()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247279210()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24727921C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247279228()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_247279234()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_247279240()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_24727924C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_247279258()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_247279264()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247279270()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24727927C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247279288()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247279294()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2472792A0()
{
  return MEMORY[0x24BEA7880]();
}

uint64_t sub_2472792AC()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2472792B8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2472792C4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2472792D0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2472792DC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2472792E8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2472792F4()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_247279300()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24727930C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_247279318()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_247279324()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_247279330()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_24727933C()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_247279348()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_247279354()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_247279360()
{
  return MEMORY[0x24BEE6D20]();
}

uint64_t sub_24727936C()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_247279378()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_247279384()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_247279390()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_24727939C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2472793A8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2472793B4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2472793C0()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2472793CC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2472793D8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2472793E4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2472793F0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2472793FC()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_247279408()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_247279414()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_247279420()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24727942C()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_247279438()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_247279444()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_247279450()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24727945C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_247279468()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247279474()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247279480()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_24727948C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247279498()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2472794A4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2472794B0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2472794BC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2472794C8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2472794D4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2472794E0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2472794EC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2472794F8()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_247279504()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_247279510()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24727951C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_247279528()
{
  return MEMORY[0x24BEE2E60]();
}

uint64_t sub_247279534()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_247279540()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_24727954C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_247279558()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_247279564()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247279570()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24727957C()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t sub_247279588()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247279594()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2472795A0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2472795AC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2472795B8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2472795C4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2472795D0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2472795DC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2472795E8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2472795F4()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_247279600()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_24727960C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_247279618()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_247279624()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_247279630()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_24727963C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_247279648()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_247279654()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247279660()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_24727966C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_247279678()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_247279684()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_247279690()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_24727969C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2472796A8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2472796B4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2472796C0()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2472796CC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2472796D8()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_2472796E4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2472796F0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2472796FC()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_247279708()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247279714()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_247279720()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_24727972C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247279738()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_247279744()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_247279750()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_24727975C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_247279768()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247279774()
{
  return MEMORY[0x24BEE7138]();
}

uint64_t sub_247279780()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24727978C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247279798()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2472797A4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2472797B0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2472797BC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2472797C8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2472797D4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2472797E0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2472797EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2472797F8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_247279804()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247279810()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_24727981C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247279828()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_247279834()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247279840()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_24727984C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFSystemRootDirectory()
{
  return MEMORY[0x24BE09070]();
}

uint64_t CSSiriPlaybackRouteFromAudioDestination()
{
  return MEMORY[0x24BE282B0]();
}

uint64_t CSSiriRecordRouteFromAudioSource()
{
  return MEMORY[0x24BE282B8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

