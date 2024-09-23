uint64_t sub_247423CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_247423D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

BOOL sub_247423D24(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_247423D34()
{
  return sub_247441D70();
}

uint64_t sub_247423D58()
{
  sub_247441D64();
  sub_247441D70();
  return sub_247441D7C();
}

BOOL sub_247423D9C(char *a1, char *a2)
{
  return sub_247423D24(*a1, *a2);
}

uint64_t sub_247423DA8()
{
  return sub_247423D58();
}

uint64_t sub_247423DB0()
{
  return sub_247423D34();
}

uint64_t sub_247423DB8()
{
  sub_247441D64();
  sub_247441D70();
  return sub_247441D7C();
}

uint64_t sub_247423E08()
{
  uint64_t v0;

  v0 = sub_247441914();
  __swift_allocate_value_buffer(v0, qword_2544473F0);
  *(_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_2544473F0) = 500;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

_QWORD *sub_247423E68()
{
  _QWORD *v0;

  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v0[4] = 0;
  v0[5] = 0xE000000000000000;
  sub_247423E8C();
  return v0;
}

void sub_247423E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD aBlock[7];

  v1 = sub_247441968();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&aBlock[-1] - v6;
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedHandler);
  sub_247441BCC();
  swift_unknownObjectRelease();
  sub_247427DC4(0, (unint64_t *)&qword_254446B90);
  if (swift_dynamicCast())
  {
    v9 = (void *)aBlock[6];
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    v11 = OUTLINED_FUNCTION_26();
    *(_QWORD *)(v11 + 16) = v0;
    *(_QWORD *)(v11 + 24) = v10;
    v12 = OUTLINED_FUNCTION_26();
    *(_QWORD *)(v12 + 16) = sub_247427D40;
    *(_QWORD *)(v12 + 24) = v11;
    aBlock[4] = sub_247427D64;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2474246C0;
    aBlock[3] = &block_descriptor_23;
    v13 = _Block_copy(aBlock);
    swift_retain();
    v14 = v10;
    swift_release();
    objc_msgSend(v9, sel_getNeuralCombinerConfigFileAndBnnsIrPathWithCompletion_, v13);
    _Block_release(v13);
    sub_24744195C();
    if (qword_254447398 != -1)
      swift_once();
    v15 = sub_247441914();
    v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2544473F0);
    MEMORY[0x24957A650](v5, v16);
    v17 = *(void (**)(char *, uint64_t))(v2 + 8);
    v17(v5, v1);
    sub_247441B30();
    v17(v7, v1);
    if ((sub_247441920() & 1) != 0)
    {
      if (qword_254446B80 != -1)
        swift_once();
      v18 = OUTLINED_FUNCTION_43();
      __swift_project_value_buffer(v18, (uint64_t)qword_254447420);
      v19 = OUTLINED_FUNCTION_68();
      v20 = sub_247441B24();
      if (OUTLINED_FUNCTION_6(v20))
      {
        v21 = (uint8_t *)OUTLINED_FUNCTION_13();
        *(_WORD *)v21 = 0;
        OUTLINED_FUNCTION_34(&dword_247422000, v19, (os_log_type_t)v1, "Timed out waiting to get asset path with getNeuralCombinerConfigFile api", v21);
        OUTLINED_FUNCTION_1();
      }

      if (qword_254446B70 != -1)
        swift_once();
      sub_24743F8FC();
    }

  }
  else
  {
    if (qword_254446B80 != -1)
      swift_once();
    v22 = OUTLINED_FUNCTION_43();
    __swift_project_value_buffer(v22, (uint64_t)qword_254447420);
    v14 = OUTLINED_FUNCTION_68();
    v23 = sub_247441B24();
    if (os_log_type_enabled(v14, v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_13();
      *(_WORD *)v24 = 0;
      OUTLINED_FUNCTION_34(&dword_247422000, v14, v23, "NCAssetPathGetter - Error trying to fetch config from CSAttSiriMitigationAssetProvider", v24);
      OUTLINED_FUNCTION_1();
    }
  }

}

void sub_24742424C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, id a5, _QWORD *a6, NSObject *a7)
{
  unint64_t v13;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v13 = 0x254446000uLL;
  if (a5)
  {
    v15 = a5;
    if (qword_254446B80 != -1)
      swift_once();
    v16 = sub_2474418FC();
    __swift_project_value_buffer(v16, (uint64_t)qword_254447420);
    v17 = a5;
    v18 = a5;
    v19 = sub_2474418F0();
    v20 = sub_247441B24();
    if (os_log_type_enabled(v19, v20))
    {
      v43 = a6;
      v21 = (uint8_t *)swift_slowAlloc();
      v42 = a1;
      v22 = swift_slowAlloc();
      v46 = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = a5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254446B78);
      v24 = sub_247441A04();
      sub_247438888(v24, v25, &v46);
      v13 = 0x254446000;
      sub_247441B90();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247422000, v19, v20, "fetching bnnsIr from MitigationAssetProvider with error: %s", v21, 0xCu);
      swift_arrayDestroy();
      v26 = v22;
      a1 = v42;
      MEMORY[0x24957AE54](v26, -1, -1);
      v27 = v21;
      a6 = v43;
      MEMORY[0x24957AE54](v27, -1, -1);

    }
    else
    {

    }
  }
  if (*(_QWORD *)(v13 + 2944) != -1)
    swift_once();
  v28 = sub_2474418FC();
  __swift_project_value_buffer(v28, (uint64_t)qword_254447420);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v29 = sub_2474418F0();
  v30 = sub_247441B18();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v46 = v41;
    *(_DWORD *)v31 = 136315394;
    v32 = a1;
    if (!a2)
      a1 = 0;
    v44 = a6;
    if (a2)
      v33 = a2;
    else
      v33 = 0xE000000000000000;
    v45 = a3;
    swift_bridgeObjectRetain();
    sub_247438888(a1, v33, &v46);
    sub_247441B90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    if (a4)
      v34 = a3;
    else
      v34 = 0;
    if (a4)
      v35 = a4;
    else
      v35 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v36 = v34;
    a6 = v44;
    sub_247438888(v36, v35, &v46);
    a1 = v32;
    sub_247441B90();
    swift_bridgeObjectRelease_n();
    a3 = v45;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247422000, v29, v30, "Completion block of getNeuralCombinerConfigFile invoked and configPath, bnnsIrPath is cached - %s %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v41, -1, -1);
    MEMORY[0x24957AE54](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  if (a2)
    v37 = a1;
  else
    v37 = 0;
  if (a2)
    v38 = a2;
  else
    v38 = 0xE000000000000000;
  a6[2] = v37;
  a6[3] = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a4)
    v39 = a3;
  else
    v39 = 0;
  if (a4)
    v40 = a4;
  else
    v40 = 0xE000000000000000;
  a6[4] = v39;
  a6[5] = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dispatch_group_leave(a7);
}

void sub_2474246C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, id);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  v6 = sub_2474419C8();
  v8 = v7;
  v9 = sub_2474419C8();
  v11 = v10;
  swift_retain();
  v12 = a4;
  v5(v6, v8, v9, v11, v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t sub_24742476C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247424790()
{
  sub_24742476C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NCAssetPathGetter()
{
  return objc_opt_self();
}

uint64_t sub_2474247D0()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v24;

  v2 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  type metadata accessor for NCAssetPathGetter();
  v3 = OUTLINED_FUNCTION_26();
  sub_247423E68();
  *(_QWORD *)(v2 + 72) = v3;
  *(_BYTE *)(v2 + 80) = 0;
  if (qword_254446B80 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_43();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_254447420);
  OUTLINED_FUNCTION_68();
  v6 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_6(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_13();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_34(&dword_247422000, v3, v1, "fetching NC config path from CSAttSiriMitigationAssetProvider", v7);
    OUTLINED_FUNCTION_1();
  }

  v8 = type metadata accessor for SELFLogger();
  v9 = (_QWORD *)OUTLINED_FUNCTION_26();
  v10 = type metadata accessor for SelfEmitter();
  v11 = OUTLINED_FUNCTION_26();
  v9[5] = v10;
  v9[6] = &off_2518A2040;
  v9[2] = v11;
  *(_QWORD *)(v2 + 48) = v8;
  *(_QWORD *)(v2 + 56) = &off_2518A1FE0;
  *(_QWORD *)(v2 + 24) = v9;
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  sub_247441BCC();
  swift_unknownObjectRelease();
  sub_247427DC4(0, &qword_254446B88);
  v13 = swift_dynamicCast();
  v14 = v24;
  if (!v13)
    v14 = 0;
  *(_QWORD *)(v2 + 64) = v14;
  v15 = *(_QWORD **)(v2 + 72);
  v16 = v15[4];
  v17 = v15[5];
  if ((v17 & 0x2000000000000000) != 0)
    v18 = HIBYTE(v17) & 0xF;
  else
    v18 = v16 & 0xFFFFFFFFFFFFLL;
  v20 = v15[2];
  v19 = v15[3];
  OUTLINED_FUNCTION_28();
  if (v18)
  {
    OUTLINED_FUNCTION_46();
    sub_247424A38(v20, v19, v16, v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_247424A38(v20, v19, 0, 0xE000000000000000);
  }
  swift_bridgeObjectRelease();
  sub_2474418F0();
  v21 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_71(v21))
  {
    v22 = (uint8_t *)OUTLINED_FUNCTION_13();
    *(_WORD *)v22 = 0;
    OUTLINED_FUNCTION_34(&dword_247422000, v5, (os_log_type_t)v5, "loadModelFromTrial completed", v22);
    OUTLINED_FUNCTION_1();
  }

  return v2;
}

void sub_247424A38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  Class isa;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  os_log_t v30;
  os_log_type_t v31;
  const char *v32;
  __CFString *v33;
  __CFString *v34;
  int AppBooleanValue;

  v5 = v4;
  if (qword_254446B80 != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_43();
  __swift_project_value_buffer(v9, (uint64_t)qword_254447420);
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_87();
  v10 = OUTLINED_FUNCTION_14();
  if (os_log_type_enabled(v4, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_4();
    *(_DWORD *)v11 = 136315138;
    v12 = OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_64(v12, v13, v14, v15);
    OUTLINED_FUNCTION_84();
    sub_247441B90();
    OUTLINED_FUNCTION_77();
    _os_log_impl(&dword_247422000, v4, v10, "using config path - %s for loading NC", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_79();
  if ((a4 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a4) & 0xF;
  else
    v16 = a3 & 0xFFFFFFFFFFFFLL;
  v17 = objc_allocWithZone(MEMORY[0x24BE99240]);
  OUTLINED_FUNCTION_28();
  if (v16)
  {
    swift_bridgeObjectRetain();
    v18 = (objc_class *)sub_247427A1C(a1, a2, a3, a4);
  }
  else
  {
    v18 = (objc_class *)sub_247427948(a1, a2);
  }
  isa = v5[2].isa;
  v5[2].isa = v18;

  if (v5[2].isa)
  {
    OUTLINED_FUNCTION_87();
    v20 = OUTLINED_FUNCTION_14();
    if (OUTLINED_FUNCTION_71(v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_13();
      *(_WORD *)v21 = 0;
      OUTLINED_FUNCTION_34(&dword_247422000, v17, OS_LOG_TYPE_DEFAULT, "Loaded NC model succesfully", v21);
      OUTLINED_FUNCTION_1();
    }

  }
  else
  {
    OUTLINED_FUNCTION_78();
    v22 = OUTLINED_FUNCTION_87();
    v23 = sub_247441B24();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_4();
      *(_DWORD *)v24 = 136315138;
      v25 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_64(v25, v26, v27, v28);
      OUTLINED_FUNCTION_84();
      sub_247441B90();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_66();
      _os_log_impl(v29, v30, v31, v32, v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  v33 = (__CFString *)sub_2474419BC();
  v34 = (__CFString *)sub_2474419BC();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v33, v34, 0);

  LOBYTE(v5[10].isa) = AppBooleanValue != 0;
}

uint64_t sub_247424DAC(uint64_t a1, uint64_t a2, NSObject *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t result;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  char v51;
  int v52;
  char v53;
  id v54;
  _QWORD *v55;
  _QWORD v56[2];
  char v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  int v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  char v71;
  int v72;
  char v73;

  v6 = v5;
  v11 = (_QWORD *)(v4 + 24);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 48));
  v44 = a2;
  v45 = a3;
  v46 = a4;
  sub_24742FEF0();
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v41 = (_QWORD *)(v4 + 24);
    swift_bridgeObjectRetain();
    v13 = 0;
    v14 = (_QWORD *)MEMORY[0x24BEE4B00];
    v42 = a1;
    while (1)
    {
      v55 = v14;
      v15 = a1 + v13;
      v16 = *(_QWORD *)(a1 + v13 + 32);
      v17 = *(_QWORD *)(a1 + v13 + 40);
      v18 = *(_QWORD *)(a1 + v13 + 80);
      v14 = *(_QWORD **)(a1 + v13 + 88);
      v19 = *(_BYTE *)(a1 + v13 + 112);
      v20 = *(_QWORD *)(a1 + v13 + 96);
      v21 = *(_QWORD *)(a1 + v13 + 104);
      v22 = *(void **)(v15 + 64);
      v23 = *(_QWORD *)(v15 + 72);
      v24 = *(_QWORD *)(v15 + 56);
      LOBYTE(v15) = *(_BYTE *)(v15 + 48);
      v56[0] = v16;
      v56[1] = v17;
      v57 = v15;
      v58 = v24;
      v59 = v22;
      v60 = v23;
      v61 = v18;
      v62 = v14;
      v63 = v20;
      v64 = v21;
      v65 = v19;
      v54 = v22;
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_20();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_32();
      sub_24742537C((uint64_t)v56, v44, (uint64_t)v45, v46, &v66);
      if (v6)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_75();

        OUTLINED_FUNCTION_85();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (uint64_t)v14;
      }
      v47 = v13;
      v48 = v12;
      v25 = v66;
      v26 = v67;
      v27 = v68;
      v49 = v69;
      v50 = v70;
      v51 = v71;
      v52 = v72;
      v53 = v73;
      OUTLINED_FUNCTION_32();
      swift_isUniquelyReferenced_nonNull_native();
      v56[0] = v55;
      v28 = OUTLINED_FUNCTION_74();
      if (__OFADD__(v55[2], (v29 & 1) == 0))
        break;
      v30 = v28;
      v31 = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254447360);
      if ((sub_247441C44() & 1) != 0)
      {
        v32 = OUTLINED_FUNCTION_74();
        if ((v31 & 1) != (v33 & 1))
          goto LABEL_20;
        v30 = v32;
      }
      v14 = (_QWORD *)v56[0];
      if ((v31 & 1) != 0)
      {
        v34 = *(_QWORD *)(v56[0] + 56) + 40 * v30;
        swift_bridgeObjectRelease();
        *(_DWORD *)v34 = v25;
        *(_BYTE *)(v34 + 4) = v26;
        *(_QWORD *)(v34 + 8) = v27;
        *(_QWORD *)(v34 + 16) = v49;
        *(_DWORD *)(v34 + 24) = v50;
        *(_BYTE *)(v34 + 28) = v51;
        *(_DWORD *)(v34 + 32) = v52;
        *(_BYTE *)(v34 + 36) = v53;
      }
      else
      {
        *(_QWORD *)(v56[0] + 8 * (v30 >> 6) + 64) |= 1 << v30;
        v35 = (_QWORD *)(v14[6] + 16 * v30);
        *v35 = v16;
        v35[1] = v17;
        v36 = v14[7] + 40 * v30;
        *(_DWORD *)v36 = v25;
        *(_BYTE *)(v36 + 4) = v26;
        *(_QWORD *)(v36 + 8) = v27;
        *(_QWORD *)(v36 + 16) = v49;
        *(_DWORD *)(v36 + 24) = v50;
        *(_BYTE *)(v36 + 28) = v51;
        *(_DWORD *)(v36 + 32) = v52;
        *(_BYTE *)(v36 + 36) = v53;
        v37 = v14[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_19;
        v14[2] = v39;
        OUTLINED_FUNCTION_32();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_0();
      swift_bridgeObjectRelease();
      v13 = v47 + 88;
      --v12;
      v6 = 0;
      a1 = v42;
      if (v48 == 1)
      {
        swift_bridgeObjectRelease();
        v11 = v41;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    result = sub_247441D28();
    __break(1u);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_15:
    __swift_project_boxed_opaque_existential_1(v11, *(_QWORD *)(v43 + 48));
    OUTLINED_FUNCTION_20();
    sub_247430EDC(v44, v45, v46, (uint64_t)v14);
    OUTLINED_FUNCTION_60();
    return (uint64_t)v14;
  }
  return result;
}

void sub_24742514C(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_247425198()
{
  char v0;

  v0 = sub_247441D10();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

id sub_247425240(uint64_t a1, void *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD v16[2];
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_BYTE *)(a1 + 80);
  v16[0] = *(_QWORD *)a1;
  v16[1] = v3;
  v17 = v4;
  v18 = v5;
  v19 = v6;
  v20 = *(_OWORD *)(a1 + 40);
  v21 = v7;
  v22 = v8;
  v23 = v9;
  sub_24742514C((uint64_t)v16);
  if ((v10 & 1) == 0)
    return objc_msgSend(a2, sel_invocationType);
  if (qword_254446B80 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_43();
  __swift_project_value_buffer(v11, (uint64_t)qword_254447420);
  v12 = OUTLINED_FUNCTION_68();
  v13 = sub_247441B18();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_13();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_34(&dword_247422000, v12, v13, "using invocation type as followup when invocationtype is announce as a workaround until model is ready to consume announce invocation type", v14);
    OUTLINED_FUNCTION_1();
  }

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, 3);
}

void sub_24742537C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, int *a5@<X8>)
{
  uint64_t *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  NSObject *v30;
  unint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  id v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  float v50;
  uint64_t v51;
  float v52;
  uint64_t v53;
  float v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  double v59;
  Class v60;
  id v61;
  NSObject *v62;
  unint64_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  os_log_type_t v72;
  const char *v73;
  NSObject *v74;
  NSObject *v75;
  int v76;
  uint64_t v77;
  NSObject *v78;
  double v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  float v91;
  os_log_type_t v92;
  uint8_t *v93;
  void *v94;
  os_log_t v95;
  os_log_type_t v96;
  const char *v97;
  char v98;
  os_log_type_t v99;
  _WORD *v100;
  uint64_t v101;
  uint64_t v102;
  os_log_type_t v103;
  _WORD *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  void *v108;
  double v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  id v125;
  double v126;
  double v127;
  os_log_type_t v128;
  _BOOL4 v129;
  double v130;
  uint64_t v131;
  double *v132;
  id v133;
  id v134;
  double v135;
  int *v136;
  int v137;
  int *v138;
  char v139;
  os_log_type_t v140;
  _WORD *v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE *v144;
  double v145;
  uint64_t v146;
  Class v147;
  double v148;
  NSObject *v149;
  uint64_t v150;
  uint64_t v151;
  os_log_t v152;
  void *v153;
  double v154;
  double v155;
  char *v156;
  os_log_t v157;
  unint64_t v158;
  os_log_type_t v159;
  uint8_t *v160;
  void *v161;
  os_log_t v162;
  os_log_type_t v163;
  const char *v164;
  NSObject *v165;
  uint64_t v166;
  os_log_type_t v167;
  _BOOL4 v168;
  uint8_t *v169;
  uint64_t v170;
  void *v171;
  os_log_t v172;
  os_log_type_t v173;
  const char *v174;
  NSObject *v175;
  NSObject *v176;
  unint64_t v177;
  double v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  float *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  NSObject *v189;
  NSObject *v190;
  NSObject *v191;
  os_log_type_t v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSObject *v200;
  int v201;
  os_log_type_t v202;
  _WORD *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  _QWORD *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t v211;
  char v212;
  _BYTE *v213;
  void *v214;
  _BYTE *v215;
  os_log_t v216;
  NSObject *v217;
  double v218;
  NSObject *v219;
  void *v220;
  void *v221;
  int v222;
  int *v223;
  os_log_t v224;
  uint64_t v225;
  uint64_t v226;
  double v227;
  double v228;
  int v229;
  _BYTE *v230;
  os_log_type_t v231;
  os_log_type_t v232;
  uint8_t *v233;
  uint64_t v234;
  int v235;
  uint64_t v236;
  double v237;
  double v238;
  _QWORD v239[3];
  int v240;
  double v241;
  double v242;
  uint64_t v243;
  uint64_t v244;
  double v245;
  NSObject *v246;
  double v247;
  uint64_t v248;
  uint64_t *v249;
  NSObject *v250;
  uint64_t v251;
  uint64_t v252;
  _BYTE *v253;
  _DWORD *v254;
  uint8_t *isa;
  NSObject *v256;
  char *v257;
  NSObject *v258;
  unint64_t v259;
  int *v260;
  uint64_t v261;
  os_log_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  NSObject *v267;
  int v268;
  double v269;
  uint64_t v270;
  NSObject *v271;
  os_log_t v272;
  uint64_t v273;
  double v274;
  double v275;
  double v276;
  unint64_t v277;
  double aBlock;
  _QWORD v279[3];
  uint64_t (*v280)(void *);
  double v281;
  uint64_t v282;
  double v283;
  os_log_t v284;
  uint64_t v285;
  char v286;
  double v287;
  uint64_t v288[5];

  v260 = a5;
  v277 = a4;
  v263 = a3;
  v251 = a2;
  v288[3] = *MEMORY[0x24BDAC8D0];
  v252 = *v5;
  v7 = sub_2474418FC();
  isa = (uint8_t *)v7[-1].isa;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v257 = (char *)v239 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v250 = ((char *)v239 - v10);
  v11 = *(_QWORD *)(a1 + 8);
  v271 = *(NSObject **)a1;
  v266 = *(unsigned __int8 *)(a1 + 16);
  v13 = *(void **)(a1 + 32);
  v12 = *(double *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v14 = *(double *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 72);
  v269 = *(double *)(a1 + 64);
  v268 = *(unsigned __int8 *)(a1 + 80);
  if (qword_254446B80 != -1)
    swift_once();
  v256 = v7;
  *(double *)&v17 = COERCE_DOUBLE(__swift_project_value_buffer((uint64_t)v7, (uint64_t)qword_254447420));
  v274 = *(double *)&v13;
  v18 = v13;
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  v19 = v18;
  OUTLINED_FUNCTION_3();
  v267 = v19;
  v272 = v17;
  sub_2474418F0();
  v20 = OUTLINED_FUNCTION_14();
  v21 = OUTLINED_FUNCTION_6(v20);
  v275 = v12;
  v276 = v14;
  v270 = v15;
  v273 = v16;
  if (v21)
  {
    v22 = OUTLINED_FUNCTION_4();
    v262 = v17;
    v23 = v22;
    *(double *)&v265 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
    aBlock = *(double *)&v265;
    *(_DWORD *)v23 = 136315650;
    OUTLINED_FUNCTION_49();
    v24 = sub_247438888((uint64_t)v271, v11, (uint64_t *)&aBlock);
    OUTLINED_FUNCTION_62(v24);
    LODWORD(v264) = (_DWORD)v17;
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    v25 = v267;

    OUTLINED_FUNCTION_11();
    *(_WORD *)(v23 + 12) = 2080;
    v26 = OUTLINED_FUNCTION_46();
    v288[0] = OUTLINED_FUNCTION_40(v26, v27, (uint64_t *)&aBlock);
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_11();
    *(_WORD *)(v23 + 22) = 2080;
    OUTLINED_FUNCTION_32();
    v288[0] = OUTLINED_FUNCTION_81(*(uint64_t *)&v269, v28, (uint64_t *)&aBlock);
    sub_247441B90();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_11();
    _os_log_impl(&dword_247422000, v262, (os_log_type_t)v264, "invoking NC for  candidate with tcuId - %s, trpCandidateId %s and utterance - %s", (uint8_t *)v23, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_44();
  v29 = v12;
  OUTLINED_FUNCTION_44();
  v30 = v267;

  OUTLINED_FUNCTION_44();
  v31 = v11;
  v32 = (_DWORD *)OUTLINED_FUNCTION_26();
  v267 = v32;
  v32[4] = -1082130432;
  v254 = v32 + 4;
  v33 = OUTLINED_FUNCTION_26();
  *(_BYTE *)(v33 + 16) = 0;
  v253 = (_BYTE *)(v33 + 16);
  *(double *)&v34 = COERCE_DOUBLE(OUTLINED_FUNCTION_26());
  *(_QWORD *)(v34 + 16) = 0;
  v249 = (uint64_t *)(v34 + 16);
  v265 = v34;
  *(_QWORD *)(v34 + 24) = 0;
  v35 = OUTLINED_FUNCTION_26();
  *(_DWORD *)(v35 + 16) = 0;
  v248 = v35 + 16;
  *(_BYTE *)(v35 + 20) = 1;
  v36 = OUTLINED_FUNCTION_26();
  *(_DWORD *)(v36 + 16) = 0;
  v37 = v36 + 16;
  v264 = v36;
  *(_BYTE *)(v36 + 20) = 1;
  v38 = OUTLINED_FUNCTION_26();
  *(_BYTE *)(v38 + 16) = 0;
  if (v274 == 0.0)
  {
    if ((v268 & 1) == 0)
      __asm { BR              X11 }
    (*((void (**)(char *, os_log_t, NSObject *))isa + 2))(v257, v272, v256);
    OUTLINED_FUNCTION_3();
    v189 = v30;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    v259 = v31;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_33();
    v190 = v189;
    *(double *)&v191 = COERCE_DOUBLE(sub_2474418F0());
    v192 = sub_247441B18();
    v193 = v192;
    if (os_log_type_enabled(v191, v192))
    {
      v194 = OUTLINED_FUNCTION_4();
      v272 = v191;
      v195 = v194;
      v274 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
      aBlock = v274;
      *(_DWORD *)v195 = 136315906;
      v261 = v33;
      OUTLINED_FUNCTION_20();
      v196 = OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_62(v196);
      v262 = (os_log_t)v35;
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      OUTLINED_FUNCTION_11();
      *(_WORD *)(v195 + 12) = 2080;
      LODWORD(v276) = v193;
      OUTLINED_FUNCTION_32();
      v288[0] = OUTLINED_FUNCTION_81(v263, v197, (uint64_t *)&aBlock);
      OUTLINED_FUNCTION_59();
      OUTLINED_FUNCTION_11();
      *(_WORD *)(v195 + 22) = 2048;
      OUTLINED_FUNCTION_2();
      *(double *)v288 = *(float *)&v267[2].isa;
      OUTLINED_FUNCTION_59();
      OUTLINED_FUNCTION_7();
      *(_WORD *)(v195 + 32) = 2080;
      OUTLINED_FUNCTION_2();
      if (*(_BYTE *)(v261 + 16))
        v199 = 0x657461676974694DLL;
      else
        v199 = 0x64657463656C6553;
      v288[0] = OUTLINED_FUNCTION_89(v199, v198, (uint64_t *)&aBlock);
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_27();
      _os_log_impl(&dword_247422000, v272, LOBYTE(v276), "Non FlexibleFollowup: Siri intended info is nil - using default values i.e for candidate - %s, trpCandidateId %s. Score - %f, mitigationDecision - %s", (uint8_t *)v195, 0x2Au);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_7();
    v200 = v267;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_2();
    v201 = (int)v200[2].isa;
    OUTLINED_FUNCTION_2();
    LOBYTE(v200) = *(_BYTE *)(v33 + 16);
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_18();
    swift_release();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_88();
    v137 = 0;
    v138 = v260;
    *v260 = v201;
    *((_BYTE *)v138 + 4) = (_BYTE)v200;
    *((_QWORD *)v138 + 1) = 0;
    *((_QWORD *)v138 + 2) = 0;
    v138[6] = 0;
    v139 = 1;
    *((_BYTE *)v138 + 28) = 1;
    goto LABEL_72;
  }
  v243 = v37;
  v244 = v38 + 16;
  v39 = v35;
  v257 = (char *)v38;
  v40 = v30;
  OUTLINED_FUNCTION_8();
  v41 = OUTLINED_FUNCTION_14();
  v42 = os_log_type_enabled((os_log_t)&unk_2518A1648, v41);
  v261 = v33;
  v262 = v39;
  v259 = v11;
  if (v42)
  {
    v43 = OUTLINED_FUNCTION_4();
    v44 = (_QWORD *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v43 = 138413314;
    v45 = objc_msgSend(v40, (SEL)0x2518A38F2);
    v46 = v45;
    if (*(double *)&v45 == 0.0)
      aBlock = 0.0;
    else
      aBlock = *(double *)&v45;
    v47 = OUTLINED_FUNCTION_65();
    *v44 = v46;
    *(_WORD *)(v43 + 12) = 2048;
    OUTLINED_FUNCTION_12(v47, sel_spkrIdScore);
    aBlock = v48;
    v49 = OUTLINED_FUNCTION_16();
    *(_WORD *)(v43 + 22) = 2048;
    OUTLINED_FUNCTION_12(v49, sel_aftmScore);
    aBlock = v50;
    v51 = OUTLINED_FUNCTION_16();
    *(_WORD *)(v43 + 32) = 2048;
    OUTLINED_FUNCTION_12(v51, sel_odldScore);
    aBlock = v52;
    v53 = OUTLINED_FUNCTION_16();
    *(_WORD *)(v43 + 42) = 2048;
    OUTLINED_FUNCTION_12(v53, sel_lrnnScore);
    aBlock = v54;
    OUTLINED_FUNCTION_16();

    _os_log_impl(&dword_247422000, (os_log_t)&unk_2518A1648, v41, "siriIntendedInfo for NC has invocationSource - %@ , spkrIdScore - %f, aftmScore - %f, odldScore - %f, lrnnScore - %f", (uint8_t *)v43, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447358);
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_1();
  }

  v55 = COERCE_DOUBLE(-[NSObject invocationType](v40, sel_invocationType));
  v56 = v270;
  aBlock = *(double *)&v271;
  v279[0] = v11;
  OUTLINED_FUNCTION_55();
  v280 = *(uint64_t (**)(void *))&v274;
  v281 = v29;
  v282 = v56;
  v283 = v276;
  v284 = *(os_log_t *)&v269;
  v285 = v273;
  v286 = v268;
  v57 = OUTLINED_FUNCTION_86();
  v59 = COERCE_DOUBLE(sub_247425240(v57, v58));
  if (v59 == 0.0)
  {
    OUTLINED_FUNCTION_3();
    *(double *)&v62 = COERCE_DOUBLE(v40);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    v63 = v277;
    OUTLINED_FUNCTION_3();
    v274 = COERCE_DOUBLE(v62);
    OUTLINED_FUNCTION_8();
    v64 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_9(v64))
    {
      v65 = OUTLINED_FUNCTION_4();
      v272 = v62;
      *(double *)&v247 = v55;
      v66 = v65;
      v269 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
      aBlock = v269;
      *(_DWORD *)v66 = 136315650;
      OUTLINED_FUNCTION_48();
      v67 = sub_247438888((uint64_t)v271, v11, (uint64_t *)&aBlock);
      OUTLINED_FUNCTION_62(v67);
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      v68 = v274;

      OUTLINED_FUNCTION_11();
      *(_WORD *)(v66 + 12) = 2080;
      OUTLINED_FUNCTION_20();
      v288[0] = sub_247438888(v263, v63, (uint64_t *)&aBlock);
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_51();
      v288[0] = v69;
      sub_247441B90();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_47(v70, v71, v72, v73);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_22();

    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    v135 = v274;

    goto LABEL_70;
  }
  v245 = v59;
  v246 = v40;
  v60 = v258[8].isa;
  if (v60)
    v61 = -[objc_class getIsAssetMagusSupported](v60, sel_getIsAssetMagusSupported);
  else
    v61 = 0;
  v74 = v271;
  v75 = v246;
  *(double *)&v247 = v55;
  v76 = sub_247427824(*(void **)&v55);
  aBlock = *(double *)&v74;
  v279[0] = v31;
  OUTLINED_FUNCTION_55();
  v280 = *(uint64_t (**)(void *))&v274;
  v281 = v29;
  OUTLINED_FUNCTION_21();
  if (((v77 | v76) & 1) != 0 && (v61 & 1) == 0)
  {
    OUTLINED_FUNCTION_3();
    *(double *)&v78 = COERCE_DOUBLE(v75);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    v79 = v276;
    OUTLINED_FUNCTION_3();
    v80 = v273;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    v81 = v78;
    OUTLINED_FUNCTION_8();
    v82 = OUTLINED_FUNCTION_14();
    if (OUTLINED_FUNCTION_9(v82))
    {
      v83 = OUTLINED_FUNCTION_4();
      v258 = v81;
      v84 = v83;
      *(double *)&v272 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
      v288[0] = (uint64_t)v272;
      *(_DWORD *)v84 = 136315650;
      v256 = (v84 + 4);
      aBlock = *(double *)&v74;
      v279[0] = v31;
      OUTLINED_FUNCTION_55();
      v280 = *(uint64_t (**)(void *))&v274;
      v281 = v275;
      LODWORD(v274) = v31;
      v282 = v270;
      v283 = v79;
      v284 = *(os_log_t *)&v269;
      v285 = v80;
      v286 = v268;
      v271 = v78;
      v85 = TTCandidate.description.getter();
      aBlock = COERCE_DOUBLE(sub_247438888(v85, v86, v288));
      OUTLINED_FUNCTION_86();
      sub_247441B90();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      v87 = v258;

      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_60();
      *(_WORD *)(v84 + 12) = 2080;
      v88 = OUTLINED_FUNCTION_46();
      aBlock = COERCE_DOUBLE(OUTLINED_FUNCTION_40(v88, v89, v288));
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_51();
      aBlock = v90;
      OUTLINED_FUNCTION_86();
      sub_247441B90();
      OUTLINED_FUNCTION_47(&dword_247422000, v271, LOBYTE(v274), "Setting NC result for candidate - %s, trpCandidateId: %s to mitigated because magus is not supported. Score - %f");
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_22();

    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_72();

    v136 = v260;
    v137 = 0;
    *v260 = -1082130432;
    v138 = v136;
    v139 = 1;
    *((_BYTE *)v136 + 4) = 1;
    *((_QWORD *)v136 + 1) = 0;
    *((_QWORD *)v136 + 2) = 0;
    v136[6] = 0;
    *((_BYTE *)v136 + 28) = 1;
    goto LABEL_72;
  }
  OUTLINED_FUNCTION_12(v77, sel_lrnnScore);
  if (v91 != -1.0)
    goto LABEL_34;
  OUTLINED_FUNCTION_8();
  v92 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_9(v92))
  {
    v93 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v93 = 0;
    OUTLINED_FUNCTION_66();
    _os_log_impl(v94, v95, v96, v97, v93, 2u);
    OUTLINED_FUNCTION_1();
  }

  if ((v76 & 1) == 0)
  {
    aBlock = *(double *)&v74;
    v279[0] = v259;
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_21();
    if ((v98 & 1) == 0)
    {
      OUTLINED_FUNCTION_8();
      v202 = OUTLINED_FUNCTION_14();
      if (OUTLINED_FUNCTION_6(v202))
      {
        v203 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_73(v203);
        OUTLINED_FUNCTION_10(&dword_247422000, v204, v205, "Skipping NC because of missing LRNN scores");
        OUTLINED_FUNCTION_1();
      }
      v220 = v61;
      v221 = v247;
      swift_release();
      OUTLINED_FUNCTION_22();

      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_35();
LABEL_70:
      v137 = 0;
      v222 = -1082130432;
      goto LABEL_71;
    }
  }
  OUTLINED_FUNCTION_8();
  v99 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_6(v99))
  {
    v100 = (_WORD *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_73(v100);
    OUTLINED_FUNCTION_10(&dword_247422000, v101, v102, "Request is FF or Announce. Continuing with NC...");
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_8();
  v103 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_6(v103))
  {
    v104 = (_WORD *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_73(v104);
    OUTLINED_FUNCTION_10(&dword_247422000, v105, v106, "Handled LRNN missing scores.");
    OUTLINED_FUNCTION_1();
  }

LABEL_34:
  v107 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99248]), sel_initWithDefaults);
  if (!v107)
  {
    OUTLINED_FUNCTION_8();
    v140 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_6(v140))
    {
      v141 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_73(v141);
      OUTLINED_FUNCTION_10(&dword_247422000, v142, v143, "error when creating SLUresMitigatorIpFeats object");
      OUTLINED_FUNCTION_1();
    }

    sub_247427B84();
    OUTLINED_FUNCTION_36();
    *v144 = 3;
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_22();

    OUTLINED_FUNCTION_72();
    v145 = v245;
    goto LABEL_67;
  }
  v108 = v107;
  v109 = *(id *)&v245;
  objc_msgSend(v107, sel_setInputOrigin_, *(_QWORD *)&v245);
  v110 = sub_247427DC4(0, &qword_2576A3E68);
  OUTLINED_FUNCTION_12(v110, sel_spkrIdScore);
  v111 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v111, sel_setSpeakerIDScore_);

  OUTLINED_FUNCTION_12(v112, sel_aftmScore);
  v113 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v113, sel_setAcousticFTMScores_);

  OUTLINED_FUNCTION_12(v114, sel_odldScore);
  v115 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v115, sel_setNldaScore_);

  OUTLINED_FUNCTION_12(v116, sel_lrnnScore);
  v117 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v117, sel_setLrnnScore_);

  OUTLINED_FUNCTION_12(v118, sel_lrnnThreshold);
  v119 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v119, sel_setLrnnThreshold_);

  OUTLINED_FUNCTION_12(v120, sel_lrnnScale);
  v121 = (void *)OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_15((uint64_t)v121, sel_setExternalLrnnScale_);

  OUTLINED_FUNCTION_12(v122, sel_lrnnOffset);
  v123 = (void *)OUTLINED_FUNCTION_30();
  objc_msgSend(v108, sel_setExternalLrnnOffset_, v123);

  v124 = v108;
  v125 = v109;
  v126 = COERCE_DOUBLE(v124);
  v127 = COERCE_DOUBLE(v125);
  OUTLINED_FUNCTION_8();
  v128 = OUTLINED_FUNCTION_14();
  v240 = v128;
  v129 = os_log_type_enabled(v124, v128);
  v241 = v127;
  v242 = v126;
  if (v129)
  {
    v130 = v127;
    v131 = OUTLINED_FUNCTION_4();
    v132 = (double *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v131 = 138412546;
    aBlock = v126;
    v239[1] = v131 + 12;
    v239[2] = v279;
    v133 = *(id *)&v126;
    sub_247441B90();
    *(_QWORD *)v132 = v108;

    *(_WORD *)(v131 + 12) = 2112;
    aBlock = v130;
    v134 = *(id *)&v130;
    sub_247441B90();
    v132[1] = v245;

    _os_log_impl(&dword_247422000, v124, (os_log_type_t)v240, "inputFeats - %@ - derivedInvocationType - %@", (uint8_t *)v131, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447358);
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_1();
  }

  v146 = v261;
  v147 = v258[2].isa;
  if (v147)
  {
    v148 = COERCE_DOUBLE(OUTLINED_FUNCTION_26());
    v149 = v267;
    *(_QWORD *)(*(_QWORD *)&v148 + 16) = v257;
    *(_QWORD *)(*(_QWORD *)&v148 + 24) = v149;
    v150 = v264;
    v151 = v265;
    *(_QWORD *)(*(_QWORD *)&v148 + 32) = v146;
    *(_QWORD *)(*(_QWORD *)&v148 + 40) = v151;
    v152 = v262;
    *(_QWORD *)(*(_QWORD *)&v148 + 48) = v262;
    *(_QWORD *)(*(_QWORD *)&v148 + 56) = v150;
    *(_QWORD *)(*(_QWORD *)&v148 + 64) = v252;
    v280 = sub_247427C30;
    v281 = v148;
    aBlock = MEMORY[0x24BDAC760];
    v279[0] = 1107296256;
    v279[1] = sub_2474277D0;
    v279[2] = &block_descriptor;
    v153 = _Block_copy(&aBlock);
    v274 = v281;
    v154 = COERCE_DOUBLE(*(id *)&v242);
    v155 = COERCE_DOUBLE(v147);
    v156 = v257;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v157 = v152;
    swift_retain();
    swift_retain();
    swift_release();
    v242 = v155;
    objc_msgSend(*(id *)&v155, sel_processInputFeats_completion_, *(_QWORD *)&v154, v153);
    _Block_release(v153);
    v274 = v154;

    OUTLINED_FUNCTION_2();
    if (v156[16] != 1)
    {
      v175 = v250;
      (*((void (**)(NSObject *, os_log_t, NSObject *))isa + 2))(v250, v272, v256);
      OUTLINED_FUNCTION_3();
      v176 = v246;
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_3();
      v177 = v277;
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_33();
      v178 = COERCE_DOUBLE(v176);
      sub_2474418F0();
      v268 = OUTLINED_FUNCTION_14();
      v269 = *(double *)&v175;
      if (os_log_type_enabled(v175, (os_log_type_t)v268))
      {
        v179 = OUTLINED_FUNCTION_4();
        v266 = OUTLINED_FUNCTION_4();
        v288[0] = v266;
        *(_DWORD *)v179 = 136316674;
        OUTLINED_FUNCTION_32();
        v287 = COERCE_DOUBLE(OUTLINED_FUNCTION_81((uint64_t)v271, v180, v288));
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_0();

        v276 = v178;
        OUTLINED_FUNCTION_11();
        v181 = v261;
        v182 = (float *)v267;
        *(_WORD *)(v179 + 12) = 2080;
        OUTLINED_FUNCTION_83();
        v287 = COERCE_DOUBLE(sub_247438888(v263, v177, v288));
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_11();
        v183 = v265;
        *(_WORD *)(v179 + 22) = 2048;
        OUTLINED_FUNCTION_2();
        v287 = v182[4];
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v179 + 32) = 2080;
        OUTLINED_FUNCTION_2();
        if (*(_BYTE *)(v181 + 16))
          v185 = 0x657461676974694DLL;
        else
          v185 = 0x64657463656C6553;
        v186 = OUTLINED_FUNCTION_89(v185, v184, v288);
        OUTLINED_FUNCTION_42(v186);
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_27();
        *(_WORD *)(v179 + 42) = 2080;
        v187 = v249;
        OUTLINED_FUNCTION_2();
        if (*(_QWORD *)(v183 + 24))
          v188 = *v187;
        else
          v188 = 7104878;
        v224 = v262;
        swift_bridgeObjectRetain();
        v226 = OUTLINED_FUNCTION_89(v188, v225, v288);
        OUTLINED_FUNCTION_42(v226);
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_27();
        *(_WORD *)(v179 + 52) = 2048;
        OUTLINED_FUNCTION_2();
        v227 = *(float *)&v224[2].isa;
        if (BYTE4(v224[2].isa))
          v227 = 0.0;
        OUTLINED_FUNCTION_53(v227);
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v179 + 62) = 2048;
        OUTLINED_FUNCTION_2();
        v228 = *(float *)(v264 + 16);
        if (*(_BYTE *)(v264 + 20))
          v228 = 0.0;
        OUTLINED_FUNCTION_53(v228);
        OUTLINED_FUNCTION_7();
        _os_log_impl(&dword_247422000, *(os_log_t *)&v269, (os_log_type_t)v268, "NC result for candidate - %s, trpCandidateId %s. Score - %f, mitigationDecision - %s,\nAsset version used - %s, neuralCombinerThreshold - %f, speakerIDThreshold - %f", (uint8_t *)v179, 0x48u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      v216 = v157;
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
      v217 = v267;
      OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();

      OUTLINED_FUNCTION_0();
      (*((void (**)(NSObject *, NSObject *))isa + 1))(v175, v256);
      v218 = *(double *)&v247;
      v219 = v217;
      v229 = AFIsInternalInstall();
      v230 = v253;
      v231 = v243;
      if (v229 && (sub_247427824(*(void **)&v218) & 1) != 0 && LOBYTE(v258[10].isa) == 1)
      {
        swift_beginAccess();
        *v230 = 0;
        OUTLINED_FUNCTION_8();
        v232 = OUTLINED_FUNCTION_14();
        if (OUTLINED_FUNCTION_6(v232))
        {
          v233 = (uint8_t *)OUTLINED_FUNCTION_4();
          *(_WORD *)v233 = 0;
          _os_log_impl(&dword_247422000, v217, v231, "Bypass NC decision for FF", v233, 2u);
          OUTLINED_FUNCTION_1();
        }
        v237 = v241;
        v241 = v274;
        v274 = v242;
        v234 = v264;
        v238 = v178;

        v178 = v218;
        v218 = v237;
        v242 = v238;
        v219 = v267;
      }
      else
      {
        v234 = v264;
      }

      OUTLINED_FUNCTION_52();
      OUTLINED_FUNCTION_2();
      v235 = (int)v219[2].isa;
      OUTLINED_FUNCTION_2();
      LODWORD(v277) = *(unsigned __int8 *)(v261 + 16);
      OUTLINED_FUNCTION_2();
      v236 = *(_QWORD *)(v265 + 24);
      v276 = *(double *)(v265 + 16);
      OUTLINED_FUNCTION_2();
      LODWORD(v275) = v216[2].isa;
      LODWORD(v274) = BYTE4(v216[2].isa);
      OUTLINED_FUNCTION_2();
      v137 = *(_DWORD *)(v234 + 16);
      v139 = *(_BYTE *)(v234 + 20);
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_76();
      swift_release();
      swift_release();
      OUTLINED_FUNCTION_22();
      v138 = v260;
      *v260 = v235;
      *((_BYTE *)v138 + 4) = v277;
      *((double *)v138 + 1) = v276;
      *((_QWORD *)v138 + 2) = v236;
      v138[6] = LODWORD(v275);
      *((_BYTE *)v138 + 28) = LOBYTE(v274);
      goto LABEL_72;
    }
    v158 = v259;
    OUTLINED_FUNCTION_20();
    v269 = COERCE_DOUBLE(v246);
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_8();
    v159 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_9(v159))
    {
      v160 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(double *)&v272 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
      v288[0] = (uint64_t)v272;
      *(_DWORD *)v160 = 136315138;
      OUTLINED_FUNCTION_20();
      v287 = COERCE_DOUBLE(sub_247438888((uint64_t)v271, v158, v288));
      sub_247441B90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_66();
      _os_log_impl(v161, v162, v163, v164, v160, 0xCu);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_75();
    OUTLINED_FUNCTION_37();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_60();
    v214 = v247;
    __swift_project_boxed_opaque_existential_1(&v258[3].isa, (uint64_t)v258[6].isa);
    sub_247431600();
    sub_247427B84();
    OUTLINED_FUNCTION_36();
    *v215 = 1;
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_88();
    OUTLINED_FUNCTION_54();

    OUTLINED_FUNCTION_52();
    goto LABEL_66;
  }
  OUTLINED_FUNCTION_20();
  v165 = v75;
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_49();
  v166 = v273;
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_8();
  v167 = OUTLINED_FUNCTION_70();
  v168 = OUTLINED_FUNCTION_9(v167);
  v256 = v165;
  if (v168)
  {
    v169 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(double *)&v272 = COERCE_DOUBLE(OUTLINED_FUNCTION_4());
    aBlock = *(double *)&v272;
    isa = v169;
    *(_DWORD *)v169 = 136315138;
    OUTLINED_FUNCTION_20();
    v170 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_62(v170);
    sub_247441B90();
    OUTLINED_FUNCTION_85();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_37();

    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_66();
    _os_log_impl(v171, v172, v173, v174, isa, 0xCu);
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();

  OUTLINED_FUNCTION_60();
  v206 = v247;
  v207 = v258[9].isa;
  sub_247423E8C();
  v208 = v207[2];
  v209 = v207[3];
  v210 = v207[4];
  v211 = v207[5];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_48();
  sub_247424A38(v208, v209, v210, v211);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_37();
  if ((sub_247427824(v206) & 1) != 0)
    goto LABEL_64;
  aBlock = *(double *)&v271;
  v279[0] = v259;
  OUTLINED_FUNCTION_41();
  v282 = v270;
  v283 = v276;
  v284 = *(os_log_t *)&v269;
  v285 = v166;
  v286 = v268;
  sub_24742514C((uint64_t)&aBlock);
  if ((v212 & 1) != 0)
  {
LABEL_64:
    __swift_project_boxed_opaque_existential_1(&v258[3].isa, (uint64_t)v258[6].isa);
    sub_247431600();
    sub_247427B84();
    OUTLINED_FUNCTION_36();
    *v213 = 0;
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_61();

    OUTLINED_FUNCTION_52();
LABEL_66:
    v145 = v242;
LABEL_67:

    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_35();
    return;
  }
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_61();

  OUTLINED_FUNCTION_52();
  v137 = 0;
  v222 = 1065353216;
LABEL_71:
  v223 = v260;
  *v260 = v222;
  v138 = v223;
  *((_BYTE *)v223 + 4) = 0;
  *((_QWORD *)v223 + 1) = 0;
  *((_QWORD *)v223 + 2) = 0;
  v223[6] = 0;
  v139 = 1;
  *((_BYTE *)v223 + 28) = 1;
LABEL_72:
  v138[8] = v137;
  *((_BYTE *)v138 + 36) = v139;
}

uint64_t sub_2474275EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _DWORD *v12;
  unsigned __int8 *v13;
  BOOL v14;
  int v15;
  int v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t result;

  v12 = (_DWORD *)(a3 + 16);
  v13 = (unsigned __int8 *)(a4 + 16);
  v14 = a1 == 0;
  swift_beginAccess();
  *(_BYTE *)(a2 + 16) = v14;
  if (a1)
  {
    objc_msgSend(a1, sel_score);
    v16 = v15;
    swift_beginAccess();
    *v12 = v16;
    v17 = objc_msgSend(a1, sel_didMitigate);
  }
  else
  {
    swift_beginAccess();
    v17 = 0;
    *v12 = -1082130432;
  }
  swift_beginAccess();
  *v13 = v17;
  if (a1)
  {
    v18 = sub_247427C9C(a1);
    v20 = v19;
    swift_beginAccess();
    *(_QWORD *)(a5 + 16) = v18;
    *(_QWORD *)(a5 + 24) = v20;
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_threshold);
    v22 = v21;
  }
  else
  {
    swift_beginAccess();
    *(_QWORD *)(a5 + 16) = 0;
    *(_QWORD *)(a5 + 24) = 0;
    swift_bridgeObjectRelease();
    v22 = 0;
  }
  swift_beginAccess();
  *(_DWORD *)(a6 + 16) = v22;
  *(_BYTE *)(a6 + 20) = a1 == 0;
  if (a1)
  {
    objc_msgSend(a1, sel_speakerIDThreshold);
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  result = swift_beginAccess();
  *(_DWORD *)(a7 + 16) = v24;
  *(_BYTE *)(a7 + 20) = a1 == 0;
  return result;
}

void sub_2474277D0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_247427824(void *a1)
{
  id v2;
  void *v3;
  id v4;
  char v5;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, 3);
  v3 = v2;
  if (a1)
  {
    if (!v2)
    {
      v5 = 0;
      return v5 & 1;
    }
    sub_247427DC4(0, &qword_2576A3E68);
    v4 = a1;
    v5 = sub_247441B60();

  }
  else
  {
    if (!v2)
    {
      v5 = 1;
      return v5 & 1;
    }
    v5 = 0;
  }

  return v5 & 1;
}

uint64_t sub_2474278D4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return v0;
}

uint64_t sub_247427908()
{
  sub_2474278D4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NeuralCombiner()
{
  return objc_opt_self();
}

id sub_247427948(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)sub_2474419BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v8[0] = 0;
  v4 = objc_msgSend(v2, sel_initWithConfig_error_, v3, v8);

  if (v4)
  {
    v5 = v8[0];
  }
  else
  {
    v6 = v8[0];
    sub_24744159C();

    swift_willThrow();
  }
  return v4;
}

id sub_247427A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = (void *)sub_2474419BC();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      v7 = (void *)sub_2474419BC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_6:
  v12[0] = 0;
  v8 = objc_msgSend(v4, sel_initWithConfig_bnnsIrPath_error_, v6, v7, v12);

  if (v8)
  {
    v9 = v12[0];
  }
  else
  {
    v10 = v12[0];
    sub_24744159C();

    swift_willThrow();
  }
  return v8;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_247427B44()
{
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_247427B50()
{
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_247427B5C()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_63();
  return swift_deallocObject();
}

uint64_t sub_247427B78()
{
  return OUTLINED_FUNCTION_19();
}

unint64_t sub_247427B84()
{
  unint64_t result;

  result = qword_2576A3E70;
  if (!qword_2576A3E70)
  {
    result = MEMORY[0x24957ADDC](&unk_247442438, &type metadata for NCError);
    atomic_store(result, (unint64_t *)&qword_2576A3E70);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_247427BE4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247427C30(void *a1)
{
  uint64_t *v1;

  return sub_2474275EC(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957ADC4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247427C9C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_assetVersion);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2474419C8();

  return v3;
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

uint64_t sub_247427D1C()
{
  uint64_t v0;

  swift_release();

  OUTLINED_FUNCTION_63();
  return swift_deallocObject();
}

void sub_247427D40(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v5;

  sub_24742424C(a1, a2, a3, a4, a5, *(_QWORD **)(v5 + 16), *(NSObject **)(v5 + 24));
}

uint64_t sub_247427D48()
{
  swift_release();
  OUTLINED_FUNCTION_63();
  return swift_deallocObject();
}

uint64_t sub_247427D64()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_247427DC4(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for NeuralCombinerResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NeuralCombinerResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NeuralCombinerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NeuralCombinerResult(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v4;
  v5 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v5;
  return a1;
}

__n128 __swift_memcpy37_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 29) = *(_QWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NeuralCombinerResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  return a1;
}

uint64_t getEnumTagSinglePayload for NeuralCombinerResult(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 37))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for NeuralCombinerResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NeuralCombinerResult()
{
  return &type metadata for NeuralCombinerResult;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NCError(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 4) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for NCError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247428128 + 4 * byte_2474422FB[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24742815C + 4 * byte_2474422F6[v4]))();
}

uint64_t sub_24742815C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247428164(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24742816CLL);
  return result;
}

uint64_t sub_247428178(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247428180);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247428184(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742818C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247428198(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2474281A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NCError()
{
  return &type metadata for NCError;
}

unint64_t sub_2474281C0()
{
  unint64_t result;

  result = qword_2576A3E78;
  if (!qword_2576A3E78)
  {
    result = MEMORY[0x24957ADDC](&unk_247442410, &type metadata for NCError);
    atomic_store(result, (unint64_t *)&qword_2576A3E78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x24957AE54);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_2474418F0();
}

BOOL OUTLINED_FUNCTION_9(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_12(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_247441B18();
}

id OUTLINED_FUNCTION_15(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v0 + 320);
  *(_QWORD *)(v2 - 208) = v1;
  *(_QWORD *)(v2 - 200) = v3;
  v4 = *(_QWORD *)(v0 + 296);
  *(_QWORD *)(v2 - 192) = *(_QWORD *)(v0 + 264);
  *(_QWORD *)(v2 - 184) = v4;
  *(_BYTE *)(v2 - 176) = *(_DWORD *)(v0 + 256);
  sub_24742514C(v2 - 256);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_247438888(*(_QWORD *)(v0 + 280), v1, (uint64_t *)(v2 - 256));
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_247441B54();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_retain_n();
}

void OUTLINED_FUNCTION_34(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_247438888(*(_QWORD *)(v3 + 216), v4, a3);
}

void OUTLINED_FUNCTION_41()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v1 - 240) = v0[30];
  *(_QWORD *)(v1 - 232) = v2;
  v3 = v0[39];
  *(_QWORD *)(v1 - 224) = v0[38];
  *(_QWORD *)(v1 - 216) = v3;
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = a1;
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_2474418FC();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_47(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0x20u);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_51()
{
  uint64_t v0;

  *(_WORD *)(v0 + 22) = 2048;
}

void OUTLINED_FUNCTION_52()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_53(double a1)
{
  uint64_t v1;

  *(double *)(v1 - 144) = a1;
  return sub_247441B90();
}

void OUTLINED_FUNCTION_54()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_55()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 - 240) = *(_QWORD *)(v0 + 240);
  *(_QWORD *)(v1 - 232) = v2;
}

uint64_t OUTLINED_FUNCTION_56()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[20], v0[19]);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  unint64_t v4;
  va_list va;

  va_start(va, a4);
  return sub_247438888(a3, v4, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_2474418F0();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_247441B24();
}

BOOL OUTLINED_FUNCTION_71(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_72()
{
  uint64_t v0;

}

_WORD *OUTLINED_FUNCTION_73(_WORD *result)
{
  *result = 0;
  return result;
}

unint64_t OUTLINED_FUNCTION_74()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24743E210(v0, v1);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_81(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_247438888(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v0;

  return v0 - 256;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_2474418F0();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_247438888(a1, v3, a3);
}

uint64_t sub_2474285BC()
{
  uint64_t v0;

  v0 = sub_2474418FC();
  __swift_allocate_value_buffer(v0, qword_254447420);
  __swift_project_value_buffer(v0, (uint64_t)qword_254447420);
  sub_24742864C();
  sub_247441B6C();
  return sub_247441908();
}

unint64_t sub_24742864C()
{
  unint64_t result;

  result = qword_254446B98;
  if (!qword_254446B98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254446B98);
  }
  return result;
}

uint64_t sub_247428688(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_247428690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_247428698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

BOOL sub_2474286B0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2474286C0()
{
  return sub_247441D70();
}

uint64_t sub_2474286E4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x6449707274 && a2 == 0xE500000000000000;
  if (v3 || (sub_247441D10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746144756374 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_247441D10();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2474287C0()
{
  return 2;
}

uint64_t sub_2474287C8()
{
  sub_247441D64();
  sub_247441D70();
  return sub_247441D7C();
}

uint64_t sub_24742880C()
{
  return 0;
}

uint64_t sub_247428818(char a1)
{
  if ((a1 & 1) != 0)
    return 0x61746144756374;
  else
    return 0x6449707274;
}

BOOL sub_24742884C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2474286B0(*a1, *a2);
}

uint64_t sub_247428858()
{
  return sub_2474287C8();
}

uint64_t sub_247428860()
{
  return sub_2474286C0();
}

uint64_t sub_247428868()
{
  char *v0;

  return sub_247428818(*v0);
}

uint64_t sub_247428870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2474286E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247428894()
{
  return sub_24742880C();
}

uint64_t sub_2474288B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2474287C0();
  *a1 = result;
  return result;
}

uint64_t sub_2474288D4()
{
  sub_24742B510();
  return sub_247441DA0();
}

uint64_t sub_2474288FC()
{
  sub_24742B510();
  return sub_247441DAC();
}

void sub_247428924(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576A3EE0) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24742B510();
  sub_247441D94();
  sub_247441CD4();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3EF0);
    sub_24742B5C4(&qword_2576A3EF8, (uint64_t (*)(void))sub_24742B54C, MEMORY[0x24BEE12A0]);
    sub_247441CF8();
  }
  OUTLINED_FUNCTION_25_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_247428A60(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3F20);
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_0();
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24742B510();
  sub_247441D88();
  if (v1)
  {
    OUTLINED_FUNCTION_12_0();
  }
  else
  {
    v3 = sub_247441C98();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3EF0);
    sub_24742B5C4(&qword_2576A3F28, (uint64_t (*)(void))sub_24742B62C, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_247441CBC();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_83();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37();
  }
  return v3;
}

uint64_t sub_247428BF4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v3 = a1 == 0x6449756374 && a2 == 0xE500000000000000;
  if (v3 || (sub_247441D10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6353746C75736572 && a2 == 0xEB0000000065726FLL;
    if (v6 || (sub_247441D10() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x676974694D646964 && a2 == 0xEB00000000657461;
      if (v7 || (sub_247441D10() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x636E617265747475 && a2 == 0xE900000000000065;
        if (v8 || (sub_247441D10() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_247441D10();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_247428DF4()
{
  return 5;
}

uint64_t sub_247428DFC(char a1)
{
  return *(_QWORD *)&aTcuid_1[8 * a1];
}

uint64_t sub_247428E1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3F18);
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24742B588();
  sub_247441D94();
  sub_247441CD4();
  if (!v1)
  {
    sub_247441CEC();
    sub_247441CE0();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_18_0();
  }
  return OUTLINED_FUNCTION_25_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
}

uint64_t sub_247428F74@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576A3F08) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24742B588();
  sub_247441D88();
  if (v2)
    return OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_19_0();
  v6 = sub_247441C98();
  v8 = v7;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_19_0();
  sub_247441CB0();
  v10 = v9;
  OUTLINED_FUNCTION_19_0();
  v20 = sub_247441CA4();
  v18 = OUTLINED_FUNCTION_20_0();
  v19 = v11;
  swift_bridgeObjectRetain();
  v12 = OUTLINED_FUNCTION_20_0();
  v14 = v13;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v16 = v12;
  OUTLINED_FUNCTION_3_0(v15);
  OUTLINED_FUNCTION_83();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = OUTLINED_FUNCTION_10_0();
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_DWORD *)(a2 + 16) = v10;
  *(_BYTE *)(a2 + 20) = v20 & 1;
  *(_QWORD *)(a2 + 24) = v18;
  *(_QWORD *)(a2 + 32) = v19;
  *(_QWORD *)(a2 + 40) = v16;
  *(_QWORD *)(a2 + 48) = v14;
  return result;
}

uint64_t sub_24742919C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_247428A60(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

void sub_2474291C8(_QWORD *a1)
{
  sub_247428924(a1);
}

uint64_t sub_2474291E4()
{
  char *v0;

  return sub_247428DFC(*v0);
}

uint64_t sub_2474291EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247428BF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247429210@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_247428DF4();
  *a1 = result;
  return result;
}

uint64_t sub_247429234()
{
  sub_24742B588();
  return sub_247441DA0();
}

uint64_t sub_24742925C()
{
  sub_24742B588();
  return sub_247441DAC();
}

double sub_247429284@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  sub_247428F74(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_2474292D0(_QWORD *a1)
{
  return sub_247428E1C(a1);
}

BOOL sub_2474292E4()
{
  os_log_type_t v0;
  __CFString *v1;
  __CFString *v2;
  int AppBooleanValue;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  const char *v8;
  uint64_t v9;
  os_log_type_t v10;

  OUTLINED_FUNCTION_22_0();
  v1 = (__CFString *)sub_2474419BC();
  OUTLINED_FUNCTION_22_0();
  v2 = (__CFString *)sub_2474419BC();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v1, v2, 0);

  if (AppBooleanValue)
  {
    if (qword_254446B80 != -1)
      swift_once();
    v4 = sub_2474418FC();
    __swift_project_value_buffer(v4, (uint64_t)qword_254447420);
    v5 = sub_2474418F0();
    v6 = sub_247441B18();
    if (OUTLINED_FUNCTION_6(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_13();
      *(_WORD *)v7 = 0;
      v8 = "MHLogger - com.apple.voicetrigger 'AttentiveSiri AudioLogging Enabled' is enabled";
LABEL_10:
      _os_log_impl(&dword_247422000, v5, v0, v8, v7, 2u);
      MEMORY[0x24957AE54](v7, -1, -1);
    }
  }
  else
  {
    if (qword_254446B80 != -1)
      swift_once();
    v9 = sub_2474418FC();
    __swift_project_value_buffer(v9, (uint64_t)qword_254447420);
    v5 = sub_2474418F0();
    v10 = sub_247441B18();
    if (OUTLINED_FUNCTION_6(v10))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_13();
      *(_WORD *)v7 = 0;
      v8 = "MHLogger - com.apple.voicetrigger 'AttentiveSiri AudioLogging Enabled' is not set/present";
      goto LABEL_10;
    }
  }

  return AppBooleanValue != 0;
}

uint64_t sub_24742946C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v8 = OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_0();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3EB8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3EC0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_247442480;
  v15 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
  v16 = sub_24742B0BC();
  *(_QWORD *)(v14 + 64) = v16;
  *(_QWORD *)(v14 + 32) = a1;
  *(_QWORD *)(v14 + 40) = a2;
  v17 = objc_allocWithZone(MEMORY[0x24BDBCE60]);
  OUTLINED_FUNCTION_83();
  v18 = objc_msgSend(v17, sel_init);
  objc_msgSend(v18, sel_timeIntervalSince1970);
  v20 = v19;

  if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v21 = sub_247441D04();
  *(_QWORD *)(v14 + 96) = v15;
  *(_QWORD *)(v14 + 104) = v16;
  *(_QWORD *)(v14 + 72) = v21;
  *(_QWORD *)(v14 + 80) = v22;
  OUTLINED_FUNCTION_22_0();
  sub_2474419E0();
  sub_247427DC4(0, &qword_2576A3ED0);
  OUTLINED_FUNCTION_22_0();
  v23 = sub_2474296FC();
  v24 = (void *)sub_2474419BC();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v23, sel_URLByAppendingPathComponent_, v24);

  if (!v25)
  {
LABEL_10:
    result = OUTLINED_FUNCTION_24_0(v3, 1);
    goto LABEL_11;
  }
  sub_2474415B4();

  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v26(v3, v12, v8);
  OUTLINED_FUNCTION_24_0(v3, 0);
  result = __swift_getEnumTagSinglePayload(v3, 1, v8);
  if ((_DWORD)result != 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v26)(a3, v3, v8);
LABEL_11:
  __break(1u);
  return result;
}

id sub_2474296FC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2474419BC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initFileURLWithPath_, v1);

  return v2;
}

uint64_t sub_24742976C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t v6;
  uint64_t (*v7)(uint64_t);
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;

  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v37 = (unint64_t)(v2 + 63) >> 6;
  v38 = OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE4AF8];
  while (1)
  {
    v43 = (uint64_t)v7;
    if (v4)
    {
      v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v9 = v8 | (v6 << 6);
      goto LABEL_20;
    }
    v10 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v10 >= v37)
      goto LABEL_38;
    v11 = *(_QWORD *)(v36 + 8 * v10);
    ++v6;
    if (!v11)
    {
      v6 = v10 + 1;
      if (v10 + 1 >= v37)
        goto LABEL_38;
      v11 = *(_QWORD *)(v36 + 8 * v6);
      if (!v11)
      {
        v6 = v10 + 2;
        if (v10 + 2 >= v37)
          goto LABEL_38;
        v11 = *(_QWORD *)(v36 + 8 * v6);
        if (!v11)
          break;
      }
    }
LABEL_19:
    v4 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v6 << 6);
LABEL_20:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v15 = *v13;
    v14 = v13[1];
    v16 = *(_QWORD *)(a1 + 56) + 40 * v9;
    v17 = *(_DWORD *)v16;
    v18 = *(unsigned __int8 *)(v16 + 4);
    v19 = *(_QWORD *)(v16 + 16);
    v41 = *(_QWORD *)(v16 + 8);
    v42 = v6;
    v20 = *(_QWORD *)(a2 + v38);
    v21 = *(_QWORD *)(v20 + 16);
    if (v21)
    {
      v22 = (uint64_t *)(v20 + 104);
      while (1)
      {
        v23 = *(v22 - 1);
        v24 = *v22;
        v25 = *(v22 - 9) == v15 && *(v22 - 8) == v14;
        if (v25 || (sub_247441D10() & 1) != 0)
          break;
        v22 += 11;
        if (!--v21)
          goto LABEL_28;
      }
      swift_bridgeObjectRetain();
      v21 = v24;
    }
    else
    {
LABEL_28:
      v23 = 0;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v18 == 1)
      v26 = 1;
    else
      v26 = sub_247441D10();
    swift_bridgeObjectRelease();
    v27 = v43;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_24742A6E8(0, *(_QWORD *)(v43 + 16) + 1, 1, v43);
      v27 = result;
    }
    v29 = *(_QWORD *)(v27 + 16);
    v28 = *(_QWORD *)(v27 + 24);
    v30 = v27;
    if (v29 >= v28 >> 1)
    {
      result = (uint64_t)sub_24742A6E8((char *)(v28 > 1), v29 + 1, 1, v27);
      v30 = result;
    }
    *(_QWORD *)(v30 + 16) = v29 + 1;
    v7 = (uint64_t (*)(uint64_t))v30;
    v31 = v30 + 56 * v29;
    *(_QWORD *)(v31 + 32) = v15;
    *(_QWORD *)(v31 + 40) = v14;
    *(_DWORD *)(v31 + 48) = v17;
    *(_BYTE *)(v31 + 52) = v26 & 1;
    *(_QWORD *)(v31 + 56) = v23;
    *(_QWORD *)(v31 + 64) = v21;
    v6 = v42;
    *(_QWORD *)(v31 + 72) = v41;
    *(_QWORD *)(v31 + 80) = v19;
  }
  v12 = v10 + 3;
  if (v12 >= v37)
  {
LABEL_38:
    swift_release();
    v32 = *(_QWORD *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId);
    v33 = *(_QWORD *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId + 8);
    v34 = *(_QWORD *)(a2 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId);
    v35 = *(void (**)(uint64_t, uint64_t))(a2
                                                  + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId
                                                  + 8);
    swift_bridgeObjectRetain();
    sub_247429B0C(v32, v33, v7, v34, v35);
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_10_0();
  }
  v11 = *(_QWORD *)(v36 + 8 * v12);
  if (v11)
  {
    v6 = v12;
    goto LABEL_19;
  }
  while (1)
  {
    v6 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v6 >= v37)
      goto LABEL_38;
    v11 = *(_QWORD *)(v36 + 8 * v6);
    ++v12;
    if (v11)
      goto LABEL_19;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_247429B0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t a1), unint64_t a4, void (*a5)(uint64_t, uint64_t))
{
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
  char *v21;
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
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(uint64_t, uint64_t);
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
  uint64_t (*v65)(uint64_t);
  uint64_t aBlock;
  uint64_t v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  uint64_t (*v70)();
  uint64_t v71;
  uint64_t v72;

  v53 = a4;
  v54 = a5;
  v64 = a2;
  v65 = a3;
  v63 = a1;
  v6 = sub_24744192C();
  v61 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_23_0();
  v60 = v8;
  v9 = sub_247441950();
  v58 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_23_0();
  v57 = v11;
  v12 = sub_247441938();
  v55 = *(_QWORD *)(v12 - 8);
  v56 = v12;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_0();
  v16 = v15 - v14;
  v17 = sub_2474415CC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v62 = (uint64_t)&v49 - v22;
  sub_2474419F8();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_0_0();
  sub_247441560();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0_0();
  if (sub_2474292E4())
  {
    v51 = v17;
    v52 = v6;
    sub_247441590();
    swift_allocObject();
    v25 = sub_247441584();
    sub_247441554();
    sub_24744156C();
    aBlock = v63;
    v67 = v64;
    v68 = v65;
    sub_24742A4F0();
    v26 = sub_247441578();
    if (!v5)
    {
      v28 = v26;
      v29 = v27;
      v65 = (uint64_t (*)(uint64_t))v25;
      sub_2474419EC();
      v30 = sub_2474419D4();
      v32 = v28;
      if (v31)
      {
        v33 = v31;
        v49 = v30;
        v63 = v32;
        sub_24742946C(v53, (uint64_t)v54, v62);
        v64 = 0;
        sub_2474415A8();
        sub_2474415C0();
        swift_bridgeObjectRelease();
        v34 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        v53 = v29;
        v54 = v34;
        v35 = v51;
        v34((uint64_t)v21, v51);
        sub_247427DC4(0, &qword_2576A3E88);
        v37 = v55;
        v36 = v56;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v55 + 104))(v16, *MEMORY[0x24BEE5490], v56);
        v50 = sub_247441B48();
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v16, v36);
        v38 = v62;
        (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v62, v35);
        v39 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
        v40 = swift_allocObject();
        *(_QWORD *)(v40 + 16) = v49;
        *(_QWORD *)(v40 + 24) = v33;
        (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v40 + v39, v21, v35);
        v70 = sub_24742A5E0;
        v71 = v40;
        aBlock = MEMORY[0x24BDAC760];
        v67 = 1107296256;
        v68 = sub_24742A494;
        v69 = &block_descriptor_0;
        v41 = _Block_copy(&aBlock);
        v42 = v57;
        sub_247441944();
        v72 = MEMORY[0x24BEE4AF8];
        sub_24742B07C(&qword_2576A3E90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3E98);
        sub_24742A624();
        v43 = v60;
        sub_247441BD8();
        v44 = (void *)v50;
        MEMORY[0x24957A818](0, v42, v43, v41);
        _Block_release(v41);

        sub_24742A52C(v63, v53);
        swift_release();
        OUTLINED_FUNCTION_25_0(v43, *(uint64_t (**)(uint64_t, uint64_t))(v61 + 8));
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v42, v59);
        v54(v38, v35);
      }
      else
      {
        if (qword_254446B80 != -1)
          swift_once();
        v45 = sub_2474418FC();
        __swift_project_value_buffer(v45, (uint64_t)qword_254447420);
        v46 = sub_2474418F0();
        v47 = sub_247441B24();
        if (os_log_type_enabled(v46, v47))
        {
          v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_247422000, v46, v47, "error serializing ncData to json string", v48, 2u);
          MEMORY[0x24957AE54](v48, -1, -1);
        }
        sub_24742A52C(v28, v29);

      }
    }
    swift_release();
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_24742A02C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v25[4];
  int v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v32 = a1;
  v33 = a3;
  v4 = sub_2474419F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_2474415CC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_254446B80 != -1)
    swift_once();
  v12 = sub_2474418FC();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_254447420);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, v33, v8);
  swift_bridgeObjectRetain_n();
  v31 = v13;
  v14 = sub_2474418F0();
  v15 = sub_247441B18();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v30 = v4;
    v18 = v17;
    v27 = swift_slowAlloc();
    v35[0] = v27;
    *(_DWORD *)v18 = 136315394;
    swift_bridgeObjectRetain();
    v26 = v16;
    v19 = v32;
    v34 = sub_247438888(v32, a2, v35);
    v29 = v5;
    sub_247441B90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    v28 = v7;
    sub_24742B07C(&qword_2576A3EB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v20 = sub_247441D04();
    v34 = sub_247438888(v20, v21, v35);
    v7 = v28;
    v5 = v29;
    sub_247441B90();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_247422000, v14, (os_log_type_t)v26, "writing to file with json %s at %s", (uint8_t *)v18, 0x16u);
    v22 = v27;
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v22, -1, -1);
    v23 = v18;
    v4 = v30;
    MEMORY[0x24957AE54](v23, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);

    v19 = v32;
  }
  v35[0] = v19;
  v35[1] = a2;
  sub_2474419EC();
  sub_24742A6AC();
  sub_247441BB4();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_24742A494(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24742A4C0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MHLogger()
{
  return objc_opt_self();
}

unint64_t sub_24742A4F0()
{
  unint64_t result;

  result = qword_2576A3E80;
  if (!qword_2576A3E80)
  {
    result = MEMORY[0x24957ADDC](&unk_247442598, &type metadata for NCData);
    atomic_store(result, (unint64_t *)&qword_2576A3E80);
  }
  return result;
}

uint64_t sub_24742A52C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24742A570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_28_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24742A5E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_28_0() - 8) + 80);
  return sub_24742A02C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
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

unint64_t sub_24742A624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A3EA0;
  if (!qword_2576A3EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A3E98);
    result = MEMORY[0x24957ADDC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2576A3EA0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957ADD0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24742A6AC()
{
  unint64_t result;

  result = qword_2576A3EA8;
  if (!qword_2576A3EA8)
  {
    result = MEMORY[0x24957ADDC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A3EA8);
  }
  return result;
}

char *sub_24742A6E8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3ED8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_24742AE54((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24742A9BC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void sub_24742A7DC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_16_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_0();
    }
  }
  OUTLINED_FUNCTION_14_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544473B0);
    v11 = (_QWORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2_0(v11);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_24742AEE0((char *)(a4 + 32), v4, (char *)(v5 + 32));
    OUTLINED_FUNCTION_8_0();
  }
  else
  {
    v12 = OUTLINED_FUNCTION_21_0();
    sub_24742AABC(v12, v13, v14, v15);
  }
  OUTLINED_FUNCTION_6_0();
}

void sub_24742A87C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_16_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_0();
    }
  }
  OUTLINED_FUNCTION_14_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447370);
    v11 = (_QWORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2_0(v11);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_24742AF6C((char *)(a4 + 32), v4, (char *)(v5 + 32));
    OUTLINED_FUNCTION_8_0();
  }
  else
  {
    v12 = OUTLINED_FUNCTION_21_0();
    sub_24742ABD8(v12, v13, v14, v15);
  }
  OUTLINED_FUNCTION_6_0();
}

void sub_24742A91C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_16_0();
    if (v9 != v10)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_15_0();
    }
  }
  OUTLINED_FUNCTION_14_0();
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447378);
    v11 = (_QWORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_2_0(v11);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_24742AFF4((char *)(a4 + 32), v4, (char *)(v5 + 32));
    OUTLINED_FUNCTION_8_0();
  }
  else
  {
    v12 = OUTLINED_FUNCTION_21_0();
    sub_24742ACD4(v12, v13, v14, v15);
  }
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_24742A9BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_247441C74();
  __break(1u);
  return result;
}

uint64_t sub_24742AABC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254447390);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_247441C74();
  __break(1u);
  return result;
}

uint64_t sub_24742ABD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_247441C74();
  __break(1u);
  return result;
}

uint64_t sub_24742ACD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_247441C74();
  __break(1u);
  return result;
}

char *sub_24742ADD0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_24742AE54(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

char *sub_24742AEE0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_24742AF6C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_24742AFF4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_24742B07C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957ADDC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24742B0BC()
{
  unint64_t result;

  result = qword_2576A3EC8;
  if (!qword_2576A3EC8)
  {
    result = MEMORY[0x24957ADDC](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A3EC8);
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

uint64_t destroy for NCTCUData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NCTCUData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NCTCUData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NCTCUData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NCTCUData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for NCTCUData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NCTCUData()
{
  return &type metadata for NCTCUData;
}

uint64_t destroy for NCData()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s21SiriTurnTakingManager6NCDataVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_83();
  return a1;
}

_QWORD *assignWithCopy for NCData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for NCData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NCData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NCData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NCData()
{
  return &type metadata for NCData;
}

unint64_t sub_24742B510()
{
  unint64_t result;

  result = qword_2576A3EE8;
  if (!qword_2576A3EE8)
  {
    result = MEMORY[0x24957ADDC](&unk_24744278C, &type metadata for NCData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3EE8);
  }
  return result;
}

unint64_t sub_24742B54C()
{
  unint64_t result;

  result = qword_2576A3F00;
  if (!qword_2576A3F00)
  {
    result = MEMORY[0x24957ADDC](&unk_247442548, &type metadata for NCTCUData);
    atomic_store(result, (unint64_t *)&qword_2576A3F00);
  }
  return result;
}

unint64_t sub_24742B588()
{
  unint64_t result;

  result = qword_2576A3F10;
  if (!qword_2576A3F10)
  {
    result = MEMORY[0x24957ADDC](&unk_24744273C, &type metadata for NCTCUData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F10);
  }
  return result;
}

uint64_t sub_24742B5C4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A3EF0);
    v8 = a2();
    result = MEMORY[0x24957ADDC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24742B62C()
{
  unint64_t result;

  result = qword_2576A3F30;
  if (!qword_2576A3F30)
  {
    result = MEMORY[0x24957ADDC](&unk_247442570, &type metadata for NCTCUData);
    atomic_store(result, (unint64_t *)&qword_2576A3F30);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for NCTCUData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24742B6B4 + 4 * byte_2474424A5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24742B6E8 + 4 * byte_2474424A0[v4]))();
}

uint64_t sub_24742B6E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742B6F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24742B6F8);
  return result;
}

uint64_t sub_24742B704(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24742B70CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24742B710(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742B718(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NCTCUData.CodingKeys()
{
  return &type metadata for NCTCUData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for NCData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NCData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24742B808 + 4 * byte_2474424AF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24742B83C + 4 * byte_2474424AA[v4]))();
}

uint64_t sub_24742B83C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742B844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24742B84CLL);
  return result;
}

uint64_t sub_24742B858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24742B860);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24742B864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742B86C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24742B878(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NCData.CodingKeys()
{
  return &type metadata for NCData.CodingKeys;
}

unint64_t sub_24742B898()
{
  unint64_t result;

  result = qword_2576A3F38;
  if (!qword_2576A3F38)
  {
    result = MEMORY[0x24957ADDC](&unk_24744265C, &type metadata for NCData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F38);
  }
  return result;
}

unint64_t sub_24742B8D8()
{
  unint64_t result;

  result = qword_2576A3F40;
  if (!qword_2576A3F40)
  {
    result = MEMORY[0x24957ADDC](&unk_247442714, &type metadata for NCTCUData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F40);
  }
  return result;
}

unint64_t sub_24742B918()
{
  unint64_t result;

  result = qword_2576A3F48;
  if (!qword_2576A3F48)
  {
    result = MEMORY[0x24957ADDC](&unk_247442684, &type metadata for NCTCUData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F48);
  }
  return result;
}

unint64_t sub_24742B958()
{
  unint64_t result;

  result = qword_2576A3F50;
  if (!qword_2576A3F50)
  {
    result = MEMORY[0x24957ADDC](&unk_2474426AC, &type metadata for NCTCUData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F50);
  }
  return result;
}

unint64_t sub_24742B998()
{
  unint64_t result;

  result = qword_2576A3F58;
  if (!qword_2576A3F58)
  {
    result = MEMORY[0x24957ADDC](&unk_2474425CC, &type metadata for NCData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F58);
  }
  return result;
}

unint64_t sub_24742B9D8()
{
  unint64_t result;

  result = qword_2576A3F60;
  if (!qword_2576A3F60)
  {
    result = MEMORY[0x24957ADDC](&unk_2474425F4, &type metadata for NCData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A3F60);
  }
  return result;
}

size_t OUTLINED_FUNCTION_2_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  size_t result;

  result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / v2);
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_247441CC8();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_247441C8C();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_2474415CC();
}

BOOL static TTClientError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TTClientError.hash(into:)()
{
  return sub_247441D70();
}

uint64_t TTClientError.hashValue.getter()
{
  sub_247441D64();
  sub_247441D70();
  return sub_247441D7C();
}

unint64_t sub_24742BC28()
{
  unint64_t result;

  result = qword_2576A3F68;
  if (!qword_2576A3F68)
  {
    result = MEMORY[0x24957ADDC](&protocol conformance descriptor for TTClientError, &type metadata for TTClientError);
    atomic_store(result, (unint64_t *)&qword_2576A3F68);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TTClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24742BCB0 + 4 * byte_247442835[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24742BCE4 + 4 * byte_247442830[v4]))();
}

uint64_t sub_24742BCE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742BCEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24742BCF4);
  return result;
}

uint64_t sub_24742BD00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24742BD08);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24742BD0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742BD14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTClientError()
{
  return &type metadata for TTClientError;
}

uint64_t sub_24742BD30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24742BD48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24742BD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_24742BD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_24742BD60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24742BD68(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24742BD8C(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_24742BDD4(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_24742BF90(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24742BFD0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_24742C010(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TTMOverridesExecutor()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t sub_24742C068(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24742C0A4 + 4 * byte_247442930[a1]))(0xD000000000000012, 0x8000000247443860);
}

uint64_t sub_24742C0A4()
{
  return 0x74756374726F6873;
}

uint64_t sub_24742C11C()
{
  unint64_t v0;

  v0 = sub_247441C80();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_24742C164(char a1)
{
  return *(_QWORD *)&aMitigatedonotm[8 * a1];
}

void sub_24742C184()
{
  sub_24743FD5C();
}

uint64_t sub_24742C190()
{
  return sub_2474361D4();
}

uint64_t sub_24742C198()
{
  return sub_24743634C();
}

uint64_t sub_24742C1A0()
{
  return sub_247436388();
}

uint64_t sub_24742C1A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24742C11C();
  *a1 = result;
  return result;
}

uint64_t sub_24742C1D4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24742C164(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24742C1FC()
{
  uint64_t v0;
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  objc_class *v9;
  id v10;
  unint64_t v11;
  char v12;
  objc_class *v13;
  id v14;
  unint64_t v15;
  objc_class *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _UNKNOWN **v33;

  v1 = (objc_class *)type metadata accessor for ShortcutMatcher();
  v2 = OUTLINED_FUNCTION_9_1(v1);
  v3 = OUTLINED_FUNCTION_14_1(v2);
  sub_24742A7DC(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v5 = v4;
  v7 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v8 = v7 + 1;
  if (v7 >= v6 >> 1)
  {
    OUTLINED_FUNCTION_1_1(v6);
    v5 = v23;
  }
  v32 = v0;
  v33 = &off_2518A1FC0;
  *(_QWORD *)&v30 = v3;
  *(_QWORD *)(v5 + 16) = v8;
  sub_24742D41C(&v30, v5 + 40 * v7 + 32);
  v9 = (objc_class *)type metadata accessor for LASOverrideMatcher();
  v10 = OUTLINED_FUNCTION_9_1(v9);
  OUTLINED_FUNCTION_14_1(v10);
  OUTLINED_FUNCTION_25_1();
  if (v12)
  {
    OUTLINED_FUNCTION_1_1(v11);
    v5 = v24;
  }
  v32 = v0;
  v33 = &off_2518A2D88;
  *(_QWORD *)&v30 = v3;
  *(_QWORD *)(v5 + 16) = v8;
  sub_24742D41C(&v30, v5 + 40 * v7 + 32);
  v13 = (objc_class *)type metadata accessor for UniversalCommandMatcher();
  v14 = OUTLINED_FUNCTION_9_1(v13);
  OUTLINED_FUNCTION_14_1(v14);
  OUTLINED_FUNCTION_25_1();
  if (v12)
  {
    OUTLINED_FUNCTION_1_1(v15);
    v5 = v25;
  }
  v32 = v0;
  v33 = &off_2518A2D68;
  *(_QWORD *)&v30 = v3;
  *(_QWORD *)(v5 + 16) = v8;
  sub_24742D41C(&v30, v5 + 40 * v7 + 32);
  v16 = (objc_class *)type metadata accessor for AllowListMatcher();
  v17 = OUTLINED_FUNCTION_9_1(v16);
  OUTLINED_FUNCTION_14_1(v17);
  v18 = *(_QWORD *)(v5 + 24);
  if (*(_QWORD *)(v5 + 16) >= v18 >> 1)
  {
    OUTLINED_FUNCTION_1_1(v18);
    v5 = v26;
  }
  OUTLINED_FUNCTION_3_1((uint64_t)&off_2518A2050, v28, v30, v31, v32, (uint64_t)v33);
  type metadata accessor for AnnounceMatcher();
  v19 = swift_allocObject() + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache;
  v20 = sub_24744162C();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  v21 = *(_QWORD *)(v5 + 24);
  if (*(_QWORD *)(v5 + 16) >= v21 >> 1)
  {
    OUTLINED_FUNCTION_1_1(v21);
    v5 = v27;
  }
  OUTLINED_FUNCTION_3_1((uint64_t)&off_2518A23B8, v29, v30, v31, v32, (uint64_t)v33);
  return v5;
}

uint64_t sub_24742C3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  char v47;
  uint64_t v48;
  _QWORD v49[2];
  char v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;

  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  v43 = a2;
  v44 = a3;
  v45 = a4;
  sub_247431AC0();
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    OUTLINED_FUNCTION_46();
    v10 = 0;
    v11 = 0;
    v12 = (_QWORD *)MEMORY[0x24BEE4B00];
    v40 = v9;
    v41 = a1;
    while (1)
    {
      v13 = a1 + v10;
      v14 = *(_QWORD *)(a1 + v10 + 32);
      v15 = *(_QWORD *)(a1 + v10 + 40);
      v16 = *(_BYTE *)(a1 + v10 + 48);
      v17 = *(_QWORD *)(a1 + v10 + 56);
      v18 = *(void **)(a1 + v10 + 64);
      v19 = *(_QWORD *)(a1 + v10 + 72);
      v20 = *(_QWORD *)(a1 + v10 + 80);
      v21 = *(_QWORD *)(a1 + v10 + 88);
      v22 = *(_QWORD *)(a1 + v10 + 96);
      v23 = *(_QWORD *)(a1 + v10 + 104);
      LOBYTE(v13) = *(_BYTE *)(v13 + 112);
      v48 = v14;
      v49[0] = v14;
      v49[1] = v15;
      v50 = v16;
      v51 = v17;
      v52 = v18;
      v53 = v19;
      v54 = v20;
      v55 = v21;
      v56 = v22;
      v57 = v23;
      v58 = v13;
      v46 = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_20();
      v47 = sub_24742C6F4((uint64_t)v49, v43, v44, v45);
      v25 = v24;
      if ((v11 & 1) != 0)
        OUTLINED_FUNCTION_85();
      v26 = v25;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_20();
      swift_isUniquelyReferenced_nonNull_native();
      v49[0] = v12;
      v27 = sub_24743E210(v48, v15);
      if (__OFADD__(v12[2], (v28 & 1) == 0))
        break;
      v29 = v27;
      v30 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254447368);
      if ((sub_247441C44() & 1) != 0)
      {
        v31 = sub_24743E210(v48, v15);
        if ((v30 & 1) != (v32 & 1))
          goto LABEL_21;
        v29 = v31;
      }
      v12 = (_QWORD *)v49[0];
      if ((v30 & 1) != 0)
      {
        v33 = *(_QWORD *)(v49[0] + 56) + 16 * v29;
        swift_bridgeObjectRelease();
        *(_BYTE *)v33 = v47;
        *(_QWORD *)(v33 + 8) = v26;
      }
      else
      {
        *(_QWORD *)(v49[0] + 8 * (v29 >> 6) + 64) |= 1 << v29;
        v34 = (uint64_t *)(v12[6] + 16 * v29);
        *v34 = v48;
        v34[1] = v15;
        v35 = v12[7] + 16 * v29;
        *(_BYTE *)v35 = v47;
        *(_QWORD *)(v35 + 8) = v25;
        v36 = v12[2];
        v37 = __OFADD__(v36, 1);
        v38 = v36 + 1;
        if (v37)
          goto LABEL_20;
        v12[2] = v38;
        OUTLINED_FUNCTION_20();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v10 += 88;
      v11 = 1;
      --v9;
      a1 = v41;
      if (!v9)
      {
        swift_bridgeObjectRelease();
        v9 = v40;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    result = sub_247441D28();
    __break(1u);
  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_16:
    __swift_project_boxed_opaque_existential_1(v42, v42[3]);
    swift_bridgeObjectRetain();
    sub_247432828();
    OUTLINED_FUNCTION_37();
    if (v9)
      swift_bridgeObjectRelease();
    return (uint64_t)v12;
  }
  return result;
}

uint64_t sub_24742C6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  os_log_type_t v29;
  _DWORD *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  char v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  int v62;
  char v63;
  int v64;
  int v65;
  char *v66;
  char *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  _QWORD v79[4];
  __int128 v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  const char *v87;
  char *v88;
  __int128 v89;
  char *v90;
  uint64_t v91;
  int v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  unint64_t v103;
  uint64_t v104;
  int v105;
  NSObject *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  _BYTE v112[32];
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;

  v84 = a4;
  v83 = a3;
  v82 = a2;
  v5 = sub_2474418FC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v88 = (char *)v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v79 - v9;
  v11 = *(_QWORD *)(a1 + 8);
  v104 = *(_QWORD *)a1;
  v97 = *(unsigned __int8 *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 72);
  v99 = *(_QWORD *)(a1 + 64);
  v92 = *(unsigned __int8 *)(a1 + 80);
  if (qword_254446B80 != -1)
    swift_once();
  v91 = v5;
  v18 = __swift_project_value_buffer(v5, (uint64_t)qword_254447420);
  v96 = v13;
  v108 = v13;
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_46();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v106 = v18;
  sub_2474418F0();
  v19 = OUTLINED_FUNCTION_14();
  LODWORD(v107) = v19;
  v20 = os_log_type_enabled(v18, v19);
  v21 = (char *)&loc_247442000;
  v22 = MEMORY[0x24BEE4AD8];
  v98 = v6;
  v102 = v10;
  v100 = v15;
  v93 = v17;
  v95 = v14;
  v94 = v16;
  if (v20)
  {
    v23 = OUTLINED_FUNCTION_4();
    *(_QWORD *)&v111 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v23 = 136315394;
    swift_bridgeObjectRetain();
    v119 = sub_247438888(v104, v11, (uint64_t *)&v111);
    sub_247441B90();
    OUTLINED_FUNCTION_85();
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    v119 = sub_247438888(v99, v17, (uint64_t *)&v111);
    sub_247441B90();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_85();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247422000, v18, (os_log_type_t)v107, "processing overrides on tcu candidate with id -%s and utterance - %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_37();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_85();
  v24 = v85[5];
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
LABEL_44:
    v75 = OUTLINED_FUNCTION_4_1();
    v76 = sub_247441B18();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v77 = 0;
      _os_log_impl(&dword_247422000, v75, v76, "OverridesContainer returned a result of donot Override", v77, 2u);
      OUTLINED_FUNCTION_1();
    }

    return 2;
  }
  v103 = v11;
  v26 = v24 + 32;
  v81 = &v110;
  v79[0] = v24;
  swift_bridgeObjectRetain();
  v101 = 0;
  v105 = 0;
  v108 = 0;
  v90 = (char *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v27 = 136315138;
  v89 = v27;
  v87 = "allowListMatcher";
  v86 = v22 + 8;
  v79[3] = "universalCommandMatcher";
  v79[2] = "reservedForTests";
  v79[1] = "com.apple.voicetrigger";
  *(_QWORD *)&v27 = 136315394;
  v80 = v27;
  v28 = v91;
  do
  {
    v107 = v25;
    sub_24742D3D8(v26, (uint64_t)&v119);
    v118 = 2;
    OUTLINED_FUNCTION_11_0((uint64_t)v10);
    OUTLINED_FUNCTION_6_1();
    sub_2474418F0();
    v29 = OUTLINED_FUNCTION_28_1();
    if (os_log_type_enabled((os_log_t)v21, v29))
    {
      v30 = (_DWORD *)OUTLINED_FUNCTION_4();
      v110 = OUTLINED_FUNCTION_4();
      *v30 = v89;
      v31 = *(_QWORD *)&v112[8];
      v32 = *(_QWORD *)&v112[16];
      __swift_project_boxed_opaque_existential_1(&v111, *(uint64_t *)&v112[8]);
      v33 = (char *)&loc_24742CBC4
          + 4 * byte_247442936[(*(unsigned __int8 (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32)];
      __asm { BR              X9 }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v111);

    v34 = *(void (**)(char *, uint64_t))(v6 + 8);
    v34(v10, v28);
    v35 = v120;
    v21 = v121;
    v36 = __swift_project_boxed_opaque_existential_1(&v119, v120);
    *(_QWORD *)&v111 = v104;
    *((_QWORD *)&v111 + 1) = v103;
    v112[0] = v97;
    *(_QWORD *)&v112[8] = v12;
    *(_QWORD *)&v112[16] = v96;
    *(_QWORD *)&v112[24] = v95;
    v113 = v94;
    v114 = v100;
    v115 = v99;
    v116 = v93;
    v117 = v92;
    v37 = v108;
    v38 = (*((uint64_t (**)(__int128 *, uint64_t, char *))v21 + 1))(&v111, v35, v21);
    if (v37)
    {
      if ((v101 & 1) != 0)
      {

        OUTLINED_FUNCTION_12_1();
        goto LABEL_23;
      }
      v36 = (_QWORD *)*__swift_project_boxed_opaque_existential_1(v85, v85[3]);
      sub_247432CC4();
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_4_1();
      v54 = OUTLINED_FUNCTION_28_1();
      if (OUTLINED_FUNCTION_10_1(v54))
      {
        v55 = (uint8_t *)OUTLINED_FUNCTION_4();
        v110 = OUTLINED_FUNCTION_4();
        *(_DWORD *)v55 = v89;
        v108 = v37;
        v57 = *(_QWORD *)&v112[8];
        v56 = *(_QWORD *)&v112[16];
        __swift_project_boxed_opaque_existential_1(&v111, *(uint64_t *)&v112[8]);
        v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 16))(v57, v56);
        v59 = sub_24742C068(v58);
        v61 = OUTLINED_FUNCTION_27_0(v59, v60);
        OUTLINED_FUNCTION_19_1(v61);
        sub_247441B90();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_1();
        _os_log_impl(&dword_247422000, (os_log_t)v21, (os_log_type_t)v10, "%s resulted in error", v55, 0xCu);
        v101 = 1;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_13_1();

      OUTLINED_FUNCTION_12_1();
    }
    else
    {
      v39 = v38;
      v108 = 0;
      swift_beginAccess();
      v118 = v39;
      OUTLINED_FUNCTION_6_1();
      v112[24] = v39;
      v21 = v90;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_24_1(0, *((_QWORD *)v21 + 2) + 1);
        v21 = v66;
      }
      v40 = (uint64_t)v88;
      v42 = *((_QWORD *)v21 + 2);
      v41 = *((_QWORD *)v21 + 3);
      if (v42 >= v41 >> 1)
      {
        OUTLINED_FUNCTION_24_1(v41 > 1, v42 + 1);
        v21 = v67;
      }
      *((_QWORD *)v21 + 2) = v42 + 1;
      v90 = v21;
      v43 = &v21[48 * v42];
      v44 = v111;
      v45 = *(_OWORD *)v112;
      *(_OWORD *)(v43 + 57) = *(_OWORD *)&v112[9];
      *((_OWORD *)v43 + 2) = v44;
      *((_OWORD *)v43 + 3) = v45;
      OUTLINED_FUNCTION_11_0(v40);
      OUTLINED_FUNCTION_6_1();
      v36 = (_QWORD *)v40;
      sub_2474418F0();
      v46 = OUTLINED_FUNCTION_28_1();
      if (OUTLINED_FUNCTION_10_1(v46))
      {
        v47 = OUTLINED_FUNCTION_4();
        v110 = OUTLINED_FUNCTION_4();
        *(_DWORD *)v47 = v80;
        v48 = *(_QWORD *)&v112[8];
        v49 = *(_QWORD *)&v112[16];
        __swift_project_boxed_opaque_existential_1(&v111, *(uint64_t *)&v112[8]);
        v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 16))(v48, v49);
        v51 = sub_24742C068(v50);
        v53 = OUTLINED_FUNCTION_27_0(v51, v52);
        OUTLINED_FUNCTION_19_1(v53);
        sub_247441B90();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_13_1();
        *(_WORD *)(v47 + 12) = 2080;
        v109 = sub_247438888(*(_QWORD *)&aMitigatedonotm[8 * v118], *(_QWORD *)&aMitigatedonotm[8 * v118 + 24], &v110);
        sub_247441B90();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247422000, (os_log_t)v21, (os_log_type_t)v10, "%s returned %s", (uint8_t *)v47, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v111);

      v34((char *)v40, v28);
    }
    v10 = v102;
LABEL_23:
    swift_beginAccess();
    v62 = v118;
    if (v118)
    {
      OUTLINED_FUNCTION_5_0();
      if (v62 != 2)
      {
        OUTLINED_FUNCTION_21_1();
LABEL_41:
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4_1();
        v72 = OUTLINED_FUNCTION_14();
        if (OUTLINED_FUNCTION_71(v72))
        {
          *(_WORD *)OUTLINED_FUNCTION_4() = 0;
          OUTLINED_FUNCTION_8_1(&dword_247422000, v73, v74, "OverridesContainer returned a result of donot Mitigate");
          OUTLINED_FUNCTION_1();
        }

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
        return 1;
      }
    }
    else
    {
      v36 = (_QWORD *)0xE800000000000000;
    }
    v63 = sub_247441D10();
    OUTLINED_FUNCTION_7_1();
    if ((v63 & 1) != 0)
      goto LABEL_41;
    if (v62)
    {
      if (v62 != 1)
        OUTLINED_FUNCTION_5_0();
      v64 = sub_247441D10();
      OUTLINED_FUNCTION_7_1();
      v65 = v64 | v105;
    }
    else
    {
      swift_bridgeObjectRelease();
      v65 = 1;
    }
    v105 = v65;
    v6 = v98;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
    v26 += 40;
    v25 = v107 - 1;
  }
  while (v107 != 1);
  OUTLINED_FUNCTION_21_1();
  if ((v105 & 1) == 0)
    goto LABEL_44;
  OUTLINED_FUNCTION_4_1();
  v68 = OUTLINED_FUNCTION_14();
  if (OUTLINED_FUNCTION_71(v68))
  {
    *(_WORD *)OUTLINED_FUNCTION_4() = 0;
    OUTLINED_FUNCTION_8_1(&dword_247422000, v69, v70, "OverridesContainer returned a result of mitigate");
    OUTLINED_FUNCTION_1();
  }

  return 0;
}

uint64_t sub_24742D3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24742D41C(__int128 *a1, uint64_t a2)
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

uint64_t sub_24742D434(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TTResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24742D470(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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

uint64_t sub_24742D4BC(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24742D4F4(uint64_t a1, int a2)
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

uint64_t sub_24742D534(uint64_t result, int a2, int a3)
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

void type metadata accessor for OverridesAggregateExecutionResult()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t sub_24742D580(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t sub_24742D5C4(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
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

uint64_t sub_24742D608(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t sub_24742D648(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 41))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_24742D688(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for OverrideUnitExecutionResult()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t getEnumTagSinglePayload for TTMitigationDecision(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_24742D768(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24742D7B4 + 4 * byte_247442941[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24742D7E8 + 4 * byte_24744293C[v4]))();
}

uint64_t sub_24742D7E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742D7F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24742D7F8);
  return result;
}

uint64_t sub_24742D804(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24742D80CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24742D810(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24742D818(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for OverrideDecision()
{
  OUTLINED_FUNCTION_16_1();
}

unint64_t sub_24742D834()
{
  unint64_t result;

  result = qword_2576A3F70;
  if (!qword_2576A3F70)
  {
    result = MEMORY[0x24957ADDC](&unk_247442AAC, &unk_2518A1F58);
    atomic_store(result, (unint64_t *)&qword_2576A3F70);
  }
  return result;
}

void OUTLINED_FUNCTION_1_1(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_24742A7DC(a1 > 1, v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_3_1@<X0>(uint64_t a1@<X8>, uint64_t a2, __int128 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  a5 = v7;
  a6 = a1;
  *(_QWORD *)&a3 = v8;
  *(_QWORD *)(v6 + 16) = v9;
  return sub_24742D41C(&a3, v6 + 40 * v10 + 32);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_2474418F0();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;

  return sub_24742D3D8(v0 - 144, v0 - 232);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

id OUTLINED_FUNCTION_9_1(Class a1)
{
  return objc_allocWithZone(a1);
}

BOOL OUTLINED_FUNCTION_10_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;

  return v2(a1, *(_QWORD *)(v3 - 328), v1);
}

void OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 312) = 0;
  *(_QWORD *)(v0 - 368) = 1;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 232);
}

id OUTLINED_FUNCTION_14_1(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_19_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 280) = a1;
  return v1 - 280;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_24_1(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_24742A87C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_247438888(a1, a2, (uint64_t *)(v2 - 272));
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_247441B18();
}

uint64_t sub_24742D9C0()
{
  return 0;
}

uint64_t sub_24742D9C8(uint64_t a1)
{
  uint64_t v1;
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
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD v28[2];
  uint8_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = sub_247441668();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v31 = (uint64_t)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v28 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v28 - v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (qword_254446B80 != -1)
    swift_once();
  v13 = sub_2474418FC();
  v33 = __swift_project_value_buffer(v13, (uint64_t)qword_254447420);
  v14 = sub_2474418F0();
  v15 = sub_247441B18();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_247422000, v14, v15, "Running shortcuts override", v16, 2u);
    OUTLINED_FUNCTION_1();
  }

  v17 = *(_QWORD *)(v12 + 16);
  if (!v17)
    return 2;
  v30 = v9;
  v32 = v1;
  v18 = v12 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v19 = *(_QWORD *)(v4 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    OUTLINED_FUNCTION_11_1((uint64_t)v11, v18);
    if (sub_24742DD08())
      break;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v3);
    v18 += v19;
    if (!--v17)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
  }
  swift_bridgeObjectRelease();
  v21 = (uint64_t)v30;
  OUTLINED_FUNCTION_11_1((uint64_t)v30, (uint64_t)v11);
  v22 = sub_2474418F0();
  v23 = sub_247441B18();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)OUTLINED_FUNCTION_4();
    v33 = OUTLINED_FUNCTION_4();
    v35 = v33;
    v29 = v24;
    *(_DWORD *)v24 = 136315138;
    v28[1] = v24 + 4;
    OUTLINED_FUNCTION_11_1(v31, v21);
    v25 = sub_247441A04();
    v34 = sub_247438888(v25, v26, &v35);
    sub_247441B90();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_1(v21);
    _os_log_impl(&dword_247422000, v22, v23, "Parse: %s is shortcut; recommending .donotMitigate", v29, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_5_1(v21);
  OUTLINED_FUNCTION_5_1((uint64_t)v11);
  return 1;
}

BOOL sub_24742DD08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v19[2];
  _BOOL4 v20;
  uint64_t v21[4];
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;
  _BYTE v25[32];

  v0 = sub_2474418FC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24742E1B4();
  sub_247441758();
  swift_release();
  OUTLINED_FUNCTION_4_2();
  if (v24)
  {
    sub_2474417DC();
    if (OUTLINED_FUNCTION_1_2())
      v4 = v21[0];
    else
      v4 = 0;
  }
  else
  {
    sub_24742EA7C((uint64_t)v23, &qword_254447388);
    v4 = 0;
  }
  OUTLINED_FUNCTION_4_2();
  if (v24)
  {
    sub_24744186C();
    if (OUTLINED_FUNCTION_1_2())
      v5 = v21[0];
    else
      v5 = 0;
  }
  else
  {
    sub_24742EA7C((uint64_t)v23, &qword_254447388);
    v5 = 0;
  }
  if (qword_254446B80 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v0, (uint64_t)qword_254447420);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
  OUTLINED_FUNCTION_4_2();
  swift_retain_n();
  swift_retain_n();
  v7 = sub_2474418F0();
  v8 = sub_247441B18();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v19[0] = swift_slowAlloc();
    v22 = v19[0];
    *(_DWORD *)v9 = 136315906;
    if (v4 | v5)
      v10 = 1702195828;
    else
      v10 = 0x65736C6166;
    if (v4 | v5)
      v11 = 0xE400000000000000;
    else
      v11 = 0xE500000000000000;
    v19[1] = v1;
    v21[0] = sub_247438888(v10, v11, &v22);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_60();
    *(_WORD *)(v9 + 12) = 2080;
    v20 = (v4 | v5) != 0;
    sub_24742EA34((uint64_t)v23, (uint64_t)v21);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447388);
    v12 = OUTLINED_FUNCTION_10_2();
    v21[0] = OUTLINED_FUNCTION_2_1(v12, v13);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_60();
    sub_24742EA7C((uint64_t)v23, &qword_254447388);
    *(_WORD *)(v9 + 22) = 2080;
    v21[0] = v4;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447308);
    v14 = OUTLINED_FUNCTION_10_2();
    v21[0] = OUTLINED_FUNCTION_2_1(v14, v15);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_60();
    *(_WORD *)(v9 + 32) = 2080;
    v21[0] = v5;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447310);
    v16 = OUTLINED_FUNCTION_10_2();
    v21[0] = OUTLINED_FUNCTION_2_1(v16, v17);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_60();
    _os_log_impl(&dword_247422000, v7, v8, "isShortcutIntent: %s where task is %s; as runTask %s as execTask %s",
      (uint8_t *)v9,
      0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7();

  sub_24742EA7C((uint64_t)v23, &qword_254447388);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_24742EA7C((uint64_t)v25, &qword_254447388);
  return (v4 | v5) != 0;
}

id sub_24742E100()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_24742E150()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShortcutMatcher()
{
  return objc_opt_self();
}

uint64_t sub_24742E1A0(uint64_t a1)
{
  return sub_24742D9C8(a1);
}

uint64_t sub_24742E1B4()
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
  char *v10;
  NSObject *v11;
  Class isa;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  os_log_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  Class v77;
  char *v78;
  uint64_t v79;
  uint64_t v80[2];

  v1 = sub_247441668();
  v70 = *(_QWORD *)(v1 - 8);
  v71 = v1;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v69 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2474416D4();
  v75 = *(_QWORD *)(v3 - 8);
  v76 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v74 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2474416BC();
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544472F0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_247441644();
  isa = v11[-1].isa;
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v73 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v68 - v15;
  v68 = v0;
  v17 = sub_247441650();
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v77 = isa;
    v78 = v16;
    v72 = v11;
    v19 = v17 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v20 = *(_QWORD *)(v6 + 72);
    v21 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    while (1)
    {
      v21(v8, v19, v5);
      if ((sub_247441674() & 1) != 0)
        break;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v19 += v20;
      if (!--v18)
      {
        v22 = 1;
        goto LABEL_8;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v8, v5);
    v22 = 0;
LABEL_8:
    v11 = v72;
    isa = v77;
    v16 = v78;
  }
  else
  {
    v22 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v22, 1, v5);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v5) == 1)
  {
    sub_24742EA7C((uint64_t)v10, &qword_2544472F0);
    if (qword_254446B80 != -1)
      swift_once();
    v25 = sub_2474418FC();
    __swift_project_value_buffer(v25, (uint64_t)qword_254447420);
    v26 = sub_2474418F0();
    v27 = sub_247441B24();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_247422000, v26, v27, "Failed to parse userParse. Returning nil intent", v28, 2u);
      MEMORY[0x24957AE54](v28, -1, -1);
    }

    return 0;
  }
  v23 = v74;
  sub_2474416A4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  v24 = v73;
  sub_2474416C8();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v23, v76);
  (*((void (**)(char *, char *, NSObject *))isa + 4))(v16, v24, v11);
  v31 = sub_247441728();
  v78 = v16;
  v32 = MEMORY[0x24957A428]();
  if (qword_254446B80 != -1)
    swift_once();
  v33 = sub_2474418FC();
  v34 = __swift_project_value_buffer(v33, (uint64_t)qword_254447420);
  v35 = v69;
  v36 = v70;
  v37 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v68, v71);
  swift_bridgeObjectRetain_n();
  v76 = v34;
  v38 = sub_2474418F0();
  v39 = sub_247441B18();
  LODWORD(v74) = v39;
  v40 = os_log_type_enabled(v38, v39);
  v77 = isa;
  if (v40)
  {
    v41 = swift_slowAlloc();
    v73 = (char *)swift_slowAlloc();
    v80[0] = (uint64_t)v73;
    *(_DWORD *)v41 = 136315394;
    v72 = v38;
    v42 = sub_2474418A8();
    v75 = v31;
    v43 = v42;
    v44 = swift_bridgeObjectRetain();
    v45 = MEMORY[0x24957A7AC](v44, v43);
    v47 = v46;
    swift_bridgeObjectRelease();
    v79 = sub_247438888(v45, v47, v80);
    sub_247441B90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2080;
    sub_247441650();
    v48 = v35;
    v49 = v36;
    v50 = v11;
    v51 = MEMORY[0x24957A7AC]();
    v53 = v52;
    swift_bridgeObjectRelease();
    v54 = v51;
    v11 = v50;
    v79 = sub_247438888(v54, v53, v80);
    v31 = v75;
    sub_247441B90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v71);
    v38 = v72;
    _os_log_impl(&dword_247422000, v72, (os_log_type_t)v74, "tasks are %s where userDialogActs are %s", (uint8_t *)v41, 0x16u);
    v55 = v73;
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v55, -1, -1);
    MEMORY[0x24957AE54](v41, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
  }

  v56 = v78;
  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    v64 = sub_247441C5C();
    swift_bridgeObjectRelease();
    if (v64)
      goto LABEL_26;
LABEL_32:
    swift_bridgeObjectRelease();
    v65 = sub_2474418F0();
    v66 = sub_247441B24();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_247422000, v65, v66, "NL Parse has no tasks. Returning nil intent", v67, 2u);
      MEMORY[0x24957AE54](v67, -1, -1);
    }

    swift_release();
    (*((void (**)(char *, NSObject *))v77 + 1))(v56, v11);
    return 0;
  }
  if (!*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_32;
LABEL_26:
  sub_247441208(0, (v32 & 0xC000000000000001) == 0, v32);
  if ((v32 & 0xC000000000000001) != 0)
  {
    v29 = MEMORY[0x24957A8FC](0, v32);
  }
  else
  {
    v29 = *(_QWORD *)(v32 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  swift_retain_n();
  v57 = sub_2474418F0();
  v58 = sub_247441B18();
  if (os_log_type_enabled(v57, v58))
  {
    v72 = v11;
    v59 = (uint8_t *)swift_slowAlloc();
    v60 = swift_slowAlloc();
    v75 = v31;
    v61 = v60;
    v79 = v29;
    v80[0] = v60;
    *(_DWORD *)v59 = 136315138;
    sub_2474418A8();
    swift_retain();
    v62 = sub_247441A04();
    v79 = sub_247438888(v62, v63, v80);
    sub_247441B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247422000, v57, v58, "firstTask is %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v61, -1, -1);
    MEMORY[0x24957AE54](v59, -1, -1);

    swift_release();
    (*((void (**)(char *, os_log_t))v77 + 1))(v78, v72);
  }
  else
  {
    swift_release_n();

    swift_release();
    (*((void (**)(char *, NSObject *))v77 + 1))(v56, v11);
  }
  return v29;
}

uint64_t sub_24742EA34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24742EA7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_247438888(a1, a2, (uint64_t *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  uint64_t v0;

  return sub_24742EA34(v0 - 112, v0 - 144);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_247441A04();
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_24742EB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_24742EB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_24742EB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_24742EB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t sub_24742EB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 48))();
}

uint64_t sub_24742EB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t sub_24742EB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t sub_24742EB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 72))();
}

uint64_t sub_24742EB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t sub_24742EB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t sub_24742EB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24742EB70(uint64_t a1)
{
  objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_, a1);
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for SelfEmitter()
{
  return objc_opt_self();
}

void sub_24742EBE4()
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
  char *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_19_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_81_0();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v35 - v9;
  v11 = OUTLINED_FUNCTION_27_1();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_62_0();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v35 - v15;
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_26_0((uint64_t)v10, 1, v11);
  if (v17)
  {
    OUTLINED_FUNCTION_84_0();
    if (qword_254446B80 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_43();
    v19 = __swift_project_value_buffer(v18, (uint64_t)qword_254447420);
    OUTLINED_FUNCTION_3();
    sub_2474418F0();
    v20 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_11_2(v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_4();
      v38 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v21 = 136315138;
      v22 = OUTLINED_FUNCTION_37_0();
      v37 = OUTLINED_FUNCTION_101(v22, v23, &v38);
      OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v19, (os_log_type_t)v1, "requestId is not a UUID, not expected - %s", v21);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_0();
    v28 = 1;
  }
  else
  {
    v36 = v3;
    OUTLINED_FUNCTION_98(v0, (uint64_t)v10);
    v24 = (void *)objc_opt_self();
    v25 = (void *)sub_2474415F0();
    v26 = objc_msgSend(v24, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 37, v25);

    if (v26)
    {
      sub_2474415FC();

      OUTLINED_FUNCTION_98(v7, (uint64_t)v16);
      OUTLINED_FUNCTION_66_0(v7, 0);
      OUTLINED_FUNCTION_26_0(v7, 1, v11);
      if (!v17)
      {
        OUTLINED_FUNCTION_113(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
        v27 = v36;
        OUTLINED_FUNCTION_98(v36, v7);
        v3 = v27;
        v28 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      OUTLINED_FUNCTION_66_0(v7, 1);
    }
    OUTLINED_FUNCTION_55_0();
    if (qword_254446B80 != -1)
      swift_once();
    v29 = OUTLINED_FUNCTION_43();
    __swift_project_value_buffer(v29, (uint64_t)qword_254447420);
    OUTLINED_FUNCTION_99(v1, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
    v30 = sub_2474418F0();
    v31 = sub_247441B24();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)OUTLINED_FUNCTION_4();
      v38 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v32 = 136315138;
      v35 = v32 + 4;
      v33 = sub_2474415E4();
      v37 = OUTLINED_FUNCTION_61_0(v33, v34);
      sub_247441B90();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_77_0();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v30, v31, "error generating derived indeitifier for TTM from request UUID - %s", v32);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_77_0();
    OUTLINED_FUNCTION_114();
    v28 = 1;
    v3 = v36;
  }
LABEL_17:
  OUTLINED_FUNCTION_66_0(v3, v28);
  OUTLINED_FUNCTION_5_2();
}

void sub_24742EFF4()
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
  char *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD v36[2];

  OUTLINED_FUNCTION_19_2();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_58_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_81_0();
  v12 = v10 - v11;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v36 - v15;
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_78_0();
  sub_2474342C0(v5, (uint64_t)v8);
  OUTLINED_FUNCTION_9_2((uint64_t)v8);
  if (!v17)
  {
    OUTLINED_FUNCTION_36_0(v0, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32));
    v24 = OUTLINED_FUNCTION_69(objc_allocWithZone(MEMORY[0x24BE95D98]));
    if (v24)
    {
      v25 = v24;
      v26 = OUTLINED_FUNCTION_69(objc_allocWithZone(MEMORY[0x24BE95DA0]));
      if (v26)
      {
        v27 = v26;
        OUTLINED_FUNCTION_40_0((uint64_t)v26, &qword_254447330);
        OUTLINED_FUNCTION_85_0((uint64_t)v16, v0);
        v28 = sub_24742F3E8((uint64_t)v16);
        objc_msgSend(v27, sel_setTtmId_, v28);

        OUTLINED_FUNCTION_85_0((uint64_t)v16, v3);
        v29 = sub_24742F3E8((uint64_t)v16);
        OUTLINED_FUNCTION_48_0(v27, sel_setTrpId_);

        OUTLINED_FUNCTION_68_0(v25, sel_setEventMetadata_);
        OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
        goto LABEL_22;
      }
      if (qword_254446B80 != -1)
        swift_once();
      v33 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v33, (uint64_t)qword_254447420);
      v34 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_11_2(v34))
      {
        v35 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_WORD *)v35 = 0;
        OUTLINED_FUNCTION_34(&dword_247422000, 0x1F34D2000, (os_log_type_t)v3, "eror initializing TTMSchemaTTMClientEventMetadata", v35);
        OUTLINED_FUNCTION_1();
      }

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v30 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v30, (uint64_t)qword_254447420);
      v31 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_6(v31))
      {
        v32 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_WORD *)v32 = 0;
        OUTLINED_FUNCTION_34(&dword_247422000, 0x1F34D2000, (os_log_type_t)v12, "eror initializing TTMSchemaTTMClientEvent", v32);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_84_0();
  if (qword_254446B80 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_43();
  __swift_project_value_buffer(v18, (uint64_t)qword_254447420);
  OUTLINED_FUNCTION_36_0(v12, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v19 = sub_2474418F0();
  v20 = sub_247441B24();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_4();
    v36[1] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v21 = 136315138;
    sub_247434308();
    v22 = sub_247441D04();
    v36[0] = OUTLINED_FUNCTION_61_0(v22, v23);
    OUTLINED_FUNCTION_49_0();
    OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_25_0(v12, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_16_2(&dword_247422000, v19, v20, "cannot generate ttmClient event with nil ttmID and trpID - %s", v21);
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_25_0(v12, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));

LABEL_22:
  OUTLINED_FUNCTION_5_2();
}

id sub_24742F3E8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_2474415F0();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_247441614();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_24742F464()
{
  sub_247431ADC();
}

void sub_24742F480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_19_2();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_53_0(v8, v34);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v34 - v10;
  v39 = MEMORY[0x24BEE4AF8];
  v12 = *(_QWORD *)(v2 + OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    swift_bridgeObjectRetain();
    v34 = v12;
    v35 = v5;
    v14 = (char *)(v12 + 48);
    while (1)
    {
      v15 = (uint64_t)v11;
      v16 = *((_QWORD *)v14 - 2);
      v17 = *v14;
      v18 = objc_allocWithZone(MEMORY[0x24BE95E28]);
      OUTLINED_FUNCTION_28();
      v19 = -[NSObject init](v18, sel_init, v34);
      if (!v19)
        break;
      v18 = v19;
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_26_0((uint64_t)v5, 1, v6);
      if (v20)
      {
        OUTLINED_FUNCTION_105();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_84_0();
        if (qword_254446B80 != -1)
          swift_once();
        v29 = OUTLINED_FUNCTION_43();
        v30 = __swift_project_value_buffer(v29, (uint64_t)qword_254447420);
        OUTLINED_FUNCTION_28();
        sub_2474418F0();
        v31 = OUTLINED_FUNCTION_70();
        if (OUTLINED_FUNCTION_11_2(v31))
        {
          v32 = (uint8_t *)OUTLINED_FUNCTION_4();
          v38 = OUTLINED_FUNCTION_4();
          *(_DWORD *)v32 = 136315138;
          OUTLINED_FUNCTION_28();
          v37 = OUTLINED_FUNCTION_89(v16, v33, &v38);
          sub_247441B90();
          OUTLINED_FUNCTION_77();
          OUTLINED_FUNCTION_16_2(&dword_247422000, v30, (os_log_type_t)v6, "error converting tcuID - %s to UUID", v32);
          OUTLINED_FUNCTION_82();
          OUTLINED_FUNCTION_1();
        }

        OUTLINED_FUNCTION_79();
        goto LABEL_18;
      }
      v11 = (char *)v15;
      OUTLINED_FUNCTION_83_0(v15, (uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32));
      sub_247427DC4(0, &qword_254447330);
      v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16);
      v22 = v0;
      v23 = v36;
      OUTLINED_FUNCTION_83_0(v36, (uint64_t)v11, v21);
      v24 = sub_24742F3E8(v23);
      OUTLINED_FUNCTION_48_0(v18, sel_setTcuId_);

      -[NSObject setDecision:](v18, sel_setDecision_, dword_247442BE8[v17]);
      OUTLINED_FUNCTION_27();
      v25 = v18;
      MEMORY[0x24957A794]();
      if (*(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        OUTLINED_FUNCTION_35_0();
      v14 += 24;
      sub_247441AF4();
      sub_247441ADC();

      OUTLINED_FUNCTION_96((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
      --v13;
      v5 = v35;
      v0 = v22;
      if (!v13)
      {
        OUTLINED_FUNCTION_105();
        goto LABEL_19;
      }
    }
    OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_27();
    swift_bridgeObjectRelease();
    if (qword_254446B80 != -1)
      swift_once();
    v26 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_7_2(v26, (uint64_t)qword_254447420);
    v27 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_44_0(v27))
    {
      v28 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v28 = 0;
      OUTLINED_FUNCTION_34(&dword_247422000, v18, (os_log_type_t)v5, "error constructing TTMSchemaTTMTCUResult", v28);
      OUTLINED_FUNCTION_1();
    }
LABEL_18:

  }
LABEL_19:
  OUTLINED_FUNCTION_5_2();
}

void sub_24742F850()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  os_log_type_t v27;
  _WORD *v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_9_2((uint64_t)v8);
  if (v11)
  {
    OUTLINED_FUNCTION_55_0();
    if (qword_254446B80 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v12, (uint64_t)qword_254447420);
    sub_2474418F0();
    v13 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v13))
    {
      OUTLINED_FUNCTION_4();
      v14 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_93(v14);
      OUTLINED_FUNCTION_20_1(4.8149e-34);
      v16 = OUTLINED_FUNCTION_89(v3, v15, &v30);
      OUTLINED_FUNCTION_14_2(v16);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v17, v18, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v1, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    v19 = OUTLINED_FUNCTION_75_0(objc_allocWithZone(MEMORY[0x24BE95E10]));
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      sub_24742F480();
      if (v22)
      {
        OUTLINED_FUNCTION_40_0(v22, &qword_254447338);
        v4 = (void *)OUTLINED_FUNCTION_72_0();
        OUTLINED_FUNCTION_75();
      }
      else
      {
        v4 = 0;
      }
      OUTLINED_FUNCTION_68_0(v21, sel_setResults_);

    }
    v23 = OUTLINED_FUNCTION_75_0(objc_allocWithZone(MEMORY[0x24BE95E08]));
    OUTLINED_FUNCTION_50_0(v23, sel_setEnded_);
    OUTLINED_FUNCTION_54_0();
    if (v24)
    {
      v25 = v24;
      OUTLINED_FUNCTION_59_0(v24, sel_setTtmRequestContext_);
      OUTLINED_FUNCTION_92((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v26 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v26, (uint64_t)qword_254447420);
      v27 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_11_2(v27))
      {
        v28 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_65_0(v28);
        OUTLINED_FUNCTION_34(&dword_247422000, v0, v2, "error generating the TTMClient Event", (uint8_t *)v4);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  }
  OUTLINED_FUNCTION_5_2();
}

uint64_t sub_24742FB0C(char *a1)
{
  void *v1;
  char v2;
  uint64_t v3;
  os_log_type_t v4;
  _DWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *a1;
  if (qword_254446B80 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_7_2(v3, (uint64_t)qword_254447420);
  v4 = OUTLINED_FUNCTION_28_2();
  if (OUTLINED_FUNCTION_6_2(v4))
  {
    v5 = (_DWORD *)OUTLINED_FUNCTION_4();
    v6 = (_QWORD *)OUTLINED_FUNCTION_4();
    *v5 = 138412290;
    sub_247434284();
    swift_allocError();
    *v7 = v2;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_116();
    *v6 = v11;
    OUTLINED_FUNCTION_3_2(&dword_247422000, v8, v9, "Neural Combiner failure reason %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447358);
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_1();
  }

  return 4 * ((v2 & 0xFE) == 2);
}

void sub_24742FC50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  void *v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  os_log_type_t v29;
  _WORD *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_19_2();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_0();
  v12 = (uint8_t *)(v11 - v10);
  v13 = (void *)OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_41_0();
  v15 = *v4;
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_9_2((uint64_t)v12);
  if (v16)
  {
    sub_2474337CC((uint64_t)v12);
    if (qword_254446B80 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v17, (uint64_t)qword_254447420);
    sub_2474418F0();
    v18 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v18))
    {
      OUTLINED_FUNCTION_4();
      v31 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_20_1(4.8149e-34);
      v20 = OUTLINED_FUNCTION_89(v6, v19, &v31);
      OUTLINED_FUNCTION_14_2(v20);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v21, v22, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v1, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
    v23 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(MEMORY[0x24BE95E18]));
    v24 = v23;
    if (v23)
    {
      LOBYTE(v31) = v15;
      objc_msgSend(v23, sel_setReason_, sub_24742FB0C((char *)&v31));
    }
    v25 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(MEMORY[0x24BE95E08]));
    OUTLINED_FUNCTION_50_0(v25, sel_setFailed_);
    OUTLINED_FUNCTION_54_0();
    if (v26)
    {
      v27 = v26;
      OUTLINED_FUNCTION_109(v26, sel_setTtmRequestContext_);
      OUTLINED_FUNCTION_94();
      sub_24742EB70((uint64_t)v27);

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v28 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v28, (uint64_t)qword_254447420);
      v29 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_9(v29))
      {
        v30 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_65_0(v30);
        OUTLINED_FUNCTION_34(&dword_247422000, v0, v8, "error generating the TTMClient Event", v12);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  }
  OUTLINED_FUNCTION_5_2();
}

void sub_24742FEF0()
{
  sub_247431ADC();
}

uint64_t sub_24742FF0C(char *a1)
{
  return dword_247442BE8[*a1];
}

NSObject *sub_24742FF20(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  double v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  NSObject *v39;
  uint64_t v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_27_1();
  v48 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_106();
  v47 = v9;
  OUTLINED_FUNCTION_67();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_79_0();
  v53 = MEMORY[0x24BEE4AF8];
  v45 = a1 + 64;
  OUTLINED_FUNCTION_64_0();
  v13 = v12 & v11;
  v46 = (unint64_t)(v14 + 63) >> 6;
  v49 = a1;
  swift_bridgeObjectRetain();
  v15 = 0;
  if (!v13)
    goto LABEL_3;
LABEL_2:
  v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = (uint64_t *)(*(_QWORD *)(v49 + 48) + 16 * i);
    v3 = *v21;
    v2 = v21[1];
    v22 = *(char *)(*(_QWORD *)(v49 + 56) + 40 * i + 4);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_32();
    sub_2474415D8();
    OUTLINED_FUNCTION_26_0((uint64_t)v7, 1, v8);
    if (v23)
    {
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_7_1();
      sub_2474337CC((uint64_t)v7);
      if (qword_254446B80 != -1)
        goto LABEL_36;
      goto LABEL_24;
    }
    OUTLINED_FUNCTION_85();
    v3 = v48;
    v24 = OUTLINED_FUNCTION_112();
    v25(v24);
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95DC8]), sel_init);
    v27 = v8;
    if (!v26)
      break;
    v28 = v26;
    v50 = v15;
    v29 = v7;
    sub_247427DC4(0, &qword_254447330);
    v30 = v1;
    v31 = v47;
    OUTLINED_FUNCTION_36_0(v47, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
    v32 = sub_24742F3E8(v31);
    OUTLINED_FUNCTION_48_0(v28, sel_setTcuId_);

    OUTLINED_FUNCTION_91(v28, sel_setNeuralCombinerScore_, v33);
    OUTLINED_FUNCTION_37();
    objc_msgSend(v28, sel_setRecommendation_, dword_247442BE8[v22]);
    v34 = v28;
    MEMORY[0x24957A794]();
    v2 = *(_QWORD *)(((unint64_t)v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2 >= *(_QWORD *)(((unint64_t)v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_35_0();
    sub_247441AF4();
    sub_247441ADC();

    OUTLINED_FUNCTION_25_0(v30, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v1 = v30;
    v7 = v29;
    v8 = v27;
    v15 = v50;
    if (v13)
      goto LABEL_2;
LABEL_3:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v18 >= v46)
      goto LABEL_31;
    v19 = *(_QWORD *)(v45 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v46)
        goto LABEL_31;
      v19 = *(_QWORD *)(v45 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v46)
          goto LABEL_31;
        v19 = *(_QWORD *)(v45 + 8 * v15);
        if (!v19)
        {
          v20 = v18 + 3;
          if (v20 >= v46)
          {
LABEL_31:
            OUTLINED_FUNCTION_86_0();
            return v53;
          }
          v19 = *(_QWORD *)(v45 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              v15 = v20 + 1;
              if (__OFADD__(v20, 1))
                break;
              if (v15 >= v46)
                goto LABEL_31;
              v19 = *(_QWORD *)(v45 + 8 * v15);
              ++v20;
              if (v19)
                goto LABEL_16;
            }
LABEL_35:
            __break(1u);
LABEL_36:
            swift_once();
LABEL_24:
            v35 = OUTLINED_FUNCTION_43();
            v36 = __swift_project_value_buffer(v35, (uint64_t)qword_254447420);
            OUTLINED_FUNCTION_32();
            sub_2474418F0();
            v37 = OUTLINED_FUNCTION_70();
            if (OUTLINED_FUNCTION_6(v37))
            {
              v38 = (uint8_t *)OUTLINED_FUNCTION_4();
              v52 = OUTLINED_FUNCTION_4();
              *(_DWORD *)v38 = 136315138;
              OUTLINED_FUNCTION_32();
              v51 = sub_247438888(v3, v2, &v52);
              OUTLINED_FUNCTION_87_0();
              OUTLINED_FUNCTION_11();
              OUTLINED_FUNCTION_16_2(&dword_247422000, v36, (os_log_type_t)v1, "error converting tcuId - %s to UUID", v38);
              OUTLINED_FUNCTION_82();
              OUTLINED_FUNCTION_1();
            }
            OUTLINED_FUNCTION_86_0();
            OUTLINED_FUNCTION_0();

            return 0;
          }
          v15 = v20;
        }
      }
    }
LABEL_16:
    v13 = (v19 - 1) & v19;
  }
  v39 = v53;
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_7_1();
  if (qword_254446B80 != -1)
    swift_once();
  v40 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_7_2(v40, (uint64_t)qword_254447420);
  v41 = OUTLINED_FUNCTION_70();
  if (OUTLINED_FUNCTION_11_2(v41))
  {
    v42 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v42 = 0;
    OUTLINED_FUNCTION_34(&dword_247422000, v39, (os_log_type_t)v7, "error initializing TTMSchemaTTMNeuralCombinerTCUResult", v42);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_25_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_86_0();
  return 0;
}

NSObject *sub_247430454(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v23;
  unint64_t v24;
  unsigned __int8 v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  unsigned __int8 v52;
  uint64_t v53;
  unsigned __int8 *v54;
  unsigned int v55;
  uint64_t v56;
  unsigned __int8 v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;

  LOBYTE(v4) = a2;
  v67 = a1;
  v68 = a2;
  sub_24742A6AC();
  v6 = (unint64_t)&v67;
  v7 = (_QWORD *)sub_247441BA8();
  v8 = v7[2];
  if (v8 <= 1)
  {
    OUTLINED_FUNCTION_38_0();
    if (qword_254446B80 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v9, (uint64_t)qword_254447420);
    sub_2474418F0();
    v10 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v10))
    {
      OUTLINED_FUNCTION_4();
      v67 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_20_1(4.8149e-34);
      OUTLINED_FUNCTION_89(a1, v11, &v67);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v12, v13, "The assertVersion=%s doesn't follow semantic version scheme");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    goto LABEL_18;
  }
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95C88]), sel_init);
  if (!v14)
  {
    OUTLINED_FUNCTION_38_0();
    if (qword_254446B80 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_7_2(v20, (uint64_t)qword_254447420);
    v21 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_44_0(v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v22 = 0;
      OUTLINED_FUNCTION_34(&dword_247422000, v2, (os_log_type_t)&v67, "Failed to create SISchemaVersion", v22);
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_95;
  }
  if (v7[2])
  {
    v2 = v14;
    v6 = v7[4];
    v3 = v7[5];
    v15 = HIBYTE(v3) & 0xF;
    v16 = v6 & 0xFFFFFFFFFFFFLL;
    if ((v3 & 0x2000000000000000) != 0)
      v17 = HIBYTE(v3) & 0xF;
    else
      v17 = v6 & 0xFFFFFFFFFFFFLL;
    if (!v17)
      goto LABEL_89;
    if ((v3 & 0x1000000000000000) == 0)
    {
      if ((v3 & 0x2000000000000000) == 0)
      {
        if ((v6 & 0x1000000000000000) != 0)
          v18 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v18 = (unsigned __int8 *)sub_247441C2C();
        v19 = sub_2474339E0(v18, v16, 10);
        LOBYTE(v15) = BYTE4(v19) & 1;
        v6 = (unint64_t)v19;
LABEL_50:
        if ((v15 & 1) == 0)
          goto LABEL_51;
LABEL_89:
        OUTLINED_FUNCTION_38_0();
        if (qword_254446B80 == -1)
          goto LABEL_90;
        goto LABEL_100;
      }
      v67 = v7[4];
      v68 = v3 & 0xFFFFFFFFFFFFFFLL;
      v23 = v6 >> 8;
      v24 = v6 >> 16;
      if (v6 == 43)
      {
        if (v15)
        {
          if (v15 != 1)
          {
            v6 = (BYTE1(v6) - 48);
            if (v6 <= 9)
            {
              if (v15 == 2)
                goto LABEL_49;
              if ((v24 - 48) <= 9u)
              {
                v6 = 10 * (_DWORD)v6 + (v24 - 48);
                v28 = v15 - 3;
                if (v15 != 3)
                {
                  v29 = (unsigned __int8 *)&v67 + 3;
                  while (1)
                  {
                    v30 = *v29 - 48;
                    if (v30 > 9)
                      goto LABEL_46;
                    v31 = 10 * v6;
                    if ((v31 & 0xFFFFFFFF00000000) != 0)
                      goto LABEL_46;
                    v6 = v31 + v30;
                    if (__CFADD__((_DWORD)v31, v30))
                      goto LABEL_46;
                    LOBYTE(v15) = 0;
                    ++v29;
                    if (!--v28)
                      goto LABEL_50;
                  }
                }
                goto LABEL_49;
              }
            }
            goto LABEL_46;
          }
          goto LABEL_101;
        }
      }
      else
      {
        if (v6 != 45)
        {
          if (v15)
          {
            v6 = (v6 - 48);
            if (v6 <= 9)
            {
              if (v15 == 1)
                goto LABEL_49;
              v52 = v23 - 48;
              if (v52 <= 9u)
              {
                v6 = 10 * (_DWORD)v6 + v52;
                v53 = v15 - 2;
                if (v15 != 2)
                {
                  v54 = (unsigned __int8 *)&v67 + 2;
                  while (1)
                  {
                    v55 = *v54 - 48;
                    if (v55 > 9)
                      goto LABEL_46;
                    v56 = 10 * v6;
                    if ((v56 & 0xFFFFFFFF00000000) != 0)
                      goto LABEL_46;
                    v6 = v56 + v55;
                    if (__CFADD__((_DWORD)v56, v55))
                      goto LABEL_46;
                    LOBYTE(v15) = 0;
                    ++v54;
                    if (!--v53)
                      goto LABEL_50;
                  }
                }
                goto LABEL_49;
              }
            }
          }
LABEL_46:
          v6 = 0;
LABEL_47:
          LOBYTE(v15) = 1;
          goto LABEL_50;
        }
        if (v15)
        {
          if (v15 != 1)
          {
            v25 = BYTE1(v6) - 48;
            if ((BYTE1(v6) - 48) <= 9u)
            {
              v6 = 0;
              v26 = v25 == 0;
              v27 = -v25;
              if (!v26)
                goto LABEL_47;
              if (v15 == 2)
              {
                LOBYTE(v15) = 0;
                v6 = v27;
                goto LABEL_50;
              }
              v57 = v24 - 48;
              if (v57 <= 9u)
              {
                v58 = 10 * v27;
                if ((v58 & 0xFFFFFFFF00000000) == 0)
                {
                  v6 = v58 - v57;
                  if (v58 >= v57)
                  {
                    v59 = v15 - 3;
                    if (v15 != 3)
                    {
                      v60 = (unsigned __int8 *)&v67 + 3;
                      while (1)
                      {
                        v61 = *v60 - 48;
                        if (v61 > 9)
                          goto LABEL_46;
                        v62 = 10 * v6;
                        if ((v62 & 0xFFFFFFFF00000000) != 0)
                          goto LABEL_46;
                        v6 = v62 - v61;
                        if (v62 < v61)
                          goto LABEL_46;
                        LOBYTE(v15) = 0;
                        ++v60;
                        if (!--v59)
                          goto LABEL_50;
                      }
                    }
LABEL_49:
                    LOBYTE(v15) = 0;
                    goto LABEL_50;
                  }
                }
              }
            }
            goto LABEL_46;
          }
LABEL_101:
          v6 = 0;
          goto LABEL_50;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_104;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  v6 = sub_2474338FC(v6, v3, 10);
  OUTLINED_FUNCTION_95();
  if ((v6 & 0x100000000) != 0)
    goto LABEL_89;
LABEL_51:
  if (v7[2] < 2uLL)
  {
    __break(1u);
LABEL_100:
    swift_once();
LABEL_90:
    v63 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v63, (uint64_t)qword_254447420);
    sub_2474418F0();
    v64 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_9(v64))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_4();
      v67 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v43 = 136315138;
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_89(a1, v65, &v67);
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_77();
      v45 = "Failed to convert major version to UInt for version=%s";
      goto LABEL_92;
    }
    goto LABEL_94;
  }
  v32 = v7[6];
  v33 = v7[7];
  swift_bridgeObjectRetain();
  v34 = sub_247430C80(v32, v33);
  if ((v34 & 0x100000000) != 0)
  {
    OUTLINED_FUNCTION_38_0();
    if (qword_254446B80 != -1)
      swift_once();
    v41 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v41, (uint64_t)qword_254447420);
    sub_2474418F0();
    v42 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_9(v42))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_4();
      v67 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v43 = 136315138;
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_89(a1, v44, &v67);
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_77();
      v45 = "Failed to convert minor version to UInt for version=%s";
LABEL_92:
      OUTLINED_FUNCTION_16_2(&dword_247422000, v6, (os_log_type_t)v7, v45, v43);
      OUTLINED_FUNCTION_82();
      goto LABEL_93;
    }
LABEL_94:

    OUTLINED_FUNCTION_79();
LABEL_95:

    return 0;
  }
  v35 = v34;
  if (v8 < 3)
    goto LABEL_57;
  if (v7[2] < 3uLL)
  {
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  v4 = v7[8];
  swift_bridgeObjectRetain();
  v36 = OUTLINED_FUNCTION_112();
  v38 = sub_247430C80(v36, v37);
  if ((v38 & 0x100000000) != 0)
  {
    if (qword_254446B80 == -1)
    {
LABEL_66:
      v46 = OUTLINED_FUNCTION_43();
      v47 = __swift_project_value_buffer(v46, (uint64_t)qword_254447420);
      OUTLINED_FUNCTION_37_0();
      sub_2474418F0();
      v48 = OUTLINED_FUNCTION_70();
      if (!OUTLINED_FUNCTION_6(v48))
      {

LABEL_18:
        OUTLINED_FUNCTION_0();
        return 0;
      }
      v49 = (uint8_t *)OUTLINED_FUNCTION_4();
      v67 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v49 = 136315138;
      v50 = v7[8];
      v51 = v7[9];
      swift_bridgeObjectRetain();
      sub_247438888(v50, v51, &v67);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v47, (os_log_type_t)v4, "Malformed value for patch=%s", v49);
      OUTLINED_FUNCTION_82();
LABEL_93:
      OUTLINED_FUNCTION_1();
    }
LABEL_106:
    swift_once();
    goto LABEL_66;
  }
  -[NSObject setPatch:](v2, sel_setPatch_, v38);
LABEL_57:
  -[NSObject setMajor:](v2, sel_setMajor_, v6);
  -[NSObject setMinor:](v2, sel_setMinor_, v35);
  if (v8 != 4)
  {
    OUTLINED_FUNCTION_38_0();
    return v2;
  }
  if (v7[2] < 4uLL)
    goto LABEL_105;
  v39 = v7[10];
  v40 = v7[11];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_0();
  sub_247434120(v39, v40, v2);
  return v2;
}

unint64_t sub_247430C80(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[2];
  char v27;

  v3 = HIBYTE(a2) & 0xF;
  v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_247441C2C();
      v7 = sub_2474339E0(v6, v4, 10);
      LODWORD(v8) = (_DWORD)v7;
      v27 = BYTE4(v7) & 1;
      v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            v15 = v3 - 2;
            if (v15)
            {
              v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v17 = *v16 - 48;
                if (v17 > 9)
                  goto LABEL_35;
                v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v18 + v17;
                if (__CFADD__((_DWORD)v18, v17))
                  goto LABEL_35;
                v9 = 0;
                ++v16;
                if (!--v15)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            v19 = v3 - 1;
            if (v19)
            {
              v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                v24 = *v23 - 48;
                if (v24 > 9)
                  goto LABEL_35;
                v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v25 + v24;
                if (__CFADD__((_DWORD)v25, v24))
                  goto LABEL_35;
                v9 = 0;
                ++v23;
                if (!--v19)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            v11 = v3 - 2;
            if (v11)
            {
              v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v13 = *v12 - 48;
                if (v13 > 9)
                  goto LABEL_35;
                v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v14 - v13;
                if (v14 < v13)
                  goto LABEL_35;
                v9 = 0;
                ++v12;
                if (!--v11)
                  goto LABEL_38;
              }
            }
LABEL_37:
            v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  v8 = sub_2474338FC(a1, a2, 10);
  swift_bridgeObjectRelease();
  v20 = HIDWORD(v8) & 1;
LABEL_39:
  v21 = v8;
  if ((_DWORD)v20)
    v21 = 0;
  return v21 | ((unint64_t)v20 << 32);
}

uint64_t sub_247430EDC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  os_log_type_t v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  NSObject *v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  int64_t v62;
  double v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  os_log_type_t v71;
  _WORD *v72;
  _QWORD v73[2];
  uint64_t v74;
  char *v75;
  _QWORD v76[5];
  _QWORD v77[5];
  uint64_t v78[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)OUTLINED_FUNCTION_27_1();
  v12 = *(v11 - 1);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_9_2((uint64_t)v10);
  if (v15)
  {
    OUTLINED_FUNCTION_55_0();
    if (qword_254446B80 != -1)
      goto LABEL_97;
    goto LABEL_4;
  }
  v73[1] = a1;
  v74 = v4;
  v73[0] = v12;
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
  v75 = v14;
  OUTLINED_FUNCTION_36_0((uint64_t)v14, (uint64_t)v10, v22);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95DB0]), sel_init);
  OUTLINED_FUNCTION_97(v76);
  a2 = v76[0];
  v24 = v76[1];
  v25 = v76[3];
  v26 = v76[4];
  v27 = (unint64_t)(v76[2] + 64) >> 6;
  OUTLINED_FUNCTION_3();
  if (!v26)
    goto LABEL_8;
LABEL_7:
  v28 = __clz(__rbit64(v26));
  v26 &= v26 - 1;
  v29 = v28 | (v25 << 6);
  while (1)
  {
    v34 = (uint64_t)a2[7].isa + 40 * v29;
    v35 = *(_QWORD *)(v34 + 16);
    if (v35)
      break;
    swift_bridgeObjectRelease();
    if (v26)
      goto LABEL_7;
LABEL_8:
    v30 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
LABEL_95:
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      swift_once();
LABEL_4:
      v16 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_2_2(v16, (uint64_t)qword_254447420);
      sub_2474418F0();
      v17 = OUTLINED_FUNCTION_28_2();
      if (OUTLINED_FUNCTION_6_2(v17))
      {
        v18 = (_DWORD *)OUTLINED_FUNCTION_4();
        v78[0] = OUTLINED_FUNCTION_4();
        *v18 = 136315138;
        OUTLINED_FUNCTION_28();
        v77[0] = OUTLINED_FUNCTION_89((uint64_t)a2, v19, v78);
        OUTLINED_FUNCTION_87_0();
        OUTLINED_FUNCTION_77();
        OUTLINED_FUNCTION_3_2(&dword_247422000, v20, v21, "error converting trpID %s to UUID");
        OUTLINED_FUNCTION_82();
        OUTLINED_FUNCTION_1();
      }

      return OUTLINED_FUNCTION_79();
    }
    if (v30 >= v27)
      goto LABEL_32;
    v31 = *(_QWORD *)(v24 + 8 * v30);
    v32 = v25 + 1;
    if (!v31)
    {
      v32 = v25 + 2;
      if (v25 + 2 >= v27)
        goto LABEL_32;
      v31 = *(_QWORD *)(v24 + 8 * v32);
      if (!v31)
      {
        v32 = v25 + 3;
        if (v25 + 3 >= v27)
          goto LABEL_32;
        v31 = *(_QWORD *)(v24 + 8 * v32);
        if (!v31)
        {
          v32 = v25 + 4;
          if (v25 + 4 >= v27)
            goto LABEL_32;
          v31 = *(_QWORD *)(v24 + 8 * v32);
          if (!v31)
          {
            v32 = v25 + 5;
            if (v25 + 5 >= v27)
              goto LABEL_32;
            v31 = *(_QWORD *)(v24 + 8 * v32);
            if (!v31)
            {
              v32 = v25 + 6;
              if (v25 + 6 >= v27)
              {
LABEL_32:
                OUTLINED_FUNCTION_38_0();
                OUTLINED_FUNCTION_51_0();
                v42 = v74;
                v43 = v23;
                goto LABEL_35;
              }
              v31 = *(_QWORD *)(v24 + 8 * v32);
              if (!v31)
              {
                v33 = v25 + 7;
                do
                {
                  if (v33 >= v27)
                    goto LABEL_32;
                  v31 = *(_QWORD *)(v24 + 8 * v33++);
                }
                while (!v31);
                v32 = v33 - 1;
              }
            }
          }
        }
      }
    }
    v26 = (v31 - 1) & v31;
    v29 = __clz(__rbit64(v31)) + (v32 << 6);
    v25 = v32;
  }
  v36 = *(_QWORD *)(v34 + 8);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_51_0();
  v37 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(MEMORY[0x24BE95AA8]));
  v38 = v37;
  if (v37)
  {
    v39 = v37;
    v40 = sub_247430454(v36, v35);
    OUTLINED_FUNCTION_75();
    objc_msgSend(v39, sel_setAssetVersion_, v40);

  }
  else
  {
    OUTLINED_FUNCTION_75();
  }
  v42 = v74;
  v43 = v23;
  v44 = v23;
  OUTLINED_FUNCTION_68_0(v44, sel_setAsset_);

LABEL_35:
  OUTLINED_FUNCTION_97(v77);
  a2 = v77[0];
  v45 = v77[1];
  v46 = v77[3];
  v47 = v77[4];
  v48 = (unint64_t)(v77[2] + 64) >> 6;
  while (v47)
  {
    OUTLINED_FUNCTION_73_0();
LABEL_55:
    if ((*((_BYTE *)a2[7].isa + v50 * v49 + 28) & 1) == 0)
    {
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_51_0();
      OUTLINED_FUNCTION_91(v43, sel_setNeuralCombinerThreshold_, v54);
      goto LABEL_58;
    }
  }
  v51 = v46 + 1;
  if (__OFADD__(v46, 1))
    goto LABEL_95;
  if (v51 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * v51))
    goto LABEL_54;
  if (v46 + 2 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * (v46 + 2)))
    goto LABEL_54;
  if (v46 + 3 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * (v46 + 3)))
    goto LABEL_54;
  if (v46 + 4 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * (v46 + 4)))
    goto LABEL_54;
  if (v46 + 5 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * (v46 + 5)))
    goto LABEL_54;
  if (v46 + 6 >= v48)
    goto LABEL_57;
  if (*(_QWORD *)(v45 + 8 * (v46 + 6)))
  {
LABEL_54:
    OUTLINED_FUNCTION_70_0();
    goto LABEL_55;
  }
  v52 = v46 + 7;
  while (v52 < v48)
  {
    if (*(_QWORD *)(v45 + 8 * v52++))
      goto LABEL_54;
  }
LABEL_57:
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_51_0();
LABEL_58:
  OUTLINED_FUNCTION_97(v78);
  a2 = v78[0];
  v55 = v78[1];
  v56 = v78[3];
  v57 = v78[4];
  v58 = (unint64_t)(v78[2] + 64) >> 6;
  while (2)
  {
    if (v57)
    {
      OUTLINED_FUNCTION_73_0();
      goto LABEL_78;
    }
    v61 = v56 + 1;
    if (__OFADD__(v56, 1))
      goto LABEL_96;
    if (v61 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * v61))
      goto LABEL_77;
    if (v56 + 2 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * (v56 + 2)))
      goto LABEL_77;
    if (v56 + 3 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * (v56 + 3)))
      goto LABEL_77;
    if (v56 + 4 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * (v56 + 4)))
      goto LABEL_77;
    if (v56 + 5 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * (v56 + 5)))
      goto LABEL_77;
    if (v56 + 6 >= v58)
      goto LABEL_81;
    if (*(_QWORD *)(v55 + 8 * (v56 + 6)))
    {
LABEL_77:
      OUTLINED_FUNCTION_70_0();
LABEL_78:
      if ((*((_BYTE *)a2[7].isa + v60 * v59 + 36) & 1) == 0)
      {
        OUTLINED_FUNCTION_37_0();
        OUTLINED_FUNCTION_51_0();
        OUTLINED_FUNCTION_91(v43, sel_setSpeakerIdThreshold_, v64);
        if (!v43)
          goto LABEL_86;
        goto LABEL_82;
      }
      continue;
    }
    break;
  }
  v62 = v56 + 7;
  while (v62 < v58)
  {
    if (*(_QWORD *)(v55 + 8 * v62++))
      goto LABEL_77;
  }
LABEL_81:
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_51_0();
  if (!v43)
    goto LABEL_86;
LABEL_82:
  a2 = v43;
  v65 = sub_24742FF20(a4);
  if (v65)
  {
    OUTLINED_FUNCTION_40_0((uint64_t)v65, &qword_254447350);
    v66 = (void *)OUTLINED_FUNCTION_72_0();
    OUTLINED_FUNCTION_75();
  }
  else
  {
    v66 = 0;
  }
  OUTLINED_FUNCTION_59_0(a2, sel_setResults_);

LABEL_86:
  v67 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(MEMORY[0x24BE95DA8]));
  OUTLINED_FUNCTION_50_0(v67, sel_setEnded_);
  OUTLINED_FUNCTION_54_0();
  if (v68)
  {
    v69 = v68;
    OUTLINED_FUNCTION_59_0(v68, sel_setTtmNeuralCombinerRequestContext_);
    OUTLINED_FUNCTION_92((_QWORD *)(v42 + 16), *(_QWORD *)(v42 + 40));

  }
  else
  {
    if (qword_254446B80 != -1)
      swift_once();
    v70 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_7_2(v70, (uint64_t)qword_254447420);
    v71 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_11_2(v71))
    {
      v72 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_65_0(v72);
      OUTLINED_FUNCTION_34(&dword_247422000, v23, OS_LOG_TYPE_DEFAULT, "error generating the TTMClient Event", (uint8_t *)a2);
      OUTLINED_FUNCTION_1();
    }

  }
  return OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v73[0] + 8));
}

void sub_247431600()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  os_log_type_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  os_log_type_t v45;
  _WORD *v46;
  _BYTE v47[12];
  int v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;

  OUTLINED_FUNCTION_19_2();
  v49 = v1;
  v48 = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v52 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_63_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_58_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v19);
  v50 = &v47[-v20];
  OUTLINED_FUNCTION_67();
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v47[-v22];
  v51 = v14;
  sub_2474415D8();
  OUTLINED_FUNCTION_9_2(v2);
  if (v30)
  {
    sub_2474337CC(v2);
    if (qword_254446B80 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_43();
    __swift_project_value_buffer(v24, (uint64_t)qword_254447420);
    OUTLINED_FUNCTION_3();
    sub_2474418F0();
    v25 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v25))
    {
      v26 = (_DWORD *)OUTLINED_FUNCTION_4();
      v53 = OUTLINED_FUNCTION_4();
      *v26 = 136315138;
      OUTLINED_FUNCTION_32();
      v27 = sub_247438888(v51, v12, &v53);
      OUTLINED_FUNCTION_89_0(v27);
      OUTLINED_FUNCTION_116();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v28, v29, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_0();
  }
  else
  {
    OUTLINED_FUNCTION_85_0((uint64_t)v23, v2);
    sub_2474415D8();
    OUTLINED_FUNCTION_9_2(v4);
    if (v30)
    {
      v52 = v0;
      sub_2474337CC(v4);
      if (qword_254446B80 != -1)
        swift_once();
      v31 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_2_2(v31, (uint64_t)qword_254447420);
      sub_2474418F0();
      v32 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_11_2(v32))
      {
        v33 = v10;
        v34 = (uint8_t *)OUTLINED_FUNCTION_4();
        v53 = OUTLINED_FUNCTION_4();
        *(_DWORD *)v34 = 136315138;
        OUTLINED_FUNCTION_28();
        v36 = OUTLINED_FUNCTION_89(v33, v35, &v53);
        OUTLINED_FUNCTION_88_0(v36);
        sub_247441B90();
        OUTLINED_FUNCTION_77();
        OUTLINED_FUNCTION_16_2(&dword_247422000, v8, (os_log_type_t)v3, "error converting tcuID %s to UUID", v34);
        OUTLINED_FUNCTION_82();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_79();

      (*(void (**)(_BYTE *, void *))(v5 + 8))(v23, v52);
    }
    else
    {
      v37 = v50;
      OUTLINED_FUNCTION_85_0((uint64_t)v50, v4);
      v38 = OUTLINED_FUNCTION_82_0(objc_allocWithZone(MEMORY[0x24BE95DB8]));
      v39 = v38;
      if (v38)
      {
        OUTLINED_FUNCTION_40_0((uint64_t)objc_msgSend(v38, sel_setReason_, 2 * ((_BYTE)v48 == 0)), &qword_254447330);
        OUTLINED_FUNCTION_36_0(v3, (uint64_t)v37, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
        v40 = v39;
        v8 = sub_24742F3E8(v3);
        OUTLINED_FUNCTION_48_0(v40, sel_setTcuId_);

      }
      v41 = OUTLINED_FUNCTION_82_0(objc_allocWithZone(MEMORY[0x24BE95DA8]));
      OUTLINED_FUNCTION_59_0(v41, sel_setFailed_);
      sub_24742EFF4();
      if (v42)
      {
        v43 = v42;
        OUTLINED_FUNCTION_109(v42, sel_setTtmNeuralCombinerRequestContext_);
        OUTLINED_FUNCTION_107(v49);
        sub_24742EB70((uint64_t)v43);

      }
      else
      {
        if (qword_254446B80 != -1)
          swift_once();
        v44 = OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_7_2(v44, (uint64_t)qword_254447420);
        v45 = OUTLINED_FUNCTION_70();
        if (OUTLINED_FUNCTION_24_2(v8))
        {
          v46 = (_WORD *)OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_65_0(v46);
          OUTLINED_FUNCTION_34(&dword_247422000, v8, v45, "error generating the TTMClient Event", (uint8_t *)0x1F34D2000);
          OUTLINED_FUNCTION_1();
        }

      }
      OUTLINED_FUNCTION_71_0((uint64_t)v37);
      OUTLINED_FUNCTION_71_0((uint64_t)v23);
    }
  }
  OUTLINED_FUNCTION_5_2();
}

void sub_247431AC0()
{
  sub_247431ADC();
}

void sub_247431ADC()
{
  NSObject *v0;
  uint64_t v1;
  SEL *v2;
  Class *v3;
  Class *v4;
  Class *v5;
  Class *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  os_log_type_t v30;
  _WORD *v31;
  SEL *v32;
  uint64_t v33;

  OUTLINED_FUNCTION_19_2();
  v32 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_0();
  v14 = v13 - v12;
  v15 = (_QWORD *)OUTLINED_FUNCTION_27_1();
  v16 = *(v15 - 1);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_9_2(v14);
  if (v17)
  {
    sub_2474337CC(v14);
    if (qword_254446B80 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v18, (uint64_t)qword_254447420);
    sub_2474418F0();
    v19 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v19))
    {
      OUTLINED_FUNCTION_4();
      v33 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_20_1(4.8149e-34);
      v21 = OUTLINED_FUNCTION_89(v8, v20, &v33);
      OUTLINED_FUNCTION_14_2(v21);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v22, v23, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v1, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
    v24 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(*v6));
    v25 = v24;
    if (v24)
      objc_msgSend(v24, sel_setExists_, 1);
    v26 = OUTLINED_FUNCTION_14_1(objc_allocWithZone(*v4));
    OUTLINED_FUNCTION_50_0(v26, sel_setStartedOrChanged_);
    OUTLINED_FUNCTION_54_0();
    if (v27)
    {
      v28 = v27;
      OUTLINED_FUNCTION_109(v27, *v32);
      OUTLINED_FUNCTION_94();
      sub_24742EB70((uint64_t)v28);

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v29 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v29, (uint64_t)qword_254447420);
      v30 = OUTLINED_FUNCTION_70();
      if (os_log_type_enabled(v0, v30))
      {
        v31 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_65_0(v31);
        OUTLINED_FUNCTION_34(&dword_247422000, v0, v30, "error generating the TTMClient Event", v10);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  }
  OUTLINED_FUNCTION_5_2();
}

uint64_t sub_247431D80(char a1)
{
  return dword_247442BF4[a1];
}

void sub_247431D94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 (*v40)(uint64_t);
  char *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  os_log_type_t v51;
  _DWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  uint64_t v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[6];
  uint64_t v90[6];
  uint64_t v91;
  uint64_t v92;

  OUTLINED_FUNCTION_19_2();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = OUTLINED_FUNCTION_27_1();
  v79 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  OUTLINED_FUNCTION_106();
  v76 = v5;
  OUTLINED_FUNCTION_67();
  MEMORY[0x24BDAC7A8](v6);
  v84 = (uint64_t)&v74 - v7;
  v92 = MEMORY[0x24BEE4AF8];
  v74 = v1 + 64;
  OUTLINED_FUNCTION_64_0();
  v10 = v9 & v8;
  v75 = (unint64_t)(v11 + 63) >> 6;
  OUTLINED_FUNCTION_32();
  v12 = 0;
  v13 = 0x254446000uLL;
  *(_QWORD *)&v14 = 136315138;
  v86 = v14;
  v85 = MEMORY[0x24BEE4AD8] + 8;
  v78 = v1;
  v77 = v4;
  if (!v10)
    goto LABEL_3;
LABEL_2:
  v82 = (v10 - 1) & v10;
  v83 = v12;
  for (i = __clz(__rbit64(v10)) | (v12 << 6); ; i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    v24 = (char *)(*(_QWORD *)(v1 + 56) + 16 * i);
    v25 = *v24;
    v26 = *((_QWORD *)v24 + 1);
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_60_0();
    OUTLINED_FUNCTION_26_0((uint64_t)v4, 1, v80);
    if (v27)
    {
      OUTLINED_FUNCTION_85();
      OUTLINED_FUNCTION_7_1();
      sub_2474337CC((uint64_t)v4);
      if (qword_254446B80 != -1)
        goto LABEL_54;
      goto LABEL_38;
    }
    OUTLINED_FUNCTION_38_0();
    v28 = v79;
    v29 = v84;
    OUTLINED_FUNCTION_83_0(v84, (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 32));
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95E00]), sel_init);
    if (!v30)
      break;
    v31 = v30;
    sub_247427DC4(0, &qword_254447330);
    v32 = v76;
    OUTLINED_FUNCTION_83_0(v76, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 16));
    v33 = sub_24742F3E8(v32);
    OUTLINED_FUNCTION_48_0(v31, sel_setTcuId_);

    objc_msgSend(v31, sel_setRecommendation_, dword_247442BF4[v25]);
    v34 = v31;
    MEMORY[0x24957A794]();
    v35 = *(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v35 >= *(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      OUTLINED_FUNCTION_35_0();
    v81 = v34;
    sub_247441AF4();
    sub_247441ADC();
    v36 = MEMORY[0x24BEE4AF8];
    v91 = MEMORY[0x24BEE4AF8];
    v37 = *(_QWORD *)(v26 + 16);
    if (v37)
    {
      v38 = v26 + 32;
      v13 = 0x254446000uLL;
      do
      {
        sub_247434170(v38, (uint64_t)v90);
        if (objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95DF0]), sel_init))
        {
          __swift_project_boxed_opaque_existential_1(v90, v90[3]);
          v39 = OUTLINED_FUNCTION_112();
          v41 = (char *)&loc_24743214C + *((int *)qword_247432810 + v40(v39));
          __asm { BR              X9 }
        }
        if (qword_254446B80 != -1)
          swift_once();
        v42 = OUTLINED_FUNCTION_43();
        v43 = __swift_project_value_buffer(v42, (uint64_t)qword_254447420);
        sub_247434170((uint64_t)v90, (uint64_t)v89);
        sub_2474418F0();
        v44 = OUTLINED_FUNCTION_70();
        if (OUTLINED_FUNCTION_6(v44))
        {
          v45 = OUTLINED_FUNCTION_4();
          v88 = OUTLINED_FUNCTION_4();
          *(_DWORD *)v45 = v86;
          sub_247434170((uint64_t)v89, (uint64_t)&v87);
          v46 = sub_247441A04();
          *(_QWORD *)(v45 + 4) = sub_247438888(v46, v47, &v88);
          swift_bridgeObjectRelease();
          sub_2474341AC((uint64_t)v89);
          OUTLINED_FUNCTION_16_2(&dword_247422000, v43, (os_log_type_t)v35, "error initializing TTMSchemaTTMOverrideResult for %s", (uint8_t *)v45);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
        }

        sub_2474341AC((uint64_t)v89);
        sub_2474341AC((uint64_t)v90);
        v38 += 48;
        --v37;
      }
      while (v37);
      OUTLINED_FUNCTION_85();
      v48 = v91;
      v28 = v79;
    }
    else
    {
      OUTLINED_FUNCTION_85();
      v48 = v36;
      v13 = 0x254446000;
    }
    v49 = v81;
    sub_2474341E0(v48, v81, &qword_254447340, 0x24BE95DF0, (SEL *)&selRef_setOverrideResults_);

    OUTLINED_FUNCTION_96(v84, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
    v1 = v78;
    v4 = v77;
    v12 = v83;
    v10 = v82;
    if (v82)
      goto LABEL_2;
LABEL_3:
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_53;
    }
    if (v16 >= v75)
      goto LABEL_45;
    v17 = *(_QWORD *)(v74 + 8 * v16);
    v18 = v12 + 1;
    if (!v17)
    {
      OUTLINED_FUNCTION_76_0();
      if (v19 == v20)
        goto LABEL_45;
      OUTLINED_FUNCTION_90();
      if (!v17)
      {
        OUTLINED_FUNCTION_76_0();
        if (v19 == v20)
          goto LABEL_45;
        OUTLINED_FUNCTION_90();
        if (!v17)
        {
          v22 = v21 + 3;
          if (v22 >= v75)
          {
LABEL_45:
            OUTLINED_FUNCTION_35();
            if (*(_QWORD *)(v13 + 2944) != -1)
              swift_once();
            v61 = OUTLINED_FUNCTION_43();
            __swift_project_value_buffer(v61, (uint64_t)qword_254447420);
            OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_3();
            v62 = sub_2474418F0();
            v63 = sub_247441B18();
            if (OUTLINED_FUNCTION_6_2(v63))
            {
              v64 = OUTLINED_FUNCTION_4();
              v65 = OUTLINED_FUNCTION_4();
              v90[0] = v65;
              *(_DWORD *)v64 = 136315394;
              v66 = OUTLINED_FUNCTION_40_0(v65, &qword_254447348);
              v67 = swift_bridgeObjectRetain();
              v68 = MEMORY[0x24957A7AC](v67, v66);
              v70 = v69;
              swift_bridgeObjectRelease();
              v89[0] = sub_247438888(v68, v70, v90);
              sub_247441B90();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_75();
              *(_WORD *)(v64 + 12) = 2080;
              OUTLINED_FUNCTION_32();
              v71 = sub_247441980();
              v73 = v72;
              OUTLINED_FUNCTION_85();
              v89[0] = sub_247438888(v71, v73, v90);
              sub_247441B90();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_75();
              _os_log_impl(&dword_247422000, v62, (os_log_type_t)v13, "Constructed SELF logging object %s for overridesResult %s", (uint8_t *)v64, 0x16u);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_1();
            }

            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_0();
            swift_beginAccess();
            goto LABEL_51;
          }
          v17 = *(_QWORD *)(v74 + 8 * v22);
          if (!v17)
          {
            while (!__OFADD__(v22, 1))
            {
              OUTLINED_FUNCTION_76_0();
              if (v19 == v20)
                goto LABEL_45;
              OUTLINED_FUNCTION_90();
              v22 = v23 + 1;
              if (v17)
                goto LABEL_19;
            }
LABEL_53:
            __break(1u);
LABEL_54:
            swift_once();
LABEL_38:
            v50 = OUTLINED_FUNCTION_43();
            __swift_project_value_buffer(v50, (uint64_t)qword_254447420);
            OUTLINED_FUNCTION_37_0();
            sub_2474418F0();
            v51 = OUTLINED_FUNCTION_28_2();
            if (OUTLINED_FUNCTION_6_2(v51))
            {
              v52 = (_DWORD *)OUTLINED_FUNCTION_4();
              v90[0] = OUTLINED_FUNCTION_4();
              *v52 = v86;
              v53 = OUTLINED_FUNCTION_37_0();
              v89[0] = OUTLINED_FUNCTION_101(v53, v54, v90);
              OUTLINED_FUNCTION_116();
              OUTLINED_FUNCTION_11();
              OUTLINED_FUNCTION_3_2(&dword_247422000, v55, v56, "error converting tcuId - %s to UUID");
              OUTLINED_FUNCTION_82();
              OUTLINED_FUNCTION_1();
            }
            OUTLINED_FUNCTION_35();
            OUTLINED_FUNCTION_0();

            goto LABEL_51;
          }
          v18 = v22;
        }
      }
    }
LABEL_19:
    v82 = (v17 - 1) & v17;
    v83 = v18;
  }
  v57 = v92;
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_7_1();
  if (qword_254446B80 != -1)
    swift_once();
  v58 = OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_7_2(v58, (uint64_t)qword_254447420);
  v59 = OUTLINED_FUNCTION_28_2();
  if (OUTLINED_FUNCTION_44_0(v59))
  {
    v60 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v60 = 0;
    OUTLINED_FUNCTION_34(&dword_247422000, &NeuralCombiner.name, v57, "error initializing TTMSchemaTTMNeuralCombinerTCUResult", v60);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_96(v29, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
  swift_release();
LABEL_51:
  OUTLINED_FUNCTION_5_2();
}

void sub_247432828()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  os_log_type_t v27;
  _WORD *v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_100();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_13_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_9_2((uint64_t)v8);
  if (v11)
  {
    OUTLINED_FUNCTION_55_0();
    if (qword_254446B80 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v12, (uint64_t)qword_254447420);
    sub_2474418F0();
    v13 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v13))
    {
      OUTLINED_FUNCTION_4();
      v14 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_93(v14);
      OUTLINED_FUNCTION_20_1(4.8149e-34);
      v16 = OUTLINED_FUNCTION_89(v3, v15, &v30);
      OUTLINED_FUNCTION_14_2(v16);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v17, v18, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v1, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    v19 = OUTLINED_FUNCTION_75_0(objc_allocWithZone(MEMORY[0x24BE95DD8]));
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      sub_247431D94();
      if (v22)
      {
        OUTLINED_FUNCTION_40_0(v22, &qword_254447348);
        v4 = (void *)OUTLINED_FUNCTION_72_0();
        OUTLINED_FUNCTION_75();
      }
      else
      {
        v4 = 0;
      }
      OUTLINED_FUNCTION_68_0(v21, sel_setResults_);

    }
    v23 = OUTLINED_FUNCTION_75_0(objc_allocWithZone(MEMORY[0x24BE95DD0]));
    OUTLINED_FUNCTION_50_0(v23, sel_setEnded_);
    OUTLINED_FUNCTION_54_0();
    if (v24)
    {
      v25 = v24;
      OUTLINED_FUNCTION_59_0(v24, sel_setTtmOverrideRequestContext_);
      OUTLINED_FUNCTION_92((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v26 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v26, (uint64_t)qword_254447420);
      v27 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_11_2(v27))
      {
        v28 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_65_0(v28);
        OUTLINED_FUNCTION_34(&dword_247422000, v0, v2, "error generating the TTMClient Event", (uint8_t *)v4);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  }
  OUTLINED_FUNCTION_5_2();
}

id sub_247432AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  id v19;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = OUTLINED_FUNCTION_27_1();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_81_0();
  v8 = (v6 - v7);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_79_0();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95DF8]), sel_init);
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_26_0((uint64_t)v3, 1, v4);
  if (v11)
  {
    sub_2474337CC((uint64_t)v3);
    if (qword_254446B80 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_7_2(v12, (uint64_t)qword_254447420);
    v13 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_24_2(v8))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v14 = 0;
      OUTLINED_FUNCTION_34(&dword_247422000, v8, v13, "Cannot convert tcuID to UUID for TTMClient Event", v14);
      OUTLINED_FUNCTION_1();
    }

  }
  else
  {
    v15 = OUTLINED_FUNCTION_112();
    v18 = OUTLINED_FUNCTION_99(v15, v16, v17);
    if (v10)
    {
      OUTLINED_FUNCTION_40_0(v18, &qword_254447330);
      OUTLINED_FUNCTION_99((uint64_t)v8, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
      v19 = sub_24742F3E8((uint64_t)v8);
      OUTLINED_FUNCTION_48_0(v10, sel_setTcuId_);

    }
    OUTLINED_FUNCTION_113(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  }
  return v10;
}

void sub_247432CC4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  os_log_type_t v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_19_2();
  v4 = v1;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_0();
  v12 = v11 - v10;
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_58_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_9_2(v12);
  if (v14)
  {
    sub_2474337CC(v12);
    if (qword_254446B80 != -1)
      swift_once();
    v15 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v15, (uint64_t)qword_254447420);
    sub_2474418F0();
    v16 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v16))
    {
      v17 = (_DWORD *)OUTLINED_FUNCTION_4();
      v18 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_93(v18);
      *v17 = 136315138;
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_89(v8, v19, &v31);
      OUTLINED_FUNCTION_87_0();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v20, v21, "error converting trpID %s to UUID");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    OUTLINED_FUNCTION_36_0(v2, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
    v22 = OUTLINED_FUNCTION_82_0(objc_allocWithZone(MEMORY[0x24BE95DE0]));
    v23 = sub_247432AE4();
    if (v23)
    {
      v6 = v23;
      if (v22)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3F78);
        v24 = swift_allocObject();
        *(_OWORD *)(v24 + 16) = xmmword_247442B50;
        *(_QWORD *)(v24 + 32) = v6;
        v31 = v24;
        v6 = &v31;
        sub_247441ADC();
        sub_2474341E0(v31, v22, &qword_2576A3F80, 0x24BE95DF8, (SEL *)&selRef_setTcuFailures_);
      }
      else
      {

      }
    }
    v25 = OUTLINED_FUNCTION_82_0(objc_allocWithZone(MEMORY[0x24BE95DD0]));
    OUTLINED_FUNCTION_50_0(v25, sel_setFailed_);
    OUTLINED_FUNCTION_54_0();
    if (v26)
    {
      v27 = v26;
      OUTLINED_FUNCTION_68_0(v26, sel_setTtmOverrideRequestContext_);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
      sub_24742EB70((uint64_t)v27);

    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v28 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_7_2(v28, (uint64_t)qword_254447420);
      v29 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_11_2(v29))
      {
        v30 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_WORD *)v30 = 0;
        OUTLINED_FUNCTION_34(&dword_247422000, v6, (os_log_type_t)v4, "error generating the TTMClient Event", v30);
        OUTLINED_FUNCTION_1();
      }

    }
    OUTLINED_FUNCTION_12_2(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  OUTLINED_FUNCTION_5_2();
}

void sub_247432FE0()
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
  NSObject *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void (*v42)(uint64_t, uint64_t, _QWORD *);
  void (*v43)(uint64_t, uint64_t, _QWORD *);
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73[2];
  os_log_t v74;
  int v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  OUTLINED_FUNCTION_19_2();
  v85 = v0;
  v4 = v3;
  v6 = v5;
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_53_0(v8, v73[0]);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = ((char *)v73 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v73 - v13;
  v15 = (_QWORD *)OUTLINED_FUNCTION_27_1();
  v16 = *(v15 - 1);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_63_0();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v73 - v18;
  OUTLINED_FUNCTION_67();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_78_0();
  sub_2474342C0(v4, (uint64_t)v14);
  OUTLINED_FUNCTION_9_2((uint64_t)v14);
  if (v29)
  {
    sub_2474337CC((uint64_t)v14);
    if (qword_254446B80 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v21, (uint64_t)qword_254447420);
    sub_2474418F0();
    v22 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_6_2(v22))
    {
      v23 = (_DWORD *)OUTLINED_FUNCTION_4();
      v24 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_93(v24);
      *v23 = 136315138;
      OUTLINED_FUNCTION_28();
      v26 = OUTLINED_FUNCTION_89(v6, v25, &v87);
      OUTLINED_FUNCTION_89_0(v26);
      OUTLINED_FUNCTION_87_0();
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_3_2(&dword_247422000, v27, v28, "Error emitting request link because of nil ttmID and requestId - %s");
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_79();
  }
  else
  {
    v82 = v16;
    v83 = v1;
    OUTLINED_FUNCTION_111(v1, (uint64_t)v14);
    OUTLINED_FUNCTION_42_0();
    OUTLINED_FUNCTION_9_2((uint64_t)v12);
    if (!v29)
    {
      v80 = v6;
      v35 = (uint64_t)v19;
      OUTLINED_FUNCTION_111((uint64_t)v19, (uint64_t)v12);
      v36 = OUTLINED_FUNCTION_69(objc_allocWithZone(MEMORY[0x24BE95B60]));
      if (v36)
      {
        v37 = v36;
        v38 = OUTLINED_FUNCTION_69(objc_allocWithZone(MEMORY[0x24BE95B68]));
        if (v38)
        {
          v39 = v38;
          v40 = OUTLINED_FUNCTION_69(objc_allocWithZone(MEMORY[0x24BE95B68]));
          if (v40)
          {
            v41 = v40;
            OUTLINED_FUNCTION_40_0((uint64_t)v40, &qword_254447330);
            v42 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v82 + 16);
            v78 = v35;
            OUTLINED_FUNCTION_111(v2, v35);
            v43 = v42;
            v44 = sub_24742F3E8(v2);
            objc_msgSend(v41, sel_setUuid_, v44);

            objc_msgSend(v41, sel_setComponent_, 1);
            v43(v2, v83, v15);
            v45 = sub_24742F3E8(v2);
            OUTLINED_FUNCTION_48_0(v39, sel_setUuid_);

            objc_msgSend(v39, sel_setComponent_, 37);
            objc_msgSend(v37, sel_setSource_, v39);
            v79 = v41;
            objc_msgSend(v37, sel_setTarget_, v41);
            if (qword_254446B80 != -1)
              swift_once();
            v46 = OUTLINED_FUNCTION_43();
            __swift_project_value_buffer(v46, (uint64_t)qword_254447420);
            sub_2474342C0(v4, v84);
            v47 = v37;
            OUTLINED_FUNCTION_3();
            v48 = v47;
            v49 = sub_2474418F0();
            v50 = sub_247441B18();
            if (OUTLINED_FUNCTION_24_2(v49))
            {
              v51 = OUTLINED_FUNCTION_4();
              v76 = OUTLINED_FUNCTION_4();
              v87 = v76;
              *(_DWORD *)v51 = 136315650;
              v73[1] = v51 + 4;
              v52 = v48;
              v75 = v50;
              v53 = v52;
              v54 = objc_msgSend(v52, sel_description);
              v77 = v48;
              v55 = v54;
              v56 = sub_2474419C8();
              v74 = v49;
              v57 = v56;
              v59 = v58;

              v86 = sub_247438888(v57, v59, &v87);
              sub_247441B90();

              OUTLINED_FUNCTION_60();
              *(_WORD *)(v51 + 12) = 2080;
              v60 = OUTLINED_FUNCTION_108();
              v86 = sub_247438888(v60, v61, &v87);
              sub_247441B90();
              OUTLINED_FUNCTION_79();
              OUTLINED_FUNCTION_95();
              *(_WORD *)(v51 + 22) = 2080;
              v62 = sub_247441B78();
              v86 = OUTLINED_FUNCTION_61_0(v62, v63);
              sub_247441B90();
              OUTLINED_FUNCTION_7_1();
              OUTLINED_FUNCTION_55_0();
              _os_log_impl(&dword_247422000, v74, (os_log_type_t)v75, "Emitting request link: %s with requestId: %s, ttmId: %s", (uint8_t *)v51, 0x20u);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_1();
            }
            OUTLINED_FUNCTION_79();

            OUTLINED_FUNCTION_55_0();
            v71 = v83;
            v72 = v78;
            OUTLINED_FUNCTION_107(v85);
            sub_24742EB70((uint64_t)v48);

            OUTLINED_FUNCTION_71_0(v72);
            v70 = v71;
LABEL_31:
            OUTLINED_FUNCTION_71_0(v70);
            goto LABEL_32;
          }

        }
        else
        {
          v39 = v37;
        }

      }
      if (qword_254446B80 != -1)
        swift_once();
      v64 = OUTLINED_FUNCTION_43();
      OUTLINED_FUNCTION_2_2(v64, (uint64_t)qword_254447420);
      sub_2474418F0();
      v65 = OUTLINED_FUNCTION_70();
      if (os_log_type_enabled((os_log_t)0x1F34D2000, v65))
      {
        v66 = (uint8_t *)OUTLINED_FUNCTION_4();
        v87 = OUTLINED_FUNCTION_4();
        *(_DWORD *)v66 = 136315138;
        v67 = OUTLINED_FUNCTION_108();
        v69 = sub_247438888(v67, v68, &v87);
        OUTLINED_FUNCTION_88_0(v69);
        sub_247441B90();
        OUTLINED_FUNCTION_79();
        OUTLINED_FUNCTION_60();
        OUTLINED_FUNCTION_16_2(&dword_247422000, 0x1F34D2000, v65, "Failed to initialize inRequest schema objects. requestId: %s", v66);
        OUTLINED_FUNCTION_82();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_79();

      OUTLINED_FUNCTION_71_0((uint64_t)v19);
      v70 = v83;
      goto LABEL_31;
    }
    OUTLINED_FUNCTION_84_0();
    if (qword_254446B80 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_2_2(v30, (uint64_t)qword_254447420);
    sub_2474418F0();
    v31 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_9(v31))
    {
      v32 = (uint8_t *)OUTLINED_FUNCTION_4();
      v87 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v32 = 136315138;
      OUTLINED_FUNCTION_28();
      v34 = OUTLINED_FUNCTION_89(v6, v33, &v87);
      OUTLINED_FUNCTION_14_2(v34);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v12, (os_log_type_t)v14, "error converting requestId %s to UUID", v32);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_79();

    OUTLINED_FUNCTION_25_0(v83, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));
  }
LABEL_32:
  OUTLINED_FUNCTION_5_2();
}

uint64_t sub_247433788()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFLogger()
{
  return objc_opt_self();
}

uint64_t sub_2474337CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24743380C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_24743382C(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_110();
}

void sub_247433848(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544473B8);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a1;
    v4[3] = 2 * v5 - 64;
  }
  OUTLINED_FUNCTION_110();
}

void sub_2474338A8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = sub_247441A94();
    OUTLINED_FUNCTION_74_0(v4);
  }
  else
  {
    v3 = MEMORY[0x24957A74C](15, a1 >> 16);
    OUTLINED_FUNCTION_74_0(v3);
  }
  OUTLINED_FUNCTION_110();
}

uint64_t sub_2474338FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  swift_bridgeObjectRetain();
  v5 = sub_247441AA0();
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
  v5 = sub_247433C60();
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
    v7 = (unsigned __int8 *)sub_247441C2C();
  }
LABEL_7:
  v11 = sub_2474339E0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_2474339E0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247433C60()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_247433CBC();
  v4 = sub_247433CF0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247433CBC()
{
  return sub_247441AAC();
}

uint64_t sub_247433CF0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    sub_247433E34(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      sub_247433848(v9, 0);
      v12 = v11;
      sub_247433F20(v16, v11 + 32, v10, a1, a2, a3, a4);
      v14 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v14 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v12 = MEMORY[0x24BEE4AF8];
    }
    v15 = MEMORY[0x24957A710](v12 + 32, *(_QWORD *)(v12 + 16));
    swift_release();
    return v15;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24957A710);
LABEL_9:
      sub_247441C2C();
      goto LABEL_12;
    }
    v16[0] = a3;
    v16[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24957A710]((char *)v16 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_247433E34(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a1;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    sub_2474338A8(a1, a3, a4);
    v7 = v10;
  }
  if ((a2 & 0xC) == v9)
  {
    sub_2474338A8(a2, a3, a4);
    a2 = v11;
    if ((a4 & 0x1000000000000000) == 0)
      return;
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return;
  }
  v12 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v12 = a3 & 0xFFFFFFFFFFFFLL;
  if (v12 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v12 >= a2 >> 16)
  {
    sub_247441A7C();
    return;
  }
  __break(1u);
}

void sub_247433F20(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v11 = a4;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v29 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = a4;
LABEL_33:
    *a1 = a4;
    a1[1] = a5;
    a1[2] = a6;
    a1[3] = a7;
    a1[4] = v11;
    return;
  }
  v13 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v23 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v24 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v25 = v16;
  v28 = a3 - 1;
  v11 = a4;
  while (1)
  {
    v17 = v11;
    if ((v11 & 0xC) == v15)
      sub_2474338A8(v11, a6, a7);
    if (v17 >> 14 < v29 || v17 >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      v21 = sub_247441A88();
    }
    else
    {
      v19 = v17 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v30[0] = a6;
        v30[1] = v24;
        v21 = *((_BYTE *)v30 + v19);
      }
      else
      {
        v20 = v23;
        if ((a6 & 0x1000000000000000) == 0)
          v20 = sub_247441C2C();
        v21 = *(_BYTE *)(v20 + v19);
      }
    }
    if ((v11 & 0xC) == v15)
    {
      sub_2474338A8(v11, a6, a7);
      v11 = v22;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v25 <= v11 >> 16)
      goto LABEL_35;
    v11 = sub_247441A64();
LABEL_31:
    *(_BYTE *)(a2 + v13) = v21;
    if (v28 != v13)
    {
      ++v13;
      if (v10 != v11 >> 14)
        continue;
    }
    goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void sub_247434120(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2474419BC();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setPrerelease_, v4);

}

uint64_t sub_247434170(uint64_t a1, uint64_t a2)
{
  sub_24742D580(a2, a1);
  return a2;
}

uint64_t sub_2474341AC(uint64_t a1)
{
  j____swift_destroy_boxed_opaque_existential_1();
  return a1;
}

void sub_2474341E0(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  id v7;

  sub_247427DC4(0, a3);
  v7 = (id)sub_247441AC4();
  OUTLINED_FUNCTION_95();
  objc_msgSend(a2, *a5, v7);

}

uint64_t sub_24743424C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

unint64_t sub_247434284()
{
  unint64_t result;

  result = qword_2576A3F88;
  if (!qword_2576A3F88)
  {
    result = MEMORY[0x24957ADDC](&protocol conformance descriptor for TTClientError, &type metadata for TTClientError);
    atomic_store(result, (unint64_t *)&qword_2576A3F88);
  }
  return result;
}

uint64_t sub_2474342C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_247434308()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A3F90;
  if (!qword_2576A3F90)
  {
    v1 = sub_247441614();
    result = MEMORY[0x24957ADDC](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2576A3F90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_6_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2474418F0();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

BOOL OUTLINED_FUNCTION_11_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_247441B90();
}

void OUTLINED_FUNCTION_16_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_20_1(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_24_2(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_247441614();
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return sub_247441B24();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_247441AE8();
}

uint64_t OUTLINED_FUNCTION_36_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_2474415D8();
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, unint64_t *a2)
{
  return sub_247427DC4(0, a2);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_2474415D8();
}

BOOL OUTLINED_FUNCTION_44_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_247441B90();
}

id OUTLINED_FUNCTION_48_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return sub_247441B90();
}

id OUTLINED_FUNCTION_50_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_53_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_54_0()
{
  sub_24742EFF4();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  uint64_t v0;

  return sub_2474337CC(v0);
}

id OUTLINED_FUNCTION_59_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return sub_2474415D8();
}

uint64_t OUTLINED_FUNCTION_61_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_247438888(a1, a2, (uint64_t *)(v2 - 88));
}

_WORD *OUTLINED_FUNCTION_65_0(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

id OUTLINED_FUNCTION_68_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id OUTLINED_FUNCTION_69(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_71_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return sub_247441AC4();
}

unint64_t OUTLINED_FUNCTION_74_0(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

id OUTLINED_FUNCTION_75_0(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_77_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

id OUTLINED_FUNCTION_82_0(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_83_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  uint64_t v0;

  return sub_2474337CC(v0);
}

uint64_t OUTLINED_FUNCTION_85_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_86_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_88_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_89_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

id OUTLINED_FUNCTION_91(id a1, SEL a2, double a3)
{
  int v3;

  LODWORD(a3) = v3;
  return objc_msgSend(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_92(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, a2);
  return sub_24742EB70(v2);
}

uint64_t OUTLINED_FUNCTION_93(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = result;
  return result;
}

_QWORD *OUTLINED_FUNCTION_94()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
}

uint64_t OUTLINED_FUNCTION_95()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_96@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_97@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_24743424C(v1, a1);
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_99@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_101(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_247438888(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_bridgeObjectRelease();
}

_QWORD *OUTLINED_FUNCTION_107@<X0>(uint64_t a1@<X8>)
{
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
}

uint64_t OUTLINED_FUNCTION_108()
{
  return sub_247441A28();
}

id OUTLINED_FUNCTION_109(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_111(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_112()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_113@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_114()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_116()
{
  return sub_247441B90();
}

uint64_t sub_247434844()
{
  uint64_t result;

  type metadata accessor for AllowListAssetPathGetter();
  swift_allocObject();
  result = sub_2474348DC();
  qword_2544473C0 = result;
  return result;
}

uint64_t sub_24743487C()
{
  uint64_t v0;

  v0 = sub_247441914();
  __swift_allocate_value_buffer(v0, qword_254447408);
  *(_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_254447408) = 500;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

uint64_t sub_2474348DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD aBlock[7];

  v1 = v0;
  v2 = sub_247441968();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&aBlock[-1] - v7;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0xE000000000000000;
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedHandler);
  sub_247441BCC();
  swift_unknownObjectRelease();
  sub_2474360F8();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v10 = aBlock[6];
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v1;
    *(_QWORD *)(v12 + 24) = v11;
    aBlock[4] = sub_247436160;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247434E50;
    aBlock[3] = &block_descriptor_1;
    v13 = _Block_copy(aBlock);
    swift_retain();
    v14 = v11;
    swift_release();
    -[NSObject getAllowPhrasesListOverrideFileWithCompletion:](v10, sel_getAllowPhrasesListOverrideFileWithCompletion_, v13);
    _Block_release(v13);
    sub_24744195C();
    if (qword_2544473A0 != -1)
      swift_once();
    v15 = sub_247441914();
    v16 = __swift_project_value_buffer(v15, (uint64_t)qword_254447408);
    MEMORY[0x24957A650](v6, v16);
    v17 = *(void (**)(char *, uint64_t))(v3 + 8);
    v17(v6, v2);
    sub_247441B30();
    v17(v8, v2);
    if ((sub_247441920() & 1) != 0)
    {
      if (qword_254446B80 != -1)
        swift_once();
      v18 = sub_2474418FC();
      __swift_project_value_buffer(v18, (uint64_t)qword_254447420);
      v19 = sub_2474418F0();
      v20 = sub_247441B24();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_247422000, v19, v20, "Timed out waiting to get asset path with getAllowPhrasesListOverrideFile api", v21, 2u);
        MEMORY[0x24957AE54](v21, -1, -1);

        goto LABEL_15;
      }

    }
    v10 = v14;
    goto LABEL_15;
  }
  if (qword_254446B80 != -1)
    swift_once();
  v22 = sub_2474418FC();
  __swift_project_value_buffer(v22, (uint64_t)qword_254447420);
  v10 = sub_2474418F0();
  v23 = sub_247441B24();
  if (os_log_type_enabled(v10, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_247422000, v10, v23, "AllowListAssetPathGetter - Error trying to fetch config from CSAttSiriMitigationAssetProvider", v24, 2u);
    MEMORY[0x24957AE54](v24, -1, -1);
  }
LABEL_15:

  return v1;
}

void sub_247434C84(uint64_t a1, unint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_254446B80 != -1)
    swift_once();
  v8 = sub_2474418FC();
  __swift_project_value_buffer(v8, (uint64_t)qword_254447420);
  swift_bridgeObjectRetain_n();
  v9 = sub_2474418F0();
  v10 = sub_247441B18();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v13 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_247438888(a1, a2, &v13);
    sub_247441B90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247422000, v9, v10, "Completion block of getAllowPhrasesListOverrideFile invoked and configPath is cached - %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v12, -1, -1);
    MEMORY[0x24957AE54](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  dispatch_group_leave(a4);
}

uint64_t sub_247434E50(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = sub_2474419C8();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247434EA4()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AllowListAssetPathGetter()
{
  return objc_opt_self();
}

uint64_t sub_247434EE8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances) = a1;
  return swift_bridgeObjectRelease();
}

id sub_247434F00()
{
  char *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v1 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances] = MEMORY[0x24BEE4B08];
  if (qword_254446B80 != -1)
    swift_once();
  v2 = sub_2474418FC();
  __swift_project_value_buffer(v2, (uint64_t)qword_254447420);
  v3 = sub_2474418F0();
  v4 = sub_247441B18();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247422000, v3, v4, "fetching allow list path from CSAttSiriMitigationAssetProvider", v5, 2u);
    OUTLINED_FUNCTION_1();
  }

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for AllowListMatcher();
  v6 = objc_msgSendSuper2(&v10, sel_init);
  v7 = qword_2544473A8;
  v8 = v6;
  if (v7 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_247435078();
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t sub_247435078()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2474419B0();
  v0 = sub_24742A6AC();
  v1 = MEMORY[0x24957A89C](10, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x24BEE0D00], v0);
  swift_bridgeObjectRelease();
  v2 = sub_2474352CC(v1);
  OUTLINED_FUNCTION_6_3();
  v3 = sub_2474353C8(v2);
  return sub_247434EE8(v3);
}

uint64_t sub_2474352CC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
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
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_24743903C(0, v1, 0);
    v2 = v16;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 3);
      v6 = *(v4 - 2);
      v7 = *(v4 - 1);
      v8 = *v4;
      swift_bridgeObjectRetain();
      v9 = MEMORY[0x24957A6F8](v5, v6, v7, v8);
      v11 = v10;
      swift_bridgeObjectRelease();
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_24743903C((char *)(v12 > 1), v13 + 1, 1);
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2474353C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_247441B0C();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_247435684(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_6_3();
    return v10;
  }
  else
  {
    v7 = v2;
    OUTLINED_FUNCTION_6_3();
  }
  return v7;
}

uint64_t sub_247435470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;

  v1 = sub_247441A10();
  v3 = v2;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager16AllowListMatcher_allowedUtterances);
  swift_bridgeObjectRetain();
  sub_2474354F0(v1, v3, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 1;
  else
    return 2;
}

void sub_2474354F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  char v18;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_247441D64();
    sub_247441A40();
    v6 = sub_247441D7C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    OUTLINED_FUNCTION_0_2();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (OUTLINED_FUNCTION_3_3() & 1) == 0)
      {
        v13 = ~v7;
        v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_0_2();
        if ((v15 & 1) != 0)
        {
          do
          {
            v16 = (_QWORD *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2)
              break;
            if ((OUTLINED_FUNCTION_3_3() & 1) != 0)
              break;
            v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_0_2();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

id sub_2474355E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AllowListMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AllowListMatcher()
{
  return objc_opt_self();
}

uint64_t sub_247435648()
{
  return sub_247435470();
}

uint64_t sub_247435668(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_247435684(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_247441D64();
  swift_bridgeObjectRetain();
  sub_247441A40();
  v8 = sub_247441D7C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_247441D10() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_247441D10() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_247435B08(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_247435830()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3FA0);
  v3 = sub_247441BF0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_247441D64();
      sub_247441A40();
      result = sub_247441D7C();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_247435668(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_247435B08(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_247435830();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_247435CA0();
      goto LABEL_22;
    }
    sub_247435E50();
  }
  v11 = *v4;
  sub_247441D64();
  sub_247441A40();
  result = sub_247441D7C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_247441D10(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_247441D1C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_247441D10();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_247435CA0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3FA0);
  v2 = *v0;
  v3 = sub_247441BE4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_247435E50()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3FA0);
  v3 = sub_247441BF0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_247441D64();
    swift_bridgeObjectRetain();
    sub_247441A40();
    result = sub_247441D7C();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_2474360F8()
{
  unint64_t result;

  result = qword_254446B90;
  if (!qword_254446B90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254446B90);
  }
  return result;
}

uint64_t sub_247436134()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_247436160(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_247434C84(a1, a2, *(_QWORD *)(v2 + 16), *(NSObject **)(v2 + 24));
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

void OUTLINED_FUNCTION_1_3()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_247441D10();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_8_2()
{
  void *v0;

  return v0;
}

uint64_t sub_2474361D4()
{
  return sub_247436388();
}

uint64_t sub_2474361E0(char a1)
{
  _BYTE v3[72];

  sub_247441D64();
  sub_247436270((uint64_t)v3, a1);
  return sub_247441D7C();
}

uint64_t sub_247436224()
{
  return sub_247436428();
}

uint64_t sub_247436230()
{
  sub_247441A40();
  return swift_bridgeObjectRelease();
}

void sub_247436270(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2474362B4()
{
  sub_247441A40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24743634C()
{
  sub_247441A40();
  return OUTLINED_FUNCTION_18_1();
}

uint64_t sub_247436388()
{
  sub_247441D64();
  sub_247441A40();
  OUTLINED_FUNCTION_6_3();
  return sub_247441D7C();
}

uint64_t sub_2474363E8(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_247441D64();
  sub_247436270((uint64_t)v4, a2);
  return sub_247441D7C();
}

uint64_t sub_247436428()
{
  sub_247441D64();
  sub_247441A40();
  swift_bridgeObjectRelease();
  return sub_247441D7C();
}

SiriTurnTakingManager::TTInvocationType_optional __swiftcall TTInvocationType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriTurnTakingManager::TTInvocationType_optional result;

  v2 = v1;
  v3 = sub_247441C80();
  OUTLINED_FUNCTION_6_3();
  v4 = 6;
  if (v3 < 6)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_43_0();
  return result;
}

uint64_t TTInvocationType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24743650C + 4 * byte_247442C86[*v0]))(0xD000000000000010, 0x80000002474433F0);
}

uint64_t sub_24743650C()
{
  return 0x72506E6F74747562;
}

uint64_t sub_24743652C(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_247436544()
{
  return 0x6972546563696F76;
}

uint64_t sub_247436564()
{
  return 0x65636E756F6E6E61;
}

uint64_t sub_24743657C()
{
  return 0x726568746FLL;
}

void sub_247436590(char *a1)
{
  sub_24743FBC8(*a1);
}

uint64_t sub_24743659C()
{
  char *v0;

  return sub_2474361E0(*v0);
}

void sub_2474365A4(uint64_t a1)
{
  char *v1;

  sub_247436270(a1, *v1);
}

uint64_t sub_2474365AC(uint64_t a1)
{
  char *v1;

  return sub_2474363E8(a1, *v1);
}

SiriTurnTakingManager::TTInvocationType_optional sub_2474365B4(Swift::String *a1)
{
  return TTInvocationType.init(rawValue:)(*a1);
}

void sub_2474365C0(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = TTInvocationType.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_110();
}

void TTCandidate.tcuId.getter()
{
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_110();
}

double TTCandidate.asrScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void TTCandidate.intendedInfo.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 32);
  OUTLINED_FUNCTION_110();
}

uint64_t TTCandidate.userParses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.activeTasks.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTCandidate.executedTasks.getter()
{
  return swift_bridgeObjectRetain();
}

void TTCandidate.tcuUtterance.getter()
{
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_110();
}

uint64_t TTCandidate.isResponseToSiriPrompt.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char v10;

  v10 = *a3;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = v10;
  *(_QWORD *)(a9 + 24) = 0;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  *(_QWORD *)(a9 + 72) = a10;
  *(_BYTE *)(a9 + 80) = 0;
  return result;
}

uint64_t TTCandidate.init(tcuId:invocationType:intendedInfo:userParses:activeTasks:executedTasks:tcuUtterance:isResponseToSiriPrompt:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  char v11;

  v11 = *a3;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = v11;
  *(_QWORD *)(a9 + 24) = 0;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  *(_QWORD *)(a9 + 72) = a10;
  *(_BYTE *)(a9 + 80) = a11;
  return result;
}

uint64_t TTCandidate.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28[5];
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v1 = sub_247441668();
  v27 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_0();
  v26 = v3 - v2;
  v4 = *(_BYTE *)(v0 + 16);
  v5 = *(void **)(v0 + 32);
  v24 = *(_QWORD *)(v0 + 40);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v6, sel_description);
    sub_2474419C8();

  }
  v28[1] = 0xE000000000000000;
  sub_247441C08();
  v30 = 0;
  v31 = 0xE000000000000000;
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20();
  sub_247441A4C();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_2_3();
  v28[0] = v4;
  sub_247441C38();
  sub_247441A4C();
  sub_247441B00();
  OUTLINED_FUNCTION_2_3();
  sub_247441A4C();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_38_1();
  v8 = *(_QWORD *)(v24 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v29 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_21_2();
    OUTLINED_FUNCTION_37_1(0, v8);
    sub_247441710();
    v10 = v24 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
    v25 = *(_QWORD *)(v27 + 72);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    do
    {
      v11(v26, v10, v1);
      v28[3] = v1;
      v28[4] = sub_247439058();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
      v11((uint64_t)boxed_opaque_existential_1, v26, v1);
      v13 = sub_247441704();
      v15 = v14;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v1);
      v9 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_28_3(0, *(_QWORD *)(v9 + 16) + 1);
        v9 = v29;
      }
      v17 = *(_QWORD *)(v9 + 16);
      v16 = *(_QWORD *)(v9 + 24);
      if (v17 >= v16 >> 1)
      {
        v19 = OUTLINED_FUNCTION_44_1(v16);
        OUTLINED_FUNCTION_28_3((char *)v19, v17 + 1);
        v9 = v29;
      }
      *(_QWORD *)(v9 + 16) = v17 + 1;
      v18 = v9 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v13;
      *(_QWORD *)(v18 + 40) = v15;
      v10 += v25;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  v28[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  sub_2474390D4();
  sub_247441998();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_38_1();
  v20 = sub_24744162C();
  v21 = OUTLINED_FUNCTION_83();
  MEMORY[0x24957A7AC](v21, v20);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2_3();
  v22 = OUTLINED_FUNCTION_83();
  MEMORY[0x24957A7AC](v22, v20);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_95();
  sub_247441A4C();
  OUTLINED_FUNCTION_7_3();
  sub_247441A4C();
  OUTLINED_FUNCTION_6_3();
  sub_247441A4C();
  sub_247441A4C();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_3();
  return v30;
}

uint64_t TTManagerRequest.ttCandidates.getter()
{
  return OUTLINED_FUNCTION_15_1();
}

void TTManagerRequest.trpCandidateId.getter()
{
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_110();
}

void TTManagerRequest.requestId.getter()
{
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_110();
}

id TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_23_2();
  return TTManagerRequest.init(ttCandidates:trpCandidateId:)(a1, a2, a3);
}

id TTManagerRequest.init(ttCandidates:trpCandidateId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  objc_super v19;

  v7 = sub_247441614();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_0();
  v11 = v10 - v9;
  *(_QWORD *)&v3[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates] = a1;
  v12 = &v3[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId];
  *(_QWORD *)v12 = a2;
  *((_QWORD *)v12 + 1) = a3;
  v13 = v3;
  sub_247441608();
  v14 = sub_2474415E4();
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  v17 = (uint64_t *)&v13[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId];
  *v17 = v14;
  v17[1] = v16;

  v19.receiver = v13;
  v19.super_class = (Class)type metadata accessor for TTManagerRequest();
  return objc_msgSendSuper2(&v19, sel_init);
}

id TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_23_2();
  return TTManagerRequest.init(ttCandidates:trpCandidateId:requestId:)(a1, a2, a3, a4, a5);
}

id TTManagerRequest.init(ttCandidates:trpCandidateId:requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  *(_QWORD *)&v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates] = a1;
  v6 = &v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_trpCandidateId];
  *(_QWORD *)v6 = a2;
  *((_QWORD *)v6 + 1) = a3;
  v7 = &v5[OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_requestId];
  *(_QWORD *)v7 = a4;
  *((_QWORD *)v7 + 1) = a5;
  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for TTManagerRequest();
  return OUTLINED_FUNCTION_45_1((uint64_t)v15.super_class, sel_init, v8, v9, v10, v11, v12, v13, v15);
}

uint64_t sub_247436D90()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v11;
  _QWORD v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v23 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_37_1(0, v2);
    v3 = 0;
    v4 = v23;
    v11 = v1;
    do
    {
      v21 = 123;
      v22 = 0xE100000000000000;
      v12[0] = *(_QWORD *)(v1 + v3 + 32);
      v12[1] = *(_QWORD *)(v1 + v3 + 40);
      v13 = *(_BYTE *)(v1 + v3 + 48);
      v14 = *(_QWORD *)(v1 + v3 + 56);
      v15 = *(_QWORD *)(v1 + v3 + 72);
      v16 = *(_QWORD *)(v1 + v3 + 80);
      v17 = *(_QWORD *)(v1 + v3 + 88);
      v18 = *(_QWORD *)(v1 + v3 + 96);
      v19 = *(_QWORD *)(v1 + v3 + 104);
      v20 = *(_BYTE *)(v1 + v3 + 112);
      v5 = *(id *)(v1 + v3 + 64);
      OUTLINED_FUNCTION_48();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_32();
      OUTLINED_FUNCTION_20();
      swift_bridgeObjectRetain();
      TTCandidate.description.getter();
      sub_247441A4C();
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_85();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37();

      OUTLINED_FUNCTION_38_0();
      v23 = v4;
      v7 = *(_QWORD *)(v4 + 16);
      v6 = *(_QWORD *)(v4 + 24);
      if (v7 >= v6 >> 1)
      {
        v9 = OUTLINED_FUNCTION_44_1(v6);
        OUTLINED_FUNCTION_28_3((char *)v9, v7 + 1);
        v4 = v23;
      }
      *(_QWORD *)(v4 + 16) = v7 + 1;
      v8 = v4 + 16 * v7;
      *(_QWORD *)(v8 + 32) = 123;
      *(_QWORD *)(v8 + 40) = 0xE100000000000000;
      v3 += 88;
      --v2;
      v1 = v11;
    }
    while (v2);
    OUTLINED_FUNCTION_6_3();
  }
  sub_247441C08();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  sub_2474390D4();
  sub_247441998();
  swift_bridgeObjectRelease();
  sub_247441A4C();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_8_3();
  sub_247441C08();
  swift_bridgeObjectRelease();
  strcpy((char *)v12, "{requestId: ");
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_10_0();
  sub_247441A4C();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_10_0();
  sub_247441A4C();
  sub_247441A4C();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_8_3();
  return v12[0];
}

id TTManagerRequest.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_23_2(), sel_init);
}

void TTManagerRequest.init()()
{
  OUTLINED_FUNCTION_52_0();
  __break(1u);
}

id TTManagerRequest.__deallocating_deinit()
{
  return sub_2474386A0(type metadata accessor for TTManagerRequest);
}

void TTResult.tcuId.getter()
{
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_110();
}

uint64_t TTResult.isDropped.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

SiriTurnTakingManager::TTResult __swiftcall TTResult.init(tcuId:ttMitigationDecision:isDropped:)(Swift::String tcuId, SiriTurnTakingManager::TTMitigationDecision ttMitigationDecision, Swift::Bool isDropped)
{
  uint64_t v3;
  char v4;
  SiriTurnTakingManager::TTResult result;

  v4 = *(_BYTE *)ttMitigationDecision;
  *(Swift::String *)v3 = tcuId;
  *(_BYTE *)(v3 + 16) = v4;
  *(_BYTE *)(v3 + 17) = isDropped;
  result.tcuId = tcuId;
  result.ttMitigationDecision = ttMitigationDecision;
  return result;
}

SiriTurnTakingManager::TTResult __swiftcall TTResult.init(tcuId:ttMitigationDecision:)(Swift::String tcuId, SiriTurnTakingManager::TTMitigationDecision ttMitigationDecision)
{
  uint64_t v2;
  unsigned __int8 v3;
  SiriTurnTakingManager::TTResult result;

  v3 = *(_BYTE *)ttMitigationDecision;
  *(Swift::String *)v2 = tcuId;
  *(_WORD *)(v2 + 16) = v3;
  result.tcuId = tcuId;
  result.ttMitigationDecision = ttMitigationDecision;
  return result;
}

uint64_t TTResult.description.getter()
{
  sub_247441C08();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_95();
  sub_247441A4C();
  sub_247441C38();
  OUTLINED_FUNCTION_8_3();
  return 0;
}

uint64_t TTManagerResponse.ttResults.getter()
{
  return OUTLINED_FUNCTION_15_1();
}

id TTManagerResponse.__allocating_init(_:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v3 = (char *)OUTLINED_FUNCTION_23_2();
  *(_QWORD *)&v3[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = a1;
  v11.receiver = v3;
  v11.super_class = v1;
  return OUTLINED_FUNCTION_45_1((uint64_t)v3, sel_init, v4, v5, v6, v7, v8, v9, v11);
}

id TTManagerResponse.init(_:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = a1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for TTManagerResponse();
  return OUTLINED_FUNCTION_45_1((uint64_t)v9.super_class, sel_init, v2, v3, v4, v5, v6, v7, v9);
}

id sub_2474372D8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_2474419BC();
  OUTLINED_FUNCTION_95();
  return v5;
}

uint64_t sub_24743732C()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _QWORD v10[2];
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_21_2();
    OUTLINED_FUNCTION_37_1(0, v2);
    v3 = v11;
    v4 = v1 + 48;
    do
    {
      v10[0] = 123;
      v10[1] = 0xE100000000000000;
      OUTLINED_FUNCTION_32();
      sub_247441C08();
      OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_32();
      sub_247441A4C();
      OUTLINED_FUNCTION_85();
      sub_247441A4C();
      sub_247441C38();
      OUTLINED_FUNCTION_8_3();
      sub_247441A4C();
      OUTLINED_FUNCTION_60();
      OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_85();
      v11 = v3;
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        v8 = OUTLINED_FUNCTION_44_1(v5);
        OUTLINED_FUNCTION_28_3((char *)v8, v6 + 1);
        v3 = v11;
      }
      v4 += 24;
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = 123;
      *(_QWORD *)(v7 + 40) = 0xE100000000000000;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  sub_247441C08();
  swift_bridgeObjectRelease();
  strcpy((char *)v10, "{TTResults: [");
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  sub_2474390D4();
  sub_247441998();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_27();
  sub_247441A4C();
  return v10[0];
}

void TTManagerResponse.init()()
{
  OUTLINED_FUNCTION_52_0();
  __break(1u);
}

id TTManagerResponse.__deallocating_deinit()
{
  return sub_2474386A0(type metadata accessor for TTManagerResponse);
}

SiriTurnTakingManager::TTMitigationDecision_optional __swiftcall TTMitigationDecision.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriTurnTakingManager::TTMitigationDecision_optional result;

  v2 = v1;
  v3 = sub_247441C80();
  OUTLINED_FUNCTION_6_3();
  v4 = 3;
  if (v3 < 3)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_43_0();
  return result;
}

uint64_t TTMitigationDecision.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aSelectedmitiga[8 * *v0];
}

void sub_24743762C()
{
  sub_24743FB70();
}

uint64_t sub_247437638()
{
  return sub_247436224();
}

uint64_t sub_247437640()
{
  return sub_247436230();
}

uint64_t sub_247437648()
{
  return sub_247436428();
}

SiriTurnTakingManager::TTMitigationDecision_optional sub_247437650(Swift::String *a1)
{
  return TTMitigationDecision.init(rawValue:)(*a1);
}

void sub_24743765C(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = TTMitigationDecision.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_110();
}

id TTClient.init()()
{
  void *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  objc_super v14;
  __int128 v15;
  void *v16;
  char **v17;

  v16 = &unk_2518A1DA0;
  v17 = &off_2518A1DB8;
  v1 = (_QWORD *)OUTLINED_FUNCTION_26();
  *(_QWORD *)&v15 = v1;
  v2 = v0;
  v1[7] = sub_24742C1FC();
  v3 = type metadata accessor for SELFLogger();
  v4 = (_QWORD *)OUTLINED_FUNCTION_26();
  v5 = type metadata accessor for SelfEmitter();
  v6 = OUTLINED_FUNCTION_26();
  v4[5] = v5;
  v4[6] = &off_2518A2040;
  v4[2] = v6;
  v1[5] = v3;
  v1[6] = &off_2518A1FE0;
  v1[2] = v4;
  sub_24742D41C(&v15, (uint64_t)&v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_overrideSystem]);
  v7 = type metadata accessor for NeuralCombiner();
  OUTLINED_FUNCTION_26();
  v8 = sub_2474247D0();
  v9 = (uint64_t *)&v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_nc];
  v9[3] = v7;
  v9[4] = (uint64_t)&off_2518A15F8;
  *v9 = v8;
  v10 = (_QWORD *)OUTLINED_FUNCTION_26();
  v11 = OUTLINED_FUNCTION_26();
  v10[5] = v5;
  v10[6] = &off_2518A2040;
  v10[2] = v11;
  v12 = &v2[OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger];
  *((_QWORD *)v12 + 3) = v3;
  *((_QWORD *)v12 + 4) = &off_2518A1FE0;
  *(_QWORD *)v12 = v10;

  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for TTClient();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_2474377FC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  _QWORD *v37;
  id v38;
  id v39;
  uint64_t v41;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254446B50);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_0();
  v6 = v5 - v4;
  v7 = (_QWORD *)(v1 + OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_selfLogger);
  OUTLINED_FUNCTION_17();
  sub_24742EBE4();
  OUTLINED_FUNCTION_17();
  sub_24742F464();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_247432FE0();
  if (qword_254446B80 != -1)
    swift_once();
  v8 = sub_2474418FC();
  __swift_project_value_buffer(v8, (uint64_t)qword_254447420);
  v9 = a1;
  v10 = sub_2474418F0();
  v11 = sub_247441B18();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = v9;
    v13 = (uint8_t *)OUTLINED_FUNCTION_4();
    v41 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v13 = 136315138;
    v14 = objc_msgSend(v9, sel_description);
    v15 = sub_2474419C8();
    v17 = v16;

    sub_247438888(v15, v17, &v41);
    sub_247441B90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247422000, v10, v11, "received ttRequest - %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_54_1(OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_overrideSystem);
  v18 = v9;
  v19 = OUTLINED_FUNCTION_49_1();
  v23 = sub_24742C3EC(v19, v20, v21, v22);
  OUTLINED_FUNCTION_54_1(OBJC_IVAR____TtC21SiriTurnTakingManager8TTClient_nc);
  v24 = OUTLINED_FUNCTION_49_1();
  v28 = sub_247424DAC(v24, v25, v26, v27);
  type metadata accessor for MHLogger();
  swift_initStackObject();
  if (sub_2474292E4())
    sub_24742976C(v28, (uint64_t)v9);
  v29 = sub_247437CFC((uint64_t)v9, v23, v28);
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_37();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_24742F850();
  v30 = v18;
  v31 = v29;
  v32 = v30;
  v33 = v31;
  v34 = sub_2474418F0();
  v35 = sub_247441B18();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = OUTLINED_FUNCTION_4();
    v37 = (_QWORD *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v36 = 138412546;
    v38 = v33;
    OUTLINED_FUNCTION_10_4();
    *v37 = v33;

    *(_WORD *)(v36 + 12) = 2112;
    v41 = (uint64_t)v32;
    v39 = v32;
    OUTLINED_FUNCTION_10_4();
    v37[1] = v32;

    _os_log_impl(&dword_247422000, v34, v35, "TTManagerResponse - %@) for TTManagerRequest: %@)", (uint8_t *)v36, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447358);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  swift_release();
  sub_2474337CC(v6);
  return v33;
}

id sub_247437CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  objc_class *v59;
  char *v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  objc_super v69;

  swift_bridgeObjectRetain();
  v6 = sub_247439A30(a2);
  OUTLINED_FUNCTION_27();
  v7 = sub_24743A670(v6);
  swift_release();
  v8 = sub_2474353C8((uint64_t)v7);
  v9 = OUTLINED_FUNCTION_28();
  v10 = sub_247439A30(v9);
  OUTLINED_FUNCTION_27();
  v11 = sub_24743A670(v10);
  swift_release();
  v66 = sub_2474353C8((uint64_t)v11);
  v12 = OUTLINED_FUNCTION_28();
  v13 = sub_247439A30(v12);
  OUTLINED_FUNCTION_27();
  v14 = sub_24743A670(v13);
  swift_release();
  v15 = sub_2474353C8((uint64_t)v14);
  OUTLINED_FUNCTION_83();
  v64 = sub_24743836C(v8, a3);
  v17 = v16;
  OUTLINED_FUNCTION_10_0();
  v68 = v17;
  if (v17)
  {
    OUTLINED_FUNCTION_38_0();
  }
  else
  {
    OUTLINED_FUNCTION_83();
    v18 = sub_247439B58(v15, a3);
    OUTLINED_FUNCTION_83();
    v64 = sub_24743836C(v18, a3);
    v68 = v19;
    swift_release();
  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC21SiriTurnTakingManager16TTManagerRequest_ttCandidates) + 16);
  if (v20)
  {
    v63 = swift_bridgeObjectRetain();
    v21 = (id *)(v63 + 64);
    v22 = MEMORY[0x24BEE4AF8];
    v65 = a3;
    do
    {
      v23 = (uint64_t)*(v21 - 4);
      v24 = (uint64_t)*(v21 - 3);
      v25 = *(_QWORD *)(a3 + 16);
      v67 = *v21;
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_32();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_7_3();
      OUTLINED_FUNCTION_48();
      if (v25)
      {
        OUTLINED_FUNCTION_48();
        v26 = sub_24743E210(v23, v24);
        v27 = v23;
        if ((v28 & 1) != 0)
          v29 = *(unsigned __int8 *)(*(_QWORD *)(a3 + 56) + 40 * v26 + 4);
        else
          v29 = 3u;
        OUTLINED_FUNCTION_37();
      }
      else
      {
        v29 = 3;
        v27 = v23;
      }
      if (v68
        && (v64 == v27 ? (v30 = v68 == v24) : (v30 = 0),
            (v30 || (sub_247441D10() & 1) != 0)
         && (v31 = OUTLINED_FUNCTION_48(),
             OUTLINED_FUNCTION_20_2(v31, v32, v33, v34, v35, v36, v37, v38, v62, v63, v64, v65, v66),
             v40 = v39,
             OUTLINED_FUNCTION_37(),
             (v40 & 1) == 0)))
      {
        v51 = 0;
      }
      else
      {
        v41 = OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_20_2(v41, v42, v43, v44, v45, v46, v47, v48, v62, v63, v64, v65, v66);
        v50 = v49;
        OUTLINED_FUNCTION_37();
        if ((v50 & 1) == 0)
          __asm { BR              X9 }
        v51 = 1;
      }
      OUTLINED_FUNCTION_48();
      v52 = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_46_0(0, *(_QWORD *)(v22 + 16) + 1);
        v22 = v56;
      }
      v54 = *(_QWORD *)(v22 + 16);
      v53 = *(_QWORD *)(v22 + 24);
      if (v54 >= v53 >> 1)
      {
        v57 = OUTLINED_FUNCTION_44_1(v53);
        OUTLINED_FUNCTION_46_0(v57, v54 + 1);
        v22 = v58;
      }
      *(_QWORD *)(v22 + 16) = v54 + 1;
      v55 = v22 + 24 * v54;
      *(_QWORD *)(v55 + 32) = v52;
      *(_QWORD *)(v55 + 40) = v24;
      *(_BYTE *)(v55 + 48) = v51;
      *(_BYTE *)(v55 + 49) = 0;
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_10_0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37();

      v21 += 11;
      --v20;
      a3 = v65;
    }
    while (v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4AF8];
  }
  v59 = (objc_class *)type metadata accessor for TTManagerResponse();
  v60 = (char *)objc_allocWithZone(v59);
  *(_QWORD *)&v60[OBJC_IVAR____TtC21SiriTurnTakingManager17TTManagerResponse_ttResults] = v22;
  v69.receiver = v60;
  v69.super_class = v59;
  return objc_msgSendSuper2(&v69, sel_init);
}

uint64_t sub_24743812C(uint64_t a1, _BYTE *a2)
{
  char v2;

  if (*a2 && *a2 == 1)
    v2 = 1;
  else
    v2 = sub_247441D10();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2474381F0(uint64_t a1, _BYTE *a2)
{
  char v2;

  if (*a2)
    v2 = sub_247441D10();
  else
    v2 = 1;
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2474382A8(uint64_t a1, _BYTE *a2)
{
  char v2;

  if (*a2 && *a2 != 1)
    v2 = 1;
  else
    v2 = sub_247441D10();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_24743836C(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  float v31;
  unint64_t v32;
  char v33;
  float v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  int64_t v39;

  v38 = a1 + 56;
  v4 = *(_BYTE *)(a1 + 32);
  v5 = 1 << v4;
  v6 = -1;
  if (1 << v4 < 64)
    v6 = ~(-1 << (1 << v4));
  v7 = v6 & *(_QWORD *)(a1 + 56);
  if (v7)
  {
    v8 = 0;
    v9 = __clz(__rbit64(v7));
    v10 = (v7 - 1) & v7;
    v39 = (unint64_t)(v5 + 63) >> 6;
  }
  else
  {
    v14 = v4 & 0x3F;
    if (v14 <= 6)
      goto LABEL_58;
    v39 = (unint64_t)(v5 + 63) >> 6;
    v35 = *(_QWORD *)(a1 + 64);
    if (v35)
    {
      v8 = 1;
    }
    else
    {
      if (v14 < 8)
        goto LABEL_58;
      v35 = *(_QWORD *)(a1 + 72);
      if (v35)
      {
        v8 = 2;
      }
      else
      {
LABEL_45:
        v35 = *(_QWORD *)(a1 + 80);
        if (v35)
        {
          v8 = 3;
        }
        else
        {
LABEL_48:
          if (v14 < 9)
            goto LABEL_58;
          v35 = *(_QWORD *)(a1 + 88);
          if (v35)
          {
            v8 = 4;
          }
          else
          {
            v35 = *(_QWORD *)(a1 + 96);
            if (!v35)
              goto LABEL_54;
            v8 = 5;
          }
        }
      }
    }
LABEL_39:
    v10 = (v35 - 1) & v35;
    v9 = __clz(__rbit64(v35)) + (v8 << 6);
  }
  v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
  v13 = *v11;
  v12 = v11[1];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_46();
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v8 << 6);
      goto LABEL_28;
    }
    v17 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v17 >= v39)
      goto LABEL_35;
    v18 = *(_QWORD *)(v38 + 8 * v17);
    ++v8;
    if (!v18)
    {
      v8 = v17 + 1;
      OUTLINED_FUNCTION_35_1();
      if (v19 == v20)
        goto LABEL_35;
      OUTLINED_FUNCTION_55_1();
      if (!v18)
      {
        v8 = v21 + 2;
        OUTLINED_FUNCTION_35_1();
        if (v19 == v20)
          goto LABEL_35;
        OUTLINED_FUNCTION_55_1();
        if (!v18)
        {
          v8 = v22 + 3;
          OUTLINED_FUNCTION_35_1();
          if (v19 == v20)
            goto LABEL_35;
          OUTLINED_FUNCTION_55_1();
          if (!v18)
            break;
        }
      }
    }
LABEL_27:
    v14 = v18 - 1;
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v8 << 6);
LABEL_28:
    if (!*(_QWORD *)(a2 + 16))
    {
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v26 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v16);
    v28 = *v26;
    v27 = v26[1];
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_46();
    v29 = sub_24743E210(v13, v12);
    if ((v30 & 1) == 0)
    {
      OUTLINED_FUNCTION_10_0();
      __break(1u);
LABEL_61:
      result = OUTLINED_FUNCTION_37();
      __break(1u);
      return result;
    }
    v31 = *(float *)(*(_QWORD *)(a2 + 56) + 40 * v29);
    OUTLINED_FUNCTION_10_0();
    if (!*(_QWORD *)(a2 + 16))
      goto LABEL_44;
    OUTLINED_FUNCTION_48();
    v32 = sub_24743E210(v28, v27);
    if ((v33 & 1) == 0)
      goto LABEL_61;
    v34 = *(float *)(*(_QWORD *)(a2 + 56) + 40 * v32);
    OUTLINED_FUNCTION_37();
    if (v31 < v34)
    {
      OUTLINED_FUNCTION_10_0();
      v12 = v27;
      v13 = v28;
    }
    else
    {
      OUTLINED_FUNCTION_37();
    }
  }
  v24 = v23 + 4;
  if (v24 >= v39)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    swift_release();
    return v13;
  }
  v18 = *(_QWORD *)(v38 + 8 * v24);
  if (v18)
  {
    v8 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v8 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    OUTLINED_FUNCTION_35_1();
    if (v19 == v20)
      goto LABEL_35;
    OUTLINED_FUNCTION_55_1();
    v24 = v25 + 1;
    if (v18)
      goto LABEL_27;
  }
  __break(1u);
LABEL_54:
  v36 = 13;
  while (v36 - 7 < (unint64_t)v39)
  {
    v35 = *(_QWORD *)(a1 + 8 * v36++);
    if (v35)
    {
      v8 = v36 - 8;
      goto LABEL_39;
    }
  }
LABEL_58:
  swift_bridgeObjectRelease();
  return 0;
}

id TTClient.__deallocating_deinit()
{
  return sub_2474386A0(type metadata accessor for TTClient);
}

id sub_2474386A0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_247438718(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_247438728(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24743875C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_247441C74();
  __break(1u);
  return result;
}

void sub_247438828(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_247438888(v6, v7, a3);
  v8 = *a1 + 8;
  sub_247441B90();
  OUTLINED_FUNCTION_7_1();
  *a1 = v8;
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_247438888(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_247438954(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247439914((uint64_t)v12, *a3);
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
      sub_247439914((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    OUTLINED_FUNCTION_21_2();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247438954(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_247438AA8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_247441B9C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_247438B6C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_247441C2C();
    if (!v8)
    {
      result = sub_247441C50();
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

void *sub_247438AA8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_247441C74();
  __break(1u);
  return result;
}

uint64_t sub_247438B6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247438C00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_247438D70(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_247438D70((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247438C00(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_247441A58();
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
  sub_247433848(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_247441C14();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_247441C74();
  __break(1u);
LABEL_14:
  result = sub_247441C50();
  __break(1u);
  return result;
}

char *sub_247438D70(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544473B8);
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
    sub_247438F08(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247438E44(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_247438E44(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_247441C74();
  __break(1u);
  return result;
}

char *sub_247438F08(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_247441C74();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_247438F88(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_247438F98(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_247441B90();
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
  OUTLINED_FUNCTION_30_0();
}

char *sub_24743903C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_247439950(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

unint64_t sub_247439058()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544472E8;
  if (!qword_2544472E8)
  {
    v1 = sub_247441668();
    result = MEMORY[0x24957ADDC](MEMORY[0x24BE9C3F8], v1);
    atomic_store(result, (unint64_t *)&qword_2544472E8);
  }
  return result;
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

unint64_t sub_2474390D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447328;
  if (!qword_254447328)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254447320);
    result = MEMORY[0x24957ADDC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254447328);
  }
  return result;
}

uint64_t type metadata accessor for TTManagerRequest()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TTManagerResponse()
{
  return objc_opt_self();
}

uint64_t sub_247439158()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t type metadata accessor for TTClient()
{
  return objc_opt_self();
}

unint64_t sub_2474391A8()
{
  unint64_t result;

  result = qword_2576A3FE0;
  if (!qword_2576A3FE0)
  {
    result = MEMORY[0x24957ADDC](&protocol conformance descriptor for TTInvocationType, &type metadata for TTInvocationType);
    atomic_store(result, (unint64_t *)&qword_2576A3FE0);
  }
  return result;
}

unint64_t sub_2474391E8()
{
  unint64_t result;

  result = qword_2576A3FE8;
  if (!qword_2576A3FE8)
  {
    result = MEMORY[0x24957ADDC](&protocol conformance descriptor for TTMitigationDecision, &type metadata for TTMitigationDecision);
    atomic_store(result, (unint64_t *)&qword_2576A3FE8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TTInvocationType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TTInvocationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2474392F8 + 4 * byte_247442C95[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24743932C + 4 * byte_247442C90[v4]))();
}

uint64_t sub_24743932C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247439334(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24743933CLL);
  return result;
}

uint64_t sub_247439348(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247439350);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_247439354(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24743935C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TTInvocationType()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t destroy for TTCandidate(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTCandidate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  v7 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTCandidate(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

uint64_t assignWithTake for TTCandidate(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTCandidate(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 81))
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

uint64_t storeEnumTagSinglePayload for TTCandidate(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
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
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TTCandidate()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t method lookup function for TTManagerRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of TTManagerRequest.__allocating_init(ttCandidates:trpCandidateId:requestId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_247439684(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_110();
}

uint64_t assignWithCopy for TTResult(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 18))
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

uint64_t storeEnumTagSinglePayload for TTResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TTResult()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t method lookup function for TTManagerResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TTManagerResponse.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t storeEnumTagSinglePayload for TTMitigationDecision(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247439854 + 4 * byte_247442C9F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247439888 + 4 * byte_247442C9A[v4]))();
}

uint64_t sub_247439888(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247439890(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247439898);
  return result;
}

uint64_t sub_2474398A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2474398ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2474398B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2474398B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TTMitigationDecision()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t method lookup function for TTClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TTClient.processTTRequest(ttRequest:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_247439914(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_247439950(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24742ADD0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24743875C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_247439A30(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1;
  if ((*(_BYTE *)(isStackAllocationSafe + 32) & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    OUTLINED_FUNCTION_34_0();
    v3 = OUTLINED_FUNCTION_9_3();
    if (v1)
      swift_willThrow();
    else
      return v3;
  }
  else
  {
    v4 = swift_slowAlloc();
    OUTLINED_FUNCTION_34_0();
    v2 = OUTLINED_FUNCTION_9_3();
    MEMORY[0x24957AE54](v4, -1, -1);
  }
  return v2;
}

uint64_t sub_247439B58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t isStackAllocationSafe;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v9 = (_QWORD *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_247435668(0, v7, v9);
    swift_bridgeObjectRetain();
    v10 = sub_247439D24((uint64_t)v9, v7, a1, a2);
    swift_release();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (_QWORD *)swift_slowAlloc();
    sub_247435668(0, v7, v11);
    swift_bridgeObjectRetain();
    v10 = sub_247439D24((uint64_t)v11, v7, a1, a2);
    swift_release();
    MEMORY[0x24957AE54](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_247439D24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  unint64_t *v25;
  uint64_t v26;

  v25 = (unint64_t *)result;
  v26 = 0;
  v6 = 0;
  v7 = a3 + 56;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v13 = v12 | (v6 << 6);
LABEL_17:
    if (*(_QWORD *)(a4 + 16))
    {
      v17 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v13);
      v18 = *v17;
      v19 = v17[1];
      swift_bridgeObjectRetain();
      sub_24743E210(v18, v19);
      if ((v20 & 1) != 0)
      {
        sub_24743FB70();
        v22 = v21;
        result = swift_bridgeObjectRelease();
        if ((v22 & 1) != 0)
        {
          *(unint64_t *)((char *)v25 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          v14 = __OFADD__(v26++, 1);
          if (v14)
            goto LABEL_31;
        }
      }
      else
      {
        result = swift_bridgeObjectRelease();
      }
    }
  }
  v14 = __OFADD__(v6++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v6 >= v11)
    goto LABEL_28;
  v15 = *(_QWORD *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_16:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_17;
  }
  v16 = v6 + 1;
  if (v6 + 1 >= v11)
    goto LABEL_28;
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v6 + 2;
  if (v6 + 2 >= v11)
    goto LABEL_28;
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v6 + 3;
  if (v6 + 3 >= v11)
  {
LABEL_28:
    swift_retain();
    v23 = sub_247439F28(v25, a2, v26, a3);
    swift_bridgeObjectRelease();
    return v23;
  }
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
LABEL_15:
    v6 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      goto LABEL_28;
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_16;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_247439F28(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_35:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3FA0);
  result = sub_247441BFC();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_35;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_35;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_35;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_247441D64();
    swift_bridgeObjectRetain();
    sub_247441A40();
    result = sub_247441D7C();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_38;
    if (!v5)
      goto LABEL_35;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_35;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_35;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24743A1B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, char *))
{
  uint64_t v4;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23[8];
  uint64_t v24;
  char v25[16];
  int64_t v26;

  v20 = (unint64_t *)result;
  v7 = 0;
  v21 = 0;
  v22 = a3 + 64;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 64);
  v26 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    v11 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v12 = v11 | (v7 << 6);
LABEL_17:
    v16 = *(_QWORD *)(a3 + 56) + 16 * v12;
    v17 = *(_QWORD *)(v16 + 8);
    v23[0] = *(_BYTE *)v16;
    v24 = v17;
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_20();
    v18 = a4(v25, v23);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v4)
      return result;
    if ((v18 & 1) != 0)
    {
      *(unint64_t *)((char *)v20 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = __OFADD__(v21++, 1);
      if (v13)
        goto LABEL_30;
    }
  }
  v13 = __OFADD__(v7++, 1);
  if (v13)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v26)
    return sub_24743A3BC(v20, a2, v21, a3);
  v14 = *(_QWORD *)(v22 + 8 * v7);
  if (v14)
  {
LABEL_16:
    v10 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_17;
  }
  v15 = v7 + 1;
  if (v7 + 1 >= v26)
    return sub_24743A3BC(v20, a2, v21, a3);
  v14 = *(_QWORD *)(v22 + 8 * v15);
  if (v14)
    goto LABEL_15;
  v15 = v7 + 2;
  if (v7 + 2 >= v26)
    return sub_24743A3BC(v20, a2, v21, a3);
  v14 = *(_QWORD *)(v22 + 8 * v15);
  if (v14)
    goto LABEL_15;
  v15 = v7 + 3;
  if (v7 + 3 >= v26)
    return sub_24743A3BC(v20, a2, v21, a3);
  v14 = *(_QWORD *)(v22 + 8 * v15);
  if (v14)
  {
LABEL_15:
    v7 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    v7 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v7 >= v26)
      return sub_24743A3BC(v20, a2, v21, a3);
    v14 = *(_QWORD *)(v22 + 8 * v7);
    ++v15;
    if (v14)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24743A3BC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A3FF0);
  result = sub_247441C68();
  v9 = result;
  v37 = a1;
  v38 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v39 = v11;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v38)
        return v9;
      v16 = v37[v15];
      v17 = v11 + 1;
      if (!v16)
      {
        v17 = v11 + 2;
        if (v11 + 2 >= v38)
          return v9;
        v16 = v37[v17];
        if (!v16)
        {
          v17 = v11 + 3;
          if (v11 + 3 >= v38)
            return v9;
          v16 = v37[v17];
          if (!v16)
          {
            v18 = v11 + 4;
            if (v11 + 4 >= v38)
              return v9;
            v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v17 >= v38)
                  return v9;
                v16 = v37[v17];
                ++v18;
                if (v16)
                  goto LABEL_24;
              }
            }
            v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v39 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = v4;
    v20 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(v4 + 56) + 16 * v14;
    v24 = *(_BYTE *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    sub_247441D64();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_247441A40();
    result = sub_247441D7C();
    v26 = -1 << *(_BYTE *)(v9 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) == 0)
      break;
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    v34 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v29);
    *v34 = v22;
    v34[1] = v21;
    v35 = *(_QWORD *)(v9 + 56) + 16 * v29;
    *(_BYTE *)v35 = v24;
    *(_QWORD *)(v35 + 8) = v25;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_39;
    v4 = v19;
    v11 = v39;
    if (!v5)
      return v9;
  }
  v30 = 0;
  v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    v32 = v28 == v31;
    if (v28 == v31)
      v28 = 0;
    v30 |= v32;
    v33 = *(_QWORD *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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

_QWORD *sub_24743A670(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_24743A750((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24743A94C();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_24743A750(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
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
    return v10;
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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

uint64_t sub_24743A94C()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_247441A4C();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_247441A4C();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_247441A4C();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  uint64_t (*v0)(char *, char *);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_24743A1B4(v3, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_247441A4C();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_17()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_20_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;

  sub_2474354F0(v13, v14, a13);
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_23_2()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_247441A4C();
}

char *OUTLINED_FUNCTION_28_3(char *a1, int64_t a2)
{
  return sub_24743903C(a1, a2, 1);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;
  _QWORD *v1;

  return sub_247435668(0, v0, v1);
}

char *OUTLINED_FUNCTION_37_1(char *a1, int64_t a2)
{
  return sub_24743903C(a1, a2, 0);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_247441A4C();
}

void OUTLINED_FUNCTION_39_0(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

BOOL OUTLINED_FUNCTION_44_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

id OUTLINED_FUNCTION_45_1(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

void OUTLINED_FUNCTION_46_0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_24742A91C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return sub_247441A4C();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

_QWORD *OUTLINED_FUNCTION_54_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
}

uint64_t sub_24743AAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_24743E210(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_24743AB2C()
{
  return 4;
}

void sub_24743AB34(uint64_t a1)
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
  _QWORD v16[14];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = sub_247441668();
  v3 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  v22 = v3;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_23_0();
  v20 = v5;
  v17 = sub_24744162C();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v7);
  v16[10] = (char *)v16 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B58);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_83_1();
  v18 = v12;
  v14 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v14);
  v15 = *(unsigned __int8 *)(a1 + 16);
  v19 = *(_QWORD *)(a1 + 40);
  __asm { BR              X10 }
}

uint64_t sub_24743ACD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  void *v14;
  os_log_type_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  int EnumTagSinglePayload;
  void **p_cache;
  _QWORD *v26;
  uint64_t v27;
  os_log_type_t v28;
  _WORD *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  os_log_type_t v33;
  _WORD *v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  _WORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  unint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  _QWORD *v78;
  _DWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  void (*v88)(uint64_t, uint64_t);

  v7 = 0x72506E6F74747562;
  v8 = sub_247441D10();
  *(_QWORD *)(v6 - 264) = v2;
  swift_bridgeObjectRelease();
  if (qword_254446B80 != -1)
    swift_once();
  v9 = sub_2474418FC();
  *(_QWORD *)(v6 - 208) = __swift_project_value_buffer(v9, (uint64_t)qword_254447420);
  v10 = sub_2474418F0();
  v11 = sub_247441B18();
  v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_247422000, v10, (os_log_type_t)v12, "Running Announce Override rule...", v13, 2u);
    OUTLINED_FUNCTION_1();
  }

  sub_24743CE38(v0, v4, v3);
  if (sub_24743D2A0(v3))
  {
    v14 = (void *)OUTLINED_FUNCTION_24_3();
    v15 = sub_247441B18();
    if (OUTLINED_FUNCTION_44_0(v15))
    {
      v16 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_87_1(v16);
      OUTLINED_FUNCTION_17_0(&dword_247422000, v17, v18, "Announce task is intercom - overriding mitigator decision to donot mitigate");
      OUTLINED_FUNCTION_1();
    }

    v19 = &qword_254446B58;
    v20 = v3;
LABEL_9:
    sub_24743E384(v20, v19);
    return 1;
  }
  if ((v8 & 1) != 0)
  {
    v22 = *(_QWORD *)(*(_QWORD *)(v6 - 240) + 16);
    *(_QWORD *)(v6 - 328) = v22;
    if (v22)
    {
      sub_24743F1CC(v3, v1, &qword_254446B58);
      v23 = *(_QWORD *)(v6 - 256);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v23);
      p_cache = (void **)(_TtC21SiriTurnTakingManager17NCAssetPathGetter + 16);
      v26 = (_QWORD *)&loc_247442000;
      v27 = MEMORY[0x24BEE4AD8];
      *(_QWORD *)(v6 - 336) = v5;
      if (EnumTagSinglePayload == 1)
      {
        sub_24743E384(v1, &qword_254446B58);
        OUTLINED_FUNCTION_80_0();
        OUTLINED_FUNCTION_61_1();
      }
      else
      {
        OUTLINED_FUNCTION_61_1();
        v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
        v38 = *(_QWORD *)(v6 - 288);
        v37(v38, v1, v23);
        sub_24743B7E8();
        if (*(_QWORD *)(v6 - 168))
        {
          *(_QWORD *)(v6 - 344) = v37;
          OUTLINED_FUNCTION_76_1();
          sub_24742D3D8(v6 - 152, v6 - 192);
          v39 = OUTLINED_FUNCTION_24_3();
          v40 = sub_247441B18();
          if (os_log_type_enabled(v39, v40))
          {
            v41 = (uint8_t *)OUTLINED_FUNCTION_4();
            v42 = OUTLINED_FUNCTION_4();
            *(_QWORD *)(v6 - 352) = v42;
            *(_QWORD *)(v6 - 112) = v42;
            *(_DWORD *)v41 = 136315138;
            *(_QWORD *)(v6 - 360) = v41 + 4;
            v43 = *(_QWORD *)(v6 - 168);
            v44 = *(_QWORD *)(v6 - 160);
            __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 - 192), v43);
            v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
            *(_QWORD *)(v6 - 72) = sub_247438888(v45, v46, (uint64_t *)(v6 - 112));
            OUTLINED_FUNCTION_61_1();
            sub_247441B90();
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1(v6 - 192);
            OUTLINED_FUNCTION_16_2(&dword_247422000, v39, v40, "identified announce type as %s - updating the cache so followup can also use this as announce task if needed", v41);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_1();
          }

          __swift_destroy_boxed_opaque_existential_1(v6 - 192);
          __swift_destroy_boxed_opaque_existential_1(v6 - 152);
          OUTLINED_FUNCTION_80_0();
          v23 = *(_QWORD *)(v6 - 256);
          v48 = *(_QWORD *)(v6 - 248);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 - 344))(v48, v38, v23);
          OUTLINED_FUNCTION_55_2(v48);
          v49 = v48;
          v50 = *(_QWORD *)(v6 - 296);
          sub_24743F238(v49, v50, &qword_254446B58);
          v51 = *(_QWORD *)(v6 - 200) + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache;
          swift_beginAccess();
          v52 = v51;
          p_cache = _TtC21SiriTurnTakingManager17NCAssetPathGetter.cache;
          sub_24743F264(v50, v52);
          swift_endAccess();
          OUTLINED_FUNCTION_91_0();
          v47 = *(NSObject **)(v6 - 280);
          v26 = &loc_247442000;
LABEL_28:
          v53 = (uint64_t)p_cache[121] + *(_QWORD *)(v6 - 200);
          swift_beginAccess();
          sub_24743F1CC(v53, (uint64_t)v47, &qword_254446B58);
          if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v23) == 1)
          {
            sub_24743E384((uint64_t)v47, &qword_254446B58);
            OUTLINED_FUNCTION_24_3();
            v54 = OUTLINED_FUNCTION_28_2();
            if (OUTLINED_FUNCTION_44_0(v54))
            {
              v55 = (_WORD *)OUTLINED_FUNCTION_4();
              OUTLINED_FUNCTION_87_1(v55);
              OUTLINED_FUNCTION_17_0(&dword_247422000, v56, v57, "Using Cache - There is no activeTasks or executedTasks in SessionState for triggerless followup. Rejecting.");
              OUTLINED_FUNCTION_1();
            }

            v58 = &qword_254446B58;
            v59 = v3;
          }
          else
          {
            *(_QWORD *)(v6 - 352) = v3;
            (*(void (**)(uint64_t, NSObject *, uint64_t))(v12 + 32))(v1, v47, v23);
            sub_24743B7E8();
            if (*(_QWORD *)(v6 - 168))
            {
              OUTLINED_FUNCTION_76_1();
              v60 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 216) + 80);
              *(_QWORD *)(v6 - 288) = *(_QWORD *)(v6 - 240) + ((v60 + 32) & ~v60);
              *(_QWORD *)(v6 - 296) = v6 - 64;
              swift_bridgeObjectRetain();
              v61 = 0;
              v62 = 0;
              *(_QWORD *)&v63 = v26[87];
              *(_OWORD *)(v6 - 320) = v63;
              *(_QWORD *)(v6 - 344) = v27 + 8;
LABEL_34:
              *(_DWORD *)(v6 - 360) = v61;
              do
              {
                sub_2474411E8(v62, 1, *(_QWORD *)(v6 - 240));
                if (__OFADD__(v62, 1))
                {
                  __break(1u);
                  JUMPOUT(0x24743B7D0);
                }
                *(_QWORD *)(v6 - 280) = v62 + 1;
                v64 = *(_QWORD *)(v6 - 232);
                (*(void (**)(uint64_t, unint64_t, _QWORD))(*(_QWORD *)(v6 - 216) + 16))(v64, *(_QWORD *)(v6 - 288) + *(_QWORD *)(*(_QWORD *)(v6 - 216) + 72) * v62, *(_QWORD *)(v6 - 224));
                v65 = *(_QWORD *)(v6 - 248);
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v65, v1, v23);
                v66 = OUTLINED_FUNCTION_55_2(v65);
                v67 = sub_24743C220(v66, v64, (_QWORD *)(v6 - 152));
                sub_24743E384(v65, &qword_254446B58);
                v68 = OUTLINED_FUNCTION_24_3();
                v69 = sub_247441B18();
                if (os_log_type_enabled(v68, v69))
                {
                  v70 = (uint8_t *)OUTLINED_FUNCTION_4();
                  *(_QWORD *)(v6 - 192) = OUTLINED_FUNCTION_4();
                  *(_DWORD *)v70 = *(_OWORD *)(v6 - 320);
                  *(_BYTE *)(v6 - 72) = v67;
                  v71 = sub_247441A04();
                  *(_QWORD *)(v6 - 72) = sub_247438888(v71, v72, (uint64_t *)(v6 - 192));
                  OUTLINED_FUNCTION_91_0();
                  OUTLINED_FUNCTION_80_0();
                  sub_247441B90();
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_16_2(&dword_247422000, v68, v69, "With announce followup evaluation result from Announce rule is %s", v70);
                  swift_arrayDestroy();
                  OUTLINED_FUNCTION_61_1();
                  OUTLINED_FUNCTION_1();
                }

                if (v67)
                {
                  OUTLINED_FUNCTION_71_1();
                  OUTLINED_FUNCTION_66_1();
                  if (v73 != 2)
                  {
                    OUTLINED_FUNCTION_77_1();
                    swift_bridgeObjectRelease();
LABEL_59:
                    OUTLINED_FUNCTION_26_2();
                    OUTLINED_FUNCTION_86_1();
                    OUTLINED_FUNCTION_15_2();
                    v20 = OUTLINED_FUNCTION_73_1();
                    goto LABEL_9;
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_27_2();
                }
                OUTLINED_FUNCTION_10_5();
                sub_247441D10();
                OUTLINED_FUNCTION_58_1();
                if ((v64 & 1) != 0)
                  goto LABEL_59;
                if (v67)
                {
                  if (v67 != 1)
                  {
                    swift_bridgeObjectRelease();
                    OUTLINED_FUNCTION_26_2();
LABEL_50:
                    v61 = 1;
                    v62 = *(_QWORD *)(v6 - 280);
                    if (v62 != *(_QWORD *)(v6 - 328))
                      goto LABEL_34;
                    OUTLINED_FUNCTION_86_1();
                    OUTLINED_FUNCTION_15_2();
                    v36 = OUTLINED_FUNCTION_73_1();
                    goto LABEL_20;
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_27_2();
                }
                sub_247441D10();
                OUTLINED_FUNCTION_58_1();
                OUTLINED_FUNCTION_26_2();
                if ((v64 & 1) != 0)
                  goto LABEL_50;
                ++v62;
              }
              while (*(_QWORD *)(v6 - 280) != *(_QWORD *)(v6 - 328));
              OUTLINED_FUNCTION_86_1();
              OUTLINED_FUNCTION_15_2();
              v86 = OUTLINED_FUNCTION_73_1();
              sub_24743E384(v86, v87);
              if ((*(_DWORD *)(v6 - 360) & 1) != 0)
                return 2;
              return 0;
            }
            sub_24743E384(v6 - 192, &qword_2576A3FF8);
            v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
            v75 = *(_QWORD *)(v6 - 320);
            v74(v75, v1, v23);
            OUTLINED_FUNCTION_24_3();
            v76 = v1;
            v77 = OUTLINED_FUNCTION_28_2();
            if (os_log_type_enabled(v47, v77))
            {
              v78 = v26;
              v79 = (_DWORD *)OUTLINED_FUNCTION_4();
              v80 = OUTLINED_FUNCTION_4();
              v81 = v78[87];
              *(_QWORD *)(v6 - 200) = v79;
              *(_QWORD *)(v6 - 192) = v80;
              *v79 = v81;
              *(_QWORD *)(v6 - 208) = v79 + 1;
              sub_247441710();
              *(_QWORD *)(v6 - 128) = v23;
              *(_QWORD *)(v6 - 120) = sub_24743F1F8();
              boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 - 152));
              v74((uint64_t)boxed_opaque_existential_1, v75, v23);
              v83 = sub_247441704();
              v85 = v84;
              __swift_destroy_boxed_opaque_existential_1(v6 - 152);
              *(_QWORD *)(v6 - 152) = sub_247438888(v83, v85, (uint64_t *)(v6 - 192));
              OUTLINED_FUNCTION_91_0();
              sub_247441B90();
              swift_bridgeObjectRelease();
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 264) + 8))(v75, v23);
              OUTLINED_FUNCTION_16_2(&dword_247422000, v47, v77, "Unable to identify announce type of task: %s.", *(uint8_t **)(v6 - 200));
              swift_arrayDestroy();
              OUTLINED_FUNCTION_1();
            }

            v88 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
            v88(v75, v23);
            v88(v76, v23);
            v59 = OUTLINED_FUNCTION_73_1();
          }
          sub_24743E384(v59, v58);
          return 0;
        }
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v38, v23);
        sub_24743E384(v6 - 192, &qword_2576A3FF8);
        OUTLINED_FUNCTION_91_0();
        OUTLINED_FUNCTION_80_0();
      }
      v47 = *(NSObject **)(v6 - 280);
      goto LABEL_28;
    }
    OUTLINED_FUNCTION_24_3();
    v33 = OUTLINED_FUNCTION_28_2();
    if (OUTLINED_FUNCTION_44_0(v33))
    {
      v34 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_87_1(v34);
      v32 = "there are no nl parses, this is not expected";
LABEL_18:
      OUTLINED_FUNCTION_17_0(&dword_247422000, v30, v31, v32);
      OUTLINED_FUNCTION_1();
    }
  }
  else
  {
    v7 = OUTLINED_FUNCTION_24_3();
    v28 = sub_247441B18();
    if (OUTLINED_FUNCTION_44_0(v28))
    {
      v29 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_87_1(v29);
      v32 = "source is not announce followup returning noMatch";
      goto LABEL_18;
    }
  }

  v35 = &qword_254446B58;
  v36 = v3;
LABEL_20:
  sub_24743E384(v36, v35);
  return 2;
}

void sub_24743B7E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  _BYTE v34[32];
  _OWORD v35[2];
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  OUTLINED_FUNCTION_88_1();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_81_0();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_247441644();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  sub_247441620();
  v3 = sub_247441728();
  OUTLINED_FUNCTION_47_0();
  v4 = MEMORY[0x24957A428](v3);
  if (v4 >> 62)
    v5 = sub_247441C5C();
  else
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    sub_247441208(0, (v4 & 0xC000000000000001) == 0, v4);
    if ((v4 & 0xC000000000000001) != 0)
      MEMORY[0x24957A8FC](0, v4);
    else
      swift_retain();
    OUTLINED_FUNCTION_7_1();
    if (qword_254446B80 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_43();
    __swift_project_value_buffer(v6, (uint64_t)qword_254447420);
    OUTLINED_FUNCTION_69_0();
    v7 = OUTLINED_FUNCTION_90_0();
    v8 = sub_247441B18();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = OUTLINED_FUNCTION_4();
      *(_QWORD *)&v36 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v9 = 136315394;
      v10 = sub_24744189C();
      OUTLINED_FUNCTION_13_2(v10, v11);
      sub_247441B90();
      OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_7_1();
      *(_WORD *)(v9 + 12) = 2080;
      v12 = sub_247441890();
      *(_QWORD *)&v35[0] = OUTLINED_FUNCTION_13_2(v12, v13);
      sub_247441B90();
      OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_81_1(&dword_247422000, v7, v8, "Found UsoTask %s::%s.", (uint8_t *)v9);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_1();
    }

    swift_release_n();
    v21 = (uint64_t *)MEMORY[0x24BEE4AD8];
    swift_retain();
    sub_247441758();
    OUTLINED_FUNCTION_28_4();
    if (*((_QWORD *)&v37 + 1))
    {
      sub_24743E354(&v36, v35);
      sub_247439914((uint64_t)v35, (uint64_t)v34);
      sub_247441770();
      if (OUTLINED_FUNCTION_1_5())
      {
        OUTLINED_FUNCTION_29_0();
        sub_24743D4DC((uint64_t)&v36);
        OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2638);
      }
      else
      {
        sub_247441854();
        if (!OUTLINED_FUNCTION_1_5())
        {
          sub_247441800();
          if (OUTLINED_FUNCTION_2_4())
          {
            swift_release();
            __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
            v29 = MEMORY[0x24BEE4AF8];
            v30 = OUTLINED_FUNCTION_19_3();
            OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2768);
            v31 = OUTLINED_FUNCTION_26();
            *v21 = v31;
            OUTLINED_FUNCTION_61();
            OUTLINED_FUNCTION_28_4();
            *(_QWORD *)(v31 + 16) = 0xD00000000000001BLL;
            *(_QWORD *)(v31 + 24) = 0x8000000247443EA0;
            *(_DWORD *)(v31 + 32) = 16843009;
            *(_BYTE *)(v31 + 36) = 1;
          }
          else
          {
            sub_247441878();
            if (OUTLINED_FUNCTION_1_5()
              || (sub_2474417C4(), OUTLINED_FUNCTION_1_5())
              || (sub_2474417D0(), OUTLINED_FUNCTION_1_5()))
            {
              OUTLINED_FUNCTION_29_0();
              sub_24743D7AC(&v36);
              OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2800);
              goto LABEL_32;
            }
            sub_247441860();
            if (OUTLINED_FUNCTION_1_5())
            {
              OUTLINED_FUNCTION_29_0();
              sub_24743D8F0((uint64_t *)&v36);
              OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2898);
              goto LABEL_32;
            }
            sub_2474417E8();
            if (!OUTLINED_FUNCTION_2_4())
            {
              sub_24744180C();
              if (OUTLINED_FUNCTION_1_5()
                || (sub_247441824(), OUTLINED_FUNCTION_1_5())
                || (sub_2474417F4(), OUTLINED_FUNCTION_1_5())
                || (sub_247441818(), OUTLINED_FUNCTION_1_5()))
              {
                OUTLINED_FUNCTION_29_0();
                sub_24743DA28(&v36);
                OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2A60);
              }
              else
              {
                sub_2474417AC();
                if (!swift_dynamicCast())
                {
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
                  OUTLINED_FUNCTION_61();
                  OUTLINED_FUNCTION_28_4();
                  OUTLINED_FUNCTION_78_1();
                  goto LABEL_34;
                }
                OUTLINED_FUNCTION_29_0();
                sub_24743DB38((uint64_t)&v36);
                OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A29C8);
              }
              goto LABEL_32;
            }
            swift_release();
            __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
            v29 = MEMORY[0x24BEE4AF8];
            v30 = OUTLINED_FUNCTION_19_3();
            OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A2930);
            v31 = OUTLINED_FUNCTION_26();
            *v21 = v31;
            OUTLINED_FUNCTION_61();
            OUTLINED_FUNCTION_28_4();
            *(_QWORD *)(v31 + 16) = 0xD000000000000010;
            *(_QWORD *)(v31 + 24) = 0x8000000247443E80;
            *(_DWORD *)(v31 + 32) = 16842752;
            *(_BYTE *)(v31 + 36) = 0;
          }
          *(_QWORD *)(v31 + 40) = v29;
          *(_QWORD *)(v31 + 48) = v30;
LABEL_33:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
LABEL_34:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
          goto LABEL_10;
        }
        OUTLINED_FUNCTION_29_0();
        sub_24743D63C((uint64_t)&v36);
        OUTLINED_FUNCTION_23_3((uint64_t)&unk_2518A26D0);
      }
LABEL_32:
      v32 = OUTLINED_FUNCTION_26();
      *v21 = v32;
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_28_4();
      v33 = v37;
      *(_OWORD *)(v32 + 16) = v36;
      *(_OWORD *)(v32 + 32) = v33;
      *(_QWORD *)(v32 + 48) = v38;
      goto LABEL_33;
    }
    sub_24743E384((uint64_t)&v36, &qword_254447388);
    OUTLINED_FUNCTION_69_0();
    v22 = OUTLINED_FUNCTION_90_0();
    v23 = sub_247441B24();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = OUTLINED_FUNCTION_4();
      *(_QWORD *)&v36 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v24 = 136315394;
      v25 = sub_24744189C();
      OUTLINED_FUNCTION_13_2(v25, v26);
      OUTLINED_FUNCTION_56_0();
      OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_7_1();
      *(_WORD *)(v24 + 12) = 2080;
      v27 = sub_247441890();
      *(_QWORD *)&v35[0] = OUTLINED_FUNCTION_13_2(v27, v28);
      OUTLINED_FUNCTION_56_0();
      OUTLINED_FUNCTION_21_3();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_81_1(&dword_247422000, v22, v23, "Unable to run codegen converter on UsoTask %s::%s.", (uint8_t *)v24);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_61();
  }
  else
  {
    OUTLINED_FUNCTION_7_1();
    if (qword_254446B80 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_43();
    __swift_project_value_buffer(v14, (uint64_t)qword_254447420);
    swift_retain_n();
    v15 = sub_2474418F0();
    v16 = sub_247441B24();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_QWORD *)&v36 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v17 = 136315138;
      v18 = sub_247441884();
      v20 = OUTLINED_FUNCTION_13_2(v18, v19);
      OUTLINED_FUNCTION_92_0(v20);
      sub_247441B90();
      swift_release_n();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v15, v16, "Unable to convert UsoGraphSiriNL to UsoTask for graph %s.", v17);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }

  }
  swift_release_n();
  OUTLINED_FUNCTION_78_1();
LABEL_10:
  OUTLINED_FUNCTION_5_2();
}

uint64_t sub_24743C220(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  os_log_type_t v34;
  _WORD *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v40;
  char v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  os_log_type_t v47;
  _WORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (**v64)(_QWORD, _QWORD);
  uint64_t (*v65)(uint64_t, _QWORD);
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t (**v77)(_QWORD, _QWORD);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[5];
  _QWORD v82[5];
  uint64_t v83[5];
  _QWORD v84[3];
  uint64_t v85;
  uint64_t (**v86)(_QWORD, _QWORD);

  v77 = (uint64_t (**)(_QWORD, _QWORD))*v3;
  v80 = OUTLINED_FUNCTION_43();
  v78 = *(_QWORD *)(v80 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_23_0();
  v79 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544472F0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_0();
  v10 = (uint64_t (**)(_QWORD, _QWORD))(v9 - v8);
  v11 = sub_2474416BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_81_0();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v74 - v17;
  v19 = a3[3];
  v20 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v19);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 48))(v19, v20);
  if ((v21 & 1) != 0)
    v22 = 2;
  else
    v22 = 0;
  v23 = sub_247441650();
  sub_24743FDC0(v23, (uint64_t)v10);
  OUTLINED_FUNCTION_7_1();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) != 1)
  {
    OUTLINED_FUNCTION_36_0((uint64_t)v18, (uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
    v28 = sub_2474416B0();
    v29 = OUTLINED_FUNCTION_36_0(v15, (uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
    OUTLINED_FUNCTION_53_1(v29, (uint64_t)v83);
    if ((v28 & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
      OUTLINED_FUNCTION_48_1();
      goto LABEL_16;
    }
    v30 = sub_247441698();
    sub_24742D3D8((uint64_t)v83, (uint64_t)v84);
    if ((v30 & 1) != 0)
    {
      v31 = v85;
      v10 = v86;
      OUTLINED_FUNCTION_51_1(v84);
      v32 = v10[2](v31, v10);
    }
    else
    {
      v32 = 0;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
    OUTLINED_FUNCTION_48_1();
    OUTLINED_FUNCTION_67_0();
    if ((v32 & 1) != 0)
    {
LABEL_16:
      v33 = v80;
      if (qword_254446B80 != -1)
        swift_once();
      OUTLINED_FUNCTION_7_2(v33, (uint64_t)qword_254447420);
      v34 = OUTLINED_FUNCTION_14();
      if (OUTLINED_FUNCTION_6(v34))
      {
        v35 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_74_1(v35);
        v38 = "Accepting WantedToRepeat / UserCancelled dialog act.";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    v40 = sub_24744168C();
    v41 = v40;
    OUTLINED_FUNCTION_53_1(v40, (uint64_t)v82);
    if ((v41 & 1) != 0)
    {
      v10 = (uint64_t (**)(_QWORD, _QWORD))v82[4];
      OUTLINED_FUNCTION_51_1(v82);
      v33 = OUTLINED_FUNCTION_43_1(v10[3]);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
      if ((v33 & 1) != 0)
      {
        if (qword_254446B80 != -1)
          swift_once();
        OUTLINED_FUNCTION_7_2(v80, (uint64_t)qword_254447420);
        v42 = OUTLINED_FUNCTION_14();
        if (OUTLINED_FUNCTION_6(v42))
        {
          v43 = (_WORD *)OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_74_1(v43);
          v38 = "Accepting User Rejected dialog act.";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
    }
    v44 = sub_247441680();
    v45 = v44;
    OUTLINED_FUNCTION_53_1(v44, (uint64_t)v81);
    if ((v45 & 1) != 0)
    {
      v10 = (uint64_t (**)(_QWORD, _QWORD))v81[4];
      OUTLINED_FUNCTION_51_1(v81);
      v33 = OUTLINED_FUNCTION_43_1(v10[4]);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
      v46 = v79;
      if ((v33 & 1) != 0)
      {
        if (qword_254446B80 != -1)
          swift_once();
        OUTLINED_FUNCTION_7_2(v80, (uint64_t)qword_254447420);
        v47 = OUTLINED_FUNCTION_14();
        if (OUTLINED_FUNCTION_6(v47))
        {
          v48 = (_WORD *)OUTLINED_FUNCTION_4();
          OUTLINED_FUNCTION_74_1(v48);
          v38 = "Accepting Accepted dialog act.";
LABEL_20:
          OUTLINED_FUNCTION_38_2(&dword_247422000, v36, v37, v38);
          OUTLINED_FUNCTION_1();
        }
LABEL_21:

        OUTLINED_FUNCTION_40_1();
        return 1;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
      v46 = v79;
    }
    v49 = sub_24743C9B8();
    if (v49)
    {
      v50 = v49;
      v51 = a3[3];
      v52 = a3[4];
      __swift_project_boxed_opaque_existential_1(a3, v51);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v52 + 40))(v51, v52) & 1) != 0)
      {
        sub_24743CBE0(v84);
        v53 = sub_24743E3BC((uint64_t)v84);
        sub_24743F10C((uint64_t)v84);
        if (v53)
        {
          if (v53 == 1)
          {
            OUTLINED_FUNCTION_77_1();
            swift_bridgeObjectRelease();
LABEL_57:
            OUTLINED_FUNCTION_40_1();
            OUTLINED_FUNCTION_61();
            return 1;
          }
          OUTLINED_FUNCTION_66_1();
          OUTLINED_FUNCTION_71_1();
        }
        else
        {
          OUTLINED_FUNCTION_27_2();
        }
        OUTLINED_FUNCTION_10_5();
        v70 = sub_247441D10();
        OUTLINED_FUNCTION_7_1();
        if ((v70 & 1) != 0)
          goto LABEL_57;
      }
      v71 = a3[3];
      v72 = a3[4];
      v73 = __swift_project_boxed_opaque_existential_1(a3, v71);
      v22 = sub_24743EA44((uint64_t)v73, v50, (uint64_t)v77, v71, v72);
      OUTLINED_FUNCTION_61();
    }
    else
    {
      if (qword_254446B80 != -1)
        swift_once();
      v54 = v80;
      v55 = __swift_project_value_buffer(v80, (uint64_t)qword_254447420);
      v56 = v78;
      v57 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v46, v55, v54);
      OUTLINED_FUNCTION_53_1(v57, (uint64_t)v84);
      v58 = OUTLINED_FUNCTION_90_0();
      v59 = sub_247441B18();
      v60 = v59;
      if (os_log_type_enabled(v58, v59))
      {
        v61 = OUTLINED_FUNCTION_4();
        v77 = v10;
        v62 = v61;
        v76 = OUTLINED_FUNCTION_4();
        v83[0] = v76;
        *(_DWORD *)v62 = 136315394;
        v74 = v62 + 4;
        v63 = v85;
        v64 = v86;
        OUTLINED_FUNCTION_51_1(v84);
        v65 = v64[1];
        v75 = v60;
        v66 = v65(v63, v64);
        v82[0] = sub_247438888(v66, v67, v83);
        sub_247441B90();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_67_0();
        *(_WORD *)(v62 + 12) = 2080;
        if ((v21 & 1) != 0)
          v68 = 0x65764F746F6E6F64;
        else
          v68 = 0x657461676974696DLL;
        if ((v21 & 1) != 0)
          v69 = 0xED00006564697272;
        else
          v69 = 0xE800000000000000;
        v82[0] = sub_247438888(v68, v69, v83);
        sub_247441B90();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_81_1(&dword_247422000, v58, (os_log_type_t)v75, "This might be a info domains request for which we donot support DONOT mitigate overrides - announceType - %s, returning %s", (uint8_t *)v62);
        OUTLINED_FUNCTION_50();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_67_0();
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v46, v54);
    }
    OUTLINED_FUNCTION_40_1();
    return v22;
  }
  sub_24743E384((uint64_t)v10, &qword_2544472F0);
  if (qword_254446B80 != -1)
    swift_once();
  v24 = (void *)OUTLINED_FUNCTION_7_2(v80, (uint64_t)qword_254447420);
  v25 = sub_247441B24();
  if (OUTLINED_FUNCTION_44_0(v25))
  {
    *(_WORD *)OUTLINED_FUNCTION_4() = 0;
    OUTLINED_FUNCTION_42_1(&dword_247422000, v26, v27, "Unable to retrieve UserDialogAct from parse.");
    OUTLINED_FUNCTION_1();
  }

  return 0;
}

uint64_t sub_24743C9B8()
{
  unint64_t v0;
  uint64_t v1;

  v0 = sub_24744171C();
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_247441C5C();
    OUTLINED_FUNCTION_6_3();
    if (!v1)
      goto LABEL_5;
  }
  else
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v1)
      goto LABEL_5;
  }
  sub_247441208(0, (v0 & 0xC000000000000001) == 0, v0);
  if ((v0 & 0xC000000000000001) != 0)
  {
    v1 = MEMORY[0x24957A8FC](0, v0);
  }
  else
  {
    v1 = *(_QWORD *)(v0 + 32);
    swift_retain();
  }
LABEL_5:
  OUTLINED_FUNCTION_6_3();
  return v1;
}

void sub_24743CBE0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __n128 v32;
  _QWORD *v33;
  uint64_t v34;
  __n128 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __n128 v43;
  _QWORD *v44;
  uint64_t v45;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v2 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v2 + 16) = xmmword_247443000;
  *(_QWORD *)(v2 + 32) = 0x746165706572;
  *(_QWORD *)(v2 + 40) = 0xE600000000000000;
  *(_QWORD *)(v2 + 48) = 1684104562;
  *(_QWORD *)(v2 + 56) = 0xE400000000000000;
  *(_QWORD *)(v2 + 64) = 1886352499;
  *(_QWORD *)(v2 + 72) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247443010;
  OUTLINED_FUNCTION_20_3();
  *(_QWORD *)(v5 + 32) = v4 & 0xFFFFFFFFFFFFLL | 0x415F000000000000;
  *(_QWORD *)(v5 + 40) = 0xEA00000000007070;
  v6 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v6 + 16) = xmmword_247443020;
  *(_QWORD *)(v6 + 32) = 1852141679;
  *(_QWORD *)(v6 + 40) = 0xE400000000000000;
  OUTLINED_FUNCTION_57_0();
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = 0xEC00000079746974;
  v9 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v9, v10, v11, v12, v13, v14, v15, v16, v17);
  *(_QWORD *)(v18 + 32) = 1852141679;
  *(_QWORD *)(v18 + 40) = 0xE400000000000000;
  OUTLINED_FUNCTION_62_1();
  *(_QWORD *)(inited + 72) = v19;
  *(_QWORD *)(inited + 80) = v20;
  *(_QWORD *)(inited + 88) = 0xEE00656761737365;
  v21 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v21 + 16) = xmmword_247442480;
  *(_QWORD *)(v21 + 32) = 1684956531;
  *(_QWORD *)(v21 + 40) = 0xE400000000000000;
  *(_QWORD *)(v21 + 48) = 0x796C706572;
  *(_QWORD *)(v21 + 56) = 0xE500000000000000;
  OUTLINED_FUNCTION_20_3();
  *(_QWORD *)(inited + 96) = v23;
  *(_QWORD *)(inited + 104) = v22 & 0xFFFFFFFFFFFFLL | 0x535F000000000000;
  *(_QWORD *)(inited + 112) = 0xEE00676E69747465;
  v24 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v24, v25, v26, v27, v28, v29, v30, v31, v32);
  v33[4] = 0x656C62616E65;
  v33[5] = 0xE600000000000000;
  v33[6] = 0x656C6261736964;
  v33[7] = 0xE700000000000000;
  *(_QWORD *)(inited + 120) = v33;
  *(_QWORD *)(inited + 128) = 0xD000000000000013;
  OUTLINED_FUNCTION_41_1();
  *(_QWORD *)(inited + 136) = v34;
  v35 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v35, v36, v37, v38, v39, v40, v41, v42, v43);
  v44[4] = 0x796C706572;
  v44[5] = 0xE500000000000000;
  v44[6] = 1684956531;
  v44[7] = 0xE400000000000000;
  *(_QWORD *)(inited + 144) = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  sub_24744198C();
  *a1 = 0x6C61626F6C47;
  a1[1] = 0xE600000000000000;
  OUTLINED_FUNCTION_82_1(2.3694e-38);
  a1[3] = v2;
  a1[4] = v45;
}

void sub_24743CE38(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  NSObject *v32;
  void (*v33)(char *, char *, uint64_t);
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  NSObject *v41;
  void (*v42)(uint64_t, char *, uint64_t);
  os_log_type_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  void (*v52)(_QWORD, _QWORD, _QWORD);
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v54 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B58);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_81_0();
  v8 = v6 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v49 - v10;
  v12 = OUTLINED_FUNCTION_88_1();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_81_0();
  v16 = (char *)(v14 - v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v49 - v19;
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_83_1();
  v53 = v21;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v49 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v49 - v26;
  sub_24743FDB4(a1, (uint64_t)v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) != 1)
  {
    v30 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v30(v27, v11, v12);
    if (qword_254446B80 != -1)
      swift_once();
    v31 = OUTLINED_FUNCTION_43();
    v32 = __swift_project_value_buffer(v31, (uint64_t)qword_254447420);
    v33 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v33(v25, v27, v12);
    sub_2474418F0();
    v34 = OUTLINED_FUNCTION_14();
    if (os_log_type_enabled(v32, v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_4();
      v51 = OUTLINED_FUNCTION_4();
      v55 = v51;
      v52 = (void (*)(_QWORD, _QWORD, _QWORD))v30;
      *(_DWORD *)v35 = 136315138;
      v50 = v35 + 4;
      v33(v53, v25, v12);
      v36 = OUTLINED_FUNCTION_63_1();
      v38 = sub_247438888(v36, v37, &v55);
      OUTLINED_FUNCTION_39_1(v38);
      sub_247441B90();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_45_2();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v32, v34, "Found announceTask in SessionState's activeTasks: %s", v35);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_45_2();

    v29 = v54;
    v30((char *)v54, v27, v12);
    goto LABEL_14;
  }
  sub_24743E384((uint64_t)v11, &qword_254446B58);
  sub_24743FDB4(a2, v8);
  if (__swift_getEnumTagSinglePayload(v8, 1, v12) != 1)
  {
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    v39(v20, v8, v12);
    if (qword_254446B80 != -1)
      swift_once();
    v40 = OUTLINED_FUNCTION_43();
    v41 = __swift_project_value_buffer(v40, (uint64_t)qword_254447420);
    v42 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    v42((uint64_t)v16, v20, v12);
    sub_2474418F0();
    v43 = OUTLINED_FUNCTION_14();
    if (os_log_type_enabled(v41, v43))
    {
      v44 = OUTLINED_FUNCTION_4();
      v52 = (void (*)(_QWORD, _QWORD, _QWORD))v39;
      v45 = (uint8_t *)v44;
      v51 = OUTLINED_FUNCTION_4();
      v55 = v51;
      *(_DWORD *)v45 = 136315138;
      v50 = v45 + 4;
      v42((uint64_t)v53, v16, v12);
      v46 = OUTLINED_FUNCTION_63_1();
      v48 = sub_247438888(v46, v47, &v55);
      OUTLINED_FUNCTION_39_1(v48);
      sub_247441B90();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46_1();
      OUTLINED_FUNCTION_16_2(&dword_247422000, v41, v43, "Found announceTask in SessionState's executedTasks: %s", v45);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_46_1();

    v29 = v54;
    v39((char *)v54, (uint64_t)v20, v12);
LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  sub_24743E384(v8, &qword_254446B58);
  v28 = 1;
  v29 = v54;
LABEL_15:
  __swift_storeEnumTagSinglePayload(v29, v28, 1, v12);
  OUTLINED_FUNCTION_5_2();
}

BOOL sub_24743D2A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *DynamicType;
  uint64_t v18;
  os_log_type_t v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[5];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254446B58);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  v5 = (void *)(v4 - v3);
  v6 = OUTLINED_FUNCTION_88_1();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_0();
  v10 = v9 - v8;
  sub_24743F1CC(a1, (uint64_t)v5, &qword_254446B58);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_24743E384((uint64_t)v5, &qword_254446B58);
    if (qword_254446B80 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_43();
    v12 = (void *)OUTLINED_FUNCTION_7_2(v11, (uint64_t)qword_254447420);
    v13 = sub_247441B18();
    if (OUTLINED_FUNCTION_44_0(v13))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_42_1(&dword_247422000, v14, v15, "Parse does not contain an announce intercom task.");
      OUTLINED_FUNCTION_1();
    }

  }
  else
  {
    OUTLINED_FUNCTION_36_0(v10, (uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
    sub_24743B7E8();
    if (v24)
    {
      OUTLINED_FUNCTION_44_2();
      sub_24742D41C(&v23, (uint64_t)v25);
      __swift_project_boxed_opaque_existential_1(v25, v25[3]);
      DynamicType = (void *)swift_getDynamicType();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      return DynamicType == &unk_2518A2A60;
    }
    sub_24743E384((uint64_t)&v23, &qword_2576A3FF8);
    if (qword_254446B80 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_7_2(v18, (uint64_t)qword_254447420);
    v19 = OUTLINED_FUNCTION_14();
    if (OUTLINED_FUNCTION_6(v19))
    {
      v20 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_74_1(v20);
      OUTLINED_FUNCTION_38_2(&dword_247422000, v21, v22, "Parse does not contain an announce intercom task.");
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_44_2();
  }
  return 0;
}

uint64_t sub_24743D4DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247443000;
  OUTLINED_FUNCTION_20_3();
  *(_QWORD *)(v4 + 32) = v3 & 0xFFFFFFFFFFFFLL | 0x455F000000000000;
  *(_QWORD *)(v4 + 40) = 0xEC0000006C69616DLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v5 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v5 + 16) = xmmword_247443020;
  *(_QWORD *)(v5 + 32) = 1684956531;
  *(_QWORD *)(v5 + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = 0xD000000000000014;
  OUTLINED_FUNCTION_41_1();
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = &unk_2518A13A0;
  OUTLINED_FUNCTION_62_1();
  *(_QWORD *)(inited + 80) = v7;
  *(_QWORD *)(inited + 88) = 0xEE00656761737365;
  v8 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v8, v9, v10, v11, v12, v13, v14, v15, v16);
  *(_QWORD *)(v17 + 32) = 0x736972616D6D7573;
  *(_QWORD *)(v17 + 40) = 0xE900000000000065;
  *(_QWORD *)(inited + 96) = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  result = OUTLINED_FUNCTION_19_3();
  *(_QWORD *)a1 = 0xD000000000000010;
  *(_QWORD *)(a1 + 8) = 0x8000000247443EE0;
  *(_BYTE *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 17) = 16843009;
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

double sub_24743D63C@<D0>(uint64_t a1@<X8>)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247442480;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x8000000247443F60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v3 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v3 + 16) = xmmword_247443000;
  *(_QWORD *)(v3 + 32) = 0x726577736E61;
  *(_QWORD *)(v3 + 40) = 0xE600000000000000;
  *(_QWORD *)(v3 + 48) = 0x7075676E6168;
  *(_QWORD *)(v3 + 56) = 0xE600000000000000;
  *(_QWORD *)(v3 + 64) = 0x74736575716572;
  *(_QWORD *)(v3 + 72) = 0xE700000000000000;
  OUTLINED_FUNCTION_57_0();
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = 0xEC00000079746974;
  *(_OWORD *)(OUTLINED_FUNCTION_26() + 16) = xmmword_247443020;
  OUTLINED_FUNCTION_72_1();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  *(_QWORD *)(inited + 72) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  v9 = OUTLINED_FUNCTION_19_3();
  strcpy((char *)a1, "AnnounceCalls");
  *(_WORD *)(a1 + 14) = -4864;
  *(_QWORD *)&result = 257;
  *(_DWORD *)(a1 + 16) = 257;
  *(_BYTE *)(a1 + 20) = 1;
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 32) = v9;
  return result;
}

void sub_24743D7AC(_QWORD *a1@<X8>)
{
  uint64_t v1;
  __n128 *inited;
  __n128 *v4;
  __n128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  _QWORD *v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = (__n128 *)swift_initStackObject();
  v4 = OUTLINED_FUNCTION_60_1(inited, (__n128)xmmword_247442480);
  v4[2].n128_u64[0] = v1 | 3;
  v4[2].n128_u64[1] = 0x8000000247443F40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v5 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v14[4] = 0x657A6F6F6E73;
  v14[5] = 0xE600000000000000;
  v14[6] = 0x657461647075;
  v14[7] = 0xE600000000000000;
  OUTLINED_FUNCTION_20_3();
  inited[3].n128_u64[0] = v16;
  inited[3].n128_u64[1] = v15 & 0xFFFFFFFFFFFFLL | 0x525F000000000000;
  inited[4].n128_u64[0] = 0xEF7265646E696D65;
  v17 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v26[4] = 0x657A6F6F6E73;
  v26[5] = 0xE600000000000000;
  v26[6] = 0x657461647075;
  v26[7] = 0xE600000000000000;
  inited[4].n128_u64[1] = (unint64_t)v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  OUTLINED_FUNCTION_19_3();
  *a1 = v1;
  a1[1] = 0x8000000247443F80;
  OUTLINED_FUNCTION_82_1(2.3694e-38);
  a1[3] = MEMORY[0x24BEE4AF8];
  a1[4] = v27;
}

void sub_24743D8F0(uint64_t *a1@<X8>)
{
  unint64_t v1;
  __n128 *inited;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  _QWORD *v15;
  unint64_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  _QWORD *v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_60_1(inited, (__n128)xmmword_247442480);
  OUTLINED_FUNCTION_41_1();
  *(_QWORD *)(v4 + 32) = v1;
  *(_QWORD *)(v4 + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v6 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  v15[4] = 2036427888;
  v15[5] = 0xE400000000000000;
  v15[6] = 1819042147;
  v15[7] = 0xE400000000000000;
  inited[3].n128_u64[0] = (unint64_t)v15;
  inited[3].n128_u64[1] = v1;
  OUTLINED_FUNCTION_41_1();
  inited[4].n128_u64[0] = v16;
  v17 = (__n128 *)OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25_2(v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v26[4] = 1819042147;
  v26[5] = 0xE400000000000000;
  v26[6] = 0x6B6361626C6C6163;
  v26[7] = 0xE800000000000000;
  inited[4].n128_u64[1] = (unint64_t)v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  OUTLINED_FUNCTION_19_3();
  *a1 = v1 | 1;
  a1[1] = 0x8000000247443FA0;
  OUTLINED_FUNCTION_82_1(2.3694e-38);
  a1[3] = MEMORY[0x24BEE4AF8];
  a1[4] = v27;
}

void sub_24743DA28(_QWORD *a1@<X8>)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247443020;
  OUTLINED_FUNCTION_41_1();
  *(_QWORD *)(v3 + 32) = 0xD000000000000013;
  *(_QWORD *)(v3 + 40) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v5 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v5 + 16) = xmmword_247443030;
  *(_QWORD *)(v5 + 32) = 2036427888;
  *(_QWORD *)(v5 + 40) = 0xE400000000000000;
  *(_QWORD *)(v5 + 48) = 1684956531;
  *(_QWORD *)(v5 + 56) = 0xE400000000000000;
  *(_QWORD *)(v5 + 64) = 1886352499;
  *(_QWORD *)(v5 + 72) = 0xE400000000000000;
  OUTLINED_FUNCTION_72_1();
  *(_QWORD *)(v6 + 80) = v7;
  *(_QWORD *)(v6 + 88) = v8;
  *(_QWORD *)(inited + 48) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  OUTLINED_FUNCTION_19_3();
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x8000000247443FC0;
  OUTLINED_FUNCTION_82_1(2.3694e-38);
  a1[3] = MEMORY[0x24BEE4AF8];
  a1[4] = v9;
}

void sub_24743DB38(uint64_t a1@<X8>)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4000);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247443020;
  OUTLINED_FUNCTION_20_3();
  *(_QWORD *)(v4 + 32) = v3 & 0xFFFFFFFFFFFFLL | 0x575F000000000000;
  *(_QWORD *)(v4 + 40) = 0xEE0074756F6B726FLL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447380);
  v5 = OUTLINED_FUNCTION_26();
  *(_OWORD *)(v5 + 16) = xmmword_247443000;
  *(_QWORD *)(v5 + 32) = 0x657461657263;
  *(_QWORD *)(v5 + 40) = 0xE600000000000000;
  *(_QWORD *)(v5 + 48) = 1886352499;
  *(_QWORD *)(v5 + 56) = 0xE400000000000000;
  *(_QWORD *)(v5 + 64) = 0x6573756170;
  *(_QWORD *)(v5 + 72) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_41_1();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 17) = 16843009;
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 32) = v8;
}

uint64_t sub_24743DC4C(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_247441D10();
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
    if (v12 || (sub_247441D10() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24743DD10()
{
  uint64_t v0;

  sub_24743E384(v0 + OBJC_IVAR____TtC21SiriTurnTakingManager15AnnounceMatcher_announceTaskCache, &qword_254446B58);
  return swift_deallocClassInstance();
}

uint64_t sub_24743DD48()
{
  return type metadata accessor for AnnounceMatcher();
}

uint64_t type metadata accessor for AnnounceMatcher()
{
  uint64_t result;

  result = qword_254446B60;
  if (!qword_254446B60)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24743DD88()
{
  unint64_t v0;

  sub_24743DDF4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_24743DDF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544472E0)
  {
    sub_24744162C();
    v0 = sub_247441B84();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544472E0);
  }
}

uint64_t sub_24743DE48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_24743DE50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_24743DE58(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_24743DE60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_24743DE68(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_24743DE70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

void sub_24743DE78(uint64_t a1)
{
  sub_24743AB34(a1);
}

uint64_t sub_24743DE98(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24743DED0 + 4 * byte_247443040[a1]))(0xD000000000000013, 0x80000002474433D0);
}

uint64_t sub_24743DED0()
{
  return 0x656C62616E65;
}

uint64_t sub_24743DEE4()
{
  return 0x656C6261736964;
}

uint64_t sub_24743DEFC()
{
  return 0x6B6361626C6C6163;
}

uint64_t sub_24743DF14()
{
  return 1819042147;
}

uint64_t sub_24743DF24()
{
  return 0x726577736E61;
}

uint64_t sub_24743DF38()
{
  return 0x7075676E6168;
}

uint64_t sub_24743DF4C()
{
  return 1684956531;
}

uint64_t sub_24743DF5C()
{
  return 0x796C706572;
}

uint64_t sub_24743DF70()
{
  return 2036427888;
}

uint64_t sub_24743DF80()
{
  return 0x74736575716572;
}

uint64_t sub_24743DF98()
{
  return 0x657A6F6F6E73;
}

uint64_t sub_24743DFAC()
{
  return 0x736972616D6D7573;
}

uint64_t sub_24743DFC8()
{
  return 0x657461647075;
}

uint64_t sub_24743E030()
{
  return 0x6573756170;
}

uint64_t sub_24743E044(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24743E07C + 4 * byte_247443054[a1]))(0xD000000000000010, 0x8000000247443F60);
}

uint64_t sub_24743E07C()
{
  return 0x4D5F6E6F6D6D6F63;
}

uint64_t sub_24743E0A0()
{
  return 0x455F6E6F6D6D6F63;
}

uint64_t sub_24743E0C0(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_24743E144()
{
  return 0x535F6E6F6D6D6F63;
}

uint64_t sub_24743E168()
{
  return 0x6E456F4E5F6F7375;
}

uint64_t sub_24743E188()
{
  return 0x575F6E6F6D6D6F63;
}

uint64_t sub_24743E1AC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24743E1D8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24743E1E0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_24743E1E8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t sub_24743E1F0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t sub_24743E1F8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t sub_24743E200()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24743E208()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_24743E210(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247441D64();
  sub_247441A40();
  v4 = sub_247441D7C();
  return sub_24743E274(a1, a2, v4);
}

unint64_t sub_24743E274(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_247441D10() & 1) == 0)
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
      while (!v14 && (sub_247441D10() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_24743E354(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_24743E384(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_110();
}

uint64_t sub_24743E3BC(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  os_log_type_t type;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[6];

  v45[3] = &unk_2518A25A0;
  v45[4] = &off_2518A2A90;
  v2 = swift_allocObject();
  v45[0] = v2;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(a1 + 32);
  sub_24743F188(a1);
  if (qword_254446B80 != -1)
    swift_once();
  v4 = sub_2474418FC();
  __swift_project_value_buffer(v4, (uint64_t)qword_254447420);
  sub_24742D3D8((uint64_t)v45, (uint64_t)v44);
  sub_24742D3D8((uint64_t)v45, (uint64_t)v42);
  sub_24742D3D8((uint64_t)v45, (uint64_t)v40);
  swift_retain_n();
  v5 = sub_2474418F0();
  v6 = sub_247441B18();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    v39 = v38;
    *(_DWORD *)v7 = 136316162;
    type = v6;
    v8 = sub_24744189C();
    sub_247438888(v8, v9, &v39);
    sub_247441B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v10 = sub_247441890();
    sub_247438888(v10, v11, &v39);
    sub_247441B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2080;
    v12 = __swift_project_boxed_opaque_existential_1(v44, v44[3]);
    v13 = *v12;
    v14 = v12[1];
    swift_bridgeObjectRetain();
    sub_247438888(v13, v14, &v39);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    *(_WORD *)(v7 + 32) = 2080;
    __swift_project_boxed_opaque_existential_1(v42, v43);
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x24957A7AC](v15, MEMORY[0x24BEE0D00]);
    v18 = v17;
    swift_bridgeObjectRelease();
    sub_247438888(v16, v18, &v39);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    *(_WORD *)(v7 + 42) = 2080;
    __swift_project_boxed_opaque_existential_1(v40, v41);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
    v19 = sub_247441980();
    v21 = v20;
    swift_bridgeObjectRelease();
    sub_247438888(v19, v21, &v39);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    _os_log_impl(&dword_247422000, v5, type, "Validating task: %s::%s\nwith AnnounceType: %s\nwith allowed verb set: %s\nand allowed entityToVerb map: %s", (uint8_t *)v7, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v38, -1, -1);
    MEMORY[0x24957AE54](v7, -1, -1);
  }
  else
  {
    swift_release_n();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  }

  v22 = *(_QWORD **)(v2 + 40);
  swift_bridgeObjectRetain();
  v23 = sub_247441890();
  v25 = sub_24743DC4C(v23, v24, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
  {
    v26 = 1;
    goto LABEL_34;
  }
  if (*(_BYTE *)(v2 + 35))
    v26 = 2;
  else
    v26 = 0;
  v27 = *(_QWORD *)(v2 + 48);
  swift_bridgeObjectRetain();
  v28 = sub_24744189C();
  v30 = (_QWORD *)sub_24743AAEC(v28, v29, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30)
  {
    sub_247441758();
    sub_24743F1CC((uint64_t)v44, (uint64_t)v42, &qword_254447388);
    if (v43)
    {
      sub_2474417A0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v31 = v40[0];
        goto LABEL_17;
      }
    }
    else
    {
      sub_24743E384((uint64_t)v42, &qword_254447388);
    }
    v31 = 0;
LABEL_17:
    sub_24743F1CC((uint64_t)v44, (uint64_t)v42, &qword_254447388);
    if (v31)
    {
      swift_release();
      sub_24743E384((uint64_t)v42, &qword_254447388);
      goto LABEL_19;
    }
    sub_24743F238((uint64_t)v42, (uint64_t)v40, &qword_254447388);
    if (v41)
    {
      sub_2474417B8();
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_release();
LABEL_19:
        sub_247441758();
        if (v41)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4008);
          if ((swift_dynamicCast() & 1) != 0)
          {
            swift_retain();
            sub_24744183C();
            swift_release();
            if (!v40[0])
            {
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_29;
            }
            v32 = sub_247441740();
            swift_release();
            swift_release();
            if (v32)
            {
              swift_bridgeObjectRelease();
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_24743E384((uint64_t)v40, &qword_254447388);
        }
        swift_bridgeObjectRelease();
LABEL_29:
        sub_24743E384((uint64_t)v44, &qword_254447388);
        v26 = 2;
        goto LABEL_34;
      }
    }
    else
    {
      sub_24743E384((uint64_t)v40, &qword_254447388);
    }
LABEL_31:
    v33 = sub_247441890();
    v35 = sub_24743DC4C(v33, v34, v30);
    swift_bridgeObjectRelease();
    sub_24743E384((uint64_t)v44, &qword_254447388);
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
      v26 = 1;
    else
      v26 = v26;
  }
LABEL_34:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v26;
}

uint64_t sub_24743EA44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  NSObject *log;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  _QWORD v48[5];
  uint64_t v49[6];

  v49[3] = a4;
  v49[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  if (qword_254446B80 != -1)
    swift_once();
  v9 = sub_2474418FC();
  __swift_project_value_buffer(v9, (uint64_t)qword_254447420);
  sub_24742D3D8((uint64_t)v49, (uint64_t)v48);
  sub_24742D3D8((uint64_t)v49, (uint64_t)v46);
  sub_24742D3D8((uint64_t)v49, (uint64_t)v44);
  swift_retain_n();
  v10 = sub_2474418F0();
  v11 = sub_247441B18();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v43 = v42;
    *(_DWORD *)v12 = 136316162;
    v13 = sub_24744189C();
    sub_247438888(v13, v14, &v43);
    sub_247441B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v15 = sub_247441890();
    sub_247438888(v15, v16, &v43);
    sub_247441B90();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2080;
    __swift_project_boxed_opaque_existential_1(v48, v48[3]);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
    sub_247438888(v17, v18, &v43);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    *(_WORD *)(v12 + 32) = 2080;
    __swift_project_boxed_opaque_existential_1(v46, v47);
    log = v10;
    v19 = *(void (**)(uint64_t, uint64_t))(a5 + 56);
    v19(a4, a5);
    v20 = MEMORY[0x24957A7AC]();
    v22 = v21;
    swift_bridgeObjectRelease();
    sub_247438888(v20, v22, &v43);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    *(_WORD *)(v12 + 42) = 2080;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    (*(void (**)(uint64_t, uint64_t))(a5 + 64))(a4, a5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447320);
    v23 = sub_247441980();
    v25 = v24;
    swift_bridgeObjectRelease();
    sub_247438888(v23, v25, &v43);
    sub_247441B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    _os_log_impl(&dword_247422000, log, v11, "Validating task: %s::%s\nwith AnnounceType: %s\nwith allowed verb set: %s\nand allowed entityToVerb map: %s", (uint8_t *)v12, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x24957AE54](v42, -1, -1);
    MEMORY[0x24957AE54](v12, -1, -1);

  }
  else
  {
    swift_release_n();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);

    v19 = *(void (**)(uint64_t, uint64_t))(a5 + 56);
  }
  v26 = (_QWORD *)((uint64_t (*)(uint64_t, uint64_t))v19)(a4, a5);
  v27 = sub_247441890();
  v29 = sub_24743DC4C(v27, v28, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
    v30 = 1;
    goto LABEL_34;
  }
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a5 + 48))(a4, a5) & 1) != 0)
    v30 = 2;
  else
    v30 = 0;
  v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 64))(a4, a5);
  v32 = sub_24744189C();
  v34 = (_QWORD *)sub_24743AAEC(v32, v33, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v34)
  {
    sub_247441758();
    sub_24743F1CC((uint64_t)v48, (uint64_t)v46, &qword_254447388);
    if (v47)
    {
      sub_2474417A0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v35 = v44[0];
        goto LABEL_17;
      }
    }
    else
    {
      sub_24743E384((uint64_t)v46, &qword_254447388);
    }
    v35 = 0;
LABEL_17:
    sub_24743F1CC((uint64_t)v48, (uint64_t)v46, &qword_254447388);
    if (v35)
    {
      swift_release();
      sub_24743E384((uint64_t)v46, &qword_254447388);
      goto LABEL_19;
    }
    sub_24743F238((uint64_t)v46, (uint64_t)v44, &qword_254447388);
    if (v45)
    {
      sub_2474417B8();
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_release();
LABEL_19:
        sub_247441758();
        if (v45)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2576A4008);
          if ((swift_dynamicCast() & 1) != 0)
          {
            swift_retain();
            sub_24744183C();
            swift_release();
            if (!v44[0])
            {
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_29;
            }
            v36 = sub_247441740();
            swift_release();
            swift_release();
            if (v36)
            {
              swift_bridgeObjectRelease();
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_24743E384((uint64_t)v44, &qword_254447388);
        }
        swift_bridgeObjectRelease();
LABEL_29:
        sub_24743E384((uint64_t)v48, &qword_254447388);
        v30 = 2;
        goto LABEL_34;
      }
    }
    else
    {
      sub_24743E384((uint64_t)v44, &qword_254447388);
    }
LABEL_31:
    v37 = sub_247441890();
    v39 = sub_24743DC4C(v37, v38, v34);
    swift_bridgeObjectRelease();
    sub_24743E384((uint64_t)v48, &qword_254447388);
    swift_bridgeObjectRelease();
    if ((v39 & 1) != 0)
      v30 = 1;
    else
      v30 = v30;
  }
LABEL_34:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  return v30;
}

uint64_t sub_24743F10C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24743F188(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void sub_24743F1CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_49_2(a1, a2, a3);
  OUTLINED_FUNCTION_64_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_110();
}

unint64_t sub_24743F1F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A4010;
  if (!qword_2576A4010)
  {
    v1 = sub_24744162C();
    result = MEMORY[0x24957ADDC](MEMORY[0x24BE9C138], v1);
    atomic_store(result, (unint64_t *)&qword_2576A4010);
  }
  return result;
}

void sub_24743F238(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_49_2(a1, a2, a3);
  OUTLINED_FUNCTION_64_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_110();
}

uint64_t sub_24743F264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254446B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
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

void type metadata accessor for AnnounceTypeGlobalOverride()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideMessages()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverridePhoneCall()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideGenericNotification()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideReminder()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideVoicemail()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideIntercom()
{
  OUTLINED_FUNCTION_16_1();
}

void type metadata accessor for AnnounceTypeOverrideWorkoutReminder()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t sub_24743F338()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_24743F368(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_43_0();
}

void sub_24743F3BC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_43_0();
}

void sub_24743F430(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_110();
}

uint64_t sub_24743F47C(uint64_t a1, int a2)
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

uint64_t sub_24743F4BC(uint64_t result, int a2, int a3)
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

void type metadata accessor for AnnounceTypeOverrideMitigationForIntercomRequest()
{
  OUTLINED_FUNCTION_16_1();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_11_3()
{
  _BYTE *v0;
  _BYTE *v1;

  v1[16] = v0[16];
  v1[17] = v0[17];
  v1[18] = v0[18];
  v1[19] = v0[19];
  v1[20] = v0[20];
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_247438888(a1, a2, (uint64_t *)(v2 - 120));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_destroy_boxed_opaque_existential_1(v3 - 152);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return sub_24744198C();
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_23_3(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 208);
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v1;
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_2474418F0();
}

__n128 OUTLINED_FUNCTION_25_2(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  __n128 result;

  result = a9;
  a1[1] = a9;
  return result;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 216) + 8))(*(_QWORD *)(v0 - 232), *(_QWORD *)(v0 - 224));
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return 0x657461676974696DLL;
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_31_2()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_38_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void OUTLINED_FUNCTION_42_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_43_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_49_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

_QWORD *OUTLINED_FUNCTION_51_1(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_53_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24742D3D8(v2, a2);
}

uint64_t OUTLINED_FUNCTION_54_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_55_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return swift_bridgeObjectRelease();
}

__n128 *OUTLINED_FUNCTION_60_1(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_63_1()
{
  return sub_247441A04();
}

uint64_t OUTLINED_FUNCTION_64_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_73_1()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 352);
}

_WORD *OUTLINED_FUNCTION_74_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_76_1()
{
  uint64_t v0;

  return sub_24742D41C((__int128 *)(v0 - 192), v0 - 152);
}

unint64_t OUTLINED_FUNCTION_77_1()
{
  return 0xED00006574616769;
}

double OUTLINED_FUNCTION_78_1()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(v0 - 208);
  *(_QWORD *)(v1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

void OUTLINED_FUNCTION_81_1(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_82_1(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 16) = a1;
  *(_BYTE *)(v1 + 20) = 0;
}

uint64_t OUTLINED_FUNCTION_86_1()
{
  return swift_bridgeObjectRelease();
}

_WORD *OUTLINED_FUNCTION_87_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_88_1()
{
  return sub_24744162C();
}

uint64_t OUTLINED_FUNCTION_90_0()
{
  return sub_2474418F0();
}

uint64_t OUTLINED_FUNCTION_92_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_24743F8FC()
{
  uint64_t result;

  result = AFIsInternalInstall();
  if ((_DWORD)result)
  {
    if (qword_254447318 != -1)
      swift_once();
    sub_2474418CC();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_2474418C0();
    sub_2474418B4();
    return swift_release();
  }
  return result;
}

void sub_24743FA04()
{
  strcpy((char *)&qword_2544473E0, "SiriAssistant");
  *(_WORD *)&algn_2544473E8[6] = -4864;
}

void sub_24743FA34()
{
  qword_2544473D0 = 1701736302;
  *(_QWORD *)algn_2544473D8 = 0xE400000000000000;
}

void sub_24743FA50()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_254446B80 != -1)
    swift_once();
  v0 = sub_2474418FC();
  __swift_project_value_buffer(v0, (uint64_t)qword_254447420);
  oslog = sub_2474418F0();
  v1 = sub_247441B18();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v2 = 67109120;
    sub_247441B90();
    _os_log_impl(&dword_247422000, oslog, v1, "AutoBugCapture#generateSnapshot ABC result: %{BOOL}d", v2, 8u);
    MEMORY[0x24957AE54](v2, -1, -1);
  }

}

void sub_24743FB70()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_26_3();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_43_0();
}

void sub_24743FBC8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24743FC1C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24743FCB4 + 4 * byte_2474432B6[a2]))(0x72506E6F74747562);
}

void sub_24743FCB4(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x72506E6F74747562 || v1 != 0xEB00000000737365)
    OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_43_0();
}

void sub_24743FD5C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_26_3();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_43_0();
}

uint64_t sub_24743FDB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24743FDCC(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C148], a2);
}

uint64_t sub_24743FDC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24743FDCC(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828], a2);
}

uint64_t sub_24743FDCC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
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

void sub_24743FE44()
{
  qword_2576A4F20 = 0x747465536C6F6F62;
  *(_QWORD *)algn_2576A4F28 = 0xEF656D614E676E69;
}

void sub_24743FE74()
{
  qword_2576A4F30 = 0x69726953796568;
  *(_QWORD *)algn_2576A4F38 = 0xE700000000000000;
}

uint64_t sub_24743FE98()
{
  return 3;
}

uint64_t sub_24743FEA0()
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  char v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char v54;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char v59;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void (*v69)(char *, unint64_t, _QWORD *);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  void (*v77)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t));
  void (*v78)(uint64_t *, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v83;
  void (*v84)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t));
  uint64_t v85;
  void (*v86)(uint64_t *, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  void (*v97)(uint64_t);
  char v98;
  void (*v99)(uint64_t, uint64_t);
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
  uint64_t v111;
  char v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t);
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  void (*v131)(uint64_t, uint64_t);
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  void (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t));
  void (*v138)(uint64_t *, uint64_t, uint64_t);
  uint64_t v139;
  NSObject *v140;
  os_log_type_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  void (*v174)(uint64_t *, uint64_t, uint64_t);
  uint64_t v175;
  uint64_t v176;
  uint64_t v177[3];
  __int128 v178;
  uint64_t v179;
  __int128 v180;

  v0 = sub_2474418E4();
  v170 = *(_QWORD *)(v0 - 8);
  v171 = v0;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_25_3(v2);
  v174 = (void (*)(uint64_t *, uint64_t, uint64_t))sub_2474416F8();
  v172 = *((_QWORD *)v174 - 1);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v4);
  v173 = (char *)&v148 - v5;
  v155 = sub_247441644();
  v154 = *(_QWORD *)(v155 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_25_3(v7);
  v152 = sub_2474416D4();
  v151 = *(_QWORD *)(v152 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_25_3(v9);
  v10 = sub_247441794();
  v166 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_23_0();
  v159 = v12;
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447300);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v15);
  v165 = (uint64_t *)((char *)&v148 - v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544472F8);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_31_2();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v148 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (uint64_t *)((char *)&v148 - v28);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v148 - v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544472F0);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v148 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_2474416BC();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v148 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)&v148 - v41;
  MEMORY[0x24BDAC7A8](v40);
  v175 = (uint64_t)&v148 - v43;
  if ((sub_24744165C() & 1) == 0)
  {
    if (qword_254446B80 != -1)
      swift_once();
    v47 = sub_2474418FC();
    __swift_project_value_buffer(v47, (uint64_t)qword_254447420);
    v48 = sub_2474418F0();
    v49 = sub_247441B18();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_247422000, v48, v49, "this parse couldn't be interpreted as a universal command", v50, 2u);
      OUTLINED_FUNCTION_1();
    }

    return 2;
  }
  v44 = sub_247441650();
  sub_24743FDCC(v44, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828], (uint64_t)v34);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_26_0((uint64_t)v34, 1, v35);
  if (v74)
  {
    v45 = &qword_2544472F0;
    v46 = v34;
LABEL_5:
    sub_24742EA7C((uint64_t)v46, v45);
    return 2;
  }
  v148 = v10;
  v51 = v175;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(v175, v34, v35);
  v52 = sub_247441698();
  v53 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  v149 = v35;
  v53(v42, v51, v35);
  if ((v52 & 1) != 0)
    v54 = 1;
  else
    v54 = sub_2474416B0();
  v56 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v57 = (uint64_t)v42;
  v58 = v149;
  OUTLINED_FUNCTION_2_5(v57);
  v53(v39, v175, v58);
  if ((v54 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_5((uint64_t)v39);
LABEL_18:
    OUTLINED_FUNCTION_1_6();
    return 1;
  }
  v59 = sub_24744168C();
  OUTLINED_FUNCTION_2_5((uint64_t)v39);
  if ((v59 & 1) != 0)
    goto LABEL_18;
  v61 = sub_24744171C();
  if (v61 >> 62)
  {
    swift_bridgeObjectRetain();
    v147 = sub_247441C5C();
    OUTLINED_FUNCTION_7_1();
    if (!v147)
      goto LABEL_26;
  }
  else if (!*(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_26;
  }
  if ((v61 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24957A8FC](0, v61);
  }
  else
  {
    if (!*(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_116;
    }
    swift_retain();
  }
LABEL_26:
  OUTLINED_FUNCTION_7_1();
  sub_247441758();
  swift_release();
  if (!v179)
  {
    OUTLINED_FUNCTION_1_6();
    v45 = &qword_254447388;
    v46 = (char *)&v178;
    goto LABEL_5;
  }
  sub_24743E354(&v178, &v180);
  sub_247439914((uint64_t)&v180, (uint64_t)&v178);
  sub_247441830();
  if (OUTLINED_FUNCTION_13_3())
    goto LABEL_34;
  sub_247441848();
  if (OUTLINED_FUNCTION_6_4())
  {
    swift_release();
    OUTLINED_FUNCTION_31_3();
    if (OUTLINED_FUNCTION_16_3())
    {
      swift_retain();
      OUTLINED_FUNCTION_21_4();
      OUTLINED_FUNCTION_19_4();
      if (v177[0])
      {
        sub_247441788();
        OUTLINED_FUNCTION_37_2();
        v62 = v148;
      }
      else
      {
        OUTLINED_FUNCTION_24_4();
        v62 = *(_QWORD *)(v87 - 256);
        __swift_storeEnumTagSinglePayload(v88, v89, v90, v62);
      }
      v91 = v167;
      v92 = v165;
      v93 = *MEMORY[0x24BEA1108];
      v174 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v166 + 104);
      v174(v29, v93, v62);
      __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v62);
      v94 = (uint64_t)v92 + *(int *)(v91 + 48);
      sub_24744122C((uint64_t)v31, (uint64_t)v92);
      OUTLINED_FUNCTION_32_0((uint64_t)v29);
      OUTLINED_FUNCTION_26_0((uint64_t)v92, 1, v62);
      if (v74)
      {
        OUTLINED_FUNCTION_4_4((uint64_t)v29);
        v92 = v165;
        sub_24742EA7C((uint64_t)v31, &qword_2544472F8);
        OUTLINED_FUNCTION_26_0(v94, 1, v62);
        if (v74)
          goto LABEL_80;
      }
      else
      {
        sub_24744122C((uint64_t)v92, (uint64_t)v26);
        OUTLINED_FUNCTION_26_0(v94, 1, v62);
        if (!v95)
        {
          v96 = OUTLINED_FUNCTION_14_4();
          v97(v96);
          sub_247441274();
          v98 = sub_2474419A4();
          v99 = (void (*)(uint64_t, uint64_t))v92[1];
          v99(v91, v62);
          v92 = &qword_2544472F8;
          OUTLINED_FUNCTION_4_4((uint64_t)v29);
          OUTLINED_FUNCTION_4_4((uint64_t)v31);
          v99((uint64_t)v26, v62);
          v58 = v149;
          OUTLINED_FUNCTION_4_4((uint64_t)v165);
          OUTLINED_FUNCTION_34_1();
          if ((v98 & 1) != 0)
            goto LABEL_81;
          goto LABEL_72;
        }
        OUTLINED_FUNCTION_23_4((uint64_t)v29);
        OUTLINED_FUNCTION_23_4((uint64_t)v31);
        (*(void (**)(char *, uint64_t))(v166 + 8))(v26, v62);
      }
      sub_24742EA7C((uint64_t)v92, &qword_254447300);
      OUTLINED_FUNCTION_34_1();
LABEL_72:
      OUTLINED_FUNCTION_21_4();
      if (v177[0])
      {
        sub_247441788();
        OUTLINED_FUNCTION_37_2();
        v100 = v148;
      }
      else
      {
        OUTLINED_FUNCTION_24_4();
        v100 = *(_QWORD *)(v101 - 256);
        __swift_storeEnumTagSinglePayload(v102, v103, v104, v100);
      }
      v105 = v161;
      v106 = v160;
      v107 = (uint64_t)v164;
      v174(v164, *MEMORY[0x24BEA1100], v100);
      __swift_storeEnumTagSinglePayload(v107, 0, 1, v100);
      v108 = v105 + *(int *)(v167 + 48);
      sub_24744122C((uint64_t)v92, v105);
      OUTLINED_FUNCTION_32_0(v107);
      OUTLINED_FUNCTION_26_0(v105, 1, v100);
      if (!v74)
      {
        sub_24744122C(v105, v106);
        OUTLINED_FUNCTION_26_0(v108, 1, v100);
        v109 = v91;
        if (!v112)
        {
          v116 = OUTLINED_FUNCTION_14_4();
          v117(v116);
          sub_247441274();
          LODWORD(v173) = sub_2474419A4();
          v118 = v105;
          v119 = (void (*)(uint64_t, uint64_t))v92[1];
          v119(v91, v100);
          OUTLINED_FUNCTION_4_4((uint64_t)v164);
          OUTLINED_FUNCTION_4_4(v163);
          v119(v106, v100);
          OUTLINED_FUNCTION_4_4(v118);
          v115 = v157;
          if ((v173 & 1) == 0)
          {
LABEL_88:
            OUTLINED_FUNCTION_21_4();
            if (v177[0])
            {
              sub_247441788();
              OUTLINED_FUNCTION_37_2();
            }
            else
            {
              OUTLINED_FUNCTION_24_4();
              __swift_storeEnumTagSinglePayload(v121, v122, v123, *(_QWORD *)(v120 - 256));
            }
            v124 = v156;
            v125 = v167;
            v126 = (uint64_t)v158;
            v127 = v148;
            v174(v158, *MEMORY[0x24BEA1110], v148);
            __swift_storeEnumTagSinglePayload(v126, 0, 1, v127);
            v128 = v124 + *(int *)(v125 + 48);
            sub_24744122C(v109, v124);
            OUTLINED_FUNCTION_32_0(v126);
            OUTLINED_FUNCTION_26_0(v124, 1, v127);
            if (v74)
            {
              OUTLINED_FUNCTION_19_4();
              OUTLINED_FUNCTION_9_4(v126);
              OUTLINED_FUNCTION_9_4(v109);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
              OUTLINED_FUNCTION_2_5(v175);
              OUTLINED_FUNCTION_26_0(v128, 1, v127);
              if (v74)
              {
                sub_24742EA7C(v124, &qword_2544472F8);
                goto LABEL_36;
              }
            }
            else
            {
              sub_24744122C(v124, v115);
              OUTLINED_FUNCTION_26_0(v128, 1, v127);
              if (!v129)
              {
                v132 = v166;
                v133 = v115;
                v134 = v159;
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v166 + 32))(v159, v128, v127);
                sub_247441274();
                v135 = sub_2474419A4();
                OUTLINED_FUNCTION_19_4();
                v136 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
                v136(v134, v127);
                OUTLINED_FUNCTION_9_4((uint64_t)v158);
                OUTLINED_FUNCTION_9_4(v162);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
                OUTLINED_FUNCTION_1_6();
                v136(v133, v127);
                OUTLINED_FUNCTION_9_4(v124);
                if ((v135 & 1) != 0)
                  goto LABEL_36;
                goto LABEL_104;
              }
              OUTLINED_FUNCTION_19_4();
              OUTLINED_FUNCTION_9_4(v126);
              OUTLINED_FUNCTION_9_4(v109);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
              OUTLINED_FUNCTION_1_6();
              v130 = OUTLINED_FUNCTION_35_2();
              v131(v130, v127);
            }
            sub_24742EA7C(v124, &qword_254447300);
LABEL_104:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v178);
            return 2;
          }
LABEL_81:
          OUTLINED_FUNCTION_19_4();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
          v110 = v175;
          v111 = v58;
          goto LABEL_82;
        }
        OUTLINED_FUNCTION_23_4((uint64_t)v164);
        OUTLINED_FUNCTION_23_4((uint64_t)v92);
        v113 = OUTLINED_FUNCTION_35_2();
        v114(v113, v100);
LABEL_86:
        sub_24742EA7C(v105, &qword_254447300);
        v115 = v157;
        goto LABEL_88;
      }
      OUTLINED_FUNCTION_4_4(v107);
      OUTLINED_FUNCTION_4_4((uint64_t)v92);
      OUTLINED_FUNCTION_26_0(v108, 1, v100);
      v109 = v91;
      if (!v74)
        goto LABEL_86;
      v92 = (uint64_t *)v105;
LABEL_80:
      sub_24742EA7C((uint64_t)v92, &qword_2544472F8);
      goto LABEL_81;
    }
LABEL_103:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    OUTLINED_FUNCTION_1_6();
    goto LABEL_104;
  }
  sub_247441764();
  if (OUTLINED_FUNCTION_13_3())
  {
LABEL_34:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    OUTLINED_FUNCTION_1_6();
    goto LABEL_35;
  }
  sub_2474417B8();
  if (!OUTLINED_FUNCTION_6_4())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
    OUTLINED_FUNCTION_1_6();
    sub_24744177C();
    if (!swift_dynamicCast())
      goto LABEL_104;
LABEL_35:
    swift_release();
    goto LABEL_36;
  }
  swift_release();
  OUTLINED_FUNCTION_31_3();
  if (!OUTLINED_FUNCTION_16_3())
    goto LABEL_103;
  swift_release();
  v63 = v150;
  sub_2474416A4();
  v64 = v153;
  sub_2474416C8();
  (*(void (**)(uint64_t, uint64_t))(v151 + 8))(v63, v152);
  v65 = sub_247441638();
  (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v64, v155);
  v66 = *(_QWORD *)(v65 + 16);
  if (!v66)
  {
    OUTLINED_FUNCTION_7_1();
    goto LABEL_103;
  }
  v67 = v65 + ((*(unsigned __int8 *)(v172 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80));
  v68 = *(_QWORD *)(v172 + 72);
  v69 = *(void (**)(char *, unint64_t, _QWORD *))(v172 + 16);
  v167 = v65;
  swift_bridgeObjectRetain();
  v29 = &qword_2576A4F20;
  while (1)
  {
    v69(v173, v67, v174);
    v70 = v169;
    sub_2474416EC();
    v71 = sub_2474418D8();
    v73 = v72;
    (*(void (**)(uint64_t, uint64_t))(v170 + 8))(v70, v171);
    if (qword_2576A3E58 != -1)
      swift_once();
    v74 = v71 == qword_2576A4F20 && v73 == *(_QWORD *)algn_2576A4F28;
    v75 = v168;
    if (v74)
    {
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_36_1();
    }
    else
    {
      v76 = OUTLINED_FUNCTION_29_1();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_36_1();
      if ((v76 & 1) == 0)
      {
        v77 = *(void (**)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t)))(v172 + 8);
        v78 = v174;
        v77(v75, v174);
        v77((uint64_t)v173, v78);
        goto LABEL_57;
      }
    }
    v79 = sub_2474416E0();
    v81 = v80;
    if (qword_2576A3E60 != -1)
      swift_once();
    if (v79 == qword_2576A4F30 && v81 == *(_QWORD *)algn_2576A4F38)
      break;
    v83 = OUTLINED_FUNCTION_29_1();
    OUTLINED_FUNCTION_7_1();
    v84 = *(void (**)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t)))(v172 + 8);
    v85 = v75;
    v86 = v174;
    v84(v85, v174);
    v84((uint64_t)v173, v86);
    if ((v83 & 1) != 0)
      goto LABEL_106;
LABEL_57:
    v67 += v68;
    if (!--v66)
    {
      OUTLINED_FUNCTION_22_1();
      goto LABEL_103;
    }
  }
  OUTLINED_FUNCTION_7_1();
  v137 = *(void (**)(uint64_t, void (*)(uint64_t *, uint64_t, uint64_t)))(v172 + 8);
  v138 = v174;
  v137(v75, v174);
  v137((uint64_t)v173, v138);
LABEL_106:
  OUTLINED_FUNCTION_22_1();
  if (qword_254446B80 != -1)
LABEL_116:
    swift_once();
  v139 = sub_2474418FC();
  __swift_project_value_buffer(v139, (uint64_t)qword_254447420);
  v140 = sub_2474418F0();
  v141 = sub_247441B18();
  if (os_log_type_enabled(v140, v141))
  {
    v142 = OUTLINED_FUNCTION_4();
    v177[0] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v142 = 136315394;
    v143 = *v29;
    v144 = v29[1];
    swift_bridgeObjectRetain();
    v176 = sub_247438888(v143, v144, v177);
    OUTLINED_FUNCTION_28_5();
    swift_bridgeObjectRelease();
    *(_WORD *)(v142 + 12) = 2080;
    if (qword_2576A3E60 != -1)
      swift_once();
    v145 = qword_2576A4F30;
    v146 = *(_QWORD *)algn_2576A4F38;
    swift_bridgeObjectRetain();
    v176 = sub_247438888(v145, v146, v177);
    OUTLINED_FUNCTION_28_5();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247422000, v140, v141, "found identifier with namespace as %s with value %s overriding with donotMitigate", (uint8_t *)v142, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v180);
  v110 = v175;
  v111 = v149;
LABEL_82:
  v56(v110, v111);
LABEL_36:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v178);
  return 1;
}

uint64_t sub_247440F64(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  _QWORD v13[4];

  v4 = sub_247441668();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(v8 + 16);
  if (!v9)
    return 2;
  v13[3] = v1;
  v10 = v8 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  result = swift_bridgeObjectRetain();
  v12 = 0;
  v13[1] = v9 - 1;
  while (v12 < *(_QWORD *)(v8 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, v10 + *(_QWORD *)(v5 + 72) * v12, v4);
    if (sub_24743FEA0() != 2)
    {
      swift_bridgeObjectRelease();
LABEL_9:
      OUTLINED_FUNCTION_27_3();
      OUTLINED_FUNCTION_27();
      return 1;
    }
    OUTLINED_FUNCTION_7_4();
    sub_247441D10();
    OUTLINED_FUNCTION_12_3();
    if ((v2 & 1) != 0)
      goto LABEL_9;
    OUTLINED_FUNCTION_7_4();
    sub_247441D10();
    OUTLINED_FUNCTION_12_3();
    result = OUTLINED_FUNCTION_27_3();
    if (v9 == ++v12)
    {
      OUTLINED_FUNCTION_27();
      return 2;
    }
  }
  __break(1u);
  return result;
}

id sub_247441130()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UniversalCommandMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_247441180()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UniversalCommandMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UniversalCommandMatcher()
{
  return objc_opt_self();
}

uint64_t sub_2474411D4(uint64_t a1)
{
  return sub_247440F64(a1);
}

unint64_t sub_2474411E8(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_247441208(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_24744122C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544472F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_247441274()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A4018;
  if (!qword_2576A4018)
  {
    v1 = sub_247441794();
    result = MEMORY[0x24957ADDC](MEMORY[0x24BEA1128], v1);
    atomic_store(result, (unint64_t *)&qword_2576A4018);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1)
{
  uint64_t *v1;

  return sub_24742EA7C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return 0x65764F746F6E6F64;
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1)
{
  uint64_t *v1;

  return sub_24742EA7C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return sub_247441D10();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 344);
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return sub_247441734();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_23_4(uint64_t a1)
{
  uint64_t *v1;

  return sub_24742EA7C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_25_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return sub_247441B90();
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  return sub_247441D10();
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  uint64_t v0;

  return sub_247439914(v0 - 128, v0 - 200);
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  uint64_t v1;

  return sub_24744122C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  uint64_t (*v0)(uint64_t, _QWORD, _QWORD);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, *(_QWORD *)(v2 - 232), *(_QWORD *)(v2 - 224));
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return swift_release();
}

uint64_t sub_247441474()
{
  return 1;
}

uint64_t sub_24744147C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 80))
    return 1;
  else
    return 2;
}

id sub_247441490()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LASOverrideMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_2474414E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LASOverrideMatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LASOverrideMatcher()
{
  return objc_opt_self();
}

uint64_t sub_247441530(uint64_t a1)
{
  return sub_24744147C(a1);
}

uint64_t sub_247441554()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_247441560()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_24744156C()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_247441578()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_247441584()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_247441590()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24744159C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2474415A8()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_2474415B4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2474415C0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2474415CC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2474415D8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2474415E4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2474415F0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2474415FC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_247441608()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_247441614()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247441620()
{
  return MEMORY[0x24BE9C140]();
}

uint64_t sub_24744162C()
{
  return MEMORY[0x24BE9C148]();
}

uint64_t sub_247441638()
{
  return MEMORY[0x24BE9C290]();
}

uint64_t sub_247441644()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_247441650()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_24744165C()
{
  return MEMORY[0x24BE9C420]();
}

uint64_t sub_247441668()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_247441674()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_247441680()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_24744168C()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_247441698()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_2474416A4()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_2474416B0()
{
  return MEMORY[0x24BE9C7B0]();
}

uint64_t sub_2474416BC()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2474416C8()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_2474416D4()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2474416E0()
{
  return MEMORY[0x24BE9D100]();
}

uint64_t sub_2474416EC()
{
  return MEMORY[0x24BE9D108]();
}

uint64_t sub_2474416F8()
{
  return MEMORY[0x24BE9D110]();
}

uint64_t sub_247441704()
{
  return MEMORY[0x24BE9DFE8]();
}

uint64_t sub_247441710()
{
  return MEMORY[0x24BE9DFF0]();
}

uint64_t sub_24744171C()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_247441728()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_247441734()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_247441740()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_24744174C()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_247441758()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_247441764()
{
  return MEMORY[0x24BEA08F0]();
}

uint64_t sub_247441770()
{
  return MEMORY[0x24BEA0D10]();
}

uint64_t sub_24744177C()
{
  return MEMORY[0x24BEA0D18]();
}

uint64_t sub_247441788()
{
  return MEMORY[0x24BEA10F8]();
}

uint64_t sub_247441794()
{
  return MEMORY[0x24BEA1118]();
}

uint64_t sub_2474417A0()
{
  return MEMORY[0x24BEA1370]();
}

uint64_t sub_2474417AC()
{
  return MEMORY[0x24BEA13B8]();
}

uint64_t sub_2474417B8()
{
  return MEMORY[0x24BEA18B0]();
}

uint64_t sub_2474417C4()
{
  return MEMORY[0x24BEA18E8]();
}

uint64_t sub_2474417D0()
{
  return MEMORY[0x24BEA1910]();
}

uint64_t sub_2474417DC()
{
  return MEMORY[0x24BEA1C88]();
}

uint64_t sub_2474417E8()
{
  return MEMORY[0x24BEA1F90]();
}

uint64_t sub_2474417F4()
{
  return MEMORY[0x24BEA1FA0]();
}

uint64_t sub_247441800()
{
  return MEMORY[0x24BEA1FA8]();
}

uint64_t sub_24744180C()
{
  return MEMORY[0x24BEA1FD8]();
}

uint64_t sub_247441818()
{
  return MEMORY[0x24BEA2018]();
}

uint64_t sub_247441824()
{
  return MEMORY[0x24BEA22A8]();
}

uint64_t sub_247441830()
{
  return MEMORY[0x24BEA22D0]();
}

uint64_t sub_24744183C()
{
  return MEMORY[0x24BEA2340]();
}

uint64_t sub_247441848()
{
  return MEMORY[0x24BEA2500]();
}

uint64_t sub_247441854()
{
  return MEMORY[0x24BEA2538]();
}

uint64_t sub_247441860()
{
  return MEMORY[0x24BEA2540]();
}

uint64_t sub_24744186C()
{
  return MEMORY[0x24BEA2730]();
}

uint64_t sub_247441878()
{
  return MEMORY[0x24BEA2CF8]();
}

uint64_t sub_247441884()
{
  return MEMORY[0x24BEA34F8]();
}

uint64_t sub_247441890()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_24744189C()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_2474418A8()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_2474418B4()
{
  return MEMORY[0x24BEA8DD8]();
}

uint64_t sub_2474418C0()
{
  return MEMORY[0x24BEA8DE0]();
}

uint64_t sub_2474418CC()
{
  return MEMORY[0x24BEA8DE8]();
}

uint64_t sub_2474418D8()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t sub_2474418E4()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_2474418F0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2474418FC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247441908()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_247441914()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_247441920()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_24744192C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_247441938()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_247441944()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_247441950()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24744195C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_247441968()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_247441974()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_247441980()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24744198C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_247441998()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2474419A4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2474419B0()
{
  return MEMORY[0x24BDCF898]();
}

uint64_t sub_2474419BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2474419C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2474419D4()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2474419E0()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2474419EC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2474419F8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_247441A04()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247441A10()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_247441A1C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_247441A28()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_247441A34()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_247441A40()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247441A4C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247441A58()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247441A64()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_247441A70()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_247441A7C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_247441A88()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_247441A94()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_247441AA0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_247441AAC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_247441AB8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_247441AC4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247441AD0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247441ADC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247441AE8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_247441AF4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_247441B00()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_247441B0C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_247441B18()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_247441B24()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247441B30()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_247441B3C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_247441B48()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_247441B54()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_247441B60()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_247441B6C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_247441B78()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_247441B84()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247441B90()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247441B9C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247441BA8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_247441BB4()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_247441BC0()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_247441BCC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247441BD8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_247441BE4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_247441BF0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_247441BFC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_247441C08()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247441C14()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247441C20()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247441C2C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247441C38()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247441C44()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_247441C50()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247441C5C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247441C68()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247441C74()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247441C80()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_247441C8C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_247441C98()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_247441CA4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_247441CB0()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_247441CBC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247441CC8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_247441CD4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_247441CE0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_247441CEC()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_247441CF8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_247441D04()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247441D10()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247441D1C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_247441D28()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247441D34()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247441D40()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247441D4C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247441D58()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247441D64()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247441D70()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247441D7C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247441D88()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247441D94()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247441DA0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247441DAC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

